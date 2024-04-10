; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51698 () Bool)

(assert start!51698)

(declare-fun b!565463 () Bool)

(declare-fun res!356441 () Bool)

(declare-fun e!325570 () Bool)

(assert (=> b!565463 (=> (not res!356441) (not e!325570))))

(declare-datatypes ((array!35506 0))(
  ( (array!35507 (arr!17052 (Array (_ BitVec 32) (_ BitVec 64))) (size!17416 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35506)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565463 (= res!356441 (validKeyInArray!0 (select (arr!17052 a!3118) j!142)))))

(declare-fun b!565464 () Bool)

(declare-fun res!356432 () Bool)

(assert (=> b!565464 (=> (not res!356432) (not e!325570))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565464 (= res!356432 (and (= (size!17416 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17416 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17416 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565465 () Bool)

(declare-fun e!325569 () Bool)

(declare-datatypes ((SeekEntryResult!5501 0))(
  ( (MissingZero!5501 (index!24231 (_ BitVec 32))) (Found!5501 (index!24232 (_ BitVec 32))) (Intermediate!5501 (undefined!6313 Bool) (index!24233 (_ BitVec 32)) (x!53106 (_ BitVec 32))) (Undefined!5501) (MissingVacant!5501 (index!24234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35506 (_ BitVec 32)) SeekEntryResult!5501)

(assert (=> b!565465 (= e!325569 (= (seekEntryOrOpen!0 (select (arr!17052 a!3118) j!142) a!3118 mask!3119) (Found!5501 j!142)))))

(declare-fun b!565466 () Bool)

(declare-fun res!356434 () Bool)

(declare-fun e!325571 () Bool)

(assert (=> b!565466 (=> (not res!356434) (not e!325571))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35506 (_ BitVec 32)) SeekEntryResult!5501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565466 (= res!356434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17052 a!3118) j!142) mask!3119) (select (arr!17052 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17052 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17052 a!3118) i!1132 k!1914) j!142) (array!35507 (store (arr!17052 a!3118) i!1132 k!1914) (size!17416 a!3118)) mask!3119)))))

(declare-fun b!565467 () Bool)

(declare-fun res!356433 () Bool)

(assert (=> b!565467 (=> (not res!356433) (not e!325571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35506 (_ BitVec 32)) Bool)

(assert (=> b!565467 (= res!356433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!356437 () Bool)

(assert (=> start!51698 (=> (not res!356437) (not e!325570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51698 (= res!356437 (validMask!0 mask!3119))))

(assert (=> start!51698 e!325570))

(assert (=> start!51698 true))

(declare-fun array_inv!12848 (array!35506) Bool)

(assert (=> start!51698 (array_inv!12848 a!3118)))

(declare-fun b!565468 () Bool)

(declare-fun res!356438 () Bool)

(assert (=> b!565468 (=> (not res!356438) (not e!325570))))

(declare-fun arrayContainsKey!0 (array!35506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565468 (= res!356438 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565469 () Bool)

(declare-fun res!356440 () Bool)

(assert (=> b!565469 (=> (not res!356440) (not e!325570))))

(assert (=> b!565469 (= res!356440 (validKeyInArray!0 k!1914))))

(declare-fun b!565470 () Bool)

(assert (=> b!565470 (= e!325571 (not true))))

(assert (=> b!565470 e!325569))

(declare-fun res!356435 () Bool)

(assert (=> b!565470 (=> (not res!356435) (not e!325569))))

(assert (=> b!565470 (= res!356435 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17704 0))(
  ( (Unit!17705) )
))
(declare-fun lt!257893 () Unit!17704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17704)

(assert (=> b!565470 (= lt!257893 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565471 () Bool)

(assert (=> b!565471 (= e!325570 e!325571)))

(declare-fun res!356439 () Bool)

(assert (=> b!565471 (=> (not res!356439) (not e!325571))))

(declare-fun lt!257892 () SeekEntryResult!5501)

(assert (=> b!565471 (= res!356439 (or (= lt!257892 (MissingZero!5501 i!1132)) (= lt!257892 (MissingVacant!5501 i!1132))))))

(assert (=> b!565471 (= lt!257892 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565472 () Bool)

(declare-fun res!356436 () Bool)

(assert (=> b!565472 (=> (not res!356436) (not e!325571))))

(declare-datatypes ((List!11132 0))(
  ( (Nil!11129) (Cons!11128 (h!12134 (_ BitVec 64)) (t!17360 List!11132)) )
))
(declare-fun arrayNoDuplicates!0 (array!35506 (_ BitVec 32) List!11132) Bool)

(assert (=> b!565472 (= res!356436 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11129))))

(assert (= (and start!51698 res!356437) b!565464))

(assert (= (and b!565464 res!356432) b!565463))

(assert (= (and b!565463 res!356441) b!565469))

(assert (= (and b!565469 res!356440) b!565468))

(assert (= (and b!565468 res!356438) b!565471))

(assert (= (and b!565471 res!356439) b!565467))

(assert (= (and b!565467 res!356433) b!565472))

(assert (= (and b!565472 res!356436) b!565466))

(assert (= (and b!565466 res!356434) b!565470))

(assert (= (and b!565470 res!356435) b!565465))

(declare-fun m!543927 () Bool)

(assert (=> b!565469 m!543927))

(declare-fun m!543929 () Bool)

(assert (=> b!565468 m!543929))

(declare-fun m!543931 () Bool)

(assert (=> b!565466 m!543931))

(declare-fun m!543933 () Bool)

(assert (=> b!565466 m!543933))

(assert (=> b!565466 m!543931))

(declare-fun m!543935 () Bool)

(assert (=> b!565466 m!543935))

(declare-fun m!543937 () Bool)

(assert (=> b!565466 m!543937))

(assert (=> b!565466 m!543935))

(declare-fun m!543939 () Bool)

(assert (=> b!565466 m!543939))

(assert (=> b!565466 m!543933))

(assert (=> b!565466 m!543931))

(declare-fun m!543941 () Bool)

(assert (=> b!565466 m!543941))

(declare-fun m!543943 () Bool)

(assert (=> b!565466 m!543943))

(assert (=> b!565466 m!543935))

(assert (=> b!565466 m!543937))

(assert (=> b!565463 m!543931))

(assert (=> b!565463 m!543931))

(declare-fun m!543945 () Bool)

(assert (=> b!565463 m!543945))

(declare-fun m!543947 () Bool)

(assert (=> b!565470 m!543947))

(declare-fun m!543949 () Bool)

(assert (=> b!565470 m!543949))

(declare-fun m!543951 () Bool)

(assert (=> b!565471 m!543951))

(assert (=> b!565465 m!543931))

(assert (=> b!565465 m!543931))

(declare-fun m!543953 () Bool)

(assert (=> b!565465 m!543953))

(declare-fun m!543955 () Bool)

(assert (=> start!51698 m!543955))

(declare-fun m!543957 () Bool)

(assert (=> start!51698 m!543957))

(declare-fun m!543959 () Bool)

(assert (=> b!565472 m!543959))

(declare-fun m!543961 () Bool)

(assert (=> b!565467 m!543961))

(push 1)

