; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44540 () Bool)

(assert start!44540)

(declare-fun b!488919 () Bool)

(declare-fun res!291974 () Bool)

(declare-fun e!287582 () Bool)

(assert (=> b!488919 (=> (not res!291974) (not e!287582))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488919 (= res!291974 (validKeyInArray!0 k0!2280))))

(declare-fun b!488920 () Bool)

(declare-fun e!287580 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!220575 () (_ BitVec 32))

(assert (=> b!488920 (= e!287580 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220575 #b00000000000000000000000000000000) (bvslt lt!220575 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31650 0))(
  ( (array!31651 (arr!15214 (Array (_ BitVec 32) (_ BitVec 64))) (size!15578 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31650)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488920 (= lt!220575 (toIndex!0 (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287583 () Bool)

(assert (=> b!488920 e!287583))

(declare-fun res!291973 () Bool)

(assert (=> b!488920 (=> (not res!291973) (not e!287583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31650 (_ BitVec 32)) Bool)

(assert (=> b!488920 (= res!291973 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14308 0))(
  ( (Unit!14309) )
))
(declare-fun lt!220576 () Unit!14308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14308)

(assert (=> b!488920 (= lt!220576 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291967 () Bool)

(assert (=> start!44540 (=> (not res!291967) (not e!287582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44540 (= res!291967 (validMask!0 mask!3524))))

(assert (=> start!44540 e!287582))

(assert (=> start!44540 true))

(declare-fun array_inv!11010 (array!31650) Bool)

(assert (=> start!44540 (array_inv!11010 a!3235)))

(declare-fun b!488921 () Bool)

(declare-fun res!291972 () Bool)

(assert (=> b!488921 (=> (not res!291972) (not e!287580))))

(declare-datatypes ((List!9372 0))(
  ( (Nil!9369) (Cons!9368 (h!10227 (_ BitVec 64)) (t!15600 List!9372)) )
))
(declare-fun arrayNoDuplicates!0 (array!31650 (_ BitVec 32) List!9372) Bool)

(assert (=> b!488921 (= res!291972 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9369))))

(declare-fun b!488922 () Bool)

(declare-fun res!291966 () Bool)

(assert (=> b!488922 (=> (not res!291966) (not e!287580))))

(assert (=> b!488922 (= res!291966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488923 () Bool)

(assert (=> b!488923 (= e!287582 e!287580)))

(declare-fun res!291968 () Bool)

(assert (=> b!488923 (=> (not res!291968) (not e!287580))))

(declare-datatypes ((SeekEntryResult!3681 0))(
  ( (MissingZero!3681 (index!16903 (_ BitVec 32))) (Found!3681 (index!16904 (_ BitVec 32))) (Intermediate!3681 (undefined!4493 Bool) (index!16905 (_ BitVec 32)) (x!46016 (_ BitVec 32))) (Undefined!3681) (MissingVacant!3681 (index!16906 (_ BitVec 32))) )
))
(declare-fun lt!220574 () SeekEntryResult!3681)

(assert (=> b!488923 (= res!291968 (or (= lt!220574 (MissingZero!3681 i!1204)) (= lt!220574 (MissingVacant!3681 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31650 (_ BitVec 32)) SeekEntryResult!3681)

(assert (=> b!488923 (= lt!220574 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488924 () Bool)

(declare-fun res!291971 () Bool)

(assert (=> b!488924 (=> (not res!291971) (not e!287582))))

(assert (=> b!488924 (= res!291971 (validKeyInArray!0 (select (arr!15214 a!3235) j!176)))))

(declare-fun b!488925 () Bool)

(declare-fun res!291970 () Bool)

(assert (=> b!488925 (=> (not res!291970) (not e!287582))))

(assert (=> b!488925 (= res!291970 (and (= (size!15578 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15578 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15578 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488926 () Bool)

(assert (=> b!488926 (= e!287583 (= (seekEntryOrOpen!0 (select (arr!15214 a!3235) j!176) a!3235 mask!3524) (Found!3681 j!176)))))

(declare-fun b!488927 () Bool)

(declare-fun res!291969 () Bool)

(assert (=> b!488927 (=> (not res!291969) (not e!287582))))

(declare-fun arrayContainsKey!0 (array!31650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488927 (= res!291969 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44540 res!291967) b!488925))

(assert (= (and b!488925 res!291970) b!488924))

(assert (= (and b!488924 res!291971) b!488919))

(assert (= (and b!488919 res!291974) b!488927))

(assert (= (and b!488927 res!291969) b!488923))

(assert (= (and b!488923 res!291968) b!488922))

(assert (= (and b!488922 res!291966) b!488921))

(assert (= (and b!488921 res!291972) b!488920))

(assert (= (and b!488920 res!291973) b!488926))

(declare-fun m!468657 () Bool)

(assert (=> b!488921 m!468657))

(declare-fun m!468659 () Bool)

(assert (=> b!488926 m!468659))

(assert (=> b!488926 m!468659))

(declare-fun m!468661 () Bool)

(assert (=> b!488926 m!468661))

(declare-fun m!468663 () Bool)

(assert (=> start!44540 m!468663))

(declare-fun m!468665 () Bool)

(assert (=> start!44540 m!468665))

(declare-fun m!468667 () Bool)

(assert (=> b!488919 m!468667))

(declare-fun m!468669 () Bool)

(assert (=> b!488920 m!468669))

(declare-fun m!468671 () Bool)

(assert (=> b!488920 m!468671))

(declare-fun m!468673 () Bool)

(assert (=> b!488920 m!468673))

(declare-fun m!468675 () Bool)

(assert (=> b!488920 m!468675))

(assert (=> b!488920 m!468673))

(declare-fun m!468677 () Bool)

(assert (=> b!488920 m!468677))

(assert (=> b!488924 m!468659))

(assert (=> b!488924 m!468659))

(declare-fun m!468679 () Bool)

(assert (=> b!488924 m!468679))

(declare-fun m!468681 () Bool)

(assert (=> b!488923 m!468681))

(declare-fun m!468683 () Bool)

(assert (=> b!488922 m!468683))

(declare-fun m!468685 () Bool)

(assert (=> b!488927 m!468685))

(check-sat (not b!488926) (not b!488922) (not b!488919) (not b!488927) (not b!488924) (not b!488921) (not b!488920) (not b!488923) (not start!44540))
(check-sat)
(get-model)

(declare-fun d!77861 () Bool)

(declare-fun lt!220591 () (_ BitVec 32))

(declare-fun lt!220590 () (_ BitVec 32))

(assert (=> d!77861 (= lt!220591 (bvmul (bvxor lt!220590 (bvlshr lt!220590 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77861 (= lt!220590 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77861 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!292002 (let ((h!10229 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46018 (bvmul (bvxor h!10229 (bvlshr h!10229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46018 (bvlshr x!46018 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!292002 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!292002 #b00000000000000000000000000000000))))))

(assert (=> d!77861 (= (toIndex!0 (select (store (arr!15214 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!220591 (bvlshr lt!220591 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!488920 d!77861))

(declare-fun b!488990 () Bool)

(declare-fun e!287625 () Bool)

(declare-fun call!31355 () Bool)

(assert (=> b!488990 (= e!287625 call!31355)))

(declare-fun b!488991 () Bool)

(declare-fun e!287623 () Bool)

(assert (=> b!488991 (= e!287625 e!287623)))

(declare-fun lt!220609 () (_ BitVec 64))

(assert (=> b!488991 (= lt!220609 (select (arr!15214 a!3235) j!176))))

(declare-fun lt!220607 () Unit!14308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31650 (_ BitVec 64) (_ BitVec 32)) Unit!14308)

(assert (=> b!488991 (= lt!220607 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220609 j!176))))

(assert (=> b!488991 (arrayContainsKey!0 a!3235 lt!220609 #b00000000000000000000000000000000)))

(declare-fun lt!220608 () Unit!14308)

(assert (=> b!488991 (= lt!220608 lt!220607)))

(declare-fun res!292023 () Bool)

(assert (=> b!488991 (= res!292023 (= (seekEntryOrOpen!0 (select (arr!15214 a!3235) j!176) a!3235 mask!3524) (Found!3681 j!176)))))

(assert (=> b!488991 (=> (not res!292023) (not e!287623))))

(declare-fun bm!31352 () Bool)

(assert (=> bm!31352 (= call!31355 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77867 () Bool)

(declare-fun res!292022 () Bool)

(declare-fun e!287624 () Bool)

(assert (=> d!77867 (=> res!292022 e!287624)))

(assert (=> d!77867 (= res!292022 (bvsge j!176 (size!15578 a!3235)))))

(assert (=> d!77867 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287624)))

(declare-fun b!488992 () Bool)

(assert (=> b!488992 (= e!287624 e!287625)))

(declare-fun c!58754 () Bool)

(assert (=> b!488992 (= c!58754 (validKeyInArray!0 (select (arr!15214 a!3235) j!176)))))

(declare-fun b!488993 () Bool)

(assert (=> b!488993 (= e!287623 call!31355)))

(assert (= (and d!77867 (not res!292022)) b!488992))

(assert (= (and b!488992 c!58754) b!488991))

(assert (= (and b!488992 (not c!58754)) b!488990))

(assert (= (and b!488991 res!292023) b!488993))

(assert (= (or b!488993 b!488990) bm!31352))

(assert (=> b!488991 m!468659))

(declare-fun m!468733 () Bool)

(assert (=> b!488991 m!468733))

(declare-fun m!468735 () Bool)

(assert (=> b!488991 m!468735))

(assert (=> b!488991 m!468659))

(assert (=> b!488991 m!468661))

(declare-fun m!468737 () Bool)

(assert (=> bm!31352 m!468737))

(assert (=> b!488992 m!468659))

(assert (=> b!488992 m!468659))

(assert (=> b!488992 m!468679))

(assert (=> b!488920 d!77867))

(declare-fun d!77873 () Bool)

(assert (=> d!77873 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220618 () Unit!14308)

(declare-fun choose!38 (array!31650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14308)

(assert (=> d!77873 (= lt!220618 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77873 (validMask!0 mask!3524)))

(assert (=> d!77873 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220618)))

(declare-fun bs!15583 () Bool)

(assert (= bs!15583 d!77873))

(assert (=> bs!15583 m!468675))

(declare-fun m!468739 () Bool)

(assert (=> bs!15583 m!468739))

(assert (=> bs!15583 m!468663))

(assert (=> b!488920 d!77873))

(declare-fun d!77875 () Bool)

(assert (=> d!77875 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44540 d!77875))

(declare-fun d!77881 () Bool)

(assert (=> d!77881 (= (array_inv!11010 a!3235) (bvsge (size!15578 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44540 d!77881))

(declare-fun d!77883 () Bool)

(declare-fun res!292038 () Bool)

(declare-fun e!287660 () Bool)

(assert (=> d!77883 (=> res!292038 e!287660)))

(assert (=> d!77883 (= res!292038 (= (select (arr!15214 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77883 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287660)))

(declare-fun b!489049 () Bool)

(declare-fun e!287661 () Bool)

(assert (=> b!489049 (= e!287660 e!287661)))

(declare-fun res!292039 () Bool)

(assert (=> b!489049 (=> (not res!292039) (not e!287661))))

(assert (=> b!489049 (= res!292039 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15578 a!3235)))))

(declare-fun b!489050 () Bool)

(assert (=> b!489050 (= e!287661 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77883 (not res!292038)) b!489049))

(assert (= (and b!489049 res!292039) b!489050))

(declare-fun m!468777 () Bool)

(assert (=> d!77883 m!468777))

(declare-fun m!468779 () Bool)

(assert (=> b!489050 m!468779))

(assert (=> b!488927 d!77883))

(declare-fun b!489103 () Bool)

(declare-fun e!287700 () SeekEntryResult!3681)

(declare-fun e!287699 () SeekEntryResult!3681)

(assert (=> b!489103 (= e!287700 e!287699)))

(declare-fun lt!220675 () (_ BitVec 64))

(declare-fun lt!220674 () SeekEntryResult!3681)

(assert (=> b!489103 (= lt!220675 (select (arr!15214 a!3235) (index!16905 lt!220674)))))

(declare-fun c!58794 () Bool)

(assert (=> b!489103 (= c!58794 (= lt!220675 (select (arr!15214 a!3235) j!176)))))

(declare-fun b!489104 () Bool)

(declare-fun e!287698 () SeekEntryResult!3681)

(assert (=> b!489104 (= e!287698 (MissingZero!3681 (index!16905 lt!220674)))))

(declare-fun b!489105 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31650 (_ BitVec 32)) SeekEntryResult!3681)

(assert (=> b!489105 (= e!287698 (seekKeyOrZeroReturnVacant!0 (x!46016 lt!220674) (index!16905 lt!220674) (index!16905 lt!220674) (select (arr!15214 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!489106 () Bool)

(assert (=> b!489106 (= e!287700 Undefined!3681)))

(declare-fun b!489108 () Bool)

(declare-fun c!58793 () Bool)

(assert (=> b!489108 (= c!58793 (= lt!220675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!489108 (= e!287699 e!287698)))

(declare-fun b!489107 () Bool)

(assert (=> b!489107 (= e!287699 (Found!3681 (index!16905 lt!220674)))))

(declare-fun d!77889 () Bool)

(declare-fun lt!220673 () SeekEntryResult!3681)

(get-info :version)

(assert (=> d!77889 (and (or ((_ is Undefined!3681) lt!220673) (not ((_ is Found!3681) lt!220673)) (and (bvsge (index!16904 lt!220673) #b00000000000000000000000000000000) (bvslt (index!16904 lt!220673) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220673) ((_ is Found!3681) lt!220673) (not ((_ is MissingZero!3681) lt!220673)) (and (bvsge (index!16903 lt!220673) #b00000000000000000000000000000000) (bvslt (index!16903 lt!220673) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220673) ((_ is Found!3681) lt!220673) ((_ is MissingZero!3681) lt!220673) (not ((_ is MissingVacant!3681) lt!220673)) (and (bvsge (index!16906 lt!220673) #b00000000000000000000000000000000) (bvslt (index!16906 lt!220673) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220673) (ite ((_ is Found!3681) lt!220673) (= (select (arr!15214 a!3235) (index!16904 lt!220673)) (select (arr!15214 a!3235) j!176)) (ite ((_ is MissingZero!3681) lt!220673) (= (select (arr!15214 a!3235) (index!16903 lt!220673)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3681) lt!220673) (= (select (arr!15214 a!3235) (index!16906 lt!220673)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77889 (= lt!220673 e!287700)))

(declare-fun c!58792 () Bool)

(assert (=> d!77889 (= c!58792 (and ((_ is Intermediate!3681) lt!220674) (undefined!4493 lt!220674)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31650 (_ BitVec 32)) SeekEntryResult!3681)

(assert (=> d!77889 (= lt!220674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15214 a!3235) j!176) mask!3524) (select (arr!15214 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77889 (validMask!0 mask!3524)))

(assert (=> d!77889 (= (seekEntryOrOpen!0 (select (arr!15214 a!3235) j!176) a!3235 mask!3524) lt!220673)))

(assert (= (and d!77889 c!58792) b!489106))

(assert (= (and d!77889 (not c!58792)) b!489103))

(assert (= (and b!489103 c!58794) b!489107))

(assert (= (and b!489103 (not c!58794)) b!489108))

(assert (= (and b!489108 c!58793) b!489104))

(assert (= (and b!489108 (not c!58793)) b!489105))

(declare-fun m!468829 () Bool)

(assert (=> b!489103 m!468829))

(assert (=> b!489105 m!468659))

(declare-fun m!468831 () Bool)

(assert (=> b!489105 m!468831))

(declare-fun m!468833 () Bool)

(assert (=> d!77889 m!468833))

(assert (=> d!77889 m!468659))

(declare-fun m!468835 () Bool)

(assert (=> d!77889 m!468835))

(declare-fun m!468837 () Bool)

(assert (=> d!77889 m!468837))

(declare-fun m!468839 () Bool)

(assert (=> d!77889 m!468839))

(assert (=> d!77889 m!468663))

(assert (=> d!77889 m!468659))

(assert (=> d!77889 m!468833))

(declare-fun m!468841 () Bool)

(assert (=> d!77889 m!468841))

(assert (=> b!488926 d!77889))

(declare-fun b!489123 () Bool)

(declare-fun e!287713 () Bool)

(declare-fun contains!2708 (List!9372 (_ BitVec 64)) Bool)

(assert (=> b!489123 (= e!287713 (contains!2708 Nil!9369 (select (arr!15214 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!489124 () Bool)

(declare-fun e!287715 () Bool)

(declare-fun call!31366 () Bool)

(assert (=> b!489124 (= e!287715 call!31366)))

(declare-fun b!489125 () Bool)

(assert (=> b!489125 (= e!287715 call!31366)))

(declare-fun d!77919 () Bool)

(declare-fun res!292071 () Bool)

(declare-fun e!287712 () Bool)

(assert (=> d!77919 (=> res!292071 e!287712)))

(assert (=> d!77919 (= res!292071 (bvsge #b00000000000000000000000000000000 (size!15578 a!3235)))))

(assert (=> d!77919 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9369) e!287712)))

(declare-fun b!489126 () Bool)

(declare-fun e!287714 () Bool)

(assert (=> b!489126 (= e!287712 e!287714)))

(declare-fun res!292070 () Bool)

(assert (=> b!489126 (=> (not res!292070) (not e!287714))))

(assert (=> b!489126 (= res!292070 (not e!287713))))

(declare-fun res!292069 () Bool)

(assert (=> b!489126 (=> (not res!292069) (not e!287713))))

(assert (=> b!489126 (= res!292069 (validKeyInArray!0 (select (arr!15214 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!489127 () Bool)

(assert (=> b!489127 (= e!287714 e!287715)))

(declare-fun c!58798 () Bool)

(assert (=> b!489127 (= c!58798 (validKeyInArray!0 (select (arr!15214 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31363 () Bool)

(assert (=> bm!31363 (= call!31366 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58798 (Cons!9368 (select (arr!15214 a!3235) #b00000000000000000000000000000000) Nil!9369) Nil!9369)))))

(assert (= (and d!77919 (not res!292071)) b!489126))

(assert (= (and b!489126 res!292069) b!489123))

(assert (= (and b!489126 res!292070) b!489127))

(assert (= (and b!489127 c!58798) b!489125))

(assert (= (and b!489127 (not c!58798)) b!489124))

(assert (= (or b!489125 b!489124) bm!31363))

(assert (=> b!489123 m!468777))

(assert (=> b!489123 m!468777))

(declare-fun m!468851 () Bool)

(assert (=> b!489123 m!468851))

(assert (=> b!489126 m!468777))

(assert (=> b!489126 m!468777))

(declare-fun m!468853 () Bool)

(assert (=> b!489126 m!468853))

(assert (=> b!489127 m!468777))

(assert (=> b!489127 m!468777))

(assert (=> b!489127 m!468853))

(assert (=> bm!31363 m!468777))

(declare-fun m!468855 () Bool)

(assert (=> bm!31363 m!468855))

(assert (=> b!488921 d!77919))

(declare-fun b!489128 () Bool)

(declare-fun e!287718 () SeekEntryResult!3681)

(declare-fun e!287717 () SeekEntryResult!3681)

(assert (=> b!489128 (= e!287718 e!287717)))

(declare-fun lt!220681 () (_ BitVec 64))

(declare-fun lt!220680 () SeekEntryResult!3681)

(assert (=> b!489128 (= lt!220681 (select (arr!15214 a!3235) (index!16905 lt!220680)))))

(declare-fun c!58801 () Bool)

(assert (=> b!489128 (= c!58801 (= lt!220681 k0!2280))))

(declare-fun b!489129 () Bool)

(declare-fun e!287716 () SeekEntryResult!3681)

(assert (=> b!489129 (= e!287716 (MissingZero!3681 (index!16905 lt!220680)))))

(declare-fun b!489130 () Bool)

(assert (=> b!489130 (= e!287716 (seekKeyOrZeroReturnVacant!0 (x!46016 lt!220680) (index!16905 lt!220680) (index!16905 lt!220680) k0!2280 a!3235 mask!3524))))

(declare-fun b!489131 () Bool)

(assert (=> b!489131 (= e!287718 Undefined!3681)))

(declare-fun b!489133 () Bool)

(declare-fun c!58800 () Bool)

(assert (=> b!489133 (= c!58800 (= lt!220681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!489133 (= e!287717 e!287716)))

(declare-fun b!489132 () Bool)

(assert (=> b!489132 (= e!287717 (Found!3681 (index!16905 lt!220680)))))

(declare-fun d!77925 () Bool)

(declare-fun lt!220679 () SeekEntryResult!3681)

(assert (=> d!77925 (and (or ((_ is Undefined!3681) lt!220679) (not ((_ is Found!3681) lt!220679)) (and (bvsge (index!16904 lt!220679) #b00000000000000000000000000000000) (bvslt (index!16904 lt!220679) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220679) ((_ is Found!3681) lt!220679) (not ((_ is MissingZero!3681) lt!220679)) (and (bvsge (index!16903 lt!220679) #b00000000000000000000000000000000) (bvslt (index!16903 lt!220679) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220679) ((_ is Found!3681) lt!220679) ((_ is MissingZero!3681) lt!220679) (not ((_ is MissingVacant!3681) lt!220679)) (and (bvsge (index!16906 lt!220679) #b00000000000000000000000000000000) (bvslt (index!16906 lt!220679) (size!15578 a!3235)))) (or ((_ is Undefined!3681) lt!220679) (ite ((_ is Found!3681) lt!220679) (= (select (arr!15214 a!3235) (index!16904 lt!220679)) k0!2280) (ite ((_ is MissingZero!3681) lt!220679) (= (select (arr!15214 a!3235) (index!16903 lt!220679)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3681) lt!220679) (= (select (arr!15214 a!3235) (index!16906 lt!220679)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77925 (= lt!220679 e!287718)))

(declare-fun c!58799 () Bool)

(assert (=> d!77925 (= c!58799 (and ((_ is Intermediate!3681) lt!220680) (undefined!4493 lt!220680)))))

(assert (=> d!77925 (= lt!220680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77925 (validMask!0 mask!3524)))

(assert (=> d!77925 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220679)))

(assert (= (and d!77925 c!58799) b!489131))

(assert (= (and d!77925 (not c!58799)) b!489128))

(assert (= (and b!489128 c!58801) b!489132))

(assert (= (and b!489128 (not c!58801)) b!489133))

(assert (= (and b!489133 c!58800) b!489129))

(assert (= (and b!489133 (not c!58800)) b!489130))

(declare-fun m!468857 () Bool)

(assert (=> b!489128 m!468857))

(declare-fun m!468859 () Bool)

(assert (=> b!489130 m!468859))

(declare-fun m!468861 () Bool)

(assert (=> d!77925 m!468861))

(declare-fun m!468863 () Bool)

(assert (=> d!77925 m!468863))

(declare-fun m!468865 () Bool)

(assert (=> d!77925 m!468865))

(declare-fun m!468867 () Bool)

(assert (=> d!77925 m!468867))

(assert (=> d!77925 m!468663))

(assert (=> d!77925 m!468861))

(declare-fun m!468869 () Bool)

(assert (=> d!77925 m!468869))

(assert (=> b!488923 d!77925))

(declare-fun b!489134 () Bool)

(declare-fun e!287721 () Bool)

(declare-fun call!31367 () Bool)

(assert (=> b!489134 (= e!287721 call!31367)))

(declare-fun b!489135 () Bool)

(declare-fun e!287719 () Bool)

(assert (=> b!489135 (= e!287721 e!287719)))

(declare-fun lt!220684 () (_ BitVec 64))

(assert (=> b!489135 (= lt!220684 (select (arr!15214 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220682 () Unit!14308)

(assert (=> b!489135 (= lt!220682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220684 #b00000000000000000000000000000000))))

(assert (=> b!489135 (arrayContainsKey!0 a!3235 lt!220684 #b00000000000000000000000000000000)))

(declare-fun lt!220683 () Unit!14308)

(assert (=> b!489135 (= lt!220683 lt!220682)))

(declare-fun res!292073 () Bool)

(assert (=> b!489135 (= res!292073 (= (seekEntryOrOpen!0 (select (arr!15214 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3681 #b00000000000000000000000000000000)))))

(assert (=> b!489135 (=> (not res!292073) (not e!287719))))

(declare-fun bm!31364 () Bool)

(assert (=> bm!31364 (= call!31367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!77927 () Bool)

(declare-fun res!292072 () Bool)

(declare-fun e!287720 () Bool)

(assert (=> d!77927 (=> res!292072 e!287720)))

(assert (=> d!77927 (= res!292072 (bvsge #b00000000000000000000000000000000 (size!15578 a!3235)))))

(assert (=> d!77927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287720)))

(declare-fun b!489136 () Bool)

(assert (=> b!489136 (= e!287720 e!287721)))

(declare-fun c!58802 () Bool)

(assert (=> b!489136 (= c!58802 (validKeyInArray!0 (select (arr!15214 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!489137 () Bool)

(assert (=> b!489137 (= e!287719 call!31367)))

(assert (= (and d!77927 (not res!292072)) b!489136))

(assert (= (and b!489136 c!58802) b!489135))

(assert (= (and b!489136 (not c!58802)) b!489134))

(assert (= (and b!489135 res!292073) b!489137))

(assert (= (or b!489137 b!489134) bm!31364))

(assert (=> b!489135 m!468777))

(declare-fun m!468871 () Bool)

(assert (=> b!489135 m!468871))

(declare-fun m!468873 () Bool)

(assert (=> b!489135 m!468873))

(assert (=> b!489135 m!468777))

(declare-fun m!468875 () Bool)

(assert (=> b!489135 m!468875))

(declare-fun m!468877 () Bool)

(assert (=> bm!31364 m!468877))

(assert (=> b!489136 m!468777))

(assert (=> b!489136 m!468777))

(assert (=> b!489136 m!468853))

(assert (=> b!488922 d!77927))

(declare-fun d!77929 () Bool)

(assert (=> d!77929 (= (validKeyInArray!0 (select (arr!15214 a!3235) j!176)) (and (not (= (select (arr!15214 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15214 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488924 d!77929))

(declare-fun d!77931 () Bool)

(assert (=> d!77931 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488919 d!77931))

(check-sat (not b!488991) (not b!489123) (not bm!31352) (not b!489105) (not b!489136) (not d!77889) (not b!488992) (not d!77873) (not bm!31363) (not b!489135) (not d!77925) (not b!489130) (not bm!31364) (not b!489050) (not b!489127) (not b!489126))
(check-sat)
