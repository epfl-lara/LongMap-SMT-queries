; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57688 () Bool)

(assert start!57688)

(declare-fun b!637465 () Bool)

(declare-datatypes ((Unit!21502 0))(
  ( (Unit!21503) )
))
(declare-fun e!364771 () Unit!21502)

(declare-fun Unit!21504 () Unit!21502)

(assert (=> b!637465 (= e!364771 Unit!21504)))

(declare-fun b!637466 () Bool)

(declare-fun res!412371 () Bool)

(declare-fun e!364769 () Bool)

(assert (=> b!637466 (=> (not res!412371) (not e!364769))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38259 0))(
  ( (array!38260 (arr!18352 (Array (_ BitVec 32) (_ BitVec 64))) (size!18716 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38259)

(assert (=> b!637466 (= res!412371 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18352 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637467 () Bool)

(declare-fun e!364762 () Bool)

(declare-datatypes ((SeekEntryResult!6792 0))(
  ( (MissingZero!6792 (index!29482 (_ BitVec 32))) (Found!6792 (index!29483 (_ BitVec 32))) (Intermediate!6792 (undefined!7604 Bool) (index!29484 (_ BitVec 32)) (x!58242 (_ BitVec 32))) (Undefined!6792) (MissingVacant!6792 (index!29485 (_ BitVec 32))) )
))
(declare-fun lt!294748 () SeekEntryResult!6792)

(declare-fun lt!294744 () SeekEntryResult!6792)

(assert (=> b!637467 (= e!364762 (= lt!294748 lt!294744))))

(declare-fun b!637468 () Bool)

(declare-fun Unit!21505 () Unit!21502)

(assert (=> b!637468 (= e!364771 Unit!21505)))

(assert (=> b!637468 false))

(declare-fun b!637469 () Bool)

(declare-fun res!412389 () Bool)

(assert (=> b!637469 (=> (not res!412389) (not e!364769))))

(declare-datatypes ((List!12393 0))(
  ( (Nil!12390) (Cons!12389 (h!13434 (_ BitVec 64)) (t!18621 List!12393)) )
))
(declare-fun arrayNoDuplicates!0 (array!38259 (_ BitVec 32) List!12393) Bool)

(assert (=> b!637469 (= res!412389 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12390))))

(declare-fun b!637470 () Bool)

(declare-fun e!364766 () Bool)

(assert (=> b!637470 (= e!364769 e!364766)))

(declare-fun res!412391 () Bool)

(assert (=> b!637470 (=> (not res!412391) (not e!364766))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!637470 (= res!412391 (= (select (store (arr!18352 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294747 () array!38259)

(assert (=> b!637470 (= lt!294747 (array!38260 (store (arr!18352 a!2986) i!1108 k0!1786) (size!18716 a!2986)))))

(declare-fun b!637471 () Bool)

(declare-fun e!364770 () Bool)

(declare-fun e!364763 () Bool)

(assert (=> b!637471 (= e!364770 e!364763)))

(declare-fun res!412375 () Bool)

(assert (=> b!637471 (=> res!412375 e!364763)))

(declare-fun lt!294740 () (_ BitVec 64))

(declare-fun lt!294737 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!637471 (= res!412375 (or (not (= (select (arr!18352 a!2986) j!136) lt!294737)) (not (= (select (arr!18352 a!2986) j!136) lt!294740)) (bvsge j!136 index!984)))))

(declare-fun res!412380 () Bool)

(declare-fun e!364773 () Bool)

(assert (=> start!57688 (=> (not res!412380) (not e!364773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57688 (= res!412380 (validMask!0 mask!3053))))

(assert (=> start!57688 e!364773))

(assert (=> start!57688 true))

(declare-fun array_inv!14148 (array!38259) Bool)

(assert (=> start!57688 (array_inv!14148 a!2986)))

(declare-fun b!637472 () Bool)

(declare-fun e!364772 () Bool)

(declare-fun e!364764 () Bool)

(assert (=> b!637472 (= e!364772 e!364764)))

(declare-fun res!412373 () Bool)

(assert (=> b!637472 (=> res!412373 e!364764)))

(assert (=> b!637472 (= res!412373 (or (bvsge (size!18716 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18716 a!2986))))))

(declare-fun arrayContainsKey!0 (array!38259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637472 (arrayContainsKey!0 lt!294747 (select (arr!18352 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294741 () Unit!21502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21502)

(assert (=> b!637472 (= lt!294741 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294747 (select (arr!18352 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637473 () Bool)

(declare-fun e!364768 () Bool)

(declare-fun e!364767 () Bool)

(assert (=> b!637473 (= e!364768 (not e!364767))))

(declare-fun res!412382 () Bool)

(assert (=> b!637473 (=> res!412382 e!364767)))

(declare-fun lt!294742 () SeekEntryResult!6792)

(assert (=> b!637473 (= res!412382 (not (= lt!294742 (Found!6792 index!984))))))

(declare-fun lt!294739 () Unit!21502)

(assert (=> b!637473 (= lt!294739 e!364771)))

(declare-fun c!72914 () Bool)

(assert (=> b!637473 (= c!72914 (= lt!294742 Undefined!6792))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38259 (_ BitVec 32)) SeekEntryResult!6792)

(assert (=> b!637473 (= lt!294742 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294737 lt!294747 mask!3053))))

(assert (=> b!637473 e!364762))

(declare-fun res!412381 () Bool)

(assert (=> b!637473 (=> (not res!412381) (not e!364762))))

(declare-fun lt!294745 () (_ BitVec 32))

(assert (=> b!637473 (= res!412381 (= lt!294744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294745 vacantSpotIndex!68 lt!294737 lt!294747 mask!3053)))))

(assert (=> b!637473 (= lt!294744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294745 vacantSpotIndex!68 (select (arr!18352 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637473 (= lt!294737 (select (store (arr!18352 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294743 () Unit!21502)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21502)

(assert (=> b!637473 (= lt!294743 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294745 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637473 (= lt!294745 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637474 () Bool)

(declare-fun res!412379 () Bool)

(assert (=> b!637474 (=> (not res!412379) (not e!364769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38259 (_ BitVec 32)) Bool)

(assert (=> b!637474 (= res!412379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637475 () Bool)

(declare-fun res!412388 () Bool)

(assert (=> b!637475 (=> (not res!412388) (not e!364773))))

(assert (=> b!637475 (= res!412388 (and (= (size!18716 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18716 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18716 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637476 () Bool)

(declare-fun e!364765 () Bool)

(assert (=> b!637476 (= e!364763 e!364765)))

(declare-fun res!412377 () Bool)

(assert (=> b!637476 (=> (not res!412377) (not e!364765))))

(assert (=> b!637476 (= res!412377 (arrayContainsKey!0 lt!294747 (select (arr!18352 a!2986) j!136) j!136))))

(declare-fun b!637477 () Bool)

(assert (=> b!637477 (= e!364765 (arrayContainsKey!0 lt!294747 (select (arr!18352 a!2986) j!136) index!984))))

(declare-fun b!637478 () Bool)

(assert (=> b!637478 (= e!364764 true)))

(declare-fun lt!294738 () Bool)

(declare-fun contains!3107 (List!12393 (_ BitVec 64)) Bool)

(assert (=> b!637478 (= lt!294738 (contains!3107 Nil!12390 k0!1786))))

(declare-fun b!637479 () Bool)

(declare-fun res!412372 () Bool)

(assert (=> b!637479 (=> (not res!412372) (not e!364773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637479 (= res!412372 (validKeyInArray!0 (select (arr!18352 a!2986) j!136)))))

(declare-fun b!637480 () Bool)

(assert (=> b!637480 (= e!364766 e!364768)))

(declare-fun res!412386 () Bool)

(assert (=> b!637480 (=> (not res!412386) (not e!364768))))

(assert (=> b!637480 (= res!412386 (and (= lt!294748 (Found!6792 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18352 a!2986) index!984) (select (arr!18352 a!2986) j!136))) (not (= (select (arr!18352 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637480 (= lt!294748 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18352 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637481 () Bool)

(declare-fun res!412390 () Bool)

(assert (=> b!637481 (=> res!412390 e!364764)))

(declare-fun noDuplicate!385 (List!12393) Bool)

(assert (=> b!637481 (= res!412390 (not (noDuplicate!385 Nil!12390)))))

(declare-fun b!637482 () Bool)

(declare-fun res!412387 () Bool)

(assert (=> b!637482 (=> (not res!412387) (not e!364773))))

(assert (=> b!637482 (= res!412387 (validKeyInArray!0 k0!1786))))

(declare-fun b!637483 () Bool)

(declare-fun res!412383 () Bool)

(assert (=> b!637483 (=> res!412383 e!364764)))

(assert (=> b!637483 (= res!412383 (contains!3107 Nil!12390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637484 () Bool)

(assert (=> b!637484 (= e!364767 e!364772)))

(declare-fun res!412378 () Bool)

(assert (=> b!637484 (=> res!412378 e!364772)))

(assert (=> b!637484 (= res!412378 (or (not (= (select (arr!18352 a!2986) j!136) lt!294737)) (not (= (select (arr!18352 a!2986) j!136) lt!294740)) (bvsge j!136 index!984)))))

(assert (=> b!637484 e!364770))

(declare-fun res!412374 () Bool)

(assert (=> b!637484 (=> (not res!412374) (not e!364770))))

(assert (=> b!637484 (= res!412374 (= lt!294740 (select (arr!18352 a!2986) j!136)))))

(assert (=> b!637484 (= lt!294740 (select (store (arr!18352 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637485 () Bool)

(declare-fun res!412385 () Bool)

(assert (=> b!637485 (=> (not res!412385) (not e!364773))))

(assert (=> b!637485 (= res!412385 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637486 () Bool)

(declare-fun res!412384 () Bool)

(assert (=> b!637486 (=> res!412384 e!364764)))

(assert (=> b!637486 (= res!412384 (contains!3107 Nil!12390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637487 () Bool)

(assert (=> b!637487 (= e!364773 e!364769)))

(declare-fun res!412376 () Bool)

(assert (=> b!637487 (=> (not res!412376) (not e!364769))))

(declare-fun lt!294746 () SeekEntryResult!6792)

(assert (=> b!637487 (= res!412376 (or (= lt!294746 (MissingZero!6792 i!1108)) (= lt!294746 (MissingVacant!6792 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38259 (_ BitVec 32)) SeekEntryResult!6792)

(assert (=> b!637487 (= lt!294746 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57688 res!412380) b!637475))

(assert (= (and b!637475 res!412388) b!637479))

(assert (= (and b!637479 res!412372) b!637482))

(assert (= (and b!637482 res!412387) b!637485))

(assert (= (and b!637485 res!412385) b!637487))

(assert (= (and b!637487 res!412376) b!637474))

(assert (= (and b!637474 res!412379) b!637469))

(assert (= (and b!637469 res!412389) b!637466))

(assert (= (and b!637466 res!412371) b!637470))

(assert (= (and b!637470 res!412391) b!637480))

(assert (= (and b!637480 res!412386) b!637473))

(assert (= (and b!637473 res!412381) b!637467))

(assert (= (and b!637473 c!72914) b!637468))

(assert (= (and b!637473 (not c!72914)) b!637465))

(assert (= (and b!637473 (not res!412382)) b!637484))

(assert (= (and b!637484 res!412374) b!637471))

(assert (= (and b!637471 (not res!412375)) b!637476))

(assert (= (and b!637476 res!412377) b!637477))

(assert (= (and b!637484 (not res!412378)) b!637472))

(assert (= (and b!637472 (not res!412373)) b!637481))

(assert (= (and b!637481 (not res!412390)) b!637486))

(assert (= (and b!637486 (not res!412384)) b!637483))

(assert (= (and b!637483 (not res!412383)) b!637478))

(declare-fun m!611541 () Bool)

(assert (=> b!637476 m!611541))

(assert (=> b!637476 m!611541))

(declare-fun m!611543 () Bool)

(assert (=> b!637476 m!611543))

(assert (=> b!637472 m!611541))

(assert (=> b!637472 m!611541))

(declare-fun m!611545 () Bool)

(assert (=> b!637472 m!611545))

(assert (=> b!637472 m!611541))

(declare-fun m!611547 () Bool)

(assert (=> b!637472 m!611547))

(declare-fun m!611549 () Bool)

(assert (=> b!637474 m!611549))

(declare-fun m!611551 () Bool)

(assert (=> b!637469 m!611551))

(assert (=> b!637471 m!611541))

(declare-fun m!611553 () Bool)

(assert (=> b!637478 m!611553))

(assert (=> b!637484 m!611541))

(declare-fun m!611555 () Bool)

(assert (=> b!637484 m!611555))

(declare-fun m!611557 () Bool)

(assert (=> b!637484 m!611557))

(declare-fun m!611559 () Bool)

(assert (=> b!637486 m!611559))

(assert (=> b!637477 m!611541))

(assert (=> b!637477 m!611541))

(declare-fun m!611561 () Bool)

(assert (=> b!637477 m!611561))

(declare-fun m!611563 () Bool)

(assert (=> b!637481 m!611563))

(declare-fun m!611565 () Bool)

(assert (=> b!637483 m!611565))

(declare-fun m!611567 () Bool)

(assert (=> b!637485 m!611567))

(declare-fun m!611569 () Bool)

(assert (=> b!637473 m!611569))

(declare-fun m!611571 () Bool)

(assert (=> b!637473 m!611571))

(assert (=> b!637473 m!611541))

(declare-fun m!611573 () Bool)

(assert (=> b!637473 m!611573))

(declare-fun m!611575 () Bool)

(assert (=> b!637473 m!611575))

(declare-fun m!611577 () Bool)

(assert (=> b!637473 m!611577))

(assert (=> b!637473 m!611541))

(declare-fun m!611579 () Bool)

(assert (=> b!637473 m!611579))

(assert (=> b!637473 m!611555))

(assert (=> b!637470 m!611555))

(declare-fun m!611581 () Bool)

(assert (=> b!637470 m!611581))

(declare-fun m!611583 () Bool)

(assert (=> b!637466 m!611583))

(declare-fun m!611585 () Bool)

(assert (=> b!637480 m!611585))

(assert (=> b!637480 m!611541))

(assert (=> b!637480 m!611541))

(declare-fun m!611587 () Bool)

(assert (=> b!637480 m!611587))

(declare-fun m!611589 () Bool)

(assert (=> start!57688 m!611589))

(declare-fun m!611591 () Bool)

(assert (=> start!57688 m!611591))

(assert (=> b!637479 m!611541))

(assert (=> b!637479 m!611541))

(declare-fun m!611593 () Bool)

(assert (=> b!637479 m!611593))

(declare-fun m!611595 () Bool)

(assert (=> b!637482 m!611595))

(declare-fun m!611597 () Bool)

(assert (=> b!637487 m!611597))

(check-sat (not b!637478) (not b!637485) (not start!57688) (not b!637472) (not b!637479) (not b!637480) (not b!637474) (not b!637482) (not b!637483) (not b!637476) (not b!637477) (not b!637481) (not b!637487) (not b!637473) (not b!637469) (not b!637486))
(check-sat)
