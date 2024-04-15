; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56172 () Bool)

(assert start!56172)

(declare-fun b!622010 () Bool)

(assert (=> b!622010 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37656 0))(
  ( (array!37657 (arr!18074 (Array (_ BitVec 32) (_ BitVec 64))) (size!18439 (_ BitVec 32))) )
))
(declare-fun lt!288038 () array!37656)

(declare-datatypes ((Unit!20856 0))(
  ( (Unit!20857) )
))
(declare-fun lt!288043 () Unit!20856)

(declare-fun a!2986 () array!37656)

(declare-datatypes ((List!12154 0))(
  ( (Nil!12151) (Cons!12150 (h!13195 (_ BitVec 64)) (t!18373 List!12154)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37656 (_ BitVec 64) (_ BitVec 32) List!12154) Unit!20856)

(assert (=> b!622010 (= lt!288043 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288038 (select (arr!18074 a!2986) j!136) j!136 Nil!12151))))

(declare-fun arrayNoDuplicates!0 (array!37656 (_ BitVec 32) List!12154) Bool)

(assert (=> b!622010 (arrayNoDuplicates!0 lt!288038 j!136 Nil!12151)))

(declare-fun lt!288034 () Unit!20856)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37656 (_ BitVec 32) (_ BitVec 32)) Unit!20856)

