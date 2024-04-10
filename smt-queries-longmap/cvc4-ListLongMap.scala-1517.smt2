; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28636 () Bool)

(assert start!28636)

(declare-fun b!292749 () Bool)

(declare-fun res!153807 () Bool)

(declare-fun e!185180 () Bool)

(assert (=> b!292749 (=> (not res!153807) (not e!185180))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14815 0))(
  ( (array!14816 (arr!7030 (Array (_ BitVec 32) (_ BitVec 64))) (size!7382 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14815)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292749 (= res!153807 (and (= (size!7382 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7382 a!3312))))))

(declare-fun b!292750 () Bool)

(declare-fun res!153806 () Bool)

(assert (=> b!292750 (=> (not res!153806) (not e!185180))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292750 (= res!153806 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292751 () Bool)

(declare-fun e!185179 () Bool)

(assert (=> b!292751 (= e!185179 false)))

(declare-fun lt!145050 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2179 0))(
  ( (MissingZero!2179 (index!10886 (_ BitVec 32))) (Found!2179 (index!10887 (_ BitVec 32))) (Intermediate!2179 (undefined!2991 Bool) (index!10888 (_ BitVec 32)) (x!29066 (_ BitVec 32))) (Undefined!2179) (MissingVacant!2179 (index!10889 (_ BitVec 32))) )
))
(declare-fun lt!145051 () SeekEntryResult!2179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14815 (_ BitVec 32)) SeekEntryResult!2179)

(assert (=> b!292751 (= lt!145051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145050 k!2524 (array!14816 (store (arr!7030 a!3312) i!1256 k!2524) (size!7382 a!3312)) mask!3809))))

(declare-fun lt!145048 () SeekEntryResult!2179)

(assert (=> b!292751 (= lt!145048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145050 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292751 (= lt!145050 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292752 () Bool)

(assert (=> b!292752 (= e!185180 e!185179)))

(declare-fun res!153810 () Bool)

(assert (=> b!292752 (=> (not res!153810) (not e!185179))))

(declare-fun lt!145049 () SeekEntryResult!2179)

(assert (=> b!292752 (= res!153810 (or (= lt!145049 (MissingZero!2179 i!1256)) (= lt!145049 (MissingVacant!2179 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14815 (_ BitVec 32)) SeekEntryResult!2179)

(assert (=> b!292752 (= lt!145049 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292753 () Bool)

(declare-fun res!153809 () Bool)

(assert (=> b!292753 (=> (not res!153809) (not e!185179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14815 (_ BitVec 32)) Bool)

(assert (=> b!292753 (= res!153809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153805 () Bool)

(assert (=> start!28636 (=> (not res!153805) (not e!185180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28636 (= res!153805 (validMask!0 mask!3809))))

(assert (=> start!28636 e!185180))

(assert (=> start!28636 true))

(declare-fun array_inv!4993 (array!14815) Bool)

(assert (=> start!28636 (array_inv!4993 a!3312)))

(declare-fun b!292754 () Bool)

(declare-fun res!153808 () Bool)

(assert (=> b!292754 (=> (not res!153808) (not e!185180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292754 (= res!153808 (validKeyInArray!0 k!2524))))

(assert (= (and start!28636 res!153805) b!292749))

(assert (= (and b!292749 res!153807) b!292754))

(assert (= (and b!292754 res!153808) b!292750))

(assert (= (and b!292750 res!153806) b!292752))

(assert (= (and b!292752 res!153810) b!292753))

(assert (= (and b!292753 res!153809) b!292751))

(declare-fun m!306517 () Bool)

(assert (=> start!28636 m!306517))

(declare-fun m!306519 () Bool)

(assert (=> start!28636 m!306519))

(declare-fun m!306521 () Bool)

(assert (=> b!292752 m!306521))

(declare-fun m!306523 () Bool)

(assert (=> b!292750 m!306523))

(declare-fun m!306525 () Bool)

(assert (=> b!292753 m!306525))

(declare-fun m!306527 () Bool)

(assert (=> b!292751 m!306527))

(declare-fun m!306529 () Bool)

(assert (=> b!292751 m!306529))

(declare-fun m!306531 () Bool)

(assert (=> b!292751 m!306531))

(declare-fun m!306533 () Bool)

(assert (=> b!292751 m!306533))

(declare-fun m!306535 () Bool)

(assert (=> b!292754 m!306535))

(push 1)

(assert (not b!292753))

(assert (not b!292750))

(assert (not b!292752))

