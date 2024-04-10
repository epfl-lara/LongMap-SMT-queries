; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51506 () Bool)

(assert start!51506)

(declare-fun b!563435 () Bool)

(declare-fun res!354588 () Bool)

(declare-fun e!324691 () Bool)

(assert (=> b!563435 (=> (not res!354588) (not e!324691))))

(declare-datatypes ((array!35371 0))(
  ( (array!35372 (arr!16986 (Array (_ BitVec 32) (_ BitVec 64))) (size!17350 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35371)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563435 (= res!354588 (validKeyInArray!0 (select (arr!16986 a!3118) j!142)))))

(declare-fun b!563436 () Bool)

(declare-fun res!354589 () Bool)

(declare-fun e!324692 () Bool)

(assert (=> b!563436 (=> (not res!354589) (not e!324692))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5435 0))(
  ( (MissingZero!5435 (index!23967 (_ BitVec 32))) (Found!5435 (index!23968 (_ BitVec 32))) (Intermediate!5435 (undefined!6247 Bool) (index!23969 (_ BitVec 32)) (x!52858 (_ BitVec 32))) (Undefined!5435) (MissingVacant!5435 (index!23970 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35371 (_ BitVec 32)) SeekEntryResult!5435)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563436 (= res!354589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16986 a!3118) j!142) mask!3119) (select (arr!16986 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16986 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16986 a!3118) i!1132 k!1914) j!142) (array!35372 (store (arr!16986 a!3118) i!1132 k!1914) (size!17350 a!3118)) mask!3119)))))

(declare-fun b!563437 () Bool)

(assert (=> b!563437 (= e!324692 (not true))))

(declare-fun e!324690 () Bool)

(assert (=> b!563437 e!324690))

(declare-fun res!354593 () Bool)

(assert (=> b!563437 (=> (not res!354593) (not e!324690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35371 (_ BitVec 32)) Bool)

(assert (=> b!563437 (= res!354593 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17644 0))(
  ( (Unit!17645) )
))
(declare-fun lt!257232 () Unit!17644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17644)

(assert (=> b!563437 (= lt!257232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563438 () Bool)

(declare-fun res!354595 () Bool)

(assert (=> b!563438 (=> (not res!354595) (not e!324691))))

(assert (=> b!563438 (= res!354595 (validKeyInArray!0 k!1914))))

(declare-fun b!563439 () Bool)

(declare-fun res!354594 () Bool)

(assert (=> b!563439 (=> (not res!354594) (not e!324692))))

(declare-datatypes ((List!11066 0))(
  ( (Nil!11063) (Cons!11062 (h!12065 (_ BitVec 64)) (t!17294 List!11066)) )
))
(declare-fun arrayNoDuplicates!0 (array!35371 (_ BitVec 32) List!11066) Bool)

(assert (=> b!563439 (= res!354594 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11063))))

(declare-fun b!563441 () Bool)

(declare-fun res!354591 () Bool)

(assert (=> b!563441 (=> (not res!354591) (not e!324692))))

(assert (=> b!563441 (= res!354591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563442 () Bool)

(declare-fun res!354590 () Bool)

(assert (=> b!563442 (=> (not res!354590) (not e!324691))))

(declare-fun arrayContainsKey!0 (array!35371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563442 (= res!354590 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563443 () Bool)

(assert (=> b!563443 (= e!324691 e!324692)))

(declare-fun res!354596 () Bool)

(assert (=> b!563443 (=> (not res!354596) (not e!324692))))

(declare-fun lt!257233 () SeekEntryResult!5435)

(assert (=> b!563443 (= res!354596 (or (= lt!257233 (MissingZero!5435 i!1132)) (= lt!257233 (MissingVacant!5435 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35371 (_ BitVec 32)) SeekEntryResult!5435)

(assert (=> b!563443 (= lt!257233 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563444 () Bool)

(declare-fun res!354592 () Bool)

(assert (=> b!563444 (=> (not res!354592) (not e!324691))))

(assert (=> b!563444 (= res!354592 (and (= (size!17350 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17350 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17350 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!354587 () Bool)

(assert (=> start!51506 (=> (not res!354587) (not e!324691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51506 (= res!354587 (validMask!0 mask!3119))))

(assert (=> start!51506 e!324691))

(assert (=> start!51506 true))

(declare-fun array_inv!12782 (array!35371) Bool)

(assert (=> start!51506 (array_inv!12782 a!3118)))

(declare-fun b!563440 () Bool)

(assert (=> b!563440 (= e!324690 (= (seekEntryOrOpen!0 (select (arr!16986 a!3118) j!142) a!3118 mask!3119) (Found!5435 j!142)))))

(assert (= (and start!51506 res!354587) b!563444))

(assert (= (and b!563444 res!354592) b!563435))

(assert (= (and b!563435 res!354588) b!563438))

(assert (= (and b!563438 res!354595) b!563442))

(assert (= (and b!563442 res!354590) b!563443))

(assert (= (and b!563443 res!354596) b!563441))

(assert (= (and b!563441 res!354591) b!563439))

(assert (= (and b!563439 res!354594) b!563436))

(assert (= (and b!563436 res!354589) b!563437))

(assert (= (and b!563437 res!354593) b!563440))

(declare-fun m!541779 () Bool)

(assert (=> b!563442 m!541779))

(declare-fun m!541781 () Bool)

(assert (=> b!563439 m!541781))

(declare-fun m!541783 () Bool)

(assert (=> start!51506 m!541783))

(declare-fun m!541785 () Bool)

(assert (=> start!51506 m!541785))

(declare-fun m!541787 () Bool)

(assert (=> b!563438 m!541787))

(declare-fun m!541789 () Bool)

(assert (=> b!563437 m!541789))

(declare-fun m!541791 () Bool)

(assert (=> b!563437 m!541791))

(declare-fun m!541793 () Bool)

(assert (=> b!563440 m!541793))

(assert (=> b!563440 m!541793))

(declare-fun m!541795 () Bool)

(assert (=> b!563440 m!541795))

(declare-fun m!541797 () Bool)

(assert (=> b!563441 m!541797))

(declare-fun m!541799 () Bool)

(assert (=> b!563443 m!541799))

(assert (=> b!563435 m!541793))

(assert (=> b!563435 m!541793))

(declare-fun m!541801 () Bool)

(assert (=> b!563435 m!541801))

(assert (=> b!563436 m!541793))

(declare-fun m!541803 () Bool)

(assert (=> b!563436 m!541803))

(assert (=> b!563436 m!541793))

(declare-fun m!541805 () Bool)

(assert (=> b!563436 m!541805))

(declare-fun m!541807 () Bool)

(assert (=> b!563436 m!541807))

(assert (=> b!563436 m!541805))

(declare-fun m!541809 () Bool)

(assert (=> b!563436 m!541809))

(assert (=> b!563436 m!541803))

(assert (=> b!563436 m!541793))

(declare-fun m!541811 () Bool)

(assert (=> b!563436 m!541811))

(declare-fun m!541813 () Bool)

(assert (=> b!563436 m!541813))

(assert (=> b!563436 m!541805))

(assert (=> b!563436 m!541807))

(push 1)

