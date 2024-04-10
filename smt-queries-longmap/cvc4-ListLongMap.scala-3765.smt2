; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51588 () Bool)

(assert start!51588)

(declare-fun b!564514 () Bool)

(declare-fun e!325149 () Bool)

(declare-fun e!325148 () Bool)

(assert (=> b!564514 (= e!325149 e!325148)))

(declare-fun res!355669 () Bool)

(assert (=> b!564514 (=> (not res!355669) (not e!325148))))

(declare-datatypes ((SeekEntryResult!5476 0))(
  ( (MissingZero!5476 (index!24131 (_ BitVec 32))) (Found!5476 (index!24132 (_ BitVec 32))) (Intermediate!5476 (undefined!6288 Bool) (index!24133 (_ BitVec 32)) (x!53003 (_ BitVec 32))) (Undefined!5476) (MissingVacant!5476 (index!24134 (_ BitVec 32))) )
))
(declare-fun lt!257550 () SeekEntryResult!5476)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564514 (= res!355669 (or (= lt!257550 (MissingZero!5476 i!1132)) (= lt!257550 (MissingVacant!5476 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35453 0))(
  ( (array!35454 (arr!17027 (Array (_ BitVec 32) (_ BitVec 64))) (size!17391 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35453)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35453 (_ BitVec 32)) SeekEntryResult!5476)

(assert (=> b!564514 (= lt!257550 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564515 () Bool)

(assert (=> b!564515 (= e!325148 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257551 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564515 (= lt!257551 (toIndex!0 (select (store (arr!17027 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!564516 () Bool)

(declare-fun res!355666 () Bool)

(assert (=> b!564516 (=> (not res!355666) (not e!325149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564516 (= res!355666 (validKeyInArray!0 (select (arr!17027 a!3118) j!142)))))

(declare-fun b!564517 () Bool)

(declare-fun res!355673 () Bool)

(assert (=> b!564517 (=> (not res!355673) (not e!325149))))

(declare-fun arrayContainsKey!0 (array!35453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564517 (= res!355673 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355670 () Bool)

(assert (=> start!51588 (=> (not res!355670) (not e!325149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51588 (= res!355670 (validMask!0 mask!3119))))

(assert (=> start!51588 e!325149))

(assert (=> start!51588 true))

(declare-fun array_inv!12823 (array!35453) Bool)

(assert (=> start!51588 (array_inv!12823 a!3118)))

(declare-fun b!564518 () Bool)

(declare-fun res!355667 () Bool)

(assert (=> b!564518 (=> (not res!355667) (not e!325148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35453 (_ BitVec 32)) Bool)

(assert (=> b!564518 (= res!355667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564519 () Bool)

(declare-fun res!355668 () Bool)

(assert (=> b!564519 (=> (not res!355668) (not e!325148))))

(declare-datatypes ((List!11107 0))(
  ( (Nil!11104) (Cons!11103 (h!12106 (_ BitVec 64)) (t!17335 List!11107)) )
))
(declare-fun arrayNoDuplicates!0 (array!35453 (_ BitVec 32) List!11107) Bool)

(assert (=> b!564519 (= res!355668 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11104))))

(declare-fun b!564520 () Bool)

(declare-fun res!355671 () Bool)

(assert (=> b!564520 (=> (not res!355671) (not e!325149))))

(assert (=> b!564520 (= res!355671 (validKeyInArray!0 k!1914))))

(declare-fun b!564521 () Bool)

(declare-fun res!355672 () Bool)

(assert (=> b!564521 (=> (not res!355672) (not e!325149))))

(assert (=> b!564521 (= res!355672 (and (= (size!17391 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17391 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17391 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51588 res!355670) b!564521))

(assert (= (and b!564521 res!355672) b!564516))

(assert (= (and b!564516 res!355666) b!564520))

(assert (= (and b!564520 res!355671) b!564517))

(assert (= (and b!564517 res!355673) b!564514))

(assert (= (and b!564514 res!355669) b!564518))

(assert (= (and b!564518 res!355667) b!564519))

(assert (= (and b!564519 res!355668) b!564515))

(declare-fun m!542937 () Bool)

(assert (=> b!564520 m!542937))

(declare-fun m!542939 () Bool)

(assert (=> b!564515 m!542939))

(declare-fun m!542941 () Bool)

(assert (=> b!564515 m!542941))

(assert (=> b!564515 m!542941))

(declare-fun m!542943 () Bool)

(assert (=> b!564515 m!542943))

(declare-fun m!542945 () Bool)

(assert (=> b!564516 m!542945))

(assert (=> b!564516 m!542945))

(declare-fun m!542947 () Bool)

(assert (=> b!564516 m!542947))

(declare-fun m!542949 () Bool)

(assert (=> b!564519 m!542949))

(declare-fun m!542951 () Bool)

(assert (=> b!564518 m!542951))

(declare-fun m!542953 () Bool)

(assert (=> start!51588 m!542953))

(declare-fun m!542955 () Bool)

(assert (=> start!51588 m!542955))

(declare-fun m!542957 () Bool)

(assert (=> b!564517 m!542957))

(declare-fun m!542959 () Bool)

(assert (=> b!564514 m!542959))

(push 1)

(assert (not b!564518))

(assert (not start!51588))

