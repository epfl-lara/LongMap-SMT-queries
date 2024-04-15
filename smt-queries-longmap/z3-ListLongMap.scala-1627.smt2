; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30528 () Bool)

(assert start!30528)

(declare-fun b!305471 () Bool)

(declare-fun res!162726 () Bool)

(declare-fun e!191756 () Bool)

(assert (=> b!305471 (=> (not res!162726) (not e!191756))))

(declare-datatypes ((array!15536 0))(
  ( (array!15537 (arr!7353 (Array (_ BitVec 32) (_ BitVec 64))) (size!7706 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15536)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2492 0))(
  ( (MissingZero!2492 (index!12144 (_ BitVec 32))) (Found!2492 (index!12145 (_ BitVec 32))) (Intermediate!2492 (undefined!3304 Bool) (index!12146 (_ BitVec 32)) (x!30418 (_ BitVec 32))) (Undefined!2492) (MissingVacant!2492 (index!12147 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15536 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!305471 (= res!162726 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2492 i!1240)))))

(declare-fun b!305472 () Bool)

(assert (=> b!305472 false))

(declare-datatypes ((Unit!9391 0))(
  ( (Unit!9392) )
))
(declare-fun e!191757 () Unit!9391)

(declare-fun Unit!9393 () Unit!9391)

(assert (=> b!305472 (= e!191757 Unit!9393)))

(declare-fun b!305473 () Bool)

(declare-fun e!191755 () Unit!9391)

(declare-fun Unit!9394 () Unit!9391)

(assert (=> b!305473 (= e!191755 Unit!9394)))

(declare-fun res!162731 () Bool)

(assert (=> start!30528 (=> (not res!162731) (not e!191756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30528 (= res!162731 (validMask!0 mask!3709))))

(assert (=> start!30528 e!191756))

(declare-fun array_inv!5325 (array!15536) Bool)

(assert (=> start!30528 (array_inv!5325 a!3293)))

(assert (=> start!30528 true))

(declare-fun b!305474 () Bool)

(declare-fun res!162729 () Bool)

(declare-fun e!191759 () Bool)

(assert (=> b!305474 (=> (not res!162729) (not e!191759))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!150579 () SeekEntryResult!2492)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15536 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!305474 (= res!162729 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150579))))

(declare-fun b!305475 () Bool)

(assert (=> b!305475 (= e!191755 e!191757)))

(declare-fun c!48976 () Bool)

(assert (=> b!305475 (= c!48976 (or (= (select (arr!7353 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7353 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305476 () Bool)

(declare-fun res!162727 () Bool)

(assert (=> b!305476 (=> (not res!162727) (not e!191756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15536 (_ BitVec 32)) Bool)

(assert (=> b!305476 (= res!162727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305477 () Bool)

(declare-fun res!162723 () Bool)

(assert (=> b!305477 (=> (not res!162723) (not e!191759))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305477 (= res!162723 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7353 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305478 () Bool)

(assert (=> b!305478 (= e!191756 e!191759)))

(declare-fun res!162724 () Bool)

(assert (=> b!305478 (=> (not res!162724) (not e!191759))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305478 (= res!162724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150579))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305478 (= lt!150579 (Intermediate!2492 false resIndex!52 resX!52))))

(declare-fun b!305479 () Bool)

(assert (=> b!305479 (= e!191759 (not true))))

(assert (=> b!305479 (= index!1781 resIndex!52)))

(declare-fun lt!150581 () Unit!9391)

(assert (=> b!305479 (= lt!150581 e!191755)))

(declare-fun c!48977 () Bool)

(assert (=> b!305479 (= c!48977 (not (= resIndex!52 index!1781)))))

(declare-fun b!305480 () Bool)

(declare-fun res!162725 () Bool)

(assert (=> b!305480 (=> (not res!162725) (not e!191756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305480 (= res!162725 (validKeyInArray!0 k0!2441))))

(declare-fun b!305481 () Bool)

(assert (=> b!305481 false))

(declare-fun lt!150580 () SeekEntryResult!2492)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305481 (= lt!150580 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9395 () Unit!9391)

(assert (=> b!305481 (= e!191757 Unit!9395)))

(declare-fun b!305482 () Bool)

(declare-fun res!162728 () Bool)

(assert (=> b!305482 (=> (not res!162728) (not e!191759))))

(assert (=> b!305482 (= res!162728 (and (= (select (arr!7353 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7706 a!3293))))))

(declare-fun b!305483 () Bool)

(declare-fun res!162732 () Bool)

(assert (=> b!305483 (=> (not res!162732) (not e!191756))))

(declare-fun arrayContainsKey!0 (array!15536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305483 (= res!162732 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305484 () Bool)

(declare-fun res!162730 () Bool)

(assert (=> b!305484 (=> (not res!162730) (not e!191756))))

(assert (=> b!305484 (= res!162730 (and (= (size!7706 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7706 a!3293))))))

(assert (= (and start!30528 res!162731) b!305484))

(assert (= (and b!305484 res!162730) b!305480))

(assert (= (and b!305480 res!162725) b!305483))

(assert (= (and b!305483 res!162732) b!305471))

(assert (= (and b!305471 res!162726) b!305476))

(assert (= (and b!305476 res!162727) b!305478))

(assert (= (and b!305478 res!162724) b!305482))

(assert (= (and b!305482 res!162728) b!305474))

(assert (= (and b!305474 res!162729) b!305477))

(assert (= (and b!305477 res!162723) b!305479))

(assert (= (and b!305479 c!48977) b!305475))

(assert (= (and b!305479 (not c!48977)) b!305473))

(assert (= (and b!305475 c!48976) b!305472))

(assert (= (and b!305475 (not c!48976)) b!305481))

(declare-fun m!315871 () Bool)

(assert (=> b!305476 m!315871))

(declare-fun m!315873 () Bool)

(assert (=> b!305478 m!315873))

(assert (=> b!305478 m!315873))

(declare-fun m!315875 () Bool)

(assert (=> b!305478 m!315875))

(declare-fun m!315877 () Bool)

(assert (=> b!305480 m!315877))

(declare-fun m!315879 () Bool)

(assert (=> start!30528 m!315879))

(declare-fun m!315881 () Bool)

(assert (=> start!30528 m!315881))

(declare-fun m!315883 () Bool)

(assert (=> b!305474 m!315883))

(declare-fun m!315885 () Bool)

(assert (=> b!305481 m!315885))

(assert (=> b!305481 m!315885))

(declare-fun m!315887 () Bool)

(assert (=> b!305481 m!315887))

(declare-fun m!315889 () Bool)

(assert (=> b!305483 m!315889))

(declare-fun m!315891 () Bool)

(assert (=> b!305482 m!315891))

(declare-fun m!315893 () Bool)

(assert (=> b!305471 m!315893))

(declare-fun m!315895 () Bool)

(assert (=> b!305477 m!315895))

(assert (=> b!305475 m!315895))

(check-sat (not b!305478) (not b!305471) (not b!305480) (not b!305483) (not start!30528) (not b!305474) (not b!305476) (not b!305481))
(check-sat)
