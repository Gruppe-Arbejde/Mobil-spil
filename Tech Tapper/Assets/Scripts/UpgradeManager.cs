using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpgradeManager : MonoBehaviour
{
    //public double clickUpgradeBaseCost;
    //public double clickUpgradeCostMult;
    public UpgradeData data = new UpgradeData();
    public ClickUpgrades clickUpgrade = new ClickUpgrades();
    public Manager man = new Manager();

    // Start is called before the first frame update
    public void Start()
    {
        //clickUpgradeBaseCost = 10;
        //clickUpgradeCostMult = 1.5;
        UpdateClickUpgradeUi();
    }
    //compile
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
    }

    //public double Cost()
    //{
    //    return clickUpgradeBaseCost * Math.Pow(clickUpgradeCostMult, data.clickUpgradeLevel);
    //}
    public void BuyUpgradeKeyboard()
    {
        //clickUpgrade.CostError.text = System.Convert.ToString(Cost());
        //clickUpgrade.ClicksError.text = System.Convert.ToString(man.valuta);

        if (Manager.clicksU >= data.CostKeyboard())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostKeyboard());
            data.clickUpgradeLevelKeyboard += 1;
            Manager.multiplier += data.clickUpgradeLevelKeyboard;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
    }
    public void BuyUpgradeMouse()
    {
        //clickUpgrade.CostError.text = System.Convert.ToString(Cost());
        //clickUpgrade.ClicksError.text = System.Convert.ToString(man.valuta);

        if (Manager.clicksU >= data.CostMouse())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostMouse());
            data.clickUpgradeLevelMouse += 1;
            Manager.multiplier += data.clickUpgradeLevelMouse;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
    }
    public void BuyUpgradeMonitor()
    {
        //clickUpgrade.CostError.text = System.Convert.ToString(Cost());
        //clickUpgrade.ClicksError.text = System.Convert.ToString(man.valuta);

        if (Manager.clicksU >= data.CostMonitor())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostMonitor());
            data.clickUpgradeLevelMonitor += 1;
            Manager.multiplier += data.clickUpgradeLevelMonitor;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
    }
    public void BuyUpgradeServer()
    {
        //clickUpgrade.CostError.text = System.Convert.ToString(Cost());
        //clickUpgrade.ClicksError.text = System.Convert.ToString(man.valuta);

        if (Manager.clicksU >= data.CostServer())
        {
            //man.TotalClicks -= Cost();
            Manager.clicksU -= Convert.ToInt32(data.CostServer());
            data.clickUpgradeLevelServer += 1;
            Manager.multiplier += data.clickUpgradeLevelServer;
            UpdateClickUpgradeUi();
            man.ClicksTotalText.text = Convert.ToString(Manager.clicksU);
        }
    }
}
