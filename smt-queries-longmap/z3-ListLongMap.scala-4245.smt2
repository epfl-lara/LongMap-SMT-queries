; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58858 () Bool)

(assert start!58858)

(declare-fun res!420352 () Bool)

(declare-fun e!372087 () Bool)

(assert (=> start!58858 (=> (not res!420352) (not e!372087))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58858 (= res!420352 (validMask!0 mask!3053))))

(assert (=> start!58858 e!372087))

(assert (=> start!58858 true))

(declare-datatypes ((array!38520 0))(
  ( (array!38521 (arr!18466 (Array (_ BitVec 32) (_ BitVec 64))) (size!18830 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38520)

(declare-fun array_inv!14262 (array!38520) Bool)

(assert (=> start!58858 (array_inv!14262 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!648729 () Bool)

(declare-fun e!372091 () Bool)

(declare-fun lt!301126 () array!38520)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648729 (= e!372091 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) index!984))))

(declare-fun b!648730 () Bool)

(declare-datatypes ((Unit!22062 0))(
  ( (Unit!22063) )
))
(declare-fun e!372085 () Unit!22062)

(declare-fun Unit!22064 () Unit!22062)

(assert (=> b!648730 (= e!372085 Unit!22064)))

(declare-fun b!648731 () Bool)

(declare-fun e!372092 () Bool)

(declare-datatypes ((SeekEntryResult!6906 0))(
  ( (MissingZero!6906 (index!29971 (_ BitVec 32))) (Found!6906 (index!29972 (_ BitVec 32))) (Intermediate!6906 (undefined!7718 Bool) (index!29973 (_ BitVec 32)) (x!58759 (_ BitVec 32))) (Undefined!6906) (MissingVacant!6906 (index!29974 (_ BitVec 32))) )
))
(declare-fun lt!301124 () SeekEntryResult!6906)

(declare-fun lt!301132 () SeekEntryResult!6906)

(assert (=> b!648731 (= e!372092 (= lt!301124 lt!301132))))

(declare-fun b!648732 () Bool)

(declare-fun e!372084 () Bool)

(declare-fun e!372081 () Bool)

(assert (=> b!648732 (= e!372084 e!372081)))

(declare-fun res!420341 () Bool)

(assert (=> b!648732 (=> res!420341 e!372081)))

(assert (=> b!648732 (= res!420341 (bvsge index!984 j!136))))

(declare-fun lt!301131 () Unit!22062)

(declare-fun e!372079 () Unit!22062)

(assert (=> b!648732 (= lt!301131 e!372079)))

(declare-fun c!74567 () Bool)

(assert (=> b!648732 (= c!74567 (bvslt j!136 index!984))))

(declare-fun b!648733 () Bool)

(declare-fun res!420332 () Bool)

(declare-fun e!372090 () Bool)

(assert (=> b!648733 (=> (not res!420332) (not e!372090))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!648733 (= res!420332 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18466 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648734 () Bool)

(declare-fun e!372086 () Bool)

(declare-fun e!372078 () Bool)

(assert (=> b!648734 (= e!372086 e!372078)))

(declare-fun res!420346 () Bool)

(assert (=> b!648734 (=> (not res!420346) (not e!372078))))

(assert (=> b!648734 (= res!420346 (and (= lt!301124 (Found!6906 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18466 a!2986) index!984) (select (arr!18466 a!2986) j!136))) (not (= (select (arr!18466 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38520 (_ BitVec 32)) SeekEntryResult!6906)

(assert (=> b!648734 (= lt!301124 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18466 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648735 () Bool)

(declare-fun e!372080 () Bool)

(declare-fun e!372088 () Bool)

(assert (=> b!648735 (= e!372080 e!372088)))

(declare-fun res!420351 () Bool)

(assert (=> b!648735 (=> res!420351 e!372088)))

(declare-fun lt!301129 () (_ BitVec 64))

(declare-fun lt!301127 () (_ BitVec 64))

(assert (=> b!648735 (= res!420351 (or (not (= (select (arr!18466 a!2986) j!136) lt!301127)) (not (= (select (arr!18466 a!2986) j!136) lt!301129)) (bvsge j!136 index!984)))))

(declare-fun b!648736 () Bool)

(declare-fun res!420350 () Bool)

(assert (=> b!648736 (=> (not res!420350) (not e!372090))))

(declare-datatypes ((List!12507 0))(
  ( (Nil!12504) (Cons!12503 (h!13548 (_ BitVec 64)) (t!18735 List!12507)) )
))
(declare-fun arrayNoDuplicates!0 (array!38520 (_ BitVec 32) List!12507) Bool)

(assert (=> b!648736 (= res!420350 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12504))))

(declare-fun b!648737 () Bool)

(declare-fun res!420334 () Bool)

(declare-fun e!372082 () Bool)

(assert (=> b!648737 (=> res!420334 e!372082)))

(declare-fun contains!3162 (List!12507 (_ BitVec 64)) Bool)

(assert (=> b!648737 (= res!420334 (contains!3162 Nil!12504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648738 () Bool)

(assert (=> b!648738 (= e!372082 true)))

(declare-fun lt!301135 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!648738 (= lt!301135 (contains!3162 Nil!12504 k0!1786))))

(declare-fun b!648739 () Bool)

(declare-fun res!420343 () Bool)

(assert (=> b!648739 (=> (not res!420343) (not e!372090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38520 (_ BitVec 32)) Bool)

(assert (=> b!648739 (= res!420343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648740 () Bool)

(declare-fun res!420335 () Bool)

(assert (=> b!648740 (=> res!420335 e!372082)))

(declare-fun noDuplicate!424 (List!12507) Bool)

(assert (=> b!648740 (= res!420335 (not (noDuplicate!424 Nil!12504)))))

(declare-fun b!648741 () Bool)

(declare-fun res!420345 () Bool)

(assert (=> b!648741 (=> (not res!420345) (not e!372087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648741 (= res!420345 (validKeyInArray!0 (select (arr!18466 a!2986) j!136)))))

(declare-fun b!648742 () Bool)

(declare-fun Unit!22065 () Unit!22062)

(assert (=> b!648742 (= e!372079 Unit!22065)))

(declare-fun b!648743 () Bool)

(declare-fun e!372083 () Bool)

(assert (=> b!648743 (= e!372078 (not e!372083))))

(declare-fun res!420344 () Bool)

(assert (=> b!648743 (=> res!420344 e!372083)))

(declare-fun lt!301136 () SeekEntryResult!6906)

(assert (=> b!648743 (= res!420344 (not (= lt!301136 (Found!6906 index!984))))))

(declare-fun lt!301125 () Unit!22062)

(assert (=> b!648743 (= lt!301125 e!372085)))

(declare-fun c!74566 () Bool)

(assert (=> b!648743 (= c!74566 (= lt!301136 Undefined!6906))))

(assert (=> b!648743 (= lt!301136 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301127 lt!301126 mask!3053))))

(assert (=> b!648743 e!372092))

(declare-fun res!420331 () Bool)

(assert (=> b!648743 (=> (not res!420331) (not e!372092))))

(declare-fun lt!301137 () (_ BitVec 32))

(assert (=> b!648743 (= res!420331 (= lt!301132 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301137 vacantSpotIndex!68 lt!301127 lt!301126 mask!3053)))))

(assert (=> b!648743 (= lt!301132 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301137 vacantSpotIndex!68 (select (arr!18466 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648743 (= lt!301127 (select (store (arr!18466 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301130 () Unit!22062)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22062)

(assert (=> b!648743 (= lt!301130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301137 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648743 (= lt!301137 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648744 () Bool)

(declare-fun res!420349 () Bool)

(assert (=> b!648744 (=> (not res!420349) (not e!372087))))

(assert (=> b!648744 (= res!420349 (validKeyInArray!0 k0!1786))))

(declare-fun b!648745 () Bool)

(declare-fun res!420333 () Bool)

(assert (=> b!648745 (=> res!420333 e!372082)))

(assert (=> b!648745 (= res!420333 (contains!3162 Nil!12504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648746 () Bool)

(declare-fun res!420347 () Bool)

(assert (=> b!648746 (=> (not res!420347) (not e!372087))))

(assert (=> b!648746 (= res!420347 (and (= (size!18830 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18830 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18830 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648747 () Bool)

(assert (=> b!648747 (= e!372081 e!372082)))

(declare-fun res!420342 () Bool)

(assert (=> b!648747 (=> res!420342 e!372082)))

(assert (=> b!648747 (= res!420342 (or (bvsge (size!18830 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18830 a!2986))))))

(assert (=> b!648747 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301133 () Unit!22062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22062)

(assert (=> b!648747 (= lt!301133 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301126 (select (arr!18466 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372093 () Bool)

(assert (=> b!648747 e!372093))

(declare-fun res!420339 () Bool)

(assert (=> b!648747 (=> (not res!420339) (not e!372093))))

(assert (=> b!648747 (= res!420339 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) j!136))))

(declare-fun b!648748 () Bool)

(assert (=> b!648748 (= e!372090 e!372086)))

(declare-fun res!420337 () Bool)

(assert (=> b!648748 (=> (not res!420337) (not e!372086))))

(assert (=> b!648748 (= res!420337 (= (select (store (arr!18466 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648748 (= lt!301126 (array!38521 (store (arr!18466 a!2986) i!1108 k0!1786) (size!18830 a!2986)))))

(declare-fun b!648749 () Bool)

(declare-fun Unit!22066 () Unit!22062)

(assert (=> b!648749 (= e!372079 Unit!22066)))

(declare-fun lt!301128 () Unit!22062)

(assert (=> b!648749 (= lt!301128 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301126 (select (arr!18466 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648749 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301123 () Unit!22062)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12507) Unit!22062)

(assert (=> b!648749 (= lt!301123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12504))))

(assert (=> b!648749 (arrayNoDuplicates!0 lt!301126 #b00000000000000000000000000000000 Nil!12504)))

(declare-fun lt!301122 () Unit!22062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38520 (_ BitVec 32) (_ BitVec 32)) Unit!22062)

(assert (=> b!648749 (= lt!301122 (lemmaNoDuplicateFromThenFromBigger!0 lt!301126 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648749 (arrayNoDuplicates!0 lt!301126 j!136 Nil!12504)))

(declare-fun lt!301134 () Unit!22062)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38520 (_ BitVec 64) (_ BitVec 32) List!12507) Unit!22062)

(assert (=> b!648749 (= lt!301134 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301126 (select (arr!18466 a!2986) j!136) j!136 Nil!12504))))

(assert (=> b!648749 false))

(declare-fun b!648750 () Bool)

(declare-fun res!420338 () Bool)

(assert (=> b!648750 (=> (not res!420338) (not e!372087))))

(assert (=> b!648750 (= res!420338 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648751 () Bool)

(assert (=> b!648751 (= e!372083 e!372084)))

(declare-fun res!420348 () Bool)

(assert (=> b!648751 (=> res!420348 e!372084)))

(assert (=> b!648751 (= res!420348 (or (not (= (select (arr!18466 a!2986) j!136) lt!301127)) (not (= (select (arr!18466 a!2986) j!136) lt!301129))))))

(assert (=> b!648751 e!372080))

(declare-fun res!420340 () Bool)

(assert (=> b!648751 (=> (not res!420340) (not e!372080))))

(assert (=> b!648751 (= res!420340 (= lt!301129 (select (arr!18466 a!2986) j!136)))))

(assert (=> b!648751 (= lt!301129 (select (store (arr!18466 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648752 () Bool)

(declare-fun Unit!22067 () Unit!22062)

(assert (=> b!648752 (= e!372085 Unit!22067)))

(assert (=> b!648752 false))

(declare-fun b!648753 () Bool)

(assert (=> b!648753 (= e!372088 e!372091)))

(declare-fun res!420353 () Bool)

(assert (=> b!648753 (=> (not res!420353) (not e!372091))))

(assert (=> b!648753 (= res!420353 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) j!136))))

(declare-fun b!648754 () Bool)

(assert (=> b!648754 (= e!372087 e!372090)))

(declare-fun res!420336 () Bool)

(assert (=> b!648754 (=> (not res!420336) (not e!372090))))

(declare-fun lt!301138 () SeekEntryResult!6906)

(assert (=> b!648754 (= res!420336 (or (= lt!301138 (MissingZero!6906 i!1108)) (= lt!301138 (MissingVacant!6906 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38520 (_ BitVec 32)) SeekEntryResult!6906)

(assert (=> b!648754 (= lt!301138 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648755 () Bool)

(assert (=> b!648755 (= e!372093 (arrayContainsKey!0 lt!301126 (select (arr!18466 a!2986) j!136) index!984))))

(assert (= (and start!58858 res!420352) b!648746))

(assert (= (and b!648746 res!420347) b!648741))

(assert (= (and b!648741 res!420345) b!648744))

(assert (= (and b!648744 res!420349) b!648750))

(assert (= (and b!648750 res!420338) b!648754))

(assert (= (and b!648754 res!420336) b!648739))

(assert (= (and b!648739 res!420343) b!648736))

(assert (= (and b!648736 res!420350) b!648733))

(assert (= (and b!648733 res!420332) b!648748))

(assert (= (and b!648748 res!420337) b!648734))

(assert (= (and b!648734 res!420346) b!648743))

(assert (= (and b!648743 res!420331) b!648731))

(assert (= (and b!648743 c!74566) b!648752))

(assert (= (and b!648743 (not c!74566)) b!648730))

(assert (= (and b!648743 (not res!420344)) b!648751))

(assert (= (and b!648751 res!420340) b!648735))

(assert (= (and b!648735 (not res!420351)) b!648753))

(assert (= (and b!648753 res!420353) b!648729))

(assert (= (and b!648751 (not res!420348)) b!648732))

(assert (= (and b!648732 c!74567) b!648749))

(assert (= (and b!648732 (not c!74567)) b!648742))

(assert (= (and b!648732 (not res!420341)) b!648747))

(assert (= (and b!648747 res!420339) b!648755))

(assert (= (and b!648747 (not res!420342)) b!648740))

(assert (= (and b!648740 (not res!420335)) b!648745))

(assert (= (and b!648745 (not res!420333)) b!648737))

(assert (= (and b!648737 (not res!420334)) b!648738))

(declare-fun m!622061 () Bool)

(assert (=> b!648736 m!622061))

(declare-fun m!622063 () Bool)

(assert (=> b!648738 m!622063))

(declare-fun m!622065 () Bool)

(assert (=> b!648748 m!622065))

(declare-fun m!622067 () Bool)

(assert (=> b!648748 m!622067))

(declare-fun m!622069 () Bool)

(assert (=> b!648754 m!622069))

(declare-fun m!622071 () Bool)

(assert (=> b!648734 m!622071))

(declare-fun m!622073 () Bool)

(assert (=> b!648734 m!622073))

(assert (=> b!648734 m!622073))

(declare-fun m!622075 () Bool)

(assert (=> b!648734 m!622075))

(assert (=> b!648729 m!622073))

(assert (=> b!648729 m!622073))

(declare-fun m!622077 () Bool)

(assert (=> b!648729 m!622077))

(declare-fun m!622079 () Bool)

(assert (=> b!648740 m!622079))

(assert (=> b!648755 m!622073))

(assert (=> b!648755 m!622073))

(assert (=> b!648755 m!622077))

(assert (=> b!648735 m!622073))

(declare-fun m!622081 () Bool)

(assert (=> b!648743 m!622081))

(declare-fun m!622083 () Bool)

(assert (=> b!648743 m!622083))

(assert (=> b!648743 m!622073))

(declare-fun m!622085 () Bool)

(assert (=> b!648743 m!622085))

(assert (=> b!648743 m!622073))

(assert (=> b!648743 m!622065))

(declare-fun m!622087 () Bool)

(assert (=> b!648743 m!622087))

(declare-fun m!622089 () Bool)

(assert (=> b!648743 m!622089))

(declare-fun m!622091 () Bool)

(assert (=> b!648743 m!622091))

(assert (=> b!648751 m!622073))

(assert (=> b!648751 m!622065))

(declare-fun m!622093 () Bool)

(assert (=> b!648751 m!622093))

(assert (=> b!648747 m!622073))

(assert (=> b!648747 m!622073))

(declare-fun m!622095 () Bool)

(assert (=> b!648747 m!622095))

(assert (=> b!648747 m!622073))

(declare-fun m!622097 () Bool)

(assert (=> b!648747 m!622097))

(assert (=> b!648747 m!622073))

(declare-fun m!622099 () Bool)

(assert (=> b!648747 m!622099))

(declare-fun m!622101 () Bool)

(assert (=> b!648750 m!622101))

(declare-fun m!622103 () Bool)

(assert (=> b!648745 m!622103))

(assert (=> b!648741 m!622073))

(assert (=> b!648741 m!622073))

(declare-fun m!622105 () Bool)

(assert (=> b!648741 m!622105))

(declare-fun m!622107 () Bool)

(assert (=> start!58858 m!622107))

(declare-fun m!622109 () Bool)

(assert (=> start!58858 m!622109))

(declare-fun m!622111 () Bool)

(assert (=> b!648744 m!622111))

(declare-fun m!622113 () Bool)

(assert (=> b!648737 m!622113))

(declare-fun m!622115 () Bool)

(assert (=> b!648733 m!622115))

(declare-fun m!622117 () Bool)

(assert (=> b!648739 m!622117))

(assert (=> b!648753 m!622073))

(assert (=> b!648753 m!622073))

(assert (=> b!648753 m!622099))

(declare-fun m!622119 () Bool)

(assert (=> b!648749 m!622119))

(declare-fun m!622121 () Bool)

(assert (=> b!648749 m!622121))

(assert (=> b!648749 m!622073))

(assert (=> b!648749 m!622073))

(declare-fun m!622123 () Bool)

(assert (=> b!648749 m!622123))

(assert (=> b!648749 m!622073))

(declare-fun m!622125 () Bool)

(assert (=> b!648749 m!622125))

(assert (=> b!648749 m!622073))

(declare-fun m!622127 () Bool)

(assert (=> b!648749 m!622127))

(declare-fun m!622129 () Bool)

(assert (=> b!648749 m!622129))

(declare-fun m!622131 () Bool)

(assert (=> b!648749 m!622131))

(check-sat (not b!648738) (not b!648749) (not b!648745) (not b!648739) (not start!58858) (not b!648750) (not b!648744) (not b!648736) (not b!648729) (not b!648747) (not b!648737) (not b!648753) (not b!648734) (not b!648743) (not b!648741) (not b!648755) (not b!648754) (not b!648740))
(check-sat)
