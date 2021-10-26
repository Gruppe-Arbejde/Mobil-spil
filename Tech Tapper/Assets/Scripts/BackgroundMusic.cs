½using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BackgroundMusic : MonoBehaviour
{
    private void Awake()
    {
        if (BackgroundMusic == null)
        {
            BackgroundMusic = this;
            DontDestroyOnLoad(BackgroundMusic);
        }

        else
        {
            Destroy(gameObject);
        }
    }
}
