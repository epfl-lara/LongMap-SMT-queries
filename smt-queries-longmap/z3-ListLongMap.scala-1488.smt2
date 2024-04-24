; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28306 () Bool)

(assert start!28306)

(declare-fun b!290168 () Bool)

(declare-fun e!183627 () Bool)

(assert (=> b!290168 (= e!183627 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2054 0))(
  ( (MissingZero!2054 (index!10386 (_ BitVec 32))) (Found!2054 (index!10387 (_ BitVec 32))) (Intermediate!2054 (undefined!2866 Bool) (index!10388 (_ BitVec 32)) (x!28691 (_ BitVec 32))) (Undefined!2054) (MissingVacant!2054 (index!10389 (_ BitVec 32))) )
))
(declare-fun lt!143340 () SeekEntryResult!2054)

(declare-datatypes ((array!14625 0))(
  ( (array!14626 (arr!6940 (Array (_ BitVec 32) (_ BitVec 64))) (size!7292 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14625)

(declare-fun lt!143339 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14625 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!290168 (= lt!143340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143339 k0!2524 (array!14626 (store (arr!6940 a!3312) i!1256 k0!2524) (size!7292 a!3312)) mask!3809))))

(declare-fun lt!143337 () SeekEntryResult!2054)

(assert (=> b!290168 (= lt!143337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143339 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290168 (= lt!143339 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290169 () Bool)

(declare-fun res!151621 () Bool)

(assert (=> b!290169 (=> (not res!151621) (not e!183627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14625 (_ BitVec 32)) Bool)

(assert (=> b!290169 (= res!151621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290170 () Bool)

(declare-fun res!151625 () Bool)

(declare-fun e!183628 () Bool)

(assert (=> b!290170 (=> (not res!151625) (not e!183628))))

(declare-fun arrayContainsKey!0 (array!14625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290170 (= res!151625 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290171 () Bool)

(assert (=> b!290171 (= e!183628 e!183627)))

(declare-fun res!151624 () Bool)

(assert (=> b!290171 (=> (not res!151624) (not e!183627))))

(declare-fun lt!143338 () SeekEntryResult!2054)

(assert (=> b!290171 (= res!151624 (or (= lt!143338 (MissingZero!2054 i!1256)) (= lt!143338 (MissingVacant!2054 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14625 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!290171 (= lt!143338 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151623 () Bool)

(assert (=> start!28306 (=> (not res!151623) (not e!183628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28306 (= res!151623 (validMask!0 mask!3809))))

(assert (=> start!28306 e!183628))

(assert (=> start!28306 true))

(declare-fun array_inv!4890 (array!14625) Bool)

(assert (=> start!28306 (array_inv!4890 a!3312)))

(declare-fun b!290172 () Bool)

(declare-fun res!151626 () Bool)

(assert (=> b!290172 (=> (not res!151626) (not e!183628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290172 (= res!151626 (validKeyInArray!0 k0!2524))))

(declare-fun b!290173 () Bool)

(declare-fun res!151622 () Bool)

(assert (=> b!290173 (=> (not res!151622) (not e!183628))))

(assert (=> b!290173 (= res!151622 (and (= (size!7292 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7292 a!3312))))))

(assert (= (and start!28306 res!151623) b!290173))

(assert (= (and b!290173 res!151622) b!290172))

(assert (= (and b!290172 res!151626) b!290170))

(assert (= (and b!290170 res!151625) b!290171))

(assert (= (and b!290171 res!151624) b!290169))

(assert (= (and b!290169 res!151621) b!290168))

(declare-fun m!304433 () Bool)

(assert (=> b!290171 m!304433))

(declare-fun m!304435 () Bool)

(assert (=> b!290169 m!304435))

(declare-fun m!304437 () Bool)

(assert (=> b!290170 m!304437))

(declare-fun m!304439 () Bool)

(assert (=> start!28306 m!304439))

(declare-fun m!304441 () Bool)

(assert (=> start!28306 m!304441))

(declare-fun m!304443 () Bool)

(assert (=> b!290168 m!304443))

(declare-fun m!304445 () Bool)

(assert (=> b!290168 m!304445))

(declare-fun m!304447 () Bool)

(assert (=> b!290168 m!304447))

(declare-fun m!304449 () Bool)

(assert (=> b!290168 m!304449))

(declare-fun m!304451 () Bool)

(assert (=> b!290172 m!304451))

(check-sat (not b!290171) (not b!290172) (not start!28306) (not b!290170) (not b!290169) (not b!290168))
(check-sat)
