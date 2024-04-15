; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50582 () Bool)

(assert start!50582)

(declare-fun res!345116 () Bool)

(declare-fun e!318807 () Bool)

(assert (=> start!50582 (=> (not res!345116) (not e!318807))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50582 (= res!345116 (validMask!0 mask!3119))))

(assert (=> start!50582 e!318807))

(assert (=> start!50582 true))

(declare-datatypes ((array!34816 0))(
  ( (array!34817 (arr!16718 (Array (_ BitVec 32) (_ BitVec 64))) (size!17083 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34816)

(declare-fun array_inv!12601 (array!34816) Bool)

(assert (=> start!50582 (array_inv!12601 a!3118)))

(declare-fun b!552553 () Bool)

(declare-fun res!345108 () Bool)

(declare-fun e!318806 () Bool)

(assert (=> b!552553 (=> (not res!345108) (not e!318806))))

(declare-datatypes ((List!10837 0))(
  ( (Nil!10834) (Cons!10833 (h!11818 (_ BitVec 64)) (t!17056 List!10837)) )
))
(declare-fun arrayNoDuplicates!0 (array!34816 (_ BitVec 32) List!10837) Bool)

(assert (=> b!552553 (= res!345108 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10834))))

(declare-fun b!552554 () Bool)

(assert (=> b!552554 (= e!318807 e!318806)))

(declare-fun res!345114 () Bool)

(assert (=> b!552554 (=> (not res!345114) (not e!318806))))

(declare-datatypes ((SeekEntryResult!5164 0))(
  ( (MissingZero!5164 (index!22883 (_ BitVec 32))) (Found!5164 (index!22884 (_ BitVec 32))) (Intermediate!5164 (undefined!5976 Bool) (index!22885 (_ BitVec 32)) (x!51825 (_ BitVec 32))) (Undefined!5164) (MissingVacant!5164 (index!22886 (_ BitVec 32))) )
))
(declare-fun lt!251058 () SeekEntryResult!5164)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552554 (= res!345114 (or (= lt!251058 (MissingZero!5164 i!1132)) (= lt!251058 (MissingVacant!5164 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34816 (_ BitVec 32)) SeekEntryResult!5164)

(assert (=> b!552554 (= lt!251058 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552555 () Bool)

(declare-fun res!345113 () Bool)

(assert (=> b!552555 (=> (not res!345113) (not e!318807))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552555 (= res!345113 (and (= (size!17083 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17083 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17083 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552556 () Bool)

(declare-fun res!345107 () Bool)

(assert (=> b!552556 (=> (not res!345107) (not e!318806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34816 (_ BitVec 32)) Bool)

(assert (=> b!552556 (= res!345107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun e!318804 () Bool)

(declare-fun b!552557 () Bool)

(assert (=> b!552557 (= e!318804 (= (seekEntryOrOpen!0 (select (arr!16718 a!3118) j!142) a!3118 mask!3119) (Found!5164 j!142)))))

(declare-fun b!552558 () Bool)

(declare-fun res!345111 () Bool)

(assert (=> b!552558 (=> (not res!345111) (not e!318807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552558 (= res!345111 (validKeyInArray!0 (select (arr!16718 a!3118) j!142)))))

(declare-fun b!552559 () Bool)

(declare-fun res!345110 () Bool)

(assert (=> b!552559 (=> (not res!345110) (not e!318807))))

(assert (=> b!552559 (= res!345110 (validKeyInArray!0 k0!1914))))

(declare-fun b!552560 () Bool)

(declare-fun e!318803 () Bool)

(declare-fun lt!251059 () SeekEntryResult!5164)

(get-info :version)

(assert (=> b!552560 (= e!318803 (not (or (not ((_ is Intermediate!5164) lt!251059)) (not (undefined!5976 lt!251059)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!552560 e!318804))

(declare-fun res!345109 () Bool)

(assert (=> b!552560 (=> (not res!345109) (not e!318804))))

(assert (=> b!552560 (= res!345109 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17088 0))(
  ( (Unit!17089) )
))
(declare-fun lt!251057 () Unit!17088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17088)

(assert (=> b!552560 (= lt!251057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552561 () Bool)

(declare-fun res!345112 () Bool)

(assert (=> b!552561 (=> (not res!345112) (not e!318807))))

(declare-fun arrayContainsKey!0 (array!34816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552561 (= res!345112 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552562 () Bool)

(assert (=> b!552562 (= e!318806 e!318803)))

(declare-fun res!345115 () Bool)

(assert (=> b!552562 (=> (not res!345115) (not e!318803))))

(declare-fun lt!251055 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34816 (_ BitVec 32)) SeekEntryResult!5164)

(assert (=> b!552562 (= res!345115 (= lt!251059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251055 (select (store (arr!16718 a!3118) i!1132 k0!1914) j!142) (array!34817 (store (arr!16718 a!3118) i!1132 k0!1914) (size!17083 a!3118)) mask!3119)))))

(declare-fun lt!251056 () (_ BitVec 32))

(assert (=> b!552562 (= lt!251059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251056 (select (arr!16718 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552562 (= lt!251055 (toIndex!0 (select (store (arr!16718 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552562 (= lt!251056 (toIndex!0 (select (arr!16718 a!3118) j!142) mask!3119))))

(assert (= (and start!50582 res!345116) b!552555))

(assert (= (and b!552555 res!345113) b!552558))

(assert (= (and b!552558 res!345111) b!552559))

(assert (= (and b!552559 res!345110) b!552561))

(assert (= (and b!552561 res!345112) b!552554))

(assert (= (and b!552554 res!345114) b!552556))

(assert (= (and b!552556 res!345107) b!552553))

(assert (= (and b!552553 res!345108) b!552562))

(assert (= (and b!552562 res!345115) b!552560))

(assert (= (and b!552560 res!345109) b!552557))

(declare-fun m!529013 () Bool)

(assert (=> b!552554 m!529013))

(declare-fun m!529015 () Bool)

(assert (=> b!552556 m!529015))

(declare-fun m!529017 () Bool)

(assert (=> b!552558 m!529017))

(assert (=> b!552558 m!529017))

(declare-fun m!529019 () Bool)

(assert (=> b!552558 m!529019))

(declare-fun m!529021 () Bool)

(assert (=> b!552559 m!529021))

(declare-fun m!529023 () Bool)

(assert (=> start!50582 m!529023))

(declare-fun m!529025 () Bool)

(assert (=> start!50582 m!529025))

(assert (=> b!552557 m!529017))

(assert (=> b!552557 m!529017))

(declare-fun m!529027 () Bool)

(assert (=> b!552557 m!529027))

(declare-fun m!529029 () Bool)

(assert (=> b!552561 m!529029))

(assert (=> b!552562 m!529017))

(declare-fun m!529031 () Bool)

(assert (=> b!552562 m!529031))

(assert (=> b!552562 m!529017))

(declare-fun m!529033 () Bool)

(assert (=> b!552562 m!529033))

(assert (=> b!552562 m!529017))

(declare-fun m!529035 () Bool)

(assert (=> b!552562 m!529035))

(declare-fun m!529037 () Bool)

(assert (=> b!552562 m!529037))

(assert (=> b!552562 m!529033))

(declare-fun m!529039 () Bool)

(assert (=> b!552562 m!529039))

(assert (=> b!552562 m!529033))

(declare-fun m!529041 () Bool)

(assert (=> b!552562 m!529041))

(declare-fun m!529043 () Bool)

(assert (=> b!552560 m!529043))

(declare-fun m!529045 () Bool)

(assert (=> b!552560 m!529045))

(declare-fun m!529047 () Bool)

(assert (=> b!552553 m!529047))

(check-sat (not b!552562) (not b!552560) (not b!552557) (not start!50582) (not b!552554) (not b!552556) (not b!552558) (not b!552561) (not b!552559) (not b!552553))
(check-sat)
