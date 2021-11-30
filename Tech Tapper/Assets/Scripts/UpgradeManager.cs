using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpgradeManager : MonoBehaviour
{
    public double clickUpgradeBaseCost;
    public double clickUpgradeCostMult;
    public UpgradeData data = new UpgradeData();
    public ClickUpgrades clickUpgrade = new ClickUpgrades();
    public Manager man = new Manager();

    // Start is called before the first frame update
    public void Start()
    {
        clickUpgradeBaseCost = 10;
        clickUpgradeCostMult = 1.5;
        UpdateClickUpgradeUi();
    }

    public void UpdateClickUpgradeUi()
    {
        clickUpgrade.LevelText.text = "Lvl: " + data.clickUpgradeLevel;
        clickUpgrade.CostText.text = "Cost: " + Cost();
    }

    public double Cost()
    {
        return clickUpgradeBaseCost * Math.Pow(clickUpgradeCostMult, data.clickUpgradeLevel);
    }
    public void BuyUpgrade()
    {
        clickUpgrade.CostError.text = System.Convert.ToString(Cost());
        clickUpgrade.ClicksError.text = System.Convert.ToString(man.valuta);

        if (man.TotalClicks >= Cost())
        {
            man.TotalClicks -= Cost();
            data.clickUpgradeLevel += 1;
            UpdateClickUpgradeUi();
        }
    }
}
