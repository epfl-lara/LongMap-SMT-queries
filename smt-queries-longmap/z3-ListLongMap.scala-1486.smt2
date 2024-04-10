; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28304 () Bool)

(assert start!28304)

(declare-fun res!151514 () Bool)

(declare-fun e!183560 () Bool)

(assert (=> start!28304 (=> (not res!151514) (not e!183560))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28304 (= res!151514 (validMask!0 mask!3809))))

(assert (=> start!28304 e!183560))

(assert (=> start!28304 true))

(declare-datatypes ((array!14618 0))(
  ( (array!14619 (arr!6936 (Array (_ BitVec 32) (_ BitVec 64))) (size!7288 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14618)

(declare-fun array_inv!4899 (array!14618) Bool)

(assert (=> start!28304 (array_inv!4899 a!3312)))

(declare-fun b!290031 () Bool)

(declare-fun e!183558 () Bool)

(assert (=> b!290031 (= e!183560 e!183558)))

(declare-fun res!151512 () Bool)

(assert (=> b!290031 (=> (not res!151512) (not e!183558))))

(declare-datatypes ((SeekEntryResult!2085 0))(
  ( (MissingZero!2085 (index!10510 (_ BitVec 32))) (Found!2085 (index!10511 (_ BitVec 32))) (Intermediate!2085 (undefined!2897 Bool) (index!10512 (_ BitVec 32)) (x!28706 (_ BitVec 32))) (Undefined!2085) (MissingVacant!2085 (index!10513 (_ BitVec 32))) )
))
(declare-fun lt!143220 () SeekEntryResult!2085)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290031 (= res!151512 (or (= lt!143220 (MissingZero!2085 i!1256)) (= lt!143220 (MissingVacant!2085 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14618 (_ BitVec 32)) SeekEntryResult!2085)

(assert (=> b!290031 (= lt!143220 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290032 () Bool)

(declare-fun res!151510 () Bool)

(assert (=> b!290032 (=> (not res!151510) (not e!183558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14618 (_ BitVec 32)) Bool)

(assert (=> b!290032 (= res!151510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290033 () Bool)

(declare-fun res!151511 () Bool)

(assert (=> b!290033 (=> (not res!151511) (not e!183560))))

(assert (=> b!290033 (= res!151511 (and (= (size!7288 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7288 a!3312))))))

(declare-fun b!290034 () Bool)

(declare-fun res!151513 () Bool)

(assert (=> b!290034 (=> (not res!151513) (not e!183560))))

(declare-fun arrayContainsKey!0 (array!14618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290034 (= res!151513 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290035 () Bool)

(declare-fun res!151515 () Bool)

(assert (=> b!290035 (=> (not res!151515) (not e!183560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290035 (= res!151515 (validKeyInArray!0 k0!2524))))

(declare-fun b!290036 () Bool)

(assert (=> b!290036 (= e!183558 false)))

(declare-fun lt!143218 () (_ BitVec 32))

(declare-fun lt!143219 () SeekEntryResult!2085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14618 (_ BitVec 32)) SeekEntryResult!2085)

(assert (=> b!290036 (= lt!143219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143218 k0!2524 (array!14619 (store (arr!6936 a!3312) i!1256 k0!2524) (size!7288 a!3312)) mask!3809))))

(declare-fun lt!143221 () SeekEntryResult!2085)

(assert (=> b!290036 (= lt!143221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143218 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290036 (= lt!143218 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28304 res!151514) b!290033))

(assert (= (and b!290033 res!151511) b!290035))

(assert (= (and b!290035 res!151515) b!290034))

(assert (= (and b!290034 res!151513) b!290031))

(assert (= (and b!290031 res!151512) b!290032))

(assert (= (and b!290032 res!151510) b!290036))

(declare-fun m!304127 () Bool)

(assert (=> start!28304 m!304127))

(declare-fun m!304129 () Bool)

(assert (=> start!28304 m!304129))

(declare-fun m!304131 () Bool)

(assert (=> b!290035 m!304131))

(declare-fun m!304133 () Bool)

(assert (=> b!290034 m!304133))

(declare-fun m!304135 () Bool)

(assert (=> b!290036 m!304135))

(declare-fun m!304137 () Bool)

(assert (=> b!290036 m!304137))

(declare-fun m!304139 () Bool)

(assert (=> b!290036 m!304139))

(declare-fun m!304141 () Bool)

(assert (=> b!290036 m!304141))

(declare-fun m!304143 () Bool)

(assert (=> b!290031 m!304143))

(declare-fun m!304145 () Bool)

(assert (=> b!290032 m!304145))

(check-sat (not b!290032) (not start!28304) (not b!290031) (not b!290034) (not b!290036) (not b!290035))
(check-sat)
