; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50502 () Bool)

(assert start!50502)

(declare-fun b!552044 () Bool)

(declare-fun e!318573 () Bool)

(declare-fun e!318571 () Bool)

(assert (=> b!552044 (= e!318573 e!318571)))

(declare-fun res!344643 () Bool)

(assert (=> b!552044 (=> (not res!344643) (not e!318571))))

(declare-datatypes ((SeekEntryResult!5152 0))(
  ( (MissingZero!5152 (index!22835 (_ BitVec 32))) (Found!5152 (index!22836 (_ BitVec 32))) (Intermediate!5152 (undefined!5964 Bool) (index!22837 (_ BitVec 32)) (x!51764 (_ BitVec 32))) (Undefined!5152) (MissingVacant!5152 (index!22838 (_ BitVec 32))) )
))
(declare-fun lt!251022 () SeekEntryResult!5152)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552044 (= res!344643 (or (= lt!251022 (MissingZero!5152 i!1132)) (= lt!251022 (MissingVacant!5152 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34784 0))(
  ( (array!34785 (arr!16703 (Array (_ BitVec 32) (_ BitVec 64))) (size!17067 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34784)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34784 (_ BitVec 32)) SeekEntryResult!5152)

(assert (=> b!552044 (= lt!251022 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!344640 () Bool)

(assert (=> start!50502 (=> (not res!344640) (not e!318573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50502 (= res!344640 (validMask!0 mask!3119))))

(assert (=> start!50502 e!318573))

(assert (=> start!50502 true))

(declare-fun array_inv!12499 (array!34784) Bool)

(assert (=> start!50502 (array_inv!12499 a!3118)))

(declare-fun b!552045 () Bool)

(assert (=> b!552045 (= e!318571 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318572 () Bool)

(assert (=> b!552045 e!318572))

(declare-fun res!344648 () Bool)

(assert (=> b!552045 (=> (not res!344648) (not e!318572))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34784 (_ BitVec 32)) Bool)

(assert (=> b!552045 (= res!344648 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17078 0))(
  ( (Unit!17079) )
))
(declare-fun lt!251023 () Unit!17078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17078)

(assert (=> b!552045 (= lt!251023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552046 () Bool)

(declare-fun res!344639 () Bool)

(assert (=> b!552046 (=> (not res!344639) (not e!318573))))

(declare-fun arrayContainsKey!0 (array!34784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552046 (= res!344639 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552047 () Bool)

(assert (=> b!552047 (= e!318572 (= (seekEntryOrOpen!0 (select (arr!16703 a!3118) j!142) a!3118 mask!3119) (Found!5152 j!142)))))

(declare-fun b!552048 () Bool)

(declare-fun res!344641 () Bool)

(assert (=> b!552048 (=> (not res!344641) (not e!318573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552048 (= res!344641 (validKeyInArray!0 (select (arr!16703 a!3118) j!142)))))

(declare-fun b!552049 () Bool)

(declare-fun res!344642 () Bool)

(assert (=> b!552049 (=> (not res!344642) (not e!318571))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34784 (_ BitVec 32)) SeekEntryResult!5152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552049 (= res!344642 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16703 a!3118) j!142) mask!3119) (select (arr!16703 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16703 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16703 a!3118) i!1132 k!1914) j!142) (array!34785 (store (arr!16703 a!3118) i!1132 k!1914) (size!17067 a!3118)) mask!3119)))))

(declare-fun b!552050 () Bool)

(declare-fun res!344645 () Bool)

(assert (=> b!552050 (=> (not res!344645) (not e!318571))))

(declare-datatypes ((List!10783 0))(
  ( (Nil!10780) (Cons!10779 (h!11761 (_ BitVec 64)) (t!17011 List!10783)) )
))
(declare-fun arrayNoDuplicates!0 (array!34784 (_ BitVec 32) List!10783) Bool)

(assert (=> b!552050 (= res!344645 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10780))))

(declare-fun b!552051 () Bool)

(declare-fun res!344647 () Bool)

(assert (=> b!552051 (=> (not res!344647) (not e!318573))))

(assert (=> b!552051 (= res!344647 (validKeyInArray!0 k!1914))))

(declare-fun b!552052 () Bool)

(declare-fun res!344644 () Bool)

(assert (=> b!552052 (=> (not res!344644) (not e!318573))))

(assert (=> b!552052 (= res!344644 (and (= (size!17067 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17067 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17067 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552053 () Bool)

(declare-fun res!344646 () Bool)

(assert (=> b!552053 (=> (not res!344646) (not e!318571))))

(assert (=> b!552053 (= res!344646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50502 res!344640) b!552052))

(assert (= (and b!552052 res!344644) b!552048))

(assert (= (and b!552048 res!344641) b!552051))

(assert (= (and b!552051 res!344647) b!552046))

(assert (= (and b!552046 res!344639) b!552044))

(assert (= (and b!552044 res!344643) b!552053))

(assert (= (and b!552053 res!344646) b!552050))

(assert (= (and b!552050 res!344645) b!552049))

(assert (= (and b!552049 res!344642) b!552045))

(assert (= (and b!552045 res!344648) b!552047))

(declare-fun m!528999 () Bool)

(assert (=> b!552045 m!528999))

(declare-fun m!529001 () Bool)

(assert (=> b!552045 m!529001))

(declare-fun m!529003 () Bool)

(assert (=> b!552047 m!529003))

(assert (=> b!552047 m!529003))

(declare-fun m!529005 () Bool)

(assert (=> b!552047 m!529005))

(declare-fun m!529007 () Bool)

(assert (=> start!50502 m!529007))

(declare-fun m!529009 () Bool)

(assert (=> start!50502 m!529009))

(declare-fun m!529011 () Bool)

(assert (=> b!552053 m!529011))

(declare-fun m!529013 () Bool)

(assert (=> b!552051 m!529013))

(declare-fun m!529015 () Bool)

(assert (=> b!552044 m!529015))

(assert (=> b!552048 m!529003))

(assert (=> b!552048 m!529003))

(declare-fun m!529017 () Bool)

(assert (=> b!552048 m!529017))

(assert (=> b!552049 m!529003))

(declare-fun m!529019 () Bool)

(assert (=> b!552049 m!529019))

(assert (=> b!552049 m!529003))

(declare-fun m!529021 () Bool)

(assert (=> b!552049 m!529021))

(declare-fun m!529023 () Bool)

(assert (=> b!552049 m!529023))

(assert (=> b!552049 m!529021))

(declare-fun m!529025 () Bool)

(assert (=> b!552049 m!529025))

(assert (=> b!552049 m!529019))

(assert (=> b!552049 m!529003))

(declare-fun m!529027 () Bool)

(assert (=> b!552049 m!529027))

(declare-fun m!529029 () Bool)

(assert (=> b!552049 m!529029))

(assert (=> b!552049 m!529021))

(assert (=> b!552049 m!529023))

(declare-fun m!529031 () Bool)

(assert (=> b!552050 m!529031))

(declare-fun m!529033 () Bool)

(assert (=> b!552046 m!529033))

(push 1)

