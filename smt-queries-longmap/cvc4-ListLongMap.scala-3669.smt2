; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50634 () Bool)

(assert start!50634)

(declare-fun b!553432 () Bool)

(declare-fun e!319251 () Bool)

(declare-fun e!319253 () Bool)

(assert (=> b!553432 (= e!319251 (not e!319253))))

(declare-fun res!345849 () Bool)

(assert (=> b!553432 (=> res!345849 e!319253)))

(declare-datatypes ((SeekEntryResult!5188 0))(
  ( (MissingZero!5188 (index!22979 (_ BitVec 32))) (Found!5188 (index!22980 (_ BitVec 32))) (Intermediate!5188 (undefined!6000 Bool) (index!22981 (_ BitVec 32)) (x!51902 (_ BitVec 32))) (Undefined!5188) (MissingVacant!5188 (index!22982 (_ BitVec 32))) )
))
(declare-fun lt!251484 () SeekEntryResult!5188)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!553432 (= res!345849 (or (not (is-Intermediate!5188 lt!251484)) (not (undefined!6000 lt!251484)) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319249 () Bool)

(assert (=> b!553432 e!319249))

(declare-fun res!345846 () Bool)

(assert (=> b!553432 (=> (not res!345846) (not e!319249))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34859 0))(
  ( (array!34860 (arr!16739 (Array (_ BitVec 32) (_ BitVec 64))) (size!17103 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34859)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34859 (_ BitVec 32)) Bool)

(assert (=> b!553432 (= res!345846 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17150 0))(
  ( (Unit!17151) )
))
(declare-fun lt!251481 () Unit!17150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17150)

(assert (=> b!553432 (= lt!251481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553433 () Bool)

(declare-fun res!345844 () Bool)

(declare-fun e!319250 () Bool)

(assert (=> b!553433 (=> (not res!345844) (not e!319250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553433 (= res!345844 (validKeyInArray!0 (select (arr!16739 a!3118) j!142)))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun b!553434 () Bool)

(assert (=> b!553434 (= e!319253 (validKeyInArray!0 (select (store (arr!16739 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!553435 () Bool)

(declare-fun res!345850 () Bool)

(declare-fun e!319252 () Bool)

(assert (=> b!553435 (=> (not res!345850) (not e!319252))))

(assert (=> b!553435 (= res!345850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553436 () Bool)

(declare-fun res!345853 () Bool)

(assert (=> b!553436 (=> (not res!345853) (not e!319250))))

(assert (=> b!553436 (= res!345853 (and (= (size!17103 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17103 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17103 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345852 () Bool)

(assert (=> start!50634 (=> (not res!345852) (not e!319250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50634 (= res!345852 (validMask!0 mask!3119))))

(assert (=> start!50634 e!319250))

(assert (=> start!50634 true))

(declare-fun array_inv!12535 (array!34859) Bool)

(assert (=> start!50634 (array_inv!12535 a!3118)))

(declare-fun b!553437 () Bool)

(declare-fun res!345851 () Bool)

(assert (=> b!553437 (=> (not res!345851) (not e!319250))))

(declare-fun arrayContainsKey!0 (array!34859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553437 (= res!345851 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553438 () Bool)

(declare-fun res!345848 () Bool)

(assert (=> b!553438 (=> (not res!345848) (not e!319250))))

(assert (=> b!553438 (= res!345848 (validKeyInArray!0 k!1914))))

(declare-fun b!553439 () Bool)

(declare-fun res!345845 () Bool)

(assert (=> b!553439 (=> (not res!345845) (not e!319252))))

(declare-datatypes ((List!10819 0))(
  ( (Nil!10816) (Cons!10815 (h!11800 (_ BitVec 64)) (t!17047 List!10819)) )
))
(declare-fun arrayNoDuplicates!0 (array!34859 (_ BitVec 32) List!10819) Bool)

(assert (=> b!553439 (= res!345845 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10816))))

(declare-fun b!553440 () Bool)

(assert (=> b!553440 (= e!319250 e!319252)))

(declare-fun res!345847 () Bool)

(assert (=> b!553440 (=> (not res!345847) (not e!319252))))

(declare-fun lt!251485 () SeekEntryResult!5188)

(assert (=> b!553440 (= res!345847 (or (= lt!251485 (MissingZero!5188 i!1132)) (= lt!251485 (MissingVacant!5188 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34859 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!553440 (= lt!251485 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553441 () Bool)

(assert (=> b!553441 (= e!319249 (= (seekEntryOrOpen!0 (select (arr!16739 a!3118) j!142) a!3118 mask!3119) (Found!5188 j!142)))))

(declare-fun b!553442 () Bool)

(assert (=> b!553442 (= e!319252 e!319251)))

(declare-fun res!345854 () Bool)

(assert (=> b!553442 (=> (not res!345854) (not e!319251))))

(declare-fun lt!251482 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34859 (_ BitVec 32)) SeekEntryResult!5188)

(assert (=> b!553442 (= res!345854 (= lt!251484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251482 (select (store (arr!16739 a!3118) i!1132 k!1914) j!142) (array!34860 (store (arr!16739 a!3118) i!1132 k!1914) (size!17103 a!3118)) mask!3119)))))

(declare-fun lt!251483 () (_ BitVec 32))

(assert (=> b!553442 (= lt!251484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251483 (select (arr!16739 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553442 (= lt!251482 (toIndex!0 (select (store (arr!16739 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553442 (= lt!251483 (toIndex!0 (select (arr!16739 a!3118) j!142) mask!3119))))

(assert (= (and start!50634 res!345852) b!553436))

(assert (= (and b!553436 res!345853) b!553433))

(assert (= (and b!553433 res!345844) b!553438))

(assert (= (and b!553438 res!345848) b!553437))

(assert (= (and b!553437 res!345851) b!553440))

(assert (= (and b!553440 res!345847) b!553435))

(assert (= (and b!553435 res!345850) b!553439))

(assert (= (and b!553439 res!345845) b!553442))

(assert (= (and b!553442 res!345854) b!553432))

(assert (= (and b!553432 res!345846) b!553441))

(assert (= (and b!553432 (not res!345849)) b!553434))

(declare-fun m!530509 () Bool)

(assert (=> b!553442 m!530509))

(declare-fun m!530511 () Bool)

(assert (=> b!553442 m!530511))

(assert (=> b!553442 m!530509))

(assert (=> b!553442 m!530509))

(declare-fun m!530513 () Bool)

(assert (=> b!553442 m!530513))

(declare-fun m!530515 () Bool)

(assert (=> b!553442 m!530515))

(assert (=> b!553442 m!530515))

(declare-fun m!530517 () Bool)

(assert (=> b!553442 m!530517))

(declare-fun m!530519 () Bool)

(assert (=> b!553442 m!530519))

(assert (=> b!553442 m!530515))

(declare-fun m!530521 () Bool)

(assert (=> b!553442 m!530521))

(assert (=> b!553434 m!530519))

(assert (=> b!553434 m!530515))

(assert (=> b!553434 m!530515))

(declare-fun m!530523 () Bool)

(assert (=> b!553434 m!530523))

(declare-fun m!530525 () Bool)

(assert (=> b!553432 m!530525))

(declare-fun m!530527 () Bool)

(assert (=> b!553432 m!530527))

(declare-fun m!530529 () Bool)

(assert (=> b!553438 m!530529))

(declare-fun m!530531 () Bool)

(assert (=> b!553437 m!530531))

(declare-fun m!530533 () Bool)

(assert (=> b!553439 m!530533))

(declare-fun m!530535 () Bool)

(assert (=> b!553440 m!530535))

(assert (=> b!553441 m!530509))

(assert (=> b!553441 m!530509))

(declare-fun m!530537 () Bool)

(assert (=> b!553441 m!530537))

(declare-fun m!530539 () Bool)

(assert (=> b!553435 m!530539))

(assert (=> b!553433 m!530509))

(assert (=> b!553433 m!530509))

(declare-fun m!530541 () Bool)

(assert (=> b!553433 m!530541))

(declare-fun m!530543 () Bool)

(assert (=> start!50634 m!530543))

(declare-fun m!530545 () Bool)

(assert (=> start!50634 m!530545))

(push 1)

