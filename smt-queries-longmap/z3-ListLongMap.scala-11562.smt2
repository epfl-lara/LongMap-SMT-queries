; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135066 () Bool)

(assert start!135066)

(declare-fun b!1573832 () Bool)

(declare-fun res!1074494 () Bool)

(declare-fun e!877678 () Bool)

(assert (=> b!1573832 (=> (not res!1074494) (not e!877678))))

(declare-datatypes ((array!104978 0))(
  ( (array!104979 (arr!50659 (Array (_ BitVec 32) (_ BitVec 64))) (size!51210 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104978)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104978 (_ BitVec 32)) Bool)

(assert (=> b!1573832 (= res!1074494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1573833 () Bool)

(declare-fun res!1074496 () Bool)

(assert (=> b!1573833 (=> (not res!1074496) (not e!877678))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573833 (= res!1074496 (validKeyInArray!0 k0!2731))))

(declare-fun b!1573834 () Bool)

(declare-fun res!1074493 () Bool)

(assert (=> b!1573834 (=> (not res!1074493) (not e!877678))))

(assert (=> b!1573834 (= res!1074493 (= (size!51210 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573835 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!13490 0))(
  ( (MissingZero!13490 (index!56358 (_ BitVec 32))) (Found!13490 (index!56359 (_ BitVec 32))) (Intermediate!13490 (undefined!14302 Bool) (index!56360 (_ BitVec 32)) (x!141267 (_ BitVec 32))) (Undefined!13490) (MissingVacant!13490 (index!56361 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!104978 (_ BitVec 32)) SeekEntryResult!13490)

(assert (=> b!1573835 (= e!877678 ((_ is Found!13490) (seekEntry!0 k0!2731 a!3462 mask!4043)))))

(declare-fun res!1074497 () Bool)

(assert (=> start!135066 (=> (not res!1074497) (not e!877678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135066 (= res!1074497 (validMask!0 mask!4043))))

(assert (=> start!135066 e!877678))

(assert (=> start!135066 true))

(declare-fun array_inv!39614 (array!104978) Bool)

(assert (=> start!135066 (array_inv!39614 a!3462)))

(declare-fun b!1573836 () Bool)

(declare-fun res!1074495 () Bool)

(assert (=> b!1573836 (=> (not res!1074495) (not e!877678))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104978 (_ BitVec 32)) SeekEntryResult!13490)

(assert (=> b!1573836 (= res!1074495 (not ((_ is Found!13490) (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))))

(assert (= (and start!135066 res!1074497) b!1573834))

(assert (= (and b!1573834 res!1074493) b!1573832))

(assert (= (and b!1573832 res!1074494) b!1573833))

(assert (= (and b!1573833 res!1074496) b!1573836))

(assert (= (and b!1573836 res!1074495) b!1573835))

(declare-fun m!1447617 () Bool)

(assert (=> start!135066 m!1447617))

(declare-fun m!1447619 () Bool)

(assert (=> start!135066 m!1447619))

(declare-fun m!1447621 () Bool)

(assert (=> b!1573832 m!1447621))

(declare-fun m!1447623 () Bool)

(assert (=> b!1573833 m!1447623))

(declare-fun m!1447625 () Bool)

(assert (=> b!1573836 m!1447625))

(declare-fun m!1447627 () Bool)

(assert (=> b!1573835 m!1447627))

(check-sat (not start!135066) (not b!1573832) (not b!1573835) (not b!1573833) (not b!1573836))
(check-sat)
(get-model)

(declare-fun b!1573891 () Bool)

(declare-fun e!877708 () SeekEntryResult!13490)

(declare-fun lt!674487 () SeekEntryResult!13490)

(assert (=> b!1573891 (= e!877708 (MissingZero!13490 (index!56360 lt!674487)))))

(declare-fun b!1573892 () Bool)

(declare-fun e!877709 () SeekEntryResult!13490)

(assert (=> b!1573892 (= e!877709 Undefined!13490)))

(declare-fun b!1573893 () Bool)

(declare-fun e!877707 () SeekEntryResult!13490)

(assert (=> b!1573893 (= e!877709 e!877707)))

(declare-fun lt!674489 () (_ BitVec 64))

(assert (=> b!1573893 (= lt!674489 (select (arr!50659 a!3462) (index!56360 lt!674487)))))

(declare-fun c!145928 () Bool)

(assert (=> b!1573893 (= c!145928 (= lt!674489 k0!2731))))

(declare-fun b!1573895 () Bool)

(declare-fun c!145926 () Bool)

(assert (=> b!1573895 (= c!145926 (= lt!674489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573895 (= e!877707 e!877708)))

(declare-fun b!1573896 () Bool)

(declare-fun lt!674488 () SeekEntryResult!13490)

(assert (=> b!1573896 (= e!877708 (ite ((_ is MissingVacant!13490) lt!674488) (MissingZero!13490 (index!56361 lt!674488)) lt!674488))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104978 (_ BitVec 32)) SeekEntryResult!13490)

(assert (=> b!1573896 (= lt!674488 (seekKeyOrZeroReturnVacant!0 (x!141267 lt!674487) (index!56360 lt!674487) (index!56360 lt!674487) k0!2731 a!3462 mask!4043))))

(declare-fun d!165229 () Bool)

(declare-fun lt!674490 () SeekEntryResult!13490)

(assert (=> d!165229 (and (or ((_ is MissingVacant!13490) lt!674490) (not ((_ is Found!13490) lt!674490)) (and (bvsge (index!56359 lt!674490) #b00000000000000000000000000000000) (bvslt (index!56359 lt!674490) (size!51210 a!3462)))) (not ((_ is MissingVacant!13490) lt!674490)) (or (not ((_ is Found!13490) lt!674490)) (= (select (arr!50659 a!3462) (index!56359 lt!674490)) k0!2731)))))

(assert (=> d!165229 (= lt!674490 e!877709)))

(declare-fun c!145927 () Bool)

(assert (=> d!165229 (= c!145927 (and ((_ is Intermediate!13490) lt!674487) (undefined!14302 lt!674487)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104978 (_ BitVec 32)) SeekEntryResult!13490)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165229 (= lt!674487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!165229 (validMask!0 mask!4043)))

(assert (=> d!165229 (= (seekEntry!0 k0!2731 a!3462 mask!4043) lt!674490)))

(declare-fun b!1573894 () Bool)

(assert (=> b!1573894 (= e!877707 (Found!13490 (index!56360 lt!674487)))))

(assert (= (and d!165229 c!145927) b!1573892))

(assert (= (and d!165229 (not c!145927)) b!1573893))

(assert (= (and b!1573893 c!145928) b!1573894))

(assert (= (and b!1573893 (not c!145928)) b!1573895))

(assert (= (and b!1573895 c!145926) b!1573891))

(assert (= (and b!1573895 (not c!145926)) b!1573896))

(declare-fun m!1447665 () Bool)

(assert (=> b!1573893 m!1447665))

(declare-fun m!1447667 () Bool)

(assert (=> b!1573896 m!1447667))

(declare-fun m!1447669 () Bool)

(assert (=> d!165229 m!1447669))

(declare-fun m!1447671 () Bool)

(assert (=> d!165229 m!1447671))

(assert (=> d!165229 m!1447671))

(declare-fun m!1447673 () Bool)

(assert (=> d!165229 m!1447673))

(assert (=> d!165229 m!1447617))

(assert (=> b!1573835 d!165229))

(declare-fun b!1573957 () Bool)

(declare-fun e!877743 () SeekEntryResult!13490)

(declare-fun lt!674528 () SeekEntryResult!13490)

(assert (=> b!1573957 (= e!877743 (MissingZero!13490 (index!56360 lt!674528)))))

(declare-fun b!1573958 () Bool)

(assert (=> b!1573958 (= e!877743 (seekKeyOrZeroReturnVacant!0 (x!141267 lt!674528) (index!56360 lt!674528) (index!56360 lt!674528) k0!2731 a!3462 mask!4043))))

(declare-fun b!1573959 () Bool)

(declare-fun e!877744 () SeekEntryResult!13490)

(assert (=> b!1573959 (= e!877744 (Found!13490 (index!56360 lt!674528)))))

(declare-fun b!1573960 () Bool)

(declare-fun e!877745 () SeekEntryResult!13490)

(assert (=> b!1573960 (= e!877745 Undefined!13490)))

(declare-fun b!1573962 () Bool)

(assert (=> b!1573962 (= e!877745 e!877744)))

(declare-fun lt!674527 () (_ BitVec 64))

(assert (=> b!1573962 (= lt!674527 (select (arr!50659 a!3462) (index!56360 lt!674528)))))

(declare-fun c!145958 () Bool)

(assert (=> b!1573962 (= c!145958 (= lt!674527 k0!2731))))

(declare-fun d!165237 () Bool)

(declare-fun lt!674529 () SeekEntryResult!13490)

(assert (=> d!165237 (and (or ((_ is Undefined!13490) lt!674529) (not ((_ is Found!13490) lt!674529)) (and (bvsge (index!56359 lt!674529) #b00000000000000000000000000000000) (bvslt (index!56359 lt!674529) (size!51210 a!3462)))) (or ((_ is Undefined!13490) lt!674529) ((_ is Found!13490) lt!674529) (not ((_ is MissingZero!13490) lt!674529)) (and (bvsge (index!56358 lt!674529) #b00000000000000000000000000000000) (bvslt (index!56358 lt!674529) (size!51210 a!3462)))) (or ((_ is Undefined!13490) lt!674529) ((_ is Found!13490) lt!674529) ((_ is MissingZero!13490) lt!674529) (not ((_ is MissingVacant!13490) lt!674529)) (and (bvsge (index!56361 lt!674529) #b00000000000000000000000000000000) (bvslt (index!56361 lt!674529) (size!51210 a!3462)))) (or ((_ is Undefined!13490) lt!674529) (ite ((_ is Found!13490) lt!674529) (= (select (arr!50659 a!3462) (index!56359 lt!674529)) k0!2731) (ite ((_ is MissingZero!13490) lt!674529) (= (select (arr!50659 a!3462) (index!56358 lt!674529)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13490) lt!674529) (= (select (arr!50659 a!3462) (index!56361 lt!674529)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!165237 (= lt!674529 e!877745)))

(declare-fun c!145956 () Bool)

(assert (=> d!165237 (= c!145956 (and ((_ is Intermediate!13490) lt!674528) (undefined!14302 lt!674528)))))

(assert (=> d!165237 (= lt!674528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!165237 (validMask!0 mask!4043)))

(assert (=> d!165237 (= (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043) lt!674529)))

(declare-fun b!1573961 () Bool)

(declare-fun c!145957 () Bool)

(assert (=> b!1573961 (= c!145957 (= lt!674527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573961 (= e!877744 e!877743)))

(assert (= (and d!165237 c!145956) b!1573960))

(assert (= (and d!165237 (not c!145956)) b!1573962))

(assert (= (and b!1573962 c!145958) b!1573959))

(assert (= (and b!1573962 (not c!145958)) b!1573961))

(assert (= (and b!1573961 c!145957) b!1573957))

(assert (= (and b!1573961 (not c!145957)) b!1573958))

(declare-fun m!1447711 () Bool)

(assert (=> b!1573958 m!1447711))

(declare-fun m!1447713 () Bool)

(assert (=> b!1573962 m!1447713))

(assert (=> d!165237 m!1447671))

(assert (=> d!165237 m!1447673))

(assert (=> d!165237 m!1447617))

(declare-fun m!1447715 () Bool)

(assert (=> d!165237 m!1447715))

(assert (=> d!165237 m!1447671))

(declare-fun m!1447717 () Bool)

(assert (=> d!165237 m!1447717))

(declare-fun m!1447719 () Bool)

(assert (=> d!165237 m!1447719))

(assert (=> b!1573836 d!165237))

(declare-fun d!165245 () Bool)

(assert (=> d!165245 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!135066 d!165245))

(declare-fun d!165257 () Bool)

(assert (=> d!165257 (= (array_inv!39614 a!3462) (bvsge (size!51210 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!135066 d!165257))

(declare-fun b!1573995 () Bool)

(declare-fun e!877765 () Bool)

(declare-fun call!72521 () Bool)

(assert (=> b!1573995 (= e!877765 call!72521)))

(declare-fun b!1573996 () Bool)

(declare-fun e!877764 () Bool)

(assert (=> b!1573996 (= e!877764 call!72521)))

(declare-fun bm!72518 () Bool)

(assert (=> bm!72518 (= call!72521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun d!165259 () Bool)

(declare-fun res!1074545 () Bool)

(declare-fun e!877766 () Bool)

(assert (=> d!165259 (=> res!1074545 e!877766)))

(assert (=> d!165259 (= res!1074545 (bvsge #b00000000000000000000000000000000 (size!51210 a!3462)))))

(assert (=> d!165259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!877766)))

(declare-fun b!1573997 () Bool)

(assert (=> b!1573997 (= e!877765 e!877764)))

(declare-fun lt!674550 () (_ BitVec 64))

(assert (=> b!1573997 (= lt!674550 (select (arr!50659 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!52021 0))(
  ( (Unit!52022) )
))
(declare-fun lt!674551 () Unit!52021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104978 (_ BitVec 64) (_ BitVec 32)) Unit!52021)

(assert (=> b!1573997 (= lt!674551 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!674550 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573997 (arrayContainsKey!0 a!3462 lt!674550 #b00000000000000000000000000000000)))

(declare-fun lt!674552 () Unit!52021)

(assert (=> b!1573997 (= lt!674552 lt!674551)))

(declare-fun res!1074544 () Bool)

(assert (=> b!1573997 (= res!1074544 (= (seekEntryOrOpen!0 (select (arr!50659 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13490 #b00000000000000000000000000000000)))))

(assert (=> b!1573997 (=> (not res!1074544) (not e!877764))))

(declare-fun b!1573998 () Bool)

(assert (=> b!1573998 (= e!877766 e!877765)))

(declare-fun c!145973 () Bool)

(assert (=> b!1573998 (= c!145973 (validKeyInArray!0 (select (arr!50659 a!3462) #b00000000000000000000000000000000)))))

(assert (= (and d!165259 (not res!1074545)) b!1573998))

(assert (= (and b!1573998 c!145973) b!1573997))

(assert (= (and b!1573998 (not c!145973)) b!1573995))

(assert (= (and b!1573997 res!1074544) b!1573996))

(assert (= (or b!1573996 b!1573995) bm!72518))

(declare-fun m!1447721 () Bool)

(assert (=> bm!72518 m!1447721))

(declare-fun m!1447723 () Bool)

(assert (=> b!1573997 m!1447723))

(declare-fun m!1447725 () Bool)

(assert (=> b!1573997 m!1447725))

(declare-fun m!1447727 () Bool)

(assert (=> b!1573997 m!1447727))

(assert (=> b!1573997 m!1447723))

(declare-fun m!1447729 () Bool)

(assert (=> b!1573997 m!1447729))

(assert (=> b!1573998 m!1447723))

(assert (=> b!1573998 m!1447723))

(declare-fun m!1447731 () Bool)

(assert (=> b!1573998 m!1447731))

(assert (=> b!1573832 d!165259))

(declare-fun d!165261 () Bool)

(assert (=> d!165261 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573833 d!165261))

(check-sat (not d!165229) (not bm!72518) (not d!165237) (not b!1573896) (not b!1573997) (not b!1573958) (not b!1573998))
(check-sat)
