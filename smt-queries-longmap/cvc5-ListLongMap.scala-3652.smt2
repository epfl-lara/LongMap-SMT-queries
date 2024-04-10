; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50408 () Bool)

(assert start!50408)

(declare-fun b!551243 () Bool)

(declare-fun e!318181 () Bool)

(assert (=> b!551243 (= e!318181 (not true))))

(declare-fun e!318183 () Bool)

(assert (=> b!551243 e!318183))

(declare-fun res!344023 () Bool)

(assert (=> b!551243 (=> (not res!344023) (not e!318183))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34747 0))(
  ( (array!34748 (arr!16686 (Array (_ BitVec 32) (_ BitVec 64))) (size!17050 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34747)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34747 (_ BitVec 32)) Bool)

(assert (=> b!551243 (= res!344023 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17044 0))(
  ( (Unit!17045) )
))
(declare-fun lt!250792 () Unit!17044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17044)

(assert (=> b!551243 (= lt!250792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551245 () Bool)

(declare-fun res!344024 () Bool)

(declare-fun e!318180 () Bool)

(assert (=> b!551245 (=> (not res!344024) (not e!318180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551245 (= res!344024 (validKeyInArray!0 (select (arr!16686 a!3118) j!142)))))

(declare-fun b!551246 () Bool)

(declare-fun res!344025 () Bool)

(assert (=> b!551246 (=> (not res!344025) (not e!318180))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551246 (= res!344025 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551247 () Bool)

(declare-fun res!344021 () Bool)

(assert (=> b!551247 (=> (not res!344021) (not e!318181))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5135 0))(
  ( (MissingZero!5135 (index!22767 (_ BitVec 32))) (Found!5135 (index!22768 (_ BitVec 32))) (Intermediate!5135 (undefined!5947 Bool) (index!22769 (_ BitVec 32)) (x!51701 (_ BitVec 32))) (Undefined!5135) (MissingVacant!5135 (index!22770 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34747 (_ BitVec 32)) SeekEntryResult!5135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551247 (= res!344021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16686 a!3118) j!142) mask!3119) (select (arr!16686 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16686 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16686 a!3118) i!1132 k!1914) j!142) (array!34748 (store (arr!16686 a!3118) i!1132 k!1914) (size!17050 a!3118)) mask!3119)))))

(declare-fun b!551248 () Bool)

(declare-fun res!344022 () Bool)

(assert (=> b!551248 (=> (not res!344022) (not e!318180))))

(assert (=> b!551248 (= res!344022 (validKeyInArray!0 k!1914))))

(declare-fun b!551249 () Bool)

(declare-fun res!344030 () Bool)

(assert (=> b!551249 (=> (not res!344030) (not e!318181))))

(assert (=> b!551249 (= res!344030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551250 () Bool)

(declare-fun res!344026 () Bool)

(assert (=> b!551250 (=> (not res!344026) (not e!318180))))

(assert (=> b!551250 (= res!344026 (and (= (size!17050 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17050 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17050 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551251 () Bool)

(assert (=> b!551251 (= e!318180 e!318181)))

(declare-fun res!344029 () Bool)

(assert (=> b!551251 (=> (not res!344029) (not e!318181))))

(declare-fun lt!250791 () SeekEntryResult!5135)

(assert (=> b!551251 (= res!344029 (or (= lt!250791 (MissingZero!5135 i!1132)) (= lt!250791 (MissingVacant!5135 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34747 (_ BitVec 32)) SeekEntryResult!5135)

(assert (=> b!551251 (= lt!250791 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551252 () Bool)

(declare-fun res!344027 () Bool)

(assert (=> b!551252 (=> (not res!344027) (not e!318181))))

(declare-datatypes ((List!10766 0))(
  ( (Nil!10763) (Cons!10762 (h!11741 (_ BitVec 64)) (t!16994 List!10766)) )
))
(declare-fun arrayNoDuplicates!0 (array!34747 (_ BitVec 32) List!10766) Bool)

(assert (=> b!551252 (= res!344027 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10763))))

(declare-fun res!344028 () Bool)

(assert (=> start!50408 (=> (not res!344028) (not e!318180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50408 (= res!344028 (validMask!0 mask!3119))))

(assert (=> start!50408 e!318180))

(assert (=> start!50408 true))

(declare-fun array_inv!12482 (array!34747) Bool)

(assert (=> start!50408 (array_inv!12482 a!3118)))

(declare-fun b!551244 () Bool)

(assert (=> b!551244 (= e!318183 (= (seekEntryOrOpen!0 (select (arr!16686 a!3118) j!142) a!3118 mask!3119) (Found!5135 j!142)))))

(assert (= (and start!50408 res!344028) b!551250))

(assert (= (and b!551250 res!344026) b!551245))

(assert (= (and b!551245 res!344024) b!551248))

(assert (= (and b!551248 res!344022) b!551246))

(assert (= (and b!551246 res!344025) b!551251))

(assert (= (and b!551251 res!344029) b!551249))

(assert (= (and b!551249 res!344030) b!551252))

(assert (= (and b!551252 res!344027) b!551247))

(assert (= (and b!551247 res!344021) b!551243))

(assert (= (and b!551243 res!344023) b!551244))

(declare-fun m!528189 () Bool)

(assert (=> b!551248 m!528189))

(declare-fun m!528191 () Bool)

(assert (=> b!551244 m!528191))

(assert (=> b!551244 m!528191))

(declare-fun m!528193 () Bool)

(assert (=> b!551244 m!528193))

(declare-fun m!528195 () Bool)

(assert (=> start!50408 m!528195))

(declare-fun m!528197 () Bool)

(assert (=> start!50408 m!528197))

(declare-fun m!528199 () Bool)

(assert (=> b!551246 m!528199))

(assert (=> b!551247 m!528191))

(declare-fun m!528201 () Bool)

(assert (=> b!551247 m!528201))

(assert (=> b!551247 m!528191))

(declare-fun m!528203 () Bool)

(assert (=> b!551247 m!528203))

(declare-fun m!528205 () Bool)

(assert (=> b!551247 m!528205))

(assert (=> b!551247 m!528203))

(declare-fun m!528207 () Bool)

(assert (=> b!551247 m!528207))

(assert (=> b!551247 m!528201))

(assert (=> b!551247 m!528191))

(declare-fun m!528209 () Bool)

(assert (=> b!551247 m!528209))

(declare-fun m!528211 () Bool)

(assert (=> b!551247 m!528211))

(assert (=> b!551247 m!528203))

(assert (=> b!551247 m!528205))

(declare-fun m!528213 () Bool)

(assert (=> b!551243 m!528213))

(declare-fun m!528215 () Bool)

(assert (=> b!551243 m!528215))

(declare-fun m!528217 () Bool)

(assert (=> b!551251 m!528217))

(assert (=> b!551245 m!528191))

(assert (=> b!551245 m!528191))

(declare-fun m!528219 () Bool)

(assert (=> b!551245 m!528219))

(declare-fun m!528221 () Bool)

(assert (=> b!551252 m!528221))

(declare-fun m!528223 () Bool)

(assert (=> b!551249 m!528223))

(push 1)

