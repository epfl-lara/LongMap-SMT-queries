; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47882 () Bool)

(assert start!47882)

(declare-fun b!527286 () Bool)

(declare-datatypes ((Unit!16603 0))(
  ( (Unit!16604) )
))
(declare-fun e!307324 () Unit!16603)

(declare-fun Unit!16605 () Unit!16603)

(assert (=> b!527286 (= e!307324 Unit!16605)))

(declare-fun b!527287 () Bool)

(declare-fun res!323681 () Bool)

(declare-fun e!307323 () Bool)

(assert (=> b!527287 (=> (not res!323681) (not e!307323))))

(declare-datatypes ((array!33451 0))(
  ( (array!33452 (arr!16075 (Array (_ BitVec 32) (_ BitVec 64))) (size!16439 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33451)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527287 (= res!323681 (validKeyInArray!0 (select (arr!16075 a!3235) j!176)))))

(declare-fun b!527288 () Bool)

(declare-fun Unit!16606 () Unit!16603)

(assert (=> b!527288 (= e!307324 Unit!16606)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4498 0))(
  ( (MissingZero!4498 (index!20210 (_ BitVec 32))) (Found!4498 (index!20211 (_ BitVec 32))) (Intermediate!4498 (undefined!5310 Bool) (index!20212 (_ BitVec 32)) (x!49328 (_ BitVec 32))) (Undefined!4498) (MissingVacant!4498 (index!20213 (_ BitVec 32))) )
))
(declare-fun lt!242692 () SeekEntryResult!4498)

(declare-fun lt!242696 () (_ BitVec 32))

(declare-fun lt!242697 () Unit!16603)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16603)

(assert (=> b!527288 (= lt!242697 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242696 #b00000000000000000000000000000000 (index!20212 lt!242692) (x!49328 lt!242692) mask!3524))))

(declare-fun lt!242691 () array!33451)

(declare-fun lt!242689 () (_ BitVec 64))

(declare-fun res!323682 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33451 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!527288 (= res!323682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242696 lt!242689 lt!242691 mask!3524) (Intermediate!4498 false (index!20212 lt!242692) (x!49328 lt!242692))))))

(declare-fun e!307322 () Bool)

(assert (=> b!527288 (=> (not res!323682) (not e!307322))))

(assert (=> b!527288 e!307322))

(declare-fun b!527289 () Bool)

(declare-fun e!307321 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33451 (_ BitVec 32)) SeekEntryResult!4498)

(assert (=> b!527289 (= e!307321 (= (seekEntryOrOpen!0 (select (arr!16075 a!3235) j!176) a!3235 mask!3524) (Found!4498 j!176)))))

(declare-fun b!527290 () Bool)

(declare-fun res!323684 () Bool)

(declare-fun e!307326 () Bool)

(assert (=> b!527290 (=> res!323684 e!307326)))

(get-info :version)

(assert (=> b!527290 (= res!323684 (or (undefined!5310 lt!242692) (not ((_ is Intermediate!4498) lt!242692))))))

(declare-fun res!323688 () Bool)

