; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44526 () Bool)

(assert start!44526)

(declare-fun b!488621 () Bool)

(declare-fun res!291814 () Bool)

(declare-fun e!287397 () Bool)

(assert (=> b!488621 (=> (not res!291814) (not e!287397))))

(declare-datatypes ((array!31646 0))(
  ( (array!31647 (arr!15212 (Array (_ BitVec 32) (_ BitVec 64))) (size!15577 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31646)

(declare-datatypes ((List!9409 0))(
  ( (Nil!9406) (Cons!9405 (h!10264 (_ BitVec 64)) (t!15628 List!9409)) )
))
(declare-fun arrayNoDuplicates!0 (array!31646 (_ BitVec 32) List!9409) Bool)

(assert (=> b!488621 (= res!291814 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9406))))

(declare-fun b!488622 () Bool)

(declare-fun res!291812 () Bool)

(assert (=> b!488622 (=> (not res!291812) (not e!287397))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31646 (_ BitVec 32)) Bool)

(assert (=> b!488622 (= res!291812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291813 () Bool)

(declare-fun e!287395 () Bool)

(assert (=> start!44526 (=> (not res!291813) (not e!287395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44526 (= res!291813 (validMask!0 mask!3524))))

(assert (=> start!44526 e!287395))

(assert (=> start!44526 true))

(declare-fun array_inv!11095 (array!31646) Bool)

(assert (=> start!44526 (array_inv!11095 a!3235)))

(declare-fun b!488623 () Bool)

(declare-fun lt!220332 () (_ BitVec 32))

(assert (=> b!488623 (= e!287397 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220332 #b00000000000000000000000000000000) (bvslt lt!220332 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488623 (= lt!220332 (toIndex!0 (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287396 () Bool)

(assert (=> b!488623 e!287396))

(declare-fun res!291817 () Bool)

(assert (=> b!488623 (=> (not res!291817) (not e!287396))))

(assert (=> b!488623 (= res!291817 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14284 0))(
  ( (Unit!14285) )
))
(declare-fun lt!220331 () Unit!14284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14284)

(assert (=> b!488623 (= lt!220331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488624 () Bool)

(declare-fun res!291816 () Bool)

(assert (=> b!488624 (=> (not res!291816) (not e!287395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488624 (= res!291816 (validKeyInArray!0 k0!2280))))

(declare-fun b!488625 () Bool)

(declare-fun res!291811 () Bool)

(assert (=> b!488625 (=> (not res!291811) (not e!287395))))

(assert (=> b!488625 (= res!291811 (and (= (size!15577 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15577 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15577 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488626 () Bool)

(declare-fun res!291815 () Bool)

(assert (=> b!488626 (=> (not res!291815) (not e!287395))))

(declare-fun arrayContainsKey!0 (array!31646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488626 (= res!291815 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488627 () Bool)

(declare-datatypes ((SeekEntryResult!3676 0))(
  ( (MissingZero!3676 (index!16883 (_ BitVec 32))) (Found!3676 (index!16884 (_ BitVec 32))) (Intermediate!3676 (undefined!4488 Bool) (index!16885 (_ BitVec 32)) (x!46006 (_ BitVec 32))) (Undefined!3676) (MissingVacant!3676 (index!16886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31646 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> b!488627 (= e!287396 (= (seekEntryOrOpen!0 (select (arr!15212 a!3235) j!176) a!3235 mask!3524) (Found!3676 j!176)))))

(declare-fun b!488628 () Bool)

(declare-fun res!291818 () Bool)

(assert (=> b!488628 (=> (not res!291818) (not e!287395))))

(assert (=> b!488628 (= res!291818 (validKeyInArray!0 (select (arr!15212 a!3235) j!176)))))

(declare-fun b!488629 () Bool)

(assert (=> b!488629 (= e!287395 e!287397)))

(declare-fun res!291810 () Bool)

(assert (=> b!488629 (=> (not res!291810) (not e!287397))))

(declare-fun lt!220333 () SeekEntryResult!3676)

(assert (=> b!488629 (= res!291810 (or (= lt!220333 (MissingZero!3676 i!1204)) (= lt!220333 (MissingVacant!3676 i!1204))))))

(assert (=> b!488629 (= lt!220333 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44526 res!291813) b!488625))

(assert (= (and b!488625 res!291811) b!488628))

(assert (= (and b!488628 res!291818) b!488624))

(assert (= (and b!488624 res!291816) b!488626))

(assert (= (and b!488626 res!291815) b!488629))

(assert (= (and b!488629 res!291810) b!488622))

(assert (= (and b!488622 res!291812) b!488621))

(assert (= (and b!488621 res!291814) b!488623))

(assert (= (and b!488623 res!291817) b!488627))

(declare-fun m!467875 () Bool)

(assert (=> b!488622 m!467875))

(declare-fun m!467877 () Bool)

(assert (=> start!44526 m!467877))

(declare-fun m!467879 () Bool)

(assert (=> start!44526 m!467879))

(declare-fun m!467881 () Bool)

(assert (=> b!488624 m!467881))

(declare-fun m!467883 () Bool)

(assert (=> b!488621 m!467883))

(declare-fun m!467885 () Bool)

(assert (=> b!488623 m!467885))

(declare-fun m!467887 () Bool)

(assert (=> b!488623 m!467887))

(declare-fun m!467889 () Bool)

(assert (=> b!488623 m!467889))

(declare-fun m!467891 () Bool)

(assert (=> b!488623 m!467891))

(assert (=> b!488623 m!467889))

(declare-fun m!467893 () Bool)

(assert (=> b!488623 m!467893))

(declare-fun m!467895 () Bool)

(assert (=> b!488627 m!467895))

(assert (=> b!488627 m!467895))

(declare-fun m!467897 () Bool)

(assert (=> b!488627 m!467897))

(declare-fun m!467899 () Bool)

(assert (=> b!488629 m!467899))

(assert (=> b!488628 m!467895))

(assert (=> b!488628 m!467895))

(declare-fun m!467901 () Bool)

(assert (=> b!488628 m!467901))

(declare-fun m!467903 () Bool)

(assert (=> b!488626 m!467903))

(check-sat (not b!488629) (not start!44526) (not b!488624) (not b!488623) (not b!488621) (not b!488628) (not b!488622) (not b!488627) (not b!488626))
(check-sat)
(get-model)

(declare-fun d!77657 () Bool)

(assert (=> d!77657 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488624 d!77657))

(declare-fun d!77659 () Bool)

(assert (=> d!77659 (= (validKeyInArray!0 (select (arr!15212 a!3235) j!176)) (and (not (= (select (arr!15212 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15212 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488628 d!77659))

(declare-fun d!77661 () Bool)

(declare-fun lt!220357 () (_ BitVec 32))

(declare-fun lt!220356 () (_ BitVec 32))

(assert (=> d!77661 (= lt!220357 (bvmul (bvxor lt!220356 (bvlshr lt!220356 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77661 (= lt!220356 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77661 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291873 (let ((h!10267 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46009 (bvmul (bvxor h!10267 (bvlshr h!10267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46009 (bvlshr x!46009 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291873 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291873 #b00000000000000000000000000000000))))))

(assert (=> d!77661 (= (toIndex!0 (select (store (arr!15212 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!220357 (bvlshr lt!220357 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!488623 d!77661))

(declare-fun call!31324 () Bool)

(declare-fun bm!31321 () Bool)

(assert (=> bm!31321 (= call!31324 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488693 () Bool)

(declare-fun e!287429 () Bool)

(declare-fun e!287428 () Bool)

(assert (=> b!488693 (= e!287429 e!287428)))

(declare-fun lt!220365 () (_ BitVec 64))

(assert (=> b!488693 (= lt!220365 (select (arr!15212 a!3235) j!176))))

(declare-fun lt!220364 () Unit!14284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31646 (_ BitVec 64) (_ BitVec 32)) Unit!14284)

(assert (=> b!488693 (= lt!220364 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220365 j!176))))

(assert (=> b!488693 (arrayContainsKey!0 a!3235 lt!220365 #b00000000000000000000000000000000)))

(declare-fun lt!220366 () Unit!14284)

(assert (=> b!488693 (= lt!220366 lt!220364)))

(declare-fun res!291878 () Bool)

(assert (=> b!488693 (= res!291878 (= (seekEntryOrOpen!0 (select (arr!15212 a!3235) j!176) a!3235 mask!3524) (Found!3676 j!176)))))

(assert (=> b!488693 (=> (not res!291878) (not e!287428))))

(declare-fun b!488694 () Bool)

(assert (=> b!488694 (= e!287429 call!31324)))

(declare-fun b!488695 () Bool)

(declare-fun e!287430 () Bool)

(assert (=> b!488695 (= e!287430 e!287429)))

(declare-fun c!58677 () Bool)

(assert (=> b!488695 (= c!58677 (validKeyInArray!0 (select (arr!15212 a!3235) j!176)))))

(declare-fun d!77663 () Bool)

(declare-fun res!291879 () Bool)

(assert (=> d!77663 (=> res!291879 e!287430)))

(assert (=> d!77663 (= res!291879 (bvsge j!176 (size!15577 a!3235)))))

(assert (=> d!77663 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287430)))

(declare-fun b!488692 () Bool)

(assert (=> b!488692 (= e!287428 call!31324)))

(assert (= (and d!77663 (not res!291879)) b!488695))

(assert (= (and b!488695 c!58677) b!488693))

(assert (= (and b!488695 (not c!58677)) b!488694))

(assert (= (and b!488693 res!291878) b!488692))

(assert (= (or b!488692 b!488694) bm!31321))

(declare-fun m!467965 () Bool)

(assert (=> bm!31321 m!467965))

(assert (=> b!488693 m!467895))

(declare-fun m!467967 () Bool)

(assert (=> b!488693 m!467967))

(declare-fun m!467969 () Bool)

(assert (=> b!488693 m!467969))

(assert (=> b!488693 m!467895))

(assert (=> b!488693 m!467897))

(assert (=> b!488695 m!467895))

(assert (=> b!488695 m!467895))

(assert (=> b!488695 m!467901))

(assert (=> b!488623 d!77663))

(declare-fun d!77667 () Bool)

(assert (=> d!77667 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220369 () Unit!14284)

(declare-fun choose!38 (array!31646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14284)

(assert (=> d!77667 (= lt!220369 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77667 (validMask!0 mask!3524)))

(assert (=> d!77667 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220369)))

(declare-fun bs!15553 () Bool)

(assert (= bs!15553 d!77667))

(assert (=> bs!15553 m!467891))

(declare-fun m!467971 () Bool)

(assert (=> bs!15553 m!467971))

(assert (=> bs!15553 m!467877))

(assert (=> b!488623 d!77667))

(declare-fun d!77673 () Bool)

(assert (=> d!77673 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44526 d!77673))

(declare-fun d!77683 () Bool)

(assert (=> d!77683 (= (array_inv!11095 a!3235) (bvsge (size!15577 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44526 d!77683))

(declare-fun d!77685 () Bool)

(declare-fun lt!220403 () SeekEntryResult!3676)

(get-info :version)

(assert (=> d!77685 (and (or ((_ is Undefined!3676) lt!220403) (not ((_ is Found!3676) lt!220403)) (and (bvsge (index!16884 lt!220403) #b00000000000000000000000000000000) (bvslt (index!16884 lt!220403) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220403) ((_ is Found!3676) lt!220403) (not ((_ is MissingZero!3676) lt!220403)) (and (bvsge (index!16883 lt!220403) #b00000000000000000000000000000000) (bvslt (index!16883 lt!220403) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220403) ((_ is Found!3676) lt!220403) ((_ is MissingZero!3676) lt!220403) (not ((_ is MissingVacant!3676) lt!220403)) (and (bvsge (index!16886 lt!220403) #b00000000000000000000000000000000) (bvslt (index!16886 lt!220403) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220403) (ite ((_ is Found!3676) lt!220403) (= (select (arr!15212 a!3235) (index!16884 lt!220403)) k0!2280) (ite ((_ is MissingZero!3676) lt!220403) (= (select (arr!15212 a!3235) (index!16883 lt!220403)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3676) lt!220403) (= (select (arr!15212 a!3235) (index!16886 lt!220403)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287484 () SeekEntryResult!3676)

(assert (=> d!77685 (= lt!220403 e!287484)))

(declare-fun c!58704 () Bool)

(declare-fun lt!220404 () SeekEntryResult!3676)

(assert (=> d!77685 (= c!58704 (and ((_ is Intermediate!3676) lt!220404) (undefined!4488 lt!220404)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31646 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> d!77685 (= lt!220404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77685 (validMask!0 mask!3524)))

(assert (=> d!77685 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220403)))

(declare-fun b!488771 () Bool)

(declare-fun e!287483 () SeekEntryResult!3676)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31646 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> b!488771 (= e!287483 (seekKeyOrZeroReturnVacant!0 (x!46006 lt!220404) (index!16885 lt!220404) (index!16885 lt!220404) k0!2280 a!3235 mask!3524))))

(declare-fun b!488772 () Bool)

(assert (=> b!488772 (= e!287484 Undefined!3676)))

(declare-fun b!488773 () Bool)

(declare-fun e!287482 () SeekEntryResult!3676)

(assert (=> b!488773 (= e!287482 (Found!3676 (index!16885 lt!220404)))))

(declare-fun b!488774 () Bool)

(assert (=> b!488774 (= e!287484 e!287482)))

(declare-fun lt!220405 () (_ BitVec 64))

(assert (=> b!488774 (= lt!220405 (select (arr!15212 a!3235) (index!16885 lt!220404)))))

(declare-fun c!58702 () Bool)

(assert (=> b!488774 (= c!58702 (= lt!220405 k0!2280))))

(declare-fun b!488775 () Bool)

(declare-fun c!58703 () Bool)

(assert (=> b!488775 (= c!58703 (= lt!220405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488775 (= e!287482 e!287483)))

(declare-fun b!488776 () Bool)

(assert (=> b!488776 (= e!287483 (MissingZero!3676 (index!16885 lt!220404)))))

(assert (= (and d!77685 c!58704) b!488772))

(assert (= (and d!77685 (not c!58704)) b!488774))

(assert (= (and b!488774 c!58702) b!488773))

(assert (= (and b!488774 (not c!58702)) b!488775))

(assert (= (and b!488775 c!58703) b!488776))

(assert (= (and b!488775 (not c!58703)) b!488771))

(declare-fun m!468017 () Bool)

(assert (=> d!77685 m!468017))

(declare-fun m!468019 () Bool)

(assert (=> d!77685 m!468019))

(assert (=> d!77685 m!468017))

(declare-fun m!468021 () Bool)

(assert (=> d!77685 m!468021))

(assert (=> d!77685 m!467877))

(declare-fun m!468023 () Bool)

(assert (=> d!77685 m!468023))

(declare-fun m!468025 () Bool)

(assert (=> d!77685 m!468025))

(declare-fun m!468027 () Bool)

(assert (=> b!488771 m!468027))

(declare-fun m!468029 () Bool)

(assert (=> b!488774 m!468029))

(assert (=> b!488629 d!77685))

(declare-fun d!77693 () Bool)

(declare-fun lt!220406 () SeekEntryResult!3676)

(assert (=> d!77693 (and (or ((_ is Undefined!3676) lt!220406) (not ((_ is Found!3676) lt!220406)) (and (bvsge (index!16884 lt!220406) #b00000000000000000000000000000000) (bvslt (index!16884 lt!220406) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220406) ((_ is Found!3676) lt!220406) (not ((_ is MissingZero!3676) lt!220406)) (and (bvsge (index!16883 lt!220406) #b00000000000000000000000000000000) (bvslt (index!16883 lt!220406) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220406) ((_ is Found!3676) lt!220406) ((_ is MissingZero!3676) lt!220406) (not ((_ is MissingVacant!3676) lt!220406)) (and (bvsge (index!16886 lt!220406) #b00000000000000000000000000000000) (bvslt (index!16886 lt!220406) (size!15577 a!3235)))) (or ((_ is Undefined!3676) lt!220406) (ite ((_ is Found!3676) lt!220406) (= (select (arr!15212 a!3235) (index!16884 lt!220406)) (select (arr!15212 a!3235) j!176)) (ite ((_ is MissingZero!3676) lt!220406) (= (select (arr!15212 a!3235) (index!16883 lt!220406)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3676) lt!220406) (= (select (arr!15212 a!3235) (index!16886 lt!220406)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287491 () SeekEntryResult!3676)

(assert (=> d!77693 (= lt!220406 e!287491)))

(declare-fun c!58707 () Bool)

(declare-fun lt!220407 () SeekEntryResult!3676)

(assert (=> d!77693 (= c!58707 (and ((_ is Intermediate!3676) lt!220407) (undefined!4488 lt!220407)))))

(assert (=> d!77693 (= lt!220407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15212 a!3235) j!176) mask!3524) (select (arr!15212 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77693 (validMask!0 mask!3524)))

(assert (=> d!77693 (= (seekEntryOrOpen!0 (select (arr!15212 a!3235) j!176) a!3235 mask!3524) lt!220406)))

(declare-fun e!287490 () SeekEntryResult!3676)

(declare-fun b!488781 () Bool)

(assert (=> b!488781 (= e!287490 (seekKeyOrZeroReturnVacant!0 (x!46006 lt!220407) (index!16885 lt!220407) (index!16885 lt!220407) (select (arr!15212 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488782 () Bool)

(assert (=> b!488782 (= e!287491 Undefined!3676)))

(declare-fun b!488783 () Bool)

(declare-fun e!287489 () SeekEntryResult!3676)

(assert (=> b!488783 (= e!287489 (Found!3676 (index!16885 lt!220407)))))

(declare-fun b!488784 () Bool)

(assert (=> b!488784 (= e!287491 e!287489)))

(declare-fun lt!220408 () (_ BitVec 64))

(assert (=> b!488784 (= lt!220408 (select (arr!15212 a!3235) (index!16885 lt!220407)))))

(declare-fun c!58705 () Bool)

(assert (=> b!488784 (= c!58705 (= lt!220408 (select (arr!15212 a!3235) j!176)))))

(declare-fun b!488785 () Bool)

(declare-fun c!58706 () Bool)

(assert (=> b!488785 (= c!58706 (= lt!220408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488785 (= e!287489 e!287490)))

(declare-fun b!488786 () Bool)

(assert (=> b!488786 (= e!287490 (MissingZero!3676 (index!16885 lt!220407)))))

(assert (= (and d!77693 c!58707) b!488782))

(assert (= (and d!77693 (not c!58707)) b!488784))

(assert (= (and b!488784 c!58705) b!488783))

(assert (= (and b!488784 (not c!58705)) b!488785))

(assert (= (and b!488785 c!58706) b!488786))

(assert (= (and b!488785 (not c!58706)) b!488781))

(assert (=> d!77693 m!467895))

(declare-fun m!468033 () Bool)

(assert (=> d!77693 m!468033))

(declare-fun m!468035 () Bool)

(assert (=> d!77693 m!468035))

(assert (=> d!77693 m!468033))

(assert (=> d!77693 m!467895))

(declare-fun m!468037 () Bool)

(assert (=> d!77693 m!468037))

(assert (=> d!77693 m!467877))

(declare-fun m!468039 () Bool)

(assert (=> d!77693 m!468039))

(declare-fun m!468041 () Bool)

(assert (=> d!77693 m!468041))

(assert (=> b!488781 m!467895))

(declare-fun m!468043 () Bool)

(assert (=> b!488781 m!468043))

(declare-fun m!468045 () Bool)

(assert (=> b!488784 m!468045))

(assert (=> b!488627 d!77693))

(declare-fun bm!31331 () Bool)

(declare-fun call!31334 () Bool)

(assert (=> bm!31331 (= call!31334 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488790 () Bool)

(declare-fun e!287495 () Bool)

(declare-fun e!287494 () Bool)

(assert (=> b!488790 (= e!287495 e!287494)))

(declare-fun lt!220410 () (_ BitVec 64))

(assert (=> b!488790 (= lt!220410 (select (arr!15212 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220409 () Unit!14284)

(assert (=> b!488790 (= lt!220409 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220410 #b00000000000000000000000000000000))))

(assert (=> b!488790 (arrayContainsKey!0 a!3235 lt!220410 #b00000000000000000000000000000000)))

(declare-fun lt!220411 () Unit!14284)

(assert (=> b!488790 (= lt!220411 lt!220409)))

(declare-fun res!291913 () Bool)

(assert (=> b!488790 (= res!291913 (= (seekEntryOrOpen!0 (select (arr!15212 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3676 #b00000000000000000000000000000000)))))

(assert (=> b!488790 (=> (not res!291913) (not e!287494))))

(declare-fun b!488791 () Bool)

(assert (=> b!488791 (= e!287495 call!31334)))

(declare-fun b!488792 () Bool)

(declare-fun e!287496 () Bool)

(assert (=> b!488792 (= e!287496 e!287495)))

(declare-fun c!58708 () Bool)

(assert (=> b!488792 (= c!58708 (validKeyInArray!0 (select (arr!15212 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77697 () Bool)

(declare-fun res!291914 () Bool)

(assert (=> d!77697 (=> res!291914 e!287496)))

(assert (=> d!77697 (= res!291914 (bvsge #b00000000000000000000000000000000 (size!15577 a!3235)))))

(assert (=> d!77697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287496)))

(declare-fun b!488789 () Bool)

(assert (=> b!488789 (= e!287494 call!31334)))

(assert (= (and d!77697 (not res!291914)) b!488792))

(assert (= (and b!488792 c!58708) b!488790))

(assert (= (and b!488792 (not c!58708)) b!488791))

(assert (= (and b!488790 res!291913) b!488789))

(assert (= (or b!488789 b!488791) bm!31331))

(declare-fun m!468047 () Bool)

(assert (=> bm!31331 m!468047))

(declare-fun m!468049 () Bool)

(assert (=> b!488790 m!468049))

(declare-fun m!468051 () Bool)

(assert (=> b!488790 m!468051))

(declare-fun m!468053 () Bool)

(assert (=> b!488790 m!468053))

(assert (=> b!488790 m!468049))

(declare-fun m!468055 () Bool)

(assert (=> b!488790 m!468055))

(assert (=> b!488792 m!468049))

(assert (=> b!488792 m!468049))

(declare-fun m!468057 () Bool)

(assert (=> b!488792 m!468057))

(assert (=> b!488622 d!77697))

(declare-fun d!77699 () Bool)

(declare-fun res!291925 () Bool)

(declare-fun e!287509 () Bool)

(assert (=> d!77699 (=> res!291925 e!287509)))

(assert (=> d!77699 (= res!291925 (= (select (arr!15212 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77699 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287509)))

(declare-fun b!488807 () Bool)

(declare-fun e!287510 () Bool)

(assert (=> b!488807 (= e!287509 e!287510)))

(declare-fun res!291926 () Bool)

(assert (=> b!488807 (=> (not res!291926) (not e!287510))))

(assert (=> b!488807 (= res!291926 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15577 a!3235)))))

(declare-fun b!488808 () Bool)

(assert (=> b!488808 (= e!287510 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77699 (not res!291925)) b!488807))

(assert (= (and b!488807 res!291926) b!488808))

(assert (=> d!77699 m!468049))

(declare-fun m!468059 () Bool)

(assert (=> b!488808 m!468059))

(assert (=> b!488626 d!77699))

(declare-fun b!488842 () Bool)

(declare-fun e!287534 () Bool)

(declare-fun call!31340 () Bool)

(assert (=> b!488842 (= e!287534 call!31340)))

(declare-fun bm!31337 () Bool)

(declare-fun c!58723 () Bool)

(assert (=> bm!31337 (= call!31340 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58723 (Cons!9405 (select (arr!15212 a!3235) #b00000000000000000000000000000000) Nil!9406) Nil!9406)))))

(declare-fun b!488843 () Bool)

(declare-fun e!287532 () Bool)

(assert (=> b!488843 (= e!287532 e!287534)))

(assert (=> b!488843 (= c!58723 (validKeyInArray!0 (select (arr!15212 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77701 () Bool)

(declare-fun res!291939 () Bool)

(declare-fun e!287535 () Bool)

(assert (=> d!77701 (=> res!291939 e!287535)))

(assert (=> d!77701 (= res!291939 (bvsge #b00000000000000000000000000000000 (size!15577 a!3235)))))

(assert (=> d!77701 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9406) e!287535)))

(declare-fun b!488844 () Bool)

(assert (=> b!488844 (= e!287534 call!31340)))

(declare-fun b!488845 () Bool)

(declare-fun e!287533 () Bool)

(declare-fun contains!2689 (List!9409 (_ BitVec 64)) Bool)

(assert (=> b!488845 (= e!287533 (contains!2689 Nil!9406 (select (arr!15212 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488846 () Bool)

(assert (=> b!488846 (= e!287535 e!287532)))

(declare-fun res!291938 () Bool)

(assert (=> b!488846 (=> (not res!291938) (not e!287532))))

(assert (=> b!488846 (= res!291938 (not e!287533))))

(declare-fun res!291937 () Bool)

(assert (=> b!488846 (=> (not res!291937) (not e!287533))))

(assert (=> b!488846 (= res!291937 (validKeyInArray!0 (select (arr!15212 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77701 (not res!291939)) b!488846))

(assert (= (and b!488846 res!291937) b!488845))

(assert (= (and b!488846 res!291938) b!488843))

(assert (= (and b!488843 c!58723) b!488842))

(assert (= (and b!488843 (not c!58723)) b!488844))

(assert (= (or b!488842 b!488844) bm!31337))

(assert (=> bm!31337 m!468049))

(declare-fun m!468079 () Bool)

(assert (=> bm!31337 m!468079))

(assert (=> b!488843 m!468049))

(assert (=> b!488843 m!468049))

(assert (=> b!488843 m!468057))

(assert (=> b!488845 m!468049))

(assert (=> b!488845 m!468049))

(declare-fun m!468081 () Bool)

(assert (=> b!488845 m!468081))

(assert (=> b!488846 m!468049))

(assert (=> b!488846 m!468049))

(assert (=> b!488846 m!468057))

(assert (=> b!488621 d!77701))

(check-sat (not bm!31337) (not b!488808) (not b!488695) (not b!488781) (not b!488693) (not bm!31321) (not b!488845) (not b!488843) (not b!488771) (not bm!31331) (not b!488846) (not b!488790) (not d!77667) (not d!77685) (not d!77693) (not b!488792))
(check-sat)
