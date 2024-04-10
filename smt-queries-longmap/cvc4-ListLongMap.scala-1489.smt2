; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28324 () Bool)

(assert start!28324)

(declare-fun b!290211 () Bool)

(declare-fun e!183649 () Bool)

(declare-fun e!183648 () Bool)

(assert (=> b!290211 (= e!183649 e!183648)))

(declare-fun res!151691 () Bool)

(assert (=> b!290211 (=> (not res!151691) (not e!183648))))

(declare-datatypes ((SeekEntryResult!2095 0))(
  ( (MissingZero!2095 (index!10550 (_ BitVec 32))) (Found!2095 (index!10551 (_ BitVec 32))) (Intermediate!2095 (undefined!2907 Bool) (index!10552 (_ BitVec 32)) (x!28740 (_ BitVec 32))) (Undefined!2095) (MissingVacant!2095 (index!10553 (_ BitVec 32))) )
))
(declare-fun lt!143340 () SeekEntryResult!2095)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290211 (= res!151691 (or (= lt!143340 (MissingZero!2095 i!1256)) (= lt!143340 (MissingVacant!2095 i!1256))))))

(declare-datatypes ((array!14638 0))(
  ( (array!14639 (arr!6946 (Array (_ BitVec 32) (_ BitVec 64))) (size!7298 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14638)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14638 (_ BitVec 32)) SeekEntryResult!2095)

(assert (=> b!290211 (= lt!143340 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290212 () Bool)

(assert (=> b!290212 (= e!183648 false)))

(declare-fun lt!143341 () (_ BitVec 32))

(declare-fun lt!143338 () SeekEntryResult!2095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14638 (_ BitVec 32)) SeekEntryResult!2095)

(assert (=> b!290212 (= lt!143338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143341 k!2524 (array!14639 (store (arr!6946 a!3312) i!1256 k!2524) (size!7298 a!3312)) mask!3809))))

(declare-fun lt!143339 () SeekEntryResult!2095)

(assert (=> b!290212 (= lt!143339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143341 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290212 (= lt!143341 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!151694 () Bool)

(assert (=> start!28324 (=> (not res!151694) (not e!183649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28324 (= res!151694 (validMask!0 mask!3809))))

(assert (=> start!28324 e!183649))

(assert (=> start!28324 true))

(declare-fun array_inv!4909 (array!14638) Bool)

(assert (=> start!28324 (array_inv!4909 a!3312)))

(declare-fun b!290213 () Bool)

(declare-fun res!151695 () Bool)

(assert (=> b!290213 (=> (not res!151695) (not e!183649))))

(declare-fun arrayContainsKey!0 (array!14638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290213 (= res!151695 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290214 () Bool)

(declare-fun res!151693 () Bool)

(assert (=> b!290214 (=> (not res!151693) (not e!183649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290214 (= res!151693 (validKeyInArray!0 k!2524))))

(declare-fun b!290215 () Bool)

(declare-fun res!151690 () Bool)

(assert (=> b!290215 (=> (not res!151690) (not e!183649))))

(assert (=> b!290215 (= res!151690 (and (= (size!7298 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7298 a!3312))))))

(declare-fun b!290216 () Bool)

(declare-fun res!151692 () Bool)

(assert (=> b!290216 (=> (not res!151692) (not e!183648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14638 (_ BitVec 32)) Bool)

(assert (=> b!290216 (= res!151692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28324 res!151694) b!290215))

(assert (= (and b!290215 res!151690) b!290214))

(assert (= (and b!290214 res!151693) b!290213))

(assert (= (and b!290213 res!151695) b!290211))

(assert (= (and b!290211 res!151691) b!290216))

(assert (= (and b!290216 res!151692) b!290212))

(declare-fun m!304327 () Bool)

(assert (=> b!290214 m!304327))

(declare-fun m!304329 () Bool)

(assert (=> b!290216 m!304329))

(declare-fun m!304331 () Bool)

(assert (=> b!290212 m!304331))

(declare-fun m!304333 () Bool)

(assert (=> b!290212 m!304333))

(declare-fun m!304335 () Bool)

(assert (=> b!290212 m!304335))

(declare-fun m!304337 () Bool)

(assert (=> b!290212 m!304337))

(declare-fun m!304339 () Bool)

(assert (=> start!28324 m!304339))

(declare-fun m!304341 () Bool)

(assert (=> start!28324 m!304341))

(declare-fun m!304343 () Bool)

(assert (=> b!290211 m!304343))

(declare-fun m!304345 () Bool)

(assert (=> b!290213 m!304345))

(push 1)

(assert (not b!290216))

(assert (not b!290213))

(assert (not start!28324))

(assert (not b!290214))

(assert (not b!290211))

(assert (not b!290212))

(check-sat)

(pop 1)

