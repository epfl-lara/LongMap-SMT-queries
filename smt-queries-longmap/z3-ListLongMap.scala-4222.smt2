; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57984 () Bool)

(assert start!57984)

(declare-fun b!640996 () Bool)

(declare-fun res!415122 () Bool)

(declare-fun e!366968 () Bool)

(assert (=> b!640996 (=> (not res!415122) (not e!366968))))

(declare-datatypes ((array!38349 0))(
  ( (array!38350 (arr!18391 (Array (_ BitVec 32) (_ BitVec 64))) (size!18755 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38349)

(declare-datatypes ((List!12339 0))(
  ( (Nil!12336) (Cons!12335 (h!13383 (_ BitVec 64)) (t!18559 List!12339)) )
))
(declare-fun arrayNoDuplicates!0 (array!38349 (_ BitVec 32) List!12339) Bool)

(assert (=> b!640996 (= res!415122 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12336))))

(declare-fun res!415128 () Bool)

(declare-fun e!366966 () Bool)

(assert (=> start!57984 (=> (not res!415128) (not e!366966))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57984 (= res!415128 (validMask!0 mask!3053))))

(assert (=> start!57984 e!366966))

(assert (=> start!57984 true))

(declare-fun array_inv!14250 (array!38349) Bool)

(assert (=> start!57984 (array_inv!14250 a!2986)))

(declare-fun b!640997 () Bool)

(declare-fun res!415118 () Bool)

(assert (=> b!640997 (=> (not res!415118) (not e!366968))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640997 (= res!415118 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18391 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640998 () Bool)

(declare-fun e!366967 () Bool)

(assert (=> b!640998 (= e!366967 true)))

(declare-fun lt!296729 () array!38349)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!640998 (arrayNoDuplicates!0 lt!296729 j!136 Nil!12336)))

(declare-datatypes ((Unit!21657 0))(
  ( (Unit!21658) )
))
(declare-fun lt!296725 () Unit!21657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38349 (_ BitVec 32) (_ BitVec 32)) Unit!21657)

(assert (=> b!640998 (= lt!296725 (lemmaNoDuplicateFromThenFromBigger!0 lt!296729 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640998 (arrayNoDuplicates!0 lt!296729 #b00000000000000000000000000000000 Nil!12336)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!296726 () Unit!21657)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12339) Unit!21657)

(assert (=> b!640998 (= lt!296726 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12336))))

(declare-fun arrayContainsKey!0 (array!38349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640998 (arrayContainsKey!0 lt!296729 (select (arr!18391 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296723 () Unit!21657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21657)

(assert (=> b!640998 (= lt!296723 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296729 (select (arr!18391 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640999 () Bool)

(declare-fun e!366969 () Bool)

(declare-datatypes ((SeekEntryResult!6787 0))(
  ( (MissingZero!6787 (index!29468 (_ BitVec 32))) (Found!6787 (index!29469 (_ BitVec 32))) (Intermediate!6787 (undefined!7599 Bool) (index!29470 (_ BitVec 32)) (x!58378 (_ BitVec 32))) (Undefined!6787) (MissingVacant!6787 (index!29471 (_ BitVec 32))) )
))
(declare-fun lt!296727 () SeekEntryResult!6787)

(declare-fun lt!296728 () SeekEntryResult!6787)

(assert (=> b!640999 (= e!366969 (= lt!296727 lt!296728))))

(declare-fun b!641000 () Bool)

(declare-fun e!366958 () Bool)

(assert (=> b!641000 (= e!366958 e!366967)))

(declare-fun res!415116 () Bool)

(assert (=> b!641000 (=> res!415116 e!366967)))

(declare-fun lt!296730 () (_ BitVec 64))

(declare-fun lt!296734 () (_ BitVec 64))

(assert (=> b!641000 (= res!415116 (or (not (= (select (arr!18391 a!2986) j!136) lt!296734)) (not (= (select (arr!18391 a!2986) j!136) lt!296730)) (bvsge j!136 index!984)))))

(declare-fun e!366959 () Bool)

(assert (=> b!641000 e!366959))

(declare-fun res!415121 () Bool)

(assert (=> b!641000 (=> (not res!415121) (not e!366959))))

(assert (=> b!641000 (= res!415121 (= lt!296730 (select (arr!18391 a!2986) j!136)))))

(assert (=> b!641000 (= lt!296730 (select (store (arr!18391 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641001 () Bool)

(declare-fun res!415126 () Bool)

(assert (=> b!641001 (=> (not res!415126) (not e!366966))))

(assert (=> b!641001 (= res!415126 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641002 () Bool)

(declare-fun e!366962 () Bool)

(declare-fun e!366960 () Bool)

(assert (=> b!641002 (= e!366962 e!366960)))

(declare-fun res!415113 () Bool)

(assert (=> b!641002 (=> (not res!415113) (not e!366960))))

(assert (=> b!641002 (= res!415113 (and (= lt!296727 (Found!6787 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18391 a!2986) index!984) (select (arr!18391 a!2986) j!136))) (not (= (select (arr!18391 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38349 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!641002 (= lt!296727 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18391 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641003 () Bool)

(declare-fun e!366963 () Unit!21657)

(declare-fun Unit!21659 () Unit!21657)

(assert (=> b!641003 (= e!366963 Unit!21659)))

(declare-fun b!641004 () Bool)

(declare-fun e!366964 () Bool)

(assert (=> b!641004 (= e!366959 e!366964)))

(declare-fun res!415127 () Bool)

(assert (=> b!641004 (=> res!415127 e!366964)))

(assert (=> b!641004 (= res!415127 (or (not (= (select (arr!18391 a!2986) j!136) lt!296734)) (not (= (select (arr!18391 a!2986) j!136) lt!296730)) (bvsge j!136 index!984)))))

(declare-fun b!641005 () Bool)

(assert (=> b!641005 (= e!366966 e!366968)))

(declare-fun res!415114 () Bool)

(assert (=> b!641005 (=> (not res!415114) (not e!366968))))

(declare-fun lt!296724 () SeekEntryResult!6787)

(assert (=> b!641005 (= res!415114 (or (= lt!296724 (MissingZero!6787 i!1108)) (= lt!296724 (MissingVacant!6787 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38349 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!641005 (= lt!296724 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641006 () Bool)

(assert (=> b!641006 (= e!366960 (not e!366958))))

(declare-fun res!415124 () Bool)

(assert (=> b!641006 (=> res!415124 e!366958)))

(declare-fun lt!296732 () SeekEntryResult!6787)

(assert (=> b!641006 (= res!415124 (not (= lt!296732 (Found!6787 index!984))))))

(declare-fun lt!296731 () Unit!21657)

(assert (=> b!641006 (= lt!296731 e!366963)))

(declare-fun c!73310 () Bool)

(assert (=> b!641006 (= c!73310 (= lt!296732 Undefined!6787))))

(assert (=> b!641006 (= lt!296732 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296734 lt!296729 mask!3053))))

(assert (=> b!641006 e!366969))

(declare-fun res!415125 () Bool)

(assert (=> b!641006 (=> (not res!415125) (not e!366969))))

(declare-fun lt!296722 () (_ BitVec 32))

(assert (=> b!641006 (= res!415125 (= lt!296728 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296722 vacantSpotIndex!68 lt!296734 lt!296729 mask!3053)))))

(assert (=> b!641006 (= lt!296728 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296722 vacantSpotIndex!68 (select (arr!18391 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641006 (= lt!296734 (select (store (arr!18391 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296733 () Unit!21657)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21657)

(assert (=> b!641006 (= lt!296733 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296722 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641006 (= lt!296722 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!641007 () Bool)

(declare-fun res!415115 () Bool)

(assert (=> b!641007 (=> (not res!415115) (not e!366968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38349 (_ BitVec 32)) Bool)

(assert (=> b!641007 (= res!415115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641008 () Bool)

(declare-fun e!366961 () Bool)

(assert (=> b!641008 (= e!366964 e!366961)))

(declare-fun res!415120 () Bool)

(assert (=> b!641008 (=> (not res!415120) (not e!366961))))

(assert (=> b!641008 (= res!415120 (arrayContainsKey!0 lt!296729 (select (arr!18391 a!2986) j!136) j!136))))

(declare-fun b!641009 () Bool)

(assert (=> b!641009 (= e!366968 e!366962)))

(declare-fun res!415123 () Bool)

(assert (=> b!641009 (=> (not res!415123) (not e!366962))))

(assert (=> b!641009 (= res!415123 (= (select (store (arr!18391 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641009 (= lt!296729 (array!38350 (store (arr!18391 a!2986) i!1108 k0!1786) (size!18755 a!2986)))))

(declare-fun b!641010 () Bool)

(declare-fun res!415117 () Bool)

(assert (=> b!641010 (=> (not res!415117) (not e!366966))))

(assert (=> b!641010 (= res!415117 (and (= (size!18755 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18755 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18755 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641011 () Bool)

(assert (=> b!641011 (= e!366961 (arrayContainsKey!0 lt!296729 (select (arr!18391 a!2986) j!136) index!984))))

(declare-fun b!641012 () Bool)

(declare-fun res!415129 () Bool)

(assert (=> b!641012 (=> (not res!415129) (not e!366966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641012 (= res!415129 (validKeyInArray!0 (select (arr!18391 a!2986) j!136)))))

(declare-fun b!641013 () Bool)

(declare-fun Unit!21660 () Unit!21657)

(assert (=> b!641013 (= e!366963 Unit!21660)))

(assert (=> b!641013 false))

(declare-fun b!641014 () Bool)

(declare-fun res!415119 () Bool)

(assert (=> b!641014 (=> (not res!415119) (not e!366966))))

(assert (=> b!641014 (= res!415119 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57984 res!415128) b!641010))

(assert (= (and b!641010 res!415117) b!641012))

(assert (= (and b!641012 res!415129) b!641014))

(assert (= (and b!641014 res!415119) b!641001))

(assert (= (and b!641001 res!415126) b!641005))

(assert (= (and b!641005 res!415114) b!641007))

(assert (= (and b!641007 res!415115) b!640996))

(assert (= (and b!640996 res!415122) b!640997))

(assert (= (and b!640997 res!415118) b!641009))

(assert (= (and b!641009 res!415123) b!641002))

(assert (= (and b!641002 res!415113) b!641006))

(assert (= (and b!641006 res!415125) b!640999))

(assert (= (and b!641006 c!73310) b!641013))

(assert (= (and b!641006 (not c!73310)) b!641003))

(assert (= (and b!641006 (not res!415124)) b!641000))

(assert (= (and b!641000 res!415121) b!641004))

(assert (= (and b!641004 (not res!415127)) b!641008))

(assert (= (and b!641008 res!415120) b!641011))

(assert (= (and b!641000 (not res!415116)) b!640998))

(declare-fun m!615211 () Bool)

(assert (=> b!641014 m!615211))

(declare-fun m!615213 () Bool)

(assert (=> b!641008 m!615213))

(assert (=> b!641008 m!615213))

(declare-fun m!615215 () Bool)

(assert (=> b!641008 m!615215))

(assert (=> b!641004 m!615213))

(declare-fun m!615217 () Bool)

(assert (=> b!641002 m!615217))

(assert (=> b!641002 m!615213))

(assert (=> b!641002 m!615213))

(declare-fun m!615219 () Bool)

(assert (=> b!641002 m!615219))

(declare-fun m!615221 () Bool)

(assert (=> b!640998 m!615221))

(assert (=> b!640998 m!615213))

(assert (=> b!640998 m!615213))

(declare-fun m!615223 () Bool)

(assert (=> b!640998 m!615223))

(assert (=> b!640998 m!615213))

(declare-fun m!615225 () Bool)

(assert (=> b!640998 m!615225))

(declare-fun m!615227 () Bool)

(assert (=> b!640998 m!615227))

(declare-fun m!615229 () Bool)

(assert (=> b!640998 m!615229))

(declare-fun m!615231 () Bool)

(assert (=> b!640998 m!615231))

(declare-fun m!615233 () Bool)

(assert (=> start!57984 m!615233))

(declare-fun m!615235 () Bool)

(assert (=> start!57984 m!615235))

(assert (=> b!641012 m!615213))

(assert (=> b!641012 m!615213))

(declare-fun m!615237 () Bool)

(assert (=> b!641012 m!615237))

(declare-fun m!615239 () Bool)

(assert (=> b!641007 m!615239))

(assert (=> b!641000 m!615213))

(declare-fun m!615241 () Bool)

(assert (=> b!641000 m!615241))

(declare-fun m!615243 () Bool)

(assert (=> b!641000 m!615243))

(assert (=> b!641009 m!615241))

(declare-fun m!615245 () Bool)

(assert (=> b!641009 m!615245))

(declare-fun m!615247 () Bool)

(assert (=> b!641006 m!615247))

(declare-fun m!615249 () Bool)

(assert (=> b!641006 m!615249))

(assert (=> b!641006 m!615213))

(assert (=> b!641006 m!615241))

(declare-fun m!615251 () Bool)

(assert (=> b!641006 m!615251))

(declare-fun m!615253 () Bool)

(assert (=> b!641006 m!615253))

(declare-fun m!615255 () Bool)

(assert (=> b!641006 m!615255))

(assert (=> b!641006 m!615213))

(declare-fun m!615257 () Bool)

(assert (=> b!641006 m!615257))

(assert (=> b!641011 m!615213))

(assert (=> b!641011 m!615213))

(declare-fun m!615259 () Bool)

(assert (=> b!641011 m!615259))

(declare-fun m!615261 () Bool)

(assert (=> b!641005 m!615261))

(declare-fun m!615263 () Bool)

(assert (=> b!641001 m!615263))

(declare-fun m!615265 () Bool)

(assert (=> b!640997 m!615265))

(declare-fun m!615267 () Bool)

(assert (=> b!640996 m!615267))

(check-sat (not b!641011) (not b!641007) (not start!57984) (not b!640998) (not b!641001) (not b!641005) (not b!641002) (not b!640996) (not b!641008) (not b!641006) (not b!641014) (not b!641012))
(check-sat)
