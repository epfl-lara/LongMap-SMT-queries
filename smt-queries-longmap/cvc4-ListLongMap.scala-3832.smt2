; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52614 () Bool)

(assert start!52614)

(declare-fun b!574124 () Bool)

(declare-fun res!363098 () Bool)

(declare-fun e!330308 () Bool)

(assert (=> b!574124 (=> (not res!363098) (not e!330308))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574124 (= res!363098 (validKeyInArray!0 k!1914))))

(declare-fun b!574125 () Bool)

(declare-fun e!330307 () Bool)

(declare-fun e!330306 () Bool)

(assert (=> b!574125 (= e!330307 e!330306)))

(declare-fun res!363086 () Bool)

(assert (=> b!574125 (=> res!363086 e!330306)))

(declare-datatypes ((SeekEntryResult!5677 0))(
  ( (MissingZero!5677 (index!24935 (_ BitVec 32))) (Found!5677 (index!24936 (_ BitVec 32))) (Intermediate!5677 (undefined!6489 Bool) (index!24937 (_ BitVec 32)) (x!53812 (_ BitVec 32))) (Undefined!5677) (MissingVacant!5677 (index!24938 (_ BitVec 32))) )
))
(declare-fun lt!262200 () SeekEntryResult!5677)

(assert (=> b!574125 (= res!363086 (or (undefined!6489 lt!262200) (not (is-Intermediate!5677 lt!262200))))))

(declare-fun b!574126 () Bool)

(declare-fun res!363097 () Bool)

