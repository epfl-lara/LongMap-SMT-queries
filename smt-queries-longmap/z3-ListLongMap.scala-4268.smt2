; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59336 () Bool)

(assert start!59336)

(declare-fun b!654805 () Bool)

(declare-fun res!424821 () Bool)

(declare-fun e!376025 () Bool)

(assert (=> b!654805 (=> (not res!424821) (not e!376025))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38667 0))(
  ( (array!38668 (arr!18533 (Array (_ BitVec 32) (_ BitVec 64))) (size!18898 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38667)

(assert (=> b!654805 (= res!424821 (and (= (size!18898 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18898 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18898 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654806 () Bool)

(declare-datatypes ((Unit!22472 0))(
  ( (Unit!22473) )
))
(declare-fun e!376029 () Unit!22472)

(declare-fun Unit!22474 () Unit!22472)

(assert (=> b!654806 (= e!376029 Unit!22474)))

(declare-fun b!654807 () Bool)

(declare-fun e!376024 () Bool)

(declare-fun e!376034 () Bool)

(assert (=> b!654807 (= e!376024 e!376034)))

(declare-fun res!424820 () Bool)

(assert (=> b!654807 (=> (not res!424820) (not e!376034))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6970 0))(
  ( (MissingZero!6970 (index!30239 (_ BitVec 32))) (Found!6970 (index!30240 (_ BitVec 32))) (Intermediate!6970 (undefined!7782 Bool) (index!30241 (_ BitVec 32)) (x!59038 (_ BitVec 32))) (Undefined!6970) (MissingVacant!6970 (index!30242 (_ BitVec 32))) )
))
(declare-fun lt!305164 () SeekEntryResult!6970)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654807 (= res!424820 (and (= lt!305164 (Found!6970 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18533 a!2986) index!984) (select (arr!18533 a!2986) j!136))) (not (= (select (arr!18533 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38667 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!654807 (= lt!305164 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18533 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654808 () Bool)

(declare-fun Unit!22475 () Unit!22472)

(assert (=> b!654808 (= e!376029 Unit!22475)))

(assert (=> b!654808 false))

(declare-fun res!424818 () Bool)

(assert (=> start!59336 (=> (not res!424818) (not e!376025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59336 (= res!424818 (validMask!0 mask!3053))))

(assert (=> start!59336 e!376025))

(assert (=> start!59336 true))

(declare-fun array_inv!14416 (array!38667) Bool)

(assert (=> start!59336 (array_inv!14416 a!2986)))

(declare-fun b!654809 () Bool)

(assert (=> b!654809 false))

(declare-fun lt!305157 () array!38667)

(declare-fun lt!305165 () Unit!22472)

(declare-datatypes ((List!12613 0))(
  ( (Nil!12610) (Cons!12609 (h!13654 (_ BitVec 64)) (t!18832 List!12613)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38667 (_ BitVec 64) (_ BitVec 32) List!12613) Unit!22472)

(assert (=> b!654809 (= lt!305165 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305157 (select (arr!18533 a!2986) j!136) j!136 Nil!12610))))

(declare-fun arrayNoDuplicates!0 (array!38667 (_ BitVec 32) List!12613) Bool)

(assert (=> b!654809 (arrayNoDuplicates!0 lt!305157 j!136 Nil!12610)))

(declare-fun lt!305166 () Unit!22472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38667 (_ BitVec 32) (_ BitVec 32)) Unit!22472)

(assert (=> b!654809 (= lt!305166 (lemmaNoDuplicateFromThenFromBigger!0 lt!305157 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654809 (arrayNoDuplicates!0 lt!305157 #b00000000000000000000000000000000 Nil!12610)))

(declare-fun lt!305159 () Unit!22472)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12613) Unit!22472)

(assert (=> b!654809 (= lt!305159 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12610))))

(declare-fun arrayContainsKey!0 (array!38667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654809 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305148 () Unit!22472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22472)

(assert (=> b!654809 (= lt!305148 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305157 (select (arr!18533 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376027 () Unit!22472)

(declare-fun Unit!22476 () Unit!22472)

(assert (=> b!654809 (= e!376027 Unit!22476)))

(declare-fun b!654810 () Bool)

(declare-fun e!376023 () Bool)

(assert (=> b!654810 (= e!376023 e!376024)))

(declare-fun res!424827 () Bool)

(assert (=> b!654810 (=> (not res!424827) (not e!376024))))

(assert (=> b!654810 (= res!424827 (= (select (store (arr!18533 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654810 (= lt!305157 (array!38668 (store (arr!18533 a!2986) i!1108 k0!1786) (size!18898 a!2986)))))

(declare-fun e!376030 () Bool)

(declare-fun b!654811 () Bool)

(assert (=> b!654811 (= e!376030 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) index!984))))

(declare-fun b!654812 () Bool)

(declare-fun e!376033 () Unit!22472)

(declare-fun Unit!22477 () Unit!22472)

(assert (=> b!654812 (= e!376033 Unit!22477)))

(declare-fun b!654813 () Bool)

(declare-fun e!376021 () Unit!22472)

(declare-fun Unit!22478 () Unit!22472)

(assert (=> b!654813 (= e!376021 Unit!22478)))

(declare-fun b!654814 () Bool)

(declare-fun e!376026 () Bool)

(declare-fun lt!305158 () SeekEntryResult!6970)

(assert (=> b!654814 (= e!376026 (= lt!305164 lt!305158))))

(declare-fun b!654815 () Bool)

(assert (=> b!654815 (= e!376025 e!376023)))

(declare-fun res!424825 () Bool)

(assert (=> b!654815 (=> (not res!424825) (not e!376023))))

(declare-fun lt!305155 () SeekEntryResult!6970)

(assert (=> b!654815 (= res!424825 (or (= lt!305155 (MissingZero!6970 i!1108)) (= lt!305155 (MissingVacant!6970 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38667 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!654815 (= lt!305155 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654816 () Bool)

(assert (=> b!654816 (= e!376034 (not true))))

(declare-fun lt!305147 () Unit!22472)

(assert (=> b!654816 (= lt!305147 e!376021)))

(declare-fun c!75364 () Bool)

(declare-fun lt!305162 () SeekEntryResult!6970)

(assert (=> b!654816 (= c!75364 (= lt!305162 (Found!6970 index!984)))))

(declare-fun lt!305154 () Unit!22472)

(assert (=> b!654816 (= lt!305154 e!376029)))

(declare-fun c!75365 () Bool)

(assert (=> b!654816 (= c!75365 (= lt!305162 Undefined!6970))))

(declare-fun lt!305149 () (_ BitVec 64))

(assert (=> b!654816 (= lt!305162 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305149 lt!305157 mask!3053))))

(assert (=> b!654816 e!376026))

(declare-fun res!424823 () Bool)

(assert (=> b!654816 (=> (not res!424823) (not e!376026))))

(declare-fun lt!305160 () (_ BitVec 32))

(assert (=> b!654816 (= res!424823 (= lt!305158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305160 vacantSpotIndex!68 lt!305149 lt!305157 mask!3053)))))

(assert (=> b!654816 (= lt!305158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305160 vacantSpotIndex!68 (select (arr!18533 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654816 (= lt!305149 (select (store (arr!18533 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305163 () Unit!22472)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22472)

(assert (=> b!654816 (= lt!305163 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305160 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654816 (= lt!305160 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654817 () Bool)

(declare-fun res!424824 () Bool)

(assert (=> b!654817 (= res!424824 (bvsge j!136 index!984))))

(declare-fun e!376028 () Bool)

(assert (=> b!654817 (=> res!424824 e!376028)))

(declare-fun e!376031 () Bool)

(assert (=> b!654817 (= e!376031 e!376028)))

(declare-fun b!654818 () Bool)

(declare-fun res!424814 () Bool)

(assert (=> b!654818 (=> (not res!424814) (not e!376025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654818 (= res!424814 (validKeyInArray!0 k0!1786))))

(declare-fun b!654819 () Bool)

(declare-fun res!424815 () Bool)

(assert (=> b!654819 (=> (not res!424815) (not e!376023))))

(assert (=> b!654819 (= res!424815 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18533 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654820 () Bool)

(assert (=> b!654820 false))

(declare-fun lt!305152 () Unit!22472)

(assert (=> b!654820 (= lt!305152 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305157 (select (arr!18533 a!2986) j!136) index!984 Nil!12610))))

(assert (=> b!654820 (arrayNoDuplicates!0 lt!305157 index!984 Nil!12610)))

(declare-fun lt!305151 () Unit!22472)

(assert (=> b!654820 (= lt!305151 (lemmaNoDuplicateFromThenFromBigger!0 lt!305157 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654820 (arrayNoDuplicates!0 lt!305157 #b00000000000000000000000000000000 Nil!12610)))

(declare-fun lt!305150 () Unit!22472)

(assert (=> b!654820 (= lt!305150 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12610))))

(assert (=> b!654820 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305161 () Unit!22472)

(assert (=> b!654820 (= lt!305161 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305157 (select (arr!18533 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376032 () Bool)

(assert (=> b!654820 e!376032))

(declare-fun res!424819 () Bool)

(assert (=> b!654820 (=> (not res!424819) (not e!376032))))

(assert (=> b!654820 (= res!424819 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) j!136))))

(declare-fun Unit!22479 () Unit!22472)

(assert (=> b!654820 (= e!376033 Unit!22479)))

(declare-fun b!654821 () Bool)

(declare-fun res!424817 () Bool)

(assert (=> b!654821 (=> (not res!424817) (not e!376025))))

(assert (=> b!654821 (= res!424817 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654822 () Bool)

(declare-fun res!424826 () Bool)

(assert (=> b!654822 (=> (not res!424826) (not e!376023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38667 (_ BitVec 32)) Bool)

(assert (=> b!654822 (= res!424826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654823 () Bool)

(declare-fun res!424828 () Bool)

(assert (=> b!654823 (= res!424828 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) j!136))))

(assert (=> b!654823 (=> (not res!424828) (not e!376030))))

(assert (=> b!654823 (= e!376028 e!376030)))

(declare-fun b!654824 () Bool)

(declare-fun res!424813 () Bool)

(assert (=> b!654824 (=> (not res!424813) (not e!376023))))

(assert (=> b!654824 (= res!424813 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12610))))

(declare-fun b!654825 () Bool)

(declare-fun Unit!22480 () Unit!22472)

(assert (=> b!654825 (= e!376021 Unit!22480)))

(declare-fun res!424822 () Bool)

(assert (=> b!654825 (= res!424822 (= (select (store (arr!18533 a!2986) i!1108 k0!1786) index!984) (select (arr!18533 a!2986) j!136)))))

(assert (=> b!654825 (=> (not res!424822) (not e!376031))))

(assert (=> b!654825 e!376031))

(declare-fun c!75363 () Bool)

(assert (=> b!654825 (= c!75363 (bvslt j!136 index!984))))

(declare-fun lt!305153 () Unit!22472)

(assert (=> b!654825 (= lt!305153 e!376027)))

(declare-fun c!75366 () Bool)

(assert (=> b!654825 (= c!75366 (bvslt index!984 j!136))))

(declare-fun lt!305156 () Unit!22472)

(assert (=> b!654825 (= lt!305156 e!376033)))

(assert (=> b!654825 false))

(declare-fun b!654826 () Bool)

(declare-fun res!424816 () Bool)

(assert (=> b!654826 (=> (not res!424816) (not e!376025))))

(assert (=> b!654826 (= res!424816 (validKeyInArray!0 (select (arr!18533 a!2986) j!136)))))

(declare-fun b!654827 () Bool)

(assert (=> b!654827 (= e!376032 (arrayContainsKey!0 lt!305157 (select (arr!18533 a!2986) j!136) index!984))))

(declare-fun b!654828 () Bool)

(declare-fun Unit!22481 () Unit!22472)

(assert (=> b!654828 (= e!376027 Unit!22481)))

(assert (= (and start!59336 res!424818) b!654805))

(assert (= (and b!654805 res!424821) b!654826))

(assert (= (and b!654826 res!424816) b!654818))

(assert (= (and b!654818 res!424814) b!654821))

(assert (= (and b!654821 res!424817) b!654815))

(assert (= (and b!654815 res!424825) b!654822))

(assert (= (and b!654822 res!424826) b!654824))

(assert (= (and b!654824 res!424813) b!654819))

(assert (= (and b!654819 res!424815) b!654810))

(assert (= (and b!654810 res!424827) b!654807))

(assert (= (and b!654807 res!424820) b!654816))

(assert (= (and b!654816 res!424823) b!654814))

(assert (= (and b!654816 c!75365) b!654808))

(assert (= (and b!654816 (not c!75365)) b!654806))

(assert (= (and b!654816 c!75364) b!654825))

(assert (= (and b!654816 (not c!75364)) b!654813))

(assert (= (and b!654825 res!424822) b!654817))

(assert (= (and b!654817 (not res!424824)) b!654823))

(assert (= (and b!654823 res!424828) b!654811))

(assert (= (and b!654825 c!75363) b!654809))

(assert (= (and b!654825 (not c!75363)) b!654828))

(assert (= (and b!654825 c!75366) b!654820))

(assert (= (and b!654825 (not c!75366)) b!654812))

(assert (= (and b!654820 res!424819) b!654827))

(declare-fun m!627405 () Bool)

(assert (=> b!654822 m!627405))

(declare-fun m!627407 () Bool)

(assert (=> b!654809 m!627407))

(declare-fun m!627409 () Bool)

(assert (=> b!654809 m!627409))

(assert (=> b!654809 m!627407))

(declare-fun m!627411 () Bool)

(assert (=> b!654809 m!627411))

(assert (=> b!654809 m!627407))

(declare-fun m!627413 () Bool)

(assert (=> b!654809 m!627413))

(declare-fun m!627415 () Bool)

(assert (=> b!654809 m!627415))

(declare-fun m!627417 () Bool)

(assert (=> b!654809 m!627417))

(assert (=> b!654809 m!627407))

(declare-fun m!627419 () Bool)

(assert (=> b!654809 m!627419))

(declare-fun m!627421 () Bool)

(assert (=> b!654809 m!627421))

(assert (=> b!654826 m!627407))

(assert (=> b!654826 m!627407))

(declare-fun m!627423 () Bool)

(assert (=> b!654826 m!627423))

(assert (=> b!654811 m!627407))

(assert (=> b!654811 m!627407))

(declare-fun m!627425 () Bool)

(assert (=> b!654811 m!627425))

(declare-fun m!627427 () Bool)

(assert (=> b!654825 m!627427))

(declare-fun m!627429 () Bool)

(assert (=> b!654825 m!627429))

(assert (=> b!654825 m!627407))

(assert (=> b!654827 m!627407))

(assert (=> b!654827 m!627407))

(assert (=> b!654827 m!627425))

(declare-fun m!627431 () Bool)

(assert (=> b!654821 m!627431))

(declare-fun m!627433 () Bool)

(assert (=> b!654824 m!627433))

(declare-fun m!627435 () Bool)

(assert (=> start!59336 m!627435))

(declare-fun m!627437 () Bool)

(assert (=> start!59336 m!627437))

(declare-fun m!627439 () Bool)

(assert (=> b!654819 m!627439))

(assert (=> b!654823 m!627407))

(assert (=> b!654823 m!627407))

(declare-fun m!627441 () Bool)

(assert (=> b!654823 m!627441))

(declare-fun m!627443 () Bool)

(assert (=> b!654818 m!627443))

(declare-fun m!627445 () Bool)

(assert (=> b!654816 m!627445))

(declare-fun m!627447 () Bool)

(assert (=> b!654816 m!627447))

(assert (=> b!654816 m!627407))

(assert (=> b!654816 m!627427))

(declare-fun m!627449 () Bool)

(assert (=> b!654816 m!627449))

(declare-fun m!627451 () Bool)

(assert (=> b!654816 m!627451))

(assert (=> b!654816 m!627407))

(declare-fun m!627453 () Bool)

(assert (=> b!654816 m!627453))

(declare-fun m!627455 () Bool)

(assert (=> b!654816 m!627455))

(declare-fun m!627457 () Bool)

(assert (=> b!654815 m!627457))

(declare-fun m!627459 () Bool)

(assert (=> b!654807 m!627459))

(assert (=> b!654807 m!627407))

(assert (=> b!654807 m!627407))

(declare-fun m!627461 () Bool)

(assert (=> b!654807 m!627461))

(assert (=> b!654820 m!627407))

(assert (=> b!654820 m!627407))

(declare-fun m!627463 () Bool)

(assert (=> b!654820 m!627463))

(assert (=> b!654820 m!627407))

(assert (=> b!654820 m!627441))

(assert (=> b!654820 m!627407))

(declare-fun m!627465 () Bool)

(assert (=> b!654820 m!627465))

(assert (=> b!654820 m!627407))

(declare-fun m!627467 () Bool)

(assert (=> b!654820 m!627467))

(declare-fun m!627469 () Bool)

(assert (=> b!654820 m!627469))

(assert (=> b!654820 m!627415))

(declare-fun m!627471 () Bool)

(assert (=> b!654820 m!627471))

(assert (=> b!654820 m!627417))

(assert (=> b!654810 m!627427))

(declare-fun m!627473 () Bool)

(assert (=> b!654810 m!627473))

(check-sat (not b!654809) (not b!654821) (not b!654807) (not b!654827) (not b!654822) (not b!654820) (not b!654823) (not b!654815) (not b!654816) (not b!654811) (not b!654818) (not b!654826) (not b!654824) (not start!59336))
(check-sat)
