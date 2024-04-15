; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58838 () Bool)

(assert start!58838)

(declare-fun res!419931 () Bool)

(declare-fun e!371708 () Bool)

(assert (=> start!58838 (=> (not res!419931) (not e!371708))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58838 (= res!419931 (validMask!0 mask!3053))))

(assert (=> start!58838 e!371708))

(assert (=> start!58838 true))

(declare-datatypes ((array!38511 0))(
  ( (array!38512 (arr!18461 (Array (_ BitVec 32) (_ BitVec 64))) (size!18826 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38511)

(declare-fun array_inv!14344 (array!38511) Bool)

(assert (=> start!58838 (array_inv!14344 a!2986)))

(declare-fun b!648109 () Bool)

(declare-fun e!371696 () Bool)

(declare-fun e!371707 () Bool)

(assert (=> b!648109 (= e!371696 (not e!371707))))

(declare-fun res!419938 () Bool)

(assert (=> b!648109 (=> res!419938 e!371707)))

(declare-datatypes ((SeekEntryResult!6898 0))(
  ( (MissingZero!6898 (index!29939 (_ BitVec 32))) (Found!6898 (index!29940 (_ BitVec 32))) (Intermediate!6898 (undefined!7710 Bool) (index!29941 (_ BitVec 32)) (x!58738 (_ BitVec 32))) (Undefined!6898) (MissingVacant!6898 (index!29942 (_ BitVec 32))) )
))
(declare-fun lt!300662 () SeekEntryResult!6898)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!648109 (= res!419938 (not (= lt!300662 (Found!6898 index!984))))))

(declare-datatypes ((Unit!22016 0))(
  ( (Unit!22017) )
))
(declare-fun lt!300663 () Unit!22016)

(declare-fun e!371698 () Unit!22016)

(assert (=> b!648109 (= lt!300663 e!371698)))

(declare-fun c!74462 () Bool)

(assert (=> b!648109 (= c!74462 (= lt!300662 Undefined!6898))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!300666 () (_ BitVec 64))

(declare-fun lt!300675 () array!38511)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38511 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!648109 (= lt!300662 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300666 lt!300675 mask!3053))))

(declare-fun e!371701 () Bool)

(assert (=> b!648109 e!371701))

(declare-fun res!419934 () Bool)

(assert (=> b!648109 (=> (not res!419934) (not e!371701))))

(declare-fun lt!300670 () (_ BitVec 32))

(declare-fun lt!300671 () SeekEntryResult!6898)

