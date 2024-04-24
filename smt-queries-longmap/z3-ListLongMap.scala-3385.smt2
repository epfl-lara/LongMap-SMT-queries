; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46712 () Bool)

(assert start!46712)

(declare-fun b!515715 () Bool)

(declare-fun e!301062 () Bool)

(declare-fun e!301065 () Bool)

(assert (=> b!515715 (= e!301062 e!301065)))

(declare-fun res!315343 () Bool)

(assert (=> b!515715 (=> (not res!315343) (not e!301065))))

(declare-datatypes ((SeekEntryResult!4303 0))(
  ( (MissingZero!4303 (index!19400 (_ BitVec 32))) (Found!4303 (index!19401 (_ BitVec 32))) (Intermediate!4303 (undefined!5115 Bool) (index!19402 (_ BitVec 32)) (x!48511 (_ BitVec 32))) (Undefined!4303) (MissingVacant!4303 (index!19403 (_ BitVec 32))) )
))
(declare-fun lt!236127 () SeekEntryResult!4303)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515715 (= res!315343 (or (= lt!236127 (MissingZero!4303 i!1204)) (= lt!236127 (MissingVacant!4303 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33025 0))(
  ( (array!33026 (arr!15880 (Array (_ BitVec 32) (_ BitVec 64))) (size!16244 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33025)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33025 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!515715 (= lt!236127 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515716 () Bool)

(declare-fun res!315342 () Bool)

(assert (=> b!515716 (=> (not res!315342) (not e!301065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33025 (_ BitVec 32)) Bool)

(assert (=> b!515716 (= res!315342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515717 () Bool)

(declare-fun e!301061 () Bool)

(assert (=> b!515717 (= e!301065 (not e!301061))))

(declare-fun res!315333 () Bool)

(assert (=> b!515717 (=> res!315333 e!301061)))

(declare-fun lt!236130 () SeekEntryResult!4303)

(declare-fun lt!236131 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33025 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!515717 (= res!315333 (= lt!236130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236131 (select (store (arr!15880 a!3235) i!1204 k0!2280) j!176) (array!33026 (store (arr!15880 a!3235) i!1204 k0!2280) (size!16244 a!3235)) mask!3524)))))

(declare-fun lt!236129 () (_ BitVec 32))

(assert (=> b!515717 (= lt!236130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236129 (select (arr!15880 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515717 (= lt!236131 (toIndex!0 (select (store (arr!15880 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515717 (= lt!236129 (toIndex!0 (select (arr!15880 a!3235) j!176) mask!3524))))

(declare-fun e!301063 () Bool)

(assert (=> b!515717 e!301063))

(declare-fun res!315338 () Bool)

(assert (=> b!515717 (=> (not res!315338) (not e!301063))))

(assert (=> b!515717 (= res!315338 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15925 0))(
  ( (Unit!15926) )
))
(declare-fun lt!236128 () Unit!15925)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15925)

(assert (=> b!515717 (= lt!236128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515718 () Bool)

(declare-fun res!315335 () Bool)

(assert (=> b!515718 (=> res!315335 e!301061)))

(get-info :version)

(assert (=> b!515718 (= res!315335 (or (undefined!5115 lt!236130) (not ((_ is Intermediate!4303) lt!236130))))))

(declare-fun b!515719 () Bool)

(declare-fun res!315341 () Bool)

(assert (=> b!515719 (=> (not res!315341) (not e!301062))))

(declare-fun arrayContainsKey!0 (array!33025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515719 (= res!315341 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!315339 () Bool)

(assert (=> start!46712 (=> (not res!315339) (not e!301062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46712 (= res!315339 (validMask!0 mask!3524))))

(assert (=> start!46712 e!301062))

(assert (=> start!46712 true))

(declare-fun array_inv!11739 (array!33025) Bool)

(assert (=> start!46712 (array_inv!11739 a!3235)))

(declare-fun b!515720 () Bool)

(declare-fun res!315340 () Bool)

(assert (=> b!515720 (=> (not res!315340) (not e!301062))))

(assert (=> b!515720 (= res!315340 (and (= (size!16244 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16244 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16244 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515721 () Bool)

(declare-fun res!315337 () Bool)

(assert (=> b!515721 (=> (not res!315337) (not e!301062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515721 (= res!315337 (validKeyInArray!0 (select (arr!15880 a!3235) j!176)))))

(declare-fun b!515722 () Bool)

(declare-fun res!315334 () Bool)

(assert (=> b!515722 (=> (not res!315334) (not e!301062))))

(assert (=> b!515722 (= res!315334 (validKeyInArray!0 k0!2280))))

(declare-fun b!515723 () Bool)

(assert (=> b!515723 (= e!301063 (= (seekEntryOrOpen!0 (select (arr!15880 a!3235) j!176) a!3235 mask!3524) (Found!4303 j!176)))))

(declare-fun b!515724 () Bool)

(assert (=> b!515724 (= e!301061 true)))

(assert (=> b!515724 (and (bvslt (x!48511 lt!236130) #b01111111111111111111111111111110) (or (= (select (arr!15880 a!3235) (index!19402 lt!236130)) (select (arr!15880 a!3235) j!176)) (= (select (arr!15880 a!3235) (index!19402 lt!236130)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15880 a!3235) (index!19402 lt!236130)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515725 () Bool)

(declare-fun res!315336 () Bool)

(assert (=> b!515725 (=> (not res!315336) (not e!301065))))

(declare-datatypes ((List!9945 0))(
  ( (Nil!9942) (Cons!9941 (h!10839 (_ BitVec 64)) (t!16165 List!9945)) )
))
(declare-fun arrayNoDuplicates!0 (array!33025 (_ BitVec 32) List!9945) Bool)

(assert (=> b!515725 (= res!315336 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9942))))

(assert (= (and start!46712 res!315339) b!515720))

(assert (= (and b!515720 res!315340) b!515721))

(assert (= (and b!515721 res!315337) b!515722))

(assert (= (and b!515722 res!315334) b!515719))

(assert (= (and b!515719 res!315341) b!515715))

(assert (= (and b!515715 res!315343) b!515716))

(assert (= (and b!515716 res!315342) b!515725))

(assert (= (and b!515725 res!315336) b!515717))

(assert (= (and b!515717 res!315338) b!515723))

(assert (= (and b!515717 (not res!315333)) b!515718))

(assert (= (and b!515718 (not res!315335)) b!515724))

(declare-fun m!497347 () Bool)

(assert (=> b!515724 m!497347))

(declare-fun m!497349 () Bool)

(assert (=> b!515724 m!497349))

(declare-fun m!497351 () Bool)

(assert (=> b!515715 m!497351))

(declare-fun m!497353 () Bool)

(assert (=> start!46712 m!497353))

(declare-fun m!497355 () Bool)

(assert (=> start!46712 m!497355))

(declare-fun m!497357 () Bool)

(assert (=> b!515722 m!497357))

(declare-fun m!497359 () Bool)

(assert (=> b!515716 m!497359))

(declare-fun m!497361 () Bool)

(assert (=> b!515719 m!497361))

(assert (=> b!515723 m!497349))

(assert (=> b!515723 m!497349))

(declare-fun m!497363 () Bool)

(assert (=> b!515723 m!497363))

(assert (=> b!515721 m!497349))

(assert (=> b!515721 m!497349))

(declare-fun m!497365 () Bool)

(assert (=> b!515721 m!497365))

(declare-fun m!497367 () Bool)

(assert (=> b!515725 m!497367))

(declare-fun m!497369 () Bool)

(assert (=> b!515717 m!497369))

(declare-fun m!497371 () Bool)

(assert (=> b!515717 m!497371))

(declare-fun m!497373 () Bool)

(assert (=> b!515717 m!497373))

(assert (=> b!515717 m!497373))

(declare-fun m!497375 () Bool)

(assert (=> b!515717 m!497375))

(assert (=> b!515717 m!497349))

(declare-fun m!497377 () Bool)

(assert (=> b!515717 m!497377))

(assert (=> b!515717 m!497349))

(declare-fun m!497379 () Bool)

(assert (=> b!515717 m!497379))

(assert (=> b!515717 m!497349))

(declare-fun m!497381 () Bool)

(assert (=> b!515717 m!497381))

(assert (=> b!515717 m!497373))

(declare-fun m!497383 () Bool)

(assert (=> b!515717 m!497383))

(check-sat (not b!515717) (not b!515725) (not b!515719) (not b!515722) (not start!46712) (not b!515716) (not b!515721) (not b!515723) (not b!515715))
(check-sat)
