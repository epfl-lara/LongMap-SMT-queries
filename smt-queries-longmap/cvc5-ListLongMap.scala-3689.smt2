; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50750 () Bool)

(assert start!50750)

(declare-fun b!555117 () Bool)

(declare-fun res!347532 () Bool)

(declare-fun e!319995 () Bool)

(assert (=> b!555117 (=> (not res!347532) (not e!319995))))

(declare-datatypes ((array!34975 0))(
  ( (array!34976 (arr!16797 (Array (_ BitVec 32) (_ BitVec 64))) (size!17161 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34975)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34975 (_ BitVec 32)) Bool)

(assert (=> b!555117 (= res!347532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555118 () Bool)

(declare-fun res!347531 () Bool)

(declare-fun e!319992 () Bool)

(assert (=> b!555118 (=> (not res!347531) (not e!319992))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555118 (= res!347531 (validKeyInArray!0 k!1914))))

(declare-fun b!555119 () Bool)

(declare-fun res!347533 () Bool)

(assert (=> b!555119 (=> (not res!347533) (not e!319995))))

(declare-datatypes ((List!10877 0))(
  ( (Nil!10874) (Cons!10873 (h!11858 (_ BitVec 64)) (t!17105 List!10877)) )
))
(declare-fun arrayNoDuplicates!0 (array!34975 (_ BitVec 32) List!10877) Bool)

(assert (=> b!555119 (= res!347533 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10874))))

(declare-fun b!555120 () Bool)

(declare-fun res!347537 () Bool)

(assert (=> b!555120 (=> (not res!347537) (not e!319992))))

(declare-fun arrayContainsKey!0 (array!34975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555120 (= res!347537 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555121 () Bool)

(declare-fun e!319993 () Bool)

(assert (=> b!555121 (= e!319995 e!319993)))

(declare-fun res!347536 () Bool)

(assert (=> b!555121 (=> (not res!347536) (not e!319993))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5246 0))(
  ( (MissingZero!5246 (index!23211 (_ BitVec 32))) (Found!5246 (index!23212 (_ BitVec 32))) (Intermediate!5246 (undefined!6058 Bool) (index!23213 (_ BitVec 32)) (x!52120 (_ BitVec 32))) (Undefined!5246) (MissingVacant!5246 (index!23214 (_ BitVec 32))) )
))
(declare-fun lt!252204 () SeekEntryResult!5246)

(declare-fun lt!252200 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34975 (_ BitVec 32)) SeekEntryResult!5246)

(assert (=> b!555121 (= res!347536 (= lt!252204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252200 (select (store (arr!16797 a!3118) i!1132 k!1914) j!142) (array!34976 (store (arr!16797 a!3118) i!1132 k!1914) (size!17161 a!3118)) mask!3119)))))

(declare-fun lt!252201 () (_ BitVec 32))

(assert (=> b!555121 (= lt!252204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252201 (select (arr!16797 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555121 (= lt!252200 (toIndex!0 (select (store (arr!16797 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555121 (= lt!252201 (toIndex!0 (select (arr!16797 a!3118) j!142) mask!3119))))

(declare-fun b!555122 () Bool)

(declare-fun res!347530 () Bool)

(assert (=> b!555122 (=> (not res!347530) (not e!319992))))

(assert (=> b!555122 (= res!347530 (validKeyInArray!0 (select (arr!16797 a!3118) j!142)))))

(declare-fun b!555123 () Bool)

(assert (=> b!555123 (= e!319993 (not true))))

(declare-fun lt!252205 () SeekEntryResult!5246)

(assert (=> b!555123 (and (= lt!252205 (Found!5246 j!142)) (or (undefined!6058 lt!252204) (not (is-Intermediate!5246 lt!252204)) (= (select (arr!16797 a!3118) (index!23213 lt!252204)) (select (arr!16797 a!3118) j!142)) (not (= (select (arr!16797 a!3118) (index!23213 lt!252204)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252205 (MissingZero!5246 (index!23213 lt!252204)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34975 (_ BitVec 32)) SeekEntryResult!5246)

(assert (=> b!555123 (= lt!252205 (seekEntryOrOpen!0 (select (arr!16797 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555123 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17266 0))(
  ( (Unit!17267) )
))
(declare-fun lt!252203 () Unit!17266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17266)

(assert (=> b!555123 (= lt!252203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!347529 () Bool)

(assert (=> start!50750 (=> (not res!347529) (not e!319992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50750 (= res!347529 (validMask!0 mask!3119))))

(assert (=> start!50750 e!319992))

(assert (=> start!50750 true))

(declare-fun array_inv!12593 (array!34975) Bool)

(assert (=> start!50750 (array_inv!12593 a!3118)))

(declare-fun b!555124 () Bool)

(declare-fun res!347535 () Bool)

(assert (=> b!555124 (=> (not res!347535) (not e!319992))))

(assert (=> b!555124 (= res!347535 (and (= (size!17161 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17161 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17161 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555125 () Bool)

(assert (=> b!555125 (= e!319992 e!319995)))

(declare-fun res!347534 () Bool)

(assert (=> b!555125 (=> (not res!347534) (not e!319995))))

(declare-fun lt!252202 () SeekEntryResult!5246)

(assert (=> b!555125 (= res!347534 (or (= lt!252202 (MissingZero!5246 i!1132)) (= lt!252202 (MissingVacant!5246 i!1132))))))

(assert (=> b!555125 (= lt!252202 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50750 res!347529) b!555124))

(assert (= (and b!555124 res!347535) b!555122))

(assert (= (and b!555122 res!347530) b!555118))

(assert (= (and b!555118 res!347531) b!555120))

(assert (= (and b!555120 res!347537) b!555125))

(assert (= (and b!555125 res!347534) b!555117))

(assert (= (and b!555117 res!347532) b!555119))

(assert (= (and b!555119 res!347533) b!555121))

(assert (= (and b!555121 res!347536) b!555123))

(declare-fun m!532671 () Bool)

(assert (=> b!555123 m!532671))

(declare-fun m!532673 () Bool)

(assert (=> b!555123 m!532673))

(declare-fun m!532675 () Bool)

(assert (=> b!555123 m!532675))

(declare-fun m!532677 () Bool)

(assert (=> b!555123 m!532677))

(assert (=> b!555123 m!532671))

(declare-fun m!532679 () Bool)

(assert (=> b!555123 m!532679))

(declare-fun m!532681 () Bool)

(assert (=> b!555119 m!532681))

(declare-fun m!532683 () Bool)

(assert (=> start!50750 m!532683))

(declare-fun m!532685 () Bool)

(assert (=> start!50750 m!532685))

(declare-fun m!532687 () Bool)

(assert (=> b!555118 m!532687))

(declare-fun m!532689 () Bool)

(assert (=> b!555117 m!532689))

(declare-fun m!532691 () Bool)

(assert (=> b!555125 m!532691))

(declare-fun m!532693 () Bool)

(assert (=> b!555120 m!532693))

(assert (=> b!555122 m!532671))

(assert (=> b!555122 m!532671))

(declare-fun m!532695 () Bool)

(assert (=> b!555122 m!532695))

(assert (=> b!555121 m!532671))

(declare-fun m!532697 () Bool)

(assert (=> b!555121 m!532697))

(declare-fun m!532699 () Bool)

(assert (=> b!555121 m!532699))

(declare-fun m!532701 () Bool)

(assert (=> b!555121 m!532701))

(assert (=> b!555121 m!532671))

(declare-fun m!532703 () Bool)

(assert (=> b!555121 m!532703))

(assert (=> b!555121 m!532671))

(assert (=> b!555121 m!532699))

(declare-fun m!532705 () Bool)

(assert (=> b!555121 m!532705))

(assert (=> b!555121 m!532699))

(declare-fun m!532707 () Bool)

(assert (=> b!555121 m!532707))

(push 1)

