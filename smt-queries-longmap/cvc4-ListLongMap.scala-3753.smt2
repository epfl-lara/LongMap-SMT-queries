; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51516 () Bool)

(assert start!51516)

(declare-fun b!563585 () Bool)

(declare-fun res!354745 () Bool)

(declare-fun e!324750 () Bool)

(assert (=> b!563585 (=> (not res!354745) (not e!324750))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35381 0))(
  ( (array!35382 (arr!16991 (Array (_ BitVec 32) (_ BitVec 64))) (size!17355 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35381)

(assert (=> b!563585 (= res!354745 (and (= (size!17355 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17355 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17355 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563586 () Bool)

(declare-fun res!354746 () Bool)

(assert (=> b!563586 (=> (not res!354746) (not e!324750))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563586 (= res!354746 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563587 () Bool)

(declare-fun e!324751 () Bool)

(assert (=> b!563587 (= e!324750 e!324751)))

(declare-fun res!354737 () Bool)

(assert (=> b!563587 (=> (not res!354737) (not e!324751))))

(declare-datatypes ((SeekEntryResult!5440 0))(
  ( (MissingZero!5440 (index!23987 (_ BitVec 32))) (Found!5440 (index!23988 (_ BitVec 32))) (Intermediate!5440 (undefined!6252 Bool) (index!23989 (_ BitVec 32)) (x!52871 (_ BitVec 32))) (Undefined!5440) (MissingVacant!5440 (index!23990 (_ BitVec 32))) )
))
(declare-fun lt!257262 () SeekEntryResult!5440)

(assert (=> b!563587 (= res!354737 (or (= lt!257262 (MissingZero!5440 i!1132)) (= lt!257262 (MissingVacant!5440 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35381 (_ BitVec 32)) SeekEntryResult!5440)

(assert (=> b!563587 (= lt!257262 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!354739 () Bool)

(assert (=> start!51516 (=> (not res!354739) (not e!324750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51516 (= res!354739 (validMask!0 mask!3119))))

(assert (=> start!51516 e!324750))

(assert (=> start!51516 true))

(declare-fun array_inv!12787 (array!35381) Bool)

(assert (=> start!51516 (array_inv!12787 a!3118)))

(declare-fun b!563588 () Bool)

(declare-fun res!354738 () Bool)

(assert (=> b!563588 (=> (not res!354738) (not e!324751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35381 (_ BitVec 32)) Bool)

(assert (=> b!563588 (= res!354738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563589 () Bool)

(declare-fun res!354744 () Bool)

(assert (=> b!563589 (=> (not res!354744) (not e!324751))))

(declare-datatypes ((List!11071 0))(
  ( (Nil!11068) (Cons!11067 (h!12070 (_ BitVec 64)) (t!17299 List!11071)) )
))
(declare-fun arrayNoDuplicates!0 (array!35381 (_ BitVec 32) List!11071) Bool)

(assert (=> b!563589 (= res!354744 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11068))))

(declare-fun b!563590 () Bool)

(assert (=> b!563590 (= e!324751 (not true))))

(declare-fun e!324752 () Bool)

(assert (=> b!563590 e!324752))

(declare-fun res!354742 () Bool)

(assert (=> b!563590 (=> (not res!354742) (not e!324752))))

(assert (=> b!563590 (= res!354742 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17654 0))(
  ( (Unit!17655) )
))
(declare-fun lt!257263 () Unit!17654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17654)

(assert (=> b!563590 (= lt!257263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563591 () Bool)

(declare-fun res!354740 () Bool)

(assert (=> b!563591 (=> (not res!354740) (not e!324750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563591 (= res!354740 (validKeyInArray!0 k!1914))))

(declare-fun b!563592 () Bool)

(declare-fun res!354741 () Bool)

(assert (=> b!563592 (=> (not res!354741) (not e!324751))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35381 (_ BitVec 32)) SeekEntryResult!5440)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563592 (= res!354741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16991 a!3118) j!142) mask!3119) (select (arr!16991 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16991 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16991 a!3118) i!1132 k!1914) j!142) (array!35382 (store (arr!16991 a!3118) i!1132 k!1914) (size!17355 a!3118)) mask!3119)))))

(declare-fun b!563593 () Bool)

(assert (=> b!563593 (= e!324752 (= (seekEntryOrOpen!0 (select (arr!16991 a!3118) j!142) a!3118 mask!3119) (Found!5440 j!142)))))

(declare-fun b!563594 () Bool)

(declare-fun res!354743 () Bool)

(assert (=> b!563594 (=> (not res!354743) (not e!324750))))

(assert (=> b!563594 (= res!354743 (validKeyInArray!0 (select (arr!16991 a!3118) j!142)))))

(assert (= (and start!51516 res!354739) b!563585))

(assert (= (and b!563585 res!354745) b!563594))

(assert (= (and b!563594 res!354743) b!563591))

(assert (= (and b!563591 res!354740) b!563586))

(assert (= (and b!563586 res!354746) b!563587))

(assert (= (and b!563587 res!354737) b!563588))

(assert (= (and b!563588 res!354738) b!563589))

(assert (= (and b!563589 res!354744) b!563592))

(assert (= (and b!563592 res!354741) b!563590))

(assert (= (and b!563590 res!354742) b!563593))

(declare-fun m!541959 () Bool)

(assert (=> b!563589 m!541959))

(declare-fun m!541961 () Bool)

(assert (=> b!563587 m!541961))

(declare-fun m!541963 () Bool)

(assert (=> b!563590 m!541963))

(declare-fun m!541965 () Bool)

(assert (=> b!563590 m!541965))

(declare-fun m!541967 () Bool)

(assert (=> b!563586 m!541967))

(declare-fun m!541969 () Bool)

(assert (=> b!563593 m!541969))

(assert (=> b!563593 m!541969))

(declare-fun m!541971 () Bool)

(assert (=> b!563593 m!541971))

(assert (=> b!563592 m!541969))

(declare-fun m!541973 () Bool)

(assert (=> b!563592 m!541973))

(assert (=> b!563592 m!541969))

(declare-fun m!541975 () Bool)

(assert (=> b!563592 m!541975))

(declare-fun m!541977 () Bool)

(assert (=> b!563592 m!541977))

(assert (=> b!563592 m!541975))

(declare-fun m!541979 () Bool)

(assert (=> b!563592 m!541979))

(assert (=> b!563592 m!541973))

(assert (=> b!563592 m!541969))

(declare-fun m!541981 () Bool)

(assert (=> b!563592 m!541981))

(declare-fun m!541983 () Bool)

(assert (=> b!563592 m!541983))

(assert (=> b!563592 m!541975))

(assert (=> b!563592 m!541977))

(assert (=> b!563594 m!541969))

(assert (=> b!563594 m!541969))

(declare-fun m!541985 () Bool)

(assert (=> b!563594 m!541985))

(declare-fun m!541987 () Bool)

(assert (=> start!51516 m!541987))

(declare-fun m!541989 () Bool)

(assert (=> start!51516 m!541989))

(declare-fun m!541991 () Bool)

(assert (=> b!563591 m!541991))

(declare-fun m!541993 () Bool)

(assert (=> b!563588 m!541993))

(push 1)

