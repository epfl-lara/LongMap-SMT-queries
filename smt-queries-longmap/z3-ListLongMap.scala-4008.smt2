; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54570 () Bool)

(assert start!54570)

(declare-fun b!595518 () Bool)

(declare-fun e!340259 () Bool)

(declare-datatypes ((SeekEntryResult!6145 0))(
  ( (MissingZero!6145 (index!26828 (_ BitVec 32))) (Found!6145 (index!26829 (_ BitVec 32))) (Intermediate!6145 (undefined!6957 Bool) (index!26830 (_ BitVec 32)) (x!55784 (_ BitVec 32))) (Undefined!6145) (MissingVacant!6145 (index!26831 (_ BitVec 32))) )
))
(declare-fun lt!270415 () SeekEntryResult!6145)

(declare-fun lt!270414 () SeekEntryResult!6145)

(assert (=> b!595518 (= e!340259 (= lt!270415 lt!270414))))

(declare-fun b!595519 () Bool)

(declare-fun e!340264 () Bool)

(declare-fun e!340267 () Bool)

(assert (=> b!595519 (= e!340264 e!340267)))

(declare-fun res!381312 () Bool)

(assert (=> b!595519 (=> res!381312 e!340267)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270413 () (_ BitVec 64))

(declare-fun lt!270407 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36975 0))(
  ( (array!36976 (arr!17749 (Array (_ BitVec 32) (_ BitVec 64))) (size!18113 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36975)

(assert (=> b!595519 (= res!381312 (or (not (= (select (arr!17749 a!2986) j!136) lt!270407)) (not (= (select (arr!17749 a!2986) j!136) lt!270413)) (bvsge j!136 index!984)))))

(declare-fun b!595520 () Bool)

(declare-fun res!381316 () Bool)

(declare-fun e!340265 () Bool)

(assert (=> b!595520 (=> res!381316 e!340265)))

(declare-datatypes ((List!11697 0))(
  ( (Nil!11694) (Cons!11693 (h!12741 (_ BitVec 64)) (t!17917 List!11697)) )
))
(declare-fun noDuplicate!253 (List!11697) Bool)

(assert (=> b!595520 (= res!381316 (not (noDuplicate!253 Nil!11694)))))

(declare-fun b!595521 () Bool)

(declare-fun e!340269 () Bool)

(declare-fun e!340266 () Bool)

(assert (=> b!595521 (= e!340269 (not e!340266))))

(declare-fun res!381308 () Bool)

(assert (=> b!595521 (=> res!381308 e!340266)))

(declare-fun lt!270412 () SeekEntryResult!6145)

(assert (=> b!595521 (= res!381308 (not (= lt!270412 (Found!6145 index!984))))))

(declare-datatypes ((Unit!18673 0))(
  ( (Unit!18674) )
))
(declare-fun lt!270404 () Unit!18673)

(declare-fun e!340258 () Unit!18673)

(assert (=> b!595521 (= lt!270404 e!340258)))

(declare-fun c!67478 () Bool)

(assert (=> b!595521 (= c!67478 (= lt!270412 Undefined!6145))))

(declare-fun lt!270410 () array!36975)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36975 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!595521 (= lt!270412 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270407 lt!270410 mask!3053))))

(assert (=> b!595521 e!340259))

(declare-fun res!381307 () Bool)

(assert (=> b!595521 (=> (not res!381307) (not e!340259))))

(declare-fun lt!270405 () (_ BitVec 32))

(assert (=> b!595521 (= res!381307 (= lt!270414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270405 vacantSpotIndex!68 lt!270407 lt!270410 mask!3053)))))

