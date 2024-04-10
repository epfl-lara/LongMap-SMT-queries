; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55156 () Bool)

(assert start!55156)

(declare-fun b!604582 () Bool)

(declare-fun res!388493 () Bool)

(declare-fun e!345947 () Bool)

(assert (=> b!604582 (=> (not res!388493) (not e!345947))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37229 0))(
  ( (array!37230 (arr!17871 (Array (_ BitVec 32) (_ BitVec 64))) (size!18235 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37229)

(assert (=> b!604582 (= res!388493 (and (= (size!18235 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18235 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604583 () Bool)

(declare-fun e!345951 () Bool)

(assert (=> b!604583 (= e!345947 e!345951)))

(declare-fun res!388489 () Bool)

(assert (=> b!604583 (=> (not res!388489) (not e!345951))))

(declare-datatypes ((SeekEntryResult!6311 0))(
  ( (MissingZero!6311 (index!27507 (_ BitVec 32))) (Found!6311 (index!27508 (_ BitVec 32))) (Intermediate!6311 (undefined!7123 Bool) (index!27509 (_ BitVec 32)) (x!56304 (_ BitVec 32))) (Undefined!6311) (MissingVacant!6311 (index!27510 (_ BitVec 32))) )
))
(declare-fun lt!275772 () SeekEntryResult!6311)

(assert (=> b!604583 (= res!388489 (or (= lt!275772 (MissingZero!6311 i!1108)) (= lt!275772 (MissingVacant!6311 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37229 (_ BitVec 32)) SeekEntryResult!6311)

(assert (=> b!604583 (= lt!275772 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604584 () Bool)

(declare-fun e!345946 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604584 (= e!345946 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18235 a!2986)) (bvslt (size!18235 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!275762 () array!37229)

(declare-fun arrayContainsKey!0 (array!37229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604584 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19246 0))(
  ( (Unit!19247) )
))
(declare-fun lt!275759 () Unit!19246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19246)

(assert (=> b!604584 (= lt!275759 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345956 () Bool)

(assert (=> b!604584 e!345956))

(declare-fun res!388479 () Bool)

(assert (=> b!604584 (=> (not res!388479) (not e!345956))))

(assert (=> b!604584 (= res!388479 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136))))

(declare-fun b!604585 () Bool)

(declare-fun res!388492 () Bool)

(assert (=> b!604585 (=> (not res!388492) (not e!345947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604585 (= res!388492 (validKeyInArray!0 (select (arr!17871 a!2986) j!136)))))

(declare-fun b!604586 () Bool)

(declare-fun e!345949 () Bool)

(declare-fun lt!275770 () SeekEntryResult!6311)

(declare-fun lt!275768 () SeekEntryResult!6311)

(assert (=> b!604586 (= e!345949 (= lt!275770 lt!275768))))

(declare-fun b!604587 () Bool)

(declare-fun e!345950 () Bool)

(declare-fun e!345955 () Bool)

(assert (=> b!604587 (= e!345950 e!345955)))

(declare-fun res!388481 () Bool)

(assert (=> b!604587 (=> res!388481 e!345955)))

(declare-fun lt!275765 () (_ BitVec 64))

(declare-fun lt!275767 () (_ BitVec 64))

(assert (=> b!604587 (= res!388481 (or (not (= (select (arr!17871 a!2986) j!136) lt!275767)) (not (= (select (arr!17871 a!2986) j!136) lt!275765)) (bvsge j!136 index!984)))))

(declare-fun b!604588 () Bool)

(declare-fun e!345958 () Bool)

(declare-fun e!345959 () Bool)

(assert (=> b!604588 (= e!345958 e!345959)))

(declare-fun res!388480 () Bool)

(assert (=> b!604588 (=> (not res!388480) (not e!345959))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604588 (= res!388480 (and (= lt!275770 (Found!6311 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17871 a!2986) index!984) (select (arr!17871 a!2986) j!136))) (not (= (select (arr!17871 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37229 (_ BitVec 32)) SeekEntryResult!6311)

(assert (=> b!604588 (= lt!275770 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604589 () Bool)

(declare-fun e!345954 () Bool)

(assert (=> b!604589 (= e!345955 e!345954)))

(declare-fun res!388487 () Bool)

(assert (=> b!604589 (=> (not res!388487) (not e!345954))))

(assert (=> b!604589 (= res!388487 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136))))

(declare-fun b!604590 () Bool)

(declare-fun res!388478 () Bool)

(assert (=> b!604590 (=> (not res!388478) (not e!345947))))

(assert (=> b!604590 (= res!388478 (validKeyInArray!0 k!1786))))

(declare-fun b!604591 () Bool)

(assert (=> b!604591 (= e!345954 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) index!984))))

(declare-fun b!604592 () Bool)

(declare-fun e!345953 () Unit!19246)

(declare-fun Unit!19248 () Unit!19246)

(assert (=> b!604592 (= e!345953 Unit!19248)))

(declare-fun b!604593 () Bool)

(declare-fun res!388488 () Bool)

(assert (=> b!604593 (=> (not res!388488) (not e!345951))))

(declare-datatypes ((List!11912 0))(
  ( (Nil!11909) (Cons!11908 (h!12953 (_ BitVec 64)) (t!18140 List!11912)) )
))
(declare-fun arrayNoDuplicates!0 (array!37229 (_ BitVec 32) List!11912) Bool)

(assert (=> b!604593 (= res!388488 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11909))))

(declare-fun b!604594 () Bool)

(declare-fun e!345957 () Unit!19246)

(declare-fun Unit!19249 () Unit!19246)

(assert (=> b!604594 (= e!345957 Unit!19249)))

(declare-fun b!604595 () Bool)

(declare-fun e!345952 () Bool)

(declare-fun e!345960 () Bool)

(assert (=> b!604595 (= e!345952 e!345960)))

(declare-fun res!388483 () Bool)

(assert (=> b!604595 (=> res!388483 e!345960)))

(assert (=> b!604595 (= res!388483 (or (not (= (select (arr!17871 a!2986) j!136) lt!275767)) (not (= (select (arr!17871 a!2986) j!136) lt!275765))))))

(assert (=> b!604595 e!345950))

(declare-fun res!388491 () Bool)

(assert (=> b!604595 (=> (not res!388491) (not e!345950))))

(assert (=> b!604595 (= res!388491 (= lt!275765 (select (arr!17871 a!2986) j!136)))))

(assert (=> b!604595 (= lt!275765 (select (store (arr!17871 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604596 () Bool)

(declare-fun res!388496 () Bool)

(assert (=> b!604596 (=> (not res!388496) (not e!345951))))

(assert (=> b!604596 (= res!388496 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17871 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604597 () Bool)

(assert (=> b!604597 (= e!345959 (not e!345952))))

(declare-fun res!388485 () Bool)

(assert (=> b!604597 (=> res!388485 e!345952)))

(declare-fun lt!275766 () SeekEntryResult!6311)

(assert (=> b!604597 (= res!388485 (not (= lt!275766 (Found!6311 index!984))))))

(declare-fun lt!275771 () Unit!19246)

(assert (=> b!604597 (= lt!275771 e!345957)))

(declare-fun c!68420 () Bool)

(assert (=> b!604597 (= c!68420 (= lt!275766 Undefined!6311))))

(assert (=> b!604597 (= lt!275766 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275767 lt!275762 mask!3053))))

(assert (=> b!604597 e!345949))

(declare-fun res!388490 () Bool)

(assert (=> b!604597 (=> (not res!388490) (not e!345949))))

(declare-fun lt!275769 () (_ BitVec 32))

(assert (=> b!604597 (= res!388490 (= lt!275768 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 lt!275767 lt!275762 mask!3053)))))

(assert (=> b!604597 (= lt!275768 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604597 (= lt!275767 (select (store (arr!17871 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275761 () Unit!19246)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19246)

(assert (=> b!604597 (= lt!275761 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604597 (= lt!275769 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604598 () Bool)

(declare-fun res!388495 () Bool)

(assert (=> b!604598 (=> (not res!388495) (not e!345947))))

(assert (=> b!604598 (= res!388495 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604599 () Bool)

(declare-fun Unit!19250 () Unit!19246)

(assert (=> b!604599 (= e!345953 Unit!19250)))

(declare-fun lt!275760 () Unit!19246)

(assert (=> b!604599 (= lt!275760 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275762 (select (arr!17871 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604599 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275773 () Unit!19246)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11912) Unit!19246)

(assert (=> b!604599 (= lt!275773 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11909))))

(assert (=> b!604599 (arrayNoDuplicates!0 lt!275762 #b00000000000000000000000000000000 Nil!11909)))

(declare-fun lt!275763 () Unit!19246)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37229 (_ BitVec 32) (_ BitVec 32)) Unit!19246)

(assert (=> b!604599 (= lt!275763 (lemmaNoDuplicateFromThenFromBigger!0 lt!275762 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604599 (arrayNoDuplicates!0 lt!275762 j!136 Nil!11909)))

(declare-fun lt!275764 () Unit!19246)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37229 (_ BitVec 64) (_ BitVec 32) List!11912) Unit!19246)

(assert (=> b!604599 (= lt!275764 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136 Nil!11909))))

(assert (=> b!604599 false))

(declare-fun res!388486 () Bool)

(assert (=> start!55156 (=> (not res!388486) (not e!345947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55156 (= res!388486 (validMask!0 mask!3053))))

(assert (=> start!55156 e!345947))

(assert (=> start!55156 true))

(declare-fun array_inv!13667 (array!37229) Bool)

(assert (=> start!55156 (array_inv!13667 a!2986)))

(declare-fun b!604600 () Bool)

(declare-fun Unit!19251 () Unit!19246)

(assert (=> b!604600 (= e!345957 Unit!19251)))

(assert (=> b!604600 false))

(declare-fun b!604601 () Bool)

(assert (=> b!604601 (= e!345960 e!345946)))

(declare-fun res!388482 () Bool)

(assert (=> b!604601 (=> res!388482 e!345946)))

(assert (=> b!604601 (= res!388482 (bvsge index!984 j!136))))

(declare-fun lt!275758 () Unit!19246)

(assert (=> b!604601 (= lt!275758 e!345953)))

(declare-fun c!68419 () Bool)

(assert (=> b!604601 (= c!68419 (bvslt j!136 index!984))))

(declare-fun b!604602 () Bool)

(declare-fun res!388484 () Bool)

(assert (=> b!604602 (=> (not res!388484) (not e!345951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37229 (_ BitVec 32)) Bool)

(assert (=> b!604602 (= res!388484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604603 () Bool)

(assert (=> b!604603 (= e!345951 e!345958)))

(declare-fun res!388494 () Bool)

(assert (=> b!604603 (=> (not res!388494) (not e!345958))))

(assert (=> b!604603 (= res!388494 (= (select (store (arr!17871 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604603 (= lt!275762 (array!37230 (store (arr!17871 a!2986) i!1108 k!1786) (size!18235 a!2986)))))

(declare-fun b!604604 () Bool)

(assert (=> b!604604 (= e!345956 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) index!984))))

(assert (= (and start!55156 res!388486) b!604582))

(assert (= (and b!604582 res!388493) b!604585))

(assert (= (and b!604585 res!388492) b!604590))

(assert (= (and b!604590 res!388478) b!604598))

(assert (= (and b!604598 res!388495) b!604583))

(assert (= (and b!604583 res!388489) b!604602))

(assert (= (and b!604602 res!388484) b!604593))

(assert (= (and b!604593 res!388488) b!604596))

(assert (= (and b!604596 res!388496) b!604603))

(assert (= (and b!604603 res!388494) b!604588))

(assert (= (and b!604588 res!388480) b!604597))

(assert (= (and b!604597 res!388490) b!604586))

(assert (= (and b!604597 c!68420) b!604600))

(assert (= (and b!604597 (not c!68420)) b!604594))

(assert (= (and b!604597 (not res!388485)) b!604595))

(assert (= (and b!604595 res!388491) b!604587))

(assert (= (and b!604587 (not res!388481)) b!604589))

(assert (= (and b!604589 res!388487) b!604591))

(assert (= (and b!604595 (not res!388483)) b!604601))

(assert (= (and b!604601 c!68419) b!604599))

(assert (= (and b!604601 (not c!68419)) b!604592))

(assert (= (and b!604601 (not res!388482)) b!604584))

(assert (= (and b!604584 res!388479) b!604604))

(declare-fun m!581477 () Bool)

(assert (=> b!604590 m!581477))

(declare-fun m!581479 () Bool)

(assert (=> b!604595 m!581479))

(declare-fun m!581481 () Bool)

(assert (=> b!604595 m!581481))

(declare-fun m!581483 () Bool)

(assert (=> b!604595 m!581483))

(assert (=> b!604584 m!581479))

(assert (=> b!604584 m!581479))

(declare-fun m!581485 () Bool)

(assert (=> b!604584 m!581485))

(assert (=> b!604584 m!581479))

(declare-fun m!581487 () Bool)

(assert (=> b!604584 m!581487))

(assert (=> b!604584 m!581479))

(declare-fun m!581489 () Bool)

(assert (=> b!604584 m!581489))

(declare-fun m!581491 () Bool)

(assert (=> b!604583 m!581491))

(assert (=> b!604591 m!581479))

(assert (=> b!604591 m!581479))

(declare-fun m!581493 () Bool)

(assert (=> b!604591 m!581493))

(assert (=> b!604603 m!581481))

(declare-fun m!581495 () Bool)

(assert (=> b!604603 m!581495))

(assert (=> b!604604 m!581479))

(assert (=> b!604604 m!581479))

(assert (=> b!604604 m!581493))

(assert (=> b!604585 m!581479))

(assert (=> b!604585 m!581479))

(declare-fun m!581497 () Bool)

(assert (=> b!604585 m!581497))

(assert (=> b!604589 m!581479))

(assert (=> b!604589 m!581479))

(assert (=> b!604589 m!581489))

(declare-fun m!581499 () Bool)

(assert (=> b!604598 m!581499))

(declare-fun m!581501 () Bool)

(assert (=> start!55156 m!581501))

(declare-fun m!581503 () Bool)

(assert (=> start!55156 m!581503))

(declare-fun m!581505 () Bool)

(assert (=> b!604596 m!581505))

(declare-fun m!581507 () Bool)

(assert (=> b!604597 m!581507))

(assert (=> b!604597 m!581479))

(assert (=> b!604597 m!581481))

(declare-fun m!581509 () Bool)

(assert (=> b!604597 m!581509))

(assert (=> b!604597 m!581479))

(declare-fun m!581511 () Bool)

(assert (=> b!604597 m!581511))

(declare-fun m!581513 () Bool)

(assert (=> b!604597 m!581513))

(declare-fun m!581515 () Bool)

(assert (=> b!604597 m!581515))

(declare-fun m!581517 () Bool)

(assert (=> b!604597 m!581517))

(declare-fun m!581519 () Bool)

(assert (=> b!604602 m!581519))

(declare-fun m!581521 () Bool)

(assert (=> b!604593 m!581521))

(declare-fun m!581523 () Bool)

(assert (=> b!604588 m!581523))

(assert (=> b!604588 m!581479))

(assert (=> b!604588 m!581479))

(declare-fun m!581525 () Bool)

(assert (=> b!604588 m!581525))

(assert (=> b!604587 m!581479))

(assert (=> b!604599 m!581479))

(declare-fun m!581527 () Bool)

(assert (=> b!604599 m!581527))

(assert (=> b!604599 m!581479))

(declare-fun m!581529 () Bool)

(assert (=> b!604599 m!581529))

(assert (=> b!604599 m!581479))

(declare-fun m!581531 () Bool)

(assert (=> b!604599 m!581531))

(assert (=> b!604599 m!581479))

(declare-fun m!581533 () Bool)

(assert (=> b!604599 m!581533))

(declare-fun m!581535 () Bool)

(assert (=> b!604599 m!581535))

(declare-fun m!581537 () Bool)

(assert (=> b!604599 m!581537))

(declare-fun m!581539 () Bool)

(assert (=> b!604599 m!581539))

(push 1)

(assert (not b!604585))

(assert (not b!604590))

(assert (not b!604597))

(assert (not b!604593))

(assert (not b!604604))

(assert (not b!604588))

(assert (not b!604583))

(assert (not b!604598))

(assert (not b!604599))

(assert (not b!604589))

(assert (not b!604591))

(assert (not b!604602))

(assert (not start!55156))

(assert (not b!604584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87467 () Bool)

(assert (=> d!87467 (= (validKeyInArray!0 (select (arr!17871 a!2986) j!136)) (and (not (= (select (arr!17871 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17871 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604585 d!87467))

(declare-fun b!604870 () Bool)

(declare-fun e!346139 () SeekEntryResult!6311)

(assert (=> b!604870 (= e!346139 (Found!6311 index!984))))

(declare-fun e!346140 () SeekEntryResult!6311)

(declare-fun b!604871 () Bool)

(assert (=> b!604871 (= e!346140 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!275767 lt!275762 mask!3053))))

(declare-fun b!604873 () Bool)

(assert (=> b!604873 (= e!346140 (MissingVacant!6311 vacantSpotIndex!68))))

(declare-fun b!604872 () Bool)

(declare-fun c!68475 () Bool)

(declare-fun lt!275914 () (_ BitVec 64))

(assert (=> b!604872 (= c!68475 (= lt!275914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604872 (= e!346139 e!346140)))

(declare-fun d!87469 () Bool)

(declare-fun lt!275915 () SeekEntryResult!6311)

(assert (=> d!87469 (and (or (is-Undefined!6311 lt!275915) (not (is-Found!6311 lt!275915)) (and (bvsge (index!27508 lt!275915) #b00000000000000000000000000000000) (bvslt (index!27508 lt!275915) (size!18235 lt!275762)))) (or (is-Undefined!6311 lt!275915) (is-Found!6311 lt!275915) (not (is-MissingVacant!6311 lt!275915)) (not (= (index!27510 lt!275915) vacantSpotIndex!68)) (and (bvsge (index!27510 lt!275915) #b00000000000000000000000000000000) (bvslt (index!27510 lt!275915) (size!18235 lt!275762)))) (or (is-Undefined!6311 lt!275915) (ite (is-Found!6311 lt!275915) (= (select (arr!17871 lt!275762) (index!27508 lt!275915)) lt!275767) (and (is-MissingVacant!6311 lt!275915) (= (index!27510 lt!275915) vacantSpotIndex!68) (= (select (arr!17871 lt!275762) (index!27510 lt!275915)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346138 () SeekEntryResult!6311)

(assert (=> d!87469 (= lt!275915 e!346138)))

(declare-fun c!68474 () Bool)

(assert (=> d!87469 (= c!68474 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87469 (= lt!275914 (select (arr!17871 lt!275762) index!984))))

(assert (=> d!87469 (validMask!0 mask!3053)))

(assert (=> d!87469 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275767 lt!275762 mask!3053) lt!275915)))

(declare-fun b!604874 () Bool)

(assert (=> b!604874 (= e!346138 Undefined!6311)))

(declare-fun b!604875 () Bool)

(assert (=> b!604875 (= e!346138 e!346139)))

(declare-fun c!68473 () Bool)

(assert (=> b!604875 (= c!68473 (= lt!275914 lt!275767))))

(assert (= (and d!87469 c!68474) b!604874))

(assert (= (and d!87469 (not c!68474)) b!604875))

(assert (= (and b!604875 c!68473) b!604870))

(assert (= (and b!604875 (not c!68473)) b!604872))

(assert (= (and b!604872 c!68475) b!604873))

(assert (= (and b!604872 (not c!68475)) b!604871))

(assert (=> b!604871 m!581507))

(assert (=> b!604871 m!581507))

(declare-fun m!581777 () Bool)

(assert (=> b!604871 m!581777))

(declare-fun m!581779 () Bool)

(assert (=> d!87469 m!581779))

(declare-fun m!581781 () Bool)

(assert (=> d!87469 m!581781))

(declare-fun m!581783 () Bool)

(assert (=> d!87469 m!581783))

(assert (=> d!87469 m!581501))

(assert (=> b!604597 d!87469))

(declare-fun d!87493 () Bool)

(declare-fun e!346166 () Bool)

(assert (=> d!87493 e!346166))

(declare-fun res!388678 () Bool)

(assert (=> d!87493 (=> (not res!388678) (not e!346166))))

(assert (=> d!87493 (= res!388678 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18235 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18235 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18235 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986))))))

(declare-fun lt!275932 () Unit!19246)

(declare-fun choose!9 (array!37229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19246)

(assert (=> d!87493 (= lt!275932 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87493 (validMask!0 mask!3053)))

(assert (=> d!87493 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 mask!3053) lt!275932)))

(declare-fun b!604906 () Bool)

(assert (=> b!604906 (= e!346166 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 (select (store (arr!17871 a!2986) i!1108 k!1786) j!136) (array!37230 (store (arr!17871 a!2986) i!1108 k!1786) (size!18235 a!2986)) mask!3053)))))

(assert (= (and d!87493 res!388678) b!604906))

(declare-fun m!581817 () Bool)

(assert (=> d!87493 m!581817))

(assert (=> d!87493 m!581501))

(assert (=> b!604906 m!581515))

(assert (=> b!604906 m!581515))

(declare-fun m!581819 () Bool)

(assert (=> b!604906 m!581819))

(assert (=> b!604906 m!581481))

(assert (=> b!604906 m!581479))

(assert (=> b!604906 m!581511))

(assert (=> b!604906 m!581479))

(assert (=> b!604597 d!87493))

(declare-fun b!604907 () Bool)

(declare-fun e!346168 () SeekEntryResult!6311)

(assert (=> b!604907 (= e!346168 (Found!6311 lt!275769))))

(declare-fun b!604908 () Bool)

(declare-fun e!346169 () SeekEntryResult!6311)

(assert (=> b!604908 (= e!346169 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275769 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!275767 lt!275762 mask!3053))))

(declare-fun b!604910 () Bool)

(assert (=> b!604910 (= e!346169 (MissingVacant!6311 vacantSpotIndex!68))))

(declare-fun b!604909 () Bool)

(declare-fun c!68483 () Bool)

(declare-fun lt!275933 () (_ BitVec 64))

(assert (=> b!604909 (= c!68483 (= lt!275933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604909 (= e!346168 e!346169)))

(declare-fun lt!275934 () SeekEntryResult!6311)

(declare-fun d!87511 () Bool)

(assert (=> d!87511 (and (or (is-Undefined!6311 lt!275934) (not (is-Found!6311 lt!275934)) (and (bvsge (index!27508 lt!275934) #b00000000000000000000000000000000) (bvslt (index!27508 lt!275934) (size!18235 lt!275762)))) (or (is-Undefined!6311 lt!275934) (is-Found!6311 lt!275934) (not (is-MissingVacant!6311 lt!275934)) (not (= (index!27510 lt!275934) vacantSpotIndex!68)) (and (bvsge (index!27510 lt!275934) #b00000000000000000000000000000000) (bvslt (index!27510 lt!275934) (size!18235 lt!275762)))) (or (is-Undefined!6311 lt!275934) (ite (is-Found!6311 lt!275934) (= (select (arr!17871 lt!275762) (index!27508 lt!275934)) lt!275767) (and (is-MissingVacant!6311 lt!275934) (= (index!27510 lt!275934) vacantSpotIndex!68) (= (select (arr!17871 lt!275762) (index!27510 lt!275934)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346167 () SeekEntryResult!6311)

(assert (=> d!87511 (= lt!275934 e!346167)))

(declare-fun c!68482 () Bool)

(assert (=> d!87511 (= c!68482 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87511 (= lt!275933 (select (arr!17871 lt!275762) lt!275769))))

(assert (=> d!87511 (validMask!0 mask!3053)))

(assert (=> d!87511 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 lt!275767 lt!275762 mask!3053) lt!275934)))

(declare-fun b!604911 () Bool)

(assert (=> b!604911 (= e!346167 Undefined!6311)))

(declare-fun b!604912 () Bool)

(assert (=> b!604912 (= e!346167 e!346168)))

(declare-fun c!68481 () Bool)

(assert (=> b!604912 (= c!68481 (= lt!275933 lt!275767))))

(assert (= (and d!87511 c!68482) b!604911))

(assert (= (and d!87511 (not c!68482)) b!604912))

(assert (= (and b!604912 c!68481) b!604907))

(assert (= (and b!604912 (not c!68481)) b!604909))

(assert (= (and b!604909 c!68483) b!604910))

(assert (= (and b!604909 (not c!68483)) b!604908))

(declare-fun m!581825 () Bool)

(assert (=> b!604908 m!581825))

(assert (=> b!604908 m!581825))

(declare-fun m!581827 () Bool)

(assert (=> b!604908 m!581827))

(declare-fun m!581829 () Bool)

(assert (=> d!87511 m!581829))

(declare-fun m!581831 () Bool)

(assert (=> d!87511 m!581831))

(declare-fun m!581833 () Bool)

(assert (=> d!87511 m!581833))

(assert (=> d!87511 m!581501))

(assert (=> b!604597 d!87511))

(declare-fun d!87515 () Bool)

(declare-fun lt!275940 () (_ BitVec 32))

(assert (=> d!87515 (and (bvsge lt!275940 #b00000000000000000000000000000000) (bvslt lt!275940 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87515 (= lt!275940 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87515 (validMask!0 mask!3053)))

(assert (=> d!87515 (= (nextIndex!0 index!984 x!910 mask!3053) lt!275940)))

(declare-fun bs!18505 () Bool)

(assert (= bs!18505 d!87515))

(declare-fun m!581835 () Bool)

(assert (=> bs!18505 m!581835))

(assert (=> bs!18505 m!581501))

(assert (=> b!604597 d!87515))

(declare-fun b!604914 () Bool)

(declare-fun e!346172 () SeekEntryResult!6311)

(assert (=> b!604914 (= e!346172 (Found!6311 lt!275769))))

(declare-fun e!346173 () SeekEntryResult!6311)

(declare-fun b!604915 () Bool)

(assert (=> b!604915 (= e!346173 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275769 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604917 () Bool)

(assert (=> b!604917 (= e!346173 (MissingVacant!6311 vacantSpotIndex!68))))

(declare-fun b!604916 () Bool)

(declare-fun c!68486 () Bool)

(declare-fun lt!275941 () (_ BitVec 64))

(assert (=> b!604916 (= c!68486 (= lt!275941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604916 (= e!346172 e!346173)))

(declare-fun d!87517 () Bool)

(declare-fun lt!275942 () SeekEntryResult!6311)

(assert (=> d!87517 (and (or (is-Undefined!6311 lt!275942) (not (is-Found!6311 lt!275942)) (and (bvsge (index!27508 lt!275942) #b00000000000000000000000000000000) (bvslt (index!27508 lt!275942) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!275942) (is-Found!6311 lt!275942) (not (is-MissingVacant!6311 lt!275942)) (not (= (index!27510 lt!275942) vacantSpotIndex!68)) (and (bvsge (index!27510 lt!275942) #b00000000000000000000000000000000) (bvslt (index!27510 lt!275942) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!275942) (ite (is-Found!6311 lt!275942) (= (select (arr!17871 a!2986) (index!27508 lt!275942)) (select (arr!17871 a!2986) j!136)) (and (is-MissingVacant!6311 lt!275942) (= (index!27510 lt!275942) vacantSpotIndex!68) (= (select (arr!17871 a!2986) (index!27510 lt!275942)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346171 () SeekEntryResult!6311)

(assert (=> d!87517 (= lt!275942 e!346171)))

(declare-fun c!68485 () Bool)

(assert (=> d!87517 (= c!68485 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87517 (= lt!275941 (select (arr!17871 a!2986) lt!275769))))

(assert (=> d!87517 (validMask!0 mask!3053)))

(assert (=> d!87517 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275769 vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053) lt!275942)))

(declare-fun b!604918 () Bool)

(assert (=> b!604918 (= e!346171 Undefined!6311)))

(declare-fun b!604919 () Bool)

(assert (=> b!604919 (= e!346171 e!346172)))

(declare-fun c!68484 () Bool)

(assert (=> b!604919 (= c!68484 (= lt!275941 (select (arr!17871 a!2986) j!136)))))

(assert (= (and d!87517 c!68485) b!604918))

(assert (= (and d!87517 (not c!68485)) b!604919))

(assert (= (and b!604919 c!68484) b!604914))

(assert (= (and b!604919 (not c!68484)) b!604916))

(assert (= (and b!604916 c!68486) b!604917))

(assert (= (and b!604916 (not c!68486)) b!604915))

(assert (=> b!604915 m!581825))

(assert (=> b!604915 m!581825))

(assert (=> b!604915 m!581479))

(declare-fun m!581839 () Bool)

(assert (=> b!604915 m!581839))

(declare-fun m!581841 () Bool)

(assert (=> d!87517 m!581841))

(declare-fun m!581843 () Bool)

(assert (=> d!87517 m!581843))

(declare-fun m!581845 () Bool)

(assert (=> d!87517 m!581845))

(assert (=> d!87517 m!581501))

(assert (=> b!604597 d!87517))

(declare-fun b!604942 () Bool)

(declare-fun e!346188 () Bool)

(declare-fun e!346191 () Bool)

(assert (=> b!604942 (= e!346188 e!346191)))

(declare-fun c!68495 () Bool)

(assert (=> b!604942 (= c!68495 (validKeyInArray!0 (select (arr!17871 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33026 () Bool)

(declare-fun call!33029 () Bool)

(assert (=> bm!33026 (= call!33029 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68495 (Cons!11908 (select (arr!17871 a!2986) #b00000000000000000000000000000000) Nil!11909) Nil!11909)))))

(declare-fun b!604944 () Bool)

(assert (=> b!604944 (= e!346191 call!33029)))

(declare-fun b!604945 () Bool)

(declare-fun e!346189 () Bool)

(assert (=> b!604945 (= e!346189 e!346188)))

(declare-fun res!388686 () Bool)

(assert (=> b!604945 (=> (not res!388686) (not e!346188))))

(declare-fun e!346190 () Bool)

(assert (=> b!604945 (= res!388686 (not e!346190))))

(declare-fun res!388687 () Bool)

(assert (=> b!604945 (=> (not res!388687) (not e!346190))))

(assert (=> b!604945 (= res!388687 (validKeyInArray!0 (select (arr!17871 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604946 () Bool)

(assert (=> b!604946 (= e!346191 call!33029)))

(declare-fun b!604943 () Bool)

(declare-fun contains!2993 (List!11912 (_ BitVec 64)) Bool)

(assert (=> b!604943 (= e!346190 (contains!2993 Nil!11909 (select (arr!17871 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87521 () Bool)

(declare-fun res!388688 () Bool)

(assert (=> d!87521 (=> res!388688 e!346189)))

(assert (=> d!87521 (= res!388688 (bvsge #b00000000000000000000000000000000 (size!18235 a!2986)))))

(assert (=> d!87521 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11909) e!346189)))

(assert (= (and d!87521 (not res!388688)) b!604945))

(assert (= (and b!604945 res!388687) b!604943))

(assert (= (and b!604945 res!388686) b!604942))

(assert (= (and b!604942 c!68495) b!604946))

(assert (= (and b!604942 (not c!68495)) b!604944))

(assert (= (or b!604946 b!604944) bm!33026))

(declare-fun m!581849 () Bool)

(assert (=> b!604942 m!581849))

(assert (=> b!604942 m!581849))

(declare-fun m!581851 () Bool)

(assert (=> b!604942 m!581851))

(assert (=> bm!33026 m!581849))

(declare-fun m!581853 () Bool)

(assert (=> bm!33026 m!581853))

(assert (=> b!604945 m!581849))

(assert (=> b!604945 m!581849))

(assert (=> b!604945 m!581851))

(assert (=> b!604943 m!581849))

(assert (=> b!604943 m!581849))

(declare-fun m!581855 () Bool)

(assert (=> b!604943 m!581855))

(assert (=> b!604593 d!87521))

(declare-fun d!87525 () Bool)

(declare-fun res!388693 () Bool)

(declare-fun e!346199 () Bool)

(assert (=> d!87525 (=> res!388693 e!346199)))

(assert (=> d!87525 (= res!388693 (= (select (arr!17871 lt!275762) index!984) (select (arr!17871 a!2986) j!136)))))

(assert (=> d!87525 (= (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) index!984) e!346199)))

(declare-fun b!604957 () Bool)

(declare-fun e!346200 () Bool)

(assert (=> b!604957 (= e!346199 e!346200)))

(declare-fun res!388694 () Bool)

(assert (=> b!604957 (=> (not res!388694) (not e!346200))))

(assert (=> b!604957 (= res!388694 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18235 lt!275762)))))

(declare-fun b!604958 () Bool)

(assert (=> b!604958 (= e!346200 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87525 (not res!388693)) b!604957))

(assert (= (and b!604957 res!388694) b!604958))

(assert (=> d!87525 m!581783))

(assert (=> b!604958 m!581479))

(declare-fun m!581871 () Bool)

(assert (=> b!604958 m!581871))

(assert (=> b!604604 d!87525))

(declare-fun d!87531 () Bool)

(assert (=> d!87531 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55156 d!87531))

(declare-fun d!87543 () Bool)

(assert (=> d!87543 (= (array_inv!13667 a!2986) (bvsge (size!18235 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55156 d!87543))

(declare-fun d!87545 () Bool)

(declare-fun res!388699 () Bool)

(declare-fun e!346205 () Bool)

(assert (=> d!87545 (=> res!388699 e!346205)))

(assert (=> d!87545 (= res!388699 (= (select (arr!17871 lt!275762) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17871 a!2986) j!136)))))

(assert (=> d!87545 (= (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346205)))

(declare-fun b!604963 () Bool)

(declare-fun e!346206 () Bool)

(assert (=> b!604963 (= e!346205 e!346206)))

(declare-fun res!388700 () Bool)

(assert (=> b!604963 (=> (not res!388700) (not e!346206))))

(assert (=> b!604963 (= res!388700 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18235 lt!275762)))))

(declare-fun b!604964 () Bool)

(assert (=> b!604964 (= e!346206 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87545 (not res!388699)) b!604963))

(assert (= (and b!604963 res!388700) b!604964))

(declare-fun m!581883 () Bool)

(assert (=> d!87545 m!581883))

(assert (=> b!604964 m!581479))

(declare-fun m!581885 () Bool)

(assert (=> b!604964 m!581885))

(assert (=> b!604584 d!87545))

(declare-fun d!87547 () Bool)

(assert (=> d!87547 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275966 () Unit!19246)

(declare-fun choose!114 (array!37229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19246)

(assert (=> d!87547 (= lt!275966 (choose!114 lt!275762 (select (arr!17871 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87547 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87547 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!275966)))

(declare-fun bs!18510 () Bool)

(assert (= bs!18510 d!87547))

(assert (=> bs!18510 m!581479))

(assert (=> bs!18510 m!581485))

(assert (=> bs!18510 m!581479))

(declare-fun m!581887 () Bool)

(assert (=> bs!18510 m!581887))

(assert (=> b!604584 d!87547))

(declare-fun d!87549 () Bool)

(declare-fun res!388701 () Bool)

(declare-fun e!346213 () Bool)

(assert (=> d!87549 (=> res!388701 e!346213)))

(assert (=> d!87549 (= res!388701 (= (select (arr!17871 lt!275762) j!136) (select (arr!17871 a!2986) j!136)))))

(assert (=> d!87549 (= (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) j!136) e!346213)))

(declare-fun b!604977 () Bool)

(declare-fun e!346214 () Bool)

(assert (=> b!604977 (= e!346213 e!346214)))

(declare-fun res!388702 () Bool)

(assert (=> b!604977 (=> (not res!388702) (not e!346214))))

(assert (=> b!604977 (= res!388702 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18235 lt!275762)))))

(declare-fun b!604978 () Bool)

(assert (=> b!604978 (= e!346214 (arrayContainsKey!0 lt!275762 (select (arr!17871 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87549 (not res!388701)) b!604977))

(assert (= (and b!604977 res!388702) b!604978))

(declare-fun m!581889 () Bool)

(assert (=> d!87549 m!581889))

(assert (=> b!604978 m!581479))

(declare-fun m!581891 () Bool)

(assert (=> b!604978 m!581891))

(assert (=> b!604584 d!87549))

(declare-fun d!87551 () Bool)

(declare-fun lt!275983 () SeekEntryResult!6311)

(assert (=> d!87551 (and (or (is-Undefined!6311 lt!275983) (not (is-Found!6311 lt!275983)) (and (bvsge (index!27508 lt!275983) #b00000000000000000000000000000000) (bvslt (index!27508 lt!275983) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!275983) (is-Found!6311 lt!275983) (not (is-MissingZero!6311 lt!275983)) (and (bvsge (index!27507 lt!275983) #b00000000000000000000000000000000) (bvslt (index!27507 lt!275983) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!275983) (is-Found!6311 lt!275983) (is-MissingZero!6311 lt!275983) (not (is-MissingVacant!6311 lt!275983)) (and (bvsge (index!27510 lt!275983) #b00000000000000000000000000000000) (bvslt (index!27510 lt!275983) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!275983) (ite (is-Found!6311 lt!275983) (= (select (arr!17871 a!2986) (index!27508 lt!275983)) k!1786) (ite (is-MissingZero!6311 lt!275983) (= (select (arr!17871 a!2986) (index!27507 lt!275983)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6311 lt!275983) (= (select (arr!17871 a!2986) (index!27510 lt!275983)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!346235 () SeekEntryResult!6311)

(assert (=> d!87551 (= lt!275983 e!346235)))

(declare-fun c!68522 () Bool)

(declare-fun lt!275984 () SeekEntryResult!6311)

(assert (=> d!87551 (= c!68522 (and (is-Intermediate!6311 lt!275984) (undefined!7123 lt!275984)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37229 (_ BitVec 32)) SeekEntryResult!6311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87551 (= lt!275984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87551 (validMask!0 mask!3053)))

(assert (=> d!87551 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!275983)))

(declare-fun b!605012 () Bool)

(declare-fun e!346234 () SeekEntryResult!6311)

(assert (=> b!605012 (= e!346235 e!346234)))

(declare-fun lt!275982 () (_ BitVec 64))

(assert (=> b!605012 (= lt!275982 (select (arr!17871 a!2986) (index!27509 lt!275984)))))

(declare-fun c!68520 () Bool)

(assert (=> b!605012 (= c!68520 (= lt!275982 k!1786))))

(declare-fun b!605013 () Bool)

(assert (=> b!605013 (= e!346234 (Found!6311 (index!27509 lt!275984)))))

(declare-fun e!346233 () SeekEntryResult!6311)

(declare-fun b!605014 () Bool)

(assert (=> b!605014 (= e!346233 (seekKeyOrZeroReturnVacant!0 (x!56304 lt!275984) (index!27509 lt!275984) (index!27509 lt!275984) k!1786 a!2986 mask!3053))))

(declare-fun b!605015 () Bool)

(declare-fun c!68521 () Bool)

(assert (=> b!605015 (= c!68521 (= lt!275982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605015 (= e!346234 e!346233)))

(declare-fun b!605016 () Bool)

(assert (=> b!605016 (= e!346233 (MissingZero!6311 (index!27509 lt!275984)))))

(declare-fun b!605017 () Bool)

(assert (=> b!605017 (= e!346235 Undefined!6311)))

(assert (= (and d!87551 c!68522) b!605017))

(assert (= (and d!87551 (not c!68522)) b!605012))

(assert (= (and b!605012 c!68520) b!605013))

(assert (= (and b!605012 (not c!68520)) b!605015))

(assert (= (and b!605015 c!68521) b!605016))

(assert (= (and b!605015 (not c!68521)) b!605014))

(declare-fun m!581921 () Bool)

(assert (=> d!87551 m!581921))

(declare-fun m!581923 () Bool)

(assert (=> d!87551 m!581923))

(assert (=> d!87551 m!581921))

(assert (=> d!87551 m!581501))

(declare-fun m!581925 () Bool)

(assert (=> d!87551 m!581925))

(declare-fun m!581927 () Bool)

(assert (=> d!87551 m!581927))

(declare-fun m!581929 () Bool)

(assert (=> d!87551 m!581929))

(declare-fun m!581931 () Bool)

(assert (=> b!605012 m!581931))

(declare-fun m!581933 () Bool)

(assert (=> b!605014 m!581933))

(assert (=> b!604583 d!87551))

(declare-fun d!87561 () Bool)

(assert (=> d!87561 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604590 d!87561))

(assert (=> b!604591 d!87525))

(declare-fun b!605044 () Bool)

(declare-fun e!346257 () Bool)

(declare-fun call!33036 () Bool)

(assert (=> b!605044 (= e!346257 call!33036)))

(declare-fun bm!33033 () Bool)

(assert (=> bm!33033 (= call!33036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!605045 () Bool)

(declare-fun e!346255 () Bool)

(declare-fun e!346256 () Bool)

(assert (=> b!605045 (= e!346255 e!346256)))

(declare-fun c!68529 () Bool)

(assert (=> b!605045 (= c!68529 (validKeyInArray!0 (select (arr!17871 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605046 () Bool)

(assert (=> b!605046 (= e!346256 call!33036)))

(declare-fun b!605043 () Bool)

(assert (=> b!605043 (= e!346256 e!346257)))

(declare-fun lt!276001 () (_ BitVec 64))

(assert (=> b!605043 (= lt!276001 (select (arr!17871 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276000 () Unit!19246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37229 (_ BitVec 64) (_ BitVec 32)) Unit!19246)

(assert (=> b!605043 (= lt!276000 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276001 #b00000000000000000000000000000000))))

(assert (=> b!605043 (arrayContainsKey!0 a!2986 lt!276001 #b00000000000000000000000000000000)))

(declare-fun lt!276002 () Unit!19246)

(assert (=> b!605043 (= lt!276002 lt!276000)))

(declare-fun res!388719 () Bool)

(assert (=> b!605043 (= res!388719 (= (seekEntryOrOpen!0 (select (arr!17871 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6311 #b00000000000000000000000000000000)))))

(assert (=> b!605043 (=> (not res!388719) (not e!346257))))

(declare-fun d!87563 () Bool)

(declare-fun res!388720 () Bool)

(assert (=> d!87563 (=> res!388720 e!346255)))

(assert (=> d!87563 (= res!388720 (bvsge #b00000000000000000000000000000000 (size!18235 a!2986)))))

(assert (=> d!87563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346255)))

(assert (= (and d!87563 (not res!388720)) b!605045))

(assert (= (and b!605045 c!68529) b!605043))

(assert (= (and b!605045 (not c!68529)) b!605046))

(assert (= (and b!605043 res!388719) b!605044))

(assert (= (or b!605044 b!605046) bm!33033))

(declare-fun m!581949 () Bool)

(assert (=> bm!33033 m!581949))

(assert (=> b!605045 m!581849))

(assert (=> b!605045 m!581849))

(assert (=> b!605045 m!581851))

(assert (=> b!605043 m!581849))

(declare-fun m!581951 () Bool)

(assert (=> b!605043 m!581951))

(declare-fun m!581953 () Bool)

(assert (=> b!605043 m!581953))

(assert (=> b!605043 m!581849))

(declare-fun m!581955 () Bool)

(assert (=> b!605043 m!581955))

(assert (=> b!604602 d!87563))

(declare-fun b!605053 () Bool)

(declare-fun e!346262 () SeekEntryResult!6311)

(assert (=> b!605053 (= e!346262 (Found!6311 index!984))))

(declare-fun b!605054 () Bool)

(declare-fun e!346263 () SeekEntryResult!6311)

(assert (=> b!605054 (= e!346263 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605056 () Bool)

(assert (=> b!605056 (= e!346263 (MissingVacant!6311 vacantSpotIndex!68))))

(declare-fun b!605055 () Bool)

(declare-fun c!68535 () Bool)

(declare-fun lt!276005 () (_ BitVec 64))

(assert (=> b!605055 (= c!68535 (= lt!276005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605055 (= e!346262 e!346263)))

(declare-fun d!87569 () Bool)

(declare-fun lt!276006 () SeekEntryResult!6311)

(assert (=> d!87569 (and (or (is-Undefined!6311 lt!276006) (not (is-Found!6311 lt!276006)) (and (bvsge (index!27508 lt!276006) #b00000000000000000000000000000000) (bvslt (index!27508 lt!276006) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!276006) (is-Found!6311 lt!276006) (not (is-MissingVacant!6311 lt!276006)) (not (= (index!27510 lt!276006) vacantSpotIndex!68)) (and (bvsge (index!27510 lt!276006) #b00000000000000000000000000000000) (bvslt (index!27510 lt!276006) (size!18235 a!2986)))) (or (is-Undefined!6311 lt!276006) (ite (is-Found!6311 lt!276006) (= (select (arr!17871 a!2986) (index!27508 lt!276006)) (select (arr!17871 a!2986) j!136)) (and (is-MissingVacant!6311 lt!276006) (= (index!27510 lt!276006) vacantSpotIndex!68) (= (select (arr!17871 a!2986) (index!27510 lt!276006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346261 () SeekEntryResult!6311)

(assert (=> d!87569 (= lt!276006 e!346261)))

(declare-fun c!68534 () Bool)

(assert (=> d!87569 (= c!68534 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87569 (= lt!276005 (select (arr!17871 a!2986) index!984))))

(assert (=> d!87569 (validMask!0 mask!3053)))

(assert (=> d!87569 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17871 a!2986) j!136) a!2986 mask!3053) lt!276006)))

(declare-fun b!605057 () Bool)

(assert (=> b!605057 (= e!346261 Undefined!6311)))

(declare-fun b!605058 () Bool)

(assert (=> b!605058 (= e!346261 e!346262)))

(declare-fun c!68533 () Bool)

(assert (=> b!605058 (= c!68533 (= lt!276005 (select (arr!17871 a!2986) j!136)))))

(assert (= (and d!87569 c!68534) b!605057))

