using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GameUpgrades : MonoBehaviour
{
    public Manager man = new Manager();
    public TMP_Text ui;

    public void Increment()
    {
        Manager.clicksU += Manager.multiplier;
        //man.AddClicks();
    }

    public void Buy(int num)
    {
        if(num == 1 && Manager.clicksU >= 25)
        {
            Manager.multiplier += 1;
            Manager.clicksU -= 25;
            man.ClicksTotalText.text = System.Convert.ToString(Manager.clicksU);
            man.AddClicks();
        }
        if(num == 2 && Manager.clicksU >= 125)
        {
            Manager.multiplier += 10;
            Manager.clicksU -= 125;
        }
        if (num == 3 && Manager.clicksU >= 1500)
        {
            Manager.multiplier += 100;
            Manager.clicksU -= 1500;
        }
    }

    private void Update()
    {
        ui.text = "" + Manager.clicksU;
        //man.ClicksTotalText.text = System.Convert.ToString(Manager.clicksU);
    }
}
