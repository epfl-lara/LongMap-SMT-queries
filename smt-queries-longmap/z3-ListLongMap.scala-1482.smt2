; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28280 () Bool)

(assert start!28280)

(declare-fun b!289815 () Bool)

(declare-fun e!183451 () Bool)

(declare-fun e!183452 () Bool)

(assert (=> b!289815 (= e!183451 e!183452)))

(declare-fun res!151296 () Bool)

(assert (=> b!289815 (=> (not res!151296) (not e!183452))))

(declare-datatypes ((SeekEntryResult!2073 0))(
  ( (MissingZero!2073 (index!10462 (_ BitVec 32))) (Found!2073 (index!10463 (_ BitVec 32))) (Intermediate!2073 (undefined!2885 Bool) (index!10464 (_ BitVec 32)) (x!28662 (_ BitVec 32))) (Undefined!2073) (MissingVacant!2073 (index!10465 (_ BitVec 32))) )
))
(declare-fun lt!143066 () SeekEntryResult!2073)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289815 (= res!151296 (or (= lt!143066 (MissingZero!2073 i!1256)) (= lt!143066 (MissingVacant!2073 i!1256))))))

(declare-datatypes ((array!14594 0))(
  ( (array!14595 (arr!6924 (Array (_ BitVec 32) (_ BitVec 64))) (size!7276 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14594)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14594 (_ BitVec 32)) SeekEntryResult!2073)

(assert (=> b!289815 (= lt!143066 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151295 () Bool)

(assert (=> start!28280 (=> (not res!151295) (not e!183451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28280 (= res!151295 (validMask!0 mask!3809))))

(assert (=> start!28280 e!183451))

(assert (=> start!28280 true))

(declare-fun array_inv!4887 (array!14594) Bool)

(assert (=> start!28280 (array_inv!4887 a!3312)))

(declare-fun b!289816 () Bool)

(assert (=> b!289816 (= e!183452 false)))

(declare-fun lt!143067 () (_ BitVec 32))

(declare-fun lt!143065 () SeekEntryResult!2073)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14594 (_ BitVec 32)) SeekEntryResult!2073)

(assert (=> b!289816 (= lt!143065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143067 k0!2524 (array!14595 (store (arr!6924 a!3312) i!1256 k0!2524) (size!7276 a!3312)) mask!3809))))

(declare-fun lt!143068 () SeekEntryResult!2073)

(assert (=> b!289816 (= lt!143068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143067 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289816 (= lt!143067 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289817 () Bool)

(declare-fun res!151298 () Bool)

(assert (=> b!289817 (=> (not res!151298) (not e!183452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14594 (_ BitVec 32)) Bool)

(assert (=> b!289817 (= res!151298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289818 () Bool)

(declare-fun res!151299 () Bool)

(assert (=> b!289818 (=> (not res!151299) (not e!183451))))

(assert (=> b!289818 (= res!151299 (and (= (size!7276 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7276 a!3312))))))

(declare-fun b!289819 () Bool)

(declare-fun res!151297 () Bool)

(assert (=> b!289819 (=> (not res!151297) (not e!183451))))

(declare-fun arrayContainsKey!0 (array!14594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289819 (= res!151297 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289820 () Bool)

(declare-fun res!151294 () Bool)

(assert (=> b!289820 (=> (not res!151294) (not e!183451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289820 (= res!151294 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28280 res!151295) b!289818))

(assert (= (and b!289818 res!151299) b!289820))

(assert (= (and b!289820 res!151294) b!289819))

(assert (= (and b!289819 res!151297) b!289815))

(assert (= (and b!289815 res!151296) b!289817))

(assert (= (and b!289817 res!151298) b!289816))

(declare-fun m!303887 () Bool)

(assert (=> b!289816 m!303887))

(declare-fun m!303889 () Bool)

(assert (=> b!289816 m!303889))

(declare-fun m!303891 () Bool)

(assert (=> b!289816 m!303891))

(declare-fun m!303893 () Bool)

(assert (=> b!289816 m!303893))

(declare-fun m!303895 () Bool)

(assert (=> b!289819 m!303895))

(declare-fun m!303897 () Bool)

(assert (=> b!289820 m!303897))

(declare-fun m!303899 () Bool)

(assert (=> b!289815 m!303899))

(declare-fun m!303901 () Bool)

(assert (=> b!289817 m!303901))

(declare-fun m!303903 () Bool)

(assert (=> start!28280 m!303903))

(declare-fun m!303905 () Bool)

(assert (=> start!28280 m!303905))

(check-sat (not start!28280) (not b!289817) (not b!289816) (not b!289819) (not b!289820) (not b!289815))
(check-sat)
