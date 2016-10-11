#ifndef EXPECTATION_H
#define EXPECTATION_H

#include "abstract.h"

class Expectation : public Abstract
{
    Q_OBJECT

    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(int whites READ whites WRITE setWhites NOTIFY whitesChanged)
    Q_PROPERTY(int blacks READ blacks WRITE setBlacks NOTIFY blacksChanged)

public:
    explicit Expectation(QObject *parent = 0);

    inline QString description() const { return m_description; }
    void setDescription(const QString &description);

    inline int whites() { return m_whites; }
    inline void setWhites(int value) { if (m_whites != value) { m_whites = value; emit whitesChanged(); } }
    inline int blacks() { return m_blacks; }
    inline void setBlacks(int value) { if (m_blacks != value) { m_blacks = value; emit blacksChanged(); } }
    Q_INVOKABLE inline void whiteIncrement() { setWhites(whites() + 1); }
    Q_INVOKABLE inline void blackIncrement() { setBlacks(blacks() + 1); }

signals:
    void descriptionChanged();
    void whitesChanged();
    void blacksChanged();

public slots:

private:
    QString m_description;
    int m_whites;
    int m_blacks;
};

#endif // EXPECTATION_H
