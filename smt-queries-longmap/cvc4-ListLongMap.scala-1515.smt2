; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28624 () Bool)

(assert start!28624)

(declare-fun res!153701 () Bool)

(declare-fun e!185124 () Bool)

(assert (=> start!28624 (=> (not res!153701) (not e!185124))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28624 (= res!153701 (validMask!0 mask!3809))))

(assert (=> start!28624 e!185124))

(assert (=> start!28624 true))

(declare-datatypes ((array!14803 0))(
  ( (array!14804 (arr!7024 (Array (_ BitVec 32) (_ BitVec 64))) (size!7376 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14803)

(declare-fun array_inv!4987 (array!14803) Bool)

(assert (=> start!28624 (array_inv!4987 a!3312)))

(declare-fun b!292641 () Bool)

(declare-fun res!153702 () Bool)

(assert (=> b!292641 (=> (not res!153702) (not e!185124))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292641 (= res!153702 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292642 () Bool)

(declare-fun res!153699 () Bool)

(assert (=> b!292642 (=> (not res!153699) (not e!185124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292642 (= res!153699 (validKeyInArray!0 k!2524))))

(declare-fun b!292643 () Bool)

(declare-fun res!153697 () Bool)

(assert (=> b!292643 (=> (not res!153697) (not e!185124))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292643 (= res!153697 (and (= (size!7376 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7376 a!3312))))))

(declare-fun b!292644 () Bool)

(declare-fun e!185126 () Bool)

(assert (=> b!292644 (= e!185124 e!185126)))

(declare-fun res!153698 () Bool)

(assert (=> b!292644 (=> (not res!153698) (not e!185126))))

(declare-datatypes ((SeekEntryResult!2173 0))(
  ( (MissingZero!2173 (index!10862 (_ BitVec 32))) (Found!2173 (index!10863 (_ BitVec 32))) (Intermediate!2173 (undefined!2985 Bool) (index!10864 (_ BitVec 32)) (x!29044 (_ BitVec 32))) (Undefined!2173) (MissingVacant!2173 (index!10865 (_ BitVec 32))) )
))
(declare-fun lt!144977 () SeekEntryResult!2173)

(assert (=> b!292644 (= res!153698 (or (= lt!144977 (MissingZero!2173 i!1256)) (= lt!144977 (MissingVacant!2173 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14803 (_ BitVec 32)) SeekEntryResult!2173)

(assert (=> b!292644 (= lt!144977 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292645 () Bool)

(assert (=> b!292645 (= e!185126 false)))

(declare-fun lt!144978 () (_ BitVec 32))

(declare-fun lt!144976 () SeekEntryResult!2173)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14803 (_ BitVec 32)) SeekEntryResult!2173)

(assert (=> b!292645 (= lt!144976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144978 k!2524 (array!14804 (store (arr!7024 a!3312) i!1256 k!2524) (size!7376 a!3312)) mask!3809))))

(declare-fun lt!144979 () SeekEntryResult!2173)

(assert (=> b!292645 (= lt!144979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144978 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292645 (= lt!144978 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292646 () Bool)

(declare-fun res!153700 () Bool)

(assert (=> b!292646 (=> (not res!153700) (not e!185126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14803 (_ BitVec 32)) Bool)

(assert (=> b!292646 (= res!153700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28624 res!153701) b!292643))

(assert (= (and b!292643 res!153697) b!292642))

(assert (= (and b!292642 res!153699) b!292641))

(assert (= (and b!292641 res!153702) b!292644))

(assert (= (and b!292644 res!153698) b!292646))

(assert (= (and b!292646 res!153700) b!292645))

(declare-fun m!306397 () Bool)

(assert (=> b!292642 m!306397))

(declare-fun m!306399 () Bool)

(assert (=> b!292645 m!306399))

(declare-fun m!306401 () Bool)

(assert (=> b!292645 m!306401))

(declare-fun m!306403 () Bool)

(assert (=> b!292645 m!306403))

(declare-fun m!306405 () Bool)

(assert (=> b!292645 m!306405))

(declare-fun m!306407 () Bool)

(assert (=> b!292644 m!306407))

(declare-fun m!306409 () Bool)

(assert (=> b!292641 m!306409))

(declare-fun m!306411 () Bool)

(assert (=> start!28624 m!306411))

(declare-fun m!306413 () Bool)

(assert (=> start!28624 m!306413))

(declare-fun m!306415 () Bool)

(assert (=> b!292646 m!306415))

(push 1)

(assert (not b!292641))

(assert (not b!292644))

(assert (not b!292642))

(assert (not b!292646))

(assert (not start!28624))

(assert (not b!292645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

