; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52430 () Bool)

(assert start!52430)

(declare-fun b!572311 () Bool)

(declare-fun res!361963 () Bool)

(declare-fun e!329191 () Bool)

(assert (=> b!572311 (=> (not res!361963) (not e!329191))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35836 0))(
  ( (array!35837 (arr!17207 (Array (_ BitVec 32) (_ BitVec 64))) (size!17572 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35836)

(assert (=> b!572311 (= res!361963 (and (= (size!17572 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17572 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17572 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572312 () Bool)

(declare-fun e!329195 () Bool)

(declare-fun e!329194 () Bool)

(assert (=> b!572312 (= e!329195 e!329194)))

(declare-fun res!361961 () Bool)

(assert (=> b!572312 (=> res!361961 e!329194)))

(declare-datatypes ((SeekEntryResult!5653 0))(
  ( (MissingZero!5653 (index!24839 (_ BitVec 32))) (Found!5653 (index!24840 (_ BitVec 32))) (Intermediate!5653 (undefined!6465 Bool) (index!24841 (_ BitVec 32)) (x!53717 (_ BitVec 32))) (Undefined!5653) (MissingVacant!5653 (index!24842 (_ BitVec 32))) )
))
(declare-fun lt!261105 () SeekEntryResult!5653)

(get-info :version)

(assert (=> b!572312 (= res!361961 (or (undefined!6465 lt!261105) (not ((_ is Intermediate!5653) lt!261105))))))

(declare-fun b!572313 () Bool)

(declare-fun e!329193 () Bool)

(declare-fun e!329190 () Bool)

(assert (=> b!572313 (= e!329193 e!329190)))

(declare-fun res!361966 () Bool)

(assert (=> b!572313 (=> (not res!361966) (not e!329190))))

(declare-fun lt!261106 () SeekEntryResult!5653)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35836 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!572313 (= res!361966 (= lt!261106 (seekKeyOrZeroReturnVacant!0 (x!53717 lt!261105) (index!24841 lt!261105) (index!24841 lt!261105) (select (arr!17207 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572314 () Bool)

(declare-fun e!329196 () Bool)

(declare-fun e!329192 () Bool)

(assert (=> b!572314 (= e!329196 e!329192)))

(declare-fun res!361968 () Bool)

(assert (=> b!572314 (=> (not res!361968) (not e!329192))))

(declare-fun lt!261109 () (_ BitVec 32))

(declare-fun lt!261101 () array!35836)

(declare-fun lt!261104 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35836 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!572314 (= res!361968 (= lt!261105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261109 lt!261104 lt!261101 mask!3119)))))

(declare-fun lt!261102 () (_ BitVec 32))

(assert (=> b!572314 (= lt!261105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261102 (select (arr!17207 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572314 (= lt!261109 (toIndex!0 lt!261104 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!572314 (= lt!261104 (select (store (arr!17207 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572314 (= lt!261102 (toIndex!0 (select (arr!17207 a!3118) j!142) mask!3119))))

(assert (=> b!572314 (= lt!261101 (array!35837 (store (arr!17207 a!3118) i!1132 k0!1914) (size!17572 a!3118)))))

(declare-fun b!572315 () Bool)

(declare-fun res!361969 () Bool)

(assert (=> b!572315 (=> (not res!361969) (not e!329196))))

(declare-datatypes ((List!11326 0))(
  ( (Nil!11323) (Cons!11322 (h!12349 (_ BitVec 64)) (t!17545 List!11326)) )
))
(declare-fun arrayNoDuplicates!0 (array!35836 (_ BitVec 32) List!11326) Bool)

(assert (=> b!572315 (= res!361969 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11323))))

(declare-fun b!572316 () Bool)

(declare-fun res!361967 () Bool)

(assert (=> b!572316 (=> (not res!361967) (not e!329191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572316 (= res!361967 (validKeyInArray!0 (select (arr!17207 a!3118) j!142)))))

(declare-fun b!572318 () Bool)

(assert (=> b!572318 (= e!329192 (not true))))

(assert (=> b!572318 e!329195))

(declare-fun res!361973 () Bool)

(assert (=> b!572318 (=> (not res!361973) (not e!329195))))

(assert (=> b!572318 (= res!361973 (= lt!261106 (Found!5653 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35836 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!572318 (= lt!261106 (seekEntryOrOpen!0 (select (arr!17207 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35836 (_ BitVec 32)) Bool)

(assert (=> b!572318 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17994 0))(
  ( (Unit!17995) )
))
(declare-fun lt!261107 () Unit!17994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17994)

(assert (=> b!572318 (= lt!261107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572319 () Bool)

(declare-fun res!361962 () Bool)

(assert (=> b!572319 (=> (not res!361962) (not e!329196))))

(assert (=> b!572319 (= res!361962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572320 () Bool)

(assert (=> b!572320 (= e!329190 (= (seekEntryOrOpen!0 lt!261104 lt!261101 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53717 lt!261105) (index!24841 lt!261105) (index!24841 lt!261105) lt!261104 lt!261101 mask!3119)))))

(declare-fun b!572321 () Bool)

(declare-fun res!361964 () Bool)

(assert (=> b!572321 (=> (not res!361964) (not e!329191))))

(declare-fun arrayContainsKey!0 (array!35836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572321 (= res!361964 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572317 () Bool)

(assert (=> b!572317 (= e!329191 e!329196)))

(declare-fun res!361965 () Bool)

(assert (=> b!572317 (=> (not res!361965) (not e!329196))))

(declare-fun lt!261103 () SeekEntryResult!5653)

(assert (=> b!572317 (= res!361965 (or (= lt!261103 (MissingZero!5653 i!1132)) (= lt!261103 (MissingVacant!5653 i!1132))))))

(assert (=> b!572317 (= lt!261103 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!361970 () Bool)

(assert (=> start!52430 (=> (not res!361970) (not e!329191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52430 (= res!361970 (validMask!0 mask!3119))))

(assert (=> start!52430 e!329191))

(assert (=> start!52430 true))

(declare-fun array_inv!13090 (array!35836) Bool)

(assert (=> start!52430 (array_inv!13090 a!3118)))

(declare-fun b!572322 () Bool)

(declare-fun res!361971 () Bool)

(assert (=> b!572322 (=> (not res!361971) (not e!329191))))

(assert (=> b!572322 (= res!361971 (validKeyInArray!0 k0!1914))))

(declare-fun b!572323 () Bool)

(assert (=> b!572323 (= e!329194 e!329193)))

(declare-fun res!361972 () Bool)

(assert (=> b!572323 (=> res!361972 e!329193)))

(declare-fun lt!261108 () (_ BitVec 64))

(assert (=> b!572323 (= res!361972 (or (= lt!261108 (select (arr!17207 a!3118) j!142)) (= lt!261108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572323 (= lt!261108 (select (arr!17207 a!3118) (index!24841 lt!261105)))))

(assert (= (and start!52430 res!361970) b!572311))

(assert (= (and b!572311 res!361963) b!572316))

(assert (= (and b!572316 res!361967) b!572322))

(assert (= (and b!572322 res!361971) b!572321))

(assert (= (and b!572321 res!361964) b!572317))

(assert (= (and b!572317 res!361965) b!572319))

(assert (= (and b!572319 res!361962) b!572315))

(assert (= (and b!572315 res!361969) b!572314))

(assert (= (and b!572314 res!361968) b!572318))

(assert (= (and b!572318 res!361973) b!572312))

(assert (= (and b!572312 (not res!361961)) b!572323))

(assert (= (and b!572323 (not res!361972)) b!572313))

(assert (= (and b!572313 res!361966) b!572320))

(declare-fun m!550805 () Bool)

(assert (=> b!572323 m!550805))

(declare-fun m!550807 () Bool)

(assert (=> b!572323 m!550807))

(declare-fun m!550809 () Bool)

(assert (=> b!572321 m!550809))

(declare-fun m!550811 () Bool)

(assert (=> start!52430 m!550811))

(declare-fun m!550813 () Bool)

(assert (=> start!52430 m!550813))

(declare-fun m!550815 () Bool)

(assert (=> b!572322 m!550815))

(declare-fun m!550817 () Bool)

(assert (=> b!572320 m!550817))

(declare-fun m!550819 () Bool)

(assert (=> b!572320 m!550819))

(assert (=> b!572318 m!550805))

(assert (=> b!572318 m!550805))

(declare-fun m!550821 () Bool)

(assert (=> b!572318 m!550821))

(declare-fun m!550823 () Bool)

(assert (=> b!572318 m!550823))

(declare-fun m!550825 () Bool)

(assert (=> b!572318 m!550825))

(declare-fun m!550827 () Bool)

(assert (=> b!572319 m!550827))

(assert (=> b!572316 m!550805))

(assert (=> b!572316 m!550805))

(declare-fun m!550829 () Bool)

(assert (=> b!572316 m!550829))

(declare-fun m!550831 () Bool)

(assert (=> b!572317 m!550831))

(assert (=> b!572314 m!550805))

(declare-fun m!550833 () Bool)

(assert (=> b!572314 m!550833))

(declare-fun m!550835 () Bool)

(assert (=> b!572314 m!550835))

(assert (=> b!572314 m!550805))

(declare-fun m!550837 () Bool)

(assert (=> b!572314 m!550837))

(declare-fun m!550839 () Bool)

(assert (=> b!572314 m!550839))

(assert (=> b!572314 m!550805))

(declare-fun m!550841 () Bool)

(assert (=> b!572314 m!550841))

(declare-fun m!550843 () Bool)

(assert (=> b!572314 m!550843))

(declare-fun m!550845 () Bool)

(assert (=> b!572315 m!550845))

(assert (=> b!572313 m!550805))

(assert (=> b!572313 m!550805))

(declare-fun m!550847 () Bool)

(assert (=> b!572313 m!550847))

(check-sat (not b!572317) (not b!572316) (not b!572315) (not b!572318) (not b!572314) (not b!572321) (not b!572319) (not start!52430) (not b!572313) (not b!572320) (not b!572322))
(check-sat)
