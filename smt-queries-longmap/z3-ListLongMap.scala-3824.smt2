; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52418 () Bool)

(assert start!52418)

(declare-fun b!572077 () Bool)

(declare-fun e!329046 () Bool)

(declare-fun e!329050 () Bool)

(assert (=> b!572077 (= e!329046 e!329050)))

(declare-fun res!361735 () Bool)

(assert (=> b!572077 (=> res!361735 e!329050)))

(declare-fun lt!260945 () (_ BitVec 64))

(declare-datatypes ((array!35824 0))(
  ( (array!35825 (arr!17201 (Array (_ BitVec 32) (_ BitVec 64))) (size!17566 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35824)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572077 (= res!361735 (or (= lt!260945 (select (arr!17201 a!3118) j!142)) (= lt!260945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5647 0))(
  ( (MissingZero!5647 (index!24815 (_ BitVec 32))) (Found!5647 (index!24816 (_ BitVec 32))) (Intermediate!5647 (undefined!6459 Bool) (index!24817 (_ BitVec 32)) (x!53695 (_ BitVec 32))) (Undefined!5647) (MissingVacant!5647 (index!24818 (_ BitVec 32))) )
))
(declare-fun lt!260941 () SeekEntryResult!5647)

(assert (=> b!572077 (= lt!260945 (select (arr!17201 a!3118) (index!24817 lt!260941)))))

(declare-fun b!572078 () Bool)

(declare-fun res!361738 () Bool)

(declare-fun e!329052 () Bool)

(assert (=> b!572078 (=> (not res!361738) (not e!329052))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572078 (= res!361738 (and (= (size!17566 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17566 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17566 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572079 () Bool)

(declare-fun res!361734 () Bool)

(assert (=> b!572079 (=> (not res!361734) (not e!329052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572079 (= res!361734 (validKeyInArray!0 (select (arr!17201 a!3118) j!142)))))

(declare-fun b!572080 () Bool)

(declare-fun e!329051 () Bool)

(assert (=> b!572080 (= e!329052 e!329051)))

(declare-fun res!361729 () Bool)

(assert (=> b!572080 (=> (not res!361729) (not e!329051))))

(declare-fun lt!260939 () SeekEntryResult!5647)

(assert (=> b!572080 (= res!361729 (or (= lt!260939 (MissingZero!5647 i!1132)) (= lt!260939 (MissingVacant!5647 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35824 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572080 (= lt!260939 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572081 () Bool)

(declare-fun e!329045 () Bool)

(assert (=> b!572081 (= e!329050 e!329045)))

(declare-fun res!361727 () Bool)

(assert (=> b!572081 (=> (not res!361727) (not e!329045))))

(declare-fun lt!260947 () SeekEntryResult!5647)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35824 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572081 (= res!361727 (= lt!260947 (seekKeyOrZeroReturnVacant!0 (x!53695 lt!260941) (index!24817 lt!260941) (index!24817 lt!260941) (select (arr!17201 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572082 () Bool)

(declare-fun res!361733 () Bool)

(assert (=> b!572082 (=> (not res!361733) (not e!329051))))

(declare-datatypes ((List!11320 0))(
  ( (Nil!11317) (Cons!11316 (h!12343 (_ BitVec 64)) (t!17539 List!11320)) )
))
(declare-fun arrayNoDuplicates!0 (array!35824 (_ BitVec 32) List!11320) Bool)

(assert (=> b!572082 (= res!361733 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11317))))

(declare-fun res!361736 () Bool)

(assert (=> start!52418 (=> (not res!361736) (not e!329052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52418 (= res!361736 (validMask!0 mask!3119))))

(assert (=> start!52418 e!329052))

(assert (=> start!52418 true))

(declare-fun array_inv!13084 (array!35824) Bool)

(assert (=> start!52418 (array_inv!13084 a!3118)))

(declare-fun b!572083 () Bool)

(declare-fun e!329047 () Bool)

(assert (=> b!572083 (= e!329047 (not true))))

(declare-fun e!329049 () Bool)

(assert (=> b!572083 e!329049))

(declare-fun res!361739 () Bool)

(assert (=> b!572083 (=> (not res!361739) (not e!329049))))

(assert (=> b!572083 (= res!361739 (= lt!260947 (Found!5647 j!142)))))

(assert (=> b!572083 (= lt!260947 (seekEntryOrOpen!0 (select (arr!17201 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35824 (_ BitVec 32)) Bool)

(assert (=> b!572083 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17982 0))(
  ( (Unit!17983) )
))
(declare-fun lt!260940 () Unit!17982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17982)

(assert (=> b!572083 (= lt!260940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572084 () Bool)

(declare-fun res!361730 () Bool)

(assert (=> b!572084 (=> (not res!361730) (not e!329052))))

(assert (=> b!572084 (= res!361730 (validKeyInArray!0 k0!1914))))

(declare-fun b!572085 () Bool)

(declare-fun lt!260943 () array!35824)

(declare-fun lt!260944 () (_ BitVec 64))

(assert (=> b!572085 (= e!329045 (= (seekEntryOrOpen!0 lt!260944 lt!260943 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53695 lt!260941) (index!24817 lt!260941) (index!24817 lt!260941) lt!260944 lt!260943 mask!3119)))))

(declare-fun b!572086 () Bool)

(assert (=> b!572086 (= e!329049 e!329046)))

(declare-fun res!361728 () Bool)

(assert (=> b!572086 (=> res!361728 e!329046)))

(get-info :version)

(assert (=> b!572086 (= res!361728 (or (undefined!6459 lt!260941) (not ((_ is Intermediate!5647) lt!260941))))))

(declare-fun b!572087 () Bool)

(assert (=> b!572087 (= e!329051 e!329047)))

(declare-fun res!361737 () Bool)

(assert (=> b!572087 (=> (not res!361737) (not e!329047))))

(declare-fun lt!260942 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35824 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572087 (= res!361737 (= lt!260941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260942 lt!260944 lt!260943 mask!3119)))))

(declare-fun lt!260946 () (_ BitVec 32))

(assert (=> b!572087 (= lt!260941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260946 (select (arr!17201 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572087 (= lt!260942 (toIndex!0 lt!260944 mask!3119))))

(assert (=> b!572087 (= lt!260944 (select (store (arr!17201 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572087 (= lt!260946 (toIndex!0 (select (arr!17201 a!3118) j!142) mask!3119))))

(assert (=> b!572087 (= lt!260943 (array!35825 (store (arr!17201 a!3118) i!1132 k0!1914) (size!17566 a!3118)))))

(declare-fun b!572088 () Bool)

(declare-fun res!361732 () Bool)

(assert (=> b!572088 (=> (not res!361732) (not e!329052))))

(declare-fun arrayContainsKey!0 (array!35824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572088 (= res!361732 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572089 () Bool)

(declare-fun res!361731 () Bool)

(assert (=> b!572089 (=> (not res!361731) (not e!329051))))

(assert (=> b!572089 (= res!361731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52418 res!361736) b!572078))

(assert (= (and b!572078 res!361738) b!572079))

(assert (= (and b!572079 res!361734) b!572084))

(assert (= (and b!572084 res!361730) b!572088))

(assert (= (and b!572088 res!361732) b!572080))

(assert (= (and b!572080 res!361729) b!572089))

(assert (= (and b!572089 res!361731) b!572082))

(assert (= (and b!572082 res!361733) b!572087))

(assert (= (and b!572087 res!361737) b!572083))

(assert (= (and b!572083 res!361739) b!572086))

(assert (= (and b!572086 (not res!361728)) b!572077))

(assert (= (and b!572077 (not res!361735)) b!572081))

(assert (= (and b!572081 res!361727) b!572085))

(declare-fun m!550541 () Bool)

(assert (=> b!572085 m!550541))

(declare-fun m!550543 () Bool)

(assert (=> b!572085 m!550543))

(declare-fun m!550545 () Bool)

(assert (=> b!572079 m!550545))

(assert (=> b!572079 m!550545))

(declare-fun m!550547 () Bool)

(assert (=> b!572079 m!550547))

(assert (=> b!572081 m!550545))

(assert (=> b!572081 m!550545))

(declare-fun m!550549 () Bool)

(assert (=> b!572081 m!550549))

(assert (=> b!572077 m!550545))

(declare-fun m!550551 () Bool)

(assert (=> b!572077 m!550551))

(declare-fun m!550553 () Bool)

(assert (=> start!52418 m!550553))

(declare-fun m!550555 () Bool)

(assert (=> start!52418 m!550555))

(assert (=> b!572087 m!550545))

(declare-fun m!550557 () Bool)

(assert (=> b!572087 m!550557))

(assert (=> b!572087 m!550545))

(declare-fun m!550559 () Bool)

(assert (=> b!572087 m!550559))

(declare-fun m!550561 () Bool)

(assert (=> b!572087 m!550561))

(declare-fun m!550563 () Bool)

(assert (=> b!572087 m!550563))

(declare-fun m!550565 () Bool)

(assert (=> b!572087 m!550565))

(assert (=> b!572087 m!550545))

(declare-fun m!550567 () Bool)

(assert (=> b!572087 m!550567))

(declare-fun m!550569 () Bool)

(assert (=> b!572089 m!550569))

(declare-fun m!550571 () Bool)

(assert (=> b!572084 m!550571))

(assert (=> b!572083 m!550545))

(assert (=> b!572083 m!550545))

(declare-fun m!550573 () Bool)

(assert (=> b!572083 m!550573))

(declare-fun m!550575 () Bool)

(assert (=> b!572083 m!550575))

(declare-fun m!550577 () Bool)

(assert (=> b!572083 m!550577))

(declare-fun m!550579 () Bool)

(assert (=> b!572080 m!550579))

(declare-fun m!550581 () Bool)

(assert (=> b!572088 m!550581))

(declare-fun m!550583 () Bool)

(assert (=> b!572082 m!550583))

(check-sat (not b!572089) (not b!572083) (not b!572079) (not b!572081) (not b!572084) (not b!572088) (not b!572080) (not b!572085) (not b!572082) (not start!52418) (not b!572087))
(check-sat)
