#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlNetworkAccessManagerFactory>
#include "WindowFramelessHelper.h"
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<WindowFramelessHelper>("QtShark.Window", 1, 0, "FramelessHelper");

    //QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}


