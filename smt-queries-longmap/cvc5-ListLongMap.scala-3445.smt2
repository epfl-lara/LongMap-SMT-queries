; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47790 () Bool)

(assert start!47790)

(declare-fun b!526390 () Bool)

(declare-fun res!323028 () Bool)

(declare-fun e!306835 () Bool)

(assert (=> b!526390 (=> (not res!323028) (not e!306835))))

(declare-datatypes ((array!33427 0))(
  ( (array!33428 (arr!16065 (Array (_ BitVec 32) (_ BitVec 64))) (size!16429 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33427)

(declare-datatypes ((List!10223 0))(
  ( (Nil!10220) (Cons!10219 (h!11150 (_ BitVec 64)) (t!16451 List!10223)) )
))
(declare-fun arrayNoDuplicates!0 (array!33427 (_ BitVec 32) List!10223) Bool)

(assert (=> b!526390 (= res!323028 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10220))))

(declare-fun b!526391 () Bool)

(declare-fun res!323023 () Bool)

(declare-fun e!306834 () Bool)

(assert (=> b!526391 (=> res!323023 e!306834)))

(declare-datatypes ((SeekEntryResult!4532 0))(
  ( (MissingZero!4532 (index!20340 (_ BitVec 32))) (Found!4532 (index!20341 (_ BitVec 32))) (Intermediate!4532 (undefined!5344 Bool) (index!20342 (_ BitVec 32)) (x!49313 (_ BitVec 32))) (Undefined!4532) (MissingVacant!4532 (index!20343 (_ BitVec 32))) )
))
(declare-fun lt!242077 () SeekEntryResult!4532)

(assert (=> b!526391 (= res!323023 (or (undefined!5344 lt!242077) (not (is-Intermediate!4532 lt!242077))))))

(declare-fun b!526392 () Bool)

(declare-fun e!306838 () Bool)

(assert (=> b!526392 (= e!306838 e!306835)))

(declare-fun res!323029 () Bool)

(assert (=> b!526392 (=> (not res!323029) (not e!306835))))

(declare-fun lt!242083 () SeekEntryResult!4532)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526392 (= res!323029 (or (= lt!242083 (MissingZero!4532 i!1204)) (= lt!242083 (MissingVacant!4532 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33427 (_ BitVec 32)) SeekEntryResult!4532)

(assert (=> b!526392 (= lt!242083 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!323019 () Bool)

(assert (=> start!47790 (=> (not res!323019) (not e!306838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47790 (= res!323019 (validMask!0 mask!3524))))

(assert (=> start!47790 e!306838))

(assert (=> start!47790 true))

(declare-fun array_inv!11861 (array!33427) Bool)

(assert (=> start!47790 (array_inv!11861 a!3235)))

(declare-fun b!526393 () Bool)

(declare-fun e!306839 () Bool)

(assert (=> b!526393 (= e!306839 false)))

(declare-fun b!526394 () Bool)

(declare-fun res!323027 () Bool)

(assert (=> b!526394 (=> (not res!323027) (not e!306838))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526394 (= res!323027 (and (= (size!16429 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16429 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16429 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526395 () Bool)

(declare-fun res!323022 () Bool)

(assert (=> b!526395 (=> (not res!323022) (not e!306835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33427 (_ BitVec 32)) Bool)

(assert (=> b!526395 (= res!323022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526396 () Bool)

(declare-fun res!323020 () Bool)

(assert (=> b!526396 (=> (not res!323020) (not e!306838))))

(declare-fun arrayContainsKey!0 (array!33427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526396 (= res!323020 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526397 () Bool)

(declare-fun res!323021 () Bool)

(assert (=> b!526397 (=> (not res!323021) (not e!306838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526397 (= res!323021 (validKeyInArray!0 k!2280))))

(declare-fun b!526398 () Bool)

(assert (=> b!526398 (= e!306835 (not e!306834))))

(declare-fun res!323024 () Bool)

(assert (=> b!526398 (=> res!323024 e!306834)))

(declare-fun lt!242080 () (_ BitVec 32))

(declare-fun lt!242079 () (_ BitVec 64))

(declare-fun lt!242082 () array!33427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33427 (_ BitVec 32)) SeekEntryResult!4532)

(assert (=> b!526398 (= res!323024 (= lt!242077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242080 lt!242079 lt!242082 mask!3524)))))

(declare-fun lt!242081 () (_ BitVec 32))

(assert (=> b!526398 (= lt!242077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242081 (select (arr!16065 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526398 (= lt!242080 (toIndex!0 lt!242079 mask!3524))))

(assert (=> b!526398 (= lt!242079 (select (store (arr!16065 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526398 (= lt!242081 (toIndex!0 (select (arr!16065 a!3235) j!176) mask!3524))))

(assert (=> b!526398 (= lt!242082 (array!33428 (store (arr!16065 a!3235) i!1204 k!2280) (size!16429 a!3235)))))

(declare-fun e!306837 () Bool)

(assert (=> b!526398 e!306837))

(declare-fun res!323030 () Bool)

(assert (=> b!526398 (=> (not res!323030) (not e!306837))))

(assert (=> b!526398 (= res!323030 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16580 0))(
  ( (Unit!16581) )
))
(declare-fun lt!242074 () Unit!16580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16580)

(assert (=> b!526398 (= lt!242074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526399 () Bool)

(assert (=> b!526399 (= e!306837 (= (seekEntryOrOpen!0 (select (arr!16065 a!3235) j!176) a!3235 mask!3524) (Found!4532 j!176)))))

(declare-fun b!526400 () Bool)

(assert (=> b!526400 (= e!306834 true)))

(assert (=> b!526400 (= (index!20342 lt!242077) i!1204)))

(declare-fun lt!242076 () Unit!16580)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16580)

(assert (=> b!526400 (= lt!242076 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242081 #b00000000000000000000000000000000 (index!20342 lt!242077) (x!49313 lt!242077) mask!3524))))

(assert (=> b!526400 (and (or (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242078 () Unit!16580)

(declare-fun e!306840 () Unit!16580)

(assert (=> b!526400 (= lt!242078 e!306840)))

(declare-fun c!61991 () Bool)

(assert (=> b!526400 (= c!61991 (= (select (arr!16065 a!3235) (index!20342 lt!242077)) (select (arr!16065 a!3235) j!176)))))

(assert (=> b!526400 (and (bvslt (x!49313 lt!242077) #b01111111111111111111111111111110) (or (= (select (arr!16065 a!3235) (index!20342 lt!242077)) (select (arr!16065 a!3235) j!176)) (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16065 a!3235) (index!20342 lt!242077)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526401 () Bool)

(declare-fun Unit!16582 () Unit!16580)

(assert (=> b!526401 (= e!306840 Unit!16582)))

(declare-fun b!526402 () Bool)

(declare-fun Unit!16583 () Unit!16580)

(assert (=> b!526402 (= e!306840 Unit!16583)))

(declare-fun lt!242075 () Unit!16580)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16580)

(assert (=> b!526402 (= lt!242075 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242081 #b00000000000000000000000000000000 (index!20342 lt!242077) (x!49313 lt!242077) mask!3524))))

(declare-fun res!323025 () Bool)

(assert (=> b!526402 (= res!323025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242081 lt!242079 lt!242082 mask!3524) (Intermediate!4532 false (index!20342 lt!242077) (x!49313 lt!242077))))))

(assert (=> b!526402 (=> (not res!323025) (not e!306839))))

(assert (=> b!526402 e!306839))

(declare-fun b!526403 () Bool)

(declare-fun res!323026 () Bool)

(assert (=> b!526403 (=> (not res!323026) (not e!306838))))

(assert (=> b!526403 (= res!323026 (validKeyInArray!0 (select (arr!16065 a!3235) j!176)))))

(assert (= (and start!47790 res!323019) b!526394))

(assert (= (and b!526394 res!323027) b!526403))

(assert (= (and b!526403 res!323026) b!526397))

(assert (= (and b!526397 res!323021) b!526396))

(assert (= (and b!526396 res!323020) b!526392))

(assert (= (and b!526392 res!323029) b!526395))

(assert (= (and b!526395 res!323022) b!526390))

(assert (= (and b!526390 res!323028) b!526398))

(assert (= (and b!526398 res!323030) b!526399))

(assert (= (and b!526398 (not res!323024)) b!526391))

(assert (= (and b!526391 (not res!323023)) b!526400))

(assert (= (and b!526400 c!61991) b!526402))

(assert (= (and b!526400 (not c!61991)) b!526401))

(assert (= (and b!526402 res!323025) b!526393))

(declare-fun m!507093 () Bool)

(assert (=> b!526392 m!507093))

(declare-fun m!507095 () Bool)

(assert (=> b!526396 m!507095))

(declare-fun m!507097 () Bool)

(assert (=> b!526400 m!507097))

(declare-fun m!507099 () Bool)

(assert (=> b!526400 m!507099))

(declare-fun m!507101 () Bool)

(assert (=> b!526400 m!507101))

(declare-fun m!507103 () Bool)

(assert (=> b!526397 m!507103))

(assert (=> b!526403 m!507101))

(assert (=> b!526403 m!507101))

(declare-fun m!507105 () Bool)

(assert (=> b!526403 m!507105))

(declare-fun m!507107 () Bool)

(assert (=> start!47790 m!507107))

(declare-fun m!507109 () Bool)

(assert (=> start!47790 m!507109))

(assert (=> b!526399 m!507101))

(assert (=> b!526399 m!507101))

(declare-fun m!507111 () Bool)

(assert (=> b!526399 m!507111))

(declare-fun m!507113 () Bool)

(assert (=> b!526395 m!507113))

(declare-fun m!507115 () Bool)

(assert (=> b!526390 m!507115))

(declare-fun m!507117 () Bool)

(assert (=> b!526402 m!507117))

(declare-fun m!507119 () Bool)

(assert (=> b!526402 m!507119))

(declare-fun m!507121 () Bool)

(assert (=> b!526398 m!507121))

(declare-fun m!507123 () Bool)

(assert (=> b!526398 m!507123))

(declare-fun m!507125 () Bool)

(assert (=> b!526398 m!507125))

(declare-fun m!507127 () Bool)

(assert (=> b!526398 m!507127))

(assert (=> b!526398 m!507101))

(declare-fun m!507129 () Bool)

(assert (=> b!526398 m!507129))

(assert (=> b!526398 m!507101))

(declare-fun m!507131 () Bool)

(assert (=> b!526398 m!507131))

(declare-fun m!507133 () Bool)

(assert (=> b!526398 m!507133))

(declare-fun m!507135 () Bool)

(assert (=> b!526398 m!507135))

(assert (=> b!526398 m!507101))

(push 1)

