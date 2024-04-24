; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31182 () Bool)

(assert start!31182)

(declare-fun b!313396 () Bool)

(declare-fun res!169624 () Bool)

(declare-fun e!195309 () Bool)

(assert (=> b!313396 (=> (not res!169624) (not e!195309))))

(declare-datatypes ((array!16007 0))(
  ( (array!16008 (arr!7582 (Array (_ BitVec 32) (_ BitVec 64))) (size!7934 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16007)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313396 (= res!169624 (and (= (size!7934 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7934 a!3293))))))

(declare-fun b!313397 () Bool)

(declare-fun e!195310 () Bool)

(declare-fun e!195311 () Bool)

(assert (=> b!313397 (= e!195310 e!195311)))

(declare-fun res!169622 () Bool)

(assert (=> b!313397 (=> (not res!169622) (not e!195311))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2687 0))(
  ( (MissingZero!2687 (index!12924 (_ BitVec 32))) (Found!2687 (index!12925 (_ BitVec 32))) (Intermediate!2687 (undefined!3499 Bool) (index!12926 (_ BitVec 32)) (x!31245 (_ BitVec 32))) (Undefined!2687) (MissingVacant!2687 (index!12927 (_ BitVec 32))) )
))
(declare-fun lt!153581 () SeekEntryResult!2687)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153582 () SeekEntryResult!2687)

