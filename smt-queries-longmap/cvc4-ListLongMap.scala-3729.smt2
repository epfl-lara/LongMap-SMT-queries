; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51372 () Bool)

(assert start!51372)

(declare-fun b!560945 () Bool)

(declare-fun e!323216 () Bool)

(declare-fun e!323221 () Bool)

(assert (=> b!560945 (= e!323216 e!323221)))

(declare-fun res!352104 () Bool)

(assert (=> b!560945 (=> (not res!352104) (not e!323221))))

(declare-datatypes ((SeekEntryResult!5368 0))(
  ( (MissingZero!5368 (index!23699 (_ BitVec 32))) (Found!5368 (index!23700 (_ BitVec 32))) (Intermediate!5368 (undefined!6180 Bool) (index!23701 (_ BitVec 32)) (x!52607 (_ BitVec 32))) (Undefined!5368) (MissingVacant!5368 (index!23702 (_ BitVec 32))) )
))
(declare-fun lt!255168 () SeekEntryResult!5368)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560945 (= res!352104 (or (= lt!255168 (MissingZero!5368 i!1132)) (= lt!255168 (MissingVacant!5368 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35237 0))(
  ( (array!35238 (arr!16919 (Array (_ BitVec 32) (_ BitVec 64))) (size!17283 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35237)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35237 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560945 (= lt!255168 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560946 () Bool)

(declare-fun e!323217 () Bool)

(declare-fun e!323222 () Bool)

(assert (=> b!560946 (= e!323217 e!323222)))

(declare-fun res!352107 () Bool)

(assert (=> b!560946 (=> res!352107 e!323222)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255169 () (_ BitVec 64))

(assert (=> b!560946 (= res!352107 (or (= lt!255169 (select (arr!16919 a!3118) j!142)) (= lt!255169 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!255173 () SeekEntryResult!5368)

(assert (=> b!560946 (= lt!255169 (select (arr!16919 a!3118) (index!23701 lt!255173)))))

(declare-fun b!560947 () Bool)

(declare-fun res!352108 () Bool)

(assert (=> b!560947 (=> (not res!352108) (not e!323216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560947 (= res!352108 (validKeyInArray!0 k!1914))))

(declare-fun b!560948 () Bool)

(declare-fun res!352102 () Bool)

(assert (=> b!560948 (=> (not res!352102) (not e!323216))))

(assert (=> b!560948 (= res!352102 (validKeyInArray!0 (select (arr!16919 a!3118) j!142)))))

(declare-fun b!560949 () Bool)

(declare-fun res!352103 () Bool)

(assert (=> b!560949 (=> (not res!352103) (not e!323221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35237 (_ BitVec 32)) Bool)

(assert (=> b!560949 (= res!352103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!352106 () Bool)

(assert (=> start!51372 (=> (not res!352106) (not e!323216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51372 (= res!352106 (validMask!0 mask!3119))))

(assert (=> start!51372 e!323216))

(assert (=> start!51372 true))

(declare-fun array_inv!12715 (array!35237) Bool)

(assert (=> start!51372 (array_inv!12715 a!3118)))

(declare-fun b!560950 () Bool)

(declare-fun e!323223 () Bool)

(assert (=> b!560950 (= e!323223 e!323217)))

(declare-fun res!352109 () Bool)

(assert (=> b!560950 (=> res!352109 e!323217)))

(assert (=> b!560950 (= res!352109 (or (undefined!6180 lt!255173) (not (is-Intermediate!5368 lt!255173))))))

(declare-fun b!560951 () Bool)

(declare-fun res!352098 () Bool)

(assert (=> b!560951 (=> (not res!352098) (not e!323216))))

(assert (=> b!560951 (= res!352098 (and (= (size!17283 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17283 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17283 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560952 () Bool)

(declare-fun res!352097 () Bool)

(assert (=> b!560952 (=> (not res!352097) (not e!323221))))

(declare-datatypes ((List!10999 0))(
  ( (Nil!10996) (Cons!10995 (h!11998 (_ BitVec 64)) (t!17227 List!10999)) )
))
(declare-fun arrayNoDuplicates!0 (array!35237 (_ BitVec 32) List!10999) Bool)

(assert (=> b!560952 (= res!352097 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10996))))

(declare-fun b!560953 () Bool)

(declare-fun e!323219 () Bool)

(assert (=> b!560953 (= e!323221 e!323219)))

(declare-fun res!352101 () Bool)

(assert (=> b!560953 (=> (not res!352101) (not e!323219))))

(declare-fun lt!255171 () (_ BitVec 64))

(declare-fun lt!255175 () array!35237)

(declare-fun lt!255174 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35237 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560953 (= res!352101 (= lt!255173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255174 lt!255171 lt!255175 mask!3119)))))

(declare-fun lt!255167 () (_ BitVec 32))

(assert (=> b!560953 (= lt!255173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255167 (select (arr!16919 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560953 (= lt!255174 (toIndex!0 lt!255171 mask!3119))))

(assert (=> b!560953 (= lt!255171 (select (store (arr!16919 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560953 (= lt!255167 (toIndex!0 (select (arr!16919 a!3118) j!142) mask!3119))))

(assert (=> b!560953 (= lt!255175 (array!35238 (store (arr!16919 a!3118) i!1132 k!1914) (size!17283 a!3118)))))

(declare-fun b!560954 () Bool)

(assert (=> b!560954 (= e!323219 (not true))))

(assert (=> b!560954 e!323223))

(declare-fun res!352099 () Bool)

(assert (=> b!560954 (=> (not res!352099) (not e!323223))))

(declare-fun lt!255170 () SeekEntryResult!5368)

(assert (=> b!560954 (= res!352099 (= lt!255170 (Found!5368 j!142)))))

(assert (=> b!560954 (= lt!255170 (seekEntryOrOpen!0 (select (arr!16919 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560954 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17510 0))(
  ( (Unit!17511) )
))
(declare-fun lt!255172 () Unit!17510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17510)

(assert (=> b!560954 (= lt!255172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560955 () Bool)

(declare-fun res!352105 () Bool)

(assert (=> b!560955 (=> (not res!352105) (not e!323216))))

(declare-fun arrayContainsKey!0 (array!35237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560955 (= res!352105 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560956 () Bool)

(declare-fun e!323218 () Bool)

(assert (=> b!560956 (= e!323222 e!323218)))

(declare-fun res!352100 () Bool)

(assert (=> b!560956 (=> (not res!352100) (not e!323218))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35237 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!560956 (= res!352100 (= lt!255170 (seekKeyOrZeroReturnVacant!0 (x!52607 lt!255173) (index!23701 lt!255173) (index!23701 lt!255173) (select (arr!16919 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560957 () Bool)

(assert (=> b!560957 (= e!323218 (= (seekEntryOrOpen!0 lt!255171 lt!255175 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52607 lt!255173) (index!23701 lt!255173) (index!23701 lt!255173) lt!255171 lt!255175 mask!3119)))))

(assert (= (and start!51372 res!352106) b!560951))

(assert (= (and b!560951 res!352098) b!560948))

(assert (= (and b!560948 res!352102) b!560947))

(assert (= (and b!560947 res!352108) b!560955))

(assert (= (and b!560955 res!352105) b!560945))

(assert (= (and b!560945 res!352104) b!560949))

(assert (= (and b!560949 res!352103) b!560952))

(assert (= (and b!560952 res!352097) b!560953))

(assert (= (and b!560953 res!352101) b!560954))

(assert (= (and b!560954 res!352099) b!560950))

(assert (= (and b!560950 (not res!352109)) b!560946))

(assert (= (and b!560946 (not res!352107)) b!560956))

(assert (= (and b!560956 res!352100) b!560957))

(declare-fun m!538777 () Bool)

(assert (=> b!560955 m!538777))

(declare-fun m!538779 () Bool)

(assert (=> b!560947 m!538779))

(declare-fun m!538781 () Bool)

(assert (=> b!560956 m!538781))

(assert (=> b!560956 m!538781))

(declare-fun m!538783 () Bool)

(assert (=> b!560956 m!538783))

(declare-fun m!538785 () Bool)

(assert (=> b!560952 m!538785))

(declare-fun m!538787 () Bool)

(assert (=> b!560957 m!538787))

(declare-fun m!538789 () Bool)

(assert (=> b!560957 m!538789))

(assert (=> b!560948 m!538781))

(assert (=> b!560948 m!538781))

(declare-fun m!538791 () Bool)

(assert (=> b!560948 m!538791))

(assert (=> b!560954 m!538781))

(assert (=> b!560954 m!538781))

(declare-fun m!538793 () Bool)

(assert (=> b!560954 m!538793))

(declare-fun m!538795 () Bool)

(assert (=> b!560954 m!538795))

(declare-fun m!538797 () Bool)

(assert (=> b!560954 m!538797))

(declare-fun m!538799 () Bool)

(assert (=> b!560945 m!538799))

(declare-fun m!538801 () Bool)

(assert (=> start!51372 m!538801))

(declare-fun m!538803 () Bool)

(assert (=> start!51372 m!538803))

(declare-fun m!538805 () Bool)

(assert (=> b!560949 m!538805))

(assert (=> b!560946 m!538781))

(declare-fun m!538807 () Bool)

(assert (=> b!560946 m!538807))

(assert (=> b!560953 m!538781))

(declare-fun m!538809 () Bool)

(assert (=> b!560953 m!538809))

(assert (=> b!560953 m!538781))

(declare-fun m!538811 () Bool)

(assert (=> b!560953 m!538811))

(declare-fun m!538813 () Bool)

(assert (=> b!560953 m!538813))

(declare-fun m!538815 () Bool)

(assert (=> b!560953 m!538815))

(assert (=> b!560953 m!538781))

(declare-fun m!538817 () Bool)

(assert (=> b!560953 m!538817))

(declare-fun m!538819 () Bool)

(assert (=> b!560953 m!538819))

(push 1)

