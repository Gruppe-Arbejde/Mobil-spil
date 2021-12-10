using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpgradeManager : MonoBehaviour
{
    public UpgradeData data = new UpgradeData();
    public ClickUpgrades clickUpgrade = new ClickUpgrades();
    public Manager man = new Manager();

    // Start is called before the first frame update
    public void Start()
    {

        UpdateClickUpgradeUi();
    }
    public void UpdateClickUpgradeUi()
    {
        //Keyboard UI
        clickUpgrade.LevelTextKeyboard.text = "Lvl: " + data.clickUpgradeLevelKeyboard;
        clickUpgrade.CostTextKeyboard.text = ($"{data.CostKeyboard():n0}");

        //Mouse UI
        clickUpgrade.LevelTextMouse.text = "Lvl: " + data.clickUpgradeLevelMouse;
        clickUpgrade.CostTextMouse.text = ($"{data.CostMouse():n0}");

        //Monitor UI
        clickUpgrade.LevelTextMonitor.text = "Lvl: " + data.clickUpgradeLevelMonitor;
        clickUpgrade.CostTextMonitor.text = ($"{data.CostMonitor():n0}");

        //Server rack UI
        clickUpgrade.LevelTextServer.text = "Lvl: " + data.clickUpgradeLevelServer;
        clickUpgrade.CostTextServer.text = ($"{data.CostServer():n0}");

        //Table UI
        clickUpgrade.LevelTextTable.text = "Lvl: " + data.clickUpgradeLevelTable;
        clickUpgrade.CostTextTable.text = ($"{data.CostTable():n0}");

        //Chair UI
        clickUpgrade.LevelTextChair.text = "Lvl: " + data.clickUpgradeLevelChair;
        clickUpgrade.CostTextChair.text = ($"{data.CostChair():n0}");

        //Wall UI
        clickUpgrade.LevelTextWall.text = "Lvl: " + data.clickUpgradeLevelWall;
        clickUpgrade.CostTextWall.text = ($"{data.CostWall():n0}");

        //Poster UI
        clickUpgrade.LevelTextPoster.text = "Lvl: " + data.clickUpgradeLevelPoster;
        clickUpgrade.CostTextPoster.text = ($"{data.CostPoster():n0}");

        //Floor UI
        clickUpgrade.LevelTextFloor.text = "Lvl: " + data.clickUpgradeLevelFloor;
        clickUpgrade.CostTextFloor.text = ($"{data.CostFloor():n0}");

        //Carpet UI
        clickUpgrade.LevelTextCarpet.text = "Lvl: " + data.clickUpgradeLevelCarpet;
        clickUpgrade.CostTextCarpet.text = ($"{data.CostCarpet():n0}");


    }

    #region hardware buy functions
    public void BuyUpgradeKeyboard()
    {
        if (Manager.clicksU >= data.CostKeyboard())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostKeyboard());
            data.clickUpgradeLevelKeyboard += 1;
            Manager.multiplier += data.clickUpgradeLevelKeyboard;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelKeyboard)
        {
            case 25:
                data.keyBoardV1.SetActive(false);
                data.keyBoardV2.SetActive(true);
                break;
            case 50:
                break;
            case 75:
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeMouse()
    {
        if (Manager.clicksU >= data.CostMouse())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostMouse());
            data.clickUpgradeLevelMouse += 1;
            Manager.multiplier += data.clickUpgradeLevelMouse;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelMouse)
        {
            case 25:
                data.mouseV1.SetActive(false);
                data.mouseV2.SetActive(true);
                break;
            case 50:
                break;
            case 75:
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeMonitor() 
    {
        if (Manager.clicksU >= data.CostMonitor())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostMonitor());
            data.clickUpgradeLevelMonitor += 1;
            Manager.multiplier += data.clickUpgradeLevelMonitor;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelMonitor)
        {
            case 25:
                data.monitorV1.SetActive(false);
                data.monitorV2.SetActive(true);
                break;
            case 50:
                break;
            case 75:
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeServer()
    {
        if (Manager.clicksU >= data.CostServer())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostServer());
            data.clickUpgradeLevelServer += 1;
            Manager.multiplier += data.clickUpgradeLevelServer;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelServer)
        {
            case 1:
                data.serverRackV1.SetActive(true);
                break;
            case 25:
                data.serverRackV1.SetActive(false);
                data.serverRackV2.SetActive(true);
                break;
            case 50:
                data.serverRackV2.SetActive(false);
                data.serverRackV3.SetActive(true);
                break;
            case 75:
                data.serverRackV3.SetActive(false);
                data.serverRackV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    #endregion

    #region building buy functions
    public void BuyUpgradeTable()
    {
        if (Manager.clicksU >= data.CostTable())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostTable());
            data.clickUpgradeLevelTable += 1;
            Manager.multiplier += data.clickUpgradeLevelTable;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelTable)
        {
            case 25:
                data.TableV1.SetActive(false);
                data.TableV2.SetActive(true);
                break;
            case 50:
                data.TableV2.SetActive(false);
                data.TableV3.SetActive(true);
                break;
            case 75:
                data.TableV3.SetActive(false);
                data.TableV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeChair()
    {
        if (Manager.clicksU >= data.CostChair())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostChair());
            data.clickUpgradeLevelChair += 1;
            Manager.multiplier += data.clickUpgradeLevelChair;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelChair)
        {
            case 25:
                data.ChairV1.SetActive(false);
                data.ChairV2.SetActive(true);
                break;
            case 50:
                data.ChairV2.SetActive(false);
                data.ChairV3.SetActive(true);
                break;
            case 75:
                data.ChairV3.SetActive(false);
                data.ChairV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeWall()
    {
        if (Manager.clicksU >= data.CostWall())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostWall());
            data.clickUpgradeLevelWall += 1;
            Manager.multiplier += data.clickUpgradeLevelWall;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelWall)
        {
            case 25:
                data.WallV1.SetActive(false);
                data.WallV2.SetActive(true);
                break;
            case 50:
                data.WallV2.SetActive(false);
                data.WallV3.SetActive(true);
                break;
            case 75:
                data.WallV3.SetActive(false);
                data.WallV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    public void BuyUpgradePoster()
    {
        if (Manager.clicksU >= data.CostPoster())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostPoster());
            data.clickUpgradeLevelPoster += 1;
            Manager.multiplier += data.clickUpgradeLevelPoster;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelPoster)
        {
            case 1:
                data.PosterRackV1.SetActive(true);
                break;
            case 25:
                data.PosterRackV1.SetActive(false);
                data.PosterRackV2.SetActive(true);
                break;
            case 50:
                data.PosterRackV2.SetActive(false);
                data.PosterRackV3.SetActive(true);
                break;
            case 75:
                data.PosterRackV3.SetActive(false);
                data.PosterRackV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeFloor()
    {
        if (Manager.clicksU >= data.CostFloor())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostFloor());
            data.clickUpgradeLevelFloor += 1;
            Manager.multiplier += data.clickUpgradeLevelFloor;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelFloor)
        {
            case 25:
                data.FloorRackV1.SetActive(false);
                data.FloorRackV2.SetActive(true);
                break;
            case 50:
                data.FloorRackV2.SetActive(false);
                data.FloorRackV3.SetActive(true);
                break;
            case 75:
                data.FloorRackV3.SetActive(false);
                data.FloorRackV4.SetActive(true);
                break;
            default:
                break;
        }
    }
    public void BuyUpgradeCarpet()
    {
        if (Manager.clicksU >= data.CostCarpet())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostCarpet());
            data.clickUpgradeLevelCarpet += 1;
            Manager.multiplier += data.clickUpgradeLevelCarpet;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
        switch (data.clickUpgradeLevelCarpet)
        {
            case 1:
                data.CarpetRackV1.SetActive(true);
                break;
            case 25:
                data.CarpetRackV1.SetActive(false);
                data.CarpetRackV2.SetActive(true);
                break;
            case 50:
                data.CarpetRackV2.SetActive(false);
                data.CarpetRackV3.SetActive(true);
                break;
            case 75:
                data.CarpetRackV3.SetActive(false);
                data.CarpetRackV4.SetActive(true);
                break;
            default:
                break;
        }
    }

    #endregion
}
