using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[InitializeOnLoad]
public class StartUpLoad : MonoBehaviour
{
    static StartUpLoad()
    {
        //Manager.instance.TotalClicks = SaveManager.instance.LoadedClicks; //Overwrites the amount of clicks with the one loaded
        //Manager.instance.ClicksTotalText.text = Manager.instance.TotalClicks.ToString("0");
    }

}

    
