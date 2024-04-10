; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87048 () Bool)

(assert start!87048)

(declare-fun b!1009678 () Bool)

(declare-fun res!678267 () Bool)

(declare-fun e!568040 () Bool)

(assert (=> b!1009678 (=> (not res!678267) (not e!568040))))

(declare-datatypes ((array!63623 0))(
  ( (array!63624 (arr!30631 (Array (_ BitVec 32) (_ BitVec 64))) (size!31133 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63623)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009678 (= res!678267 (validKeyInArray!0 (select (arr!30631 a!3219) j!170)))))

(declare-fun b!1009679 () Bool)

(declare-fun res!678279 () Bool)

(declare-fun e!568045 () Bool)

(assert (=> b!1009679 (=> (not res!678279) (not e!568045))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63623 (_ BitVec 32)) Bool)

(assert (=> b!1009679 (= res!678279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009680 () Bool)

(declare-fun e!568042 () Bool)

(declare-fun e!568043 () Bool)

(assert (=> b!1009680 (= e!568042 e!568043)))

(declare-fun res!678276 () Bool)

(assert (=> b!1009680 (=> (not res!678276) (not e!568043))))

(declare-fun lt!446260 () (_ BitVec 64))

(declare-fun lt!446264 () array!63623)

(declare-datatypes ((SeekEntryResult!9563 0))(
  ( (MissingZero!9563 (index!40623 (_ BitVec 32))) (Found!9563 (index!40624 (_ BitVec 32))) (Intermediate!9563 (undefined!10375 Bool) (index!40625 (_ BitVec 32)) (x!88022 (_ BitVec 32))) (Undefined!9563) (MissingVacant!9563 (index!40626 (_ BitVec 32))) )
))
(declare-fun lt!446262 () SeekEntryResult!9563)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63623 (_ BitVec 32)) SeekEntryResult!9563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009680 (= res!678276 (not (= lt!446262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446260 mask!3464) lt!446260 lt!446264 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1009680 (= lt!446260 (select (store (arr!30631 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009680 (= lt!446264 (array!63624 (store (arr!30631 a!3219) i!1194 k!2224) (size!31133 a!3219)))))

(declare-fun b!1009681 () Bool)

(declare-fun res!678275 () Bool)

(assert (=> b!1009681 (=> (not res!678275) (not e!568045))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009681 (= res!678275 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31133 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31133 a!3219))))))

(declare-fun b!1009682 () Bool)

(declare-fun res!678272 () Bool)

(assert (=> b!1009682 (=> (not res!678272) (not e!568040))))

(assert (=> b!1009682 (= res!678272 (validKeyInArray!0 k!2224))))

(declare-fun b!1009683 () Bool)

(declare-fun e!568041 () Bool)

(assert (=> b!1009683 (= e!568045 e!568041)))

(declare-fun res!678277 () Bool)

(assert (=> b!1009683 (=> (not res!678277) (not e!568041))))

(declare-fun lt!446259 () SeekEntryResult!9563)

(assert (=> b!1009683 (= res!678277 (= lt!446262 lt!446259))))

(assert (=> b!1009683 (= lt!446259 (Intermediate!9563 false resIndex!38 resX!38))))

(assert (=> b!1009683 (= lt!446262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(declare-fun lt!446261 () (_ BitVec 32))

(declare-fun b!1009684 () Bool)

(assert (=> b!1009684 (= e!568043 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (or (bvslt lt!446261 #b00000000000000000000000000000000) (bvsge lt!446261 (size!31133 a!3219)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009684 (= lt!446261 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009685 () Bool)

(assert (=> b!1009685 (= e!568041 e!568042)))

(declare-fun res!678273 () Bool)

(assert (=> b!1009685 (=> (not res!678273) (not e!568042))))

(declare-fun lt!446263 () SeekEntryResult!9563)

(assert (=> b!1009685 (= res!678273 (= lt!446263 lt!446259))))

(assert (=> b!1009685 (= lt!446263 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009687 () Bool)

(assert (=> b!1009687 (= e!568040 e!568045)))

(declare-fun res!678278 () Bool)

(assert (=> b!1009687 (=> (not res!678278) (not e!568045))))

(declare-fun lt!446265 () SeekEntryResult!9563)

(assert (=> b!1009687 (= res!678278 (or (= lt!446265 (MissingVacant!9563 i!1194)) (= lt!446265 (MissingZero!9563 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63623 (_ BitVec 32)) SeekEntryResult!9563)

(assert (=> b!1009687 (= lt!446265 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009688 () Bool)

(declare-fun res!678266 () Bool)

(assert (=> b!1009688 (=> (not res!678266) (not e!568043))))

(assert (=> b!1009688 (= res!678266 (not (= lt!446263 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446260 lt!446264 mask!3464))))))

(declare-fun b!1009689 () Bool)

(declare-fun res!678274 () Bool)

(assert (=> b!1009689 (=> (not res!678274) (not e!568043))))

(assert (=> b!1009689 (= res!678274 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!678271 () Bool)

(assert (=> start!87048 (=> (not res!678271) (not e!568040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87048 (= res!678271 (validMask!0 mask!3464))))

(assert (=> start!87048 e!568040))

(declare-fun array_inv!23755 (array!63623) Bool)

(assert (=> start!87048 (array_inv!23755 a!3219)))

(assert (=> start!87048 true))

(declare-fun b!1009686 () Bool)

(declare-fun res!678269 () Bool)

(assert (=> b!1009686 (=> (not res!678269) (not e!568040))))

(assert (=> b!1009686 (= res!678269 (and (= (size!31133 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31133 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31133 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009690 () Bool)

(declare-fun res!678270 () Bool)

(assert (=> b!1009690 (=> (not res!678270) (not e!568045))))

(declare-datatypes ((List!21307 0))(
  ( (Nil!21304) (Cons!21303 (h!22492 (_ BitVec 64)) (t!30308 List!21307)) )
))
(declare-fun arrayNoDuplicates!0 (array!63623 (_ BitVec 32) List!21307) Bool)

(assert (=> b!1009690 (= res!678270 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21304))))

(declare-fun b!1009691 () Bool)

(declare-fun res!678268 () Bool)

(assert (=> b!1009691 (=> (not res!678268) (not e!568040))))

(declare-fun arrayContainsKey!0 (array!63623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009691 (= res!678268 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87048 res!678271) b!1009686))

(assert (= (and b!1009686 res!678269) b!1009678))

(assert (= (and b!1009678 res!678267) b!1009682))

(assert (= (and b!1009682 res!678272) b!1009691))

(assert (= (and b!1009691 res!678268) b!1009687))

(assert (= (and b!1009687 res!678278) b!1009679))

(assert (= (and b!1009679 res!678279) b!1009690))

(assert (= (and b!1009690 res!678270) b!1009681))

(assert (= (and b!1009681 res!678275) b!1009683))

(assert (= (and b!1009683 res!678277) b!1009685))

(assert (= (and b!1009685 res!678273) b!1009680))

(assert (= (and b!1009680 res!678276) b!1009688))

(assert (= (and b!1009688 res!678266) b!1009689))

(assert (= (and b!1009689 res!678274) b!1009684))

(declare-fun m!934197 () Bool)

(assert (=> b!1009690 m!934197))

(declare-fun m!934199 () Bool)

(assert (=> b!1009682 m!934199))

(declare-fun m!934201 () Bool)

(assert (=> b!1009683 m!934201))

(assert (=> b!1009683 m!934201))

(declare-fun m!934203 () Bool)

(assert (=> b!1009683 m!934203))

(assert (=> b!1009683 m!934203))

(assert (=> b!1009683 m!934201))

(declare-fun m!934205 () Bool)

(assert (=> b!1009683 m!934205))

(declare-fun m!934207 () Bool)

(assert (=> b!1009691 m!934207))

(declare-fun m!934209 () Bool)

(assert (=> b!1009688 m!934209))

(declare-fun m!934211 () Bool)

(assert (=> b!1009687 m!934211))

(assert (=> b!1009685 m!934201))

(assert (=> b!1009685 m!934201))

(declare-fun m!934213 () Bool)

(assert (=> b!1009685 m!934213))

(declare-fun m!934215 () Bool)

(assert (=> b!1009684 m!934215))

(declare-fun m!934217 () Bool)

(assert (=> b!1009679 m!934217))

(assert (=> b!1009678 m!934201))

(assert (=> b!1009678 m!934201))

(declare-fun m!934219 () Bool)

(assert (=> b!1009678 m!934219))

(declare-fun m!934221 () Bool)

(assert (=> b!1009680 m!934221))

(assert (=> b!1009680 m!934221))

(declare-fun m!934223 () Bool)

(assert (=> b!1009680 m!934223))

(declare-fun m!934225 () Bool)

(assert (=> b!1009680 m!934225))

(declare-fun m!934227 () Bool)

(assert (=> b!1009680 m!934227))

(declare-fun m!934229 () Bool)

(assert (=> start!87048 m!934229))

(declare-fun m!934231 () Bool)

(assert (=> start!87048 m!934231))

(push 1)

(assert (not b!1009688))

(assert (not b!1009687))

(assert (not b!1009682))

(assert (not b!1009684))

(assert (not b!1009680))

(assert (not b!1009690))

(assert (not b!1009678))

(assert (not b!1009691))

(assert (not start!87048))

(assert (not b!1009683))

(assert (not b!1009685))

(assert (not b!1009679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1009904 () Bool)

(declare-fun e!568161 () SeekEntryResult!9563)

(declare-fun e!568164 () SeekEntryResult!9563)

(assert (=> b!1009904 (= e!568161 e!568164)))

(declare-fun lt!446360 () (_ BitVec 64))

(declare-fun c!101904 () Bool)

(assert (=> b!1009904 (= c!101904 (or (= lt!446360 (select (arr!30631 a!3219) j!170)) (= (bvadd lt!446360 lt!446360) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009905 () Bool)

(declare-fun lt!446359 () SeekEntryResult!9563)

(assert (=> b!1009905 (and (bvsge (index!40625 lt!446359) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446359) (size!31133 a!3219)))))

(declare-fun e!568163 () Bool)

(assert (=> b!1009905 (= e!568163 (= (select (arr!30631 a!3219) (index!40625 lt!446359)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009906 () Bool)

(assert (=> b!1009906 (= e!568161 (Intermediate!9563 true index!1507 x!1245))))

(declare-fun b!1009907 () Bool)

(assert (=> b!1009907 (and (bvsge (index!40625 lt!446359) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446359) (size!31133 a!3219)))))

(declare-fun res!678412 () Bool)

(assert (=> b!1009907 (= res!678412 (= (select (arr!30631 a!3219) (index!40625 lt!446359)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009907 (=> res!678412 e!568163)))

(declare-fun b!1009908 () Bool)

(assert (=> b!1009908 (= e!568164 (Intermediate!9563 false index!1507 x!1245))))

(declare-fun b!1009909 () Bool)

(declare-fun e!568160 () Bool)

(declare-fun e!568162 () Bool)

(assert (=> b!1009909 (= e!568160 e!568162)))

(declare-fun res!678410 () Bool)

(assert (=> b!1009909 (= res!678410 (and (is-Intermediate!9563 lt!446359) (not (undefined!10375 lt!446359)) (bvslt (x!88022 lt!446359) #b01111111111111111111111111111110) (bvsge (x!88022 lt!446359) #b00000000000000000000000000000000) (bvsge (x!88022 lt!446359) x!1245)))))

(assert (=> b!1009909 (=> (not res!678410) (not e!568162))))

(declare-fun d!119915 () Bool)

(assert (=> d!119915 e!568160))

(declare-fun c!101905 () Bool)

(assert (=> d!119915 (= c!101905 (and (is-Intermediate!9563 lt!446359) (undefined!10375 lt!446359)))))

(assert (=> d!119915 (= lt!446359 e!568161)))

(declare-fun c!101906 () Bool)

(assert (=> d!119915 (= c!101906 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119915 (= lt!446360 (select (arr!30631 a!3219) index!1507))))

(assert (=> d!119915 (validMask!0 mask!3464)))

(assert (=> d!119915 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30631 a!3219) j!170) a!3219 mask!3464) lt!446359)))

(declare-fun b!1009903 () Bool)

(assert (=> b!1009903 (and (bvsge (index!40625 lt!446359) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446359) (size!31133 a!3219)))))

(declare-fun res!678411 () Bool)

(assert (=> b!1009903 (= res!678411 (= (select (arr!30631 a!3219) (index!40625 lt!446359)) (select (arr!30631 a!3219) j!170)))))

(assert (=> b!1009903 (=> res!678411 e!568163)))

(assert (=> b!1009903 (= e!568162 e!568163)))

(declare-fun b!1009910 () Bool)

(assert (=> b!1009910 (= e!568160 (bvsge (x!88022 lt!446359) #b01111111111111111111111111111110))))

(declare-fun b!1009911 () Bool)

(assert (=> b!1009911 (= e!568164 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119915 c!101906) b!1009906))

(assert (= (and d!119915 (not c!101906)) b!1009904))

(assert (= (and b!1009904 c!101904) b!1009908))

(assert (= (and b!1009904 (not c!101904)) b!1009911))

(assert (= (and d!119915 c!101905) b!1009910))

(assert (= (and d!119915 (not c!101905)) b!1009909))

(assert (= (and b!1009909 res!678410) b!1009903))

(assert (= (and b!1009903 (not res!678411)) b!1009907))

(assert (= (and b!1009907 (not res!678412)) b!1009905))

(declare-fun m!934367 () Bool)

(assert (=> b!1009907 m!934367))

(assert (=> b!1009911 m!934215))

(assert (=> b!1009911 m!934215))

(assert (=> b!1009911 m!934201))

(declare-fun m!934369 () Bool)

(assert (=> b!1009911 m!934369))

(assert (=> b!1009903 m!934367))

(declare-fun m!934371 () Bool)

(assert (=> d!119915 m!934371))

(assert (=> d!119915 m!934229))

(assert (=> b!1009905 m!934367))

(assert (=> b!1009685 d!119915))

(declare-fun d!119923 () Bool)

(assert (=> d!119923 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!87048 d!119923))

(declare-fun d!119927 () Bool)

(assert (=> d!119927 (= (array_inv!23755 a!3219) (bvsge (size!31133 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!87048 d!119927))

(declare-fun lt!446377 () SeekEntryResult!9563)

(declare-fun e!568194 () SeekEntryResult!9563)

(declare-fun b!1009965 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63623 (_ BitVec 32)) SeekEntryResult!9563)

(assert (=> b!1009965 (= e!568194 (seekKeyOrZeroReturnVacant!0 (x!88022 lt!446377) (index!40625 lt!446377) (index!40625 lt!446377) k!2224 a!3219 mask!3464))))

(declare-fun b!1009966 () Bool)

(declare-fun e!568195 () SeekEntryResult!9563)

(assert (=> b!1009966 (= e!568195 Undefined!9563)))

(declare-fun b!1009967 () Bool)

(assert (=> b!1009967 (= e!568194 (MissingZero!9563 (index!40625 lt!446377)))))

(declare-fun b!1009968 () Bool)

(declare-fun e!568193 () SeekEntryResult!9563)

(assert (=> b!1009968 (= e!568193 (Found!9563 (index!40625 lt!446377)))))

(declare-fun b!1009969 () Bool)

(assert (=> b!1009969 (= e!568195 e!568193)))

(declare-fun lt!446376 () (_ BitVec 64))

(assert (=> b!1009969 (= lt!446376 (select (arr!30631 a!3219) (index!40625 lt!446377)))))

(declare-fun c!101931 () Bool)

(assert (=> b!1009969 (= c!101931 (= lt!446376 k!2224))))

(declare-fun b!1009970 () Bool)

(declare-fun c!101929 () Bool)

(assert (=> b!1009970 (= c!101929 (= lt!446376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009970 (= e!568193 e!568194)))

(declare-fun d!119929 () Bool)

(declare-fun lt!446378 () SeekEntryResult!9563)

(assert (=> d!119929 (and (or (is-Undefined!9563 lt!446378) (not (is-Found!9563 lt!446378)) (and (bvsge (index!40624 lt!446378) #b00000000000000000000000000000000) (bvslt (index!40624 lt!446378) (size!31133 a!3219)))) (or (is-Undefined!9563 lt!446378) (is-Found!9563 lt!446378) (not (is-MissingZero!9563 lt!446378)) (and (bvsge (index!40623 lt!446378) #b00000000000000000000000000000000) (bvslt (index!40623 lt!446378) (size!31133 a!3219)))) (or (is-Undefined!9563 lt!446378) (is-Found!9563 lt!446378) (is-MissingZero!9563 lt!446378) (not (is-MissingVacant!9563 lt!446378)) (and (bvsge (index!40626 lt!446378) #b00000000000000000000000000000000) (bvslt (index!40626 lt!446378) (size!31133 a!3219)))) (or (is-Undefined!9563 lt!446378) (ite (is-Found!9563 lt!446378) (= (select (arr!30631 a!3219) (index!40624 lt!446378)) k!2224) (ite (is-MissingZero!9563 lt!446378) (= (select (arr!30631 a!3219) (index!40623 lt!446378)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9563 lt!446378) (= (select (arr!30631 a!3219) (index!40626 lt!446378)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119929 (= lt!446378 e!568195)))

(declare-fun c!101930 () Bool)

(assert (=> d!119929 (= c!101930 (and (is-Intermediate!9563 lt!446377) (undefined!10375 lt!446377)))))

(assert (=> d!119929 (= lt!446377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119929 (validMask!0 mask!3464)))

(assert (=> d!119929 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446378)))

(assert (= (and d!119929 c!101930) b!1009966))

(assert (= (and d!119929 (not c!101930)) b!1009969))

(assert (= (and b!1009969 c!101931) b!1009968))

(assert (= (and b!1009969 (not c!101931)) b!1009970))

(assert (= (and b!1009970 c!101929) b!1009967))

(assert (= (and b!1009970 (not c!101929)) b!1009965))

(declare-fun m!934395 () Bool)

(assert (=> b!1009965 m!934395))

(declare-fun m!934397 () Bool)

(assert (=> b!1009969 m!934397))

(assert (=> d!119929 m!934229))

(declare-fun m!934399 () Bool)

(assert (=> d!119929 m!934399))

(declare-fun m!934401 () Bool)

(assert (=> d!119929 m!934401))

(declare-fun m!934403 () Bool)

(assert (=> d!119929 m!934403))

(assert (=> d!119929 m!934399))

(declare-fun m!934405 () Bool)

(assert (=> d!119929 m!934405))

(declare-fun m!934407 () Bool)

(assert (=> d!119929 m!934407))

(assert (=> b!1009687 d!119929))

(declare-fun d!119933 () Bool)

(assert (=> d!119933 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009682 d!119933))

(declare-fun b!1009972 () Bool)

(declare-fun e!568197 () SeekEntryResult!9563)

(declare-fun e!568200 () SeekEntryResult!9563)

(assert (=> b!1009972 (= e!568197 e!568200)))

(declare-fun lt!446380 () (_ BitVec 64))

(declare-fun c!101932 () Bool)

(assert (=> b!1009972 (= c!101932 (or (= lt!446380 (select (arr!30631 a!3219) j!170)) (= (bvadd lt!446380 lt!446380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009973 () Bool)

(declare-fun lt!446379 () SeekEntryResult!9563)

(assert (=> b!1009973 (and (bvsge (index!40625 lt!446379) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446379) (size!31133 a!3219)))))

(declare-fun e!568199 () Bool)

(assert (=> b!1009973 (= e!568199 (= (select (arr!30631 a!3219) (index!40625 lt!446379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009974 () Bool)

(assert (=> b!1009974 (= e!568197 (Intermediate!9563 true (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009975 () Bool)

(assert (=> b!1009975 (and (bvsge (index!40625 lt!446379) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446379) (size!31133 a!3219)))))

(declare-fun res!678425 () Bool)

(assert (=> b!1009975 (= res!678425 (= (select (arr!30631 a!3219) (index!40625 lt!446379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009975 (=> res!678425 e!568199)))

(declare-fun b!1009976 () Bool)

(assert (=> b!1009976 (= e!568200 (Intermediate!9563 false (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009977 () Bool)

(declare-fun e!568196 () Bool)

(declare-fun e!568198 () Bool)

(assert (=> b!1009977 (= e!568196 e!568198)))

(declare-fun res!678423 () Bool)

(assert (=> b!1009977 (= res!678423 (and (is-Intermediate!9563 lt!446379) (not (undefined!10375 lt!446379)) (bvslt (x!88022 lt!446379) #b01111111111111111111111111111110) (bvsge (x!88022 lt!446379) #b00000000000000000000000000000000) (bvsge (x!88022 lt!446379) #b00000000000000000000000000000000)))))

(assert (=> b!1009977 (=> (not res!678423) (not e!568198))))

(declare-fun d!119935 () Bool)

(assert (=> d!119935 e!568196))

(declare-fun c!101933 () Bool)

(assert (=> d!119935 (= c!101933 (and (is-Intermediate!9563 lt!446379) (undefined!10375 lt!446379)))))

(assert (=> d!119935 (= lt!446379 e!568197)))

(declare-fun c!101934 () Bool)

(assert (=> d!119935 (= c!101934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119935 (= lt!446380 (select (arr!30631 a!3219) (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464)))))

(assert (=> d!119935 (validMask!0 mask!3464)))

(assert (=> d!119935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) (select (arr!30631 a!3219) j!170) a!3219 mask!3464) lt!446379)))

(declare-fun b!1009971 () Bool)

(assert (=> b!1009971 (and (bvsge (index!40625 lt!446379) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446379) (size!31133 a!3219)))))

(declare-fun res!678424 () Bool)

(assert (=> b!1009971 (= res!678424 (= (select (arr!30631 a!3219) (index!40625 lt!446379)) (select (arr!30631 a!3219) j!170)))))

(assert (=> b!1009971 (=> res!678424 e!568199)))

(assert (=> b!1009971 (= e!568198 e!568199)))

(declare-fun b!1009978 () Bool)

(assert (=> b!1009978 (= e!568196 (bvsge (x!88022 lt!446379) #b01111111111111111111111111111110))))

(declare-fun b!1009979 () Bool)

(assert (=> b!1009979 (= e!568200 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30631 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119935 c!101934) b!1009974))

(assert (= (and d!119935 (not c!101934)) b!1009972))

(assert (= (and b!1009972 c!101932) b!1009976))

(assert (= (and b!1009972 (not c!101932)) b!1009979))

(assert (= (and d!119935 c!101933) b!1009978))

(assert (= (and d!119935 (not c!101933)) b!1009977))

(assert (= (and b!1009977 res!678423) b!1009971))

(assert (= (and b!1009971 (not res!678424)) b!1009975))

(assert (= (and b!1009975 (not res!678425)) b!1009973))

(declare-fun m!934409 () Bool)

(assert (=> b!1009975 m!934409))

(assert (=> b!1009979 m!934203))

(declare-fun m!934411 () Bool)

(assert (=> b!1009979 m!934411))

(assert (=> b!1009979 m!934411))

(assert (=> b!1009979 m!934201))

(declare-fun m!934413 () Bool)

(assert (=> b!1009979 m!934413))

(assert (=> b!1009971 m!934409))

(assert (=> d!119935 m!934203))

(declare-fun m!934415 () Bool)

(assert (=> d!119935 m!934415))

(assert (=> d!119935 m!934229))

(assert (=> b!1009973 m!934409))

(assert (=> b!1009683 d!119935))

(declare-fun d!119937 () Bool)

(declare-fun lt!446394 () (_ BitVec 32))

(declare-fun lt!446393 () (_ BitVec 32))

(assert (=> d!119937 (= lt!446394 (bvmul (bvxor lt!446393 (bvlshr lt!446393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119937 (= lt!446393 ((_ extract 31 0) (bvand (bvxor (select (arr!30631 a!3219) j!170) (bvlshr (select (arr!30631 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119937 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678429 (let ((h!22497 ((_ extract 31 0) (bvand (bvxor (select (arr!30631 a!3219) j!170) (bvlshr (select (arr!30631 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88031 (bvmul (bvxor h!22497 (bvlshr h!22497 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88031 (bvlshr x!88031 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678429 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678429 #b00000000000000000000000000000000))))))

(assert (=> d!119937 (= (toIndex!0 (select (arr!30631 a!3219) j!170) mask!3464) (bvand (bvxor lt!446394 (bvlshr lt!446394 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009683 d!119937))

(declare-fun d!119945 () Bool)

(declare-fun lt!446400 () (_ BitVec 32))

(assert (=> d!119945 (and (bvsge lt!446400 #b00000000000000000000000000000000) (bvslt lt!446400 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119945 (= lt!446400 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119945 (validMask!0 mask!3464)))

(assert (=> d!119945 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446400)))

(declare-fun bs!28715 () Bool)

(assert (= bs!28715 d!119945))

(declare-fun m!934429 () Bool)

(assert (=> bs!28715 m!934429))

(assert (=> bs!28715 m!934229))

(assert (=> b!1009684 d!119945))

(declare-fun d!119949 () Bool)

(declare-fun res!678446 () Bool)

(declare-fun e!568226 () Bool)

(assert (=> d!119949 (=> res!678446 e!568226)))

(assert (=> d!119949 (= res!678446 (bvsge #b00000000000000000000000000000000 (size!31133 a!3219)))))

(assert (=> d!119949 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21304) e!568226)))

(declare-fun b!1010013 () Bool)

(declare-fun e!568229 () Bool)

(declare-fun call!42398 () Bool)

(assert (=> b!1010013 (= e!568229 call!42398)))

(declare-fun b!1010014 () Bool)

(assert (=> b!1010014 (= e!568229 call!42398)))

(declare-fun b!1010015 () Bool)

(declare-fun e!568228 () Bool)

(declare-fun contains!5893 (List!21307 (_ BitVec 64)) Bool)

(assert (=> b!1010015 (= e!568228 (contains!5893 Nil!21304 (select (arr!30631 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42395 () Bool)

(declare-fun c!101942 () Bool)

(assert (=> bm!42395 (= call!42398 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101942 (Cons!21303 (select (arr!30631 a!3219) #b00000000000000000000000000000000) Nil!21304) Nil!21304)))))

(declare-fun b!1010016 () Bool)

(declare-fun e!568227 () Bool)

(assert (=> b!1010016 (= e!568226 e!568227)))

(declare-fun res!678448 () Bool)

(assert (=> b!1010016 (=> (not res!678448) (not e!568227))))

(assert (=> b!1010016 (= res!678448 (not e!568228))))

(declare-fun res!678447 () Bool)

(assert (=> b!1010016 (=> (not res!678447) (not e!568228))))

(assert (=> b!1010016 (= res!678447 (validKeyInArray!0 (select (arr!30631 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1010017 () Bool)

(assert (=> b!1010017 (= e!568227 e!568229)))

(assert (=> b!1010017 (= c!101942 (validKeyInArray!0 (select (arr!30631 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119949 (not res!678446)) b!1010016))

(assert (= (and b!1010016 res!678447) b!1010015))

(assert (= (and b!1010016 res!678448) b!1010017))

(assert (= (and b!1010017 c!101942) b!1010013))

(assert (= (and b!1010017 (not c!101942)) b!1010014))

(assert (= (or b!1010013 b!1010014) bm!42395))

(declare-fun m!934431 () Bool)

(assert (=> b!1010015 m!934431))

(assert (=> b!1010015 m!934431))

(declare-fun m!934433 () Bool)

(assert (=> b!1010015 m!934433))

(assert (=> bm!42395 m!934431))

(declare-fun m!934435 () Bool)

(assert (=> bm!42395 m!934435))

(assert (=> b!1010016 m!934431))

(assert (=> b!1010016 m!934431))

(declare-fun m!934437 () Bool)

(assert (=> b!1010016 m!934437))

(assert (=> b!1010017 m!934431))

(assert (=> b!1010017 m!934431))

(assert (=> b!1010017 m!934437))

(assert (=> b!1009690 d!119949))

(declare-fun b!1010019 () Bool)

(declare-fun e!568231 () SeekEntryResult!9563)

(declare-fun e!568234 () SeekEntryResult!9563)

(assert (=> b!1010019 (= e!568231 e!568234)))

(declare-fun c!101943 () Bool)

(declare-fun lt!446408 () (_ BitVec 64))

(assert (=> b!1010019 (= c!101943 (or (= lt!446408 lt!446260) (= (bvadd lt!446408 lt!446408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010020 () Bool)

(declare-fun lt!446407 () SeekEntryResult!9563)

(assert (=> b!1010020 (and (bvsge (index!40625 lt!446407) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446407) (size!31133 lt!446264)))))

(declare-fun e!568233 () Bool)

(assert (=> b!1010020 (= e!568233 (= (select (arr!30631 lt!446264) (index!40625 lt!446407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010021 () Bool)

(assert (=> b!1010021 (= e!568231 (Intermediate!9563 true (toIndex!0 lt!446260 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010022 () Bool)

(assert (=> b!1010022 (and (bvsge (index!40625 lt!446407) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446407) (size!31133 lt!446264)))))

(declare-fun res!678451 () Bool)

(assert (=> b!1010022 (= res!678451 (= (select (arr!30631 lt!446264) (index!40625 lt!446407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010022 (=> res!678451 e!568233)))

(declare-fun b!1010023 () Bool)

(assert (=> b!1010023 (= e!568234 (Intermediate!9563 false (toIndex!0 lt!446260 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1010024 () Bool)

(declare-fun e!568230 () Bool)

(declare-fun e!568232 () Bool)

(assert (=> b!1010024 (= e!568230 e!568232)))

(declare-fun res!678449 () Bool)

(assert (=> b!1010024 (= res!678449 (and (is-Intermediate!9563 lt!446407) (not (undefined!10375 lt!446407)) (bvslt (x!88022 lt!446407) #b01111111111111111111111111111110) (bvsge (x!88022 lt!446407) #b00000000000000000000000000000000) (bvsge (x!88022 lt!446407) #b00000000000000000000000000000000)))))

(assert (=> b!1010024 (=> (not res!678449) (not e!568232))))

(declare-fun d!119951 () Bool)

(assert (=> d!119951 e!568230))

(declare-fun c!101944 () Bool)

(assert (=> d!119951 (= c!101944 (and (is-Intermediate!9563 lt!446407) (undefined!10375 lt!446407)))))

(assert (=> d!119951 (= lt!446407 e!568231)))

(declare-fun c!101945 () Bool)

(assert (=> d!119951 (= c!101945 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119951 (= lt!446408 (select (arr!30631 lt!446264) (toIndex!0 lt!446260 mask!3464)))))

(assert (=> d!119951 (validMask!0 mask!3464)))

(assert (=> d!119951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446260 mask!3464) lt!446260 lt!446264 mask!3464) lt!446407)))

(declare-fun b!1010018 () Bool)

(assert (=> b!1010018 (and (bvsge (index!40625 lt!446407) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446407) (size!31133 lt!446264)))))

(declare-fun res!678450 () Bool)

(assert (=> b!1010018 (= res!678450 (= (select (arr!30631 lt!446264) (index!40625 lt!446407)) lt!446260))))

(assert (=> b!1010018 (=> res!678450 e!568233)))

(assert (=> b!1010018 (= e!568232 e!568233)))

(declare-fun b!1010025 () Bool)

(assert (=> b!1010025 (= e!568230 (bvsge (x!88022 lt!446407) #b01111111111111111111111111111110))))

(declare-fun b!1010026 () Bool)

(assert (=> b!1010026 (= e!568234 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!446260 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446260 lt!446264 mask!3464))))

(assert (= (and d!119951 c!101945) b!1010021))

(assert (= (and d!119951 (not c!101945)) b!1010019))

(assert (= (and b!1010019 c!101943) b!1010023))

(assert (= (and b!1010019 (not c!101943)) b!1010026))

(assert (= (and d!119951 c!101944) b!1010025))

(assert (= (and d!119951 (not c!101944)) b!1010024))

(assert (= (and b!1010024 res!678449) b!1010018))

(assert (= (and b!1010018 (not res!678450)) b!1010022))

(assert (= (and b!1010022 (not res!678451)) b!1010020))

(declare-fun m!934439 () Bool)

(assert (=> b!1010022 m!934439))

(assert (=> b!1010026 m!934221))

(declare-fun m!934441 () Bool)

(assert (=> b!1010026 m!934441))

(assert (=> b!1010026 m!934441))

(declare-fun m!934443 () Bool)

(assert (=> b!1010026 m!934443))

(assert (=> b!1010018 m!934439))

(assert (=> d!119951 m!934221))

(declare-fun m!934445 () Bool)

(assert (=> d!119951 m!934445))

(assert (=> d!119951 m!934229))

(assert (=> b!1010020 m!934439))

(assert (=> b!1009680 d!119951))

(declare-fun d!119953 () Bool)

(declare-fun lt!446413 () (_ BitVec 32))

(declare-fun lt!446412 () (_ BitVec 32))

(assert (=> d!119953 (= lt!446413 (bvmul (bvxor lt!446412 (bvlshr lt!446412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119953 (= lt!446412 ((_ extract 31 0) (bvand (bvxor lt!446260 (bvlshr lt!446260 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119953 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678429 (let ((h!22497 ((_ extract 31 0) (bvand (bvxor lt!446260 (bvlshr lt!446260 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88031 (bvmul (bvxor h!22497 (bvlshr h!22497 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88031 (bvlshr x!88031 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678429 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678429 #b00000000000000000000000000000000))))))

(assert (=> d!119953 (= (toIndex!0 lt!446260 mask!3464) (bvand (bvxor lt!446413 (bvlshr lt!446413 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009680 d!119953))

(declare-fun d!119955 () Bool)

(declare-fun res!678461 () Bool)

(declare-fun e!568247 () Bool)

(assert (=> d!119955 (=> res!678461 e!568247)))

(assert (=> d!119955 (= res!678461 (= (select (arr!30631 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119955 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568247)))

(declare-fun b!1010044 () Bool)

(declare-fun e!568248 () Bool)

(assert (=> b!1010044 (= e!568247 e!568248)))

(declare-fun res!678462 () Bool)

(assert (=> b!1010044 (=> (not res!678462) (not e!568248))))

(assert (=> b!1010044 (= res!678462 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31133 a!3219)))))

(declare-fun b!1010045 () Bool)

(assert (=> b!1010045 (= e!568248 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119955 (not res!678461)) b!1010044))

(assert (= (and b!1010044 res!678462) b!1010045))

(assert (=> d!119955 m!934431))

(declare-fun m!934465 () Bool)

(assert (=> b!1010045 m!934465))

(assert (=> b!1009691 d!119955))

(declare-fun b!1010047 () Bool)

(declare-fun e!568250 () SeekEntryResult!9563)

(declare-fun e!568253 () SeekEntryResult!9563)

(assert (=> b!1010047 (= e!568250 e!568253)))

(declare-fun c!101950 () Bool)

(declare-fun lt!446419 () (_ BitVec 64))

(assert (=> b!1010047 (= c!101950 (or (= lt!446419 lt!446260) (= (bvadd lt!446419 lt!446419) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1010048 () Bool)

(declare-fun lt!446418 () SeekEntryResult!9563)

(assert (=> b!1010048 (and (bvsge (index!40625 lt!446418) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446418) (size!31133 lt!446264)))))

(declare-fun e!568252 () Bool)

(assert (=> b!1010048 (= e!568252 (= (select (arr!30631 lt!446264) (index!40625 lt!446418)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1010049 () Bool)

(assert (=> b!1010049 (= e!568250 (Intermediate!9563 true index!1507 x!1245))))

(declare-fun b!1010050 () Bool)

(assert (=> b!1010050 (and (bvsge (index!40625 lt!446418) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446418) (size!31133 lt!446264)))))

(declare-fun res!678465 () Bool)

(assert (=> b!1010050 (= res!678465 (= (select (arr!30631 lt!446264) (index!40625 lt!446418)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1010050 (=> res!678465 e!568252)))

(declare-fun b!1010051 () Bool)

(assert (=> b!1010051 (= e!568253 (Intermediate!9563 false index!1507 x!1245))))

(declare-fun b!1010052 () Bool)

(declare-fun e!568249 () Bool)

(declare-fun e!568251 () Bool)

(assert (=> b!1010052 (= e!568249 e!568251)))

(declare-fun res!678463 () Bool)

(assert (=> b!1010052 (= res!678463 (and (is-Intermediate!9563 lt!446418) (not (undefined!10375 lt!446418)) (bvslt (x!88022 lt!446418) #b01111111111111111111111111111110) (bvsge (x!88022 lt!446418) #b00000000000000000000000000000000) (bvsge (x!88022 lt!446418) x!1245)))))

(assert (=> b!1010052 (=> (not res!678463) (not e!568251))))

(declare-fun d!119967 () Bool)

(assert (=> d!119967 e!568249))

(declare-fun c!101951 () Bool)

(assert (=> d!119967 (= c!101951 (and (is-Intermediate!9563 lt!446418) (undefined!10375 lt!446418)))))

(assert (=> d!119967 (= lt!446418 e!568250)))

(declare-fun c!101952 () Bool)

(assert (=> d!119967 (= c!101952 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119967 (= lt!446419 (select (arr!30631 lt!446264) index!1507))))

(assert (=> d!119967 (validMask!0 mask!3464)))

(assert (=> d!119967 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446260 lt!446264 mask!3464) lt!446418)))

(declare-fun b!1010046 () Bool)

(assert (=> b!1010046 (and (bvsge (index!40625 lt!446418) #b00000000000000000000000000000000) (bvslt (index!40625 lt!446418) (size!31133 lt!446264)))))

(declare-fun res!678464 () Bool)

(assert (=> b!1010046 (= res!678464 (= (select (arr!30631 lt!446264) (index!40625 lt!446418)) lt!446260))))

(assert (=> b!1010046 (=> res!678464 e!568252)))

(assert (=> b!1010046 (= e!568251 e!568252)))

(declare-fun b!1010053 () Bool)

(assert (=> b!1010053 (= e!568249 (bvsge (x!88022 lt!446418) #b01111111111111111111111111111110))))

(declare-fun b!1010054 () Bool)

(assert (=> b!1010054 (= e!568253 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446260 lt!446264 mask!3464))))

(assert (= (and d!119967 c!101952) b!1010049))

(assert (= (and d!119967 (not c!101952)) b!1010047))

(assert (= (and b!1010047 c!101950) b!1010051))

(assert (= (and b!1010047 (not c!101950)) b!1010054))

(assert (= (and d!119967 c!101951) b!1010053))

(assert (= (and d!119967 (not c!101951)) b!1010052))

(assert (= (and b!1010052 res!678463) b!1010046))

(assert (= (and b!1010046 (not res!678464)) b!1010050))

(assert (= (and b!1010050 (not res!678465)) b!1010048))

(declare-fun m!934467 () Bool)

(assert (=> b!1010050 m!934467))

(assert (=> b!1010054 m!934215))

(assert (=> b!1010054 m!934215))

(declare-fun m!934469 () Bool)

(assert (=> b!1010054 m!934469))

(assert (=> b!1010046 m!934467))

(declare-fun m!934471 () Bool)

(assert (=> d!119967 m!934471))

(assert (=> d!119967 m!934229))

(assert (=> b!1010048 m!934467))

(assert (=> b!1009688 d!119967))

(declare-fun d!119969 () Bool)

(assert (=> d!119969 (= (validKeyInArray!0 (select (arr!30631 a!3219) j!170)) (and (not (= (select (arr!30631 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30631 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1009678 d!119969))

(declare-fun b!1010078 () Bool)

