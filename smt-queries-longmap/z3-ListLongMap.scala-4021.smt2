; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54882 () Bool)

(assert start!54882)

(declare-fun b!599017 () Bool)

(declare-datatypes ((Unit!18829 0))(
  ( (Unit!18830) )
))
(declare-fun e!342443 () Unit!18829)

(declare-fun Unit!18831 () Unit!18829)

(assert (=> b!599017 (= e!342443 Unit!18831)))

(assert (=> b!599017 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!342448 () Bool)

(declare-fun b!599018 () Bool)

(declare-datatypes ((array!37062 0))(
  ( (array!37063 (arr!17788 (Array (_ BitVec 32) (_ BitVec 64))) (size!18152 (_ BitVec 32))) )
))
(declare-fun lt!272201 () array!37062)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37062)

(declare-fun arrayContainsKey!0 (array!37062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599018 (= e!342448 (arrayContainsKey!0 lt!272201 (select (arr!17788 a!2986) j!136) index!984))))

(declare-fun b!599019 () Bool)

(declare-fun res!383965 () Bool)

(declare-fun e!342440 () Bool)

(assert (=> b!599019 (=> (not res!383965) (not e!342440))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599019 (= res!383965 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599020 () Bool)

(declare-fun res!383958 () Bool)

(assert (=> b!599020 (=> (not res!383958) (not e!342440))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599020 (= res!383958 (and (= (size!18152 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18152 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18152 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599021 () Bool)

(declare-fun e!342446 () Bool)

(declare-fun e!342439 () Bool)

(assert (=> b!599021 (= e!342446 e!342439)))

(declare-fun res!383968 () Bool)

(assert (=> b!599021 (=> (not res!383968) (not e!342439))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599021 (= res!383968 (= (select (store (arr!17788 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599021 (= lt!272201 (array!37063 (store (arr!17788 a!2986) i!1108 k0!1786) (size!18152 a!2986)))))

(declare-fun b!599022 () Bool)

(declare-fun e!342441 () Bool)

(assert (=> b!599022 (= e!342441 true)))

(declare-datatypes ((List!11736 0))(
  ( (Nil!11733) (Cons!11732 (h!12780 (_ BitVec 64)) (t!17956 List!11736)) )
))
(declare-fun arrayNoDuplicates!0 (array!37062 (_ BitVec 32) List!11736) Bool)

(assert (=> b!599022 (arrayNoDuplicates!0 lt!272201 #b00000000000000000000000000000000 Nil!11733)))

(declare-fun lt!272206 () Unit!18829)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37062 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11736) Unit!18829)

(assert (=> b!599022 (= lt!272206 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11733))))

(assert (=> b!599022 (arrayContainsKey!0 lt!272201 (select (arr!17788 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272199 () Unit!18829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37062 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18829)

(assert (=> b!599022 (= lt!272199 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272201 (select (arr!17788 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599023 () Bool)

(declare-fun res!383967 () Bool)

(assert (=> b!599023 (=> (not res!383967) (not e!342440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599023 (= res!383967 (validKeyInArray!0 k0!1786))))

(declare-fun b!599024 () Bool)

(declare-fun e!342450 () Bool)

(assert (=> b!599024 (= e!342439 e!342450)))

(declare-fun res!383959 () Bool)

(assert (=> b!599024 (=> (not res!383959) (not e!342450))))

(declare-datatypes ((SeekEntryResult!6184 0))(
  ( (MissingZero!6184 (index!26993 (_ BitVec 32))) (Found!6184 (index!26994 (_ BitVec 32))) (Intermediate!6184 (undefined!6996 Bool) (index!26995 (_ BitVec 32)) (x!55954 (_ BitVec 32))) (Undefined!6184) (MissingVacant!6184 (index!26996 (_ BitVec 32))) )
))
(declare-fun lt!272207 () SeekEntryResult!6184)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599024 (= res!383959 (and (= lt!272207 (Found!6184 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17788 a!2986) index!984) (select (arr!17788 a!2986) j!136))) (not (= (select (arr!17788 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37062 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!599024 (= lt!272207 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17788 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599025 () Bool)

(declare-fun res!383955 () Bool)

(assert (=> b!599025 (=> (not res!383955) (not e!342446))))

(assert (=> b!599025 (= res!383955 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11733))))

(declare-fun b!599026 () Bool)

(declare-fun e!342444 () Bool)

(declare-fun lt!272200 () SeekEntryResult!6184)

(assert (=> b!599026 (= e!342444 (= lt!272207 lt!272200))))

(declare-fun b!599027 () Bool)

(declare-fun e!342449 () Bool)

(declare-fun e!342442 () Bool)

(assert (=> b!599027 (= e!342449 e!342442)))

(declare-fun res!383953 () Bool)

(assert (=> b!599027 (=> res!383953 e!342442)))

(declare-fun lt!272208 () (_ BitVec 64))

(declare-fun lt!272198 () (_ BitVec 64))

(assert (=> b!599027 (= res!383953 (or (not (= (select (arr!17788 a!2986) j!136) lt!272198)) (not (= (select (arr!17788 a!2986) j!136) lt!272208)) (bvsge j!136 index!984)))))

(declare-fun b!599028 () Bool)

(assert (=> b!599028 (= e!342442 e!342448)))

(declare-fun res!383957 () Bool)

(assert (=> b!599028 (=> (not res!383957) (not e!342448))))

(assert (=> b!599028 (= res!383957 (arrayContainsKey!0 lt!272201 (select (arr!17788 a!2986) j!136) j!136))))

(declare-fun b!599029 () Bool)

(declare-fun e!342447 () Bool)

(assert (=> b!599029 (= e!342447 e!342441)))

(declare-fun res!383964 () Bool)

(assert (=> b!599029 (=> res!383964 e!342441)))

(assert (=> b!599029 (= res!383964 (or (not (= (select (arr!17788 a!2986) j!136) lt!272198)) (not (= (select (arr!17788 a!2986) j!136) lt!272208)) (bvsge j!136 index!984)))))

(assert (=> b!599029 e!342449))

(declare-fun res!383966 () Bool)

(assert (=> b!599029 (=> (not res!383966) (not e!342449))))

(assert (=> b!599029 (= res!383966 (= lt!272208 (select (arr!17788 a!2986) j!136)))))

(assert (=> b!599029 (= lt!272208 (select (store (arr!17788 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599030 () Bool)

(declare-fun res!383963 () Bool)

(assert (=> b!599030 (=> (not res!383963) (not e!342440))))

(assert (=> b!599030 (= res!383963 (validKeyInArray!0 (select (arr!17788 a!2986) j!136)))))

(declare-fun b!599031 () Bool)

(declare-fun res!383962 () Bool)

(assert (=> b!599031 (=> (not res!383962) (not e!342446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37062 (_ BitVec 32)) Bool)

(assert (=> b!599031 (= res!383962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599032 () Bool)

(assert (=> b!599032 (= e!342450 (not e!342447))))

(declare-fun res!383954 () Bool)

(assert (=> b!599032 (=> res!383954 e!342447)))

(declare-fun lt!272202 () SeekEntryResult!6184)

(assert (=> b!599032 (= res!383954 (not (= lt!272202 (Found!6184 index!984))))))

(declare-fun lt!272203 () Unit!18829)

(assert (=> b!599032 (= lt!272203 e!342443)))

(declare-fun c!67901 () Bool)

(assert (=> b!599032 (= c!67901 (= lt!272202 Undefined!6184))))

(assert (=> b!599032 (= lt!272202 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272198 lt!272201 mask!3053))))

(assert (=> b!599032 e!342444))

(declare-fun res!383960 () Bool)

(assert (=> b!599032 (=> (not res!383960) (not e!342444))))

(declare-fun lt!272209 () (_ BitVec 32))

(assert (=> b!599032 (= res!383960 (= lt!272200 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272209 vacantSpotIndex!68 lt!272198 lt!272201 mask!3053)))))

(assert (=> b!599032 (= lt!272200 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272209 vacantSpotIndex!68 (select (arr!17788 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599032 (= lt!272198 (select (store (arr!17788 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272204 () Unit!18829)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37062 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18829)

(assert (=> b!599032 (= lt!272204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272209 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599032 (= lt!272209 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599033 () Bool)

(declare-fun Unit!18832 () Unit!18829)

(assert (=> b!599033 (= e!342443 Unit!18832)))

(declare-fun res!383952 () Bool)

(assert (=> start!54882 (=> (not res!383952) (not e!342440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54882 (= res!383952 (validMask!0 mask!3053))))

(assert (=> start!54882 e!342440))

(assert (=> start!54882 true))

(declare-fun array_inv!13647 (array!37062) Bool)

(assert (=> start!54882 (array_inv!13647 a!2986)))

(declare-fun b!599034 () Bool)

(declare-fun res!383956 () Bool)

(assert (=> b!599034 (=> (not res!383956) (not e!342446))))

(assert (=> b!599034 (= res!383956 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17788 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599035 () Bool)

(assert (=> b!599035 (= e!342440 e!342446)))

(declare-fun res!383961 () Bool)

(assert (=> b!599035 (=> (not res!383961) (not e!342446))))

(declare-fun lt!272205 () SeekEntryResult!6184)

(assert (=> b!599035 (= res!383961 (or (= lt!272205 (MissingZero!6184 i!1108)) (= lt!272205 (MissingVacant!6184 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37062 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!599035 (= lt!272205 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54882 res!383952) b!599020))

(assert (= (and b!599020 res!383958) b!599030))

(assert (= (and b!599030 res!383963) b!599023))

(assert (= (and b!599023 res!383967) b!599019))

(assert (= (and b!599019 res!383965) b!599035))

(assert (= (and b!599035 res!383961) b!599031))

(assert (= (and b!599031 res!383962) b!599025))

(assert (= (and b!599025 res!383955) b!599034))

(assert (= (and b!599034 res!383956) b!599021))

(assert (= (and b!599021 res!383968) b!599024))

(assert (= (and b!599024 res!383959) b!599032))

(assert (= (and b!599032 res!383960) b!599026))

(assert (= (and b!599032 c!67901) b!599017))

(assert (= (and b!599032 (not c!67901)) b!599033))

(assert (= (and b!599032 (not res!383954)) b!599029))

(assert (= (and b!599029 res!383966) b!599027))

(assert (= (and b!599027 (not res!383953)) b!599028))

(assert (= (and b!599028 res!383957) b!599018))

(assert (= (and b!599029 (not res!383964)) b!599022))

(declare-fun m!576527 () Bool)

(assert (=> b!599022 m!576527))

(declare-fun m!576529 () Bool)

(assert (=> b!599022 m!576529))

(declare-fun m!576531 () Bool)

(assert (=> b!599022 m!576531))

(assert (=> b!599022 m!576527))

(declare-fun m!576533 () Bool)

(assert (=> b!599022 m!576533))

(assert (=> b!599022 m!576527))

(declare-fun m!576535 () Bool)

(assert (=> b!599022 m!576535))

(declare-fun m!576537 () Bool)

(assert (=> b!599031 m!576537))

(declare-fun m!576539 () Bool)

(assert (=> b!599024 m!576539))

(assert (=> b!599024 m!576527))

(assert (=> b!599024 m!576527))

(declare-fun m!576541 () Bool)

(assert (=> b!599024 m!576541))

(assert (=> b!599030 m!576527))

(assert (=> b!599030 m!576527))

(declare-fun m!576543 () Bool)

(assert (=> b!599030 m!576543))

(declare-fun m!576545 () Bool)

(assert (=> b!599034 m!576545))

(assert (=> b!599028 m!576527))

(assert (=> b!599028 m!576527))

(declare-fun m!576547 () Bool)

(assert (=> b!599028 m!576547))

(declare-fun m!576549 () Bool)

(assert (=> b!599025 m!576549))

(declare-fun m!576551 () Bool)

(assert (=> b!599021 m!576551))

(declare-fun m!576553 () Bool)

(assert (=> b!599021 m!576553))

(assert (=> b!599029 m!576527))

(assert (=> b!599029 m!576551))

(declare-fun m!576555 () Bool)

(assert (=> b!599029 m!576555))

(assert (=> b!599018 m!576527))

(assert (=> b!599018 m!576527))

(declare-fun m!576557 () Bool)

(assert (=> b!599018 m!576557))

(declare-fun m!576559 () Bool)

(assert (=> b!599032 m!576559))

(declare-fun m!576561 () Bool)

(assert (=> b!599032 m!576561))

(declare-fun m!576563 () Bool)

(assert (=> b!599032 m!576563))

(assert (=> b!599032 m!576527))

(assert (=> b!599032 m!576551))

(declare-fun m!576565 () Bool)

(assert (=> b!599032 m!576565))

(assert (=> b!599032 m!576527))

(declare-fun m!576567 () Bool)

(assert (=> b!599032 m!576567))

(declare-fun m!576569 () Bool)

(assert (=> b!599032 m!576569))

(declare-fun m!576571 () Bool)

(assert (=> start!54882 m!576571))

(declare-fun m!576573 () Bool)

(assert (=> start!54882 m!576573))

(declare-fun m!576575 () Bool)

(assert (=> b!599023 m!576575))

(declare-fun m!576577 () Bool)

(assert (=> b!599019 m!576577))

(assert (=> b!599027 m!576527))

(declare-fun m!576579 () Bool)

(assert (=> b!599035 m!576579))

(check-sat (not b!599024) (not b!599030) (not b!599022) (not b!599035) (not b!599032) (not start!54882) (not b!599019) (not b!599025) (not b!599028) (not b!599018) (not b!599031) (not b!599023))
(check-sat)
