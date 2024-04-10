; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122120 () Bool)

(assert start!122120)

(declare-fun b!1417113 () Bool)

(declare-fun res!952992 () Bool)

(declare-fun e!802023 () Bool)

(assert (=> b!1417113 (=> (not res!952992) (not e!802023))))

(declare-datatypes ((array!96755 0))(
  ( (array!96756 (arr!46707 (Array (_ BitVec 32) (_ BitVec 64))) (size!47257 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96755)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417113 (= res!952992 (validKeyInArray!0 (select (arr!46707 a!2901) j!112)))))

(declare-fun res!952993 () Bool)

(assert (=> start!122120 (=> (not res!952993) (not e!802023))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122120 (= res!952993 (validMask!0 mask!2840))))

(assert (=> start!122120 e!802023))

(assert (=> start!122120 true))

(declare-fun array_inv!35735 (array!96755) Bool)

(assert (=> start!122120 (array_inv!35735 a!2901)))

(declare-fun b!1417114 () Bool)

(declare-fun res!952991 () Bool)

(assert (=> b!1417114 (=> (not res!952991) (not e!802023))))

(declare-datatypes ((List!33226 0))(
  ( (Nil!33223) (Cons!33222 (h!34512 (_ BitVec 64)) (t!47920 List!33226)) )
))
(declare-fun arrayNoDuplicates!0 (array!96755 (_ BitVec 32) List!33226) Bool)

(assert (=> b!1417114 (= res!952991 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33223))))

(declare-fun b!1417115 () Bool)

(declare-fun res!952994 () Bool)

(assert (=> b!1417115 (=> (not res!952994) (not e!802023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96755 (_ BitVec 32)) Bool)

(assert (=> b!1417115 (= res!952994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417116 () Bool)

(declare-fun res!952995 () Bool)

(assert (=> b!1417116 (=> (not res!952995) (not e!802023))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417116 (= res!952995 (and (= (size!47257 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47257 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47257 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417117 () Bool)

(declare-datatypes ((SeekEntryResult!11018 0))(
  ( (MissingZero!11018 (index!46464 (_ BitVec 32))) (Found!11018 (index!46465 (_ BitVec 32))) (Intermediate!11018 (undefined!11830 Bool) (index!46466 (_ BitVec 32)) (x!128063 (_ BitVec 32))) (Undefined!11018) (MissingVacant!11018 (index!46467 (_ BitVec 32))) )
))
(declare-fun lt!625235 () SeekEntryResult!11018)

(get-info :version)

(assert (=> b!1417117 (= e!802023 (not ((_ is Intermediate!11018) lt!625235)))))

(declare-fun e!802025 () Bool)

(assert (=> b!1417117 e!802025))

(declare-fun res!952996 () Bool)

(assert (=> b!1417117 (=> (not res!952996) (not e!802025))))

(assert (=> b!1417117 (= res!952996 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48010 0))(
  ( (Unit!48011) )
))
(declare-fun lt!625236 () Unit!48010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48010)

(assert (=> b!1417117 (= lt!625236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96755 (_ BitVec 32)) SeekEntryResult!11018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417117 (= lt!625235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) (select (arr!46707 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417118 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96755 (_ BitVec 32)) SeekEntryResult!11018)

(assert (=> b!1417118 (= e!802025 (= (seekEntryOrOpen!0 (select (arr!46707 a!2901) j!112) a!2901 mask!2840) (Found!11018 j!112)))))

(declare-fun b!1417119 () Bool)

(declare-fun res!952990 () Bool)

(assert (=> b!1417119 (=> (not res!952990) (not e!802023))))

(assert (=> b!1417119 (= res!952990 (validKeyInArray!0 (select (arr!46707 a!2901) i!1037)))))

(assert (= (and start!122120 res!952993) b!1417116))

(assert (= (and b!1417116 res!952995) b!1417119))

(assert (= (and b!1417119 res!952990) b!1417113))

(assert (= (and b!1417113 res!952992) b!1417115))

(assert (= (and b!1417115 res!952994) b!1417114))

(assert (= (and b!1417114 res!952991) b!1417117))

(assert (= (and b!1417117 res!952996) b!1417118))

(declare-fun m!1307909 () Bool)

(assert (=> b!1417114 m!1307909))

(declare-fun m!1307911 () Bool)

(assert (=> b!1417118 m!1307911))

(assert (=> b!1417118 m!1307911))

(declare-fun m!1307913 () Bool)

(assert (=> b!1417118 m!1307913))

(declare-fun m!1307915 () Bool)

(assert (=> start!122120 m!1307915))

(declare-fun m!1307917 () Bool)

(assert (=> start!122120 m!1307917))

(assert (=> b!1417117 m!1307911))

(declare-fun m!1307919 () Bool)

(assert (=> b!1417117 m!1307919))

(assert (=> b!1417117 m!1307911))

(declare-fun m!1307921 () Bool)

(assert (=> b!1417117 m!1307921))

(assert (=> b!1417117 m!1307919))

(assert (=> b!1417117 m!1307911))

(declare-fun m!1307923 () Bool)

(assert (=> b!1417117 m!1307923))

(declare-fun m!1307925 () Bool)

(assert (=> b!1417117 m!1307925))

(assert (=> b!1417113 m!1307911))

(assert (=> b!1417113 m!1307911))

(declare-fun m!1307927 () Bool)

(assert (=> b!1417113 m!1307927))

(declare-fun m!1307929 () Bool)

(assert (=> b!1417115 m!1307929))

(declare-fun m!1307931 () Bool)

(assert (=> b!1417119 m!1307931))

(assert (=> b!1417119 m!1307931))

(declare-fun m!1307933 () Bool)

(assert (=> b!1417119 m!1307933))

(check-sat (not b!1417119) (not b!1417114) (not b!1417113) (not b!1417115) (not start!122120) (not b!1417118) (not b!1417117))
(check-sat)
(get-model)

(declare-fun lt!625260 () SeekEntryResult!11018)

(declare-fun b!1417165 () Bool)

(declare-fun e!802051 () SeekEntryResult!11018)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96755 (_ BitVec 32)) SeekEntryResult!11018)

(assert (=> b!1417165 (= e!802051 (seekKeyOrZeroReturnVacant!0 (x!128063 lt!625260) (index!46466 lt!625260) (index!46466 lt!625260) (select (arr!46707 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417166 () Bool)

(declare-fun c!131551 () Bool)

(declare-fun lt!625259 () (_ BitVec 64))

(assert (=> b!1417166 (= c!131551 (= lt!625259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802052 () SeekEntryResult!11018)

(assert (=> b!1417166 (= e!802052 e!802051)))

(declare-fun d!152631 () Bool)

(declare-fun lt!625258 () SeekEntryResult!11018)

(assert (=> d!152631 (and (or ((_ is Undefined!11018) lt!625258) (not ((_ is Found!11018) lt!625258)) (and (bvsge (index!46465 lt!625258) #b00000000000000000000000000000000) (bvslt (index!46465 lt!625258) (size!47257 a!2901)))) (or ((_ is Undefined!11018) lt!625258) ((_ is Found!11018) lt!625258) (not ((_ is MissingZero!11018) lt!625258)) (and (bvsge (index!46464 lt!625258) #b00000000000000000000000000000000) (bvslt (index!46464 lt!625258) (size!47257 a!2901)))) (or ((_ is Undefined!11018) lt!625258) ((_ is Found!11018) lt!625258) ((_ is MissingZero!11018) lt!625258) (not ((_ is MissingVacant!11018) lt!625258)) (and (bvsge (index!46467 lt!625258) #b00000000000000000000000000000000) (bvslt (index!46467 lt!625258) (size!47257 a!2901)))) (or ((_ is Undefined!11018) lt!625258) (ite ((_ is Found!11018) lt!625258) (= (select (arr!46707 a!2901) (index!46465 lt!625258)) (select (arr!46707 a!2901) j!112)) (ite ((_ is MissingZero!11018) lt!625258) (= (select (arr!46707 a!2901) (index!46464 lt!625258)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11018) lt!625258) (= (select (arr!46707 a!2901) (index!46467 lt!625258)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!802050 () SeekEntryResult!11018)

(assert (=> d!152631 (= lt!625258 e!802050)))

(declare-fun c!131553 () Bool)

(assert (=> d!152631 (= c!131553 (and ((_ is Intermediate!11018) lt!625260) (undefined!11830 lt!625260)))))

(assert (=> d!152631 (= lt!625260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) (select (arr!46707 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152631 (validMask!0 mask!2840)))

(assert (=> d!152631 (= (seekEntryOrOpen!0 (select (arr!46707 a!2901) j!112) a!2901 mask!2840) lt!625258)))

(declare-fun b!1417167 () Bool)

(assert (=> b!1417167 (= e!802050 Undefined!11018)))

(declare-fun b!1417168 () Bool)

(assert (=> b!1417168 (= e!802051 (MissingZero!11018 (index!46466 lt!625260)))))

(declare-fun b!1417169 () Bool)

(assert (=> b!1417169 (= e!802050 e!802052)))

(assert (=> b!1417169 (= lt!625259 (select (arr!46707 a!2901) (index!46466 lt!625260)))))

(declare-fun c!131552 () Bool)

(assert (=> b!1417169 (= c!131552 (= lt!625259 (select (arr!46707 a!2901) j!112)))))

(declare-fun b!1417170 () Bool)

(assert (=> b!1417170 (= e!802052 (Found!11018 (index!46466 lt!625260)))))

(assert (= (and d!152631 c!131553) b!1417167))

(assert (= (and d!152631 (not c!131553)) b!1417169))

(assert (= (and b!1417169 c!131552) b!1417170))

(assert (= (and b!1417169 (not c!131552)) b!1417166))

(assert (= (and b!1417166 c!131551) b!1417168))

(assert (= (and b!1417166 (not c!131551)) b!1417165))

(assert (=> b!1417165 m!1307911))

(declare-fun m!1307973 () Bool)

(assert (=> b!1417165 m!1307973))

(declare-fun m!1307975 () Bool)

(assert (=> d!152631 m!1307975))

(assert (=> d!152631 m!1307919))

(assert (=> d!152631 m!1307911))

(assert (=> d!152631 m!1307923))

(declare-fun m!1307977 () Bool)

(assert (=> d!152631 m!1307977))

(assert (=> d!152631 m!1307911))

(assert (=> d!152631 m!1307919))

(assert (=> d!152631 m!1307915))

(declare-fun m!1307979 () Bool)

(assert (=> d!152631 m!1307979))

(declare-fun m!1307981 () Bool)

(assert (=> b!1417169 m!1307981))

(assert (=> b!1417118 d!152631))

(declare-fun d!152647 () Bool)

(assert (=> d!152647 (= (validKeyInArray!0 (select (arr!46707 a!2901) j!112)) (and (not (= (select (arr!46707 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46707 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417113 d!152647))

(declare-fun d!152649 () Bool)

(assert (=> d!152649 (= (validKeyInArray!0 (select (arr!46707 a!2901) i!1037)) (and (not (= (select (arr!46707 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46707 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417119 d!152649))

(declare-fun b!1417193 () Bool)

(declare-fun e!802071 () Bool)

(declare-fun e!802072 () Bool)

(assert (=> b!1417193 (= e!802071 e!802072)))

(declare-fun c!131559 () Bool)

(assert (=> b!1417193 (= c!131559 (validKeyInArray!0 (select (arr!46707 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417194 () Bool)

(declare-fun e!802073 () Bool)

(assert (=> b!1417194 (= e!802073 e!802071)))

(declare-fun res!953036 () Bool)

(assert (=> b!1417194 (=> (not res!953036) (not e!802071))))

(declare-fun e!802070 () Bool)

(assert (=> b!1417194 (= res!953036 (not e!802070))))

(declare-fun res!953038 () Bool)

(assert (=> b!1417194 (=> (not res!953038) (not e!802070))))

(assert (=> b!1417194 (= res!953038 (validKeyInArray!0 (select (arr!46707 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417195 () Bool)

(declare-fun contains!9828 (List!33226 (_ BitVec 64)) Bool)

(assert (=> b!1417195 (= e!802070 (contains!9828 Nil!33223 (select (arr!46707 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67207 () Bool)

(declare-fun call!67210 () Bool)

(assert (=> bm!67207 (= call!67210 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131559 (Cons!33222 (select (arr!46707 a!2901) #b00000000000000000000000000000000) Nil!33223) Nil!33223)))))

(declare-fun b!1417196 () Bool)

(assert (=> b!1417196 (= e!802072 call!67210)))

(declare-fun d!152651 () Bool)

(declare-fun res!953037 () Bool)

(assert (=> d!152651 (=> res!953037 e!802073)))

(assert (=> d!152651 (= res!953037 (bvsge #b00000000000000000000000000000000 (size!47257 a!2901)))))

(assert (=> d!152651 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33223) e!802073)))

(declare-fun b!1417197 () Bool)

(assert (=> b!1417197 (= e!802072 call!67210)))

(assert (= (and d!152651 (not res!953037)) b!1417194))

(assert (= (and b!1417194 res!953038) b!1417195))

(assert (= (and b!1417194 res!953036) b!1417193))

(assert (= (and b!1417193 c!131559) b!1417197))

(assert (= (and b!1417193 (not c!131559)) b!1417196))

(assert (= (or b!1417197 b!1417196) bm!67207))

(declare-fun m!1307989 () Bool)

(assert (=> b!1417193 m!1307989))

(assert (=> b!1417193 m!1307989))

(declare-fun m!1307991 () Bool)

(assert (=> b!1417193 m!1307991))

(assert (=> b!1417194 m!1307989))

(assert (=> b!1417194 m!1307989))

(assert (=> b!1417194 m!1307991))

(assert (=> b!1417195 m!1307989))

(assert (=> b!1417195 m!1307989))

(declare-fun m!1307993 () Bool)

(assert (=> b!1417195 m!1307993))

(assert (=> bm!67207 m!1307989))

(declare-fun m!1307995 () Bool)

(assert (=> bm!67207 m!1307995))

(assert (=> b!1417114 d!152651))

(declare-fun b!1417224 () Bool)

(declare-fun e!802091 () Bool)

(declare-fun call!67213 () Bool)

(assert (=> b!1417224 (= e!802091 call!67213)))

(declare-fun bm!67210 () Bool)

(assert (=> bm!67210 (= call!67213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152655 () Bool)

(declare-fun res!953043 () Bool)

(declare-fun e!802090 () Bool)

(assert (=> d!152655 (=> res!953043 e!802090)))

(assert (=> d!152655 (= res!953043 (bvsge #b00000000000000000000000000000000 (size!47257 a!2901)))))

(assert (=> d!152655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802090)))

(declare-fun b!1417225 () Bool)

(declare-fun e!802089 () Bool)

(assert (=> b!1417225 (= e!802089 call!67213)))

(declare-fun b!1417226 () Bool)

(assert (=> b!1417226 (= e!802091 e!802089)))

(declare-fun lt!625289 () (_ BitVec 64))

(assert (=> b!1417226 (= lt!625289 (select (arr!46707 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625288 () Unit!48010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96755 (_ BitVec 64) (_ BitVec 32)) Unit!48010)

(assert (=> b!1417226 (= lt!625288 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625289 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417226 (arrayContainsKey!0 a!2901 lt!625289 #b00000000000000000000000000000000)))

(declare-fun lt!625290 () Unit!48010)

(assert (=> b!1417226 (= lt!625290 lt!625288)))

(declare-fun res!953044 () Bool)

(assert (=> b!1417226 (= res!953044 (= (seekEntryOrOpen!0 (select (arr!46707 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11018 #b00000000000000000000000000000000)))))

(assert (=> b!1417226 (=> (not res!953044) (not e!802089))))

(declare-fun b!1417227 () Bool)

(assert (=> b!1417227 (= e!802090 e!802091)))

(declare-fun c!131571 () Bool)

(assert (=> b!1417227 (= c!131571 (validKeyInArray!0 (select (arr!46707 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152655 (not res!953043)) b!1417227))

(assert (= (and b!1417227 c!131571) b!1417226))

(assert (= (and b!1417227 (not c!131571)) b!1417224))

(assert (= (and b!1417226 res!953044) b!1417225))

(assert (= (or b!1417225 b!1417224) bm!67210))

(declare-fun m!1308009 () Bool)

(assert (=> bm!67210 m!1308009))

(assert (=> b!1417226 m!1307989))

(declare-fun m!1308011 () Bool)

(assert (=> b!1417226 m!1308011))

(declare-fun m!1308013 () Bool)

(assert (=> b!1417226 m!1308013))

(assert (=> b!1417226 m!1307989))

(declare-fun m!1308017 () Bool)

(assert (=> b!1417226 m!1308017))

(assert (=> b!1417227 m!1307989))

(assert (=> b!1417227 m!1307989))

(assert (=> b!1417227 m!1307991))

(assert (=> b!1417115 d!152655))

(declare-fun d!152661 () Bool)

(assert (=> d!152661 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122120 d!152661))

(declare-fun d!152667 () Bool)

(assert (=> d!152667 (= (array_inv!35735 a!2901) (bvsge (size!47257 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122120 d!152667))

(declare-fun b!1417250 () Bool)

(declare-fun e!802107 () Bool)

(declare-fun call!67215 () Bool)

(assert (=> b!1417250 (= e!802107 call!67215)))

(declare-fun bm!67212 () Bool)

(assert (=> bm!67212 (= call!67215 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152669 () Bool)

(declare-fun res!953053 () Bool)

(declare-fun e!802106 () Bool)

(assert (=> d!152669 (=> res!953053 e!802106)))

(assert (=> d!152669 (= res!953053 (bvsge j!112 (size!47257 a!2901)))))

(assert (=> d!152669 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802106)))

(declare-fun b!1417251 () Bool)

(declare-fun e!802105 () Bool)

(assert (=> b!1417251 (= e!802105 call!67215)))

(declare-fun b!1417252 () Bool)

(assert (=> b!1417252 (= e!802107 e!802105)))

(declare-fun lt!625302 () (_ BitVec 64))

(assert (=> b!1417252 (= lt!625302 (select (arr!46707 a!2901) j!112))))

(declare-fun lt!625301 () Unit!48010)

(assert (=> b!1417252 (= lt!625301 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625302 j!112))))

(assert (=> b!1417252 (arrayContainsKey!0 a!2901 lt!625302 #b00000000000000000000000000000000)))

(declare-fun lt!625303 () Unit!48010)

(assert (=> b!1417252 (= lt!625303 lt!625301)))

(declare-fun res!953054 () Bool)

(assert (=> b!1417252 (= res!953054 (= (seekEntryOrOpen!0 (select (arr!46707 a!2901) j!112) a!2901 mask!2840) (Found!11018 j!112)))))

(assert (=> b!1417252 (=> (not res!953054) (not e!802105))))

(declare-fun b!1417253 () Bool)

(assert (=> b!1417253 (= e!802106 e!802107)))

(declare-fun c!131579 () Bool)

(assert (=> b!1417253 (= c!131579 (validKeyInArray!0 (select (arr!46707 a!2901) j!112)))))

(assert (= (and d!152669 (not res!953053)) b!1417253))

(assert (= (and b!1417253 c!131579) b!1417252))

(assert (= (and b!1417253 (not c!131579)) b!1417250))

(assert (= (and b!1417252 res!953054) b!1417251))

(assert (= (or b!1417251 b!1417250) bm!67212))

(declare-fun m!1308025 () Bool)

(assert (=> bm!67212 m!1308025))

(assert (=> b!1417252 m!1307911))

(declare-fun m!1308027 () Bool)

(assert (=> b!1417252 m!1308027))

(declare-fun m!1308029 () Bool)

(assert (=> b!1417252 m!1308029))

(assert (=> b!1417252 m!1307911))

(assert (=> b!1417252 m!1307913))

(assert (=> b!1417253 m!1307911))

(assert (=> b!1417253 m!1307911))

(assert (=> b!1417253 m!1307927))

(assert (=> b!1417117 d!152669))

(declare-fun d!152671 () Bool)

(assert (=> d!152671 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625308 () Unit!48010)

(declare-fun choose!38 (array!96755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48010)

(assert (=> d!152671 (= lt!625308 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152671 (validMask!0 mask!2840)))

(assert (=> d!152671 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625308)))

(declare-fun bs!41317 () Bool)

(assert (= bs!41317 d!152671))

(assert (=> bs!41317 m!1307925))

(declare-fun m!1308039 () Bool)

(assert (=> bs!41317 m!1308039))

(assert (=> bs!41317 m!1307915))

(assert (=> b!1417117 d!152671))

(declare-fun d!152675 () Bool)

(declare-fun e!802158 () Bool)

(assert (=> d!152675 e!802158))

(declare-fun c!131608 () Bool)

(declare-fun lt!625340 () SeekEntryResult!11018)

(assert (=> d!152675 (= c!131608 (and ((_ is Intermediate!11018) lt!625340) (undefined!11830 lt!625340)))))

(declare-fun e!802155 () SeekEntryResult!11018)

(assert (=> d!152675 (= lt!625340 e!802155)))

(declare-fun c!131607 () Bool)

(assert (=> d!152675 (= c!131607 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625341 () (_ BitVec 64))

(assert (=> d!152675 (= lt!625341 (select (arr!46707 a!2901) (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840)))))

(assert (=> d!152675 (validMask!0 mask!2840)))

(assert (=> d!152675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) (select (arr!46707 a!2901) j!112) a!2901 mask!2840) lt!625340)))

(declare-fun b!1417334 () Bool)

(declare-fun e!802157 () SeekEntryResult!11018)

(assert (=> b!1417334 (= e!802157 (Intermediate!11018 false (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417335 () Bool)

(assert (=> b!1417335 (and (bvsge (index!46466 lt!625340) #b00000000000000000000000000000000) (bvslt (index!46466 lt!625340) (size!47257 a!2901)))))

(declare-fun res!953084 () Bool)

(assert (=> b!1417335 (= res!953084 (= (select (arr!46707 a!2901) (index!46466 lt!625340)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802156 () Bool)

(assert (=> b!1417335 (=> res!953084 e!802156)))

(declare-fun b!1417336 () Bool)

(declare-fun e!802159 () Bool)

(assert (=> b!1417336 (= e!802158 e!802159)))

(declare-fun res!953085 () Bool)

(assert (=> b!1417336 (= res!953085 (and ((_ is Intermediate!11018) lt!625340) (not (undefined!11830 lt!625340)) (bvslt (x!128063 lt!625340) #b01111111111111111111111111111110) (bvsge (x!128063 lt!625340) #b00000000000000000000000000000000) (bvsge (x!128063 lt!625340) #b00000000000000000000000000000000)))))

(assert (=> b!1417336 (=> (not res!953085) (not e!802159))))

(declare-fun b!1417337 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417337 (= e!802157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46707 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417338 () Bool)

(assert (=> b!1417338 (= e!802158 (bvsge (x!128063 lt!625340) #b01111111111111111111111111111110))))

(declare-fun b!1417339 () Bool)

(assert (=> b!1417339 (= e!802155 (Intermediate!11018 true (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417340 () Bool)

(assert (=> b!1417340 (and (bvsge (index!46466 lt!625340) #b00000000000000000000000000000000) (bvslt (index!46466 lt!625340) (size!47257 a!2901)))))

(assert (=> b!1417340 (= e!802156 (= (select (arr!46707 a!2901) (index!46466 lt!625340)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1417341 () Bool)

(assert (=> b!1417341 (and (bvsge (index!46466 lt!625340) #b00000000000000000000000000000000) (bvslt (index!46466 lt!625340) (size!47257 a!2901)))))

(declare-fun res!953083 () Bool)

(assert (=> b!1417341 (= res!953083 (= (select (arr!46707 a!2901) (index!46466 lt!625340)) (select (arr!46707 a!2901) j!112)))))

(assert (=> b!1417341 (=> res!953083 e!802156)))

(assert (=> b!1417341 (= e!802159 e!802156)))

(declare-fun b!1417342 () Bool)

(assert (=> b!1417342 (= e!802155 e!802157)))

(declare-fun c!131609 () Bool)

(assert (=> b!1417342 (= c!131609 (or (= lt!625341 (select (arr!46707 a!2901) j!112)) (= (bvadd lt!625341 lt!625341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152675 c!131607) b!1417339))

(assert (= (and d!152675 (not c!131607)) b!1417342))

(assert (= (and b!1417342 c!131609) b!1417334))

(assert (= (and b!1417342 (not c!131609)) b!1417337))

(assert (= (and d!152675 c!131608) b!1417338))

(assert (= (and d!152675 (not c!131608)) b!1417336))

(assert (= (and b!1417336 res!953085) b!1417341))

(assert (= (and b!1417341 (not res!953083)) b!1417335))

(assert (= (and b!1417335 (not res!953084)) b!1417340))

(assert (=> d!152675 m!1307919))

(declare-fun m!1308061 () Bool)

(assert (=> d!152675 m!1308061))

(assert (=> d!152675 m!1307915))

(declare-fun m!1308063 () Bool)

(assert (=> b!1417341 m!1308063))

(assert (=> b!1417337 m!1307919))

(declare-fun m!1308065 () Bool)

(assert (=> b!1417337 m!1308065))

(assert (=> b!1417337 m!1308065))

(assert (=> b!1417337 m!1307911))

(declare-fun m!1308067 () Bool)

(assert (=> b!1417337 m!1308067))

(assert (=> b!1417335 m!1308063))

(assert (=> b!1417340 m!1308063))

(assert (=> b!1417117 d!152675))

(declare-fun d!152687 () Bool)

(declare-fun lt!625350 () (_ BitVec 32))

(declare-fun lt!625349 () (_ BitVec 32))

(assert (=> d!152687 (= lt!625350 (bvmul (bvxor lt!625349 (bvlshr lt!625349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152687 (= lt!625349 ((_ extract 31 0) (bvand (bvxor (select (arr!46707 a!2901) j!112) (bvlshr (select (arr!46707 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152687 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!953089 (let ((h!34516 ((_ extract 31 0) (bvand (bvxor (select (arr!46707 a!2901) j!112) (bvlshr (select (arr!46707 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128070 (bvmul (bvxor h!34516 (bvlshr h!34516 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128070 (bvlshr x!128070 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!953089 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!953089 #b00000000000000000000000000000000))))))

(assert (=> d!152687 (= (toIndex!0 (select (arr!46707 a!2901) j!112) mask!2840) (bvand (bvxor lt!625350 (bvlshr lt!625350 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417117 d!152687))

(check-sat (not b!1417253) (not bm!67210) (not bm!67212) (not b!1417252) (not b!1417194) (not b!1417226) (not b!1417195) (not b!1417193) (not bm!67207) (not d!152631) (not d!152675) (not d!152671) (not b!1417227) (not b!1417337) (not b!1417165))
(check-sat)
