; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55154 () Bool)

(assert start!55154)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37227 0))(
  ( (array!37228 (arr!17870 (Array (_ BitVec 32) (_ BitVec 64))) (size!18234 (_ BitVec 32))) )
))
(declare-fun lt!275725 () array!37227)

(declare-fun e!345914 () Bool)

(declare-fun b!604513 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37227)

(declare-fun arrayContainsKey!0 (array!37227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604513 (= e!345914 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) index!984))))

(declare-fun b!604514 () Bool)

(declare-fun e!345911 () Bool)

(declare-fun e!345908 () Bool)

(assert (=> b!604514 (= e!345911 e!345908)))

(declare-fun res!388435 () Bool)

(assert (=> b!604514 (=> res!388435 e!345908)))

(declare-fun lt!275713 () (_ BitVec 64))

(declare-fun lt!275716 () (_ BitVec 64))

(assert (=> b!604514 (= res!388435 (or (not (= (select (arr!17870 a!2986) j!136) lt!275716)) (not (= (select (arr!17870 a!2986) j!136) lt!275713))))))

(declare-fun e!345910 () Bool)

(assert (=> b!604514 e!345910))

(declare-fun res!388434 () Bool)

(assert (=> b!604514 (=> (not res!388434) (not e!345910))))

(assert (=> b!604514 (= res!388434 (= lt!275713 (select (arr!17870 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!604514 (= lt!275713 (select (store (arr!17870 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604515 () Bool)

(declare-fun res!388425 () Bool)

(declare-fun e!345912 () Bool)

(assert (=> b!604515 (=> (not res!388425) (not e!345912))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!604515 (= res!388425 (and (= (size!18234 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18234 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18234 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604516 () Bool)

(declare-fun e!345901 () Bool)

(assert (=> b!604516 (= e!345901 (not e!345911))))

(declare-fun res!388433 () Bool)

(assert (=> b!604516 (=> res!388433 e!345911)))

(declare-datatypes ((SeekEntryResult!6310 0))(
  ( (MissingZero!6310 (index!27503 (_ BitVec 32))) (Found!6310 (index!27504 (_ BitVec 32))) (Intermediate!6310 (undefined!7122 Bool) (index!27505 (_ BitVec 32)) (x!56295 (_ BitVec 32))) (Undefined!6310) (MissingVacant!6310 (index!27506 (_ BitVec 32))) )
))
(declare-fun lt!275710 () SeekEntryResult!6310)

(assert (=> b!604516 (= res!388433 (not (= lt!275710 (Found!6310 index!984))))))

(declare-datatypes ((Unit!19240 0))(
  ( (Unit!19241) )
))
(declare-fun lt!275723 () Unit!19240)

(declare-fun e!345902 () Unit!19240)

(assert (=> b!604516 (= lt!275723 e!345902)))

(declare-fun c!68413 () Bool)

(assert (=> b!604516 (= c!68413 (= lt!275710 Undefined!6310))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37227 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!604516 (= lt!275710 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275716 lt!275725 mask!3053))))

(declare-fun e!345904 () Bool)

(assert (=> b!604516 e!345904))

(declare-fun res!388427 () Bool)

(assert (=> b!604516 (=> (not res!388427) (not e!345904))))

(declare-fun lt!275722 () SeekEntryResult!6310)

(declare-fun lt!275711 () (_ BitVec 32))

(assert (=> b!604516 (= res!388427 (= lt!275722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275711 vacantSpotIndex!68 lt!275716 lt!275725 mask!3053)))))

(assert (=> b!604516 (= lt!275722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275711 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604516 (= lt!275716 (select (store (arr!17870 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275720 () Unit!19240)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19240)

(assert (=> b!604516 (= lt!275720 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275711 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604516 (= lt!275711 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604518 () Bool)

(declare-fun Unit!19242 () Unit!19240)

(assert (=> b!604518 (= e!345902 Unit!19242)))

(declare-fun b!604519 () Bool)

(declare-fun res!388431 () Bool)

(assert (=> b!604519 (=> (not res!388431) (not e!345912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604519 (= res!388431 (validKeyInArray!0 (select (arr!17870 a!2986) j!136)))))

(declare-fun b!604520 () Bool)

(declare-fun lt!275712 () SeekEntryResult!6310)

(assert (=> b!604520 (= e!345904 (= lt!275712 lt!275722))))

(declare-fun b!604521 () Bool)

(declare-fun e!345906 () Unit!19240)

(declare-fun Unit!19243 () Unit!19240)

(assert (=> b!604521 (= e!345906 Unit!19243)))

(declare-fun lt!275718 () Unit!19240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19240)

(assert (=> b!604521 (= lt!275718 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275725 (select (arr!17870 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604521 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275715 () Unit!19240)

(declare-datatypes ((List!11911 0))(
  ( (Nil!11908) (Cons!11907 (h!12952 (_ BitVec 64)) (t!18139 List!11911)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11911) Unit!19240)

(assert (=> b!604521 (= lt!275715 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11908))))

(declare-fun arrayNoDuplicates!0 (array!37227 (_ BitVec 32) List!11911) Bool)

(assert (=> b!604521 (arrayNoDuplicates!0 lt!275725 #b00000000000000000000000000000000 Nil!11908)))

(declare-fun lt!275714 () Unit!19240)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37227 (_ BitVec 32) (_ BitVec 32)) Unit!19240)

(assert (=> b!604521 (= lt!275714 (lemmaNoDuplicateFromThenFromBigger!0 lt!275725 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604521 (arrayNoDuplicates!0 lt!275725 j!136 Nil!11908)))

(declare-fun lt!275719 () Unit!19240)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37227 (_ BitVec 64) (_ BitVec 32) List!11911) Unit!19240)

(assert (=> b!604521 (= lt!275719 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275725 (select (arr!17870 a!2986) j!136) j!136 Nil!11908))))

(assert (=> b!604521 false))

(declare-fun b!604522 () Bool)

(declare-fun res!388428 () Bool)

(declare-fun e!345915 () Bool)

(assert (=> b!604522 (=> (not res!388428) (not e!345915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37227 (_ BitVec 32)) Bool)

(assert (=> b!604522 (= res!388428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604523 () Bool)

(declare-fun res!388422 () Bool)

(assert (=> b!604523 (=> (not res!388422) (not e!345915))))

(assert (=> b!604523 (= res!388422 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11908))))

(declare-fun b!604524 () Bool)

(declare-fun e!345909 () Bool)

(assert (=> b!604524 (= e!345910 e!345909)))

(declare-fun res!388438 () Bool)

(assert (=> b!604524 (=> res!388438 e!345909)))

(assert (=> b!604524 (= res!388438 (or (not (= (select (arr!17870 a!2986) j!136) lt!275716)) (not (= (select (arr!17870 a!2986) j!136) lt!275713)) (bvsge j!136 index!984)))))

(declare-fun b!604525 () Bool)

(assert (=> b!604525 (= e!345912 e!345915)))

(declare-fun res!388439 () Bool)

(assert (=> b!604525 (=> (not res!388439) (not e!345915))))

(declare-fun lt!275717 () SeekEntryResult!6310)

(assert (=> b!604525 (= res!388439 (or (= lt!275717 (MissingZero!6310 i!1108)) (= lt!275717 (MissingVacant!6310 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37227 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!604525 (= lt!275717 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604526 () Bool)

(declare-fun Unit!19244 () Unit!19240)

(assert (=> b!604526 (= e!345902 Unit!19244)))

(assert (=> b!604526 false))

(declare-fun b!604517 () Bool)

(assert (=> b!604517 (= e!345909 e!345914)))

(declare-fun res!388424 () Bool)

(assert (=> b!604517 (=> (not res!388424) (not e!345914))))

(assert (=> b!604517 (= res!388424 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) j!136))))

(declare-fun res!388437 () Bool)

(assert (=> start!55154 (=> (not res!388437) (not e!345912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55154 (= res!388437 (validMask!0 mask!3053))))

(assert (=> start!55154 e!345912))

(assert (=> start!55154 true))

(declare-fun array_inv!13666 (array!37227) Bool)

(assert (=> start!55154 (array_inv!13666 a!2986)))

(declare-fun b!604527 () Bool)

(declare-fun e!345905 () Bool)

(assert (=> b!604527 (= e!345905 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18234 a!2986))))))

(assert (=> b!604527 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275724 () Unit!19240)

(assert (=> b!604527 (= lt!275724 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275725 (select (arr!17870 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345903 () Bool)

(assert (=> b!604527 e!345903))

(declare-fun res!388421 () Bool)

(assert (=> b!604527 (=> (not res!388421) (not e!345903))))

(assert (=> b!604527 (= res!388421 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) j!136))))

(declare-fun b!604528 () Bool)

(declare-fun res!388432 () Bool)

(assert (=> b!604528 (=> (not res!388432) (not e!345915))))

(assert (=> b!604528 (= res!388432 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17870 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604529 () Bool)

(assert (=> b!604529 (= e!345903 (arrayContainsKey!0 lt!275725 (select (arr!17870 a!2986) j!136) index!984))))

(declare-fun b!604530 () Bool)

(declare-fun res!388436 () Bool)

(assert (=> b!604530 (=> (not res!388436) (not e!345912))))

(assert (=> b!604530 (= res!388436 (validKeyInArray!0 k!1786))))

(declare-fun b!604531 () Bool)

(declare-fun Unit!19245 () Unit!19240)

(assert (=> b!604531 (= e!345906 Unit!19245)))

(declare-fun b!604532 () Bool)

(assert (=> b!604532 (= e!345908 e!345905)))

(declare-fun res!388423 () Bool)

(assert (=> b!604532 (=> res!388423 e!345905)))

(assert (=> b!604532 (= res!388423 (bvsge index!984 j!136))))

(declare-fun lt!275721 () Unit!19240)

(assert (=> b!604532 (= lt!275721 e!345906)))

(declare-fun c!68414 () Bool)

(assert (=> b!604532 (= c!68414 (bvslt j!136 index!984))))

(declare-fun b!604533 () Bool)

(declare-fun res!388429 () Bool)

(assert (=> b!604533 (=> (not res!388429) (not e!345912))))

(assert (=> b!604533 (= res!388429 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604534 () Bool)

(declare-fun e!345913 () Bool)

(assert (=> b!604534 (= e!345913 e!345901)))

(declare-fun res!388430 () Bool)

(assert (=> b!604534 (=> (not res!388430) (not e!345901))))

(assert (=> b!604534 (= res!388430 (and (= lt!275712 (Found!6310 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17870 a!2986) index!984) (select (arr!17870 a!2986) j!136))) (not (= (select (arr!17870 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604534 (= lt!275712 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604535 () Bool)

(assert (=> b!604535 (= e!345915 e!345913)))

(declare-fun res!388426 () Bool)

(assert (=> b!604535 (=> (not res!388426) (not e!345913))))

(assert (=> b!604535 (= res!388426 (= (select (store (arr!17870 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604535 (= lt!275725 (array!37228 (store (arr!17870 a!2986) i!1108 k!1786) (size!18234 a!2986)))))

(assert (= (and start!55154 res!388437) b!604515))

(assert (= (and b!604515 res!388425) b!604519))

(assert (= (and b!604519 res!388431) b!604530))

(assert (= (and b!604530 res!388436) b!604533))

(assert (= (and b!604533 res!388429) b!604525))

(assert (= (and b!604525 res!388439) b!604522))

(assert (= (and b!604522 res!388428) b!604523))

(assert (= (and b!604523 res!388422) b!604528))

(assert (= (and b!604528 res!388432) b!604535))

(assert (= (and b!604535 res!388426) b!604534))

(assert (= (and b!604534 res!388430) b!604516))

(assert (= (and b!604516 res!388427) b!604520))

(assert (= (and b!604516 c!68413) b!604526))

(assert (= (and b!604516 (not c!68413)) b!604518))

(assert (= (and b!604516 (not res!388433)) b!604514))

(assert (= (and b!604514 res!388434) b!604524))

(assert (= (and b!604524 (not res!388438)) b!604517))

(assert (= (and b!604517 res!388424) b!604513))

(assert (= (and b!604514 (not res!388435)) b!604532))

(assert (= (and b!604532 c!68414) b!604521))

(assert (= (and b!604532 (not c!68414)) b!604531))

(assert (= (and b!604532 (not res!388423)) b!604527))

(assert (= (and b!604527 res!388421) b!604529))

(declare-fun m!581413 () Bool)

(assert (=> b!604525 m!581413))

(declare-fun m!581415 () Bool)

(assert (=> start!55154 m!581415))

(declare-fun m!581417 () Bool)

(assert (=> start!55154 m!581417))

(declare-fun m!581419 () Bool)

(assert (=> b!604530 m!581419))

(declare-fun m!581421 () Bool)

(assert (=> b!604524 m!581421))

(declare-fun m!581423 () Bool)

(assert (=> b!604534 m!581423))

(assert (=> b!604534 m!581421))

(assert (=> b!604534 m!581421))

(declare-fun m!581425 () Bool)

(assert (=> b!604534 m!581425))

(assert (=> b!604519 m!581421))

(assert (=> b!604519 m!581421))

(declare-fun m!581427 () Bool)

(assert (=> b!604519 m!581427))

(assert (=> b!604527 m!581421))

(assert (=> b!604527 m!581421))

(declare-fun m!581429 () Bool)

(assert (=> b!604527 m!581429))

(assert (=> b!604527 m!581421))

(declare-fun m!581431 () Bool)

(assert (=> b!604527 m!581431))

(assert (=> b!604527 m!581421))

(declare-fun m!581433 () Bool)

(assert (=> b!604527 m!581433))

(declare-fun m!581435 () Bool)

(assert (=> b!604522 m!581435))

(declare-fun m!581437 () Bool)

(assert (=> b!604535 m!581437))

(declare-fun m!581439 () Bool)

(assert (=> b!604535 m!581439))

(assert (=> b!604529 m!581421))

(assert (=> b!604529 m!581421))

(declare-fun m!581441 () Bool)

(assert (=> b!604529 m!581441))

(assert (=> b!604521 m!581421))

(declare-fun m!581443 () Bool)

(assert (=> b!604521 m!581443))

(assert (=> b!604521 m!581421))

(declare-fun m!581445 () Bool)

(assert (=> b!604521 m!581445))

(assert (=> b!604521 m!581421))

(declare-fun m!581447 () Bool)

(assert (=> b!604521 m!581447))

(assert (=> b!604521 m!581421))

(declare-fun m!581449 () Bool)

(assert (=> b!604521 m!581449))

(declare-fun m!581451 () Bool)

(assert (=> b!604521 m!581451))

(declare-fun m!581453 () Bool)

(assert (=> b!604521 m!581453))

(declare-fun m!581455 () Bool)

(assert (=> b!604521 m!581455))

(assert (=> b!604513 m!581421))

(assert (=> b!604513 m!581421))

(assert (=> b!604513 m!581441))

(assert (=> b!604517 m!581421))

(assert (=> b!604517 m!581421))

(assert (=> b!604517 m!581433))

(declare-fun m!581457 () Bool)

(assert (=> b!604528 m!581457))

(declare-fun m!581459 () Bool)

(assert (=> b!604533 m!581459))

(declare-fun m!581461 () Bool)

(assert (=> b!604516 m!581461))

(declare-fun m!581463 () Bool)

(assert (=> b!604516 m!581463))

(declare-fun m!581465 () Bool)

(assert (=> b!604516 m!581465))

(declare-fun m!581467 () Bool)

(assert (=> b!604516 m!581467))

(assert (=> b!604516 m!581421))

(declare-fun m!581469 () Bool)

(assert (=> b!604516 m!581469))

(assert (=> b!604516 m!581437))

(assert (=> b!604516 m!581421))

(declare-fun m!581471 () Bool)

(assert (=> b!604516 m!581471))

(declare-fun m!581473 () Bool)

(assert (=> b!604523 m!581473))

(assert (=> b!604514 m!581421))

(assert (=> b!604514 m!581437))

(declare-fun m!581475 () Bool)

(assert (=> b!604514 m!581475))

(push 1)

(assert (not b!604527))

(assert (not b!604522))

(assert (not b!604521))

(assert (not b!604513))

(assert (not b!604517))

(assert (not b!604519))

(assert (not b!604516))

(assert (not b!604530))

(assert (not b!604529))

(assert (not b!604523))

(assert (not b!604525))

(assert (not start!55154))

(assert (not b!604534))

(assert (not b!604533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

