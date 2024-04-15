; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28592 () Bool)

(assert start!28592)

(declare-fun b!292242 () Bool)

(declare-fun res!153353 () Bool)

(declare-fun e!184899 () Bool)

(assert (=> b!292242 (=> (not res!153353) (not e!184899))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14764 0))(
  ( (array!14765 (arr!7005 (Array (_ BitVec 32) (_ BitVec 64))) (size!7358 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14764)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292242 (= res!153353 (and (= (size!7358 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7358 a!3312))))))

(declare-fun res!153354 () Bool)

(assert (=> start!28592 (=> (not res!153354) (not e!184899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28592 (= res!153354 (validMask!0 mask!3809))))

(assert (=> start!28592 e!184899))

(assert (=> start!28592 true))

(declare-fun array_inv!4977 (array!14764) Bool)

(assert (=> start!28592 (array_inv!4977 a!3312)))

(declare-fun b!292243 () Bool)

(declare-fun res!153355 () Bool)

(assert (=> b!292243 (=> (not res!153355) (not e!184899))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292243 (= res!153355 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292244 () Bool)

(declare-fun e!184897 () Bool)

(assert (=> b!292244 (= e!184897 false)))

(declare-datatypes ((SeekEntryResult!2153 0))(
  ( (MissingZero!2153 (index!10782 (_ BitVec 32))) (Found!2153 (index!10783 (_ BitVec 32))) (Intermediate!2153 (undefined!2965 Bool) (index!10784 (_ BitVec 32)) (x!28991 (_ BitVec 32))) (Undefined!2153) (MissingVacant!2153 (index!10785 (_ BitVec 32))) )
))
(declare-fun lt!144628 () SeekEntryResult!2153)

(declare-fun lt!144630 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14764 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292244 (= lt!144628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144630 k0!2524 (array!14765 (store (arr!7005 a!3312) i!1256 k0!2524) (size!7358 a!3312)) mask!3809))))

(declare-fun lt!144629 () SeekEntryResult!2153)

(assert (=> b!292244 (= lt!144629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144630 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292244 (= lt!144630 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292245 () Bool)

(declare-fun res!153350 () Bool)

(assert (=> b!292245 (=> (not res!153350) (not e!184897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14764 (_ BitVec 32)) Bool)

(assert (=> b!292245 (= res!153350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292246 () Bool)

(declare-fun res!153351 () Bool)

(assert (=> b!292246 (=> (not res!153351) (not e!184899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292246 (= res!153351 (validKeyInArray!0 k0!2524))))

(declare-fun b!292247 () Bool)

(assert (=> b!292247 (= e!184899 e!184897)))

(declare-fun res!153352 () Bool)

(assert (=> b!292247 (=> (not res!153352) (not e!184897))))

(declare-fun lt!144627 () SeekEntryResult!2153)

(assert (=> b!292247 (= res!153352 (or (= lt!144627 (MissingZero!2153 i!1256)) (= lt!144627 (MissingVacant!2153 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14764 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292247 (= lt!144627 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28592 res!153354) b!292242))

(assert (= (and b!292242 res!153353) b!292246))

(assert (= (and b!292246 res!153351) b!292243))

(assert (= (and b!292243 res!153355) b!292247))

(assert (= (and b!292247 res!153352) b!292245))

(assert (= (and b!292245 res!153350) b!292244))

(declare-fun m!305525 () Bool)

(assert (=> b!292244 m!305525))

(declare-fun m!305527 () Bool)

(assert (=> b!292244 m!305527))

(declare-fun m!305529 () Bool)

(assert (=> b!292244 m!305529))

(declare-fun m!305531 () Bool)

(assert (=> b!292244 m!305531))

(declare-fun m!305533 () Bool)

(assert (=> b!292246 m!305533))

(declare-fun m!305535 () Bool)

(assert (=> b!292245 m!305535))

(declare-fun m!305537 () Bool)

(assert (=> start!28592 m!305537))

(declare-fun m!305539 () Bool)

(assert (=> start!28592 m!305539))

(declare-fun m!305541 () Bool)

(assert (=> b!292247 m!305541))

(declare-fun m!305543 () Bool)

(assert (=> b!292243 m!305543))

(check-sat (not b!292247) (not b!292244) (not b!292245) (not b!292243) (not b!292246) (not start!28592))
(check-sat)
