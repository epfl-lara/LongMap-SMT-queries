; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48108 () Bool)

(assert start!48108)

(declare-fun b!529741 () Bool)

(declare-fun e!308683 () Bool)

(declare-fun e!308681 () Bool)

(assert (=> b!529741 (= e!308683 e!308681)))

(declare-fun res!325447 () Bool)

(assert (=> b!529741 (=> res!325447 e!308681)))

(declare-fun lt!244230 () Bool)

(declare-datatypes ((SeekEntryResult!4586 0))(
  ( (MissingZero!4586 (index!20568 (_ BitVec 32))) (Found!4586 (index!20569 (_ BitVec 32))) (Intermediate!4586 (undefined!5398 Bool) (index!20570 (_ BitVec 32)) (x!49544 (_ BitVec 32))) (Undefined!4586) (MissingVacant!4586 (index!20571 (_ BitVec 32))) )
))
(declare-fun lt!244229 () SeekEntryResult!4586)

(assert (=> b!529741 (= res!325447 (or (and (not lt!244230) (undefined!5398 lt!244229)) (and (not lt!244230) (not (undefined!5398 lt!244229)))))))

(assert (=> b!529741 (= lt!244230 (not (is-Intermediate!4586 lt!244229)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!308685 () Bool)

(declare-datatypes ((array!33544 0))(
  ( (array!33545 (arr!16119 (Array (_ BitVec 32) (_ BitVec 64))) (size!16483 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33544)

(declare-fun b!529742 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33544 (_ BitVec 32)) SeekEntryResult!4586)

(assert (=> b!529742 (= e!308685 (= (seekEntryOrOpen!0 (select (arr!16119 a!3235) j!176) a!3235 mask!3524) (Found!4586 j!176)))))

(declare-fun b!529744 () Bool)

(assert (=> b!529744 (= e!308681 true)))

(assert (=> b!529744 false))

(declare-fun b!529745 () Bool)

(declare-fun res!325457 () Bool)

(declare-fun e!308680 () Bool)

(assert (=> b!529745 (=> (not res!325457) (not e!308680))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529745 (= res!325457 (validKeyInArray!0 k!2280))))

(declare-fun b!529746 () Bool)

(declare-fun e!308682 () Bool)

(assert (=> b!529746 (= e!308682 (not e!308683))))

(declare-fun res!325452 () Bool)

(assert (=> b!529746 (=> res!325452 e!308683)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!244232 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33544 (_ BitVec 32)) SeekEntryResult!4586)

(assert (=> b!529746 (= res!325452 (= lt!244229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244232 (select (store (arr!16119 a!3235) i!1204 k!2280) j!176) (array!33545 (store (arr!16119 a!3235) i!1204 k!2280) (size!16483 a!3235)) mask!3524)))))

(declare-fun lt!244234 () (_ BitVec 32))

(assert (=> b!529746 (= lt!244229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244234 (select (arr!16119 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529746 (= lt!244232 (toIndex!0 (select (store (arr!16119 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529746 (= lt!244234 (toIndex!0 (select (arr!16119 a!3235) j!176) mask!3524))))

(assert (=> b!529746 e!308685))

(declare-fun res!325448 () Bool)

(assert (=> b!529746 (=> (not res!325448) (not e!308685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33544 (_ BitVec 32)) Bool)

(assert (=> b!529746 (= res!325448 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16784 0))(
  ( (Unit!16785) )
))
(declare-fun lt!244231 () Unit!16784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16784)

(assert (=> b!529746 (= lt!244231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529747 () Bool)

(declare-fun res!325453 () Bool)

(assert (=> b!529747 (=> (not res!325453) (not e!308680))))

(declare-fun arrayContainsKey!0 (array!33544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529747 (= res!325453 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529748 () Bool)

(declare-fun res!325449 () Bool)

(assert (=> b!529748 (=> (not res!325449) (not e!308680))))

(assert (=> b!529748 (= res!325449 (validKeyInArray!0 (select (arr!16119 a!3235) j!176)))))

(declare-fun b!529749 () Bool)

(declare-fun res!325451 () Bool)

(assert (=> b!529749 (=> (not res!325451) (not e!308680))))

(assert (=> b!529749 (= res!325451 (and (= (size!16483 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16483 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16483 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529750 () Bool)

(assert (=> b!529750 (= e!308680 e!308682)))

(declare-fun res!325450 () Bool)

(assert (=> b!529750 (=> (not res!325450) (not e!308682))))

(declare-fun lt!244233 () SeekEntryResult!4586)

(assert (=> b!529750 (= res!325450 (or (= lt!244233 (MissingZero!4586 i!1204)) (= lt!244233 (MissingVacant!4586 i!1204))))))

(assert (=> b!529750 (= lt!244233 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529751 () Bool)

(declare-fun res!325455 () Bool)

(assert (=> b!529751 (=> (not res!325455) (not e!308682))))

(declare-datatypes ((List!10277 0))(
  ( (Nil!10274) (Cons!10273 (h!11213 (_ BitVec 64)) (t!16505 List!10277)) )
))
(declare-fun arrayNoDuplicates!0 (array!33544 (_ BitVec 32) List!10277) Bool)

(assert (=> b!529751 (= res!325455 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10274))))

(declare-fun b!529743 () Bool)

(declare-fun res!325456 () Bool)

(assert (=> b!529743 (=> (not res!325456) (not e!308682))))

(assert (=> b!529743 (= res!325456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!325454 () Bool)

(assert (=> start!48108 (=> (not res!325454) (not e!308680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48108 (= res!325454 (validMask!0 mask!3524))))

(assert (=> start!48108 e!308680))

(assert (=> start!48108 true))

(declare-fun array_inv!11915 (array!33544) Bool)

(assert (=> start!48108 (array_inv!11915 a!3235)))

(assert (= (and start!48108 res!325454) b!529749))

(assert (= (and b!529749 res!325451) b!529748))

(assert (= (and b!529748 res!325449) b!529745))

(assert (= (and b!529745 res!325457) b!529747))

(assert (= (and b!529747 res!325453) b!529750))

(assert (= (and b!529750 res!325450) b!529743))

(assert (= (and b!529743 res!325456) b!529751))

(assert (= (and b!529751 res!325455) b!529746))

(assert (= (and b!529746 res!325448) b!529742))

(assert (= (and b!529746 (not res!325452)) b!529741))

(assert (= (and b!529741 (not res!325447)) b!529744))

(declare-fun m!510225 () Bool)

(assert (=> start!48108 m!510225))

(declare-fun m!510227 () Bool)

(assert (=> start!48108 m!510227))

(declare-fun m!510229 () Bool)

(assert (=> b!529748 m!510229))

(assert (=> b!529748 m!510229))

(declare-fun m!510231 () Bool)

(assert (=> b!529748 m!510231))

(declare-fun m!510233 () Bool)

(assert (=> b!529750 m!510233))

(declare-fun m!510235 () Bool)

(assert (=> b!529746 m!510235))

(declare-fun m!510237 () Bool)

(assert (=> b!529746 m!510237))

(declare-fun m!510239 () Bool)

(assert (=> b!529746 m!510239))

(assert (=> b!529746 m!510239))

(declare-fun m!510241 () Bool)

(assert (=> b!529746 m!510241))

(assert (=> b!529746 m!510229))

(declare-fun m!510243 () Bool)

(assert (=> b!529746 m!510243))

(assert (=> b!529746 m!510229))

(declare-fun m!510245 () Bool)

(assert (=> b!529746 m!510245))

(assert (=> b!529746 m!510229))

(declare-fun m!510247 () Bool)

(assert (=> b!529746 m!510247))

(assert (=> b!529746 m!510239))

(declare-fun m!510249 () Bool)

(assert (=> b!529746 m!510249))

(declare-fun m!510251 () Bool)

(assert (=> b!529747 m!510251))

(declare-fun m!510253 () Bool)

(assert (=> b!529743 m!510253))

(assert (=> b!529742 m!510229))

(assert (=> b!529742 m!510229))

(declare-fun m!510255 () Bool)

(assert (=> b!529742 m!510255))

(declare-fun m!510257 () Bool)

(assert (=> b!529751 m!510257))

(declare-fun m!510259 () Bool)

(assert (=> b!529745 m!510259))

(push 1)

