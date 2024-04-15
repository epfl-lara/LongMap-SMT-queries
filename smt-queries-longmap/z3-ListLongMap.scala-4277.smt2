; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59558 () Bool)

(assert start!59558)

(declare-datatypes ((array!38727 0))(
  ( (array!38728 (arr!18560 (Array (_ BitVec 32) (_ BitVec 64))) (size!18925 (_ BitVec 32))) )
))
(declare-fun lt!307081 () array!38727)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!657483 () Bool)

(declare-fun a!2986 () array!38727)

(declare-fun res!426413 () Bool)

(declare-fun arrayContainsKey!0 (array!38727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657483 (= res!426413 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) j!136))))

(declare-fun e!377687 () Bool)

(assert (=> b!657483 (=> (not res!426413) (not e!377687))))

(declare-fun e!377679 () Bool)

(assert (=> b!657483 (= e!377679 e!377687)))

(declare-fun res!426426 () Bool)

(declare-fun e!377674 () Bool)

(assert (=> start!59558 (=> (not res!426426) (not e!377674))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59558 (= res!426426 (validMask!0 mask!3053))))

(assert (=> start!59558 e!377674))

(assert (=> start!59558 true))

(declare-fun array_inv!14443 (array!38727) Bool)

(assert (=> start!59558 (array_inv!14443 a!2986)))

(declare-fun b!657484 () Bool)

(declare-fun res!426414 () Bool)

(assert (=> b!657484 (=> (not res!426414) (not e!377674))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657484 (= res!426414 (validKeyInArray!0 k0!1786))))

(declare-fun b!657485 () Bool)

(declare-fun e!377681 () Bool)

(declare-datatypes ((SeekEntryResult!6997 0))(
  ( (MissingZero!6997 (index!30353 (_ BitVec 32))) (Found!6997 (index!30354 (_ BitVec 32))) (Intermediate!6997 (undefined!7809 Bool) (index!30355 (_ BitVec 32)) (x!59155 (_ BitVec 32))) (Undefined!6997) (MissingVacant!6997 (index!30356 (_ BitVec 32))) )
))
(declare-fun lt!307089 () SeekEntryResult!6997)

(declare-fun lt!307086 () SeekEntryResult!6997)

(assert (=> b!657485 (= e!377681 (= lt!307089 lt!307086))))

(declare-fun b!657486 () Bool)

(assert (=> b!657486 false))

(declare-datatypes ((Unit!22742 0))(
  ( (Unit!22743) )
))
(declare-fun lt!307083 () Unit!22742)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12640 0))(
  ( (Nil!12637) (Cons!12636 (h!13681 (_ BitVec 64)) (t!18859 List!12640)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38727 (_ BitVec 64) (_ BitVec 32) List!12640) Unit!22742)

(assert (=> b!657486 (= lt!307083 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307081 (select (arr!18560 a!2986) j!136) index!984 Nil!12637))))

(declare-fun arrayNoDuplicates!0 (array!38727 (_ BitVec 32) List!12640) Bool)

(assert (=> b!657486 (arrayNoDuplicates!0 lt!307081 index!984 Nil!12637)))

(declare-fun lt!307082 () Unit!22742)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38727 (_ BitVec 32) (_ BitVec 32)) Unit!22742)

