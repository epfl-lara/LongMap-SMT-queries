; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28084 () Bool)

(assert start!28084)

(declare-fun b!287781 () Bool)

(declare-fun e!182239 () Bool)

(assert (=> b!287781 (= e!182239 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14443 0))(
  ( (array!14444 (arr!6850 (Array (_ BitVec 32) (_ BitVec 64))) (size!7202 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14443)

(declare-datatypes ((SeekEntryResult!1999 0))(
  ( (MissingZero!1999 (index!10166 (_ BitVec 32))) (Found!1999 (index!10167 (_ BitVec 32))) (Intermediate!1999 (undefined!2811 Bool) (index!10168 (_ BitVec 32)) (x!28382 (_ BitVec 32))) (Undefined!1999) (MissingVacant!1999 (index!10169 (_ BitVec 32))) )
))
(declare-fun lt!141670 () SeekEntryResult!1999)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!141667 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14443 (_ BitVec 32)) SeekEntryResult!1999)

(assert (=> b!287781 (= lt!141670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141667 k!2524 (array!14444 (store (arr!6850 a!3312) i!1256 k!2524) (size!7202 a!3312)) mask!3809))))

(declare-fun lt!141669 () SeekEntryResult!1999)

(assert (=> b!287781 (= lt!141669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141667 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287781 (= lt!141667 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287782 () Bool)

(declare-fun res!149547 () Bool)

(declare-fun e!182240 () Bool)

(assert (=> b!287782 (=> (not res!149547) (not e!182240))))

(assert (=> b!287782 (= res!149547 (and (= (size!7202 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7202 a!3312))))))

(declare-fun res!149550 () Bool)

(assert (=> start!28084 (=> (not res!149550) (not e!182240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28084 (= res!149550 (validMask!0 mask!3809))))

(assert (=> start!28084 e!182240))

(assert (=> start!28084 true))

(declare-fun array_inv!4813 (array!14443) Bool)

(assert (=> start!28084 (array_inv!4813 a!3312)))

(declare-fun b!287783 () Bool)

(assert (=> b!287783 (= e!182240 e!182239)))

(declare-fun res!149549 () Bool)

(assert (=> b!287783 (=> (not res!149549) (not e!182239))))

(declare-fun lt!141668 () SeekEntryResult!1999)

(assert (=> b!287783 (= res!149549 (or (= lt!141668 (MissingZero!1999 i!1256)) (= lt!141668 (MissingVacant!1999 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14443 (_ BitVec 32)) SeekEntryResult!1999)

(assert (=> b!287783 (= lt!141668 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287784 () Bool)

(declare-fun res!149548 () Bool)

(assert (=> b!287784 (=> (not res!149548) (not e!182240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287784 (= res!149548 (validKeyInArray!0 k!2524))))

(declare-fun b!287785 () Bool)

(declare-fun res!149546 () Bool)

(assert (=> b!287785 (=> (not res!149546) (not e!182239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14443 (_ BitVec 32)) Bool)

(assert (=> b!287785 (= res!149546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287786 () Bool)

(declare-fun res!149545 () Bool)

(assert (=> b!287786 (=> (not res!149545) (not e!182240))))

(declare-fun arrayContainsKey!0 (array!14443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287786 (= res!149545 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28084 res!149550) b!287782))

(assert (= (and b!287782 res!149547) b!287784))

(assert (= (and b!287784 res!149548) b!287786))

(assert (= (and b!287786 res!149545) b!287783))

(assert (= (and b!287783 res!149549) b!287785))

(assert (= (and b!287785 res!149546) b!287781))

(declare-fun m!302113 () Bool)

(assert (=> b!287785 m!302113))

(declare-fun m!302115 () Bool)

(assert (=> b!287784 m!302115))

(declare-fun m!302117 () Bool)

(assert (=> start!28084 m!302117))

(declare-fun m!302119 () Bool)

(assert (=> start!28084 m!302119))

(declare-fun m!302121 () Bool)

(assert (=> b!287786 m!302121))

(declare-fun m!302123 () Bool)

(assert (=> b!287783 m!302123))

(declare-fun m!302125 () Bool)

(assert (=> b!287781 m!302125))

(declare-fun m!302127 () Bool)

(assert (=> b!287781 m!302127))

(declare-fun m!302129 () Bool)

(assert (=> b!287781 m!302129))

(declare-fun m!302131 () Bool)

(assert (=> b!287781 m!302131))

(push 1)

(assert (not start!28084))

(assert (not b!287786))

(assert (not b!287784))

(assert (not b!287781))

