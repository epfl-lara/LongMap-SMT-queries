; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28292 () Bool)

(assert start!28292)

(declare-fun b!289923 () Bool)

(declare-fun res!151405 () Bool)

(declare-fun e!183505 () Bool)

(assert (=> b!289923 (=> (not res!151405) (not e!183505))))

(declare-datatypes ((array!14606 0))(
  ( (array!14607 (arr!6930 (Array (_ BitVec 32) (_ BitVec 64))) (size!7282 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14606)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289923 (= res!151405 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289924 () Bool)

(declare-fun e!183504 () Bool)

(assert (=> b!289924 (= e!183505 e!183504)))

(declare-fun res!151402 () Bool)

(assert (=> b!289924 (=> (not res!151402) (not e!183504))))

(declare-datatypes ((SeekEntryResult!2079 0))(
  ( (MissingZero!2079 (index!10486 (_ BitVec 32))) (Found!2079 (index!10487 (_ BitVec 32))) (Intermediate!2079 (undefined!2891 Bool) (index!10488 (_ BitVec 32)) (x!28684 (_ BitVec 32))) (Undefined!2079) (MissingVacant!2079 (index!10489 (_ BitVec 32))) )
))
(declare-fun lt!143148 () SeekEntryResult!2079)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289924 (= res!151402 (or (= lt!143148 (MissingZero!2079 i!1256)) (= lt!143148 (MissingVacant!2079 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14606 (_ BitVec 32)) SeekEntryResult!2079)

(assert (=> b!289924 (= lt!143148 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289925 () Bool)

(assert (=> b!289925 (= e!183504 false)))

(declare-fun lt!143149 () SeekEntryResult!2079)

(declare-fun lt!143146 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14606 (_ BitVec 32)) SeekEntryResult!2079)

(assert (=> b!289925 (= lt!143149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143146 k0!2524 (array!14607 (store (arr!6930 a!3312) i!1256 k0!2524) (size!7282 a!3312)) mask!3809))))

(declare-fun lt!143147 () SeekEntryResult!2079)

(assert (=> b!289925 (= lt!143147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143146 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289925 (= lt!143146 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289926 () Bool)

(declare-fun res!151407 () Bool)

(assert (=> b!289926 (=> (not res!151407) (not e!183505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289926 (= res!151407 (validKeyInArray!0 k0!2524))))

(declare-fun b!289927 () Bool)

(declare-fun res!151403 () Bool)

(assert (=> b!289927 (=> (not res!151403) (not e!183504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14606 (_ BitVec 32)) Bool)

(assert (=> b!289927 (= res!151403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289928 () Bool)

(declare-fun res!151406 () Bool)

(assert (=> b!289928 (=> (not res!151406) (not e!183505))))

(assert (=> b!289928 (= res!151406 (and (= (size!7282 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7282 a!3312))))))

(declare-fun res!151404 () Bool)

(assert (=> start!28292 (=> (not res!151404) (not e!183505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28292 (= res!151404 (validMask!0 mask!3809))))

(assert (=> start!28292 e!183505))

(assert (=> start!28292 true))

(declare-fun array_inv!4893 (array!14606) Bool)

(assert (=> start!28292 (array_inv!4893 a!3312)))

(assert (= (and start!28292 res!151404) b!289928))

(assert (= (and b!289928 res!151406) b!289926))

(assert (= (and b!289926 res!151407) b!289923))

(assert (= (and b!289923 res!151405) b!289924))

(assert (= (and b!289924 res!151402) b!289927))

(assert (= (and b!289927 res!151403) b!289925))

(declare-fun m!304007 () Bool)

(assert (=> b!289927 m!304007))

(declare-fun m!304009 () Bool)

(assert (=> start!28292 m!304009))

(declare-fun m!304011 () Bool)

(assert (=> start!28292 m!304011))

(declare-fun m!304013 () Bool)

(assert (=> b!289924 m!304013))

(declare-fun m!304015 () Bool)

(assert (=> b!289925 m!304015))

(declare-fun m!304017 () Bool)

(assert (=> b!289925 m!304017))

(declare-fun m!304019 () Bool)

(assert (=> b!289925 m!304019))

(declare-fun m!304021 () Bool)

(assert (=> b!289925 m!304021))

(declare-fun m!304023 () Bool)

(assert (=> b!289926 m!304023))

(declare-fun m!304025 () Bool)

(assert (=> b!289923 m!304025))

(check-sat (not b!289924) (not b!289923) (not b!289926) (not b!289925) (not start!28292) (not b!289927))
(check-sat)