(assert (=> b!657486 (= lt!307082 (lemmaNoDuplicateFromThenFromBigger!0 lt!307081 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657486 (arrayNoDuplicates!0 lt!307081 #b00000000000000000000000000000000 Nil!12637)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!307073 () Unit!22742)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12640) Unit!22742)

(assert (=> b!657486 (= lt!307073 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12637))))

(assert (=> b!657486 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307079 () Unit!22742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22742)

(assert (=> b!657486 (= lt!307079 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307081 (select (arr!18560 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377678 () Bool)

(assert (=> b!657486 e!377678))

(declare-fun res!426416 () Bool)

(assert (=> b!657486 (=> (not res!426416) (not e!377678))))

(assert (=> b!657486 (= res!426416 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) j!136))))

(declare-fun e!377675 () Unit!22742)

(declare-fun Unit!22744 () Unit!22742)

(assert (=> b!657486 (= e!377675 Unit!22744)))

(declare-fun b!657487 () Bool)

(assert (=> b!657487 (= e!377687 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) index!984))))

(declare-fun b!657488 () Bool)

(declare-fun Unit!22745 () Unit!22742)

(assert (=> b!657488 (= e!377675 Unit!22745)))

(declare-fun b!657489 () Bool)

(declare-fun res!426419 () Bool)

(declare-fun e!377676 () Bool)

(assert (=> b!657489 (=> (not res!426419) (not e!377676))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657489 (= res!426419 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18560 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657490 () Bool)

(declare-fun e!377684 () Unit!22742)

(declare-fun Unit!22746 () Unit!22742)

(assert (=> b!657490 (= e!377684 Unit!22746)))

(declare-fun res!426418 () Bool)

(assert (=> b!657490 (= res!426418 (= (select (store (arr!18560 a!2986) i!1108 k0!1786) index!984) (select (arr!18560 a!2986) j!136)))))

(declare-fun e!377685 () Bool)

(assert (=> b!657490 (=> (not res!426418) (not e!377685))))

(assert (=> b!657490 e!377685))

(declare-fun c!75904 () Bool)

(assert (=> b!657490 (= c!75904 (bvslt j!136 index!984))))

(declare-fun lt!307080 () Unit!22742)

(declare-fun e!377682 () Unit!22742)

(assert (=> b!657490 (= lt!307080 e!377682)))

(declare-fun c!75906 () Bool)

(assert (=> b!657490 (= c!75906 (bvslt index!984 j!136))))

(declare-fun lt!307091 () Unit!22742)

(assert (=> b!657490 (= lt!307091 e!377675)))

(assert (=> b!657490 false))

(declare-fun b!657491 () Bool)

(declare-fun res!426423 () Bool)

(assert (=> b!657491 (=> (not res!426423) (not e!377676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38727 (_ BitVec 32)) Bool)

(assert (=> b!657491 (= res!426423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657492 () Bool)

(declare-fun res!426425 () Bool)

(assert (=> b!657492 (=> (not res!426425) (not e!377676))))

(assert (=> b!657492 (= res!426425 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12637))))

(declare-fun b!657493 () Bool)

(declare-fun e!377673 () Bool)

(declare-fun e!377686 () Bool)

(assert (=> b!657493 (= e!377673 e!377686)))

(declare-fun res!426422 () Bool)

(assert (=> b!657493 (=> (not res!426422) (not e!377686))))

(assert (=> b!657493 (= res!426422 (and (= lt!307089 (Found!6997 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18560 a!2986) index!984) (select (arr!18560 a!2986) j!136))) (not (= (select (arr!18560 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38727 (_ BitVec 32)) SeekEntryResult!6997)

(assert (=> b!657493 (= lt!307089 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18560 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657494 () Bool)

(declare-fun Unit!22747 () Unit!22742)

(assert (=> b!657494 (= e!377684 Unit!22747)))

(declare-fun b!657495 () Bool)

(declare-fun e!377677 () Bool)

(assert (=> b!657495 (= e!377677 true)))

(assert (=> b!657495 (= (select (store (arr!18560 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657496 () Bool)

(assert (=> b!657496 (= e!377678 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) index!984))))

(declare-fun b!657497 () Bool)

(assert (=> b!657497 false))

(declare-fun lt!307090 () Unit!22742)

(assert (=> b!657497 (= lt!307090 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307081 (select (arr!18560 a!2986) j!136) j!136 Nil!12637))))

(assert (=> b!657497 (arrayNoDuplicates!0 lt!307081 j!136 Nil!12637)))

(declare-fun lt!307075 () Unit!22742)

(assert (=> b!657497 (= lt!307075 (lemmaNoDuplicateFromThenFromBigger!0 lt!307081 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657497 (arrayNoDuplicates!0 lt!307081 #b00000000000000000000000000000000 Nil!12637)))

(declare-fun lt!307085 () Unit!22742)

(assert (=> b!657497 (= lt!307085 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12637))))

(assert (=> b!657497 (arrayContainsKey!0 lt!307081 (select (arr!18560 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307078 () Unit!22742)

(assert (=> b!657497 (= lt!307078 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307081 (select (arr!18560 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22748 () Unit!22742)

(assert (=> b!657497 (= e!377682 Unit!22748)))

(declare-fun b!657498 () Bool)

(declare-fun res!426411 () Bool)

(assert (=> b!657498 (=> (not res!426411) (not e!377674))))

(assert (=> b!657498 (= res!426411 (validKeyInArray!0 (select (arr!18560 a!2986) j!136)))))

(declare-fun b!657499 () Bool)

(declare-fun Unit!22749 () Unit!22742)

(assert (=> b!657499 (= e!377682 Unit!22749)))

(declare-fun b!657500 () Bool)

(declare-fun res!426421 () Bool)

(assert (=> b!657500 (= res!426421 (bvsge j!136 index!984))))

(assert (=> b!657500 (=> res!426421 e!377679)))

(assert (=> b!657500 (= e!377685 e!377679)))

(declare-fun b!657501 () Bool)

(declare-fun res!426420 () Bool)

(assert (=> b!657501 (=> (not res!426420) (not e!377674))))

(assert (=> b!657501 (= res!426420 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657502 () Bool)

(declare-fun res!426424 () Bool)

(assert (=> b!657502 (=> (not res!426424) (not e!377674))))

(assert (=> b!657502 (= res!426424 (and (= (size!18925 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18925 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18925 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657503 () Bool)

(assert (=> b!657503 (= e!377686 (not e!377677))))

(declare-fun res!426412 () Bool)

(assert (=> b!657503 (=> res!426412 e!377677)))

(declare-fun lt!307084 () SeekEntryResult!6997)

(assert (=> b!657503 (= res!426412 (not (= lt!307084 (MissingVacant!6997 vacantSpotIndex!68))))))

(declare-fun lt!307076 () Unit!22742)

(assert (=> b!657503 (= lt!307076 e!377684)))

(declare-fun c!75905 () Bool)

(assert (=> b!657503 (= c!75905 (= lt!307084 (Found!6997 index!984)))))

(declare-fun lt!307074 () Unit!22742)

(declare-fun e!377680 () Unit!22742)

(assert (=> b!657503 (= lt!307074 e!377680)))

(declare-fun c!75903 () Bool)

(assert (=> b!657503 (= c!75903 (= lt!307084 Undefined!6997))))

(declare-fun lt!307092 () (_ BitVec 64))

(assert (=> b!657503 (= lt!307084 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307092 lt!307081 mask!3053))))

(assert (=> b!657503 e!377681))

(declare-fun res!426427 () Bool)

(assert (=> b!657503 (=> (not res!426427) (not e!377681))))

(declare-fun lt!307087 () (_ BitVec 32))

(assert (=> b!657503 (= res!426427 (= lt!307086 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307087 vacantSpotIndex!68 lt!307092 lt!307081 mask!3053)))))

(assert (=> b!657503 (= lt!307086 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307087 vacantSpotIndex!68 (select (arr!18560 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657503 (= lt!307092 (select (store (arr!18560 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307088 () Unit!22742)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38727 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22742)

(assert (=> b!657503 (= lt!307088 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307087 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657503 (= lt!307087 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657504 () Bool)

(declare-fun Unit!22750 () Unit!22742)

(assert (=> b!657504 (= e!377680 Unit!22750)))

(declare-fun b!657505 () Bool)

(assert (=> b!657505 (= e!377674 e!377676)))

(declare-fun res!426415 () Bool)

(assert (=> b!657505 (=> (not res!426415) (not e!377676))))

(declare-fun lt!307077 () SeekEntryResult!6997)

(assert (=> b!657505 (= res!426415 (or (= lt!307077 (MissingZero!6997 i!1108)) (= lt!307077 (MissingVacant!6997 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38727 (_ BitVec 32)) SeekEntryResult!6997)

(assert (=> b!657505 (= lt!307077 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657506 () Bool)

(declare-fun Unit!22751 () Unit!22742)

(assert (=> b!657506 (= e!377680 Unit!22751)))

(assert (=> b!657506 false))

(declare-fun b!657507 () Bool)

(assert (=> b!657507 (= e!377676 e!377673)))

(declare-fun res!426417 () Bool)

(assert (=> b!657507 (=> (not res!426417) (not e!377673))))

(assert (=> b!657507 (= res!426417 (= (select (store (arr!18560 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657507 (= lt!307081 (array!38728 (store (arr!18560 a!2986) i!1108 k0!1786) (size!18925 a!2986)))))

(assert (= (and start!59558 res!426426) b!657502))

(assert (= (and b!657502 res!426424) b!657498))

(assert (= (and b!657498 res!426411) b!657484))

(assert (= (and b!657484 res!426414) b!657501))

(assert (= (and b!657501 res!426420) b!657505))

(assert (= (and b!657505 res!426415) b!657491))

(assert (= (and b!657491 res!426423) b!657492))

(assert (= (and b!657492 res!426425) b!657489))

(assert (= (and b!657489 res!426419) b!657507))

(assert (= (and b!657507 res!426417) b!657493))

(assert (= (and b!657493 res!426422) b!657503))

(assert (= (and b!657503 res!426427) b!657485))

(assert (= (and b!657503 c!75903) b!657506))

(assert (= (and b!657503 (not c!75903)) b!657504))

(assert (= (and b!657503 c!75905) b!657490))

(assert (= (and b!657503 (not c!75905)) b!657494))

(assert (= (and b!657490 res!426418) b!657500))

(assert (= (and b!657500 (not res!426421)) b!657483))

(assert (= (and b!657483 res!426413) b!657487))

(assert (= (and b!657490 c!75904) b!657497))

(assert (= (and b!657490 (not c!75904)) b!657499))

(assert (= (and b!657490 c!75906) b!657486))

(assert (= (and b!657490 (not c!75906)) b!657488))

(assert (= (and b!657486 res!426416) b!657496))

(assert (= (and b!657503 (not res!426412)) b!657495))

(declare-fun m!630015 () Bool)

(assert (=> b!657484 m!630015))

(declare-fun m!630017 () Bool)

(assert (=> b!657498 m!630017))

(assert (=> b!657498 m!630017))

(declare-fun m!630019 () Bool)

(assert (=> b!657498 m!630019))

(declare-fun m!630021 () Bool)

(assert (=> b!657503 m!630021))

(declare-fun m!630023 () Bool)

(assert (=> b!657503 m!630023))

(assert (=> b!657503 m!630017))

(declare-fun m!630025 () Bool)

(assert (=> b!657503 m!630025))

(assert (=> b!657503 m!630017))

(declare-fun m!630027 () Bool)

(assert (=> b!657503 m!630027))

(declare-fun m!630029 () Bool)

(assert (=> b!657503 m!630029))

(declare-fun m!630031 () Bool)

(assert (=> b!657503 m!630031))

(declare-fun m!630033 () Bool)

(assert (=> b!657503 m!630033))

(declare-fun m!630035 () Bool)

(assert (=> b!657489 m!630035))

(assert (=> b!657490 m!630033))

(declare-fun m!630037 () Bool)

(assert (=> b!657490 m!630037))

(assert (=> b!657490 m!630017))

(declare-fun m!630039 () Bool)

(assert (=> b!657497 m!630039))

(assert (=> b!657497 m!630017))

(declare-fun m!630041 () Bool)

(assert (=> b!657497 m!630041))

(assert (=> b!657497 m!630017))

(declare-fun m!630043 () Bool)

(assert (=> b!657497 m!630043))

(assert (=> b!657497 m!630017))

(declare-fun m!630045 () Bool)

(assert (=> b!657497 m!630045))

(assert (=> b!657497 m!630017))

(declare-fun m!630047 () Bool)

(assert (=> b!657497 m!630047))

(declare-fun m!630049 () Bool)

(assert (=> b!657497 m!630049))

(declare-fun m!630051 () Bool)

(assert (=> b!657497 m!630051))

(declare-fun m!630053 () Bool)

(assert (=> b!657501 m!630053))

(assert (=> b!657496 m!630017))

(assert (=> b!657496 m!630017))

(declare-fun m!630055 () Bool)

(assert (=> b!657496 m!630055))

(declare-fun m!630057 () Bool)

(assert (=> b!657505 m!630057))

(assert (=> b!657495 m!630033))

(assert (=> b!657495 m!630037))

(assert (=> b!657486 m!630039))

(assert (=> b!657486 m!630017))

(declare-fun m!630059 () Bool)

(assert (=> b!657486 m!630059))

(assert (=> b!657486 m!630017))

(declare-fun m!630061 () Bool)

(assert (=> b!657486 m!630061))

(assert (=> b!657486 m!630017))

(declare-fun m!630063 () Bool)

(assert (=> b!657486 m!630063))

(declare-fun m!630065 () Bool)

(assert (=> b!657486 m!630065))

(assert (=> b!657486 m!630017))

(declare-fun m!630067 () Bool)

(assert (=> b!657486 m!630067))

(assert (=> b!657486 m!630051))

(declare-fun m!630069 () Bool)

(assert (=> b!657486 m!630069))

(assert (=> b!657486 m!630017))

(declare-fun m!630071 () Bool)

(assert (=> b!657491 m!630071))

(assert (=> b!657507 m!630033))

(declare-fun m!630073 () Bool)

(assert (=> b!657507 m!630073))

(declare-fun m!630075 () Bool)

(assert (=> b!657492 m!630075))

(declare-fun m!630077 () Bool)

(assert (=> start!59558 m!630077))

(declare-fun m!630079 () Bool)

(assert (=> start!59558 m!630079))

(assert (=> b!657483 m!630017))

(assert (=> b!657483 m!630017))

(assert (=> b!657483 m!630067))

(declare-fun m!630081 () Bool)

(assert (=> b!657493 m!630081))

(assert (=> b!657493 m!630017))

(assert (=> b!657493 m!630017))

(declare-fun m!630083 () Bool)

(assert (=> b!657493 m!630083))

(assert (=> b!657487 m!630017))

(assert (=> b!657487 m!630017))

(assert (=> b!657487 m!630055))

(check-sat (not b!657496) (not b!657498) (not b!657491) (not b!657487) (not b!657505) (not b!657497) (not b!657503) (not b!657501) (not b!657486) (not b!657484) (not start!59558) (not b!657493) (not b!657483) (not b!657492))
(check-sat)
