; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30396 () Bool)

(assert start!30396)

(declare-fun b!304290 () Bool)

(declare-fun e!191270 () Bool)

(assert (=> b!304290 (= e!191270 false)))

(declare-fun lt!150449 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304290 (= lt!150449 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!304291 () Bool)

(declare-fun e!191269 () Bool)

(assert (=> b!304291 (= e!191269 e!191270)))

(declare-fun res!161694 () Bool)

(assert (=> b!304291 (=> (not res!161694) (not e!191270))))

(declare-datatypes ((SeekEntryResult!2423 0))(
  ( (MissingZero!2423 (index!11868 (_ BitVec 32))) (Found!2423 (index!11869 (_ BitVec 32))) (Intermediate!2423 (undefined!3235 Bool) (index!11870 (_ BitVec 32)) (x!30238 (_ BitVec 32))) (Undefined!2423) (MissingVacant!2423 (index!11871 (_ BitVec 32))) )
))
(declare-fun lt!150450 () SeekEntryResult!2423)

(declare-datatypes ((array!15464 0))(
  ( (array!15465 (arr!7318 (Array (_ BitVec 32) (_ BitVec 64))) (size!7670 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15464)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15464 (_ BitVec 32)) SeekEntryResult!2423)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304291 (= res!161694 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150450))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304291 (= lt!150450 (Intermediate!2423 false resIndex!52 resX!52))))

(declare-fun b!304292 () Bool)

(declare-fun res!161690 () Bool)

(assert (=> b!304292 (=> (not res!161690) (not e!191270))))

(assert (=> b!304292 (= res!161690 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150450))))

(declare-fun b!304293 () Bool)

(declare-fun res!161685 () Bool)

(assert (=> b!304293 (=> (not res!161685) (not e!191269))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304293 (= res!161685 (and (= (size!7670 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7670 a!3293))))))

(declare-fun b!304295 () Bool)

(declare-fun res!161693 () Bool)

(assert (=> b!304295 (=> (not res!161693) (not e!191269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15464 (_ BitVec 32)) Bool)

(assert (=> b!304295 (= res!161693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304296 () Bool)

(declare-fun res!161688 () Bool)

(assert (=> b!304296 (=> (not res!161688) (not e!191270))))

(assert (=> b!304296 (= res!161688 (and (= (select (arr!7318 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7670 a!3293))))))

(declare-fun b!304297 () Bool)

(declare-fun res!161691 () Bool)

(assert (=> b!304297 (=> (not res!161691) (not e!191269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304297 (= res!161691 (validKeyInArray!0 k0!2441))))

(declare-fun b!304298 () Bool)

(declare-fun res!161686 () Bool)

(assert (=> b!304298 (=> (not res!161686) (not e!191269))))

(declare-fun arrayContainsKey!0 (array!15464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304298 (= res!161686 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304299 () Bool)

(declare-fun res!161689 () Bool)

(assert (=> b!304299 (=> (not res!161689) (not e!191270))))

(assert (=> b!304299 (= res!161689 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7318 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7318 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7318 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304294 () Bool)

(declare-fun res!161687 () Bool)

(assert (=> b!304294 (=> (not res!161687) (not e!191269))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15464 (_ BitVec 32)) SeekEntryResult!2423)

(assert (=> b!304294 (= res!161687 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2423 i!1240)))))

(declare-fun res!161692 () Bool)

(assert (=> start!30396 (=> (not res!161692) (not e!191269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30396 (= res!161692 (validMask!0 mask!3709))))

(assert (=> start!30396 e!191269))

(declare-fun array_inv!5268 (array!15464) Bool)

(assert (=> start!30396 (array_inv!5268 a!3293)))

(assert (=> start!30396 true))

(assert (= (and start!30396 res!161692) b!304293))

(assert (= (and b!304293 res!161685) b!304297))

(assert (= (and b!304297 res!161691) b!304298))

(assert (= (and b!304298 res!161686) b!304294))

(assert (= (and b!304294 res!161687) b!304295))

(assert (= (and b!304295 res!161693) b!304291))

(assert (= (and b!304291 res!161694) b!304296))

(assert (= (and b!304296 res!161688) b!304292))

(assert (= (and b!304292 res!161690) b!304299))

(assert (= (and b!304299 res!161689) b!304290))

(declare-fun m!315571 () Bool)

(assert (=> b!304294 m!315571))

(declare-fun m!315573 () Bool)

(assert (=> b!304296 m!315573))

(declare-fun m!315575 () Bool)

(assert (=> b!304298 m!315575))

(declare-fun m!315577 () Bool)

(assert (=> start!30396 m!315577))

(declare-fun m!315579 () Bool)

(assert (=> start!30396 m!315579))

(declare-fun m!315581 () Bool)

(assert (=> b!304297 m!315581))

(declare-fun m!315583 () Bool)

(assert (=> b!304295 m!315583))

(declare-fun m!315585 () Bool)

(assert (=> b!304292 m!315585))

(declare-fun m!315587 () Bool)

(assert (=> b!304291 m!315587))

(assert (=> b!304291 m!315587))

(declare-fun m!315589 () Bool)

(assert (=> b!304291 m!315589))

(declare-fun m!315591 () Bool)

(assert (=> b!304299 m!315591))

(declare-fun m!315593 () Bool)

(assert (=> b!304290 m!315593))

(check-sat (not b!304298) (not b!304297) (not b!304290) (not b!304294) (not b!304291) (not b!304295) (not b!304292) (not start!30396))
(check-sat)
