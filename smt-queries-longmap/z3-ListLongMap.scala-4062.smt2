; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55650 () Bool)

(assert start!55650)

(declare-fun b!609692 () Bool)

(declare-datatypes ((Unit!19495 0))(
  ( (Unit!19496) )
))
(declare-fun e!349204 () Unit!19495)

(declare-fun Unit!19497 () Unit!19495)

(assert (=> b!609692 (= e!349204 Unit!19497)))

(assert (=> b!609692 false))

(declare-fun b!609693 () Bool)

(declare-fun res!392120 () Bool)

(declare-fun e!349203 () Bool)

(assert (=> b!609693 (=> (not res!392120) (not e!349203))))

(declare-datatypes ((array!37326 0))(
  ( (array!37327 (arr!17911 (Array (_ BitVec 32) (_ BitVec 64))) (size!18275 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37326)

(declare-datatypes ((List!11859 0))(
  ( (Nil!11856) (Cons!11855 (h!12903 (_ BitVec 64)) (t!18079 List!11859)) )
))
(declare-fun arrayNoDuplicates!0 (array!37326 (_ BitVec 32) List!11859) Bool)

(assert (=> b!609693 (= res!392120 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11856))))

(declare-fun b!609694 () Bool)

(declare-fun e!349205 () Bool)

(declare-fun e!349198 () Bool)

(assert (=> b!609694 (= e!349205 (not e!349198))))

(declare-fun res!392105 () Bool)

(assert (=> b!609694 (=> res!392105 e!349198)))

(declare-datatypes ((SeekEntryResult!6307 0))(
  ( (MissingZero!6307 (index!27503 (_ BitVec 32))) (Found!6307 (index!27504 (_ BitVec 32))) (Intermediate!6307 (undefined!7119 Bool) (index!27505 (_ BitVec 32)) (x!56459 (_ BitVec 32))) (Undefined!6307) (MissingVacant!6307 (index!27506 (_ BitVec 32))) )
))
(declare-fun lt!278714 () SeekEntryResult!6307)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609694 (= res!392105 (not (= lt!278714 (Found!6307 index!984))))))

(declare-fun lt!278717 () Unit!19495)

(assert (=> b!609694 (= lt!278717 e!349204)))

(declare-fun c!69164 () Bool)

(assert (=> b!609694 (= c!69164 (= lt!278714 Undefined!6307))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!278719 () array!37326)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!278722 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37326 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!609694 (= lt!278714 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278722 lt!278719 mask!3053))))

(declare-fun e!349195 () Bool)

(assert (=> b!609694 e!349195))

(declare-fun res!392118 () Bool)

(assert (=> b!609694 (=> (not res!392118) (not e!349195))))

(declare-fun lt!278718 () SeekEntryResult!6307)

(declare-fun lt!278715 () (_ BitVec 32))

