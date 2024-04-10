; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47380 () Bool)

(assert start!47380)

(declare-fun res!318820 () Bool)

(declare-fun e!303975 () Bool)

(assert (=> start!47380 (=> (not res!318820) (not e!303975))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47380 (= res!318820 (validMask!0 mask!3524))))

(assert (=> start!47380 e!303975))

(assert (=> start!47380 true))

(declare-datatypes ((array!33206 0))(
  ( (array!33207 (arr!15959 (Array (_ BitVec 32) (_ BitVec 64))) (size!16323 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33206)

(declare-fun array_inv!11755 (array!33206) Bool)

(assert (=> start!47380 (array_inv!11755 a!3235)))

(declare-fun b!520948 () Bool)

(declare-fun e!303969 () Bool)

(assert (=> b!520948 (= e!303975 e!303969)))

(declare-fun res!318827 () Bool)

(assert (=> b!520948 (=> (not res!318827) (not e!303969))))

(declare-datatypes ((SeekEntryResult!4426 0))(
  ( (MissingZero!4426 (index!19907 (_ BitVec 32))) (Found!4426 (index!19908 (_ BitVec 32))) (Intermediate!4426 (undefined!5238 Bool) (index!19909 (_ BitVec 32)) (x!48892 (_ BitVec 32))) (Undefined!4426) (MissingVacant!4426 (index!19910 (_ BitVec 32))) )
))
(declare-fun lt!238649 () SeekEntryResult!4426)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520948 (= res!318827 (or (= lt!238649 (MissingZero!4426 i!1204)) (= lt!238649 (MissingVacant!4426 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33206 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!520948 (= lt!238649 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520949 () Bool)

(declare-fun e!303973 () Bool)

(assert (=> b!520949 (= e!303973 false)))

(declare-fun b!520950 () Bool)

(declare-fun res!318824 () Bool)

(assert (=> b!520950 (=> (not res!318824) (not e!303975))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520950 (= res!318824 (and (= (size!16323 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16323 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16323 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520951 () Bool)

(declare-fun e!303972 () Bool)

(assert (=> b!520951 (= e!303969 (not e!303972))))

(declare-fun res!318823 () Bool)

(assert (=> b!520951 (=> res!318823 e!303972)))

(declare-fun lt!238650 () (_ BitVec 32))

(declare-fun lt!238645 () array!33206)

(declare-fun lt!238644 () SeekEntryResult!4426)

(declare-fun lt!238647 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33206 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!520951 (= res!318823 (= lt!238644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238650 lt!238647 lt!238645 mask!3524)))))

(declare-fun lt!238646 () (_ BitVec 32))

(assert (=> b!520951 (= lt!238644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238646 (select (arr!15959 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520951 (= lt!238650 (toIndex!0 lt!238647 mask!3524))))

(assert (=> b!520951 (= lt!238647 (select (store (arr!15959 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520951 (= lt!238646 (toIndex!0 (select (arr!15959 a!3235) j!176) mask!3524))))

(assert (=> b!520951 (= lt!238645 (array!33207 (store (arr!15959 a!3235) i!1204 k!2280) (size!16323 a!3235)))))

(declare-fun e!303974 () Bool)

(assert (=> b!520951 e!303974))

(declare-fun res!318822 () Bool)

(assert (=> b!520951 (=> (not res!318822) (not e!303974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33206 (_ BitVec 32)) Bool)

(assert (=> b!520951 (= res!318822 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16156 0))(
  ( (Unit!16157) )
))
(declare-fun lt!238643 () Unit!16156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16156)

(assert (=> b!520951 (= lt!238643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520952 () Bool)

(declare-fun res!318816 () Bool)

(assert (=> b!520952 (=> res!318816 e!303972)))

(assert (=> b!520952 (= res!318816 (or (undefined!5238 lt!238644) (not (is-Intermediate!4426 lt!238644))))))

(declare-fun b!520953 () Bool)

(assert (=> b!520953 (= e!303974 (= (seekEntryOrOpen!0 (select (arr!15959 a!3235) j!176) a!3235 mask!3524) (Found!4426 j!176)))))

(declare-fun b!520954 () Bool)

(declare-fun e!303971 () Unit!16156)

(declare-fun Unit!16158 () Unit!16156)

(assert (=> b!520954 (= e!303971 Unit!16158)))

(declare-fun b!520955 () Bool)

(declare-fun res!318821 () Bool)

(assert (=> b!520955 (=> (not res!318821) (not e!303975))))

(declare-fun arrayContainsKey!0 (array!33206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520955 (= res!318821 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520956 () Bool)

(declare-fun res!318818 () Bool)

(assert (=> b!520956 (=> (not res!318818) (not e!303975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520956 (= res!318818 (validKeyInArray!0 (select (arr!15959 a!3235) j!176)))))

(declare-fun b!520957 () Bool)

(declare-fun res!318817 () Bool)

(assert (=> b!520957 (=> (not res!318817) (not e!303969))))

(assert (=> b!520957 (= res!318817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520958 () Bool)

(declare-fun res!318826 () Bool)

(assert (=> b!520958 (=> (not res!318826) (not e!303975))))

(assert (=> b!520958 (= res!318826 (validKeyInArray!0 k!2280))))

(declare-fun b!520959 () Bool)

(declare-fun res!318825 () Bool)

(assert (=> b!520959 (=> (not res!318825) (not e!303969))))

(declare-datatypes ((List!10117 0))(
  ( (Nil!10114) (Cons!10113 (h!11035 (_ BitVec 64)) (t!16345 List!10117)) )
))
(declare-fun arrayNoDuplicates!0 (array!33206 (_ BitVec 32) List!10117) Bool)

(assert (=> b!520959 (= res!318825 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10114))))

(declare-fun b!520960 () Bool)

(assert (=> b!520960 (= e!303972 true)))

(assert (=> b!520960 (and (or (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238651 () Unit!16156)

(assert (=> b!520960 (= lt!238651 e!303971)))

(declare-fun c!61367 () Bool)

(assert (=> b!520960 (= c!61367 (= (select (arr!15959 a!3235) (index!19909 lt!238644)) (select (arr!15959 a!3235) j!176)))))

(assert (=> b!520960 (and (bvslt (x!48892 lt!238644) #b01111111111111111111111111111110) (or (= (select (arr!15959 a!3235) (index!19909 lt!238644)) (select (arr!15959 a!3235) j!176)) (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15959 a!3235) (index!19909 lt!238644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520961 () Bool)

(declare-fun Unit!16159 () Unit!16156)

(assert (=> b!520961 (= e!303971 Unit!16159)))

(declare-fun lt!238648 () Unit!16156)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16156)

(assert (=> b!520961 (= lt!238648 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238646 #b00000000000000000000000000000000 (index!19909 lt!238644) (x!48892 lt!238644) mask!3524))))

(declare-fun res!318819 () Bool)

(assert (=> b!520961 (= res!318819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238646 lt!238647 lt!238645 mask!3524) (Intermediate!4426 false (index!19909 lt!238644) (x!48892 lt!238644))))))

(assert (=> b!520961 (=> (not res!318819) (not e!303973))))

(assert (=> b!520961 e!303973))

(assert (= (and start!47380 res!318820) b!520950))

(assert (= (and b!520950 res!318824) b!520956))

(assert (= (and b!520956 res!318818) b!520958))

(assert (= (and b!520958 res!318826) b!520955))

(assert (= (and b!520955 res!318821) b!520948))

(assert (= (and b!520948 res!318827) b!520957))

(assert (= (and b!520957 res!318817) b!520959))

(assert (= (and b!520959 res!318825) b!520951))

(assert (= (and b!520951 res!318822) b!520953))

(assert (= (and b!520951 (not res!318823)) b!520952))

(assert (= (and b!520952 (not res!318816)) b!520960))

(assert (= (and b!520960 c!61367) b!520961))

(assert (= (and b!520960 (not c!61367)) b!520954))

(assert (= (and b!520961 res!318819) b!520949))

(declare-fun m!501861 () Bool)

(assert (=> b!520956 m!501861))

(assert (=> b!520956 m!501861))

(declare-fun m!501863 () Bool)

(assert (=> b!520956 m!501863))

(declare-fun m!501865 () Bool)

(assert (=> b!520961 m!501865))

(declare-fun m!501867 () Bool)

(assert (=> b!520961 m!501867))

(declare-fun m!501869 () Bool)

(assert (=> b!520957 m!501869))

(declare-fun m!501871 () Bool)

(assert (=> b!520960 m!501871))

(assert (=> b!520960 m!501861))

(declare-fun m!501873 () Bool)

(assert (=> b!520959 m!501873))

(declare-fun m!501875 () Bool)

(assert (=> b!520948 m!501875))

(declare-fun m!501877 () Bool)

(assert (=> b!520951 m!501877))

(declare-fun m!501879 () Bool)

(assert (=> b!520951 m!501879))

(declare-fun m!501881 () Bool)

(assert (=> b!520951 m!501881))

(declare-fun m!501883 () Bool)

(assert (=> b!520951 m!501883))

(assert (=> b!520951 m!501861))

(declare-fun m!501885 () Bool)

(assert (=> b!520951 m!501885))

(declare-fun m!501887 () Bool)

(assert (=> b!520951 m!501887))

(assert (=> b!520951 m!501861))

(declare-fun m!501889 () Bool)

(assert (=> b!520951 m!501889))

(assert (=> b!520951 m!501861))

(declare-fun m!501891 () Bool)

(assert (=> b!520951 m!501891))

(declare-fun m!501893 () Bool)

(assert (=> b!520955 m!501893))

(declare-fun m!501895 () Bool)

(assert (=> b!520958 m!501895))

(assert (=> b!520953 m!501861))

(assert (=> b!520953 m!501861))

(declare-fun m!501897 () Bool)

(assert (=> b!520953 m!501897))

(declare-fun m!501899 () Bool)

(assert (=> start!47380 m!501899))

(declare-fun m!501901 () Bool)

(assert (=> start!47380 m!501901))

(push 1)

