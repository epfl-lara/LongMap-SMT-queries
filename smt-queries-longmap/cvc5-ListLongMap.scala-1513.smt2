; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28608 () Bool)

(assert start!28608)

(declare-fun b!292497 () Bool)

(declare-fun e!185052 () Bool)

(assert (=> b!292497 (= e!185052 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2165 0))(
  ( (MissingZero!2165 (index!10830 (_ BitVec 32))) (Found!2165 (index!10831 (_ BitVec 32))) (Intermediate!2165 (undefined!2977 Bool) (index!10832 (_ BitVec 32)) (x!29020 (_ BitVec 32))) (Undefined!2165) (MissingVacant!2165 (index!10833 (_ BitVec 32))) )
))
(declare-fun lt!144881 () SeekEntryResult!2165)

(declare-datatypes ((array!14787 0))(
  ( (array!14788 (arr!7016 (Array (_ BitVec 32) (_ BitVec 64))) (size!7368 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14787)

(declare-fun lt!144882 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14787 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!292497 (= lt!144881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144882 k!2524 (array!14788 (store (arr!7016 a!3312) i!1256 k!2524) (size!7368 a!3312)) mask!3809))))

(declare-fun lt!144880 () SeekEntryResult!2165)

(assert (=> b!292497 (= lt!144880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144882 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292497 (= lt!144882 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292498 () Bool)

(declare-fun res!153553 () Bool)

(declare-fun e!185053 () Bool)

(assert (=> b!292498 (=> (not res!153553) (not e!185053))))

(declare-fun arrayContainsKey!0 (array!14787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292498 (= res!153553 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153554 () Bool)

(assert (=> start!28608 (=> (not res!153554) (not e!185053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28608 (= res!153554 (validMask!0 mask!3809))))

(assert (=> start!28608 e!185053))

(assert (=> start!28608 true))

(declare-fun array_inv!4979 (array!14787) Bool)

(assert (=> start!28608 (array_inv!4979 a!3312)))

(declare-fun b!292499 () Bool)

(declare-fun res!153557 () Bool)

(assert (=> b!292499 (=> (not res!153557) (not e!185053))))

(assert (=> b!292499 (= res!153557 (and (= (size!7368 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7368 a!3312))))))

(declare-fun b!292500 () Bool)

(declare-fun res!153555 () Bool)

(assert (=> b!292500 (=> (not res!153555) (not e!185053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292500 (= res!153555 (validKeyInArray!0 k!2524))))

(declare-fun b!292501 () Bool)

(declare-fun res!153558 () Bool)

(assert (=> b!292501 (=> (not res!153558) (not e!185052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14787 (_ BitVec 32)) Bool)

(assert (=> b!292501 (= res!153558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292502 () Bool)

(assert (=> b!292502 (= e!185053 e!185052)))

(declare-fun res!153556 () Bool)

(assert (=> b!292502 (=> (not res!153556) (not e!185052))))

(declare-fun lt!144883 () SeekEntryResult!2165)

(assert (=> b!292502 (= res!153556 (or (= lt!144883 (MissingZero!2165 i!1256)) (= lt!144883 (MissingVacant!2165 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14787 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!292502 (= lt!144883 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28608 res!153554) b!292499))

(assert (= (and b!292499 res!153557) b!292500))

(assert (= (and b!292500 res!153555) b!292498))

(assert (= (and b!292498 res!153553) b!292502))

(assert (= (and b!292502 res!153556) b!292501))

(assert (= (and b!292501 res!153558) b!292497))

(declare-fun m!306237 () Bool)

(assert (=> b!292497 m!306237))

(declare-fun m!306239 () Bool)

(assert (=> b!292497 m!306239))

(declare-fun m!306241 () Bool)

(assert (=> b!292497 m!306241))

(declare-fun m!306243 () Bool)

(assert (=> b!292497 m!306243))

(declare-fun m!306245 () Bool)

(assert (=> b!292500 m!306245))

(declare-fun m!306247 () Bool)

(assert (=> b!292502 m!306247))

(declare-fun m!306249 () Bool)

(assert (=> b!292501 m!306249))

(declare-fun m!306251 () Bool)

(assert (=> b!292498 m!306251))

(declare-fun m!306253 () Bool)

(assert (=> start!28608 m!306253))

(declare-fun m!306255 () Bool)

(assert (=> start!28608 m!306255))

(push 1)

(assert (not b!292498))

(assert (not b!292500))

(assert (not start!28608))

(assert (not b!292497))

(assert (not b!292502))

(assert (not b!292501))

(check-sat)

(pop 1)

