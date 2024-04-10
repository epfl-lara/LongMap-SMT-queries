; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52054 () Bool)

(assert start!52054)

(declare-fun b!568403 () Bool)

(declare-fun res!358609 () Bool)

(declare-fun e!327065 () Bool)

(assert (=> b!568403 (=> (not res!358609) (not e!327065))))

(declare-datatypes ((array!35634 0))(
  ( (array!35635 (arr!17110 (Array (_ BitVec 32) (_ BitVec 64))) (size!17474 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35634)

(declare-datatypes ((List!11190 0))(
  ( (Nil!11187) (Cons!11186 (h!12204 (_ BitVec 64)) (t!17418 List!11190)) )
))
(declare-fun arrayNoDuplicates!0 (array!35634 (_ BitVec 32) List!11190) Bool)

(assert (=> b!568403 (= res!358609 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11187))))

(declare-fun b!568404 () Bool)

(assert (=> b!568404 (= e!327065 (not true))))

(declare-fun e!327066 () Bool)

(assert (=> b!568404 e!327066))

(declare-fun res!358608 () Bool)

(assert (=> b!568404 (=> (not res!358608) (not e!327066))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35634 (_ BitVec 32)) Bool)

(assert (=> b!568404 (= res!358608 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17820 0))(
  ( (Unit!17821) )
))
(declare-fun lt!258937 () Unit!17820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17820)

(assert (=> b!568404 (= lt!258937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!358610 () Bool)

(declare-fun e!327064 () Bool)

(assert (=> start!52054 (=> (not res!358610) (not e!327064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52054 (= res!358610 (validMask!0 mask!3119))))

(assert (=> start!52054 e!327064))

(assert (=> start!52054 true))

(declare-fun array_inv!12906 (array!35634) Bool)

(assert (=> start!52054 (array_inv!12906 a!3118)))

(declare-fun b!568405 () Bool)

(declare-fun res!358607 () Bool)

(assert (=> b!568405 (=> (not res!358607) (not e!327064))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568405 (= res!358607 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568406 () Bool)

(declare-fun res!358612 () Bool)

(assert (=> b!568406 (=> (not res!358612) (not e!327065))))

(assert (=> b!568406 (= res!358612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568407 () Bool)

(declare-datatypes ((SeekEntryResult!5559 0))(
  ( (MissingZero!5559 (index!24463 (_ BitVec 32))) (Found!5559 (index!24464 (_ BitVec 32))) (Intermediate!5559 (undefined!6371 Bool) (index!24465 (_ BitVec 32)) (x!53340 (_ BitVec 32))) (Undefined!5559) (MissingVacant!5559 (index!24466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35634 (_ BitVec 32)) SeekEntryResult!5559)

(assert (=> b!568407 (= e!327066 (= (seekEntryOrOpen!0 (select (arr!17110 a!3118) j!142) a!3118 mask!3119) (Found!5559 j!142)))))

(declare-fun b!568408 () Bool)

(declare-fun res!358605 () Bool)

(assert (=> b!568408 (=> (not res!358605) (not e!327064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568408 (= res!358605 (validKeyInArray!0 (select (arr!17110 a!3118) j!142)))))

(declare-fun b!568409 () Bool)

(declare-fun res!358611 () Bool)

(assert (=> b!568409 (=> (not res!358611) (not e!327065))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35634 (_ BitVec 32)) SeekEntryResult!5559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568409 (= res!358611 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17110 a!3118) j!142) mask!3119) (select (arr!17110 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17110 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17110 a!3118) i!1132 k0!1914) j!142) (array!35635 (store (arr!17110 a!3118) i!1132 k0!1914) (size!17474 a!3118)) mask!3119)))))

(declare-fun b!568410 () Bool)

(assert (=> b!568410 (= e!327064 e!327065)))

(declare-fun res!358606 () Bool)

(assert (=> b!568410 (=> (not res!358606) (not e!327065))))

(declare-fun lt!258936 () SeekEntryResult!5559)

(assert (=> b!568410 (= res!358606 (or (= lt!258936 (MissingZero!5559 i!1132)) (= lt!258936 (MissingVacant!5559 i!1132))))))

(assert (=> b!568410 (= lt!258936 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568411 () Bool)

(declare-fun res!358604 () Bool)

(assert (=> b!568411 (=> (not res!358604) (not e!327064))))

(assert (=> b!568411 (= res!358604 (validKeyInArray!0 k0!1914))))

(declare-fun b!568412 () Bool)

(declare-fun res!358613 () Bool)

(assert (=> b!568412 (=> (not res!358613) (not e!327064))))

(assert (=> b!568412 (= res!358613 (and (= (size!17474 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17474 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17474 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52054 res!358610) b!568412))

(assert (= (and b!568412 res!358613) b!568408))

(assert (= (and b!568408 res!358605) b!568411))

(assert (= (and b!568411 res!358604) b!568405))

(assert (= (and b!568405 res!358607) b!568410))

(assert (= (and b!568410 res!358606) b!568406))

(assert (= (and b!568406 res!358612) b!568403))

(assert (= (and b!568403 res!358609) b!568409))

(assert (= (and b!568409 res!358611) b!568404))

(assert (= (and b!568404 res!358608) b!568407))

(declare-fun m!546927 () Bool)

(assert (=> start!52054 m!546927))

(declare-fun m!546929 () Bool)

(assert (=> start!52054 m!546929))

(declare-fun m!546931 () Bool)

(assert (=> b!568405 m!546931))

(declare-fun m!546933 () Bool)

(assert (=> b!568406 m!546933))

(declare-fun m!546935 () Bool)

(assert (=> b!568407 m!546935))

(assert (=> b!568407 m!546935))

(declare-fun m!546937 () Bool)

(assert (=> b!568407 m!546937))

(declare-fun m!546939 () Bool)

(assert (=> b!568411 m!546939))

(assert (=> b!568408 m!546935))

(assert (=> b!568408 m!546935))

(declare-fun m!546941 () Bool)

(assert (=> b!568408 m!546941))

(declare-fun m!546943 () Bool)

(assert (=> b!568410 m!546943))

(assert (=> b!568409 m!546935))

(declare-fun m!546945 () Bool)

(assert (=> b!568409 m!546945))

(assert (=> b!568409 m!546935))

(declare-fun m!546947 () Bool)

(assert (=> b!568409 m!546947))

(declare-fun m!546949 () Bool)

(assert (=> b!568409 m!546949))

(assert (=> b!568409 m!546947))

(declare-fun m!546951 () Bool)

(assert (=> b!568409 m!546951))

(assert (=> b!568409 m!546945))

(assert (=> b!568409 m!546935))

(declare-fun m!546953 () Bool)

(assert (=> b!568409 m!546953))

(declare-fun m!546955 () Bool)

(assert (=> b!568409 m!546955))

(assert (=> b!568409 m!546947))

(assert (=> b!568409 m!546949))

(declare-fun m!546957 () Bool)

(assert (=> b!568404 m!546957))

(declare-fun m!546959 () Bool)

(assert (=> b!568404 m!546959))

(declare-fun m!546961 () Bool)

(assert (=> b!568403 m!546961))

(check-sat (not b!568411) (not b!568409) (not b!568403) (not start!52054) (not b!568407) (not b!568405) (not b!568404) (not b!568408) (not b!568406) (not b!568410))
(check-sat)
