; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29156 () Bool)

(assert start!29156)

(declare-fun b!295822 () Bool)

(declare-fun res!155635 () Bool)

(declare-fun e!186972 () Bool)

(assert (=> b!295822 (=> (not res!155635) (not e!186972))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14959 0))(
  ( (array!14960 (arr!7090 (Array (_ BitVec 32) (_ BitVec 64))) (size!7442 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14959)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295822 (= res!155635 (and (= (size!7442 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7442 a!3312))))))

(declare-fun b!295823 () Bool)

(declare-fun res!155636 () Bool)

(assert (=> b!295823 (=> (not res!155636) (not e!186972))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295823 (= res!155636 (validKeyInArray!0 k!2524))))

(declare-fun b!295825 () Bool)

(declare-fun res!155632 () Bool)

(assert (=> b!295825 (=> (not res!155632) (not e!186972))))

(declare-fun arrayContainsKey!0 (array!14959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295825 (= res!155632 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295826 () Bool)

(declare-fun res!155631 () Bool)

(declare-fun e!186973 () Bool)

(assert (=> b!295826 (=> (not res!155631) (not e!186973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14959 (_ BitVec 32)) Bool)

(assert (=> b!295826 (= res!155631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295827 () Bool)

(declare-fun e!186975 () Bool)

(assert (=> b!295827 (= e!186975 (not true))))

(declare-datatypes ((SeekEntryResult!2239 0))(
  ( (MissingZero!2239 (index!11126 (_ BitVec 32))) (Found!2239 (index!11127 (_ BitVec 32))) (Intermediate!2239 (undefined!3051 Bool) (index!11128 (_ BitVec 32)) (x!29339 (_ BitVec 32))) (Undefined!2239) (MissingVacant!2239 (index!11129 (_ BitVec 32))) )
))
(declare-fun lt!146756 () SeekEntryResult!2239)

(assert (=> b!295827 (and (= (select (arr!7090 a!3312) (index!11128 lt!146756)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11128 lt!146756) i!1256))))

(declare-fun res!155633 () Bool)

(assert (=> start!29156 (=> (not res!155633) (not e!186972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29156 (= res!155633 (validMask!0 mask!3809))))

(assert (=> start!29156 e!186972))

(assert (=> start!29156 true))

(declare-fun array_inv!5053 (array!14959) Bool)

(assert (=> start!29156 (array_inv!5053 a!3312)))

(declare-fun b!295824 () Bool)

(assert (=> b!295824 (= e!186972 e!186973)))

(declare-fun res!155637 () Bool)

(assert (=> b!295824 (=> (not res!155637) (not e!186973))))

(declare-fun lt!146755 () Bool)

(declare-fun lt!146754 () SeekEntryResult!2239)

(assert (=> b!295824 (= res!155637 (or lt!146755 (= lt!146754 (MissingVacant!2239 i!1256))))))

(assert (=> b!295824 (= lt!146755 (= lt!146754 (MissingZero!2239 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14959 (_ BitVec 32)) SeekEntryResult!2239)

(assert (=> b!295824 (= lt!146754 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295828 () Bool)

(declare-fun e!186974 () Bool)

(assert (=> b!295828 (= e!186974 e!186975)))

(declare-fun res!155630 () Bool)

(assert (=> b!295828 (=> (not res!155630) (not e!186975))))

(declare-fun lt!146757 () Bool)

(assert (=> b!295828 (= res!155630 (and (or lt!146757 (not (undefined!3051 lt!146756))) (or lt!146757 (not (= (select (arr!7090 a!3312) (index!11128 lt!146756)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146757 (not (= (select (arr!7090 a!3312) (index!11128 lt!146756)) k!2524))) (not lt!146757)))))

(assert (=> b!295828 (= lt!146757 (not (is-Intermediate!2239 lt!146756)))))

(declare-fun b!295829 () Bool)

(assert (=> b!295829 (= e!186973 e!186974)))

(declare-fun res!155634 () Bool)

(assert (=> b!295829 (=> (not res!155634) (not e!186974))))

(assert (=> b!295829 (= res!155634 lt!146755)))

(declare-fun lt!146753 () (_ BitVec 32))

(declare-fun lt!146752 () SeekEntryResult!2239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14959 (_ BitVec 32)) SeekEntryResult!2239)

(assert (=> b!295829 (= lt!146752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146753 k!2524 (array!14960 (store (arr!7090 a!3312) i!1256 k!2524) (size!7442 a!3312)) mask!3809))))

(assert (=> b!295829 (= lt!146756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146753 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295829 (= lt!146753 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29156 res!155633) b!295822))

(assert (= (and b!295822 res!155635) b!295823))

(assert (= (and b!295823 res!155636) b!295825))

(assert (= (and b!295825 res!155632) b!295824))

(assert (= (and b!295824 res!155637) b!295826))

(assert (= (and b!295826 res!155631) b!295829))

(assert (= (and b!295829 res!155634) b!295828))

(assert (= (and b!295828 res!155630) b!295827))

(declare-fun m!308897 () Bool)

(assert (=> b!295824 m!308897))

(declare-fun m!308899 () Bool)

(assert (=> start!29156 m!308899))

(declare-fun m!308901 () Bool)

(assert (=> start!29156 m!308901))

(declare-fun m!308903 () Bool)

(assert (=> b!295825 m!308903))

(declare-fun m!308905 () Bool)

(assert (=> b!295827 m!308905))

(assert (=> b!295828 m!308905))

(declare-fun m!308907 () Bool)

(assert (=> b!295826 m!308907))

(declare-fun m!308909 () Bool)

(assert (=> b!295823 m!308909))

(declare-fun m!308911 () Bool)

(assert (=> b!295829 m!308911))

(declare-fun m!308913 () Bool)

(assert (=> b!295829 m!308913))

(declare-fun m!308915 () Bool)

(assert (=> b!295829 m!308915))

(declare-fun m!308917 () Bool)

(assert (=> b!295829 m!308917))

(push 1)

