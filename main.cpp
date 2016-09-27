#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDir>
#include <QDebug>

#include <qdjango/db/QDjango.h>

#include "expectation.h"

#define QML_LIBRARY_URI "net.adapar.uc.paei.qml"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QString basePath = QDir::toNativeSeparators(QDir::currentPath());
    QString databasePath = basePath + QDir::separator() + "store" + QDir::separator() + "paei.esn.sqlite";
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(databasePath);

    if (db.open()) {
        QDjango::setDatabase(db);
        QDjango::setDebugEnabled(true);

        QDjango::registerModel<Expectation>();

        QDjango::createTables();

        qmlRegisterType<Expectation>(QML_LIBRARY_URI, 1, 0, "Expectation");

        QQmlApplicationEngine engine;
        engine.load(QUrl(QLatin1String("qrc:/main.qml")));

        return app.exec();
    } else {
        qDebug() << "error opening database";
        return 0;
    }
}
