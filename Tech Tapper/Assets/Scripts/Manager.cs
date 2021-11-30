using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class Manager : MonoBehaviour
{
    public Text ClicksTotalText;
    float TotalClicks;

    // Default Auto click
    bool hasUpgrade;
    public int autoClicksPerSecond;
    public int minimumClicksToUnlockUpgrade;
    //-------------------------------------------------------------------------------------------------------

    // Table Auto click
    bool hasTable;
    public int TableClicksPerSecond;
    public int minimumClicksToUnlockKeyboad;
    //-------------------------------------------------------------------------------------------------------


    // Chair Auto click
    bool hasChair;
    public int ChairClicksPerSecond;
    public int minimumClicksToUnlockChair;
    //-------------------------------------------------------------------------------------------------------

    // Wall Auto click
    bool hasWall;
    public int WallClicksPerSecond;
    public int minimumClicksToUnlockWall;
    //-------------------------------------------------------------------------------------------------------

    // Poster Auto click
    bool hasPoster;
    public int PosterClicksPerSecond;
    public int minimumClicksToUnlockPoster;
    //-------------------------------------------------------------------------------------------------------

    // Floor Auto click
    bool hasFloor;
    public int FloorClicksPerSecond;
    public int minimumClicksToUnlockFloor;
    //-------------------------------------------------------------------------------------------------------

    // Carpet Auto click
    bool hasCarpet;
    public int CarpetClicksPerSecond;
    public int minimumClicksToUnlockCarpet;
    //-------------------------------------------------------------------------------------------------------

    // Default Click
    public void AddClicks()
    {
        TotalClicks++;

        // Shortens big numbers
        if (TotalClicks >= 1000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000).ToString() + "K";
        else if (TotalClicks >= 1000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000).ToString() + "M";
        else if (TotalClicks >= 1000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000).ToString() + "B";
        else if (TotalClicks >= 1000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000).ToString() + "T";
        else if (TotalClicks >= 1000000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000).ToString() + "Quadrillion";
        else if (TotalClicks >= 1000000000000000000)
            ClicksTotalText.text = Math.Floor(TotalClicks / 1000000000000000000).ToString() + "Quintillion";
        else
            ClicksTotalText.text = TotalClicks.ToString("0");
    }

    // Auto Clickers

    // Default Auto click
    public void AutoClickUpgrade()
    {
        if (!hasUpgrade && TotalClicks >= minimumClicksToUnlockUpgrade)
        {
            TotalClicks -= minimumClicksToUnlockUpgrade;
            hasUpgrade = true;
        }
    }

    // Table Auto Click
    public void AutoTableUpgrade()
    {
        if (!hasTable && TotalClicks >= minimumClicksToUnlockKeyboad)
        {
            TotalClicks -= minimumClicksToUnlockKeyboad;
            hasTable = true;
        }
    }

    // Chair Auto Click
    public void AutoChairUpgrade()
    {
        if (!hasChair && TotalClicks >= minimumClicksToUnlockChair)
        {
            TotalClicks -= minimumClicksToUnlockChair;
            hasChair = true;
        }
    }

    // Wall Auto Click
    public void AutoWallUpgrade()
    {
        if (!hasWall && TotalClicks >= minimumClicksToUnlockWall)
        {
            TotalClicks -= minimumClicksToUnlockWall;
            hasWall = true;
        }
    }

    // Poster Auto Click
    public void AutoPosterUpgrade()
    {
        if (!hasPoster && TotalClicks >= minimumClicksToUnlockPoster)
        {
            TotalClicks -= minimumClicksToUnlockPoster;
            hasPoster = true;
        }
    }

    // Floor Auto Click
    public void AutoFloorUpgrade()
    {
        if (!hasFloor && TotalClicks >= minimumClicksToUnlockFloor)
        {
            TotalClicks -= minimumClicksToUnlockFloor;
            hasFloor = true;
        }
    }

    // Carpet Auto Click
    public void AutoCarpetUpgrade()
    {
        if (!hasCarpet && TotalClicks >= minimumClicksToUnlockCarpet)
        {
            TotalClicks -= minimumClicksToUnlockCarpet;
            hasCarpet = true;
        }
    }


    //-------------------------------------------------------------------------------------------------------

    // Update
    private void Update()
    {
        if (hasUpgrade)
        {
            TotalClicks += autoClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasTable)
        {
            TotalClicks += TableClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasChair)
        {
            TotalClicks += ChairClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasWall)
        {
            TotalClicks += WallClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasPoster)
        {
            TotalClicks += PosterClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasFloor)
        {
            TotalClicks += FloorClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }

        if (hasCarpet)
        {
            TotalClicks += CarpetClicksPerSecond * Time.deltaTime;
            ClicksTotalText.text = TotalClicks.ToString("0");
        }



    }

}
