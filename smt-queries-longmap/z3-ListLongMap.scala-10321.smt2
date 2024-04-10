; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121358 () Bool)

(assert start!121358)

(declare-datatypes ((array!96410 0))(
  ( (array!96411 (arr!46545 (Array (_ BitVec 32) (_ BitVec 64))) (size!47095 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96410)

(declare-datatypes ((SeekEntryResult!10856 0))(
  ( (MissingZero!10856 (index!45801 (_ BitVec 32))) (Found!10856 (index!45802 (_ BitVec 32))) (Intermediate!10856 (undefined!11668 Bool) (index!45803 (_ BitVec 32)) (x!127397 (_ BitVec 32))) (Undefined!10856) (MissingVacant!10856 (index!45804 (_ BitVec 32))) )
))
(declare-fun lt!621131 () SeekEntryResult!10856)

(declare-fun e!798118 () Bool)

(declare-fun lt!621132 () SeekEntryResult!10856)

(declare-fun lt!621129 () (_ BitVec 32))

(declare-fun b!1410356 () Bool)

(get-info :version)

(assert (=> b!1410356 (= e!798118 (or (= lt!621131 lt!621132) (not ((_ is Intermediate!10856) lt!621132)) (bvslt (x!127397 lt!621131) #b00000000000000000000000000000000) (bvsgt (x!127397 lt!621131) #b01111111111111111111111111111110) (bvslt lt!621129 #b00000000000000000000000000000000) (bvsge lt!621129 (size!47095 a!2901)) (and (bvsge (index!45803 lt!621131) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621131) (size!47095 a!2901)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96410 (_ BitVec 32)) SeekEntryResult!10856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410356 (= lt!621132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)) mask!2840))))

(declare-fun b!1410357 () Bool)

(declare-fun res!947752 () Bool)

(declare-fun e!798117 () Bool)

(assert (=> b!1410357 (=> (not res!947752) (not e!798117))))

(declare-datatypes ((List!33064 0))(
  ( (Nil!33061) (Cons!33060 (h!34329 (_ BitVec 64)) (t!47758 List!33064)) )
))
(declare-fun arrayNoDuplicates!0 (array!96410 (_ BitVec 32) List!33064) Bool)

(assert (=> b!1410357 (= res!947752 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33061))))

(declare-fun b!1410358 () Bool)

(declare-fun res!947750 () Bool)

(assert (=> b!1410358 (=> (not res!947750) (not e!798117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410358 (= res!947750 (validKeyInArray!0 (select (arr!46545 a!2901) j!112)))))

(declare-fun b!1410359 () Bool)

(declare-fun res!947748 () Bool)

(assert (=> b!1410359 (=> (not res!947748) (not e!798117))))

(assert (=> b!1410359 (= res!947748 (validKeyInArray!0 (select (arr!46545 a!2901) i!1037)))))

(declare-fun b!1410360 () Bool)

(declare-fun res!947749 () Bool)

(assert (=> b!1410360 (=> (not res!947749) (not e!798117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96410 (_ BitVec 32)) Bool)

(assert (=> b!1410360 (= res!947749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410361 () Bool)

(assert (=> b!1410361 (= e!798117 (not e!798118))))

(declare-fun res!947755 () Bool)

(assert (=> b!1410361 (=> res!947755 e!798118)))

(assert (=> b!1410361 (= res!947755 (or (not ((_ is Intermediate!10856) lt!621131)) (undefined!11668 lt!621131)))))

(declare-fun e!798119 () Bool)

(assert (=> b!1410361 e!798119))

(declare-fun res!947754 () Bool)

(assert (=> b!1410361 (=> (not res!947754) (not e!798119))))

(assert (=> b!1410361 (= res!947754 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47686 0))(
  ( (Unit!47687) )
))
(declare-fun lt!621130 () Unit!47686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47686)

(assert (=> b!1410361 (= lt!621130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410361 (= lt!621131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621129 (select (arr!46545 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410361 (= lt!621129 (toIndex!0 (select (arr!46545 a!2901) j!112) mask!2840))))

(declare-fun res!947751 () Bool)

(assert (=> start!121358 (=> (not res!947751) (not e!798117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121358 (= res!947751 (validMask!0 mask!2840))))

(assert (=> start!121358 e!798117))

(assert (=> start!121358 true))

(declare-fun array_inv!35573 (array!96410) Bool)

(assert (=> start!121358 (array_inv!35573 a!2901)))

(declare-fun b!1410362 () Bool)

(declare-fun res!947753 () Bool)

(assert (=> b!1410362 (=> (not res!947753) (not e!798117))))

(assert (=> b!1410362 (= res!947753 (and (= (size!47095 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47095 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47095 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410363 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96410 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1410363 (= e!798119 (= (seekEntryOrOpen!0 (select (arr!46545 a!2901) j!112) a!2901 mask!2840) (Found!10856 j!112)))))

(assert (= (and start!121358 res!947751) b!1410362))

(assert (= (and b!1410362 res!947753) b!1410359))

(assert (= (and b!1410359 res!947748) b!1410358))

(assert (= (and b!1410358 res!947750) b!1410360))

(assert (= (and b!1410360 res!947749) b!1410357))

(assert (= (and b!1410357 res!947752) b!1410361))

(assert (= (and b!1410361 res!947754) b!1410363))

(assert (= (and b!1410361 (not res!947755)) b!1410356))

(declare-fun m!1300039 () Bool)

(assert (=> b!1410358 m!1300039))

(assert (=> b!1410358 m!1300039))

(declare-fun m!1300041 () Bool)

(assert (=> b!1410358 m!1300041))

(assert (=> b!1410361 m!1300039))

(declare-fun m!1300043 () Bool)

(assert (=> b!1410361 m!1300043))

(assert (=> b!1410361 m!1300039))

(assert (=> b!1410361 m!1300039))

(declare-fun m!1300045 () Bool)

(assert (=> b!1410361 m!1300045))

(declare-fun m!1300047 () Bool)

(assert (=> b!1410361 m!1300047))

(declare-fun m!1300049 () Bool)

(assert (=> b!1410361 m!1300049))

(declare-fun m!1300051 () Bool)

(assert (=> b!1410360 m!1300051))

(declare-fun m!1300053 () Bool)

(assert (=> b!1410356 m!1300053))

(declare-fun m!1300055 () Bool)

(assert (=> b!1410356 m!1300055))

(assert (=> b!1410356 m!1300055))

(declare-fun m!1300057 () Bool)

(assert (=> b!1410356 m!1300057))

(assert (=> b!1410356 m!1300057))

(assert (=> b!1410356 m!1300055))

(declare-fun m!1300059 () Bool)

(assert (=> b!1410356 m!1300059))

(declare-fun m!1300061 () Bool)

(assert (=> start!121358 m!1300061))

(declare-fun m!1300063 () Bool)

(assert (=> start!121358 m!1300063))

(declare-fun m!1300065 () Bool)

(assert (=> b!1410359 m!1300065))

(assert (=> b!1410359 m!1300065))

(declare-fun m!1300067 () Bool)

(assert (=> b!1410359 m!1300067))

(assert (=> b!1410363 m!1300039))

(assert (=> b!1410363 m!1300039))

(declare-fun m!1300069 () Bool)

(assert (=> b!1410363 m!1300069))

(declare-fun m!1300071 () Bool)

(assert (=> b!1410357 m!1300071))

(check-sat (not start!121358) (not b!1410358) (not b!1410363) (not b!1410359) (not b!1410361) (not b!1410356) (not b!1410357) (not b!1410360))
(check-sat)
(get-model)

(declare-fun d!151887 () Bool)

(declare-fun res!947787 () Bool)

(declare-fun e!798141 () Bool)

(assert (=> d!151887 (=> res!947787 e!798141)))

(assert (=> d!151887 (= res!947787 (bvsge #b00000000000000000000000000000000 (size!47095 a!2901)))))

(assert (=> d!151887 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33061) e!798141)))

(declare-fun b!1410398 () Bool)

(declare-fun e!798140 () Bool)

(declare-fun e!798142 () Bool)

(assert (=> b!1410398 (= e!798140 e!798142)))

(declare-fun c!130776 () Bool)

(assert (=> b!1410398 (= c!130776 (validKeyInArray!0 (select (arr!46545 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410399 () Bool)

(declare-fun e!798143 () Bool)

(declare-fun contains!9808 (List!33064 (_ BitVec 64)) Bool)

(assert (=> b!1410399 (= e!798143 (contains!9808 Nil!33061 (select (arr!46545 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410400 () Bool)

(declare-fun call!67057 () Bool)

(assert (=> b!1410400 (= e!798142 call!67057)))

(declare-fun b!1410401 () Bool)

(assert (=> b!1410401 (= e!798142 call!67057)))

(declare-fun bm!67054 () Bool)

(assert (=> bm!67054 (= call!67057 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130776 (Cons!33060 (select (arr!46545 a!2901) #b00000000000000000000000000000000) Nil!33061) Nil!33061)))))

(declare-fun b!1410402 () Bool)

(assert (=> b!1410402 (= e!798141 e!798140)))

(declare-fun res!947786 () Bool)

(assert (=> b!1410402 (=> (not res!947786) (not e!798140))))

(assert (=> b!1410402 (= res!947786 (not e!798143))))

(declare-fun res!947788 () Bool)

(assert (=> b!1410402 (=> (not res!947788) (not e!798143))))

(assert (=> b!1410402 (= res!947788 (validKeyInArray!0 (select (arr!46545 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151887 (not res!947787)) b!1410402))

(assert (= (and b!1410402 res!947788) b!1410399))

(assert (= (and b!1410402 res!947786) b!1410398))

(assert (= (and b!1410398 c!130776) b!1410400))

(assert (= (and b!1410398 (not c!130776)) b!1410401))

(assert (= (or b!1410400 b!1410401) bm!67054))

(declare-fun m!1300107 () Bool)

(assert (=> b!1410398 m!1300107))

(assert (=> b!1410398 m!1300107))

(declare-fun m!1300109 () Bool)

(assert (=> b!1410398 m!1300109))

(assert (=> b!1410399 m!1300107))

(assert (=> b!1410399 m!1300107))

(declare-fun m!1300111 () Bool)

(assert (=> b!1410399 m!1300111))

(assert (=> bm!67054 m!1300107))

(declare-fun m!1300113 () Bool)

(assert (=> bm!67054 m!1300113))

(assert (=> b!1410402 m!1300107))

(assert (=> b!1410402 m!1300107))

(assert (=> b!1410402 m!1300109))

(assert (=> b!1410357 d!151887))

(declare-fun b!1410425 () Bool)

(declare-fun e!798159 () SeekEntryResult!10856)

(declare-fun lt!621151 () SeekEntryResult!10856)

(assert (=> b!1410425 (= e!798159 (Found!10856 (index!45803 lt!621151)))))

(declare-fun b!1410426 () Bool)

(declare-fun e!798158 () SeekEntryResult!10856)

(assert (=> b!1410426 (= e!798158 Undefined!10856)))

(declare-fun b!1410427 () Bool)

(declare-fun e!798160 () SeekEntryResult!10856)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96410 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1410427 (= e!798160 (seekKeyOrZeroReturnVacant!0 (x!127397 lt!621151) (index!45803 lt!621151) (index!45803 lt!621151) (select (arr!46545 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410428 () Bool)

(declare-fun c!130787 () Bool)

(declare-fun lt!621152 () (_ BitVec 64))

(assert (=> b!1410428 (= c!130787 (= lt!621152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410428 (= e!798159 e!798160)))

(declare-fun b!1410429 () Bool)

(assert (=> b!1410429 (= e!798160 (MissingZero!10856 (index!45803 lt!621151)))))

(declare-fun d!151889 () Bool)

(declare-fun lt!621153 () SeekEntryResult!10856)

(assert (=> d!151889 (and (or ((_ is Undefined!10856) lt!621153) (not ((_ is Found!10856) lt!621153)) (and (bvsge (index!45802 lt!621153) #b00000000000000000000000000000000) (bvslt (index!45802 lt!621153) (size!47095 a!2901)))) (or ((_ is Undefined!10856) lt!621153) ((_ is Found!10856) lt!621153) (not ((_ is MissingZero!10856) lt!621153)) (and (bvsge (index!45801 lt!621153) #b00000000000000000000000000000000) (bvslt (index!45801 lt!621153) (size!47095 a!2901)))) (or ((_ is Undefined!10856) lt!621153) ((_ is Found!10856) lt!621153) ((_ is MissingZero!10856) lt!621153) (not ((_ is MissingVacant!10856) lt!621153)) (and (bvsge (index!45804 lt!621153) #b00000000000000000000000000000000) (bvslt (index!45804 lt!621153) (size!47095 a!2901)))) (or ((_ is Undefined!10856) lt!621153) (ite ((_ is Found!10856) lt!621153) (= (select (arr!46545 a!2901) (index!45802 lt!621153)) (select (arr!46545 a!2901) j!112)) (ite ((_ is MissingZero!10856) lt!621153) (= (select (arr!46545 a!2901) (index!45801 lt!621153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10856) lt!621153) (= (select (arr!46545 a!2901) (index!45804 lt!621153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151889 (= lt!621153 e!798158)))

(declare-fun c!130785 () Bool)

(assert (=> d!151889 (= c!130785 (and ((_ is Intermediate!10856) lt!621151) (undefined!11668 lt!621151)))))

(assert (=> d!151889 (= lt!621151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46545 a!2901) j!112) mask!2840) (select (arr!46545 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151889 (validMask!0 mask!2840)))

(assert (=> d!151889 (= (seekEntryOrOpen!0 (select (arr!46545 a!2901) j!112) a!2901 mask!2840) lt!621153)))

(declare-fun b!1410430 () Bool)

(assert (=> b!1410430 (= e!798158 e!798159)))

(assert (=> b!1410430 (= lt!621152 (select (arr!46545 a!2901) (index!45803 lt!621151)))))

(declare-fun c!130786 () Bool)

(assert (=> b!1410430 (= c!130786 (= lt!621152 (select (arr!46545 a!2901) j!112)))))

(assert (= (and d!151889 c!130785) b!1410426))

(assert (= (and d!151889 (not c!130785)) b!1410430))

(assert (= (and b!1410430 c!130786) b!1410425))

(assert (= (and b!1410430 (not c!130786)) b!1410428))

(assert (= (and b!1410428 c!130787) b!1410429))

(assert (= (and b!1410428 (not c!130787)) b!1410427))

(assert (=> b!1410427 m!1300039))

(declare-fun m!1300115 () Bool)

(assert (=> b!1410427 m!1300115))

(declare-fun m!1300117 () Bool)

(assert (=> d!151889 m!1300117))

(assert (=> d!151889 m!1300039))

(assert (=> d!151889 m!1300043))

(declare-fun m!1300119 () Bool)

(assert (=> d!151889 m!1300119))

(assert (=> d!151889 m!1300061))

(assert (=> d!151889 m!1300043))

(assert (=> d!151889 m!1300039))

(declare-fun m!1300121 () Bool)

(assert (=> d!151889 m!1300121))

(declare-fun m!1300123 () Bool)

(assert (=> d!151889 m!1300123))

(declare-fun m!1300125 () Bool)

(assert (=> b!1410430 m!1300125))

(assert (=> b!1410363 d!151889))

(declare-fun d!151895 () Bool)

(assert (=> d!151895 (= (validKeyInArray!0 (select (arr!46545 a!2901) j!112)) (and (not (= (select (arr!46545 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46545 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410358 d!151895))

(declare-fun d!151897 () Bool)

(assert (=> d!151897 (= (validKeyInArray!0 (select (arr!46545 a!2901) i!1037)) (and (not (= (select (arr!46545 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46545 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410359 d!151897))

(declare-fun b!1410452 () Bool)

(declare-fun e!798177 () Bool)

(declare-fun call!67065 () Bool)

(assert (=> b!1410452 (= e!798177 call!67065)))

(declare-fun b!1410453 () Bool)

(declare-fun e!798178 () Bool)

(assert (=> b!1410453 (= e!798178 call!67065)))

(declare-fun b!1410454 () Bool)

(declare-fun e!798179 () Bool)

(assert (=> b!1410454 (= e!798179 e!798178)))

(declare-fun c!130793 () Bool)

(assert (=> b!1410454 (= c!130793 (validKeyInArray!0 (select (arr!46545 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410455 () Bool)

(assert (=> b!1410455 (= e!798178 e!798177)))

(declare-fun lt!621166 () (_ BitVec 64))

(assert (=> b!1410455 (= lt!621166 (select (arr!46545 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621167 () Unit!47686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96410 (_ BitVec 64) (_ BitVec 32)) Unit!47686)

(assert (=> b!1410455 (= lt!621167 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621166 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410455 (arrayContainsKey!0 a!2901 lt!621166 #b00000000000000000000000000000000)))

(declare-fun lt!621168 () Unit!47686)

(assert (=> b!1410455 (= lt!621168 lt!621167)))

(declare-fun res!947806 () Bool)

(assert (=> b!1410455 (= res!947806 (= (seekEntryOrOpen!0 (select (arr!46545 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10856 #b00000000000000000000000000000000)))))

(assert (=> b!1410455 (=> (not res!947806) (not e!798177))))

(declare-fun bm!67062 () Bool)

(assert (=> bm!67062 (= call!67065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151899 () Bool)

(declare-fun res!947807 () Bool)

(assert (=> d!151899 (=> res!947807 e!798179)))

(assert (=> d!151899 (= res!947807 (bvsge #b00000000000000000000000000000000 (size!47095 a!2901)))))

(assert (=> d!151899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798179)))

(assert (= (and d!151899 (not res!947807)) b!1410454))

(assert (= (and b!1410454 c!130793) b!1410455))

(assert (= (and b!1410454 (not c!130793)) b!1410453))

(assert (= (and b!1410455 res!947806) b!1410452))

(assert (= (or b!1410452 b!1410453) bm!67062))

(assert (=> b!1410454 m!1300107))

(assert (=> b!1410454 m!1300107))

(assert (=> b!1410454 m!1300109))

(assert (=> b!1410455 m!1300107))

(declare-fun m!1300135 () Bool)

(assert (=> b!1410455 m!1300135))

(declare-fun m!1300137 () Bool)

(assert (=> b!1410455 m!1300137))

(assert (=> b!1410455 m!1300107))

(declare-fun m!1300139 () Bool)

(assert (=> b!1410455 m!1300139))

(declare-fun m!1300141 () Bool)

(assert (=> bm!67062 m!1300141))

(assert (=> b!1410360 d!151899))

(declare-fun d!151905 () Bool)

(assert (=> d!151905 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121358 d!151905))

(declare-fun d!151913 () Bool)

(assert (=> d!151913 (= (array_inv!35573 a!2901) (bvsge (size!47095 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121358 d!151913))

(declare-fun b!1410487 () Bool)

(declare-fun e!798198 () Bool)

(declare-fun call!67067 () Bool)

(assert (=> b!1410487 (= e!798198 call!67067)))

(declare-fun b!1410488 () Bool)

(declare-fun e!798199 () Bool)

(assert (=> b!1410488 (= e!798199 call!67067)))

(declare-fun b!1410489 () Bool)

(declare-fun e!798200 () Bool)

(assert (=> b!1410489 (= e!798200 e!798199)))

(declare-fun c!130804 () Bool)

(assert (=> b!1410489 (= c!130804 (validKeyInArray!0 (select (arr!46545 a!2901) j!112)))))

(declare-fun b!1410490 () Bool)

(assert (=> b!1410490 (= e!798199 e!798198)))

(declare-fun lt!621181 () (_ BitVec 64))

(assert (=> b!1410490 (= lt!621181 (select (arr!46545 a!2901) j!112))))

(declare-fun lt!621182 () Unit!47686)

(assert (=> b!1410490 (= lt!621182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621181 j!112))))

(assert (=> b!1410490 (arrayContainsKey!0 a!2901 lt!621181 #b00000000000000000000000000000000)))

(declare-fun lt!621183 () Unit!47686)

(assert (=> b!1410490 (= lt!621183 lt!621182)))

(declare-fun res!947820 () Bool)

(assert (=> b!1410490 (= res!947820 (= (seekEntryOrOpen!0 (select (arr!46545 a!2901) j!112) a!2901 mask!2840) (Found!10856 j!112)))))

(assert (=> b!1410490 (=> (not res!947820) (not e!798198))))

(declare-fun bm!67064 () Bool)

(assert (=> bm!67064 (= call!67067 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151915 () Bool)

(declare-fun res!947821 () Bool)

(assert (=> d!151915 (=> res!947821 e!798200)))

(assert (=> d!151915 (= res!947821 (bvsge j!112 (size!47095 a!2901)))))

(assert (=> d!151915 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798200)))

(assert (= (and d!151915 (not res!947821)) b!1410489))

(assert (= (and b!1410489 c!130804) b!1410490))

(assert (= (and b!1410489 (not c!130804)) b!1410488))

(assert (= (and b!1410490 res!947820) b!1410487))

(assert (= (or b!1410487 b!1410488) bm!67064))

(assert (=> b!1410489 m!1300039))

(assert (=> b!1410489 m!1300039))

(assert (=> b!1410489 m!1300041))

(assert (=> b!1410490 m!1300039))

(declare-fun m!1300159 () Bool)

(assert (=> b!1410490 m!1300159))

(declare-fun m!1300161 () Bool)

(assert (=> b!1410490 m!1300161))

(assert (=> b!1410490 m!1300039))

(assert (=> b!1410490 m!1300069))

(declare-fun m!1300163 () Bool)

(assert (=> bm!67064 m!1300163))

(assert (=> b!1410361 d!151915))

(declare-fun d!151917 () Bool)

(assert (=> d!151917 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621192 () Unit!47686)

(declare-fun choose!38 (array!96410 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47686)

(assert (=> d!151917 (= lt!621192 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151917 (validMask!0 mask!2840)))

(assert (=> d!151917 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621192)))

(declare-fun bs!41118 () Bool)

(assert (= bs!41118 d!151917))

(assert (=> bs!41118 m!1300049))

(declare-fun m!1300165 () Bool)

(assert (=> bs!41118 m!1300165))

(assert (=> bs!41118 m!1300061))

(assert (=> b!1410361 d!151917))

(declare-fun b!1410548 () Bool)

(declare-fun e!798235 () SeekEntryResult!10856)

(declare-fun e!798238 () SeekEntryResult!10856)

(assert (=> b!1410548 (= e!798235 e!798238)))

(declare-fun c!130825 () Bool)

(declare-fun lt!621219 () (_ BitVec 64))

(assert (=> b!1410548 (= c!130825 (or (= lt!621219 (select (arr!46545 a!2901) j!112)) (= (bvadd lt!621219 lt!621219) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410549 () Bool)

(declare-fun e!798236 () Bool)

(declare-fun lt!621218 () SeekEntryResult!10856)

(assert (=> b!1410549 (= e!798236 (bvsge (x!127397 lt!621218) #b01111111111111111111111111111110))))

(declare-fun b!1410550 () Bool)

(assert (=> b!1410550 (= e!798235 (Intermediate!10856 true lt!621129 #b00000000000000000000000000000000))))

(declare-fun b!1410551 () Bool)

(assert (=> b!1410551 (and (bvsge (index!45803 lt!621218) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621218) (size!47095 a!2901)))))

(declare-fun res!947846 () Bool)

(assert (=> b!1410551 (= res!947846 (= (select (arr!46545 a!2901) (index!45803 lt!621218)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798237 () Bool)

(assert (=> b!1410551 (=> res!947846 e!798237)))

(declare-fun b!1410552 () Bool)

(assert (=> b!1410552 (and (bvsge (index!45803 lt!621218) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621218) (size!47095 a!2901)))))

(assert (=> b!1410552 (= e!798237 (= (select (arr!46545 a!2901) (index!45803 lt!621218)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410553 () Bool)

(assert (=> b!1410553 (= e!798238 (Intermediate!10856 false lt!621129 #b00000000000000000000000000000000))))

(declare-fun b!1410554 () Bool)

(assert (=> b!1410554 (and (bvsge (index!45803 lt!621218) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621218) (size!47095 a!2901)))))

(declare-fun res!947844 () Bool)

(assert (=> b!1410554 (= res!947844 (= (select (arr!46545 a!2901) (index!45803 lt!621218)) (select (arr!46545 a!2901) j!112)))))

(assert (=> b!1410554 (=> res!947844 e!798237)))

(declare-fun e!798239 () Bool)

(assert (=> b!1410554 (= e!798239 e!798237)))

(declare-fun d!151921 () Bool)

(assert (=> d!151921 e!798236))

(declare-fun c!130824 () Bool)

(assert (=> d!151921 (= c!130824 (and ((_ is Intermediate!10856) lt!621218) (undefined!11668 lt!621218)))))

(assert (=> d!151921 (= lt!621218 e!798235)))

(declare-fun c!130823 () Bool)

(assert (=> d!151921 (= c!130823 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151921 (= lt!621219 (select (arr!46545 a!2901) lt!621129))))

(assert (=> d!151921 (validMask!0 mask!2840)))

(assert (=> d!151921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621129 (select (arr!46545 a!2901) j!112) a!2901 mask!2840) lt!621218)))

(declare-fun b!1410555 () Bool)

(assert (=> b!1410555 (= e!798236 e!798239)))

(declare-fun res!947845 () Bool)

(assert (=> b!1410555 (= res!947845 (and ((_ is Intermediate!10856) lt!621218) (not (undefined!11668 lt!621218)) (bvslt (x!127397 lt!621218) #b01111111111111111111111111111110) (bvsge (x!127397 lt!621218) #b00000000000000000000000000000000) (bvsge (x!127397 lt!621218) #b00000000000000000000000000000000)))))

(assert (=> b!1410555 (=> (not res!947845) (not e!798239))))

(declare-fun b!1410556 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410556 (= e!798238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621129 #b00000000000000000000000000000000 mask!2840) (select (arr!46545 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151921 c!130823) b!1410550))

(assert (= (and d!151921 (not c!130823)) b!1410548))

(assert (= (and b!1410548 c!130825) b!1410553))

(assert (= (and b!1410548 (not c!130825)) b!1410556))

(assert (= (and d!151921 c!130824) b!1410549))

(assert (= (and d!151921 (not c!130824)) b!1410555))

(assert (= (and b!1410555 res!947845) b!1410554))

(assert (= (and b!1410554 (not res!947844)) b!1410551))

(assert (= (and b!1410551 (not res!947846)) b!1410552))

(declare-fun m!1300187 () Bool)

(assert (=> b!1410554 m!1300187))

(assert (=> b!1410551 m!1300187))

(declare-fun m!1300189 () Bool)

(assert (=> b!1410556 m!1300189))

(assert (=> b!1410556 m!1300189))

(assert (=> b!1410556 m!1300039))

(declare-fun m!1300191 () Bool)

(assert (=> b!1410556 m!1300191))

(assert (=> b!1410552 m!1300187))

(declare-fun m!1300193 () Bool)

(assert (=> d!151921 m!1300193))

(assert (=> d!151921 m!1300061))

(assert (=> b!1410361 d!151921))

(declare-fun d!151935 () Bool)

(declare-fun lt!621228 () (_ BitVec 32))

(declare-fun lt!621227 () (_ BitVec 32))

(assert (=> d!151935 (= lt!621228 (bvmul (bvxor lt!621227 (bvlshr lt!621227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151935 (= lt!621227 ((_ extract 31 0) (bvand (bvxor (select (arr!46545 a!2901) j!112) (bvlshr (select (arr!46545 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151935 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947849 (let ((h!34333 ((_ extract 31 0) (bvand (bvxor (select (arr!46545 a!2901) j!112) (bvlshr (select (arr!46545 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127404 (bvmul (bvxor h!34333 (bvlshr h!34333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127404 (bvlshr x!127404 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947849 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947849 #b00000000000000000000000000000000))))))

(assert (=> d!151935 (= (toIndex!0 (select (arr!46545 a!2901) j!112) mask!2840) (bvand (bvxor lt!621228 (bvlshr lt!621228 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410361 d!151935))

(declare-fun b!1410576 () Bool)

(declare-fun e!798255 () SeekEntryResult!10856)

(declare-fun e!798258 () SeekEntryResult!10856)

(assert (=> b!1410576 (= e!798255 e!798258)))

(declare-fun lt!621230 () (_ BitVec 64))

(declare-fun c!130832 () Bool)

(assert (=> b!1410576 (= c!130832 (or (= lt!621230 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621230 lt!621230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410577 () Bool)

(declare-fun e!798256 () Bool)

(declare-fun lt!621229 () SeekEntryResult!10856)

(assert (=> b!1410577 (= e!798256 (bvsge (x!127397 lt!621229) #b01111111111111111111111111111110))))

(declare-fun b!1410578 () Bool)

(assert (=> b!1410578 (= e!798255 (Intermediate!10856 true (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410579 () Bool)

(assert (=> b!1410579 (and (bvsge (index!45803 lt!621229) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621229) (size!47095 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)))))))

(declare-fun res!947861 () Bool)

(assert (=> b!1410579 (= res!947861 (= (select (arr!46545 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901))) (index!45803 lt!621229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798257 () Bool)

(assert (=> b!1410579 (=> res!947861 e!798257)))

(declare-fun b!1410580 () Bool)

(assert (=> b!1410580 (and (bvsge (index!45803 lt!621229) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621229) (size!47095 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)))))))

(assert (=> b!1410580 (= e!798257 (= (select (arr!46545 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901))) (index!45803 lt!621229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410581 () Bool)

(assert (=> b!1410581 (= e!798258 (Intermediate!10856 false (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410582 () Bool)

(assert (=> b!1410582 (and (bvsge (index!45803 lt!621229) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621229) (size!47095 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)))))))

(declare-fun res!947859 () Bool)

(assert (=> b!1410582 (= res!947859 (= (select (arr!46545 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901))) (index!45803 lt!621229)) (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1410582 (=> res!947859 e!798257)))

(declare-fun e!798259 () Bool)

(assert (=> b!1410582 (= e!798259 e!798257)))

(declare-fun d!151939 () Bool)

(assert (=> d!151939 e!798256))

(declare-fun c!130831 () Bool)

(assert (=> d!151939 (= c!130831 (and ((_ is Intermediate!10856) lt!621229) (undefined!11668 lt!621229)))))

(assert (=> d!151939 (= lt!621229 e!798255)))

(declare-fun c!130830 () Bool)

(assert (=> d!151939 (= c!130830 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151939 (= lt!621230 (select (arr!46545 (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901))) (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151939 (validMask!0 mask!2840)))

(assert (=> d!151939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)) mask!2840) lt!621229)))

(declare-fun b!1410583 () Bool)

(assert (=> b!1410583 (= e!798256 e!798259)))

(declare-fun res!947860 () Bool)

(assert (=> b!1410583 (= res!947860 (and ((_ is Intermediate!10856) lt!621229) (not (undefined!11668 lt!621229)) (bvslt (x!127397 lt!621229) #b01111111111111111111111111111110) (bvsge (x!127397 lt!621229) #b00000000000000000000000000000000) (bvsge (x!127397 lt!621229) #b00000000000000000000000000000000)))))

(assert (=> b!1410583 (=> (not res!947860) (not e!798259))))

(declare-fun b!1410584 () Bool)

(assert (=> b!1410584 (= e!798258 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96411 (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)) mask!2840))))

(assert (= (and d!151939 c!130830) b!1410578))

(assert (= (and d!151939 (not c!130830)) b!1410576))

(assert (= (and b!1410576 c!130832) b!1410581))

(assert (= (and b!1410576 (not c!130832)) b!1410584))

(assert (= (and d!151939 c!130831) b!1410577))

(assert (= (and d!151939 (not c!130831)) b!1410583))

(assert (= (and b!1410583 res!947860) b!1410582))

(assert (= (and b!1410582 (not res!947859)) b!1410579))

(assert (= (and b!1410579 (not res!947861)) b!1410580))

(declare-fun m!1300205 () Bool)

(assert (=> b!1410582 m!1300205))

(assert (=> b!1410579 m!1300205))

(assert (=> b!1410584 m!1300057))

(declare-fun m!1300207 () Bool)

(assert (=> b!1410584 m!1300207))

(assert (=> b!1410584 m!1300207))

(assert (=> b!1410584 m!1300055))

(declare-fun m!1300209 () Bool)

(assert (=> b!1410584 m!1300209))

(assert (=> b!1410580 m!1300205))

(assert (=> d!151939 m!1300057))

(declare-fun m!1300211 () Bool)

(assert (=> d!151939 m!1300211))

(assert (=> d!151939 m!1300061))

(assert (=> b!1410356 d!151939))

(declare-fun d!151943 () Bool)

(declare-fun lt!621232 () (_ BitVec 32))

(declare-fun lt!621231 () (_ BitVec 32))

(assert (=> d!151943 (= lt!621232 (bvmul (bvxor lt!621231 (bvlshr lt!621231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151943 (= lt!621231 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151943 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947849 (let ((h!34333 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127404 (bvmul (bvxor h!34333 (bvlshr h!34333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127404 (bvlshr x!127404 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947849 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947849 #b00000000000000000000000000000000))))))

(assert (=> d!151943 (= (toIndex!0 (select (store (arr!46545 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621232 (bvlshr lt!621232 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410356 d!151943))

(check-sat (not d!151917) (not bm!67064) (not b!1410454) (not b!1410399) (not b!1410427) (not b!1410489) (not b!1410455) (not b!1410556) (not b!1410398) (not d!151921) (not d!151939) (not b!1410584) (not d!151889) (not b!1410490) (not bm!67054) (not b!1410402) (not bm!67062))
(check-sat)
