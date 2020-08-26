--Se definenen dos tipos para crear instancias de la typeclass,
--el tipo de dato humano se define por medio del nick de alguien, de la misma forma
--el tipo planta se define por medio del nomre de esta (cada uno son strings)
data Human = NickName String
data Plant = Name String

--defino mi typeclass, que en este caso haceS referencia a las cosas que un ser vivo puede ahcer
--se implementa el polimorfismo paramétrico por medio del tipo thing, que en mi caso
--puede tomar un tipo humano o un tipo planta.
--se establecen 4 funciones (o comportamientos) que puede tomar el dato, y dependiendo del tipo
--retorna una cadena de texto que hace refreencia al determinado comportamiento
class WhatAliveThingsDo thing where
  reproduction :: thing -> String
  nutrition :: thing -> String
  breathing :: thing -> String
  somethingParticular :: thing -> String

--la primera instancia de la typeclass es del tipo humano
instance WhatAliveThingsDo Human where
  reproduction (NickName nick) = "" ++ nick ++ ": sexual reproduction"
  nutrition (NickName nick) = nick ++ ": heterotrophic"
  breathing (NickName nick) = nick ++ ": pulmonary breathing"
  somethingParticular (NickName nick) = nick ++ ": I destroy the planet"

--esta otra intancia es para el tipo planta
instance WhatAliveThingsDo Plant where
  reproduction (Name name) = name ++ ": asexual and sexual reproduction"
  nutrition (Name name) = name ++ ": utotrophic"
  breathing (Name name) = name ++ ": photosynthesis"
  somethingParticular (Name name) = name ++ " I un-destroy the planet"

--definimos la función con la restricción de tipos que son instancias de la typeclass
saygreat :: WhatAliveThingsDo thing => thing -> IO ()
saygreat x =
  do
    putStrLn (somethingParticular x)

juana = NickName "Juana"
penca = Name "penca"

--el main donde imprimimos lo que retorna reproducción con un tipo humano y uno planta
--además de llamar la función de restricción
main :: IO ()
main =
  do
    putStrLn (reproduction juana)
    saygreat juana
    putStrLn (reproduction penca)
    saygreat penca
--tomé como referencias:http://learnyouahaskell.com/types-and-typeclasses
--https://www.schoolofhaskell.com/user/XookDo/introduccion-a-la-programacion-funcional/parte-5/tutorial
--http://aprendehaskell.es/content/ClasesDeTipos.htmlS
