; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51756 () Bool)

(assert start!51756)

(declare-fun b!566333 () Bool)

(declare-fun res!357307 () Bool)

(declare-fun e!325919 () Bool)

(assert (=> b!566333 (=> (not res!357307) (not e!325919))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35564 0))(
  ( (array!35565 (arr!17081 (Array (_ BitVec 32) (_ BitVec 64))) (size!17445 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35564)

(assert (=> b!566333 (= res!357307 (and (= (size!17445 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17445 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17445 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566334 () Bool)

(declare-fun res!357306 () Bool)

(declare-fun e!325920 () Bool)

(assert (=> b!566334 (=> (not res!357306) (not e!325920))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5530 0))(
  ( (MissingZero!5530 (index!24347 (_ BitVec 32))) (Found!5530 (index!24348 (_ BitVec 32))) (Intermediate!5530 (undefined!6342 Bool) (index!24349 (_ BitVec 32)) (x!53207 (_ BitVec 32))) (Undefined!5530) (MissingVacant!5530 (index!24350 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35564 (_ BitVec 32)) SeekEntryResult!5530)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566334 (= res!357306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17081 a!3118) j!142) mask!3119) (select (arr!17081 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17081 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17081 a!3118) i!1132 k!1914) j!142) (array!35565 (store (arr!17081 a!3118) i!1132 k!1914) (size!17445 a!3118)) mask!3119)))))

(declare-fun b!566335 () Bool)

(assert (=> b!566335 (= e!325920 (not true))))

(declare-fun e!325918 () Bool)

(assert (=> b!566335 e!325918))

(declare-fun res!357309 () Bool)

(assert (=> b!566335 (=> (not res!357309) (not e!325918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35564 (_ BitVec 32)) Bool)

(assert (=> b!566335 (= res!357309 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17762 0))(
  ( (Unit!17763) )
))
(declare-fun lt!258066 () Unit!17762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17762)

(assert (=> b!566335 (= lt!258066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566336 () Bool)

(declare-fun res!357303 () Bool)

(assert (=> b!566336 (=> (not res!357303) (not e!325919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566336 (= res!357303 (validKeyInArray!0 k!1914))))

(declare-fun b!566337 () Bool)

(declare-fun res!357302 () Bool)

(assert (=> b!566337 (=> (not res!357302) (not e!325919))))

(assert (=> b!566337 (= res!357302 (validKeyInArray!0 (select (arr!17081 a!3118) j!142)))))

(declare-fun b!566338 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35564 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!566338 (= e!325918 (= (seekEntryOrOpen!0 (select (arr!17081 a!3118) j!142) a!3118 mask!3119) (Found!5530 j!142)))))

(declare-fun b!566339 () Bool)

(declare-fun res!357305 () Bool)

(assert (=> b!566339 (=> (not res!357305) (not e!325920))))

(declare-datatypes ((List!11161 0))(
  ( (Nil!11158) (Cons!11157 (h!12163 (_ BitVec 64)) (t!17389 List!11161)) )
))
(declare-fun arrayNoDuplicates!0 (array!35564 (_ BitVec 32) List!11161) Bool)

(assert (=> b!566339 (= res!357305 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11158))))

(declare-fun b!566340 () Bool)

(declare-fun res!357311 () Bool)

(assert (=> b!566340 (=> (not res!357311) (not e!325919))))

(declare-fun arrayContainsKey!0 (array!35564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566340 (= res!357311 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357308 () Bool)

(assert (=> start!51756 (=> (not res!357308) (not e!325919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51756 (= res!357308 (validMask!0 mask!3119))))

(assert (=> start!51756 e!325919))

(assert (=> start!51756 true))

(declare-fun array_inv!12877 (array!35564) Bool)

(assert (=> start!51756 (array_inv!12877 a!3118)))

(declare-fun b!566341 () Bool)

(assert (=> b!566341 (= e!325919 e!325920)))

(declare-fun res!357304 () Bool)

(assert (=> b!566341 (=> (not res!357304) (not e!325920))))

(declare-fun lt!258067 () SeekEntryResult!5530)

(assert (=> b!566341 (= res!357304 (or (= lt!258067 (MissingZero!5530 i!1132)) (= lt!258067 (MissingVacant!5530 i!1132))))))

(assert (=> b!566341 (= lt!258067 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566342 () Bool)

(declare-fun res!357310 () Bool)

(assert (=> b!566342 (=> (not res!357310) (not e!325920))))

(assert (=> b!566342 (= res!357310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51756 res!357308) b!566333))

(assert (= (and b!566333 res!357307) b!566337))

(assert (= (and b!566337 res!357302) b!566336))

(assert (= (and b!566336 res!357303) b!566340))

(assert (= (and b!566340 res!357311) b!566341))

(assert (= (and b!566341 res!357304) b!566342))

(assert (= (and b!566342 res!357310) b!566339))

(assert (= (and b!566339 res!357305) b!566334))

(assert (= (and b!566334 res!357306) b!566335))

(assert (= (and b!566335 res!357309) b!566338))

(declare-fun m!544971 () Bool)

(assert (=> b!566334 m!544971))

(declare-fun m!544973 () Bool)

(assert (=> b!566334 m!544973))

(assert (=> b!566334 m!544971))

(declare-fun m!544975 () Bool)

(assert (=> b!566334 m!544975))

(declare-fun m!544977 () Bool)

(assert (=> b!566334 m!544977))

(assert (=> b!566334 m!544975))

(declare-fun m!544979 () Bool)

(assert (=> b!566334 m!544979))

(assert (=> b!566334 m!544973))

(assert (=> b!566334 m!544971))

(declare-fun m!544981 () Bool)

(assert (=> b!566334 m!544981))

(declare-fun m!544983 () Bool)

(assert (=> b!566334 m!544983))

(assert (=> b!566334 m!544975))

(assert (=> b!566334 m!544977))

(declare-fun m!544985 () Bool)

(assert (=> b!566342 m!544985))

(declare-fun m!544987 () Bool)

(assert (=> b!566336 m!544987))

(declare-fun m!544989 () Bool)

(assert (=> b!566341 m!544989))

(declare-fun m!544991 () Bool)

(assert (=> start!51756 m!544991))

(declare-fun m!544993 () Bool)

(assert (=> start!51756 m!544993))

(assert (=> b!566337 m!544971))

(assert (=> b!566337 m!544971))

(declare-fun m!544995 () Bool)

(assert (=> b!566337 m!544995))

(declare-fun m!544997 () Bool)

(assert (=> b!566339 m!544997))

(assert (=> b!566338 m!544971))

(assert (=> b!566338 m!544971))

(declare-fun m!544999 () Bool)

(assert (=> b!566338 m!544999))

(declare-fun m!545001 () Bool)

(assert (=> b!566335 m!545001))

(declare-fun m!545003 () Bool)

(assert (=> b!566335 m!545003))

(declare-fun m!545005 () Bool)

(assert (=> b!566340 m!545005))

(push 1)

