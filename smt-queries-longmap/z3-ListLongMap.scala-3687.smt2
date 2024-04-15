; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50726 () Bool)

(assert start!50726)

(declare-fun b!554684 () Bool)

(declare-fun res!347243 () Bool)

(declare-fun e!319749 () Bool)

(assert (=> b!554684 (=> (not res!347243) (not e!319749))))

(declare-datatypes ((array!34960 0))(
  ( (array!34961 (arr!16790 (Array (_ BitVec 32) (_ BitVec 64))) (size!17155 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34960)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554684 (= res!347243 (validKeyInArray!0 (select (arr!16790 a!3118) j!142)))))

(declare-fun b!554685 () Bool)

(declare-fun e!319746 () Bool)

(assert (=> b!554685 (= e!319746 (not true))))

(declare-datatypes ((SeekEntryResult!5236 0))(
  ( (MissingZero!5236 (index!23171 (_ BitVec 32))) (Found!5236 (index!23172 (_ BitVec 32))) (Intermediate!5236 (undefined!6048 Bool) (index!23173 (_ BitVec 32)) (x!52089 (_ BitVec 32))) (Undefined!5236) (MissingVacant!5236 (index!23174 (_ BitVec 32))) )
))
(declare-fun lt!251858 () SeekEntryResult!5236)

(declare-fun lt!251859 () SeekEntryResult!5236)

(get-info :version)

(assert (=> b!554685 (and (= lt!251859 (Found!5236 j!142)) (or (undefined!6048 lt!251858) (not ((_ is Intermediate!5236) lt!251858)) (= (select (arr!16790 a!3118) (index!23173 lt!251858)) (select (arr!16790 a!3118) j!142)) (not (= (select (arr!16790 a!3118) (index!23173 lt!251858)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251859 (MissingZero!5236 (index!23173 lt!251858)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34960 (_ BitVec 32)) SeekEntryResult!5236)

(assert (=> b!554685 (= lt!251859 (seekEntryOrOpen!0 (select (arr!16790 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34960 (_ BitVec 32)) Bool)

(assert (=> b!554685 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17232 0))(
  ( (Unit!17233) )
))
(declare-fun lt!251862 () Unit!17232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17232)

(assert (=> b!554685 (= lt!251862 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554686 () Bool)

(declare-fun res!347240 () Bool)

(declare-fun e!319748 () Bool)

(assert (=> b!554686 (=> (not res!347240) (not e!319748))))

(declare-datatypes ((List!10909 0))(
  ( (Nil!10906) (Cons!10905 (h!11890 (_ BitVec 64)) (t!17128 List!10909)) )
))
(declare-fun arrayNoDuplicates!0 (array!34960 (_ BitVec 32) List!10909) Bool)

(assert (=> b!554686 (= res!347240 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10906))))

(declare-fun res!347245 () Bool)

(assert (=> start!50726 (=> (not res!347245) (not e!319749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50726 (= res!347245 (validMask!0 mask!3119))))

(assert (=> start!50726 e!319749))

(assert (=> start!50726 true))

(declare-fun array_inv!12673 (array!34960) Bool)

(assert (=> start!50726 (array_inv!12673 a!3118)))

(declare-fun b!554687 () Bool)

(assert (=> b!554687 (= e!319749 e!319748)))

(declare-fun res!347238 () Bool)

(assert (=> b!554687 (=> (not res!347238) (not e!319748))))

(declare-fun lt!251861 () SeekEntryResult!5236)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554687 (= res!347238 (or (= lt!251861 (MissingZero!5236 i!1132)) (= lt!251861 (MissingVacant!5236 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!554687 (= lt!251861 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554688 () Bool)

(declare-fun res!347244 () Bool)

(assert (=> b!554688 (=> (not res!347244) (not e!319749))))

(assert (=> b!554688 (= res!347244 (validKeyInArray!0 k0!1914))))

(declare-fun b!554689 () Bool)

(declare-fun res!347246 () Bool)

(assert (=> b!554689 (=> (not res!347246) (not e!319749))))

(declare-fun arrayContainsKey!0 (array!34960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554689 (= res!347246 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554690 () Bool)

(declare-fun res!347239 () Bool)

(assert (=> b!554690 (=> (not res!347239) (not e!319749))))

(assert (=> b!554690 (= res!347239 (and (= (size!17155 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17155 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17155 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554691 () Bool)

(declare-fun res!347241 () Bool)

(assert (=> b!554691 (=> (not res!347241) (not e!319748))))

(assert (=> b!554691 (= res!347241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554692 () Bool)

(assert (=> b!554692 (= e!319748 e!319746)))

(declare-fun res!347242 () Bool)

(assert (=> b!554692 (=> (not res!347242) (not e!319746))))

(declare-fun lt!251863 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34960 (_ BitVec 32)) SeekEntryResult!5236)

(assert (=> b!554692 (= res!347242 (= lt!251858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251863 (select (store (arr!16790 a!3118) i!1132 k0!1914) j!142) (array!34961 (store (arr!16790 a!3118) i!1132 k0!1914) (size!17155 a!3118)) mask!3119)))))

(declare-fun lt!251860 () (_ BitVec 32))

(assert (=> b!554692 (= lt!251858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251860 (select (arr!16790 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554692 (= lt!251863 (toIndex!0 (select (store (arr!16790 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554692 (= lt!251860 (toIndex!0 (select (arr!16790 a!3118) j!142) mask!3119))))

(assert (= (and start!50726 res!347245) b!554690))

(assert (= (and b!554690 res!347239) b!554684))

(assert (= (and b!554684 res!347243) b!554688))

(assert (= (and b!554688 res!347244) b!554689))

(assert (= (and b!554689 res!347246) b!554687))

(assert (= (and b!554687 res!347238) b!554691))

(assert (= (and b!554691 res!347241) b!554686))

(assert (= (and b!554686 res!347240) b!554692))

(assert (= (and b!554692 res!347242) b!554685))

(declare-fun m!531671 () Bool)

(assert (=> b!554686 m!531671))

(declare-fun m!531673 () Bool)

(assert (=> b!554685 m!531673))

(declare-fun m!531675 () Bool)

(assert (=> b!554685 m!531675))

(declare-fun m!531677 () Bool)

(assert (=> b!554685 m!531677))

(declare-fun m!531679 () Bool)

(assert (=> b!554685 m!531679))

(assert (=> b!554685 m!531675))

(declare-fun m!531681 () Bool)

(assert (=> b!554685 m!531681))

(declare-fun m!531683 () Bool)

(assert (=> b!554687 m!531683))

(declare-fun m!531685 () Bool)

(assert (=> b!554689 m!531685))

(declare-fun m!531687 () Bool)

(assert (=> start!50726 m!531687))

(declare-fun m!531689 () Bool)

(assert (=> start!50726 m!531689))

(declare-fun m!531691 () Bool)

(assert (=> b!554688 m!531691))

(assert (=> b!554684 m!531675))

(assert (=> b!554684 m!531675))

(declare-fun m!531693 () Bool)

(assert (=> b!554684 m!531693))

(declare-fun m!531695 () Bool)

(assert (=> b!554691 m!531695))

(assert (=> b!554692 m!531675))

(declare-fun m!531697 () Bool)

(assert (=> b!554692 m!531697))

(assert (=> b!554692 m!531675))

(declare-fun m!531699 () Bool)

(assert (=> b!554692 m!531699))

(declare-fun m!531701 () Bool)

(assert (=> b!554692 m!531701))

(assert (=> b!554692 m!531699))

(declare-fun m!531703 () Bool)

(assert (=> b!554692 m!531703))

(assert (=> b!554692 m!531675))

(declare-fun m!531705 () Bool)

(assert (=> b!554692 m!531705))

(assert (=> b!554692 m!531699))

(declare-fun m!531707 () Bool)

(assert (=> b!554692 m!531707))

(check-sat (not b!554692) (not b!554689) (not b!554686) (not b!554687) (not start!50726) (not b!554685) (not b!554684) (not b!554688) (not b!554691))
(check-sat)
