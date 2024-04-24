; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28294 () Bool)

(assert start!28294)

(declare-fun b!290060 () Bool)

(declare-fun res!151517 () Bool)

(declare-fun e!183575 () Bool)

(assert (=> b!290060 (=> (not res!151517) (not e!183575))))

(declare-datatypes ((array!14613 0))(
  ( (array!14614 (arr!6934 (Array (_ BitVec 32) (_ BitVec 64))) (size!7286 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14613)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290060 (= res!151517 (and (= (size!7286 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7286 a!3312))))))

(declare-fun res!151518 () Bool)

(assert (=> start!28294 (=> (not res!151518) (not e!183575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28294 (= res!151518 (validMask!0 mask!3809))))

(assert (=> start!28294 e!183575))

(assert (=> start!28294 true))

(declare-fun array_inv!4884 (array!14613) Bool)

(assert (=> start!28294 (array_inv!4884 a!3312)))

(declare-fun b!290061 () Bool)

(declare-fun res!151516 () Bool)

(declare-fun e!183574 () Bool)

(assert (=> b!290061 (=> (not res!151516) (not e!183574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14613 (_ BitVec 32)) Bool)

(assert (=> b!290061 (= res!151516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290062 () Bool)

(assert (=> b!290062 (= e!183574 false)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2048 0))(
  ( (MissingZero!2048 (index!10362 (_ BitVec 32))) (Found!2048 (index!10363 (_ BitVec 32))) (Intermediate!2048 (undefined!2860 Bool) (index!10364 (_ BitVec 32)) (x!28669 (_ BitVec 32))) (Undefined!2048) (MissingVacant!2048 (index!10365 (_ BitVec 32))) )
))
(declare-fun lt!143267 () SeekEntryResult!2048)

(declare-fun lt!143265 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14613 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!290062 (= lt!143267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143265 k0!2524 (array!14614 (store (arr!6934 a!3312) i!1256 k0!2524) (size!7286 a!3312)) mask!3809))))

(declare-fun lt!143266 () SeekEntryResult!2048)

(assert (=> b!290062 (= lt!143266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143265 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290062 (= lt!143265 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290063 () Bool)

(declare-fun res!151515 () Bool)

(assert (=> b!290063 (=> (not res!151515) (not e!183575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290063 (= res!151515 (validKeyInArray!0 k0!2524))))

(declare-fun b!290064 () Bool)

(declare-fun res!151514 () Bool)

(assert (=> b!290064 (=> (not res!151514) (not e!183575))))

(declare-fun arrayContainsKey!0 (array!14613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290064 (= res!151514 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290065 () Bool)

(assert (=> b!290065 (= e!183575 e!183574)))

(declare-fun res!151513 () Bool)

(assert (=> b!290065 (=> (not res!151513) (not e!183574))))

(declare-fun lt!143268 () SeekEntryResult!2048)

(assert (=> b!290065 (= res!151513 (or (= lt!143268 (MissingZero!2048 i!1256)) (= lt!143268 (MissingVacant!2048 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14613 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!290065 (= lt!143268 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28294 res!151518) b!290060))

(assert (= (and b!290060 res!151517) b!290063))

(assert (= (and b!290063 res!151515) b!290064))

(assert (= (and b!290064 res!151514) b!290065))

(assert (= (and b!290065 res!151513) b!290061))

(assert (= (and b!290061 res!151516) b!290062))

(declare-fun m!304313 () Bool)

(assert (=> b!290062 m!304313))

(declare-fun m!304315 () Bool)

(assert (=> b!290062 m!304315))

(declare-fun m!304317 () Bool)

(assert (=> b!290062 m!304317))

(declare-fun m!304319 () Bool)

(assert (=> b!290062 m!304319))

(declare-fun m!304321 () Bool)

(assert (=> b!290065 m!304321))

(declare-fun m!304323 () Bool)

(assert (=> b!290064 m!304323))

(declare-fun m!304325 () Bool)

(assert (=> start!28294 m!304325))

(declare-fun m!304327 () Bool)

(assert (=> start!28294 m!304327))

(declare-fun m!304329 () Bool)

(assert (=> b!290063 m!304329))

(declare-fun m!304331 () Bool)

(assert (=> b!290061 m!304331))

(check-sat (not b!290062) (not b!290061) (not start!28294) (not b!290063) (not b!290064) (not b!290065))
(check-sat)
