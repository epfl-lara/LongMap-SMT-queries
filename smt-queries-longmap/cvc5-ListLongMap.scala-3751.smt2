; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51500 () Bool)

(assert start!51500)

(declare-fun b!563345 () Bool)

(declare-fun res!354501 () Bool)

(declare-fun e!324650 () Bool)

(assert (=> b!563345 (=> (not res!354501) (not e!324650))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563345 (= res!354501 (validKeyInArray!0 k!1914))))

(declare-fun e!324649 () Bool)

(declare-fun lt!257190 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!563346 () Bool)

(declare-datatypes ((SeekEntryResult!5432 0))(
  ( (MissingZero!5432 (index!23955 (_ BitVec 32))) (Found!5432 (index!23956 (_ BitVec 32))) (Intermediate!5432 (undefined!6244 Bool) (index!23957 (_ BitVec 32)) (x!52847 (_ BitVec 32))) (Undefined!5432) (MissingVacant!5432 (index!23958 (_ BitVec 32))) )
))
(declare-fun lt!257189 () SeekEntryResult!5432)

(assert (=> b!563346 (= e!324649 (not (or (and (not lt!257190) (undefined!6244 lt!257189)) (and (not lt!257190) (not (undefined!6244 lt!257189))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!563346 (= lt!257190 (not (is-Intermediate!5432 lt!257189)))))

(declare-fun e!324651 () Bool)

(assert (=> b!563346 e!324651))

(declare-fun res!354505 () Bool)

(assert (=> b!563346 (=> (not res!354505) (not e!324651))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35365 0))(
  ( (array!35366 (arr!16983 (Array (_ BitVec 32) (_ BitVec 64))) (size!17347 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35365)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35365 (_ BitVec 32)) Bool)

(assert (=> b!563346 (= res!354505 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17638 0))(
  ( (Unit!17639) )
))
(declare-fun lt!257191 () Unit!17638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17638)

(assert (=> b!563346 (= lt!257191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563347 () Bool)

(declare-fun res!354502 () Bool)

(assert (=> b!563347 (=> (not res!354502) (not e!324650))))

(assert (=> b!563347 (= res!354502 (validKeyInArray!0 (select (arr!16983 a!3118) j!142)))))

(declare-fun b!563348 () Bool)

(declare-fun res!354499 () Bool)

(declare-fun e!324647 () Bool)

(assert (=> b!563348 (=> (not res!354499) (not e!324647))))

(assert (=> b!563348 (= res!354499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563350 () Bool)

(declare-fun res!354498 () Bool)

(assert (=> b!563350 (=> (not res!354498) (not e!324650))))

(declare-fun arrayContainsKey!0 (array!35365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563350 (= res!354498 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563351 () Bool)

(assert (=> b!563351 (= e!324650 e!324647)))

(declare-fun res!354500 () Bool)

(assert (=> b!563351 (=> (not res!354500) (not e!324647))))

(declare-fun lt!257186 () SeekEntryResult!5432)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563351 (= res!354500 (or (= lt!257186 (MissingZero!5432 i!1132)) (= lt!257186 (MissingVacant!5432 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35365 (_ BitVec 32)) SeekEntryResult!5432)

(assert (=> b!563351 (= lt!257186 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563352 () Bool)

(declare-fun res!354504 () Bool)

(assert (=> b!563352 (=> (not res!354504) (not e!324647))))

(declare-datatypes ((List!11063 0))(
  ( (Nil!11060) (Cons!11059 (h!12062 (_ BitVec 64)) (t!17291 List!11063)) )
))
(declare-fun arrayNoDuplicates!0 (array!35365 (_ BitVec 32) List!11063) Bool)

(assert (=> b!563352 (= res!354504 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11060))))

(declare-fun res!354503 () Bool)

(assert (=> start!51500 (=> (not res!354503) (not e!324650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51500 (= res!354503 (validMask!0 mask!3119))))

(assert (=> start!51500 e!324650))

(assert (=> start!51500 true))

(declare-fun array_inv!12779 (array!35365) Bool)

(assert (=> start!51500 (array_inv!12779 a!3118)))

(declare-fun b!563349 () Bool)

(declare-fun res!354497 () Bool)

(assert (=> b!563349 (=> (not res!354497) (not e!324650))))

(assert (=> b!563349 (= res!354497 (and (= (size!17347 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17347 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17347 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563353 () Bool)

(assert (=> b!563353 (= e!324651 (= (seekEntryOrOpen!0 (select (arr!16983 a!3118) j!142) a!3118 mask!3119) (Found!5432 j!142)))))

(declare-fun b!563354 () Bool)

(assert (=> b!563354 (= e!324647 e!324649)))

(declare-fun res!354506 () Bool)

(assert (=> b!563354 (=> (not res!354506) (not e!324649))))

(declare-fun lt!257187 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35365 (_ BitVec 32)) SeekEntryResult!5432)

(assert (=> b!563354 (= res!354506 (= lt!257189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257187 (select (store (arr!16983 a!3118) i!1132 k!1914) j!142) (array!35366 (store (arr!16983 a!3118) i!1132 k!1914) (size!17347 a!3118)) mask!3119)))))

(declare-fun lt!257188 () (_ BitVec 32))

(assert (=> b!563354 (= lt!257189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257188 (select (arr!16983 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563354 (= lt!257187 (toIndex!0 (select (store (arr!16983 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563354 (= lt!257188 (toIndex!0 (select (arr!16983 a!3118) j!142) mask!3119))))

(assert (= (and start!51500 res!354503) b!563349))

(assert (= (and b!563349 res!354497) b!563347))

(assert (= (and b!563347 res!354502) b!563345))

(assert (= (and b!563345 res!354501) b!563350))

(assert (= (and b!563350 res!354498) b!563351))

(assert (= (and b!563351 res!354500) b!563348))

(assert (= (and b!563348 res!354499) b!563352))

(assert (= (and b!563352 res!354504) b!563354))

(assert (= (and b!563354 res!354506) b!563346))

(assert (= (and b!563346 res!354505) b!563353))

(declare-fun m!541671 () Bool)

(assert (=> b!563350 m!541671))

(declare-fun m!541673 () Bool)

(assert (=> b!563346 m!541673))

(declare-fun m!541675 () Bool)

(assert (=> b!563346 m!541675))

(declare-fun m!541677 () Bool)

(assert (=> b!563347 m!541677))

(assert (=> b!563347 m!541677))

(declare-fun m!541679 () Bool)

(assert (=> b!563347 m!541679))

(declare-fun m!541681 () Bool)

(assert (=> start!51500 m!541681))

(declare-fun m!541683 () Bool)

(assert (=> start!51500 m!541683))

(declare-fun m!541685 () Bool)

(assert (=> b!563351 m!541685))

(declare-fun m!541687 () Bool)

(assert (=> b!563352 m!541687))

(declare-fun m!541689 () Bool)

(assert (=> b!563345 m!541689))

(assert (=> b!563353 m!541677))

(assert (=> b!563353 m!541677))

(declare-fun m!541691 () Bool)

(assert (=> b!563353 m!541691))

(assert (=> b!563354 m!541677))

(declare-fun m!541693 () Bool)

(assert (=> b!563354 m!541693))

(assert (=> b!563354 m!541677))

(declare-fun m!541695 () Bool)

(assert (=> b!563354 m!541695))

(assert (=> b!563354 m!541677))

(declare-fun m!541697 () Bool)

(assert (=> b!563354 m!541697))

(assert (=> b!563354 m!541697))

(declare-fun m!541699 () Bool)

(assert (=> b!563354 m!541699))

(declare-fun m!541701 () Bool)

(assert (=> b!563354 m!541701))

(assert (=> b!563354 m!541697))

(declare-fun m!541703 () Bool)

(assert (=> b!563354 m!541703))

(declare-fun m!541705 () Bool)

(assert (=> b!563348 m!541705))

(push 1)

