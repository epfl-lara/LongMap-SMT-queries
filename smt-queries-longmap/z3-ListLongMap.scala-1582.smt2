; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30060 () Bool)

(assert start!30060)

(declare-fun b!301465 () Bool)

(declare-fun res!159195 () Bool)

(declare-fun e!190245 () Bool)

(assert (=> b!301465 (=> (not res!159195) (not e!190245))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301465 (= res!159195 (validKeyInArray!0 k0!2441))))

(declare-fun res!159198 () Bool)

(assert (=> start!30060 (=> (not res!159198) (not e!190245))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30060 (= res!159198 (validMask!0 mask!3709))))

(assert (=> start!30060 e!190245))

(assert (=> start!30060 true))

(declare-datatypes ((array!15263 0))(
  ( (array!15264 (arr!7222 (Array (_ BitVec 32) (_ BitVec 64))) (size!7574 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15263)

(declare-fun array_inv!5172 (array!15263) Bool)

(assert (=> start!30060 (array_inv!5172 a!3293)))

(declare-fun b!301466 () Bool)

(declare-fun res!159193 () Bool)

(assert (=> b!301466 (=> (not res!159193) (not e!190245))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2327 0))(
  ( (MissingZero!2327 (index!11484 (_ BitVec 32))) (Found!2327 (index!11485 (_ BitVec 32))) (Intermediate!2327 (undefined!3139 Bool) (index!11486 (_ BitVec 32)) (x!29868 (_ BitVec 32))) (Undefined!2327) (MissingVacant!2327 (index!11487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15263 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!301466 (= res!159193 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2327 i!1240)))))

(declare-fun b!301467 () Bool)

(declare-fun res!159196 () Bool)

(assert (=> b!301467 (=> (not res!159196) (not e!190245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15263 (_ BitVec 32)) Bool)

(assert (=> b!301467 (= res!159196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301468 () Bool)

(assert (=> b!301468 (= e!190245 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!149874 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301468 (= lt!149874 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301469 () Bool)

(declare-fun res!159194 () Bool)

(assert (=> b!301469 (=> (not res!159194) (not e!190245))))

(declare-fun arrayContainsKey!0 (array!15263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301469 (= res!159194 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301470 () Bool)

(declare-fun res!159197 () Bool)

(assert (=> b!301470 (=> (not res!159197) (not e!190245))))

(assert (=> b!301470 (= res!159197 (and (= (size!7574 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7574 a!3293))))))

(assert (= (and start!30060 res!159198) b!301470))

(assert (= (and b!301470 res!159197) b!301465))

(assert (= (and b!301465 res!159195) b!301469))

(assert (= (and b!301469 res!159194) b!301466))

(assert (= (and b!301466 res!159193) b!301467))

(assert (= (and b!301467 res!159196) b!301468))

(declare-fun m!313387 () Bool)

(assert (=> b!301469 m!313387))

(declare-fun m!313389 () Bool)

(assert (=> b!301466 m!313389))

(declare-fun m!313391 () Bool)

(assert (=> start!30060 m!313391))

(declare-fun m!313393 () Bool)

(assert (=> start!30060 m!313393))

(declare-fun m!313395 () Bool)

(assert (=> b!301465 m!313395))

(declare-fun m!313397 () Bool)

(assert (=> b!301467 m!313397))

(declare-fun m!313399 () Bool)

(assert (=> b!301468 m!313399))

(check-sat (not b!301465) (not b!301466) (not b!301469) (not b!301467) (not start!30060) (not b!301468))
(check-sat)
