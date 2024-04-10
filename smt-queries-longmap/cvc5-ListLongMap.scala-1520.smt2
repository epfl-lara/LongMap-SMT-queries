; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28650 () Bool)

(assert start!28650)

(declare-fun b!292875 () Bool)

(declare-fun res!153935 () Bool)

(declare-fun e!185243 () Bool)

(assert (=> b!292875 (=> (not res!153935) (not e!185243))))

(declare-datatypes ((array!14829 0))(
  ( (array!14830 (arr!7037 (Array (_ BitVec 32) (_ BitVec 64))) (size!7389 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14829)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292875 (= res!153935 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292876 () Bool)

(declare-fun e!185242 () Bool)

(assert (=> b!292876 (= e!185243 e!185242)))

(declare-fun res!153934 () Bool)

(assert (=> b!292876 (=> (not res!153934) (not e!185242))))

(declare-datatypes ((SeekEntryResult!2186 0))(
  ( (MissingZero!2186 (index!10914 (_ BitVec 32))) (Found!2186 (index!10915 (_ BitVec 32))) (Intermediate!2186 (undefined!2998 Bool) (index!10916 (_ BitVec 32)) (x!29097 (_ BitVec 32))) (Undefined!2186) (MissingVacant!2186 (index!10917 (_ BitVec 32))) )
))
(declare-fun lt!145134 () SeekEntryResult!2186)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292876 (= res!153934 (or (= lt!145134 (MissingZero!2186 i!1256)) (= lt!145134 (MissingVacant!2186 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14829 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!292876 (= lt!145134 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292877 () Bool)

(declare-fun res!153933 () Bool)

(assert (=> b!292877 (=> (not res!153933) (not e!185243))))

(assert (=> b!292877 (= res!153933 (and (= (size!7389 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7389 a!3312))))))

(declare-fun b!292878 () Bool)

(declare-fun res!153931 () Bool)

(assert (=> b!292878 (=> (not res!153931) (not e!185242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14829 (_ BitVec 32)) Bool)

(assert (=> b!292878 (= res!153931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292879 () Bool)

(assert (=> b!292879 (= e!185242 false)))

(declare-fun lt!145133 () (_ BitVec 32))

(declare-fun lt!145132 () SeekEntryResult!2186)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14829 (_ BitVec 32)) SeekEntryResult!2186)

(assert (=> b!292879 (= lt!145132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145133 k!2524 (array!14830 (store (arr!7037 a!3312) i!1256 k!2524) (size!7389 a!3312)) mask!3809))))

(declare-fun lt!145135 () SeekEntryResult!2186)

(assert (=> b!292879 (= lt!145135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145133 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292879 (= lt!145133 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!153936 () Bool)

(assert (=> start!28650 (=> (not res!153936) (not e!185243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28650 (= res!153936 (validMask!0 mask!3809))))

(assert (=> start!28650 e!185243))

(assert (=> start!28650 true))

(declare-fun array_inv!5000 (array!14829) Bool)

(assert (=> start!28650 (array_inv!5000 a!3312)))

(declare-fun b!292880 () Bool)

(declare-fun res!153932 () Bool)

(assert (=> b!292880 (=> (not res!153932) (not e!185243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292880 (= res!153932 (validKeyInArray!0 k!2524))))

(assert (= (and start!28650 res!153936) b!292877))

(assert (= (and b!292877 res!153933) b!292880))

(assert (= (and b!292880 res!153932) b!292875))

(assert (= (and b!292875 res!153935) b!292876))

(assert (= (and b!292876 res!153934) b!292878))

(assert (= (and b!292878 res!153931) b!292879))

(declare-fun m!306657 () Bool)

(assert (=> b!292876 m!306657))

(declare-fun m!306659 () Bool)

(assert (=> b!292875 m!306659))

(declare-fun m!306661 () Bool)

(assert (=> start!28650 m!306661))

(declare-fun m!306663 () Bool)

(assert (=> start!28650 m!306663))

(declare-fun m!306665 () Bool)

(assert (=> b!292879 m!306665))

(declare-fun m!306667 () Bool)

(assert (=> b!292879 m!306667))

(declare-fun m!306669 () Bool)

(assert (=> b!292879 m!306669))

(declare-fun m!306671 () Bool)

(assert (=> b!292879 m!306671))

(declare-fun m!306673 () Bool)

(assert (=> b!292878 m!306673))

(declare-fun m!306675 () Bool)

(assert (=> b!292880 m!306675))

(push 1)

