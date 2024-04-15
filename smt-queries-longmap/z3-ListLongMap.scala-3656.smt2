; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50480 () Bool)

(assert start!50480)

(declare-fun b!551623 () Bool)

(declare-fun res!344362 () Bool)

(declare-fun e!318339 () Bool)

(assert (=> b!551623 (=> (not res!344362) (not e!318339))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34771 0))(
  ( (array!34772 (arr!16697 (Array (_ BitVec 32) (_ BitVec 64))) (size!17062 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34771)

(declare-datatypes ((SeekEntryResult!5143 0))(
  ( (MissingZero!5143 (index!22799 (_ BitVec 32))) (Found!5143 (index!22800 (_ BitVec 32))) (Intermediate!5143 (undefined!5955 Bool) (index!22801 (_ BitVec 32)) (x!51742 (_ BitVec 32))) (Undefined!5143) (MissingVacant!5143 (index!22802 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34771 (_ BitVec 32)) SeekEntryResult!5143)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551623 (= res!344362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) (select (arr!16697 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16697 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16697 a!3118) i!1132 k0!1914) j!142) (array!34772 (store (arr!16697 a!3118) i!1132 k0!1914) (size!17062 a!3118)) mask!3119)))))

(declare-fun res!344366 () Bool)

(declare-fun e!318337 () Bool)

(assert (=> start!50480 (=> (not res!344366) (not e!318337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50480 (= res!344366 (validMask!0 mask!3119))))

(assert (=> start!50480 e!318337))

(assert (=> start!50480 true))

(declare-fun array_inv!12580 (array!34771) Bool)

(assert (=> start!50480 (array_inv!12580 a!3118)))

(declare-fun b!551624 () Bool)

(declare-fun res!344360 () Bool)

(assert (=> b!551624 (=> (not res!344360) (not e!318339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34771 (_ BitVec 32)) Bool)

(assert (=> b!551624 (= res!344360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551625 () Bool)

(declare-fun res!344361 () Bool)

(assert (=> b!551625 (=> (not res!344361) (not e!318337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551625 (= res!344361 (validKeyInArray!0 k0!1914))))

(declare-fun b!551626 () Bool)

(declare-fun res!344367 () Bool)

(assert (=> b!551626 (=> (not res!344367) (not e!318339))))

(declare-datatypes ((List!10816 0))(
  ( (Nil!10813) (Cons!10812 (h!11794 (_ BitVec 64)) (t!17035 List!10816)) )
))
(declare-fun arrayNoDuplicates!0 (array!34771 (_ BitVec 32) List!10816) Bool)

(assert (=> b!551626 (= res!344367 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10813))))

(declare-fun b!551627 () Bool)

(assert (=> b!551627 (= e!318337 e!318339)))

(declare-fun res!344363 () Bool)

(assert (=> b!551627 (=> (not res!344363) (not e!318339))))

(declare-fun lt!250758 () SeekEntryResult!5143)

(assert (=> b!551627 (= res!344363 (or (= lt!250758 (MissingZero!5143 i!1132)) (= lt!250758 (MissingVacant!5143 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34771 (_ BitVec 32)) SeekEntryResult!5143)

(assert (=> b!551627 (= lt!250758 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551628 () Bool)

(declare-fun res!344365 () Bool)

(assert (=> b!551628 (=> (not res!344365) (not e!318337))))

(declare-fun arrayContainsKey!0 (array!34771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551628 (= res!344365 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551629 () Bool)

(declare-fun res!344364 () Bool)

(assert (=> b!551629 (=> (not res!344364) (not e!318337))))

(assert (=> b!551629 (= res!344364 (and (= (size!17062 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17062 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17062 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551630 () Bool)

(declare-fun e!318338 () Bool)

(assert (=> b!551630 (= e!318338 (= (seekEntryOrOpen!0 (select (arr!16697 a!3118) j!142) a!3118 mask!3119) (Found!5143 j!142)))))

(declare-fun b!551631 () Bool)

(declare-fun res!344368 () Bool)

(assert (=> b!551631 (=> (not res!344368) (not e!318337))))

(assert (=> b!551631 (= res!344368 (validKeyInArray!0 (select (arr!16697 a!3118) j!142)))))

(declare-fun b!551632 () Bool)

(assert (=> b!551632 (= e!318339 (not true))))

(assert (=> b!551632 e!318338))

(declare-fun res!344369 () Bool)

(assert (=> b!551632 (=> (not res!344369) (not e!318338))))

(assert (=> b!551632 (= res!344369 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17046 0))(
  ( (Unit!17047) )
))
(declare-fun lt!250759 () Unit!17046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17046)

(assert (=> b!551632 (= lt!250759 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50480 res!344366) b!551629))

(assert (= (and b!551629 res!344364) b!551631))

(assert (= (and b!551631 res!344368) b!551625))

(assert (= (and b!551625 res!344361) b!551628))

(assert (= (and b!551628 res!344365) b!551627))

(assert (= (and b!551627 res!344363) b!551624))

(assert (= (and b!551624 res!344360) b!551626))

(assert (= (and b!551626 res!344367) b!551623))

(assert (= (and b!551623 res!344362) b!551632))

(assert (= (and b!551632 res!344369) b!551630))

(declare-fun m!528047 () Bool)

(assert (=> start!50480 m!528047))

(declare-fun m!528049 () Bool)

(assert (=> start!50480 m!528049))

(declare-fun m!528051 () Bool)

(assert (=> b!551628 m!528051))

(declare-fun m!528053 () Bool)

(assert (=> b!551626 m!528053))

(declare-fun m!528055 () Bool)

(assert (=> b!551632 m!528055))

(declare-fun m!528057 () Bool)

(assert (=> b!551632 m!528057))

(declare-fun m!528059 () Bool)

(assert (=> b!551630 m!528059))

(assert (=> b!551630 m!528059))

(declare-fun m!528061 () Bool)

(assert (=> b!551630 m!528061))

(declare-fun m!528063 () Bool)

(assert (=> b!551627 m!528063))

(declare-fun m!528065 () Bool)

(assert (=> b!551625 m!528065))

(assert (=> b!551631 m!528059))

(assert (=> b!551631 m!528059))

(declare-fun m!528067 () Bool)

(assert (=> b!551631 m!528067))

(assert (=> b!551623 m!528059))

(declare-fun m!528069 () Bool)

(assert (=> b!551623 m!528069))

(assert (=> b!551623 m!528059))

(declare-fun m!528071 () Bool)

(assert (=> b!551623 m!528071))

(declare-fun m!528073 () Bool)

(assert (=> b!551623 m!528073))

(assert (=> b!551623 m!528071))

(declare-fun m!528075 () Bool)

(assert (=> b!551623 m!528075))

(assert (=> b!551623 m!528069))

(assert (=> b!551623 m!528059))

(declare-fun m!528077 () Bool)

(assert (=> b!551623 m!528077))

(declare-fun m!528079 () Bool)

(assert (=> b!551623 m!528079))

(assert (=> b!551623 m!528071))

(assert (=> b!551623 m!528073))

(declare-fun m!528081 () Bool)

(assert (=> b!551624 m!528081))

(check-sat (not b!551626) (not b!551630) (not b!551632) (not start!50480) (not b!551624) (not b!551628) (not b!551623) (not b!551631) (not b!551625) (not b!551627))
(check-sat)
