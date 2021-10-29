using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

public class SaveManager : MonoBehaviour
{
    public static SaveManager instance { get; private set; }

    public float LoadedClicks;

    private void Awake()
    {
        if (instance != null && instance != this)
            Destroy(gameObject);
        else
            instance = this;
        DontDestroyOnLoad(gameObject); //makes sure that the save manager wont be destroyed upon loading
        Load();
    }

    public void Load()
    {
        if (File.Exists(Application.persistentDataPath + "/playerInfo.dat"))
        {
            BinaryFormatter bf = new BinaryFormatter();
            FileStream file = File.Open(Application.persistentDataPath + "/playerInfo.dat", FileMode.Open); //Opens the file
            PlayerData_Storage data = (PlayerData_Storage)bf.Deserialize(file); //Converts from binary to ordinary file

            LoadedClicks = data.LoadedClicks; //overwrites the amount of current clicks with the one from the loaded file

            file.Close();

        }
    }

    public void Save()
    {
        BinaryFormatter bf = new BinaryFormatter();
        
        //persistentDataPath makes sure to overwrite existing save files if they are present
        FileStream file = File.Create(Application.persistentDataPath + "/playerInfo.dat");
        PlayerData_Storage data = new PlayerData_Storage();

        data.LoadedClicks = LoadedClicks;

        bf.Serialize(file, data);
        file.Close();
    }
}

[Serializable]
class PlayerData_Storage
{
    public float LoadedClicks;
}