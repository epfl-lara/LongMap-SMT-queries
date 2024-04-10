; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55578 () Bool)

(assert start!55578)

(declare-fun b!608592 () Bool)

(declare-datatypes ((Unit!19450 0))(
  ( (Unit!19451) )
))
(declare-fun e!348546 () Unit!19450)

(declare-fun Unit!19452 () Unit!19450)

(assert (=> b!608592 (= e!348546 Unit!19452)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37309 0))(
  ( (array!37310 (arr!17905 (Array (_ BitVec 32) (_ BitVec 64))) (size!18269 (_ BitVec 32))) )
))
(declare-fun lt!278053 () array!37309)

(declare-fun b!608593 () Bool)

(declare-fun e!348544 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37309)

(declare-fun arrayContainsKey!0 (array!37309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608593 (= e!348544 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) index!984))))

(declare-fun b!608594 () Bool)

(declare-fun res!391243 () Bool)

(declare-fun e!348545 () Bool)

(assert (=> b!608594 (=> (not res!391243) (not e!348545))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608594 (= res!391243 (validKeyInArray!0 k0!1786))))

(declare-fun b!608595 () Bool)

(declare-fun e!348543 () Bool)

(assert (=> b!608595 (= e!348543 true)))

(declare-fun lt!278060 () Bool)

(declare-datatypes ((List!11946 0))(
  ( (Nil!11943) (Cons!11942 (h!12987 (_ BitVec 64)) (t!18174 List!11946)) )
))
(declare-fun contains!3022 (List!11946 (_ BitVec 64)) Bool)

(assert (=> b!608595 (= lt!278060 (contains!3022 Nil!11943 k0!1786))))

(declare-fun b!608596 () Bool)

(declare-fun res!391261 () Bool)

(assert (=> b!608596 (=> (not res!391261) (not e!348545))))

(assert (=> b!608596 (= res!391261 (validKeyInArray!0 (select (arr!17905 a!2986) j!136)))))

(declare-fun b!608597 () Bool)

(declare-fun e!348539 () Unit!19450)

(declare-fun Unit!19453 () Unit!19450)

(assert (=> b!608597 (= e!348539 Unit!19453)))

(declare-fun b!608598 () Bool)

(declare-fun res!391246 () Bool)

(declare-fun e!348535 () Bool)

(assert (=> b!608598 (=> (not res!391246) (not e!348535))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37309 (_ BitVec 32)) Bool)