(assert (=> b!313397 (= res!169622 (and (= lt!153582 lt!153581) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7582 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7582 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7582 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!313397 (= lt!153582 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!313398 () Bool)

(declare-fun res!169618 () Bool)

(assert (=> b!313398 (=> (not res!169618) (not e!195309))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!313398 (= res!169618 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2687 i!1240)))))

(declare-fun b!313399 () Bool)

(declare-fun res!169621 () Bool)

(assert (=> b!313399 (=> (not res!169621) (not e!195309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16007 (_ BitVec 32)) Bool)

(assert (=> b!313399 (= res!169621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313400 () Bool)

(declare-fun res!169625 () Bool)

(assert (=> b!313400 (=> (not res!169625) (not e!195309))))

(declare-fun arrayContainsKey!0 (array!16007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313400 (= res!169625 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!169626 () Bool)

(assert (=> start!31182 (=> (not res!169626) (not e!195309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31182 (= res!169626 (validMask!0 mask!3709))))

(assert (=> start!31182 e!195309))

(declare-fun array_inv!5532 (array!16007) Bool)

(assert (=> start!31182 (array_inv!5532 a!3293)))

(assert (=> start!31182 true))

(declare-fun b!313401 () Bool)

(declare-fun lt!153580 () SeekEntryResult!2687)

(get-info :version)

(assert (=> b!313401 (= e!195311 (not (or (not ((_ is Intermediate!2687) lt!153580)) (bvsge (x!31245 lt!153580) (bvadd #b00000000000000000000000000000001 x!1427)))))))

(assert (=> b!313401 (= lt!153582 lt!153580)))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313401 (= lt!153580 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313402 () Bool)

(assert (=> b!313402 (= e!195309 e!195310)))

(declare-fun res!169620 () Bool)

(assert (=> b!313402 (=> (not res!169620) (not e!195310))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313402 (= res!169620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153581))))

(assert (=> b!313402 (= lt!153581 (Intermediate!2687 false resIndex!52 resX!52))))

(declare-fun b!313403 () Bool)

(declare-fun res!169623 () Bool)

(assert (=> b!313403 (=> (not res!169623) (not e!195309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313403 (= res!169623 (validKeyInArray!0 k0!2441))))

(declare-fun b!313404 () Bool)

(declare-fun res!169619 () Bool)

(assert (=> b!313404 (=> (not res!169619) (not e!195310))))

(assert (=> b!313404 (= res!169619 (and (= (select (arr!7582 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7934 a!3293))))))

(assert (= (and start!31182 res!169626) b!313396))

(assert (= (and b!313396 res!169624) b!313403))

(assert (= (and b!313403 res!169623) b!313400))

(assert (= (and b!313400 res!169625) b!313398))

(assert (= (and b!313398 res!169618) b!313399))

(assert (= (and b!313399 res!169621) b!313402))

(assert (= (and b!313402 res!169620) b!313404))

(assert (= (and b!313404 res!169619) b!313397))

(assert (= (and b!313397 res!169622) b!313401))

(declare-fun m!323491 () Bool)

(assert (=> b!313404 m!323491))

(declare-fun m!323493 () Bool)

(assert (=> b!313400 m!323493))

(declare-fun m!323495 () Bool)

(assert (=> b!313399 m!323495))

(declare-fun m!323497 () Bool)

(assert (=> b!313397 m!323497))

(declare-fun m!323499 () Bool)

(assert (=> b!313397 m!323499))

(declare-fun m!323501 () Bool)

(assert (=> start!31182 m!323501))

(declare-fun m!323503 () Bool)

(assert (=> start!31182 m!323503))

(declare-fun m!323505 () Bool)

(assert (=> b!313403 m!323505))

(declare-fun m!323507 () Bool)

(assert (=> b!313401 m!323507))

(assert (=> b!313401 m!323507))

(declare-fun m!323509 () Bool)

(assert (=> b!313401 m!323509))

(declare-fun m!323511 () Bool)

(assert (=> b!313398 m!323511))

(declare-fun m!323513 () Bool)

(assert (=> b!313402 m!323513))

(assert (=> b!313402 m!323513))

(declare-fun m!323515 () Bool)

(assert (=> b!313402 m!323515))

(check-sat (not b!313400) (not b!313402) (not b!313403) (not start!31182) (not b!313397) (not b!313399) (not b!313401) (not b!313398))
(check-sat)
(get-model)

(declare-fun d!68619 () Bool)

(declare-fun res!169685 () Bool)

(declare-fun e!195341 () Bool)

(assert (=> d!68619 (=> res!169685 e!195341)))

(assert (=> d!68619 (= res!169685 (= (select (arr!7582 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68619 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195341)))

(declare-fun b!313463 () Bool)

(declare-fun e!195342 () Bool)

(assert (=> b!313463 (= e!195341 e!195342)))

(declare-fun res!169686 () Bool)

(assert (=> b!313463 (=> (not res!169686) (not e!195342))))

(assert (=> b!313463 (= res!169686 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7934 a!3293)))))

(declare-fun b!313464 () Bool)

(assert (=> b!313464 (= e!195342 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68619 (not res!169685)) b!313463))

(assert (= (and b!313463 res!169686) b!313464))

(declare-fun m!323569 () Bool)

(assert (=> d!68619 m!323569))

(declare-fun m!323571 () Bool)

(assert (=> b!313464 m!323571))

(assert (=> b!313400 d!68619))

(declare-fun b!313473 () Bool)

(declare-fun e!195351 () Bool)

(declare-fun e!195349 () Bool)

(assert (=> b!313473 (= e!195351 e!195349)))

(declare-fun lt!153607 () (_ BitVec 64))

(assert (=> b!313473 (= lt!153607 (select (arr!7582 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9635 0))(
  ( (Unit!9636) )
))
(declare-fun lt!153609 () Unit!9635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16007 (_ BitVec 64) (_ BitVec 32)) Unit!9635)

(assert (=> b!313473 (= lt!153609 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153607 #b00000000000000000000000000000000))))

(assert (=> b!313473 (arrayContainsKey!0 a!3293 lt!153607 #b00000000000000000000000000000000)))

(declare-fun lt!153608 () Unit!9635)

(assert (=> b!313473 (= lt!153608 lt!153609)))

(declare-fun res!169691 () Bool)

(assert (=> b!313473 (= res!169691 (= (seekEntryOrOpen!0 (select (arr!7582 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2687 #b00000000000000000000000000000000)))))

(assert (=> b!313473 (=> (not res!169691) (not e!195349))))

(declare-fun d!68621 () Bool)

(declare-fun res!169692 () Bool)

(declare-fun e!195350 () Bool)

(assert (=> d!68621 (=> res!169692 e!195350)))

(assert (=> d!68621 (= res!169692 (bvsge #b00000000000000000000000000000000 (size!7934 a!3293)))))

(assert (=> d!68621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195350)))

(declare-fun b!313474 () Bool)

(declare-fun call!25934 () Bool)

(assert (=> b!313474 (= e!195351 call!25934)))

(declare-fun b!313475 () Bool)

(assert (=> b!313475 (= e!195350 e!195351)))

(declare-fun c!49499 () Bool)

(assert (=> b!313475 (= c!49499 (validKeyInArray!0 (select (arr!7582 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25931 () Bool)

(assert (=> bm!25931 (= call!25934 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313476 () Bool)

(assert (=> b!313476 (= e!195349 call!25934)))

(assert (= (and d!68621 (not res!169692)) b!313475))

(assert (= (and b!313475 c!49499) b!313473))

(assert (= (and b!313475 (not c!49499)) b!313474))

(assert (= (and b!313473 res!169691) b!313476))

(assert (= (or b!313476 b!313474) bm!25931))

(assert (=> b!313473 m!323569))

(declare-fun m!323573 () Bool)

(assert (=> b!313473 m!323573))

(declare-fun m!323575 () Bool)

(assert (=> b!313473 m!323575))

(assert (=> b!313473 m!323569))

(declare-fun m!323577 () Bool)

(assert (=> b!313473 m!323577))

(assert (=> b!313475 m!323569))

(assert (=> b!313475 m!323569))

(declare-fun m!323579 () Bool)

(assert (=> b!313475 m!323579))

(declare-fun m!323581 () Bool)

(assert (=> bm!25931 m!323581))

(assert (=> b!313399 d!68621))

(declare-fun b!313517 () Bool)

(declare-fun e!195380 () SeekEntryResult!2687)

(declare-fun e!195383 () SeekEntryResult!2687)

(assert (=> b!313517 (= e!195380 e!195383)))

(declare-fun c!49509 () Bool)

(declare-fun lt!153623 () (_ BitVec 64))

(assert (=> b!313517 (= c!49509 (or (= lt!153623 k0!2441) (= (bvadd lt!153623 lt!153623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313518 () Bool)

(declare-fun e!195381 () Bool)

(declare-fun lt!153624 () SeekEntryResult!2687)

(assert (=> b!313518 (= e!195381 (bvsge (x!31245 lt!153624) #b01111111111111111111111111111110))))

(declare-fun b!313519 () Bool)

(declare-fun e!195382 () Bool)

(assert (=> b!313519 (= e!195381 e!195382)))

(declare-fun res!169715 () Bool)

(assert (=> b!313519 (= res!169715 (and ((_ is Intermediate!2687) lt!153624) (not (undefined!3499 lt!153624)) (bvslt (x!31245 lt!153624) #b01111111111111111111111111111110) (bvsge (x!31245 lt!153624) #b00000000000000000000000000000000) (bvsge (x!31245 lt!153624) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!313519 (=> (not res!169715) (not e!195382))))

(declare-fun b!313520 () Bool)

(assert (=> b!313520 (= e!195380 (Intermediate!2687 true (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313521 () Bool)

(assert (=> b!313521 (and (bvsge (index!12926 lt!153624) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153624) (size!7934 a!3293)))))

(declare-fun res!169713 () Bool)

(assert (=> b!313521 (= res!169713 (= (select (arr!7582 a!3293) (index!12926 lt!153624)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195379 () Bool)

(assert (=> b!313521 (=> res!169713 e!195379)))

(declare-fun b!313522 () Bool)

(assert (=> b!313522 (and (bvsge (index!12926 lt!153624) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153624) (size!7934 a!3293)))))

(assert (=> b!313522 (= e!195379 (= (select (arr!7582 a!3293) (index!12926 lt!153624)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313523 () Bool)

(assert (=> b!313523 (= e!195383 (Intermediate!2687 false (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313524 () Bool)

(assert (=> b!313524 (= e!195383 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313525 () Bool)

(assert (=> b!313525 (and (bvsge (index!12926 lt!153624) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153624) (size!7934 a!3293)))))

(declare-fun res!169714 () Bool)

(assert (=> b!313525 (= res!169714 (= (select (arr!7582 a!3293) (index!12926 lt!153624)) k0!2441))))

(assert (=> b!313525 (=> res!169714 e!195379)))

(assert (=> b!313525 (= e!195382 e!195379)))

(declare-fun d!68623 () Bool)

(assert (=> d!68623 e!195381))

(declare-fun c!49511 () Bool)

(assert (=> d!68623 (= c!49511 (and ((_ is Intermediate!2687) lt!153624) (undefined!3499 lt!153624)))))

(assert (=> d!68623 (= lt!153624 e!195380)))

(declare-fun c!49510 () Bool)

(assert (=> d!68623 (= c!49510 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68623 (= lt!153623 (select (arr!7582 a!3293) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709)))))

(assert (=> d!68623 (validMask!0 mask!3709)))

(assert (=> d!68623 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709) lt!153624)))

(assert (= (and d!68623 c!49510) b!313520))

(assert (= (and d!68623 (not c!49510)) b!313517))

(assert (= (and b!313517 c!49509) b!313523))

(assert (= (and b!313517 (not c!49509)) b!313524))

(assert (= (and d!68623 c!49511) b!313518))

(assert (= (and d!68623 (not c!49511)) b!313519))

(assert (= (and b!313519 res!169715) b!313525))

(assert (= (and b!313525 (not res!169714)) b!313521))

(assert (= (and b!313521 (not res!169713)) b!313522))

(declare-fun m!323597 () Bool)

(assert (=> b!313525 m!323597))

(assert (=> b!313522 m!323597))

(assert (=> d!68623 m!323507))

(declare-fun m!323599 () Bool)

(assert (=> d!68623 m!323599))

(assert (=> d!68623 m!323501))

(assert (=> b!313524 m!323507))

(declare-fun m!323601 () Bool)

(assert (=> b!313524 m!323601))

(assert (=> b!313524 m!323601))

(declare-fun m!323603 () Bool)

(assert (=> b!313524 m!323603))

(assert (=> b!313521 m!323597))

(assert (=> b!313401 d!68623))

(declare-fun d!68635 () Bool)

(declare-fun lt!153636 () (_ BitVec 32))

(assert (=> d!68635 (and (bvsge lt!153636 #b00000000000000000000000000000000) (bvslt lt!153636 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68635 (= lt!153636 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68635 (validMask!0 mask!3709)))

(assert (=> d!68635 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!153636)))

(declare-fun bs!11007 () Bool)

(assert (= bs!11007 d!68635))

(declare-fun m!323605 () Bool)

(assert (=> bs!11007 m!323605))

(assert (=> bs!11007 m!323501))

(assert (=> b!313401 d!68635))

(declare-fun b!313534 () Bool)

(declare-fun e!195392 () SeekEntryResult!2687)

(declare-fun e!195395 () SeekEntryResult!2687)

(assert (=> b!313534 (= e!195392 e!195395)))

(declare-fun c!49515 () Bool)

(declare-fun lt!153637 () (_ BitVec 64))

(assert (=> b!313534 (= c!49515 (or (= lt!153637 k0!2441) (= (bvadd lt!153637 lt!153637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313535 () Bool)

(declare-fun e!195393 () Bool)

(declare-fun lt!153638 () SeekEntryResult!2687)

(assert (=> b!313535 (= e!195393 (bvsge (x!31245 lt!153638) #b01111111111111111111111111111110))))

(declare-fun b!313536 () Bool)

(declare-fun e!195394 () Bool)

(assert (=> b!313536 (= e!195393 e!195394)))

(declare-fun res!169722 () Bool)

(assert (=> b!313536 (= res!169722 (and ((_ is Intermediate!2687) lt!153638) (not (undefined!3499 lt!153638)) (bvslt (x!31245 lt!153638) #b01111111111111111111111111111110) (bvsge (x!31245 lt!153638) #b00000000000000000000000000000000) (bvsge (x!31245 lt!153638) x!1427)))))

(assert (=> b!313536 (=> (not res!169722) (not e!195394))))

(declare-fun b!313537 () Bool)

(assert (=> b!313537 (= e!195392 (Intermediate!2687 true index!1781 x!1427))))

(declare-fun b!313538 () Bool)

(assert (=> b!313538 (and (bvsge (index!12926 lt!153638) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153638) (size!7934 a!3293)))))

(declare-fun res!169720 () Bool)

(assert (=> b!313538 (= res!169720 (= (select (arr!7582 a!3293) (index!12926 lt!153638)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195391 () Bool)

(assert (=> b!313538 (=> res!169720 e!195391)))

(declare-fun b!313539 () Bool)

(assert (=> b!313539 (and (bvsge (index!12926 lt!153638) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153638) (size!7934 a!3293)))))

(assert (=> b!313539 (= e!195391 (= (select (arr!7582 a!3293) (index!12926 lt!153638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313540 () Bool)

(assert (=> b!313540 (= e!195395 (Intermediate!2687 false index!1781 x!1427))))

(declare-fun b!313541 () Bool)

(assert (=> b!313541 (= e!195395 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313542 () Bool)

(assert (=> b!313542 (and (bvsge (index!12926 lt!153638) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153638) (size!7934 a!3293)))))

(declare-fun res!169721 () Bool)

(assert (=> b!313542 (= res!169721 (= (select (arr!7582 a!3293) (index!12926 lt!153638)) k0!2441))))

(assert (=> b!313542 (=> res!169721 e!195391)))

(assert (=> b!313542 (= e!195394 e!195391)))

(declare-fun d!68637 () Bool)

(assert (=> d!68637 e!195393))

(declare-fun c!49517 () Bool)

(assert (=> d!68637 (= c!49517 (and ((_ is Intermediate!2687) lt!153638) (undefined!3499 lt!153638)))))

(assert (=> d!68637 (= lt!153638 e!195392)))

(declare-fun c!49516 () Bool)

(assert (=> d!68637 (= c!49516 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68637 (= lt!153637 (select (arr!7582 a!3293) index!1781))))

(assert (=> d!68637 (validMask!0 mask!3709)))

(assert (=> d!68637 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153638)))

(assert (= (and d!68637 c!49516) b!313537))

(assert (= (and d!68637 (not c!49516)) b!313534))

(assert (= (and b!313534 c!49515) b!313540))

(assert (= (and b!313534 (not c!49515)) b!313541))

(assert (= (and d!68637 c!49517) b!313535))

(assert (= (and d!68637 (not c!49517)) b!313536))

(assert (= (and b!313536 res!169722) b!313542))

(assert (= (and b!313542 (not res!169721)) b!313538))

(assert (= (and b!313538 (not res!169720)) b!313539))

(declare-fun m!323619 () Bool)

(assert (=> b!313542 m!323619))

(assert (=> b!313539 m!323619))

(assert (=> d!68637 m!323497))

(assert (=> d!68637 m!323501))

(declare-fun m!323621 () Bool)

(assert (=> b!313541 m!323621))

(assert (=> b!313541 m!323621))

(declare-fun m!323623 () Bool)

(assert (=> b!313541 m!323623))

(assert (=> b!313538 m!323619))

(assert (=> b!313397 d!68637))

(declare-fun b!313543 () Bool)

(declare-fun e!195397 () SeekEntryResult!2687)

(declare-fun e!195400 () SeekEntryResult!2687)

(assert (=> b!313543 (= e!195397 e!195400)))

(declare-fun c!49518 () Bool)

(declare-fun lt!153639 () (_ BitVec 64))

(assert (=> b!313543 (= c!49518 (or (= lt!153639 k0!2441) (= (bvadd lt!153639 lt!153639) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313544 () Bool)

(declare-fun e!195398 () Bool)

(declare-fun lt!153640 () SeekEntryResult!2687)

(assert (=> b!313544 (= e!195398 (bvsge (x!31245 lt!153640) #b01111111111111111111111111111110))))

(declare-fun b!313545 () Bool)

(declare-fun e!195399 () Bool)

(assert (=> b!313545 (= e!195398 e!195399)))

(declare-fun res!169725 () Bool)

(assert (=> b!313545 (= res!169725 (and ((_ is Intermediate!2687) lt!153640) (not (undefined!3499 lt!153640)) (bvslt (x!31245 lt!153640) #b01111111111111111111111111111110) (bvsge (x!31245 lt!153640) #b00000000000000000000000000000000) (bvsge (x!31245 lt!153640) #b00000000000000000000000000000000)))))

(assert (=> b!313545 (=> (not res!169725) (not e!195399))))

(declare-fun b!313546 () Bool)

(assert (=> b!313546 (= e!195397 (Intermediate!2687 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313547 () Bool)

(assert (=> b!313547 (and (bvsge (index!12926 lt!153640) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153640) (size!7934 a!3293)))))

(declare-fun res!169723 () Bool)

(assert (=> b!313547 (= res!169723 (= (select (arr!7582 a!3293) (index!12926 lt!153640)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195396 () Bool)

(assert (=> b!313547 (=> res!169723 e!195396)))

(declare-fun b!313548 () Bool)

(assert (=> b!313548 (and (bvsge (index!12926 lt!153640) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153640) (size!7934 a!3293)))))

(assert (=> b!313548 (= e!195396 (= (select (arr!7582 a!3293) (index!12926 lt!153640)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313549 () Bool)

(assert (=> b!313549 (= e!195400 (Intermediate!2687 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313550 () Bool)

(assert (=> b!313550 (= e!195400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313551 () Bool)

(assert (=> b!313551 (and (bvsge (index!12926 lt!153640) #b00000000000000000000000000000000) (bvslt (index!12926 lt!153640) (size!7934 a!3293)))))

(declare-fun res!169724 () Bool)

(assert (=> b!313551 (= res!169724 (= (select (arr!7582 a!3293) (index!12926 lt!153640)) k0!2441))))

(assert (=> b!313551 (=> res!169724 e!195396)))

(assert (=> b!313551 (= e!195399 e!195396)))

(declare-fun d!68641 () Bool)

(assert (=> d!68641 e!195398))

(declare-fun c!49520 () Bool)

(assert (=> d!68641 (= c!49520 (and ((_ is Intermediate!2687) lt!153640) (undefined!3499 lt!153640)))))

(assert (=> d!68641 (= lt!153640 e!195397)))

(declare-fun c!49519 () Bool)

(assert (=> d!68641 (= c!49519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68641 (= lt!153639 (select (arr!7582 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68641 (validMask!0 mask!3709)))

(assert (=> d!68641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153640)))

(assert (= (and d!68641 c!49519) b!313546))

(assert (= (and d!68641 (not c!49519)) b!313543))

(assert (= (and b!313543 c!49518) b!313549))

(assert (= (and b!313543 (not c!49518)) b!313550))

(assert (= (and d!68641 c!49520) b!313544))

(assert (= (and d!68641 (not c!49520)) b!313545))

(assert (= (and b!313545 res!169725) b!313551))

(assert (= (and b!313551 (not res!169724)) b!313547))

(assert (= (and b!313547 (not res!169723)) b!313548))

(declare-fun m!323625 () Bool)

(assert (=> b!313551 m!323625))

(assert (=> b!313548 m!323625))

(assert (=> d!68641 m!323513))

(declare-fun m!323627 () Bool)

(assert (=> d!68641 m!323627))

(assert (=> d!68641 m!323501))

(assert (=> b!313550 m!323513))

(declare-fun m!323629 () Bool)

(assert (=> b!313550 m!323629))

(assert (=> b!313550 m!323629))

(declare-fun m!323631 () Bool)

(assert (=> b!313550 m!323631))

(assert (=> b!313547 m!323625))

(assert (=> b!313402 d!68641))

(declare-fun d!68643 () Bool)

(declare-fun lt!153646 () (_ BitVec 32))

(declare-fun lt!153645 () (_ BitVec 32))

(assert (=> d!68643 (= lt!153646 (bvmul (bvxor lt!153645 (bvlshr lt!153645 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68643 (= lt!153645 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68643 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169726 (let ((h!5264 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31250 (bvmul (bvxor h!5264 (bvlshr h!5264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31250 (bvlshr x!31250 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169726 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169726 #b00000000000000000000000000000000))))))

(assert (=> d!68643 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153646 (bvlshr lt!153646 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313402 d!68643))

(declare-fun d!68645 () Bool)

(assert (=> d!68645 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31182 d!68645))

(declare-fun d!68649 () Bool)

(assert (=> d!68649 (= (array_inv!5532 a!3293) (bvsge (size!7934 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31182 d!68649))

(declare-fun b!313660 () Bool)

(declare-fun c!49561 () Bool)

(declare-fun lt!153689 () (_ BitVec 64))

(assert (=> b!313660 (= c!49561 (= lt!153689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195462 () SeekEntryResult!2687)

(declare-fun e!195464 () SeekEntryResult!2687)

(assert (=> b!313660 (= e!195462 e!195464)))

(declare-fun b!313661 () Bool)

(declare-fun lt!153687 () SeekEntryResult!2687)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2687)

(assert (=> b!313661 (= e!195464 (seekKeyOrZeroReturnVacant!0 (x!31245 lt!153687) (index!12926 lt!153687) (index!12926 lt!153687) k0!2441 a!3293 mask!3709))))

(declare-fun b!313662 () Bool)

(declare-fun e!195463 () SeekEntryResult!2687)

(assert (=> b!313662 (= e!195463 Undefined!2687)))

(declare-fun b!313663 () Bool)

(assert (=> b!313663 (= e!195463 e!195462)))

(assert (=> b!313663 (= lt!153689 (select (arr!7582 a!3293) (index!12926 lt!153687)))))

(declare-fun c!49562 () Bool)

(assert (=> b!313663 (= c!49562 (= lt!153689 k0!2441))))

(declare-fun b!313664 () Bool)

(assert (=> b!313664 (= e!195462 (Found!2687 (index!12926 lt!153687)))))

(declare-fun b!313665 () Bool)

(assert (=> b!313665 (= e!195464 (MissingZero!2687 (index!12926 lt!153687)))))

(declare-fun d!68651 () Bool)

(declare-fun lt!153688 () SeekEntryResult!2687)

(assert (=> d!68651 (and (or ((_ is Undefined!2687) lt!153688) (not ((_ is Found!2687) lt!153688)) (and (bvsge (index!12925 lt!153688) #b00000000000000000000000000000000) (bvslt (index!12925 lt!153688) (size!7934 a!3293)))) (or ((_ is Undefined!2687) lt!153688) ((_ is Found!2687) lt!153688) (not ((_ is MissingZero!2687) lt!153688)) (and (bvsge (index!12924 lt!153688) #b00000000000000000000000000000000) (bvslt (index!12924 lt!153688) (size!7934 a!3293)))) (or ((_ is Undefined!2687) lt!153688) ((_ is Found!2687) lt!153688) ((_ is MissingZero!2687) lt!153688) (not ((_ is MissingVacant!2687) lt!153688)) (and (bvsge (index!12927 lt!153688) #b00000000000000000000000000000000) (bvslt (index!12927 lt!153688) (size!7934 a!3293)))) (or ((_ is Undefined!2687) lt!153688) (ite ((_ is Found!2687) lt!153688) (= (select (arr!7582 a!3293) (index!12925 lt!153688)) k0!2441) (ite ((_ is MissingZero!2687) lt!153688) (= (select (arr!7582 a!3293) (index!12924 lt!153688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2687) lt!153688) (= (select (arr!7582 a!3293) (index!12927 lt!153688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68651 (= lt!153688 e!195463)))

(declare-fun c!49560 () Bool)

(assert (=> d!68651 (= c!49560 (and ((_ is Intermediate!2687) lt!153687) (undefined!3499 lt!153687)))))

(assert (=> d!68651 (= lt!153687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68651 (validMask!0 mask!3709)))

(assert (=> d!68651 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153688)))

(assert (= (and d!68651 c!49560) b!313662))

(assert (= (and d!68651 (not c!49560)) b!313663))

(assert (= (and b!313663 c!49562) b!313664))

(assert (= (and b!313663 (not c!49562)) b!313660))

(assert (= (and b!313660 c!49561) b!313665))

(assert (= (and b!313660 (not c!49561)) b!313661))

(declare-fun m!323677 () Bool)

(assert (=> b!313661 m!323677))

(declare-fun m!323679 () Bool)

(assert (=> b!313663 m!323679))

(assert (=> d!68651 m!323501))

(assert (=> d!68651 m!323513))

(assert (=> d!68651 m!323515))

(declare-fun m!323681 () Bool)

(assert (=> d!68651 m!323681))

(assert (=> d!68651 m!323513))

(declare-fun m!323683 () Bool)

(assert (=> d!68651 m!323683))

(declare-fun m!323685 () Bool)

(assert (=> d!68651 m!323685))

(assert (=> b!313398 d!68651))

(declare-fun d!68671 () Bool)

(assert (=> d!68671 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313403 d!68671))

(check-sat (not b!313550) (not d!68623) (not b!313541) (not b!313524) (not d!68637) (not b!313661) (not bm!25931) (not b!313475) (not d!68641) (not d!68651) (not b!313464) (not d!68635) (not b!313473))
(check-sat)
