; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52420 () Bool)

(assert start!52420)

(declare-fun b!572153 () Bool)

(declare-fun res!361664 () Bool)

(declare-fun e!329106 () Bool)

(assert (=> b!572153 (=> (not res!361664) (not e!329106))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35817 0))(
  ( (array!35818 (arr!17197 (Array (_ BitVec 32) (_ BitVec 64))) (size!17561 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35817)

(assert (=> b!572153 (= res!361664 (and (= (size!17561 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17561 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17561 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572154 () Bool)

(declare-fun e!329099 () Bool)

(declare-fun e!329103 () Bool)

(assert (=> b!572154 (= e!329099 e!329103)))

(declare-fun res!361667 () Bool)

(assert (=> b!572154 (=> res!361667 e!329103)))

(declare-datatypes ((SeekEntryResult!5646 0))(
  ( (MissingZero!5646 (index!24811 (_ BitVec 32))) (Found!5646 (index!24812 (_ BitVec 32))) (Intermediate!5646 (undefined!6458 Bool) (index!24813 (_ BitVec 32)) (x!53683 (_ BitVec 32))) (Undefined!5646) (MissingVacant!5646 (index!24814 (_ BitVec 32))) )
))
(declare-fun lt!261044 () SeekEntryResult!5646)

(get-info :version)

(assert (=> b!572154 (= res!361667 (or (undefined!6458 lt!261044) (not ((_ is Intermediate!5646) lt!261044))))))

(declare-fun b!572155 () Bool)

(declare-fun e!329100 () Bool)

(declare-fun e!329102 () Bool)

(assert (=> b!572155 (= e!329100 e!329102)))

(declare-fun res!361671 () Bool)

(assert (=> b!572155 (=> (not res!361671) (not e!329102))))

(declare-fun lt!261040 () SeekEntryResult!5646)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35817 (_ BitVec 32)) SeekEntryResult!5646)

(assert (=> b!572155 (= res!361671 (= lt!261040 (seekKeyOrZeroReturnVacant!0 (x!53683 lt!261044) (index!24813 lt!261044) (index!24813 lt!261044) (select (arr!17197 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572156 () Bool)

(declare-fun e!329101 () Bool)

(assert (=> b!572156 (= e!329106 e!329101)))

(declare-fun res!361665 () Bool)

(assert (=> b!572156 (=> (not res!361665) (not e!329101))))

(declare-fun lt!261039 () SeekEntryResult!5646)

(assert (=> b!572156 (= res!361665 (or (= lt!261039 (MissingZero!5646 i!1132)) (= lt!261039 (MissingVacant!5646 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35817 (_ BitVec 32)) SeekEntryResult!5646)

(assert (=> b!572156 (= lt!261039 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!361669 () Bool)

(assert (=> start!52420 (=> (not res!361669) (not e!329106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52420 (= res!361669 (validMask!0 mask!3119))))

(assert (=> start!52420 e!329106))

(assert (=> start!52420 true))

(declare-fun array_inv!12993 (array!35817) Bool)

(assert (=> start!52420 (array_inv!12993 a!3118)))

(declare-fun b!572157 () Bool)

(declare-fun res!361668 () Bool)

(assert (=> b!572157 (=> (not res!361668) (not e!329101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35817 (_ BitVec 32)) Bool)

(assert (=> b!572157 (= res!361668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572158 () Bool)

(declare-fun res!361663 () Bool)

(assert (=> b!572158 (=> (not res!361663) (not e!329106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572158 (= res!361663 (validKeyInArray!0 k0!1914))))

(declare-fun b!572159 () Bool)

(declare-fun res!361662 () Bool)

(assert (=> b!572159 (=> (not res!361662) (not e!329106))))

(declare-fun arrayContainsKey!0 (array!35817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572159 (= res!361662 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572160 () Bool)

(declare-fun res!361670 () Bool)

(assert (=> b!572160 (=> (not res!361670) (not e!329101))))

(declare-datatypes ((List!11277 0))(
  ( (Nil!11274) (Cons!11273 (h!12300 (_ BitVec 64)) (t!17505 List!11277)) )
))
(declare-fun arrayNoDuplicates!0 (array!35817 (_ BitVec 32) List!11277) Bool)

(assert (=> b!572160 (= res!361670 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11274))))

(declare-fun b!572161 () Bool)

(assert (=> b!572161 (= e!329103 e!329100)))

(declare-fun res!361661 () Bool)

(assert (=> b!572161 (=> res!361661 e!329100)))

(declare-fun lt!261041 () (_ BitVec 64))

(assert (=> b!572161 (= res!361661 (or (= lt!261041 (select (arr!17197 a!3118) j!142)) (= lt!261041 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572161 (= lt!261041 (select (arr!17197 a!3118) (index!24813 lt!261044)))))

(declare-fun b!572162 () Bool)

(declare-fun e!329105 () Bool)

(assert (=> b!572162 (= e!329105 (not true))))

(assert (=> b!572162 e!329099))

(declare-fun res!361673 () Bool)

(assert (=> b!572162 (=> (not res!361673) (not e!329099))))

(assert (=> b!572162 (= res!361673 (= lt!261040 (Found!5646 j!142)))))

(assert (=> b!572162 (= lt!261040 (seekEntryOrOpen!0 (select (arr!17197 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572162 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17994 0))(
  ( (Unit!17995) )
))
(declare-fun lt!261045 () Unit!17994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17994)

(assert (=> b!572162 (= lt!261045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572163 () Bool)

(declare-fun res!361672 () Bool)

(assert (=> b!572163 (=> (not res!361672) (not e!329106))))

(assert (=> b!572163 (= res!361672 (validKeyInArray!0 (select (arr!17197 a!3118) j!142)))))

(declare-fun b!572164 () Bool)

(declare-fun lt!261046 () array!35817)

(declare-fun lt!261038 () (_ BitVec 64))

(assert (=> b!572164 (= e!329102 (= (seekEntryOrOpen!0 lt!261038 lt!261046 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53683 lt!261044) (index!24813 lt!261044) (index!24813 lt!261044) lt!261038 lt!261046 mask!3119)))))

(declare-fun b!572165 () Bool)

(assert (=> b!572165 (= e!329101 e!329105)))

(declare-fun res!361666 () Bool)

(assert (=> b!572165 (=> (not res!361666) (not e!329105))))

(declare-fun lt!261042 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35817 (_ BitVec 32)) SeekEntryResult!5646)

(assert (=> b!572165 (= res!361666 (= lt!261044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261042 lt!261038 lt!261046 mask!3119)))))

(declare-fun lt!261043 () (_ BitVec 32))

(assert (=> b!572165 (= lt!261044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261043 (select (arr!17197 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572165 (= lt!261042 (toIndex!0 lt!261038 mask!3119))))

(assert (=> b!572165 (= lt!261038 (select (store (arr!17197 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572165 (= lt!261043 (toIndex!0 (select (arr!17197 a!3118) j!142) mask!3119))))

(assert (=> b!572165 (= lt!261046 (array!35818 (store (arr!17197 a!3118) i!1132 k0!1914) (size!17561 a!3118)))))

(assert (= (and start!52420 res!361669) b!572153))

(assert (= (and b!572153 res!361664) b!572163))

(assert (= (and b!572163 res!361672) b!572158))

(assert (= (and b!572158 res!361663) b!572159))

(assert (= (and b!572159 res!361662) b!572156))

(assert (= (and b!572156 res!361665) b!572157))

(assert (= (and b!572157 res!361668) b!572160))

(assert (= (and b!572160 res!361670) b!572165))

(assert (= (and b!572165 res!361666) b!572162))

(assert (= (and b!572162 res!361673) b!572154))

(assert (= (and b!572154 (not res!361667)) b!572161))

(assert (= (and b!572161 (not res!361661)) b!572155))

(assert (= (and b!572155 res!361671) b!572164))

(declare-fun m!551093 () Bool)

(assert (=> b!572157 m!551093))

(declare-fun m!551095 () Bool)

(assert (=> b!572162 m!551095))

(assert (=> b!572162 m!551095))

(declare-fun m!551097 () Bool)

(assert (=> b!572162 m!551097))

(declare-fun m!551099 () Bool)

(assert (=> b!572162 m!551099))

(declare-fun m!551101 () Bool)

(assert (=> b!572162 m!551101))

(declare-fun m!551103 () Bool)

(assert (=> start!52420 m!551103))

(declare-fun m!551105 () Bool)

(assert (=> start!52420 m!551105))

(declare-fun m!551107 () Bool)

(assert (=> b!572164 m!551107))

(declare-fun m!551109 () Bool)

(assert (=> b!572164 m!551109))

(declare-fun m!551111 () Bool)

(assert (=> b!572156 m!551111))

(assert (=> b!572161 m!551095))

(declare-fun m!551113 () Bool)

(assert (=> b!572161 m!551113))

(assert (=> b!572155 m!551095))

(assert (=> b!572155 m!551095))

(declare-fun m!551115 () Bool)

(assert (=> b!572155 m!551115))

(declare-fun m!551117 () Bool)

(assert (=> b!572158 m!551117))

(declare-fun m!551119 () Bool)

(assert (=> b!572160 m!551119))

(assert (=> b!572165 m!551095))

(declare-fun m!551121 () Bool)

(assert (=> b!572165 m!551121))

(declare-fun m!551123 () Bool)

(assert (=> b!572165 m!551123))

(assert (=> b!572165 m!551095))

(declare-fun m!551125 () Bool)

(assert (=> b!572165 m!551125))

(assert (=> b!572165 m!551095))

(declare-fun m!551127 () Bool)

(assert (=> b!572165 m!551127))

(declare-fun m!551129 () Bool)

(assert (=> b!572165 m!551129))

(declare-fun m!551131 () Bool)

(assert (=> b!572165 m!551131))

(declare-fun m!551133 () Bool)

(assert (=> b!572159 m!551133))

(assert (=> b!572163 m!551095))

(assert (=> b!572163 m!551095))

(declare-fun m!551135 () Bool)

(assert (=> b!572163 m!551135))

(check-sat (not start!52420) (not b!572157) (not b!572155) (not b!572164) (not b!572165) (not b!572159) (not b!572160) (not b!572163) (not b!572162) (not b!572158) (not b!572156))
(check-sat)
