using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using System;

public class GameUpgrades : MonoBehaviour
{
    public Manager man = new Manager();
    public TMP_Text ui;
    int x = 1;
    //public DateTime d1; //used for animation handling in PlayerAnimation.cs
    public AudioSource tap1SFX;
    public AudioSource tap2SFX;
    public AudioSource tap3SFX;
    public AudioSource tap4SFX;
    System.Random rd = new System.Random();
    PlayerAnimation pa = new PlayerAnimation();

    public void Increment()
    {
        Manager.clicksU += Manager.multiplier;
        //man.AddClicks();
    }
    public void PlaySound()
    {
        x = rd.Next(1, 4);
        switch (x)
        {
            case 1:
                tap1SFX.Play(0);
                break;
            case 2:
                tap2SFX.Play(0);
                break;
            case 3:
                tap3SFX.Play(0);
                break;
            case 4:
                tap4SFX.Play(0);
                break;
            default:
                break;
        }
    }

    public void Buy(int num)
    {
        if (num == 1 && Manager.clicksU >= 25)
        {
            Manager.multiplier += 1;
            Manager.clicksU -= 25;
            man.ClicksTotalText.text = System.Convert.ToString(Manager.clicksU);
            man.AddClicks();
        }
        if (num == 2 && Manager.clicksU >= 125)
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
        //ui.text = "" + Manager.clicksU;
        //man.ClicksTotalText.text = System.Convert.ToString(Manager.clicksU);
    }
}
