; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28304 () Bool)

(assert start!28304)

(declare-fun b!289920 () Bool)

(declare-fun res!151453 () Bool)

(declare-fun e!183476 () Bool)

(assert (=> b!289920 (=> (not res!151453) (not e!183476))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14611 0))(
  ( (array!14612 (arr!6933 (Array (_ BitVec 32) (_ BitVec 64))) (size!7286 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14611)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289920 (= res!151453 (and (= (size!7286 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7286 a!3312))))))

(declare-fun b!289921 () Bool)

(declare-fun e!183477 () Bool)

(assert (=> b!289921 (= e!183476 e!183477)))

(declare-fun res!151451 () Bool)

(assert (=> b!289921 (=> (not res!151451) (not e!183477))))

(declare-datatypes ((SeekEntryResult!2081 0))(
  ( (MissingZero!2081 (index!10494 (_ BitVec 32))) (Found!2081 (index!10495 (_ BitVec 32))) (Intermediate!2081 (undefined!2893 Bool) (index!10496 (_ BitVec 32)) (x!28709 (_ BitVec 32))) (Undefined!2081) (MissingVacant!2081 (index!10497 (_ BitVec 32))) )
))
(declare-fun lt!143061 () SeekEntryResult!2081)

(assert (=> b!289921 (= res!151451 (or (= lt!143061 (MissingZero!2081 i!1256)) (= lt!143061 (MissingVacant!2081 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14611 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!289921 (= lt!143061 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289922 () Bool)

(declare-fun res!151454 () Bool)

(assert (=> b!289922 (=> (not res!151454) (not e!183477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14611 (_ BitVec 32)) Bool)

(assert (=> b!289922 (= res!151454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289923 () Bool)

(declare-fun res!151452 () Bool)

(assert (=> b!289923 (=> (not res!151452) (not e!183476))))

(declare-fun arrayContainsKey!0 (array!14611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289923 (= res!151452 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151456 () Bool)

(assert (=> start!28304 (=> (not res!151456) (not e!183476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28304 (= res!151456 (validMask!0 mask!3809))))

(assert (=> start!28304 e!183476))

(assert (=> start!28304 true))

(declare-fun array_inv!4905 (array!14611) Bool)

(assert (=> start!28304 (array_inv!4905 a!3312)))

(declare-fun b!289924 () Bool)

(assert (=> b!289924 (= e!183477 false)))

(declare-fun lt!143063 () SeekEntryResult!2081)

(declare-fun lt!143062 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14611 (_ BitVec 32)) SeekEntryResult!2081)

(assert (=> b!289924 (= lt!143063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143062 k0!2524 (array!14612 (store (arr!6933 a!3312) i!1256 k0!2524) (size!7286 a!3312)) mask!3809))))

(declare-fun lt!143064 () SeekEntryResult!2081)

(assert (=> b!289924 (= lt!143064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143062 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289924 (= lt!143062 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289925 () Bool)

(declare-fun res!151455 () Bool)

(assert (=> b!289925 (=> (not res!151455) (not e!183476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289925 (= res!151455 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28304 res!151456) b!289920))

(assert (= (and b!289920 res!151453) b!289925))

(assert (= (and b!289925 res!151455) b!289923))

(assert (= (and b!289923 res!151452) b!289921))

(assert (= (and b!289921 res!151451) b!289922))

(assert (= (and b!289922 res!151454) b!289924))

(declare-fun m!303575 () Bool)

(assert (=> b!289924 m!303575))

(declare-fun m!303577 () Bool)

(assert (=> b!289924 m!303577))

(declare-fun m!303579 () Bool)

(assert (=> b!289924 m!303579))

(declare-fun m!303581 () Bool)

(assert (=> b!289924 m!303581))

(declare-fun m!303583 () Bool)

(assert (=> b!289921 m!303583))

(declare-fun m!303585 () Bool)

(assert (=> b!289925 m!303585))

(declare-fun m!303587 () Bool)

(assert (=> b!289922 m!303587))

(declare-fun m!303589 () Bool)

(assert (=> start!28304 m!303589))

(declare-fun m!303591 () Bool)

(assert (=> start!28304 m!303591))

(declare-fun m!303593 () Bool)

(assert (=> b!289923 m!303593))

(check-sat (not b!289921) (not start!28304) (not b!289925) (not b!289922) (not b!289923) (not b!289924))
(check-sat)
