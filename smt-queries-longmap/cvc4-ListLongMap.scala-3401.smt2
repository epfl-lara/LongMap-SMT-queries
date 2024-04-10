; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47002 () Bool)

(assert start!47002)

(declare-fun b!518307 () Bool)

(declare-fun e!302418 () Bool)

(declare-fun e!302420 () Bool)

(assert (=> b!518307 (= e!302418 e!302420)))

(declare-fun res!317325 () Bool)

(assert (=> b!518307 (=> res!317325 e!302420)))

(declare-datatypes ((array!33143 0))(
  ( (array!33144 (arr!15935 (Array (_ BitVec 32) (_ BitVec 64))) (size!16299 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33143)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4402 0))(
  ( (MissingZero!4402 (index!19796 (_ BitVec 32))) (Found!4402 (index!19797 (_ BitVec 32))) (Intermediate!4402 (undefined!5214 Bool) (index!19798 (_ BitVec 32)) (x!48759 (_ BitVec 32))) (Undefined!4402) (MissingVacant!4402 (index!19799 (_ BitVec 32))) )
))
(declare-fun lt!237278 () SeekEntryResult!4402)

(assert (=> b!518307 (= res!317325 (not (= (select (arr!15935 a!3235) (index!19798 lt!237278)) (select (arr!15935 a!3235) j!176))))))

(assert (=> b!518307 (and (bvslt (x!48759 lt!237278) #b01111111111111111111111111111110) (or (= (select (arr!15935 a!3235) (index!19798 lt!237278)) (select (arr!15935 a!3235) j!176)) (= (select (arr!15935 a!3235) (index!19798 lt!237278)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15935 a!3235) (index!19798 lt!237278)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518308 () Bool)

(declare-fun res!317322 () Bool)

(declare-fun e!302419 () Bool)

(assert (=> b!518308 (=> (not res!317322) (not e!302419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518308 (= res!317322 (validKeyInArray!0 (select (arr!15935 a!3235) j!176)))))

(declare-fun b!518309 () Bool)

(declare-fun e!302421 () Bool)

(assert (=> b!518309 (= e!302419 e!302421)))

(declare-fun res!317327 () Bool)

(assert (=> b!518309 (=> (not res!317327) (not e!302421))))

(declare-fun lt!237282 () SeekEntryResult!4402)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518309 (= res!317327 (or (= lt!237282 (MissingZero!4402 i!1204)) (= lt!237282 (MissingVacant!4402 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33143 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!518309 (= lt!237282 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!302416 () Bool)

(declare-fun b!518310 () Bool)

(assert (=> b!518310 (= e!302416 (= (seekEntryOrOpen!0 (select (arr!15935 a!3235) j!176) a!3235 mask!3524) (Found!4402 j!176)))))

(declare-fun b!518311 () Bool)

(declare-fun res!317332 () Bool)

(assert (=> b!518311 (=> (not res!317332) (not e!302419))))

(assert (=> b!518311 (= res!317332 (and (= (size!16299 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16299 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16299 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518312 () Bool)

(declare-fun res!317330 () Bool)

(assert (=> b!518312 (=> (not res!317330) (not e!302421))))

(declare-datatypes ((List!10093 0))(
  ( (Nil!10090) (Cons!10089 (h!10996 (_ BitVec 64)) (t!16321 List!10093)) )
))
(declare-fun arrayNoDuplicates!0 (array!33143 (_ BitVec 32) List!10093) Bool)

(assert (=> b!518312 (= res!317330 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10090))))

(declare-fun b!518313 () Bool)

(declare-fun res!317324 () Bool)

(assert (=> b!518313 (=> (not res!317324) (not e!302421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33143 (_ BitVec 32)) Bool)

(assert (=> b!518313 (= res!317324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!317333 () Bool)

(assert (=> start!47002 (=> (not res!317333) (not e!302419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47002 (= res!317333 (validMask!0 mask!3524))))

(assert (=> start!47002 e!302419))

(assert (=> start!47002 true))

(declare-fun array_inv!11731 (array!33143) Bool)

(assert (=> start!47002 (array_inv!11731 a!3235)))

(declare-fun b!518314 () Bool)

(declare-fun res!317328 () Bool)

(assert (=> b!518314 (=> (not res!317328) (not e!302419))))

(declare-fun arrayContainsKey!0 (array!33143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518314 (= res!317328 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518315 () Bool)

(assert (=> b!518315 (= e!302421 (not e!302418))))

(declare-fun res!317323 () Bool)

(assert (=> b!518315 (=> res!317323 e!302418)))

(declare-fun lt!237276 () (_ BitVec 32))

(declare-fun lt!237277 () array!33143)

(declare-fun lt!237281 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33143 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!518315 (= res!317323 (= lt!237278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237276 lt!237281 lt!237277 mask!3524)))))

(declare-fun lt!237279 () (_ BitVec 32))

(assert (=> b!518315 (= lt!237278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237279 (select (arr!15935 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518315 (= lt!237276 (toIndex!0 lt!237281 mask!3524))))

(assert (=> b!518315 (= lt!237281 (select (store (arr!15935 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518315 (= lt!237279 (toIndex!0 (select (arr!15935 a!3235) j!176) mask!3524))))

(assert (=> b!518315 (= lt!237277 (array!33144 (store (arr!15935 a!3235) i!1204 k!2280) (size!16299 a!3235)))))

(assert (=> b!518315 e!302416))

(declare-fun res!317331 () Bool)

(assert (=> b!518315 (=> (not res!317331) (not e!302416))))

(assert (=> b!518315 (= res!317331 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16062 0))(
  ( (Unit!16063) )
))
(declare-fun lt!237280 () Unit!16062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16062)

(assert (=> b!518315 (= lt!237280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518316 () Bool)

(declare-fun res!317326 () Bool)

(assert (=> b!518316 (=> res!317326 e!302418)))

(assert (=> b!518316 (= res!317326 (or (undefined!5214 lt!237278) (not (is-Intermediate!4402 lt!237278))))))

(declare-fun b!518317 () Bool)

(assert (=> b!518317 (= e!302420 false)))

(assert (=> b!518317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237279 lt!237281 lt!237277 mask!3524) (Intermediate!4402 false (index!19798 lt!237278) (x!48759 lt!237278)))))

(declare-fun lt!237283 () Unit!16062)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16062)

(assert (=> b!518317 (= lt!237283 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237279 #b00000000000000000000000000000000 (index!19798 lt!237278) (x!48759 lt!237278) mask!3524))))

(declare-fun b!518318 () Bool)

(declare-fun res!317329 () Bool)

(assert (=> b!518318 (=> (not res!317329) (not e!302419))))

(assert (=> b!518318 (= res!317329 (validKeyInArray!0 k!2280))))

(assert (= (and start!47002 res!317333) b!518311))

(assert (= (and b!518311 res!317332) b!518308))

(assert (= (and b!518308 res!317322) b!518318))

(assert (= (and b!518318 res!317329) b!518314))

(assert (= (and b!518314 res!317328) b!518309))

(assert (= (and b!518309 res!317327) b!518313))

(assert (= (and b!518313 res!317324) b!518312))

(assert (= (and b!518312 res!317330) b!518315))

(assert (= (and b!518315 res!317331) b!518310))

(assert (= (and b!518315 (not res!317323)) b!518316))

(assert (= (and b!518316 (not res!317326)) b!518307))

(assert (= (and b!518307 (not res!317325)) b!518317))

(declare-fun m!499683 () Bool)

(assert (=> b!518315 m!499683))

(declare-fun m!499685 () Bool)

(assert (=> b!518315 m!499685))

(declare-fun m!499687 () Bool)

(assert (=> b!518315 m!499687))

(declare-fun m!499689 () Bool)

(assert (=> b!518315 m!499689))

(declare-fun m!499691 () Bool)

(assert (=> b!518315 m!499691))

(assert (=> b!518315 m!499689))

(declare-fun m!499693 () Bool)

(assert (=> b!518315 m!499693))

(declare-fun m!499695 () Bool)

(assert (=> b!518315 m!499695))

(assert (=> b!518315 m!499689))

(declare-fun m!499697 () Bool)

(assert (=> b!518315 m!499697))

(declare-fun m!499699 () Bool)

(assert (=> b!518315 m!499699))

(declare-fun m!499701 () Bool)

(assert (=> b!518318 m!499701))

(assert (=> b!518308 m!499689))

(assert (=> b!518308 m!499689))

(declare-fun m!499703 () Bool)

(assert (=> b!518308 m!499703))

(assert (=> b!518310 m!499689))

(assert (=> b!518310 m!499689))

(declare-fun m!499705 () Bool)

(assert (=> b!518310 m!499705))

(declare-fun m!499707 () Bool)

(assert (=> b!518317 m!499707))

(declare-fun m!499709 () Bool)

(assert (=> b!518317 m!499709))

(declare-fun m!499711 () Bool)

(assert (=> b!518307 m!499711))

(assert (=> b!518307 m!499689))

(declare-fun m!499713 () Bool)

(assert (=> b!518314 m!499713))

(declare-fun m!499715 () Bool)

(assert (=> b!518312 m!499715))

(declare-fun m!499717 () Bool)

(assert (=> b!518309 m!499717))

(declare-fun m!499719 () Bool)

(assert (=> start!47002 m!499719))

(declare-fun m!499721 () Bool)

(assert (=> start!47002 m!499721))

(declare-fun m!499723 () Bool)

(assert (=> b!518313 m!499723))

(push 1)

