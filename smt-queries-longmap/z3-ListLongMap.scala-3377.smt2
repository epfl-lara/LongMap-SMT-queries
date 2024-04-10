; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46616 () Bool)

(assert start!46616)

(declare-fun b!514726 () Bool)

(declare-fun res!314481 () Bool)

(declare-fun e!300573 () Bool)

(assert (=> b!514726 (=> (not res!314481) (not e!300573))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514726 (= res!314481 (validKeyInArray!0 k0!2280))))

(declare-fun b!514727 () Bool)

(declare-fun res!314476 () Bool)

(declare-fun e!300572 () Bool)

(assert (=> b!514727 (=> (not res!314476) (not e!300572))))

(declare-datatypes ((array!32985 0))(
  ( (array!32986 (arr!15862 (Array (_ BitVec 32) (_ BitVec 64))) (size!16226 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32985)

(declare-datatypes ((List!10020 0))(
  ( (Nil!10017) (Cons!10016 (h!10911 (_ BitVec 64)) (t!16248 List!10020)) )
))
(declare-fun arrayNoDuplicates!0 (array!32985 (_ BitVec 32) List!10020) Bool)

(assert (=> b!514727 (= res!314476 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10017))))

(declare-fun res!314480 () Bool)

(assert (=> start!46616 (=> (not res!314480) (not e!300573))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46616 (= res!314480 (validMask!0 mask!3524))))

(assert (=> start!46616 e!300573))

(assert (=> start!46616 true))

(declare-fun array_inv!11658 (array!32985) Bool)

(assert (=> start!46616 (array_inv!11658 a!3235)))

(declare-fun b!514728 () Bool)

(declare-fun res!314479 () Bool)

(assert (=> b!514728 (=> (not res!314479) (not e!300573))))

(declare-fun arrayContainsKey!0 (array!32985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514728 (= res!314479 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514729 () Bool)

(declare-fun e!300571 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4329 0))(
  ( (MissingZero!4329 (index!19504 (_ BitVec 32))) (Found!4329 (index!19505 (_ BitVec 32))) (Intermediate!4329 (undefined!5141 Bool) (index!19506 (_ BitVec 32)) (x!48470 (_ BitVec 32))) (Undefined!4329) (MissingVacant!4329 (index!19507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32985 (_ BitVec 32)) SeekEntryResult!4329)

(assert (=> b!514729 (= e!300571 (= (seekEntryOrOpen!0 (select (arr!15862 a!3235) j!176) a!3235 mask!3524) (Found!4329 j!176)))))

(declare-fun b!514730 () Bool)

(declare-fun res!314477 () Bool)

(assert (=> b!514730 (=> (not res!314477) (not e!300573))))

(assert (=> b!514730 (= res!314477 (validKeyInArray!0 (select (arr!15862 a!3235) j!176)))))

(declare-fun b!514731 () Bool)

(declare-fun e!300569 () Bool)

(declare-fun lt!235645 () SeekEntryResult!4329)

(assert (=> b!514731 (= e!300569 (and (bvsge (index!19506 lt!235645) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235645) (size!16226 a!3235))))))

(assert (=> b!514731 (and (bvslt (x!48470 lt!235645) #b01111111111111111111111111111110) (or (= (select (arr!15862 a!3235) (index!19506 lt!235645)) (select (arr!15862 a!3235) j!176)) (= (select (arr!15862 a!3235) (index!19506 lt!235645)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15862 a!3235) (index!19506 lt!235645)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514732 () Bool)

(declare-fun res!314473 () Bool)

(assert (=> b!514732 (=> res!314473 e!300569)))

(get-info :version)

(assert (=> b!514732 (= res!314473 (or (undefined!5141 lt!235645) (not ((_ is Intermediate!4329) lt!235645))))))

(declare-fun b!514733 () Bool)

(assert (=> b!514733 (= e!300572 (not e!300569))))

(declare-fun res!314475 () Bool)

(assert (=> b!514733 (=> res!314475 e!300569)))

(declare-fun lt!235644 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32985 (_ BitVec 32)) SeekEntryResult!4329)

(assert (=> b!514733 (= res!314475 (= lt!235645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235644 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)) mask!3524)))))

(declare-fun lt!235642 () (_ BitVec 32))

(assert (=> b!514733 (= lt!235645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235642 (select (arr!15862 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514733 (= lt!235644 (toIndex!0 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514733 (= lt!235642 (toIndex!0 (select (arr!15862 a!3235) j!176) mask!3524))))

(assert (=> b!514733 e!300571))

(declare-fun res!314483 () Bool)

(assert (=> b!514733 (=> (not res!314483) (not e!300571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32985 (_ BitVec 32)) Bool)

(assert (=> b!514733 (= res!314483 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15916 0))(
  ( (Unit!15917) )
))
(declare-fun lt!235641 () Unit!15916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15916)

(assert (=> b!514733 (= lt!235641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514734 () Bool)

(assert (=> b!514734 (= e!300573 e!300572)))

(declare-fun res!314482 () Bool)

(assert (=> b!514734 (=> (not res!314482) (not e!300572))))

(declare-fun lt!235643 () SeekEntryResult!4329)

(assert (=> b!514734 (= res!314482 (or (= lt!235643 (MissingZero!4329 i!1204)) (= lt!235643 (MissingVacant!4329 i!1204))))))

(assert (=> b!514734 (= lt!235643 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514735 () Bool)

(declare-fun res!314478 () Bool)

(assert (=> b!514735 (=> (not res!314478) (not e!300572))))

(assert (=> b!514735 (= res!314478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514736 () Bool)

(declare-fun res!314474 () Bool)

(assert (=> b!514736 (=> (not res!314474) (not e!300573))))

(assert (=> b!514736 (= res!314474 (and (= (size!16226 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16226 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16226 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46616 res!314480) b!514736))

(assert (= (and b!514736 res!314474) b!514730))

(assert (= (and b!514730 res!314477) b!514726))

(assert (= (and b!514726 res!314481) b!514728))

(assert (= (and b!514728 res!314479) b!514734))

(assert (= (and b!514734 res!314482) b!514735))

(assert (= (and b!514735 res!314478) b!514727))

(assert (= (and b!514727 res!314476) b!514733))

(assert (= (and b!514733 res!314483) b!514729))

(assert (= (and b!514733 (not res!314475)) b!514732))

(assert (= (and b!514732 (not res!314473)) b!514731))

(declare-fun m!496085 () Bool)

(assert (=> b!514727 m!496085))

(declare-fun m!496087 () Bool)

(assert (=> b!514733 m!496087))

(declare-fun m!496089 () Bool)

(assert (=> b!514733 m!496089))

(declare-fun m!496091 () Bool)

(assert (=> b!514733 m!496091))

(assert (=> b!514733 m!496091))

(declare-fun m!496093 () Bool)

(assert (=> b!514733 m!496093))

(declare-fun m!496095 () Bool)

(assert (=> b!514733 m!496095))

(declare-fun m!496097 () Bool)

(assert (=> b!514733 m!496097))

(assert (=> b!514733 m!496095))

(declare-fun m!496099 () Bool)

(assert (=> b!514733 m!496099))

(assert (=> b!514733 m!496095))

(declare-fun m!496101 () Bool)

(assert (=> b!514733 m!496101))

(assert (=> b!514733 m!496091))

(declare-fun m!496103 () Bool)

(assert (=> b!514733 m!496103))

(declare-fun m!496105 () Bool)

(assert (=> start!46616 m!496105))

(declare-fun m!496107 () Bool)

(assert (=> start!46616 m!496107))

(declare-fun m!496109 () Bool)

(assert (=> b!514726 m!496109))

(declare-fun m!496111 () Bool)

(assert (=> b!514735 m!496111))

(assert (=> b!514729 m!496095))

(assert (=> b!514729 m!496095))

(declare-fun m!496113 () Bool)

(assert (=> b!514729 m!496113))

(assert (=> b!514730 m!496095))

(assert (=> b!514730 m!496095))

(declare-fun m!496115 () Bool)

(assert (=> b!514730 m!496115))

(declare-fun m!496117 () Bool)

(assert (=> b!514734 m!496117))

(declare-fun m!496119 () Bool)

(assert (=> b!514728 m!496119))

(declare-fun m!496121 () Bool)

(assert (=> b!514731 m!496121))

(assert (=> b!514731 m!496095))

(check-sat (not b!514735) (not b!514729) (not b!514730) (not b!514728) (not start!46616) (not b!514734) (not b!514727) (not b!514733) (not b!514726))
(check-sat)
(get-model)

(declare-fun b!514782 () Bool)

(declare-fun c!60421 () Bool)

(declare-fun lt!235667 () (_ BitVec 64))

(assert (=> b!514782 (= c!60421 (= lt!235667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300595 () SeekEntryResult!4329)

(declare-fun e!300596 () SeekEntryResult!4329)

(assert (=> b!514782 (= e!300595 e!300596)))

(declare-fun lt!235668 () SeekEntryResult!4329)

(declare-fun b!514783 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32985 (_ BitVec 32)) SeekEntryResult!4329)

(assert (=> b!514783 (= e!300596 (seekKeyOrZeroReturnVacant!0 (x!48470 lt!235668) (index!19506 lt!235668) (index!19506 lt!235668) k0!2280 a!3235 mask!3524))))

(declare-fun d!79451 () Bool)

(declare-fun lt!235669 () SeekEntryResult!4329)

(assert (=> d!79451 (and (or ((_ is Undefined!4329) lt!235669) (not ((_ is Found!4329) lt!235669)) (and (bvsge (index!19505 lt!235669) #b00000000000000000000000000000000) (bvslt (index!19505 lt!235669) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235669) ((_ is Found!4329) lt!235669) (not ((_ is MissingZero!4329) lt!235669)) (and (bvsge (index!19504 lt!235669) #b00000000000000000000000000000000) (bvslt (index!19504 lt!235669) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235669) ((_ is Found!4329) lt!235669) ((_ is MissingZero!4329) lt!235669) (not ((_ is MissingVacant!4329) lt!235669)) (and (bvsge (index!19507 lt!235669) #b00000000000000000000000000000000) (bvslt (index!19507 lt!235669) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235669) (ite ((_ is Found!4329) lt!235669) (= (select (arr!15862 a!3235) (index!19505 lt!235669)) k0!2280) (ite ((_ is MissingZero!4329) lt!235669) (= (select (arr!15862 a!3235) (index!19504 lt!235669)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4329) lt!235669) (= (select (arr!15862 a!3235) (index!19507 lt!235669)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300597 () SeekEntryResult!4329)

(assert (=> d!79451 (= lt!235669 e!300597)))

(declare-fun c!60420 () Bool)

(assert (=> d!79451 (= c!60420 (and ((_ is Intermediate!4329) lt!235668) (undefined!5141 lt!235668)))))

(assert (=> d!79451 (= lt!235668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79451 (validMask!0 mask!3524)))

(assert (=> d!79451 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235669)))

(declare-fun b!514784 () Bool)

(assert (=> b!514784 (= e!300597 Undefined!4329)))

(declare-fun b!514785 () Bool)

(assert (=> b!514785 (= e!300595 (Found!4329 (index!19506 lt!235668)))))

(declare-fun b!514786 () Bool)

(assert (=> b!514786 (= e!300596 (MissingZero!4329 (index!19506 lt!235668)))))

(declare-fun b!514787 () Bool)

(assert (=> b!514787 (= e!300597 e!300595)))

(assert (=> b!514787 (= lt!235667 (select (arr!15862 a!3235) (index!19506 lt!235668)))))

(declare-fun c!60422 () Bool)

(assert (=> b!514787 (= c!60422 (= lt!235667 k0!2280))))

(assert (= (and d!79451 c!60420) b!514784))

(assert (= (and d!79451 (not c!60420)) b!514787))

(assert (= (and b!514787 c!60422) b!514785))

(assert (= (and b!514787 (not c!60422)) b!514782))

(assert (= (and b!514782 c!60421) b!514786))

(assert (= (and b!514782 (not c!60421)) b!514783))

(declare-fun m!496161 () Bool)

(assert (=> b!514783 m!496161))

(declare-fun m!496163 () Bool)

(assert (=> d!79451 m!496163))

(declare-fun m!496165 () Bool)

(assert (=> d!79451 m!496165))

(declare-fun m!496167 () Bool)

(assert (=> d!79451 m!496167))

(assert (=> d!79451 m!496167))

(declare-fun m!496169 () Bool)

(assert (=> d!79451 m!496169))

(declare-fun m!496171 () Bool)

(assert (=> d!79451 m!496171))

(assert (=> d!79451 m!496105))

(declare-fun m!496173 () Bool)

(assert (=> b!514787 m!496173))

(assert (=> b!514734 d!79451))

(declare-fun d!79453 () Bool)

(declare-fun res!314521 () Bool)

(declare-fun e!300602 () Bool)

(assert (=> d!79453 (=> res!314521 e!300602)))

(assert (=> d!79453 (= res!314521 (= (select (arr!15862 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79453 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300602)))

(declare-fun b!514792 () Bool)

(declare-fun e!300603 () Bool)

(assert (=> b!514792 (= e!300602 e!300603)))

(declare-fun res!314522 () Bool)

(assert (=> b!514792 (=> (not res!314522) (not e!300603))))

(assert (=> b!514792 (= res!314522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16226 a!3235)))))

(declare-fun b!514793 () Bool)

(assert (=> b!514793 (= e!300603 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79453 (not res!314521)) b!514792))

(assert (= (and b!514792 res!314522) b!514793))

(declare-fun m!496175 () Bool)

(assert (=> d!79453 m!496175))

(declare-fun m!496177 () Bool)

(assert (=> b!514793 m!496177))

(assert (=> b!514728 d!79453))

(declare-fun b!514836 () Bool)

(declare-fun lt!235680 () SeekEntryResult!4329)

(assert (=> b!514836 (and (bvsge (index!19506 lt!235680) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235680) (size!16226 a!3235)))))

(declare-fun res!314546 () Bool)

(assert (=> b!514836 (= res!314546 (= (select (arr!15862 a!3235) (index!19506 lt!235680)) (select (arr!15862 a!3235) j!176)))))

(declare-fun e!300637 () Bool)

(assert (=> b!514836 (=> res!314546 e!300637)))

(declare-fun e!300636 () Bool)

(assert (=> b!514836 (= e!300636 e!300637)))

(declare-fun b!514837 () Bool)

(declare-fun e!300638 () Bool)

(assert (=> b!514837 (= e!300638 e!300636)))

(declare-fun res!314547 () Bool)

(assert (=> b!514837 (= res!314547 (and ((_ is Intermediate!4329) lt!235680) (not (undefined!5141 lt!235680)) (bvslt (x!48470 lt!235680) #b01111111111111111111111111111110) (bvsge (x!48470 lt!235680) #b00000000000000000000000000000000) (bvsge (x!48470 lt!235680) #b00000000000000000000000000000000)))))

(assert (=> b!514837 (=> (not res!314547) (not e!300636))))

(declare-fun d!79455 () Bool)

(assert (=> d!79455 e!300638))

(declare-fun c!60435 () Bool)

(assert (=> d!79455 (= c!60435 (and ((_ is Intermediate!4329) lt!235680) (undefined!5141 lt!235680)))))

(declare-fun e!300635 () SeekEntryResult!4329)

(assert (=> d!79455 (= lt!235680 e!300635)))

(declare-fun c!60433 () Bool)

(assert (=> d!79455 (= c!60433 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235681 () (_ BitVec 64))

(assert (=> d!79455 (= lt!235681 (select (arr!15862 a!3235) lt!235642))))

(assert (=> d!79455 (validMask!0 mask!3524)))

(assert (=> d!79455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235642 (select (arr!15862 a!3235) j!176) a!3235 mask!3524) lt!235680)))

(declare-fun b!514838 () Bool)

(assert (=> b!514838 (= e!300635 (Intermediate!4329 true lt!235642 #b00000000000000000000000000000000))))

(declare-fun b!514839 () Bool)

(declare-fun e!300634 () SeekEntryResult!4329)

(assert (=> b!514839 (= e!300635 e!300634)))

(declare-fun c!60434 () Bool)

(assert (=> b!514839 (= c!60434 (or (= lt!235681 (select (arr!15862 a!3235) j!176)) (= (bvadd lt!235681 lt!235681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514840 () Bool)

(assert (=> b!514840 (= e!300638 (bvsge (x!48470 lt!235680) #b01111111111111111111111111111110))))

(declare-fun b!514841 () Bool)

(assert (=> b!514841 (and (bvsge (index!19506 lt!235680) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235680) (size!16226 a!3235)))))

(declare-fun res!314545 () Bool)

(assert (=> b!514841 (= res!314545 (= (select (arr!15862 a!3235) (index!19506 lt!235680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514841 (=> res!314545 e!300637)))

(declare-fun b!514842 () Bool)

(assert (=> b!514842 (= e!300634 (Intermediate!4329 false lt!235642 #b00000000000000000000000000000000))))

(declare-fun b!514843 () Bool)

(assert (=> b!514843 (and (bvsge (index!19506 lt!235680) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235680) (size!16226 a!3235)))))

(assert (=> b!514843 (= e!300637 (= (select (arr!15862 a!3235) (index!19506 lt!235680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514844 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514844 (= e!300634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235642 #b00000000000000000000000000000000 mask!3524) (select (arr!15862 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79455 c!60433) b!514838))

(assert (= (and d!79455 (not c!60433)) b!514839))

(assert (= (and b!514839 c!60434) b!514842))

(assert (= (and b!514839 (not c!60434)) b!514844))

(assert (= (and d!79455 c!60435) b!514840))

(assert (= (and d!79455 (not c!60435)) b!514837))

(assert (= (and b!514837 res!314547) b!514836))

(assert (= (and b!514836 (not res!314546)) b!514841))

(assert (= (and b!514841 (not res!314545)) b!514843))

(declare-fun m!496183 () Bool)

(assert (=> b!514844 m!496183))

(assert (=> b!514844 m!496183))

(assert (=> b!514844 m!496095))

(declare-fun m!496185 () Bool)

(assert (=> b!514844 m!496185))

(declare-fun m!496187 () Bool)

(assert (=> b!514843 m!496187))

(declare-fun m!496189 () Bool)

(assert (=> d!79455 m!496189))

(assert (=> d!79455 m!496105))

(assert (=> b!514836 m!496187))

(assert (=> b!514841 m!496187))

(assert (=> b!514733 d!79455))

(declare-fun d!79463 () Bool)

(declare-fun lt!235690 () (_ BitVec 32))

(declare-fun lt!235689 () (_ BitVec 32))

(assert (=> d!79463 (= lt!235690 (bvmul (bvxor lt!235689 (bvlshr lt!235689 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79463 (= lt!235689 ((_ extract 31 0) (bvand (bvxor (select (arr!15862 a!3235) j!176) (bvlshr (select (arr!15862 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79463 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314550 (let ((h!10913 ((_ extract 31 0) (bvand (bvxor (select (arr!15862 a!3235) j!176) (bvlshr (select (arr!15862 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48473 (bvmul (bvxor h!10913 (bvlshr h!10913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48473 (bvlshr x!48473 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314550 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314550 #b00000000000000000000000000000000))))))

(assert (=> d!79463 (= (toIndex!0 (select (arr!15862 a!3235) j!176) mask!3524) (bvand (bvxor lt!235690 (bvlshr lt!235690 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514733 d!79463))

(declare-fun lt!235691 () SeekEntryResult!4329)

(declare-fun b!514854 () Bool)

(assert (=> b!514854 (and (bvsge (index!19506 lt!235691) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235691) (size!16226 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)))))))

(declare-fun res!314556 () Bool)

(assert (=> b!514854 (= res!314556 (= (select (arr!15862 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235))) (index!19506 lt!235691)) (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300649 () Bool)

(assert (=> b!514854 (=> res!314556 e!300649)))

(declare-fun e!300648 () Bool)

(assert (=> b!514854 (= e!300648 e!300649)))

(declare-fun b!514855 () Bool)

(declare-fun e!300650 () Bool)

(assert (=> b!514855 (= e!300650 e!300648)))

(declare-fun res!314557 () Bool)

(assert (=> b!514855 (= res!314557 (and ((_ is Intermediate!4329) lt!235691) (not (undefined!5141 lt!235691)) (bvslt (x!48470 lt!235691) #b01111111111111111111111111111110) (bvsge (x!48470 lt!235691) #b00000000000000000000000000000000) (bvsge (x!48470 lt!235691) #b00000000000000000000000000000000)))))

(assert (=> b!514855 (=> (not res!314557) (not e!300648))))

(declare-fun d!79469 () Bool)

(assert (=> d!79469 e!300650))

(declare-fun c!60440 () Bool)

(assert (=> d!79469 (= c!60440 (and ((_ is Intermediate!4329) lt!235691) (undefined!5141 lt!235691)))))

(declare-fun e!300647 () SeekEntryResult!4329)

(assert (=> d!79469 (= lt!235691 e!300647)))

(declare-fun c!60438 () Bool)

(assert (=> d!79469 (= c!60438 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235692 () (_ BitVec 64))

(assert (=> d!79469 (= lt!235692 (select (arr!15862 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235))) lt!235644))))

(assert (=> d!79469 (validMask!0 mask!3524)))

(assert (=> d!79469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235644 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)) mask!3524) lt!235691)))

(declare-fun b!514856 () Bool)

(assert (=> b!514856 (= e!300647 (Intermediate!4329 true lt!235644 #b00000000000000000000000000000000))))

(declare-fun b!514857 () Bool)

(declare-fun e!300646 () SeekEntryResult!4329)

(assert (=> b!514857 (= e!300647 e!300646)))

(declare-fun c!60439 () Bool)

(assert (=> b!514857 (= c!60439 (or (= lt!235692 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235692 lt!235692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514858 () Bool)

(assert (=> b!514858 (= e!300650 (bvsge (x!48470 lt!235691) #b01111111111111111111111111111110))))

(declare-fun b!514859 () Bool)

(assert (=> b!514859 (and (bvsge (index!19506 lt!235691) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235691) (size!16226 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)))))))

(declare-fun res!314555 () Bool)

(assert (=> b!514859 (= res!314555 (= (select (arr!15862 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235))) (index!19506 lt!235691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514859 (=> res!314555 e!300649)))

(declare-fun b!514860 () Bool)

(assert (=> b!514860 (= e!300646 (Intermediate!4329 false lt!235644 #b00000000000000000000000000000000))))

(declare-fun b!514861 () Bool)

(assert (=> b!514861 (and (bvsge (index!19506 lt!235691) #b00000000000000000000000000000000) (bvslt (index!19506 lt!235691) (size!16226 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)))))))

(assert (=> b!514861 (= e!300649 (= (select (arr!15862 (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235))) (index!19506 lt!235691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514862 () Bool)

(assert (=> b!514862 (= e!300646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235644 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (array!32986 (store (arr!15862 a!3235) i!1204 k0!2280) (size!16226 a!3235)) mask!3524))))

(assert (= (and d!79469 c!60438) b!514856))

(assert (= (and d!79469 (not c!60438)) b!514857))

(assert (= (and b!514857 c!60439) b!514860))

(assert (= (and b!514857 (not c!60439)) b!514862))

(assert (= (and d!79469 c!60440) b!514858))

(assert (= (and d!79469 (not c!60440)) b!514855))

(assert (= (and b!514855 res!314557) b!514854))

(assert (= (and b!514854 (not res!314556)) b!514859))

(assert (= (and b!514859 (not res!314555)) b!514861))

(declare-fun m!496209 () Bool)

(assert (=> b!514862 m!496209))

(assert (=> b!514862 m!496209))

(assert (=> b!514862 m!496091))

(declare-fun m!496211 () Bool)

(assert (=> b!514862 m!496211))

(declare-fun m!496213 () Bool)

(assert (=> b!514861 m!496213))

(declare-fun m!496215 () Bool)

(assert (=> d!79469 m!496215))

(assert (=> d!79469 m!496105))

(assert (=> b!514854 m!496213))

(assert (=> b!514859 m!496213))

(assert (=> b!514733 d!79469))

(declare-fun b!514871 () Bool)

(declare-fun e!300657 () Bool)

(declare-fun call!31628 () Bool)

(assert (=> b!514871 (= e!300657 call!31628)))

(declare-fun b!514872 () Bool)

(declare-fun e!300659 () Bool)

(assert (=> b!514872 (= e!300659 e!300657)))

(declare-fun c!60443 () Bool)

(assert (=> b!514872 (= c!60443 (validKeyInArray!0 (select (arr!15862 a!3235) j!176)))))

(declare-fun b!514873 () Bool)

(declare-fun e!300658 () Bool)

(assert (=> b!514873 (= e!300658 call!31628)))

(declare-fun d!79471 () Bool)

(declare-fun res!314563 () Bool)

(assert (=> d!79471 (=> res!314563 e!300659)))

(assert (=> d!79471 (= res!314563 (bvsge j!176 (size!16226 a!3235)))))

(assert (=> d!79471 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300659)))

(declare-fun bm!31625 () Bool)

(assert (=> bm!31625 (= call!31628 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514874 () Bool)

(assert (=> b!514874 (= e!300657 e!300658)))

(declare-fun lt!235707 () (_ BitVec 64))

(assert (=> b!514874 (= lt!235707 (select (arr!15862 a!3235) j!176))))

(declare-fun lt!235706 () Unit!15916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32985 (_ BitVec 64) (_ BitVec 32)) Unit!15916)

(assert (=> b!514874 (= lt!235706 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235707 j!176))))

(assert (=> b!514874 (arrayContainsKey!0 a!3235 lt!235707 #b00000000000000000000000000000000)))

(declare-fun lt!235705 () Unit!15916)

(assert (=> b!514874 (= lt!235705 lt!235706)))

(declare-fun res!314562 () Bool)

(assert (=> b!514874 (= res!314562 (= (seekEntryOrOpen!0 (select (arr!15862 a!3235) j!176) a!3235 mask!3524) (Found!4329 j!176)))))

(assert (=> b!514874 (=> (not res!314562) (not e!300658))))

(assert (= (and d!79471 (not res!314563)) b!514872))

(assert (= (and b!514872 c!60443) b!514874))

(assert (= (and b!514872 (not c!60443)) b!514871))

(assert (= (and b!514874 res!314562) b!514873))

(assert (= (or b!514873 b!514871) bm!31625))

(assert (=> b!514872 m!496095))

(assert (=> b!514872 m!496095))

(assert (=> b!514872 m!496115))

(declare-fun m!496217 () Bool)

(assert (=> bm!31625 m!496217))

(assert (=> b!514874 m!496095))

(declare-fun m!496219 () Bool)

(assert (=> b!514874 m!496219))

(declare-fun m!496221 () Bool)

(assert (=> b!514874 m!496221))

(assert (=> b!514874 m!496095))

(assert (=> b!514874 m!496113))

(assert (=> b!514733 d!79471))

(declare-fun d!79475 () Bool)

(assert (=> d!79475 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235716 () Unit!15916)

(declare-fun choose!38 (array!32985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15916)

(assert (=> d!79475 (= lt!235716 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79475 (validMask!0 mask!3524)))

(assert (=> d!79475 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235716)))

(declare-fun bs!16273 () Bool)

(assert (= bs!16273 d!79475))

(assert (=> bs!16273 m!496101))

(declare-fun m!496223 () Bool)

(assert (=> bs!16273 m!496223))

(assert (=> bs!16273 m!496105))

(assert (=> b!514733 d!79475))

(declare-fun d!79477 () Bool)

(declare-fun lt!235718 () (_ BitVec 32))

(declare-fun lt!235717 () (_ BitVec 32))

(assert (=> d!79477 (= lt!235718 (bvmul (bvxor lt!235717 (bvlshr lt!235717 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79477 (= lt!235717 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79477 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314550 (let ((h!10913 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48473 (bvmul (bvxor h!10913 (bvlshr h!10913 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48473 (bvlshr x!48473 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314550 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314550 #b00000000000000000000000000000000))))))

(assert (=> d!79477 (= (toIndex!0 (select (store (arr!15862 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235718 (bvlshr lt!235718 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514733 d!79477))

(declare-fun b!514927 () Bool)

(declare-fun e!300695 () Bool)

(declare-fun contains!2738 (List!10020 (_ BitVec 64)) Bool)

(assert (=> b!514927 (= e!300695 (contains!2738 Nil!10017 (select (arr!15862 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79479 () Bool)

(declare-fun res!314577 () Bool)

(declare-fun e!300691 () Bool)

(assert (=> d!79479 (=> res!314577 e!300691)))

(assert (=> d!79479 (= res!314577 (bvsge #b00000000000000000000000000000000 (size!16226 a!3235)))))

(assert (=> d!79479 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10017) e!300691)))

(declare-fun b!514928 () Bool)

(declare-fun e!300690 () Bool)

(declare-fun call!31631 () Bool)

(assert (=> b!514928 (= e!300690 call!31631)))

(declare-fun bm!31628 () Bool)

(declare-fun c!60464 () Bool)

(assert (=> bm!31628 (= call!31631 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60464 (Cons!10016 (select (arr!15862 a!3235) #b00000000000000000000000000000000) Nil!10017) Nil!10017)))))

(declare-fun b!514929 () Bool)

(assert (=> b!514929 (= e!300690 call!31631)))

(declare-fun b!514930 () Bool)

(declare-fun e!300694 () Bool)

(assert (=> b!514930 (= e!300691 e!300694)))

(declare-fun res!314580 () Bool)

(assert (=> b!514930 (=> (not res!314580) (not e!300694))))

(assert (=> b!514930 (= res!314580 (not e!300695))))

(declare-fun res!314576 () Bool)

(assert (=> b!514930 (=> (not res!314576) (not e!300695))))

(assert (=> b!514930 (= res!314576 (validKeyInArray!0 (select (arr!15862 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514931 () Bool)

(assert (=> b!514931 (= e!300694 e!300690)))

(assert (=> b!514931 (= c!60464 (validKeyInArray!0 (select (arr!15862 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79479 (not res!314577)) b!514930))

(assert (= (and b!514930 res!314576) b!514927))

(assert (= (and b!514930 res!314580) b!514931))

(assert (= (and b!514931 c!60464) b!514929))

(assert (= (and b!514931 (not c!60464)) b!514928))

(assert (= (or b!514929 b!514928) bm!31628))

(assert (=> b!514927 m!496175))

(assert (=> b!514927 m!496175))

(declare-fun m!496251 () Bool)

(assert (=> b!514927 m!496251))

(assert (=> bm!31628 m!496175))

(declare-fun m!496253 () Bool)

(assert (=> bm!31628 m!496253))

(assert (=> b!514930 m!496175))

(assert (=> b!514930 m!496175))

(declare-fun m!496255 () Bool)

(assert (=> b!514930 m!496255))

(assert (=> b!514931 m!496175))

(assert (=> b!514931 m!496175))

(assert (=> b!514931 m!496255))

(assert (=> b!514727 d!79479))

(declare-fun d!79487 () Bool)

(assert (=> d!79487 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514726 d!79487))

(declare-fun d!79491 () Bool)

(assert (=> d!79491 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46616 d!79491))

(declare-fun d!79499 () Bool)

(assert (=> d!79499 (= (array_inv!11658 a!3235) (bvsge (size!16226 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46616 d!79499))

(declare-fun d!79501 () Bool)

(assert (=> d!79501 (= (validKeyInArray!0 (select (arr!15862 a!3235) j!176)) (and (not (= (select (arr!15862 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15862 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514730 d!79501))

(declare-fun b!514974 () Bool)

(declare-fun e!300726 () Bool)

(declare-fun call!31638 () Bool)

(assert (=> b!514974 (= e!300726 call!31638)))

(declare-fun b!514975 () Bool)

(declare-fun e!300728 () Bool)

(assert (=> b!514975 (= e!300728 e!300726)))

(declare-fun c!60474 () Bool)

(assert (=> b!514975 (= c!60474 (validKeyInArray!0 (select (arr!15862 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514976 () Bool)

(declare-fun e!300727 () Bool)

(assert (=> b!514976 (= e!300727 call!31638)))

(declare-fun d!79503 () Bool)

(declare-fun res!314604 () Bool)

(assert (=> d!79503 (=> res!314604 e!300728)))

(assert (=> d!79503 (= res!314604 (bvsge #b00000000000000000000000000000000 (size!16226 a!3235)))))

(assert (=> d!79503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300728)))

(declare-fun bm!31635 () Bool)

(assert (=> bm!31635 (= call!31638 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514977 () Bool)

(assert (=> b!514977 (= e!300726 e!300727)))

(declare-fun lt!235742 () (_ BitVec 64))

(assert (=> b!514977 (= lt!235742 (select (arr!15862 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235741 () Unit!15916)

(assert (=> b!514977 (= lt!235741 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235742 #b00000000000000000000000000000000))))

(assert (=> b!514977 (arrayContainsKey!0 a!3235 lt!235742 #b00000000000000000000000000000000)))

(declare-fun lt!235740 () Unit!15916)

(assert (=> b!514977 (= lt!235740 lt!235741)))

(declare-fun res!314603 () Bool)

(assert (=> b!514977 (= res!314603 (= (seekEntryOrOpen!0 (select (arr!15862 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4329 #b00000000000000000000000000000000)))))

(assert (=> b!514977 (=> (not res!314603) (not e!300727))))

(assert (= (and d!79503 (not res!314604)) b!514975))

(assert (= (and b!514975 c!60474) b!514977))

(assert (= (and b!514975 (not c!60474)) b!514974))

(assert (= (and b!514977 res!314603) b!514976))

(assert (= (or b!514976 b!514974) bm!31635))

(assert (=> b!514975 m!496175))

(assert (=> b!514975 m!496175))

(assert (=> b!514975 m!496255))

(declare-fun m!496277 () Bool)

(assert (=> bm!31635 m!496277))

(assert (=> b!514977 m!496175))

(declare-fun m!496279 () Bool)

(assert (=> b!514977 m!496279))

(declare-fun m!496281 () Bool)

(assert (=> b!514977 m!496281))

(assert (=> b!514977 m!496175))

(declare-fun m!496283 () Bool)

(assert (=> b!514977 m!496283))

(assert (=> b!514735 d!79503))

(declare-fun b!514978 () Bool)

(declare-fun c!60476 () Bool)

(declare-fun lt!235743 () (_ BitVec 64))

(assert (=> b!514978 (= c!60476 (= lt!235743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300729 () SeekEntryResult!4329)

(declare-fun e!300730 () SeekEntryResult!4329)

(assert (=> b!514978 (= e!300729 e!300730)))

(declare-fun lt!235744 () SeekEntryResult!4329)

(declare-fun b!514979 () Bool)

(assert (=> b!514979 (= e!300730 (seekKeyOrZeroReturnVacant!0 (x!48470 lt!235744) (index!19506 lt!235744) (index!19506 lt!235744) (select (arr!15862 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79505 () Bool)

(declare-fun lt!235745 () SeekEntryResult!4329)

(assert (=> d!79505 (and (or ((_ is Undefined!4329) lt!235745) (not ((_ is Found!4329) lt!235745)) (and (bvsge (index!19505 lt!235745) #b00000000000000000000000000000000) (bvslt (index!19505 lt!235745) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235745) ((_ is Found!4329) lt!235745) (not ((_ is MissingZero!4329) lt!235745)) (and (bvsge (index!19504 lt!235745) #b00000000000000000000000000000000) (bvslt (index!19504 lt!235745) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235745) ((_ is Found!4329) lt!235745) ((_ is MissingZero!4329) lt!235745) (not ((_ is MissingVacant!4329) lt!235745)) (and (bvsge (index!19507 lt!235745) #b00000000000000000000000000000000) (bvslt (index!19507 lt!235745) (size!16226 a!3235)))) (or ((_ is Undefined!4329) lt!235745) (ite ((_ is Found!4329) lt!235745) (= (select (arr!15862 a!3235) (index!19505 lt!235745)) (select (arr!15862 a!3235) j!176)) (ite ((_ is MissingZero!4329) lt!235745) (= (select (arr!15862 a!3235) (index!19504 lt!235745)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4329) lt!235745) (= (select (arr!15862 a!3235) (index!19507 lt!235745)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300731 () SeekEntryResult!4329)

(assert (=> d!79505 (= lt!235745 e!300731)))

(declare-fun c!60475 () Bool)

(assert (=> d!79505 (= c!60475 (and ((_ is Intermediate!4329) lt!235744) (undefined!5141 lt!235744)))))

(assert (=> d!79505 (= lt!235744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15862 a!3235) j!176) mask!3524) (select (arr!15862 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79505 (validMask!0 mask!3524)))

(assert (=> d!79505 (= (seekEntryOrOpen!0 (select (arr!15862 a!3235) j!176) a!3235 mask!3524) lt!235745)))

(declare-fun b!514980 () Bool)

(assert (=> b!514980 (= e!300731 Undefined!4329)))

(declare-fun b!514981 () Bool)

(assert (=> b!514981 (= e!300729 (Found!4329 (index!19506 lt!235744)))))

(declare-fun b!514982 () Bool)

(assert (=> b!514982 (= e!300730 (MissingZero!4329 (index!19506 lt!235744)))))

(declare-fun b!514983 () Bool)

(assert (=> b!514983 (= e!300731 e!300729)))

(assert (=> b!514983 (= lt!235743 (select (arr!15862 a!3235) (index!19506 lt!235744)))))

(declare-fun c!60477 () Bool)

(assert (=> b!514983 (= c!60477 (= lt!235743 (select (arr!15862 a!3235) j!176)))))

(assert (= (and d!79505 c!60475) b!514980))

(assert (= (and d!79505 (not c!60475)) b!514983))

(assert (= (and b!514983 c!60477) b!514981))

(assert (= (and b!514983 (not c!60477)) b!514978))

(assert (= (and b!514978 c!60476) b!514982))

(assert (= (and b!514978 (not c!60476)) b!514979))

(assert (=> b!514979 m!496095))

(declare-fun m!496285 () Bool)

(assert (=> b!514979 m!496285))

(declare-fun m!496287 () Bool)

(assert (=> d!79505 m!496287))

(declare-fun m!496289 () Bool)

(assert (=> d!79505 m!496289))

(assert (=> d!79505 m!496095))

(assert (=> d!79505 m!496097))

(assert (=> d!79505 m!496097))

(assert (=> d!79505 m!496095))

(declare-fun m!496291 () Bool)

(assert (=> d!79505 m!496291))

(declare-fun m!496293 () Bool)

(assert (=> d!79505 m!496293))

(assert (=> d!79505 m!496105))

(declare-fun m!496295 () Bool)

(assert (=> b!514983 m!496295))

(assert (=> b!514729 d!79505))

(check-sat (not d!79469) (not bm!31628) (not bm!31625) (not b!514975) (not b!514793) (not d!79475) (not b!514862) (not b!514927) (not b!514979) (not b!514931) (not b!514872) (not d!79451) (not b!514930) (not bm!31635) (not b!514874) (not b!514977) (not b!514783) (not b!514844) (not d!79505) (not d!79455))
(check-sat)
