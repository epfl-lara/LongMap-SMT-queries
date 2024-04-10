; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28314 () Bool)

(assert start!28314)

(declare-fun b!290121 () Bool)

(declare-fun e!183605 () Bool)

(assert (=> b!290121 (= e!183605 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2090 0))(
  ( (MissingZero!2090 (index!10530 (_ BitVec 32))) (Found!2090 (index!10531 (_ BitVec 32))) (Intermediate!2090 (undefined!2902 Bool) (index!10532 (_ BitVec 32)) (x!28727 (_ BitVec 32))) (Undefined!2090) (MissingVacant!2090 (index!10533 (_ BitVec 32))) )
))
(declare-fun lt!143279 () SeekEntryResult!2090)

(declare-fun lt!143278 () (_ BitVec 32))

(declare-datatypes ((array!14628 0))(
  ( (array!14629 (arr!6941 (Array (_ BitVec 32) (_ BitVec 64))) (size!7293 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14628)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14628 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!290121 (= lt!143279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143278 k!2524 (array!14629 (store (arr!6941 a!3312) i!1256 k!2524) (size!7293 a!3312)) mask!3809))))

(declare-fun lt!143280 () SeekEntryResult!2090)

(assert (=> b!290121 (= lt!143280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143278 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290121 (= lt!143278 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290122 () Bool)

(declare-fun res!151602 () Bool)

(declare-fun e!183603 () Bool)

(assert (=> b!290122 (=> (not res!151602) (not e!183603))))

(declare-fun arrayContainsKey!0 (array!14628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290122 (= res!151602 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290123 () Bool)

(declare-fun res!151603 () Bool)

(assert (=> b!290123 (=> (not res!151603) (not e!183603))))

(assert (=> b!290123 (= res!151603 (and (= (size!7293 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7293 a!3312))))))

(declare-fun res!151605 () Bool)

(assert (=> start!28314 (=> (not res!151605) (not e!183603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28314 (= res!151605 (validMask!0 mask!3809))))

(assert (=> start!28314 e!183603))

(assert (=> start!28314 true))

(declare-fun array_inv!4904 (array!14628) Bool)

(assert (=> start!28314 (array_inv!4904 a!3312)))

(declare-fun b!290124 () Bool)

(assert (=> b!290124 (= e!183603 e!183605)))

(declare-fun res!151600 () Bool)

(assert (=> b!290124 (=> (not res!151600) (not e!183605))))

(declare-fun lt!143281 () SeekEntryResult!2090)

(assert (=> b!290124 (= res!151600 (or (= lt!143281 (MissingZero!2090 i!1256)) (= lt!143281 (MissingVacant!2090 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14628 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!290124 (= lt!143281 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290125 () Bool)

(declare-fun res!151601 () Bool)

(assert (=> b!290125 (=> (not res!151601) (not e!183603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290125 (= res!151601 (validKeyInArray!0 k!2524))))

(declare-fun b!290126 () Bool)

(declare-fun res!151604 () Bool)

(assert (=> b!290126 (=> (not res!151604) (not e!183605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14628 (_ BitVec 32)) Bool)

(assert (=> b!290126 (= res!151604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28314 res!151605) b!290123))

(assert (= (and b!290123 res!151603) b!290125))

(assert (= (and b!290125 res!151601) b!290122))

(assert (= (and b!290122 res!151602) b!290124))

(assert (= (and b!290124 res!151600) b!290126))

(assert (= (and b!290126 res!151604) b!290121))

(declare-fun m!304227 () Bool)

(assert (=> b!290124 m!304227))

(declare-fun m!304229 () Bool)

(assert (=> start!28314 m!304229))

(declare-fun m!304231 () Bool)

(assert (=> start!28314 m!304231))

(declare-fun m!304233 () Bool)

(assert (=> b!290126 m!304233))

(declare-fun m!304235 () Bool)

(assert (=> b!290122 m!304235))

(declare-fun m!304237 () Bool)

(assert (=> b!290125 m!304237))

(declare-fun m!304239 () Bool)

(assert (=> b!290121 m!304239))

(declare-fun m!304241 () Bool)

(assert (=> b!290121 m!304241))

(declare-fun m!304243 () Bool)

(assert (=> b!290121 m!304243))

(declare-fun m!304245 () Bool)

(assert (=> b!290121 m!304245))

(push 1)

