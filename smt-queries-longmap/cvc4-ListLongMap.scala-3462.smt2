; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48106 () Bool)

(assert start!48106)

(declare-fun b!529708 () Bool)

(declare-fun e!308665 () Bool)

(declare-fun e!308664 () Bool)

(assert (=> b!529708 (= e!308665 e!308664)))

(declare-fun res!325418 () Bool)

(assert (=> b!529708 (=> res!325418 e!308664)))

(declare-fun lt!244211 () Bool)

(declare-datatypes ((SeekEntryResult!4585 0))(
  ( (MissingZero!4585 (index!20564 (_ BitVec 32))) (Found!4585 (index!20565 (_ BitVec 32))) (Intermediate!4585 (undefined!5397 Bool) (index!20566 (_ BitVec 32)) (x!49535 (_ BitVec 32))) (Undefined!4585) (MissingVacant!4585 (index!20567 (_ BitVec 32))) )
))
(declare-fun lt!244214 () SeekEntryResult!4585)

(assert (=> b!529708 (= res!325418 (or (and (not lt!244211) (undefined!5397 lt!244214)) (and (not lt!244211) (not (undefined!5397 lt!244214)))))))

(assert (=> b!529708 (= lt!244211 (not (is-Intermediate!4585 lt!244214)))))

(declare-fun b!529709 () Bool)

(declare-fun res!325422 () Bool)

(declare-fun e!308663 () Bool)

(assert (=> b!529709 (=> (not res!325422) (not e!308663))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529709 (= res!325422 (validKeyInArray!0 k!2280))))

(declare-fun b!529710 () Bool)

(declare-fun res!325417 () Bool)

(declare-fun e!308666 () Bool)

(assert (=> b!529710 (=> (not res!325417) (not e!308666))))

