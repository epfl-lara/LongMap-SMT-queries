; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30532 () Bool)

(assert start!30532)

(declare-fun b!305536 () Bool)

(declare-fun res!162710 () Bool)

(declare-fun e!191860 () Bool)

(assert (=> b!305536 (=> (not res!162710) (not e!191860))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305536 (= res!162710 (validKeyInArray!0 k0!2441))))

(declare-fun b!305537 () Bool)

(declare-fun res!162702 () Bool)

(declare-fun e!191859 () Bool)

(assert (=> b!305537 (=> (not res!162702) (not e!191859))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15536 0))(
  ( (array!15537 (arr!7353 (Array (_ BitVec 32) (_ BitVec 64))) (size!7705 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15536)

(assert (=> b!305537 (= res!162702 (and (= (select (arr!7353 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7705 a!3293))))))

(declare-fun b!305538 () Bool)

(declare-fun res!162703 () Bool)

(assert (=> b!305538 (=> (not res!162703) (not e!191860))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!305538 (= res!162703 (and (= (size!7705 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7705 a!3293))))))

(declare-fun b!305539 () Bool)

(assert (=> b!305539 false))

(declare-datatypes ((SeekEntryResult!2493 0))(
  ( (MissingZero!2493 (index!12148 (_ BitVec 32))) (Found!2493 (index!12149 (_ BitVec 32))) (Intermediate!2493 (undefined!3305 Bool) (index!12150 (_ BitVec 32)) (x!30408 (_ BitVec 32))) (Undefined!2493) (MissingVacant!2493 (index!12151 (_ BitVec 32))) )
))
(declare-fun lt!150769 () SeekEntryResult!2493)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15536 (_ BitVec 32)) SeekEntryResult!2493)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305539 (= lt!150769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9406 0))(
  ( (Unit!9407) )
))
(declare-fun e!191856 () Unit!9406)

(declare-fun Unit!9408 () Unit!9406)

(assert (=> b!305539 (= e!191856 Unit!9408)))

(declare-fun b!305541 () Bool)

(declare-fun e!191858 () Unit!9406)

(assert (=> b!305541 (= e!191858 e!191856)))

(declare-fun c!49019 () Bool)

(assert (=> b!305541 (= c!49019 (or (= (select (arr!7353 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7353 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305542 () Bool)

(declare-fun res!162708 () Bool)

(assert (=> b!305542 (=> (not res!162708) (not e!191859))))

(assert (=> b!305542 (= res!162708 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7353 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305543 () Bool)

(assert (=> b!305543 (= e!191859 (not true))))

(assert (=> b!305543 (= index!1781 resIndex!52)))

(declare-fun lt!150770 () Unit!9406)

(assert (=> b!305543 (= lt!150770 e!191858)))

(declare-fun c!49020 () Bool)

(assert (=> b!305543 (= c!49020 (not (= resIndex!52 index!1781)))))

(declare-fun b!305544 () Bool)

(declare-fun res!162711 () Bool)

(assert (=> b!305544 (=> (not res!162711) (not e!191860))))

(declare-fun arrayContainsKey!0 (array!15536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305544 (= res!162711 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305545 () Bool)

(declare-fun Unit!9409 () Unit!9406)

(assert (=> b!305545 (= e!191858 Unit!9409)))

(declare-fun b!305546 () Bool)

(assert (=> b!305546 (= e!191860 e!191859)))

(declare-fun res!162707 () Bool)

(assert (=> b!305546 (=> (not res!162707) (not e!191859))))

(declare-fun lt!150771 () SeekEntryResult!2493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305546 (= res!162707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150771))))

(assert (=> b!305546 (= lt!150771 (Intermediate!2493 false resIndex!52 resX!52))))

(declare-fun b!305547 () Bool)

(declare-fun res!162706 () Bool)

(assert (=> b!305547 (=> (not res!162706) (not e!191859))))

(assert (=> b!305547 (= res!162706 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150771))))

(declare-fun b!305548 () Bool)

(declare-fun res!162709 () Bool)

(assert (=> b!305548 (=> (not res!162709) (not e!191860))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15536 (_ BitVec 32)) SeekEntryResult!2493)

(assert (=> b!305548 (= res!162709 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2493 i!1240)))))

(declare-fun b!305549 () Bool)

(declare-fun res!162704 () Bool)

(assert (=> b!305549 (=> (not res!162704) (not e!191860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15536 (_ BitVec 32)) Bool)

(assert (=> b!305549 (= res!162704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!162705 () Bool)

(assert (=> start!30532 (=> (not res!162705) (not e!191860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30532 (= res!162705 (validMask!0 mask!3709))))

(assert (=> start!30532 e!191860))

(declare-fun array_inv!5316 (array!15536) Bool)

(assert (=> start!30532 (array_inv!5316 a!3293)))

(assert (=> start!30532 true))

(declare-fun b!305540 () Bool)

(assert (=> b!305540 false))

(declare-fun Unit!9410 () Unit!9406)

(assert (=> b!305540 (= e!191856 Unit!9410)))

(assert (= (and start!30532 res!162705) b!305538))

(assert (= (and b!305538 res!162703) b!305536))

(assert (= (and b!305536 res!162710) b!305544))

(assert (= (and b!305544 res!162711) b!305548))

(assert (= (and b!305548 res!162709) b!305549))

(assert (= (and b!305549 res!162704) b!305546))

(assert (= (and b!305546 res!162707) b!305537))

(assert (= (and b!305537 res!162702) b!305547))

(assert (= (and b!305547 res!162706) b!305542))

(assert (= (and b!305542 res!162708) b!305543))

(assert (= (and b!305543 c!49020) b!305541))

(assert (= (and b!305543 (not c!49020)) b!305545))

(assert (= (and b!305541 c!49019) b!305540))

(assert (= (and b!305541 (not c!49019)) b!305539))

(declare-fun m!316471 () Bool)

(assert (=> b!305549 m!316471))

(declare-fun m!316473 () Bool)

(assert (=> b!305542 m!316473))

(declare-fun m!316475 () Bool)

(assert (=> start!30532 m!316475))

(declare-fun m!316477 () Bool)

(assert (=> start!30532 m!316477))

(declare-fun m!316479 () Bool)

(assert (=> b!305546 m!316479))

(assert (=> b!305546 m!316479))

(declare-fun m!316481 () Bool)

(assert (=> b!305546 m!316481))

(declare-fun m!316483 () Bool)

(assert (=> b!305548 m!316483))

(declare-fun m!316485 () Bool)

(assert (=> b!305537 m!316485))

(declare-fun m!316487 () Bool)

(assert (=> b!305539 m!316487))

(assert (=> b!305539 m!316487))

(declare-fun m!316489 () Bool)

(assert (=> b!305539 m!316489))

(assert (=> b!305541 m!316473))

(declare-fun m!316491 () Bool)

(assert (=> b!305544 m!316491))

(declare-fun m!316493 () Bool)

(assert (=> b!305547 m!316493))

(declare-fun m!316495 () Bool)

(assert (=> b!305536 m!316495))

(check-sat (not start!30532) (not b!305548) (not b!305549) (not b!305546) (not b!305539) (not b!305536) (not b!305547) (not b!305544))
(check-sat)
