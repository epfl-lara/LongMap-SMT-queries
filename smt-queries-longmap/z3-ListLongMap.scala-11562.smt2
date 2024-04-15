; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134604 () Bool)

(assert start!134604)

(declare-fun b!1571083 () Bool)

(declare-fun res!1073508 () Bool)

(declare-fun e!875971 () Bool)

(assert (=> b!1571083 (=> (not res!1073508) (not e!875971))))

(declare-datatypes ((array!104784 0))(
  ( (array!104785 (arr!50570 (Array (_ BitVec 32) (_ BitVec 64))) (size!51122 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104784)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1571083 (= res!1073508 (= (size!51122 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571084 () Bool)

(declare-fun res!1073505 () Bool)

(assert (=> b!1571084 (=> (not res!1073505) (not e!875971))))

(declare-fun k0!2731 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!13542 0))(
  ( (MissingZero!13542 (index!56566 (_ BitVec 32))) (Found!13542 (index!56567 (_ BitVec 32))) (Intermediate!13542 (undefined!14354 Bool) (index!56568 (_ BitVec 32)) (x!141263 (_ BitVec 32))) (Undefined!13542) (MissingVacant!13542 (index!56569 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104784 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571084 (= res!1073505 (not ((_ is Found!13542) (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))))

(declare-fun b!1571085 () Bool)

(declare-fun res!1073506 () Bool)

(assert (=> b!1571085 (=> (not res!1073506) (not e!875971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571085 (= res!1073506 (validKeyInArray!0 k0!2731))))

(declare-fun b!1571086 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!104784 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571086 (= e!875971 ((_ is Found!13542) (seekEntry!0 k0!2731 a!3462 mask!4043)))))

(declare-fun res!1073507 () Bool)

(assert (=> start!134604 (=> (not res!1073507) (not e!875971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134604 (= res!1073507 (validMask!0 mask!4043))))

(assert (=> start!134604 e!875971))

(assert (=> start!134604 true))

(declare-fun array_inv!39506 (array!104784) Bool)

(assert (=> start!134604 (array_inv!39506 a!3462)))

(declare-fun b!1571087 () Bool)

(declare-fun res!1073504 () Bool)

(assert (=> b!1571087 (=> (not res!1073504) (not e!875971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104784 (_ BitVec 32)) Bool)

(assert (=> b!1571087 (= res!1073504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(assert (= (and start!134604 res!1073507) b!1571083))

(assert (= (and b!1571083 res!1073508) b!1571087))

(assert (= (and b!1571087 res!1073504) b!1571085))

(assert (= (and b!1571085 res!1073506) b!1571084))

(assert (= (and b!1571084 res!1073505) b!1571086))

(declare-fun m!1444467 () Bool)

(assert (=> b!1571084 m!1444467))

(declare-fun m!1444469 () Bool)

(assert (=> start!134604 m!1444469))

(declare-fun m!1444471 () Bool)

(assert (=> start!134604 m!1444471))

(declare-fun m!1444473 () Bool)

(assert (=> b!1571086 m!1444473))

(declare-fun m!1444475 () Bool)

(assert (=> b!1571085 m!1444475))

(declare-fun m!1444477 () Bool)

(assert (=> b!1571087 m!1444477))

(check-sat (not b!1571086) (not b!1571084) (not b!1571085) (not start!134604) (not b!1571087))
(check-sat)
(get-model)

(declare-fun d!164273 () Bool)

(assert (=> d!164273 (= (validKeyInArray!0 k0!2731) (and (not (= k0!2731 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2731 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571085 d!164273))

(declare-fun b!1571154 () Bool)

(declare-fun e!876008 () SeekEntryResult!13542)

(declare-fun lt!673298 () SeekEntryResult!13542)

(assert (=> b!1571154 (= e!876008 (Found!13542 (index!56568 lt!673298)))))

(declare-fun b!1571155 () Bool)

(declare-fun e!876006 () SeekEntryResult!13542)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104784 (_ BitVec 32)) SeekEntryResult!13542)

(assert (=> b!1571155 (= e!876006 (seekKeyOrZeroReturnVacant!0 (x!141263 lt!673298) (index!56568 lt!673298) (index!56568 lt!673298) k0!2731 a!3462 mask!4043))))

(declare-fun b!1571156 () Bool)

(declare-fun c!145044 () Bool)

(declare-fun lt!673297 () (_ BitVec 64))

(assert (=> b!1571156 (= c!145044 (= lt!673297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571156 (= e!876008 e!876006)))

(declare-fun b!1571157 () Bool)

(declare-fun e!876007 () SeekEntryResult!13542)

(assert (=> b!1571157 (= e!876007 Undefined!13542)))

(declare-fun d!164275 () Bool)

(declare-fun lt!673299 () SeekEntryResult!13542)

(assert (=> d!164275 (and (or ((_ is Undefined!13542) lt!673299) (not ((_ is Found!13542) lt!673299)) (and (bvsge (index!56567 lt!673299) #b00000000000000000000000000000000) (bvslt (index!56567 lt!673299) (size!51122 a!3462)))) (or ((_ is Undefined!13542) lt!673299) ((_ is Found!13542) lt!673299) (not ((_ is MissingZero!13542) lt!673299)) (and (bvsge (index!56566 lt!673299) #b00000000000000000000000000000000) (bvslt (index!56566 lt!673299) (size!51122 a!3462)))) (or ((_ is Undefined!13542) lt!673299) ((_ is Found!13542) lt!673299) ((_ is MissingZero!13542) lt!673299) (not ((_ is MissingVacant!13542) lt!673299)) (and (bvsge (index!56569 lt!673299) #b00000000000000000000000000000000) (bvslt (index!56569 lt!673299) (size!51122 a!3462)))) (or ((_ is Undefined!13542) lt!673299) (ite ((_ is Found!13542) lt!673299) (= (select (arr!50570 a!3462) (index!56567 lt!673299)) k0!2731) (ite ((_ is MissingZero!13542) lt!673299) (= (select (arr!50570 a!3462) (index!56566 lt!673299)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13542) lt!673299) (= (select (arr!50570 a!3462) (index!56569 lt!673299)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!164275 (= lt!673299 e!876007)))

(declare-fun c!145043 () Bool)

(assert (=> d!164275 (= c!145043 (and ((_ is Intermediate!13542) lt!673298) (undefined!14354 lt!673298)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104784 (_ BitVec 32)) SeekEntryResult!13542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!164275 (= lt!673298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!164275 (validMask!0 mask!4043)))

(assert (=> d!164275 (= (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043) lt!673299)))

(declare-fun b!1571158 () Bool)

(assert (=> b!1571158 (= e!876007 e!876008)))

(assert (=> b!1571158 (= lt!673297 (select (arr!50570 a!3462) (index!56568 lt!673298)))))

(declare-fun c!145045 () Bool)

(assert (=> b!1571158 (= c!145045 (= lt!673297 k0!2731))))

(declare-fun b!1571159 () Bool)

(assert (=> b!1571159 (= e!876006 (MissingZero!13542 (index!56568 lt!673298)))))

(assert (= (and d!164275 c!145043) b!1571157))

(assert (= (and d!164275 (not c!145043)) b!1571158))

(assert (= (and b!1571158 c!145045) b!1571154))

(assert (= (and b!1571158 (not c!145045)) b!1571156))

(assert (= (and b!1571156 c!145044) b!1571159))

(assert (= (and b!1571156 (not c!145044)) b!1571155))

(declare-fun m!1444515 () Bool)

(assert (=> b!1571155 m!1444515))

(declare-fun m!1444517 () Bool)

(assert (=> d!164275 m!1444517))

(declare-fun m!1444519 () Bool)

(assert (=> d!164275 m!1444519))

(declare-fun m!1444521 () Bool)

(assert (=> d!164275 m!1444521))

(assert (=> d!164275 m!1444521))

(declare-fun m!1444523 () Bool)

(assert (=> d!164275 m!1444523))

(assert (=> d!164275 m!1444469))

(declare-fun m!1444525 () Bool)

(assert (=> d!164275 m!1444525))

(declare-fun m!1444527 () Bool)

(assert (=> b!1571158 m!1444527))

(assert (=> b!1571084 d!164275))

(declare-fun d!164285 () Bool)

(assert (=> d!164285 (= (validMask!0 mask!4043) (and (or (= mask!4043 #b00000000000000000000000000000111) (= mask!4043 #b00000000000000000000000000001111) (= mask!4043 #b00000000000000000000000000011111) (= mask!4043 #b00000000000000000000000000111111) (= mask!4043 #b00000000000000000000000001111111) (= mask!4043 #b00000000000000000000000011111111) (= mask!4043 #b00000000000000000000000111111111) (= mask!4043 #b00000000000000000000001111111111) (= mask!4043 #b00000000000000000000011111111111) (= mask!4043 #b00000000000000000000111111111111) (= mask!4043 #b00000000000000000001111111111111) (= mask!4043 #b00000000000000000011111111111111) (= mask!4043 #b00000000000000000111111111111111) (= mask!4043 #b00000000000000001111111111111111) (= mask!4043 #b00000000000000011111111111111111) (= mask!4043 #b00000000000000111111111111111111) (= mask!4043 #b00000000000001111111111111111111) (= mask!4043 #b00000000000011111111111111111111) (= mask!4043 #b00000000000111111111111111111111) (= mask!4043 #b00000000001111111111111111111111) (= mask!4043 #b00000000011111111111111111111111) (= mask!4043 #b00000000111111111111111111111111) (= mask!4043 #b00000001111111111111111111111111) (= mask!4043 #b00000011111111111111111111111111) (= mask!4043 #b00000111111111111111111111111111) (= mask!4043 #b00001111111111111111111111111111) (= mask!4043 #b00011111111111111111111111111111) (= mask!4043 #b00111111111111111111111111111111)) (bvsle mask!4043 #b00111111111111111111111111111111)))))

(assert (=> start!134604 d!164285))

(declare-fun d!164293 () Bool)

(assert (=> d!164293 (= (array_inv!39506 a!3462) (bvsge (size!51122 a!3462) #b00000000000000000000000000000000))))

(assert (=> start!134604 d!164293))

(declare-fun b!1571204 () Bool)

(declare-fun e!876036 () Bool)

(declare-fun call!72336 () Bool)

(assert (=> b!1571204 (= e!876036 call!72336)))

(declare-fun b!1571205 () Bool)

(declare-fun e!876038 () Bool)

(assert (=> b!1571205 (= e!876038 call!72336)))

(declare-fun b!1571206 () Bool)

(assert (=> b!1571206 (= e!876036 e!876038)))

(declare-fun lt!673331 () (_ BitVec 64))

(assert (=> b!1571206 (= lt!673331 (select (arr!50570 a!3462) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51919 0))(
  ( (Unit!51920) )
))
(declare-fun lt!673330 () Unit!51919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104784 (_ BitVec 64) (_ BitVec 32)) Unit!51919)

(assert (=> b!1571206 (= lt!673330 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3462 lt!673331 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1571206 (arrayContainsKey!0 a!3462 lt!673331 #b00000000000000000000000000000000)))

(declare-fun lt!673332 () Unit!51919)

(assert (=> b!1571206 (= lt!673332 lt!673330)))

(declare-fun res!1073556 () Bool)

(assert (=> b!1571206 (= res!1073556 (= (seekEntryOrOpen!0 (select (arr!50570 a!3462) #b00000000000000000000000000000000) a!3462 mask!4043) (Found!13542 #b00000000000000000000000000000000)))))

(assert (=> b!1571206 (=> (not res!1073556) (not e!876038))))

(declare-fun d!164295 () Bool)

(declare-fun res!1073555 () Bool)

(declare-fun e!876037 () Bool)

(assert (=> d!164295 (=> res!1073555 e!876037)))

(assert (=> d!164295 (= res!1073555 (bvsge #b00000000000000000000000000000000 (size!51122 a!3462)))))

(assert (=> d!164295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043) e!876037)))

(declare-fun bm!72333 () Bool)

(assert (=> bm!72333 (= call!72336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3462 mask!4043))))

(declare-fun b!1571207 () Bool)

(assert (=> b!1571207 (= e!876037 e!876036)))

(declare-fun c!145063 () Bool)

(assert (=> b!1571207 (= c!145063 (validKeyInArray!0 (select (arr!50570 a!3462) #b00000000000000000000000000000000)))))

(assert (= (and d!164295 (not res!1073555)) b!1571207))

(assert (= (and b!1571207 c!145063) b!1571206))

(assert (= (and b!1571207 (not c!145063)) b!1571204))

(assert (= (and b!1571206 res!1073556) b!1571205))

(assert (= (or b!1571205 b!1571204) bm!72333))

(declare-fun m!1444565 () Bool)

(assert (=> b!1571206 m!1444565))

(declare-fun m!1444567 () Bool)

(assert (=> b!1571206 m!1444567))

(declare-fun m!1444569 () Bool)

(assert (=> b!1571206 m!1444569))

(assert (=> b!1571206 m!1444565))

(declare-fun m!1444571 () Bool)

(assert (=> b!1571206 m!1444571))

(declare-fun m!1444573 () Bool)

(assert (=> bm!72333 m!1444573))

(assert (=> b!1571207 m!1444565))

(assert (=> b!1571207 m!1444565))

(declare-fun m!1444575 () Bool)

(assert (=> b!1571207 m!1444575))

(assert (=> b!1571087 d!164295))

(declare-fun b!1571244 () Bool)

(declare-fun e!876058 () SeekEntryResult!13542)

(declare-fun e!876057 () SeekEntryResult!13542)

(assert (=> b!1571244 (= e!876058 e!876057)))

(declare-fun lt!673356 () (_ BitVec 64))

(declare-fun lt!673358 () SeekEntryResult!13542)

(assert (=> b!1571244 (= lt!673356 (select (arr!50570 a!3462) (index!56568 lt!673358)))))

(declare-fun c!145084 () Bool)

(assert (=> b!1571244 (= c!145084 (= lt!673356 k0!2731))))

(declare-fun b!1571245 () Bool)

(assert (=> b!1571245 (= e!876057 (Found!13542 (index!56568 lt!673358)))))

(declare-fun b!1571246 () Bool)

(declare-fun e!876059 () SeekEntryResult!13542)

(assert (=> b!1571246 (= e!876059 (MissingZero!13542 (index!56568 lt!673358)))))

(declare-fun d!164303 () Bool)

(declare-fun lt!673355 () SeekEntryResult!13542)

(assert (=> d!164303 (and (or ((_ is MissingVacant!13542) lt!673355) (not ((_ is Found!13542) lt!673355)) (and (bvsge (index!56567 lt!673355) #b00000000000000000000000000000000) (bvslt (index!56567 lt!673355) (size!51122 a!3462)))) (not ((_ is MissingVacant!13542) lt!673355)) (or (not ((_ is Found!13542) lt!673355)) (= (select (arr!50570 a!3462) (index!56567 lt!673355)) k0!2731)))))

(assert (=> d!164303 (= lt!673355 e!876058)))

(declare-fun c!145083 () Bool)

(assert (=> d!164303 (= c!145083 (and ((_ is Intermediate!13542) lt!673358) (undefined!14354 lt!673358)))))

(assert (=> d!164303 (= lt!673358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2731 mask!4043) k0!2731 a!3462 mask!4043))))

(assert (=> d!164303 (validMask!0 mask!4043)))

(assert (=> d!164303 (= (seekEntry!0 k0!2731 a!3462 mask!4043) lt!673355)))

(declare-fun b!1571247 () Bool)

(declare-fun c!145082 () Bool)

(assert (=> b!1571247 (= c!145082 (= lt!673356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1571247 (= e!876057 e!876059)))

(declare-fun b!1571248 () Bool)

(declare-fun lt!673357 () SeekEntryResult!13542)

(assert (=> b!1571248 (= e!876059 (ite ((_ is MissingVacant!13542) lt!673357) (MissingZero!13542 (index!56569 lt!673357)) lt!673357))))

(assert (=> b!1571248 (= lt!673357 (seekKeyOrZeroReturnVacant!0 (x!141263 lt!673358) (index!56568 lt!673358) (index!56568 lt!673358) k0!2731 a!3462 mask!4043))))

(declare-fun b!1571249 () Bool)

(assert (=> b!1571249 (= e!876058 Undefined!13542)))

(assert (= (and d!164303 c!145083) b!1571249))

(assert (= (and d!164303 (not c!145083)) b!1571244))

(assert (= (and b!1571244 c!145084) b!1571245))

(assert (= (and b!1571244 (not c!145084)) b!1571247))

(assert (= (and b!1571247 c!145082) b!1571246))

(assert (= (and b!1571247 (not c!145082)) b!1571248))

(declare-fun m!1444577 () Bool)

(assert (=> b!1571244 m!1444577))

(declare-fun m!1444579 () Bool)

(assert (=> d!164303 m!1444579))

(assert (=> d!164303 m!1444521))

(assert (=> d!164303 m!1444521))

(assert (=> d!164303 m!1444523))

(assert (=> d!164303 m!1444469))

(declare-fun m!1444581 () Bool)

(assert (=> b!1571248 m!1444581))

(assert (=> b!1571086 d!164303))

(check-sat (not bm!72333) (not d!164303) (not d!164275) (not b!1571206) (not b!1571155) (not b!1571207) (not b!1571248))
(check-sat)
