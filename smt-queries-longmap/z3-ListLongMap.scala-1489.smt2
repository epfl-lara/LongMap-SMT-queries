; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28312 () Bool)

(assert start!28312)

(declare-fun b!290223 () Bool)

(declare-fun e!183656 () Bool)

(declare-fun e!183655 () Bool)

(assert (=> b!290223 (= e!183656 e!183655)))

(declare-fun res!151680 () Bool)

(assert (=> b!290223 (=> (not res!151680) (not e!183655))))

(declare-datatypes ((SeekEntryResult!2057 0))(
  ( (MissingZero!2057 (index!10398 (_ BitVec 32))) (Found!2057 (index!10399 (_ BitVec 32))) (Intermediate!2057 (undefined!2869 Bool) (index!10400 (_ BitVec 32)) (x!28702 (_ BitVec 32))) (Undefined!2057) (MissingVacant!2057 (index!10401 (_ BitVec 32))) )
))
(declare-fun lt!143374 () SeekEntryResult!2057)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290223 (= res!151680 (or (= lt!143374 (MissingZero!2057 i!1256)) (= lt!143374 (MissingVacant!2057 i!1256))))))

(declare-datatypes ((array!14631 0))(
  ( (array!14632 (arr!6943 (Array (_ BitVec 32) (_ BitVec 64))) (size!7295 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14631)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14631 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!290223 (= lt!143374 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290224 () Bool)

(declare-fun res!151675 () Bool)

(assert (=> b!290224 (=> (not res!151675) (not e!183656))))

(declare-fun arrayContainsKey!0 (array!14631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290224 (= res!151675 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290225 () Bool)

(declare-fun res!151677 () Bool)

(assert (=> b!290225 (=> (not res!151677) (not e!183656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290225 (= res!151677 (validKeyInArray!0 k0!2524))))

(declare-fun b!290226 () Bool)

(declare-fun res!151676 () Bool)

(assert (=> b!290226 (=> (not res!151676) (not e!183656))))

(assert (=> b!290226 (= res!151676 (and (= (size!7295 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7295 a!3312))))))

(declare-fun b!290227 () Bool)

(assert (=> b!290227 (= e!183655 false)))

(declare-fun lt!143376 () SeekEntryResult!2057)

(declare-fun lt!143373 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14631 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!290227 (= lt!143376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143373 k0!2524 (array!14632 (store (arr!6943 a!3312) i!1256 k0!2524) (size!7295 a!3312)) mask!3809))))

(declare-fun lt!143375 () SeekEntryResult!2057)

(assert (=> b!290227 (= lt!143375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143373 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290227 (= lt!143373 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290222 () Bool)

(declare-fun res!151679 () Bool)

(assert (=> b!290222 (=> (not res!151679) (not e!183655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14631 (_ BitVec 32)) Bool)

(assert (=> b!290222 (= res!151679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151678 () Bool)

(assert (=> start!28312 (=> (not res!151678) (not e!183656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28312 (= res!151678 (validMask!0 mask!3809))))

(assert (=> start!28312 e!183656))

(assert (=> start!28312 true))

(declare-fun array_inv!4893 (array!14631) Bool)

(assert (=> start!28312 (array_inv!4893 a!3312)))

(assert (= (and start!28312 res!151678) b!290226))

(assert (= (and b!290226 res!151676) b!290225))

(assert (= (and b!290225 res!151677) b!290224))

(assert (= (and b!290224 res!151675) b!290223))

(assert (= (and b!290223 res!151680) b!290222))

(assert (= (and b!290222 res!151679) b!290227))

(declare-fun m!304493 () Bool)

(assert (=> b!290227 m!304493))

(declare-fun m!304495 () Bool)

(assert (=> b!290227 m!304495))

(declare-fun m!304497 () Bool)

(assert (=> b!290227 m!304497))

(declare-fun m!304499 () Bool)

(assert (=> b!290227 m!304499))

(declare-fun m!304501 () Bool)

(assert (=> b!290222 m!304501))

(declare-fun m!304503 () Bool)

(assert (=> b!290223 m!304503))

(declare-fun m!304505 () Bool)

(assert (=> start!28312 m!304505))

(declare-fun m!304507 () Bool)

(assert (=> start!28312 m!304507))

(declare-fun m!304509 () Bool)

(assert (=> b!290224 m!304509))

(declare-fun m!304511 () Bool)

(assert (=> b!290225 m!304511))

(check-sat (not b!290227) (not b!290224) (not b!290225) (not b!290223) (not start!28312) (not b!290222))
(check-sat)
