; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52482 () Bool)

(assert start!52482)

(declare-fun b!572665 () Bool)

(declare-fun res!362075 () Bool)

(declare-fun e!329424 () Bool)

(assert (=> b!572665 (=> (not res!362075) (not e!329424))))

(declare-datatypes ((array!35826 0))(
  ( (array!35827 (arr!17200 (Array (_ BitVec 32) (_ BitVec 64))) (size!17564 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35826)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572665 (= res!362075 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572666 () Bool)

(declare-fun e!329421 () Bool)

(declare-fun e!329420 () Bool)

(assert (=> b!572666 (= e!329421 e!329420)))

(declare-fun res!362069 () Bool)

(assert (=> b!572666 (=> res!362069 e!329420)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261367 () (_ BitVec 64))

(assert (=> b!572666 (= res!362069 (or (= lt!261367 (select (arr!17200 a!3118) j!142)) (= lt!261367 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5605 0))(
  ( (MissingZero!5605 (index!24647 (_ BitVec 32))) (Found!5605 (index!24648 (_ BitVec 32))) (Intermediate!5605 (undefined!6417 Bool) (index!24649 (_ BitVec 32)) (x!53669 (_ BitVec 32))) (Undefined!5605) (MissingVacant!5605 (index!24650 (_ BitVec 32))) )
))
(declare-fun lt!261370 () SeekEntryResult!5605)

(assert (=> b!572666 (= lt!261367 (select (arr!17200 a!3118) (index!24649 lt!261370)))))

(declare-fun b!572667 () Bool)

(declare-fun res!362073 () Bool)

(assert (=> b!572667 (=> (not res!362073) (not e!329424))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572667 (= res!362073 (and (= (size!17564 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17564 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17564 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572668 () Bool)

(declare-fun lt!261366 () array!35826)

(declare-fun e!329426 () Bool)

(declare-fun lt!261373 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35826 (_ BitVec 32)) SeekEntryResult!5605)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35826 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!572668 (= e!329426 (= (seekEntryOrOpen!0 lt!261373 lt!261366 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53669 lt!261370) (index!24649 lt!261370) (index!24649 lt!261370) lt!261373 lt!261366 mask!3119)))))

(declare-fun b!572669 () Bool)

(declare-fun e!329427 () Bool)

(assert (=> b!572669 (= e!329427 e!329421)))

(declare-fun res!362077 () Bool)

(assert (=> b!572669 (=> res!362077 e!329421)))

(get-info :version)

(assert (=> b!572669 (= res!362077 (or (undefined!6417 lt!261370) (not ((_ is Intermediate!5605) lt!261370))))))

(declare-fun b!572670 () Bool)

(declare-fun res!362071 () Bool)

(assert (=> b!572670 (=> (not res!362071) (not e!329424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572670 (= res!362071 (validKeyInArray!0 (select (arr!17200 a!3118) j!142)))))

(declare-fun b!572671 () Bool)

(declare-fun res!362068 () Bool)

(declare-fun e!329425 () Bool)

(assert (=> b!572671 (=> (not res!362068) (not e!329425))))

(declare-datatypes ((List!11187 0))(
  ( (Nil!11184) (Cons!11183 (h!12213 (_ BitVec 64)) (t!17407 List!11187)) )
))
(declare-fun arrayNoDuplicates!0 (array!35826 (_ BitVec 32) List!11187) Bool)

(assert (=> b!572671 (= res!362068 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11184))))

(declare-fun b!572672 () Bool)

(declare-fun res!362070 () Bool)

(assert (=> b!572672 (=> (not res!362070) (not e!329425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35826 (_ BitVec 32)) Bool)

(assert (=> b!572672 (= res!362070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!362078 () Bool)

(assert (=> start!52482 (=> (not res!362078) (not e!329424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52482 (= res!362078 (validMask!0 mask!3119))))

(assert (=> start!52482 e!329424))

(assert (=> start!52482 true))

(declare-fun array_inv!13059 (array!35826) Bool)

(assert (=> start!52482 (array_inv!13059 a!3118)))

(declare-fun b!572673 () Bool)

(declare-fun e!329423 () Bool)

(assert (=> b!572673 (= e!329423 (not true))))

(assert (=> b!572673 e!329427))

(declare-fun res!362079 () Bool)

(assert (=> b!572673 (=> (not res!362079) (not e!329427))))

(declare-fun lt!261372 () SeekEntryResult!5605)

(assert (=> b!572673 (= res!362079 (= lt!261372 (Found!5605 j!142)))))

(assert (=> b!572673 (= lt!261372 (seekEntryOrOpen!0 (select (arr!17200 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572673 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17983 0))(
  ( (Unit!17984) )
))
(declare-fun lt!261369 () Unit!17983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17983)

(assert (=> b!572673 (= lt!261369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572674 () Bool)

(assert (=> b!572674 (= e!329420 e!329426)))

(declare-fun res!362076 () Bool)

(assert (=> b!572674 (=> (not res!362076) (not e!329426))))

(assert (=> b!572674 (= res!362076 (= lt!261372 (seekKeyOrZeroReturnVacant!0 (x!53669 lt!261370) (index!24649 lt!261370) (index!24649 lt!261370) (select (arr!17200 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572675 () Bool)

(assert (=> b!572675 (= e!329424 e!329425)))

(declare-fun res!362080 () Bool)

(assert (=> b!572675 (=> (not res!362080) (not e!329425))))

(declare-fun lt!261368 () SeekEntryResult!5605)

(assert (=> b!572675 (= res!362080 (or (= lt!261368 (MissingZero!5605 i!1132)) (= lt!261368 (MissingVacant!5605 i!1132))))))

(assert (=> b!572675 (= lt!261368 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572676 () Bool)

(assert (=> b!572676 (= e!329425 e!329423)))

(declare-fun res!362072 () Bool)

(assert (=> b!572676 (=> (not res!362072) (not e!329423))))

(declare-fun lt!261365 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35826 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!572676 (= res!362072 (= lt!261370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261365 lt!261373 lt!261366 mask!3119)))))

(declare-fun lt!261371 () (_ BitVec 32))

(assert (=> b!572676 (= lt!261370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261371 (select (arr!17200 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572676 (= lt!261365 (toIndex!0 lt!261373 mask!3119))))

(assert (=> b!572676 (= lt!261373 (select (store (arr!17200 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572676 (= lt!261371 (toIndex!0 (select (arr!17200 a!3118) j!142) mask!3119))))

(assert (=> b!572676 (= lt!261366 (array!35827 (store (arr!17200 a!3118) i!1132 k0!1914) (size!17564 a!3118)))))

(declare-fun b!572677 () Bool)

(declare-fun res!362074 () Bool)

(assert (=> b!572677 (=> (not res!362074) (not e!329424))))

(assert (=> b!572677 (= res!362074 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52482 res!362078) b!572667))

(assert (= (and b!572667 res!362073) b!572670))

(assert (= (and b!572670 res!362071) b!572677))

(assert (= (and b!572677 res!362074) b!572665))

(assert (= (and b!572665 res!362075) b!572675))

(assert (= (and b!572675 res!362080) b!572672))

(assert (= (and b!572672 res!362070) b!572671))

(assert (= (and b!572671 res!362068) b!572676))

(assert (= (and b!572676 res!362072) b!572673))

(assert (= (and b!572673 res!362079) b!572669))

(assert (= (and b!572669 (not res!362077)) b!572666))

(assert (= (and b!572666 (not res!362069)) b!572674))

(assert (= (and b!572674 res!362076) b!572668))

(declare-fun m!551783 () Bool)

(assert (=> b!572671 m!551783))

(declare-fun m!551785 () Bool)

(assert (=> b!572673 m!551785))

(assert (=> b!572673 m!551785))

(declare-fun m!551787 () Bool)

(assert (=> b!572673 m!551787))

(declare-fun m!551789 () Bool)

(assert (=> b!572673 m!551789))

(declare-fun m!551791 () Bool)

(assert (=> b!572673 m!551791))

(declare-fun m!551793 () Bool)

(assert (=> start!52482 m!551793))

(declare-fun m!551795 () Bool)

(assert (=> start!52482 m!551795))

(declare-fun m!551797 () Bool)

(assert (=> b!572668 m!551797))

(declare-fun m!551799 () Bool)

(assert (=> b!572668 m!551799))

(declare-fun m!551801 () Bool)

(assert (=> b!572665 m!551801))

(declare-fun m!551803 () Bool)

(assert (=> b!572675 m!551803))

(assert (=> b!572676 m!551785))

(declare-fun m!551805 () Bool)

(assert (=> b!572676 m!551805))

(declare-fun m!551807 () Bool)

(assert (=> b!572676 m!551807))

(assert (=> b!572676 m!551785))

(declare-fun m!551809 () Bool)

(assert (=> b!572676 m!551809))

(declare-fun m!551811 () Bool)

(assert (=> b!572676 m!551811))

(declare-fun m!551813 () Bool)

(assert (=> b!572676 m!551813))

(assert (=> b!572676 m!551785))

(declare-fun m!551815 () Bool)

(assert (=> b!572676 m!551815))

(assert (=> b!572670 m!551785))

(assert (=> b!572670 m!551785))

(declare-fun m!551817 () Bool)

(assert (=> b!572670 m!551817))

(assert (=> b!572674 m!551785))

(assert (=> b!572674 m!551785))

(declare-fun m!551819 () Bool)

(assert (=> b!572674 m!551819))

(declare-fun m!551821 () Bool)

(assert (=> b!572677 m!551821))

(assert (=> b!572666 m!551785))

(declare-fun m!551823 () Bool)

(assert (=> b!572666 m!551823))

(declare-fun m!551825 () Bool)

(assert (=> b!572672 m!551825))

(check-sat (not b!572674) (not b!572672) (not b!572670) (not b!572671) (not b!572675) (not b!572677) (not b!572673) (not b!572668) (not b!572676) (not start!52482) (not b!572665))
(check-sat)