(assert (=> b!595521 (= lt!270414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270405 vacantSpotIndex!68 (select (arr!17749 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595521 (= lt!270407 (select (store (arr!17749 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270408 () Unit!18673)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36975 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18673)

(assert (=> b!595521 (= lt!270408 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270405 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595521 (= lt!270405 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!595522 () Bool)

(declare-fun res!381319 () Bool)

(declare-fun e!340257 () Bool)

(assert (=> b!595522 (=> (not res!381319) (not e!340257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595522 (= res!381319 (validKeyInArray!0 (select (arr!17749 a!2986) j!136)))))

(declare-fun b!595523 () Bool)

(declare-fun res!381313 () Bool)

(assert (=> b!595523 (=> res!381313 e!340265)))

(declare-fun contains!2906 (List!11697 (_ BitVec 64)) Bool)

(assert (=> b!595523 (= res!381313 (contains!2906 Nil!11694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595525 () Bool)

(declare-fun e!340260 () Bool)

(declare-fun arrayContainsKey!0 (array!36975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595525 (= e!340260 (arrayContainsKey!0 lt!270410 (select (arr!17749 a!2986) j!136) index!984))))

(declare-fun b!595526 () Bool)

(declare-fun e!340261 () Bool)

(assert (=> b!595526 (= e!340261 e!340265)))

(declare-fun res!381300 () Bool)

(assert (=> b!595526 (=> res!381300 e!340265)))

(assert (=> b!595526 (= res!381300 (or (bvsge (size!18113 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18113 a!2986))))))

(assert (=> b!595526 (arrayContainsKey!0 lt!270410 (select (arr!17749 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270406 () Unit!18673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36975 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18673)

(assert (=> b!595526 (= lt!270406 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270410 (select (arr!17749 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595527 () Bool)

(declare-fun e!340263 () Bool)

(declare-fun e!340262 () Bool)

(assert (=> b!595527 (= e!340263 e!340262)))

(declare-fun res!381306 () Bool)

(assert (=> b!595527 (=> (not res!381306) (not e!340262))))

(assert (=> b!595527 (= res!381306 (= (select (store (arr!17749 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595527 (= lt!270410 (array!36976 (store (arr!17749 a!2986) i!1108 k0!1786) (size!18113 a!2986)))))

(declare-fun b!595528 () Bool)

(assert (=> b!595528 (= e!340266 e!340261)))

(declare-fun res!381317 () Bool)

(assert (=> b!595528 (=> res!381317 e!340261)))

(assert (=> b!595528 (= res!381317 (or (not (= (select (arr!17749 a!2986) j!136) lt!270407)) (not (= (select (arr!17749 a!2986) j!136) lt!270413)) (bvsge j!136 index!984)))))

(assert (=> b!595528 e!340264))

(declare-fun res!381314 () Bool)

(assert (=> b!595528 (=> (not res!381314) (not e!340264))))

(assert (=> b!595528 (= res!381314 (= lt!270413 (select (arr!17749 a!2986) j!136)))))

(assert (=> b!595528 (= lt!270413 (select (store (arr!17749 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595529 () Bool)

(assert (=> b!595529 (= e!340257 e!340263)))

(declare-fun res!381302 () Bool)

(assert (=> b!595529 (=> (not res!381302) (not e!340263))))

(declare-fun lt!270411 () SeekEntryResult!6145)

(assert (=> b!595529 (= res!381302 (or (= lt!270411 (MissingZero!6145 i!1108)) (= lt!270411 (MissingVacant!6145 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36975 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!595529 (= lt!270411 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595530 () Bool)

(declare-fun res!381304 () Bool)

(assert (=> b!595530 (=> res!381304 e!340265)))

(assert (=> b!595530 (= res!381304 (contains!2906 Nil!11694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595531 () Bool)

(assert (=> b!595531 (= e!340265 true)))

(declare-fun lt!270409 () Bool)

(assert (=> b!595531 (= lt!270409 (contains!2906 Nil!11694 k0!1786))))

(declare-fun b!595532 () Bool)

(declare-fun res!381309 () Bool)

(assert (=> b!595532 (=> (not res!381309) (not e!340257))))

(assert (=> b!595532 (= res!381309 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595524 () Bool)

(assert (=> b!595524 (= e!340267 e!340260)))

(declare-fun res!381318 () Bool)

(assert (=> b!595524 (=> (not res!381318) (not e!340260))))

(assert (=> b!595524 (= res!381318 (arrayContainsKey!0 lt!270410 (select (arr!17749 a!2986) j!136) j!136))))

(declare-fun res!381310 () Bool)

(assert (=> start!54570 (=> (not res!381310) (not e!340257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54570 (= res!381310 (validMask!0 mask!3053))))

(assert (=> start!54570 e!340257))

(assert (=> start!54570 true))

(declare-fun array_inv!13608 (array!36975) Bool)

(assert (=> start!54570 (array_inv!13608 a!2986)))

(declare-fun b!595533 () Bool)

(declare-fun res!381305 () Bool)

(assert (=> b!595533 (=> (not res!381305) (not e!340257))))

(assert (=> b!595533 (= res!381305 (and (= (size!18113 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18113 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18113 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595534 () Bool)

(assert (=> b!595534 (= e!340262 e!340269)))

(declare-fun res!381301 () Bool)

(assert (=> b!595534 (=> (not res!381301) (not e!340269))))

(assert (=> b!595534 (= res!381301 (and (= lt!270415 (Found!6145 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17749 a!2986) index!984) (select (arr!17749 a!2986) j!136))) (not (= (select (arr!17749 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595534 (= lt!270415 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17749 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595535 () Bool)

(declare-fun Unit!18675 () Unit!18673)

(assert (=> b!595535 (= e!340258 Unit!18675)))

(declare-fun b!595536 () Bool)

(declare-fun res!381299 () Bool)

(assert (=> b!595536 (=> (not res!381299) (not e!340263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36975 (_ BitVec 32)) Bool)

(assert (=> b!595536 (= res!381299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595537 () Bool)

(declare-fun res!381311 () Bool)

(assert (=> b!595537 (=> (not res!381311) (not e!340257))))

(assert (=> b!595537 (= res!381311 (validKeyInArray!0 k0!1786))))

(declare-fun b!595538 () Bool)

(declare-fun res!381303 () Bool)

(assert (=> b!595538 (=> (not res!381303) (not e!340263))))

(assert (=> b!595538 (= res!381303 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17749 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595539 () Bool)

(declare-fun res!381315 () Bool)

(assert (=> b!595539 (=> (not res!381315) (not e!340263))))

(declare-fun arrayNoDuplicates!0 (array!36975 (_ BitVec 32) List!11697) Bool)

(assert (=> b!595539 (= res!381315 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11694))))

(declare-fun b!595540 () Bool)

(declare-fun Unit!18676 () Unit!18673)

(assert (=> b!595540 (= e!340258 Unit!18676)))

(assert (=> b!595540 false))

(assert (= (and start!54570 res!381310) b!595533))

(assert (= (and b!595533 res!381305) b!595522))

(assert (= (and b!595522 res!381319) b!595537))

(assert (= (and b!595537 res!381311) b!595532))

(assert (= (and b!595532 res!381309) b!595529))

(assert (= (and b!595529 res!381302) b!595536))

(assert (= (and b!595536 res!381299) b!595539))

(assert (= (and b!595539 res!381315) b!595538))

(assert (= (and b!595538 res!381303) b!595527))

(assert (= (and b!595527 res!381306) b!595534))

(assert (= (and b!595534 res!381301) b!595521))

(assert (= (and b!595521 res!381307) b!595518))

(assert (= (and b!595521 c!67478) b!595540))

(assert (= (and b!595521 (not c!67478)) b!595535))

(assert (= (and b!595521 (not res!381308)) b!595528))

(assert (= (and b!595528 res!381314) b!595519))

(assert (= (and b!595519 (not res!381312)) b!595524))

(assert (= (and b!595524 res!381318) b!595525))

(assert (= (and b!595528 (not res!381317)) b!595526))

(assert (= (and b!595526 (not res!381300)) b!595520))

(assert (= (and b!595520 (not res!381316)) b!595530))

(assert (= (and b!595530 (not res!381304)) b!595523))

(assert (= (and b!595523 (not res!381313)) b!595531))

(declare-fun m!573395 () Bool)

(assert (=> b!595529 m!573395))

(declare-fun m!573397 () Bool)

(assert (=> b!595528 m!573397))

(declare-fun m!573399 () Bool)

(assert (=> b!595528 m!573399))

(declare-fun m!573401 () Bool)

(assert (=> b!595528 m!573401))

(assert (=> b!595519 m!573397))

(assert (=> b!595526 m!573397))

(assert (=> b!595526 m!573397))

(declare-fun m!573403 () Bool)

(assert (=> b!595526 m!573403))

(assert (=> b!595526 m!573397))

(declare-fun m!573405 () Bool)

(assert (=> b!595526 m!573405))

(declare-fun m!573407 () Bool)

(assert (=> b!595539 m!573407))

(declare-fun m!573409 () Bool)

(assert (=> b!595530 m!573409))

(assert (=> b!595524 m!573397))

(assert (=> b!595524 m!573397))

(declare-fun m!573411 () Bool)

(assert (=> b!595524 m!573411))

(declare-fun m!573413 () Bool)

(assert (=> b!595537 m!573413))

(declare-fun m!573415 () Bool)

(assert (=> b!595534 m!573415))

(assert (=> b!595534 m!573397))

(assert (=> b!595534 m!573397))

(declare-fun m!573417 () Bool)

(assert (=> b!595534 m!573417))

(declare-fun m!573419 () Bool)

(assert (=> b!595536 m!573419))

(assert (=> b!595527 m!573399))

(declare-fun m!573421 () Bool)

(assert (=> b!595527 m!573421))

(declare-fun m!573423 () Bool)

(assert (=> start!54570 m!573423))

(declare-fun m!573425 () Bool)

(assert (=> start!54570 m!573425))

(declare-fun m!573427 () Bool)

(assert (=> b!595523 m!573427))

(assert (=> b!595522 m!573397))

(assert (=> b!595522 m!573397))

(declare-fun m!573429 () Bool)

(assert (=> b!595522 m!573429))

(declare-fun m!573431 () Bool)

(assert (=> b!595520 m!573431))

(declare-fun m!573433 () Bool)

(assert (=> b!595538 m!573433))

(assert (=> b!595525 m!573397))

(assert (=> b!595525 m!573397))

(declare-fun m!573435 () Bool)

(assert (=> b!595525 m!573435))

(declare-fun m!573437 () Bool)

(assert (=> b!595532 m!573437))

(declare-fun m!573439 () Bool)

(assert (=> b!595521 m!573439))

(assert (=> b!595521 m!573397))

(assert (=> b!595521 m!573399))

(declare-fun m!573441 () Bool)

(assert (=> b!595521 m!573441))

(assert (=> b!595521 m!573397))

(declare-fun m!573443 () Bool)

(assert (=> b!595521 m!573443))

(declare-fun m!573445 () Bool)

(assert (=> b!595521 m!573445))

(declare-fun m!573447 () Bool)

(assert (=> b!595521 m!573447))

(declare-fun m!573449 () Bool)

(assert (=> b!595521 m!573449))

(declare-fun m!573451 () Bool)

(assert (=> b!595531 m!573451))

(check-sat (not b!595531) (not b!595522) (not b!595526) (not b!595529) (not b!595537) (not b!595539) (not b!595521) (not b!595532) (not b!595520) (not b!595530) (not b!595536) (not b!595524) (not b!595534) (not b!595525) (not b!595523) (not start!54570))
(check-sat)