(assert (=> b!622010 (= lt!288034 (lemmaNoDuplicateFromThenFromBigger!0 lt!288038 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622010 (arrayNoDuplicates!0 lt!288038 #b00000000000000000000000000000000 Nil!12151)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!288027 () Unit!20856)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12154) Unit!20856)

(assert (=> b!622010 (= lt!288027 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12151))))

(declare-fun arrayContainsKey!0 (array!37656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622010 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288030 () Unit!20856)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20856)

(assert (=> b!622010 (= lt!288030 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288038 (select (arr!18074 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356755 () Unit!20856)

(declare-fun Unit!20858 () Unit!20856)

(assert (=> b!622010 (= e!356755 Unit!20858)))

(declare-fun b!622011 () Bool)

(declare-fun res!400902 () Bool)

(declare-fun e!356749 () Bool)

(assert (=> b!622011 (=> (not res!400902) (not e!356749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622011 (= res!400902 (validKeyInArray!0 (select (arr!18074 a!2986) j!136)))))

(declare-fun b!622012 () Bool)

(declare-fun res!400908 () Bool)

(assert (=> b!622012 (= res!400908 (bvsge j!136 index!984))))

(declare-fun e!356757 () Bool)

(assert (=> b!622012 (=> res!400908 e!356757)))

(declare-fun e!356751 () Bool)

(assert (=> b!622012 (= e!356751 e!356757)))

(declare-fun b!622013 () Bool)

(declare-fun e!356748 () Unit!20856)

(declare-fun Unit!20859 () Unit!20856)

(assert (=> b!622013 (= e!356748 Unit!20859)))

(assert (=> b!622013 false))

(declare-fun b!622014 () Bool)

(declare-fun Unit!20860 () Unit!20856)

(assert (=> b!622014 (= e!356755 Unit!20860)))

(declare-fun b!622015 () Bool)

(declare-fun e!356759 () Unit!20856)

(declare-fun Unit!20861 () Unit!20856)

(assert (=> b!622015 (= e!356759 Unit!20861)))

(declare-fun b!622016 () Bool)

(declare-fun e!356758 () Unit!20856)

(declare-fun Unit!20862 () Unit!20856)

(assert (=> b!622016 (= e!356758 Unit!20862)))

(declare-fun res!400901 () Bool)

(assert (=> b!622016 (= res!400901 (= (select (store (arr!18074 a!2986) i!1108 k0!1786) index!984) (select (arr!18074 a!2986) j!136)))))

(assert (=> b!622016 (=> (not res!400901) (not e!356751))))

(assert (=> b!622016 e!356751))

(declare-fun c!70926 () Bool)

(assert (=> b!622016 (= c!70926 (bvslt j!136 index!984))))

(declare-fun lt!288033 () Unit!20856)

(assert (=> b!622016 (= lt!288033 e!356755)))

(declare-fun c!70924 () Bool)

(assert (=> b!622016 (= c!70924 (bvslt index!984 j!136))))

(declare-fun lt!288040 () Unit!20856)

(assert (=> b!622016 (= lt!288040 e!356759)))

(assert (=> b!622016 false))

(declare-fun b!622017 () Bool)

(declare-fun res!400904 () Bool)

(assert (=> b!622017 (=> (not res!400904) (not e!356749))))

(assert (=> b!622017 (= res!400904 (validKeyInArray!0 k0!1786))))

(declare-fun e!356752 () Bool)

(declare-fun b!622018 () Bool)

(assert (=> b!622018 (= e!356752 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) index!984))))

(declare-fun b!622019 () Bool)

(declare-fun e!356747 () Bool)

(assert (=> b!622019 (= e!356747 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) index!984))))

(declare-fun res!400911 () Bool)

(assert (=> start!56172 (=> (not res!400911) (not e!356749))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56172 (= res!400911 (validMask!0 mask!3053))))

(assert (=> start!56172 e!356749))

(assert (=> start!56172 true))

(declare-fun array_inv!13957 (array!37656) Bool)

(assert (=> start!56172 (array_inv!13957 a!2986)))

(declare-fun b!622020 () Bool)

(declare-fun e!356760 () Bool)

(assert (=> b!622020 (= e!356749 e!356760)))

(declare-fun res!400906 () Bool)

(assert (=> b!622020 (=> (not res!400906) (not e!356760))))

(declare-datatypes ((SeekEntryResult!6511 0))(
  ( (MissingZero!6511 (index!28328 (_ BitVec 32))) (Found!6511 (index!28329 (_ BitVec 32))) (Intermediate!6511 (undefined!7323 Bool) (index!28330 (_ BitVec 32)) (x!57106 (_ BitVec 32))) (Undefined!6511) (MissingVacant!6511 (index!28331 (_ BitVec 32))) )
))
(declare-fun lt!288041 () SeekEntryResult!6511)

(assert (=> b!622020 (= res!400906 (or (= lt!288041 (MissingZero!6511 i!1108)) (= lt!288041 (MissingVacant!6511 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37656 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!622020 (= lt!288041 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622021 () Bool)

(declare-fun res!400912 () Bool)

(assert (=> b!622021 (=> (not res!400912) (not e!356749))))

(assert (=> b!622021 (= res!400912 (and (= (size!18439 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18439 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18439 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622022 () Bool)

(declare-fun Unit!20863 () Unit!20856)

(assert (=> b!622022 (= e!356758 Unit!20863)))

(declare-fun b!622023 () Bool)

(declare-fun e!356756 () Bool)

(declare-fun e!356754 () Bool)

(assert (=> b!622023 (= e!356756 e!356754)))

(declare-fun res!400905 () Bool)

(assert (=> b!622023 (=> (not res!400905) (not e!356754))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288037 () SeekEntryResult!6511)

(assert (=> b!622023 (= res!400905 (and (= lt!288037 (Found!6511 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18074 a!2986) index!984) (select (arr!18074 a!2986) j!136))) (not (= (select (arr!18074 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37656 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!622023 (= lt!288037 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18074 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622024 () Bool)

(declare-fun res!400900 () Bool)

(assert (=> b!622024 (=> (not res!400900) (not e!356760))))

(assert (=> b!622024 (= res!400900 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12151))))

(declare-fun b!622025 () Bool)

(declare-fun res!400899 () Bool)

(assert (=> b!622025 (=> (not res!400899) (not e!356760))))

(assert (=> b!622025 (= res!400899 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18074 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!400913 () Bool)

(declare-fun b!622026 () Bool)

(assert (=> b!622026 (= res!400913 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) j!136))))

(assert (=> b!622026 (=> (not res!400913) (not e!356747))))

(assert (=> b!622026 (= e!356757 e!356747)))

(declare-fun b!622027 () Bool)

(declare-fun Unit!20864 () Unit!20856)

(assert (=> b!622027 (= e!356748 Unit!20864)))

(declare-fun b!622028 () Bool)

(assert (=> b!622028 (= e!356754 (not true))))

(declare-fun lt!288024 () Unit!20856)

(assert (=> b!622028 (= lt!288024 e!356758)))

(declare-fun c!70925 () Bool)

(declare-fun lt!288031 () SeekEntryResult!6511)

(assert (=> b!622028 (= c!70925 (= lt!288031 (Found!6511 index!984)))))

(declare-fun lt!288042 () Unit!20856)

(assert (=> b!622028 (= lt!288042 e!356748)))

(declare-fun c!70923 () Bool)

(assert (=> b!622028 (= c!70923 (= lt!288031 Undefined!6511))))

(declare-fun lt!288035 () (_ BitVec 64))

(assert (=> b!622028 (= lt!288031 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288035 lt!288038 mask!3053))))

(declare-fun e!356750 () Bool)

(assert (=> b!622028 e!356750))

(declare-fun res!400907 () Bool)

(assert (=> b!622028 (=> (not res!400907) (not e!356750))))

(declare-fun lt!288039 () (_ BitVec 32))

(declare-fun lt!288036 () SeekEntryResult!6511)

(assert (=> b!622028 (= res!400907 (= lt!288036 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288039 vacantSpotIndex!68 lt!288035 lt!288038 mask!3053)))))

(assert (=> b!622028 (= lt!288036 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288039 vacantSpotIndex!68 (select (arr!18074 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622028 (= lt!288035 (select (store (arr!18074 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288026 () Unit!20856)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37656 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20856)

(assert (=> b!622028 (= lt!288026 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288039 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622028 (= lt!288039 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622029 () Bool)

(declare-fun res!400909 () Bool)

(assert (=> b!622029 (=> (not res!400909) (not e!356749))))

(assert (=> b!622029 (= res!400909 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622030 () Bool)

(assert (=> b!622030 false))

(declare-fun lt!288028 () Unit!20856)

(assert (=> b!622030 (= lt!288028 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288038 (select (arr!18074 a!2986) j!136) index!984 Nil!12151))))

(assert (=> b!622030 (arrayNoDuplicates!0 lt!288038 index!984 Nil!12151)))

(declare-fun lt!288029 () Unit!20856)

(assert (=> b!622030 (= lt!288029 (lemmaNoDuplicateFromThenFromBigger!0 lt!288038 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622030 (arrayNoDuplicates!0 lt!288038 #b00000000000000000000000000000000 Nil!12151)))

(declare-fun lt!288032 () Unit!20856)

(assert (=> b!622030 (= lt!288032 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12151))))

(assert (=> b!622030 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288025 () Unit!20856)

(assert (=> b!622030 (= lt!288025 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288038 (select (arr!18074 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622030 e!356752))

(declare-fun res!400910 () Bool)

(assert (=> b!622030 (=> (not res!400910) (not e!356752))))

(assert (=> b!622030 (= res!400910 (arrayContainsKey!0 lt!288038 (select (arr!18074 a!2986) j!136) j!136))))

(declare-fun Unit!20865 () Unit!20856)

(assert (=> b!622030 (= e!356759 Unit!20865)))

(declare-fun b!622031 () Bool)

(assert (=> b!622031 (= e!356750 (= lt!288037 lt!288036))))

(declare-fun b!622032 () Bool)

(assert (=> b!622032 (= e!356760 e!356756)))

(declare-fun res!400903 () Bool)

(assert (=> b!622032 (=> (not res!400903) (not e!356756))))

(assert (=> b!622032 (= res!400903 (= (select (store (arr!18074 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622032 (= lt!288038 (array!37657 (store (arr!18074 a!2986) i!1108 k0!1786) (size!18439 a!2986)))))

(declare-fun b!622033 () Bool)

(declare-fun res!400898 () Bool)

(assert (=> b!622033 (=> (not res!400898) (not e!356760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37656 (_ BitVec 32)) Bool)

(assert (=> b!622033 (= res!400898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56172 res!400911) b!622021))

(assert (= (and b!622021 res!400912) b!622011))

(assert (= (and b!622011 res!400902) b!622017))

(assert (= (and b!622017 res!400904) b!622029))

(assert (= (and b!622029 res!400909) b!622020))

(assert (= (and b!622020 res!400906) b!622033))

(assert (= (and b!622033 res!400898) b!622024))

(assert (= (and b!622024 res!400900) b!622025))

(assert (= (and b!622025 res!400899) b!622032))

(assert (= (and b!622032 res!400903) b!622023))

(assert (= (and b!622023 res!400905) b!622028))

(assert (= (and b!622028 res!400907) b!622031))

(assert (= (and b!622028 c!70923) b!622013))

(assert (= (and b!622028 (not c!70923)) b!622027))

(assert (= (and b!622028 c!70925) b!622016))

(assert (= (and b!622028 (not c!70925)) b!622022))

(assert (= (and b!622016 res!400901) b!622012))

(assert (= (and b!622012 (not res!400908)) b!622026))

(assert (= (and b!622026 res!400913) b!622019))

(assert (= (and b!622016 c!70926) b!622010))

(assert (= (and b!622016 (not c!70926)) b!622014))

(assert (= (and b!622016 c!70924) b!622030))

(assert (= (and b!622016 (not c!70924)) b!622015))

(assert (= (and b!622030 res!400910) b!622018))

(declare-fun m!597379 () Bool)

(assert (=> b!622016 m!597379))

(declare-fun m!597381 () Bool)

(assert (=> b!622016 m!597381))

(declare-fun m!597383 () Bool)

(assert (=> b!622016 m!597383))

(declare-fun m!597385 () Bool)

(assert (=> b!622024 m!597385))

(declare-fun m!597387 () Bool)

(assert (=> start!56172 m!597387))

(declare-fun m!597389 () Bool)

(assert (=> start!56172 m!597389))

(declare-fun m!597391 () Bool)

(assert (=> b!622023 m!597391))

(assert (=> b!622023 m!597383))

(assert (=> b!622023 m!597383))

(declare-fun m!597393 () Bool)

(assert (=> b!622023 m!597393))

(assert (=> b!622032 m!597379))

(declare-fun m!597395 () Bool)

(assert (=> b!622032 m!597395))

(assert (=> b!622011 m!597383))

(assert (=> b!622011 m!597383))

(declare-fun m!597397 () Bool)

(assert (=> b!622011 m!597397))

(assert (=> b!622019 m!597383))

(assert (=> b!622019 m!597383))

(declare-fun m!597399 () Bool)

(assert (=> b!622019 m!597399))

(declare-fun m!597401 () Bool)

(assert (=> b!622028 m!597401))

(declare-fun m!597403 () Bool)

(assert (=> b!622028 m!597403))

(declare-fun m!597405 () Bool)

(assert (=> b!622028 m!597405))

(assert (=> b!622028 m!597383))

(declare-fun m!597407 () Bool)

(assert (=> b!622028 m!597407))

(assert (=> b!622028 m!597379))

(assert (=> b!622028 m!597383))

(declare-fun m!597409 () Bool)

(assert (=> b!622028 m!597409))

(declare-fun m!597411 () Bool)

(assert (=> b!622028 m!597411))

(assert (=> b!622026 m!597383))

(assert (=> b!622026 m!597383))

(declare-fun m!597413 () Bool)

(assert (=> b!622026 m!597413))

(declare-fun m!597415 () Bool)

(assert (=> b!622020 m!597415))

(declare-fun m!597417 () Bool)

(assert (=> b!622029 m!597417))

(declare-fun m!597419 () Bool)

(assert (=> b!622025 m!597419))

(declare-fun m!597421 () Bool)

(assert (=> b!622030 m!597421))

(declare-fun m!597423 () Bool)

(assert (=> b!622030 m!597423))

(assert (=> b!622030 m!597383))

(declare-fun m!597425 () Bool)

(assert (=> b!622030 m!597425))

(assert (=> b!622030 m!597383))

(declare-fun m!597427 () Bool)

(assert (=> b!622030 m!597427))

(declare-fun m!597429 () Bool)

(assert (=> b!622030 m!597429))

(assert (=> b!622030 m!597383))

(declare-fun m!597431 () Bool)

(assert (=> b!622030 m!597431))

(assert (=> b!622030 m!597383))

(declare-fun m!597433 () Bool)

(assert (=> b!622030 m!597433))

(assert (=> b!622030 m!597383))

(assert (=> b!622030 m!597413))

(assert (=> b!622018 m!597383))

(assert (=> b!622018 m!597383))

(assert (=> b!622018 m!597399))

(declare-fun m!597435 () Bool)

(assert (=> b!622033 m!597435))

(declare-fun m!597437 () Bool)

(assert (=> b!622010 m!597437))

(assert (=> b!622010 m!597383))

(assert (=> b!622010 m!597383))

(declare-fun m!597439 () Bool)

(assert (=> b!622010 m!597439))

(declare-fun m!597441 () Bool)

(assert (=> b!622010 m!597441))

(assert (=> b!622010 m!597383))

(declare-fun m!597443 () Bool)

(assert (=> b!622010 m!597443))

(assert (=> b!622010 m!597429))

(assert (=> b!622010 m!597383))

(declare-fun m!597445 () Bool)

(assert (=> b!622010 m!597445))

(assert (=> b!622010 m!597421))

(declare-fun m!597447 () Bool)

(assert (=> b!622017 m!597447))

(check-sat (not start!56172) (not b!622029) (not b!622026) (not b!622033) (not b!622010) (not b!622030) (not b!622019) (not b!622011) (not b!622018) (not b!622017) (not b!622020) (not b!622024) (not b!622023) (not b!622028))
(check-sat)
