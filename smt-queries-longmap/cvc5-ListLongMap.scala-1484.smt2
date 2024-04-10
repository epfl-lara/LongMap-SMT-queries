; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28290 () Bool)

(assert start!28290)

(declare-fun b!289905 () Bool)

(declare-fun e!183497 () Bool)

(declare-fun e!183496 () Bool)

(assert (=> b!289905 (= e!183497 e!183496)))

(declare-fun res!151385 () Bool)

(assert (=> b!289905 (=> (not res!151385) (not e!183496))))

(declare-datatypes ((SeekEntryResult!2078 0))(
  ( (MissingZero!2078 (index!10482 (_ BitVec 32))) (Found!2078 (index!10483 (_ BitVec 32))) (Intermediate!2078 (undefined!2890 Bool) (index!10484 (_ BitVec 32)) (x!28683 (_ BitVec 32))) (Undefined!2078) (MissingVacant!2078 (index!10485 (_ BitVec 32))) )
))
(declare-fun lt!143134 () SeekEntryResult!2078)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289905 (= res!151385 (or (= lt!143134 (MissingZero!2078 i!1256)) (= lt!143134 (MissingVacant!2078 i!1256))))))

(declare-datatypes ((array!14604 0))(
  ( (array!14605 (arr!6929 (Array (_ BitVec 32) (_ BitVec 64))) (size!7281 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14604)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14604 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!289905 (= lt!143134 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289906 () Bool)

(declare-fun res!151387 () Bool)

(assert (=> b!289906 (=> (not res!151387) (not e!183497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289906 (= res!151387 (validKeyInArray!0 k!2524))))

(declare-fun b!289907 () Bool)

(declare-fun res!151384 () Bool)

(assert (=> b!289907 (=> (not res!151384) (not e!183497))))

(assert (=> b!289907 (= res!151384 (and (= (size!7281 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7281 a!3312))))))

(declare-fun b!289908 () Bool)

(declare-fun res!151388 () Bool)

(assert (=> b!289908 (=> (not res!151388) (not e!183496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14604 (_ BitVec 32)) Bool)

(assert (=> b!289908 (= res!151388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151389 () Bool)

(assert (=> start!28290 (=> (not res!151389) (not e!183497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28290 (= res!151389 (validMask!0 mask!3809))))

(assert (=> start!28290 e!183497))

(assert (=> start!28290 true))

(declare-fun array_inv!4892 (array!14604) Bool)

(assert (=> start!28290 (array_inv!4892 a!3312)))

(declare-fun b!289909 () Bool)

(declare-fun res!151386 () Bool)

(assert (=> b!289909 (=> (not res!151386) (not e!183497))))

(declare-fun arrayContainsKey!0 (array!14604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289909 (= res!151386 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289910 () Bool)

(assert (=> b!289910 (= e!183496 false)))

(declare-fun lt!143136 () (_ BitVec 32))

(declare-fun lt!143137 () SeekEntryResult!2078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14604 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!289910 (= lt!143137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143136 k!2524 (array!14605 (store (arr!6929 a!3312) i!1256 k!2524) (size!7281 a!3312)) mask!3809))))

(declare-fun lt!143135 () SeekEntryResult!2078)

(assert (=> b!289910 (= lt!143135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143136 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289910 (= lt!143136 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28290 res!151389) b!289907))

(assert (= (and b!289907 res!151384) b!289906))

(assert (= (and b!289906 res!151387) b!289909))

(assert (= (and b!289909 res!151386) b!289905))

(assert (= (and b!289905 res!151385) b!289908))

(assert (= (and b!289908 res!151388) b!289910))

(declare-fun m!303987 () Bool)

(assert (=> start!28290 m!303987))

(declare-fun m!303989 () Bool)

(assert (=> start!28290 m!303989))

(declare-fun m!303991 () Bool)

(assert (=> b!289905 m!303991))

(declare-fun m!303993 () Bool)

(assert (=> b!289908 m!303993))

(declare-fun m!303995 () Bool)

(assert (=> b!289906 m!303995))

(declare-fun m!303997 () Bool)

(assert (=> b!289909 m!303997))

(declare-fun m!303999 () Bool)

(assert (=> b!289910 m!303999))

(declare-fun m!304001 () Bool)

(assert (=> b!289910 m!304001))

(declare-fun m!304003 () Bool)

(assert (=> b!289910 m!304003))

(declare-fun m!304005 () Bool)

(assert (=> b!289910 m!304005))

(push 1)

