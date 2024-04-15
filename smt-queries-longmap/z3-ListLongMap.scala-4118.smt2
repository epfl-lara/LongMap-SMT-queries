; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56190 () Bool)

(assert start!56190)

(declare-fun b!622658 () Bool)

(assert (=> b!622658 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37674 0))(
  ( (array!37675 (arr!18083 (Array (_ BitVec 32) (_ BitVec 64))) (size!18448 (_ BitVec 32))) )
))
(declare-fun lt!288575 () array!37674)

(declare-fun a!2986 () array!37674)

(declare-datatypes ((Unit!20946 0))(
  ( (Unit!20947) )
))
(declare-fun lt!288579 () Unit!20946)

(declare-datatypes ((List!12163 0))(
  ( (Nil!12160) (Cons!12159 (h!13204 (_ BitVec 64)) (t!18382 List!12163)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37674 (_ BitVec 64) (_ BitVec 32) List!12163) Unit!20946)

(assert (=> b!622658 (= lt!288579 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288575 (select (arr!18083 a!2986) j!136) j!136 Nil!12160))))

(declare-fun arrayNoDuplicates!0 (array!37674 (_ BitVec 32) List!12163) Bool)

(assert (=> b!622658 (arrayNoDuplicates!0 lt!288575 j!136 Nil!12160)))

(declare-fun lt!288568 () Unit!20946)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37674 (_ BitVec 32) (_ BitVec 32)) Unit!20946)

