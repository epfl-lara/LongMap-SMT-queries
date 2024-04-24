; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31848 () Bool)

(assert start!31848)

(declare-fun b!318519 () Bool)

(declare-fun res!173149 () Bool)

(declare-fun e!197901 () Bool)

(assert (=> b!318519 (=> (not res!173149) (not e!197901))))

(declare-datatypes ((array!16232 0))(
  ( (array!16233 (arr!7681 (Array (_ BitVec 32) (_ BitVec 64))) (size!8033 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16232)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16232 (_ BitVec 32)) Bool)

(assert (=> b!318519 (= res!173149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!197898 () Bool)

(declare-fun lt!155422 () (_ BitVec 32))

(declare-fun b!318520 () Bool)

(declare-fun lt!155424 () array!16232)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2786 0))(
  ( (MissingZero!2786 (index!13320 (_ BitVec 32))) (Found!2786 (index!13321 (_ BitVec 32))) (Intermediate!2786 (undefined!3598 Bool) (index!13322 (_ BitVec 32)) (x!31680 (_ BitVec 32))) (Undefined!2786) (MissingVacant!2786 (index!13323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16232 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!318520 (= e!197898 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155424 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155422 k0!2441 lt!155424 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318520 (= lt!155424 (array!16233 (store (arr!7681 a!3293) i!1240 k0!2441) (size!8033 a!3293)))))

(declare-fun b!318521 () Bool)

(declare-fun e!197899 () Bool)

(declare-fun e!197897 () Bool)

(assert (=> b!318521 (= e!197899 e!197897)))

(declare-fun res!173151 () Bool)

(assert (=> b!318521 (=> (not res!173151) (not e!197897))))

(declare-fun lt!155421 () SeekEntryResult!2786)

(declare-fun lt!155423 () SeekEntryResult!2786)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318521 (= res!173151 (and (= lt!155421 lt!155423) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7681 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318521 (= lt!155421 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318522 () Bool)

(assert (=> b!318522 (= e!197897 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (and (bvsge lt!155422 #b00000000000000000000000000000000) (bvslt lt!155422 (size!8033 a!3293))))))))

(assert (=> b!318522 e!197898))

(declare-fun res!173155 () Bool)

(assert (=> b!318522 (=> (not res!173155) (not e!197898))))

(assert (=> b!318522 (= res!173155 (= lt!155421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155422 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318522 (= lt!155422 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!318523 () Bool)

(declare-fun res!173154 () Bool)

(assert (=> b!318523 (=> (not res!173154) (not e!197901))))

(declare-fun arrayContainsKey!0 (array!16232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318523 (= res!173154 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318524 () Bool)

(declare-fun res!173148 () Bool)

(assert (=> b!318524 (=> (not res!173148) (not e!197901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318524 (= res!173148 (validKeyInArray!0 k0!2441))))

(declare-fun b!318525 () Bool)

(declare-fun res!173157 () Bool)

(assert (=> b!318525 (=> (not res!173157) (not e!197899))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318525 (= res!173157 (and (= (select (arr!7681 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8033 a!3293))))))

(declare-fun b!318526 () Bool)

(declare-fun res!173150 () Bool)

(assert (=> b!318526 (=> (not res!173150) (not e!197901))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16232 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!318526 (= res!173150 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2786 i!1240)))))

(declare-fun res!173156 () Bool)

(assert (=> start!31848 (=> (not res!173156) (not e!197901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31848 (= res!173156 (validMask!0 mask!3709))))

(assert (=> start!31848 e!197901))

(declare-fun array_inv!5631 (array!16232) Bool)

(assert (=> start!31848 (array_inv!5631 a!3293)))

(assert (=> start!31848 true))

(declare-fun b!318527 () Bool)

(declare-fun res!173153 () Bool)

(assert (=> b!318527 (=> (not res!173153) (not e!197901))))

(assert (=> b!318527 (= res!173153 (and (= (size!8033 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8033 a!3293))))))

(declare-fun b!318528 () Bool)

(assert (=> b!318528 (= e!197901 e!197899)))

(declare-fun res!173152 () Bool)

(assert (=> b!318528 (=> (not res!173152) (not e!197899))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318528 (= res!173152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155423))))

(assert (=> b!318528 (= lt!155423 (Intermediate!2786 false resIndex!52 resX!52))))

(assert (= (and start!31848 res!173156) b!318527))

(assert (= (and b!318527 res!173153) b!318524))

(assert (= (and b!318524 res!173148) b!318523))

(assert (= (and b!318523 res!173154) b!318526))

(assert (= (and b!318526 res!173150) b!318519))

(assert (= (and b!318519 res!173149) b!318528))

(assert (= (and b!318528 res!173152) b!318525))

(assert (= (and b!318525 res!173157) b!318521))

(assert (= (and b!318521 res!173151) b!318522))

(assert (= (and b!318522 res!173155) b!318520))

(declare-fun m!327451 () Bool)

(assert (=> b!318526 m!327451))

(declare-fun m!327453 () Bool)

(assert (=> b!318522 m!327453))

(declare-fun m!327455 () Bool)

(assert (=> b!318522 m!327455))

(declare-fun m!327457 () Bool)

(assert (=> b!318524 m!327457))

(declare-fun m!327459 () Bool)

(assert (=> b!318528 m!327459))

(assert (=> b!318528 m!327459))

(declare-fun m!327461 () Bool)

(assert (=> b!318528 m!327461))

(declare-fun m!327463 () Bool)

(assert (=> b!318523 m!327463))

(declare-fun m!327465 () Bool)

(assert (=> b!318521 m!327465))

(declare-fun m!327467 () Bool)

(assert (=> b!318521 m!327467))

(declare-fun m!327469 () Bool)

(assert (=> start!31848 m!327469))

(declare-fun m!327471 () Bool)

(assert (=> start!31848 m!327471))

(declare-fun m!327473 () Bool)

(assert (=> b!318525 m!327473))

(declare-fun m!327475 () Bool)

(assert (=> b!318519 m!327475))

(declare-fun m!327477 () Bool)

(assert (=> b!318520 m!327477))

(declare-fun m!327479 () Bool)

(assert (=> b!318520 m!327479))

(declare-fun m!327481 () Bool)

(assert (=> b!318520 m!327481))

(check-sat (not b!318526) (not b!318519) (not b!318521) (not b!318522) (not b!318520) (not start!31848) (not b!318524) (not b!318528) (not b!318523))
(check-sat)
(get-model)

(declare-fun d!69255 () Bool)

(declare-fun e!197943 () Bool)

(assert (=> d!69255 e!197943))

(declare-fun c!50314 () Bool)

(declare-fun lt!155453 () SeekEntryResult!2786)

(get-info :version)

(assert (=> d!69255 (= c!50314 (and ((_ is Intermediate!2786) lt!155453) (undefined!3598 lt!155453)))))

(declare-fun e!197942 () SeekEntryResult!2786)

(assert (=> d!69255 (= lt!155453 e!197942)))

(declare-fun c!50315 () Bool)

(assert (=> d!69255 (= c!50315 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!155454 () (_ BitVec 64))

(assert (=> d!69255 (= lt!155454 (select (arr!7681 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!69255 (validMask!0 mask!3709)))

(assert (=> d!69255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155453)))

(declare-fun b!318607 () Bool)

(assert (=> b!318607 (and (bvsge (index!13322 lt!155453) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155453) (size!8033 a!3293)))))

(declare-fun res!173225 () Bool)

(assert (=> b!318607 (= res!173225 (= (select (arr!7681 a!3293) (index!13322 lt!155453)) k0!2441))))

(declare-fun e!197944 () Bool)

(assert (=> b!318607 (=> res!173225 e!197944)))

(declare-fun e!197946 () Bool)

(assert (=> b!318607 (= e!197946 e!197944)))

(declare-fun b!318608 () Bool)

(assert (=> b!318608 (and (bvsge (index!13322 lt!155453) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155453) (size!8033 a!3293)))))

(declare-fun res!173226 () Bool)

(assert (=> b!318608 (= res!173226 (= (select (arr!7681 a!3293) (index!13322 lt!155453)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318608 (=> res!173226 e!197944)))

(declare-fun b!318609 () Bool)

(assert (=> b!318609 (and (bvsge (index!13322 lt!155453) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155453) (size!8033 a!3293)))))

(assert (=> b!318609 (= e!197944 (= (select (arr!7681 a!3293) (index!13322 lt!155453)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318610 () Bool)

(assert (=> b!318610 (= e!197943 e!197946)))

(declare-fun res!173224 () Bool)

(assert (=> b!318610 (= res!173224 (and ((_ is Intermediate!2786) lt!155453) (not (undefined!3598 lt!155453)) (bvslt (x!31680 lt!155453) #b01111111111111111111111111111110) (bvsge (x!31680 lt!155453) #b00000000000000000000000000000000) (bvsge (x!31680 lt!155453) #b00000000000000000000000000000000)))))

(assert (=> b!318610 (=> (not res!173224) (not e!197946))))

(declare-fun b!318611 () Bool)

(declare-fun e!197945 () SeekEntryResult!2786)

(assert (=> b!318611 (= e!197945 (Intermediate!2786 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318612 () Bool)

(assert (=> b!318612 (= e!197942 (Intermediate!2786 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318613 () Bool)

(assert (=> b!318613 (= e!197943 (bvsge (x!31680 lt!155453) #b01111111111111111111111111111110))))

(declare-fun b!318614 () Bool)

(assert (=> b!318614 (= e!197942 e!197945)))

(declare-fun c!50313 () Bool)

(assert (=> b!318614 (= c!50313 (or (= lt!155454 k0!2441) (= (bvadd lt!155454 lt!155454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318615 () Bool)

(assert (=> b!318615 (= e!197945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69255 c!50315) b!318612))

(assert (= (and d!69255 (not c!50315)) b!318614))

(assert (= (and b!318614 c!50313) b!318611))

(assert (= (and b!318614 (not c!50313)) b!318615))

(assert (= (and d!69255 c!50314) b!318613))

(assert (= (and d!69255 (not c!50314)) b!318610))

(assert (= (and b!318610 res!173224) b!318607))

(assert (= (and b!318607 (not res!173225)) b!318608))

(assert (= (and b!318608 (not res!173226)) b!318609))

(assert (=> d!69255 m!327459))

(declare-fun m!327547 () Bool)

(assert (=> d!69255 m!327547))

(assert (=> d!69255 m!327469))

(declare-fun m!327549 () Bool)

(assert (=> b!318609 m!327549))

(assert (=> b!318608 m!327549))

(assert (=> b!318615 m!327459))

(declare-fun m!327551 () Bool)

(assert (=> b!318615 m!327551))

(assert (=> b!318615 m!327551))

(declare-fun m!327553 () Bool)

(assert (=> b!318615 m!327553))

(assert (=> b!318607 m!327549))

(assert (=> b!318528 d!69255))

(declare-fun d!69257 () Bool)

(declare-fun lt!155460 () (_ BitVec 32))

(declare-fun lt!155459 () (_ BitVec 32))

(assert (=> d!69257 (= lt!155460 (bvmul (bvxor lt!155459 (bvlshr lt!155459 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69257 (= lt!155459 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69257 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!173227 (let ((h!5291 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31684 (bvmul (bvxor h!5291 (bvlshr h!5291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31684 (bvlshr x!31684 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!173227 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!173227 #b00000000000000000000000000000000))))))

(assert (=> d!69257 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!155460 (bvlshr lt!155460 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!318528 d!69257))

(declare-fun d!69263 () Bool)

(declare-fun e!197948 () Bool)

(assert (=> d!69263 e!197948))

(declare-fun c!50317 () Bool)

(declare-fun lt!155461 () SeekEntryResult!2786)

(assert (=> d!69263 (= c!50317 (and ((_ is Intermediate!2786) lt!155461) (undefined!3598 lt!155461)))))

(declare-fun e!197947 () SeekEntryResult!2786)

(assert (=> d!69263 (= lt!155461 e!197947)))

(declare-fun c!50318 () Bool)

(assert (=> d!69263 (= c!50318 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!155462 () (_ BitVec 64))

(assert (=> d!69263 (= lt!155462 (select (arr!7681 a!3293) lt!155422))))

(assert (=> d!69263 (validMask!0 mask!3709)))

(assert (=> d!69263 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155422 k0!2441 a!3293 mask!3709) lt!155461)))

(declare-fun b!318616 () Bool)

(assert (=> b!318616 (and (bvsge (index!13322 lt!155461) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155461) (size!8033 a!3293)))))

(declare-fun res!173229 () Bool)

(assert (=> b!318616 (= res!173229 (= (select (arr!7681 a!3293) (index!13322 lt!155461)) k0!2441))))

(declare-fun e!197949 () Bool)

(assert (=> b!318616 (=> res!173229 e!197949)))

(declare-fun e!197951 () Bool)

(assert (=> b!318616 (= e!197951 e!197949)))

(declare-fun b!318617 () Bool)

(assert (=> b!318617 (and (bvsge (index!13322 lt!155461) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155461) (size!8033 a!3293)))))

(declare-fun res!173230 () Bool)

(assert (=> b!318617 (= res!173230 (= (select (arr!7681 a!3293) (index!13322 lt!155461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318617 (=> res!173230 e!197949)))

(declare-fun b!318618 () Bool)

(assert (=> b!318618 (and (bvsge (index!13322 lt!155461) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155461) (size!8033 a!3293)))))

(assert (=> b!318618 (= e!197949 (= (select (arr!7681 a!3293) (index!13322 lt!155461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318619 () Bool)

(assert (=> b!318619 (= e!197948 e!197951)))

(declare-fun res!173228 () Bool)

(assert (=> b!318619 (= res!173228 (and ((_ is Intermediate!2786) lt!155461) (not (undefined!3598 lt!155461)) (bvslt (x!31680 lt!155461) #b01111111111111111111111111111110) (bvsge (x!31680 lt!155461) #b00000000000000000000000000000000) (bvsge (x!31680 lt!155461) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318619 (=> (not res!173228) (not e!197951))))

(declare-fun b!318620 () Bool)

(declare-fun e!197950 () SeekEntryResult!2786)

(assert (=> b!318620 (= e!197950 (Intermediate!2786 false lt!155422 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318621 () Bool)

(assert (=> b!318621 (= e!197947 (Intermediate!2786 true lt!155422 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318622 () Bool)

(assert (=> b!318622 (= e!197948 (bvsge (x!31680 lt!155461) #b01111111111111111111111111111110))))

(declare-fun b!318623 () Bool)

(assert (=> b!318623 (= e!197947 e!197950)))

(declare-fun c!50316 () Bool)

(assert (=> b!318623 (= c!50316 (or (= lt!155462 k0!2441) (= (bvadd lt!155462 lt!155462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318624 () Bool)

(assert (=> b!318624 (= e!197950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155422 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69263 c!50318) b!318621))

(assert (= (and d!69263 (not c!50318)) b!318623))

(assert (= (and b!318623 c!50316) b!318620))

(assert (= (and b!318623 (not c!50316)) b!318624))

(assert (= (and d!69263 c!50317) b!318622))

(assert (= (and d!69263 (not c!50317)) b!318619))

(assert (= (and b!318619 res!173228) b!318616))

(assert (= (and b!318616 (not res!173229)) b!318617))

(assert (= (and b!318617 (not res!173230)) b!318618))

(declare-fun m!327555 () Bool)

(assert (=> d!69263 m!327555))

(assert (=> d!69263 m!327469))

(declare-fun m!327557 () Bool)

(assert (=> b!318618 m!327557))

(assert (=> b!318617 m!327557))

(declare-fun m!327559 () Bool)

(assert (=> b!318624 m!327559))

(assert (=> b!318624 m!327559))

(declare-fun m!327561 () Bool)

(assert (=> b!318624 m!327561))

(assert (=> b!318616 m!327557))

(assert (=> b!318522 d!69263))

(declare-fun d!69267 () Bool)

(declare-fun lt!155465 () (_ BitVec 32))

(assert (=> d!69267 (and (bvsge lt!155465 #b00000000000000000000000000000000) (bvslt lt!155465 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69267 (= lt!155465 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!69267 (validMask!0 mask!3709)))

(assert (=> d!69267 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!155465)))

(declare-fun bs!11124 () Bool)

(assert (= bs!11124 d!69267))

(declare-fun m!327563 () Bool)

(assert (=> bs!11124 m!327563))

(assert (=> bs!11124 m!327469))

(assert (=> b!318522 d!69267))

(declare-fun d!69269 () Bool)

(assert (=> d!69269 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318524 d!69269))

(declare-fun d!69271 () Bool)

(declare-fun res!173239 () Bool)

(declare-fun e!197962 () Bool)

(assert (=> d!69271 (=> res!173239 e!197962)))

(assert (=> d!69271 (= res!173239 (= (select (arr!7681 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69271 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!197962)))

(declare-fun b!318637 () Bool)

(declare-fun e!197963 () Bool)

(assert (=> b!318637 (= e!197962 e!197963)))

(declare-fun res!173240 () Bool)

(assert (=> b!318637 (=> (not res!173240) (not e!197963))))

(assert (=> b!318637 (= res!173240 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8033 a!3293)))))

(declare-fun b!318638 () Bool)

(assert (=> b!318638 (= e!197963 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69271 (not res!173239)) b!318637))

(assert (= (and b!318637 res!173240) b!318638))

(declare-fun m!327565 () Bool)

(assert (=> d!69271 m!327565))

(declare-fun m!327567 () Bool)

(assert (=> b!318638 m!327567))

(assert (=> b!318523 d!69271))

(declare-fun d!69273 () Bool)

(assert (=> d!69273 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31848 d!69273))

(declare-fun d!69287 () Bool)

(assert (=> d!69287 (= (array_inv!5631 a!3293) (bvsge (size!8033 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31848 d!69287))

(declare-fun d!69289 () Bool)

(declare-fun e!198004 () Bool)

(assert (=> d!69289 e!198004))

(declare-fun c!50341 () Bool)

(declare-fun lt!155487 () SeekEntryResult!2786)

(assert (=> d!69289 (= c!50341 (and ((_ is Intermediate!2786) lt!155487) (undefined!3598 lt!155487)))))

(declare-fun e!198003 () SeekEntryResult!2786)

(assert (=> d!69289 (= lt!155487 e!198003)))

(declare-fun c!50342 () Bool)

(assert (=> d!69289 (= c!50342 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!155488 () (_ BitVec 64))

(assert (=> d!69289 (= lt!155488 (select (arr!7681 lt!155424) index!1781))))

(assert (=> d!69289 (validMask!0 mask!3709)))

(assert (=> d!69289 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155424 mask!3709) lt!155487)))

(declare-fun b!318703 () Bool)

(assert (=> b!318703 (and (bvsge (index!13322 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155487) (size!8033 lt!155424)))))

(declare-fun res!173268 () Bool)

(assert (=> b!318703 (= res!173268 (= (select (arr!7681 lt!155424) (index!13322 lt!155487)) k0!2441))))

(declare-fun e!198005 () Bool)

(assert (=> b!318703 (=> res!173268 e!198005)))

(declare-fun e!198007 () Bool)

(assert (=> b!318703 (= e!198007 e!198005)))

(declare-fun b!318704 () Bool)

(assert (=> b!318704 (and (bvsge (index!13322 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155487) (size!8033 lt!155424)))))

(declare-fun res!173269 () Bool)

(assert (=> b!318704 (= res!173269 (= (select (arr!7681 lt!155424) (index!13322 lt!155487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318704 (=> res!173269 e!198005)))

(declare-fun b!318705 () Bool)

(assert (=> b!318705 (and (bvsge (index!13322 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155487) (size!8033 lt!155424)))))

(assert (=> b!318705 (= e!198005 (= (select (arr!7681 lt!155424) (index!13322 lt!155487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318706 () Bool)

(assert (=> b!318706 (= e!198004 e!198007)))

(declare-fun res!173267 () Bool)

(assert (=> b!318706 (= res!173267 (and ((_ is Intermediate!2786) lt!155487) (not (undefined!3598 lt!155487)) (bvslt (x!31680 lt!155487) #b01111111111111111111111111111110) (bvsge (x!31680 lt!155487) #b00000000000000000000000000000000) (bvsge (x!31680 lt!155487) x!1427)))))

(assert (=> b!318706 (=> (not res!173267) (not e!198007))))

(declare-fun b!318707 () Bool)

(declare-fun e!198006 () SeekEntryResult!2786)

(assert (=> b!318707 (= e!198006 (Intermediate!2786 false index!1781 x!1427))))

(declare-fun b!318708 () Bool)

(assert (=> b!318708 (= e!198003 (Intermediate!2786 true index!1781 x!1427))))

(declare-fun b!318709 () Bool)

(assert (=> b!318709 (= e!198004 (bvsge (x!31680 lt!155487) #b01111111111111111111111111111110))))

(declare-fun b!318710 () Bool)

(assert (=> b!318710 (= e!198003 e!198006)))

(declare-fun c!50340 () Bool)

(assert (=> b!318710 (= c!50340 (or (= lt!155488 k0!2441) (= (bvadd lt!155488 lt!155488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318711 () Bool)

(assert (=> b!318711 (= e!198006 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 lt!155424 mask!3709))))

(assert (= (and d!69289 c!50342) b!318708))

(assert (= (and d!69289 (not c!50342)) b!318710))

(assert (= (and b!318710 c!50340) b!318707))

(assert (= (and b!318710 (not c!50340)) b!318711))

(assert (= (and d!69289 c!50341) b!318709))

(assert (= (and d!69289 (not c!50341)) b!318706))

(assert (= (and b!318706 res!173267) b!318703))

(assert (= (and b!318703 (not res!173268)) b!318704))

(assert (= (and b!318704 (not res!173269)) b!318705))

(declare-fun m!327613 () Bool)

(assert (=> d!69289 m!327613))

(assert (=> d!69289 m!327469))

(declare-fun m!327615 () Bool)

(assert (=> b!318705 m!327615))

(assert (=> b!318704 m!327615))

(declare-fun m!327617 () Bool)

(assert (=> b!318711 m!327617))

(assert (=> b!318711 m!327617))

(declare-fun m!327619 () Bool)

(assert (=> b!318711 m!327619))

(assert (=> b!318703 m!327615))

(assert (=> b!318520 d!69289))

(declare-fun d!69293 () Bool)

(declare-fun e!198009 () Bool)

(assert (=> d!69293 e!198009))

(declare-fun c!50344 () Bool)

(declare-fun lt!155492 () SeekEntryResult!2786)

(assert (=> d!69293 (= c!50344 (and ((_ is Intermediate!2786) lt!155492) (undefined!3598 lt!155492)))))

(declare-fun e!198008 () SeekEntryResult!2786)

(assert (=> d!69293 (= lt!155492 e!198008)))

(declare-fun c!50345 () Bool)

(assert (=> d!69293 (= c!50345 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!155493 () (_ BitVec 64))

(assert (=> d!69293 (= lt!155493 (select (arr!7681 lt!155424) lt!155422))))

(assert (=> d!69293 (validMask!0 mask!3709)))

(assert (=> d!69293 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155422 k0!2441 lt!155424 mask!3709) lt!155492)))

(declare-fun b!318712 () Bool)

(assert (=> b!318712 (and (bvsge (index!13322 lt!155492) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155492) (size!8033 lt!155424)))))

(declare-fun res!173271 () Bool)

(assert (=> b!318712 (= res!173271 (= (select (arr!7681 lt!155424) (index!13322 lt!155492)) k0!2441))))

(declare-fun e!198010 () Bool)

(assert (=> b!318712 (=> res!173271 e!198010)))

(declare-fun e!198012 () Bool)

(assert (=> b!318712 (= e!198012 e!198010)))

(declare-fun b!318713 () Bool)

(assert (=> b!318713 (and (bvsge (index!13322 lt!155492) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155492) (size!8033 lt!155424)))))

(declare-fun res!173272 () Bool)

(assert (=> b!318713 (= res!173272 (= (select (arr!7681 lt!155424) (index!13322 lt!155492)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318713 (=> res!173272 e!198010)))

(declare-fun b!318714 () Bool)

(assert (=> b!318714 (and (bvsge (index!13322 lt!155492) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155492) (size!8033 lt!155424)))))

(assert (=> b!318714 (= e!198010 (= (select (arr!7681 lt!155424) (index!13322 lt!155492)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318715 () Bool)

(assert (=> b!318715 (= e!198009 e!198012)))

(declare-fun res!173270 () Bool)

(assert (=> b!318715 (= res!173270 (and ((_ is Intermediate!2786) lt!155492) (not (undefined!3598 lt!155492)) (bvslt (x!31680 lt!155492) #b01111111111111111111111111111110) (bvsge (x!31680 lt!155492) #b00000000000000000000000000000000) (bvsge (x!31680 lt!155492) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318715 (=> (not res!173270) (not e!198012))))

(declare-fun b!318716 () Bool)

(declare-fun e!198011 () SeekEntryResult!2786)

(assert (=> b!318716 (= e!198011 (Intermediate!2786 false lt!155422 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318717 () Bool)

(assert (=> b!318717 (= e!198008 (Intermediate!2786 true lt!155422 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318718 () Bool)

(assert (=> b!318718 (= e!198009 (bvsge (x!31680 lt!155492) #b01111111111111111111111111111110))))

(declare-fun b!318719 () Bool)

(assert (=> b!318719 (= e!198008 e!198011)))

(declare-fun c!50343 () Bool)

(assert (=> b!318719 (= c!50343 (or (= lt!155493 k0!2441) (= (bvadd lt!155493 lt!155493) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318720 () Bool)

(assert (=> b!318720 (= e!198011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155422 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 lt!155424 mask!3709))))

(assert (= (and d!69293 c!50345) b!318717))

(assert (= (and d!69293 (not c!50345)) b!318719))

(assert (= (and b!318719 c!50343) b!318716))

(assert (= (and b!318719 (not c!50343)) b!318720))

(assert (= (and d!69293 c!50344) b!318718))

(assert (= (and d!69293 (not c!50344)) b!318715))

(assert (= (and b!318715 res!173270) b!318712))

(assert (= (and b!318712 (not res!173271)) b!318713))

(assert (= (and b!318713 (not res!173272)) b!318714))

(declare-fun m!327621 () Bool)

(assert (=> d!69293 m!327621))

(assert (=> d!69293 m!327469))

(declare-fun m!327623 () Bool)

(assert (=> b!318714 m!327623))

(assert (=> b!318713 m!327623))

(assert (=> b!318720 m!327559))

(assert (=> b!318720 m!327559))

(declare-fun m!327625 () Bool)

(assert (=> b!318720 m!327625))

(assert (=> b!318712 m!327623))

(assert (=> b!318520 d!69293))

(declare-fun b!318768 () Bool)

(declare-fun e!198042 () Bool)

(declare-fun call!26018 () Bool)

(assert (=> b!318768 (= e!198042 call!26018)))

(declare-fun b!318769 () Bool)

(declare-fun e!198041 () Bool)

(declare-fun e!198040 () Bool)

(assert (=> b!318769 (= e!198041 e!198040)))

(declare-fun c!50363 () Bool)

(assert (=> b!318769 (= c!50363 (validKeyInArray!0 (select (arr!7681 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!26015 () Bool)

(assert (=> bm!26015 (= call!26018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!318770 () Bool)

(assert (=> b!318770 (= e!198040 e!198042)))

(declare-fun lt!155514 () (_ BitVec 64))

(assert (=> b!318770 (= lt!155514 (select (arr!7681 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9758 0))(
  ( (Unit!9759) )
))
(declare-fun lt!155513 () Unit!9758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16232 (_ BitVec 64) (_ BitVec 32)) Unit!9758)

(assert (=> b!318770 (= lt!155513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!155514 #b00000000000000000000000000000000))))

(assert (=> b!318770 (arrayContainsKey!0 a!3293 lt!155514 #b00000000000000000000000000000000)))

(declare-fun lt!155512 () Unit!9758)

(assert (=> b!318770 (= lt!155512 lt!155513)))

(declare-fun res!173287 () Bool)

(assert (=> b!318770 (= res!173287 (= (seekEntryOrOpen!0 (select (arr!7681 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2786 #b00000000000000000000000000000000)))))

(assert (=> b!318770 (=> (not res!173287) (not e!198042))))

(declare-fun b!318771 () Bool)

(assert (=> b!318771 (= e!198040 call!26018)))

(declare-fun d!69295 () Bool)

(declare-fun res!173286 () Bool)

(assert (=> d!69295 (=> res!173286 e!198041)))

(assert (=> d!69295 (= res!173286 (bvsge #b00000000000000000000000000000000 (size!8033 a!3293)))))

(assert (=> d!69295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!198041)))

(assert (= (and d!69295 (not res!173286)) b!318769))

(assert (= (and b!318769 c!50363) b!318770))

(assert (= (and b!318769 (not c!50363)) b!318771))

(assert (= (and b!318770 res!173287) b!318768))

(assert (= (or b!318768 b!318771) bm!26015))

(assert (=> b!318769 m!327565))

(assert (=> b!318769 m!327565))

(declare-fun m!327633 () Bool)

(assert (=> b!318769 m!327633))

(declare-fun m!327635 () Bool)

(assert (=> bm!26015 m!327635))

(assert (=> b!318770 m!327565))

(declare-fun m!327637 () Bool)

(assert (=> b!318770 m!327637))

(declare-fun m!327639 () Bool)

(assert (=> b!318770 m!327639))

(assert (=> b!318770 m!327565))

(declare-fun m!327641 () Bool)

(assert (=> b!318770 m!327641))

(assert (=> b!318519 d!69295))

(declare-fun d!69299 () Bool)

(declare-fun e!198048 () Bool)

(assert (=> d!69299 e!198048))

(declare-fun c!50365 () Bool)

(declare-fun lt!155515 () SeekEntryResult!2786)

(assert (=> d!69299 (= c!50365 (and ((_ is Intermediate!2786) lt!155515) (undefined!3598 lt!155515)))))

(declare-fun e!198047 () SeekEntryResult!2786)

(assert (=> d!69299 (= lt!155515 e!198047)))

(declare-fun c!50366 () Bool)

(assert (=> d!69299 (= c!50366 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!155516 () (_ BitVec 64))

(assert (=> d!69299 (= lt!155516 (select (arr!7681 a!3293) index!1781))))

(assert (=> d!69299 (validMask!0 mask!3709)))

(assert (=> d!69299 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!155515)))

(declare-fun b!318776 () Bool)

(assert (=> b!318776 (and (bvsge (index!13322 lt!155515) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155515) (size!8033 a!3293)))))

(declare-fun res!173293 () Bool)

(assert (=> b!318776 (= res!173293 (= (select (arr!7681 a!3293) (index!13322 lt!155515)) k0!2441))))

(declare-fun e!198049 () Bool)

(assert (=> b!318776 (=> res!173293 e!198049)))

(declare-fun e!198051 () Bool)

(assert (=> b!318776 (= e!198051 e!198049)))

(declare-fun b!318777 () Bool)

(assert (=> b!318777 (and (bvsge (index!13322 lt!155515) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155515) (size!8033 a!3293)))))

(declare-fun res!173294 () Bool)

(assert (=> b!318777 (= res!173294 (= (select (arr!7681 a!3293) (index!13322 lt!155515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318777 (=> res!173294 e!198049)))

(declare-fun b!318778 () Bool)

(assert (=> b!318778 (and (bvsge (index!13322 lt!155515) #b00000000000000000000000000000000) (bvslt (index!13322 lt!155515) (size!8033 a!3293)))))

(assert (=> b!318778 (= e!198049 (= (select (arr!7681 a!3293) (index!13322 lt!155515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318779 () Bool)

(assert (=> b!318779 (= e!198048 e!198051)))

(declare-fun res!173292 () Bool)

(assert (=> b!318779 (= res!173292 (and ((_ is Intermediate!2786) lt!155515) (not (undefined!3598 lt!155515)) (bvslt (x!31680 lt!155515) #b01111111111111111111111111111110) (bvsge (x!31680 lt!155515) #b00000000000000000000000000000000) (bvsge (x!31680 lt!155515) x!1427)))))

(assert (=> b!318779 (=> (not res!173292) (not e!198051))))

(declare-fun b!318780 () Bool)

(declare-fun e!198050 () SeekEntryResult!2786)

(assert (=> b!318780 (= e!198050 (Intermediate!2786 false index!1781 x!1427))))

(declare-fun b!318781 () Bool)

(assert (=> b!318781 (= e!198047 (Intermediate!2786 true index!1781 x!1427))))

(declare-fun b!318782 () Bool)

(assert (=> b!318782 (= e!198048 (bvsge (x!31680 lt!155515) #b01111111111111111111111111111110))))

(declare-fun b!318783 () Bool)

(assert (=> b!318783 (= e!198047 e!198050)))

(declare-fun c!50364 () Bool)

(assert (=> b!318783 (= c!50364 (or (= lt!155516 k0!2441) (= (bvadd lt!155516 lt!155516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318784 () Bool)

(assert (=> b!318784 (= e!198050 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69299 c!50366) b!318781))

(assert (= (and d!69299 (not c!50366)) b!318783))

(assert (= (and b!318783 c!50364) b!318780))

(assert (= (and b!318783 (not c!50364)) b!318784))

(assert (= (and d!69299 c!50365) b!318782))

(assert (= (and d!69299 (not c!50365)) b!318779))

(assert (= (and b!318779 res!173292) b!318776))

(assert (= (and b!318776 (not res!173293)) b!318777))

(assert (= (and b!318777 (not res!173294)) b!318778))

(assert (=> d!69299 m!327465))

(assert (=> d!69299 m!327469))

(declare-fun m!327643 () Bool)

(assert (=> b!318778 m!327643))

(assert (=> b!318777 m!327643))

(assert (=> b!318784 m!327617))

(assert (=> b!318784 m!327617))

(declare-fun m!327645 () Bool)

(assert (=> b!318784 m!327645))

(assert (=> b!318776 m!327643))

(assert (=> b!318521 d!69299))

(declare-fun d!69301 () Bool)

(declare-fun lt!155557 () SeekEntryResult!2786)

(assert (=> d!69301 (and (or ((_ is Undefined!2786) lt!155557) (not ((_ is Found!2786) lt!155557)) (and (bvsge (index!13321 lt!155557) #b00000000000000000000000000000000) (bvslt (index!13321 lt!155557) (size!8033 a!3293)))) (or ((_ is Undefined!2786) lt!155557) ((_ is Found!2786) lt!155557) (not ((_ is MissingZero!2786) lt!155557)) (and (bvsge (index!13320 lt!155557) #b00000000000000000000000000000000) (bvslt (index!13320 lt!155557) (size!8033 a!3293)))) (or ((_ is Undefined!2786) lt!155557) ((_ is Found!2786) lt!155557) ((_ is MissingZero!2786) lt!155557) (not ((_ is MissingVacant!2786) lt!155557)) (and (bvsge (index!13323 lt!155557) #b00000000000000000000000000000000) (bvslt (index!13323 lt!155557) (size!8033 a!3293)))) (or ((_ is Undefined!2786) lt!155557) (ite ((_ is Found!2786) lt!155557) (= (select (arr!7681 a!3293) (index!13321 lt!155557)) k0!2441) (ite ((_ is MissingZero!2786) lt!155557) (= (select (arr!7681 a!3293) (index!13320 lt!155557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2786) lt!155557) (= (select (arr!7681 a!3293) (index!13323 lt!155557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198087 () SeekEntryResult!2786)

(assert (=> d!69301 (= lt!155557 e!198087)))

(declare-fun c!50390 () Bool)

(declare-fun lt!155558 () SeekEntryResult!2786)

(assert (=> d!69301 (= c!50390 (and ((_ is Intermediate!2786) lt!155558) (undefined!3598 lt!155558)))))

(assert (=> d!69301 (= lt!155558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!69301 (validMask!0 mask!3709)))

(assert (=> d!69301 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!155557)))

(declare-fun b!318844 () Bool)

(declare-fun c!50389 () Bool)

(declare-fun lt!155556 () (_ BitVec 64))

(assert (=> b!318844 (= c!50389 (= lt!155556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198088 () SeekEntryResult!2786)

(declare-fun e!198089 () SeekEntryResult!2786)

(assert (=> b!318844 (= e!198088 e!198089)))

(declare-fun b!318845 () Bool)

(assert (=> b!318845 (= e!198089 (MissingZero!2786 (index!13322 lt!155558)))))

(declare-fun b!318846 () Bool)

(assert (=> b!318846 (= e!198087 e!198088)))

(assert (=> b!318846 (= lt!155556 (select (arr!7681 a!3293) (index!13322 lt!155558)))))

(declare-fun c!50388 () Bool)

(assert (=> b!318846 (= c!50388 (= lt!155556 k0!2441))))

(declare-fun b!318847 () Bool)

(assert (=> b!318847 (= e!198087 Undefined!2786)))

(declare-fun b!318848 () Bool)

(assert (=> b!318848 (= e!198088 (Found!2786 (index!13322 lt!155558)))))

(declare-fun b!318849 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16232 (_ BitVec 32)) SeekEntryResult!2786)

(assert (=> b!318849 (= e!198089 (seekKeyOrZeroReturnVacant!0 (x!31680 lt!155558) (index!13322 lt!155558) (index!13322 lt!155558) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69301 c!50390) b!318847))

(assert (= (and d!69301 (not c!50390)) b!318846))

(assert (= (and b!318846 c!50388) b!318848))

(assert (= (and b!318846 (not c!50388)) b!318844))

(assert (= (and b!318844 c!50389) b!318845))

(assert (= (and b!318844 (not c!50389)) b!318849))

(assert (=> d!69301 m!327459))

(assert (=> d!69301 m!327461))

(assert (=> d!69301 m!327469))

(assert (=> d!69301 m!327459))

(declare-fun m!327695 () Bool)

(assert (=> d!69301 m!327695))

(declare-fun m!327697 () Bool)

(assert (=> d!69301 m!327697))

(declare-fun m!327699 () Bool)

(assert (=> d!69301 m!327699))

(declare-fun m!327701 () Bool)

(assert (=> b!318846 m!327701))

(declare-fun m!327703 () Bool)

(assert (=> b!318849 m!327703))

(assert (=> b!318526 d!69301))

(check-sat (not d!69301) (not b!318638) (not d!69267) (not b!318720) (not d!69289) (not d!69263) (not d!69293) (not b!318615) (not b!318770) (not b!318769) (not b!318849) (not b!318784) (not b!318624) (not d!69299) (not b!318711) (not d!69255) (not bm!26015))
(check-sat)
