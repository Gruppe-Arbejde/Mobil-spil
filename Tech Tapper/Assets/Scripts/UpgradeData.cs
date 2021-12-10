using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class UpgradeData : MonoBehaviour
{
    //Keyboard
    public double keyboard;
    public int clickUpgradeLevelKeyboard = 0;
    public double clickUpgradeBaseCostKeyboard = 10;
    public double clickUpgradeCostMultKeyboard = 1.5;

    //Mouse
    public double mouse;
    public int clickUpgradeLevelMouse = 0;
    public double clickUpgradeBaseCostMouse = 10;
    public double clickUpgradeCostMultMouse = 1.5;

    //Monitor
    public double monitor;
    public int clickUpgradeLevelMonitor = 0;
    public double clickUpgradeBaseCostMonitor = 10;
    public double clickUpgradeCostMultMonitor = 1.5;

    //Server rack
    public double server;
    public int clickUpgradeLevelServer = 0;
    public double clickUpgradeBaseCostServer = 10;
    public double clickUpgradeCostMultServer = 1.5;

    //public UpgradeData()
    //{
    //    clickUpgradeLevel = 0;

    //}
    public double CostKeyboard()
    {
        return clickUpgradeBaseCostKeyboard * Math.Pow(clickUpgradeCostMultKeyboard, clickUpgradeLevelKeyboard);
    }
    public double CostMouse()
    {
        return clickUpgradeBaseCostMouse * Math.Pow(clickUpgradeCostMultMouse, clickUpgradeLevelMouse);
    }
    public double CostMonitor()
    {
        return clickUpgradeBaseCostMonitor * Math.Pow(clickUpgradeCostMultMonitor, clickUpgradeLevelMonitor);
    }
    public double CostServer()
    {
        return clickUpgradeBaseCostServer * Math.Pow(clickUpgradeCostMultServer, clickUpgradeLevelServer);
    }
}
