; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30412 () Bool)

(assert start!30412)

(declare-fun b!304373 () Bool)

(declare-fun e!191313 () Bool)

(declare-fun e!191312 () Bool)

(assert (=> b!304373 (= e!191313 e!191312)))

(declare-fun res!161723 () Bool)

(assert (=> b!304373 (=> (not res!161723) (not e!191312))))

(declare-datatypes ((array!15467 0))(
  ( (array!15468 (arr!7320 (Array (_ BitVec 32) (_ BitVec 64))) (size!7672 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15467)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2460 0))(
  ( (MissingZero!2460 (index!12016 (_ BitVec 32))) (Found!2460 (index!12017 (_ BitVec 32))) (Intermediate!2460 (undefined!3272 Bool) (index!12018 (_ BitVec 32)) (x!30278 (_ BitVec 32))) (Undefined!2460) (MissingVacant!2460 (index!12019 (_ BitVec 32))) )
))
(declare-fun lt!150438 () SeekEntryResult!2460)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15467 (_ BitVec 32)) SeekEntryResult!2460)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304373 (= res!161723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150438))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304373 (= lt!150438 (Intermediate!2460 false resIndex!52 resX!52))))

(declare-fun b!304374 () Bool)

(declare-fun res!161726 () Bool)

(assert (=> b!304374 (=> (not res!161726) (not e!191313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15467 (_ BitVec 32)) Bool)

(assert (=> b!304374 (= res!161726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304375 () Bool)

(declare-fun res!161720 () Bool)

(assert (=> b!304375 (=> (not res!161720) (not e!191313))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304375 (= res!161720 (and (= (size!7672 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7672 a!3293))))))

(declare-fun b!304376 () Bool)

(declare-fun res!161725 () Bool)

(assert (=> b!304376 (=> (not res!161725) (not e!191312))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304376 (= res!161725 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150438))))

(declare-fun b!304377 () Bool)

(declare-fun res!161724 () Bool)

(assert (=> b!304377 (=> (not res!161724) (not e!191313))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15467 (_ BitVec 32)) SeekEntryResult!2460)

(assert (=> b!304377 (= res!161724 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2460 i!1240)))))

(declare-fun b!304378 () Bool)

(declare-fun res!161719 () Bool)

(assert (=> b!304378 (=> (not res!161719) (not e!191312))))

(assert (=> b!304378 (= res!161719 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7320 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7320 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7320 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!161727 () Bool)

(assert (=> start!30412 (=> (not res!161727) (not e!191313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30412 (= res!161727 (validMask!0 mask!3709))))

(assert (=> start!30412 e!191313))

(declare-fun array_inv!5283 (array!15467) Bool)

(assert (=> start!30412 (array_inv!5283 a!3293)))

(assert (=> start!30412 true))

(declare-fun b!304379 () Bool)

(declare-fun res!161718 () Bool)

(assert (=> b!304379 (=> (not res!161718) (not e!191313))))

(declare-fun arrayContainsKey!0 (array!15467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304379 (= res!161718 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304380 () Bool)

(declare-fun res!161721 () Bool)

(assert (=> b!304380 (=> (not res!161721) (not e!191312))))

(assert (=> b!304380 (= res!161721 (and (= (select (arr!7320 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7672 a!3293))))))

(declare-fun b!304381 () Bool)

(declare-fun res!161722 () Bool)

(assert (=> b!304381 (=> (not res!161722) (not e!191313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304381 (= res!161722 (validKeyInArray!0 k0!2441))))

(declare-fun b!304382 () Bool)

(assert (=> b!304382 (= e!191312 false)))

(declare-fun lt!150437 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304382 (= lt!150437 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30412 res!161727) b!304375))

(assert (= (and b!304375 res!161720) b!304381))

(assert (= (and b!304381 res!161722) b!304379))

(assert (= (and b!304379 res!161718) b!304377))

(assert (= (and b!304377 res!161724) b!304374))

(assert (= (and b!304374 res!161726) b!304373))

(assert (= (and b!304373 res!161723) b!304380))

(assert (= (and b!304380 res!161721) b!304376))

(assert (= (and b!304376 res!161725) b!304378))

(assert (= (and b!304378 res!161719) b!304382))

(declare-fun m!315479 () Bool)

(assert (=> b!304376 m!315479))

(declare-fun m!315481 () Bool)

(assert (=> start!30412 m!315481))

(declare-fun m!315483 () Bool)

(assert (=> start!30412 m!315483))

(declare-fun m!315485 () Bool)

(assert (=> b!304379 m!315485))

(declare-fun m!315487 () Bool)

(assert (=> b!304377 m!315487))

(declare-fun m!315489 () Bool)

(assert (=> b!304373 m!315489))

(assert (=> b!304373 m!315489))

(declare-fun m!315491 () Bool)

(assert (=> b!304373 m!315491))

(declare-fun m!315493 () Bool)

(assert (=> b!304380 m!315493))

(declare-fun m!315495 () Bool)

(assert (=> b!304378 m!315495))

(declare-fun m!315497 () Bool)

(assert (=> b!304374 m!315497))

(declare-fun m!315499 () Bool)

(assert (=> b!304381 m!315499))

(declare-fun m!315501 () Bool)

(assert (=> b!304382 m!315501))

(check-sat (not b!304382) (not b!304376) (not b!304373) (not start!30412) (not b!304381) (not b!304374) (not b!304379) (not b!304377))
(check-sat)
