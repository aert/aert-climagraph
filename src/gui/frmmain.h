#ifndef FRMMAIN_H
#define FRMMAIN_H

#include <QtGui/QMainWindow>

namespace Ui
{
    class FrmMain;
}

class FrmMain : public QMainWindow
{
    Q_OBJECT

public:
    FrmMain(QWidget *parent = 0);
    ~FrmMain();

private:
    Ui::FrmMain *ui;
};

#endif // FRMMAIN_H
