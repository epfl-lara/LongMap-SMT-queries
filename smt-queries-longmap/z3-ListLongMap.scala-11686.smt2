; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136630 () Bool)

(assert start!136630)

(declare-fun b!1578004 () Bool)

(declare-fun res!1078233 () Bool)

(declare-fun e!880148 () Bool)

(assert (=> b!1578004 (=> (not res!1078233) (not e!880148))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105659 0))(
  ( (array!105660 (arr!50942 (Array (_ BitVec 32) (_ BitVec 64))) (size!51494 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105659)

(assert (=> b!1578004 (= res!1078233 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50942 _keys!614) ee!18) k0!772)) (not (= (select (arr!50942 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578002 () Bool)

(declare-fun res!1078235 () Bool)

(assert (=> b!1578002 (=> (not res!1078235) (not e!880148))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1578002 (= res!1078235 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51494 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50942 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578005 () Bool)

(declare-datatypes ((SeekEntryResult!13764 0))(
  ( (MissingZero!13764 (index!57454 (_ BitVec 32))) (Found!13764 (index!57455 (_ BitVec 32))) (Intermediate!13764 (undefined!14576 Bool) (index!57456 (_ BitVec 32)) (x!142711 (_ BitVec 32))) (Undefined!13764) (MissingVacant!13764 (index!57457 (_ BitVec 32))) )
))
(declare-fun lt!675933 () SeekEntryResult!13764)

(get-info :version)

(assert (=> b!1578005 (= e!880148 (and (not ((_ is Undefined!13764) lt!675933)) ((_ is Found!13764) lt!675933) (or (bvslt (index!57455 lt!675933) #b00000000000000000000000000000000) (bvsge (index!57455 lt!675933) (size!51494 _keys!614)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105659 (_ BitVec 32)) SeekEntryResult!13764)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578005 (= lt!675933 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun res!1078236 () Bool)

(assert (=> start!136630 (=> (not res!1078236) (not e!880148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136630 (= res!1078236 (validMask!0 mask!918))))

(assert (=> start!136630 e!880148))

(assert (=> start!136630 true))

(declare-fun array_inv!39878 (array!105659) Bool)

(assert (=> start!136630 (array_inv!39878 _keys!614)))

(declare-fun b!1578003 () Bool)

(declare-fun res!1078234 () Bool)

(assert (=> b!1578003 (=> (not res!1078234) (not e!880148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578003 (= res!1078234 (validKeyInArray!0 k0!772))))

(assert (= (and start!136630 res!1078236) b!1578002))

(assert (= (and b!1578002 res!1078235) b!1578003))

(assert (= (and b!1578003 res!1078234) b!1578004))

(assert (= (and b!1578004 res!1078233) b!1578005))

(declare-fun m!1449525 () Bool)

(assert (=> b!1578005 m!1449525))

(assert (=> b!1578005 m!1449525))

(declare-fun m!1449527 () Bool)

(assert (=> b!1578005 m!1449527))

(declare-fun m!1449529 () Bool)

(assert (=> b!1578003 m!1449529))

(declare-fun m!1449531 () Bool)

(assert (=> b!1578004 m!1449531))

(declare-fun m!1449533 () Bool)

(assert (=> b!1578002 m!1449533))

(declare-fun m!1449535 () Bool)

(assert (=> start!136630 m!1449535))

(declare-fun m!1449537 () Bool)

(assert (=> start!136630 m!1449537))

(check-sat (not b!1578005) (not start!136630) (not b!1578003))
(check-sat)
(get-model)

(declare-fun e!880168 () SeekEntryResult!13764)

(declare-fun b!1578042 () Bool)

(assert (=> b!1578042 (= e!880168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun b!1578043 () Bool)

(assert (=> b!1578043 (= e!880168 (MissingVacant!13764 vacantSpotIndex!10))))

(declare-fun b!1578044 () Bool)

(declare-fun e!880167 () SeekEntryResult!13764)

(declare-fun e!880169 () SeekEntryResult!13764)

(assert (=> b!1578044 (= e!880167 e!880169)))

(declare-fun c!146178 () Bool)

(declare-fun lt!675944 () (_ BitVec 64))

(assert (=> b!1578044 (= c!146178 (= lt!675944 k0!772))))

(declare-fun d!165803 () Bool)

(declare-fun lt!675945 () SeekEntryResult!13764)

(assert (=> d!165803 (and (or ((_ is Undefined!13764) lt!675945) (not ((_ is Found!13764) lt!675945)) (and (bvsge (index!57455 lt!675945) #b00000000000000000000000000000000) (bvslt (index!57455 lt!675945) (size!51494 _keys!614)))) (or ((_ is Undefined!13764) lt!675945) ((_ is Found!13764) lt!675945) (not ((_ is MissingVacant!13764) lt!675945)) (not (= (index!57457 lt!675945) vacantSpotIndex!10)) (and (bvsge (index!57457 lt!675945) #b00000000000000000000000000000000) (bvslt (index!57457 lt!675945) (size!51494 _keys!614)))) (or ((_ is Undefined!13764) lt!675945) (ite ((_ is Found!13764) lt!675945) (= (select (arr!50942 _keys!614) (index!57455 lt!675945)) k0!772) (and ((_ is MissingVacant!13764) lt!675945) (= (index!57457 lt!675945) vacantSpotIndex!10) (= (select (arr!50942 _keys!614) (index!57457 lt!675945)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165803 (= lt!675945 e!880167)))

(declare-fun c!146179 () Bool)

(assert (=> d!165803 (= c!146179 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!165803 (= lt!675944 (select (arr!50942 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!165803 (validMask!0 mask!918)))

(assert (=> d!165803 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918) lt!675945)))

(declare-fun b!1578045 () Bool)

(assert (=> b!1578045 (= e!880167 Undefined!13764)))

(declare-fun b!1578046 () Bool)

(declare-fun c!146177 () Bool)

(assert (=> b!1578046 (= c!146177 (= lt!675944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578046 (= e!880169 e!880168)))

(declare-fun b!1578047 () Bool)

(assert (=> b!1578047 (= e!880169 (Found!13764 (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (= (and d!165803 c!146179) b!1578045))

(assert (= (and d!165803 (not c!146179)) b!1578044))

(assert (= (and b!1578044 c!146178) b!1578047))

(assert (= (and b!1578044 (not c!146178)) b!1578046))

(assert (= (and b!1578046 c!146177) b!1578043))

(assert (= (and b!1578046 (not c!146177)) b!1578042))

(assert (=> b!1578042 m!1449525))

(declare-fun m!1449567 () Bool)

(assert (=> b!1578042 m!1449567))

(assert (=> b!1578042 m!1449567))

(declare-fun m!1449569 () Bool)

(assert (=> b!1578042 m!1449569))

(declare-fun m!1449571 () Bool)

(assert (=> d!165803 m!1449571))

(declare-fun m!1449573 () Bool)

(assert (=> d!165803 m!1449573))

(assert (=> d!165803 m!1449525))

(declare-fun m!1449575 () Bool)

(assert (=> d!165803 m!1449575))

(assert (=> d!165803 m!1449535))

(assert (=> b!1578005 d!165803))

(declare-fun d!165807 () Bool)

(declare-fun lt!675948 () (_ BitVec 32))

(assert (=> d!165807 (and (bvsge lt!675948 #b00000000000000000000000000000000) (bvslt lt!675948 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165807 (= lt!675948 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!165807 (validMask!0 mask!918)))

(assert (=> d!165807 (= (nextIndex!0 ee!18 x!466 mask!918) lt!675948)))

(declare-fun bs!45606 () Bool)

(assert (= bs!45606 d!165807))

(declare-fun m!1449577 () Bool)

(assert (=> bs!45606 m!1449577))

(assert (=> bs!45606 m!1449535))

(assert (=> b!1578005 d!165807))

(declare-fun d!165811 () Bool)

(assert (=> d!165811 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136630 d!165811))

(declare-fun d!165817 () Bool)

(assert (=> d!165817 (= (array_inv!39878 _keys!614) (bvsge (size!51494 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136630 d!165817))

(declare-fun d!165819 () Bool)

(assert (=> d!165819 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578003 d!165819))

(check-sat (not d!165803) (not d!165807) (not b!1578042))
(check-sat)
