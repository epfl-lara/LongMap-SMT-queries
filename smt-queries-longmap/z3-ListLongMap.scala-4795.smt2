; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65832 () Bool)

(assert start!65832)

(declare-fun b!758117 () Bool)

(declare-fun res!512832 () Bool)

(declare-fun e!422675 () Bool)

(assert (=> b!758117 (=> (not res!512832) (not e!422675))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42005 0))(
  ( (array!42006 (arr!20116 (Array (_ BitVec 32) (_ BitVec 64))) (size!20537 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42005)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758117 (= res!512832 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20537 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20537 a!3186))))))

(declare-fun b!758118 () Bool)

(declare-fun e!422679 () Bool)

(assert (=> b!758118 (= e!422679 e!422675)))

(declare-fun res!512842 () Bool)

(assert (=> b!758118 (=> (not res!512842) (not e!422675))))

(declare-datatypes ((SeekEntryResult!7716 0))(
  ( (MissingZero!7716 (index!33232 (_ BitVec 32))) (Found!7716 (index!33233 (_ BitVec 32))) (Intermediate!7716 (undefined!8528 Bool) (index!33234 (_ BitVec 32)) (x!64122 (_ BitVec 32))) (Undefined!7716) (MissingVacant!7716 (index!33235 (_ BitVec 32))) )
))
(declare-fun lt!337666 () SeekEntryResult!7716)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758118 (= res!512842 (or (= lt!337666 (MissingZero!7716 i!1173)) (= lt!337666 (MissingVacant!7716 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42005 (_ BitVec 32)) SeekEntryResult!7716)

(assert (=> b!758118 (= lt!337666 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!758119 () Bool)

(declare-fun lt!337663 () SeekEntryResult!7716)

(declare-fun e!422676 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42005 (_ BitVec 32)) SeekEntryResult!7716)

(assert (=> b!758119 (= e!422676 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!337663))))

(declare-fun b!758121 () Bool)

(declare-fun res!512841 () Bool)

(declare-fun e!422677 () Bool)

(assert (=> b!758121 (=> (not res!512841) (not e!422677))))

(declare-fun e!422670 () Bool)

(assert (=> b!758121 (= res!512841 e!422670)))

(declare-fun c!83026 () Bool)

(assert (=> b!758121 (= c!83026 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758122 () Bool)

(declare-fun res!512837 () Bool)

(assert (=> b!758122 (=> (not res!512837) (not e!422677))))

(assert (=> b!758122 (= res!512837 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20116 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758123 () Bool)

(declare-fun res!512840 () Bool)

(assert (=> b!758123 (=> (not res!512840) (not e!422675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42005 (_ BitVec 32)) Bool)

(assert (=> b!758123 (= res!512840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758124 () Bool)

(declare-fun e!422671 () Bool)

(assert (=> b!758124 (= e!422677 e!422671)))

(declare-fun res!512834 () Bool)

(assert (=> b!758124 (=> (not res!512834) (not e!422671))))

(declare-fun lt!337673 () SeekEntryResult!7716)

(declare-fun lt!337665 () SeekEntryResult!7716)

(assert (=> b!758124 (= res!512834 (= lt!337673 lt!337665))))

(declare-fun lt!337662 () (_ BitVec 64))

(declare-fun lt!337671 () array!42005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42005 (_ BitVec 32)) SeekEntryResult!7716)

(assert (=> b!758124 (= lt!337665 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337662 lt!337671 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758124 (= lt!337673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337662 mask!3328) lt!337662 lt!337671 mask!3328))))

(assert (=> b!758124 (= lt!337662 (select (store (arr!20116 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758124 (= lt!337671 (array!42006 (store (arr!20116 a!3186) i!1173 k0!2102) (size!20537 a!3186)))))

(declare-fun b!758125 () Bool)

(declare-fun res!512845 () Bool)

(assert (=> b!758125 (=> (not res!512845) (not e!422675))))

(declare-datatypes ((List!14118 0))(
  ( (Nil!14115) (Cons!14114 (h!15186 (_ BitVec 64)) (t!20433 List!14118)) )
))
(declare-fun arrayNoDuplicates!0 (array!42005 (_ BitVec 32) List!14118) Bool)

(assert (=> b!758125 (= res!512845 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14115))))

(declare-fun b!758126 () Bool)

(declare-datatypes ((Unit!26244 0))(
  ( (Unit!26245) )
))
(declare-fun e!422674 () Unit!26244)

(declare-fun Unit!26246 () Unit!26244)

(assert (=> b!758126 (= e!422674 Unit!26246)))

(declare-fun b!758127 () Bool)

(declare-fun e!422672 () Bool)

(assert (=> b!758127 (= e!422672 true)))

(declare-fun e!422673 () Bool)

(assert (=> b!758127 e!422673))

(declare-fun res!512839 () Bool)

(assert (=> b!758127 (=> (not res!512839) (not e!422673))))

(declare-fun lt!337672 () (_ BitVec 64))

(assert (=> b!758127 (= res!512839 (= lt!337672 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337669 () Unit!26244)

(assert (=> b!758127 (= lt!337669 e!422674)))

(declare-fun c!83025 () Bool)

(assert (=> b!758127 (= c!83025 (= lt!337672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758128 () Bool)

(declare-fun res!512844 () Bool)

(assert (=> b!758128 (=> (not res!512844) (not e!422673))))

(assert (=> b!758128 (= res!512844 (= (seekEntryOrOpen!0 lt!337662 lt!337671 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337662 lt!337671 mask!3328)))))

(declare-fun b!758129 () Bool)

(assert (=> b!758129 (= e!422670 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) (Found!7716 j!159)))))

(declare-fun b!758130 () Bool)

(declare-fun lt!337668 () SeekEntryResult!7716)

(assert (=> b!758130 (= e!422670 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!337668))))

(declare-fun b!758131 () Bool)

(declare-fun res!512836 () Bool)

(assert (=> b!758131 (=> (not res!512836) (not e!422679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758131 (= res!512836 (validKeyInArray!0 k0!2102))))

(declare-fun b!758120 () Bool)

(declare-fun res!512829 () Bool)

(assert (=> b!758120 (=> (not res!512829) (not e!422679))))

(declare-fun arrayContainsKey!0 (array!42005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758120 (= res!512829 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!512835 () Bool)

(assert (=> start!65832 (=> (not res!512835) (not e!422679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65832 (= res!512835 (validMask!0 mask!3328))))

(assert (=> start!65832 e!422679))

(assert (=> start!65832 true))

(declare-fun array_inv!15912 (array!42005) Bool)

(assert (=> start!65832 (array_inv!15912 a!3186)))

(declare-fun b!758132 () Bool)

(declare-fun res!512846 () Bool)

(assert (=> b!758132 (=> (not res!512846) (not e!422679))))

(assert (=> b!758132 (= res!512846 (and (= (size!20537 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20537 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20537 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758133 () Bool)

(declare-fun e!422680 () Bool)

(assert (=> b!758133 (= e!422680 e!422672)))

(declare-fun res!512838 () Bool)

(assert (=> b!758133 (=> res!512838 e!422672)))

(assert (=> b!758133 (= res!512838 (= lt!337672 lt!337662))))

(assert (=> b!758133 (= lt!337672 (select (store (arr!20116 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758134 () Bool)

(declare-fun lt!337664 () SeekEntryResult!7716)

(declare-fun lt!337667 () SeekEntryResult!7716)

(assert (=> b!758134 (= e!422673 (= lt!337664 lt!337667))))

(declare-fun b!758135 () Bool)

(declare-fun res!512843 () Bool)

(assert (=> b!758135 (=> (not res!512843) (not e!422679))))

(assert (=> b!758135 (= res!512843 (validKeyInArray!0 (select (arr!20116 a!3186) j!159)))))

(declare-fun b!758136 () Bool)

(declare-fun Unit!26247 () Unit!26244)

(assert (=> b!758136 (= e!422674 Unit!26247)))

(assert (=> b!758136 false))

(declare-fun b!758137 () Bool)

(assert (=> b!758137 (= e!422675 e!422677)))

(declare-fun res!512833 () Bool)

(assert (=> b!758137 (=> (not res!512833) (not e!422677))))

(assert (=> b!758137 (= res!512833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20116 a!3186) j!159) mask!3328) (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!337668))))

(assert (=> b!758137 (= lt!337668 (Intermediate!7716 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758138 () Bool)

(declare-fun e!422681 () Bool)

(assert (=> b!758138 (= e!422671 (not e!422681))))

(declare-fun res!512828 () Bool)

(assert (=> b!758138 (=> res!512828 e!422681)))

(get-info :version)

(assert (=> b!758138 (= res!512828 (or (not ((_ is Intermediate!7716) lt!337665)) (bvslt x!1131 (x!64122 lt!337665)) (not (= x!1131 (x!64122 lt!337665))) (not (= index!1321 (index!33234 lt!337665)))))))

(assert (=> b!758138 e!422676))

(declare-fun res!512831 () Bool)

(assert (=> b!758138 (=> (not res!512831) (not e!422676))))

(assert (=> b!758138 (= res!512831 (= lt!337664 lt!337663))))

(assert (=> b!758138 (= lt!337663 (Found!7716 j!159))))

(assert (=> b!758138 (= lt!337664 (seekEntryOrOpen!0 (select (arr!20116 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758138 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337670 () Unit!26244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26244)

(assert (=> b!758138 (= lt!337670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758139 () Bool)

(assert (=> b!758139 (= e!422681 e!422680)))

(declare-fun res!512830 () Bool)

(assert (=> b!758139 (=> res!512830 e!422680)))

(assert (=> b!758139 (= res!512830 (not (= lt!337667 lt!337663)))))

(assert (=> b!758139 (= lt!337667 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65832 res!512835) b!758132))

(assert (= (and b!758132 res!512846) b!758135))

(assert (= (and b!758135 res!512843) b!758131))

(assert (= (and b!758131 res!512836) b!758120))

(assert (= (and b!758120 res!512829) b!758118))

(assert (= (and b!758118 res!512842) b!758123))

(assert (= (and b!758123 res!512840) b!758125))

(assert (= (and b!758125 res!512845) b!758117))

(assert (= (and b!758117 res!512832) b!758137))

(assert (= (and b!758137 res!512833) b!758122))

(assert (= (and b!758122 res!512837) b!758121))

(assert (= (and b!758121 c!83026) b!758130))

(assert (= (and b!758121 (not c!83026)) b!758129))

(assert (= (and b!758121 res!512841) b!758124))

(assert (= (and b!758124 res!512834) b!758138))

(assert (= (and b!758138 res!512831) b!758119))

(assert (= (and b!758138 (not res!512828)) b!758139))

(assert (= (and b!758139 (not res!512830)) b!758133))

(assert (= (and b!758133 (not res!512838)) b!758127))

(assert (= (and b!758127 c!83025) b!758136))

(assert (= (and b!758127 (not c!83025)) b!758126))

(assert (= (and b!758127 res!512839) b!758128))

(assert (= (and b!758128 res!512844) b!758134))

(declare-fun m!705659 () Bool)

(assert (=> b!758123 m!705659))

(declare-fun m!705661 () Bool)

(assert (=> b!758139 m!705661))

(assert (=> b!758139 m!705661))

(declare-fun m!705663 () Bool)

(assert (=> b!758139 m!705663))

(declare-fun m!705665 () Bool)

(assert (=> b!758118 m!705665))

(declare-fun m!705667 () Bool)

(assert (=> b!758125 m!705667))

(assert (=> b!758119 m!705661))

(assert (=> b!758119 m!705661))

(declare-fun m!705669 () Bool)

(assert (=> b!758119 m!705669))

(declare-fun m!705671 () Bool)

(assert (=> b!758124 m!705671))

(declare-fun m!705673 () Bool)

(assert (=> b!758124 m!705673))

(declare-fun m!705675 () Bool)

(assert (=> b!758124 m!705675))

(assert (=> b!758124 m!705673))

(declare-fun m!705677 () Bool)

(assert (=> b!758124 m!705677))

(declare-fun m!705679 () Bool)

(assert (=> b!758124 m!705679))

(assert (=> b!758138 m!705661))

(assert (=> b!758138 m!705661))

(declare-fun m!705681 () Bool)

(assert (=> b!758138 m!705681))

(declare-fun m!705683 () Bool)

(assert (=> b!758138 m!705683))

(declare-fun m!705685 () Bool)

(assert (=> b!758138 m!705685))

(declare-fun m!705687 () Bool)

(assert (=> b!758122 m!705687))

(declare-fun m!705689 () Bool)

(assert (=> b!758120 m!705689))

(assert (=> b!758133 m!705675))

(declare-fun m!705691 () Bool)

(assert (=> b!758133 m!705691))

(declare-fun m!705693 () Bool)

(assert (=> b!758131 m!705693))

(assert (=> b!758130 m!705661))

(assert (=> b!758130 m!705661))

(declare-fun m!705695 () Bool)

(assert (=> b!758130 m!705695))

(assert (=> b!758135 m!705661))

(assert (=> b!758135 m!705661))

(declare-fun m!705697 () Bool)

(assert (=> b!758135 m!705697))

(assert (=> b!758129 m!705661))

(assert (=> b!758129 m!705661))

(assert (=> b!758129 m!705663))

(assert (=> b!758137 m!705661))

(assert (=> b!758137 m!705661))

(declare-fun m!705699 () Bool)

(assert (=> b!758137 m!705699))

(assert (=> b!758137 m!705699))

(assert (=> b!758137 m!705661))

(declare-fun m!705701 () Bool)

(assert (=> b!758137 m!705701))

(declare-fun m!705703 () Bool)

(assert (=> b!758128 m!705703))

(declare-fun m!705705 () Bool)

(assert (=> b!758128 m!705705))

(declare-fun m!705707 () Bool)

(assert (=> start!65832 m!705707))

(declare-fun m!705709 () Bool)

(assert (=> start!65832 m!705709))

(check-sat (not b!758125) (not start!65832) (not b!758119) (not b!758138) (not b!758124) (not b!758135) (not b!758137) (not b!758118) (not b!758129) (not b!758128) (not b!758139) (not b!758123) (not b!758120) (not b!758131) (not b!758130))
(check-sat)
