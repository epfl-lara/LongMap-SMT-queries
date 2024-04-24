; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28078 () Bool)

(assert start!28078)

(declare-fun b!287846 () Bool)

(declare-fun res!149584 () Bool)

(declare-fun e!182273 () Bool)

(assert (=> b!287846 (=> (not res!149584) (not e!182273))))

(declare-datatypes ((array!14442 0))(
  ( (array!14443 (arr!6850 (Array (_ BitVec 32) (_ BitVec 64))) (size!7202 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14442)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287846 (= res!149584 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287847 () Bool)

(declare-fun e!182271 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287847 (= e!182271 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141739 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1964 0))(
  ( (MissingZero!1964 (index!10026 (_ BitVec 32))) (Found!1964 (index!10027 (_ BitVec 32))) (Intermediate!1964 (undefined!2776 Bool) (index!10028 (_ BitVec 32)) (x!28355 (_ BitVec 32))) (Undefined!1964) (MissingVacant!1964 (index!10029 (_ BitVec 32))) )
))
(declare-fun lt!141741 () SeekEntryResult!1964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14442 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> b!287847 (= lt!141741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141739 k0!2524 (array!14443 (store (arr!6850 a!3312) i!1256 k0!2524) (size!7202 a!3312)) mask!3809))))

(declare-fun lt!141740 () SeekEntryResult!1964)

(assert (=> b!287847 (= lt!141740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141739 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287847 (= lt!141739 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!287848 () Bool)

(declare-fun res!149588 () Bool)

(assert (=> b!287848 (=> (not res!149588) (not e!182271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14442 (_ BitVec 32)) Bool)

(assert (=> b!287848 (= res!149588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149586 () Bool)

(assert (=> start!28078 (=> (not res!149586) (not e!182273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28078 (= res!149586 (validMask!0 mask!3809))))

(assert (=> start!28078 e!182273))

(assert (=> start!28078 true))

(declare-fun array_inv!4800 (array!14442) Bool)

(assert (=> start!28078 (array_inv!4800 a!3312)))

(declare-fun b!287849 () Bool)

(declare-fun res!149589 () Bool)

(assert (=> b!287849 (=> (not res!149589) (not e!182273))))

(assert (=> b!287849 (= res!149589 (and (= (size!7202 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7202 a!3312))))))

(declare-fun b!287850 () Bool)

(assert (=> b!287850 (= e!182273 e!182271)))

(declare-fun res!149585 () Bool)

(assert (=> b!287850 (=> (not res!149585) (not e!182271))))

(declare-fun lt!141738 () SeekEntryResult!1964)

(assert (=> b!287850 (= res!149585 (or (= lt!141738 (MissingZero!1964 i!1256)) (= lt!141738 (MissingVacant!1964 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14442 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> b!287850 (= lt!141738 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287851 () Bool)

(declare-fun res!149587 () Bool)

(assert (=> b!287851 (=> (not res!149587) (not e!182273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287851 (= res!149587 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28078 res!149586) b!287849))

(assert (= (and b!287849 res!149589) b!287851))

(assert (= (and b!287851 res!149587) b!287846))

(assert (= (and b!287846 res!149584) b!287850))

(assert (= (and b!287850 res!149585) b!287848))

(assert (= (and b!287848 res!149588) b!287847))

(declare-fun m!302339 () Bool)

(assert (=> b!287846 m!302339))

(declare-fun m!302341 () Bool)

(assert (=> b!287851 m!302341))

(declare-fun m!302343 () Bool)

(assert (=> start!28078 m!302343))

(declare-fun m!302345 () Bool)

(assert (=> start!28078 m!302345))

(declare-fun m!302347 () Bool)

(assert (=> b!287848 m!302347))

(declare-fun m!302349 () Bool)

(assert (=> b!287850 m!302349))

(declare-fun m!302351 () Bool)

(assert (=> b!287847 m!302351))

(declare-fun m!302353 () Bool)

(assert (=> b!287847 m!302353))

(declare-fun m!302355 () Bool)

(assert (=> b!287847 m!302355))

(declare-fun m!302357 () Bool)

(assert (=> b!287847 m!302357))

(check-sat (not b!287846) (not b!287851) (not b!287850) (not b!287848) (not b!287847) (not start!28078))
(check-sat)