(assert (=> b!648109 (= res!419934 (= lt!300671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300670 vacantSpotIndex!68 lt!300666 lt!300675 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!648109 (= lt!300671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300670 vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!648109 (= lt!300666 (select (store (arr!18461 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300668 () Unit!22016)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38511 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22016)

(assert (=> b!648109 (= lt!300668 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300670 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648109 (= lt!300670 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648110 () Bool)

(declare-fun e!371697 () Bool)

(assert (=> b!648110 (= e!371697 true)))

(declare-fun lt!300672 () Bool)

(declare-datatypes ((List!12541 0))(
  ( (Nil!12538) (Cons!12537 (h!13582 (_ BitVec 64)) (t!18760 List!12541)) )
))
(declare-fun contains!3142 (List!12541 (_ BitVec 64)) Bool)

(assert (=> b!648110 (= lt!300672 (contains!3142 Nil!12538 k0!1786))))

(declare-fun b!648111 () Bool)

(declare-fun e!371706 () Unit!22016)

(declare-fun Unit!22018 () Unit!22016)

(assert (=> b!648111 (= e!371706 Unit!22018)))

(declare-fun lt!300669 () Unit!22016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38511 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22016)

(assert (=> b!648111 (= lt!300669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300675 (select (arr!18461 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648111 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300673 () Unit!22016)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38511 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12541) Unit!22016)

(assert (=> b!648111 (= lt!300673 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12538))))

(declare-fun arrayNoDuplicates!0 (array!38511 (_ BitVec 32) List!12541) Bool)

(assert (=> b!648111 (arrayNoDuplicates!0 lt!300675 #b00000000000000000000000000000000 Nil!12538)))

(declare-fun lt!300676 () Unit!22016)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38511 (_ BitVec 32) (_ BitVec 32)) Unit!22016)

(assert (=> b!648111 (= lt!300676 (lemmaNoDuplicateFromThenFromBigger!0 lt!300675 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648111 (arrayNoDuplicates!0 lt!300675 j!136 Nil!12538)))

(declare-fun lt!300665 () Unit!22016)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38511 (_ BitVec 64) (_ BitVec 32) List!12541) Unit!22016)

(assert (=> b!648111 (= lt!300665 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300675 (select (arr!18461 a!2986) j!136) j!136 Nil!12538))))

(assert (=> b!648111 false))

(declare-fun b!648112 () Bool)

(declare-fun res!419922 () Bool)

(assert (=> b!648112 (=> (not res!419922) (not e!371708))))

(assert (=> b!648112 (= res!419922 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648113 () Bool)

(declare-fun res!419936 () Bool)

(assert (=> b!648113 (=> (not res!419936) (not e!371708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648113 (= res!419936 (validKeyInArray!0 k0!1786))))

(declare-fun b!648114 () Bool)

(declare-fun e!371699 () Bool)

(declare-fun e!371705 () Bool)

(assert (=> b!648114 (= e!371699 e!371705)))

(declare-fun res!419920 () Bool)

(assert (=> b!648114 (=> (not res!419920) (not e!371705))))

(assert (=> b!648114 (= res!419920 (= (select (store (arr!18461 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648114 (= lt!300675 (array!38512 (store (arr!18461 a!2986) i!1108 k0!1786) (size!18826 a!2986)))))

(declare-fun b!648115 () Bool)

(declare-fun e!371703 () Bool)

(declare-fun e!371709 () Bool)

(assert (=> b!648115 (= e!371703 e!371709)))

(declare-fun res!419940 () Bool)

(assert (=> b!648115 (=> res!419940 e!371709)))

(assert (=> b!648115 (= res!419940 (bvsge index!984 j!136))))

(declare-fun lt!300667 () Unit!22016)

(assert (=> b!648115 (= lt!300667 e!371706)))

(declare-fun c!74463 () Bool)

(assert (=> b!648115 (= c!74463 (bvslt j!136 index!984))))

(declare-fun b!648116 () Bool)

(declare-fun Unit!22019 () Unit!22016)

(assert (=> b!648116 (= e!371706 Unit!22019)))

(declare-fun b!648117 () Bool)

(assert (=> b!648117 (= e!371709 e!371697)))

(declare-fun res!419928 () Bool)

(assert (=> b!648117 (=> res!419928 e!371697)))

(assert (=> b!648117 (= res!419928 (or (bvsge (size!18826 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18826 a!2986))))))

(assert (=> b!648117 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300674 () Unit!22016)

(assert (=> b!648117 (= lt!300674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300675 (select (arr!18461 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371700 () Bool)

(assert (=> b!648117 e!371700))

(declare-fun res!419919 () Bool)

(assert (=> b!648117 (=> (not res!419919) (not e!371700))))

(assert (=> b!648117 (= res!419919 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) j!136))))

(declare-fun b!648118 () Bool)

(declare-fun res!419937 () Bool)

(assert (=> b!648118 (=> (not res!419937) (not e!371699))))

(assert (=> b!648118 (= res!419937 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18461 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648119 () Bool)

(declare-fun lt!300677 () SeekEntryResult!6898)

(assert (=> b!648119 (= e!371701 (= lt!300677 lt!300671))))

(declare-fun b!648120 () Bool)

(declare-fun e!371704 () Bool)

(assert (=> b!648120 (= e!371704 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) index!984))))

(declare-fun b!648121 () Bool)

(declare-fun e!371702 () Bool)

(assert (=> b!648121 (= e!371702 e!371704)))

(declare-fun res!419929 () Bool)

(assert (=> b!648121 (=> (not res!419929) (not e!371704))))

(assert (=> b!648121 (= res!419929 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) j!136))))

(declare-fun b!648122 () Bool)

(assert (=> b!648122 (= e!371707 e!371703)))

(declare-fun res!419927 () Bool)

(assert (=> b!648122 (=> res!419927 e!371703)))

(declare-fun lt!300664 () (_ BitVec 64))

(assert (=> b!648122 (= res!419927 (or (not (= (select (arr!18461 a!2986) j!136) lt!300666)) (not (= (select (arr!18461 a!2986) j!136) lt!300664))))))

(declare-fun e!371711 () Bool)

(assert (=> b!648122 e!371711))

(declare-fun res!419935 () Bool)

(assert (=> b!648122 (=> (not res!419935) (not e!371711))))

(assert (=> b!648122 (= res!419935 (= lt!300664 (select (arr!18461 a!2986) j!136)))))

(assert (=> b!648122 (= lt!300664 (select (store (arr!18461 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648123 () Bool)

(assert (=> b!648123 (= e!371705 e!371696)))

(declare-fun res!419932 () Bool)

(assert (=> b!648123 (=> (not res!419932) (not e!371696))))

(assert (=> b!648123 (= res!419932 (and (= lt!300677 (Found!6898 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18461 a!2986) index!984) (select (arr!18461 a!2986) j!136))) (not (= (select (arr!18461 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648123 (= lt!300677 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648124 () Bool)

(declare-fun res!419930 () Bool)

(assert (=> b!648124 (=> (not res!419930) (not e!371708))))

(assert (=> b!648124 (= res!419930 (validKeyInArray!0 (select (arr!18461 a!2986) j!136)))))

(declare-fun b!648125 () Bool)

(assert (=> b!648125 (= e!371708 e!371699)))

(declare-fun res!419924 () Bool)

(assert (=> b!648125 (=> (not res!419924) (not e!371699))))

(declare-fun lt!300678 () SeekEntryResult!6898)

(assert (=> b!648125 (= res!419924 (or (= lt!300678 (MissingZero!6898 i!1108)) (= lt!300678 (MissingVacant!6898 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38511 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!648125 (= lt!300678 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648126 () Bool)

(declare-fun res!419926 () Bool)

(assert (=> b!648126 (=> (not res!419926) (not e!371699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38511 (_ BitVec 32)) Bool)

(assert (=> b!648126 (= res!419926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648127 () Bool)

(declare-fun Unit!22020 () Unit!22016)

(assert (=> b!648127 (= e!371698 Unit!22020)))

(declare-fun b!648128 () Bool)

(assert (=> b!648128 (= e!371700 (arrayContainsKey!0 lt!300675 (select (arr!18461 a!2986) j!136) index!984))))

(declare-fun b!648129 () Bool)

(declare-fun res!419925 () Bool)

(assert (=> b!648129 (=> (not res!419925) (not e!371699))))

(assert (=> b!648129 (= res!419925 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12538))))

(declare-fun b!648130 () Bool)

(declare-fun res!419921 () Bool)

(assert (=> b!648130 (=> res!419921 e!371697)))

(assert (=> b!648130 (= res!419921 (contains!3142 Nil!12538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648131 () Bool)

(declare-fun res!419941 () Bool)

(assert (=> b!648131 (=> (not res!419941) (not e!371708))))

(assert (=> b!648131 (= res!419941 (and (= (size!18826 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18826 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18826 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648132 () Bool)

(declare-fun res!419933 () Bool)

(assert (=> b!648132 (=> res!419933 e!371697)))

(declare-fun noDuplicate!425 (List!12541) Bool)

(assert (=> b!648132 (= res!419933 (not (noDuplicate!425 Nil!12538)))))

(declare-fun b!648133 () Bool)

(declare-fun res!419939 () Bool)

(assert (=> b!648133 (=> res!419939 e!371697)))

(assert (=> b!648133 (= res!419939 (contains!3142 Nil!12538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648134 () Bool)

(assert (=> b!648134 (= e!371711 e!371702)))

(declare-fun res!419923 () Bool)

(assert (=> b!648134 (=> res!419923 e!371702)))

(assert (=> b!648134 (= res!419923 (or (not (= (select (arr!18461 a!2986) j!136) lt!300666)) (not (= (select (arr!18461 a!2986) j!136) lt!300664)) (bvsge j!136 index!984)))))

(declare-fun b!648135 () Bool)

(declare-fun Unit!22021 () Unit!22016)

(assert (=> b!648135 (= e!371698 Unit!22021)))

(assert (=> b!648135 false))

(assert (= (and start!58838 res!419931) b!648131))

(assert (= (and b!648131 res!419941) b!648124))

(assert (= (and b!648124 res!419930) b!648113))

(assert (= (and b!648113 res!419936) b!648112))

(assert (= (and b!648112 res!419922) b!648125))

(assert (= (and b!648125 res!419924) b!648126))

(assert (= (and b!648126 res!419926) b!648129))

(assert (= (and b!648129 res!419925) b!648118))

(assert (= (and b!648118 res!419937) b!648114))

(assert (= (and b!648114 res!419920) b!648123))

(assert (= (and b!648123 res!419932) b!648109))

(assert (= (and b!648109 res!419934) b!648119))

(assert (= (and b!648109 c!74462) b!648135))

(assert (= (and b!648109 (not c!74462)) b!648127))

(assert (= (and b!648109 (not res!419938)) b!648122))

(assert (= (and b!648122 res!419935) b!648134))

(assert (= (and b!648134 (not res!419923)) b!648121))

(assert (= (and b!648121 res!419929) b!648120))

(assert (= (and b!648122 (not res!419927)) b!648115))

(assert (= (and b!648115 c!74463) b!648111))

(assert (= (and b!648115 (not c!74463)) b!648116))

(assert (= (and b!648115 (not res!419940)) b!648117))

(assert (= (and b!648117 res!419919) b!648128))

(assert (= (and b!648117 (not res!419928)) b!648132))

(assert (= (and b!648132 (not res!419933)) b!648130))

(assert (= (and b!648130 (not res!419921)) b!648133))

(assert (= (and b!648133 (not res!419939)) b!648110))

(declare-fun m!620991 () Bool)

(assert (=> b!648129 m!620991))

(declare-fun m!620993 () Bool)

(assert (=> b!648128 m!620993))

(assert (=> b!648128 m!620993))

(declare-fun m!620995 () Bool)

(assert (=> b!648128 m!620995))

(declare-fun m!620997 () Bool)

(assert (=> b!648118 m!620997))

(assert (=> b!648124 m!620993))

(assert (=> b!648124 m!620993))

(declare-fun m!620999 () Bool)

(assert (=> b!648124 m!620999))

(declare-fun m!621001 () Bool)

(assert (=> b!648125 m!621001))

(declare-fun m!621003 () Bool)

(assert (=> b!648112 m!621003))

(assert (=> b!648122 m!620993))

(declare-fun m!621005 () Bool)

(assert (=> b!648122 m!621005))

(declare-fun m!621007 () Bool)

(assert (=> b!648122 m!621007))

(declare-fun m!621009 () Bool)

(assert (=> b!648123 m!621009))

(assert (=> b!648123 m!620993))

(assert (=> b!648123 m!620993))

(declare-fun m!621011 () Bool)

(assert (=> b!648123 m!621011))

(declare-fun m!621013 () Bool)

(assert (=> b!648126 m!621013))

(assert (=> b!648117 m!620993))

(assert (=> b!648117 m!620993))

(declare-fun m!621015 () Bool)

(assert (=> b!648117 m!621015))

(assert (=> b!648117 m!620993))

(declare-fun m!621017 () Bool)

(assert (=> b!648117 m!621017))

(assert (=> b!648117 m!620993))

(declare-fun m!621019 () Bool)

(assert (=> b!648117 m!621019))

(assert (=> b!648120 m!620993))

(assert (=> b!648120 m!620993))

(assert (=> b!648120 m!620995))

(declare-fun m!621021 () Bool)

(assert (=> b!648113 m!621021))

(declare-fun m!621023 () Bool)

(assert (=> start!58838 m!621023))

(declare-fun m!621025 () Bool)

(assert (=> start!58838 m!621025))

(assert (=> b!648111 m!620993))

(declare-fun m!621027 () Bool)

(assert (=> b!648111 m!621027))

(assert (=> b!648111 m!620993))

(declare-fun m!621029 () Bool)

(assert (=> b!648111 m!621029))

(assert (=> b!648111 m!620993))

(declare-fun m!621031 () Bool)

(assert (=> b!648111 m!621031))

(declare-fun m!621033 () Bool)

(assert (=> b!648111 m!621033))

(declare-fun m!621035 () Bool)

(assert (=> b!648111 m!621035))

(assert (=> b!648111 m!620993))

(declare-fun m!621037 () Bool)

(assert (=> b!648111 m!621037))

(declare-fun m!621039 () Bool)

(assert (=> b!648111 m!621039))

(declare-fun m!621041 () Bool)

(assert (=> b!648109 m!621041))

(declare-fun m!621043 () Bool)

(assert (=> b!648109 m!621043))

(assert (=> b!648109 m!620993))

(assert (=> b!648109 m!621005))

(declare-fun m!621045 () Bool)

(assert (=> b!648109 m!621045))

(declare-fun m!621047 () Bool)

(assert (=> b!648109 m!621047))

(declare-fun m!621049 () Bool)

(assert (=> b!648109 m!621049))

(assert (=> b!648109 m!620993))

(declare-fun m!621051 () Bool)

(assert (=> b!648109 m!621051))

(declare-fun m!621053 () Bool)

(assert (=> b!648110 m!621053))

(declare-fun m!621055 () Bool)

(assert (=> b!648130 m!621055))

(declare-fun m!621057 () Bool)

(assert (=> b!648133 m!621057))

(declare-fun m!621059 () Bool)

(assert (=> b!648132 m!621059))

(assert (=> b!648121 m!620993))

(assert (=> b!648121 m!620993))

(assert (=> b!648121 m!621019))

(assert (=> b!648114 m!621005))

(declare-fun m!621061 () Bool)

(assert (=> b!648114 m!621061))

(assert (=> b!648134 m!620993))

(check-sat (not b!648120) (not b!648129) (not b!648132) (not b!648113) (not start!58838) (not b!648109) (not b!648130) (not b!648123) (not b!648124) (not b!648121) (not b!648117) (not b!648110) (not b!648128) (not b!648125) (not b!648126) (not b!648133) (not b!648111) (not b!648112))
(check-sat)
