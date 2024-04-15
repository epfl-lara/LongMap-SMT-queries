; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28316 () Bool)

(assert start!28316)

(declare-fun b!290028 () Bool)

(declare-fun res!151559 () Bool)

(declare-fun e!183531 () Bool)

(assert (=> b!290028 (=> (not res!151559) (not e!183531))))

(declare-datatypes ((array!14623 0))(
  ( (array!14624 (arr!6939 (Array (_ BitVec 32) (_ BitVec 64))) (size!7292 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14623)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14623 (_ BitVec 32)) Bool)

(assert (=> b!290028 (= res!151559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290029 () Bool)

(declare-fun res!151561 () Bool)

(declare-fun e!183529 () Bool)

(assert (=> b!290029 (=> (not res!151561) (not e!183529))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290029 (= res!151561 (validKeyInArray!0 k0!2524))))

(declare-fun b!290030 () Bool)

(declare-fun res!151562 () Bool)

(assert (=> b!290030 (=> (not res!151562) (not e!183529))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290030 (= res!151562 (and (= (size!7292 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7292 a!3312))))))

(declare-fun b!290031 () Bool)

(assert (=> b!290031 (= e!183531 false)))

(declare-datatypes ((SeekEntryResult!2087 0))(
  ( (MissingZero!2087 (index!10518 (_ BitVec 32))) (Found!2087 (index!10519 (_ BitVec 32))) (Intermediate!2087 (undefined!2899 Bool) (index!10520 (_ BitVec 32)) (x!28731 (_ BitVec 32))) (Undefined!2087) (MissingVacant!2087 (index!10521 (_ BitVec 32))) )
))
(declare-fun lt!143135 () SeekEntryResult!2087)

(declare-fun lt!143133 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14623 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!290031 (= lt!143135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143133 k0!2524 (array!14624 (store (arr!6939 a!3312) i!1256 k0!2524) (size!7292 a!3312)) mask!3809))))

(declare-fun lt!143136 () SeekEntryResult!2087)

(assert (=> b!290031 (= lt!143136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143133 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290031 (= lt!143133 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290032 () Bool)

(declare-fun res!151560 () Bool)

(assert (=> b!290032 (=> (not res!151560) (not e!183529))))

(declare-fun arrayContainsKey!0 (array!14623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290032 (= res!151560 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290033 () Bool)

(assert (=> b!290033 (= e!183529 e!183531)))

(declare-fun res!151563 () Bool)

(assert (=> b!290033 (=> (not res!151563) (not e!183531))))

(declare-fun lt!143134 () SeekEntryResult!2087)

(assert (=> b!290033 (= res!151563 (or (= lt!143134 (MissingZero!2087 i!1256)) (= lt!143134 (MissingVacant!2087 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14623 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!290033 (= lt!143134 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151564 () Bool)

(assert (=> start!28316 (=> (not res!151564) (not e!183529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28316 (= res!151564 (validMask!0 mask!3809))))

(assert (=> start!28316 e!183529))

(assert (=> start!28316 true))

(declare-fun array_inv!4911 (array!14623) Bool)

(assert (=> start!28316 (array_inv!4911 a!3312)))

(assert (= (and start!28316 res!151564) b!290030))

(assert (= (and b!290030 res!151562) b!290029))

(assert (= (and b!290029 res!151561) b!290032))

(assert (= (and b!290032 res!151560) b!290033))

(assert (= (and b!290033 res!151563) b!290028))

(assert (= (and b!290028 res!151559) b!290031))

(declare-fun m!303695 () Bool)

(assert (=> b!290031 m!303695))

(declare-fun m!303697 () Bool)

(assert (=> b!290031 m!303697))

(declare-fun m!303699 () Bool)

(assert (=> b!290031 m!303699))

(declare-fun m!303701 () Bool)

(assert (=> b!290031 m!303701))

(declare-fun m!303703 () Bool)

(assert (=> b!290033 m!303703))

(declare-fun m!303705 () Bool)

(assert (=> b!290029 m!303705))

(declare-fun m!303707 () Bool)

(assert (=> start!28316 m!303707))

(declare-fun m!303709 () Bool)

(assert (=> start!28316 m!303709))

(declare-fun m!303711 () Bool)

(assert (=> b!290032 m!303711))

(declare-fun m!303713 () Bool)

(assert (=> b!290028 m!303713))

(check-sat (not b!290033) (not b!290028) (not b!290031) (not start!28316) (not b!290029) (not b!290032))
(check-sat)
