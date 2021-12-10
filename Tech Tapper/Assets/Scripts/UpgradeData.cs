using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class UpgradeData : MonoBehaviour
{
    #region click upgrades
    //Keyboard
    public double keyboard;
    public int clickUpgradeLevelKeyboard = 0;
    public double clickUpgradeBaseCostKeyboard = 10;
    public double clickUpgradeCostMultKeyboard = 1.5;
    public GameObject keyBoardV1;
    public GameObject keyBoardV2;
    public GameObject keyBoardV3;
    public GameObject keyBoardV4;

    //Mouse
    public double mouse;
    public int clickUpgradeLevelMouse = 0;
    public double clickUpgradeBaseCostMouse = 10;
    public double clickUpgradeCostMultMouse = 1.5;
    public GameObject mouseV1;
    public GameObject mouseV2;
    public GameObject mouseV3;
    public GameObject mouseV4;

    //Monitor
    public double monitor;
    public int clickUpgradeLevelMonitor = 0;
    public double clickUpgradeBaseCostMonitor = 10;
    public double clickUpgradeCostMultMonitor = 1.5;
    public GameObject monitorV1;
    public GameObject monitorV2;
    public GameObject monitorV3;
    public GameObject monitorV4;


    //Server rack
    public double server;
    public int clickUpgradeLevelServer = 0;
    public double clickUpgradeBaseCostServer = 10;
    public double clickUpgradeCostMultServer = 1.5;
    public GameObject serverRackV1;
    public GameObject serverRackV2;
    public GameObject serverRackV3;
    public GameObject serverRackV4;


    //public UpgradeData()
    //{
    //    clickUpgradeLevel = 0;

    //}
    public double CostKeyboard()
    {
        return clickUpgradeBaseCostKeyboard * Math.Pow(clickUpgradeCostMultKeyboard, clickUpgradeLevelKeyboard); //cost * 1.5^lvl
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
    #endregion
    #region hardware upgrades
    //Table
    public double table;
    public int clickUpgradeLevelTable = 0;
    public double clickUpgradeBaseCostTable = 10;
    public double clickUpgradeCostMultTable = 1.5;
    public GameObject TableV1;
    public GameObject TableV2;
    public GameObject TableV3;
    public GameObject TableV4;

    //Chair
    public double chair;
    public int clickUpgradeLevelChair = 0;
    public double clickUpgradeBaseCostChair = 10;
    public double clickUpgradeCostMultChair = 1.5;
    public GameObject ChairV1;
    public GameObject ChairV2;
    public GameObject ChairV3;
    public GameObject ChairV4;

    //Wall
    public double wall;
    public int clickUpgradeLevelWall = 0;
    public double clickUpgradeBaseCostWall = 10;
    public double clickUpgradeCostMultWall = 1.5;
    public GameObject WallV1;
    public GameObject WallV2;
    public GameObject WallV3;
    public GameObject WallV4;

    //Poster
    public double poster;
    public int clickUpgradeLevelPoster = 0;
    public double clickUpgradeBaseCostPoster = 10;
    public double clickUpgradeCostMultPoster = 1.5;
    public GameObject PosterRackV1;
    public GameObject PosterRackV2;
    public GameObject PosterRackV3;
    public GameObject PosterRackV4;

    //Floor
    public double floor;
    public int clickUpgradeLevelFloor = 0;
    public double clickUpgradeBaseCostFloor = 10;
    public double clickUpgradeCostMultFloor = 1.5;
    public GameObject FloorRackV1;
    public GameObject FloorRackV2;
    public GameObject FloorRackV3;
    public GameObject FloorRackV4;

    //Carpet
    public double Carpet;
    public int clickUpgradeLevelCarpet = 0;
    public double clickUpgradeBaseCostCarpet = 10;
    public double clickUpgradeCostMultCarpet = 1.5;
    public GameObject CarpetRackV1;
    public GameObject CarpetRackV2;
    public GameObject CarpetRackV3;
    public GameObject CarpetRackV4;


    //public UpgradeData()
    //{
    //    clickUpgradeLevel = 0;

    //}
    public double CostTable()
    {
        return clickUpgradeBaseCostTable * Math.Pow(clickUpgradeCostMultTable, clickUpgradeLevelTable); //cost * 1.5^lvl
    }
    public double CostChair()
    {
        return clickUpgradeBaseCostChair * Math.Pow(clickUpgradeCostMultChair, clickUpgradeLevelChair);
    }
    public double CostWall()
    {
        return clickUpgradeBaseCostWall * Math.Pow(clickUpgradeCostMultWall, clickUpgradeLevelWall);
    }
    public double CostPoster()
    {
        return clickUpgradeBaseCostPoster * Math.Pow(clickUpgradeCostMultPoster, clickUpgradeLevelPoster);
    }
    public double CostFloor()
    {
        return clickUpgradeBaseCostFloor * Math.Pow(clickUpgradeCostMultFloor, clickUpgradeLevelFloor);
    }
    public double CostCarpet()
    {
        return clickUpgradeBaseCostCarpet * Math.Pow(clickUpgradeCostMultCarpet, clickUpgradeLevelCarpet);
    }
    #endregion
}
