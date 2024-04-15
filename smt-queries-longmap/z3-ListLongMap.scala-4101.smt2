; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56088 () Bool)

(assert start!56088)

(declare-fun b!618952 () Bool)

(declare-datatypes ((Unit!20436 0))(
  ( (Unit!20437) )
))
(declare-fun e!354952 () Unit!20436)

(declare-fun Unit!20438 () Unit!20436)

(assert (=> b!618952 (= e!354952 Unit!20438)))

(declare-fun b!618953 () Bool)

(declare-fun res!398861 () Bool)

(declare-fun e!354957 () Bool)

(assert (=> b!618953 (=> (not res!398861) (not e!354957))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37572 0))(
  ( (array!37573 (arr!18032 (Array (_ BitVec 32) (_ BitVec 64))) (size!18397 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37572)

(assert (=> b!618953 (= res!398861 (and (= (size!18397 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18397 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18397 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!354954 () Bool)

(declare-fun b!618954 () Bool)

(declare-fun lt!285511 () array!37572)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618954 (= e!354954 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) index!984))))

(declare-fun b!618955 () Bool)

(declare-fun e!354959 () Bool)

(declare-datatypes ((SeekEntryResult!6469 0))(
  ( (MissingZero!6469 (index!28160 (_ BitVec 32))) (Found!6469 (index!28161 (_ BitVec 32))) (Intermediate!6469 (undefined!7281 Bool) (index!28162 (_ BitVec 32)) (x!56952 (_ BitVec 32))) (Undefined!6469) (MissingVacant!6469 (index!28163 (_ BitVec 32))) )
))
(declare-fun lt!285521 () SeekEntryResult!6469)

(declare-fun lt!285512 () SeekEntryResult!6469)

(assert (=> b!618955 (= e!354959 (= lt!285521 lt!285512))))

(declare-fun b!618956 () Bool)

(declare-fun res!398852 () Bool)

(assert (=> b!618956 (=> (not res!398852) (not e!354957))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618956 (= res!398852 (validKeyInArray!0 k0!1786))))

(declare-fun b!618957 () Bool)

(declare-fun e!354961 () Unit!20436)

(declare-fun Unit!20439 () Unit!20436)

(assert (=> b!618957 (= e!354961 Unit!20439)))

(assert (=> b!618957 false))

(declare-fun b!618958 () Bool)

(declare-fun e!354960 () Bool)

(declare-fun e!354953 () Bool)

(assert (=> b!618958 (= e!354960 e!354953)))

(declare-fun res!398859 () Bool)

(assert (=> b!618958 (=> (not res!398859) (not e!354953))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618958 (= res!398859 (and (= lt!285521 (Found!6469 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18032 a!2986) index!984) (select (arr!18032 a!2986) j!136))) (not (= (select (arr!18032 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37572 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!618958 (= lt!285521 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18032 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618959 () Bool)

(declare-fun e!354950 () Bool)

(assert (=> b!618959 (= e!354950 e!354960)))

(declare-fun res!398856 () Bool)

(assert (=> b!618959 (=> (not res!398856) (not e!354960))))

(assert (=> b!618959 (= res!398856 (= (select (store (arr!18032 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618959 (= lt!285511 (array!37573 (store (arr!18032 a!2986) i!1108 k0!1786) (size!18397 a!2986)))))

(declare-fun b!618960 () Bool)

(declare-fun res!398848 () Bool)

(assert (=> b!618960 (= res!398848 (bvsge j!136 index!984))))

(declare-fun e!354958 () Bool)

(assert (=> b!618960 (=> res!398848 e!354958)))

(declare-fun e!354962 () Bool)

(assert (=> b!618960 (= e!354962 e!354958)))

(declare-fun b!618961 () Bool)

(declare-fun e!354949 () Unit!20436)

(declare-fun Unit!20440 () Unit!20436)

(assert (=> b!618961 (= e!354949 Unit!20440)))

(declare-fun e!354951 () Bool)

(declare-fun b!618962 () Bool)

(assert (=> b!618962 (= e!354951 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) index!984))))

(declare-fun b!618963 () Bool)

(assert (=> b!618963 false))

(declare-fun lt!285509 () Unit!20436)

(declare-datatypes ((List!12112 0))(
  ( (Nil!12109) (Cons!12108 (h!13153 (_ BitVec 64)) (t!18331 List!12112)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37572 (_ BitVec 64) (_ BitVec 32) List!12112) Unit!20436)

(assert (=> b!618963 (= lt!285509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285511 (select (arr!18032 a!2986) j!136) j!136 Nil!12109))))

(declare-fun arrayNoDuplicates!0 (array!37572 (_ BitVec 32) List!12112) Bool)

(assert (=> b!618963 (arrayNoDuplicates!0 lt!285511 j!136 Nil!12109)))

(declare-fun lt!285510 () Unit!20436)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37572 (_ BitVec 32) (_ BitVec 32)) Unit!20436)

(assert (=> b!618963 (= lt!285510 (lemmaNoDuplicateFromThenFromBigger!0 lt!285511 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618963 (arrayNoDuplicates!0 lt!285511 #b00000000000000000000000000000000 Nil!12109)))

(declare-fun lt!285505 () Unit!20436)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12112) Unit!20436)

(assert (=> b!618963 (= lt!285505 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12109))))

(assert (=> b!618963 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285513 () Unit!20436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20436)

(assert (=> b!618963 (= lt!285513 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285511 (select (arr!18032 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20441 () Unit!20436)

(assert (=> b!618963 (= e!354949 Unit!20441)))

(declare-fun b!618964 () Bool)

(declare-fun Unit!20442 () Unit!20436)

(assert (=> b!618964 (= e!354952 Unit!20442)))

(declare-fun res!398862 () Bool)

(assert (=> b!618964 (= res!398862 (= (select (store (arr!18032 a!2986) i!1108 k0!1786) index!984) (select (arr!18032 a!2986) j!136)))))

(assert (=> b!618964 (=> (not res!398862) (not e!354962))))

(assert (=> b!618964 e!354962))

(declare-fun c!70421 () Bool)

(assert (=> b!618964 (= c!70421 (bvslt j!136 index!984))))

(declare-fun lt!285517 () Unit!20436)

(assert (=> b!618964 (= lt!285517 e!354949)))

(declare-fun c!70422 () Bool)

(assert (=> b!618964 (= c!70422 (bvslt index!984 j!136))))

(declare-fun lt!285514 () Unit!20436)

(declare-fun e!354963 () Unit!20436)

(assert (=> b!618964 (= lt!285514 e!354963)))

(assert (=> b!618964 false))

(declare-fun b!618966 () Bool)

(declare-fun res!398850 () Bool)

(assert (=> b!618966 (=> (not res!398850) (not e!354950))))

(assert (=> b!618966 (= res!398850 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18032 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618965 () Bool)

(assert (=> b!618965 false))

(declare-fun lt!285516 () Unit!20436)

(assert (=> b!618965 (= lt!285516 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285511 (select (arr!18032 a!2986) j!136) index!984 Nil!12109))))

(assert (=> b!618965 (arrayNoDuplicates!0 lt!285511 index!984 Nil!12109)))

(declare-fun lt!285518 () Unit!20436)

(assert (=> b!618965 (= lt!285518 (lemmaNoDuplicateFromThenFromBigger!0 lt!285511 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618965 (arrayNoDuplicates!0 lt!285511 #b00000000000000000000000000000000 Nil!12109)))

(declare-fun lt!285504 () Unit!20436)

(assert (=> b!618965 (= lt!285504 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12109))))

(assert (=> b!618965 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285506 () Unit!20436)

(assert (=> b!618965 (= lt!285506 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285511 (select (arr!18032 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618965 e!354951))

(declare-fun res!398855 () Bool)

(assert (=> b!618965 (=> (not res!398855) (not e!354951))))

(assert (=> b!618965 (= res!398855 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) j!136))))

(declare-fun Unit!20443 () Unit!20436)

(assert (=> b!618965 (= e!354963 Unit!20443)))

(declare-fun res!398864 () Bool)

(assert (=> start!56088 (=> (not res!398864) (not e!354957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56088 (= res!398864 (validMask!0 mask!3053))))

(assert (=> start!56088 e!354957))

(assert (=> start!56088 true))

(declare-fun array_inv!13915 (array!37572) Bool)

(assert (=> start!56088 (array_inv!13915 a!2986)))

(declare-fun b!618967 () Bool)

(declare-fun res!398853 () Bool)

(assert (=> b!618967 (= res!398853 (arrayContainsKey!0 lt!285511 (select (arr!18032 a!2986) j!136) j!136))))

(assert (=> b!618967 (=> (not res!398853) (not e!354954))))

(assert (=> b!618967 (= e!354958 e!354954)))

(declare-fun b!618968 () Bool)

(declare-fun e!354955 () Bool)

(assert (=> b!618968 (= e!354955 true)))

(assert (=> b!618968 (= (select (store (arr!18032 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618969 () Bool)

(assert (=> b!618969 (= e!354957 e!354950)))

(declare-fun res!398860 () Bool)

(assert (=> b!618969 (=> (not res!398860) (not e!354950))))

(declare-fun lt!285522 () SeekEntryResult!6469)

(assert (=> b!618969 (= res!398860 (or (= lt!285522 (MissingZero!6469 i!1108)) (= lt!285522 (MissingVacant!6469 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37572 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!618969 (= lt!285522 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618970 () Bool)

(declare-fun Unit!20444 () Unit!20436)

(assert (=> b!618970 (= e!354961 Unit!20444)))

(declare-fun b!618971 () Bool)

(declare-fun res!398854 () Bool)

(assert (=> b!618971 (=> (not res!398854) (not e!354957))))

(assert (=> b!618971 (= res!398854 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618972 () Bool)

(assert (=> b!618972 (= e!354953 (not e!354955))))

(declare-fun res!398857 () Bool)

(assert (=> b!618972 (=> res!398857 e!354955)))

(declare-fun lt!285519 () SeekEntryResult!6469)

(assert (=> b!618972 (= res!398857 (not (= lt!285519 (MissingVacant!6469 vacantSpotIndex!68))))))

(declare-fun lt!285508 () Unit!20436)

(assert (=> b!618972 (= lt!285508 e!354952)))

(declare-fun c!70420 () Bool)

(assert (=> b!618972 (= c!70420 (= lt!285519 (Found!6469 index!984)))))

(declare-fun lt!285523 () Unit!20436)

(assert (=> b!618972 (= lt!285523 e!354961)))

(declare-fun c!70419 () Bool)

(assert (=> b!618972 (= c!70419 (= lt!285519 Undefined!6469))))

(declare-fun lt!285507 () (_ BitVec 64))

(assert (=> b!618972 (= lt!285519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285507 lt!285511 mask!3053))))

(assert (=> b!618972 e!354959))

(declare-fun res!398863 () Bool)

(assert (=> b!618972 (=> (not res!398863) (not e!354959))))

(declare-fun lt!285515 () (_ BitVec 32))

(assert (=> b!618972 (= res!398863 (= lt!285512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285515 vacantSpotIndex!68 lt!285507 lt!285511 mask!3053)))))

(assert (=> b!618972 (= lt!285512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285515 vacantSpotIndex!68 (select (arr!18032 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618972 (= lt!285507 (select (store (arr!18032 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285520 () Unit!20436)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37572 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20436)

(assert (=> b!618972 (= lt!285520 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285515 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618972 (= lt!285515 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618973 () Bool)

(declare-fun Unit!20445 () Unit!20436)

(assert (=> b!618973 (= e!354963 Unit!20445)))

(declare-fun b!618974 () Bool)

(declare-fun res!398858 () Bool)

(assert (=> b!618974 (=> (not res!398858) (not e!354950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37572 (_ BitVec 32)) Bool)

(assert (=> b!618974 (= res!398858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618975 () Bool)

(declare-fun res!398851 () Bool)

(assert (=> b!618975 (=> (not res!398851) (not e!354950))))

(assert (=> b!618975 (= res!398851 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12109))))

(declare-fun b!618976 () Bool)

(declare-fun res!398849 () Bool)

(assert (=> b!618976 (=> (not res!398849) (not e!354957))))

(assert (=> b!618976 (= res!398849 (validKeyInArray!0 (select (arr!18032 a!2986) j!136)))))

(assert (= (and start!56088 res!398864) b!618953))

(assert (= (and b!618953 res!398861) b!618976))

(assert (= (and b!618976 res!398849) b!618956))

(assert (= (and b!618956 res!398852) b!618971))

(assert (= (and b!618971 res!398854) b!618969))

(assert (= (and b!618969 res!398860) b!618974))

(assert (= (and b!618974 res!398858) b!618975))

(assert (= (and b!618975 res!398851) b!618966))

(assert (= (and b!618966 res!398850) b!618959))

(assert (= (and b!618959 res!398856) b!618958))

(assert (= (and b!618958 res!398859) b!618972))

(assert (= (and b!618972 res!398863) b!618955))

(assert (= (and b!618972 c!70419) b!618957))

(assert (= (and b!618972 (not c!70419)) b!618970))

(assert (= (and b!618972 c!70420) b!618964))

(assert (= (and b!618972 (not c!70420)) b!618952))

(assert (= (and b!618964 res!398862) b!618960))

(assert (= (and b!618960 (not res!398848)) b!618967))

(assert (= (and b!618967 res!398853) b!618954))

(assert (= (and b!618964 c!70421) b!618963))

(assert (= (and b!618964 (not c!70421)) b!618961))

(assert (= (and b!618964 c!70422) b!618965))

(assert (= (and b!618964 (not c!70422)) b!618973))

(assert (= (and b!618965 res!398855) b!618962))

(assert (= (and b!618972 (not res!398857)) b!618968))

(declare-fun m!594439 () Bool)

(assert (=> b!618963 m!594439))

(declare-fun m!594441 () Bool)

(assert (=> b!618963 m!594441))

(assert (=> b!618963 m!594439))

(declare-fun m!594443 () Bool)

(assert (=> b!618963 m!594443))

(declare-fun m!594445 () Bool)

(assert (=> b!618963 m!594445))

(assert (=> b!618963 m!594439))

(declare-fun m!594447 () Bool)

(assert (=> b!618963 m!594447))

(assert (=> b!618963 m!594439))

(declare-fun m!594449 () Bool)

(assert (=> b!618963 m!594449))

(declare-fun m!594451 () Bool)

(assert (=> b!618963 m!594451))

(declare-fun m!594453 () Bool)

(assert (=> b!618963 m!594453))

(assert (=> b!618962 m!594439))

(assert (=> b!618962 m!594439))

(declare-fun m!594455 () Bool)

(assert (=> b!618962 m!594455))

(declare-fun m!594457 () Bool)

(assert (=> b!618965 m!594457))

(assert (=> b!618965 m!594439))

(declare-fun m!594459 () Bool)

(assert (=> b!618965 m!594459))

(assert (=> b!618965 m!594439))

(declare-fun m!594461 () Bool)

(assert (=> b!618965 m!594461))

(assert (=> b!618965 m!594453))

(assert (=> b!618965 m!594439))

(declare-fun m!594463 () Bool)

(assert (=> b!618965 m!594463))

(assert (=> b!618965 m!594439))

(declare-fun m!594465 () Bool)

(assert (=> b!618965 m!594465))

(assert (=> b!618965 m!594439))

(declare-fun m!594467 () Bool)

(assert (=> b!618965 m!594467))

(assert (=> b!618965 m!594451))

(declare-fun m!594469 () Bool)

(assert (=> b!618964 m!594469))

(declare-fun m!594471 () Bool)

(assert (=> b!618964 m!594471))

(assert (=> b!618964 m!594439))

(declare-fun m!594473 () Bool)

(assert (=> b!618958 m!594473))

(assert (=> b!618958 m!594439))

(assert (=> b!618958 m!594439))

(declare-fun m!594475 () Bool)

(assert (=> b!618958 m!594475))

(assert (=> b!618968 m!594469))

(assert (=> b!618968 m!594471))

(declare-fun m!594477 () Bool)

(assert (=> b!618956 m!594477))

(assert (=> b!618967 m!594439))

(assert (=> b!618967 m!594439))

(assert (=> b!618967 m!594463))

(declare-fun m!594479 () Bool)

(assert (=> b!618969 m!594479))

(declare-fun m!594481 () Bool)

(assert (=> b!618971 m!594481))

(assert (=> b!618959 m!594469))

(declare-fun m!594483 () Bool)

(assert (=> b!618959 m!594483))

(declare-fun m!594485 () Bool)

(assert (=> start!56088 m!594485))

(declare-fun m!594487 () Bool)

(assert (=> start!56088 m!594487))

(declare-fun m!594489 () Bool)

(assert (=> b!618974 m!594489))

(declare-fun m!594491 () Bool)

(assert (=> b!618975 m!594491))

(assert (=> b!618954 m!594439))

(assert (=> b!618954 m!594439))

(assert (=> b!618954 m!594455))

(declare-fun m!594493 () Bool)

(assert (=> b!618966 m!594493))

(declare-fun m!594495 () Bool)

(assert (=> b!618972 m!594495))

(declare-fun m!594497 () Bool)

(assert (=> b!618972 m!594497))

(declare-fun m!594499 () Bool)

(assert (=> b!618972 m!594499))

(assert (=> b!618972 m!594439))

(declare-fun m!594501 () Bool)

(assert (=> b!618972 m!594501))

(assert (=> b!618972 m!594469))

(declare-fun m!594503 () Bool)

(assert (=> b!618972 m!594503))

(assert (=> b!618972 m!594439))

(declare-fun m!594505 () Bool)

(assert (=> b!618972 m!594505))

(assert (=> b!618976 m!594439))

(assert (=> b!618976 m!594439))

(declare-fun m!594507 () Bool)

(assert (=> b!618976 m!594507))

(check-sat (not b!618958) (not start!56088) (not b!618954) (not b!618956) (not b!618963) (not b!618962) (not b!618974) (not b!618965) (not b!618971) (not b!618975) (not b!618967) (not b!618972) (not b!618976) (not b!618969))
(check-sat)
