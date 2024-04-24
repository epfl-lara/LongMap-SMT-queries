; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57318 () Bool)

(assert start!57318)

(declare-fun b!633980 () Bool)

(declare-fun e!362517 () Bool)

(declare-fun e!362523 () Bool)

(assert (=> b!633980 (= e!362517 e!362523)))

(declare-fun res!410000 () Bool)

(assert (=> b!633980 (=> (not res!410000) (not e!362523))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38166 0))(
  ( (array!38167 (arr!18310 (Array (_ BitVec 32) (_ BitVec 64))) (size!18674 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38166)

(assert (=> b!633980 (= res!410000 (= (select (store (arr!18310 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293053 () array!38166)

(assert (=> b!633980 (= lt!293053 (array!38167 (store (arr!18310 a!2986) i!1108 k0!1786) (size!18674 a!2986)))))

(declare-fun b!633981 () Bool)

(declare-fun res!409994 () Bool)

(assert (=> b!633981 (=> (not res!409994) (not e!362517))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38166 (_ BitVec 32)) Bool)

(assert (=> b!633981 (= res!409994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!362525 () Bool)

(declare-fun b!633982 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633982 (= e!362525 (arrayContainsKey!0 lt!293053 (select (arr!18310 a!2986) j!136) index!984))))

(declare-fun b!633983 () Bool)

(declare-fun res!409989 () Bool)

(assert (=> b!633983 (=> (not res!409989) (not e!362517))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633983 (= res!409989 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18310 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633984 () Bool)

(declare-fun res!409987 () Bool)

(declare-fun e!362520 () Bool)

(assert (=> b!633984 (=> (not res!409987) (not e!362520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633984 (= res!409987 (validKeyInArray!0 k0!1786))))

(declare-fun b!633985 () Bool)

(declare-fun res!409997 () Bool)

(assert (=> b!633985 (=> (not res!409997) (not e!362517))))

(declare-datatypes ((List!12258 0))(
  ( (Nil!12255) (Cons!12254 (h!13302 (_ BitVec 64)) (t!18478 List!12258)) )
))
(declare-fun arrayNoDuplicates!0 (array!38166 (_ BitVec 32) List!12258) Bool)

(assert (=> b!633985 (= res!409997 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12255))))

(declare-fun e!362524 () Bool)

(declare-fun lt!293044 () (_ BitVec 64))

(declare-fun b!633986 () Bool)

(declare-fun lt!293050 () (_ BitVec 64))

(assert (=> b!633986 (= e!362524 (or (not (= (select (arr!18310 a!2986) j!136) lt!293050)) (not (= (select (arr!18310 a!2986) j!136) lt!293044)) (bvsge j!136 index!984) (bvsge index!984 (size!18674 a!2986)) (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000)))))

(declare-fun e!362521 () Bool)

(assert (=> b!633986 e!362521))

(declare-fun res!409996 () Bool)

(assert (=> b!633986 (=> (not res!409996) (not e!362521))))

(assert (=> b!633986 (= res!409996 (= lt!293044 (select (arr!18310 a!2986) j!136)))))

(assert (=> b!633986 (= lt!293044 (select (store (arr!18310 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633987 () Bool)

(declare-fun e!362522 () Bool)

(declare-datatypes ((SeekEntryResult!6706 0))(
  ( (MissingZero!6706 (index!29123 (_ BitVec 32))) (Found!6706 (index!29124 (_ BitVec 32))) (Intermediate!6706 (undefined!7518 Bool) (index!29125 (_ BitVec 32)) (x!58018 (_ BitVec 32))) (Undefined!6706) (MissingVacant!6706 (index!29126 (_ BitVec 32))) )
))
(declare-fun lt!293048 () SeekEntryResult!6706)

(declare-fun lt!293047 () SeekEntryResult!6706)

(assert (=> b!633987 (= e!362522 (= lt!293048 lt!293047))))

(declare-fun b!633988 () Bool)

(declare-fun e!362518 () Bool)

(assert (=> b!633988 (= e!362523 e!362518)))

(declare-fun res!409998 () Bool)

(assert (=> b!633988 (=> (not res!409998) (not e!362518))))

(assert (=> b!633988 (= res!409998 (and (= lt!293048 (Found!6706 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18310 a!2986) index!984) (select (arr!18310 a!2986) j!136))) (not (= (select (arr!18310 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38166 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!633988 (= lt!293048 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18310 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633989 () Bool)

(assert (=> b!633989 (= e!362518 (not e!362524))))

(declare-fun res!409991 () Bool)

(assert (=> b!633989 (=> res!409991 e!362524)))

(declare-fun lt!293045 () SeekEntryResult!6706)

(assert (=> b!633989 (= res!409991 (not (= lt!293045 (Found!6706 index!984))))))

(declare-datatypes ((Unit!21333 0))(
  ( (Unit!21334) )
))
(declare-fun lt!293049 () Unit!21333)

(declare-fun e!362519 () Unit!21333)

(assert (=> b!633989 (= lt!293049 e!362519)))

(declare-fun c!72365 () Bool)

(assert (=> b!633989 (= c!72365 (= lt!293045 Undefined!6706))))

(assert (=> b!633989 (= lt!293045 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293050 lt!293053 mask!3053))))

(assert (=> b!633989 e!362522))

(declare-fun res!409992 () Bool)

(assert (=> b!633989 (=> (not res!409992) (not e!362522))))

(declare-fun lt!293051 () (_ BitVec 32))

(assert (=> b!633989 (= res!409992 (= lt!293047 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293051 vacantSpotIndex!68 lt!293050 lt!293053 mask!3053)))))

(assert (=> b!633989 (= lt!293047 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293051 vacantSpotIndex!68 (select (arr!18310 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633989 (= lt!293050 (select (store (arr!18310 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293046 () Unit!21333)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38166 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21333)

(assert (=> b!633989 (= lt!293046 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293051 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633989 (= lt!293051 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!633990 () Bool)

(declare-fun res!409990 () Bool)

(assert (=> b!633990 (=> (not res!409990) (not e!362520))))

(assert (=> b!633990 (= res!409990 (and (= (size!18674 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18674 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18674 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633991 () Bool)

(declare-fun Unit!21335 () Unit!21333)

(assert (=> b!633991 (= e!362519 Unit!21335)))

(assert (=> b!633991 false))

(declare-fun res!410002 () Bool)

(assert (=> start!57318 (=> (not res!410002) (not e!362520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57318 (= res!410002 (validMask!0 mask!3053))))

(assert (=> start!57318 e!362520))

(assert (=> start!57318 true))

(declare-fun array_inv!14169 (array!38166) Bool)

(assert (=> start!57318 (array_inv!14169 a!2986)))

(declare-fun b!633992 () Bool)

(declare-fun Unit!21336 () Unit!21333)

(assert (=> b!633992 (= e!362519 Unit!21336)))

(declare-fun b!633993 () Bool)

(assert (=> b!633993 (= e!362520 e!362517)))

(declare-fun res!410001 () Bool)

(assert (=> b!633993 (=> (not res!410001) (not e!362517))))

(declare-fun lt!293052 () SeekEntryResult!6706)

(assert (=> b!633993 (= res!410001 (or (= lt!293052 (MissingZero!6706 i!1108)) (= lt!293052 (MissingVacant!6706 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38166 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!633993 (= lt!293052 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633994 () Bool)

(declare-fun res!409988 () Bool)

(assert (=> b!633994 (=> (not res!409988) (not e!362520))))

(assert (=> b!633994 (= res!409988 (validKeyInArray!0 (select (arr!18310 a!2986) j!136)))))

(declare-fun b!633995 () Bool)

(declare-fun res!409995 () Bool)

(assert (=> b!633995 (=> (not res!409995) (not e!362520))))

(assert (=> b!633995 (= res!409995 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633996 () Bool)

(declare-fun e!362516 () Bool)

(assert (=> b!633996 (= e!362521 e!362516)))

(declare-fun res!409999 () Bool)

(assert (=> b!633996 (=> res!409999 e!362516)))

(assert (=> b!633996 (= res!409999 (or (not (= (select (arr!18310 a!2986) j!136) lt!293050)) (not (= (select (arr!18310 a!2986) j!136) lt!293044)) (bvsge j!136 index!984)))))

(declare-fun b!633997 () Bool)

(assert (=> b!633997 (= e!362516 e!362525)))

(declare-fun res!409993 () Bool)

(assert (=> b!633997 (=> (not res!409993) (not e!362525))))

(assert (=> b!633997 (= res!409993 (arrayContainsKey!0 lt!293053 (select (arr!18310 a!2986) j!136) j!136))))

(assert (= (and start!57318 res!410002) b!633990))

(assert (= (and b!633990 res!409990) b!633994))

(assert (= (and b!633994 res!409988) b!633984))

(assert (= (and b!633984 res!409987) b!633995))

(assert (= (and b!633995 res!409995) b!633993))

(assert (= (and b!633993 res!410001) b!633981))

(assert (= (and b!633981 res!409994) b!633985))

(assert (= (and b!633985 res!409997) b!633983))

(assert (= (and b!633983 res!409989) b!633980))

(assert (= (and b!633980 res!410000) b!633988))

(assert (= (and b!633988 res!409998) b!633989))

(assert (= (and b!633989 res!409992) b!633987))

(assert (= (and b!633989 c!72365) b!633991))

(assert (= (and b!633989 (not c!72365)) b!633992))

(assert (= (and b!633989 (not res!409991)) b!633986))

(assert (= (and b!633986 res!409996) b!633996))

(assert (= (and b!633996 (not res!409999)) b!633997))

(assert (= (and b!633997 res!409993) b!633982))

(declare-fun m!608923 () Bool)

(assert (=> b!633985 m!608923))

(declare-fun m!608925 () Bool)

(assert (=> b!633993 m!608925))

(declare-fun m!608927 () Bool)

(assert (=> b!633989 m!608927))

(declare-fun m!608929 () Bool)

(assert (=> b!633989 m!608929))

(declare-fun m!608931 () Bool)

(assert (=> b!633989 m!608931))

(assert (=> b!633989 m!608931))

(declare-fun m!608933 () Bool)

(assert (=> b!633989 m!608933))

(declare-fun m!608935 () Bool)

(assert (=> b!633989 m!608935))

(declare-fun m!608937 () Bool)

(assert (=> b!633989 m!608937))

(declare-fun m!608939 () Bool)

(assert (=> b!633989 m!608939))

(declare-fun m!608941 () Bool)

(assert (=> b!633989 m!608941))

(declare-fun m!608943 () Bool)

(assert (=> start!57318 m!608943))

(declare-fun m!608945 () Bool)

(assert (=> start!57318 m!608945))

(declare-fun m!608947 () Bool)

(assert (=> b!633995 m!608947))

(declare-fun m!608949 () Bool)

(assert (=> b!633981 m!608949))

(declare-fun m!608951 () Bool)

(assert (=> b!633984 m!608951))

(assert (=> b!633980 m!608941))

(declare-fun m!608953 () Bool)

(assert (=> b!633980 m!608953))

(declare-fun m!608955 () Bool)

(assert (=> b!633988 m!608955))

(assert (=> b!633988 m!608931))

(assert (=> b!633988 m!608931))

(declare-fun m!608957 () Bool)

(assert (=> b!633988 m!608957))

(assert (=> b!633996 m!608931))

(assert (=> b!633994 m!608931))

(assert (=> b!633994 m!608931))

(declare-fun m!608959 () Bool)

(assert (=> b!633994 m!608959))

(assert (=> b!633982 m!608931))

(assert (=> b!633982 m!608931))

(declare-fun m!608961 () Bool)

(assert (=> b!633982 m!608961))

(assert (=> b!633986 m!608931))

(assert (=> b!633986 m!608941))

(declare-fun m!608963 () Bool)

(assert (=> b!633986 m!608963))

(declare-fun m!608965 () Bool)

(assert (=> b!633983 m!608965))

(assert (=> b!633997 m!608931))

(assert (=> b!633997 m!608931))

(declare-fun m!608967 () Bool)

(assert (=> b!633997 m!608967))

(check-sat (not start!57318) (not b!633993) (not b!633984) (not b!633985) (not b!633994) (not b!633997) (not b!633988) (not b!633982) (not b!633989) (not b!633981) (not b!633995))
(check-sat)
