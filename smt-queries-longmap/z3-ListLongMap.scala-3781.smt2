; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51728 () Bool)

(assert start!51728)

(declare-fun b!565823 () Bool)

(declare-fun res!356940 () Bool)

(declare-fun e!325647 () Bool)

(assert (=> b!565823 (=> (not res!356940) (not e!325647))))

(declare-datatypes ((array!35545 0))(
  ( (array!35546 (arr!17072 (Array (_ BitVec 32) (_ BitVec 64))) (size!17437 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35545)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35545 (_ BitVec 32)) Bool)

(assert (=> b!565823 (= res!356940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565824 () Bool)

(declare-fun res!356939 () Bool)

(assert (=> b!565824 (=> (not res!356939) (not e!325647))))

(declare-datatypes ((List!11191 0))(
  ( (Nil!11188) (Cons!11187 (h!12193 (_ BitVec 64)) (t!17410 List!11191)) )
))
(declare-fun arrayNoDuplicates!0 (array!35545 (_ BitVec 32) List!11191) Bool)

(assert (=> b!565824 (= res!356939 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11188))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!565825 () Bool)

(declare-fun e!325648 () Bool)

(declare-datatypes ((SeekEntryResult!5518 0))(
  ( (MissingZero!5518 (index!24299 (_ BitVec 32))) (Found!5518 (index!24300 (_ BitVec 32))) (Intermediate!5518 (undefined!6330 Bool) (index!24301 (_ BitVec 32)) (x!53174 (_ BitVec 32))) (Undefined!5518) (MissingVacant!5518 (index!24302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35545 (_ BitVec 32)) SeekEntryResult!5518)

(assert (=> b!565825 (= e!325648 (= (seekEntryOrOpen!0 (select (arr!17072 a!3118) j!142) a!3118 mask!3119) (Found!5518 j!142)))))

(declare-fun b!565826 () Bool)

(declare-fun res!356938 () Bool)

(declare-fun e!325650 () Bool)

(assert (=> b!565826 (=> (not res!356938) (not e!325650))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565826 (= res!356938 (and (= (size!17437 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17437 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17437 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565827 () Bool)

(declare-fun res!356937 () Bool)

(assert (=> b!565827 (=> (not res!356937) (not e!325650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565827 (= res!356937 (validKeyInArray!0 (select (arr!17072 a!3118) j!142)))))

(declare-fun b!565828 () Bool)

(declare-fun res!356942 () Bool)

(assert (=> b!565828 (=> (not res!356942) (not e!325647))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35545 (_ BitVec 32)) SeekEntryResult!5518)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565828 (= res!356942 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17072 a!3118) j!142) mask!3119) (select (arr!17072 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17072 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17072 a!3118) i!1132 k0!1914) j!142) (array!35546 (store (arr!17072 a!3118) i!1132 k0!1914) (size!17437 a!3118)) mask!3119)))))

(declare-fun b!565829 () Bool)

(assert (=> b!565829 (= e!325650 e!325647)))

(declare-fun res!356935 () Bool)

(assert (=> b!565829 (=> (not res!356935) (not e!325647))))

(declare-fun lt!257784 () SeekEntryResult!5518)

(assert (=> b!565829 (= res!356935 (or (= lt!257784 (MissingZero!5518 i!1132)) (= lt!257784 (MissingVacant!5518 i!1132))))))

(assert (=> b!565829 (= lt!257784 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565830 () Bool)

(declare-fun res!356941 () Bool)

(assert (=> b!565830 (=> (not res!356941) (not e!325650))))

(assert (=> b!565830 (= res!356941 (validKeyInArray!0 k0!1914))))

(declare-fun b!565831 () Bool)

(assert (=> b!565831 (= e!325647 (not true))))

(assert (=> b!565831 e!325648))

(declare-fun res!356936 () Bool)

(assert (=> b!565831 (=> (not res!356936) (not e!325648))))

(assert (=> b!565831 (= res!356936 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17724 0))(
  ( (Unit!17725) )
))
(declare-fun lt!257785 () Unit!17724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17724)

(assert (=> b!565831 (= lt!257785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!356933 () Bool)

(assert (=> start!51728 (=> (not res!356933) (not e!325650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51728 (= res!356933 (validMask!0 mask!3119))))

(assert (=> start!51728 e!325650))

(assert (=> start!51728 true))

(declare-fun array_inv!12955 (array!35545) Bool)

(assert (=> start!51728 (array_inv!12955 a!3118)))

(declare-fun b!565822 () Bool)

(declare-fun res!356934 () Bool)

(assert (=> b!565822 (=> (not res!356934) (not e!325650))))

(declare-fun arrayContainsKey!0 (array!35545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565822 (= res!356934 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51728 res!356933) b!565826))

(assert (= (and b!565826 res!356938) b!565827))

(assert (= (and b!565827 res!356937) b!565830))

(assert (= (and b!565830 res!356941) b!565822))

(assert (= (and b!565822 res!356934) b!565829))

(assert (= (and b!565829 res!356935) b!565823))

(assert (= (and b!565823 res!356940) b!565824))

(assert (= (and b!565824 res!356939) b!565828))

(assert (= (and b!565828 res!356942) b!565831))

(assert (= (and b!565831 res!356936) b!565825))

(declare-fun m!543911 () Bool)

(assert (=> b!565822 m!543911))

(declare-fun m!543913 () Bool)

(assert (=> b!565824 m!543913))

(declare-fun m!543915 () Bool)

(assert (=> b!565830 m!543915))

(declare-fun m!543917 () Bool)

(assert (=> b!565823 m!543917))

(declare-fun m!543919 () Bool)

(assert (=> b!565829 m!543919))

(declare-fun m!543921 () Bool)

(assert (=> b!565828 m!543921))

(declare-fun m!543923 () Bool)

(assert (=> b!565828 m!543923))

(assert (=> b!565828 m!543921))

(declare-fun m!543925 () Bool)

(assert (=> b!565828 m!543925))

(declare-fun m!543927 () Bool)

(assert (=> b!565828 m!543927))

(assert (=> b!565828 m!543925))

(declare-fun m!543929 () Bool)

(assert (=> b!565828 m!543929))

(assert (=> b!565828 m!543923))

(assert (=> b!565828 m!543921))

(declare-fun m!543931 () Bool)

(assert (=> b!565828 m!543931))

(declare-fun m!543933 () Bool)

(assert (=> b!565828 m!543933))

(assert (=> b!565828 m!543925))

(assert (=> b!565828 m!543927))

(assert (=> b!565827 m!543921))

(assert (=> b!565827 m!543921))

(declare-fun m!543935 () Bool)

(assert (=> b!565827 m!543935))

(declare-fun m!543937 () Bool)

(assert (=> start!51728 m!543937))

(declare-fun m!543939 () Bool)

(assert (=> start!51728 m!543939))

(declare-fun m!543941 () Bool)

(assert (=> b!565831 m!543941))

(declare-fun m!543943 () Bool)

(assert (=> b!565831 m!543943))

(assert (=> b!565825 m!543921))

(assert (=> b!565825 m!543921))

(declare-fun m!543945 () Bool)

(assert (=> b!565825 m!543945))

(check-sat (not start!51728) (not b!565828) (not b!565830) (not b!565825) (not b!565823) (not b!565822) (not b!565831) (not b!565827) (not b!565824) (not b!565829))
(check-sat)
