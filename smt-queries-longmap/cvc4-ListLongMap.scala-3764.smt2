; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51582 () Bool)

(assert start!51582)

(declare-fun b!564442 () Bool)

(declare-fun res!355595 () Bool)

(declare-fun e!325120 () Bool)

(assert (=> b!564442 (=> (not res!355595) (not e!325120))))

(declare-datatypes ((array!35447 0))(
  ( (array!35448 (arr!17024 (Array (_ BitVec 32) (_ BitVec 64))) (size!17388 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35447)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35447 (_ BitVec 32)) Bool)

(assert (=> b!564442 (= res!355595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564443 () Bool)

(declare-fun res!355597 () Bool)

(declare-fun e!325121 () Bool)

(assert (=> b!564443 (=> (not res!355597) (not e!325121))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564443 (= res!355597 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355596 () Bool)

(assert (=> start!51582 (=> (not res!355596) (not e!325121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51582 (= res!355596 (validMask!0 mask!3119))))

(assert (=> start!51582 e!325121))

(assert (=> start!51582 true))

(declare-fun array_inv!12820 (array!35447) Bool)

(assert (=> start!51582 (array_inv!12820 a!3118)))

(declare-fun b!564444 () Bool)

(declare-fun res!355600 () Bool)

(assert (=> b!564444 (=> (not res!355600) (not e!325120))))

(declare-datatypes ((List!11104 0))(
  ( (Nil!11101) (Cons!11100 (h!12103 (_ BitVec 64)) (t!17332 List!11104)) )
))
(declare-fun arrayNoDuplicates!0 (array!35447 (_ BitVec 32) List!11104) Bool)

(assert (=> b!564444 (= res!355600 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11101))))

(declare-fun b!564445 () Bool)

(declare-fun res!355599 () Bool)

(assert (=> b!564445 (=> (not res!355599) (not e!325121))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564445 (= res!355599 (and (= (size!17388 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17388 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17388 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564446 () Bool)

(declare-fun res!355601 () Bool)

(assert (=> b!564446 (=> (not res!355601) (not e!325121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564446 (= res!355601 (validKeyInArray!0 k!1914))))

(declare-fun b!564447 () Bool)

(declare-fun res!355598 () Bool)

(assert (=> b!564447 (=> (not res!355598) (not e!325121))))

(assert (=> b!564447 (= res!355598 (validKeyInArray!0 (select (arr!17024 a!3118) j!142)))))

(declare-fun b!564448 () Bool)

(assert (=> b!564448 (= e!325120 false)))

(declare-fun lt!257533 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564448 (= lt!257533 (toIndex!0 (select (store (arr!17024 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!564449 () Bool)

(assert (=> b!564449 (= e!325121 e!325120)))

(declare-fun res!355594 () Bool)

(assert (=> b!564449 (=> (not res!355594) (not e!325120))))

(declare-datatypes ((SeekEntryResult!5473 0))(
  ( (MissingZero!5473 (index!24119 (_ BitVec 32))) (Found!5473 (index!24120 (_ BitVec 32))) (Intermediate!5473 (undefined!6285 Bool) (index!24121 (_ BitVec 32)) (x!52992 (_ BitVec 32))) (Undefined!5473) (MissingVacant!5473 (index!24122 (_ BitVec 32))) )
))
(declare-fun lt!257532 () SeekEntryResult!5473)

(assert (=> b!564449 (= res!355594 (or (= lt!257532 (MissingZero!5473 i!1132)) (= lt!257532 (MissingVacant!5473 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35447 (_ BitVec 32)) SeekEntryResult!5473)

(assert (=> b!564449 (= lt!257532 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51582 res!355596) b!564445))

(assert (= (and b!564445 res!355599) b!564447))

(assert (= (and b!564447 res!355598) b!564446))

(assert (= (and b!564446 res!355601) b!564443))

(assert (= (and b!564443 res!355597) b!564449))

(assert (= (and b!564449 res!355594) b!564442))

(assert (= (and b!564442 res!355595) b!564444))

(assert (= (and b!564444 res!355600) b!564448))

(declare-fun m!542865 () Bool)

(assert (=> start!51582 m!542865))

(declare-fun m!542867 () Bool)

(assert (=> start!51582 m!542867))

(declare-fun m!542869 () Bool)

(assert (=> b!564449 m!542869))

(declare-fun m!542871 () Bool)

(assert (=> b!564448 m!542871))

(declare-fun m!542873 () Bool)

(assert (=> b!564448 m!542873))

(assert (=> b!564448 m!542873))

(declare-fun m!542875 () Bool)

(assert (=> b!564448 m!542875))

(declare-fun m!542877 () Bool)

(assert (=> b!564443 m!542877))

(declare-fun m!542879 () Bool)

(assert (=> b!564446 m!542879))

(declare-fun m!542881 () Bool)

(assert (=> b!564447 m!542881))

(assert (=> b!564447 m!542881))

(declare-fun m!542883 () Bool)

(assert (=> b!564447 m!542883))

(declare-fun m!542885 () Bool)

(assert (=> b!564442 m!542885))

(declare-fun m!542887 () Bool)

(assert (=> b!564444 m!542887))

(push 1)

(assert (not b!564448))

(assert (not b!564449))

(assert (not b!564442))

