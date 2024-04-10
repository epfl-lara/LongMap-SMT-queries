; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55616 () Bool)

(assert start!55616)

(declare-fun b!610063 () Bool)

(declare-fun res!392496 () Bool)

(declare-fun e!349435 () Bool)

(assert (=> b!610063 (=> (not res!392496) (not e!349435))))

(declare-datatypes ((array!37347 0))(
  ( (array!37348 (arr!17924 (Array (_ BitVec 32) (_ BitVec 64))) (size!18288 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37347)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37347 (_ BitVec 32)) Bool)

(assert (=> b!610063 (= res!392496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610064 () Bool)

(declare-fun e!349429 () Bool)

(assert (=> b!610064 (= e!349429 (or (bvsgt #b00000000000000000000000000000000 (size!18288 a!2986)) (bvslt (size!18288 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!279021 () array!37347)

(declare-datatypes ((List!11965 0))(
  ( (Nil!11962) (Cons!11961 (h!13006 (_ BitVec 64)) (t!18193 List!11965)) )
))
(declare-fun arrayNoDuplicates!0 (array!37347 (_ BitVec 32) List!11965) Bool)

(assert (=> b!610064 (arrayNoDuplicates!0 lt!279021 #b00000000000000000000000000000000 Nil!11962)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!19564 0))(
  ( (Unit!19565) )
))
(declare-fun lt!279025 () Unit!19564)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11965) Unit!19564)

(assert (=> b!610064 (= lt!279025 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11962))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610064 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279027 () Unit!19564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19564)

(assert (=> b!610064 (= lt!279027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349434 () Bool)

(assert (=> b!610064 e!349434))

(declare-fun res!392493 () Bool)

(assert (=> b!610064 (=> (not res!392493) (not e!349434))))

(assert (=> b!610064 (= res!392493 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136))))

(declare-fun b!610065 () Bool)

(declare-fun res!392487 () Bool)

(declare-fun e!349431 () Bool)

(assert (=> b!610065 (=> (not res!392487) (not e!349431))))

(assert (=> b!610065 (= res!392487 (and (= (size!18288 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18288 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18288 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!349442 () Bool)

(declare-fun b!610066 () Bool)

(assert (=> b!610066 (= e!349442 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) index!984))))

(declare-fun b!610067 () Bool)

(assert (=> b!610067 (= e!349431 e!349435)))

(declare-fun res!392483 () Bool)

(assert (=> b!610067 (=> (not res!392483) (not e!349435))))

(declare-datatypes ((SeekEntryResult!6364 0))(
  ( (MissingZero!6364 (index!27731 (_ BitVec 32))) (Found!6364 (index!27732 (_ BitVec 32))) (Intermediate!6364 (undefined!7176 Bool) (index!27733 (_ BitVec 32)) (x!56529 (_ BitVec 32))) (Undefined!6364) (MissingVacant!6364 (index!27734 (_ BitVec 32))) )
))
(declare-fun lt!279018 () SeekEntryResult!6364)

(assert (=> b!610067 (= res!392483 (or (= lt!279018 (MissingZero!6364 i!1108)) (= lt!279018 (MissingVacant!6364 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!610067 (= lt!279018 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!610068 () Bool)

(declare-fun e!349437 () Bool)

(declare-fun e!349432 () Bool)

(assert (=> b!610068 (= e!349437 e!349432)))

(declare-fun res!392494 () Bool)

(assert (=> b!610068 (=> res!392494 e!349432)))

(declare-fun lt!279023 () (_ BitVec 64))

(declare-fun lt!279024 () (_ BitVec 64))

(assert (=> b!610068 (= res!392494 (or (not (= (select (arr!17924 a!2986) j!136) lt!279024)) (not (= (select (arr!17924 a!2986) j!136) lt!279023)) (bvsge j!136 index!984)))))

(declare-fun b!610069 () Bool)

(declare-fun res!392488 () Bool)

(assert (=> b!610069 (=> (not res!392488) (not e!349435))))

(assert (=> b!610069 (= res!392488 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11962))))

(declare-fun b!610070 () Bool)

(declare-fun e!349441 () Bool)

(assert (=> b!610070 (= e!349435 e!349441)))

(declare-fun res!392484 () Bool)

(assert (=> b!610070 (=> (not res!392484) (not e!349441))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!610070 (= res!392484 (= (select (store (arr!17924 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610070 (= lt!279021 (array!37348 (store (arr!17924 a!2986) i!1108 k!1786) (size!18288 a!2986)))))

(declare-fun b!610071 () Bool)

(declare-fun e!349433 () Bool)

(declare-fun lt!279033 () SeekEntryResult!6364)

(declare-fun lt!279034 () SeekEntryResult!6364)

(assert (=> b!610071 (= e!349433 (= lt!279033 lt!279034))))

(declare-fun b!610072 () Bool)

(declare-fun e!349443 () Bool)

(assert (=> b!610072 (= e!349443 e!349429)))

(declare-fun res!392497 () Bool)

(assert (=> b!610072 (=> res!392497 e!349429)))

(assert (=> b!610072 (= res!392497 (bvsge index!984 j!136))))

(declare-fun lt!279020 () Unit!19564)

(declare-fun e!349436 () Unit!19564)

(assert (=> b!610072 (= lt!279020 e!349436)))

(declare-fun c!69157 () Bool)

(assert (=> b!610072 (= c!69157 (bvslt j!136 index!984))))

(declare-fun res!392490 () Bool)

(assert (=> start!55616 (=> (not res!392490) (not e!349431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55616 (= res!392490 (validMask!0 mask!3053))))

(assert (=> start!55616 e!349431))

(assert (=> start!55616 true))

(declare-fun array_inv!13720 (array!37347) Bool)

(assert (=> start!55616 (array_inv!13720 a!2986)))

(declare-fun b!610073 () Bool)

(declare-fun e!349440 () Unit!19564)

(declare-fun Unit!19566 () Unit!19564)

(assert (=> b!610073 (= e!349440 Unit!19566)))

(assert (=> b!610073 false))

(declare-fun b!610074 () Bool)

(declare-fun Unit!19567 () Unit!19564)

(assert (=> b!610074 (= e!349440 Unit!19567)))

(declare-fun b!610075 () Bool)

(declare-fun res!392492 () Bool)

(assert (=> b!610075 (=> (not res!392492) (not e!349431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610075 (= res!392492 (validKeyInArray!0 k!1786))))

(declare-fun b!610076 () Bool)

(declare-fun e!349430 () Bool)

(assert (=> b!610076 (= e!349430 e!349443)))

(declare-fun res!392495 () Bool)

(assert (=> b!610076 (=> res!392495 e!349443)))

(assert (=> b!610076 (= res!392495 (or (not (= (select (arr!17924 a!2986) j!136) lt!279024)) (not (= (select (arr!17924 a!2986) j!136) lt!279023))))))

(assert (=> b!610076 e!349437))

(declare-fun res!392501 () Bool)

(assert (=> b!610076 (=> (not res!392501) (not e!349437))))

(assert (=> b!610076 (= res!392501 (= lt!279023 (select (arr!17924 a!2986) j!136)))))

(assert (=> b!610076 (= lt!279023 (select (store (arr!17924 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!610077 () Bool)

(declare-fun e!349439 () Bool)

(assert (=> b!610077 (= e!349441 e!349439)))

(declare-fun res!392500 () Bool)

(assert (=> b!610077 (=> (not res!392500) (not e!349439))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!610077 (= res!392500 (and (= lt!279033 (Found!6364 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17924 a!2986) index!984) (select (arr!17924 a!2986) j!136))) (not (= (select (arr!17924 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!610077 (= lt!279033 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610078 () Bool)

(declare-fun res!392489 () Bool)

(assert (=> b!610078 (=> (not res!392489) (not e!349431))))

(assert (=> b!610078 (= res!392489 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610079 () Bool)

(assert (=> b!610079 (= e!349434 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) index!984))))

(declare-fun b!610080 () Bool)

(assert (=> b!610080 (= e!349439 (not e!349430))))

(declare-fun res!392491 () Bool)

(assert (=> b!610080 (=> res!392491 e!349430)))

(declare-fun lt!279031 () SeekEntryResult!6364)

(assert (=> b!610080 (= res!392491 (not (= lt!279031 (Found!6364 index!984))))))

(declare-fun lt!279022 () Unit!19564)

(assert (=> b!610080 (= lt!279022 e!349440)))

(declare-fun c!69158 () Bool)

(assert (=> b!610080 (= c!69158 (= lt!279031 Undefined!6364))))

(assert (=> b!610080 (= lt!279031 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279024 lt!279021 mask!3053))))

(assert (=> b!610080 e!349433))

(declare-fun res!392498 () Bool)

(assert (=> b!610080 (=> (not res!392498) (not e!349433))))

(declare-fun lt!279032 () (_ BitVec 32))

(assert (=> b!610080 (= res!392498 (= lt!279034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279032 vacantSpotIndex!68 lt!279024 lt!279021 mask!3053)))))

(assert (=> b!610080 (= lt!279034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279032 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610080 (= lt!279024 (select (store (arr!17924 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279026 () Unit!19564)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19564)

(assert (=> b!610080 (= lt!279026 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279032 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610080 (= lt!279032 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!610081 () Bool)

(declare-fun Unit!19568 () Unit!19564)

(assert (=> b!610081 (= e!349436 Unit!19568)))

(declare-fun lt!279029 () Unit!19564)

(assert (=> b!610081 (= lt!279029 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279021 (select (arr!17924 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610081 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279030 () Unit!19564)

(assert (=> b!610081 (= lt!279030 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11962))))

(assert (=> b!610081 (arrayNoDuplicates!0 lt!279021 #b00000000000000000000000000000000 Nil!11962)))

(declare-fun lt!279019 () Unit!19564)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37347 (_ BitVec 32) (_ BitVec 32)) Unit!19564)

(assert (=> b!610081 (= lt!279019 (lemmaNoDuplicateFromThenFromBigger!0 lt!279021 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610081 (arrayNoDuplicates!0 lt!279021 j!136 Nil!11962)))

(declare-fun lt!279028 () Unit!19564)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37347 (_ BitVec 64) (_ BitVec 32) List!11965) Unit!19564)

(assert (=> b!610081 (= lt!279028 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136 Nil!11962))))

(assert (=> b!610081 false))

(declare-fun b!610082 () Bool)

(declare-fun res!392485 () Bool)

(assert (=> b!610082 (=> (not res!392485) (not e!349435))))

(assert (=> b!610082 (= res!392485 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17924 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610083 () Bool)

(declare-fun Unit!19569 () Unit!19564)

(assert (=> b!610083 (= e!349436 Unit!19569)))

(declare-fun b!610084 () Bool)

(assert (=> b!610084 (= e!349432 e!349442)))

(declare-fun res!392499 () Bool)

(assert (=> b!610084 (=> (not res!392499) (not e!349442))))

(assert (=> b!610084 (= res!392499 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136))))

(declare-fun b!610085 () Bool)

(declare-fun res!392486 () Bool)

(assert (=> b!610085 (=> (not res!392486) (not e!349431))))

(assert (=> b!610085 (= res!392486 (validKeyInArray!0 (select (arr!17924 a!2986) j!136)))))

(assert (= (and start!55616 res!392490) b!610065))

(assert (= (and b!610065 res!392487) b!610085))

(assert (= (and b!610085 res!392486) b!610075))

(assert (= (and b!610075 res!392492) b!610078))

(assert (= (and b!610078 res!392489) b!610067))

(assert (= (and b!610067 res!392483) b!610063))

(assert (= (and b!610063 res!392496) b!610069))

(assert (= (and b!610069 res!392488) b!610082))

(assert (= (and b!610082 res!392485) b!610070))

(assert (= (and b!610070 res!392484) b!610077))

(assert (= (and b!610077 res!392500) b!610080))

(assert (= (and b!610080 res!392498) b!610071))

(assert (= (and b!610080 c!69158) b!610073))

(assert (= (and b!610080 (not c!69158)) b!610074))

(assert (= (and b!610080 (not res!392491)) b!610076))

(assert (= (and b!610076 res!392501) b!610068))

(assert (= (and b!610068 (not res!392494)) b!610084))

(assert (= (and b!610084 res!392499) b!610066))

(assert (= (and b!610076 (not res!392495)) b!610072))

(assert (= (and b!610072 c!69157) b!610081))

(assert (= (and b!610072 (not c!69157)) b!610083))

(assert (= (and b!610072 (not res!392497)) b!610064))

(assert (= (and b!610064 res!392493) b!610079))

(declare-fun m!586531 () Bool)

(assert (=> b!610077 m!586531))

(declare-fun m!586533 () Bool)

(assert (=> b!610077 m!586533))

(assert (=> b!610077 m!586533))

(declare-fun m!586535 () Bool)

(assert (=> b!610077 m!586535))

(declare-fun m!586537 () Bool)

(assert (=> b!610063 m!586537))

(declare-fun m!586539 () Bool)

(assert (=> b!610069 m!586539))

(declare-fun m!586541 () Bool)

(assert (=> b!610067 m!586541))

(assert (=> b!610079 m!586533))

(assert (=> b!610079 m!586533))

(declare-fun m!586543 () Bool)

(assert (=> b!610079 m!586543))

(assert (=> b!610081 m!586533))

(declare-fun m!586545 () Bool)

(assert (=> b!610081 m!586545))

(assert (=> b!610081 m!586533))

(declare-fun m!586547 () Bool)

(assert (=> b!610081 m!586547))

(assert (=> b!610081 m!586533))

(declare-fun m!586549 () Bool)

(assert (=> b!610081 m!586549))

(declare-fun m!586551 () Bool)

(assert (=> b!610081 m!586551))

(declare-fun m!586553 () Bool)

(assert (=> b!610081 m!586553))

(assert (=> b!610081 m!586533))

(declare-fun m!586555 () Bool)

(assert (=> b!610081 m!586555))

(declare-fun m!586557 () Bool)

(assert (=> b!610081 m!586557))

(assert (=> b!610066 m!586533))

(assert (=> b!610066 m!586533))

(assert (=> b!610066 m!586543))

(assert (=> b!610085 m!586533))

(assert (=> b!610085 m!586533))

(declare-fun m!586559 () Bool)

(assert (=> b!610085 m!586559))

(declare-fun m!586561 () Bool)

(assert (=> b!610075 m!586561))

(declare-fun m!586563 () Bool)

(assert (=> b!610082 m!586563))

(assert (=> b!610064 m!586533))

(declare-fun m!586565 () Bool)

(assert (=> b!610064 m!586565))

(assert (=> b!610064 m!586533))

(assert (=> b!610064 m!586533))

(declare-fun m!586567 () Bool)

(assert (=> b!610064 m!586567))

(assert (=> b!610064 m!586557))

(assert (=> b!610064 m!586533))

(declare-fun m!586569 () Bool)

(assert (=> b!610064 m!586569))

(assert (=> b!610064 m!586549))

(assert (=> b!610076 m!586533))

(declare-fun m!586571 () Bool)

(assert (=> b!610076 m!586571))

(declare-fun m!586573 () Bool)

(assert (=> b!610076 m!586573))

(declare-fun m!586575 () Bool)

(assert (=> b!610078 m!586575))

(declare-fun m!586577 () Bool)

(assert (=> start!55616 m!586577))

(declare-fun m!586579 () Bool)

(assert (=> start!55616 m!586579))

(assert (=> b!610068 m!586533))

(declare-fun m!586581 () Bool)

(assert (=> b!610080 m!586581))

(declare-fun m!586583 () Bool)

(assert (=> b!610080 m!586583))

(assert (=> b!610080 m!586571))

(assert (=> b!610080 m!586533))

(declare-fun m!586585 () Bool)

(assert (=> b!610080 m!586585))

(declare-fun m!586587 () Bool)

(assert (=> b!610080 m!586587))

(declare-fun m!586589 () Bool)

(assert (=> b!610080 m!586589))

(declare-fun m!586591 () Bool)

(assert (=> b!610080 m!586591))

(assert (=> b!610080 m!586533))

(assert (=> b!610084 m!586533))

(assert (=> b!610084 m!586533))

(assert (=> b!610084 m!586565))

(assert (=> b!610070 m!586571))

(declare-fun m!586593 () Bool)

(assert (=> b!610070 m!586593))

(push 1)

(assert (not start!55616))

(assert (not b!610063))

(assert (not b!610084))

(assert (not b!610077))

(assert (not b!610067))

(assert (not b!610075))

(assert (not b!610079))

(assert (not b!610066))

(assert (not b!610085))

(assert (not b!610078))

(assert (not b!610069))

(assert (not b!610064))

(assert (not b!610081))

(assert (not b!610080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88121 () Bool)

(declare-fun res!392539 () Bool)

(declare-fun e!349497 () Bool)

(assert (=> d!88121 (=> res!392539 e!349497)))

(assert (=> d!88121 (= res!392539 (= (select (arr!17924 lt!279021) j!136) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88121 (= (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136) e!349497)))

(declare-fun b!610155 () Bool)

(declare-fun e!349498 () Bool)

(assert (=> b!610155 (= e!349497 e!349498)))

(declare-fun res!392540 () Bool)

(assert (=> b!610155 (=> (not res!392540) (not e!349498))))

(assert (=> b!610155 (= res!392540 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18288 lt!279021)))))

(declare-fun b!610156 () Bool)

(assert (=> b!610156 (= e!349498 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88121 (not res!392539)) b!610155))

(assert (= (and b!610155 res!392540) b!610156))

(declare-fun m!586645 () Bool)

(assert (=> d!88121 m!586645))

(assert (=> b!610156 m!586533))

(declare-fun m!586647 () Bool)

(assert (=> b!610156 m!586647))

(assert (=> b!610084 d!88121))

(declare-fun b!610177 () Bool)

(declare-fun e!349511 () Bool)

(declare-fun e!349512 () Bool)

(assert (=> b!610177 (= e!349511 e!349512)))

(declare-fun c!69183 () Bool)

(assert (=> b!610177 (= c!69183 (validKeyInArray!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33117 () Bool)

(declare-fun call!33120 () Bool)

(assert (=> bm!33117 (= call!33120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610178 () Bool)

(declare-fun e!349513 () Bool)

(assert (=> b!610178 (= e!349513 call!33120)))

(declare-fun d!88127 () Bool)

(declare-fun res!392545 () Bool)

(assert (=> d!88127 (=> res!392545 e!349511)))

(assert (=> d!88127 (= res!392545 (bvsge #b00000000000000000000000000000000 (size!18288 a!2986)))))

(assert (=> d!88127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349511)))

(declare-fun b!610179 () Bool)

(assert (=> b!610179 (= e!349512 e!349513)))

(declare-fun lt!279068 () (_ BitVec 64))

(assert (=> b!610179 (= lt!279068 (select (arr!17924 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279069 () Unit!19564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37347 (_ BitVec 64) (_ BitVec 32)) Unit!19564)

(assert (=> b!610179 (= lt!279069 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279068 #b00000000000000000000000000000000))))

(assert (=> b!610179 (arrayContainsKey!0 a!2986 lt!279068 #b00000000000000000000000000000000)))

(declare-fun lt!279070 () Unit!19564)

(assert (=> b!610179 (= lt!279070 lt!279069)))

(declare-fun res!392546 () Bool)

(assert (=> b!610179 (= res!392546 (= (seekEntryOrOpen!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6364 #b00000000000000000000000000000000)))))

(assert (=> b!610179 (=> (not res!392546) (not e!349513))))

(declare-fun b!610180 () Bool)

(assert (=> b!610180 (= e!349512 call!33120)))

(assert (= (and d!88127 (not res!392545)) b!610177))

(assert (= (and b!610177 c!69183) b!610179))

(assert (= (and b!610177 (not c!69183)) b!610180))

(assert (= (and b!610179 res!392546) b!610178))

(assert (= (or b!610178 b!610180) bm!33117))

(declare-fun m!586665 () Bool)

(assert (=> b!610177 m!586665))

(assert (=> b!610177 m!586665))

(declare-fun m!586667 () Bool)

(assert (=> b!610177 m!586667))

(declare-fun m!586669 () Bool)

(assert (=> bm!33117 m!586669))

(assert (=> b!610179 m!586665))

(declare-fun m!586671 () Bool)

(assert (=> b!610179 m!586671))

(declare-fun m!586673 () Bool)

(assert (=> b!610179 m!586673))

(assert (=> b!610179 m!586665))

(declare-fun m!586675 () Bool)

(assert (=> b!610179 m!586675))

(assert (=> b!610063 d!88127))

(declare-fun d!88135 () Bool)

(assert (=> d!88135 (= (validKeyInArray!0 (select (arr!17924 a!2986) j!136)) (and (not (= (select (arr!17924 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17924 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610085 d!88135))

(declare-fun d!88137 () Bool)

(declare-fun res!392549 () Bool)

(declare-fun e!349522 () Bool)

(assert (=> d!88137 (=> res!392549 e!349522)))

(assert (=> d!88137 (= res!392549 (= (select (arr!17924 lt!279021) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88137 (= (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349522)))

(declare-fun b!610195 () Bool)

(declare-fun e!349523 () Bool)

(assert (=> b!610195 (= e!349522 e!349523)))

(declare-fun res!392550 () Bool)

(assert (=> b!610195 (=> (not res!392550) (not e!349523))))

(assert (=> b!610195 (= res!392550 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18288 lt!279021)))))

(declare-fun b!610196 () Bool)

(assert (=> b!610196 (= e!349523 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88137 (not res!392549)) b!610195))

(assert (= (and b!610195 res!392550) b!610196))

(declare-fun m!586677 () Bool)

(assert (=> d!88137 m!586677))

(assert (=> b!610196 m!586533))

(declare-fun m!586679 () Bool)

(assert (=> b!610196 m!586679))

(assert (=> b!610064 d!88137))

(declare-fun d!88139 () Bool)

(assert (=> d!88139 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279078 () Unit!19564)

(declare-fun choose!114 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19564)

(assert (=> d!88139 (= lt!279078 (choose!114 lt!279021 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88139 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88139 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279021 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279078)))

(declare-fun bs!18611 () Bool)

(assert (= bs!18611 d!88139))

(assert (=> bs!18611 m!586533))

(assert (=> bs!18611 m!586567))

(assert (=> bs!18611 m!586533))

(declare-fun m!586685 () Bool)

(assert (=> bs!18611 m!586685))

(assert (=> b!610064 d!88139))

(assert (=> b!610064 d!88121))

(declare-fun d!88143 () Bool)

(declare-fun e!349539 () Bool)

(assert (=> d!88143 e!349539))

(declare-fun res!392560 () Bool)

(assert (=> d!88143 (=> (not res!392560) (not e!349539))))

(assert (=> d!88143 (= res!392560 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18288 a!2986))))))

(declare-fun lt!279088 () Unit!19564)

(declare-fun choose!41 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11965) Unit!19564)

(assert (=> d!88143 (= lt!279088 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11962))))

(assert (=> d!88143 (bvslt (size!18288 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88143 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11962) lt!279088)))

(declare-fun b!610218 () Bool)

(assert (=> b!610218 (= e!349539 (arrayNoDuplicates!0 (array!37348 (store (arr!17924 a!2986) i!1108 k!1786) (size!18288 a!2986)) #b00000000000000000000000000000000 Nil!11962))))

(assert (= (and d!88143 res!392560) b!610218))

(declare-fun m!586707 () Bool)

(assert (=> d!88143 m!586707))

(assert (=> b!610218 m!586571))

(declare-fun m!586709 () Bool)

(assert (=> b!610218 m!586709))

(assert (=> b!610064 d!88143))

(declare-fun b!610229 () Bool)

(declare-fun e!349550 () Bool)

(declare-fun contains!3037 (List!11965 (_ BitVec 64)) Bool)

(assert (=> b!610229 (= e!349550 (contains!3037 Nil!11962 (select (arr!17924 lt!279021) #b00000000000000000000000000000000)))))

(declare-fun b!610230 () Bool)

(declare-fun e!349551 () Bool)

(declare-fun e!349549 () Bool)

(assert (=> b!610230 (= e!349551 e!349549)))

(declare-fun c!69198 () Bool)

(assert (=> b!610230 (= c!69198 (validKeyInArray!0 (select (arr!17924 lt!279021) #b00000000000000000000000000000000)))))

(declare-fun d!88153 () Bool)

(declare-fun res!392568 () Bool)

(declare-fun e!349548 () Bool)

(assert (=> d!88153 (=> res!392568 e!349548)))

(assert (=> d!88153 (= res!392568 (bvsge #b00000000000000000000000000000000 (size!18288 lt!279021)))))

(assert (=> d!88153 (= (arrayNoDuplicates!0 lt!279021 #b00000000000000000000000000000000 Nil!11962) e!349548)))

(declare-fun b!610231 () Bool)

(assert (=> b!610231 (= e!349548 e!349551)))

(declare-fun res!392567 () Bool)

(assert (=> b!610231 (=> (not res!392567) (not e!349551))))

(assert (=> b!610231 (= res!392567 (not e!349550))))

(declare-fun res!392569 () Bool)

(assert (=> b!610231 (=> (not res!392569) (not e!349550))))

(assert (=> b!610231 (= res!392569 (validKeyInArray!0 (select (arr!17924 lt!279021) #b00000000000000000000000000000000)))))

(declare-fun b!610232 () Bool)

(declare-fun call!33123 () Bool)

(assert (=> b!610232 (= e!349549 call!33123)))

(declare-fun bm!33120 () Bool)

(assert (=> bm!33120 (= call!33123 (arrayNoDuplicates!0 lt!279021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69198 (Cons!11961 (select (arr!17924 lt!279021) #b00000000000000000000000000000000) Nil!11962) Nil!11962)))))

(declare-fun b!610233 () Bool)

(assert (=> b!610233 (= e!349549 call!33123)))

(assert (= (and d!88153 (not res!392568)) b!610231))

(assert (= (and b!610231 res!392569) b!610229))

(assert (= (and b!610231 res!392567) b!610230))

(assert (= (and b!610230 c!69198) b!610232))

(assert (= (and b!610230 (not c!69198)) b!610233))

(assert (= (or b!610232 b!610233) bm!33120))

(declare-fun m!586711 () Bool)

(assert (=> b!610229 m!586711))

(assert (=> b!610229 m!586711))

(declare-fun m!586713 () Bool)

(assert (=> b!610229 m!586713))

(assert (=> b!610230 m!586711))

(assert (=> b!610230 m!586711))

(declare-fun m!586715 () Bool)

(assert (=> b!610230 m!586715))

(assert (=> b!610231 m!586711))

(assert (=> b!610231 m!586711))

(assert (=> b!610231 m!586715))

(assert (=> bm!33120 m!586711))

(declare-fun m!586717 () Bool)

(assert (=> bm!33120 m!586717))

(assert (=> b!610064 d!88153))

(declare-fun d!88155 () Bool)

(assert (=> d!88155 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610075 d!88155))

(declare-fun d!88157 () Bool)

(declare-fun res!392570 () Bool)

(declare-fun e!349552 () Bool)

(assert (=> d!88157 (=> res!392570 e!349552)))

(assert (=> d!88157 (= res!392570 (= (select (arr!17924 lt!279021) index!984) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88157 (= (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) index!984) e!349552)))

(declare-fun b!610234 () Bool)

(declare-fun e!349553 () Bool)

(assert (=> b!610234 (= e!349552 e!349553)))

(declare-fun res!392571 () Bool)

(assert (=> b!610234 (=> (not res!392571) (not e!349553))))

(assert (=> b!610234 (= res!392571 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18288 lt!279021)))))

(declare-fun b!610235 () Bool)

(assert (=> b!610235 (= e!349553 (arrayContainsKey!0 lt!279021 (select (arr!17924 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88157 (not res!392570)) b!610234))

(assert (= (and b!610234 res!392571) b!610235))

(declare-fun m!586719 () Bool)

(assert (=> d!88157 m!586719))

(assert (=> b!610235 m!586533))

(declare-fun m!586721 () Bool)

(assert (=> b!610235 m!586721))

(assert (=> b!610066 d!88157))

(declare-fun b!610286 () Bool)

(declare-fun e!349581 () SeekEntryResult!6364)

(assert (=> b!610286 (= e!349581 (Found!6364 index!984))))

(declare-fun b!610287 () Bool)

(declare-fun e!349580 () SeekEntryResult!6364)

(assert (=> b!610287 (= e!349580 e!349581)))

(declare-fun c!69223 () Bool)

(declare-fun lt!279115 () (_ BitVec 64))

(assert (=> b!610287 (= c!69223 (= lt!279115 (select (arr!17924 a!2986) j!136)))))

(declare-fun b!610288 () Bool)

(declare-fun c!69225 () Bool)

(assert (=> b!610288 (= c!69225 (= lt!279115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349582 () SeekEntryResult!6364)

(assert (=> b!610288 (= e!349581 e!349582)))

(declare-fun b!610289 () Bool)

(assert (=> b!610289 (= e!349582 (MissingVacant!6364 vacantSpotIndex!68))))

(declare-fun lt!279114 () SeekEntryResult!6364)

(declare-fun d!88159 () Bool)

(assert (=> d!88159 (and (or (is-Undefined!6364 lt!279114) (not (is-Found!6364 lt!279114)) (and (bvsge (index!27732 lt!279114) #b00000000000000000000000000000000) (bvslt (index!27732 lt!279114) (size!18288 a!2986)))) (or (is-Undefined!6364 lt!279114) (is-Found!6364 lt!279114) (not (is-MissingVacant!6364 lt!279114)) (not (= (index!27734 lt!279114) vacantSpotIndex!68)) (and (bvsge (index!27734 lt!279114) #b00000000000000000000000000000000) (bvslt (index!27734 lt!279114) (size!18288 a!2986)))) (or (is-Undefined!6364 lt!279114) (ite (is-Found!6364 lt!279114) (= (select (arr!17924 a!2986) (index!27732 lt!279114)) (select (arr!17924 a!2986) j!136)) (and (is-MissingVacant!6364 lt!279114) (= (index!27734 lt!279114) vacantSpotIndex!68) (= (select (arr!17924 a!2986) (index!27734 lt!279114)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88159 (= lt!279114 e!349580)))

(declare-fun c!69224 () Bool)

(assert (=> d!88159 (= c!69224 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88159 (= lt!279115 (select (arr!17924 a!2986) index!984))))

(assert (=> d!88159 (validMask!0 mask!3053)))

(assert (=> d!88159 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053) lt!279114)))

(declare-fun b!610290 () Bool)

(assert (=> b!610290 (= e!349580 Undefined!6364)))

(declare-fun b!610291 () Bool)

(assert (=> b!610291 (= e!349582 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!88159 c!69224) b!610290))

(assert (= (and d!88159 (not c!69224)) b!610287))

(assert (= (and b!610287 c!69223) b!610286))

(assert (= (and b!610287 (not c!69223)) b!610288))

(assert (= (and b!610288 c!69225) b!610289))

(assert (= (and b!610288 (not c!69225)) b!610291))

(declare-fun m!586757 () Bool)

(assert (=> d!88159 m!586757))

(declare-fun m!586759 () Bool)

(assert (=> d!88159 m!586759))

(assert (=> d!88159 m!586531))

(assert (=> d!88159 m!586577))

(assert (=> b!610291 m!586581))

(assert (=> b!610291 m!586581))

(assert (=> b!610291 m!586533))

(declare-fun m!586761 () Bool)

(assert (=> b!610291 m!586761))

(assert (=> b!610077 d!88159))

(declare-fun b!610323 () Bool)

(declare-fun e!349601 () SeekEntryResult!6364)

(declare-fun e!349603 () SeekEntryResult!6364)

(assert (=> b!610323 (= e!349601 e!349603)))

(declare-fun lt!279134 () (_ BitVec 64))

(declare-fun lt!279133 () SeekEntryResult!6364)

(assert (=> b!610323 (= lt!279134 (select (arr!17924 a!2986) (index!27733 lt!279133)))))

(declare-fun c!69239 () Bool)

(assert (=> b!610323 (= c!69239 (= lt!279134 k!1786))))

(declare-fun b!610324 () Bool)

(declare-fun c!69241 () Bool)

(assert (=> b!610324 (= c!69241 (= lt!279134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349602 () SeekEntryResult!6364)

(assert (=> b!610324 (= e!349603 e!349602)))

(declare-fun d!88169 () Bool)

(declare-fun lt!279135 () SeekEntryResult!6364)

(assert (=> d!88169 (and (or (is-Undefined!6364 lt!279135) (not (is-Found!6364 lt!279135)) (and (bvsge (index!27732 lt!279135) #b00000000000000000000000000000000) (bvslt (index!27732 lt!279135) (size!18288 a!2986)))) (or (is-Undefined!6364 lt!279135) (is-Found!6364 lt!279135) (not (is-MissingZero!6364 lt!279135)) (and (bvsge (index!27731 lt!279135) #b00000000000000000000000000000000) (bvslt (index!27731 lt!279135) (size!18288 a!2986)))) (or (is-Undefined!6364 lt!279135) (is-Found!6364 lt!279135) (is-MissingZero!6364 lt!279135) (not (is-MissingVacant!6364 lt!279135)) (and (bvsge (index!27734 lt!279135) #b00000000000000000000000000000000) (bvslt (index!27734 lt!279135) (size!18288 a!2986)))) (or (is-Undefined!6364 lt!279135) (ite (is-Found!6364 lt!279135) (= (select (arr!17924 a!2986) (index!27732 lt!279135)) k!1786) (ite (is-MissingZero!6364 lt!279135) (= (select (arr!17924 a!2986) (index!27731 lt!279135)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6364 lt!279135) (= (select (arr!17924 a!2986) (index!27734 lt!279135)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88169 (= lt!279135 e!349601)))

(declare-fun c!69240 () Bool)

(assert (=> d!88169 (= c!69240 (and (is-Intermediate!6364 lt!279133) (undefined!7176 lt!279133)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88169 (= lt!279133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88169 (validMask!0 mask!3053)))

(assert (=> d!88169 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!279135)))

(declare-fun b!610325 () Bool)

(assert (=> b!610325 (= e!349601 Undefined!6364)))

(declare-fun b!610326 () Bool)

(assert (=> b!610326 (= e!349602 (MissingZero!6364 (index!27733 lt!279133)))))

(declare-fun b!610327 () Bool)

(assert (=> b!610327 (= e!349603 (Found!6364 (index!27733 lt!279133)))))

(declare-fun b!610328 () Bool)

(assert (=> b!610328 (= e!349602 (seekKeyOrZeroReturnVacant!0 (x!56529 lt!279133) (index!27733 lt!279133) (index!27733 lt!279133) k!1786 a!2986 mask!3053))))

(assert (= (and d!88169 c!69240) b!610325))

(assert (= (and d!88169 (not c!69240)) b!610323))

(assert (= (and b!610323 c!69239) b!610327))

