; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47156 () Bool)

(assert start!47156)

(declare-fun b!519421 () Bool)

(declare-fun e!303069 () Bool)

(declare-fun e!303066 () Bool)

(assert (=> b!519421 (= e!303069 (not e!303066))))

(declare-fun res!317971 () Bool)

(assert (=> b!519421 (=> res!317971 e!303066)))

(declare-datatypes ((array!33171 0))(
  ( (array!33172 (arr!15946 (Array (_ BitVec 32) (_ BitVec 64))) (size!16310 (_ BitVec 32))) )
))
(declare-fun lt!237863 () array!33171)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!237866 () (_ BitVec 32))

(declare-fun lt!237862 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4413 0))(
  ( (MissingZero!4413 (index!19846 (_ BitVec 32))) (Found!4413 (index!19847 (_ BitVec 32))) (Intermediate!4413 (undefined!5225 Bool) (index!19848 (_ BitVec 32)) (x!48820 (_ BitVec 32))) (Undefined!4413) (MissingVacant!4413 (index!19849 (_ BitVec 32))) )
))
(declare-fun lt!237864 () SeekEntryResult!4413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33171 (_ BitVec 32)) SeekEntryResult!4413)

(assert (=> b!519421 (= res!317971 (= lt!237864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237866 lt!237862 lt!237863 mask!3524)))))

(declare-fun a!3235 () array!33171)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!237860 () (_ BitVec 32))

