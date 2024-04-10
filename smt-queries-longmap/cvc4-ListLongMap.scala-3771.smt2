; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51624 () Bool)

(assert start!51624)

(declare-fun b!564972 () Bool)

(declare-fun e!325310 () Bool)

(assert (=> b!564972 (= e!325310 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35489 0))(
  ( (array!35490 (arr!17045 (Array (_ BitVec 32) (_ BitVec 64))) (size!17409 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35489)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35489 (_ BitVec 32)) Bool)

(assert (=> b!564972 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17690 0))(
  ( (Unit!17691) )
))
(declare-fun lt!257721 () Unit!17690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17690)

(assert (=> b!564972 (= lt!257721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564973 () Bool)

(declare-fun e!325311 () Bool)

(assert (=> b!564973 (= e!325311 e!325310)))

(declare-fun res!356129 () Bool)

(assert (=> b!564973 (=> (not res!356129) (not e!325310))))

(declare-datatypes ((SeekEntryResult!5494 0))(
  ( (MissingZero!5494 (index!24203 (_ BitVec 32))) (Found!5494 (index!24204 (_ BitVec 32))) (Intermediate!5494 (undefined!6306 Bool) (index!24205 (_ BitVec 32)) (x!53069 (_ BitVec 32))) (Undefined!5494) (MissingVacant!5494 (index!24206 (_ BitVec 32))) )
))
(declare-fun lt!257722 () SeekEntryResult!5494)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564973 (= res!356129 (or (= lt!257722 (MissingZero!5494 i!1132)) (= lt!257722 (MissingVacant!5494 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35489 (_ BitVec 32)) SeekEntryResult!5494)

(assert (=> b!564973 (= lt!257722 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564974 () Bool)

(declare-fun res!356131 () Bool)

(assert (=> b!564974 (=> (not res!356131) (not e!325311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564974 (= res!356131 (validKeyInArray!0 (select (arr!17045 a!3118) j!142)))))

(declare-fun b!564976 () Bool)

(declare-fun res!356127 () Bool)

(assert (=> b!564976 (=> (not res!356127) (not e!325310))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35489 (_ BitVec 32)) SeekEntryResult!5494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564976 (= res!356127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) (select (arr!17045 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17045 a!3118) i!1132 k!1914) j!142) (array!35490 (store (arr!17045 a!3118) i!1132 k!1914) (size!17409 a!3118)) mask!3119)))))

(declare-fun b!564977 () Bool)

(declare-fun res!356124 () Bool)

(assert (=> b!564977 (=> (not res!356124) (not e!325311))))

(assert (=> b!564977 (= res!356124 (validKeyInArray!0 k!1914))))

(declare-fun b!564978 () Bool)

(declare-fun res!356132 () Bool)

(assert (=> b!564978 (=> (not res!356132) (not e!325310))))

(declare-datatypes ((List!11125 0))(
  ( (Nil!11122) (Cons!11121 (h!12124 (_ BitVec 64)) (t!17353 List!11125)) )
))
(declare-fun arrayNoDuplicates!0 (array!35489 (_ BitVec 32) List!11125) Bool)

(assert (=> b!564978 (= res!356132 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11122))))

(declare-fun b!564979 () Bool)

(declare-fun res!356130 () Bool)

(assert (=> b!564979 (=> (not res!356130) (not e!325311))))

(declare-fun arrayContainsKey!0 (array!35489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564979 (= res!356130 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564980 () Bool)

(declare-fun res!356128 () Bool)

(assert (=> b!564980 (=> (not res!356128) (not e!325310))))

(assert (=> b!564980 (= res!356128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564975 () Bool)

(declare-fun res!356126 () Bool)

(assert (=> b!564975 (=> (not res!356126) (not e!325311))))

(assert (=> b!564975 (= res!356126 (and (= (size!17409 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17409 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17409 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!356125 () Bool)

(assert (=> start!51624 (=> (not res!356125) (not e!325311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51624 (= res!356125 (validMask!0 mask!3119))))

(assert (=> start!51624 e!325311))

(assert (=> start!51624 true))

(declare-fun array_inv!12841 (array!35489) Bool)

(assert (=> start!51624 (array_inv!12841 a!3118)))

(assert (= (and start!51624 res!356125) b!564975))

(assert (= (and b!564975 res!356126) b!564974))

(assert (= (and b!564974 res!356131) b!564977))

(assert (= (and b!564977 res!356124) b!564979))

(assert (= (and b!564979 res!356130) b!564973))

(assert (= (and b!564973 res!356129) b!564980))

(assert (= (and b!564980 res!356128) b!564978))

(assert (= (and b!564978 res!356132) b!564976))

(assert (= (and b!564976 res!356127) b!564972))

(declare-fun m!543479 () Bool)

(assert (=> b!564978 m!543479))

(declare-fun m!543481 () Bool)

(assert (=> b!564973 m!543481))

(declare-fun m!543483 () Bool)

(assert (=> start!51624 m!543483))

(declare-fun m!543485 () Bool)

(assert (=> start!51624 m!543485))

(declare-fun m!543487 () Bool)

(assert (=> b!564974 m!543487))

(assert (=> b!564974 m!543487))

(declare-fun m!543489 () Bool)

(assert (=> b!564974 m!543489))

(declare-fun m!543491 () Bool)

(assert (=> b!564972 m!543491))

(declare-fun m!543493 () Bool)

(assert (=> b!564972 m!543493))

(declare-fun m!543495 () Bool)

(assert (=> b!564977 m!543495))

(declare-fun m!543497 () Bool)

(assert (=> b!564979 m!543497))

(declare-fun m!543499 () Bool)

(assert (=> b!564980 m!543499))

(assert (=> b!564976 m!543487))

(declare-fun m!543501 () Bool)

(assert (=> b!564976 m!543501))

(assert (=> b!564976 m!543487))

(declare-fun m!543503 () Bool)

(assert (=> b!564976 m!543503))

(declare-fun m!543505 () Bool)

(assert (=> b!564976 m!543505))

(assert (=> b!564976 m!543503))

(declare-fun m!543507 () Bool)

(assert (=> b!564976 m!543507))

(assert (=> b!564976 m!543501))

(assert (=> b!564976 m!543487))

(declare-fun m!543509 () Bool)

(assert (=> b!564976 m!543509))

(declare-fun m!543511 () Bool)

(assert (=> b!564976 m!543511))

(assert (=> b!564976 m!543503))

(assert (=> b!564976 m!543505))

(push 1)