(assert (=> b!608598 (= res!391246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608600 () Bool)

(declare-fun Unit!19454 () Unit!19450)

(assert (=> b!608600 (= e!348539 Unit!19454)))

(assert (=> b!608600 false))

(declare-fun b!608601 () Bool)

(declare-fun res!391258 () Bool)

(assert (=> b!608601 (=> res!391258 e!348543)))

(declare-fun noDuplicate!328 (List!11946) Bool)

(assert (=> b!608601 (= res!391258 (not (noDuplicate!328 Nil!11943)))))

(declare-fun b!608602 () Bool)

(declare-fun Unit!19455 () Unit!19450)

(assert (=> b!608602 (= e!348546 Unit!19455)))

(declare-fun lt!278050 () Unit!19450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37309 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19450)

(assert (=> b!608602 (= lt!278050 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278053 (select (arr!17905 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608602 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!278062 () Unit!19450)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37309 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11946) Unit!19450)

(assert (=> b!608602 (= lt!278062 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11943))))

(declare-fun arrayNoDuplicates!0 (array!37309 (_ BitVec 32) List!11946) Bool)

(assert (=> b!608602 (arrayNoDuplicates!0 lt!278053 #b00000000000000000000000000000000 Nil!11943)))

(declare-fun lt!278051 () Unit!19450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37309 (_ BitVec 32) (_ BitVec 32)) Unit!19450)

(assert (=> b!608602 (= lt!278051 (lemmaNoDuplicateFromThenFromBigger!0 lt!278053 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608602 (arrayNoDuplicates!0 lt!278053 j!136 Nil!11943)))

(declare-fun lt!278064 () Unit!19450)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37309 (_ BitVec 64) (_ BitVec 32) List!11946) Unit!19450)

(assert (=> b!608602 (= lt!278064 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278053 (select (arr!17905 a!2986) j!136) j!136 Nil!11943))))

(assert (=> b!608602 false))

(declare-fun b!608603 () Bool)

(declare-fun res!391247 () Bool)

(assert (=> b!608603 (=> (not res!391247) (not e!348545))))

(assert (=> b!608603 (= res!391247 (and (= (size!18269 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18269 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18269 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608604 () Bool)

(declare-fun e!348537 () Bool)

(declare-datatypes ((SeekEntryResult!6345 0))(
  ( (MissingZero!6345 (index!27655 (_ BitVec 32))) (Found!6345 (index!27656 (_ BitVec 32))) (Intermediate!6345 (undefined!7157 Bool) (index!27657 (_ BitVec 32)) (x!56462 (_ BitVec 32))) (Undefined!6345) (MissingVacant!6345 (index!27658 (_ BitVec 32))) )
))
(declare-fun lt!278063 () SeekEntryResult!6345)

(declare-fun lt!278049 () SeekEntryResult!6345)

(assert (=> b!608604 (= e!348537 (= lt!278063 lt!278049))))

(declare-fun b!608605 () Bool)

(declare-fun res!391251 () Bool)

(assert (=> b!608605 (=> (not res!391251) (not e!348535))))

(assert (=> b!608605 (= res!391251 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11943))))

(declare-fun b!608606 () Bool)

(declare-fun e!348542 () Bool)

(declare-fun e!348536 () Bool)

(assert (=> b!608606 (= e!348542 e!348536)))

(declare-fun res!391245 () Bool)

(assert (=> b!608606 (=> (not res!391245) (not e!348536))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608606 (= res!391245 (and (= lt!278063 (Found!6345 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17905 a!2986) index!984) (select (arr!17905 a!2986) j!136))) (not (= (select (arr!17905 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37309 (_ BitVec 32)) SeekEntryResult!6345)

(assert (=> b!608606 (= lt!278063 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17905 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608607 () Bool)

(assert (=> b!608607 (= e!348545 e!348535)))

(declare-fun res!391252 () Bool)

(assert (=> b!608607 (=> (not res!391252) (not e!348535))))

(declare-fun lt!278065 () SeekEntryResult!6345)

(assert (=> b!608607 (= res!391252 (or (= lt!278065 (MissingZero!6345 i!1108)) (= lt!278065 (MissingVacant!6345 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37309 (_ BitVec 32)) SeekEntryResult!6345)

(assert (=> b!608607 (= lt!278065 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608608 () Bool)

(assert (=> b!608608 (= e!348535 e!348542)))

(declare-fun res!391244 () Bool)

(assert (=> b!608608 (=> (not res!391244) (not e!348542))))

(assert (=> b!608608 (= res!391244 (= (select (store (arr!17905 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608608 (= lt!278053 (array!37310 (store (arr!17905 a!2986) i!1108 k0!1786) (size!18269 a!2986)))))

(declare-fun b!608609 () Bool)

(declare-fun res!391254 () Bool)

(assert (=> b!608609 (=> (not res!391254) (not e!348545))))

(assert (=> b!608609 (= res!391254 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608610 () Bool)

(declare-fun e!348548 () Bool)

(declare-fun e!348547 () Bool)

(assert (=> b!608610 (= e!348548 e!348547)))

(declare-fun res!391259 () Bool)

(assert (=> b!608610 (=> res!391259 e!348547)))

(assert (=> b!608610 (= res!391259 (bvsge index!984 j!136))))

(declare-fun lt!278059 () Unit!19450)

(assert (=> b!608610 (= lt!278059 e!348546)))

(declare-fun c!69044 () Bool)

(assert (=> b!608610 (= c!69044 (bvslt j!136 index!984))))

(declare-fun b!608611 () Bool)

(declare-fun res!391248 () Bool)

(assert (=> b!608611 (=> res!391248 e!348543)))

(assert (=> b!608611 (= res!391248 (contains!3022 Nil!11943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608599 () Bool)

(declare-fun e!348549 () Bool)

(declare-fun e!348538 () Bool)

(assert (=> b!608599 (= e!348549 e!348538)))

(declare-fun res!391255 () Bool)

(assert (=> b!608599 (=> res!391255 e!348538)))

(declare-fun lt!278056 () (_ BitVec 64))

(declare-fun lt!278054 () (_ BitVec 64))

(assert (=> b!608599 (= res!391255 (or (not (= (select (arr!17905 a!2986) j!136) lt!278054)) (not (= (select (arr!17905 a!2986) j!136) lt!278056)) (bvsge j!136 index!984)))))

(declare-fun res!391242 () Bool)

(assert (=> start!55578 (=> (not res!391242) (not e!348545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55578 (= res!391242 (validMask!0 mask!3053))))

(assert (=> start!55578 e!348545))

(assert (=> start!55578 true))

(declare-fun array_inv!13701 (array!37309) Bool)

(assert (=> start!55578 (array_inv!13701 a!2986)))

(declare-fun b!608612 () Bool)

(declare-fun e!348534 () Bool)

(assert (=> b!608612 (= e!348534 e!348548)))

(declare-fun res!391257 () Bool)

(assert (=> b!608612 (=> res!391257 e!348548)))

(assert (=> b!608612 (= res!391257 (or (not (= (select (arr!17905 a!2986) j!136) lt!278054)) (not (= (select (arr!17905 a!2986) j!136) lt!278056))))))

(assert (=> b!608612 e!348549))

(declare-fun res!391249 () Bool)

(assert (=> b!608612 (=> (not res!391249) (not e!348549))))

(assert (=> b!608612 (= res!391249 (= lt!278056 (select (arr!17905 a!2986) j!136)))))

(assert (=> b!608612 (= lt!278056 (select (store (arr!17905 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608613 () Bool)

(assert (=> b!608613 (= e!348536 (not e!348534))))

(declare-fun res!391240 () Bool)

(assert (=> b!608613 (=> res!391240 e!348534)))

(declare-fun lt!278052 () SeekEntryResult!6345)

(assert (=> b!608613 (= res!391240 (not (= lt!278052 (Found!6345 index!984))))))

(declare-fun lt!278058 () Unit!19450)

(assert (=> b!608613 (= lt!278058 e!348539)))

(declare-fun c!69043 () Bool)

(assert (=> b!608613 (= c!69043 (= lt!278052 Undefined!6345))))

(assert (=> b!608613 (= lt!278052 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278054 lt!278053 mask!3053))))

(assert (=> b!608613 e!348537))

(declare-fun res!391260 () Bool)

(assert (=> b!608613 (=> (not res!391260) (not e!348537))))

(declare-fun lt!278061 () (_ BitVec 32))

(assert (=> b!608613 (= res!391260 (= lt!278049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278061 vacantSpotIndex!68 lt!278054 lt!278053 mask!3053)))))

(assert (=> b!608613 (= lt!278049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278061 vacantSpotIndex!68 (select (arr!17905 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608613 (= lt!278054 (select (store (arr!17905 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278057 () Unit!19450)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19450)

(assert (=> b!608613 (= lt!278057 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278061 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608613 (= lt!278061 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608614 () Bool)

(declare-fun res!391250 () Bool)

(assert (=> b!608614 (=> res!391250 e!348543)))

(assert (=> b!608614 (= res!391250 (contains!3022 Nil!11943 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608615 () Bool)

(declare-fun e!348540 () Bool)

(assert (=> b!608615 (= e!348540 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) index!984))))

(declare-fun b!608616 () Bool)

(assert (=> b!608616 (= e!348547 e!348543)))

(declare-fun res!391241 () Bool)

(assert (=> b!608616 (=> res!391241 e!348543)))

(assert (=> b!608616 (= res!391241 (or (bvsge (size!18269 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18269 a!2986))))))

(assert (=> b!608616 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278055 () Unit!19450)

(assert (=> b!608616 (= lt!278055 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278053 (select (arr!17905 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608616 e!348540))

(declare-fun res!391262 () Bool)

(assert (=> b!608616 (=> (not res!391262) (not e!348540))))

(assert (=> b!608616 (= res!391262 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) j!136))))

(declare-fun b!608617 () Bool)

(declare-fun res!391253 () Bool)

(assert (=> b!608617 (=> (not res!391253) (not e!348535))))

(assert (=> b!608617 (= res!391253 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17905 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608618 () Bool)

(assert (=> b!608618 (= e!348538 e!348544)))

(declare-fun res!391256 () Bool)

(assert (=> b!608618 (=> (not res!391256) (not e!348544))))

(assert (=> b!608618 (= res!391256 (arrayContainsKey!0 lt!278053 (select (arr!17905 a!2986) j!136) j!136))))

(assert (= (and start!55578 res!391242) b!608603))

(assert (= (and b!608603 res!391247) b!608596))

(assert (= (and b!608596 res!391261) b!608594))

(assert (= (and b!608594 res!391243) b!608609))

(assert (= (and b!608609 res!391254) b!608607))

(assert (= (and b!608607 res!391252) b!608598))

(assert (= (and b!608598 res!391246) b!608605))

(assert (= (and b!608605 res!391251) b!608617))

(assert (= (and b!608617 res!391253) b!608608))

(assert (= (and b!608608 res!391244) b!608606))

(assert (= (and b!608606 res!391245) b!608613))

(assert (= (and b!608613 res!391260) b!608604))

(assert (= (and b!608613 c!69043) b!608600))

(assert (= (and b!608613 (not c!69043)) b!608597))

(assert (= (and b!608613 (not res!391240)) b!608612))

(assert (= (and b!608612 res!391249) b!608599))

(assert (= (and b!608599 (not res!391255)) b!608618))

(assert (= (and b!608618 res!391256) b!608593))

(assert (= (and b!608612 (not res!391257)) b!608610))

(assert (= (and b!608610 c!69044) b!608602))

(assert (= (and b!608610 (not c!69044)) b!608592))

(assert (= (and b!608610 (not res!391259)) b!608616))

(assert (= (and b!608616 res!391262) b!608615))

(assert (= (and b!608616 (not res!391241)) b!608601))

(assert (= (and b!608601 (not res!391258)) b!608611))

(assert (= (and b!608611 (not res!391248)) b!608614))

(assert (= (and b!608614 (not res!391250)) b!608595))

(declare-fun m!585203 () Bool)

(assert (=> b!608598 m!585203))

(declare-fun m!585205 () Bool)

(assert (=> b!608605 m!585205))

(declare-fun m!585207 () Bool)

(assert (=> start!55578 m!585207))

(declare-fun m!585209 () Bool)

(assert (=> start!55578 m!585209))

(declare-fun m!585211 () Bool)

(assert (=> b!608615 m!585211))

(assert (=> b!608615 m!585211))

(declare-fun m!585213 () Bool)

(assert (=> b!608615 m!585213))

(assert (=> b!608612 m!585211))

(declare-fun m!585215 () Bool)

(assert (=> b!608612 m!585215))

(declare-fun m!585217 () Bool)

(assert (=> b!608612 m!585217))

(declare-fun m!585219 () Bool)

(assert (=> b!608609 m!585219))

(declare-fun m!585221 () Bool)

(assert (=> b!608617 m!585221))

(declare-fun m!585223 () Bool)

(assert (=> b!608613 m!585223))

(declare-fun m!585225 () Bool)

(assert (=> b!608613 m!585225))

(assert (=> b!608613 m!585211))

(declare-fun m!585227 () Bool)

(assert (=> b!608613 m!585227))

(assert (=> b!608613 m!585211))

(declare-fun m!585229 () Bool)

(assert (=> b!608613 m!585229))

(declare-fun m!585231 () Bool)

(assert (=> b!608613 m!585231))

(declare-fun m!585233 () Bool)

(assert (=> b!608613 m!585233))

(assert (=> b!608613 m!585215))

(assert (=> b!608599 m!585211))

(declare-fun m!585235 () Bool)

(assert (=> b!608611 m!585235))

(declare-fun m!585237 () Bool)

(assert (=> b!608601 m!585237))

(assert (=> b!608608 m!585215))

(declare-fun m!585239 () Bool)

(assert (=> b!608608 m!585239))

(declare-fun m!585241 () Bool)

(assert (=> b!608602 m!585241))

(declare-fun m!585243 () Bool)

(assert (=> b!608602 m!585243))

(assert (=> b!608602 m!585211))

(assert (=> b!608602 m!585211))

(declare-fun m!585245 () Bool)

(assert (=> b!608602 m!585245))

(assert (=> b!608602 m!585211))

(declare-fun m!585247 () Bool)

(assert (=> b!608602 m!585247))

(declare-fun m!585249 () Bool)

(assert (=> b!608602 m!585249))

(assert (=> b!608602 m!585211))

(declare-fun m!585251 () Bool)

(assert (=> b!608602 m!585251))

(declare-fun m!585253 () Bool)

(assert (=> b!608602 m!585253))

(assert (=> b!608618 m!585211))

(assert (=> b!608618 m!585211))

(declare-fun m!585255 () Bool)

(assert (=> b!608618 m!585255))

(assert (=> b!608593 m!585211))

(assert (=> b!608593 m!585211))

(assert (=> b!608593 m!585213))

(declare-fun m!585257 () Bool)

(assert (=> b!608614 m!585257))

(assert (=> b!608596 m!585211))

(assert (=> b!608596 m!585211))

(declare-fun m!585259 () Bool)

(assert (=> b!608596 m!585259))

(declare-fun m!585261 () Bool)

(assert (=> b!608595 m!585261))

(declare-fun m!585263 () Bool)

(assert (=> b!608594 m!585263))

(declare-fun m!585265 () Bool)

(assert (=> b!608607 m!585265))

(assert (=> b!608616 m!585211))

(assert (=> b!608616 m!585211))

(declare-fun m!585267 () Bool)

(assert (=> b!608616 m!585267))

(assert (=> b!608616 m!585211))

(declare-fun m!585269 () Bool)

(assert (=> b!608616 m!585269))

(assert (=> b!608616 m!585211))

(assert (=> b!608616 m!585255))

(declare-fun m!585271 () Bool)

(assert (=> b!608606 m!585271))

(assert (=> b!608606 m!585211))

(assert (=> b!608606 m!585211))

(declare-fun m!585273 () Bool)

(assert (=> b!608606 m!585273))

(check-sat (not b!608593) (not b!608611) (not b!608616) (not b!608615) (not b!608598) (not b!608607) (not b!608601) (not b!608614) (not b!608594) (not b!608605) (not b!608606) (not start!55578) (not b!608613) (not b!608596) (not b!608595) (not b!608609) (not b!608602) (not b!608618))
(check-sat)
