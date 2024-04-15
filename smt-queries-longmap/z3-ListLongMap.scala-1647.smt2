; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30648 () Bool)

(assert start!30648)

(declare-fun b!307497 () Bool)

(declare-fun res!164400 () Bool)

(declare-fun e!192435 () Bool)

(assert (=> b!307497 (=> (not res!164400) (not e!192435))))

(declare-datatypes ((array!15656 0))(
  ( (array!15657 (arr!7413 (Array (_ BitVec 32) (_ BitVec 64))) (size!7766 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15656)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!307497 (= res!164400 (and (= (select (arr!7413 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7766 a!3293))))))

(declare-fun b!307498 () Bool)

(declare-fun res!164399 () Bool)

(declare-fun e!192436 () Bool)

(assert (=> b!307498 (=> (not res!164399) (not e!192436))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307498 (= res!164399 (validKeyInArray!0 k0!2441))))

(declare-fun b!307499 () Bool)

(assert (=> b!307499 (= e!192435 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150938 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307499 (= lt!150938 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307500 () Bool)

(declare-fun res!164398 () Bool)

(assert (=> b!307500 (=> (not res!164398) (not e!192436))))

(assert (=> b!307500 (= res!164398 (and (= (size!7766 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7766 a!3293))))))

(declare-fun b!307501 () Bool)

(declare-fun res!164403 () Bool)

(assert (=> b!307501 (=> (not res!164403) (not e!192436))))

(declare-datatypes ((SeekEntryResult!2552 0))(
  ( (MissingZero!2552 (index!12384 (_ BitVec 32))) (Found!2552 (index!12385 (_ BitVec 32))) (Intermediate!2552 (undefined!3364 Bool) (index!12386 (_ BitVec 32)) (x!30638 (_ BitVec 32))) (Undefined!2552) (MissingVacant!2552 (index!12387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15656 (_ BitVec 32)) SeekEntryResult!2552)

(assert (=> b!307501 (= res!164403 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2552 i!1240)))))

(declare-fun b!307502 () Bool)

(declare-fun res!164406 () Bool)

(assert (=> b!307502 (=> (not res!164406) (not e!192435))))

(assert (=> b!307502 (= res!164406 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7413 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun res!164401 () Bool)

(assert (=> start!30648 (=> (not res!164401) (not e!192436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30648 (= res!164401 (validMask!0 mask!3709))))

(assert (=> start!30648 e!192436))

(declare-fun array_inv!5385 (array!15656) Bool)

(assert (=> start!30648 (array_inv!5385 a!3293)))

(assert (=> start!30648 true))

(declare-fun b!307503 () Bool)

(declare-fun res!164402 () Bool)

(assert (=> b!307503 (=> (not res!164402) (not e!192435))))

(declare-fun lt!150937 () SeekEntryResult!2552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15656 (_ BitVec 32)) SeekEntryResult!2552)

(assert (=> b!307503 (= res!164402 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150937))))

(declare-fun b!307504 () Bool)

(assert (=> b!307504 (= e!192436 e!192435)))

(declare-fun res!164404 () Bool)

(assert (=> b!307504 (=> (not res!164404) (not e!192435))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307504 (= res!164404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150937))))

(assert (=> b!307504 (= lt!150937 (Intermediate!2552 false resIndex!52 resX!52))))

(declare-fun b!307505 () Bool)

(declare-fun res!164397 () Bool)

(assert (=> b!307505 (=> (not res!164397) (not e!192436))))

(declare-fun arrayContainsKey!0 (array!15656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307505 (= res!164397 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307506 () Bool)

(declare-fun res!164405 () Bool)

(assert (=> b!307506 (=> (not res!164405) (not e!192436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15656 (_ BitVec 32)) Bool)

(assert (=> b!307506 (= res!164405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30648 res!164401) b!307500))

(assert (= (and b!307500 res!164398) b!307498))

(assert (= (and b!307498 res!164399) b!307505))

(assert (= (and b!307505 res!164397) b!307501))

(assert (= (and b!307501 res!164403) b!307506))

(assert (= (and b!307506 res!164405) b!307504))

(assert (= (and b!307504 res!164404) b!307497))

(assert (= (and b!307497 res!164400) b!307503))

(assert (= (and b!307503 res!164402) b!307502))

(assert (= (and b!307502 res!164406) b!307499))

(declare-fun m!317287 () Bool)

(assert (=> b!307497 m!317287))

(declare-fun m!317289 () Bool)

(assert (=> b!307506 m!317289))

(declare-fun m!317291 () Bool)

(assert (=> b!307502 m!317291))

(declare-fun m!317293 () Bool)

(assert (=> b!307501 m!317293))

(declare-fun m!317295 () Bool)

(assert (=> start!30648 m!317295))

(declare-fun m!317297 () Bool)

(assert (=> start!30648 m!317297))

(declare-fun m!317299 () Bool)

(assert (=> b!307499 m!317299))

(declare-fun m!317301 () Bool)

(assert (=> b!307504 m!317301))

(assert (=> b!307504 m!317301))

(declare-fun m!317303 () Bool)

(assert (=> b!307504 m!317303))

(declare-fun m!317305 () Bool)

(assert (=> b!307505 m!317305))

(declare-fun m!317307 () Bool)

(assert (=> b!307498 m!317307))

(declare-fun m!317309 () Bool)

(assert (=> b!307503 m!317309))

(check-sat (not b!307505) (not b!307499) (not b!307501) (not b!307503) (not b!307506) (not b!307504) (not b!307498) (not start!30648))
(check-sat)