(declare-datatypes ((array!33542 0))(
  ( (array!33543 (arr!16118 (Array (_ BitVec 32) (_ BitVec 64))) (size!16482 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33542)

(declare-datatypes ((List!10276 0))(
  ( (Nil!10273) (Cons!10272 (h!11212 (_ BitVec 64)) (t!16504 List!10276)) )
))
(declare-fun arrayNoDuplicates!0 (array!33542 (_ BitVec 32) List!10276) Bool)

(assert (=> b!529710 (= res!325417 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10273))))

(declare-fun b!529711 () Bool)

(declare-fun res!325424 () Bool)

(assert (=> b!529711 (=> (not res!325424) (not e!308666))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33542 (_ BitVec 32)) Bool)

(assert (=> b!529711 (= res!325424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529712 () Bool)

(assert (=> b!529712 (= e!308666 (not e!308665))))

(declare-fun res!325421 () Bool)

(assert (=> b!529712 (=> res!325421 e!308665)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!244213 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33542 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!529712 (= res!325421 (= lt!244214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244213 (select (store (arr!16118 a!3235) i!1204 k!2280) j!176) (array!33543 (store (arr!16118 a!3235) i!1204 k!2280) (size!16482 a!3235)) mask!3524)))))

(declare-fun lt!244215 () (_ BitVec 32))

(assert (=> b!529712 (= lt!244214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244215 (select (arr!16118 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529712 (= lt!244213 (toIndex!0 (select (store (arr!16118 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529712 (= lt!244215 (toIndex!0 (select (arr!16118 a!3235) j!176) mask!3524))))

(declare-fun e!308662 () Bool)

(assert (=> b!529712 e!308662))

(declare-fun res!325415 () Bool)

(assert (=> b!529712 (=> (not res!325415) (not e!308662))))

(assert (=> b!529712 (= res!325415 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16782 0))(
  ( (Unit!16783) )
))
(declare-fun lt!244212 () Unit!16782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16782)

(assert (=> b!529712 (= lt!244212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529713 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33542 (_ BitVec 32)) SeekEntryResult!4585)

(assert (=> b!529713 (= e!308662 (= (seekEntryOrOpen!0 (select (arr!16118 a!3235) j!176) a!3235 mask!3524) (Found!4585 j!176)))))

(declare-fun b!529714 () Bool)

(assert (=> b!529714 (= e!308664 true)))

(assert (=> b!529714 false))

(declare-fun res!325420 () Bool)

(assert (=> start!48106 (=> (not res!325420) (not e!308663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48106 (= res!325420 (validMask!0 mask!3524))))

(assert (=> start!48106 e!308663))

(assert (=> start!48106 true))

(declare-fun array_inv!11914 (array!33542) Bool)

(assert (=> start!48106 (array_inv!11914 a!3235)))

(declare-fun b!529715 () Bool)

(declare-fun res!325419 () Bool)

(assert (=> b!529715 (=> (not res!325419) (not e!308663))))

(assert (=> b!529715 (= res!325419 (and (= (size!16482 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16482 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16482 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529716 () Bool)

(assert (=> b!529716 (= e!308663 e!308666)))

(declare-fun res!325414 () Bool)

(assert (=> b!529716 (=> (not res!325414) (not e!308666))))

(declare-fun lt!244216 () SeekEntryResult!4585)

(assert (=> b!529716 (= res!325414 (or (= lt!244216 (MissingZero!4585 i!1204)) (= lt!244216 (MissingVacant!4585 i!1204))))))

(assert (=> b!529716 (= lt!244216 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529717 () Bool)

(declare-fun res!325416 () Bool)

(assert (=> b!529717 (=> (not res!325416) (not e!308663))))

(assert (=> b!529717 (= res!325416 (validKeyInArray!0 (select (arr!16118 a!3235) j!176)))))

(declare-fun b!529718 () Bool)

(declare-fun res!325423 () Bool)

(assert (=> b!529718 (=> (not res!325423) (not e!308663))))

(declare-fun arrayContainsKey!0 (array!33542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529718 (= res!325423 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!48106 res!325420) b!529715))

(assert (= (and b!529715 res!325419) b!529717))

(assert (= (and b!529717 res!325416) b!529709))

(assert (= (and b!529709 res!325422) b!529718))

(assert (= (and b!529718 res!325423) b!529716))

(assert (= (and b!529716 res!325414) b!529711))

(assert (= (and b!529711 res!325424) b!529710))

(assert (= (and b!529710 res!325417) b!529712))

(assert (= (and b!529712 res!325415) b!529713))

(assert (= (and b!529712 (not res!325421)) b!529708))

(assert (= (and b!529708 (not res!325418)) b!529714))

(declare-fun m!510189 () Bool)

(assert (=> b!529709 m!510189))

(declare-fun m!510191 () Bool)

(assert (=> start!48106 m!510191))

(declare-fun m!510193 () Bool)

(assert (=> start!48106 m!510193))

(declare-fun m!510195 () Bool)

(assert (=> b!529716 m!510195))

(declare-fun m!510197 () Bool)

(assert (=> b!529712 m!510197))

(declare-fun m!510199 () Bool)

(assert (=> b!529712 m!510199))

(declare-fun m!510201 () Bool)

(assert (=> b!529712 m!510201))

(declare-fun m!510203 () Bool)

(assert (=> b!529712 m!510203))

(declare-fun m!510205 () Bool)

(assert (=> b!529712 m!510205))

(assert (=> b!529712 m!510197))

(declare-fun m!510207 () Bool)

(assert (=> b!529712 m!510207))

(assert (=> b!529712 m!510197))

(declare-fun m!510209 () Bool)

(assert (=> b!529712 m!510209))

(assert (=> b!529712 m!510205))

(declare-fun m!510211 () Bool)

(assert (=> b!529712 m!510211))

(assert (=> b!529712 m!510205))

(declare-fun m!510213 () Bool)

(assert (=> b!529712 m!510213))

(declare-fun m!510215 () Bool)

(assert (=> b!529710 m!510215))

(assert (=> b!529717 m!510197))

(assert (=> b!529717 m!510197))

(declare-fun m!510217 () Bool)

(assert (=> b!529717 m!510217))

(declare-fun m!510219 () Bool)

(assert (=> b!529711 m!510219))

(assert (=> b!529713 m!510197))

(assert (=> b!529713 m!510197))

(declare-fun m!510221 () Bool)

(assert (=> b!529713 m!510221))

(declare-fun m!510223 () Bool)

(assert (=> b!529718 m!510223))

(push 1)

