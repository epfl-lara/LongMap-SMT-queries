; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51542 () Bool)

(assert start!51542)

(declare-fun b!563984 () Bool)

(declare-fun e!324933 () Bool)

(declare-fun e!324934 () Bool)

(assert (=> b!563984 (= e!324933 e!324934)))

(declare-fun res!355137 () Bool)

(assert (=> b!563984 (=> (not res!355137) (not e!324934))))

(declare-datatypes ((SeekEntryResult!5453 0))(
  ( (MissingZero!5453 (index!24039 (_ BitVec 32))) (Found!5453 (index!24040 (_ BitVec 32))) (Intermediate!5453 (undefined!6265 Bool) (index!24041 (_ BitVec 32)) (x!52924 (_ BitVec 32))) (Undefined!5453) (MissingVacant!5453 (index!24042 (_ BitVec 32))) )
))
(declare-fun lt!257412 () SeekEntryResult!5453)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563984 (= res!355137 (or (= lt!257412 (MissingZero!5453 i!1132)) (= lt!257412 (MissingVacant!5453 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35407 0))(
  ( (array!35408 (arr!17004 (Array (_ BitVec 32) (_ BitVec 64))) (size!17368 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35407)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35407 (_ BitVec 32)) SeekEntryResult!5453)

(assert (=> b!563984 (= lt!257412 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563985 () Bool)

(declare-fun res!355139 () Bool)

(assert (=> b!563985 (=> (not res!355139) (not e!324933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563985 (= res!355139 (validKeyInArray!0 k!1914))))

(declare-fun res!355140 () Bool)

(assert (=> start!51542 (=> (not res!355140) (not e!324933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51542 (= res!355140 (validMask!0 mask!3119))))

(assert (=> start!51542 e!324933))

(assert (=> start!51542 true))

(declare-fun array_inv!12800 (array!35407) Bool)

(assert (=> start!51542 (array_inv!12800 a!3118)))

(declare-fun b!563986 () Bool)

(declare-fun res!355142 () Bool)

(assert (=> b!563986 (=> (not res!355142) (not e!324934))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35407 (_ BitVec 32)) SeekEntryResult!5453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563986 (= res!355142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17004 a!3118) j!142) mask!3119) (select (arr!17004 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17004 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17004 a!3118) i!1132 k!1914) j!142) (array!35408 (store (arr!17004 a!3118) i!1132 k!1914) (size!17368 a!3118)) mask!3119)))))

(declare-fun b!563987 () Bool)

(declare-fun res!355141 () Bool)

(assert (=> b!563987 (=> (not res!355141) (not e!324933))))

(assert (=> b!563987 (= res!355141 (and (= (size!17368 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17368 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17368 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563988 () Bool)

(declare-fun res!355145 () Bool)

(assert (=> b!563988 (=> (not res!355145) (not e!324934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35407 (_ BitVec 32)) Bool)

(assert (=> b!563988 (= res!355145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563989 () Bool)

(declare-fun res!355136 () Bool)

(assert (=> b!563989 (=> (not res!355136) (not e!324933))))

(declare-fun arrayContainsKey!0 (array!35407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563989 (= res!355136 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563990 () Bool)

(declare-fun res!355144 () Bool)

(assert (=> b!563990 (=> (not res!355144) (not e!324933))))

(assert (=> b!563990 (= res!355144 (validKeyInArray!0 (select (arr!17004 a!3118) j!142)))))

(declare-fun b!563991 () Bool)

(declare-fun res!355138 () Bool)

(assert (=> b!563991 (=> (not res!355138) (not e!324934))))

(declare-datatypes ((List!11084 0))(
  ( (Nil!11081) (Cons!11080 (h!12083 (_ BitVec 64)) (t!17312 List!11084)) )
))
(declare-fun arrayNoDuplicates!0 (array!35407 (_ BitVec 32) List!11084) Bool)

(assert (=> b!563991 (= res!355138 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11081))))

(declare-fun b!563992 () Bool)

(assert (=> b!563992 (= e!324934 (not true))))

(declare-fun e!324936 () Bool)

(assert (=> b!563992 e!324936))

(declare-fun res!355143 () Bool)

(assert (=> b!563992 (=> (not res!355143) (not e!324936))))

(assert (=> b!563992 (= res!355143 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17680 0))(
  ( (Unit!17681) )
))
(declare-fun lt!257413 () Unit!17680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17680)

(assert (=> b!563992 (= lt!257413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563993 () Bool)

(assert (=> b!563993 (= e!324936 (= (seekEntryOrOpen!0 (select (arr!17004 a!3118) j!142) a!3118 mask!3119) (Found!5453 j!142)))))

(assert (= (and start!51542 res!355140) b!563987))

(assert (= (and b!563987 res!355141) b!563990))

(assert (= (and b!563990 res!355144) b!563985))

(assert (= (and b!563985 res!355139) b!563989))

(assert (= (and b!563989 res!355136) b!563984))

(assert (= (and b!563984 res!355137) b!563988))

(assert (= (and b!563988 res!355145) b!563991))

(assert (= (and b!563991 res!355138) b!563986))

(assert (= (and b!563986 res!355142) b!563992))

(assert (= (and b!563992 res!355143) b!563993))

(declare-fun m!542433 () Bool)

(assert (=> b!563989 m!542433))

(declare-fun m!542435 () Bool)

(assert (=> start!51542 m!542435))

(declare-fun m!542437 () Bool)

(assert (=> start!51542 m!542437))

(declare-fun m!542439 () Bool)

(assert (=> b!563990 m!542439))

(assert (=> b!563990 m!542439))

(declare-fun m!542441 () Bool)

(assert (=> b!563990 m!542441))

(declare-fun m!542443 () Bool)

(assert (=> b!563992 m!542443))

(declare-fun m!542445 () Bool)

(assert (=> b!563992 m!542445))

(declare-fun m!542447 () Bool)

(assert (=> b!563988 m!542447))

(declare-fun m!542449 () Bool)

(assert (=> b!563984 m!542449))

(assert (=> b!563993 m!542439))

(assert (=> b!563993 m!542439))

(declare-fun m!542451 () Bool)

(assert (=> b!563993 m!542451))

(assert (=> b!563986 m!542439))

(declare-fun m!542453 () Bool)

(assert (=> b!563986 m!542453))

(assert (=> b!563986 m!542439))

(declare-fun m!542455 () Bool)

(assert (=> b!563986 m!542455))

(declare-fun m!542457 () Bool)

(assert (=> b!563986 m!542457))

(assert (=> b!563986 m!542455))

(declare-fun m!542459 () Bool)

(assert (=> b!563986 m!542459))

(assert (=> b!563986 m!542453))

(assert (=> b!563986 m!542439))

(declare-fun m!542461 () Bool)

(assert (=> b!563986 m!542461))

(declare-fun m!542463 () Bool)

(assert (=> b!563986 m!542463))

(assert (=> b!563986 m!542455))

(assert (=> b!563986 m!542457))

(declare-fun m!542465 () Bool)

(assert (=> b!563991 m!542465))

(declare-fun m!542467 () Bool)

(assert (=> b!563985 m!542467))

(push 1)

