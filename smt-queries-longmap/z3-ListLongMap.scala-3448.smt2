; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47810 () Bool)

(assert start!47810)

(declare-fun b!526810 () Bool)

(declare-fun res!323390 () Bool)

(declare-fun e!307045 () Bool)

(assert (=> b!526810 (=> (not res!323390) (not e!307045))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33447 0))(
  ( (array!33448 (arr!16075 (Array (_ BitVec 32) (_ BitVec 64))) (size!16439 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33447)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526810 (= res!323390 (and (= (size!16439 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16439 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16439 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!307047 () Bool)

(declare-fun b!526811 () Bool)

(declare-datatypes ((SeekEntryResult!4542 0))(
  ( (MissingZero!4542 (index!20380 (_ BitVec 32))) (Found!4542 (index!20381 (_ BitVec 32))) (Intermediate!4542 (undefined!5354 Bool) (index!20382 (_ BitVec 32)) (x!49347 (_ BitVec 32))) (Undefined!4542) (MissingVacant!4542 (index!20383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33447 (_ BitVec 32)) SeekEntryResult!4542)

(assert (=> b!526811 (= e!307047 (= (seekEntryOrOpen!0 (select (arr!16075 a!3235) j!176) a!3235 mask!3524) (Found!4542 j!176)))))

(declare-fun res!323382 () Bool)

(assert (=> start!47810 (=> (not res!323382) (not e!307045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47810 (= res!323382 (validMask!0 mask!3524))))

(assert (=> start!47810 e!307045))

(assert (=> start!47810 true))

(declare-fun array_inv!11871 (array!33447) Bool)

(assert (=> start!47810 (array_inv!11871 a!3235)))

(declare-fun b!526812 () Bool)

(declare-fun e!307048 () Bool)

(declare-fun e!307044 () Bool)

(assert (=> b!526812 (= e!307048 (not e!307044))))

(declare-fun res!323379 () Bool)

(assert (=> b!526812 (=> res!323379 e!307044)))

(declare-fun lt!242376 () (_ BitVec 64))

(declare-fun lt!242380 () (_ BitVec 32))

(declare-fun lt!242381 () SeekEntryResult!4542)

(declare-fun lt!242374 () array!33447)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33447 (_ BitVec 32)) SeekEntryResult!4542)

(assert (=> b!526812 (= res!323379 (= lt!242381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242380 lt!242376 lt!242374 mask!3524)))))

(declare-fun lt!242379 () (_ BitVec 32))

(assert (=> b!526812 (= lt!242381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242379 (select (arr!16075 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526812 (= lt!242380 (toIndex!0 lt!242376 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!526812 (= lt!242376 (select (store (arr!16075 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526812 (= lt!242379 (toIndex!0 (select (arr!16075 a!3235) j!176) mask!3524))))

(assert (=> b!526812 (= lt!242374 (array!33448 (store (arr!16075 a!3235) i!1204 k0!2280) (size!16439 a!3235)))))

(assert (=> b!526812 e!307047))

(declare-fun res!323388 () Bool)

(assert (=> b!526812 (=> (not res!323388) (not e!307047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33447 (_ BitVec 32)) Bool)

(assert (=> b!526812 (= res!323388 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16620 0))(
  ( (Unit!16621) )
))
(declare-fun lt!242375 () Unit!16620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16620)

(assert (=> b!526812 (= lt!242375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526813 () Bool)

(assert (=> b!526813 (= e!307045 e!307048)))

(declare-fun res!323381 () Bool)

(assert (=> b!526813 (=> (not res!323381) (not e!307048))))

(declare-fun lt!242383 () SeekEntryResult!4542)

(assert (=> b!526813 (= res!323381 (or (= lt!242383 (MissingZero!4542 i!1204)) (= lt!242383 (MissingVacant!4542 i!1204))))))

(assert (=> b!526813 (= lt!242383 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526814 () Bool)

(declare-fun res!323380 () Bool)

(assert (=> b!526814 (=> (not res!323380) (not e!307045))))

(declare-fun arrayContainsKey!0 (array!33447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526814 (= res!323380 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526815 () Bool)

(declare-fun res!323387 () Bool)

(assert (=> b!526815 (=> (not res!323387) (not e!307048))))

(assert (=> b!526815 (= res!323387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526816 () Bool)

(declare-fun res!323386 () Bool)

(assert (=> b!526816 (=> (not res!323386) (not e!307045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526816 (= res!323386 (validKeyInArray!0 (select (arr!16075 a!3235) j!176)))))

(declare-fun b!526817 () Bool)

(declare-fun e!307046 () Unit!16620)

(declare-fun Unit!16622 () Unit!16620)

(assert (=> b!526817 (= e!307046 Unit!16622)))

(declare-fun b!526818 () Bool)

(declare-fun res!323385 () Bool)

(assert (=> b!526818 (=> (not res!323385) (not e!307045))))

(assert (=> b!526818 (= res!323385 (validKeyInArray!0 k0!2280))))

(declare-fun b!526819 () Bool)

(declare-fun e!307050 () Bool)

(assert (=> b!526819 (= e!307050 false)))

(declare-fun b!526820 () Bool)

(declare-fun res!323383 () Bool)

(assert (=> b!526820 (=> (not res!323383) (not e!307048))))

(declare-datatypes ((List!10233 0))(
  ( (Nil!10230) (Cons!10229 (h!11160 (_ BitVec 64)) (t!16461 List!10233)) )
))
(declare-fun arrayNoDuplicates!0 (array!33447 (_ BitVec 32) List!10233) Bool)

(assert (=> b!526820 (= res!323383 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10230))))

(declare-fun b!526821 () Bool)

(assert (=> b!526821 (= e!307044 (bvsle (x!49347 lt!242381) #b01111111111111111111111111111110))))

(assert (=> b!526821 (= (index!20382 lt!242381) i!1204)))

(declare-fun lt!242377 () Unit!16620)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33447 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16620)

(assert (=> b!526821 (= lt!242377 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242379 #b00000000000000000000000000000000 (index!20382 lt!242381) (x!49347 lt!242381) mask!3524))))

(assert (=> b!526821 (and (or (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242382 () Unit!16620)

(assert (=> b!526821 (= lt!242382 e!307046)))

(declare-fun c!62021 () Bool)

(assert (=> b!526821 (= c!62021 (= (select (arr!16075 a!3235) (index!20382 lt!242381)) (select (arr!16075 a!3235) j!176)))))

(assert (=> b!526821 (and (bvslt (x!49347 lt!242381) #b01111111111111111111111111111110) (or (= (select (arr!16075 a!3235) (index!20382 lt!242381)) (select (arr!16075 a!3235) j!176)) (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16075 a!3235) (index!20382 lt!242381)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526822 () Bool)

(declare-fun Unit!16623 () Unit!16620)

(assert (=> b!526822 (= e!307046 Unit!16623)))

(declare-fun lt!242378 () Unit!16620)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33447 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16620)

(assert (=> b!526822 (= lt!242378 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242379 #b00000000000000000000000000000000 (index!20382 lt!242381) (x!49347 lt!242381) mask!3524))))

(declare-fun res!323384 () Bool)

(assert (=> b!526822 (= res!323384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242379 lt!242376 lt!242374 mask!3524) (Intermediate!4542 false (index!20382 lt!242381) (x!49347 lt!242381))))))

(assert (=> b!526822 (=> (not res!323384) (not e!307050))))

(assert (=> b!526822 e!307050))

(declare-fun b!526823 () Bool)

(declare-fun res!323389 () Bool)

(assert (=> b!526823 (=> res!323389 e!307044)))

(get-info :version)

(assert (=> b!526823 (= res!323389 (or (undefined!5354 lt!242381) (not ((_ is Intermediate!4542) lt!242381))))))

(assert (= (and start!47810 res!323382) b!526810))

(assert (= (and b!526810 res!323390) b!526816))

(assert (= (and b!526816 res!323386) b!526818))

(assert (= (and b!526818 res!323385) b!526814))

(assert (= (and b!526814 res!323380) b!526813))

(assert (= (and b!526813 res!323381) b!526815))

(assert (= (and b!526815 res!323387) b!526820))

(assert (= (and b!526820 res!323383) b!526812))

(assert (= (and b!526812 res!323388) b!526811))

(assert (= (and b!526812 (not res!323379)) b!526823))

(assert (= (and b!526823 (not res!323389)) b!526821))

(assert (= (and b!526821 c!62021) b!526822))

(assert (= (and b!526821 (not c!62021)) b!526817))

(assert (= (and b!526822 res!323384) b!526819))

(declare-fun m!507533 () Bool)

(assert (=> b!526820 m!507533))

(declare-fun m!507535 () Bool)

(assert (=> b!526815 m!507535))

(declare-fun m!507537 () Bool)

(assert (=> b!526812 m!507537))

(declare-fun m!507539 () Bool)

(assert (=> b!526812 m!507539))

(declare-fun m!507541 () Bool)

(assert (=> b!526812 m!507541))

(declare-fun m!507543 () Bool)

(assert (=> b!526812 m!507543))

(declare-fun m!507545 () Bool)

(assert (=> b!526812 m!507545))

(declare-fun m!507547 () Bool)

(assert (=> b!526812 m!507547))

(declare-fun m!507549 () Bool)

(assert (=> b!526812 m!507549))

(assert (=> b!526812 m!507547))

(declare-fun m!507551 () Bool)

(assert (=> b!526812 m!507551))

(assert (=> b!526812 m!507547))

(declare-fun m!507553 () Bool)

(assert (=> b!526812 m!507553))

(declare-fun m!507555 () Bool)

(assert (=> b!526813 m!507555))

(declare-fun m!507557 () Bool)

(assert (=> b!526822 m!507557))

(declare-fun m!507559 () Bool)

(assert (=> b!526822 m!507559))

(declare-fun m!507561 () Bool)

(assert (=> b!526818 m!507561))

(assert (=> b!526816 m!507547))

(assert (=> b!526816 m!507547))

(declare-fun m!507563 () Bool)

(assert (=> b!526816 m!507563))

(declare-fun m!507565 () Bool)

(assert (=> b!526814 m!507565))

(declare-fun m!507567 () Bool)

(assert (=> start!47810 m!507567))

(declare-fun m!507569 () Bool)

(assert (=> start!47810 m!507569))

(assert (=> b!526811 m!507547))

(assert (=> b!526811 m!507547))

(declare-fun m!507571 () Bool)

(assert (=> b!526811 m!507571))

(declare-fun m!507573 () Bool)

(assert (=> b!526821 m!507573))

(declare-fun m!507575 () Bool)

(assert (=> b!526821 m!507575))

(assert (=> b!526821 m!507547))

(check-sat (not b!526812) (not b!526814) (not b!526813) (not b!526821) (not start!47810) (not b!526818) (not b!526822) (not b!526811) (not b!526815) (not b!526816) (not b!526820))
(check-sat)
