; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30576 () Bool)

(assert start!30576)

(declare-fun b!306479 () Bool)

(declare-fun res!163446 () Bool)

(declare-fun e!192119 () Bool)

(assert (=> b!306479 (=> (not res!163446) (not e!192119))))

(declare-datatypes ((array!15584 0))(
  ( (array!15585 (arr!7377 (Array (_ BitVec 32) (_ BitVec 64))) (size!7730 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15584)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2516 0))(
  ( (MissingZero!2516 (index!12240 (_ BitVec 32))) (Found!2516 (index!12241 (_ BitVec 32))) (Intermediate!2516 (undefined!3328 Bool) (index!12242 (_ BitVec 32)) (x!30506 (_ BitVec 32))) (Undefined!2516) (MissingVacant!2516 (index!12243 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15584 (_ BitVec 32)) SeekEntryResult!2516)

(assert (=> b!306479 (= res!163446 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2516 i!1240)))))

(declare-fun b!306480 () Bool)

(declare-fun res!163448 () Bool)

(assert (=> b!306480 (=> (not res!163448) (not e!192119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306480 (= res!163448 (validKeyInArray!0 k0!2441))))

(declare-fun b!306481 () Bool)

(declare-fun res!163444 () Bool)

(assert (=> b!306481 (=> (not res!163444) (not e!192119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15584 (_ BitVec 32)) Bool)

(assert (=> b!306481 (= res!163444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306483 () Bool)

(declare-fun res!163445 () Bool)

(assert (=> b!306483 (=> (not res!163445) (not e!192119))))

(declare-fun arrayContainsKey!0 (array!15584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306483 (= res!163445 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306484 () Bool)

(declare-fun res!163449 () Bool)

(assert (=> b!306484 (=> (not res!163449) (not e!192119))))

(assert (=> b!306484 (= res!163449 (and (= (size!7730 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7730 a!3293))))))

(declare-fun b!306485 () Bool)

(declare-fun e!192117 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306485 (= e!192117 (not (or (not (= (select (arr!7377 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306485 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9511 0))(
  ( (Unit!9512) )
))
(declare-fun lt!150795 () Unit!9511)

(declare-fun e!192118 () Unit!9511)

(assert (=> b!306485 (= lt!150795 e!192118)))

(declare-fun c!49120 () Bool)

(assert (=> b!306485 (= c!49120 (not (= resIndex!52 index!1781)))))

(declare-fun b!306486 () Bool)

(declare-fun Unit!9513 () Unit!9511)

(assert (=> b!306486 (= e!192118 Unit!9513)))

(declare-fun b!306487 () Bool)

(assert (=> b!306487 false))

(declare-fun e!192115 () Unit!9511)

(declare-fun Unit!9514 () Unit!9511)

(assert (=> b!306487 (= e!192115 Unit!9514)))

(declare-fun b!306488 () Bool)

(declare-fun res!163450 () Bool)

(assert (=> b!306488 (=> (not res!163450) (not e!192117))))

(declare-fun lt!150796 () SeekEntryResult!2516)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15584 (_ BitVec 32)) SeekEntryResult!2516)

(assert (=> b!306488 (= res!163450 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150796))))

(declare-fun b!306489 () Bool)

(assert (=> b!306489 (= e!192118 e!192115)))

(declare-fun c!49121 () Bool)

(assert (=> b!306489 (= c!49121 (or (= (select (arr!7377 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7377 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306490 () Bool)

(declare-fun res!163443 () Bool)

(assert (=> b!306490 (=> (not res!163443) (not e!192117))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306490 (= res!163443 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7377 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306482 () Bool)

(declare-fun res!163451 () Bool)

(assert (=> b!306482 (=> (not res!163451) (not e!192117))))

(assert (=> b!306482 (= res!163451 (and (= (select (arr!7377 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7730 a!3293))))))

(declare-fun res!163452 () Bool)

(assert (=> start!30576 (=> (not res!163452) (not e!192119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30576 (= res!163452 (validMask!0 mask!3709))))

(assert (=> start!30576 e!192119))

(declare-fun array_inv!5349 (array!15584) Bool)

(assert (=> start!30576 (array_inv!5349 a!3293)))

(assert (=> start!30576 true))

(declare-fun b!306491 () Bool)

(assert (=> b!306491 false))

(declare-fun lt!150797 () SeekEntryResult!2516)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306491 (= lt!150797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9515 () Unit!9511)

(assert (=> b!306491 (= e!192115 Unit!9515)))

(declare-fun b!306492 () Bool)

(assert (=> b!306492 (= e!192119 e!192117)))

(declare-fun res!163447 () Bool)

(assert (=> b!306492 (=> (not res!163447) (not e!192117))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306492 (= res!163447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150796))))

(assert (=> b!306492 (= lt!150796 (Intermediate!2516 false resIndex!52 resX!52))))

(assert (= (and start!30576 res!163452) b!306484))

(assert (= (and b!306484 res!163449) b!306480))

(assert (= (and b!306480 res!163448) b!306483))

(assert (= (and b!306483 res!163445) b!306479))

(assert (= (and b!306479 res!163446) b!306481))

(assert (= (and b!306481 res!163444) b!306492))

(assert (= (and b!306492 res!163447) b!306482))

(assert (= (and b!306482 res!163451) b!306488))

(assert (= (and b!306488 res!163450) b!306490))

(assert (= (and b!306490 res!163443) b!306485))

(assert (= (and b!306485 c!49120) b!306489))

(assert (= (and b!306485 (not c!49120)) b!306486))

(assert (= (and b!306489 c!49121) b!306487))

(assert (= (and b!306489 (not c!49121)) b!306491))

(declare-fun m!316495 () Bool)

(assert (=> b!306492 m!316495))

(assert (=> b!306492 m!316495))

(declare-fun m!316497 () Bool)

(assert (=> b!306492 m!316497))

(declare-fun m!316499 () Bool)

(assert (=> b!306488 m!316499))

(declare-fun m!316501 () Bool)

(assert (=> b!306490 m!316501))

(declare-fun m!316503 () Bool)

(assert (=> b!306491 m!316503))

(assert (=> b!306491 m!316503))

(declare-fun m!316505 () Bool)

(assert (=> b!306491 m!316505))

(declare-fun m!316507 () Bool)

(assert (=> b!306479 m!316507))

(declare-fun m!316509 () Bool)

(assert (=> b!306482 m!316509))

(assert (=> b!306489 m!316501))

(assert (=> b!306485 m!316501))

(declare-fun m!316511 () Bool)

(assert (=> start!30576 m!316511))

(declare-fun m!316513 () Bool)

(assert (=> start!30576 m!316513))

(declare-fun m!316515 () Bool)

(assert (=> b!306483 m!316515))

(declare-fun m!316517 () Bool)

(assert (=> b!306481 m!316517))

(declare-fun m!316519 () Bool)

(assert (=> b!306480 m!316519))

(check-sat (not b!306479) (not b!306488) (not start!30576) (not b!306480) (not b!306483) (not b!306492) (not b!306491) (not b!306481))
(check-sat)
