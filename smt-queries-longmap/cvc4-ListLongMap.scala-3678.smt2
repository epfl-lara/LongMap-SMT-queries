; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50688 () Bool)

(assert start!50688)

(declare-fun b!554252 () Bool)

(declare-fun res!346669 () Bool)

(declare-fun e!319613 () Bool)

(assert (=> b!554252 (=> (not res!346669) (not e!319613))))

(declare-datatypes ((array!34913 0))(
  ( (array!34914 (arr!16766 (Array (_ BitVec 32) (_ BitVec 64))) (size!17130 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34913)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554252 (= res!346669 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554253 () Bool)

(declare-fun res!346665 () Bool)

(declare-fun e!319612 () Bool)

(assert (=> b!554253 (=> (not res!346665) (not e!319612))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34913 (_ BitVec 32)) Bool)

(assert (=> b!554253 (= res!346665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554254 () Bool)

(declare-fun res!346670 () Bool)

(assert (=> b!554254 (=> (not res!346670) (not e!319613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554254 (= res!346670 (validKeyInArray!0 k!1914))))

(declare-fun e!319614 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!554255 () Bool)

(declare-datatypes ((SeekEntryResult!5215 0))(
  ( (MissingZero!5215 (index!23087 (_ BitVec 32))) (Found!5215 (index!23088 (_ BitVec 32))) (Intermediate!5215 (undefined!6027 Bool) (index!23089 (_ BitVec 32)) (x!52001 (_ BitVec 32))) (Undefined!5215) (MissingVacant!5215 (index!23090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34913 (_ BitVec 32)) SeekEntryResult!5215)

(assert (=> b!554255 (= e!319614 (= (seekEntryOrOpen!0 (select (arr!16766 a!3118) j!142) a!3118 mask!3119) (Found!5215 j!142)))))

(declare-fun b!554256 () Bool)

(declare-fun res!346668 () Bool)

(assert (=> b!554256 (=> (not res!346668) (not e!319613))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554256 (= res!346668 (and (= (size!17130 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17130 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17130 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!346667 () Bool)

(assert (=> start!50688 (=> (not res!346667) (not e!319613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50688 (= res!346667 (validMask!0 mask!3119))))

(assert (=> start!50688 e!319613))

(assert (=> start!50688 true))

(declare-fun array_inv!12562 (array!34913) Bool)

(assert (=> start!50688 (array_inv!12562 a!3118)))

(declare-fun b!554257 () Bool)

(declare-fun res!346671 () Bool)

(assert (=> b!554257 (=> (not res!346671) (not e!319613))))

(assert (=> b!554257 (= res!346671 (validKeyInArray!0 (select (arr!16766 a!3118) j!142)))))

(declare-fun b!554258 () Bool)

(declare-fun res!346673 () Bool)

(assert (=> b!554258 (=> (not res!346673) (not e!319612))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34913 (_ BitVec 32)) SeekEntryResult!5215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554258 (= res!346673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16766 a!3118) j!142) mask!3119) (select (arr!16766 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16766 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16766 a!3118) i!1132 k!1914) j!142) (array!34914 (store (arr!16766 a!3118) i!1132 k!1914) (size!17130 a!3118)) mask!3119)))))

(declare-fun b!554259 () Bool)

(assert (=> b!554259 (= e!319613 e!319612)))

(declare-fun res!346666 () Bool)

(assert (=> b!554259 (=> (not res!346666) (not e!319612))))

(declare-fun lt!251727 () SeekEntryResult!5215)

(assert (=> b!554259 (= res!346666 (or (= lt!251727 (MissingZero!5215 i!1132)) (= lt!251727 (MissingVacant!5215 i!1132))))))

(assert (=> b!554259 (= lt!251727 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554260 () Bool)

(declare-fun res!346672 () Bool)

(assert (=> b!554260 (=> (not res!346672) (not e!319612))))

(declare-datatypes ((List!10846 0))(
  ( (Nil!10843) (Cons!10842 (h!11827 (_ BitVec 64)) (t!17074 List!10846)) )
))
(declare-fun arrayNoDuplicates!0 (array!34913 (_ BitVec 32) List!10846) Bool)

(assert (=> b!554260 (= res!346672 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10843))))

(declare-fun b!554261 () Bool)

(assert (=> b!554261 (= e!319612 (not true))))

(assert (=> b!554261 e!319614))

(declare-fun res!346664 () Bool)

(assert (=> b!554261 (=> (not res!346664) (not e!319614))))

(assert (=> b!554261 (= res!346664 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17204 0))(
  ( (Unit!17205) )
))
(declare-fun lt!251728 () Unit!17204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17204)

(assert (=> b!554261 (= lt!251728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50688 res!346667) b!554256))

(assert (= (and b!554256 res!346668) b!554257))

(assert (= (and b!554257 res!346671) b!554254))

(assert (= (and b!554254 res!346670) b!554252))

(assert (= (and b!554252 res!346669) b!554259))

(assert (= (and b!554259 res!346666) b!554253))

(assert (= (and b!554253 res!346665) b!554260))

(assert (= (and b!554260 res!346672) b!554258))

(assert (= (and b!554258 res!346673) b!554261))

(assert (= (and b!554261 res!346664) b!554255))

(declare-fun m!531507 () Bool)

(assert (=> b!554252 m!531507))

(declare-fun m!531509 () Bool)

(assert (=> start!50688 m!531509))

(declare-fun m!531511 () Bool)

(assert (=> start!50688 m!531511))

(declare-fun m!531513 () Bool)

(assert (=> b!554255 m!531513))

(assert (=> b!554255 m!531513))

(declare-fun m!531515 () Bool)

(assert (=> b!554255 m!531515))

(declare-fun m!531517 () Bool)

(assert (=> b!554260 m!531517))

(declare-fun m!531519 () Bool)

(assert (=> b!554254 m!531519))

(declare-fun m!531521 () Bool)

(assert (=> b!554261 m!531521))

(declare-fun m!531523 () Bool)

(assert (=> b!554261 m!531523))

(assert (=> b!554257 m!531513))

(assert (=> b!554257 m!531513))

(declare-fun m!531525 () Bool)

(assert (=> b!554257 m!531525))

(declare-fun m!531527 () Bool)

(assert (=> b!554253 m!531527))

(declare-fun m!531529 () Bool)

(assert (=> b!554259 m!531529))

(assert (=> b!554258 m!531513))

(declare-fun m!531531 () Bool)

(assert (=> b!554258 m!531531))

(assert (=> b!554258 m!531513))

(declare-fun m!531533 () Bool)

(assert (=> b!554258 m!531533))

(declare-fun m!531535 () Bool)

(assert (=> b!554258 m!531535))

(assert (=> b!554258 m!531533))

(declare-fun m!531537 () Bool)

(assert (=> b!554258 m!531537))

(assert (=> b!554258 m!531531))

(assert (=> b!554258 m!531513))

(declare-fun m!531539 () Bool)

(assert (=> b!554258 m!531539))

(declare-fun m!531541 () Bool)

(assert (=> b!554258 m!531541))

(assert (=> b!554258 m!531533))

(assert (=> b!554258 m!531535))

(push 1)

