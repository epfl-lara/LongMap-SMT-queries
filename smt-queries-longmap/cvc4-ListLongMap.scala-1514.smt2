; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28618 () Bool)

(assert start!28618)

(declare-fun b!292587 () Bool)

(declare-fun res!153646 () Bool)

(declare-fun e!185099 () Bool)

(assert (=> b!292587 (=> (not res!153646) (not e!185099))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292587 (= res!153646 (validKeyInArray!0 k!2524))))

(declare-fun b!292588 () Bool)

(declare-fun res!153648 () Bool)

(assert (=> b!292588 (=> (not res!153648) (not e!185099))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14797 0))(
  ( (array!14798 (arr!7021 (Array (_ BitVec 32) (_ BitVec 64))) (size!7373 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14797)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292588 (= res!153648 (and (= (size!7373 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7373 a!3312))))))

(declare-fun b!292589 () Bool)

(declare-fun res!153643 () Bool)

(assert (=> b!292589 (=> (not res!153643) (not e!185099))))

(declare-fun arrayContainsKey!0 (array!14797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292589 (= res!153643 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292590 () Bool)

(declare-fun e!185098 () Bool)

(assert (=> b!292590 (= e!185099 e!185098)))

(declare-fun res!153647 () Bool)

(assert (=> b!292590 (=> (not res!153647) (not e!185098))))

(declare-datatypes ((SeekEntryResult!2170 0))(
  ( (MissingZero!2170 (index!10850 (_ BitVec 32))) (Found!2170 (index!10851 (_ BitVec 32))) (Intermediate!2170 (undefined!2982 Bool) (index!10852 (_ BitVec 32)) (x!29033 (_ BitVec 32))) (Undefined!2170) (MissingVacant!2170 (index!10853 (_ BitVec 32))) )
))
(declare-fun lt!144941 () SeekEntryResult!2170)

(assert (=> b!292590 (= res!153647 (or (= lt!144941 (MissingZero!2170 i!1256)) (= lt!144941 (MissingVacant!2170 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14797 (_ BitVec 32)) SeekEntryResult!2170)

(assert (=> b!292590 (= lt!144941 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292591 () Bool)

(declare-fun res!153644 () Bool)

(assert (=> b!292591 (=> (not res!153644) (not e!185098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14797 (_ BitVec 32)) Bool)

(assert (=> b!292591 (= res!153644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153645 () Bool)

(assert (=> start!28618 (=> (not res!153645) (not e!185099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28618 (= res!153645 (validMask!0 mask!3809))))

(assert (=> start!28618 e!185099))

(assert (=> start!28618 true))

(declare-fun array_inv!4984 (array!14797) Bool)

(assert (=> start!28618 (array_inv!4984 a!3312)))

(declare-fun b!292592 () Bool)

(assert (=> b!292592 (= e!185098 false)))

(declare-fun lt!144943 () (_ BitVec 32))

(declare-fun lt!144940 () SeekEntryResult!2170)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14797 (_ BitVec 32)) SeekEntryResult!2170)

(assert (=> b!292592 (= lt!144940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144943 k!2524 (array!14798 (store (arr!7021 a!3312) i!1256 k!2524) (size!7373 a!3312)) mask!3809))))

(declare-fun lt!144942 () SeekEntryResult!2170)

(assert (=> b!292592 (= lt!144942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144943 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292592 (= lt!144943 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28618 res!153645) b!292588))

(assert (= (and b!292588 res!153648) b!292587))

(assert (= (and b!292587 res!153646) b!292589))

(assert (= (and b!292589 res!153643) b!292590))

(assert (= (and b!292590 res!153647) b!292591))

(assert (= (and b!292591 res!153644) b!292592))

(declare-fun m!306337 () Bool)

(assert (=> b!292592 m!306337))

(declare-fun m!306339 () Bool)

(assert (=> b!292592 m!306339))

(declare-fun m!306341 () Bool)

(assert (=> b!292592 m!306341))

(declare-fun m!306343 () Bool)

(assert (=> b!292592 m!306343))

(declare-fun m!306345 () Bool)

(assert (=> start!28618 m!306345))

(declare-fun m!306347 () Bool)

(assert (=> start!28618 m!306347))

(declare-fun m!306349 () Bool)

(assert (=> b!292589 m!306349))

(declare-fun m!306351 () Bool)

(assert (=> b!292587 m!306351))

(declare-fun m!306353 () Bool)

(assert (=> b!292591 m!306353))

(declare-fun m!306355 () Bool)

(assert (=> b!292590 m!306355))

(push 1)

