; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28076 () Bool)

(assert start!28076)

(declare-fun b!287709 () Bool)

(declare-fun e!182203 () Bool)

(assert (=> b!287709 (= e!182203 false)))

(declare-datatypes ((SeekEntryResult!1995 0))(
  ( (MissingZero!1995 (index!10150 (_ BitVec 32))) (Found!1995 (index!10151 (_ BitVec 32))) (Intermediate!1995 (undefined!2807 Bool) (index!10152 (_ BitVec 32)) (x!28370 (_ BitVec 32))) (Undefined!1995) (MissingVacant!1995 (index!10153 (_ BitVec 32))) )
))
(declare-fun lt!141628 () SeekEntryResult!1995)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14435 0))(
  ( (array!14436 (arr!6846 (Array (_ BitVec 32) (_ BitVec 64))) (size!7198 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14435 (_ BitVec 32)) SeekEntryResult!1995)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287709 (= lt!141628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287710 () Bool)

(declare-fun res!149477 () Bool)

(declare-fun e!182204 () Bool)

(assert (=> b!287710 (=> (not res!149477) (not e!182204))))

(declare-fun arrayContainsKey!0 (array!14435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287710 (= res!149477 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287711 () Bool)

(assert (=> b!287711 (= e!182204 e!182203)))

(declare-fun res!149475 () Bool)

(assert (=> b!287711 (=> (not res!149475) (not e!182203))))

(declare-fun lt!141627 () SeekEntryResult!1995)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287711 (= res!149475 (or (= lt!141627 (MissingZero!1995 i!1256)) (= lt!141627 (MissingVacant!1995 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14435 (_ BitVec 32)) SeekEntryResult!1995)

(assert (=> b!287711 (= lt!141627 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!149478 () Bool)

(assert (=> start!28076 (=> (not res!149478) (not e!182204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28076 (= res!149478 (validMask!0 mask!3809))))

(assert (=> start!28076 e!182204))

(assert (=> start!28076 true))

(declare-fun array_inv!4809 (array!14435) Bool)

(assert (=> start!28076 (array_inv!4809 a!3312)))

(declare-fun b!287712 () Bool)

(declare-fun res!149474 () Bool)

(assert (=> b!287712 (=> (not res!149474) (not e!182203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14435 (_ BitVec 32)) Bool)

(assert (=> b!287712 (= res!149474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287713 () Bool)

(declare-fun res!149473 () Bool)

(assert (=> b!287713 (=> (not res!149473) (not e!182204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287713 (= res!149473 (validKeyInArray!0 k0!2524))))

(declare-fun b!287714 () Bool)

(declare-fun res!149476 () Bool)

(assert (=> b!287714 (=> (not res!149476) (not e!182204))))

(assert (=> b!287714 (= res!149476 (and (= (size!7198 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7198 a!3312))))))

(assert (= (and start!28076 res!149478) b!287714))

(assert (= (and b!287714 res!149476) b!287713))

(assert (= (and b!287713 res!149473) b!287710))

(assert (= (and b!287710 res!149477) b!287711))

(assert (= (and b!287711 res!149475) b!287712))

(assert (= (and b!287712 res!149474) b!287709))

(declare-fun m!302041 () Bool)

(assert (=> b!287710 m!302041))

(declare-fun m!302043 () Bool)

(assert (=> b!287711 m!302043))

(declare-fun m!302045 () Bool)

(assert (=> b!287713 m!302045))

(declare-fun m!302047 () Bool)

(assert (=> b!287712 m!302047))

(declare-fun m!302049 () Bool)

(assert (=> start!28076 m!302049))

(declare-fun m!302051 () Bool)

(assert (=> start!28076 m!302051))

(declare-fun m!302053 () Bool)

(assert (=> b!287709 m!302053))

(assert (=> b!287709 m!302053))

(declare-fun m!302055 () Bool)

(assert (=> b!287709 m!302055))

(check-sat (not b!287710) (not b!287713) (not b!287709) (not b!287712) (not b!287711) (not start!28076))
(check-sat)
