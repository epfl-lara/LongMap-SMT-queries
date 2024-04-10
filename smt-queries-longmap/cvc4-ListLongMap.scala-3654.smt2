; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50424 () Bool)

(assert start!50424)

(declare-fun res!344269 () Bool)

(declare-fun e!318277 () Bool)

(assert (=> start!50424 (=> (not res!344269) (not e!318277))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50424 (= res!344269 (validMask!0 mask!3119))))

(assert (=> start!50424 e!318277))

(assert (=> start!50424 true))

(declare-datatypes ((array!34763 0))(
  ( (array!34764 (arr!16694 (Array (_ BitVec 32) (_ BitVec 64))) (size!17058 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34763)

(declare-fun array_inv!12490 (array!34763) Bool)

(assert (=> start!50424 (array_inv!12490 a!3118)))

(declare-fun b!551483 () Bool)

(declare-fun e!318278 () Bool)

(assert (=> b!551483 (= e!318277 e!318278)))

(declare-fun res!344267 () Bool)

(assert (=> b!551483 (=> (not res!344267) (not e!318278))))

(declare-datatypes ((SeekEntryResult!5143 0))(
  ( (MissingZero!5143 (index!22799 (_ BitVec 32))) (Found!5143 (index!22800 (_ BitVec 32))) (Intermediate!5143 (undefined!5955 Bool) (index!22801 (_ BitVec 32)) (x!51725 (_ BitVec 32))) (Undefined!5143) (MissingVacant!5143 (index!22802 (_ BitVec 32))) )
))
(declare-fun lt!250840 () SeekEntryResult!5143)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551483 (= res!344267 (or (= lt!250840 (MissingZero!5143 i!1132)) (= lt!250840 (MissingVacant!5143 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34763 (_ BitVec 32)) SeekEntryResult!5143)

(assert (=> b!551483 (= lt!250840 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551484 () Bool)

(declare-fun res!344270 () Bool)

(assert (=> b!551484 (=> (not res!344270) (not e!318277))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!551484 (= res!344270 (and (= (size!17058 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17058 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17058 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551485 () Bool)

(declare-fun res!344266 () Bool)

(assert (=> b!551485 (=> (not res!344266) (not e!318278))))

(declare-datatypes ((List!10774 0))(
  ( (Nil!10771) (Cons!10770 (h!11749 (_ BitVec 64)) (t!17002 List!10774)) )
))
(declare-fun arrayNoDuplicates!0 (array!34763 (_ BitVec 32) List!10774) Bool)

(assert (=> b!551485 (= res!344266 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10771))))

(declare-fun b!551486 () Bool)

(assert (=> b!551486 (= e!318278 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318276 () Bool)

(assert (=> b!551486 e!318276))

(declare-fun res!344261 () Bool)

(assert (=> b!551486 (=> (not res!344261) (not e!318276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34763 (_ BitVec 32)) Bool)

(assert (=> b!551486 (= res!344261 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17060 0))(
  ( (Unit!17061) )
))
(declare-fun lt!250839 () Unit!17060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17060)

(assert (=> b!551486 (= lt!250839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551487 () Bool)

(declare-fun res!344268 () Bool)

(assert (=> b!551487 (=> (not res!344268) (not e!318277))))

(declare-fun arrayContainsKey!0 (array!34763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551487 (= res!344268 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551488 () Bool)

(assert (=> b!551488 (= e!318276 (= (seekEntryOrOpen!0 (select (arr!16694 a!3118) j!142) a!3118 mask!3119) (Found!5143 j!142)))))

(declare-fun b!551489 () Bool)

(declare-fun res!344263 () Bool)

(assert (=> b!551489 (=> (not res!344263) (not e!318277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551489 (= res!344263 (validKeyInArray!0 (select (arr!16694 a!3118) j!142)))))

(declare-fun b!551490 () Bool)

(declare-fun res!344264 () Bool)

(assert (=> b!551490 (=> (not res!344264) (not e!318278))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34763 (_ BitVec 32)) SeekEntryResult!5143)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551490 (= res!344264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16694 a!3118) j!142) mask!3119) (select (arr!16694 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16694 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16694 a!3118) i!1132 k!1914) j!142) (array!34764 (store (arr!16694 a!3118) i!1132 k!1914) (size!17058 a!3118)) mask!3119)))))

(declare-fun b!551491 () Bool)

(declare-fun res!344265 () Bool)

(assert (=> b!551491 (=> (not res!344265) (not e!318278))))

(assert (=> b!551491 (= res!344265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551492 () Bool)

(declare-fun res!344262 () Bool)

(assert (=> b!551492 (=> (not res!344262) (not e!318277))))

(assert (=> b!551492 (= res!344262 (validKeyInArray!0 k!1914))))

(assert (= (and start!50424 res!344269) b!551484))

(assert (= (and b!551484 res!344270) b!551489))

(assert (= (and b!551489 res!344263) b!551492))

(assert (= (and b!551492 res!344262) b!551487))

(assert (= (and b!551487 res!344268) b!551483))

(assert (= (and b!551483 res!344267) b!551491))

(assert (= (and b!551491 res!344265) b!551485))

(assert (= (and b!551485 res!344266) b!551490))

(assert (= (and b!551490 res!344264) b!551486))

(assert (= (and b!551486 res!344261) b!551488))

(declare-fun m!528477 () Bool)

(assert (=> start!50424 m!528477))

(declare-fun m!528479 () Bool)

(assert (=> start!50424 m!528479))

(declare-fun m!528481 () Bool)

(assert (=> b!551488 m!528481))

(assert (=> b!551488 m!528481))

(declare-fun m!528483 () Bool)

(assert (=> b!551488 m!528483))

(declare-fun m!528485 () Bool)

(assert (=> b!551492 m!528485))

(declare-fun m!528487 () Bool)

(assert (=> b!551485 m!528487))

(declare-fun m!528489 () Bool)

(assert (=> b!551483 m!528489))

(declare-fun m!528491 () Bool)

(assert (=> b!551491 m!528491))

(assert (=> b!551489 m!528481))

(assert (=> b!551489 m!528481))

(declare-fun m!528493 () Bool)

(assert (=> b!551489 m!528493))

(declare-fun m!528495 () Bool)

(assert (=> b!551487 m!528495))

(declare-fun m!528497 () Bool)

(assert (=> b!551486 m!528497))

(declare-fun m!528499 () Bool)

(assert (=> b!551486 m!528499))

(assert (=> b!551490 m!528481))

(declare-fun m!528501 () Bool)

(assert (=> b!551490 m!528501))

(assert (=> b!551490 m!528481))

(declare-fun m!528503 () Bool)

(assert (=> b!551490 m!528503))

(declare-fun m!528505 () Bool)

(assert (=> b!551490 m!528505))

(assert (=> b!551490 m!528503))

(declare-fun m!528507 () Bool)

(assert (=> b!551490 m!528507))

(assert (=> b!551490 m!528501))

(assert (=> b!551490 m!528481))

(declare-fun m!528509 () Bool)

(assert (=> b!551490 m!528509))

(declare-fun m!528511 () Bool)

(assert (=> b!551490 m!528511))

(assert (=> b!551490 m!528503))

(assert (=> b!551490 m!528505))

(push 1)

