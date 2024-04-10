; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28386 () Bool)

(assert start!28386)

(declare-fun b!290593 () Bool)

(declare-fun res!151938 () Bool)

(declare-fun e!183884 () Bool)

(assert (=> b!290593 (=> (not res!151938) (not e!183884))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290593 (= res!151938 (validKeyInArray!0 k!2524))))

(declare-fun b!290594 () Bool)

(declare-fun e!183883 () Bool)

(declare-fun e!183887 () Bool)

(assert (=> b!290594 (= e!183883 e!183887)))

(declare-fun res!151933 () Bool)

(assert (=> b!290594 (=> (not res!151933) (not e!183887))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2102 0))(
  ( (MissingZero!2102 (index!10578 (_ BitVec 32))) (Found!2102 (index!10579 (_ BitVec 32))) (Intermediate!2102 (undefined!2914 Bool) (index!10580 (_ BitVec 32)) (x!28777 (_ BitVec 32))) (Undefined!2102) (MissingVacant!2102 (index!10581 (_ BitVec 32))) )
))
(declare-fun lt!143563 () SeekEntryResult!2102)

(declare-fun lt!143559 () Bool)

(assert (=> b!290594 (= res!151933 (and (not lt!143559) (= lt!143563 (MissingVacant!2102 i!1256))))))

(declare-fun lt!143560 () SeekEntryResult!2102)

(declare-fun lt!143558 () (_ BitVec 32))

(declare-datatypes ((array!14655 0))(
  ( (array!14656 (arr!6953 (Array (_ BitVec 32) (_ BitVec 64))) (size!7305 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14655)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14655 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!290594 (= lt!143560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143558 k!2524 (array!14656 (store (arr!6953 a!3312) i!1256 k!2524) (size!7305 a!3312)) mask!3809))))

(declare-fun lt!143561 () SeekEntryResult!2102)

(assert (=> b!290594 (= lt!143561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143558 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290594 (= lt!143558 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290595 () Bool)

(declare-fun res!151935 () Bool)

(assert (=> b!290595 (=> (not res!151935) (not e!183884))))

(assert (=> b!290595 (= res!151935 (and (= (size!7305 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7305 a!3312))))))

(declare-fun res!151931 () Bool)

(assert (=> start!28386 (=> (not res!151931) (not e!183884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28386 (= res!151931 (validMask!0 mask!3809))))

(assert (=> start!28386 e!183884))

(assert (=> start!28386 true))

(declare-fun array_inv!4916 (array!14655) Bool)

(assert (=> start!28386 (array_inv!4916 a!3312)))

(declare-fun b!290596 () Bool)

(declare-fun e!183885 () Bool)

(assert (=> b!290596 (= e!183887 e!183885)))

(declare-fun res!151932 () Bool)

(assert (=> b!290596 (=> (not res!151932) (not e!183885))))

(declare-fun lt!143562 () Bool)

(assert (=> b!290596 (= res!151932 (and (or lt!143562 (not (undefined!2914 lt!143561))) (not lt!143562) (= (select (arr!6953 a!3312) (index!10580 lt!143561)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290596 (= lt!143562 (not (is-Intermediate!2102 lt!143561)))))

(declare-fun b!290597 () Bool)

(assert (=> b!290597 (= e!183885 (not true))))

(assert (=> b!290597 (= (index!10580 lt!143561) i!1256)))

(declare-fun b!290598 () Bool)

(declare-fun res!151934 () Bool)

(assert (=> b!290598 (=> (not res!151934) (not e!183883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14655 (_ BitVec 32)) Bool)

(assert (=> b!290598 (= res!151934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290599 () Bool)

(declare-fun res!151937 () Bool)

(assert (=> b!290599 (=> (not res!151937) (not e!183884))))

(declare-fun arrayContainsKey!0 (array!14655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290599 (= res!151937 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290600 () Bool)

(assert (=> b!290600 (= e!183884 e!183883)))

(declare-fun res!151936 () Bool)

(assert (=> b!290600 (=> (not res!151936) (not e!183883))))

(assert (=> b!290600 (= res!151936 (or lt!143559 (= lt!143563 (MissingVacant!2102 i!1256))))))

(assert (=> b!290600 (= lt!143559 (= lt!143563 (MissingZero!2102 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14655 (_ BitVec 32)) SeekEntryResult!2102)

(assert (=> b!290600 (= lt!143563 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28386 res!151931) b!290595))

(assert (= (and b!290595 res!151935) b!290593))

(assert (= (and b!290593 res!151938) b!290599))

(assert (= (and b!290599 res!151937) b!290600))

(assert (= (and b!290600 res!151936) b!290598))

(assert (= (and b!290598 res!151934) b!290594))

(assert (= (and b!290594 res!151933) b!290596))

(assert (= (and b!290596 res!151932) b!290597))

(declare-fun m!304599 () Bool)

(assert (=> start!28386 m!304599))

(declare-fun m!304601 () Bool)

(assert (=> start!28386 m!304601))

(declare-fun m!304603 () Bool)

(assert (=> b!290594 m!304603))

(declare-fun m!304605 () Bool)

(assert (=> b!290594 m!304605))

(declare-fun m!304607 () Bool)

(assert (=> b!290594 m!304607))

(declare-fun m!304609 () Bool)

(assert (=> b!290594 m!304609))

(declare-fun m!304611 () Bool)

(assert (=> b!290596 m!304611))

(declare-fun m!304613 () Bool)

(assert (=> b!290593 m!304613))

(declare-fun m!304615 () Bool)

(assert (=> b!290598 m!304615))

(declare-fun m!304617 () Bool)

(assert (=> b!290600 m!304617))

(declare-fun m!304619 () Bool)

(assert (=> b!290599 m!304619))

(push 1)

