; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47900 () Bool)

(assert start!47900)

(declare-fun b!527515 () Bool)

(declare-datatypes ((Unit!16656 0))(
  ( (Unit!16657) )
))
(declare-fun e!307447 () Unit!16656)

(declare-fun Unit!16658 () Unit!16656)

(assert (=> b!527515 (= e!307447 Unit!16658)))

(declare-fun b!527516 () Bool)

(declare-fun res!323837 () Bool)

(declare-fun e!307443 () Bool)

(assert (=> b!527516 (=> (not res!323837) (not e!307443))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527516 (= res!323837 (validKeyInArray!0 k0!2280))))

(declare-fun b!527517 () Bool)

(declare-fun res!323836 () Bool)

(assert (=> b!527517 (=> (not res!323836) (not e!307443))))

(declare-datatypes ((array!33468 0))(
  ( (array!33469 (arr!16084 (Array (_ BitVec 32) (_ BitVec 64))) (size!16448 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33468)

(declare-fun arrayContainsKey!0 (array!33468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527517 (= res!323836 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527518 () Bool)

(declare-fun res!323833 () Bool)

(assert (=> b!527518 (=> (not res!323833) (not e!307443))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!527518 (= res!323833 (and (= (size!16448 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16448 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16448 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527519 () Bool)

(declare-fun Unit!16659 () Unit!16656)

(assert (=> b!527519 (= e!307447 Unit!16659)))

(declare-datatypes ((SeekEntryResult!4551 0))(
  ( (MissingZero!4551 (index!20422 (_ BitVec 32))) (Found!4551 (index!20423 (_ BitVec 32))) (Intermediate!4551 (undefined!5363 Bool) (index!20424 (_ BitVec 32)) (x!49392 (_ BitVec 32))) (Undefined!4551) (MissingVacant!4551 (index!20425 (_ BitVec 32))) )
))
(declare-fun lt!242806 () SeekEntryResult!4551)

(declare-fun lt!242797 () (_ BitVec 32))

(declare-fun lt!242800 () Unit!16656)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16656)

(assert (=> b!527519 (= lt!242800 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242797 #b00000000000000000000000000000000 (index!20424 lt!242806) (x!49392 lt!242806) mask!3524))))

(declare-fun res!323832 () Bool)

(declare-fun lt!242798 () array!33468)

(declare-fun lt!242802 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33468 (_ BitVec 32)) SeekEntryResult!4551)

(assert (=> b!527519 (= res!323832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242797 lt!242802 lt!242798 mask!3524) (Intermediate!4551 false (index!20424 lt!242806) (x!49392 lt!242806))))))

(declare-fun e!307444 () Bool)

(assert (=> b!527519 (=> (not res!323832) (not e!307444))))

(assert (=> b!527519 e!307444))

(declare-fun e!307446 () Bool)

(declare-fun b!527521 () Bool)

(assert (=> b!527521 (= e!307446 (or (bvsgt (x!49392 lt!242806) #b01111111111111111111111111111110) (bvslt lt!242797 #b00000000000000000000000000000000) (bvsge lt!242797 (size!16448 a!3235)) (bvslt (index!20424 lt!242806) #b00000000000000000000000000000000) (bvsge (index!20424 lt!242806) (size!16448 a!3235)) (= lt!242806 (Intermediate!4551 false (index!20424 lt!242806) (x!49392 lt!242806)))))))

(assert (=> b!527521 (= (index!20424 lt!242806) i!1204)))

(declare-fun lt!242803 () Unit!16656)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16656)

(assert (=> b!527521 (= lt!242803 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242797 #b00000000000000000000000000000000 (index!20424 lt!242806) (x!49392 lt!242806) mask!3524))))

(assert (=> b!527521 (and (or (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242801 () Unit!16656)

(assert (=> b!527521 (= lt!242801 e!307447)))

(declare-fun c!62150 () Bool)

(assert (=> b!527521 (= c!62150 (= (select (arr!16084 a!3235) (index!20424 lt!242806)) (select (arr!16084 a!3235) j!176)))))

(assert (=> b!527521 (and (bvslt (x!49392 lt!242806) #b01111111111111111111111111111110) (or (= (select (arr!16084 a!3235) (index!20424 lt!242806)) (select (arr!16084 a!3235) j!176)) (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16084 a!3235) (index!20424 lt!242806)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527522 () Bool)

(declare-fun res!323829 () Bool)

(declare-fun e!307449 () Bool)

(assert (=> b!527522 (=> (not res!323829) (not e!307449))))

(declare-datatypes ((List!10242 0))(
  ( (Nil!10239) (Cons!10238 (h!11172 (_ BitVec 64)) (t!16470 List!10242)) )
))
(declare-fun arrayNoDuplicates!0 (array!33468 (_ BitVec 32) List!10242) Bool)

(assert (=> b!527522 (= res!323829 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10239))))

(declare-fun e!307448 () Bool)

(declare-fun b!527523 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33468 (_ BitVec 32)) SeekEntryResult!4551)

(assert (=> b!527523 (= e!307448 (= (seekEntryOrOpen!0 (select (arr!16084 a!3235) j!176) a!3235 mask!3524) (Found!4551 j!176)))))

(declare-fun b!527524 () Bool)

(declare-fun res!323834 () Bool)

(assert (=> b!527524 (=> (not res!323834) (not e!307449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33468 (_ BitVec 32)) Bool)

(assert (=> b!527524 (= res!323834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527525 () Bool)

(declare-fun res!323831 () Bool)

(assert (=> b!527525 (=> res!323831 e!307446)))

(get-info :version)

(assert (=> b!527525 (= res!323831 (or (undefined!5363 lt!242806) (not ((_ is Intermediate!4551) lt!242806))))))

(declare-fun b!527526 () Bool)

(assert (=> b!527526 (= e!307449 (not e!307446))))

(declare-fun res!323838 () Bool)

(assert (=> b!527526 (=> res!323838 e!307446)))

(declare-fun lt!242805 () (_ BitVec 32))

(assert (=> b!527526 (= res!323838 (= lt!242806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242805 lt!242802 lt!242798 mask!3524)))))

(assert (=> b!527526 (= lt!242806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242797 (select (arr!16084 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527526 (= lt!242805 (toIndex!0 lt!242802 mask!3524))))

(assert (=> b!527526 (= lt!242802 (select (store (arr!16084 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527526 (= lt!242797 (toIndex!0 (select (arr!16084 a!3235) j!176) mask!3524))))

(assert (=> b!527526 (= lt!242798 (array!33469 (store (arr!16084 a!3235) i!1204 k0!2280) (size!16448 a!3235)))))

(assert (=> b!527526 e!307448))

(declare-fun res!323830 () Bool)

(assert (=> b!527526 (=> (not res!323830) (not e!307448))))

(assert (=> b!527526 (= res!323830 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242799 () Unit!16656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16656)

(assert (=> b!527526 (= lt!242799 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!323840 () Bool)

(assert (=> start!47900 (=> (not res!323840) (not e!307443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47900 (= res!323840 (validMask!0 mask!3524))))

(assert (=> start!47900 e!307443))

(assert (=> start!47900 true))

(declare-fun array_inv!11880 (array!33468) Bool)

(assert (=> start!47900 (array_inv!11880 a!3235)))

(declare-fun b!527520 () Bool)

(assert (=> b!527520 (= e!307444 false)))

(declare-fun b!527527 () Bool)

(assert (=> b!527527 (= e!307443 e!307449)))

(declare-fun res!323839 () Bool)

(assert (=> b!527527 (=> (not res!323839) (not e!307449))))

(declare-fun lt!242804 () SeekEntryResult!4551)

(assert (=> b!527527 (= res!323839 (or (= lt!242804 (MissingZero!4551 i!1204)) (= lt!242804 (MissingVacant!4551 i!1204))))))

(assert (=> b!527527 (= lt!242804 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527528 () Bool)

(declare-fun res!323835 () Bool)

(assert (=> b!527528 (=> (not res!323835) (not e!307443))))

(assert (=> b!527528 (= res!323835 (validKeyInArray!0 (select (arr!16084 a!3235) j!176)))))

(assert (= (and start!47900 res!323840) b!527518))

(assert (= (and b!527518 res!323833) b!527528))

(assert (= (and b!527528 res!323835) b!527516))

(assert (= (and b!527516 res!323837) b!527517))

(assert (= (and b!527517 res!323836) b!527527))

(assert (= (and b!527527 res!323839) b!527524))

(assert (= (and b!527524 res!323834) b!527522))

(assert (= (and b!527522 res!323829) b!527526))

(assert (= (and b!527526 res!323830) b!527523))

(assert (= (and b!527526 (not res!323838)) b!527525))

(assert (= (and b!527525 (not res!323831)) b!527521))

(assert (= (and b!527521 c!62150) b!527519))

(assert (= (and b!527521 (not c!62150)) b!527515))

(assert (= (and b!527519 res!323832) b!527520))

(declare-fun m!508169 () Bool)

(assert (=> b!527523 m!508169))

(assert (=> b!527523 m!508169))

(declare-fun m!508171 () Bool)

(assert (=> b!527523 m!508171))

(declare-fun m!508173 () Bool)

(assert (=> b!527526 m!508173))

(declare-fun m!508175 () Bool)

(assert (=> b!527526 m!508175))

(declare-fun m!508177 () Bool)

(assert (=> b!527526 m!508177))

(assert (=> b!527526 m!508169))

(declare-fun m!508179 () Bool)

(assert (=> b!527526 m!508179))

(declare-fun m!508181 () Bool)

(assert (=> b!527526 m!508181))

(declare-fun m!508183 () Bool)

(assert (=> b!527526 m!508183))

(assert (=> b!527526 m!508169))

(declare-fun m!508185 () Bool)

(assert (=> b!527526 m!508185))

(assert (=> b!527526 m!508169))

(declare-fun m!508187 () Bool)

(assert (=> b!527526 m!508187))

(declare-fun m!508189 () Bool)

(assert (=> b!527517 m!508189))

(declare-fun m!508191 () Bool)

(assert (=> b!527519 m!508191))

(declare-fun m!508193 () Bool)

(assert (=> b!527519 m!508193))

(declare-fun m!508195 () Bool)

(assert (=> b!527524 m!508195))

(declare-fun m!508197 () Bool)

(assert (=> b!527522 m!508197))

(declare-fun m!508199 () Bool)

(assert (=> b!527516 m!508199))

(declare-fun m!508201 () Bool)

(assert (=> b!527521 m!508201))

(declare-fun m!508203 () Bool)

(assert (=> b!527521 m!508203))

(assert (=> b!527521 m!508169))

(assert (=> b!527528 m!508169))

(assert (=> b!527528 m!508169))

(declare-fun m!508205 () Bool)

(assert (=> b!527528 m!508205))

(declare-fun m!508207 () Bool)

(assert (=> start!47900 m!508207))

(declare-fun m!508209 () Bool)

(assert (=> start!47900 m!508209))

(declare-fun m!508211 () Bool)

(assert (=> b!527527 m!508211))

(check-sat (not b!527527) (not b!527517) (not b!527519) (not b!527516) (not b!527522) (not b!527524) (not start!47900) (not b!527521) (not b!527523) (not b!527526) (not b!527528))
(check-sat)