(assert (=> b!519421 (= lt!237864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237860 (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519421 (= lt!237866 (toIndex!0 lt!237862 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519421 (= lt!237862 (select (store (arr!15946 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519421 (= lt!237860 (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524))))

(assert (=> b!519421 (= lt!237863 (array!33172 (store (arr!15946 a!3235) i!1204 k0!2280) (size!16310 a!3235)))))

(declare-fun e!303072 () Bool)

(assert (=> b!519421 e!303072))

(declare-fun res!317970 () Bool)

(assert (=> b!519421 (=> (not res!317970) (not e!303072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33171 (_ BitVec 32)) Bool)

(assert (=> b!519421 (= res!317970 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16104 0))(
  ( (Unit!16105) )
))
(declare-fun lt!237867 () Unit!16104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16104)

(assert (=> b!519421 (= lt!237867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519422 () Bool)

(declare-fun e!303068 () Bool)

(assert (=> b!519422 (= e!303068 false)))

(declare-fun b!519423 () Bool)

(declare-fun res!317980 () Bool)

(declare-fun e!303070 () Bool)

(assert (=> b!519423 (=> (not res!317980) (not e!303070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519423 (= res!317980 (validKeyInArray!0 k0!2280))))

(declare-fun b!519424 () Bool)

(declare-fun e!303067 () Unit!16104)

(declare-fun Unit!16106 () Unit!16104)

(assert (=> b!519424 (= e!303067 Unit!16106)))

(declare-fun b!519425 () Bool)

(declare-fun res!317974 () Bool)

(assert (=> b!519425 (=> (not res!317974) (not e!303070))))

(assert (=> b!519425 (= res!317974 (validKeyInArray!0 (select (arr!15946 a!3235) j!176)))))

(declare-fun b!519426 () Bool)

(assert (=> b!519426 (= e!303070 e!303069)))

(declare-fun res!317973 () Bool)

(assert (=> b!519426 (=> (not res!317973) (not e!303069))))

(declare-fun lt!237865 () SeekEntryResult!4413)

(assert (=> b!519426 (= res!317973 (or (= lt!237865 (MissingZero!4413 i!1204)) (= lt!237865 (MissingVacant!4413 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33171 (_ BitVec 32)) SeekEntryResult!4413)

(assert (=> b!519426 (= lt!237865 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519427 () Bool)

(declare-fun res!317975 () Bool)

(assert (=> b!519427 (=> res!317975 e!303066)))

(get-info :version)

(assert (=> b!519427 (= res!317975 (or (undefined!5225 lt!237864) (not ((_ is Intermediate!4413) lt!237864))))))

(declare-fun b!519428 () Bool)

(declare-fun Unit!16107 () Unit!16104)

(assert (=> b!519428 (= e!303067 Unit!16107)))

(declare-fun lt!237861 () Unit!16104)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16104)

(assert (=> b!519428 (= lt!237861 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237860 #b00000000000000000000000000000000 (index!19848 lt!237864) (x!48820 lt!237864) mask!3524))))

(declare-fun res!317979 () Bool)

(assert (=> b!519428 (= res!317979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237860 lt!237862 lt!237863 mask!3524) (Intermediate!4413 false (index!19848 lt!237864) (x!48820 lt!237864))))))

(assert (=> b!519428 (=> (not res!317979) (not e!303068))))

(assert (=> b!519428 e!303068))

(declare-fun b!519429 () Bool)

(assert (=> b!519429 (= e!303066 (and (bvsge (index!19848 lt!237864) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237864) (size!16310 a!3235))))))

(assert (=> b!519429 (or (= (select (arr!15946 a!3235) (index!19848 lt!237864)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15946 a!3235) (index!19848 lt!237864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!237868 () Unit!16104)

(assert (=> b!519429 (= lt!237868 e!303067)))

(declare-fun c!61022 () Bool)

(assert (=> b!519429 (= c!61022 (= (select (arr!15946 a!3235) (index!19848 lt!237864)) (select (arr!15946 a!3235) j!176)))))

(assert (=> b!519429 (and (bvslt (x!48820 lt!237864) #b01111111111111111111111111111110) (or (= (select (arr!15946 a!3235) (index!19848 lt!237864)) (select (arr!15946 a!3235) j!176)) (= (select (arr!15946 a!3235) (index!19848 lt!237864)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15946 a!3235) (index!19848 lt!237864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519430 () Bool)

(declare-fun res!317978 () Bool)

(assert (=> b!519430 (=> (not res!317978) (not e!303070))))

(declare-fun arrayContainsKey!0 (array!33171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519430 (= res!317978 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519431 () Bool)

(declare-fun res!317977 () Bool)

(assert (=> b!519431 (=> (not res!317977) (not e!303070))))

(assert (=> b!519431 (= res!317977 (and (= (size!16310 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16310 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!317981 () Bool)

(assert (=> start!47156 (=> (not res!317981) (not e!303070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47156 (= res!317981 (validMask!0 mask!3524))))

(assert (=> start!47156 e!303070))

(assert (=> start!47156 true))

(declare-fun array_inv!11742 (array!33171) Bool)

(assert (=> start!47156 (array_inv!11742 a!3235)))

(declare-fun b!519432 () Bool)

(declare-fun res!317972 () Bool)

(assert (=> b!519432 (=> (not res!317972) (not e!303069))))

(assert (=> b!519432 (= res!317972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519433 () Bool)

(declare-fun res!317976 () Bool)

(assert (=> b!519433 (=> (not res!317976) (not e!303069))))

(declare-datatypes ((List!10104 0))(
  ( (Nil!10101) (Cons!10100 (h!11013 (_ BitVec 64)) (t!16332 List!10104)) )
))
(declare-fun arrayNoDuplicates!0 (array!33171 (_ BitVec 32) List!10104) Bool)

(assert (=> b!519433 (= res!317976 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10101))))

(declare-fun b!519434 () Bool)

(assert (=> b!519434 (= e!303072 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) (Found!4413 j!176)))))

(assert (= (and start!47156 res!317981) b!519431))

(assert (= (and b!519431 res!317977) b!519425))

(assert (= (and b!519425 res!317974) b!519423))

(assert (= (and b!519423 res!317980) b!519430))

(assert (= (and b!519430 res!317978) b!519426))

(assert (= (and b!519426 res!317973) b!519432))

(assert (= (and b!519432 res!317972) b!519433))

(assert (= (and b!519433 res!317976) b!519421))

(assert (= (and b!519421 res!317970) b!519434))

(assert (= (and b!519421 (not res!317971)) b!519427))

(assert (= (and b!519427 (not res!317975)) b!519429))

(assert (= (and b!519429 c!61022) b!519428))

(assert (= (and b!519429 (not c!61022)) b!519424))

(assert (= (and b!519428 res!317979) b!519422))

(declare-fun m!500613 () Bool)

(assert (=> b!519425 m!500613))

(assert (=> b!519425 m!500613))

(declare-fun m!500615 () Bool)

(assert (=> b!519425 m!500615))

(declare-fun m!500617 () Bool)

(assert (=> start!47156 m!500617))

(declare-fun m!500619 () Bool)

(assert (=> start!47156 m!500619))

(declare-fun m!500621 () Bool)

(assert (=> b!519432 m!500621))

(declare-fun m!500623 () Bool)

(assert (=> b!519428 m!500623))

(declare-fun m!500625 () Bool)

(assert (=> b!519428 m!500625))

(declare-fun m!500627 () Bool)

(assert (=> b!519429 m!500627))

(assert (=> b!519429 m!500613))

(assert (=> b!519434 m!500613))

(assert (=> b!519434 m!500613))

(declare-fun m!500629 () Bool)

(assert (=> b!519434 m!500629))

(declare-fun m!500631 () Bool)

(assert (=> b!519423 m!500631))

(declare-fun m!500633 () Bool)

(assert (=> b!519426 m!500633))

(declare-fun m!500635 () Bool)

(assert (=> b!519430 m!500635))

(declare-fun m!500637 () Bool)

(assert (=> b!519421 m!500637))

(declare-fun m!500639 () Bool)

(assert (=> b!519421 m!500639))

(declare-fun m!500641 () Bool)

(assert (=> b!519421 m!500641))

(declare-fun m!500643 () Bool)

(assert (=> b!519421 m!500643))

(assert (=> b!519421 m!500613))

(declare-fun m!500645 () Bool)

(assert (=> b!519421 m!500645))

(assert (=> b!519421 m!500613))

(declare-fun m!500647 () Bool)

(assert (=> b!519421 m!500647))

(assert (=> b!519421 m!500613))

(declare-fun m!500649 () Bool)

(assert (=> b!519421 m!500649))

(declare-fun m!500651 () Bool)

(assert (=> b!519421 m!500651))

(declare-fun m!500653 () Bool)

(assert (=> b!519433 m!500653))

(check-sat (not b!519428) (not b!519434) (not b!519426) (not b!519423) (not start!47156) (not b!519425) (not b!519421) (not b!519433) (not b!519432) (not b!519430))
(check-sat)
(get-model)

(declare-fun d!80071 () Bool)

(declare-fun lt!237901 () (_ BitVec 32))

(declare-fun lt!237900 () (_ BitVec 32))

(assert (=> d!80071 (= lt!237901 (bvmul (bvxor lt!237900 (bvlshr lt!237900 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80071 (= lt!237900 ((_ extract 31 0) (bvand (bvxor (select (arr!15946 a!3235) j!176) (bvlshr (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80071 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318018 (let ((h!11015 ((_ extract 31 0) (bvand (bvxor (select (arr!15946 a!3235) j!176) (bvlshr (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48822 (bvmul (bvxor h!11015 (bvlshr h!11015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48822 (bvlshr x!48822 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318018 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318018 #b00000000000000000000000000000000))))))

(assert (=> d!80071 (= (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524) (bvand (bvxor lt!237901 (bvlshr lt!237901 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519421 d!80071))

(declare-fun d!80073 () Bool)

(declare-fun res!318024 () Bool)

(declare-fun e!303101 () Bool)

(assert (=> d!80073 (=> res!318024 e!303101)))

(assert (=> d!80073 (= res!318024 (bvsge j!176 (size!16310 a!3235)))))

(assert (=> d!80073 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303101)))

(declare-fun b!519485 () Bool)

(declare-fun e!303102 () Bool)

(declare-fun call!31748 () Bool)

(assert (=> b!519485 (= e!303102 call!31748)))

(declare-fun b!519486 () Bool)

(declare-fun e!303100 () Bool)

(assert (=> b!519486 (= e!303101 e!303100)))

(declare-fun c!61028 () Bool)

(assert (=> b!519486 (= c!61028 (validKeyInArray!0 (select (arr!15946 a!3235) j!176)))))

(declare-fun bm!31745 () Bool)

(assert (=> bm!31745 (= call!31748 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519487 () Bool)

(assert (=> b!519487 (= e!303100 e!303102)))

(declare-fun lt!237909 () (_ BitVec 64))

(assert (=> b!519487 (= lt!237909 (select (arr!15946 a!3235) j!176))))

(declare-fun lt!237908 () Unit!16104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33171 (_ BitVec 64) (_ BitVec 32)) Unit!16104)

(assert (=> b!519487 (= lt!237908 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237909 j!176))))

(assert (=> b!519487 (arrayContainsKey!0 a!3235 lt!237909 #b00000000000000000000000000000000)))

(declare-fun lt!237910 () Unit!16104)

(assert (=> b!519487 (= lt!237910 lt!237908)))

(declare-fun res!318023 () Bool)

(assert (=> b!519487 (= res!318023 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) (Found!4413 j!176)))))

(assert (=> b!519487 (=> (not res!318023) (not e!303102))))

(declare-fun b!519488 () Bool)

(assert (=> b!519488 (= e!303100 call!31748)))

(assert (= (and d!80073 (not res!318024)) b!519486))

(assert (= (and b!519486 c!61028) b!519487))

(assert (= (and b!519486 (not c!61028)) b!519488))

(assert (= (and b!519487 res!318023) b!519485))

(assert (= (or b!519485 b!519488) bm!31745))

(assert (=> b!519486 m!500613))

(assert (=> b!519486 m!500613))

(assert (=> b!519486 m!500615))

(declare-fun m!500697 () Bool)

(assert (=> bm!31745 m!500697))

(assert (=> b!519487 m!500613))

(declare-fun m!500699 () Bool)

(assert (=> b!519487 m!500699))

(declare-fun m!500701 () Bool)

(assert (=> b!519487 m!500701))

(assert (=> b!519487 m!500613))

(assert (=> b!519487 m!500629))

(assert (=> b!519421 d!80073))

(declare-fun d!80075 () Bool)

(declare-fun lt!237912 () (_ BitVec 32))

(declare-fun lt!237911 () (_ BitVec 32))

(assert (=> d!80075 (= lt!237912 (bvmul (bvxor lt!237911 (bvlshr lt!237911 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80075 (= lt!237911 ((_ extract 31 0) (bvand (bvxor lt!237862 (bvlshr lt!237862 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80075 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318018 (let ((h!11015 ((_ extract 31 0) (bvand (bvxor lt!237862 (bvlshr lt!237862 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48822 (bvmul (bvxor h!11015 (bvlshr h!11015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48822 (bvlshr x!48822 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318018 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318018 #b00000000000000000000000000000000))))))

(assert (=> d!80075 (= (toIndex!0 lt!237862 mask!3524) (bvand (bvxor lt!237912 (bvlshr lt!237912 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519421 d!80075))

(declare-fun b!519507 () Bool)

(declare-fun e!303117 () Bool)

(declare-fun e!303113 () Bool)

(assert (=> b!519507 (= e!303117 e!303113)))

(declare-fun res!318032 () Bool)

(declare-fun lt!237917 () SeekEntryResult!4413)

(assert (=> b!519507 (= res!318032 (and ((_ is Intermediate!4413) lt!237917) (not (undefined!5225 lt!237917)) (bvslt (x!48820 lt!237917) #b01111111111111111111111111111110) (bvsge (x!48820 lt!237917) #b00000000000000000000000000000000) (bvsge (x!48820 lt!237917) #b00000000000000000000000000000000)))))

(assert (=> b!519507 (=> (not res!318032) (not e!303113))))

(declare-fun b!519508 () Bool)

(declare-fun e!303114 () SeekEntryResult!4413)

(declare-fun e!303116 () SeekEntryResult!4413)

(assert (=> b!519508 (= e!303114 e!303116)))

(declare-fun c!61037 () Bool)

(declare-fun lt!237918 () (_ BitVec 64))

(assert (=> b!519508 (= c!61037 (or (= lt!237918 lt!237862) (= (bvadd lt!237918 lt!237918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80077 () Bool)

(assert (=> d!80077 e!303117))

(declare-fun c!61036 () Bool)

(assert (=> d!80077 (= c!61036 (and ((_ is Intermediate!4413) lt!237917) (undefined!5225 lt!237917)))))

(assert (=> d!80077 (= lt!237917 e!303114)))

(declare-fun c!61035 () Bool)

(assert (=> d!80077 (= c!61035 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80077 (= lt!237918 (select (arr!15946 lt!237863) lt!237866))))

(assert (=> d!80077 (validMask!0 mask!3524)))

(assert (=> d!80077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237866 lt!237862 lt!237863 mask!3524) lt!237917)))

(declare-fun b!519509 () Bool)

(assert (=> b!519509 (= e!303116 (Intermediate!4413 false lt!237866 #b00000000000000000000000000000000))))

(declare-fun b!519510 () Bool)

(assert (=> b!519510 (and (bvsge (index!19848 lt!237917) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237917) (size!16310 lt!237863)))))

(declare-fun res!318031 () Bool)

(assert (=> b!519510 (= res!318031 (= (select (arr!15946 lt!237863) (index!19848 lt!237917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303115 () Bool)

(assert (=> b!519510 (=> res!318031 e!303115)))

(declare-fun b!519511 () Bool)

(assert (=> b!519511 (and (bvsge (index!19848 lt!237917) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237917) (size!16310 lt!237863)))))

(assert (=> b!519511 (= e!303115 (= (select (arr!15946 lt!237863) (index!19848 lt!237917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519512 () Bool)

(assert (=> b!519512 (= e!303117 (bvsge (x!48820 lt!237917) #b01111111111111111111111111111110))))

(declare-fun b!519513 () Bool)

(assert (=> b!519513 (and (bvsge (index!19848 lt!237917) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237917) (size!16310 lt!237863)))))

(declare-fun res!318033 () Bool)

(assert (=> b!519513 (= res!318033 (= (select (arr!15946 lt!237863) (index!19848 lt!237917)) lt!237862))))

(assert (=> b!519513 (=> res!318033 e!303115)))

(assert (=> b!519513 (= e!303113 e!303115)))

(declare-fun b!519514 () Bool)

(assert (=> b!519514 (= e!303114 (Intermediate!4413 true lt!237866 #b00000000000000000000000000000000))))

(declare-fun b!519515 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519515 (= e!303116 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237866 #b00000000000000000000000000000000 mask!3524) lt!237862 lt!237863 mask!3524))))

(assert (= (and d!80077 c!61035) b!519514))

(assert (= (and d!80077 (not c!61035)) b!519508))

(assert (= (and b!519508 c!61037) b!519509))

(assert (= (and b!519508 (not c!61037)) b!519515))

(assert (= (and d!80077 c!61036) b!519512))

(assert (= (and d!80077 (not c!61036)) b!519507))

(assert (= (and b!519507 res!318032) b!519513))

(assert (= (and b!519513 (not res!318033)) b!519510))

(assert (= (and b!519510 (not res!318031)) b!519511))

(declare-fun m!500703 () Bool)

(assert (=> b!519510 m!500703))

(declare-fun m!500705 () Bool)

(assert (=> b!519515 m!500705))

(assert (=> b!519515 m!500705))

(declare-fun m!500707 () Bool)

(assert (=> b!519515 m!500707))

(assert (=> b!519511 m!500703))

(declare-fun m!500709 () Bool)

(assert (=> d!80077 m!500709))

(assert (=> d!80077 m!500617))

(assert (=> b!519513 m!500703))

(assert (=> b!519421 d!80077))

(declare-fun d!80083 () Bool)

(assert (=> d!80083 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237921 () Unit!16104)

(declare-fun choose!38 (array!33171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16104)

(assert (=> d!80083 (= lt!237921 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80083 (validMask!0 mask!3524)))

(assert (=> d!80083 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237921)))

(declare-fun bs!16375 () Bool)

(assert (= bs!16375 d!80083))

(assert (=> bs!16375 m!500647))

(declare-fun m!500711 () Bool)

(assert (=> bs!16375 m!500711))

(assert (=> bs!16375 m!500617))

(assert (=> b!519421 d!80083))

(declare-fun b!519516 () Bool)

(declare-fun e!303122 () Bool)

(declare-fun e!303118 () Bool)

(assert (=> b!519516 (= e!303122 e!303118)))

(declare-fun res!318035 () Bool)

(declare-fun lt!237922 () SeekEntryResult!4413)

(assert (=> b!519516 (= res!318035 (and ((_ is Intermediate!4413) lt!237922) (not (undefined!5225 lt!237922)) (bvslt (x!48820 lt!237922) #b01111111111111111111111111111110) (bvsge (x!48820 lt!237922) #b00000000000000000000000000000000) (bvsge (x!48820 lt!237922) #b00000000000000000000000000000000)))))

(assert (=> b!519516 (=> (not res!318035) (not e!303118))))

(declare-fun b!519517 () Bool)

(declare-fun e!303119 () SeekEntryResult!4413)

(declare-fun e!303121 () SeekEntryResult!4413)

(assert (=> b!519517 (= e!303119 e!303121)))

(declare-fun c!61040 () Bool)

(declare-fun lt!237923 () (_ BitVec 64))

(assert (=> b!519517 (= c!61040 (or (= lt!237923 (select (arr!15946 a!3235) j!176)) (= (bvadd lt!237923 lt!237923) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80085 () Bool)

(assert (=> d!80085 e!303122))

(declare-fun c!61039 () Bool)

(assert (=> d!80085 (= c!61039 (and ((_ is Intermediate!4413) lt!237922) (undefined!5225 lt!237922)))))

(assert (=> d!80085 (= lt!237922 e!303119)))

(declare-fun c!61038 () Bool)

(assert (=> d!80085 (= c!61038 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80085 (= lt!237923 (select (arr!15946 a!3235) lt!237860))))

(assert (=> d!80085 (validMask!0 mask!3524)))

(assert (=> d!80085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237860 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) lt!237922)))

(declare-fun b!519518 () Bool)

(assert (=> b!519518 (= e!303121 (Intermediate!4413 false lt!237860 #b00000000000000000000000000000000))))

(declare-fun b!519519 () Bool)

(assert (=> b!519519 (and (bvsge (index!19848 lt!237922) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237922) (size!16310 a!3235)))))

(declare-fun res!318034 () Bool)

(assert (=> b!519519 (= res!318034 (= (select (arr!15946 a!3235) (index!19848 lt!237922)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303120 () Bool)

(assert (=> b!519519 (=> res!318034 e!303120)))

(declare-fun b!519520 () Bool)

(assert (=> b!519520 (and (bvsge (index!19848 lt!237922) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237922) (size!16310 a!3235)))))

(assert (=> b!519520 (= e!303120 (= (select (arr!15946 a!3235) (index!19848 lt!237922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519521 () Bool)

(assert (=> b!519521 (= e!303122 (bvsge (x!48820 lt!237922) #b01111111111111111111111111111110))))

(declare-fun b!519522 () Bool)

(assert (=> b!519522 (and (bvsge (index!19848 lt!237922) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237922) (size!16310 a!3235)))))

(declare-fun res!318036 () Bool)

(assert (=> b!519522 (= res!318036 (= (select (arr!15946 a!3235) (index!19848 lt!237922)) (select (arr!15946 a!3235) j!176)))))

(assert (=> b!519522 (=> res!318036 e!303120)))

(assert (=> b!519522 (= e!303118 e!303120)))

(declare-fun b!519523 () Bool)

(assert (=> b!519523 (= e!303119 (Intermediate!4413 true lt!237860 #b00000000000000000000000000000000))))

(declare-fun b!519524 () Bool)

(assert (=> b!519524 (= e!303121 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237860 #b00000000000000000000000000000000 mask!3524) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80085 c!61038) b!519523))

(assert (= (and d!80085 (not c!61038)) b!519517))

(assert (= (and b!519517 c!61040) b!519518))

(assert (= (and b!519517 (not c!61040)) b!519524))

(assert (= (and d!80085 c!61039) b!519521))

(assert (= (and d!80085 (not c!61039)) b!519516))

(assert (= (and b!519516 res!318035) b!519522))

(assert (= (and b!519522 (not res!318036)) b!519519))

(assert (= (and b!519519 (not res!318034)) b!519520))

(declare-fun m!500713 () Bool)

(assert (=> b!519519 m!500713))

(declare-fun m!500715 () Bool)

(assert (=> b!519524 m!500715))

(assert (=> b!519524 m!500715))

(assert (=> b!519524 m!500613))

(declare-fun m!500717 () Bool)

(assert (=> b!519524 m!500717))

(assert (=> b!519520 m!500713))

(declare-fun m!500719 () Bool)

(assert (=> d!80085 m!500719))

(assert (=> d!80085 m!500617))

(assert (=> b!519522 m!500713))

(assert (=> b!519421 d!80085))

(declare-fun b!519593 () Bool)

(declare-fun e!303163 () SeekEntryResult!4413)

(assert (=> b!519593 (= e!303163 Undefined!4413)))

(declare-fun d!80087 () Bool)

(declare-fun lt!237949 () SeekEntryResult!4413)

(assert (=> d!80087 (and (or ((_ is Undefined!4413) lt!237949) (not ((_ is Found!4413) lt!237949)) (and (bvsge (index!19847 lt!237949) #b00000000000000000000000000000000) (bvslt (index!19847 lt!237949) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237949) ((_ is Found!4413) lt!237949) (not ((_ is MissingZero!4413) lt!237949)) (and (bvsge (index!19846 lt!237949) #b00000000000000000000000000000000) (bvslt (index!19846 lt!237949) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237949) ((_ is Found!4413) lt!237949) ((_ is MissingZero!4413) lt!237949) (not ((_ is MissingVacant!4413) lt!237949)) (and (bvsge (index!19849 lt!237949) #b00000000000000000000000000000000) (bvslt (index!19849 lt!237949) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237949) (ite ((_ is Found!4413) lt!237949) (= (select (arr!15946 a!3235) (index!19847 lt!237949)) k0!2280) (ite ((_ is MissingZero!4413) lt!237949) (= (select (arr!15946 a!3235) (index!19846 lt!237949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4413) lt!237949) (= (select (arr!15946 a!3235) (index!19849 lt!237949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80087 (= lt!237949 e!303163)))

(declare-fun c!61066 () Bool)

(declare-fun lt!237951 () SeekEntryResult!4413)

(assert (=> d!80087 (= c!61066 (and ((_ is Intermediate!4413) lt!237951) (undefined!5225 lt!237951)))))

(assert (=> d!80087 (= lt!237951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80087 (validMask!0 mask!3524)))

(assert (=> d!80087 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237949)))

(declare-fun b!519594 () Bool)

(declare-fun c!61064 () Bool)

(declare-fun lt!237950 () (_ BitVec 64))

(assert (=> b!519594 (= c!61064 (= lt!237950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303165 () SeekEntryResult!4413)

(declare-fun e!303164 () SeekEntryResult!4413)

(assert (=> b!519594 (= e!303165 e!303164)))

(declare-fun b!519595 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33171 (_ BitVec 32)) SeekEntryResult!4413)

(assert (=> b!519595 (= e!303164 (seekKeyOrZeroReturnVacant!0 (x!48820 lt!237951) (index!19848 lt!237951) (index!19848 lt!237951) k0!2280 a!3235 mask!3524))))

(declare-fun b!519596 () Bool)

(assert (=> b!519596 (= e!303165 (Found!4413 (index!19848 lt!237951)))))

(declare-fun b!519597 () Bool)

(assert (=> b!519597 (= e!303163 e!303165)))

(assert (=> b!519597 (= lt!237950 (select (arr!15946 a!3235) (index!19848 lt!237951)))))

(declare-fun c!61065 () Bool)

(assert (=> b!519597 (= c!61065 (= lt!237950 k0!2280))))

(declare-fun b!519598 () Bool)

(assert (=> b!519598 (= e!303164 (MissingZero!4413 (index!19848 lt!237951)))))

(assert (= (and d!80087 c!61066) b!519593))

(assert (= (and d!80087 (not c!61066)) b!519597))

(assert (= (and b!519597 c!61065) b!519596))

(assert (= (and b!519597 (not c!61065)) b!519594))

(assert (= (and b!519594 c!61064) b!519598))

(assert (= (and b!519594 (not c!61064)) b!519595))

(declare-fun m!500733 () Bool)

(assert (=> d!80087 m!500733))

(assert (=> d!80087 m!500617))

(assert (=> d!80087 m!500733))

(declare-fun m!500735 () Bool)

(assert (=> d!80087 m!500735))

(declare-fun m!500737 () Bool)

(assert (=> d!80087 m!500737))

(declare-fun m!500739 () Bool)

(assert (=> d!80087 m!500739))

(declare-fun m!500741 () Bool)

(assert (=> d!80087 m!500741))

(declare-fun m!500743 () Bool)

(assert (=> b!519595 m!500743))

(declare-fun m!500745 () Bool)

(assert (=> b!519597 m!500745))

(assert (=> b!519426 d!80087))

(declare-fun d!80093 () Bool)

(assert (=> d!80093 (= (validKeyInArray!0 (select (arr!15946 a!3235) j!176)) (and (not (= (select (arr!15946 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15946 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519425 d!80093))

(declare-fun d!80095 () Bool)

(declare-fun res!318071 () Bool)

(declare-fun e!303183 () Bool)

(assert (=> d!80095 (=> res!318071 e!303183)))

(assert (=> d!80095 (= res!318071 (= (select (arr!15946 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80095 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303183)))

(declare-fun b!519625 () Bool)

(declare-fun e!303184 () Bool)

(assert (=> b!519625 (= e!303183 e!303184)))

(declare-fun res!318072 () Bool)

(assert (=> b!519625 (=> (not res!318072) (not e!303184))))

(assert (=> b!519625 (= res!318072 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16310 a!3235)))))

(declare-fun b!519626 () Bool)

(assert (=> b!519626 (= e!303184 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80095 (not res!318071)) b!519625))

(assert (= (and b!519625 res!318072) b!519626))

(declare-fun m!500769 () Bool)

(assert (=> d!80095 m!500769))

(declare-fun m!500771 () Bool)

(assert (=> b!519626 m!500771))

(assert (=> b!519430 d!80095))

(declare-fun b!519627 () Bool)

(declare-fun e!303185 () SeekEntryResult!4413)

(assert (=> b!519627 (= e!303185 Undefined!4413)))

(declare-fun d!80103 () Bool)

(declare-fun lt!237959 () SeekEntryResult!4413)

(assert (=> d!80103 (and (or ((_ is Undefined!4413) lt!237959) (not ((_ is Found!4413) lt!237959)) (and (bvsge (index!19847 lt!237959) #b00000000000000000000000000000000) (bvslt (index!19847 lt!237959) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237959) ((_ is Found!4413) lt!237959) (not ((_ is MissingZero!4413) lt!237959)) (and (bvsge (index!19846 lt!237959) #b00000000000000000000000000000000) (bvslt (index!19846 lt!237959) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237959) ((_ is Found!4413) lt!237959) ((_ is MissingZero!4413) lt!237959) (not ((_ is MissingVacant!4413) lt!237959)) (and (bvsge (index!19849 lt!237959) #b00000000000000000000000000000000) (bvslt (index!19849 lt!237959) (size!16310 a!3235)))) (or ((_ is Undefined!4413) lt!237959) (ite ((_ is Found!4413) lt!237959) (= (select (arr!15946 a!3235) (index!19847 lt!237959)) (select (arr!15946 a!3235) j!176)) (ite ((_ is MissingZero!4413) lt!237959) (= (select (arr!15946 a!3235) (index!19846 lt!237959)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4413) lt!237959) (= (select (arr!15946 a!3235) (index!19849 lt!237959)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80103 (= lt!237959 e!303185)))

(declare-fun c!61076 () Bool)

(declare-fun lt!237961 () SeekEntryResult!4413)

(assert (=> d!80103 (= c!61076 (and ((_ is Intermediate!4413) lt!237961) (undefined!5225 lt!237961)))))

(assert (=> d!80103 (= lt!237961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15946 a!3235) j!176) mask!3524) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80103 (validMask!0 mask!3524)))

(assert (=> d!80103 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) j!176) a!3235 mask!3524) lt!237959)))

(declare-fun b!519628 () Bool)

(declare-fun c!61074 () Bool)

(declare-fun lt!237960 () (_ BitVec 64))

(assert (=> b!519628 (= c!61074 (= lt!237960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303187 () SeekEntryResult!4413)

(declare-fun e!303186 () SeekEntryResult!4413)

(assert (=> b!519628 (= e!303187 e!303186)))

(declare-fun b!519629 () Bool)

(assert (=> b!519629 (= e!303186 (seekKeyOrZeroReturnVacant!0 (x!48820 lt!237961) (index!19848 lt!237961) (index!19848 lt!237961) (select (arr!15946 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519630 () Bool)

(assert (=> b!519630 (= e!303187 (Found!4413 (index!19848 lt!237961)))))

(declare-fun b!519631 () Bool)

(assert (=> b!519631 (= e!303185 e!303187)))

(assert (=> b!519631 (= lt!237960 (select (arr!15946 a!3235) (index!19848 lt!237961)))))

(declare-fun c!61075 () Bool)

(assert (=> b!519631 (= c!61075 (= lt!237960 (select (arr!15946 a!3235) j!176)))))

(declare-fun b!519632 () Bool)

(assert (=> b!519632 (= e!303186 (MissingZero!4413 (index!19848 lt!237961)))))

(assert (= (and d!80103 c!61076) b!519627))

(assert (= (and d!80103 (not c!61076)) b!519631))

(assert (= (and b!519631 c!61075) b!519630))

(assert (= (and b!519631 (not c!61075)) b!519628))

(assert (= (and b!519628 c!61074) b!519632))

(assert (= (and b!519628 (not c!61074)) b!519629))

(assert (=> d!80103 m!500613))

(assert (=> d!80103 m!500645))

(assert (=> d!80103 m!500617))

(assert (=> d!80103 m!500645))

(assert (=> d!80103 m!500613))

(declare-fun m!500773 () Bool)

(assert (=> d!80103 m!500773))

(declare-fun m!500775 () Bool)

(assert (=> d!80103 m!500775))

(declare-fun m!500777 () Bool)

(assert (=> d!80103 m!500777))

(declare-fun m!500779 () Bool)

(assert (=> d!80103 m!500779))

(assert (=> b!519629 m!500613))

(declare-fun m!500781 () Bool)

(assert (=> b!519629 m!500781))

(declare-fun m!500783 () Bool)

(assert (=> b!519631 m!500783))

(assert (=> b!519434 d!80103))

(declare-fun d!80105 () Bool)

(assert (=> d!80105 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519423 d!80105))

(declare-fun d!80107 () Bool)

(declare-fun e!303202 () Bool)

(assert (=> d!80107 e!303202))

(declare-fun res!318085 () Bool)

(assert (=> d!80107 (=> (not res!318085) (not e!303202))))

(assert (=> d!80107 (= res!318085 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16310 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16310 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16310 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16310 a!3235))))))

(declare-fun lt!237975 () Unit!16104)

(declare-fun choose!47 (array!33171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16104)

(assert (=> d!80107 (= lt!237975 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237860 #b00000000000000000000000000000000 (index!19848 lt!237864) (x!48820 lt!237864) mask!3524))))

(assert (=> d!80107 (validMask!0 mask!3524)))

(assert (=> d!80107 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237860 #b00000000000000000000000000000000 (index!19848 lt!237864) (x!48820 lt!237864) mask!3524) lt!237975)))

(declare-fun b!519650 () Bool)

(assert (=> b!519650 (= e!303202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237860 (select (store (arr!15946 a!3235) i!1204 k0!2280) j!176) (array!33172 (store (arr!15946 a!3235) i!1204 k0!2280) (size!16310 a!3235)) mask!3524) (Intermediate!4413 false (index!19848 lt!237864) (x!48820 lt!237864))))))

(assert (= (and d!80107 res!318085) b!519650))

(declare-fun m!500795 () Bool)

(assert (=> d!80107 m!500795))

(assert (=> d!80107 m!500617))

(assert (=> b!519650 m!500637))

(assert (=> b!519650 m!500641))

(assert (=> b!519650 m!500641))

(declare-fun m!500797 () Bool)

(assert (=> b!519650 m!500797))

(assert (=> b!519428 d!80107))

(declare-fun b!519651 () Bool)

(declare-fun e!303207 () Bool)

(declare-fun e!303203 () Bool)

(assert (=> b!519651 (= e!303207 e!303203)))

(declare-fun res!318087 () Bool)

(declare-fun lt!237976 () SeekEntryResult!4413)

(assert (=> b!519651 (= res!318087 (and ((_ is Intermediate!4413) lt!237976) (not (undefined!5225 lt!237976)) (bvslt (x!48820 lt!237976) #b01111111111111111111111111111110) (bvsge (x!48820 lt!237976) #b00000000000000000000000000000000) (bvsge (x!48820 lt!237976) #b00000000000000000000000000000000)))))

(assert (=> b!519651 (=> (not res!318087) (not e!303203))))

(declare-fun b!519652 () Bool)

(declare-fun e!303204 () SeekEntryResult!4413)

(declare-fun e!303206 () SeekEntryResult!4413)

(assert (=> b!519652 (= e!303204 e!303206)))

(declare-fun c!61082 () Bool)

(declare-fun lt!237977 () (_ BitVec 64))

(assert (=> b!519652 (= c!61082 (or (= lt!237977 lt!237862) (= (bvadd lt!237977 lt!237977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80117 () Bool)

(assert (=> d!80117 e!303207))

(declare-fun c!61081 () Bool)

(assert (=> d!80117 (= c!61081 (and ((_ is Intermediate!4413) lt!237976) (undefined!5225 lt!237976)))))

(assert (=> d!80117 (= lt!237976 e!303204)))

(declare-fun c!61080 () Bool)

(assert (=> d!80117 (= c!61080 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80117 (= lt!237977 (select (arr!15946 lt!237863) lt!237860))))

(assert (=> d!80117 (validMask!0 mask!3524)))

(assert (=> d!80117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237860 lt!237862 lt!237863 mask!3524) lt!237976)))

(declare-fun b!519653 () Bool)

(assert (=> b!519653 (= e!303206 (Intermediate!4413 false lt!237860 #b00000000000000000000000000000000))))

(declare-fun b!519654 () Bool)

(assert (=> b!519654 (and (bvsge (index!19848 lt!237976) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237976) (size!16310 lt!237863)))))

(declare-fun res!318086 () Bool)

(assert (=> b!519654 (= res!318086 (= (select (arr!15946 lt!237863) (index!19848 lt!237976)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303205 () Bool)

(assert (=> b!519654 (=> res!318086 e!303205)))

(declare-fun b!519655 () Bool)

(assert (=> b!519655 (and (bvsge (index!19848 lt!237976) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237976) (size!16310 lt!237863)))))

(assert (=> b!519655 (= e!303205 (= (select (arr!15946 lt!237863) (index!19848 lt!237976)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519656 () Bool)

(assert (=> b!519656 (= e!303207 (bvsge (x!48820 lt!237976) #b01111111111111111111111111111110))))

(declare-fun b!519657 () Bool)

(assert (=> b!519657 (and (bvsge (index!19848 lt!237976) #b00000000000000000000000000000000) (bvslt (index!19848 lt!237976) (size!16310 lt!237863)))))

(declare-fun res!318088 () Bool)

(assert (=> b!519657 (= res!318088 (= (select (arr!15946 lt!237863) (index!19848 lt!237976)) lt!237862))))

(assert (=> b!519657 (=> res!318088 e!303205)))

(assert (=> b!519657 (= e!303203 e!303205)))

(declare-fun b!519658 () Bool)

(assert (=> b!519658 (= e!303204 (Intermediate!4413 true lt!237860 #b00000000000000000000000000000000))))

(declare-fun b!519659 () Bool)

(assert (=> b!519659 (= e!303206 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237860 #b00000000000000000000000000000000 mask!3524) lt!237862 lt!237863 mask!3524))))

(assert (= (and d!80117 c!61080) b!519658))

(assert (= (and d!80117 (not c!61080)) b!519652))

(assert (= (and b!519652 c!61082) b!519653))

(assert (= (and b!519652 (not c!61082)) b!519659))

(assert (= (and d!80117 c!61081) b!519656))

(assert (= (and d!80117 (not c!61081)) b!519651))

(assert (= (and b!519651 res!318087) b!519657))

(assert (= (and b!519657 (not res!318088)) b!519654))

(assert (= (and b!519654 (not res!318086)) b!519655))

(declare-fun m!500799 () Bool)

(assert (=> b!519654 m!500799))

(assert (=> b!519659 m!500715))

(assert (=> b!519659 m!500715))

(declare-fun m!500801 () Bool)

(assert (=> b!519659 m!500801))

(assert (=> b!519655 m!500799))

(declare-fun m!500803 () Bool)

(assert (=> d!80117 m!500803))

(assert (=> d!80117 m!500617))

(assert (=> b!519657 m!500799))

(assert (=> b!519428 d!80117))

(declare-fun b!519671 () Bool)

(declare-fun e!303218 () Bool)

(declare-fun call!31757 () Bool)

(assert (=> b!519671 (= e!303218 call!31757)))

(declare-fun bm!31754 () Bool)

(declare-fun c!61085 () Bool)

(assert (=> bm!31754 (= call!31757 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61085 (Cons!10100 (select (arr!15946 a!3235) #b00000000000000000000000000000000) Nil!10101) Nil!10101)))))

(declare-fun b!519672 () Bool)

(declare-fun e!303217 () Bool)

(assert (=> b!519672 (= e!303217 e!303218)))

(assert (=> b!519672 (= c!61085 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519670 () Bool)

(declare-fun e!303219 () Bool)

(declare-fun contains!2756 (List!10104 (_ BitVec 64)) Bool)

(assert (=> b!519670 (= e!303219 (contains!2756 Nil!10101 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80119 () Bool)

(declare-fun res!318095 () Bool)

(declare-fun e!303216 () Bool)

(assert (=> d!80119 (=> res!318095 e!303216)))

(assert (=> d!80119 (= res!318095 (bvsge #b00000000000000000000000000000000 (size!16310 a!3235)))))

(assert (=> d!80119 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10101) e!303216)))

(declare-fun b!519673 () Bool)

(assert (=> b!519673 (= e!303216 e!303217)))

(declare-fun res!318096 () Bool)

(assert (=> b!519673 (=> (not res!318096) (not e!303217))))

(assert (=> b!519673 (= res!318096 (not e!303219))))

(declare-fun res!318097 () Bool)

(assert (=> b!519673 (=> (not res!318097) (not e!303219))))

(assert (=> b!519673 (= res!318097 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519674 () Bool)

(assert (=> b!519674 (= e!303218 call!31757)))

(assert (= (and d!80119 (not res!318095)) b!519673))

(assert (= (and b!519673 res!318097) b!519670))

(assert (= (and b!519673 res!318096) b!519672))

(assert (= (and b!519672 c!61085) b!519674))

(assert (= (and b!519672 (not c!61085)) b!519671))

(assert (= (or b!519674 b!519671) bm!31754))

(assert (=> bm!31754 m!500769))

(declare-fun m!500805 () Bool)

(assert (=> bm!31754 m!500805))

(assert (=> b!519672 m!500769))

(assert (=> b!519672 m!500769))

(declare-fun m!500807 () Bool)

(assert (=> b!519672 m!500807))

(assert (=> b!519670 m!500769))

(assert (=> b!519670 m!500769))

(declare-fun m!500809 () Bool)

(assert (=> b!519670 m!500809))

(assert (=> b!519673 m!500769))

(assert (=> b!519673 m!500769))

(assert (=> b!519673 m!500807))

(assert (=> b!519433 d!80119))

(declare-fun d!80121 () Bool)

(assert (=> d!80121 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47156 d!80121))

(declare-fun d!80131 () Bool)

(assert (=> d!80131 (= (array_inv!11742 a!3235) (bvsge (size!16310 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47156 d!80131))

(declare-fun d!80133 () Bool)

(declare-fun res!318099 () Bool)

(declare-fun e!303230 () Bool)

(assert (=> d!80133 (=> res!318099 e!303230)))

(assert (=> d!80133 (= res!318099 (bvsge #b00000000000000000000000000000000 (size!16310 a!3235)))))

(assert (=> d!80133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303230)))

(declare-fun b!519693 () Bool)

(declare-fun e!303231 () Bool)

(declare-fun call!31758 () Bool)

(assert (=> b!519693 (= e!303231 call!31758)))

(declare-fun b!519694 () Bool)

(declare-fun e!303229 () Bool)

(assert (=> b!519694 (= e!303230 e!303229)))

(declare-fun c!61095 () Bool)

(assert (=> b!519694 (= c!61095 (validKeyInArray!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31755 () Bool)

(assert (=> bm!31755 (= call!31758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519695 () Bool)

(assert (=> b!519695 (= e!303229 e!303231)))

(declare-fun lt!237988 () (_ BitVec 64))

(assert (=> b!519695 (= lt!237988 (select (arr!15946 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237987 () Unit!16104)

(assert (=> b!519695 (= lt!237987 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237988 #b00000000000000000000000000000000))))

(assert (=> b!519695 (arrayContainsKey!0 a!3235 lt!237988 #b00000000000000000000000000000000)))

(declare-fun lt!237989 () Unit!16104)

(assert (=> b!519695 (= lt!237989 lt!237987)))

(declare-fun res!318098 () Bool)

(assert (=> b!519695 (= res!318098 (= (seekEntryOrOpen!0 (select (arr!15946 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4413 #b00000000000000000000000000000000)))))

(assert (=> b!519695 (=> (not res!318098) (not e!303231))))

(declare-fun b!519696 () Bool)

(assert (=> b!519696 (= e!303229 call!31758)))

(assert (= (and d!80133 (not res!318099)) b!519694))

(assert (= (and b!519694 c!61095) b!519695))

(assert (= (and b!519694 (not c!61095)) b!519696))

(assert (= (and b!519695 res!318098) b!519693))

(assert (= (or b!519693 b!519696) bm!31755))

(assert (=> b!519694 m!500769))

(assert (=> b!519694 m!500769))

(assert (=> b!519694 m!500807))

(declare-fun m!500825 () Bool)

(assert (=> bm!31755 m!500825))

(assert (=> b!519695 m!500769))

(declare-fun m!500827 () Bool)

(assert (=> b!519695 m!500827))

(declare-fun m!500829 () Bool)

(assert (=> b!519695 m!500829))

(assert (=> b!519695 m!500769))

(declare-fun m!500831 () Bool)

(assert (=> b!519695 m!500831))

(assert (=> b!519432 d!80133))

(check-sat (not b!519486) (not d!80083) (not b!519629) (not d!80085) (not d!80107) (not b!519650) (not d!80087) (not b!519670) (not b!519659) (not bm!31745) (not b!519595) (not bm!31754) (not b!519524) (not d!80103) (not b!519515) (not b!519626) (not bm!31755) (not d!80077) (not d!80117) (not b!519672) (not b!519673) (not b!519694) (not b!519695) (not b!519487))
(check-sat)