(assert (=> b!622658 (= lt!288568 (lemmaNoDuplicateFromThenFromBigger!0 lt!288575 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622658 (arrayNoDuplicates!0 lt!288575 #b00000000000000000000000000000000 Nil!12160)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!288569 () Unit!20946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12163) Unit!20946)

(assert (=> b!622658 (= lt!288569 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12160))))

(declare-fun arrayContainsKey!0 (array!37674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622658 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288570 () Unit!20946)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37674 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20946)

(assert (=> b!622658 (= lt!288570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288575 (select (arr!18083 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357138 () Unit!20946)

(declare-fun Unit!20948 () Unit!20946)

(assert (=> b!622658 (= e!357138 Unit!20948)))

(declare-fun b!622659 () Bool)

(declare-fun res!401345 () Bool)

(declare-fun e!357126 () Bool)

(assert (=> b!622659 (=> (not res!401345) (not e!357126))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37674 (_ BitVec 32)) Bool)

(assert (=> b!622659 (= res!401345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622660 () Bool)

(declare-fun e!357125 () Bool)

(assert (=> b!622660 (= e!357125 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) index!984))))

(declare-fun b!622661 () Bool)

(declare-fun res!401335 () Bool)

(assert (=> b!622661 (= res!401335 (bvsge j!136 index!984))))

(declare-fun e!357132 () Bool)

(assert (=> b!622661 (=> res!401335 e!357132)))

(declare-fun e!357137 () Bool)

(assert (=> b!622661 (= e!357137 e!357132)))

(declare-fun b!622662 () Bool)

(declare-fun e!357131 () Bool)

(assert (=> b!622662 (= e!357131 (not true))))

(declare-fun lt!288583 () Unit!20946)

(declare-fun e!357134 () Unit!20946)

(assert (=> b!622662 (= lt!288583 e!357134)))

(declare-fun c!71033 () Bool)

(declare-datatypes ((SeekEntryResult!6520 0))(
  ( (MissingZero!6520 (index!28364 (_ BitVec 32))) (Found!6520 (index!28365 (_ BitVec 32))) (Intermediate!6520 (undefined!7332 Bool) (index!28366 (_ BitVec 32)) (x!57139 (_ BitVec 32))) (Undefined!6520) (MissingVacant!6520 (index!28367 (_ BitVec 32))) )
))
(declare-fun lt!288572 () SeekEntryResult!6520)

(assert (=> b!622662 (= c!71033 (= lt!288572 (Found!6520 index!984)))))

(declare-fun lt!288582 () Unit!20946)

(declare-fun e!357128 () Unit!20946)

(assert (=> b!622662 (= lt!288582 e!357128)))

(declare-fun c!71032 () Bool)

(assert (=> b!622662 (= c!71032 (= lt!288572 Undefined!6520))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!288578 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37674 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!622662 (= lt!288572 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288578 lt!288575 mask!3053))))

(declare-fun e!357130 () Bool)

(assert (=> b!622662 e!357130))

(declare-fun res!401336 () Bool)

(assert (=> b!622662 (=> (not res!401336) (not e!357130))))

(declare-fun lt!288564 () SeekEntryResult!6520)

(declare-fun lt!288565 () (_ BitVec 32))

(assert (=> b!622662 (= res!401336 (= lt!288564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288565 vacantSpotIndex!68 lt!288578 lt!288575 mask!3053)))))

(assert (=> b!622662 (= lt!288564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288565 vacantSpotIndex!68 (select (arr!18083 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622662 (= lt!288578 (select (store (arr!18083 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288576 () Unit!20946)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20946)

(assert (=> b!622662 (= lt!288576 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288565 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622662 (= lt!288565 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622663 () Bool)

(declare-fun Unit!20949 () Unit!20946)

(assert (=> b!622663 (= e!357128 Unit!20949)))

(assert (=> b!622663 false))

(declare-fun b!622664 () Bool)

(declare-fun Unit!20950 () Unit!20946)

(assert (=> b!622664 (= e!357138 Unit!20950)))

(declare-fun b!622665 () Bool)

(assert (=> b!622665 false))

(declare-fun lt!288574 () Unit!20946)

(assert (=> b!622665 (= lt!288574 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288575 (select (arr!18083 a!2986) j!136) index!984 Nil!12160))))

(assert (=> b!622665 (arrayNoDuplicates!0 lt!288575 index!984 Nil!12160)))

(declare-fun lt!288567 () Unit!20946)

(assert (=> b!622665 (= lt!288567 (lemmaNoDuplicateFromThenFromBigger!0 lt!288575 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622665 (arrayNoDuplicates!0 lt!288575 #b00000000000000000000000000000000 Nil!12160)))

(declare-fun lt!288581 () Unit!20946)

(assert (=> b!622665 (= lt!288581 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12160))))

(assert (=> b!622665 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288573 () Unit!20946)

(assert (=> b!622665 (= lt!288573 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288575 (select (arr!18083 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622665 e!357125))

(declare-fun res!401343 () Bool)

(assert (=> b!622665 (=> (not res!401343) (not e!357125))))

(assert (=> b!622665 (= res!401343 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) j!136))))

(declare-fun e!357133 () Unit!20946)

(declare-fun Unit!20951 () Unit!20946)

(assert (=> b!622665 (= e!357133 Unit!20951)))

(declare-fun b!622666 () Bool)

(declare-fun e!357136 () Bool)

(assert (=> b!622666 (= e!357136 e!357126)))

(declare-fun res!401337 () Bool)

(assert (=> b!622666 (=> (not res!401337) (not e!357126))))

(declare-fun lt!288577 () SeekEntryResult!6520)

(assert (=> b!622666 (= res!401337 (or (= lt!288577 (MissingZero!6520 i!1108)) (= lt!288577 (MissingVacant!6520 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37674 (_ BitVec 32)) SeekEntryResult!6520)

(assert (=> b!622666 (= lt!288577 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622667 () Bool)

(declare-fun res!401344 () Bool)

(assert (=> b!622667 (=> (not res!401344) (not e!357136))))

(assert (=> b!622667 (= res!401344 (and (= (size!18448 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18448 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18448 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!357127 () Bool)

(declare-fun b!622668 () Bool)

(assert (=> b!622668 (= e!357127 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) index!984))))

(declare-fun b!622670 () Bool)

(declare-fun res!401331 () Bool)

(assert (=> b!622670 (=> (not res!401331) (not e!357136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622670 (= res!401331 (validKeyInArray!0 k0!1786))))

(declare-fun b!622671 () Bool)

(declare-fun res!401332 () Bool)

(assert (=> b!622671 (= res!401332 (arrayContainsKey!0 lt!288575 (select (arr!18083 a!2986) j!136) j!136))))

(assert (=> b!622671 (=> (not res!401332) (not e!357127))))

(assert (=> b!622671 (= e!357132 e!357127)))

(declare-fun b!622672 () Bool)

(declare-fun Unit!20952 () Unit!20946)

(assert (=> b!622672 (= e!357133 Unit!20952)))

(declare-fun b!622673 () Bool)

(declare-fun res!401330 () Bool)

(assert (=> b!622673 (=> (not res!401330) (not e!357126))))

(assert (=> b!622673 (= res!401330 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18083 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622674 () Bool)

(declare-fun Unit!20953 () Unit!20946)

(assert (=> b!622674 (= e!357128 Unit!20953)))

(declare-fun b!622675 () Bool)

(declare-fun e!357135 () Bool)

(assert (=> b!622675 (= e!357126 e!357135)))

(declare-fun res!401340 () Bool)

(assert (=> b!622675 (=> (not res!401340) (not e!357135))))

(assert (=> b!622675 (= res!401340 (= (select (store (arr!18083 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622675 (= lt!288575 (array!37675 (store (arr!18083 a!2986) i!1108 k0!1786) (size!18448 a!2986)))))

(declare-fun b!622676 () Bool)

(declare-fun Unit!20954 () Unit!20946)

(assert (=> b!622676 (= e!357134 Unit!20954)))

(declare-fun b!622677 () Bool)

(declare-fun lt!288580 () SeekEntryResult!6520)

(assert (=> b!622677 (= e!357130 (= lt!288580 lt!288564))))

(declare-fun b!622678 () Bool)

(declare-fun res!401341 () Bool)

(assert (=> b!622678 (=> (not res!401341) (not e!357126))))

(assert (=> b!622678 (= res!401341 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12160))))

(declare-fun b!622679 () Bool)

(assert (=> b!622679 (= e!357135 e!357131)))

(declare-fun res!401338 () Bool)

(assert (=> b!622679 (=> (not res!401338) (not e!357131))))

(assert (=> b!622679 (= res!401338 (and (= lt!288580 (Found!6520 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18083 a!2986) index!984) (select (arr!18083 a!2986) j!136))) (not (= (select (arr!18083 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622679 (= lt!288580 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18083 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622680 () Bool)

(declare-fun res!401334 () Bool)

(assert (=> b!622680 (=> (not res!401334) (not e!357136))))

(assert (=> b!622680 (= res!401334 (validKeyInArray!0 (select (arr!18083 a!2986) j!136)))))

(declare-fun b!622681 () Bool)

(declare-fun Unit!20955 () Unit!20946)

(assert (=> b!622681 (= e!357134 Unit!20955)))

(declare-fun res!401339 () Bool)

(assert (=> b!622681 (= res!401339 (= (select (store (arr!18083 a!2986) i!1108 k0!1786) index!984) (select (arr!18083 a!2986) j!136)))))

(assert (=> b!622681 (=> (not res!401339) (not e!357137))))

(assert (=> b!622681 e!357137))

(declare-fun c!71034 () Bool)

(assert (=> b!622681 (= c!71034 (bvslt j!136 index!984))))

(declare-fun lt!288566 () Unit!20946)

(assert (=> b!622681 (= lt!288566 e!357138)))

(declare-fun c!71031 () Bool)

(assert (=> b!622681 (= c!71031 (bvslt index!984 j!136))))

(declare-fun lt!288571 () Unit!20946)

(assert (=> b!622681 (= lt!288571 e!357133)))

(assert (=> b!622681 false))

(declare-fun res!401333 () Bool)

(assert (=> start!56190 (=> (not res!401333) (not e!357136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56190 (= res!401333 (validMask!0 mask!3053))))

(assert (=> start!56190 e!357136))

(assert (=> start!56190 true))

(declare-fun array_inv!13966 (array!37674) Bool)

(assert (=> start!56190 (array_inv!13966 a!2986)))

(declare-fun b!622669 () Bool)

(declare-fun res!401342 () Bool)

(assert (=> b!622669 (=> (not res!401342) (not e!357136))))

(assert (=> b!622669 (= res!401342 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56190 res!401333) b!622667))

(assert (= (and b!622667 res!401344) b!622680))

(assert (= (and b!622680 res!401334) b!622670))

(assert (= (and b!622670 res!401331) b!622669))

(assert (= (and b!622669 res!401342) b!622666))

(assert (= (and b!622666 res!401337) b!622659))

(assert (= (and b!622659 res!401345) b!622678))

(assert (= (and b!622678 res!401341) b!622673))

(assert (= (and b!622673 res!401330) b!622675))

(assert (= (and b!622675 res!401340) b!622679))

(assert (= (and b!622679 res!401338) b!622662))

(assert (= (and b!622662 res!401336) b!622677))

(assert (= (and b!622662 c!71032) b!622663))

(assert (= (and b!622662 (not c!71032)) b!622674))

(assert (= (and b!622662 c!71033) b!622681))

(assert (= (and b!622662 (not c!71033)) b!622676))

(assert (= (and b!622681 res!401339) b!622661))

(assert (= (and b!622661 (not res!401335)) b!622671))

(assert (= (and b!622671 res!401332) b!622668))

(assert (= (and b!622681 c!71034) b!622658))

(assert (= (and b!622681 (not c!71034)) b!622664))

(assert (= (and b!622681 c!71031) b!622665))

(assert (= (and b!622681 (not c!71031)) b!622672))

(assert (= (and b!622665 res!401343) b!622660))

(declare-fun m!598009 () Bool)

(assert (=> b!622660 m!598009))

(assert (=> b!622660 m!598009))

(declare-fun m!598011 () Bool)

(assert (=> b!622660 m!598011))

(declare-fun m!598013 () Bool)

(assert (=> b!622670 m!598013))

(declare-fun m!598015 () Bool)

(assert (=> b!622679 m!598015))

(assert (=> b!622679 m!598009))

(assert (=> b!622679 m!598009))

(declare-fun m!598017 () Bool)

(assert (=> b!622679 m!598017))

(declare-fun m!598019 () Bool)

(assert (=> b!622669 m!598019))

(declare-fun m!598021 () Bool)

(assert (=> b!622675 m!598021))

(declare-fun m!598023 () Bool)

(assert (=> b!622675 m!598023))

(declare-fun m!598025 () Bool)

(assert (=> start!56190 m!598025))

(declare-fun m!598027 () Bool)

(assert (=> start!56190 m!598027))

(declare-fun m!598029 () Bool)

(assert (=> b!622678 m!598029))

(assert (=> b!622668 m!598009))

(assert (=> b!622668 m!598009))

(assert (=> b!622668 m!598011))

(assert (=> b!622671 m!598009))

(assert (=> b!622671 m!598009))

(declare-fun m!598031 () Bool)

(assert (=> b!622671 m!598031))

(declare-fun m!598033 () Bool)

(assert (=> b!622665 m!598033))

(assert (=> b!622665 m!598009))

(declare-fun m!598035 () Bool)

(assert (=> b!622665 m!598035))

(assert (=> b!622665 m!598009))

(assert (=> b!622665 m!598009))

(declare-fun m!598037 () Bool)

(assert (=> b!622665 m!598037))

(assert (=> b!622665 m!598009))

(assert (=> b!622665 m!598031))

(assert (=> b!622665 m!598009))

(declare-fun m!598039 () Bool)

(assert (=> b!622665 m!598039))

(declare-fun m!598041 () Bool)

(assert (=> b!622665 m!598041))

(declare-fun m!598043 () Bool)

(assert (=> b!622665 m!598043))

(declare-fun m!598045 () Bool)

(assert (=> b!622665 m!598045))

(assert (=> b!622658 m!598009))

(declare-fun m!598047 () Bool)

(assert (=> b!622658 m!598047))

(assert (=> b!622658 m!598009))

(declare-fun m!598049 () Bool)

(assert (=> b!622658 m!598049))

(assert (=> b!622658 m!598045))

(assert (=> b!622658 m!598041))

(declare-fun m!598051 () Bool)

(assert (=> b!622658 m!598051))

(assert (=> b!622658 m!598009))

(declare-fun m!598053 () Bool)

(assert (=> b!622658 m!598053))

(assert (=> b!622658 m!598009))

(declare-fun m!598055 () Bool)

(assert (=> b!622658 m!598055))

(declare-fun m!598057 () Bool)

(assert (=> b!622662 m!598057))

(assert (=> b!622662 m!598009))

(assert (=> b!622662 m!598021))

(declare-fun m!598059 () Bool)

(assert (=> b!622662 m!598059))

(declare-fun m!598061 () Bool)

(assert (=> b!622662 m!598061))

(assert (=> b!622662 m!598009))

(declare-fun m!598063 () Bool)

(assert (=> b!622662 m!598063))

(declare-fun m!598065 () Bool)

(assert (=> b!622662 m!598065))

(declare-fun m!598067 () Bool)

(assert (=> b!622662 m!598067))

(declare-fun m!598069 () Bool)

(assert (=> b!622659 m!598069))

(assert (=> b!622681 m!598021))

(declare-fun m!598071 () Bool)

(assert (=> b!622681 m!598071))

(assert (=> b!622681 m!598009))

(declare-fun m!598073 () Bool)

(assert (=> b!622666 m!598073))

(assert (=> b!622680 m!598009))

(assert (=> b!622680 m!598009))

(declare-fun m!598075 () Bool)

(assert (=> b!622680 m!598075))

(declare-fun m!598077 () Bool)

(assert (=> b!622673 m!598077))

(check-sat (not b!622668) (not b!622670) (not b!622665) (not b!622669) (not b!622658) (not b!622679) (not b!622666) (not b!622659) (not b!622660) (not b!622680) (not b!622678) (not b!622671) (not start!56190) (not b!622662))
(check-sat)
