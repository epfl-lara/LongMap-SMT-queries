; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30406 () Bool)

(assert start!30406)

(declare-fun b!304283 () Bool)

(declare-fun res!161630 () Bool)

(declare-fun e!191286 () Bool)

(assert (=> b!304283 (=> (not res!161630) (not e!191286))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15461 0))(
  ( (array!15462 (arr!7317 (Array (_ BitVec 32) (_ BitVec 64))) (size!7669 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15461)

(assert (=> b!304283 (= res!161630 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7317 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7317 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7317 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304284 () Bool)

(declare-fun res!161633 () Bool)

(assert (=> b!304284 (=> (not res!161633) (not e!191286))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2457 0))(
  ( (MissingZero!2457 (index!12004 (_ BitVec 32))) (Found!2457 (index!12005 (_ BitVec 32))) (Intermediate!2457 (undefined!3269 Bool) (index!12006 (_ BitVec 32)) (x!30267 (_ BitVec 32))) (Undefined!2457) (MissingVacant!2457 (index!12007 (_ BitVec 32))) )
))
(declare-fun lt!150420 () SeekEntryResult!2457)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15461 (_ BitVec 32)) SeekEntryResult!2457)

(assert (=> b!304284 (= res!161633 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150420))))

(declare-fun b!304285 () Bool)

(declare-fun e!191285 () Bool)

(assert (=> b!304285 (= e!191285 e!191286)))

(declare-fun res!161632 () Bool)

(assert (=> b!304285 (=> (not res!161632) (not e!191286))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304285 (= res!161632 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150420))))

(assert (=> b!304285 (= lt!150420 (Intermediate!2457 false resIndex!52 resX!52))))

(declare-fun b!304286 () Bool)

(declare-fun lt!150419 () (_ BitVec 32))

(assert (=> b!304286 (= e!191286 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!150419 #b00000000000000000000000000000000) (bvslt lt!150419 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304286 (= lt!150419 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304287 () Bool)

(declare-fun res!161637 () Bool)

(assert (=> b!304287 (=> (not res!161637) (not e!191285))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15461 (_ BitVec 32)) SeekEntryResult!2457)

(assert (=> b!304287 (= res!161637 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2457 i!1240)))))

(declare-fun res!161628 () Bool)

(assert (=> start!30406 (=> (not res!161628) (not e!191285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30406 (= res!161628 (validMask!0 mask!3709))))

(assert (=> start!30406 e!191285))

(declare-fun array_inv!5280 (array!15461) Bool)

(assert (=> start!30406 (array_inv!5280 a!3293)))

(assert (=> start!30406 true))

(declare-fun b!304288 () Bool)

(declare-fun res!161629 () Bool)

(assert (=> b!304288 (=> (not res!161629) (not e!191286))))

(assert (=> b!304288 (= res!161629 (and (= (select (arr!7317 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7669 a!3293))))))

(declare-fun b!304289 () Bool)

(declare-fun res!161635 () Bool)

(assert (=> b!304289 (=> (not res!161635) (not e!191285))))

(assert (=> b!304289 (= res!161635 (and (= (size!7669 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7669 a!3293))))))

(declare-fun b!304290 () Bool)

(declare-fun res!161634 () Bool)

(assert (=> b!304290 (=> (not res!161634) (not e!191285))))

(declare-fun arrayContainsKey!0 (array!15461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304290 (= res!161634 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304291 () Bool)

(declare-fun res!161631 () Bool)

(assert (=> b!304291 (=> (not res!161631) (not e!191285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304291 (= res!161631 (validKeyInArray!0 k0!2441))))

(declare-fun b!304292 () Bool)

(declare-fun res!161636 () Bool)

(assert (=> b!304292 (=> (not res!161636) (not e!191285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15461 (_ BitVec 32)) Bool)

(assert (=> b!304292 (= res!161636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30406 res!161628) b!304289))

(assert (= (and b!304289 res!161635) b!304291))

(assert (= (and b!304291 res!161631) b!304290))

(assert (= (and b!304290 res!161634) b!304287))

(assert (= (and b!304287 res!161637) b!304292))

(assert (= (and b!304292 res!161636) b!304285))

(assert (= (and b!304285 res!161632) b!304288))

(assert (= (and b!304288 res!161629) b!304284))

(assert (= (and b!304284 res!161633) b!304283))

(assert (= (and b!304283 res!161630) b!304286))

(declare-fun m!315407 () Bool)

(assert (=> b!304288 m!315407))

(declare-fun m!315409 () Bool)

(assert (=> b!304290 m!315409))

(declare-fun m!315411 () Bool)

(assert (=> b!304292 m!315411))

(declare-fun m!315413 () Bool)

(assert (=> b!304285 m!315413))

(assert (=> b!304285 m!315413))

(declare-fun m!315415 () Bool)

(assert (=> b!304285 m!315415))

(declare-fun m!315417 () Bool)

(assert (=> b!304287 m!315417))

(declare-fun m!315419 () Bool)

(assert (=> b!304283 m!315419))

(declare-fun m!315421 () Bool)

(assert (=> b!304286 m!315421))

(declare-fun m!315423 () Bool)

(assert (=> b!304284 m!315423))

(declare-fun m!315425 () Bool)

(assert (=> b!304291 m!315425))

(declare-fun m!315427 () Bool)

(assert (=> start!30406 m!315427))

(declare-fun m!315429 () Bool)

(assert (=> start!30406 m!315429))

(check-sat (not start!30406) (not b!304292) (not b!304287) (not b!304290) (not b!304284) (not b!304291) (not b!304286) (not b!304285))
(check-sat)
