; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54336 () Bool)

(assert start!54336)

(declare-fun b!593521 () Bool)

(declare-fun e!339022 () Bool)

(declare-fun e!339023 () Bool)

(assert (=> b!593521 (= e!339022 e!339023)))

(declare-fun res!379916 () Bool)

(assert (=> b!593521 (=> res!379916 e!339023)))

(declare-datatypes ((array!36940 0))(
  ( (array!36941 (arr!17737 (Array (_ BitVec 32) (_ BitVec 64))) (size!18101 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36940)

(assert (=> b!593521 (= res!379916 (or (bvsgt #b00000000000000000000000000000000 (size!18101 a!2986)) (bvsge (size!18101 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!269457 () array!36940)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593521 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18626 0))(
  ( (Unit!18627) )
))
(declare-fun lt!269462 () Unit!18626)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36940 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18626)

(assert (=> b!593521 (= lt!269462 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269457 (select (arr!17737 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593522 () Bool)

(declare-fun res!379910 () Bool)

(declare-fun e!339021 () Bool)

(assert (=> b!593522 (=> (not res!379910) (not e!339021))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593522 (= res!379910 (and (= (size!18101 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18101 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18101 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593523 () Bool)

(declare-fun e!339018 () Unit!18626)

(declare-fun Unit!18628 () Unit!18626)

(assert (=> b!593523 (= e!339018 Unit!18628)))

(assert (=> b!593523 false))

(declare-fun b!593524 () Bool)

(declare-fun res!379908 () Bool)

(assert (=> b!593524 (=> (not res!379908) (not e!339021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593524 (= res!379908 (validKeyInArray!0 (select (arr!17737 a!2986) j!136)))))

(declare-fun b!593525 () Bool)

(declare-fun e!339019 () Bool)

(declare-fun e!339026 () Bool)

(assert (=> b!593525 (= e!339019 e!339026)))

(declare-fun res!379911 () Bool)

(assert (=> b!593525 (=> (not res!379911) (not e!339026))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!593525 (= res!379911 (= (select (store (arr!17737 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593525 (= lt!269457 (array!36941 (store (arr!17737 a!2986) i!1108 k0!1786) (size!18101 a!2986)))))

(declare-fun b!593526 () Bool)

(declare-fun res!379907 () Bool)

(assert (=> b!593526 (=> (not res!379907) (not e!339019))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!593526 (= res!379907 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17737 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!339030 () Bool)

(declare-fun b!593527 () Bool)

(assert (=> b!593527 (= e!339030 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) index!984))))

(declare-fun b!593528 () Bool)

(assert (=> b!593528 (= e!339021 e!339019)))

(declare-fun res!379920 () Bool)

(assert (=> b!593528 (=> (not res!379920) (not e!339019))))

(declare-datatypes ((SeekEntryResult!6177 0))(
  ( (MissingZero!6177 (index!26950 (_ BitVec 32))) (Found!6177 (index!26951 (_ BitVec 32))) (Intermediate!6177 (undefined!6989 Bool) (index!26952 (_ BitVec 32)) (x!55747 (_ BitVec 32))) (Undefined!6177) (MissingVacant!6177 (index!26953 (_ BitVec 32))) )
))
(declare-fun lt!269461 () SeekEntryResult!6177)

(assert (=> b!593528 (= res!379920 (or (= lt!269461 (MissingZero!6177 i!1108)) (= lt!269461 (MissingVacant!6177 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36940 (_ BitVec 32)) SeekEntryResult!6177)

(assert (=> b!593528 (= lt!269461 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593529 () Bool)

(declare-fun res!379915 () Bool)

(assert (=> b!593529 (=> (not res!379915) (not e!339019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36940 (_ BitVec 32)) Bool)

(assert (=> b!593529 (= res!379915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593530 () Bool)

(declare-fun res!379922 () Bool)

(assert (=> b!593530 (=> (not res!379922) (not e!339021))))

(assert (=> b!593530 (= res!379922 (validKeyInArray!0 k0!1786))))

(declare-fun b!593531 () Bool)

(declare-fun e!339028 () Bool)

(declare-fun e!339027 () Bool)

(assert (=> b!593531 (= e!339028 (not e!339027))))

(declare-fun res!379909 () Bool)

(assert (=> b!593531 (=> res!379909 e!339027)))

(declare-fun lt!269458 () SeekEntryResult!6177)

(assert (=> b!593531 (= res!379909 (not (= lt!269458 (Found!6177 index!984))))))

(declare-fun lt!269460 () Unit!18626)

(assert (=> b!593531 (= lt!269460 e!339018)))

(declare-fun c!67175 () Bool)

(assert (=> b!593531 (= c!67175 (= lt!269458 Undefined!6177))))

(declare-fun lt!269459 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36940 (_ BitVec 32)) SeekEntryResult!6177)

(assert (=> b!593531 (= lt!269458 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269459 lt!269457 mask!3053))))

(declare-fun e!339020 () Bool)

(assert (=> b!593531 e!339020))

(declare-fun res!379914 () Bool)

(assert (=> b!593531 (=> (not res!379914) (not e!339020))))

(declare-fun lt!269464 () SeekEntryResult!6177)

(declare-fun lt!269465 () (_ BitVec 32))

(assert (=> b!593531 (= res!379914 (= lt!269464 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 lt!269459 lt!269457 mask!3053)))))

(assert (=> b!593531 (= lt!269464 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593531 (= lt!269459 (select (store (arr!17737 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269463 () Unit!18626)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36940 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18626)

(assert (=> b!593531 (= lt!269463 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593531 (= lt!269465 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593532 () Bool)

(declare-fun res!379919 () Bool)

(assert (=> b!593532 (=> (not res!379919) (not e!339021))))

(assert (=> b!593532 (= res!379919 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593533 () Bool)

(declare-fun lt!269466 () SeekEntryResult!6177)

(assert (=> b!593533 (= e!339020 (= lt!269466 lt!269464))))

(declare-fun b!593534 () Bool)

(declare-fun e!339029 () Bool)

(assert (=> b!593534 (= e!339029 e!339030)))

(declare-fun res!379912 () Bool)

(assert (=> b!593534 (=> (not res!379912) (not e!339030))))

(assert (=> b!593534 (= res!379912 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) j!136))))

(declare-fun b!593535 () Bool)

(declare-datatypes ((List!11778 0))(
  ( (Nil!11775) (Cons!11774 (h!12819 (_ BitVec 64)) (t!18006 List!11778)) )
))
(declare-fun noDuplicate!232 (List!11778) Bool)

(assert (=> b!593535 (= e!339023 (noDuplicate!232 Nil!11775))))

(declare-fun b!593536 () Bool)

(declare-fun res!379917 () Bool)

(assert (=> b!593536 (=> (not res!379917) (not e!339019))))

(declare-fun arrayNoDuplicates!0 (array!36940 (_ BitVec 32) List!11778) Bool)

(assert (=> b!593536 (= res!379917 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11775))))

(declare-fun b!593537 () Bool)

(assert (=> b!593537 (= e!339027 e!339022)))

(declare-fun res!379906 () Bool)

(assert (=> b!593537 (=> res!379906 e!339022)))

(declare-fun lt!269467 () (_ BitVec 64))

(assert (=> b!593537 (= res!379906 (or (not (= (select (arr!17737 a!2986) j!136) lt!269459)) (not (= (select (arr!17737 a!2986) j!136) lt!269467)) (bvsge j!136 index!984)))))

(declare-fun e!339025 () Bool)

(assert (=> b!593537 e!339025))

(declare-fun res!379913 () Bool)

(assert (=> b!593537 (=> (not res!379913) (not e!339025))))

(assert (=> b!593537 (= res!379913 (= lt!269467 (select (arr!17737 a!2986) j!136)))))

(assert (=> b!593537 (= lt!269467 (select (store (arr!17737 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593538 () Bool)

(declare-fun Unit!18629 () Unit!18626)

(assert (=> b!593538 (= e!339018 Unit!18629)))

(declare-fun b!593539 () Bool)

(assert (=> b!593539 (= e!339025 e!339029)))

(declare-fun res!379905 () Bool)

(assert (=> b!593539 (=> res!379905 e!339029)))

(assert (=> b!593539 (= res!379905 (or (not (= (select (arr!17737 a!2986) j!136) lt!269459)) (not (= (select (arr!17737 a!2986) j!136) lt!269467)) (bvsge j!136 index!984)))))

(declare-fun res!379918 () Bool)

(assert (=> start!54336 (=> (not res!379918) (not e!339021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54336 (= res!379918 (validMask!0 mask!3053))))

(assert (=> start!54336 e!339021))

(assert (=> start!54336 true))

(declare-fun array_inv!13533 (array!36940) Bool)

(assert (=> start!54336 (array_inv!13533 a!2986)))

(declare-fun b!593540 () Bool)

(assert (=> b!593540 (= e!339026 e!339028)))

(declare-fun res!379921 () Bool)

(assert (=> b!593540 (=> (not res!379921) (not e!339028))))

(assert (=> b!593540 (= res!379921 (and (= lt!269466 (Found!6177 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17737 a!2986) index!984) (select (arr!17737 a!2986) j!136))) (not (= (select (arr!17737 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593540 (= lt!269466 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54336 res!379918) b!593522))

(assert (= (and b!593522 res!379910) b!593524))

(assert (= (and b!593524 res!379908) b!593530))

(assert (= (and b!593530 res!379922) b!593532))

(assert (= (and b!593532 res!379919) b!593528))

(assert (= (and b!593528 res!379920) b!593529))

(assert (= (and b!593529 res!379915) b!593536))

(assert (= (and b!593536 res!379917) b!593526))

(assert (= (and b!593526 res!379907) b!593525))

(assert (= (and b!593525 res!379911) b!593540))

(assert (= (and b!593540 res!379921) b!593531))

(assert (= (and b!593531 res!379914) b!593533))

(assert (= (and b!593531 c!67175) b!593523))

(assert (= (and b!593531 (not c!67175)) b!593538))

(assert (= (and b!593531 (not res!379909)) b!593537))

(assert (= (and b!593537 res!379913) b!593539))

(assert (= (and b!593539 (not res!379905)) b!593534))

(assert (= (and b!593534 res!379912) b!593527))

(assert (= (and b!593537 (not res!379906)) b!593521))

(assert (= (and b!593521 (not res!379916)) b!593535))

(declare-fun m!571467 () Bool)

(assert (=> b!593524 m!571467))

(assert (=> b!593524 m!571467))

(declare-fun m!571469 () Bool)

(assert (=> b!593524 m!571469))

(declare-fun m!571471 () Bool)

(assert (=> start!54336 m!571471))

(declare-fun m!571473 () Bool)

(assert (=> start!54336 m!571473))

(declare-fun m!571475 () Bool)

(assert (=> b!593525 m!571475))

(declare-fun m!571477 () Bool)

(assert (=> b!593525 m!571477))

(assert (=> b!593534 m!571467))

(assert (=> b!593534 m!571467))

(declare-fun m!571479 () Bool)

(assert (=> b!593534 m!571479))

(declare-fun m!571481 () Bool)

(assert (=> b!593535 m!571481))

(assert (=> b!593521 m!571467))

(assert (=> b!593521 m!571467))

(declare-fun m!571483 () Bool)

(assert (=> b!593521 m!571483))

(assert (=> b!593521 m!571467))

(declare-fun m!571485 () Bool)

(assert (=> b!593521 m!571485))

(assert (=> b!593527 m!571467))

(assert (=> b!593527 m!571467))

(declare-fun m!571487 () Bool)

(assert (=> b!593527 m!571487))

(declare-fun m!571489 () Bool)

(assert (=> b!593528 m!571489))

(declare-fun m!571491 () Bool)

(assert (=> b!593529 m!571491))

(assert (=> b!593539 m!571467))

(declare-fun m!571493 () Bool)

(assert (=> b!593532 m!571493))

(declare-fun m!571495 () Bool)

(assert (=> b!593531 m!571495))

(declare-fun m!571497 () Bool)

(assert (=> b!593531 m!571497))

(assert (=> b!593531 m!571467))

(declare-fun m!571499 () Bool)

(assert (=> b!593531 m!571499))

(assert (=> b!593531 m!571467))

(assert (=> b!593531 m!571475))

(declare-fun m!571501 () Bool)

(assert (=> b!593531 m!571501))

(declare-fun m!571503 () Bool)

(assert (=> b!593531 m!571503))

(declare-fun m!571505 () Bool)

(assert (=> b!593531 m!571505))

(declare-fun m!571507 () Bool)

(assert (=> b!593526 m!571507))

(assert (=> b!593537 m!571467))

(assert (=> b!593537 m!571475))

(declare-fun m!571509 () Bool)

(assert (=> b!593537 m!571509))

(declare-fun m!571511 () Bool)

(assert (=> b!593530 m!571511))

(declare-fun m!571513 () Bool)

(assert (=> b!593536 m!571513))

(declare-fun m!571515 () Bool)

(assert (=> b!593540 m!571515))

(assert (=> b!593540 m!571467))

(assert (=> b!593540 m!571467))

(declare-fun m!571517 () Bool)

(assert (=> b!593540 m!571517))

(check-sat (not b!593528) (not b!593530) (not b!593532) (not b!593527) (not b!593535) (not b!593534) (not b!593529) (not b!593540) (not b!593524) (not b!593536) (not b!593521) (not start!54336) (not b!593531))
(check-sat)
(get-model)

(declare-fun b!593611 () Bool)

(declare-fun e!339078 () Bool)

(declare-fun call!32870 () Bool)

(assert (=> b!593611 (= e!339078 call!32870)))

(declare-fun d!86447 () Bool)

(declare-fun res!379984 () Bool)

(declare-fun e!339081 () Bool)

(assert (=> d!86447 (=> res!379984 e!339081)))

(assert (=> d!86447 (= res!379984 (bvsge #b00000000000000000000000000000000 (size!18101 a!2986)))))

(assert (=> d!86447 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11775) e!339081)))

(declare-fun b!593612 () Bool)

(assert (=> b!593612 (= e!339078 call!32870)))

(declare-fun b!593613 () Bool)

(declare-fun e!339080 () Bool)

(assert (=> b!593613 (= e!339081 e!339080)))

(declare-fun res!379985 () Bool)

(assert (=> b!593613 (=> (not res!379985) (not e!339080))))

(declare-fun e!339079 () Bool)

(assert (=> b!593613 (= res!379985 (not e!339079))))

(declare-fun res!379983 () Bool)

(assert (=> b!593613 (=> (not res!379983) (not e!339079))))

(assert (=> b!593613 (= res!379983 (validKeyInArray!0 (select (arr!17737 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593614 () Bool)

(declare-fun contains!2913 (List!11778 (_ BitVec 64)) Bool)

(assert (=> b!593614 (= e!339079 (contains!2913 Nil!11775 (select (arr!17737 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32867 () Bool)

(declare-fun c!67181 () Bool)

(assert (=> bm!32867 (= call!32870 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67181 (Cons!11774 (select (arr!17737 a!2986) #b00000000000000000000000000000000) Nil!11775) Nil!11775)))))

(declare-fun b!593615 () Bool)

(assert (=> b!593615 (= e!339080 e!339078)))

(assert (=> b!593615 (= c!67181 (validKeyInArray!0 (select (arr!17737 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86447 (not res!379984)) b!593613))

(assert (= (and b!593613 res!379983) b!593614))

(assert (= (and b!593613 res!379985) b!593615))

(assert (= (and b!593615 c!67181) b!593612))

(assert (= (and b!593615 (not c!67181)) b!593611))

(assert (= (or b!593612 b!593611) bm!32867))

(declare-fun m!571571 () Bool)

(assert (=> b!593613 m!571571))

(assert (=> b!593613 m!571571))

(declare-fun m!571573 () Bool)

(assert (=> b!593613 m!571573))

(assert (=> b!593614 m!571571))

(assert (=> b!593614 m!571571))

(declare-fun m!571575 () Bool)

(assert (=> b!593614 m!571575))

(assert (=> bm!32867 m!571571))

(declare-fun m!571577 () Bool)

(assert (=> bm!32867 m!571577))

(assert (=> b!593615 m!571571))

(assert (=> b!593615 m!571571))

(assert (=> b!593615 m!571573))

(assert (=> b!593536 d!86447))

(declare-fun d!86449 () Bool)

(declare-fun res!379990 () Bool)

(declare-fun e!339086 () Bool)

(assert (=> d!86449 (=> res!379990 e!339086)))

(assert (=> d!86449 (= res!379990 (= (select (arr!17737 lt!269457) index!984) (select (arr!17737 a!2986) j!136)))))

(assert (=> d!86449 (= (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) index!984) e!339086)))

(declare-fun b!593620 () Bool)

(declare-fun e!339087 () Bool)

(assert (=> b!593620 (= e!339086 e!339087)))

(declare-fun res!379991 () Bool)

(assert (=> b!593620 (=> (not res!379991) (not e!339087))))

(assert (=> b!593620 (= res!379991 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18101 lt!269457)))))

(declare-fun b!593621 () Bool)

(assert (=> b!593621 (= e!339087 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86449 (not res!379990)) b!593620))

(assert (= (and b!593620 res!379991) b!593621))

(declare-fun m!571579 () Bool)

(assert (=> d!86449 m!571579))

(assert (=> b!593621 m!571467))

(declare-fun m!571581 () Bool)

(assert (=> b!593621 m!571581))

(assert (=> b!593527 d!86449))

(declare-fun b!593634 () Bool)

(declare-fun e!339096 () SeekEntryResult!6177)

(assert (=> b!593634 (= e!339096 Undefined!6177)))

(declare-fun b!593635 () Bool)

(declare-fun c!67188 () Bool)

(declare-fun lt!269507 () (_ BitVec 64))

(assert (=> b!593635 (= c!67188 (= lt!269507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!339095 () SeekEntryResult!6177)

(declare-fun e!339094 () SeekEntryResult!6177)

(assert (=> b!593635 (= e!339095 e!339094)))

(declare-fun d!86451 () Bool)

(declare-fun lt!269509 () SeekEntryResult!6177)

(get-info :version)

(assert (=> d!86451 (and (or ((_ is Undefined!6177) lt!269509) (not ((_ is Found!6177) lt!269509)) (and (bvsge (index!26951 lt!269509) #b00000000000000000000000000000000) (bvslt (index!26951 lt!269509) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269509) ((_ is Found!6177) lt!269509) (not ((_ is MissingZero!6177) lt!269509)) (and (bvsge (index!26950 lt!269509) #b00000000000000000000000000000000) (bvslt (index!26950 lt!269509) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269509) ((_ is Found!6177) lt!269509) ((_ is MissingZero!6177) lt!269509) (not ((_ is MissingVacant!6177) lt!269509)) (and (bvsge (index!26953 lt!269509) #b00000000000000000000000000000000) (bvslt (index!26953 lt!269509) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269509) (ite ((_ is Found!6177) lt!269509) (= (select (arr!17737 a!2986) (index!26951 lt!269509)) k0!1786) (ite ((_ is MissingZero!6177) lt!269509) (= (select (arr!17737 a!2986) (index!26950 lt!269509)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6177) lt!269509) (= (select (arr!17737 a!2986) (index!26953 lt!269509)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86451 (= lt!269509 e!339096)))

(declare-fun c!67189 () Bool)

(declare-fun lt!269508 () SeekEntryResult!6177)

(assert (=> d!86451 (= c!67189 (and ((_ is Intermediate!6177) lt!269508) (undefined!6989 lt!269508)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36940 (_ BitVec 32)) SeekEntryResult!6177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86451 (= lt!269508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86451 (validMask!0 mask!3053)))

(assert (=> d!86451 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269509)))

(declare-fun b!593636 () Bool)

(assert (=> b!593636 (= e!339094 (seekKeyOrZeroReturnVacant!0 (x!55747 lt!269508) (index!26952 lt!269508) (index!26952 lt!269508) k0!1786 a!2986 mask!3053))))

(declare-fun b!593637 () Bool)

(assert (=> b!593637 (= e!339095 (Found!6177 (index!26952 lt!269508)))))

(declare-fun b!593638 () Bool)

(assert (=> b!593638 (= e!339094 (MissingZero!6177 (index!26952 lt!269508)))))

(declare-fun b!593639 () Bool)

(assert (=> b!593639 (= e!339096 e!339095)))

(assert (=> b!593639 (= lt!269507 (select (arr!17737 a!2986) (index!26952 lt!269508)))))

(declare-fun c!67190 () Bool)

(assert (=> b!593639 (= c!67190 (= lt!269507 k0!1786))))

(assert (= (and d!86451 c!67189) b!593634))

(assert (= (and d!86451 (not c!67189)) b!593639))

(assert (= (and b!593639 c!67190) b!593637))

(assert (= (and b!593639 (not c!67190)) b!593635))

(assert (= (and b!593635 c!67188) b!593638))

(assert (= (and b!593635 (not c!67188)) b!593636))

(declare-fun m!571583 () Bool)

(assert (=> d!86451 m!571583))

(declare-fun m!571585 () Bool)

(assert (=> d!86451 m!571585))

(assert (=> d!86451 m!571471))

(assert (=> d!86451 m!571585))

(declare-fun m!571587 () Bool)

(assert (=> d!86451 m!571587))

(declare-fun m!571589 () Bool)

(assert (=> d!86451 m!571589))

(declare-fun m!571591 () Bool)

(assert (=> d!86451 m!571591))

(declare-fun m!571593 () Bool)

(assert (=> b!593636 m!571593))

(declare-fun m!571595 () Bool)

(assert (=> b!593639 m!571595))

(assert (=> b!593528 d!86451))

(declare-fun b!593648 () Bool)

(declare-fun e!339105 () Bool)

(declare-fun call!32873 () Bool)

(assert (=> b!593648 (= e!339105 call!32873)))

(declare-fun b!593649 () Bool)

(declare-fun e!339103 () Bool)

(assert (=> b!593649 (= e!339105 e!339103)))

(declare-fun lt!269517 () (_ BitVec 64))

(assert (=> b!593649 (= lt!269517 (select (arr!17737 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269518 () Unit!18626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36940 (_ BitVec 64) (_ BitVec 32)) Unit!18626)

(assert (=> b!593649 (= lt!269518 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269517 #b00000000000000000000000000000000))))

(assert (=> b!593649 (arrayContainsKey!0 a!2986 lt!269517 #b00000000000000000000000000000000)))

(declare-fun lt!269516 () Unit!18626)

(assert (=> b!593649 (= lt!269516 lt!269518)))

(declare-fun res!379996 () Bool)

(assert (=> b!593649 (= res!379996 (= (seekEntryOrOpen!0 (select (arr!17737 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6177 #b00000000000000000000000000000000)))))

(assert (=> b!593649 (=> (not res!379996) (not e!339103))))

(declare-fun bm!32870 () Bool)

(assert (=> bm!32870 (= call!32873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86453 () Bool)

(declare-fun res!379997 () Bool)

(declare-fun e!339104 () Bool)

(assert (=> d!86453 (=> res!379997 e!339104)))

(assert (=> d!86453 (= res!379997 (bvsge #b00000000000000000000000000000000 (size!18101 a!2986)))))

(assert (=> d!86453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!339104)))

(declare-fun b!593650 () Bool)

(assert (=> b!593650 (= e!339103 call!32873)))

(declare-fun b!593651 () Bool)

(assert (=> b!593651 (= e!339104 e!339105)))

(declare-fun c!67193 () Bool)

(assert (=> b!593651 (= c!67193 (validKeyInArray!0 (select (arr!17737 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86453 (not res!379997)) b!593651))

(assert (= (and b!593651 c!67193) b!593649))

(assert (= (and b!593651 (not c!67193)) b!593648))

(assert (= (and b!593649 res!379996) b!593650))

(assert (= (or b!593650 b!593648) bm!32870))

(assert (=> b!593649 m!571571))

(declare-fun m!571597 () Bool)

(assert (=> b!593649 m!571597))

(declare-fun m!571599 () Bool)

(assert (=> b!593649 m!571599))

(assert (=> b!593649 m!571571))

(declare-fun m!571601 () Bool)

(assert (=> b!593649 m!571601))

(declare-fun m!571603 () Bool)

(assert (=> bm!32870 m!571603))

(assert (=> b!593651 m!571571))

(assert (=> b!593651 m!571571))

(assert (=> b!593651 m!571573))

(assert (=> b!593529 d!86453))

(declare-fun b!593678 () Bool)

(declare-fun e!339128 () SeekEntryResult!6177)

(assert (=> b!593678 (= e!339128 (MissingVacant!6177 vacantSpotIndex!68))))

(declare-fun b!593679 () Bool)

(declare-fun e!339126 () SeekEntryResult!6177)

(declare-fun e!339127 () SeekEntryResult!6177)

(assert (=> b!593679 (= e!339126 e!339127)))

(declare-fun lt!269526 () (_ BitVec 64))

(declare-fun c!67201 () Bool)

(assert (=> b!593679 (= c!67201 (= lt!269526 (select (arr!17737 a!2986) j!136)))))

(declare-fun b!593680 () Bool)

(assert (=> b!593680 (= e!339126 Undefined!6177)))

(declare-fun lt!269525 () SeekEntryResult!6177)

(declare-fun d!86455 () Bool)

(assert (=> d!86455 (and (or ((_ is Undefined!6177) lt!269525) (not ((_ is Found!6177) lt!269525)) (and (bvsge (index!26951 lt!269525) #b00000000000000000000000000000000) (bvslt (index!26951 lt!269525) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269525) ((_ is Found!6177) lt!269525) (not ((_ is MissingVacant!6177) lt!269525)) (not (= (index!26953 lt!269525) vacantSpotIndex!68)) (and (bvsge (index!26953 lt!269525) #b00000000000000000000000000000000) (bvslt (index!26953 lt!269525) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269525) (ite ((_ is Found!6177) lt!269525) (= (select (arr!17737 a!2986) (index!26951 lt!269525)) (select (arr!17737 a!2986) j!136)) (and ((_ is MissingVacant!6177) lt!269525) (= (index!26953 lt!269525) vacantSpotIndex!68) (= (select (arr!17737 a!2986) (index!26953 lt!269525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86455 (= lt!269525 e!339126)))

(declare-fun c!67202 () Bool)

(assert (=> d!86455 (= c!67202 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86455 (= lt!269526 (select (arr!17737 a!2986) index!984))))

(assert (=> d!86455 (validMask!0 mask!3053)))

(assert (=> d!86455 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053) lt!269525)))

(declare-fun b!593681 () Bool)

(assert (=> b!593681 (= e!339128 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593682 () Bool)

(assert (=> b!593682 (= e!339127 (Found!6177 index!984))))

(declare-fun b!593683 () Bool)

(declare-fun c!67200 () Bool)

(assert (=> b!593683 (= c!67200 (= lt!269526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593683 (= e!339127 e!339128)))

(assert (= (and d!86455 c!67202) b!593680))

(assert (= (and d!86455 (not c!67202)) b!593679))

(assert (= (and b!593679 c!67201) b!593682))

(assert (= (and b!593679 (not c!67201)) b!593683))

(assert (= (and b!593683 c!67200) b!593678))

(assert (= (and b!593683 (not c!67200)) b!593681))

(declare-fun m!571617 () Bool)

(assert (=> d!86455 m!571617))

(declare-fun m!571619 () Bool)

(assert (=> d!86455 m!571619))

(assert (=> d!86455 m!571515))

(assert (=> d!86455 m!571471))

(assert (=> b!593681 m!571495))

(assert (=> b!593681 m!571495))

(assert (=> b!593681 m!571467))

(declare-fun m!571621 () Bool)

(assert (=> b!593681 m!571621))

(assert (=> b!593540 d!86455))

(declare-fun d!86467 () Bool)

(assert (=> d!86467 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593530 d!86467))

(declare-fun b!593684 () Bool)

(declare-fun e!339131 () SeekEntryResult!6177)

(assert (=> b!593684 (= e!339131 (MissingVacant!6177 vacantSpotIndex!68))))

(declare-fun b!593685 () Bool)

(declare-fun e!339129 () SeekEntryResult!6177)

(declare-fun e!339130 () SeekEntryResult!6177)

(assert (=> b!593685 (= e!339129 e!339130)))

(declare-fun c!67204 () Bool)

(declare-fun lt!269532 () (_ BitVec 64))

(assert (=> b!593685 (= c!67204 (= lt!269532 lt!269459))))

(declare-fun b!593686 () Bool)

(assert (=> b!593686 (= e!339129 Undefined!6177)))

(declare-fun d!86471 () Bool)

(declare-fun lt!269531 () SeekEntryResult!6177)

(assert (=> d!86471 (and (or ((_ is Undefined!6177) lt!269531) (not ((_ is Found!6177) lt!269531)) (and (bvsge (index!26951 lt!269531) #b00000000000000000000000000000000) (bvslt (index!26951 lt!269531) (size!18101 lt!269457)))) (or ((_ is Undefined!6177) lt!269531) ((_ is Found!6177) lt!269531) (not ((_ is MissingVacant!6177) lt!269531)) (not (= (index!26953 lt!269531) vacantSpotIndex!68)) (and (bvsge (index!26953 lt!269531) #b00000000000000000000000000000000) (bvslt (index!26953 lt!269531) (size!18101 lt!269457)))) (or ((_ is Undefined!6177) lt!269531) (ite ((_ is Found!6177) lt!269531) (= (select (arr!17737 lt!269457) (index!26951 lt!269531)) lt!269459) (and ((_ is MissingVacant!6177) lt!269531) (= (index!26953 lt!269531) vacantSpotIndex!68) (= (select (arr!17737 lt!269457) (index!26953 lt!269531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86471 (= lt!269531 e!339129)))

(declare-fun c!67205 () Bool)

(assert (=> d!86471 (= c!67205 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86471 (= lt!269532 (select (arr!17737 lt!269457) index!984))))

(assert (=> d!86471 (validMask!0 mask!3053)))

(assert (=> d!86471 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269459 lt!269457 mask!3053) lt!269531)))

(declare-fun b!593687 () Bool)

(assert (=> b!593687 (= e!339131 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269459 lt!269457 mask!3053))))

(declare-fun b!593688 () Bool)

(assert (=> b!593688 (= e!339130 (Found!6177 index!984))))

(declare-fun b!593689 () Bool)

(declare-fun c!67203 () Bool)

(assert (=> b!593689 (= c!67203 (= lt!269532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593689 (= e!339130 e!339131)))

(assert (= (and d!86471 c!67205) b!593686))

(assert (= (and d!86471 (not c!67205)) b!593685))

(assert (= (and b!593685 c!67204) b!593688))

(assert (= (and b!593685 (not c!67204)) b!593689))

(assert (= (and b!593689 c!67203) b!593684))

(assert (= (and b!593689 (not c!67203)) b!593687))

(declare-fun m!571627 () Bool)

(assert (=> d!86471 m!571627))

(declare-fun m!571629 () Bool)

(assert (=> d!86471 m!571629))

(assert (=> d!86471 m!571579))

(assert (=> d!86471 m!571471))

(assert (=> b!593687 m!571495))

(assert (=> b!593687 m!571495))

(declare-fun m!571631 () Bool)

(assert (=> b!593687 m!571631))

(assert (=> b!593531 d!86471))

(declare-fun d!86475 () Bool)

(declare-fun lt!269535 () (_ BitVec 32))

(assert (=> d!86475 (and (bvsge lt!269535 #b00000000000000000000000000000000) (bvslt lt!269535 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86475 (= lt!269535 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86475 (validMask!0 mask!3053)))

(assert (=> d!86475 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269535)))

(declare-fun bs!18312 () Bool)

(assert (= bs!18312 d!86475))

(declare-fun m!571633 () Bool)

(assert (=> bs!18312 m!571633))

(assert (=> bs!18312 m!571471))

(assert (=> b!593531 d!86475))

(declare-fun b!593690 () Bool)

(declare-fun e!339134 () SeekEntryResult!6177)

(assert (=> b!593690 (= e!339134 (MissingVacant!6177 vacantSpotIndex!68))))

(declare-fun b!593691 () Bool)

(declare-fun e!339132 () SeekEntryResult!6177)

(declare-fun e!339133 () SeekEntryResult!6177)

(assert (=> b!593691 (= e!339132 e!339133)))

(declare-fun lt!269537 () (_ BitVec 64))

(declare-fun c!67207 () Bool)

(assert (=> b!593691 (= c!67207 (= lt!269537 (select (arr!17737 a!2986) j!136)))))

(declare-fun b!593692 () Bool)

(assert (=> b!593692 (= e!339132 Undefined!6177)))

(declare-fun d!86479 () Bool)

(declare-fun lt!269536 () SeekEntryResult!6177)

(assert (=> d!86479 (and (or ((_ is Undefined!6177) lt!269536) (not ((_ is Found!6177) lt!269536)) (and (bvsge (index!26951 lt!269536) #b00000000000000000000000000000000) (bvslt (index!26951 lt!269536) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269536) ((_ is Found!6177) lt!269536) (not ((_ is MissingVacant!6177) lt!269536)) (not (= (index!26953 lt!269536) vacantSpotIndex!68)) (and (bvsge (index!26953 lt!269536) #b00000000000000000000000000000000) (bvslt (index!26953 lt!269536) (size!18101 a!2986)))) (or ((_ is Undefined!6177) lt!269536) (ite ((_ is Found!6177) lt!269536) (= (select (arr!17737 a!2986) (index!26951 lt!269536)) (select (arr!17737 a!2986) j!136)) (and ((_ is MissingVacant!6177) lt!269536) (= (index!26953 lt!269536) vacantSpotIndex!68) (= (select (arr!17737 a!2986) (index!26953 lt!269536)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86479 (= lt!269536 e!339132)))

(declare-fun c!67208 () Bool)

(assert (=> d!86479 (= c!67208 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86479 (= lt!269537 (select (arr!17737 a!2986) lt!269465))))

(assert (=> d!86479 (validMask!0 mask!3053)))

(assert (=> d!86479 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053) lt!269536)))

(declare-fun b!593693 () Bool)

(assert (=> b!593693 (= e!339134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269465 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593694 () Bool)

(assert (=> b!593694 (= e!339133 (Found!6177 lt!269465))))

(declare-fun b!593695 () Bool)

(declare-fun c!67206 () Bool)

(assert (=> b!593695 (= c!67206 (= lt!269537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593695 (= e!339133 e!339134)))

(assert (= (and d!86479 c!67208) b!593692))

(assert (= (and d!86479 (not c!67208)) b!593691))

(assert (= (and b!593691 c!67207) b!593694))

(assert (= (and b!593691 (not c!67207)) b!593695))

(assert (= (and b!593695 c!67206) b!593690))

(assert (= (and b!593695 (not c!67206)) b!593693))

(declare-fun m!571635 () Bool)

(assert (=> d!86479 m!571635))

(declare-fun m!571637 () Bool)

(assert (=> d!86479 m!571637))

(declare-fun m!571639 () Bool)

(assert (=> d!86479 m!571639))

(assert (=> d!86479 m!571471))

(declare-fun m!571641 () Bool)

(assert (=> b!593693 m!571641))

(assert (=> b!593693 m!571641))

(assert (=> b!593693 m!571467))

(declare-fun m!571643 () Bool)

(assert (=> b!593693 m!571643))

(assert (=> b!593531 d!86479))

(declare-fun d!86481 () Bool)

(declare-fun e!339145 () Bool)

(assert (=> d!86481 e!339145))

(declare-fun res!380016 () Bool)

(assert (=> d!86481 (=> (not res!380016) (not e!339145))))

(assert (=> d!86481 (= res!380016 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18101 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18101 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18101 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18101 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18101 a!2986))))))

(declare-fun lt!269544 () Unit!18626)

(declare-fun choose!9 (array!36940 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18626)

(assert (=> d!86481 (= lt!269544 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86481 (validMask!0 mask!3053)))

(assert (=> d!86481 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 mask!3053) lt!269544)))

(declare-fun b!593712 () Bool)

(assert (=> b!593712 (= e!339145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 (select (arr!17737 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 (select (store (arr!17737 a!2986) i!1108 k0!1786) j!136) (array!36941 (store (arr!17737 a!2986) i!1108 k0!1786) (size!18101 a!2986)) mask!3053)))))

(assert (= (and d!86481 res!380016) b!593712))

(declare-fun m!571649 () Bool)

(assert (=> d!86481 m!571649))

(assert (=> d!86481 m!571471))

(assert (=> b!593712 m!571467))

(assert (=> b!593712 m!571499))

(assert (=> b!593712 m!571467))

(assert (=> b!593712 m!571497))

(declare-fun m!571651 () Bool)

(assert (=> b!593712 m!571651))

(assert (=> b!593712 m!571475))

(assert (=> b!593712 m!571497))

(assert (=> b!593531 d!86481))

(declare-fun b!593713 () Bool)

(declare-fun e!339148 () SeekEntryResult!6177)

(assert (=> b!593713 (= e!339148 (MissingVacant!6177 vacantSpotIndex!68))))

(declare-fun b!593714 () Bool)

(declare-fun e!339146 () SeekEntryResult!6177)

(declare-fun e!339147 () SeekEntryResult!6177)

(assert (=> b!593714 (= e!339146 e!339147)))

(declare-fun c!67216 () Bool)

(declare-fun lt!269546 () (_ BitVec 64))

(assert (=> b!593714 (= c!67216 (= lt!269546 lt!269459))))

(declare-fun b!593715 () Bool)

(assert (=> b!593715 (= e!339146 Undefined!6177)))

(declare-fun lt!269545 () SeekEntryResult!6177)

(declare-fun d!86493 () Bool)

(assert (=> d!86493 (and (or ((_ is Undefined!6177) lt!269545) (not ((_ is Found!6177) lt!269545)) (and (bvsge (index!26951 lt!269545) #b00000000000000000000000000000000) (bvslt (index!26951 lt!269545) (size!18101 lt!269457)))) (or ((_ is Undefined!6177) lt!269545) ((_ is Found!6177) lt!269545) (not ((_ is MissingVacant!6177) lt!269545)) (not (= (index!26953 lt!269545) vacantSpotIndex!68)) (and (bvsge (index!26953 lt!269545) #b00000000000000000000000000000000) (bvslt (index!26953 lt!269545) (size!18101 lt!269457)))) (or ((_ is Undefined!6177) lt!269545) (ite ((_ is Found!6177) lt!269545) (= (select (arr!17737 lt!269457) (index!26951 lt!269545)) lt!269459) (and ((_ is MissingVacant!6177) lt!269545) (= (index!26953 lt!269545) vacantSpotIndex!68) (= (select (arr!17737 lt!269457) (index!26953 lt!269545)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86493 (= lt!269545 e!339146)))

(declare-fun c!67217 () Bool)

(assert (=> d!86493 (= c!67217 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86493 (= lt!269546 (select (arr!17737 lt!269457) lt!269465))))

(assert (=> d!86493 (validMask!0 mask!3053)))

(assert (=> d!86493 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269465 vacantSpotIndex!68 lt!269459 lt!269457 mask!3053) lt!269545)))

(declare-fun b!593716 () Bool)

(assert (=> b!593716 (= e!339148 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269465 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!269459 lt!269457 mask!3053))))

(declare-fun b!593717 () Bool)

(assert (=> b!593717 (= e!339147 (Found!6177 lt!269465))))

(declare-fun b!593718 () Bool)

(declare-fun c!67215 () Bool)

(assert (=> b!593718 (= c!67215 (= lt!269546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593718 (= e!339147 e!339148)))

(assert (= (and d!86493 c!67217) b!593715))

(assert (= (and d!86493 (not c!67217)) b!593714))

(assert (= (and b!593714 c!67216) b!593717))

(assert (= (and b!593714 (not c!67216)) b!593718))

(assert (= (and b!593718 c!67215) b!593713))

(assert (= (and b!593718 (not c!67215)) b!593716))

(declare-fun m!571653 () Bool)

(assert (=> d!86493 m!571653))

(declare-fun m!571655 () Bool)

(assert (=> d!86493 m!571655))

(declare-fun m!571657 () Bool)

(assert (=> d!86493 m!571657))

(assert (=> d!86493 m!571471))

(assert (=> b!593716 m!571641))

(assert (=> b!593716 m!571641))

(declare-fun m!571659 () Bool)

(assert (=> b!593716 m!571659))

(assert (=> b!593531 d!86493))

(declare-fun d!86495 () Bool)

(declare-fun res!380017 () Bool)

(declare-fun e!339152 () Bool)

(assert (=> d!86495 (=> res!380017 e!339152)))

(assert (=> d!86495 (= res!380017 (= (select (arr!17737 lt!269457) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17737 a!2986) j!136)))))

(assert (=> d!86495 (= (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339152)))

(declare-fun b!593725 () Bool)

(declare-fun e!339153 () Bool)

(assert (=> b!593725 (= e!339152 e!339153)))

(declare-fun res!380018 () Bool)

(assert (=> b!593725 (=> (not res!380018) (not e!339153))))

(assert (=> b!593725 (= res!380018 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18101 lt!269457)))))

(declare-fun b!593726 () Bool)

(assert (=> b!593726 (= e!339153 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86495 (not res!380017)) b!593725))

(assert (= (and b!593725 res!380018) b!593726))

(declare-fun m!571667 () Bool)

(assert (=> d!86495 m!571667))

(assert (=> b!593726 m!571467))

(declare-fun m!571669 () Bool)

(assert (=> b!593726 m!571669))

(assert (=> b!593521 d!86495))

(declare-fun d!86499 () Bool)

(assert (=> d!86499 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269551 () Unit!18626)

(declare-fun choose!114 (array!36940 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18626)

(assert (=> d!86499 (= lt!269551 (choose!114 lt!269457 (select (arr!17737 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86499 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86499 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269457 (select (arr!17737 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269551)))

(declare-fun bs!18313 () Bool)

(assert (= bs!18313 d!86499))

(assert (=> bs!18313 m!571467))

(assert (=> bs!18313 m!571483))

(assert (=> bs!18313 m!571467))

(declare-fun m!571675 () Bool)

(assert (=> bs!18313 m!571675))

(assert (=> b!593521 d!86499))

(declare-fun d!86503 () Bool)

(declare-fun res!380021 () Bool)

(declare-fun e!339156 () Bool)

(assert (=> d!86503 (=> res!380021 e!339156)))

(assert (=> d!86503 (= res!380021 (= (select (arr!17737 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86503 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!339156)))

(declare-fun b!593729 () Bool)

(declare-fun e!339157 () Bool)

(assert (=> b!593729 (= e!339156 e!339157)))

(declare-fun res!380022 () Bool)

(assert (=> b!593729 (=> (not res!380022) (not e!339157))))

(assert (=> b!593729 (= res!380022 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18101 a!2986)))))

(declare-fun b!593730 () Bool)

(assert (=> b!593730 (= e!339157 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86503 (not res!380021)) b!593729))

(assert (= (and b!593729 res!380022) b!593730))

(assert (=> d!86503 m!571571))

(declare-fun m!571677 () Bool)

(assert (=> b!593730 m!571677))

(assert (=> b!593532 d!86503))

(declare-fun d!86505 () Bool)

(assert (=> d!86505 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54336 d!86505))

(declare-fun d!86511 () Bool)

(assert (=> d!86511 (= (array_inv!13533 a!2986) (bvsge (size!18101 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54336 d!86511))

(declare-fun d!86513 () Bool)

(declare-fun res!380035 () Bool)

(declare-fun e!339173 () Bool)

(assert (=> d!86513 (=> res!380035 e!339173)))

(assert (=> d!86513 (= res!380035 (= (select (arr!17737 lt!269457) j!136) (select (arr!17737 a!2986) j!136)))))

(assert (=> d!86513 (= (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) j!136) e!339173)))

(declare-fun b!593749 () Bool)

(declare-fun e!339174 () Bool)

(assert (=> b!593749 (= e!339173 e!339174)))

(declare-fun res!380036 () Bool)

(assert (=> b!593749 (=> (not res!380036) (not e!339174))))

(assert (=> b!593749 (= res!380036 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18101 lt!269457)))))

(declare-fun b!593750 () Bool)

(assert (=> b!593750 (= e!339174 (arrayContainsKey!0 lt!269457 (select (arr!17737 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86513 (not res!380035)) b!593749))

(assert (= (and b!593749 res!380036) b!593750))

(declare-fun m!571691 () Bool)

(assert (=> d!86513 m!571691))

(assert (=> b!593750 m!571467))

(declare-fun m!571693 () Bool)

(assert (=> b!593750 m!571693))

(assert (=> b!593534 d!86513))

(declare-fun d!86515 () Bool)

(assert (=> d!86515 (= (validKeyInArray!0 (select (arr!17737 a!2986) j!136)) (and (not (= (select (arr!17737 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17737 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593524 d!86515))

(declare-fun d!86517 () Bool)

(declare-fun res!380041 () Bool)

(declare-fun e!339179 () Bool)

(assert (=> d!86517 (=> res!380041 e!339179)))

(assert (=> d!86517 (= res!380041 ((_ is Nil!11775) Nil!11775))))

(assert (=> d!86517 (= (noDuplicate!232 Nil!11775) e!339179)))

(declare-fun b!593755 () Bool)

(declare-fun e!339180 () Bool)

(assert (=> b!593755 (= e!339179 e!339180)))

(declare-fun res!380042 () Bool)

(assert (=> b!593755 (=> (not res!380042) (not e!339180))))

(assert (=> b!593755 (= res!380042 (not (contains!2913 (t!18006 Nil!11775) (h!12819 Nil!11775))))))

(declare-fun b!593756 () Bool)

(assert (=> b!593756 (= e!339180 (noDuplicate!232 (t!18006 Nil!11775)))))

(assert (= (and d!86517 (not res!380041)) b!593755))

(assert (= (and b!593755 res!380042) b!593756))

(declare-fun m!571695 () Bool)

(assert (=> b!593755 m!571695))

(declare-fun m!571697 () Bool)

(assert (=> b!593756 m!571697))

(assert (=> b!593535 d!86517))

(check-sat (not b!593716) (not d!86451) (not b!593730) (not b!593712) (not b!593750) (not b!593613) (not b!593726) (not bm!32867) (not d!86471) (not b!593621) (not b!593615) (not b!593693) (not d!86455) (not bm!32870) (not d!86481) (not b!593756) (not d!86475) (not b!593681) (not b!593636) (not b!593649) (not d!86493) (not b!593687) (not b!593614) (not b!593755) (not d!86499) (not b!593651) (not d!86479))
(check-sat)
