; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57004 () Bool)

(assert start!57004)

(declare-fun b!631033 () Bool)

(declare-fun e!360809 () Bool)

(declare-datatypes ((SeekEntryResult!6714 0))(
  ( (MissingZero!6714 (index!29146 (_ BitVec 32))) (Found!6714 (index!29147 (_ BitVec 32))) (Intermediate!6714 (undefined!7526 Bool) (index!29148 (_ BitVec 32)) (x!57884 (_ BitVec 32))) (Undefined!6714) (MissingVacant!6714 (index!29149 (_ BitVec 32))) )
))
(declare-fun lt!291499 () SeekEntryResult!6714)

(declare-fun lt!291501 () SeekEntryResult!6714)

(assert (=> b!631033 (= e!360809 (= lt!291499 lt!291501))))

(declare-fun b!631034 () Bool)

(declare-fun e!360810 () Bool)

(declare-fun e!360813 () Bool)

(assert (=> b!631034 (= e!360810 e!360813)))

(declare-fun res!407988 () Bool)

(assert (=> b!631034 (=> (not res!407988) (not e!360813))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38080 0))(
  ( (array!38081 (arr!18274 (Array (_ BitVec 32) (_ BitVec 64))) (size!18638 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38080)

(assert (=> b!631034 (= res!407988 (= (select (store (arr!18274 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291497 () array!38080)

(assert (=> b!631034 (= lt!291497 (array!38081 (store (arr!18274 a!2986) i!1108 k0!1786) (size!18638 a!2986)))))

(declare-fun res!407993 () Bool)

(declare-fun e!360811 () Bool)

(assert (=> start!57004 (=> (not res!407993) (not e!360811))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57004 (= res!407993 (validMask!0 mask!3053))))

(assert (=> start!57004 e!360811))

(assert (=> start!57004 true))

(declare-fun array_inv!14070 (array!38080) Bool)

(assert (=> start!57004 (array_inv!14070 a!2986)))

(declare-fun b!631035 () Bool)

(assert (=> b!631035 (= e!360811 e!360810)))

(declare-fun res!407991 () Bool)

(assert (=> b!631035 (=> (not res!407991) (not e!360810))))

(declare-fun lt!291495 () SeekEntryResult!6714)

(assert (=> b!631035 (= res!407991 (or (= lt!291495 (MissingZero!6714 i!1108)) (= lt!291495 (MissingVacant!6714 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38080 (_ BitVec 32)) SeekEntryResult!6714)

(assert (=> b!631035 (= lt!291495 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631036 () Bool)

(declare-fun res!407994 () Bool)

(assert (=> b!631036 (=> (not res!407994) (not e!360811))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631036 (= res!407994 (validKeyInArray!0 (select (arr!18274 a!2986) j!136)))))

(declare-fun b!631037 () Bool)

(declare-fun res!407987 () Bool)

(assert (=> b!631037 (=> (not res!407987) (not e!360811))))

(assert (=> b!631037 (= res!407987 (validKeyInArray!0 k0!1786))))

(declare-fun b!631038 () Bool)

(declare-datatypes ((Unit!21190 0))(
  ( (Unit!21191) )
))
(declare-fun e!360812 () Unit!21190)

(declare-fun Unit!21192 () Unit!21190)

(assert (=> b!631038 (= e!360812 Unit!21192)))

(declare-fun b!631039 () Bool)

(declare-fun e!360807 () Bool)

(assert (=> b!631039 (= e!360807 (not true))))

(declare-fun lt!291500 () Unit!21190)

(assert (=> b!631039 (= lt!291500 e!360812)))

(declare-fun lt!291496 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71891 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38080 (_ BitVec 32)) SeekEntryResult!6714)

(assert (=> b!631039 (= c!71891 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291496 lt!291497 mask!3053) Undefined!6714))))

(assert (=> b!631039 e!360809))

(declare-fun res!407985 () Bool)

(assert (=> b!631039 (=> (not res!407985) (not e!360809))))

(declare-fun lt!291498 () (_ BitVec 32))

(assert (=> b!631039 (= res!407985 (= lt!291501 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291498 vacantSpotIndex!68 lt!291496 lt!291497 mask!3053)))))

(assert (=> b!631039 (= lt!291501 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291498 vacantSpotIndex!68 (select (arr!18274 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631039 (= lt!291496 (select (store (arr!18274 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291502 () Unit!21190)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38080 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21190)

(assert (=> b!631039 (= lt!291502 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291498 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631039 (= lt!291498 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631040 () Bool)

(declare-fun res!407996 () Bool)

(assert (=> b!631040 (=> (not res!407996) (not e!360811))))

(declare-fun arrayContainsKey!0 (array!38080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631040 (= res!407996 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631041 () Bool)

(declare-fun res!407989 () Bool)

(assert (=> b!631041 (=> (not res!407989) (not e!360811))))

(assert (=> b!631041 (= res!407989 (and (= (size!18638 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18638 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18638 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631042 () Bool)

(declare-fun res!407986 () Bool)

(assert (=> b!631042 (=> (not res!407986) (not e!360810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38080 (_ BitVec 32)) Bool)

(assert (=> b!631042 (= res!407986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631043 () Bool)

(declare-fun res!407992 () Bool)

(assert (=> b!631043 (=> (not res!407992) (not e!360810))))

(declare-datatypes ((List!12315 0))(
  ( (Nil!12312) (Cons!12311 (h!13356 (_ BitVec 64)) (t!18543 List!12315)) )
))
(declare-fun arrayNoDuplicates!0 (array!38080 (_ BitVec 32) List!12315) Bool)

(assert (=> b!631043 (= res!407992 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12312))))

(declare-fun b!631044 () Bool)

(declare-fun Unit!21193 () Unit!21190)

(assert (=> b!631044 (= e!360812 Unit!21193)))

(assert (=> b!631044 false))

(declare-fun b!631045 () Bool)

(assert (=> b!631045 (= e!360813 e!360807)))

(declare-fun res!407995 () Bool)

(assert (=> b!631045 (=> (not res!407995) (not e!360807))))

(assert (=> b!631045 (= res!407995 (and (= lt!291499 (Found!6714 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18274 a!2986) index!984) (select (arr!18274 a!2986) j!136))) (not (= (select (arr!18274 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631045 (= lt!291499 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18274 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631046 () Bool)

(declare-fun res!407990 () Bool)

(assert (=> b!631046 (=> (not res!407990) (not e!360810))))

(assert (=> b!631046 (= res!407990 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18274 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57004 res!407993) b!631041))

(assert (= (and b!631041 res!407989) b!631036))

(assert (= (and b!631036 res!407994) b!631037))

(assert (= (and b!631037 res!407987) b!631040))

(assert (= (and b!631040 res!407996) b!631035))

(assert (= (and b!631035 res!407991) b!631042))

(assert (= (and b!631042 res!407986) b!631043))

(assert (= (and b!631043 res!407992) b!631046))

(assert (= (and b!631046 res!407990) b!631034))

(assert (= (and b!631034 res!407988) b!631045))

(assert (= (and b!631045 res!407995) b!631039))

(assert (= (and b!631039 res!407985) b!631033))

(assert (= (and b!631039 c!71891) b!631044))

(assert (= (and b!631039 (not c!71891)) b!631038))

(declare-fun m!605983 () Bool)

(assert (=> b!631037 m!605983))

(declare-fun m!605985 () Bool)

(assert (=> b!631035 m!605985))

(declare-fun m!605987 () Bool)

(assert (=> b!631039 m!605987))

(declare-fun m!605989 () Bool)

(assert (=> b!631039 m!605989))

(declare-fun m!605991 () Bool)

(assert (=> b!631039 m!605991))

(declare-fun m!605993 () Bool)

(assert (=> b!631039 m!605993))

(declare-fun m!605995 () Bool)

(assert (=> b!631039 m!605995))

(assert (=> b!631039 m!605991))

(declare-fun m!605997 () Bool)

(assert (=> b!631039 m!605997))

(declare-fun m!605999 () Bool)

(assert (=> b!631039 m!605999))

(declare-fun m!606001 () Bool)

(assert (=> b!631039 m!606001))

(declare-fun m!606003 () Bool)

(assert (=> b!631043 m!606003))

(declare-fun m!606005 () Bool)

(assert (=> b!631042 m!606005))

(assert (=> b!631036 m!605991))

(assert (=> b!631036 m!605991))

(declare-fun m!606007 () Bool)

(assert (=> b!631036 m!606007))

(declare-fun m!606009 () Bool)

(assert (=> b!631040 m!606009))

(assert (=> b!631034 m!605995))

(declare-fun m!606011 () Bool)

(assert (=> b!631034 m!606011))

(declare-fun m!606013 () Bool)

(assert (=> start!57004 m!606013))

(declare-fun m!606015 () Bool)

(assert (=> start!57004 m!606015))

(declare-fun m!606017 () Bool)

(assert (=> b!631045 m!606017))

(assert (=> b!631045 m!605991))

(assert (=> b!631045 m!605991))

(declare-fun m!606019 () Bool)

(assert (=> b!631045 m!606019))

(declare-fun m!606021 () Bool)

(assert (=> b!631046 m!606021))

(check-sat (not b!631036) (not b!631042) (not b!631037) (not b!631039) (not b!631045) (not b!631043) (not start!57004) (not b!631035) (not b!631040))
(check-sat)
