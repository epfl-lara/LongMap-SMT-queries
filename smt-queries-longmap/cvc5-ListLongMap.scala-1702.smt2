; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31196 () Bool)

(assert start!31196)

(declare-fun b!313450 () Bool)

(declare-fun res!169626 () Bool)

(declare-fun e!195344 () Bool)

(assert (=> b!313450 (=> (not res!169626) (not e!195344))))

(declare-datatypes ((array!16008 0))(
  ( (array!16009 (arr!7583 (Array (_ BitVec 32) (_ BitVec 64))) (size!7935 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16008)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2723 0))(
  ( (MissingZero!2723 (index!13068 (_ BitVec 32))) (Found!2723 (index!13069 (_ BitVec 32))) (Intermediate!2723 (undefined!3535 Bool) (index!13070 (_ BitVec 32)) (x!31284 (_ BitVec 32))) (Undefined!2723) (MissingVacant!2723 (index!13071 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16008 (_ BitVec 32)) SeekEntryResult!2723)

(assert (=> b!313450 (= res!169626 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2723 i!1240)))))

(declare-fun b!313451 () Bool)

(declare-fun e!195346 () Bool)

(declare-fun lt!153562 () SeekEntryResult!2723)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!313451 (= e!195346 (not (or (not (is-Intermediate!2723 lt!153562)) (bvsge (x!31284 lt!153562) (bvadd #b00000000000000000000000000000001 x!1427)))))))

(declare-fun lt!153564 () SeekEntryResult!2723)

(assert (=> b!313451 (= lt!153564 lt!153562)))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16008 (_ BitVec 32)) SeekEntryResult!2723)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313451 (= lt!153562 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313452 () Bool)

(declare-fun e!195345 () Bool)

(assert (=> b!313452 (= e!195344 e!195345)))

(declare-fun res!169621 () Bool)

(assert (=> b!313452 (=> (not res!169621) (not e!195345))))

(declare-fun lt!153563 () SeekEntryResult!2723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313452 (= res!169621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153563))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313452 (= lt!153563 (Intermediate!2723 false resIndex!52 resX!52))))

(declare-fun b!313453 () Bool)

(declare-fun res!169624 () Bool)

(assert (=> b!313453 (=> (not res!169624) (not e!195344))))

(assert (=> b!313453 (= res!169624 (and (= (size!7935 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7935 a!3293))))))

(declare-fun b!313454 () Bool)

(declare-fun res!169629 () Bool)

(assert (=> b!313454 (=> (not res!169629) (not e!195345))))

(assert (=> b!313454 (= res!169629 (and (= (select (arr!7583 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7935 a!3293))))))

(declare-fun b!313455 () Bool)

(declare-fun res!169623 () Bool)

(assert (=> b!313455 (=> (not res!169623) (not e!195344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313455 (= res!169623 (validKeyInArray!0 k!2441))))

(declare-fun b!313449 () Bool)

(assert (=> b!313449 (= e!195345 e!195346)))

(declare-fun res!169628 () Bool)

(assert (=> b!313449 (=> (not res!169628) (not e!195346))))

(assert (=> b!313449 (= res!169628 (and (= lt!153564 lt!153563) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7583 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7583 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7583 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313449 (= lt!153564 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!169622 () Bool)

(assert (=> start!31196 (=> (not res!169622) (not e!195344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31196 (= res!169622 (validMask!0 mask!3709))))

(assert (=> start!31196 e!195344))

(declare-fun array_inv!5546 (array!16008) Bool)

(assert (=> start!31196 (array_inv!5546 a!3293)))

(assert (=> start!31196 true))

(declare-fun b!313456 () Bool)

(declare-fun res!169627 () Bool)

(assert (=> b!313456 (=> (not res!169627) (not e!195344))))

(declare-fun arrayContainsKey!0 (array!16008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313456 (= res!169627 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313457 () Bool)

(declare-fun res!169625 () Bool)

(assert (=> b!313457 (=> (not res!169625) (not e!195344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16008 (_ BitVec 32)) Bool)

(assert (=> b!313457 (= res!169625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31196 res!169622) b!313453))

(assert (= (and b!313453 res!169624) b!313455))

(assert (= (and b!313455 res!169623) b!313456))

(assert (= (and b!313456 res!169627) b!313450))

(assert (= (and b!313450 res!169626) b!313457))

(assert (= (and b!313457 res!169625) b!313452))

(assert (= (and b!313452 res!169621) b!313454))

(assert (= (and b!313454 res!169629) b!313449))

(assert (= (and b!313449 res!169628) b!313451))

(declare-fun m!323357 () Bool)

(assert (=> b!313455 m!323357))

(declare-fun m!323359 () Bool)

(assert (=> b!313454 m!323359))

(declare-fun m!323361 () Bool)

(assert (=> b!313449 m!323361))

(declare-fun m!323363 () Bool)

(assert (=> b!313449 m!323363))

(declare-fun m!323365 () Bool)

(assert (=> b!313450 m!323365))

(declare-fun m!323367 () Bool)

(assert (=> b!313452 m!323367))

(assert (=> b!313452 m!323367))

(declare-fun m!323369 () Bool)

(assert (=> b!313452 m!323369))

(declare-fun m!323371 () Bool)

(assert (=> b!313456 m!323371))

(declare-fun m!323373 () Bool)

(assert (=> b!313451 m!323373))

(assert (=> b!313451 m!323373))

(declare-fun m!323375 () Bool)

(assert (=> b!313451 m!323375))

(declare-fun m!323377 () Bool)

(assert (=> start!31196 m!323377))

(declare-fun m!323379 () Bool)

(assert (=> start!31196 m!323379))

(declare-fun m!323381 () Bool)

(assert (=> b!313457 m!323381))

(push 1)

(assert (not b!313450))

(assert (not b!313455))

(assert (not b!313456))

(assert (not b!313451))

(assert (not start!31196))

(assert (not b!313457))

(assert (not b!313449))

(assert (not b!313452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!313554 () Bool)

(declare-fun e!195396 () Bool)

(declare-fun e!195400 () Bool)

(assert (=> b!313554 (= e!195396 e!195400)))

(declare-fun res!169698 () Bool)

(declare-fun lt!153596 () SeekEntryResult!2723)

(assert (=> b!313554 (= res!169698 (and (is-Intermediate!2723 lt!153596) (not (undefined!3535 lt!153596)) (bvslt (x!31284 lt!153596) #b01111111111111111111111111111110) (bvsge (x!31284 lt!153596) #b00000000000000000000000000000000) (bvsge (x!31284 lt!153596) x!1427)))))

(assert (=> b!313554 (=> (not res!169698) (not e!195400))))

(declare-fun b!313555 () Bool)

(declare-fun e!195399 () SeekEntryResult!2723)

(assert (=> b!313555 (= e!195399 (Intermediate!2723 false index!1781 x!1427))))

(declare-fun b!313556 () Bool)

(assert (=> b!313556 (= e!195399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313558 () Bool)

(assert (=> b!313558 (= e!195396 (bvsge (x!31284 lt!153596) #b01111111111111111111111111111110))))

(declare-fun b!313559 () Bool)

(assert (=> b!313559 (and (bvsge (index!13070 lt!153596) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153596) (size!7935 a!3293)))))

(declare-fun e!195398 () Bool)

(assert (=> b!313559 (= e!195398 (= (select (arr!7583 a!3293) (index!13070 lt!153596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313560 () Bool)

(assert (=> b!313560 (and (bvsge (index!13070 lt!153596) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153596) (size!7935 a!3293)))))

(declare-fun res!169697 () Bool)

(assert (=> b!313560 (= res!169697 (= (select (arr!7583 a!3293) (index!13070 lt!153596)) k!2441))))

(assert (=> b!313560 (=> res!169697 e!195398)))

(assert (=> b!313560 (= e!195400 e!195398)))

(declare-fun b!313557 () Bool)

(assert (=> b!313557 (and (bvsge (index!13070 lt!153596) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153596) (size!7935 a!3293)))))

(declare-fun res!169696 () Bool)

(assert (=> b!313557 (= res!169696 (= (select (arr!7583 a!3293) (index!13070 lt!153596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313557 (=> res!169696 e!195398)))

(declare-fun d!68593 () Bool)

(assert (=> d!68593 e!195396))

(declare-fun c!49538 () Bool)

(assert (=> d!68593 (= c!49538 (and (is-Intermediate!2723 lt!153596) (undefined!3535 lt!153596)))))

(declare-fun e!195397 () SeekEntryResult!2723)

(assert (=> d!68593 (= lt!153596 e!195397)))

(declare-fun c!49539 () Bool)

(assert (=> d!68593 (= c!49539 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153597 () (_ BitVec 64))

(assert (=> d!68593 (= lt!153597 (select (arr!7583 a!3293) index!1781))))

(assert (=> d!68593 (validMask!0 mask!3709)))

(assert (=> d!68593 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153596)))

(declare-fun b!313561 () Bool)

(assert (=> b!313561 (= e!195397 e!195399)))

(declare-fun c!49537 () Bool)

(assert (=> b!313561 (= c!49537 (or (= lt!153597 k!2441) (= (bvadd lt!153597 lt!153597) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313562 () Bool)

(assert (=> b!313562 (= e!195397 (Intermediate!2723 true index!1781 x!1427))))

(assert (= (and d!68593 c!49539) b!313562))

(assert (= (and d!68593 (not c!49539)) b!313561))

(assert (= (and b!313561 c!49537) b!313555))

(assert (= (and b!313561 (not c!49537)) b!313556))

(assert (= (and d!68593 c!49538) b!313558))

(assert (= (and d!68593 (not c!49538)) b!313554))

(assert (= (and b!313554 res!169698) b!313560))

(assert (= (and b!313560 (not res!169697)) b!313557))

(assert (= (and b!313557 (not res!169696)) b!313559))

(declare-fun m!323449 () Bool)

(assert (=> b!313557 m!323449))

(assert (=> d!68593 m!323361))

(assert (=> d!68593 m!323377))

(assert (=> b!313560 m!323449))

(assert (=> b!313556 m!323373))

(assert (=> b!313556 m!323373))

(declare-fun m!323451 () Bool)

(assert (=> b!313556 m!323451))

(assert (=> b!313559 m!323449))

(assert (=> b!313449 d!68593))

(declare-fun d!68601 () Bool)

(declare-fun res!169703 () Bool)

(declare-fun e!195405 () Bool)

(assert (=> d!68601 (=> res!169703 e!195405)))

(assert (=> d!68601 (= res!169703 (= (select (arr!7583 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68601 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195405)))

(declare-fun b!313567 () Bool)

(declare-fun e!195406 () Bool)

(assert (=> b!313567 (= e!195405 e!195406)))

(declare-fun res!169704 () Bool)

(assert (=> b!313567 (=> (not res!169704) (not e!195406))))

(assert (=> b!313567 (= res!169704 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7935 a!3293)))))

(declare-fun b!313568 () Bool)

(assert (=> b!313568 (= e!195406 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68601 (not res!169703)) b!313567))

(assert (= (and b!313567 res!169704) b!313568))

(declare-fun m!323453 () Bool)

(assert (=> d!68601 m!323453))

(declare-fun m!323455 () Bool)

(assert (=> b!313568 m!323455))

(assert (=> b!313456 d!68601))

(declare-fun d!68603 () Bool)

(assert (=> d!68603 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313455 d!68603))

(declare-fun b!313628 () Bool)

(declare-fun c!49561 () Bool)

(declare-fun lt!153631 () (_ BitVec 64))

(assert (=> b!313628 (= c!49561 (= lt!153631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195444 () SeekEntryResult!2723)

(declare-fun e!195445 () SeekEntryResult!2723)

(assert (=> b!313628 (= e!195444 e!195445)))

(declare-fun b!313629 () Bool)

(declare-fun lt!153633 () SeekEntryResult!2723)

(assert (=> b!313629 (= e!195444 (Found!2723 (index!13070 lt!153633)))))

(declare-fun b!313630 () Bool)

(assert (=> b!313630 (= e!195445 (MissingZero!2723 (index!13070 lt!153633)))))

(declare-fun d!68605 () Bool)

(declare-fun lt!153632 () SeekEntryResult!2723)

(assert (=> d!68605 (and (or (is-Undefined!2723 lt!153632) (not (is-Found!2723 lt!153632)) (and (bvsge (index!13069 lt!153632) #b00000000000000000000000000000000) (bvslt (index!13069 lt!153632) (size!7935 a!3293)))) (or (is-Undefined!2723 lt!153632) (is-Found!2723 lt!153632) (not (is-MissingZero!2723 lt!153632)) (and (bvsge (index!13068 lt!153632) #b00000000000000000000000000000000) (bvslt (index!13068 lt!153632) (size!7935 a!3293)))) (or (is-Undefined!2723 lt!153632) (is-Found!2723 lt!153632) (is-MissingZero!2723 lt!153632) (not (is-MissingVacant!2723 lt!153632)) (and (bvsge (index!13071 lt!153632) #b00000000000000000000000000000000) (bvslt (index!13071 lt!153632) (size!7935 a!3293)))) (or (is-Undefined!2723 lt!153632) (ite (is-Found!2723 lt!153632) (= (select (arr!7583 a!3293) (index!13069 lt!153632)) k!2441) (ite (is-MissingZero!2723 lt!153632) (= (select (arr!7583 a!3293) (index!13068 lt!153632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2723 lt!153632) (= (select (arr!7583 a!3293) (index!13071 lt!153632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195443 () SeekEntryResult!2723)

(assert (=> d!68605 (= lt!153632 e!195443)))

(declare-fun c!49562 () Bool)

(assert (=> d!68605 (= c!49562 (and (is-Intermediate!2723 lt!153633) (undefined!3535 lt!153633)))))

(assert (=> d!68605 (= lt!153633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68605 (validMask!0 mask!3709)))

(assert (=> d!68605 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153632)))

(declare-fun b!313631 () Bool)

(assert (=> b!313631 (= e!195443 Undefined!2723)))

(declare-fun b!313632 () Bool)

(assert (=> b!313632 (= e!195443 e!195444)))

(assert (=> b!313632 (= lt!153631 (select (arr!7583 a!3293) (index!13070 lt!153633)))))

(declare-fun c!49560 () Bool)

(assert (=> b!313632 (= c!49560 (= lt!153631 k!2441))))

(declare-fun b!313633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16008 (_ BitVec 32)) SeekEntryResult!2723)

(assert (=> b!313633 (= e!195445 (seekKeyOrZeroReturnVacant!0 (x!31284 lt!153633) (index!13070 lt!153633) (index!13070 lt!153633) k!2441 a!3293 mask!3709))))

(assert (= (and d!68605 c!49562) b!313631))

(assert (= (and d!68605 (not c!49562)) b!313632))

(assert (= (and b!313632 c!49560) b!313629))

(assert (= (and b!313632 (not c!49560)) b!313628))

(assert (= (and b!313628 c!49561) b!313630))

(assert (= (and b!313628 (not c!49561)) b!313633))

(declare-fun m!323475 () Bool)

(assert (=> d!68605 m!323475))

(assert (=> d!68605 m!323377))

(assert (=> d!68605 m!323367))

(declare-fun m!323477 () Bool)

(assert (=> d!68605 m!323477))

(assert (=> d!68605 m!323367))

(assert (=> d!68605 m!323369))

(declare-fun m!323479 () Bool)

(assert (=> d!68605 m!323479))

(declare-fun m!323481 () Bool)

(assert (=> b!313632 m!323481))

(declare-fun m!323483 () Bool)

(assert (=> b!313633 m!323483))

(assert (=> b!313450 d!68605))

(declare-fun b!313646 () Bool)

(declare-fun e!195456 () Bool)

(declare-fun call!25954 () Bool)

(assert (=> b!313646 (= e!195456 call!25954)))

(declare-fun b!313647 () Bool)

(declare-fun e!195455 () Bool)

(assert (=> b!313647 (= e!195455 call!25954)))

(declare-fun b!313648 () Bool)

(declare-fun e!195457 () Bool)

(assert (=> b!313648 (= e!195457 e!195456)))

(declare-fun c!49566 () Bool)

(assert (=> b!313648 (= c!49566 (validKeyInArray!0 (select (arr!7583 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313649 () Bool)

(assert (=> b!313649 (= e!195456 e!195455)))

(declare-fun lt!153644 () (_ BitVec 64))

(assert (=> b!313649 (= lt!153644 (select (arr!7583 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9679 0))(
  ( (Unit!9680) )
))
(declare-fun lt!153645 () Unit!9679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16008 (_ BitVec 64) (_ BitVec 32)) Unit!9679)

(assert (=> b!313649 (= lt!153645 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153644 #b00000000000000000000000000000000))))

(assert (=> b!313649 (arrayContainsKey!0 a!3293 lt!153644 #b00000000000000000000000000000000)))

(declare-fun lt!153643 () Unit!9679)

(assert (=> b!313649 (= lt!153643 lt!153645)))

(declare-fun res!169732 () Bool)

(assert (=> b!313649 (= res!169732 (= (seekEntryOrOpen!0 (select (arr!7583 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2723 #b00000000000000000000000000000000)))))

(assert (=> b!313649 (=> (not res!169732) (not e!195455))))

(declare-fun d!68617 () Bool)

(declare-fun res!169731 () Bool)

(assert (=> d!68617 (=> res!169731 e!195457)))

(assert (=> d!68617 (= res!169731 (bvsge #b00000000000000000000000000000000 (size!7935 a!3293)))))

(assert (=> d!68617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195457)))

(declare-fun bm!25951 () Bool)

(assert (=> bm!25951 (= call!25954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68617 (not res!169731)) b!313648))

(assert (= (and b!313648 c!49566) b!313649))

(assert (= (and b!313648 (not c!49566)) b!313646))

(assert (= (and b!313649 res!169732) b!313647))

(assert (= (or b!313647 b!313646) bm!25951))

(assert (=> b!313648 m!323453))

(assert (=> b!313648 m!323453))

(declare-fun m!323497 () Bool)

(assert (=> b!313648 m!323497))

(assert (=> b!313649 m!323453))

(declare-fun m!323499 () Bool)

(assert (=> b!313649 m!323499))

(declare-fun m!323501 () Bool)

(assert (=> b!313649 m!323501))

(assert (=> b!313649 m!323453))

(declare-fun m!323503 () Bool)

(assert (=> b!313649 m!323503))

(declare-fun m!323505 () Bool)

(assert (=> bm!25951 m!323505))

(assert (=> b!313457 d!68617))

(declare-fun b!313650 () Bool)

(declare-fun e!195458 () Bool)

(declare-fun e!195462 () Bool)

(assert (=> b!313650 (= e!195458 e!195462)))

(declare-fun res!169735 () Bool)

(declare-fun lt!153646 () SeekEntryResult!2723)

(assert (=> b!313650 (= res!169735 (and (is-Intermediate!2723 lt!153646) (not (undefined!3535 lt!153646)) (bvslt (x!31284 lt!153646) #b01111111111111111111111111111110) (bvsge (x!31284 lt!153646) #b00000000000000000000000000000000) (bvsge (x!31284 lt!153646) #b00000000000000000000000000000000)))))

(assert (=> b!313650 (=> (not res!169735) (not e!195462))))

(declare-fun b!313651 () Bool)

(declare-fun e!195461 () SeekEntryResult!2723)

(assert (=> b!313651 (= e!195461 (Intermediate!2723 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313652 () Bool)

(assert (=> b!313652 (= e!195461 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313654 () Bool)

(assert (=> b!313654 (= e!195458 (bvsge (x!31284 lt!153646) #b01111111111111111111111111111110))))

(declare-fun b!313655 () Bool)

(assert (=> b!313655 (and (bvsge (index!13070 lt!153646) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153646) (size!7935 a!3293)))))

(declare-fun e!195460 () Bool)

(assert (=> b!313655 (= e!195460 (= (select (arr!7583 a!3293) (index!13070 lt!153646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313656 () Bool)

(assert (=> b!313656 (and (bvsge (index!13070 lt!153646) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153646) (size!7935 a!3293)))))

(declare-fun res!169734 () Bool)

(assert (=> b!313656 (= res!169734 (= (select (arr!7583 a!3293) (index!13070 lt!153646)) k!2441))))

(assert (=> b!313656 (=> res!169734 e!195460)))

(assert (=> b!313656 (= e!195462 e!195460)))

(declare-fun b!313653 () Bool)

(assert (=> b!313653 (and (bvsge (index!13070 lt!153646) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153646) (size!7935 a!3293)))))

(declare-fun res!169733 () Bool)

(assert (=> b!313653 (= res!169733 (= (select (arr!7583 a!3293) (index!13070 lt!153646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313653 (=> res!169733 e!195460)))

(declare-fun d!68621 () Bool)

(assert (=> d!68621 e!195458))

(declare-fun c!49568 () Bool)

(assert (=> d!68621 (= c!49568 (and (is-Intermediate!2723 lt!153646) (undefined!3535 lt!153646)))))

(declare-fun e!195459 () SeekEntryResult!2723)

(assert (=> d!68621 (= lt!153646 e!195459)))

(declare-fun c!49569 () Bool)

(assert (=> d!68621 (= c!49569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153647 () (_ BitVec 64))

(assert (=> d!68621 (= lt!153647 (select (arr!7583 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68621 (validMask!0 mask!3709)))

(assert (=> d!68621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153646)))

(declare-fun b!313657 () Bool)

(assert (=> b!313657 (= e!195459 e!195461)))

(declare-fun c!49567 () Bool)

(assert (=> b!313657 (= c!49567 (or (= lt!153647 k!2441) (= (bvadd lt!153647 lt!153647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313658 () Bool)

(assert (=> b!313658 (= e!195459 (Intermediate!2723 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68621 c!49569) b!313658))

(assert (= (and d!68621 (not c!49569)) b!313657))

(assert (= (and b!313657 c!49567) b!313651))

(assert (= (and b!313657 (not c!49567)) b!313652))

(assert (= (and d!68621 c!49568) b!313654))

(assert (= (and d!68621 (not c!49568)) b!313650))

(assert (= (and b!313650 res!169735) b!313656))

(assert (= (and b!313656 (not res!169734)) b!313653))

(assert (= (and b!313653 (not res!169733)) b!313655))

(declare-fun m!323507 () Bool)

(assert (=> b!313653 m!323507))

(assert (=> d!68621 m!323367))

(declare-fun m!323509 () Bool)

(assert (=> d!68621 m!323509))

(assert (=> d!68621 m!323377))

(assert (=> b!313656 m!323507))

(assert (=> b!313652 m!323367))

(declare-fun m!323511 () Bool)

(assert (=> b!313652 m!323511))

(assert (=> b!313652 m!323511))

(declare-fun m!323513 () Bool)

(assert (=> b!313652 m!323513))

(assert (=> b!313655 m!323507))

(assert (=> b!313452 d!68621))

(declare-fun d!68627 () Bool)

(declare-fun lt!153660 () (_ BitVec 32))

(declare-fun lt!153659 () (_ BitVec 32))

(assert (=> d!68627 (= lt!153660 (bvmul (bvxor lt!153659 (bvlshr lt!153659 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68627 (= lt!153659 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68627 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169739 (let ((h!5353 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31290 (bvmul (bvxor h!5353 (bvlshr h!5353 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31290 (bvlshr x!31290 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169739 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169739 #b00000000000000000000000000000000))))))

(assert (=> d!68627 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153660 (bvlshr lt!153660 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313452 d!68627))

(declare-fun b!313677 () Bool)

(declare-fun e!195473 () Bool)

(declare-fun e!195477 () Bool)

(assert (=> b!313677 (= e!195473 e!195477)))

(declare-fun res!169745 () Bool)

(declare-fun lt!153661 () SeekEntryResult!2723)

(assert (=> b!313677 (= res!169745 (and (is-Intermediate!2723 lt!153661) (not (undefined!3535 lt!153661)) (bvslt (x!31284 lt!153661) #b01111111111111111111111111111110) (bvsge (x!31284 lt!153661) #b00000000000000000000000000000000) (bvsge (x!31284 lt!153661) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!313677 (=> (not res!169745) (not e!195477))))

(declare-fun b!313678 () Bool)

(declare-fun e!195476 () SeekEntryResult!2723)

(assert (=> b!313678 (= e!195476 (Intermediate!2723 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313679 () Bool)

(assert (=> b!313679 (= e!195476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313681 () Bool)

(assert (=> b!313681 (= e!195473 (bvsge (x!31284 lt!153661) #b01111111111111111111111111111110))))

(declare-fun b!313682 () Bool)

(assert (=> b!313682 (and (bvsge (index!13070 lt!153661) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153661) (size!7935 a!3293)))))

(declare-fun e!195475 () Bool)

(assert (=> b!313682 (= e!195475 (= (select (arr!7583 a!3293) (index!13070 lt!153661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313683 () Bool)

(assert (=> b!313683 (and (bvsge (index!13070 lt!153661) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153661) (size!7935 a!3293)))))

(declare-fun res!169744 () Bool)

(assert (=> b!313683 (= res!169744 (= (select (arr!7583 a!3293) (index!13070 lt!153661)) k!2441))))

(assert (=> b!313683 (=> res!169744 e!195475)))

(assert (=> b!313683 (= e!195477 e!195475)))

(declare-fun b!313680 () Bool)

(assert (=> b!313680 (and (bvsge (index!13070 lt!153661) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153661) (size!7935 a!3293)))))

(declare-fun res!169743 () Bool)

(assert (=> b!313680 (= res!169743 (= (select (arr!7583 a!3293) (index!13070 lt!153661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313680 (=> res!169743 e!195475)))

(declare-fun d!68633 () Bool)

(assert (=> d!68633 e!195473))

(declare-fun c!49577 () Bool)

(assert (=> d!68633 (= c!49577 (and (is-Intermediate!2723 lt!153661) (undefined!3535 lt!153661)))))

(declare-fun e!195474 () SeekEntryResult!2723)

(assert (=> d!68633 (= lt!153661 e!195474)))

(declare-fun c!49578 () Bool)

(assert (=> d!68633 (= c!49578 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!153662 () (_ BitVec 64))

(assert (=> d!68633 (= lt!153662 (select (arr!7583 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68633 (validMask!0 mask!3709)))

(assert (=> d!68633 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!153661)))

(declare-fun b!313684 () Bool)

(assert (=> b!313684 (= e!195474 e!195476)))

(declare-fun c!49576 () Bool)

(assert (=> b!313684 (= c!49576 (or (= lt!153662 k!2441) (= (bvadd lt!153662 lt!153662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313685 () Bool)

(assert (=> b!313685 (= e!195474 (Intermediate!2723 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(assert (= (and d!68633 c!49578) b!313685))

(assert (= (and d!68633 (not c!49578)) b!313684))

(assert (= (and b!313684 c!49576) b!313678))

(assert (= (and b!313684 (not c!49576)) b!313679))

(assert (= (and d!68633 c!49577) b!313681))

(assert (= (and d!68633 (not c!49577)) b!313677))

(assert (= (and b!313677 res!169745) b!313683))

(assert (= (and b!313683 (not res!169744)) b!313680))

(assert (= (and b!313680 (not res!169743)) b!313682))

(declare-fun m!323529 () Bool)

(assert (=> b!313680 m!323529))

(assert (=> d!68633 m!323373))

(declare-fun m!323531 () Bool)

(assert (=> d!68633 m!323531))

(assert (=> d!68633 m!323377))

(assert (=> b!313683 m!323529))

(assert (=> b!313679 m!323373))

(declare-fun m!323533 () Bool)

(assert (=> b!313679 m!323533))

(assert (=> b!313679 m!323533))

(declare-fun m!323535 () Bool)

(assert (=> b!313679 m!323535))

(assert (=> b!313682 m!323529))

(assert (=> b!313451 d!68633))

(declare-fun d!68635 () Bool)

(declare-fun lt!153665 () (_ BitVec 32))

(assert (=> d!68635 (and (bvsge lt!153665 #b00000000000000000000000000000000) (bvslt lt!153665 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68635 (= lt!153665 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68635 (validMask!0 mask!3709)))

(assert (=> d!68635 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!153665)))

(declare-fun bs!10992 () Bool)

(assert (= bs!10992 d!68635))

(declare-fun m!323537 () Bool)

(assert (=> bs!10992 m!323537))

(assert (=> bs!10992 m!323377))

(assert (=> b!313451 d!68635))

(declare-fun d!68637 () Bool)

(assert (=> d!68637 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31196 d!68637))

(declare-fun d!68641 () Bool)

(assert (=> d!68641 (= (array_inv!5546 a!3293) (bvsge (size!7935 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31196 d!68641))

(push 1)

(assert (not d!68621))

(assert (not b!313568))

(assert (not b!313652))

(assert (not d!68633))

(assert (not d!68635))

(assert (not b!313649))

(assert (not b!313556))

(assert (not d!68593))

(assert (not d!68605))

(assert (not b!313648))

(assert (not b!313679))

(assert (not b!313633))

(assert (not bm!25951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

