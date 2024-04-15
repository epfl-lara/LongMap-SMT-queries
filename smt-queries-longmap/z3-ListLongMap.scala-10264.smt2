; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120686 () Bool)

(assert start!120686)

(declare-fun b!1404660 () Bool)

(declare-fun res!943075 () Bool)

(declare-fun e!795173 () Bool)

(assert (=> b!1404660 (=> (not res!943075) (not e!795173))))

(declare-datatypes ((array!95997 0))(
  ( (array!95998 (arr!46348 (Array (_ BitVec 32) (_ BitVec 64))) (size!46900 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95997)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404660 (= res!943075 (validKeyInArray!0 (select (arr!46348 a!2901) j!112)))))

(declare-fun b!1404661 () Bool)

(declare-fun res!943081 () Bool)

(assert (=> b!1404661 (=> (not res!943081) (not e!795173))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404661 (= res!943081 (validKeyInArray!0 (select (arr!46348 a!2901) i!1037)))))

(declare-fun b!1404662 () Bool)

(declare-fun res!943078 () Bool)

(assert (=> b!1404662 (=> (not res!943078) (not e!795173))))

(declare-datatypes ((List!32945 0))(
  ( (Nil!32942) (Cons!32941 (h!34192 (_ BitVec 64)) (t!47631 List!32945)) )
))
(declare-fun arrayNoDuplicates!0 (array!95997 (_ BitVec 32) List!32945) Bool)

(assert (=> b!1404662 (= res!943078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32942))))

(declare-fun b!1404663 () Bool)

(declare-fun res!943076 () Bool)

(assert (=> b!1404663 (=> (not res!943076) (not e!795173))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1404663 (= res!943076 (and (= (size!46900 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46900 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46900 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404664 () Bool)

(declare-fun res!943080 () Bool)

(assert (=> b!1404664 (=> (not res!943080) (not e!795173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95997 (_ BitVec 32)) Bool)

(assert (=> b!1404664 (= res!943080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404665 () Bool)

(declare-fun e!795172 () Bool)

(declare-datatypes ((SeekEntryResult!10685 0))(
  ( (MissingZero!10685 (index!45117 (_ BitVec 32))) (Found!10685 (index!45118 (_ BitVec 32))) (Intermediate!10685 (undefined!11497 Bool) (index!45119 (_ BitVec 32)) (x!126731 (_ BitVec 32))) (Undefined!10685) (MissingVacant!10685 (index!45120 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95997 (_ BitVec 32)) SeekEntryResult!10685)

(assert (=> b!1404665 (= e!795172 (= (seekEntryOrOpen!0 (select (arr!46348 a!2901) j!112) a!2901 mask!2840) (Found!10685 j!112)))))

(declare-fun res!943077 () Bool)

(assert (=> start!120686 (=> (not res!943077) (not e!795173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120686 (= res!943077 (validMask!0 mask!2840))))

(assert (=> start!120686 e!795173))

(assert (=> start!120686 true))

(declare-fun array_inv!35581 (array!95997) Bool)

(assert (=> start!120686 (array_inv!35581 a!2901)))

(declare-fun b!1404666 () Bool)

(declare-fun lt!618596 () SeekEntryResult!10685)

(get-info :version)

(assert (=> b!1404666 (= e!795173 (not (or (not ((_ is Intermediate!10685) lt!618596)) (not (undefined!11497 lt!618596)))))))

(assert (=> b!1404666 e!795172))

(declare-fun res!943079 () Bool)

(assert (=> b!1404666 (=> (not res!943079) (not e!795172))))

(assert (=> b!1404666 (= res!943079 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47187 0))(
  ( (Unit!47188) )
))
(declare-fun lt!618595 () Unit!47187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47187)

(assert (=> b!1404666 (= lt!618595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95997 (_ BitVec 32)) SeekEntryResult!10685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404666 (= lt!618596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120686 res!943077) b!1404663))

(assert (= (and b!1404663 res!943076) b!1404661))

(assert (= (and b!1404661 res!943081) b!1404660))

(assert (= (and b!1404660 res!943075) b!1404664))

(assert (= (and b!1404664 res!943080) b!1404662))

(assert (= (and b!1404662 res!943078) b!1404666))

(assert (= (and b!1404666 res!943079) b!1404665))

(declare-fun m!1292977 () Bool)

(assert (=> b!1404660 m!1292977))

(assert (=> b!1404660 m!1292977))

(declare-fun m!1292979 () Bool)

(assert (=> b!1404660 m!1292979))

(declare-fun m!1292981 () Bool)

(assert (=> start!120686 m!1292981))

(declare-fun m!1292983 () Bool)

(assert (=> start!120686 m!1292983))

(declare-fun m!1292985 () Bool)

(assert (=> b!1404662 m!1292985))

(declare-fun m!1292987 () Bool)

(assert (=> b!1404661 m!1292987))

(assert (=> b!1404661 m!1292987))

(declare-fun m!1292989 () Bool)

(assert (=> b!1404661 m!1292989))

(declare-fun m!1292991 () Bool)

(assert (=> b!1404664 m!1292991))

(assert (=> b!1404666 m!1292977))

(declare-fun m!1292993 () Bool)

(assert (=> b!1404666 m!1292993))

(assert (=> b!1404666 m!1292977))

(declare-fun m!1292995 () Bool)

(assert (=> b!1404666 m!1292995))

(assert (=> b!1404666 m!1292993))

(assert (=> b!1404666 m!1292977))

(declare-fun m!1292997 () Bool)

(assert (=> b!1404666 m!1292997))

(declare-fun m!1292999 () Bool)

(assert (=> b!1404666 m!1292999))

(assert (=> b!1404665 m!1292977))

(assert (=> b!1404665 m!1292977))

(declare-fun m!1293001 () Bool)

(assert (=> b!1404665 m!1293001))

(check-sat (not b!1404662) (not b!1404665) (not b!1404666) (not start!120686) (not b!1404661) (not b!1404664) (not b!1404660))
(check-sat)
(get-model)

(declare-fun b!1404727 () Bool)

(declare-fun e!795208 () Bool)

(declare-fun call!66913 () Bool)

(assert (=> b!1404727 (= e!795208 call!66913)))

(declare-fun b!1404728 () Bool)

(declare-fun e!795206 () Bool)

(assert (=> b!1404728 (= e!795208 e!795206)))

(declare-fun lt!618617 () (_ BitVec 64))

(assert (=> b!1404728 (= lt!618617 (select (arr!46348 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618616 () Unit!47187)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95997 (_ BitVec 64) (_ BitVec 32)) Unit!47187)

(assert (=> b!1404728 (= lt!618616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618617 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404728 (arrayContainsKey!0 a!2901 lt!618617 #b00000000000000000000000000000000)))

(declare-fun lt!618615 () Unit!47187)

(assert (=> b!1404728 (= lt!618615 lt!618616)))

(declare-fun res!943134 () Bool)

(assert (=> b!1404728 (= res!943134 (= (seekEntryOrOpen!0 (select (arr!46348 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10685 #b00000000000000000000000000000000)))))

(assert (=> b!1404728 (=> (not res!943134) (not e!795206))))

(declare-fun b!1404729 () Bool)

(assert (=> b!1404729 (= e!795206 call!66913)))

(declare-fun d!151191 () Bool)

(declare-fun res!943135 () Bool)

(declare-fun e!795207 () Bool)

(assert (=> d!151191 (=> res!943135 e!795207)))

(assert (=> d!151191 (= res!943135 (bvsge #b00000000000000000000000000000000 (size!46900 a!2901)))))

(assert (=> d!151191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795207)))

(declare-fun b!1404730 () Bool)

(assert (=> b!1404730 (= e!795207 e!795208)))

(declare-fun c!130260 () Bool)

(assert (=> b!1404730 (= c!130260 (validKeyInArray!0 (select (arr!46348 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66910 () Bool)

(assert (=> bm!66910 (= call!66913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151191 (not res!943135)) b!1404730))

(assert (= (and b!1404730 c!130260) b!1404728))

(assert (= (and b!1404730 (not c!130260)) b!1404727))

(assert (= (and b!1404728 res!943134) b!1404729))

(assert (= (or b!1404729 b!1404727) bm!66910))

(declare-fun m!1293055 () Bool)

(assert (=> b!1404728 m!1293055))

(declare-fun m!1293057 () Bool)

(assert (=> b!1404728 m!1293057))

(declare-fun m!1293059 () Bool)

(assert (=> b!1404728 m!1293059))

(assert (=> b!1404728 m!1293055))

(declare-fun m!1293061 () Bool)

(assert (=> b!1404728 m!1293061))

(assert (=> b!1404730 m!1293055))

(assert (=> b!1404730 m!1293055))

(declare-fun m!1293063 () Bool)

(assert (=> b!1404730 m!1293063))

(declare-fun m!1293065 () Bool)

(assert (=> bm!66910 m!1293065))

(assert (=> b!1404664 d!151191))

(declare-fun d!151199 () Bool)

(assert (=> d!151199 (= (validKeyInArray!0 (select (arr!46348 a!2901) j!112)) (and (not (= (select (arr!46348 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46348 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404660 d!151199))

(declare-fun b!1404776 () Bool)

(declare-fun e!795242 () SeekEntryResult!10685)

(declare-fun e!795241 () SeekEntryResult!10685)

(assert (=> b!1404776 (= e!795242 e!795241)))

(declare-fun lt!618650 () (_ BitVec 64))

(declare-fun lt!618648 () SeekEntryResult!10685)

(assert (=> b!1404776 (= lt!618650 (select (arr!46348 a!2901) (index!45119 lt!618648)))))

(declare-fun c!130277 () Bool)

(assert (=> b!1404776 (= c!130277 (= lt!618650 (select (arr!46348 a!2901) j!112)))))

(declare-fun b!1404777 () Bool)

(declare-fun e!795240 () SeekEntryResult!10685)

(assert (=> b!1404777 (= e!795240 (MissingZero!10685 (index!45119 lt!618648)))))

(declare-fun b!1404778 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95997 (_ BitVec 32)) SeekEntryResult!10685)

(assert (=> b!1404778 (= e!795240 (seekKeyOrZeroReturnVacant!0 (x!126731 lt!618648) (index!45119 lt!618648) (index!45119 lt!618648) (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404779 () Bool)

(declare-fun c!130276 () Bool)

(assert (=> b!1404779 (= c!130276 (= lt!618650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404779 (= e!795241 e!795240)))

(declare-fun d!151201 () Bool)

(declare-fun lt!618649 () SeekEntryResult!10685)

(assert (=> d!151201 (and (or ((_ is Undefined!10685) lt!618649) (not ((_ is Found!10685) lt!618649)) (and (bvsge (index!45118 lt!618649) #b00000000000000000000000000000000) (bvslt (index!45118 lt!618649) (size!46900 a!2901)))) (or ((_ is Undefined!10685) lt!618649) ((_ is Found!10685) lt!618649) (not ((_ is MissingZero!10685) lt!618649)) (and (bvsge (index!45117 lt!618649) #b00000000000000000000000000000000) (bvslt (index!45117 lt!618649) (size!46900 a!2901)))) (or ((_ is Undefined!10685) lt!618649) ((_ is Found!10685) lt!618649) ((_ is MissingZero!10685) lt!618649) (not ((_ is MissingVacant!10685) lt!618649)) (and (bvsge (index!45120 lt!618649) #b00000000000000000000000000000000) (bvslt (index!45120 lt!618649) (size!46900 a!2901)))) (or ((_ is Undefined!10685) lt!618649) (ite ((_ is Found!10685) lt!618649) (= (select (arr!46348 a!2901) (index!45118 lt!618649)) (select (arr!46348 a!2901) j!112)) (ite ((_ is MissingZero!10685) lt!618649) (= (select (arr!46348 a!2901) (index!45117 lt!618649)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10685) lt!618649) (= (select (arr!46348 a!2901) (index!45120 lt!618649)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151201 (= lt!618649 e!795242)))

(declare-fun c!130275 () Bool)

(assert (=> d!151201 (= c!130275 (and ((_ is Intermediate!10685) lt!618648) (undefined!11497 lt!618648)))))

(assert (=> d!151201 (= lt!618648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151201 (validMask!0 mask!2840)))

(assert (=> d!151201 (= (seekEntryOrOpen!0 (select (arr!46348 a!2901) j!112) a!2901 mask!2840) lt!618649)))

(declare-fun b!1404780 () Bool)

(assert (=> b!1404780 (= e!795241 (Found!10685 (index!45119 lt!618648)))))

(declare-fun b!1404781 () Bool)

(assert (=> b!1404781 (= e!795242 Undefined!10685)))

(assert (= (and d!151201 c!130275) b!1404781))

(assert (= (and d!151201 (not c!130275)) b!1404776))

(assert (= (and b!1404776 c!130277) b!1404780))

(assert (= (and b!1404776 (not c!130277)) b!1404779))

(assert (= (and b!1404779 c!130276) b!1404777))

(assert (= (and b!1404779 (not c!130276)) b!1404778))

(declare-fun m!1293101 () Bool)

(assert (=> b!1404776 m!1293101))

(assert (=> b!1404778 m!1292977))

(declare-fun m!1293103 () Bool)

(assert (=> b!1404778 m!1293103))

(assert (=> d!151201 m!1292993))

(assert (=> d!151201 m!1292977))

(assert (=> d!151201 m!1292997))

(declare-fun m!1293105 () Bool)

(assert (=> d!151201 m!1293105))

(assert (=> d!151201 m!1292977))

(assert (=> d!151201 m!1292993))

(declare-fun m!1293107 () Bool)

(assert (=> d!151201 m!1293107))

(declare-fun m!1293109 () Bool)

(assert (=> d!151201 m!1293109))

(assert (=> d!151201 m!1292981))

(assert (=> b!1404665 d!151201))

(declare-fun d!151217 () Bool)

(assert (=> d!151217 (= (validKeyInArray!0 (select (arr!46348 a!2901) i!1037)) (and (not (= (select (arr!46348 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46348 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404661 d!151217))

(declare-fun b!1404782 () Bool)

(declare-fun e!795245 () Bool)

(declare-fun call!66922 () Bool)

(assert (=> b!1404782 (= e!795245 call!66922)))

(declare-fun b!1404783 () Bool)

(declare-fun e!795243 () Bool)

(assert (=> b!1404783 (= e!795245 e!795243)))

(declare-fun lt!618653 () (_ BitVec 64))

(assert (=> b!1404783 (= lt!618653 (select (arr!46348 a!2901) j!112))))

(declare-fun lt!618652 () Unit!47187)

(assert (=> b!1404783 (= lt!618652 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618653 j!112))))

(assert (=> b!1404783 (arrayContainsKey!0 a!2901 lt!618653 #b00000000000000000000000000000000)))

(declare-fun lt!618651 () Unit!47187)

(assert (=> b!1404783 (= lt!618651 lt!618652)))

(declare-fun res!943153 () Bool)

(assert (=> b!1404783 (= res!943153 (= (seekEntryOrOpen!0 (select (arr!46348 a!2901) j!112) a!2901 mask!2840) (Found!10685 j!112)))))

(assert (=> b!1404783 (=> (not res!943153) (not e!795243))))

(declare-fun b!1404784 () Bool)

(assert (=> b!1404784 (= e!795243 call!66922)))

(declare-fun d!151219 () Bool)

(declare-fun res!943154 () Bool)

(declare-fun e!795244 () Bool)

(assert (=> d!151219 (=> res!943154 e!795244)))

(assert (=> d!151219 (= res!943154 (bvsge j!112 (size!46900 a!2901)))))

(assert (=> d!151219 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795244)))

(declare-fun b!1404785 () Bool)

(assert (=> b!1404785 (= e!795244 e!795245)))

(declare-fun c!130278 () Bool)

(assert (=> b!1404785 (= c!130278 (validKeyInArray!0 (select (arr!46348 a!2901) j!112)))))

(declare-fun bm!66919 () Bool)

(assert (=> bm!66919 (= call!66922 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151219 (not res!943154)) b!1404785))

(assert (= (and b!1404785 c!130278) b!1404783))

(assert (= (and b!1404785 (not c!130278)) b!1404782))

(assert (= (and b!1404783 res!943153) b!1404784))

(assert (= (or b!1404784 b!1404782) bm!66919))

(assert (=> b!1404783 m!1292977))

(declare-fun m!1293111 () Bool)

(assert (=> b!1404783 m!1293111))

(declare-fun m!1293113 () Bool)

(assert (=> b!1404783 m!1293113))

(assert (=> b!1404783 m!1292977))

(assert (=> b!1404783 m!1293001))

(assert (=> b!1404785 m!1292977))

(assert (=> b!1404785 m!1292977))

(assert (=> b!1404785 m!1292979))

(declare-fun m!1293115 () Bool)

(assert (=> bm!66919 m!1293115))

(assert (=> b!1404666 d!151219))

(declare-fun d!151221 () Bool)

(assert (=> d!151221 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618659 () Unit!47187)

(declare-fun choose!38 (array!95997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47187)

(assert (=> d!151221 (= lt!618659 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151221 (validMask!0 mask!2840)))

(assert (=> d!151221 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618659)))

(declare-fun bs!40902 () Bool)

(assert (= bs!40902 d!151221))

(assert (=> bs!40902 m!1292999))

(declare-fun m!1293119 () Bool)

(assert (=> bs!40902 m!1293119))

(assert (=> bs!40902 m!1292981))

(assert (=> b!1404666 d!151221))

(declare-fun d!151225 () Bool)

(declare-fun e!795293 () Bool)

(assert (=> d!151225 e!795293))

(declare-fun c!130305 () Bool)

(declare-fun lt!618686 () SeekEntryResult!10685)

(assert (=> d!151225 (= c!130305 (and ((_ is Intermediate!10685) lt!618686) (undefined!11497 lt!618686)))))

(declare-fun e!795291 () SeekEntryResult!10685)

(assert (=> d!151225 (= lt!618686 e!795291)))

(declare-fun c!130306 () Bool)

(assert (=> d!151225 (= c!130306 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!618685 () (_ BitVec 64))

(assert (=> d!151225 (= lt!618685 (select (arr!46348 a!2901) (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840)))))

(assert (=> d!151225 (validMask!0 mask!2840)))

(assert (=> d!151225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) (select (arr!46348 a!2901) j!112) a!2901 mask!2840) lt!618686)))

(declare-fun b!1404862 () Bool)

(assert (=> b!1404862 (and (bvsge (index!45119 lt!618686) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618686) (size!46900 a!2901)))))

(declare-fun res!943185 () Bool)

(assert (=> b!1404862 (= res!943185 (= (select (arr!46348 a!2901) (index!45119 lt!618686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795289 () Bool)

(assert (=> b!1404862 (=> res!943185 e!795289)))

(declare-fun b!1404863 () Bool)

(assert (=> b!1404863 (and (bvsge (index!45119 lt!618686) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618686) (size!46900 a!2901)))))

(declare-fun res!943184 () Bool)

(assert (=> b!1404863 (= res!943184 (= (select (arr!46348 a!2901) (index!45119 lt!618686)) (select (arr!46348 a!2901) j!112)))))

(assert (=> b!1404863 (=> res!943184 e!795289)))

(declare-fun e!795290 () Bool)

(assert (=> b!1404863 (= e!795290 e!795289)))

(declare-fun b!1404864 () Bool)

(assert (=> b!1404864 (and (bvsge (index!45119 lt!618686) #b00000000000000000000000000000000) (bvslt (index!45119 lt!618686) (size!46900 a!2901)))))

(assert (=> b!1404864 (= e!795289 (= (select (arr!46348 a!2901) (index!45119 lt!618686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404865 () Bool)

(assert (=> b!1404865 (= e!795293 e!795290)))

(declare-fun res!943183 () Bool)

(assert (=> b!1404865 (= res!943183 (and ((_ is Intermediate!10685) lt!618686) (not (undefined!11497 lt!618686)) (bvslt (x!126731 lt!618686) #b01111111111111111111111111111110) (bvsge (x!126731 lt!618686) #b00000000000000000000000000000000) (bvsge (x!126731 lt!618686) #b00000000000000000000000000000000)))))

(assert (=> b!1404865 (=> (not res!943183) (not e!795290))))

(declare-fun b!1404866 () Bool)

(declare-fun e!795292 () SeekEntryResult!10685)

(assert (=> b!1404866 (= e!795291 e!795292)))

(declare-fun c!130304 () Bool)

(assert (=> b!1404866 (= c!130304 (or (= lt!618685 (select (arr!46348 a!2901) j!112)) (= (bvadd lt!618685 lt!618685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404867 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404867 (= e!795292 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46348 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404868 () Bool)

(assert (=> b!1404868 (= e!795293 (bvsge (x!126731 lt!618686) #b01111111111111111111111111111110))))

(declare-fun b!1404869 () Bool)

(assert (=> b!1404869 (= e!795291 (Intermediate!10685 true (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404870 () Bool)

(assert (=> b!1404870 (= e!795292 (Intermediate!10685 false (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!151225 c!130306) b!1404869))

(assert (= (and d!151225 (not c!130306)) b!1404866))

(assert (= (and b!1404866 c!130304) b!1404870))

(assert (= (and b!1404866 (not c!130304)) b!1404867))

(assert (= (and d!151225 c!130305) b!1404868))

(assert (= (and d!151225 (not c!130305)) b!1404865))

(assert (= (and b!1404865 res!943183) b!1404863))

(assert (= (and b!1404863 (not res!943184)) b!1404862))

(assert (= (and b!1404862 (not res!943185)) b!1404864))

(declare-fun m!1293145 () Bool)

(assert (=> b!1404864 m!1293145))

(assert (=> d!151225 m!1292993))

(declare-fun m!1293147 () Bool)

(assert (=> d!151225 m!1293147))

(assert (=> d!151225 m!1292981))

(assert (=> b!1404867 m!1292993))

(declare-fun m!1293149 () Bool)

(assert (=> b!1404867 m!1293149))

(assert (=> b!1404867 m!1293149))

(assert (=> b!1404867 m!1292977))

(declare-fun m!1293151 () Bool)

(assert (=> b!1404867 m!1293151))

(assert (=> b!1404863 m!1293145))

(assert (=> b!1404862 m!1293145))

(assert (=> b!1404666 d!151225))

(declare-fun d!151239 () Bool)

(declare-fun lt!618698 () (_ BitVec 32))

(declare-fun lt!618697 () (_ BitVec 32))

(assert (=> d!151239 (= lt!618698 (bvmul (bvxor lt!618697 (bvlshr lt!618697 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151239 (= lt!618697 ((_ extract 31 0) (bvand (bvxor (select (arr!46348 a!2901) j!112) (bvlshr (select (arr!46348 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151239 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943186 (let ((h!34197 ((_ extract 31 0) (bvand (bvxor (select (arr!46348 a!2901) j!112) (bvlshr (select (arr!46348 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126739 (bvmul (bvxor h!34197 (bvlshr h!34197 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126739 (bvlshr x!126739 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943186 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943186 #b00000000000000000000000000000000))))))

(assert (=> d!151239 (= (toIndex!0 (select (arr!46348 a!2901) j!112) mask!2840) (bvand (bvxor lt!618698 (bvlshr lt!618698 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404666 d!151239))

(declare-fun d!151243 () Bool)

(assert (=> d!151243 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120686 d!151243))

(declare-fun d!151247 () Bool)

(assert (=> d!151247 (= (array_inv!35581 a!2901) (bvsge (size!46900 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120686 d!151247))

(declare-fun b!1404914 () Bool)

(declare-fun e!795324 () Bool)

(declare-fun call!66929 () Bool)

(assert (=> b!1404914 (= e!795324 call!66929)))

(declare-fun d!151249 () Bool)

(declare-fun res!943203 () Bool)

(declare-fun e!795325 () Bool)

(assert (=> d!151249 (=> res!943203 e!795325)))

(assert (=> d!151249 (= res!943203 (bvsge #b00000000000000000000000000000000 (size!46900 a!2901)))))

(assert (=> d!151249 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32942) e!795325)))

(declare-fun b!1404915 () Bool)

(declare-fun e!795326 () Bool)

(assert (=> b!1404915 (= e!795325 e!795326)))

(declare-fun res!943204 () Bool)

(assert (=> b!1404915 (=> (not res!943204) (not e!795326))))

(declare-fun e!795323 () Bool)

(assert (=> b!1404915 (= res!943204 (not e!795323))))

(declare-fun res!943202 () Bool)

(assert (=> b!1404915 (=> (not res!943202) (not e!795323))))

(assert (=> b!1404915 (= res!943202 (validKeyInArray!0 (select (arr!46348 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404916 () Bool)

(declare-fun contains!9755 (List!32945 (_ BitVec 64)) Bool)

(assert (=> b!1404916 (= e!795323 (contains!9755 Nil!32942 (select (arr!46348 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404917 () Bool)

(assert (=> b!1404917 (= e!795326 e!795324)))

(declare-fun c!130321 () Bool)

(assert (=> b!1404917 (= c!130321 (validKeyInArray!0 (select (arr!46348 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66926 () Bool)

(assert (=> bm!66926 (= call!66929 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130321 (Cons!32941 (select (arr!46348 a!2901) #b00000000000000000000000000000000) Nil!32942) Nil!32942)))))

(declare-fun b!1404918 () Bool)

(assert (=> b!1404918 (= e!795324 call!66929)))

(assert (= (and d!151249 (not res!943203)) b!1404915))

(assert (= (and b!1404915 res!943202) b!1404916))

(assert (= (and b!1404915 res!943204) b!1404917))

(assert (= (and b!1404917 c!130321) b!1404914))

(assert (= (and b!1404917 (not c!130321)) b!1404918))

(assert (= (or b!1404914 b!1404918) bm!66926))

(assert (=> b!1404915 m!1293055))

(assert (=> b!1404915 m!1293055))

(assert (=> b!1404915 m!1293063))

(assert (=> b!1404916 m!1293055))

(assert (=> b!1404916 m!1293055))

(declare-fun m!1293167 () Bool)

(assert (=> b!1404916 m!1293167))

(assert (=> b!1404917 m!1293055))

(assert (=> b!1404917 m!1293055))

(assert (=> b!1404917 m!1293063))

(assert (=> bm!66926 m!1293055))

(declare-fun m!1293169 () Bool)

(assert (=> bm!66926 m!1293169))

(assert (=> b!1404662 d!151249))

(check-sat (not b!1404783) (not d!151221) (not b!1404917) (not d!151201) (not d!151225) (not b!1404916) (not b!1404867) (not b!1404730) (not bm!66926) (not bm!66919) (not b!1404785) (not b!1404915) (not b!1404778) (not bm!66910) (not b!1404728))
(check-sat)