(assert (=> start!47882 (=> (not res!323688) (not e!307323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47882 (= res!323688 (validMask!0 mask!3524))))

(assert (=> start!47882 e!307323))

(assert (=> start!47882 true))

(declare-fun array_inv!11934 (array!33451) Bool)

(assert (=> start!47882 (array_inv!11934 a!3235)))

(declare-fun b!527291 () Bool)

(declare-fun res!323685 () Bool)

(declare-fun e!307325 () Bool)

(assert (=> b!527291 (=> (not res!323685) (not e!307325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33451 (_ BitVec 32)) Bool)

(assert (=> b!527291 (= res!323685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527292 () Bool)

(assert (=> b!527292 (= e!307325 (not e!307326))))

(declare-fun res!323687 () Bool)

(assert (=> b!527292 (=> res!323687 e!307326)))

(declare-fun lt!242698 () (_ BitVec 32))

(assert (=> b!527292 (= res!323687 (= lt!242692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242698 lt!242689 lt!242691 mask!3524)))))

(assert (=> b!527292 (= lt!242692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242696 (select (arr!16075 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527292 (= lt!242698 (toIndex!0 lt!242689 mask!3524))))

(assert (=> b!527292 (= lt!242689 (select (store (arr!16075 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527292 (= lt!242696 (toIndex!0 (select (arr!16075 a!3235) j!176) mask!3524))))

(assert (=> b!527292 (= lt!242691 (array!33452 (store (arr!16075 a!3235) i!1204 k0!2280) (size!16439 a!3235)))))

(assert (=> b!527292 e!307321))

(declare-fun res!323679 () Bool)

(assert (=> b!527292 (=> (not res!323679) (not e!307321))))

(assert (=> b!527292 (= res!323679 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242694 () Unit!16603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16603)

(assert (=> b!527292 (= lt!242694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527293 () Bool)

(declare-fun res!323680 () Bool)

(assert (=> b!527293 (=> (not res!323680) (not e!307325))))

(declare-datatypes ((List!10140 0))(
  ( (Nil!10137) (Cons!10136 (h!11070 (_ BitVec 64)) (t!16360 List!10140)) )
))
(declare-fun arrayNoDuplicates!0 (array!33451 (_ BitVec 32) List!10140) Bool)

(assert (=> b!527293 (= res!323680 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10137))))

(declare-fun b!527294 () Bool)

(declare-fun res!323683 () Bool)

(assert (=> b!527294 (=> (not res!323683) (not e!307323))))

(declare-fun arrayContainsKey!0 (array!33451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527294 (= res!323683 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527295 () Bool)

(declare-fun res!323686 () Bool)

(assert (=> b!527295 (=> (not res!323686) (not e!307323))))

(assert (=> b!527295 (= res!323686 (validKeyInArray!0 k0!2280))))

(declare-fun b!527296 () Bool)

(declare-fun res!323678 () Bool)

(assert (=> b!527296 (=> (not res!323678) (not e!307323))))

(assert (=> b!527296 (= res!323678 (and (= (size!16439 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16439 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16439 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527297 () Bool)

(assert (=> b!527297 (= e!307322 false)))

(declare-fun b!527298 () Bool)

(assert (=> b!527298 (= e!307326 (or (bvsgt (x!49328 lt!242692) #b01111111111111111111111111111110) (bvslt lt!242696 #b00000000000000000000000000000000) (bvsge lt!242696 (size!16439 a!3235)) (and (bvsge (index!20212 lt!242692) #b00000000000000000000000000000000) (bvslt (index!20212 lt!242692) (size!16439 a!3235)))))))

(assert (=> b!527298 (= (index!20212 lt!242692) i!1204)))

(declare-fun lt!242690 () Unit!16603)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16603)

(assert (=> b!527298 (= lt!242690 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242696 #b00000000000000000000000000000000 (index!20212 lt!242692) (x!49328 lt!242692) mask!3524))))

(assert (=> b!527298 (and (or (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242695 () Unit!16603)

(assert (=> b!527298 (= lt!242695 e!307324)))

(declare-fun c!62111 () Bool)

(assert (=> b!527298 (= c!62111 (= (select (arr!16075 a!3235) (index!20212 lt!242692)) (select (arr!16075 a!3235) j!176)))))

(assert (=> b!527298 (and (bvslt (x!49328 lt!242692) #b01111111111111111111111111111110) (or (= (select (arr!16075 a!3235) (index!20212 lt!242692)) (select (arr!16075 a!3235) j!176)) (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16075 a!3235) (index!20212 lt!242692)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527299 () Bool)

(assert (=> b!527299 (= e!307323 e!307325)))

(declare-fun res!323689 () Bool)

(assert (=> b!527299 (=> (not res!323689) (not e!307325))))

(declare-fun lt!242693 () SeekEntryResult!4498)

(assert (=> b!527299 (= res!323689 (or (= lt!242693 (MissingZero!4498 i!1204)) (= lt!242693 (MissingVacant!4498 i!1204))))))

(assert (=> b!527299 (= lt!242693 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47882 res!323688) b!527296))

(assert (= (and b!527296 res!323678) b!527287))

(assert (= (and b!527287 res!323681) b!527295))

(assert (= (and b!527295 res!323686) b!527294))

(assert (= (and b!527294 res!323683) b!527299))

(assert (= (and b!527299 res!323689) b!527291))

(assert (= (and b!527291 res!323685) b!527293))

(assert (= (and b!527293 res!323680) b!527292))

(assert (= (and b!527292 res!323679) b!527289))

(assert (= (and b!527292 (not res!323687)) b!527290))

(assert (= (and b!527290 (not res!323684)) b!527298))

(assert (= (and b!527298 c!62111) b!527288))

(assert (= (and b!527298 (not c!62111)) b!527286))

(assert (= (and b!527288 res!323682) b!527297))

(declare-fun m!508177 () Bool)

(assert (=> b!527292 m!508177))

(declare-fun m!508179 () Bool)

(assert (=> b!527292 m!508179))

(declare-fun m!508181 () Bool)

(assert (=> b!527292 m!508181))

(declare-fun m!508183 () Bool)

(assert (=> b!527292 m!508183))

(declare-fun m!508185 () Bool)

(assert (=> b!527292 m!508185))

(declare-fun m!508187 () Bool)

(assert (=> b!527292 m!508187))

(assert (=> b!527292 m!508183))

(declare-fun m!508189 () Bool)

(assert (=> b!527292 m!508189))

(declare-fun m!508191 () Bool)

(assert (=> b!527292 m!508191))

(assert (=> b!527292 m!508183))

(declare-fun m!508193 () Bool)

(assert (=> b!527292 m!508193))

(declare-fun m!508195 () Bool)

(assert (=> b!527299 m!508195))

(declare-fun m!508197 () Bool)

(assert (=> b!527291 m!508197))

(declare-fun m!508199 () Bool)

(assert (=> b!527298 m!508199))

(declare-fun m!508201 () Bool)

(assert (=> b!527298 m!508201))

(assert (=> b!527298 m!508183))

(declare-fun m!508203 () Bool)

(assert (=> b!527293 m!508203))

(assert (=> b!527289 m!508183))

(assert (=> b!527289 m!508183))

(declare-fun m!508205 () Bool)

(assert (=> b!527289 m!508205))

(declare-fun m!508207 () Bool)

(assert (=> b!527294 m!508207))

(declare-fun m!508209 () Bool)

(assert (=> b!527288 m!508209))

(declare-fun m!508211 () Bool)

(assert (=> b!527288 m!508211))

(assert (=> b!527287 m!508183))

(assert (=> b!527287 m!508183))

(declare-fun m!508213 () Bool)

(assert (=> b!527287 m!508213))

(declare-fun m!508215 () Bool)

(assert (=> b!527295 m!508215))

(declare-fun m!508217 () Bool)

(assert (=> start!47882 m!508217))

(declare-fun m!508219 () Bool)

(assert (=> start!47882 m!508219))

(check-sat (not b!527295) (not b!527294) (not b!527292) (not b!527291) (not b!527289) (not start!47882) (not b!527287) (not b!527298) (not b!527299) (not b!527288) (not b!527293))
(check-sat)
