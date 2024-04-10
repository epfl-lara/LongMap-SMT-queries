; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48102 () Bool)

(assert start!48102)

(declare-fun b!529642 () Bool)

(declare-fun e!308628 () Bool)

(assert (=> b!529642 (= e!308628 true)))

(assert (=> b!529642 false))

(declare-fun b!529643 () Bool)

(declare-fun res!325357 () Bool)

(declare-fun e!308626 () Bool)

(assert (=> b!529643 (=> (not res!325357) (not e!308626))))

(declare-datatypes ((array!33538 0))(
  ( (array!33539 (arr!16116 (Array (_ BitVec 32) (_ BitVec 64))) (size!16480 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33538)

(declare-datatypes ((List!10274 0))(
  ( (Nil!10271) (Cons!10270 (h!11210 (_ BitVec 64)) (t!16502 List!10274)) )
))
(declare-fun arrayNoDuplicates!0 (array!33538 (_ BitVec 32) List!10274) Bool)

(assert (=> b!529643 (= res!325357 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10271))))

(declare-fun b!529644 () Bool)

(declare-fun res!325351 () Bool)

(declare-fun e!308630 () Bool)

(assert (=> b!529644 (=> (not res!325351) (not e!308630))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529644 (= res!325351 (and (= (size!16480 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16480 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16480 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!308629 () Bool)

(declare-fun b!529645 () Bool)

(declare-datatypes ((SeekEntryResult!4583 0))(
  ( (MissingZero!4583 (index!20556 (_ BitVec 32))) (Found!4583 (index!20557 (_ BitVec 32))) (Intermediate!4583 (undefined!5395 Bool) (index!20558 (_ BitVec 32)) (x!49533 (_ BitVec 32))) (Undefined!4583) (MissingVacant!4583 (index!20559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33538 (_ BitVec 32)) SeekEntryResult!4583)

(assert (=> b!529645 (= e!308629 (= (seekEntryOrOpen!0 (select (arr!16116 a!3235) j!176) a!3235 mask!3524) (Found!4583 j!176)))))

(declare-fun b!529646 () Bool)

(declare-fun res!325349 () Bool)

(assert (=> b!529646 (=> (not res!325349) (not e!308630))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529646 (= res!325349 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529647 () Bool)

(declare-fun e!308631 () Bool)

(assert (=> b!529647 (= e!308626 (not e!308631))))

(declare-fun res!325354 () Bool)

(assert (=> b!529647 (=> res!325354 e!308631)))

(declare-fun lt!244179 () (_ BitVec 32))

(declare-fun lt!244177 () SeekEntryResult!4583)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33538 (_ BitVec 32)) SeekEntryResult!4583)

(assert (=> b!529647 (= res!325354 (= lt!244177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244179 (select (store (arr!16116 a!3235) i!1204 k!2280) j!176) (array!33539 (store (arr!16116 a!3235) i!1204 k!2280) (size!16480 a!3235)) mask!3524)))))

(declare-fun lt!244180 () (_ BitVec 32))

(assert (=> b!529647 (= lt!244177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244180 (select (arr!16116 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529647 (= lt!244179 (toIndex!0 (select (store (arr!16116 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529647 (= lt!244180 (toIndex!0 (select (arr!16116 a!3235) j!176) mask!3524))))

(assert (=> b!529647 e!308629))

(declare-fun res!325350 () Bool)

(assert (=> b!529647 (=> (not res!325350) (not e!308629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33538 (_ BitVec 32)) Bool)

(assert (=> b!529647 (= res!325350 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16778 0))(
  ( (Unit!16779) )
))
(declare-fun lt!244178 () Unit!16778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16778)

(assert (=> b!529647 (= lt!244178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529648 () Bool)

(declare-fun res!325358 () Bool)

(assert (=> b!529648 (=> (not res!325358) (not e!308630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529648 (= res!325358 (validKeyInArray!0 (select (arr!16116 a!3235) j!176)))))

(declare-fun b!529649 () Bool)

(declare-fun res!325352 () Bool)

(assert (=> b!529649 (=> (not res!325352) (not e!308626))))

(assert (=> b!529649 (= res!325352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529650 () Bool)

(declare-fun res!325356 () Bool)

(assert (=> b!529650 (=> (not res!325356) (not e!308630))))

(assert (=> b!529650 (= res!325356 (validKeyInArray!0 k!2280))))

(declare-fun b!529651 () Bool)

(assert (=> b!529651 (= e!308630 e!308626)))

(declare-fun res!325348 () Bool)

(assert (=> b!529651 (=> (not res!325348) (not e!308626))))

(declare-fun lt!244175 () SeekEntryResult!4583)

(assert (=> b!529651 (= res!325348 (or (= lt!244175 (MissingZero!4583 i!1204)) (= lt!244175 (MissingVacant!4583 i!1204))))))

(assert (=> b!529651 (= lt!244175 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529652 () Bool)

(assert (=> b!529652 (= e!308631 e!308628)))

(declare-fun res!325355 () Bool)

(assert (=> b!529652 (=> res!325355 e!308628)))

(declare-fun lt!244176 () Bool)

(assert (=> b!529652 (= res!325355 (or (and (not lt!244176) (undefined!5395 lt!244177)) (and (not lt!244176) (not (undefined!5395 lt!244177)))))))

(assert (=> b!529652 (= lt!244176 (not (is-Intermediate!4583 lt!244177)))))

(declare-fun res!325353 () Bool)

(assert (=> start!48102 (=> (not res!325353) (not e!308630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48102 (= res!325353 (validMask!0 mask!3524))))

(assert (=> start!48102 e!308630))

(assert (=> start!48102 true))

(declare-fun array_inv!11912 (array!33538) Bool)

(assert (=> start!48102 (array_inv!11912 a!3235)))

(assert (= (and start!48102 res!325353) b!529644))

(assert (= (and b!529644 res!325351) b!529648))

(assert (= (and b!529648 res!325358) b!529650))

(assert (= (and b!529650 res!325356) b!529646))

(assert (= (and b!529646 res!325349) b!529651))

(assert (= (and b!529651 res!325348) b!529649))

(assert (= (and b!529649 res!325352) b!529643))

(assert (= (and b!529643 res!325357) b!529647))

(assert (= (and b!529647 res!325350) b!529645))

(assert (= (and b!529647 (not res!325354)) b!529652))

(assert (= (and b!529652 (not res!325355)) b!529642))

(declare-fun m!510117 () Bool)

(assert (=> b!529645 m!510117))

(assert (=> b!529645 m!510117))

(declare-fun m!510119 () Bool)

(assert (=> b!529645 m!510119))

(declare-fun m!510121 () Bool)

(assert (=> b!529647 m!510121))

(declare-fun m!510123 () Bool)

(assert (=> b!529647 m!510123))

(declare-fun m!510125 () Bool)

(assert (=> b!529647 m!510125))

(assert (=> b!529647 m!510117))

(declare-fun m!510127 () Bool)

(assert (=> b!529647 m!510127))

(assert (=> b!529647 m!510117))

(declare-fun m!510129 () Bool)

(assert (=> b!529647 m!510129))

(assert (=> b!529647 m!510117))

(declare-fun m!510131 () Bool)

(assert (=> b!529647 m!510131))

(assert (=> b!529647 m!510125))

(declare-fun m!510133 () Bool)

(assert (=> b!529647 m!510133))

(assert (=> b!529647 m!510125))

(declare-fun m!510135 () Bool)

(assert (=> b!529647 m!510135))

(declare-fun m!510137 () Bool)

(assert (=> start!48102 m!510137))

(declare-fun m!510139 () Bool)

(assert (=> start!48102 m!510139))

(declare-fun m!510141 () Bool)

(assert (=> b!529643 m!510141))

(declare-fun m!510143 () Bool)

(assert (=> b!529651 m!510143))

(declare-fun m!510145 () Bool)

(assert (=> b!529650 m!510145))

(declare-fun m!510147 () Bool)

(assert (=> b!529649 m!510147))

(assert (=> b!529648 m!510117))

(assert (=> b!529648 m!510117))

(declare-fun m!510149 () Bool)

(assert (=> b!529648 m!510149))

(declare-fun m!510151 () Bool)

(assert (=> b!529646 m!510151))

(push 1)