(assert (=> b!609694 (= res!392118 (= lt!278718 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 lt!278722 lt!278719 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609694 (= lt!278718 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 (select (arr!17911 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!609694 (= lt!278722 (select (store (arr!17911 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278725 () Unit!19495)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37326 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19495)

(assert (=> b!609694 (= lt!278725 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609694 (= lt!278715 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!609695 () Bool)

(declare-fun Unit!19498 () Unit!19495)

(assert (=> b!609695 (= e!349204 Unit!19498)))

(declare-fun b!609696 () Bool)

(declare-fun res!392106 () Bool)

(declare-fun e!349201 () Bool)

(assert (=> b!609696 (=> (not res!392106) (not e!349201))))

(declare-fun arrayContainsKey!0 (array!37326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609696 (= res!392106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609697 () Bool)

(declare-fun res!392110 () Bool)

(assert (=> b!609697 (=> (not res!392110) (not e!349201))))

(assert (=> b!609697 (= res!392110 (and (= (size!18275 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18275 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18275 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609698 () Bool)

(declare-fun e!349197 () Bool)

(assert (=> b!609698 (= e!349197 e!349205)))

(declare-fun res!392123 () Bool)

(assert (=> b!609698 (=> (not res!392123) (not e!349205))))

(declare-fun lt!278720 () SeekEntryResult!6307)

(assert (=> b!609698 (= res!392123 (and (= lt!278720 (Found!6307 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17911 a!2986) index!984) (select (arr!17911 a!2986) j!136))) (not (= (select (arr!17911 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609698 (= lt!278720 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17911 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609699 () Bool)

(declare-fun e!349193 () Bool)

(declare-fun e!349202 () Bool)

(assert (=> b!609699 (= e!349193 e!349202)))

(declare-fun res!392125 () Bool)

(assert (=> b!609699 (=> res!392125 e!349202)))

(assert (=> b!609699 (= res!392125 (bvsge index!984 j!136))))

(declare-fun lt!278721 () Unit!19495)

(declare-fun e!349199 () Unit!19495)

(assert (=> b!609699 (= lt!278721 e!349199)))

(declare-fun c!69163 () Bool)

(assert (=> b!609699 (= c!69163 (bvslt j!136 index!984))))

(declare-fun b!609700 () Bool)

(declare-fun Unit!19499 () Unit!19495)

(assert (=> b!609700 (= e!349199 Unit!19499)))

(declare-fun b!609701 () Bool)

(declare-fun e!349196 () Bool)

(assert (=> b!609701 (= e!349196 true)))

(declare-fun lt!278727 () Bool)

(declare-fun contains!3009 (List!11859 (_ BitVec 64)) Bool)

(assert (=> b!609701 (= lt!278727 (contains!3009 Nil!11856 k0!1786))))

(declare-fun b!609702 () Bool)

(assert (=> b!609702 (= e!349202 e!349196)))

(declare-fun res!392107 () Bool)

(assert (=> b!609702 (=> res!392107 e!349196)))

(assert (=> b!609702 (= res!392107 (or (bvsge (size!18275 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18275 a!2986))))))

(assert (=> b!609702 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278716 () Unit!19495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19495)

(assert (=> b!609702 (= lt!278716 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278719 (select (arr!17911 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349200 () Bool)

(assert (=> b!609702 e!349200))

(declare-fun res!392122 () Bool)

(assert (=> b!609702 (=> (not res!392122) (not e!349200))))

(assert (=> b!609702 (= res!392122 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) j!136))))

(declare-fun b!609703 () Bool)

(declare-fun res!392113 () Bool)

(assert (=> b!609703 (=> (not res!392113) (not e!349201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609703 (= res!392113 (validKeyInArray!0 k0!1786))))

(declare-fun b!609704 () Bool)

(declare-fun res!392115 () Bool)

(assert (=> b!609704 (=> res!392115 e!349196)))

(assert (=> b!609704 (= res!392115 (contains!3009 Nil!11856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609705 () Bool)

(assert (=> b!609705 (= e!349198 e!349193)))

(declare-fun res!392108 () Bool)

(assert (=> b!609705 (=> res!392108 e!349193)))

(declare-fun lt!278724 () (_ BitVec 64))

(assert (=> b!609705 (= res!392108 (or (not (= (select (arr!17911 a!2986) j!136) lt!278722)) (not (= (select (arr!17911 a!2986) j!136) lt!278724))))))

(declare-fun e!349191 () Bool)

(assert (=> b!609705 e!349191))

(declare-fun res!392124 () Bool)

(assert (=> b!609705 (=> (not res!392124) (not e!349191))))

(assert (=> b!609705 (= res!392124 (= lt!278724 (select (arr!17911 a!2986) j!136)))))

(assert (=> b!609705 (= lt!278724 (select (store (arr!17911 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609706 () Bool)

(declare-fun res!392103 () Bool)

(assert (=> b!609706 (=> res!392103 e!349196)))

(declare-fun noDuplicate!343 (List!11859) Bool)

(assert (=> b!609706 (= res!392103 (not (noDuplicate!343 Nil!11856)))))

(declare-fun b!609707 () Bool)

(assert (=> b!609707 (= e!349195 (= lt!278720 lt!278718))))

(declare-fun b!609708 () Bool)

(assert (=> b!609708 (= e!349200 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) index!984))))

(declare-fun b!609709 () Bool)

(assert (=> b!609709 (= e!349201 e!349203)))

(declare-fun res!392114 () Bool)

(assert (=> b!609709 (=> (not res!392114) (not e!349203))))

(declare-fun lt!278712 () SeekEntryResult!6307)

(assert (=> b!609709 (= res!392114 (or (= lt!278712 (MissingZero!6307 i!1108)) (= lt!278712 (MissingVacant!6307 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37326 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!609709 (= lt!278712 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609710 () Bool)

(declare-fun Unit!19500 () Unit!19495)

(assert (=> b!609710 (= e!349199 Unit!19500)))

(declare-fun lt!278723 () Unit!19495)

(assert (=> b!609710 (= lt!278723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278719 (select (arr!17911 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609710 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278726 () Unit!19495)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11859) Unit!19495)

(assert (=> b!609710 (= lt!278726 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11856))))

(assert (=> b!609710 (arrayNoDuplicates!0 lt!278719 #b00000000000000000000000000000000 Nil!11856)))

(declare-fun lt!278713 () Unit!19495)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37326 (_ BitVec 32) (_ BitVec 32)) Unit!19495)

(assert (=> b!609710 (= lt!278713 (lemmaNoDuplicateFromThenFromBigger!0 lt!278719 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609710 (arrayNoDuplicates!0 lt!278719 j!136 Nil!11856)))

(declare-fun lt!278728 () Unit!19495)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37326 (_ BitVec 64) (_ BitVec 32) List!11859) Unit!19495)

(assert (=> b!609710 (= lt!278728 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278719 (select (arr!17911 a!2986) j!136) j!136 Nil!11856))))

(assert (=> b!609710 false))

(declare-fun b!609711 () Bool)

(declare-fun e!349206 () Bool)

(assert (=> b!609711 (= e!349191 e!349206)))

(declare-fun res!392119 () Bool)

(assert (=> b!609711 (=> res!392119 e!349206)))

(assert (=> b!609711 (= res!392119 (or (not (= (select (arr!17911 a!2986) j!136) lt!278722)) (not (= (select (arr!17911 a!2986) j!136) lt!278724)) (bvsge j!136 index!984)))))

(declare-fun b!609712 () Bool)

(declare-fun res!392116 () Bool)

(assert (=> b!609712 (=> (not res!392116) (not e!349203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37326 (_ BitVec 32)) Bool)

(assert (=> b!609712 (= res!392116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609713 () Bool)

(declare-fun res!392109 () Bool)

(assert (=> b!609713 (=> (not res!392109) (not e!349203))))

(assert (=> b!609713 (= res!392109 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17911 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!392104 () Bool)

(assert (=> start!55650 (=> (not res!392104) (not e!349201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55650 (= res!392104 (validMask!0 mask!3053))))

(assert (=> start!55650 e!349201))

(assert (=> start!55650 true))

(declare-fun array_inv!13770 (array!37326) Bool)

(assert (=> start!55650 (array_inv!13770 a!2986)))

(declare-fun b!609714 () Bool)

(assert (=> b!609714 (= e!349203 e!349197)))

(declare-fun res!392121 () Bool)

(assert (=> b!609714 (=> (not res!392121) (not e!349197))))

(assert (=> b!609714 (= res!392121 (= (select (store (arr!17911 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609714 (= lt!278719 (array!37327 (store (arr!17911 a!2986) i!1108 k0!1786) (size!18275 a!2986)))))

(declare-fun b!609715 () Bool)

(declare-fun res!392112 () Bool)

(assert (=> b!609715 (=> (not res!392112) (not e!349201))))

(assert (=> b!609715 (= res!392112 (validKeyInArray!0 (select (arr!17911 a!2986) j!136)))))

(declare-fun b!609716 () Bool)

(declare-fun e!349194 () Bool)

(assert (=> b!609716 (= e!349194 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) index!984))))

(declare-fun b!609717 () Bool)

(declare-fun res!392117 () Bool)

(assert (=> b!609717 (=> res!392117 e!349196)))

(assert (=> b!609717 (= res!392117 (contains!3009 Nil!11856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609718 () Bool)

(assert (=> b!609718 (= e!349206 e!349194)))

(declare-fun res!392111 () Bool)

(assert (=> b!609718 (=> (not res!392111) (not e!349194))))

(assert (=> b!609718 (= res!392111 (arrayContainsKey!0 lt!278719 (select (arr!17911 a!2986) j!136) j!136))))

(assert (= (and start!55650 res!392104) b!609697))

(assert (= (and b!609697 res!392110) b!609715))

(assert (= (and b!609715 res!392112) b!609703))

(assert (= (and b!609703 res!392113) b!609696))

(assert (= (and b!609696 res!392106) b!609709))

(assert (= (and b!609709 res!392114) b!609712))

(assert (= (and b!609712 res!392116) b!609693))

(assert (= (and b!609693 res!392120) b!609713))

(assert (= (and b!609713 res!392109) b!609714))

(assert (= (and b!609714 res!392121) b!609698))

(assert (= (and b!609698 res!392123) b!609694))

(assert (= (and b!609694 res!392118) b!609707))

(assert (= (and b!609694 c!69164) b!609692))

(assert (= (and b!609694 (not c!69164)) b!609695))

(assert (= (and b!609694 (not res!392105)) b!609705))

(assert (= (and b!609705 res!392124) b!609711))

(assert (= (and b!609711 (not res!392119)) b!609718))

(assert (= (and b!609718 res!392111) b!609716))

(assert (= (and b!609705 (not res!392108)) b!609699))

(assert (= (and b!609699 c!69163) b!609710))

(assert (= (and b!609699 (not c!69163)) b!609700))

(assert (= (and b!609699 (not res!392125)) b!609702))

(assert (= (and b!609702 res!392122) b!609708))

(assert (= (and b!609702 (not res!392107)) b!609706))

(assert (= (and b!609706 (not res!392103)) b!609717))

(assert (= (and b!609717 (not res!392117)) b!609704))

(assert (= (and b!609704 (not res!392115)) b!609701))

(declare-fun m!586463 () Bool)

(assert (=> b!609705 m!586463))

(declare-fun m!586465 () Bool)

(assert (=> b!609705 m!586465))

(declare-fun m!586467 () Bool)

(assert (=> b!609705 m!586467))

(declare-fun m!586469 () Bool)

(assert (=> b!609713 m!586469))

(declare-fun m!586471 () Bool)

(assert (=> start!55650 m!586471))

(declare-fun m!586473 () Bool)

(assert (=> start!55650 m!586473))

(assert (=> b!609716 m!586463))

(assert (=> b!609716 m!586463))

(declare-fun m!586475 () Bool)

(assert (=> b!609716 m!586475))

(assert (=> b!609715 m!586463))

(assert (=> b!609715 m!586463))

(declare-fun m!586477 () Bool)

(assert (=> b!609715 m!586477))

(declare-fun m!586479 () Bool)

(assert (=> b!609706 m!586479))

(declare-fun m!586481 () Bool)

(assert (=> b!609710 m!586481))

(declare-fun m!586483 () Bool)

(assert (=> b!609710 m!586483))

(assert (=> b!609710 m!586463))

(assert (=> b!609710 m!586463))

(declare-fun m!586485 () Bool)

(assert (=> b!609710 m!586485))

(assert (=> b!609710 m!586463))

(declare-fun m!586487 () Bool)

(assert (=> b!609710 m!586487))

(assert (=> b!609710 m!586463))

(declare-fun m!586489 () Bool)

(assert (=> b!609710 m!586489))

(declare-fun m!586491 () Bool)

(assert (=> b!609710 m!586491))

(declare-fun m!586493 () Bool)

(assert (=> b!609710 m!586493))

(declare-fun m!586495 () Bool)

(assert (=> b!609712 m!586495))

(declare-fun m!586497 () Bool)

(assert (=> b!609701 m!586497))

(assert (=> b!609711 m!586463))

(assert (=> b!609708 m!586463))

(assert (=> b!609708 m!586463))

(assert (=> b!609708 m!586475))

(declare-fun m!586499 () Bool)

(assert (=> b!609693 m!586499))

(declare-fun m!586501 () Bool)

(assert (=> b!609696 m!586501))

(declare-fun m!586503 () Bool)

(assert (=> b!609717 m!586503))

(declare-fun m!586505 () Bool)

(assert (=> b!609709 m!586505))

(assert (=> b!609714 m!586465))

(declare-fun m!586507 () Bool)

(assert (=> b!609714 m!586507))

(assert (=> b!609718 m!586463))

(assert (=> b!609718 m!586463))

(declare-fun m!586509 () Bool)

(assert (=> b!609718 m!586509))

(declare-fun m!586511 () Bool)

(assert (=> b!609703 m!586511))

(declare-fun m!586513 () Bool)

(assert (=> b!609694 m!586513))

(assert (=> b!609694 m!586463))

(declare-fun m!586515 () Bool)

(assert (=> b!609694 m!586515))

(assert (=> b!609694 m!586463))

(assert (=> b!609694 m!586465))

(declare-fun m!586517 () Bool)

(assert (=> b!609694 m!586517))

(declare-fun m!586519 () Bool)

(assert (=> b!609694 m!586519))

(declare-fun m!586521 () Bool)

(assert (=> b!609694 m!586521))

(declare-fun m!586523 () Bool)

(assert (=> b!609694 m!586523))

(declare-fun m!586525 () Bool)

(assert (=> b!609698 m!586525))

(assert (=> b!609698 m!586463))

(assert (=> b!609698 m!586463))

(declare-fun m!586527 () Bool)

(assert (=> b!609698 m!586527))

(assert (=> b!609702 m!586463))

(assert (=> b!609702 m!586463))

(declare-fun m!586529 () Bool)

(assert (=> b!609702 m!586529))

(assert (=> b!609702 m!586463))

(declare-fun m!586531 () Bool)

(assert (=> b!609702 m!586531))

(assert (=> b!609702 m!586463))

(assert (=> b!609702 m!586509))

(declare-fun m!586533 () Bool)

(assert (=> b!609704 m!586533))

(check-sat (not b!609715) (not b!609693) (not b!609694) (not start!55650) (not b!609704) (not b!609698) (not b!609701) (not b!609696) (not b!609702) (not b!609718) (not b!609717) (not b!609716) (not b!609703) (not b!609708) (not b!609709) (not b!609712) (not b!609706) (not b!609710))
(check-sat)
