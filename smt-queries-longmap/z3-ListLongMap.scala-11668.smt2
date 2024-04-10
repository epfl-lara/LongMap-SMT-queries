; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136416 () Bool)

(assert start!136416)

(declare-datatypes ((SeekEntryResult!13753 0))(
  ( (MissingZero!13753 (index!57410 (_ BitVec 32))) (Found!13753 (index!57411 (_ BitVec 32))) (Intermediate!13753 (undefined!14565 Bool) (index!57412 (_ BitVec 32)) (x!142534 (_ BitVec 32))) (Undefined!13753) (MissingVacant!13753 (index!57413 (_ BitVec 32))) )
))
(declare-fun lt!675988 () SeekEntryResult!13753)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun e!879847 () Bool)

(declare-fun b!1577421 () Bool)

(declare-datatypes ((array!105607 0))(
  ( (array!105608 (arr!50924 (Array (_ BitVec 32) (_ BitVec 64))) (size!51474 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105607)

(get-info :version)

(assert (=> b!1577421 (= e!879847 (and ((_ is Intermediate!13753) lt!675988) (not (undefined!14565 lt!675988)) (bvslt (x!142534 lt!675988) #b01111111111111111111111111111110) (bvsge (x!142534 lt!675988) #b00000000000000000000000000000000) (bvsge (x!142534 lt!675988) x!458) (or (bvslt (index!57412 lt!675988) #b00000000000000000000000000000000) (bvsge (index!57412 lt!675988) (size!51474 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105607 (_ BitVec 32)) SeekEntryResult!13753)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577421 (= lt!675988 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun res!1077684 () Bool)

(assert (=> start!136416 (=> (not res!1077684) (not e!879847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136416 (= res!1077684 (validMask!0 mask!910))))

(assert (=> start!136416 e!879847))

(assert (=> start!136416 true))

(declare-fun array_inv!39651 (array!105607) Bool)

(assert (=> start!136416 (array_inv!39651 _keys!610)))

(declare-fun b!1577418 () Bool)

(declare-fun res!1077681 () Bool)

(assert (=> b!1577418 (=> (not res!1077681) (not e!879847))))

(assert (=> b!1577418 (= res!1077681 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51474 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577419 () Bool)

(declare-fun res!1077682 () Bool)

(assert (=> b!1577419 (=> (not res!1077682) (not e!879847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577419 (= res!1077682 (validKeyInArray!0 k0!768))))

(declare-fun b!1577420 () Bool)

(declare-fun res!1077683 () Bool)

(assert (=> b!1577420 (=> (not res!1077683) (not e!879847))))

(assert (=> b!1577420 (= res!1077683 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50924 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50924 _keys!610) ee!12) (select (arr!50924 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136416 res!1077684) b!1577418))

(assert (= (and b!1577418 res!1077681) b!1577419))

(assert (= (and b!1577419 res!1077682) b!1577420))

(assert (= (and b!1577420 res!1077683) b!1577421))

(declare-fun m!1449697 () Bool)

(assert (=> b!1577421 m!1449697))

(assert (=> b!1577421 m!1449697))

(declare-fun m!1449699 () Bool)

(assert (=> b!1577421 m!1449699))

(declare-fun m!1449701 () Bool)

(assert (=> start!136416 m!1449701))

(declare-fun m!1449703 () Bool)

(assert (=> start!136416 m!1449703))

(declare-fun m!1449705 () Bool)

(assert (=> b!1577419 m!1449705))

(declare-fun m!1449707 () Bool)

(assert (=> b!1577420 m!1449707))

(check-sat (not b!1577421) (not start!136416) (not b!1577419))
(check-sat)
(get-model)

(declare-fun b!1577452 () Bool)

(declare-fun e!879868 () Bool)

(declare-fun e!879869 () Bool)

(assert (=> b!1577452 (= e!879868 e!879869)))

(declare-fun res!1077705 () Bool)

(declare-fun lt!675997 () SeekEntryResult!13753)

(assert (=> b!1577452 (= res!1077705 (and ((_ is Intermediate!13753) lt!675997) (not (undefined!14565 lt!675997)) (bvslt (x!142534 lt!675997) #b01111111111111111111111111111110) (bvsge (x!142534 lt!675997) #b00000000000000000000000000000000) (bvsge (x!142534 lt!675997) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577452 (=> (not res!1077705) (not e!879869))))

(declare-fun b!1577453 () Bool)

(declare-fun e!879866 () SeekEntryResult!13753)

(assert (=> b!1577453 (= e!879866 (Intermediate!13753 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577454 () Bool)

(assert (=> b!1577454 (and (bvsge (index!57412 lt!675997) #b00000000000000000000000000000000) (bvslt (index!57412 lt!675997) (size!51474 _keys!610)))))

(declare-fun res!1077703 () Bool)

(assert (=> b!1577454 (= res!1077703 (= (select (arr!50924 _keys!610) (index!57412 lt!675997)) k0!768))))

(declare-fun e!879865 () Bool)

(assert (=> b!1577454 (=> res!1077703 e!879865)))

(assert (=> b!1577454 (= e!879869 e!879865)))

(declare-fun b!1577455 () Bool)

(declare-fun e!879867 () SeekEntryResult!13753)

(assert (=> b!1577455 (= e!879867 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun d!165863 () Bool)

(assert (=> d!165863 e!879868))

(declare-fun c!146158 () Bool)

(assert (=> d!165863 (= c!146158 (and ((_ is Intermediate!13753) lt!675997) (undefined!14565 lt!675997)))))

(assert (=> d!165863 (= lt!675997 e!879866)))

(declare-fun c!146159 () Bool)

(assert (=> d!165863 (= c!146159 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!675996 () (_ BitVec 64))

(assert (=> d!165863 (= lt!675996 (select (arr!50924 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165863 (validMask!0 mask!910)))

(assert (=> d!165863 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!675997)))

(declare-fun b!1577456 () Bool)

(assert (=> b!1577456 (= e!879866 e!879867)))

(declare-fun c!146160 () Bool)

(assert (=> b!1577456 (= c!146160 (or (= lt!675996 k0!768) (= (bvadd lt!675996 lt!675996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577457 () Bool)

(assert (=> b!1577457 (and (bvsge (index!57412 lt!675997) #b00000000000000000000000000000000) (bvslt (index!57412 lt!675997) (size!51474 _keys!610)))))

(assert (=> b!1577457 (= e!879865 (= (select (arr!50924 _keys!610) (index!57412 lt!675997)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577458 () Bool)

(assert (=> b!1577458 (and (bvsge (index!57412 lt!675997) #b00000000000000000000000000000000) (bvslt (index!57412 lt!675997) (size!51474 _keys!610)))))

(declare-fun res!1077704 () Bool)

(assert (=> b!1577458 (= res!1077704 (= (select (arr!50924 _keys!610) (index!57412 lt!675997)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577458 (=> res!1077704 e!879865)))

(declare-fun b!1577459 () Bool)

(assert (=> b!1577459 (= e!879867 (Intermediate!13753 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577460 () Bool)

(assert (=> b!1577460 (= e!879868 (bvsge (x!142534 lt!675997) #b01111111111111111111111111111110))))

(assert (= (and d!165863 c!146159) b!1577453))

(assert (= (and d!165863 (not c!146159)) b!1577456))

(assert (= (and b!1577456 c!146160) b!1577459))

(assert (= (and b!1577456 (not c!146160)) b!1577455))

(assert (= (and d!165863 c!146158) b!1577460))

(assert (= (and d!165863 (not c!146158)) b!1577452))

(assert (= (and b!1577452 res!1077705) b!1577454))

(assert (= (and b!1577454 (not res!1077703)) b!1577458))

(assert (= (and b!1577458 (not res!1077704)) b!1577457))

(declare-fun m!1449721 () Bool)

(assert (=> b!1577457 m!1449721))

(assert (=> b!1577458 m!1449721))

(assert (=> b!1577454 m!1449721))

(assert (=> b!1577455 m!1449697))

(declare-fun m!1449723 () Bool)

(assert (=> b!1577455 m!1449723))

(assert (=> b!1577455 m!1449723))

(declare-fun m!1449725 () Bool)

(assert (=> b!1577455 m!1449725))

(assert (=> d!165863 m!1449697))

(declare-fun m!1449727 () Bool)

(assert (=> d!165863 m!1449727))

(assert (=> d!165863 m!1449701))

(assert (=> b!1577421 d!165863))

(declare-fun d!165869 () Bool)

(declare-fun lt!676000 () (_ BitVec 32))

(assert (=> d!165869 (and (bvsge lt!676000 #b00000000000000000000000000000000) (bvslt lt!676000 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165869 (= lt!676000 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165869 (validMask!0 mask!910)))

(assert (=> d!165869 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676000)))

(declare-fun bs!45583 () Bool)

(assert (= bs!45583 d!165869))

(declare-fun m!1449729 () Bool)

(assert (=> bs!45583 m!1449729))

(assert (=> bs!45583 m!1449701))

(assert (=> b!1577421 d!165869))

(declare-fun d!165871 () Bool)

(assert (=> d!165871 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136416 d!165871))

(declare-fun d!165877 () Bool)

(assert (=> d!165877 (= (array_inv!39651 _keys!610) (bvsge (size!51474 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136416 d!165877))

(declare-fun d!165879 () Bool)

(assert (=> d!165879 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577419 d!165879))

(check-sat (not d!165863) (not d!165869) (not b!1577455))
(check-sat)
