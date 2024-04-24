; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29938 () Bool)

(assert start!29938)

(declare-fun b!300844 () Bool)

(declare-fun res!158647 () Bool)

(declare-fun e!189942 () Bool)

(assert (=> b!300844 (=> (not res!158647) (not e!189942))))

(declare-datatypes ((array!15186 0))(
  ( (array!15187 (arr!7186 (Array (_ BitVec 32) (_ BitVec 64))) (size!7538 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15186)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300844 (= res!158647 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300845 () Bool)

(declare-fun res!158649 () Bool)

(assert (=> b!300845 (=> (not res!158649) (not e!189942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300845 (= res!158649 (validKeyInArray!0 k0!2524))))

(declare-fun b!300846 () Bool)

(declare-fun res!158644 () Bool)

(declare-fun e!189940 () Bool)

(assert (=> b!300846 (=> (not res!158644) (not e!189940))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15186 (_ BitVec 32)) Bool)

(assert (=> b!300846 (= res!158644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300847 () Bool)

(assert (=> b!300847 (= e!189942 e!189940)))

(declare-fun res!158646 () Bool)

(assert (=> b!300847 (=> (not res!158646) (not e!189940))))

(declare-datatypes ((SeekEntryResult!2300 0))(
  ( (MissingZero!2300 (index!11376 (_ BitVec 32))) (Found!2300 (index!11377 (_ BitVec 32))) (Intermediate!2300 (undefined!3112 Bool) (index!11378 (_ BitVec 32)) (x!29745 (_ BitVec 32))) (Undefined!2300) (MissingVacant!2300 (index!11379 (_ BitVec 32))) )
))
(declare-fun lt!149719 () SeekEntryResult!2300)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300847 (= res!158646 (or (= lt!149719 (MissingZero!2300 i!1256)) (= lt!149719 (MissingVacant!2300 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15186 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!300847 (= lt!149719 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300848 () Bool)

(assert (=> b!300848 (= e!189940 false)))

(declare-fun lt!149720 () (_ BitVec 32))

(declare-fun lt!149718 () SeekEntryResult!2300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15186 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!300848 (= lt!149718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149720 k0!2524 (array!15187 (store (arr!7186 a!3312) i!1256 k0!2524) (size!7538 a!3312)) mask!3809))))

(declare-fun lt!149721 () SeekEntryResult!2300)

(assert (=> b!300848 (= lt!149721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149720 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300848 (= lt!149720 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300849 () Bool)

(declare-fun res!158645 () Bool)

(assert (=> b!300849 (=> (not res!158645) (not e!189942))))

(assert (=> b!300849 (= res!158645 (and (= (size!7538 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7538 a!3312))))))

(declare-fun res!158648 () Bool)

(assert (=> start!29938 (=> (not res!158648) (not e!189942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29938 (= res!158648 (validMask!0 mask!3809))))

(assert (=> start!29938 e!189942))

(assert (=> start!29938 true))

(declare-fun array_inv!5136 (array!15186) Bool)

(assert (=> start!29938 (array_inv!5136 a!3312)))

(assert (= (and start!29938 res!158648) b!300849))

(assert (= (and b!300849 res!158645) b!300845))

(assert (= (and b!300845 res!158649) b!300844))

(assert (= (and b!300844 res!158647) b!300847))

(assert (= (and b!300847 res!158646) b!300846))

(assert (= (and b!300846 res!158644) b!300848))

(declare-fun m!312891 () Bool)

(assert (=> b!300845 m!312891))

(declare-fun m!312893 () Bool)

(assert (=> b!300847 m!312893))

(declare-fun m!312895 () Bool)

(assert (=> b!300844 m!312895))

(declare-fun m!312897 () Bool)

(assert (=> b!300846 m!312897))

(declare-fun m!312899 () Bool)

(assert (=> start!29938 m!312899))

(declare-fun m!312901 () Bool)

(assert (=> start!29938 m!312901))

(declare-fun m!312903 () Bool)

(assert (=> b!300848 m!312903))

(declare-fun m!312905 () Bool)

(assert (=> b!300848 m!312905))

(declare-fun m!312907 () Bool)

(assert (=> b!300848 m!312907))

(declare-fun m!312909 () Bool)

(assert (=> b!300848 m!312909))

(check-sat (not b!300847) (not b!300846) (not b!300848) (not b!300844) (not start!29938) (not b!300845))
(check-sat)
