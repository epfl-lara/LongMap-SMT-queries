; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51602 () Bool)

(assert start!51602)

(declare-fun b!564684 () Bool)

(declare-fun res!355842 () Bool)

(declare-fun e!325212 () Bool)

(assert (=> b!564684 (=> (not res!355842) (not e!325212))))

(declare-datatypes ((array!35467 0))(
  ( (array!35468 (arr!17034 (Array (_ BitVec 32) (_ BitVec 64))) (size!17398 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35467)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35467 (_ BitVec 32)) Bool)

(assert (=> b!564684 (= res!355842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564685 () Bool)

(declare-fun res!355840 () Bool)

(declare-fun e!325210 () Bool)

(assert (=> b!564685 (=> (not res!355840) (not e!325210))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564685 (= res!355840 (validKeyInArray!0 k!1914))))

(declare-fun b!564686 () Bool)

(declare-fun res!355841 () Bool)

(assert (=> b!564686 (=> (not res!355841) (not e!325212))))

(declare-datatypes ((List!11114 0))(
  ( (Nil!11111) (Cons!11110 (h!12113 (_ BitVec 64)) (t!17342 List!11114)) )
))
(declare-fun arrayNoDuplicates!0 (array!35467 (_ BitVec 32) List!11114) Bool)

(assert (=> b!564686 (= res!355841 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11111))))

(declare-fun b!564687 () Bool)

(declare-fun res!355836 () Bool)

(assert (=> b!564687 (=> (not res!355836) (not e!325212))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5483 0))(
  ( (MissingZero!5483 (index!24159 (_ BitVec 32))) (Found!5483 (index!24160 (_ BitVec 32))) (Intermediate!5483 (undefined!6295 Bool) (index!24161 (_ BitVec 32)) (x!53034 (_ BitVec 32))) (Undefined!5483) (MissingVacant!5483 (index!24162 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35467 (_ BitVec 32)) SeekEntryResult!5483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564687 (= res!355836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17034 a!3118) j!142) mask!3119) (select (arr!17034 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17034 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17034 a!3118) i!1132 k!1914) j!142) (array!35468 (store (arr!17034 a!3118) i!1132 k!1914) (size!17398 a!3118)) mask!3119)))))

(declare-fun b!564688 () Bool)

(declare-fun res!355837 () Bool)

(assert (=> b!564688 (=> (not res!355837) (not e!325210))))

(assert (=> b!564688 (= res!355837 (validKeyInArray!0 (select (arr!17034 a!3118) j!142)))))

(declare-fun b!564689 () Bool)

(assert (=> b!564689 (= e!325210 e!325212)))

(declare-fun res!355843 () Bool)

(assert (=> b!564689 (=> (not res!355843) (not e!325212))))

(declare-fun lt!257644 () SeekEntryResult!5483)

(assert (=> b!564689 (= res!355843 (or (= lt!257644 (MissingZero!5483 i!1132)) (= lt!257644 (MissingVacant!5483 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35467 (_ BitVec 32)) SeekEntryResult!5483)

(assert (=> b!564689 (= lt!257644 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564690 () Bool)

(declare-fun res!355838 () Bool)

(assert (=> b!564690 (=> (not res!355838) (not e!325210))))

(assert (=> b!564690 (= res!355838 (and (= (size!17398 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17398 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17398 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564691 () Bool)

(assert (=> b!564691 (= e!325212 (bvsgt #b00000000000000000000000000000000 (size!17398 a!3118)))))

(declare-fun res!355844 () Bool)

(assert (=> start!51602 (=> (not res!355844) (not e!325210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51602 (= res!355844 (validMask!0 mask!3119))))

(assert (=> start!51602 e!325210))

(assert (=> start!51602 true))

(declare-fun array_inv!12830 (array!35467) Bool)

(assert (=> start!51602 (array_inv!12830 a!3118)))

(declare-fun b!564692 () Bool)

(declare-fun res!355839 () Bool)

(assert (=> b!564692 (=> (not res!355839) (not e!325210))))

(declare-fun arrayContainsKey!0 (array!35467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564692 (= res!355839 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51602 res!355844) b!564690))

(assert (= (and b!564690 res!355838) b!564688))

(assert (= (and b!564688 res!355837) b!564685))

(assert (= (and b!564685 res!355840) b!564692))

(assert (= (and b!564692 res!355839) b!564689))

(assert (= (and b!564689 res!355843) b!564684))

(assert (= (and b!564684 res!355842) b!564686))

(assert (= (and b!564686 res!355841) b!564687))

(assert (= (and b!564687 res!355836) b!564691))

(declare-fun m!543141 () Bool)

(assert (=> b!564686 m!543141))

(declare-fun m!543143 () Bool)

(assert (=> start!51602 m!543143))

(declare-fun m!543145 () Bool)

(assert (=> start!51602 m!543145))

(declare-fun m!543147 () Bool)

(assert (=> b!564692 m!543147))

(declare-fun m!543149 () Bool)

(assert (=> b!564685 m!543149))

(declare-fun m!543151 () Bool)

(assert (=> b!564687 m!543151))

(declare-fun m!543153 () Bool)

(assert (=> b!564687 m!543153))

(assert (=> b!564687 m!543151))

(declare-fun m!543155 () Bool)

(assert (=> b!564687 m!543155))

(declare-fun m!543157 () Bool)

(assert (=> b!564687 m!543157))

(assert (=> b!564687 m!543155))

(declare-fun m!543159 () Bool)

(assert (=> b!564687 m!543159))

(assert (=> b!564687 m!543153))

(assert (=> b!564687 m!543151))

(declare-fun m!543161 () Bool)

(assert (=> b!564687 m!543161))

(declare-fun m!543163 () Bool)

(assert (=> b!564687 m!543163))

(assert (=> b!564687 m!543155))

(assert (=> b!564687 m!543157))

(assert (=> b!564688 m!543151))

(assert (=> b!564688 m!543151))

(declare-fun m!543165 () Bool)

(assert (=> b!564688 m!543165))

(declare-fun m!543167 () Bool)

(assert (=> b!564684 m!543167))

(declare-fun m!543169 () Bool)

(assert (=> b!564689 m!543169))

(push 1)

