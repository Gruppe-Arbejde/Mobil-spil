using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using static System.Net.Mime.MediaTypeNames;



public class Se
{
    public static bool Save(string saveName, object saveData) //takes in the saveName string and the object saveData, and returns a boolean to make sure that it was successful 
    {
        BinaryFormatter formatter = getBinaryFormatter();

        if(!Directory.Exists(Application.persistentDataPath + "/saves")) //Defines the path for our save game
        {
            Directory.CreateDirectory(Application.persistentDataPath) + "/saves");

        }

        string path = Application.persistentDataPath + "/saves" + saveName + ".save"; //.save is the name of the file

        FileStream file = File.Create(path);

        formatter.Serialize(file, saveData);

        file.Close();

        return true;
    }
    public static bool Load(string path)
    {
        if (!File.Exists(path)) //Checks if the file doesn't exist
        {
            return null;
        }

        BinaryFormatter formatter = GetBinaryFormatter();

        FileStream file = File.Open(path, FileMode.Open);


        try //Tries to open the file and if it is successful it will then return it
        {
            object save = formatter.Deserialize(file);
            file.Close();
            return save;

        }
        catch
        {
            Debug.LogErrorFormat("Failed to load file at {0}", path);
            file.Close();
            return null;


        }

    }

    public static BinaryFormatter GetBinaryFormatter()
    {
        BinaryFormatter formatter = new BinaryFormatter();

        return formatter;

    }


}
