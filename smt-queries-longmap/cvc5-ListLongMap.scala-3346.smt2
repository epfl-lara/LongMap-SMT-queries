; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46068 () Bool)

(assert start!46068)

(declare-fun b!510216 () Bool)

(declare-fun res!311069 () Bool)

(declare-fun e!298268 () Bool)

(assert (=> b!510216 (=> (not res!311069) (not e!298268))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510216 (= res!311069 (validKeyInArray!0 k!2280))))

(declare-fun b!510217 () Bool)

(declare-fun res!311063 () Bool)

(assert (=> b!510217 (=> (not res!311063) (not e!298268))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32779 0))(
  ( (array!32780 (arr!15768 (Array (_ BitVec 32) (_ BitVec 64))) (size!16132 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32779)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510217 (= res!311063 (and (= (size!16132 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16132 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16132 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510218 () Bool)

(declare-fun e!298267 () Bool)

(assert (=> b!510218 (= e!298268 e!298267)))

(declare-fun res!311068 () Bool)

(assert (=> b!510218 (=> (not res!311068) (not e!298267))))

(declare-datatypes ((SeekEntryResult!4235 0))(
  ( (MissingZero!4235 (index!19128 (_ BitVec 32))) (Found!4235 (index!19129 (_ BitVec 32))) (Intermediate!4235 (undefined!5047 Bool) (index!19130 (_ BitVec 32)) (x!48092 (_ BitVec 32))) (Undefined!4235) (MissingVacant!4235 (index!19131 (_ BitVec 32))) )
))
(declare-fun lt!233236 () SeekEntryResult!4235)

(assert (=> b!510218 (= res!311068 (or (= lt!233236 (MissingZero!4235 i!1204)) (= lt!233236 (MissingVacant!4235 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32779 (_ BitVec 32)) SeekEntryResult!4235)

(assert (=> b!510218 (= lt!233236 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510219 () Bool)

(declare-fun res!311061 () Bool)

(assert (=> b!510219 (=> (not res!311061) (not e!298267))))

(declare-datatypes ((List!9926 0))(
  ( (Nil!9923) (Cons!9922 (h!10799 (_ BitVec 64)) (t!16154 List!9926)) )
))
(declare-fun arrayNoDuplicates!0 (array!32779 (_ BitVec 32) List!9926) Bool)

(assert (=> b!510219 (= res!311061 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9923))))

(declare-fun b!510220 () Bool)

(declare-fun e!298269 () Bool)

(assert (=> b!510220 (= e!298269 true)))

(declare-fun lt!233235 () array!32779)

(declare-fun lt!233239 () SeekEntryResult!4235)

(declare-fun lt!233237 () (_ BitVec 64))

(assert (=> b!510220 (= lt!233239 (seekEntryOrOpen!0 lt!233237 lt!233235 mask!3524))))

(declare-datatypes ((Unit!15728 0))(
  ( (Unit!15729) )
))
(declare-fun lt!233238 () Unit!15728)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15728)

(assert (=> b!510220 (= lt!233238 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510221 () Bool)

(declare-fun res!311065 () Bool)

(assert (=> b!510221 (=> (not res!311065) (not e!298267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32779 (_ BitVec 32)) Bool)

(assert (=> b!510221 (= res!311065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510222 () Bool)

(declare-fun res!311062 () Bool)

(assert (=> b!510222 (=> (not res!311062) (not e!298268))))

(assert (=> b!510222 (= res!311062 (validKeyInArray!0 (select (arr!15768 a!3235) j!176)))))

(declare-fun b!510224 () Bool)

(assert (=> b!510224 (= e!298267 (not e!298269))))

(declare-fun res!311067 () Bool)

(assert (=> b!510224 (=> res!311067 e!298269)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32779 (_ BitVec 32)) SeekEntryResult!4235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510224 (= res!311067 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15768 a!3235) j!176) mask!3524) (select (arr!15768 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233237 mask!3524) lt!233237 lt!233235 mask!3524))))))

(assert (=> b!510224 (= lt!233237 (select (store (arr!15768 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510224 (= lt!233235 (array!32780 (store (arr!15768 a!3235) i!1204 k!2280) (size!16132 a!3235)))))

(assert (=> b!510224 (= lt!233239 (Found!4235 j!176))))

(assert (=> b!510224 (= lt!233239 (seekEntryOrOpen!0 (select (arr!15768 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510224 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233234 () Unit!15728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15728)

(assert (=> b!510224 (= lt!233234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510223 () Bool)

(declare-fun res!311064 () Bool)

(assert (=> b!510223 (=> (not res!311064) (not e!298268))))

(declare-fun arrayContainsKey!0 (array!32779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510223 (= res!311064 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311066 () Bool)

(assert (=> start!46068 (=> (not res!311066) (not e!298268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46068 (= res!311066 (validMask!0 mask!3524))))

(assert (=> start!46068 e!298268))

(assert (=> start!46068 true))

(declare-fun array_inv!11564 (array!32779) Bool)

(assert (=> start!46068 (array_inv!11564 a!3235)))

(assert (= (and start!46068 res!311066) b!510217))

(assert (= (and b!510217 res!311063) b!510222))

(assert (= (and b!510222 res!311062) b!510216))

(assert (= (and b!510216 res!311069) b!510223))

(assert (= (and b!510223 res!311064) b!510218))

(assert (= (and b!510218 res!311068) b!510221))

(assert (= (and b!510221 res!311065) b!510219))

(assert (= (and b!510219 res!311061) b!510224))

(assert (= (and b!510224 (not res!311067)) b!510220))

(declare-fun m!491373 () Bool)

(assert (=> b!510224 m!491373))

(declare-fun m!491375 () Bool)

(assert (=> b!510224 m!491375))

(declare-fun m!491377 () Bool)

(assert (=> b!510224 m!491377))

(declare-fun m!491379 () Bool)

(assert (=> b!510224 m!491379))

(declare-fun m!491381 () Bool)

(assert (=> b!510224 m!491381))

(declare-fun m!491383 () Bool)

(assert (=> b!510224 m!491383))

(assert (=> b!510224 m!491381))

(assert (=> b!510224 m!491379))

(declare-fun m!491385 () Bool)

(assert (=> b!510224 m!491385))

(assert (=> b!510224 m!491381))

(assert (=> b!510224 m!491381))

(declare-fun m!491387 () Bool)

(assert (=> b!510224 m!491387))

(declare-fun m!491389 () Bool)

(assert (=> b!510224 m!491389))

(assert (=> b!510224 m!491385))

(declare-fun m!491391 () Bool)

(assert (=> b!510224 m!491391))

(declare-fun m!491393 () Bool)

(assert (=> b!510219 m!491393))

(assert (=> b!510222 m!491381))

(assert (=> b!510222 m!491381))

(declare-fun m!491395 () Bool)

(assert (=> b!510222 m!491395))

(declare-fun m!491397 () Bool)

(assert (=> start!46068 m!491397))

(declare-fun m!491399 () Bool)

(assert (=> start!46068 m!491399))

(declare-fun m!491401 () Bool)

(assert (=> b!510220 m!491401))

(declare-fun m!491403 () Bool)

(assert (=> b!510220 m!491403))

(declare-fun m!491405 () Bool)

(assert (=> b!510218 m!491405))

(declare-fun m!491407 () Bool)

(assert (=> b!510216 m!491407))

(declare-fun m!491409 () Bool)

(assert (=> b!510221 m!491409))

(declare-fun m!491411 () Bool)

(assert (=> b!510223 m!491411))

(push 1)

