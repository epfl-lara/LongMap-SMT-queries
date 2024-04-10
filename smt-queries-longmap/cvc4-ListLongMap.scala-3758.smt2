; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51546 () Bool)

(assert start!51546)

(declare-fun b!564044 () Bool)

(declare-fun e!324959 () Bool)

(assert (=> b!564044 (= e!324959 (not true))))

(declare-fun e!324960 () Bool)

(assert (=> b!564044 e!324960))

(declare-fun res!355204 () Bool)

(assert (=> b!564044 (=> (not res!355204) (not e!324960))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35411 0))(
  ( (array!35412 (arr!17006 (Array (_ BitVec 32) (_ BitVec 64))) (size!17370 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35411)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35411 (_ BitVec 32)) Bool)

(assert (=> b!564044 (= res!355204 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17684 0))(
  ( (Unit!17685) )
))
(declare-fun lt!257424 () Unit!17684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17684)

(assert (=> b!564044 (= lt!257424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564045 () Bool)

(declare-fun res!355197 () Bool)

(assert (=> b!564045 (=> (not res!355197) (not e!324959))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5455 0))(
  ( (MissingZero!5455 (index!24047 (_ BitVec 32))) (Found!5455 (index!24048 (_ BitVec 32))) (Intermediate!5455 (undefined!6267 Bool) (index!24049 (_ BitVec 32)) (x!52926 (_ BitVec 32))) (Undefined!5455) (MissingVacant!5455 (index!24050 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35411 (_ BitVec 32)) SeekEntryResult!5455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564045 (= res!355197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17006 a!3118) j!142) mask!3119) (select (arr!17006 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17006 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17006 a!3118) i!1132 k!1914) j!142) (array!35412 (store (arr!17006 a!3118) i!1132 k!1914) (size!17370 a!3118)) mask!3119)))))

(declare-fun b!564046 () Bool)

(declare-fun res!355198 () Bool)

(declare-fun e!324957 () Bool)

(assert (=> b!564046 (=> (not res!355198) (not e!324957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564046 (= res!355198 (validKeyInArray!0 k!1914))))

(declare-fun b!564047 () Bool)

(declare-fun res!355196 () Bool)

(assert (=> b!564047 (=> (not res!355196) (not e!324957))))

(assert (=> b!564047 (= res!355196 (and (= (size!17370 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17370 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17370 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564048 () Bool)

(declare-fun res!355201 () Bool)

(assert (=> b!564048 (=> (not res!355201) (not e!324959))))

(declare-datatypes ((List!11086 0))(
  ( (Nil!11083) (Cons!11082 (h!12085 (_ BitVec 64)) (t!17314 List!11086)) )
))
(declare-fun arrayNoDuplicates!0 (array!35411 (_ BitVec 32) List!11086) Bool)

(assert (=> b!564048 (= res!355201 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11083))))

(declare-fun res!355199 () Bool)

(assert (=> start!51546 (=> (not res!355199) (not e!324957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51546 (= res!355199 (validMask!0 mask!3119))))

(assert (=> start!51546 e!324957))

(assert (=> start!51546 true))

(declare-fun array_inv!12802 (array!35411) Bool)

(assert (=> start!51546 (array_inv!12802 a!3118)))

(declare-fun b!564049 () Bool)

(declare-fun res!355205 () Bool)

(assert (=> b!564049 (=> (not res!355205) (not e!324957))))

(declare-fun arrayContainsKey!0 (array!35411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564049 (= res!355205 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564050 () Bool)

(declare-fun res!355200 () Bool)

(assert (=> b!564050 (=> (not res!355200) (not e!324959))))

(assert (=> b!564050 (= res!355200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564051 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35411 (_ BitVec 32)) SeekEntryResult!5455)

(assert (=> b!564051 (= e!324960 (= (seekEntryOrOpen!0 (select (arr!17006 a!3118) j!142) a!3118 mask!3119) (Found!5455 j!142)))))

(declare-fun b!564052 () Bool)

(declare-fun res!355202 () Bool)

(assert (=> b!564052 (=> (not res!355202) (not e!324957))))

(assert (=> b!564052 (= res!355202 (validKeyInArray!0 (select (arr!17006 a!3118) j!142)))))

(declare-fun b!564053 () Bool)

(assert (=> b!564053 (= e!324957 e!324959)))

(declare-fun res!355203 () Bool)

(assert (=> b!564053 (=> (not res!355203) (not e!324959))))

(declare-fun lt!257425 () SeekEntryResult!5455)

(assert (=> b!564053 (= res!355203 (or (= lt!257425 (MissingZero!5455 i!1132)) (= lt!257425 (MissingVacant!5455 i!1132))))))

(assert (=> b!564053 (= lt!257425 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51546 res!355199) b!564047))

(assert (= (and b!564047 res!355196) b!564052))

(assert (= (and b!564052 res!355202) b!564046))

(assert (= (and b!564046 res!355198) b!564049))

(assert (= (and b!564049 res!355205) b!564053))

(assert (= (and b!564053 res!355203) b!564050))

(assert (= (and b!564050 res!355200) b!564048))

(assert (= (and b!564048 res!355201) b!564045))

(assert (= (and b!564045 res!355197) b!564044))

(assert (= (and b!564044 res!355204) b!564051))

(declare-fun m!542505 () Bool)

(assert (=> b!564046 m!542505))

(declare-fun m!542507 () Bool)

(assert (=> b!564044 m!542507))

(declare-fun m!542509 () Bool)

(assert (=> b!564044 m!542509))

(declare-fun m!542511 () Bool)

(assert (=> b!564048 m!542511))

(declare-fun m!542513 () Bool)

(assert (=> b!564050 m!542513))

(declare-fun m!542515 () Bool)

(assert (=> b!564052 m!542515))

(assert (=> b!564052 m!542515))

(declare-fun m!542517 () Bool)

(assert (=> b!564052 m!542517))

(declare-fun m!542519 () Bool)

(assert (=> b!564049 m!542519))

(assert (=> b!564045 m!542515))

(declare-fun m!542521 () Bool)

(assert (=> b!564045 m!542521))

(assert (=> b!564045 m!542515))

(declare-fun m!542523 () Bool)

(assert (=> b!564045 m!542523))

(declare-fun m!542525 () Bool)

(assert (=> b!564045 m!542525))

(assert (=> b!564045 m!542523))

(declare-fun m!542527 () Bool)

(assert (=> b!564045 m!542527))

(assert (=> b!564045 m!542521))

(assert (=> b!564045 m!542515))

(declare-fun m!542529 () Bool)

(assert (=> b!564045 m!542529))

(declare-fun m!542531 () Bool)

(assert (=> b!564045 m!542531))

(assert (=> b!564045 m!542523))

(assert (=> b!564045 m!542525))

(assert (=> b!564051 m!542515))

(assert (=> b!564051 m!542515))

(declare-fun m!542533 () Bool)

(assert (=> b!564051 m!542533))

(declare-fun m!542535 () Bool)

(assert (=> start!51546 m!542535))

(declare-fun m!542537 () Bool)

(assert (=> start!51546 m!542537))

(declare-fun m!542539 () Bool)

(assert (=> b!564053 m!542539))

(push 1)