(assert (=> b!574126 (=> (not res!363097) (not e!330308))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35885 0))(
  ( (array!35886 (arr!17228 (Array (_ BitVec 32) (_ BitVec 64))) (size!17592 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35885)

(assert (=> b!574126 (= res!363097 (and (= (size!17592 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17592 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17592 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574127 () Bool)

(declare-fun e!330311 () Bool)

(assert (=> b!574127 (= e!330311 (not true))))

(assert (=> b!574127 e!330307))

(declare-fun res!363087 () Bool)

(assert (=> b!574127 (=> (not res!363087) (not e!330307))))

(declare-fun lt!262204 () SeekEntryResult!5677)

(assert (=> b!574127 (= res!363087 (= lt!262204 (Found!5677 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35885 (_ BitVec 32)) SeekEntryResult!5677)

(assert (=> b!574127 (= lt!262204 (seekEntryOrOpen!0 (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35885 (_ BitVec 32)) Bool)

(assert (=> b!574127 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18056 0))(
  ( (Unit!18057) )
))
(declare-fun lt!262206 () Unit!18056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18056)

(assert (=> b!574127 (= lt!262206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574128 () Bool)

(declare-fun e!330310 () Bool)

(assert (=> b!574128 (= e!330310 e!330311)))

(declare-fun res!363093 () Bool)

(assert (=> b!574128 (=> (not res!363093) (not e!330311))))

(declare-fun lt!262205 () (_ BitVec 64))

(declare-fun lt!262201 () (_ BitVec 32))

(declare-fun lt!262207 () array!35885)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35885 (_ BitVec 32)) SeekEntryResult!5677)

(assert (=> b!574128 (= res!363093 (= lt!262200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262201 lt!262205 lt!262207 mask!3119)))))

(declare-fun lt!262203 () (_ BitVec 32))

(assert (=> b!574128 (= lt!262200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262203 (select (arr!17228 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574128 (= lt!262201 (toIndex!0 lt!262205 mask!3119))))

(assert (=> b!574128 (= lt!262205 (select (store (arr!17228 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574128 (= lt!262203 (toIndex!0 (select (arr!17228 a!3118) j!142) mask!3119))))

(assert (=> b!574128 (= lt!262207 (array!35886 (store (arr!17228 a!3118) i!1132 k!1914) (size!17592 a!3118)))))

(declare-fun res!363096 () Bool)

(assert (=> start!52614 (=> (not res!363096) (not e!330308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52614 (= res!363096 (validMask!0 mask!3119))))

(assert (=> start!52614 e!330308))

(assert (=> start!52614 true))

(declare-fun array_inv!13024 (array!35885) Bool)

(assert (=> start!52614 (array_inv!13024 a!3118)))

(declare-fun b!574129 () Bool)

(declare-fun res!363090 () Bool)

(assert (=> b!574129 (=> (not res!363090) (not e!330310))))

(declare-datatypes ((List!11308 0))(
  ( (Nil!11305) (Cons!11304 (h!12337 (_ BitVec 64)) (t!17536 List!11308)) )
))
(declare-fun arrayNoDuplicates!0 (array!35885 (_ BitVec 32) List!11308) Bool)

(assert (=> b!574129 (= res!363090 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11305))))

(declare-fun b!574130 () Bool)

(declare-fun e!330309 () Bool)

(assert (=> b!574130 (= e!330306 e!330309)))

(declare-fun res!363091 () Bool)

(assert (=> b!574130 (=> res!363091 e!330309)))

(declare-fun lt!262199 () (_ BitVec 64))

(assert (=> b!574130 (= res!363091 (or (= lt!262199 (select (arr!17228 a!3118) j!142)) (= lt!262199 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574130 (= lt!262199 (select (arr!17228 a!3118) (index!24937 lt!262200)))))

(declare-fun b!574131 () Bool)

(declare-fun e!330312 () Bool)

(assert (=> b!574131 (= e!330309 e!330312)))

(declare-fun res!363092 () Bool)

(assert (=> b!574131 (=> (not res!363092) (not e!330312))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35885 (_ BitVec 32)) SeekEntryResult!5677)

(assert (=> b!574131 (= res!363092 (= lt!262204 (seekKeyOrZeroReturnVacant!0 (x!53812 lt!262200) (index!24937 lt!262200) (index!24937 lt!262200) (select (arr!17228 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574132 () Bool)

(declare-fun res!363088 () Bool)

(assert (=> b!574132 (=> (not res!363088) (not e!330308))))

(assert (=> b!574132 (= res!363088 (validKeyInArray!0 (select (arr!17228 a!3118) j!142)))))

(declare-fun b!574133 () Bool)

(declare-fun res!363094 () Bool)

(assert (=> b!574133 (=> (not res!363094) (not e!330310))))

(assert (=> b!574133 (= res!363094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574134 () Bool)

(assert (=> b!574134 (= e!330312 (= (seekEntryOrOpen!0 lt!262205 lt!262207 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53812 lt!262200) (index!24937 lt!262200) (index!24937 lt!262200) lt!262205 lt!262207 mask!3119)))))

(declare-fun b!574135 () Bool)

(assert (=> b!574135 (= e!330308 e!330310)))

(declare-fun res!363095 () Bool)

(assert (=> b!574135 (=> (not res!363095) (not e!330310))))

(declare-fun lt!262202 () SeekEntryResult!5677)

(assert (=> b!574135 (= res!363095 (or (= lt!262202 (MissingZero!5677 i!1132)) (= lt!262202 (MissingVacant!5677 i!1132))))))

(assert (=> b!574135 (= lt!262202 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!574136 () Bool)

(declare-fun res!363089 () Bool)

(assert (=> b!574136 (=> (not res!363089) (not e!330308))))

(declare-fun arrayContainsKey!0 (array!35885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574136 (= res!363089 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52614 res!363096) b!574126))

(assert (= (and b!574126 res!363097) b!574132))

(assert (= (and b!574132 res!363088) b!574124))

(assert (= (and b!574124 res!363098) b!574136))

(assert (= (and b!574136 res!363089) b!574135))

(assert (= (and b!574135 res!363095) b!574133))

(assert (= (and b!574133 res!363094) b!574129))

(assert (= (and b!574129 res!363090) b!574128))

(assert (= (and b!574128 res!363093) b!574127))

(assert (= (and b!574127 res!363087) b!574125))

(assert (= (and b!574125 (not res!363086)) b!574130))

(assert (= (and b!574130 (not res!363091)) b!574131))

(assert (= (and b!574131 res!363092) b!574134))

(declare-fun m!553033 () Bool)

(assert (=> start!52614 m!553033))

(declare-fun m!553035 () Bool)

(assert (=> start!52614 m!553035))

(declare-fun m!553037 () Bool)

(assert (=> b!574124 m!553037))

(declare-fun m!553039 () Bool)

(assert (=> b!574136 m!553039))

(declare-fun m!553041 () Bool)

(assert (=> b!574128 m!553041))

(declare-fun m!553043 () Bool)

(assert (=> b!574128 m!553043))

(declare-fun m!553045 () Bool)

(assert (=> b!574128 m!553045))

(assert (=> b!574128 m!553041))

(declare-fun m!553047 () Bool)

(assert (=> b!574128 m!553047))

(declare-fun m!553049 () Bool)

(assert (=> b!574128 m!553049))

(declare-fun m!553051 () Bool)

(assert (=> b!574128 m!553051))

(assert (=> b!574128 m!553041))

(declare-fun m!553053 () Bool)

(assert (=> b!574128 m!553053))

(declare-fun m!553055 () Bool)

(assert (=> b!574129 m!553055))

(assert (=> b!574131 m!553041))

(assert (=> b!574131 m!553041))

(declare-fun m!553057 () Bool)

(assert (=> b!574131 m!553057))

(assert (=> b!574132 m!553041))

(assert (=> b!574132 m!553041))

(declare-fun m!553059 () Bool)

(assert (=> b!574132 m!553059))

(declare-fun m!553061 () Bool)

(assert (=> b!574135 m!553061))

(declare-fun m!553063 () Bool)

(assert (=> b!574133 m!553063))

(declare-fun m!553065 () Bool)

(assert (=> b!574134 m!553065))

(declare-fun m!553067 () Bool)

(assert (=> b!574134 m!553067))

(assert (=> b!574130 m!553041))

(declare-fun m!553069 () Bool)

(assert (=> b!574130 m!553069))

(assert (=> b!574127 m!553041))

(assert (=> b!574127 m!553041))

(declare-fun m!553071 () Bool)

(assert (=> b!574127 m!553071))

(declare-fun m!553073 () Bool)

(assert (=> b!574127 m!553073))

(declare-fun m!553075 () Bool)

(assert (=> b!574127 m!553075))

(push 1)

