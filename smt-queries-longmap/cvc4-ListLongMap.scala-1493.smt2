; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28396 () Bool)

(assert start!28396)

(declare-fun b!290713 () Bool)

(declare-fun res!152052 () Bool)

(declare-fun e!183959 () Bool)

(assert (=> b!290713 (=> (not res!152052) (not e!183959))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14665 0))(
  ( (array!14666 (arr!6958 (Array (_ BitVec 32) (_ BitVec 64))) (size!7310 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14665)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290713 (= res!152052 (and (= (size!7310 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7310 a!3312))))))

(declare-fun b!290714 () Bool)

(declare-fun res!152056 () Bool)

(assert (=> b!290714 (=> (not res!152056) (not e!183959))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290714 (= res!152056 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290715 () Bool)

(declare-fun e!183958 () Bool)

(assert (=> b!290715 (= e!183958 (not true))))

(declare-datatypes ((SeekEntryResult!2107 0))(
  ( (MissingZero!2107 (index!10598 (_ BitVec 32))) (Found!2107 (index!10599 (_ BitVec 32))) (Intermediate!2107 (undefined!2919 Bool) (index!10600 (_ BitVec 32)) (x!28790 (_ BitVec 32))) (Undefined!2107) (MissingVacant!2107 (index!10601 (_ BitVec 32))) )
))
(declare-fun lt!143652 () SeekEntryResult!2107)

(assert (=> b!290715 (= (index!10600 lt!143652) i!1256)))

(declare-fun b!290716 () Bool)

(declare-fun e!183960 () Bool)

(assert (=> b!290716 (= e!183960 e!183958)))

(declare-fun res!152051 () Bool)

(assert (=> b!290716 (=> (not res!152051) (not e!183958))))

(declare-fun lt!143648 () Bool)

(assert (=> b!290716 (= res!152051 (and (or lt!143648 (not (undefined!2919 lt!143652))) (not lt!143648) (= (select (arr!6958 a!3312) (index!10600 lt!143652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290716 (= lt!143648 (not (is-Intermediate!2107 lt!143652)))))

(declare-fun b!290717 () Bool)

(declare-fun res!152055 () Bool)

(assert (=> b!290717 (=> (not res!152055) (not e!183959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290717 (= res!152055 (validKeyInArray!0 k!2524))))

(declare-fun b!290718 () Bool)

(declare-fun res!152058 () Bool)

(declare-fun e!183961 () Bool)

(assert (=> b!290718 (=> (not res!152058) (not e!183961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14665 (_ BitVec 32)) Bool)

(assert (=> b!290718 (= res!152058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290719 () Bool)

(assert (=> b!290719 (= e!183961 e!183960)))

(declare-fun res!152053 () Bool)

(assert (=> b!290719 (=> (not res!152053) (not e!183960))))

(declare-fun lt!143649 () Bool)

(declare-fun lt!143650 () SeekEntryResult!2107)

(assert (=> b!290719 (= res!152053 (and (not lt!143649) (= lt!143650 (MissingVacant!2107 i!1256))))))

(declare-fun lt!143653 () SeekEntryResult!2107)

(declare-fun lt!143651 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14665 (_ BitVec 32)) SeekEntryResult!2107)

(assert (=> b!290719 (= lt!143653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143651 k!2524 (array!14666 (store (arr!6958 a!3312) i!1256 k!2524) (size!7310 a!3312)) mask!3809))))

(assert (=> b!290719 (= lt!143652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143651 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290719 (= lt!143651 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!152057 () Bool)

(assert (=> start!28396 (=> (not res!152057) (not e!183959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28396 (= res!152057 (validMask!0 mask!3809))))

(assert (=> start!28396 e!183959))

(assert (=> start!28396 true))

(declare-fun array_inv!4921 (array!14665) Bool)

(assert (=> start!28396 (array_inv!4921 a!3312)))

(declare-fun b!290720 () Bool)

(assert (=> b!290720 (= e!183959 e!183961)))

(declare-fun res!152054 () Bool)

(assert (=> b!290720 (=> (not res!152054) (not e!183961))))

(assert (=> b!290720 (= res!152054 (or lt!143649 (= lt!143650 (MissingVacant!2107 i!1256))))))

(assert (=> b!290720 (= lt!143649 (= lt!143650 (MissingZero!2107 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14665 (_ BitVec 32)) SeekEntryResult!2107)

(assert (=> b!290720 (= lt!143650 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28396 res!152057) b!290713))

(assert (= (and b!290713 res!152052) b!290717))

(assert (= (and b!290717 res!152055) b!290714))

(assert (= (and b!290714 res!152056) b!290720))

(assert (= (and b!290720 res!152054) b!290718))

(assert (= (and b!290718 res!152058) b!290719))

(assert (= (and b!290719 res!152053) b!290716))

(assert (= (and b!290716 res!152051) b!290715))

(declare-fun m!304709 () Bool)

(assert (=> b!290718 m!304709))

(declare-fun m!304711 () Bool)

(assert (=> b!290719 m!304711))

(declare-fun m!304713 () Bool)

(assert (=> b!290719 m!304713))

(declare-fun m!304715 () Bool)

(assert (=> b!290719 m!304715))

(declare-fun m!304717 () Bool)

(assert (=> b!290719 m!304717))

(declare-fun m!304719 () Bool)

(assert (=> b!290720 m!304719))

(declare-fun m!304721 () Bool)

(assert (=> b!290716 m!304721))

(declare-fun m!304723 () Bool)

(assert (=> b!290714 m!304723))

(declare-fun m!304725 () Bool)

(assert (=> b!290717 m!304725))

(declare-fun m!304727 () Bool)

(assert (=> start!28396 m!304727))

(declare-fun m!304729 () Bool)

(assert (=> start!28396 m!304729))

(push 1)

