; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51252 () Bool)

(assert start!51252)

(declare-fun b!559549 () Bool)

(declare-fun e!322357 () Bool)

(declare-fun e!322362 () Bool)

(assert (=> b!559549 (= e!322357 e!322362)))

(declare-fun res!350941 () Bool)

(assert (=> b!559549 (=> res!350941 e!322362)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5341 0))(
  ( (MissingZero!5341 (index!23591 (_ BitVec 32))) (Found!5341 (index!23592 (_ BitVec 32))) (Intermediate!5341 (undefined!6153 Bool) (index!23593 (_ BitVec 32)) (x!52499 (_ BitVec 32))) (Undefined!5341) (MissingVacant!5341 (index!23594 (_ BitVec 32))) )
))
(declare-fun lt!254306 () SeekEntryResult!5341)

(declare-datatypes ((array!35180 0))(
  ( (array!35181 (arr!16892 (Array (_ BitVec 32) (_ BitVec 64))) (size!17256 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35180)

(assert (=> b!559549 (= res!350941 (or (undefined!6153 lt!254306) (not (is-Intermediate!5341 lt!254306)) (= (select (arr!16892 a!3118) (index!23593 lt!254306)) (select (arr!16892 a!3118) j!142)) (= (select (arr!16892 a!3118) (index!23593 lt!254306)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559550 () Bool)

(declare-fun res!350940 () Bool)

(declare-fun e!322358 () Bool)

(assert (=> b!559550 (=> (not res!350940) (not e!322358))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559550 (= res!350940 (validKeyInArray!0 k!1914))))

(declare-fun b!559551 () Bool)

(declare-fun e!322359 () Bool)

(assert (=> b!559551 (= e!322358 e!322359)))

(declare-fun res!350944 () Bool)

(assert (=> b!559551 (=> (not res!350944) (not e!322359))))

(declare-fun lt!254307 () SeekEntryResult!5341)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559551 (= res!350944 (or (= lt!254307 (MissingZero!5341 i!1132)) (= lt!254307 (MissingVacant!5341 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35180 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559551 (= lt!254307 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!350939 () Bool)

(assert (=> start!51252 (=> (not res!350939) (not e!322358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51252 (= res!350939 (validMask!0 mask!3119))))

(assert (=> start!51252 e!322358))

(assert (=> start!51252 true))

(declare-fun array_inv!12688 (array!35180) Bool)

(assert (=> start!51252 (array_inv!12688 a!3118)))

(declare-fun b!559552 () Bool)

(declare-fun res!350946 () Bool)

(assert (=> b!559552 (=> (not res!350946) (not e!322359))))

(declare-datatypes ((List!10972 0))(
  ( (Nil!10969) (Cons!10968 (h!11968 (_ BitVec 64)) (t!17200 List!10972)) )
))
(declare-fun arrayNoDuplicates!0 (array!35180 (_ BitVec 32) List!10972) Bool)

(assert (=> b!559552 (= res!350946 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10969))))

(declare-fun b!559553 () Bool)

(declare-fun res!350943 () Bool)

(assert (=> b!559553 (=> (not res!350943) (not e!322359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35180 (_ BitVec 32)) Bool)

(assert (=> b!559553 (= res!350943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559554 () Bool)

(declare-fun res!350947 () Bool)

(assert (=> b!559554 (=> (not res!350947) (not e!322358))))

(assert (=> b!559554 (= res!350947 (validKeyInArray!0 (select (arr!16892 a!3118) j!142)))))

(declare-fun b!559555 () Bool)

(declare-fun lt!254304 () SeekEntryResult!5341)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35180 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559555 (= e!322362 (= lt!254304 (seekKeyOrZeroReturnVacant!0 (x!52499 lt!254306) (index!23593 lt!254306) (index!23593 lt!254306) (select (arr!16892 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559556 () Bool)

(declare-fun res!350938 () Bool)

(assert (=> b!559556 (=> (not res!350938) (not e!322358))))

(assert (=> b!559556 (= res!350938 (and (= (size!17256 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17256 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17256 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559557 () Bool)

(declare-fun e!322361 () Bool)

(assert (=> b!559557 (= e!322361 (not true))))

(assert (=> b!559557 e!322357))

(declare-fun res!350945 () Bool)

(assert (=> b!559557 (=> (not res!350945) (not e!322357))))

(assert (=> b!559557 (= res!350945 (= lt!254304 (Found!5341 j!142)))))

(assert (=> b!559557 (= lt!254304 (seekEntryOrOpen!0 (select (arr!16892 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559557 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17456 0))(
  ( (Unit!17457) )
))
(declare-fun lt!254308 () Unit!17456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17456)

(assert (=> b!559557 (= lt!254308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559558 () Bool)

(assert (=> b!559558 (= e!322359 e!322361)))

(declare-fun res!350948 () Bool)

(assert (=> b!559558 (=> (not res!350948) (not e!322361))))

(declare-fun lt!254305 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35180 (_ BitVec 32)) SeekEntryResult!5341)

(assert (=> b!559558 (= res!350948 (= lt!254306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254305 (select (store (arr!16892 a!3118) i!1132 k!1914) j!142) (array!35181 (store (arr!16892 a!3118) i!1132 k!1914) (size!17256 a!3118)) mask!3119)))))

(declare-fun lt!254303 () (_ BitVec 32))

(assert (=> b!559558 (= lt!254306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254303 (select (arr!16892 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559558 (= lt!254305 (toIndex!0 (select (store (arr!16892 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!559558 (= lt!254303 (toIndex!0 (select (arr!16892 a!3118) j!142) mask!3119))))

(declare-fun b!559559 () Bool)

(declare-fun res!350942 () Bool)

(assert (=> b!559559 (=> (not res!350942) (not e!322358))))

(declare-fun arrayContainsKey!0 (array!35180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559559 (= res!350942 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51252 res!350939) b!559556))

(assert (= (and b!559556 res!350938) b!559554))

(assert (= (and b!559554 res!350947) b!559550))

(assert (= (and b!559550 res!350940) b!559559))

(assert (= (and b!559559 res!350942) b!559551))

(assert (= (and b!559551 res!350944) b!559553))

(assert (= (and b!559553 res!350943) b!559552))

(assert (= (and b!559552 res!350946) b!559558))

(assert (= (and b!559558 res!350948) b!559557))

(assert (= (and b!559557 res!350945) b!559549))

(assert (= (and b!559549 (not res!350941)) b!559555))

(declare-fun m!537371 () Bool)

(assert (=> b!559554 m!537371))

(assert (=> b!559554 m!537371))

(declare-fun m!537373 () Bool)

(assert (=> b!559554 m!537373))

(declare-fun m!537375 () Bool)

(assert (=> b!559551 m!537375))

(declare-fun m!537377 () Bool)

(assert (=> b!559549 m!537377))

(assert (=> b!559549 m!537371))

(declare-fun m!537379 () Bool)

(assert (=> b!559550 m!537379))

(declare-fun m!537381 () Bool)

(assert (=> b!559552 m!537381))

(assert (=> b!559555 m!537371))

(assert (=> b!559555 m!537371))

(declare-fun m!537383 () Bool)

(assert (=> b!559555 m!537383))

(declare-fun m!537385 () Bool)

(assert (=> start!51252 m!537385))

(declare-fun m!537387 () Bool)

(assert (=> start!51252 m!537387))

(declare-fun m!537389 () Bool)

(assert (=> b!559553 m!537389))

(assert (=> b!559558 m!537371))

(declare-fun m!537391 () Bool)

(assert (=> b!559558 m!537391))

(declare-fun m!537393 () Bool)

(assert (=> b!559558 m!537393))

(declare-fun m!537395 () Bool)

(assert (=> b!559558 m!537395))

(assert (=> b!559558 m!537371))

(assert (=> b!559558 m!537393))

(assert (=> b!559558 m!537371))

(declare-fun m!537397 () Bool)

(assert (=> b!559558 m!537397))

(declare-fun m!537399 () Bool)

(assert (=> b!559558 m!537399))

(assert (=> b!559558 m!537393))

(declare-fun m!537401 () Bool)

(assert (=> b!559558 m!537401))

(assert (=> b!559557 m!537371))

(assert (=> b!559557 m!537371))

(declare-fun m!537403 () Bool)

(assert (=> b!559557 m!537403))

(declare-fun m!537405 () Bool)

(assert (=> b!559557 m!537405))

(declare-fun m!537407 () Bool)

(assert (=> b!559557 m!537407))

(declare-fun m!537409 () Bool)

(assert (=> b!559559 m!537409))

(push 1)

