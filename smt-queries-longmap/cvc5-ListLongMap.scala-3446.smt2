; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47796 () Bool)

(assert start!47796)

(declare-fun b!526516 () Bool)

(declare-fun res!323127 () Bool)

(declare-fun e!306901 () Bool)

(assert (=> b!526516 (=> (not res!323127) (not e!306901))))

(declare-datatypes ((array!33433 0))(
  ( (array!33434 (arr!16068 (Array (_ BitVec 32) (_ BitVec 64))) (size!16432 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33433)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526516 (= res!323127 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526517 () Bool)

(declare-datatypes ((Unit!16592 0))(
  ( (Unit!16593) )
))
(declare-fun e!306902 () Unit!16592)

(declare-fun Unit!16594 () Unit!16592)

(assert (=> b!526517 (= e!306902 Unit!16594)))

(declare-fun b!526518 () Bool)

(declare-fun res!323136 () Bool)

(assert (=> b!526518 (=> (not res!323136) (not e!306901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526518 (= res!323136 (validKeyInArray!0 k!2280))))

(declare-fun b!526519 () Bool)

(declare-fun e!306897 () Bool)

(assert (=> b!526519 (= e!306897 false)))

(declare-fun res!323128 () Bool)

(assert (=> start!47796 (=> (not res!323128) (not e!306901))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47796 (= res!323128 (validMask!0 mask!3524))))

(assert (=> start!47796 e!306901))

(assert (=> start!47796 true))

(declare-fun array_inv!11864 (array!33433) Bool)

(assert (=> start!47796 (array_inv!11864 a!3235)))

(declare-fun b!526520 () Bool)

(declare-fun e!306898 () Bool)

(declare-fun e!306899 () Bool)

(assert (=> b!526520 (= e!306898 (not e!306899))))

(declare-fun res!323129 () Bool)

(assert (=> b!526520 (=> res!323129 e!306899)))

(declare-fun lt!242168 () array!33433)

(declare-fun lt!242167 () (_ BitVec 32))

(declare-fun lt!242164 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4535 0))(
  ( (MissingZero!4535 (index!20352 (_ BitVec 32))) (Found!4535 (index!20353 (_ BitVec 32))) (Intermediate!4535 (undefined!5347 Bool) (index!20354 (_ BitVec 32)) (x!49324 (_ BitVec 32))) (Undefined!4535) (MissingVacant!4535 (index!20355 (_ BitVec 32))) )
))
(declare-fun lt!242173 () SeekEntryResult!4535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33433 (_ BitVec 32)) SeekEntryResult!4535)

(assert (=> b!526520 (= res!323129 (= lt!242173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242167 lt!242164 lt!242168 mask!3524)))))

(declare-fun lt!242170 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526520 (= lt!242173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242170 (select (arr!16068 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526520 (= lt!242167 (toIndex!0 lt!242164 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526520 (= lt!242164 (select (store (arr!16068 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526520 (= lt!242170 (toIndex!0 (select (arr!16068 a!3235) j!176) mask!3524))))

(assert (=> b!526520 (= lt!242168 (array!33434 (store (arr!16068 a!3235) i!1204 k!2280) (size!16432 a!3235)))))

(declare-fun e!306900 () Bool)

(assert (=> b!526520 e!306900))

(declare-fun res!323133 () Bool)

(assert (=> b!526520 (=> (not res!323133) (not e!306900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33433 (_ BitVec 32)) Bool)

(assert (=> b!526520 (= res!323133 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242172 () Unit!16592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16592)

(assert (=> b!526520 (= lt!242172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526521 () Bool)

(assert (=> b!526521 (= e!306901 e!306898)))

(declare-fun res!323135 () Bool)

(assert (=> b!526521 (=> (not res!323135) (not e!306898))))

(declare-fun lt!242165 () SeekEntryResult!4535)

(assert (=> b!526521 (= res!323135 (or (= lt!242165 (MissingZero!4535 i!1204)) (= lt!242165 (MissingVacant!4535 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33433 (_ BitVec 32)) SeekEntryResult!4535)

(assert (=> b!526521 (= lt!242165 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526522 () Bool)

(declare-fun Unit!16595 () Unit!16592)

(assert (=> b!526522 (= e!306902 Unit!16595)))

(declare-fun lt!242169 () Unit!16592)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16592)

(assert (=> b!526522 (= lt!242169 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242170 #b00000000000000000000000000000000 (index!20354 lt!242173) (x!49324 lt!242173) mask!3524))))

(declare-fun res!323130 () Bool)

(assert (=> b!526522 (= res!323130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242170 lt!242164 lt!242168 mask!3524) (Intermediate!4535 false (index!20354 lt!242173) (x!49324 lt!242173))))))

(assert (=> b!526522 (=> (not res!323130) (not e!306897))))

(assert (=> b!526522 e!306897))

(declare-fun b!526523 () Bool)

(declare-fun res!323134 () Bool)

(assert (=> b!526523 (=> (not res!323134) (not e!306898))))

(declare-datatypes ((List!10226 0))(
  ( (Nil!10223) (Cons!10222 (h!11153 (_ BitVec 64)) (t!16454 List!10226)) )
))
(declare-fun arrayNoDuplicates!0 (array!33433 (_ BitVec 32) List!10226) Bool)

(assert (=> b!526523 (= res!323134 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10223))))

(declare-fun b!526524 () Bool)

(assert (=> b!526524 (= e!306900 (= (seekEntryOrOpen!0 (select (arr!16068 a!3235) j!176) a!3235 mask!3524) (Found!4535 j!176)))))

(declare-fun b!526525 () Bool)

(declare-fun res!323138 () Bool)

(assert (=> b!526525 (=> (not res!323138) (not e!306901))))

(assert (=> b!526525 (= res!323138 (validKeyInArray!0 (select (arr!16068 a!3235) j!176)))))

(declare-fun b!526526 () Bool)

(declare-fun res!323137 () Bool)

(assert (=> b!526526 (=> (not res!323137) (not e!306898))))

(assert (=> b!526526 (= res!323137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526527 () Bool)

(declare-fun res!323132 () Bool)

(assert (=> b!526527 (=> res!323132 e!306899)))

(assert (=> b!526527 (= res!323132 (or (undefined!5347 lt!242173) (not (is-Intermediate!4535 lt!242173))))))

(declare-fun b!526528 () Bool)

(assert (=> b!526528 (= e!306899 true)))

(assert (=> b!526528 (= (index!20354 lt!242173) i!1204)))

(declare-fun lt!242171 () Unit!16592)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16592)

(assert (=> b!526528 (= lt!242171 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242170 #b00000000000000000000000000000000 (index!20354 lt!242173) (x!49324 lt!242173) mask!3524))))

(assert (=> b!526528 (and (or (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242166 () Unit!16592)

(assert (=> b!526528 (= lt!242166 e!306902)))

(declare-fun c!62000 () Bool)

(assert (=> b!526528 (= c!62000 (= (select (arr!16068 a!3235) (index!20354 lt!242173)) (select (arr!16068 a!3235) j!176)))))

(assert (=> b!526528 (and (bvslt (x!49324 lt!242173) #b01111111111111111111111111111110) (or (= (select (arr!16068 a!3235) (index!20354 lt!242173)) (select (arr!16068 a!3235) j!176)) (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16068 a!3235) (index!20354 lt!242173)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526529 () Bool)

(declare-fun res!323131 () Bool)

(assert (=> b!526529 (=> (not res!323131) (not e!306901))))

(assert (=> b!526529 (= res!323131 (and (= (size!16432 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16432 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16432 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47796 res!323128) b!526529))

(assert (= (and b!526529 res!323131) b!526525))

(assert (= (and b!526525 res!323138) b!526518))

(assert (= (and b!526518 res!323136) b!526516))

(assert (= (and b!526516 res!323127) b!526521))

(assert (= (and b!526521 res!323135) b!526526))

(assert (= (and b!526526 res!323137) b!526523))

(assert (= (and b!526523 res!323134) b!526520))

(assert (= (and b!526520 res!323133) b!526524))

(assert (= (and b!526520 (not res!323129)) b!526527))

(assert (= (and b!526527 (not res!323132)) b!526528))

(assert (= (and b!526528 c!62000) b!526522))

(assert (= (and b!526528 (not c!62000)) b!526517))

(assert (= (and b!526522 res!323130) b!526519))

(declare-fun m!507225 () Bool)

(assert (=> b!526528 m!507225))

(declare-fun m!507227 () Bool)

(assert (=> b!526528 m!507227))

(declare-fun m!507229 () Bool)

(assert (=> b!526528 m!507229))

(declare-fun m!507231 () Bool)

(assert (=> b!526516 m!507231))

(declare-fun m!507233 () Bool)

(assert (=> b!526521 m!507233))

(declare-fun m!507235 () Bool)

(assert (=> b!526522 m!507235))

(declare-fun m!507237 () Bool)

(assert (=> b!526522 m!507237))

(assert (=> b!526525 m!507229))

(assert (=> b!526525 m!507229))

(declare-fun m!507239 () Bool)

(assert (=> b!526525 m!507239))

(declare-fun m!507241 () Bool)

(assert (=> b!526523 m!507241))

(assert (=> b!526524 m!507229))

(assert (=> b!526524 m!507229))

(declare-fun m!507243 () Bool)

(assert (=> b!526524 m!507243))

(declare-fun m!507245 () Bool)

(assert (=> b!526518 m!507245))

(declare-fun m!507247 () Bool)

(assert (=> b!526526 m!507247))

(declare-fun m!507249 () Bool)

(assert (=> start!47796 m!507249))

(declare-fun m!507251 () Bool)

(assert (=> start!47796 m!507251))

(assert (=> b!526520 m!507229))

(declare-fun m!507253 () Bool)

(assert (=> b!526520 m!507253))

(declare-fun m!507255 () Bool)

(assert (=> b!526520 m!507255))

(declare-fun m!507257 () Bool)

(assert (=> b!526520 m!507257))

(declare-fun m!507259 () Bool)

(assert (=> b!526520 m!507259))

(assert (=> b!526520 m!507229))

(declare-fun m!507261 () Bool)

(assert (=> b!526520 m!507261))

(assert (=> b!526520 m!507229))

(declare-fun m!507263 () Bool)

(assert (=> b!526520 m!507263))

(declare-fun m!507265 () Bool)

(assert (=> b!526520 m!507265))

(declare-fun m!507267 () Bool)

(assert (=> b!526520 m!507267))

(push 1)

