; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51692 () Bool)

(assert start!51692)

(declare-fun b!565373 () Bool)

(declare-fun res!356349 () Bool)

(declare-fun e!325534 () Bool)

(assert (=> b!565373 (=> (not res!356349) (not e!325534))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565373 (= res!356349 (validKeyInArray!0 k!1914))))

(declare-fun b!565374 () Bool)

(declare-fun res!356347 () Bool)

(assert (=> b!565374 (=> (not res!356347) (not e!325534))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35500 0))(
  ( (array!35501 (arr!17049 (Array (_ BitVec 32) (_ BitVec 64))) (size!17413 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35500)

(assert (=> b!565374 (= res!356347 (and (= (size!17413 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17413 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17413 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565375 () Bool)

(declare-fun res!356351 () Bool)

(assert (=> b!565375 (=> (not res!356351) (not e!325534))))

(declare-fun arrayContainsKey!0 (array!35500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565375 (= res!356351 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun e!325536 () Bool)

(declare-fun b!565376 () Bool)

(declare-datatypes ((SeekEntryResult!5498 0))(
  ( (MissingZero!5498 (index!24219 (_ BitVec 32))) (Found!5498 (index!24220 (_ BitVec 32))) (Intermediate!5498 (undefined!6310 Bool) (index!24221 (_ BitVec 32)) (x!53095 (_ BitVec 32))) (Undefined!5498) (MissingVacant!5498 (index!24222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35500 (_ BitVec 32)) SeekEntryResult!5498)

(assert (=> b!565376 (= e!325536 (= (seekEntryOrOpen!0 (select (arr!17049 a!3118) j!142) a!3118 mask!3119) (Found!5498 j!142)))))

(declare-fun b!565377 () Bool)

(declare-fun e!325533 () Bool)

(assert (=> b!565377 (= e!325534 e!325533)))

(declare-fun res!356342 () Bool)

(assert (=> b!565377 (=> (not res!356342) (not e!325533))))

(declare-fun lt!257875 () SeekEntryResult!5498)

(assert (=> b!565377 (= res!356342 (or (= lt!257875 (MissingZero!5498 i!1132)) (= lt!257875 (MissingVacant!5498 i!1132))))))

(assert (=> b!565377 (= lt!257875 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565378 () Bool)

(declare-fun res!356343 () Bool)

(assert (=> b!565378 (=> (not res!356343) (not e!325534))))

(assert (=> b!565378 (= res!356343 (validKeyInArray!0 (select (arr!17049 a!3118) j!142)))))

(declare-fun b!565379 () Bool)

(declare-fun res!356346 () Bool)

(assert (=> b!565379 (=> (not res!356346) (not e!325533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35500 (_ BitVec 32)) Bool)

(assert (=> b!565379 (= res!356346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565380 () Bool)

(declare-fun res!356344 () Bool)

(assert (=> b!565380 (=> (not res!356344) (not e!325533))))

(declare-datatypes ((List!11129 0))(
  ( (Nil!11126) (Cons!11125 (h!12131 (_ BitVec 64)) (t!17357 List!11129)) )
))
(declare-fun arrayNoDuplicates!0 (array!35500 (_ BitVec 32) List!11129) Bool)

(assert (=> b!565380 (= res!356344 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11126))))

(declare-fun res!356345 () Bool)

(assert (=> start!51692 (=> (not res!356345) (not e!325534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51692 (= res!356345 (validMask!0 mask!3119))))

(assert (=> start!51692 e!325534))

(assert (=> start!51692 true))

(declare-fun array_inv!12845 (array!35500) Bool)

(assert (=> start!51692 (array_inv!12845 a!3118)))

(declare-fun b!565381 () Bool)

(assert (=> b!565381 (= e!325533 (not true))))

(assert (=> b!565381 e!325536))

(declare-fun res!356350 () Bool)

(assert (=> b!565381 (=> (not res!356350) (not e!325536))))

(assert (=> b!565381 (= res!356350 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17698 0))(
  ( (Unit!17699) )
))
(declare-fun lt!257874 () Unit!17698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17698)

(assert (=> b!565381 (= lt!257874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565382 () Bool)

(declare-fun res!356348 () Bool)

(assert (=> b!565382 (=> (not res!356348) (not e!325533))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35500 (_ BitVec 32)) SeekEntryResult!5498)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565382 (= res!356348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17049 a!3118) j!142) mask!3119) (select (arr!17049 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17049 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17049 a!3118) i!1132 k!1914) j!142) (array!35501 (store (arr!17049 a!3118) i!1132 k!1914) (size!17413 a!3118)) mask!3119)))))

(assert (= (and start!51692 res!356345) b!565374))

(assert (= (and b!565374 res!356347) b!565378))

(assert (= (and b!565378 res!356343) b!565373))

(assert (= (and b!565373 res!356349) b!565375))

(assert (= (and b!565375 res!356351) b!565377))

(assert (= (and b!565377 res!356342) b!565379))

(assert (= (and b!565379 res!356346) b!565380))

(assert (= (and b!565380 res!356344) b!565382))

(assert (= (and b!565382 res!356348) b!565381))

(assert (= (and b!565381 res!356350) b!565376))

(declare-fun m!543819 () Bool)

(assert (=> b!565381 m!543819))

(declare-fun m!543821 () Bool)

(assert (=> b!565381 m!543821))

(declare-fun m!543823 () Bool)

(assert (=> b!565379 m!543823))

(declare-fun m!543825 () Bool)

(assert (=> b!565375 m!543825))

(declare-fun m!543827 () Bool)

(assert (=> start!51692 m!543827))

(declare-fun m!543829 () Bool)

(assert (=> start!51692 m!543829))

(declare-fun m!543831 () Bool)

(assert (=> b!565377 m!543831))

(declare-fun m!543833 () Bool)

(assert (=> b!565376 m!543833))

(assert (=> b!565376 m!543833))

(declare-fun m!543835 () Bool)

(assert (=> b!565376 m!543835))

(assert (=> b!565378 m!543833))

(assert (=> b!565378 m!543833))

(declare-fun m!543837 () Bool)

(assert (=> b!565378 m!543837))

(declare-fun m!543839 () Bool)

(assert (=> b!565373 m!543839))

(assert (=> b!565382 m!543833))

(declare-fun m!543841 () Bool)

(assert (=> b!565382 m!543841))

(assert (=> b!565382 m!543833))

(declare-fun m!543843 () Bool)

(assert (=> b!565382 m!543843))

(declare-fun m!543845 () Bool)

(assert (=> b!565382 m!543845))

(assert (=> b!565382 m!543843))

(declare-fun m!543847 () Bool)

(assert (=> b!565382 m!543847))

(assert (=> b!565382 m!543841))

(assert (=> b!565382 m!543833))

(declare-fun m!543849 () Bool)

(assert (=> b!565382 m!543849))

(declare-fun m!543851 () Bool)

(assert (=> b!565382 m!543851))

(assert (=> b!565382 m!543843))

(assert (=> b!565382 m!543845))

(declare-fun m!543853 () Bool)

(assert (=> b!565380 m!543853))

(push 1)

