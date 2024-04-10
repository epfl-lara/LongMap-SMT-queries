; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30082 () Bool)

(assert start!30082)

(declare-fun b!301590 () Bool)

(declare-fun res!159272 () Bool)

(declare-fun e!190302 () Bool)

(assert (=> b!301590 (=> (not res!159272) (not e!190302))))

(declare-datatypes ((array!15272 0))(
  ( (array!15273 (arr!7227 (Array (_ BitVec 32) (_ BitVec 64))) (size!7579 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15272)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301590 (= res!159272 (and (= (size!7579 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7579 a!3293))))))

(declare-fun b!301591 () Bool)

(declare-fun res!159270 () Bool)

(assert (=> b!301591 (=> (not res!159270) (not e!190302))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301591 (= res!159270 (validKeyInArray!0 k0!2441))))

(declare-fun b!301592 () Bool)

(declare-fun res!159273 () Bool)

(assert (=> b!301592 (=> (not res!159273) (not e!190302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15272 (_ BitVec 32)) Bool)

(assert (=> b!301592 (= res!159273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301593 () Bool)

(assert (=> b!301593 (= e!190302 false)))

(declare-fun lt!149868 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301593 (= lt!149868 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301594 () Bool)

(declare-fun res!159271 () Bool)

(assert (=> b!301594 (=> (not res!159271) (not e!190302))))

(declare-datatypes ((SeekEntryResult!2367 0))(
  ( (MissingZero!2367 (index!11644 (_ BitVec 32))) (Found!2367 (index!11645 (_ BitVec 32))) (Intermediate!2367 (undefined!3179 Bool) (index!11646 (_ BitVec 32)) (x!29919 (_ BitVec 32))) (Undefined!2367) (MissingVacant!2367 (index!11647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15272 (_ BitVec 32)) SeekEntryResult!2367)

(assert (=> b!301594 (= res!159271 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2367 i!1240)))))

(declare-fun b!301595 () Bool)

(declare-fun res!159269 () Bool)

(assert (=> b!301595 (=> (not res!159269) (not e!190302))))

(declare-fun arrayContainsKey!0 (array!15272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301595 (= res!159269 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159268 () Bool)

(assert (=> start!30082 (=> (not res!159268) (not e!190302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30082 (= res!159268 (validMask!0 mask!3709))))

(assert (=> start!30082 e!190302))

(assert (=> start!30082 true))

(declare-fun array_inv!5190 (array!15272) Bool)

(assert (=> start!30082 (array_inv!5190 a!3293)))

(assert (= (and start!30082 res!159268) b!301590))

(assert (= (and b!301590 res!159272) b!301591))

(assert (= (and b!301591 res!159270) b!301595))

(assert (= (and b!301595 res!159269) b!301594))

(assert (= (and b!301594 res!159271) b!301592))

(assert (= (and b!301592 res!159273) b!301593))

(declare-fun m!313333 () Bool)

(assert (=> b!301592 m!313333))

(declare-fun m!313335 () Bool)

(assert (=> b!301593 m!313335))

(declare-fun m!313337 () Bool)

(assert (=> b!301595 m!313337))

(declare-fun m!313339 () Bool)

(assert (=> start!30082 m!313339))

(declare-fun m!313341 () Bool)

(assert (=> start!30082 m!313341))

(declare-fun m!313343 () Bool)

(assert (=> b!301591 m!313343))

(declare-fun m!313345 () Bool)

(assert (=> b!301594 m!313345))

(check-sat (not b!301592) (not b!301593) (not b!301591) (not b!301594) (not b!301595) (not start!30082))
