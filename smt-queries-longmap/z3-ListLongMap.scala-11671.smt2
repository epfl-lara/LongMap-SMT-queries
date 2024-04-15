; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136486 () Bool)

(assert start!136486)

(declare-fun res!1077731 () Bool)

(declare-fun e!879833 () Bool)

(assert (=> start!136486 (=> (not res!1077731) (not e!879833))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136486 (= res!1077731 (validMask!0 mask!910))))

(assert (=> start!136486 e!879833))

(assert (=> start!136486 true))

(declare-datatypes ((array!105563 0))(
  ( (array!105564 (arr!50897 (Array (_ BitVec 32) (_ BitVec 64))) (size!51449 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105563)

(declare-fun array_inv!39833 (array!105563) Bool)

(assert (=> start!136486 (array_inv!39833 _keys!610)))

(declare-fun b!1577444 () Bool)

(declare-fun res!1077732 () Bool)

(assert (=> b!1577444 (=> (not res!1077732) (not e!879833))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577444 (= res!1077732 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51449 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577445 () Bool)

(declare-fun res!1077730 () Bool)

(assert (=> b!1577445 (=> (not res!1077730) (not e!879833))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577445 (= res!1077730 (validKeyInArray!0 k0!768))))

(declare-fun b!1577446 () Bool)

(declare-fun res!1077729 () Bool)

(assert (=> b!1577446 (=> (not res!1077729) (not e!879833))))

(assert (=> b!1577446 (= res!1077729 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50897 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50897 _keys!610) ee!12) (select (arr!50897 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!13761 0))(
  ( (MissingZero!13761 (index!57442 (_ BitVec 32))) (Found!13761 (index!57443 (_ BitVec 32))) (Intermediate!13761 (undefined!14573 Bool) (index!57444 (_ BitVec 32)) (x!142579 (_ BitVec 32))) (Undefined!13761) (MissingVacant!13761 (index!57445 (_ BitVec 32))) )
))
(declare-fun lt!675807 () SeekEntryResult!13761)

(declare-fun b!1577447 () Bool)

(get-info :version)

(assert (=> b!1577447 (= e!879833 (ite (and ((_ is Intermediate!13761) lt!675807) (undefined!14573 lt!675807)) (bvslt (x!142579 lt!675807) #b01111111111111111111111111111110) (or (not ((_ is Intermediate!13761) lt!675807)) (undefined!14573 lt!675807) (bvsge (x!142579 lt!675807) #b01111111111111111111111111111110) (bvslt (x!142579 lt!675807) #b00000000000000000000000000000000) (bvslt (x!142579 lt!675807) x!458) (and (not (= (select (arr!50897 _keys!610) (index!57444 lt!675807)) k0!768)) (not (= (select (arr!50897 _keys!610) (index!57444 lt!675807)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50897 _keys!610) (index!57444 lt!675807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105563 (_ BitVec 32)) SeekEntryResult!13761)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577447 (= lt!675807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(assert (= (and start!136486 res!1077731) b!1577444))

(assert (= (and b!1577444 res!1077732) b!1577445))

(assert (= (and b!1577445 res!1077730) b!1577446))

(assert (= (and b!1577446 res!1077729) b!1577447))

(declare-fun m!1449003 () Bool)

(assert (=> start!136486 m!1449003))

(declare-fun m!1449005 () Bool)

(assert (=> start!136486 m!1449005))

(declare-fun m!1449007 () Bool)

(assert (=> b!1577445 m!1449007))

(declare-fun m!1449009 () Bool)

(assert (=> b!1577446 m!1449009))

(declare-fun m!1449011 () Bool)

(assert (=> b!1577447 m!1449011))

(declare-fun m!1449013 () Bool)

(assert (=> b!1577447 m!1449013))

(assert (=> b!1577447 m!1449013))

(declare-fun m!1449015 () Bool)

(assert (=> b!1577447 m!1449015))

(check-sat (not b!1577447) (not start!136486) (not b!1577445))
(check-sat)
(get-model)

(declare-fun b!1577490 () Bool)

(declare-fun e!879857 () Bool)

(declare-fun lt!675818 () SeekEntryResult!13761)

(assert (=> b!1577490 (= e!879857 (bvsge (x!142579 lt!675818) #b01111111111111111111111111111110))))

(declare-fun b!1577491 () Bool)

(declare-fun e!879856 () SeekEntryResult!13761)

(assert (=> b!1577491 (= e!879856 (Intermediate!13761 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577493 () Bool)

(declare-fun e!879858 () SeekEntryResult!13761)

(assert (=> b!1577493 (= e!879858 e!879856)))

(declare-fun c!146151 () Bool)

(declare-fun lt!675819 () (_ BitVec 64))

(assert (=> b!1577493 (= c!146151 (or (= lt!675819 k0!768) (= (bvadd lt!675819 lt!675819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577494 () Bool)

(assert (=> b!1577494 (= e!879856 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577495 () Bool)

(assert (=> b!1577495 (and (bvsge (index!57444 lt!675818) #b00000000000000000000000000000000) (bvslt (index!57444 lt!675818) (size!51449 _keys!610)))))

(declare-fun res!1077764 () Bool)

(assert (=> b!1577495 (= res!1077764 (= (select (arr!50897 _keys!610) (index!57444 lt!675818)) k0!768))))

(declare-fun e!879859 () Bool)

(assert (=> b!1577495 (=> res!1077764 e!879859)))

(declare-fun e!879860 () Bool)

(assert (=> b!1577495 (= e!879860 e!879859)))

(declare-fun b!1577496 () Bool)

(assert (=> b!1577496 (and (bvsge (index!57444 lt!675818) #b00000000000000000000000000000000) (bvslt (index!57444 lt!675818) (size!51449 _keys!610)))))

(declare-fun res!1077763 () Bool)

(assert (=> b!1577496 (= res!1077763 (= (select (arr!50897 _keys!610) (index!57444 lt!675818)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577496 (=> res!1077763 e!879859)))

(declare-fun b!1577492 () Bool)

(assert (=> b!1577492 (and (bvsge (index!57444 lt!675818) #b00000000000000000000000000000000) (bvslt (index!57444 lt!675818) (size!51449 _keys!610)))))

(assert (=> b!1577492 (= e!879859 (= (select (arr!50897 _keys!610) (index!57444 lt!675818)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165719 () Bool)

(assert (=> d!165719 e!879857))

(declare-fun c!146150 () Bool)

(assert (=> d!165719 (= c!146150 (and ((_ is Intermediate!13761) lt!675818) (undefined!14573 lt!675818)))))

(assert (=> d!165719 (= lt!675818 e!879858)))

(declare-fun c!146152 () Bool)

(assert (=> d!165719 (= c!146152 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165719 (= lt!675819 (select (arr!50897 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165719 (validMask!0 mask!910)))

(assert (=> d!165719 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!675818)))

(declare-fun b!1577497 () Bool)

(assert (=> b!1577497 (= e!879857 e!879860)))

(declare-fun res!1077765 () Bool)

(assert (=> b!1577497 (= res!1077765 (and ((_ is Intermediate!13761) lt!675818) (not (undefined!14573 lt!675818)) (bvslt (x!142579 lt!675818) #b01111111111111111111111111111110) (bvsge (x!142579 lt!675818) #b00000000000000000000000000000000) (bvsge (x!142579 lt!675818) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577497 (=> (not res!1077765) (not e!879860))))

(declare-fun b!1577498 () Bool)

(assert (=> b!1577498 (= e!879858 (Intermediate!13761 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(assert (= (and d!165719 c!146152) b!1577498))

(assert (= (and d!165719 (not c!146152)) b!1577493))

(assert (= (and b!1577493 c!146151) b!1577491))

(assert (= (and b!1577493 (not c!146151)) b!1577494))

(assert (= (and d!165719 c!146150) b!1577490))

(assert (= (and d!165719 (not c!146150)) b!1577497))

(assert (= (and b!1577497 res!1077765) b!1577495))

(assert (= (and b!1577495 (not res!1077764)) b!1577496))

(assert (= (and b!1577496 (not res!1077763)) b!1577492))

(assert (=> b!1577494 m!1449013))

(declare-fun m!1449045 () Bool)

(assert (=> b!1577494 m!1449045))

(assert (=> b!1577494 m!1449045))

(declare-fun m!1449047 () Bool)

(assert (=> b!1577494 m!1449047))

(declare-fun m!1449049 () Bool)

(assert (=> b!1577492 m!1449049))

(assert (=> b!1577496 m!1449049))

(assert (=> d!165719 m!1449013))

(declare-fun m!1449051 () Bool)

(assert (=> d!165719 m!1449051))

(assert (=> d!165719 m!1449003))

(assert (=> b!1577495 m!1449049))

(assert (=> b!1577447 d!165719))

(declare-fun d!165727 () Bool)

(declare-fun lt!675822 () (_ BitVec 32))

(assert (=> d!165727 (and (bvsge lt!675822 #b00000000000000000000000000000000) (bvslt lt!675822 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165727 (= lt!675822 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165727 (validMask!0 mask!910)))

(assert (=> d!165727 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675822)))

(declare-fun bs!45555 () Bool)

(assert (= bs!45555 d!165727))

(declare-fun m!1449053 () Bool)

(assert (=> bs!45555 m!1449053))

(assert (=> bs!45555 m!1449003))

(assert (=> b!1577447 d!165727))

(declare-fun d!165729 () Bool)

(assert (=> d!165729 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136486 d!165729))

(declare-fun d!165739 () Bool)

(assert (=> d!165739 (= (array_inv!39833 _keys!610) (bvsge (size!51449 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136486 d!165739))

(declare-fun d!165741 () Bool)

(assert (=> d!165741 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577445 d!165741))

(check-sat (not d!165719) (not b!1577494) (not d!165727))
(check-sat)
