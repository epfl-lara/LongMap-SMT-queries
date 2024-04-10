; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29956 () Bool)

(assert start!29956)

(declare-fun b!300897 () Bool)

(declare-fun res!158651 () Bool)

(declare-fun e!189974 () Bool)

(assert (=> b!300897 (=> (not res!158651) (not e!189974))))

(declare-datatypes ((array!15189 0))(
  ( (array!15190 (arr!7187 (Array (_ BitVec 32) (_ BitVec 64))) (size!7539 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15189)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15189 (_ BitVec 32)) Bool)

(assert (=> b!300897 (= res!158651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300898 () Bool)

(declare-fun res!158649 () Bool)

(declare-fun e!189975 () Bool)

(assert (=> b!300898 (=> (not res!158649) (not e!189975))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300898 (= res!158649 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158650 () Bool)

(assert (=> start!29956 (=> (not res!158650) (not e!189975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29956 (= res!158650 (validMask!0 mask!3809))))

(assert (=> start!29956 e!189975))

(assert (=> start!29956 true))

(declare-fun array_inv!5150 (array!15189) Bool)

(assert (=> start!29956 (array_inv!5150 a!3312)))

(declare-fun b!300899 () Bool)

(assert (=> b!300899 (= e!189975 e!189974)))

(declare-fun res!158648 () Bool)

(assert (=> b!300899 (=> (not res!158648) (not e!189974))))

(declare-datatypes ((SeekEntryResult!2336 0))(
  ( (MissingZero!2336 (index!11520 (_ BitVec 32))) (Found!2336 (index!11521 (_ BitVec 32))) (Intermediate!2336 (undefined!3148 Bool) (index!11522 (_ BitVec 32)) (x!29784 (_ BitVec 32))) (Undefined!2336) (MissingVacant!2336 (index!11523 (_ BitVec 32))) )
))
(declare-fun lt!149702 () SeekEntryResult!2336)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300899 (= res!158648 (or (= lt!149702 (MissingZero!2336 i!1256)) (= lt!149702 (MissingVacant!2336 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15189 (_ BitVec 32)) SeekEntryResult!2336)

(assert (=> b!300899 (= lt!149702 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300900 () Bool)

(declare-fun res!158647 () Bool)

(assert (=> b!300900 (=> (not res!158647) (not e!189975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300900 (= res!158647 (validKeyInArray!0 k!2524))))

(declare-fun b!300901 () Bool)

(assert (=> b!300901 (= e!189974 false)))

(declare-fun lt!149700 () SeekEntryResult!2336)

(declare-fun lt!149703 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15189 (_ BitVec 32)) SeekEntryResult!2336)

(assert (=> b!300901 (= lt!149700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149703 k!2524 (array!15190 (store (arr!7187 a!3312) i!1256 k!2524) (size!7539 a!3312)) mask!3809))))

(declare-fun lt!149701 () SeekEntryResult!2336)

(assert (=> b!300901 (= lt!149701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149703 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300901 (= lt!149703 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300902 () Bool)

(declare-fun res!158652 () Bool)

(assert (=> b!300902 (=> (not res!158652) (not e!189975))))

(assert (=> b!300902 (= res!158652 (and (= (size!7539 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7539 a!3312))))))

(assert (= (and start!29956 res!158650) b!300902))

(assert (= (and b!300902 res!158652) b!300900))

(assert (= (and b!300900 res!158647) b!300898))

(assert (= (and b!300898 res!158649) b!300899))

(assert (= (and b!300899 res!158648) b!300897))

(assert (= (and b!300897 res!158651) b!300901))

(declare-fun m!312789 () Bool)

(assert (=> start!29956 m!312789))

(declare-fun m!312791 () Bool)

(assert (=> start!29956 m!312791))

(declare-fun m!312793 () Bool)

(assert (=> b!300898 m!312793))

(declare-fun m!312795 () Bool)

(assert (=> b!300899 m!312795))

(declare-fun m!312797 () Bool)

(assert (=> b!300897 m!312797))

(declare-fun m!312799 () Bool)

(assert (=> b!300900 m!312799))

(declare-fun m!312801 () Bool)

(assert (=> b!300901 m!312801))

(declare-fun m!312803 () Bool)

(assert (=> b!300901 m!312803))

(declare-fun m!312805 () Bool)

(assert (=> b!300901 m!312805))

(declare-fun m!312807 () Bool)

(assert (=> b!300901 m!312807))

(push 1)

