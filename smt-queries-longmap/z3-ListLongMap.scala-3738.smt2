; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51410 () Bool)

(assert start!51410)

(declare-fun b!561649 () Bool)

(declare-fun e!323642 () Bool)

(assert (=> b!561649 (= e!323642 (not true))))

(declare-fun e!323646 () Bool)

(assert (=> b!561649 e!323646))

(declare-fun res!352952 () Bool)

(assert (=> b!561649 (=> (not res!352952) (not e!323646))))

(declare-datatypes ((SeekEntryResult!5389 0))(
  ( (MissingZero!5389 (index!23783 (_ BitVec 32))) (Found!5389 (index!23784 (_ BitVec 32))) (Intermediate!5389 (undefined!6201 Bool) (index!23785 (_ BitVec 32)) (x!52695 (_ BitVec 32))) (Undefined!5389) (MissingVacant!5389 (index!23786 (_ BitVec 32))) )
))
(declare-fun lt!255615 () SeekEntryResult!5389)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561649 (= res!352952 (= lt!255615 (Found!5389 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35284 0))(
  ( (array!35285 (arr!16943 (Array (_ BitVec 32) (_ BitVec 64))) (size!17308 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35284)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35284 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561649 (= lt!255615 (seekEntryOrOpen!0 (select (arr!16943 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35284 (_ BitVec 32)) Bool)

(assert (=> b!561649 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17538 0))(
  ( (Unit!17539) )
))
(declare-fun lt!255614 () Unit!17538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17538)

(assert (=> b!561649 (= lt!255614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561650 () Bool)

(declare-fun e!323647 () Bool)

(declare-fun e!323644 () Bool)

(assert (=> b!561650 (= e!323647 e!323644)))

(declare-fun res!352945 () Bool)

(assert (=> b!561650 (=> res!352945 e!323644)))

(declare-fun lt!255610 () (_ BitVec 64))

(assert (=> b!561650 (= res!352945 (or (= lt!255610 (select (arr!16943 a!3118) j!142)) (= lt!255610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!255613 () SeekEntryResult!5389)

(assert (=> b!561650 (= lt!255610 (select (arr!16943 a!3118) (index!23785 lt!255613)))))

(declare-fun b!561651 () Bool)

(declare-fun e!323643 () Bool)

(declare-fun lt!255611 () array!35284)

(declare-fun lt!255612 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35284 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561651 (= e!323643 (= (seekEntryOrOpen!0 lt!255612 lt!255611 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52695 lt!255613) (index!23785 lt!255613) (index!23785 lt!255613) lt!255612 lt!255611 mask!3119)))))

(declare-fun res!352954 () Bool)

(declare-fun e!323649 () Bool)

(assert (=> start!51410 (=> (not res!352954) (not e!323649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51410 (= res!352954 (validMask!0 mask!3119))))

(assert (=> start!51410 e!323649))

(assert (=> start!51410 true))

(declare-fun array_inv!12826 (array!35284) Bool)

(assert (=> start!51410 (array_inv!12826 a!3118)))

(declare-fun b!561652 () Bool)

(declare-fun e!323648 () Bool)

(assert (=> b!561652 (= e!323649 e!323648)))

(declare-fun res!352944 () Bool)

(assert (=> b!561652 (=> (not res!352944) (not e!323648))))

(declare-fun lt!255608 () SeekEntryResult!5389)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561652 (= res!352944 (or (= lt!255608 (MissingZero!5389 i!1132)) (= lt!255608 (MissingVacant!5389 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!561652 (= lt!255608 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561653 () Bool)

(declare-fun res!352949 () Bool)

(assert (=> b!561653 (=> (not res!352949) (not e!323649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561653 (= res!352949 (validKeyInArray!0 (select (arr!16943 a!3118) j!142)))))

(declare-fun b!561654 () Bool)

(declare-fun res!352943 () Bool)

(assert (=> b!561654 (=> (not res!352943) (not e!323649))))

(assert (=> b!561654 (= res!352943 (validKeyInArray!0 k0!1914))))

(declare-fun b!561655 () Bool)

(declare-fun res!352946 () Bool)

(assert (=> b!561655 (=> (not res!352946) (not e!323649))))

(declare-fun arrayContainsKey!0 (array!35284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561655 (= res!352946 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561656 () Bool)

(declare-fun res!352947 () Bool)

(assert (=> b!561656 (=> (not res!352947) (not e!323648))))

(assert (=> b!561656 (= res!352947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561657 () Bool)

(declare-fun res!352948 () Bool)

(assert (=> b!561657 (=> (not res!352948) (not e!323649))))

(assert (=> b!561657 (= res!352948 (and (= (size!17308 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17308 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17308 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561658 () Bool)

(assert (=> b!561658 (= e!323646 e!323647)))

(declare-fun res!352955 () Bool)

(assert (=> b!561658 (=> res!352955 e!323647)))

(get-info :version)

(assert (=> b!561658 (= res!352955 (or (undefined!6201 lt!255613) (not ((_ is Intermediate!5389) lt!255613))))))

(declare-fun b!561659 () Bool)

(assert (=> b!561659 (= e!323644 e!323643)))

(declare-fun res!352951 () Bool)

(assert (=> b!561659 (=> (not res!352951) (not e!323643))))

(assert (=> b!561659 (= res!352951 (= lt!255615 (seekKeyOrZeroReturnVacant!0 (x!52695 lt!255613) (index!23785 lt!255613) (index!23785 lt!255613) (select (arr!16943 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561660 () Bool)

(assert (=> b!561660 (= e!323648 e!323642)))

(declare-fun res!352950 () Bool)

(assert (=> b!561660 (=> (not res!352950) (not e!323642))))

(declare-fun lt!255616 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35284 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!561660 (= res!352950 (= lt!255613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255616 lt!255612 lt!255611 mask!3119)))))

(declare-fun lt!255609 () (_ BitVec 32))

(assert (=> b!561660 (= lt!255613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255609 (select (arr!16943 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561660 (= lt!255616 (toIndex!0 lt!255612 mask!3119))))

(assert (=> b!561660 (= lt!255612 (select (store (arr!16943 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561660 (= lt!255609 (toIndex!0 (select (arr!16943 a!3118) j!142) mask!3119))))

(assert (=> b!561660 (= lt!255611 (array!35285 (store (arr!16943 a!3118) i!1132 k0!1914) (size!17308 a!3118)))))

(declare-fun b!561661 () Bool)

(declare-fun res!352953 () Bool)

(assert (=> b!561661 (=> (not res!352953) (not e!323648))))

(declare-datatypes ((List!11062 0))(
  ( (Nil!11059) (Cons!11058 (h!12061 (_ BitVec 64)) (t!17281 List!11062)) )
))
(declare-fun arrayNoDuplicates!0 (array!35284 (_ BitVec 32) List!11062) Bool)

(assert (=> b!561661 (= res!352953 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11059))))

(assert (= (and start!51410 res!352954) b!561657))

(assert (= (and b!561657 res!352948) b!561653))

(assert (= (and b!561653 res!352949) b!561654))

(assert (= (and b!561654 res!352943) b!561655))

(assert (= (and b!561655 res!352946) b!561652))

(assert (= (and b!561652 res!352944) b!561656))

(assert (= (and b!561656 res!352947) b!561661))

(assert (= (and b!561661 res!352953) b!561660))

(assert (= (and b!561660 res!352950) b!561649))

(assert (= (and b!561649 res!352952) b!561658))

(assert (= (and b!561658 (not res!352955)) b!561650))

(assert (= (and b!561650 (not res!352945)) b!561659))

(assert (= (and b!561659 res!352951) b!561651))

(declare-fun m!539105 () Bool)

(assert (=> b!561661 m!539105))

(declare-fun m!539107 () Bool)

(assert (=> b!561656 m!539107))

(declare-fun m!539109 () Bool)

(assert (=> b!561651 m!539109))

(declare-fun m!539111 () Bool)

(assert (=> b!561651 m!539111))

(declare-fun m!539113 () Bool)

(assert (=> b!561650 m!539113))

(declare-fun m!539115 () Bool)

(assert (=> b!561650 m!539115))

(assert (=> b!561649 m!539113))

(assert (=> b!561649 m!539113))

(declare-fun m!539117 () Bool)

(assert (=> b!561649 m!539117))

(declare-fun m!539119 () Bool)

(assert (=> b!561649 m!539119))

(declare-fun m!539121 () Bool)

(assert (=> b!561649 m!539121))

(declare-fun m!539123 () Bool)

(assert (=> b!561655 m!539123))

(declare-fun m!539125 () Bool)

(assert (=> start!51410 m!539125))

(declare-fun m!539127 () Bool)

(assert (=> start!51410 m!539127))

(assert (=> b!561653 m!539113))

(assert (=> b!561653 m!539113))

(declare-fun m!539129 () Bool)

(assert (=> b!561653 m!539129))

(declare-fun m!539131 () Bool)

(assert (=> b!561654 m!539131))

(assert (=> b!561659 m!539113))

(assert (=> b!561659 m!539113))

(declare-fun m!539133 () Bool)

(assert (=> b!561659 m!539133))

(assert (=> b!561660 m!539113))

(declare-fun m!539135 () Bool)

(assert (=> b!561660 m!539135))

(declare-fun m!539137 () Bool)

(assert (=> b!561660 m!539137))

(declare-fun m!539139 () Bool)

(assert (=> b!561660 m!539139))

(declare-fun m!539141 () Bool)

(assert (=> b!561660 m!539141))

(assert (=> b!561660 m!539113))

(declare-fun m!539143 () Bool)

(assert (=> b!561660 m!539143))

(declare-fun m!539145 () Bool)

(assert (=> b!561660 m!539145))

(assert (=> b!561660 m!539113))

(declare-fun m!539147 () Bool)

(assert (=> b!561652 m!539147))

(check-sat (not b!561661) (not b!561656) (not b!561654) (not b!561649) (not b!561659) (not start!51410) (not b!561660) (not b!561655) (not b!561651) (not b!561652) (not b!561653))
(check-sat)
