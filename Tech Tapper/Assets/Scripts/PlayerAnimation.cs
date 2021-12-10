using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAnimation : MonoBehaviour
{
    GameUpgrades gu = new GameUpgrades();
    public GameObject playerAnimation1;
    public GameObject playerAnimation2;
    public GameObject playerAnimationIdle;
    int switchX = 1;

    public void PlayerAnimationRun()
    {
        //if (switchX == 1)
        //{
        //    playerAnimation1.SetActive(true);
        //    playerAnimation2.SetActive(false);
        //    playerAnimationIdle.SetActive(false);
        //    switchX = 2;
        //}
        //else if (switchX == 2)
        //{
        //    playerAnimation1.SetActive(false);
        //    playerAnimation2.SetActive(true);
        //    playerAnimationIdle.SetActive(false);
        //    switchX = 1;
        //}
        switch (switchX)
        {
            case 1:
                playerAnimation1.SetActive(true);
                playerAnimation2.SetActive(false);
                playerAnimationIdle.SetActive(false);
                switchX++;
                break;
            case 2:
                playerAnimation1.SetActive(false);
                playerAnimation2.SetActive(true);
                playerAnimationIdle.SetActive(false);
                switchX--;
                break;
            default:
                break;
        }
    }

    // Update is called once per frame
    void Update()
    {
        //if (gu.d1.Second != gu.d1.Second + 2)
        //{
        //    playerAnimation1.SetActive(false);
        //    playerAnimation2.SetActive(false);
        //    playerAnimationIdle.SetActive(true);
        //}
    }
}
