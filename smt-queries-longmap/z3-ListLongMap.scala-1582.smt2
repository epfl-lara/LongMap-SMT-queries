; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30060 () Bool)

(assert start!30060)

(declare-fun res!159070 () Bool)

(declare-fun e!190102 () Bool)

(assert (=> start!30060 (=> (not res!159070) (not e!190102))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30060 (= res!159070 (validMask!0 mask!3709))))

(assert (=> start!30060 e!190102))

(assert (=> start!30060 true))

(declare-datatypes ((array!15254 0))(
  ( (array!15255 (arr!7218 (Array (_ BitVec 32) (_ BitVec 64))) (size!7571 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15254)

(declare-fun array_inv!5190 (array!15254) Bool)

(assert (=> start!30060 (array_inv!5190 a!3293)))

(declare-fun b!301243 () Bool)

(declare-fun res!159069 () Bool)

(assert (=> b!301243 (=> (not res!159069) (not e!190102))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301243 (= res!159069 (and (= (size!7571 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7571 a!3293))))))

(declare-fun b!301244 () Bool)

(declare-fun res!159071 () Bool)

(assert (=> b!301244 (=> (not res!159071) (not e!190102))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301244 (= res!159071 (validKeyInArray!0 k0!2441))))

(declare-fun b!301245 () Bool)

(declare-fun res!159068 () Bool)

(assert (=> b!301245 (=> (not res!159068) (not e!190102))))

(declare-fun arrayContainsKey!0 (array!15254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301245 (= res!159068 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301246 () Bool)

(assert (=> b!301246 (= e!190102 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!149621 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301246 (= lt!149621 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301247 () Bool)

(declare-fun res!159067 () Bool)

(assert (=> b!301247 (=> (not res!159067) (not e!190102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15254 (_ BitVec 32)) Bool)

(assert (=> b!301247 (= res!159067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301248 () Bool)

(declare-fun res!159072 () Bool)

(assert (=> b!301248 (=> (not res!159072) (not e!190102))))

(declare-datatypes ((SeekEntryResult!2357 0))(
  ( (MissingZero!2357 (index!11604 (_ BitVec 32))) (Found!2357 (index!11605 (_ BitVec 32))) (Intermediate!2357 (undefined!3169 Bool) (index!11606 (_ BitVec 32)) (x!29896 (_ BitVec 32))) (Undefined!2357) (MissingVacant!2357 (index!11607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15254 (_ BitVec 32)) SeekEntryResult!2357)

(assert (=> b!301248 (= res!159072 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2357 i!1240)))))

(assert (= (and start!30060 res!159070) b!301243))

(assert (= (and b!301243 res!159069) b!301244))

(assert (= (and b!301244 res!159071) b!301245))

(assert (= (and b!301245 res!159068) b!301248))

(assert (= (and b!301248 res!159072) b!301247))

(assert (= (and b!301247 res!159067) b!301246))

(declare-fun m!312547 () Bool)

(assert (=> start!30060 m!312547))

(declare-fun m!312549 () Bool)

(assert (=> start!30060 m!312549))

(declare-fun m!312551 () Bool)

(assert (=> b!301245 m!312551))

(declare-fun m!312553 () Bool)

(assert (=> b!301246 m!312553))

(declare-fun m!312555 () Bool)

(assert (=> b!301248 m!312555))

(declare-fun m!312557 () Bool)

(assert (=> b!301247 m!312557))

(declare-fun m!312559 () Bool)

(assert (=> b!301244 m!312559))

(check-sat (not b!301247) (not b!301245) (not b!301246) (not start!30060) (not b!301248) (not b!301244))
(check-sat)
