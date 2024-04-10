; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28392 () Bool)

(assert start!28392)

(declare-fun b!290665 () Bool)

(declare-fun res!152010 () Bool)

(declare-fun e!183932 () Bool)

(assert (=> b!290665 (=> (not res!152010) (not e!183932))))

(declare-datatypes ((array!14661 0))(
  ( (array!14662 (arr!6956 (Array (_ BitVec 32) (_ BitVec 64))) (size!7308 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14661)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290665 (= res!152010 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290666 () Bool)

(declare-fun e!183930 () Bool)

(declare-fun e!183928 () Bool)

(assert (=> b!290666 (= e!183930 e!183928)))

(declare-fun res!152006 () Bool)

(assert (=> b!290666 (=> (not res!152006) (not e!183928))))

(declare-fun lt!143616 () Bool)

(declare-datatypes ((SeekEntryResult!2105 0))(
  ( (MissingZero!2105 (index!10590 (_ BitVec 32))) (Found!2105 (index!10591 (_ BitVec 32))) (Intermediate!2105 (undefined!2917 Bool) (index!10592 (_ BitVec 32)) (x!28788 (_ BitVec 32))) (Undefined!2105) (MissingVacant!2105 (index!10593 (_ BitVec 32))) )
))
(declare-fun lt!143617 () SeekEntryResult!2105)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290666 (= res!152006 (and (not lt!143616) (= lt!143617 (MissingVacant!2105 i!1256))))))

(declare-fun lt!143612 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143615 () SeekEntryResult!2105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14661 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!290666 (= lt!143615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143612 k!2524 (array!14662 (store (arr!6956 a!3312) i!1256 k!2524) (size!7308 a!3312)) mask!3809))))

(declare-fun lt!143614 () SeekEntryResult!2105)

(assert (=> b!290666 (= lt!143614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143612 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290666 (= lt!143612 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290667 () Bool)

(assert (=> b!290667 (= e!183932 e!183930)))

(declare-fun res!152008 () Bool)

(assert (=> b!290667 (=> (not res!152008) (not e!183930))))

(assert (=> b!290667 (= res!152008 (or lt!143616 (= lt!143617 (MissingVacant!2105 i!1256))))))

(assert (=> b!290667 (= lt!143616 (= lt!143617 (MissingZero!2105 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14661 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!290667 (= lt!143617 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!152004 () Bool)

(assert (=> start!28392 (=> (not res!152004) (not e!183932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28392 (= res!152004 (validMask!0 mask!3809))))

(assert (=> start!28392 e!183932))

(assert (=> start!28392 true))

(declare-fun array_inv!4919 (array!14661) Bool)

(assert (=> start!28392 (array_inv!4919 a!3312)))

(declare-fun b!290668 () Bool)

(declare-fun res!152009 () Bool)

(assert (=> b!290668 (=> (not res!152009) (not e!183932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290668 (= res!152009 (validKeyInArray!0 k!2524))))

(declare-fun b!290669 () Bool)

(declare-fun e!183931 () Bool)

(assert (=> b!290669 (= e!183931 (not true))))

(assert (=> b!290669 (= (index!10592 lt!143614) i!1256)))

(declare-fun b!290670 () Bool)

(declare-fun res!152007 () Bool)

(assert (=> b!290670 (=> (not res!152007) (not e!183932))))

(assert (=> b!290670 (= res!152007 (and (= (size!7308 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7308 a!3312))))))

(declare-fun b!290671 () Bool)

(declare-fun res!152003 () Bool)

(assert (=> b!290671 (=> (not res!152003) (not e!183930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14661 (_ BitVec 32)) Bool)

(assert (=> b!290671 (= res!152003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290672 () Bool)

(assert (=> b!290672 (= e!183928 e!183931)))

(declare-fun res!152005 () Bool)

(assert (=> b!290672 (=> (not res!152005) (not e!183931))))

(declare-fun lt!143613 () Bool)

(assert (=> b!290672 (= res!152005 (and (or lt!143613 (not (undefined!2917 lt!143614))) (not lt!143613) (= (select (arr!6956 a!3312) (index!10592 lt!143614)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290672 (= lt!143613 (not (is-Intermediate!2105 lt!143614)))))

(assert (= (and start!28392 res!152004) b!290670))

(assert (= (and b!290670 res!152007) b!290668))

(assert (= (and b!290668 res!152009) b!290665))

(assert (= (and b!290665 res!152010) b!290667))

(assert (= (and b!290667 res!152008) b!290671))

(assert (= (and b!290671 res!152003) b!290666))

(assert (= (and b!290666 res!152006) b!290672))

(assert (= (and b!290672 res!152005) b!290669))

(declare-fun m!304665 () Bool)

(assert (=> b!290672 m!304665))

(declare-fun m!304667 () Bool)

(assert (=> b!290665 m!304667))

(declare-fun m!304669 () Bool)

(assert (=> b!290668 m!304669))

(declare-fun m!304671 () Bool)

(assert (=> b!290666 m!304671))

(declare-fun m!304673 () Bool)

(assert (=> b!290666 m!304673))

(declare-fun m!304675 () Bool)

(assert (=> b!290666 m!304675))

(declare-fun m!304677 () Bool)

(assert (=> b!290666 m!304677))

(declare-fun m!304679 () Bool)

(assert (=> start!28392 m!304679))

(declare-fun m!304681 () Bool)

(assert (=> start!28392 m!304681))

(declare-fun m!304683 () Bool)

(assert (=> b!290671 m!304683))

(declare-fun m!304685 () Bool)

(assert (=> b!290667 m!304685))

(push 1)

