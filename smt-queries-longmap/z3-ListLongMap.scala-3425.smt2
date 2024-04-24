; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47528 () Bool)

(assert start!47528)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33292 0))(
  ( (array!33293 (arr!16000 (Array (_ BitVec 32) (_ BitVec 64))) (size!16364 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33292)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!523146 () Bool)

(declare-fun e!305108 () Bool)

(declare-datatypes ((SeekEntryResult!4423 0))(
  ( (MissingZero!4423 (index!19898 (_ BitVec 32))) (Found!4423 (index!19899 (_ BitVec 32))) (Intermediate!4423 (undefined!5235 Bool) (index!19900 (_ BitVec 32)) (x!49023 (_ BitVec 32))) (Undefined!4423) (MissingVacant!4423 (index!19901 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33292 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!523146 (= e!305108 (= (seekEntryOrOpen!0 (select (arr!16000 a!3235) j!176) a!3235 mask!3524) (Found!4423 j!176)))))

(declare-fun b!523147 () Bool)

(declare-fun res!320593 () Bool)

(declare-fun e!305106 () Bool)

(assert (=> b!523147 (=> (not res!320593) (not e!305106))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523147 (= res!320593 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523148 () Bool)

(declare-fun res!320601 () Bool)

(assert (=> b!523148 (=> (not res!320601) (not e!305106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523148 (= res!320601 (validKeyInArray!0 (select (arr!16000 a!3235) j!176)))))

(declare-fun b!523149 () Bool)

(declare-fun res!320597 () Bool)

(declare-fun e!305111 () Bool)

(assert (=> b!523149 (=> res!320597 e!305111)))

(declare-fun lt!240043 () SeekEntryResult!4423)

(get-info :version)

(assert (=> b!523149 (= res!320597 (or (undefined!5235 lt!240043) (not ((_ is Intermediate!4423) lt!240043))))))

(declare-fun b!523150 () Bool)

(declare-fun res!320595 () Bool)

(assert (=> b!523150 (=> (not res!320595) (not e!305106))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523150 (= res!320595 (and (= (size!16364 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16364 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16364 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523151 () Bool)

(assert (=> b!523151 (= e!305111 (or (bvsgt #b00000000000000000000000000000000 (x!49023 lt!240043)) (bvsle (x!49023 lt!240043) #b01111111111111111111111111111110)))))

(assert (=> b!523151 (and (or (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16303 0))(
  ( (Unit!16304) )
))
(declare-fun lt!240048 () Unit!16303)

(declare-fun e!305110 () Unit!16303)

(assert (=> b!523151 (= lt!240048 e!305110)))

(declare-fun c!61580 () Bool)

(assert (=> b!523151 (= c!61580 (= (select (arr!16000 a!3235) (index!19900 lt!240043)) (select (arr!16000 a!3235) j!176)))))

(assert (=> b!523151 (and (bvslt (x!49023 lt!240043) #b01111111111111111111111111111110) (or (= (select (arr!16000 a!3235) (index!19900 lt!240043)) (select (arr!16000 a!3235) j!176)) (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16000 a!3235) (index!19900 lt!240043)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523152 () Bool)

(declare-fun Unit!16305 () Unit!16303)

(assert (=> b!523152 (= e!305110 Unit!16305)))

(declare-fun lt!240047 () (_ BitVec 32))

(declare-fun lt!240046 () Unit!16303)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33292 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16303)

(assert (=> b!523152 (= lt!240046 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240047 #b00000000000000000000000000000000 (index!19900 lt!240043) (x!49023 lt!240043) mask!3524))))

(declare-fun res!320596 () Bool)

(declare-fun lt!240042 () (_ BitVec 64))

(declare-fun lt!240041 () array!33292)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33292 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!523152 (= res!320596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240047 lt!240042 lt!240041 mask!3524) (Intermediate!4423 false (index!19900 lt!240043) (x!49023 lt!240043))))))

(declare-fun e!305107 () Bool)

(assert (=> b!523152 (=> (not res!320596) (not e!305107))))

(assert (=> b!523152 e!305107))

(declare-fun b!523153 () Bool)

(declare-fun e!305109 () Bool)

(assert (=> b!523153 (= e!305106 e!305109)))

(declare-fun res!320591 () Bool)

(assert (=> b!523153 (=> (not res!320591) (not e!305109))))

(declare-fun lt!240044 () SeekEntryResult!4423)

(assert (=> b!523153 (= res!320591 (or (= lt!240044 (MissingZero!4423 i!1204)) (= lt!240044 (MissingVacant!4423 i!1204))))))

(assert (=> b!523153 (= lt!240044 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523154 () Bool)

(assert (=> b!523154 (= e!305107 false)))

(declare-fun b!523155 () Bool)

(assert (=> b!523155 (= e!305109 (not e!305111))))

(declare-fun res!320602 () Bool)

(assert (=> b!523155 (=> res!320602 e!305111)))

(declare-fun lt!240045 () (_ BitVec 32))

(assert (=> b!523155 (= res!320602 (= lt!240043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240045 lt!240042 lt!240041 mask!3524)))))

(assert (=> b!523155 (= lt!240043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240047 (select (arr!16000 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523155 (= lt!240045 (toIndex!0 lt!240042 mask!3524))))

(assert (=> b!523155 (= lt!240042 (select (store (arr!16000 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523155 (= lt!240047 (toIndex!0 (select (arr!16000 a!3235) j!176) mask!3524))))

(assert (=> b!523155 (= lt!240041 (array!33293 (store (arr!16000 a!3235) i!1204 k0!2280) (size!16364 a!3235)))))

(assert (=> b!523155 e!305108))

(declare-fun res!320599 () Bool)

(assert (=> b!523155 (=> (not res!320599) (not e!305108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33292 (_ BitVec 32)) Bool)

(assert (=> b!523155 (= res!320599 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240049 () Unit!16303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16303)

(assert (=> b!523155 (= lt!240049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!320592 () Bool)

(assert (=> start!47528 (=> (not res!320592) (not e!305106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47528 (= res!320592 (validMask!0 mask!3524))))

(assert (=> start!47528 e!305106))

(assert (=> start!47528 true))

(declare-fun array_inv!11859 (array!33292) Bool)

(assert (=> start!47528 (array_inv!11859 a!3235)))

(declare-fun b!523156 () Bool)

(declare-fun res!320598 () Bool)

(assert (=> b!523156 (=> (not res!320598) (not e!305109))))

(declare-datatypes ((List!10065 0))(
  ( (Nil!10062) (Cons!10061 (h!10986 (_ BitVec 64)) (t!16285 List!10065)) )
))
(declare-fun arrayNoDuplicates!0 (array!33292 (_ BitVec 32) List!10065) Bool)

(assert (=> b!523156 (= res!320598 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10062))))

(declare-fun b!523157 () Bool)

(declare-fun res!320600 () Bool)

(assert (=> b!523157 (=> (not res!320600) (not e!305109))))

(assert (=> b!523157 (= res!320600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523158 () Bool)

(declare-fun Unit!16306 () Unit!16303)

(assert (=> b!523158 (= e!305110 Unit!16306)))

(declare-fun b!523159 () Bool)

(declare-fun res!320594 () Bool)

(assert (=> b!523159 (=> (not res!320594) (not e!305106))))

(assert (=> b!523159 (= res!320594 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47528 res!320592) b!523150))

(assert (= (and b!523150 res!320595) b!523148))

(assert (= (and b!523148 res!320601) b!523159))

(assert (= (and b!523159 res!320594) b!523147))

(assert (= (and b!523147 res!320593) b!523153))

(assert (= (and b!523153 res!320591) b!523157))

(assert (= (and b!523157 res!320600) b!523156))

(assert (= (and b!523156 res!320598) b!523155))

(assert (= (and b!523155 res!320599) b!523146))

(assert (= (and b!523155 (not res!320602)) b!523149))

(assert (= (and b!523149 (not res!320597)) b!523151))

(assert (= (and b!523151 c!61580) b!523152))

(assert (= (and b!523151 (not c!61580)) b!523158))

(assert (= (and b!523152 res!320596) b!523154))

(declare-fun m!504211 () Bool)

(assert (=> b!523159 m!504211))

(declare-fun m!504213 () Bool)

(assert (=> b!523156 m!504213))

(declare-fun m!504215 () Bool)

(assert (=> b!523157 m!504215))

(declare-fun m!504217 () Bool)

(assert (=> b!523153 m!504217))

(declare-fun m!504219 () Bool)

(assert (=> b!523155 m!504219))

(declare-fun m!504221 () Bool)

(assert (=> b!523155 m!504221))

(declare-fun m!504223 () Bool)

(assert (=> b!523155 m!504223))

(declare-fun m!504225 () Bool)

(assert (=> b!523155 m!504225))

(declare-fun m!504227 () Bool)

(assert (=> b!523155 m!504227))

(declare-fun m!504229 () Bool)

(assert (=> b!523155 m!504229))

(assert (=> b!523155 m!504227))

(declare-fun m!504231 () Bool)

(assert (=> b!523155 m!504231))

(assert (=> b!523155 m!504227))

(declare-fun m!504233 () Bool)

(assert (=> b!523155 m!504233))

(declare-fun m!504235 () Bool)

(assert (=> b!523155 m!504235))

(declare-fun m!504237 () Bool)

(assert (=> b!523152 m!504237))

(declare-fun m!504239 () Bool)

(assert (=> b!523152 m!504239))

(assert (=> b!523146 m!504227))

(assert (=> b!523146 m!504227))

(declare-fun m!504241 () Bool)

(assert (=> b!523146 m!504241))

(declare-fun m!504243 () Bool)

(assert (=> b!523151 m!504243))

(assert (=> b!523151 m!504227))

(declare-fun m!504245 () Bool)

(assert (=> b!523147 m!504245))

(assert (=> b!523148 m!504227))

(assert (=> b!523148 m!504227))

(declare-fun m!504247 () Bool)

(assert (=> b!523148 m!504247))

(declare-fun m!504249 () Bool)

(assert (=> start!47528 m!504249))

(declare-fun m!504251 () Bool)

(assert (=> start!47528 m!504251))

(check-sat (not b!523155) (not b!523159) (not start!47528) (not b!523148) (not b!523147) (not b!523146) (not b!523153) (not b!523157) (not b!523156) (not b!523152))
(check-sat)
