; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51578 () Bool)

(assert start!51578)

(declare-fun b!564394 () Bool)

(declare-fun res!355553 () Bool)

(declare-fun e!325103 () Bool)

(assert (=> b!564394 (=> (not res!355553) (not e!325103))))

(declare-datatypes ((array!35443 0))(
  ( (array!35444 (arr!17022 (Array (_ BitVec 32) (_ BitVec 64))) (size!17386 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35443)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564394 (= res!355553 (validKeyInArray!0 (select (arr!17022 a!3118) j!142)))))

(declare-fun b!564395 () Bool)

(declare-fun res!355551 () Bool)

(declare-fun e!325104 () Bool)

(assert (=> b!564395 (=> (not res!355551) (not e!325104))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35443 (_ BitVec 32)) Bool)

(assert (=> b!564395 (= res!355551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564396 () Bool)

(declare-fun res!355549 () Bool)

(assert (=> b!564396 (=> (not res!355549) (not e!325103))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564396 (= res!355549 (and (= (size!17386 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17386 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17386 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564397 () Bool)

(declare-fun res!355546 () Bool)

(assert (=> b!564397 (=> (not res!355546) (not e!325104))))

(declare-datatypes ((List!11102 0))(
  ( (Nil!11099) (Cons!11098 (h!12101 (_ BitVec 64)) (t!17330 List!11102)) )
))
(declare-fun arrayNoDuplicates!0 (array!35443 (_ BitVec 32) List!11102) Bool)

(assert (=> b!564397 (= res!355546 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11099))))

(declare-fun b!564398 () Bool)

(declare-fun res!355547 () Bool)

(assert (=> b!564398 (=> (not res!355547) (not e!325103))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564398 (= res!355547 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564399 () Bool)

(assert (=> b!564399 (= e!325104 false)))

(declare-fun lt!257521 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564399 (= lt!257521 (toIndex!0 (select (store (arr!17022 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!564400 () Bool)

(assert (=> b!564400 (= e!325103 e!325104)))

(declare-fun res!355548 () Bool)

(assert (=> b!564400 (=> (not res!355548) (not e!325104))))

(declare-datatypes ((SeekEntryResult!5471 0))(
  ( (MissingZero!5471 (index!24111 (_ BitVec 32))) (Found!5471 (index!24112 (_ BitVec 32))) (Intermediate!5471 (undefined!6283 Bool) (index!24113 (_ BitVec 32)) (x!52990 (_ BitVec 32))) (Undefined!5471) (MissingVacant!5471 (index!24114 (_ BitVec 32))) )
))
(declare-fun lt!257520 () SeekEntryResult!5471)

(assert (=> b!564400 (= res!355548 (or (= lt!257520 (MissingZero!5471 i!1132)) (= lt!257520 (MissingVacant!5471 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35443 (_ BitVec 32)) SeekEntryResult!5471)

(assert (=> b!564400 (= lt!257520 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!355550 () Bool)

(assert (=> start!51578 (=> (not res!355550) (not e!325103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51578 (= res!355550 (validMask!0 mask!3119))))

(assert (=> start!51578 e!325103))

(assert (=> start!51578 true))

(declare-fun array_inv!12818 (array!35443) Bool)

(assert (=> start!51578 (array_inv!12818 a!3118)))

(declare-fun b!564401 () Bool)

(declare-fun res!355552 () Bool)

(assert (=> b!564401 (=> (not res!355552) (not e!325103))))

(assert (=> b!564401 (= res!355552 (validKeyInArray!0 k!1914))))

(assert (= (and start!51578 res!355550) b!564396))

(assert (= (and b!564396 res!355549) b!564394))

(assert (= (and b!564394 res!355553) b!564401))

(assert (= (and b!564401 res!355552) b!564398))

(assert (= (and b!564398 res!355547) b!564400))

(assert (= (and b!564400 res!355548) b!564395))

(assert (= (and b!564395 res!355551) b!564397))

(assert (= (and b!564397 res!355546) b!564399))

(declare-fun m!542817 () Bool)

(assert (=> b!564397 m!542817))

(declare-fun m!542819 () Bool)

(assert (=> b!564394 m!542819))

(assert (=> b!564394 m!542819))

(declare-fun m!542821 () Bool)

(assert (=> b!564394 m!542821))

(declare-fun m!542823 () Bool)

(assert (=> b!564399 m!542823))

(declare-fun m!542825 () Bool)

(assert (=> b!564399 m!542825))

(assert (=> b!564399 m!542825))

(declare-fun m!542827 () Bool)

(assert (=> b!564399 m!542827))

(declare-fun m!542829 () Bool)

(assert (=> b!564401 m!542829))

(declare-fun m!542831 () Bool)

(assert (=> start!51578 m!542831))

(declare-fun m!542833 () Bool)

(assert (=> start!51578 m!542833))

(declare-fun m!542835 () Bool)

(assert (=> b!564395 m!542835))

(declare-fun m!542837 () Bool)

(assert (=> b!564400 m!542837))

(declare-fun m!542839 () Bool)

(assert (=> b!564398 m!542839))

(push 1)

