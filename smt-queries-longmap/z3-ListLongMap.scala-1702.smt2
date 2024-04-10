; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31198 () Bool)

(assert start!31198)

(declare-fun b!313476 () Bool)

(declare-fun res!169648 () Bool)

(declare-fun e!195355 () Bool)

(assert (=> b!313476 (=> (not res!169648) (not e!195355))))

(declare-datatypes ((array!16010 0))(
  ( (array!16011 (arr!7584 (Array (_ BitVec 32) (_ BitVec 64))) (size!7936 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16010)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313476 (= res!169648 (and (= (size!7936 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7936 a!3293))))))

(declare-fun b!313477 () Bool)

(declare-fun res!169651 () Bool)

(assert (=> b!313477 (=> (not res!169651) (not e!195355))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313477 (= res!169651 (validKeyInArray!0 k0!2441))))

(declare-fun b!313478 () Bool)

(declare-fun res!169652 () Bool)

(assert (=> b!313478 (=> (not res!169652) (not e!195355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16010 (_ BitVec 32)) Bool)

(assert (=> b!313478 (= res!169652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313479 () Bool)

(declare-fun e!195357 () Bool)

(assert (=> b!313479 (= e!195355 e!195357)))

(declare-fun res!169650 () Bool)

(assert (=> b!313479 (=> (not res!169650) (not e!195357))))

(declare-datatypes ((SeekEntryResult!2724 0))(
  ( (MissingZero!2724 (index!13072 (_ BitVec 32))) (Found!2724 (index!13073 (_ BitVec 32))) (Intermediate!2724 (undefined!3536 Bool) (index!13074 (_ BitVec 32)) (x!31285 (_ BitVec 32))) (Undefined!2724) (MissingVacant!2724 (index!13075 (_ BitVec 32))) )
))
(declare-fun lt!153572 () SeekEntryResult!2724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16010 (_ BitVec 32)) SeekEntryResult!2724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313479 (= res!169650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153572))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313479 (= lt!153572 (Intermediate!2724 false resIndex!52 resX!52))))

(declare-fun res!169655 () Bool)

(assert (=> start!31198 (=> (not res!169655) (not e!195355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31198 (= res!169655 (validMask!0 mask!3709))))

(assert (=> start!31198 e!195355))

(declare-fun array_inv!5547 (array!16010) Bool)

(assert (=> start!31198 (array_inv!5547 a!3293)))

(assert (=> start!31198 true))

(declare-fun b!313480 () Bool)

(declare-fun e!195356 () Bool)

(assert (=> b!313480 (= e!195357 e!195356)))

(declare-fun res!169656 () Bool)

(assert (=> b!313480 (=> (not res!169656) (not e!195356))))

(declare-fun lt!153573 () SeekEntryResult!2724)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313480 (= res!169656 (and (= lt!153573 lt!153572) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7584 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7584 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7584 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313480 (= lt!153573 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!313481 () Bool)

(declare-fun lt!153571 () SeekEntryResult!2724)

(get-info :version)

(assert (=> b!313481 (= e!195356 (not (or (not ((_ is Intermediate!2724) lt!153571)) (bvsge (x!31285 lt!153571) (bvadd #b00000000000000000000000000000001 x!1427)))))))

(assert (=> b!313481 (= lt!153573 lt!153571)))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313481 (= lt!153571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313482 () Bool)

(declare-fun res!169653 () Bool)

(assert (=> b!313482 (=> (not res!169653) (not e!195355))))

(declare-fun arrayContainsKey!0 (array!16010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313482 (= res!169653 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313483 () Bool)

(declare-fun res!169649 () Bool)

(assert (=> b!313483 (=> (not res!169649) (not e!195355))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16010 (_ BitVec 32)) SeekEntryResult!2724)

(assert (=> b!313483 (= res!169649 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2724 i!1240)))))

(declare-fun b!313484 () Bool)

(declare-fun res!169654 () Bool)

(assert (=> b!313484 (=> (not res!169654) (not e!195357))))

(assert (=> b!313484 (= res!169654 (and (= (select (arr!7584 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7936 a!3293))))))

(assert (= (and start!31198 res!169655) b!313476))

(assert (= (and b!313476 res!169648) b!313477))

(assert (= (and b!313477 res!169651) b!313482))

(assert (= (and b!313482 res!169653) b!313483))

(assert (= (and b!313483 res!169649) b!313478))

(assert (= (and b!313478 res!169652) b!313479))

(assert (= (and b!313479 res!169650) b!313484))

(assert (= (and b!313484 res!169654) b!313480))

(assert (= (and b!313480 res!169656) b!313481))

(declare-fun m!323383 () Bool)

(assert (=> b!313483 m!323383))

(declare-fun m!323385 () Bool)

(assert (=> b!313479 m!323385))

(assert (=> b!313479 m!323385))

(declare-fun m!323387 () Bool)

(assert (=> b!313479 m!323387))

(declare-fun m!323389 () Bool)

(assert (=> b!313482 m!323389))

(declare-fun m!323391 () Bool)

(assert (=> start!31198 m!323391))

(declare-fun m!323393 () Bool)

(assert (=> start!31198 m!323393))

(declare-fun m!323395 () Bool)

(assert (=> b!313478 m!323395))

(declare-fun m!323397 () Bool)

(assert (=> b!313477 m!323397))

(declare-fun m!323399 () Bool)

(assert (=> b!313481 m!323399))

(assert (=> b!313481 m!323399))

(declare-fun m!323401 () Bool)

(assert (=> b!313481 m!323401))

(declare-fun m!323403 () Bool)

(assert (=> b!313484 m!323403))

(declare-fun m!323405 () Bool)

(assert (=> b!313480 m!323405))

(declare-fun m!323407 () Bool)

(assert (=> b!313480 m!323407))

(check-sat (not b!313480) (not b!313479) (not b!313483) (not b!313477) (not start!31198) (not b!313478) (not b!313482) (not b!313481))
(check-sat)
(get-model)

(declare-fun b!313524 () Bool)

(declare-fun e!195377 () SeekEntryResult!2724)

(declare-fun lt!153590 () SeekEntryResult!2724)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16010 (_ BitVec 32)) SeekEntryResult!2724)

(assert (=> b!313524 (= e!195377 (seekKeyOrZeroReturnVacant!0 (x!31285 lt!153590) (index!13074 lt!153590) (index!13074 lt!153590) k0!2441 a!3293 mask!3709))))

(declare-fun d!68591 () Bool)

(declare-fun lt!153589 () SeekEntryResult!2724)

(assert (=> d!68591 (and (or ((_ is Undefined!2724) lt!153589) (not ((_ is Found!2724) lt!153589)) (and (bvsge (index!13073 lt!153589) #b00000000000000000000000000000000) (bvslt (index!13073 lt!153589) (size!7936 a!3293)))) (or ((_ is Undefined!2724) lt!153589) ((_ is Found!2724) lt!153589) (not ((_ is MissingZero!2724) lt!153589)) (and (bvsge (index!13072 lt!153589) #b00000000000000000000000000000000) (bvslt (index!13072 lt!153589) (size!7936 a!3293)))) (or ((_ is Undefined!2724) lt!153589) ((_ is Found!2724) lt!153589) ((_ is MissingZero!2724) lt!153589) (not ((_ is MissingVacant!2724) lt!153589)) (and (bvsge (index!13075 lt!153589) #b00000000000000000000000000000000) (bvslt (index!13075 lt!153589) (size!7936 a!3293)))) (or ((_ is Undefined!2724) lt!153589) (ite ((_ is Found!2724) lt!153589) (= (select (arr!7584 a!3293) (index!13073 lt!153589)) k0!2441) (ite ((_ is MissingZero!2724) lt!153589) (= (select (arr!7584 a!3293) (index!13072 lt!153589)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2724) lt!153589) (= (select (arr!7584 a!3293) (index!13075 lt!153589)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195379 () SeekEntryResult!2724)

(assert (=> d!68591 (= lt!153589 e!195379)))

(declare-fun c!49530 () Bool)

(assert (=> d!68591 (= c!49530 (and ((_ is Intermediate!2724) lt!153590) (undefined!3536 lt!153590)))))

(assert (=> d!68591 (= lt!153590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68591 (validMask!0 mask!3709)))

(assert (=> d!68591 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153589)))

(declare-fun b!313525 () Bool)

(declare-fun e!195378 () SeekEntryResult!2724)

(assert (=> b!313525 (= e!195378 (Found!2724 (index!13074 lt!153590)))))

(declare-fun b!313526 () Bool)

(assert (=> b!313526 (= e!195379 Undefined!2724)))

(declare-fun b!313527 () Bool)

(assert (=> b!313527 (= e!195377 (MissingZero!2724 (index!13074 lt!153590)))))

(declare-fun b!313528 () Bool)

(assert (=> b!313528 (= e!195379 e!195378)))

(declare-fun lt!153591 () (_ BitVec 64))

(assert (=> b!313528 (= lt!153591 (select (arr!7584 a!3293) (index!13074 lt!153590)))))

(declare-fun c!49528 () Bool)

(assert (=> b!313528 (= c!49528 (= lt!153591 k0!2441))))

(declare-fun b!313529 () Bool)

(declare-fun c!49529 () Bool)

(assert (=> b!313529 (= c!49529 (= lt!153591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313529 (= e!195378 e!195377)))

(assert (= (and d!68591 c!49530) b!313526))

(assert (= (and d!68591 (not c!49530)) b!313528))

(assert (= (and b!313528 c!49528) b!313525))

(assert (= (and b!313528 (not c!49528)) b!313529))

(assert (= (and b!313529 c!49529) b!313527))

(assert (= (and b!313529 (not c!49529)) b!313524))

(declare-fun m!323435 () Bool)

(assert (=> b!313524 m!323435))

(assert (=> d!68591 m!323391))

(assert (=> d!68591 m!323385))

(assert (=> d!68591 m!323387))

(declare-fun m!323437 () Bool)

(assert (=> d!68591 m!323437))

(declare-fun m!323439 () Bool)

(assert (=> d!68591 m!323439))

(assert (=> d!68591 m!323385))

(declare-fun m!323441 () Bool)

(assert (=> d!68591 m!323441))

(declare-fun m!323443 () Bool)

(assert (=> b!313528 m!323443))

(assert (=> b!313483 d!68591))

(declare-fun d!68595 () Bool)

(declare-fun res!169688 () Bool)

(declare-fun e!195384 () Bool)

(assert (=> d!68595 (=> res!169688 e!195384)))

(assert (=> d!68595 (= res!169688 (= (select (arr!7584 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68595 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195384)))

(declare-fun b!313534 () Bool)

(declare-fun e!195385 () Bool)

(assert (=> b!313534 (= e!195384 e!195385)))

(declare-fun res!169689 () Bool)

(assert (=> b!313534 (=> (not res!169689) (not e!195385))))

(assert (=> b!313534 (= res!169689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7936 a!3293)))))

(declare-fun b!313535 () Bool)

(assert (=> b!313535 (= e!195385 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68595 (not res!169688)) b!313534))

(assert (= (and b!313534 res!169689) b!313535))

(declare-fun m!323445 () Bool)

(assert (=> d!68595 m!323445))

(declare-fun m!323447 () Bool)

(assert (=> b!313535 m!323447))

(assert (=> b!313482 d!68595))

(declare-fun d!68597 () Bool)

(assert (=> d!68597 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313477 d!68597))

(declare-fun b!313587 () Bool)

(declare-fun e!195418 () Bool)

(declare-fun lt!153602 () SeekEntryResult!2724)

(assert (=> b!313587 (= e!195418 (bvsge (x!31285 lt!153602) #b01111111111111111111111111111110))))

(declare-fun b!313588 () Bool)

(assert (=> b!313588 (and (bvsge (index!13074 lt!153602) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153602) (size!7936 a!3293)))))

(declare-fun res!169712 () Bool)

(assert (=> b!313588 (= res!169712 (= (select (arr!7584 a!3293) (index!13074 lt!153602)) k0!2441))))

(declare-fun e!195417 () Bool)

(assert (=> b!313588 (=> res!169712 e!195417)))

(declare-fun e!195421 () Bool)

(assert (=> b!313588 (= e!195421 e!195417)))

(declare-fun b!313589 () Bool)

(declare-fun e!195420 () SeekEntryResult!2724)

(assert (=> b!313589 (= e!195420 (Intermediate!2724 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313590 () Bool)

(declare-fun e!195419 () SeekEntryResult!2724)

(assert (=> b!313590 (= e!195419 (Intermediate!2724 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313591 () Bool)

(assert (=> b!313591 (= e!195419 e!195420)))

(declare-fun c!49548 () Bool)

(declare-fun lt!153603 () (_ BitVec 64))

(assert (=> b!313591 (= c!49548 (or (= lt!153603 k0!2441) (= (bvadd lt!153603 lt!153603) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313592 () Bool)

(assert (=> b!313592 (and (bvsge (index!13074 lt!153602) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153602) (size!7936 a!3293)))))

(declare-fun res!169713 () Bool)

(assert (=> b!313592 (= res!169713 (= (select (arr!7584 a!3293) (index!13074 lt!153602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313592 (=> res!169713 e!195417)))

(declare-fun b!313593 () Bool)

(assert (=> b!313593 (and (bvsge (index!13074 lt!153602) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153602) (size!7936 a!3293)))))

(assert (=> b!313593 (= e!195417 (= (select (arr!7584 a!3293) (index!13074 lt!153602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68599 () Bool)

(assert (=> d!68599 e!195418))

(declare-fun c!49546 () Bool)

(assert (=> d!68599 (= c!49546 (and ((_ is Intermediate!2724) lt!153602) (undefined!3536 lt!153602)))))

(assert (=> d!68599 (= lt!153602 e!195419)))

(declare-fun c!49547 () Bool)

(assert (=> d!68599 (= c!49547 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68599 (= lt!153603 (select (arr!7584 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68599 (validMask!0 mask!3709)))

(assert (=> d!68599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153602)))

(declare-fun b!313594 () Bool)

(assert (=> b!313594 (= e!195420 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313595 () Bool)

(assert (=> b!313595 (= e!195418 e!195421)))

(declare-fun res!169711 () Bool)

(assert (=> b!313595 (= res!169711 (and ((_ is Intermediate!2724) lt!153602) (not (undefined!3536 lt!153602)) (bvslt (x!31285 lt!153602) #b01111111111111111111111111111110) (bvsge (x!31285 lt!153602) #b00000000000000000000000000000000) (bvsge (x!31285 lt!153602) #b00000000000000000000000000000000)))))

(assert (=> b!313595 (=> (not res!169711) (not e!195421))))

(assert (= (and d!68599 c!49547) b!313590))

(assert (= (and d!68599 (not c!49547)) b!313591))

(assert (= (and b!313591 c!49548) b!313589))

(assert (= (and b!313591 (not c!49548)) b!313594))

(assert (= (and d!68599 c!49546) b!313587))

(assert (= (and d!68599 (not c!49546)) b!313595))

(assert (= (and b!313595 res!169711) b!313588))

(assert (= (and b!313588 (not res!169712)) b!313592))

(assert (= (and b!313592 (not res!169713)) b!313593))

(assert (=> d!68599 m!323385))

(declare-fun m!323457 () Bool)

(assert (=> d!68599 m!323457))

(assert (=> d!68599 m!323391))

(assert (=> b!313594 m!323385))

(declare-fun m!323459 () Bool)

(assert (=> b!313594 m!323459))

(assert (=> b!313594 m!323459))

(declare-fun m!323461 () Bool)

(assert (=> b!313594 m!323461))

(declare-fun m!323463 () Bool)

(assert (=> b!313593 m!323463))

(assert (=> b!313592 m!323463))

(assert (=> b!313588 m!323463))

(assert (=> b!313479 d!68599))

(declare-fun d!68609 () Bool)

(declare-fun lt!153609 () (_ BitVec 32))

(declare-fun lt!153608 () (_ BitVec 32))

(assert (=> d!68609 (= lt!153609 (bvmul (bvxor lt!153608 (bvlshr lt!153608 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68609 (= lt!153608 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68609 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169714 (let ((h!5352 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31289 (bvmul (bvxor h!5352 (bvlshr h!5352 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31289 (bvlshr x!31289 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169714 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169714 #b00000000000000000000000000000000))))))

(assert (=> d!68609 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153609 (bvlshr lt!153609 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313479 d!68609))

(declare-fun d!68613 () Bool)

(declare-fun res!169723 () Bool)

(declare-fun e!195441 () Bool)

(assert (=> d!68613 (=> res!169723 e!195441)))

(assert (=> d!68613 (= res!169723 (bvsge #b00000000000000000000000000000000 (size!7936 a!3293)))))

(assert (=> d!68613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195441)))

(declare-fun b!313624 () Bool)

(declare-fun e!195440 () Bool)

(declare-fun e!195442 () Bool)

(assert (=> b!313624 (= e!195440 e!195442)))

(declare-fun lt!153628 () (_ BitVec 64))

(assert (=> b!313624 (= lt!153628 (select (arr!7584 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9677 0))(
  ( (Unit!9678) )
))
(declare-fun lt!153630 () Unit!9677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16010 (_ BitVec 64) (_ BitVec 32)) Unit!9677)

(assert (=> b!313624 (= lt!153630 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153628 #b00000000000000000000000000000000))))

(assert (=> b!313624 (arrayContainsKey!0 a!3293 lt!153628 #b00000000000000000000000000000000)))

(declare-fun lt!153629 () Unit!9677)

(assert (=> b!313624 (= lt!153629 lt!153630)))

(declare-fun res!169724 () Bool)

(assert (=> b!313624 (= res!169724 (= (seekEntryOrOpen!0 (select (arr!7584 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2724 #b00000000000000000000000000000000)))))

(assert (=> b!313624 (=> (not res!169724) (not e!195442))))

(declare-fun bm!25947 () Bool)

(declare-fun call!25950 () Bool)

(assert (=> bm!25947 (= call!25950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313625 () Bool)

(assert (=> b!313625 (= e!195440 call!25950)))

(declare-fun b!313626 () Bool)

(assert (=> b!313626 (= e!195441 e!195440)))

(declare-fun c!49559 () Bool)

(assert (=> b!313626 (= c!49559 (validKeyInArray!0 (select (arr!7584 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313627 () Bool)

(assert (=> b!313627 (= e!195442 call!25950)))

(assert (= (and d!68613 (not res!169723)) b!313626))

(assert (= (and b!313626 c!49559) b!313624))

(assert (= (and b!313626 (not c!49559)) b!313625))

(assert (= (and b!313624 res!169724) b!313627))

(assert (= (or b!313627 b!313625) bm!25947))

(assert (=> b!313624 m!323445))

(declare-fun m!323465 () Bool)

(assert (=> b!313624 m!323465))

(declare-fun m!323467 () Bool)

(assert (=> b!313624 m!323467))

(assert (=> b!313624 m!323445))

(declare-fun m!323469 () Bool)

(assert (=> b!313624 m!323469))

(declare-fun m!323471 () Bool)

(assert (=> bm!25947 m!323471))

(assert (=> b!313626 m!323445))

(assert (=> b!313626 m!323445))

(declare-fun m!323473 () Bool)

(assert (=> b!313626 m!323473))

(assert (=> b!313478 d!68613))

(declare-fun d!68615 () Bool)

(assert (=> d!68615 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31198 d!68615))

(declare-fun d!68623 () Bool)

(assert (=> d!68623 (= (array_inv!5547 a!3293) (bvsge (size!7936 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31198 d!68623))

(declare-fun b!313659 () Bool)

(declare-fun e!195464 () Bool)

(declare-fun lt!153648 () SeekEntryResult!2724)

(assert (=> b!313659 (= e!195464 (bvsge (x!31285 lt!153648) #b01111111111111111111111111111110))))

(declare-fun b!313660 () Bool)

(assert (=> b!313660 (and (bvsge (index!13074 lt!153648) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153648) (size!7936 a!3293)))))

(declare-fun res!169737 () Bool)

(assert (=> b!313660 (= res!169737 (= (select (arr!7584 a!3293) (index!13074 lt!153648)) k0!2441))))

(declare-fun e!195463 () Bool)

(assert (=> b!313660 (=> res!169737 e!195463)))

(declare-fun e!195467 () Bool)

(assert (=> b!313660 (= e!195467 e!195463)))

(declare-fun b!313661 () Bool)

(declare-fun e!195466 () SeekEntryResult!2724)

(assert (=> b!313661 (= e!195466 (Intermediate!2724 false index!1781 x!1427))))

(declare-fun b!313662 () Bool)

(declare-fun e!195465 () SeekEntryResult!2724)

(assert (=> b!313662 (= e!195465 (Intermediate!2724 true index!1781 x!1427))))

(declare-fun b!313663 () Bool)

(assert (=> b!313663 (= e!195465 e!195466)))

(declare-fun c!49572 () Bool)

(declare-fun lt!153649 () (_ BitVec 64))

(assert (=> b!313663 (= c!49572 (or (= lt!153649 k0!2441) (= (bvadd lt!153649 lt!153649) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313664 () Bool)

(assert (=> b!313664 (and (bvsge (index!13074 lt!153648) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153648) (size!7936 a!3293)))))

(declare-fun res!169738 () Bool)

(assert (=> b!313664 (= res!169738 (= (select (arr!7584 a!3293) (index!13074 lt!153648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313664 (=> res!169738 e!195463)))

(declare-fun b!313665 () Bool)

(assert (=> b!313665 (and (bvsge (index!13074 lt!153648) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153648) (size!7936 a!3293)))))

(assert (=> b!313665 (= e!195463 (= (select (arr!7584 a!3293) (index!13074 lt!153648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68625 () Bool)

(assert (=> d!68625 e!195464))

(declare-fun c!49570 () Bool)

(assert (=> d!68625 (= c!49570 (and ((_ is Intermediate!2724) lt!153648) (undefined!3536 lt!153648)))))

(assert (=> d!68625 (= lt!153648 e!195465)))

(declare-fun c!49571 () Bool)

(assert (=> d!68625 (= c!49571 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68625 (= lt!153649 (select (arr!7584 a!3293) index!1781))))

(assert (=> d!68625 (validMask!0 mask!3709)))

(assert (=> d!68625 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153648)))

(declare-fun b!313666 () Bool)

(assert (=> b!313666 (= e!195466 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313667 () Bool)

(assert (=> b!313667 (= e!195464 e!195467)))

(declare-fun res!169736 () Bool)

(assert (=> b!313667 (= res!169736 (and ((_ is Intermediate!2724) lt!153648) (not (undefined!3536 lt!153648)) (bvslt (x!31285 lt!153648) #b01111111111111111111111111111110) (bvsge (x!31285 lt!153648) #b00000000000000000000000000000000) (bvsge (x!31285 lt!153648) x!1427)))))

(assert (=> b!313667 (=> (not res!169736) (not e!195467))))

(assert (= (and d!68625 c!49571) b!313662))

(assert (= (and d!68625 (not c!49571)) b!313663))

(assert (= (and b!313663 c!49572) b!313661))

(assert (= (and b!313663 (not c!49572)) b!313666))

(assert (= (and d!68625 c!49570) b!313659))

(assert (= (and d!68625 (not c!49570)) b!313667))

(assert (= (and b!313667 res!169736) b!313660))

(assert (= (and b!313660 (not res!169737)) b!313664))

(assert (= (and b!313664 (not res!169738)) b!313665))

(assert (=> d!68625 m!323405))

(assert (=> d!68625 m!323391))

(assert (=> b!313666 m!323399))

(assert (=> b!313666 m!323399))

(declare-fun m!323515 () Bool)

(assert (=> b!313666 m!323515))

(declare-fun m!323517 () Bool)

(assert (=> b!313665 m!323517))

(assert (=> b!313664 m!323517))

(assert (=> b!313660 m!323517))

(assert (=> b!313480 d!68625))

(declare-fun b!313668 () Bool)

(declare-fun e!195469 () Bool)

(declare-fun lt!153650 () SeekEntryResult!2724)

(assert (=> b!313668 (= e!195469 (bvsge (x!31285 lt!153650) #b01111111111111111111111111111110))))

(declare-fun b!313669 () Bool)

(assert (=> b!313669 (and (bvsge (index!13074 lt!153650) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153650) (size!7936 a!3293)))))

(declare-fun res!169741 () Bool)

(assert (=> b!313669 (= res!169741 (= (select (arr!7584 a!3293) (index!13074 lt!153650)) k0!2441))))

(declare-fun e!195468 () Bool)

(assert (=> b!313669 (=> res!169741 e!195468)))

(declare-fun e!195472 () Bool)

(assert (=> b!313669 (= e!195472 e!195468)))

(declare-fun e!195471 () SeekEntryResult!2724)

(declare-fun b!313670 () Bool)

(assert (=> b!313670 (= e!195471 (Intermediate!2724 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313671 () Bool)

(declare-fun e!195470 () SeekEntryResult!2724)

(assert (=> b!313671 (= e!195470 (Intermediate!2724 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313672 () Bool)

(assert (=> b!313672 (= e!195470 e!195471)))

(declare-fun c!49575 () Bool)

(declare-fun lt!153651 () (_ BitVec 64))

(assert (=> b!313672 (= c!49575 (or (= lt!153651 k0!2441) (= (bvadd lt!153651 lt!153651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313673 () Bool)

(assert (=> b!313673 (and (bvsge (index!13074 lt!153650) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153650) (size!7936 a!3293)))))

(declare-fun res!169742 () Bool)

(assert (=> b!313673 (= res!169742 (= (select (arr!7584 a!3293) (index!13074 lt!153650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313673 (=> res!169742 e!195468)))

(declare-fun b!313674 () Bool)

(assert (=> b!313674 (and (bvsge (index!13074 lt!153650) #b00000000000000000000000000000000) (bvslt (index!13074 lt!153650) (size!7936 a!3293)))))

(assert (=> b!313674 (= e!195468 (= (select (arr!7584 a!3293) (index!13074 lt!153650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68629 () Bool)

(assert (=> d!68629 e!195469))

(declare-fun c!49573 () Bool)

(assert (=> d!68629 (= c!49573 (and ((_ is Intermediate!2724) lt!153650) (undefined!3536 lt!153650)))))

(assert (=> d!68629 (= lt!153650 e!195470)))

(declare-fun c!49574 () Bool)

(assert (=> d!68629 (= c!49574 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68629 (= lt!153651 (select (arr!7584 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68629 (validMask!0 mask!3709)))

(assert (=> d!68629 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!153650)))

(declare-fun b!313675 () Bool)

(assert (=> b!313675 (= e!195471 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313676 () Bool)

(assert (=> b!313676 (= e!195469 e!195472)))

(declare-fun res!169740 () Bool)

(assert (=> b!313676 (= res!169740 (and ((_ is Intermediate!2724) lt!153650) (not (undefined!3536 lt!153650)) (bvslt (x!31285 lt!153650) #b01111111111111111111111111111110) (bvsge (x!31285 lt!153650) #b00000000000000000000000000000000) (bvsge (x!31285 lt!153650) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!313676 (=> (not res!169740) (not e!195472))))

(assert (= (and d!68629 c!49574) b!313671))

(assert (= (and d!68629 (not c!49574)) b!313672))

(assert (= (and b!313672 c!49575) b!313670))

(assert (= (and b!313672 (not c!49575)) b!313675))

(assert (= (and d!68629 c!49573) b!313668))

(assert (= (and d!68629 (not c!49573)) b!313676))

(assert (= (and b!313676 res!169740) b!313669))

(assert (= (and b!313669 (not res!169741)) b!313673))

(assert (= (and b!313673 (not res!169742)) b!313674))

(assert (=> d!68629 m!323399))

(declare-fun m!323519 () Bool)

(assert (=> d!68629 m!323519))

(assert (=> d!68629 m!323391))

(assert (=> b!313675 m!323399))

(declare-fun m!323521 () Bool)

(assert (=> b!313675 m!323521))

(assert (=> b!313675 m!323521))

(declare-fun m!323523 () Bool)

(assert (=> b!313675 m!323523))

(declare-fun m!323525 () Bool)

(assert (=> b!313674 m!323525))

(assert (=> b!313673 m!323525))

(assert (=> b!313669 m!323525))

(assert (=> b!313481 d!68629))

(declare-fun d!68631 () Bool)

(declare-fun lt!153658 () (_ BitVec 32))

(assert (=> d!68631 (and (bvsge lt!153658 #b00000000000000000000000000000000) (bvslt lt!153658 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68631 (= lt!153658 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68631 (validMask!0 mask!3709)))

(assert (=> d!68631 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!153658)))

(declare-fun bs!10991 () Bool)

(assert (= bs!10991 d!68631))

(declare-fun m!323527 () Bool)

(assert (=> bs!10991 m!323527))

(assert (=> bs!10991 m!323391))

(assert (=> b!313481 d!68631))

(check-sat (not d!68591) (not b!313594) (not d!68625) (not d!68599) (not d!68631) (not b!313524) (not b!313535) (not bm!25947) (not b!313624) (not b!313666) (not d!68629) (not b!313675) (not b!313626))
(check-sat)
