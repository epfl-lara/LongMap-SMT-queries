; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28628 () Bool)

(assert start!28628)

(declare-fun b!292566 () Bool)

(declare-fun res!153678 () Bool)

(declare-fun e!185060 () Bool)

(assert (=> b!292566 (=> (not res!153678) (not e!185060))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14800 0))(
  ( (array!14801 (arr!7023 (Array (_ BitVec 32) (_ BitVec 64))) (size!7376 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14800)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292566 (= res!153678 (and (= (size!7376 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7376 a!3312))))))

(declare-fun res!153679 () Bool)

(assert (=> start!28628 (=> (not res!153679) (not e!185060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28628 (= res!153679 (validMask!0 mask!3809))))

(assert (=> start!28628 e!185060))

(assert (=> start!28628 true))

(declare-fun array_inv!4995 (array!14800) Bool)

(assert (=> start!28628 (array_inv!4995 a!3312)))

(declare-fun b!292567 () Bool)

(declare-fun e!185059 () Bool)

(assert (=> b!292567 (= e!185060 e!185059)))

(declare-fun res!153675 () Bool)

(assert (=> b!292567 (=> (not res!153675) (not e!185059))))

(declare-datatypes ((SeekEntryResult!2171 0))(
  ( (MissingZero!2171 (index!10854 (_ BitVec 32))) (Found!2171 (index!10855 (_ BitVec 32))) (Intermediate!2171 (undefined!2983 Bool) (index!10856 (_ BitVec 32)) (x!29057 (_ BitVec 32))) (Undefined!2171) (MissingVacant!2171 (index!10857 (_ BitVec 32))) )
))
(declare-fun lt!144843 () SeekEntryResult!2171)

(assert (=> b!292567 (= res!153675 (or (= lt!144843 (MissingZero!2171 i!1256)) (= lt!144843 (MissingVacant!2171 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14800 (_ BitVec 32)) SeekEntryResult!2171)

(assert (=> b!292567 (= lt!144843 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292568 () Bool)

(declare-fun res!153676 () Bool)

(assert (=> b!292568 (=> (not res!153676) (not e!185059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14800 (_ BitVec 32)) Bool)

(assert (=> b!292568 (= res!153676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292569 () Bool)

(declare-fun res!153674 () Bool)

(assert (=> b!292569 (=> (not res!153674) (not e!185060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292569 (= res!153674 (validKeyInArray!0 k0!2524))))

(declare-fun b!292570 () Bool)

(declare-fun res!153677 () Bool)

(assert (=> b!292570 (=> (not res!153677) (not e!185060))))

(declare-fun arrayContainsKey!0 (array!14800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292570 (= res!153677 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292571 () Bool)

(assert (=> b!292571 (= e!185059 false)))

(declare-fun lt!144845 () (_ BitVec 32))

(declare-fun lt!144846 () SeekEntryResult!2171)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14800 (_ BitVec 32)) SeekEntryResult!2171)

(assert (=> b!292571 (= lt!144846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144845 k0!2524 (array!14801 (store (arr!7023 a!3312) i!1256 k0!2524) (size!7376 a!3312)) mask!3809))))

(declare-fun lt!144844 () SeekEntryResult!2171)

(assert (=> b!292571 (= lt!144844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144845 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292571 (= lt!144845 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28628 res!153679) b!292566))

(assert (= (and b!292566 res!153678) b!292569))

(assert (= (and b!292569 res!153674) b!292570))

(assert (= (and b!292570 res!153677) b!292567))

(assert (= (and b!292567 res!153675) b!292568))

(assert (= (and b!292568 res!153676) b!292571))

(declare-fun m!305885 () Bool)

(assert (=> start!28628 m!305885))

(declare-fun m!305887 () Bool)

(assert (=> start!28628 m!305887))

(declare-fun m!305889 () Bool)

(assert (=> b!292568 m!305889))

(declare-fun m!305891 () Bool)

(assert (=> b!292571 m!305891))

(declare-fun m!305893 () Bool)

(assert (=> b!292571 m!305893))

(declare-fun m!305895 () Bool)

(assert (=> b!292571 m!305895))

(declare-fun m!305897 () Bool)

(assert (=> b!292571 m!305897))

(declare-fun m!305899 () Bool)

(assert (=> b!292569 m!305899))

(declare-fun m!305901 () Bool)

(assert (=> b!292567 m!305901))

(declare-fun m!305903 () Bool)

(assert (=> b!292570 m!305903))

(check-sat (not start!28628) (not b!292570) (not b!292569) (not b!292568) (not b!292571) (not b!292567))
(check-sat)
