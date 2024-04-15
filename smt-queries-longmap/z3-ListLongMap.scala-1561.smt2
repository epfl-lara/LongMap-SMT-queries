; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29638 () Bool)

(assert start!29638)

(declare-fun b!298925 () Bool)

(declare-fun e!188821 () Bool)

(declare-fun e!188822 () Bool)

(assert (=> b!298925 (= e!188821 e!188822)))

(declare-fun res!157638 () Bool)

(assert (=> b!298925 (=> (not res!157638) (not e!188822))))

(declare-fun lt!148546 () Bool)

(declare-datatypes ((SeekEntryResult!2303 0))(
  ( (MissingZero!2303 (index!11385 (_ BitVec 32))) (Found!2303 (index!11386 (_ BitVec 32))) (Intermediate!2303 (undefined!3115 Bool) (index!11387 (_ BitVec 32)) (x!29641 (_ BitVec 32))) (Undefined!2303) (MissingVacant!2303 (index!11388 (_ BitVec 32))) )
))
(declare-fun lt!148550 () SeekEntryResult!2303)

(declare-datatypes ((array!15109 0))(
  ( (array!15110 (arr!7155 (Array (_ BitVec 32) (_ BitVec 64))) (size!7508 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15109)

(assert (=> b!298925 (= res!157638 (and (or lt!148546 (not (undefined!3115 lt!148550))) (not lt!148546) (= (select (arr!7155 a!3312) (index!11387 lt!148550)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!298925 (= lt!148546 (not ((_ is Intermediate!2303) lt!148550)))))

(declare-fun b!298926 () Bool)

(declare-fun res!157637 () Bool)

(declare-fun e!188818 () Bool)

(assert (=> b!298926 (=> (not res!157637) (not e!188818))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!298926 (= res!157637 (and (= (size!7508 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7508 a!3312))))))

(declare-fun b!298927 () Bool)

(declare-fun lt!148544 () array!15109)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!298927 (= e!188822 (not (= (seekEntryOrOpen!0 k0!2524 lt!148544 mask!3809) (Found!2303 i!1256))))))

(declare-datatypes ((Unit!9281 0))(
  ( (Unit!9282) )
))
(declare-fun lt!148547 () Unit!9281)

(declare-fun lt!148543 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9281)

(assert (=> b!298927 (= lt!148547 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148543 (index!11387 lt!148550) (x!29641 lt!148550) mask!3809))))

(assert (=> b!298927 (= (index!11387 lt!148550) i!1256)))

(declare-fun res!157636 () Bool)

(assert (=> start!29638 (=> (not res!157636) (not e!188818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29638 (= res!157636 (validMask!0 mask!3809))))

(assert (=> start!29638 e!188818))

(assert (=> start!29638 true))

(declare-fun array_inv!5127 (array!15109) Bool)

(assert (=> start!29638 (array_inv!5127 a!3312)))

(declare-fun b!298928 () Bool)

(declare-fun res!157639 () Bool)

(assert (=> b!298928 (=> (not res!157639) (not e!188818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298928 (= res!157639 (validKeyInArray!0 k0!2524))))

(declare-fun b!298929 () Bool)

(declare-fun res!157635 () Bool)

(assert (=> b!298929 (=> (not res!157635) (not e!188818))))

(declare-fun arrayContainsKey!0 (array!15109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298929 (= res!157635 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298930 () Bool)

(declare-fun e!188820 () Bool)

(assert (=> b!298930 (= e!188820 e!188821)))

(declare-fun res!157640 () Bool)

(assert (=> b!298930 (=> (not res!157640) (not e!188821))))

(declare-fun lt!148548 () Bool)

(declare-fun lt!148549 () SeekEntryResult!2303)

(assert (=> b!298930 (= res!157640 (and (not lt!148548) (= lt!148549 (MissingVacant!2303 i!1256))))))

(declare-fun lt!148545 () SeekEntryResult!2303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!298930 (= lt!148545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 lt!148544 mask!3809))))

(assert (=> b!298930 (= lt!148544 (array!15110 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7508 a!3312)))))

(assert (=> b!298930 (= lt!148550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298930 (= lt!148543 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298931 () Bool)

(declare-fun res!157634 () Bool)

(assert (=> b!298931 (=> (not res!157634) (not e!188820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15109 (_ BitVec 32)) Bool)

(assert (=> b!298931 (= res!157634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298932 () Bool)

(assert (=> b!298932 (= e!188818 e!188820)))

(declare-fun res!157641 () Bool)

(assert (=> b!298932 (=> (not res!157641) (not e!188820))))

(assert (=> b!298932 (= res!157641 (or lt!148548 (= lt!148549 (MissingVacant!2303 i!1256))))))

(assert (=> b!298932 (= lt!148548 (= lt!148549 (MissingZero!2303 i!1256)))))

(assert (=> b!298932 (= lt!148549 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29638 res!157636) b!298926))

(assert (= (and b!298926 res!157637) b!298928))

(assert (= (and b!298928 res!157639) b!298929))

(assert (= (and b!298929 res!157635) b!298932))

(assert (= (and b!298932 res!157641) b!298931))

(assert (= (and b!298931 res!157634) b!298930))

(assert (= (and b!298930 res!157640) b!298925))

(assert (= (and b!298925 res!157638) b!298927))

(declare-fun m!310819 () Bool)

(assert (=> b!298931 m!310819))

(declare-fun m!310821 () Bool)

(assert (=> b!298925 m!310821))

(declare-fun m!310823 () Bool)

(assert (=> b!298929 m!310823))

(declare-fun m!310825 () Bool)

(assert (=> b!298930 m!310825))

(declare-fun m!310827 () Bool)

(assert (=> b!298930 m!310827))

(declare-fun m!310829 () Bool)

(assert (=> b!298930 m!310829))

(declare-fun m!310831 () Bool)

(assert (=> b!298930 m!310831))

(declare-fun m!310833 () Bool)

(assert (=> b!298927 m!310833))

(declare-fun m!310835 () Bool)

(assert (=> b!298927 m!310835))

(declare-fun m!310837 () Bool)

(assert (=> start!29638 m!310837))

(declare-fun m!310839 () Bool)

(assert (=> start!29638 m!310839))

(declare-fun m!310841 () Bool)

(assert (=> b!298932 m!310841))

(declare-fun m!310843 () Bool)

(assert (=> b!298928 m!310843))

(check-sat (not b!298929) (not b!298931) (not start!29638) (not b!298928) (not b!298932) (not b!298927) (not b!298930))
(check-sat)
(get-model)

(declare-fun b!298989 () Bool)

(declare-fun e!188860 () Bool)

(declare-fun e!188861 () Bool)

(assert (=> b!298989 (= e!188860 e!188861)))

(declare-fun lt!148605 () (_ BitVec 64))

(assert (=> b!298989 (= lt!148605 (select (arr!7155 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148607 () Unit!9281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15109 (_ BitVec 64) (_ BitVec 32)) Unit!9281)

(assert (=> b!298989 (= lt!148607 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148605 #b00000000000000000000000000000000))))

(assert (=> b!298989 (arrayContainsKey!0 a!3312 lt!148605 #b00000000000000000000000000000000)))

(declare-fun lt!148606 () Unit!9281)

(assert (=> b!298989 (= lt!148606 lt!148607)))

(declare-fun res!157695 () Bool)

(assert (=> b!298989 (= res!157695 (= (seekEntryOrOpen!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2303 #b00000000000000000000000000000000)))))

(assert (=> b!298989 (=> (not res!157695) (not e!188861))))

(declare-fun b!298990 () Bool)

(declare-fun call!25778 () Bool)

(assert (=> b!298990 (= e!188861 call!25778)))

(declare-fun bm!25775 () Bool)

(assert (=> bm!25775 (= call!25778 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67321 () Bool)

(declare-fun res!157694 () Bool)

(declare-fun e!188859 () Bool)

(assert (=> d!67321 (=> res!157694 e!188859)))

(assert (=> d!67321 (= res!157694 (bvsge #b00000000000000000000000000000000 (size!7508 a!3312)))))

(assert (=> d!67321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188859)))

(declare-fun b!298991 () Bool)

(assert (=> b!298991 (= e!188859 e!188860)))

(declare-fun c!48236 () Bool)

(assert (=> b!298991 (= c!48236 (validKeyInArray!0 (select (arr!7155 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298992 () Bool)

(assert (=> b!298992 (= e!188860 call!25778)))

(assert (= (and d!67321 (not res!157694)) b!298991))

(assert (= (and b!298991 c!48236) b!298989))

(assert (= (and b!298991 (not c!48236)) b!298992))

(assert (= (and b!298989 res!157695) b!298990))

(assert (= (or b!298990 b!298992) bm!25775))

(declare-fun m!310897 () Bool)

(assert (=> b!298989 m!310897))

(declare-fun m!310899 () Bool)

(assert (=> b!298989 m!310899))

(declare-fun m!310901 () Bool)

(assert (=> b!298989 m!310901))

(assert (=> b!298989 m!310897))

(declare-fun m!310903 () Bool)

(assert (=> b!298989 m!310903))

(declare-fun m!310905 () Bool)

(assert (=> bm!25775 m!310905))

(assert (=> b!298991 m!310897))

(assert (=> b!298991 m!310897))

(declare-fun m!310907 () Bool)

(assert (=> b!298991 m!310907))

(assert (=> b!298931 d!67321))

(declare-fun b!299005 () Bool)

(declare-fun e!188870 () SeekEntryResult!2303)

(assert (=> b!299005 (= e!188870 Undefined!2303)))

(declare-fun b!299006 () Bool)

(declare-fun e!188868 () SeekEntryResult!2303)

(declare-fun lt!148614 () SeekEntryResult!2303)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15109 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!299006 (= e!188868 (seekKeyOrZeroReturnVacant!0 (x!29641 lt!148614) (index!11387 lt!148614) (index!11387 lt!148614) k0!2524 a!3312 mask!3809))))

(declare-fun d!67323 () Bool)

(declare-fun lt!148616 () SeekEntryResult!2303)

(assert (=> d!67323 (and (or ((_ is Undefined!2303) lt!148616) (not ((_ is Found!2303) lt!148616)) (and (bvsge (index!11386 lt!148616) #b00000000000000000000000000000000) (bvslt (index!11386 lt!148616) (size!7508 a!3312)))) (or ((_ is Undefined!2303) lt!148616) ((_ is Found!2303) lt!148616) (not ((_ is MissingZero!2303) lt!148616)) (and (bvsge (index!11385 lt!148616) #b00000000000000000000000000000000) (bvslt (index!11385 lt!148616) (size!7508 a!3312)))) (or ((_ is Undefined!2303) lt!148616) ((_ is Found!2303) lt!148616) ((_ is MissingZero!2303) lt!148616) (not ((_ is MissingVacant!2303) lt!148616)) (and (bvsge (index!11388 lt!148616) #b00000000000000000000000000000000) (bvslt (index!11388 lt!148616) (size!7508 a!3312)))) (or ((_ is Undefined!2303) lt!148616) (ite ((_ is Found!2303) lt!148616) (= (select (arr!7155 a!3312) (index!11386 lt!148616)) k0!2524) (ite ((_ is MissingZero!2303) lt!148616) (= (select (arr!7155 a!3312) (index!11385 lt!148616)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2303) lt!148616) (= (select (arr!7155 a!3312) (index!11388 lt!148616)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67323 (= lt!148616 e!188870)))

(declare-fun c!48243 () Bool)

(assert (=> d!67323 (= c!48243 (and ((_ is Intermediate!2303) lt!148614) (undefined!3115 lt!148614)))))

(assert (=> d!67323 (= lt!148614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67323 (validMask!0 mask!3809)))

(assert (=> d!67323 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148616)))

(declare-fun b!299007 () Bool)

(declare-fun e!188869 () SeekEntryResult!2303)

(assert (=> b!299007 (= e!188869 (Found!2303 (index!11387 lt!148614)))))

(declare-fun b!299008 () Bool)

(assert (=> b!299008 (= e!188870 e!188869)))

(declare-fun lt!148615 () (_ BitVec 64))

(assert (=> b!299008 (= lt!148615 (select (arr!7155 a!3312) (index!11387 lt!148614)))))

(declare-fun c!48245 () Bool)

(assert (=> b!299008 (= c!48245 (= lt!148615 k0!2524))))

(declare-fun b!299009 () Bool)

(declare-fun c!48244 () Bool)

(assert (=> b!299009 (= c!48244 (= lt!148615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299009 (= e!188869 e!188868)))

(declare-fun b!299010 () Bool)

(assert (=> b!299010 (= e!188868 (MissingZero!2303 (index!11387 lt!148614)))))

(assert (= (and d!67323 c!48243) b!299005))

(assert (= (and d!67323 (not c!48243)) b!299008))

(assert (= (and b!299008 c!48245) b!299007))

(assert (= (and b!299008 (not c!48245)) b!299009))

(assert (= (and b!299009 c!48244) b!299010))

(assert (= (and b!299009 (not c!48244)) b!299006))

(declare-fun m!310909 () Bool)

(assert (=> b!299006 m!310909))

(declare-fun m!310911 () Bool)

(assert (=> d!67323 m!310911))

(assert (=> d!67323 m!310837))

(declare-fun m!310913 () Bool)

(assert (=> d!67323 m!310913))

(declare-fun m!310915 () Bool)

(assert (=> d!67323 m!310915))

(assert (=> d!67323 m!310831))

(declare-fun m!310917 () Bool)

(assert (=> d!67323 m!310917))

(assert (=> d!67323 m!310831))

(declare-fun m!310919 () Bool)

(assert (=> b!299008 m!310919))

(assert (=> b!298932 d!67323))

(declare-fun b!299019 () Bool)

(declare-fun e!188879 () SeekEntryResult!2303)

(assert (=> b!299019 (= e!188879 Undefined!2303)))

(declare-fun e!188877 () SeekEntryResult!2303)

(declare-fun lt!148623 () SeekEntryResult!2303)

(declare-fun b!299020 () Bool)

(assert (=> b!299020 (= e!188877 (seekKeyOrZeroReturnVacant!0 (x!29641 lt!148623) (index!11387 lt!148623) (index!11387 lt!148623) k0!2524 lt!148544 mask!3809))))

(declare-fun d!67335 () Bool)

(declare-fun lt!148625 () SeekEntryResult!2303)

(assert (=> d!67335 (and (or ((_ is Undefined!2303) lt!148625) (not ((_ is Found!2303) lt!148625)) (and (bvsge (index!11386 lt!148625) #b00000000000000000000000000000000) (bvslt (index!11386 lt!148625) (size!7508 lt!148544)))) (or ((_ is Undefined!2303) lt!148625) ((_ is Found!2303) lt!148625) (not ((_ is MissingZero!2303) lt!148625)) (and (bvsge (index!11385 lt!148625) #b00000000000000000000000000000000) (bvslt (index!11385 lt!148625) (size!7508 lt!148544)))) (or ((_ is Undefined!2303) lt!148625) ((_ is Found!2303) lt!148625) ((_ is MissingZero!2303) lt!148625) (not ((_ is MissingVacant!2303) lt!148625)) (and (bvsge (index!11388 lt!148625) #b00000000000000000000000000000000) (bvslt (index!11388 lt!148625) (size!7508 lt!148544)))) (or ((_ is Undefined!2303) lt!148625) (ite ((_ is Found!2303) lt!148625) (= (select (arr!7155 lt!148544) (index!11386 lt!148625)) k0!2524) (ite ((_ is MissingZero!2303) lt!148625) (= (select (arr!7155 lt!148544) (index!11385 lt!148625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2303) lt!148625) (= (select (arr!7155 lt!148544) (index!11388 lt!148625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67335 (= lt!148625 e!188879)))

(declare-fun c!48248 () Bool)

(assert (=> d!67335 (= c!48248 (and ((_ is Intermediate!2303) lt!148623) (undefined!3115 lt!148623)))))

(assert (=> d!67335 (= lt!148623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!148544 mask!3809))))

(assert (=> d!67335 (validMask!0 mask!3809)))

(assert (=> d!67335 (= (seekEntryOrOpen!0 k0!2524 lt!148544 mask!3809) lt!148625)))

(declare-fun b!299021 () Bool)

(declare-fun e!188878 () SeekEntryResult!2303)

(assert (=> b!299021 (= e!188878 (Found!2303 (index!11387 lt!148623)))))

(declare-fun b!299022 () Bool)

(assert (=> b!299022 (= e!188879 e!188878)))

(declare-fun lt!148624 () (_ BitVec 64))

(assert (=> b!299022 (= lt!148624 (select (arr!7155 lt!148544) (index!11387 lt!148623)))))

(declare-fun c!48250 () Bool)

(assert (=> b!299022 (= c!48250 (= lt!148624 k0!2524))))

(declare-fun b!299023 () Bool)

(declare-fun c!48249 () Bool)

(assert (=> b!299023 (= c!48249 (= lt!148624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299023 (= e!188878 e!188877)))

(declare-fun b!299024 () Bool)

(assert (=> b!299024 (= e!188877 (MissingZero!2303 (index!11387 lt!148623)))))

(assert (= (and d!67335 c!48248) b!299019))

(assert (= (and d!67335 (not c!48248)) b!299022))

(assert (= (and b!299022 c!48250) b!299021))

(assert (= (and b!299022 (not c!48250)) b!299023))

(assert (= (and b!299023 c!48249) b!299024))

(assert (= (and b!299023 (not c!48249)) b!299020))

(declare-fun m!310921 () Bool)

(assert (=> b!299020 m!310921))

(declare-fun m!310923 () Bool)

(assert (=> d!67335 m!310923))

(assert (=> d!67335 m!310837))

(declare-fun m!310925 () Bool)

(assert (=> d!67335 m!310925))

(declare-fun m!310927 () Bool)

(assert (=> d!67335 m!310927))

(assert (=> d!67335 m!310831))

(declare-fun m!310929 () Bool)

(assert (=> d!67335 m!310929))

(assert (=> d!67335 m!310831))

(declare-fun m!310931 () Bool)

(assert (=> b!299022 m!310931))

(assert (=> b!298927 d!67335))

(declare-fun b!299147 () Bool)

(declare-fun e!188952 () Unit!9281)

(declare-fun Unit!9287 () Unit!9281)

(assert (=> b!299147 (= e!188952 Unit!9287)))

(declare-fun bm!25783 () Bool)

(declare-fun call!25786 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!25783 (= call!25786 (nextIndex!0 lt!148543 #b00000000000000000000000000000000 mask!3809))))

(declare-fun b!299148 () Bool)

(declare-fun e!188951 () (_ BitVec 32))

(assert (=> b!299148 (= e!188951 lt!148543)))

(declare-fun b!299149 () Bool)

(declare-fun e!188950 () Unit!9281)

(assert (=> b!299149 (= e!188950 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) call!25786 (index!11387 lt!148550) (x!29641 lt!148550) mask!3809))))

(declare-fun d!67337 () Bool)

(declare-fun e!188955 () Bool)

(assert (=> d!67337 e!188955))

(declare-fun res!157736 () Bool)

(assert (=> d!67337 (=> (not res!157736) (not e!188955))))

(assert (=> d!67337 (= res!157736 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7508 a!3312))))))

(declare-fun lt!148670 () Unit!9281)

(assert (=> d!67337 (= lt!148670 e!188950)))

(declare-fun c!48297 () Bool)

(assert (=> d!67337 (= c!48297 (= #b00000000000000000000000000000000 (x!29641 lt!148550)))))

(assert (=> d!67337 (validMask!0 mask!3809)))

(assert (=> d!67337 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148543 (index!11387 lt!148550) (x!29641 lt!148550) mask!3809) lt!148670)))

(declare-fun b!299150 () Bool)

(declare-fun e!188953 () Unit!9281)

(declare-fun Unit!9288 () Unit!9281)

(assert (=> b!299150 (= e!188953 Unit!9288)))

(declare-fun c!48296 () Bool)

(declare-fun call!25787 () SeekEntryResult!2303)

(assert (=> b!299150 (= c!48296 ((_ is Intermediate!2303) call!25787))))

(declare-fun lt!148672 () Unit!9281)

(assert (=> b!299150 (= lt!148672 e!188952)))

(assert (=> b!299150 false))

(declare-fun b!299151 () Bool)

(declare-fun c!48299 () Bool)

(assert (=> b!299151 (= c!48299 (or (= (select (arr!7155 a!3312) lt!148543) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7155 a!3312) lt!148543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!188954 () Unit!9281)

(assert (=> b!299151 (= e!188954 e!188953)))

(declare-fun b!299152 () Bool)

(declare-fun Unit!9289 () Unit!9281)

(assert (=> b!299152 (= e!188954 Unit!9289)))

(declare-fun bm!25784 () Bool)

(assert (=> bm!25784 (= call!25787 (seekKeyOrZeroOrLongMinValue!0 (ite c!48299 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!188951 k0!2524 a!3312 mask!3809))))

(declare-fun c!48295 () Bool)

(assert (=> bm!25784 (= c!48295 c!48299)))

(declare-fun b!299153 () Bool)

(assert (=> b!299153 (= e!188955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 (array!15110 (store (arr!7155 a!3312) i!1256 k0!2524) (size!7508 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 a!3312 mask!3809)))))

(declare-fun b!299154 () Bool)

(assert (=> b!299154 (= e!188951 call!25786)))

(declare-fun b!299155 () Bool)

(assert (=> b!299155 false))

(declare-fun Unit!9290 () Unit!9281)

(assert (=> b!299155 (= e!188952 Unit!9290)))

(declare-fun b!299156 () Bool)

(declare-fun Unit!9291 () Unit!9281)

(assert (=> b!299156 (= e!188950 Unit!9291)))

(declare-fun c!48298 () Bool)

(assert (=> b!299156 (= c!48298 (not (= (index!11387 lt!148550) lt!148543)))))

(declare-fun lt!148671 () Unit!9281)

(assert (=> b!299156 (= lt!148671 e!188954)))

(assert (=> b!299156 (= lt!148543 (index!11387 lt!148550))))

(declare-fun lt!148674 () Unit!9281)

(declare-fun Unit!9292 () Unit!9281)

(assert (=> b!299156 (= lt!148674 Unit!9292)))

(assert (=> b!299156 (= (select (arr!7155 a!3312) lt!148543) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!299157 () Bool)

(declare-fun Unit!9293 () Unit!9281)

(assert (=> b!299157 (= e!188953 Unit!9293)))

(assert (=> b!299157 (= call!25787 (Intermediate!2303 false lt!148543 (x!29641 lt!148550)))))

(declare-fun lt!148673 () Unit!9281)

(declare-fun Unit!9294 () Unit!9281)

(assert (=> b!299157 (= lt!148673 Unit!9294)))

(assert (=> b!299157 false))

(assert (= (and d!67337 c!48297) b!299156))

(assert (= (and d!67337 (not c!48297)) b!299149))

(assert (= (and b!299156 c!48298) b!299151))

(assert (= (and b!299156 (not c!48298)) b!299152))

(assert (= (and b!299151 c!48299) b!299157))

(assert (= (and b!299151 (not c!48299)) b!299150))

(assert (= (and b!299150 c!48296) b!299147))

(assert (= (and b!299150 (not c!48296)) b!299155))

(assert (= (or b!299157 b!299150) bm!25784))

(assert (= (and bm!25784 c!48295) b!299148))

(assert (= (and bm!25784 (not c!48295)) b!299154))

(assert (= (or b!299154 b!299149) bm!25783))

(assert (= (and d!67337 res!157736) b!299153))

(declare-fun m!310989 () Bool)

(assert (=> b!299151 m!310989))

(declare-fun m!310991 () Bool)

(assert (=> b!299149 m!310991))

(declare-fun m!310993 () Bool)

(assert (=> bm!25784 m!310993))

(assert (=> b!299153 m!310827))

(declare-fun m!310995 () Bool)

(assert (=> b!299153 m!310995))

(assert (=> b!299153 m!310829))

(declare-fun m!310997 () Bool)

(assert (=> bm!25783 m!310997))

(assert (=> d!67337 m!310837))

(assert (=> b!299156 m!310989))

(assert (=> b!298927 d!67337))

(declare-fun d!67361 () Bool)

(assert (=> d!67361 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298928 d!67361))

(declare-fun d!67365 () Bool)

(declare-fun res!157741 () Bool)

(declare-fun e!188963 () Bool)

(assert (=> d!67365 (=> res!157741 e!188963)))

(assert (=> d!67365 (= res!157741 (= (select (arr!7155 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67365 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188963)))

(declare-fun b!299168 () Bool)

(declare-fun e!188964 () Bool)

(assert (=> b!299168 (= e!188963 e!188964)))

(declare-fun res!157742 () Bool)

(assert (=> b!299168 (=> (not res!157742) (not e!188964))))

(assert (=> b!299168 (= res!157742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7508 a!3312)))))

(declare-fun b!299169 () Bool)

(assert (=> b!299169 (= e!188964 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67365 (not res!157741)) b!299168))

(assert (= (and b!299168 res!157742) b!299169))

(assert (=> d!67365 m!310897))

(declare-fun m!311011 () Bool)

(assert (=> b!299169 m!311011))

(assert (=> b!298929 d!67365))

(declare-fun b!299245 () Bool)

(declare-fun lt!148712 () SeekEntryResult!2303)

(assert (=> b!299245 (and (bvsge (index!11387 lt!148712) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148712) (size!7508 lt!148544)))))

(declare-fun res!157760 () Bool)

(assert (=> b!299245 (= res!157760 (= (select (arr!7155 lt!148544) (index!11387 lt!148712)) k0!2524))))

(declare-fun e!189009 () Bool)

(assert (=> b!299245 (=> res!157760 e!189009)))

(declare-fun e!189010 () Bool)

(assert (=> b!299245 (= e!189010 e!189009)))

(declare-fun b!299247 () Bool)

(declare-fun e!189012 () Bool)

(assert (=> b!299247 (= e!189012 e!189010)))

(declare-fun res!157759 () Bool)

(assert (=> b!299247 (= res!157759 (and ((_ is Intermediate!2303) lt!148712) (not (undefined!3115 lt!148712)) (bvslt (x!29641 lt!148712) #b01111111111111111111111111111110) (bvsge (x!29641 lt!148712) #b00000000000000000000000000000000) (bvsge (x!29641 lt!148712) #b00000000000000000000000000000000)))))

(assert (=> b!299247 (=> (not res!157759) (not e!189010))))

(declare-fun b!299248 () Bool)

(assert (=> b!299248 (and (bvsge (index!11387 lt!148712) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148712) (size!7508 lt!148544)))))

(assert (=> b!299248 (= e!189009 (= (select (arr!7155 lt!148544) (index!11387 lt!148712)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299249 () Bool)

(declare-fun e!189011 () SeekEntryResult!2303)

(assert (=> b!299249 (= e!189011 (Intermediate!2303 false lt!148543 #b00000000000000000000000000000000))))

(declare-fun b!299246 () Bool)

(declare-fun e!189008 () SeekEntryResult!2303)

(assert (=> b!299246 (= e!189008 e!189011)))

(declare-fun c!48333 () Bool)

(declare-fun lt!148713 () (_ BitVec 64))

(assert (=> b!299246 (= c!48333 (or (= lt!148713 k0!2524) (= (bvadd lt!148713 lt!148713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67369 () Bool)

(assert (=> d!67369 e!189012))

(declare-fun c!48335 () Bool)

(assert (=> d!67369 (= c!48335 (and ((_ is Intermediate!2303) lt!148712) (undefined!3115 lt!148712)))))

(assert (=> d!67369 (= lt!148712 e!189008)))

(declare-fun c!48334 () Bool)

(assert (=> d!67369 (= c!48334 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67369 (= lt!148713 (select (arr!7155 lt!148544) lt!148543))))

(assert (=> d!67369 (validMask!0 mask!3809)))

(assert (=> d!67369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 lt!148544 mask!3809) lt!148712)))

(declare-fun b!299250 () Bool)

(assert (=> b!299250 (and (bvsge (index!11387 lt!148712) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148712) (size!7508 lt!148544)))))

(declare-fun res!157758 () Bool)

(assert (=> b!299250 (= res!157758 (= (select (arr!7155 lt!148544) (index!11387 lt!148712)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299250 (=> res!157758 e!189009)))

(declare-fun b!299251 () Bool)

(assert (=> b!299251 (= e!189012 (bvsge (x!29641 lt!148712) #b01111111111111111111111111111110))))

(declare-fun b!299252 () Bool)

(assert (=> b!299252 (= e!189011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148543 #b00000000000000000000000000000000 mask!3809) k0!2524 lt!148544 mask!3809))))

(declare-fun b!299253 () Bool)

(assert (=> b!299253 (= e!189008 (Intermediate!2303 true lt!148543 #b00000000000000000000000000000000))))

(assert (= (and d!67369 c!48334) b!299253))

(assert (= (and d!67369 (not c!48334)) b!299246))

(assert (= (and b!299246 c!48333) b!299249))

(assert (= (and b!299246 (not c!48333)) b!299252))

(assert (= (and d!67369 c!48335) b!299251))

(assert (= (and d!67369 (not c!48335)) b!299247))

(assert (= (and b!299247 res!157759) b!299245))

(assert (= (and b!299245 (not res!157760)) b!299250))

(assert (= (and b!299250 (not res!157758)) b!299248))

(declare-fun m!311033 () Bool)

(assert (=> b!299245 m!311033))

(assert (=> b!299250 m!311033))

(declare-fun m!311035 () Bool)

(assert (=> d!67369 m!311035))

(assert (=> d!67369 m!310837))

(assert (=> b!299252 m!310997))

(assert (=> b!299252 m!310997))

(declare-fun m!311037 () Bool)

(assert (=> b!299252 m!311037))

(assert (=> b!299248 m!311033))

(assert (=> b!298930 d!67369))

(declare-fun b!299254 () Bool)

(declare-fun lt!148714 () SeekEntryResult!2303)

(assert (=> b!299254 (and (bvsge (index!11387 lt!148714) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148714) (size!7508 a!3312)))))

(declare-fun res!157763 () Bool)

(assert (=> b!299254 (= res!157763 (= (select (arr!7155 a!3312) (index!11387 lt!148714)) k0!2524))))

(declare-fun e!189014 () Bool)

(assert (=> b!299254 (=> res!157763 e!189014)))

(declare-fun e!189015 () Bool)

(assert (=> b!299254 (= e!189015 e!189014)))

(declare-fun b!299256 () Bool)

(declare-fun e!189017 () Bool)

(assert (=> b!299256 (= e!189017 e!189015)))

(declare-fun res!157762 () Bool)

(assert (=> b!299256 (= res!157762 (and ((_ is Intermediate!2303) lt!148714) (not (undefined!3115 lt!148714)) (bvslt (x!29641 lt!148714) #b01111111111111111111111111111110) (bvsge (x!29641 lt!148714) #b00000000000000000000000000000000) (bvsge (x!29641 lt!148714) #b00000000000000000000000000000000)))))

(assert (=> b!299256 (=> (not res!157762) (not e!189015))))

(declare-fun b!299257 () Bool)

(assert (=> b!299257 (and (bvsge (index!11387 lt!148714) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148714) (size!7508 a!3312)))))

(assert (=> b!299257 (= e!189014 (= (select (arr!7155 a!3312) (index!11387 lt!148714)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299258 () Bool)

(declare-fun e!189016 () SeekEntryResult!2303)

(assert (=> b!299258 (= e!189016 (Intermediate!2303 false lt!148543 #b00000000000000000000000000000000))))

(declare-fun b!299255 () Bool)

(declare-fun e!189013 () SeekEntryResult!2303)

(assert (=> b!299255 (= e!189013 e!189016)))

(declare-fun c!48336 () Bool)

(declare-fun lt!148715 () (_ BitVec 64))

(assert (=> b!299255 (= c!48336 (or (= lt!148715 k0!2524) (= (bvadd lt!148715 lt!148715) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67375 () Bool)

(assert (=> d!67375 e!189017))

(declare-fun c!48338 () Bool)

(assert (=> d!67375 (= c!48338 (and ((_ is Intermediate!2303) lt!148714) (undefined!3115 lt!148714)))))

(assert (=> d!67375 (= lt!148714 e!189013)))

(declare-fun c!48337 () Bool)

(assert (=> d!67375 (= c!48337 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67375 (= lt!148715 (select (arr!7155 a!3312) lt!148543))))

(assert (=> d!67375 (validMask!0 mask!3809)))

(assert (=> d!67375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148543 k0!2524 a!3312 mask!3809) lt!148714)))

(declare-fun b!299259 () Bool)

(assert (=> b!299259 (and (bvsge (index!11387 lt!148714) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148714) (size!7508 a!3312)))))

(declare-fun res!157761 () Bool)

(assert (=> b!299259 (= res!157761 (= (select (arr!7155 a!3312) (index!11387 lt!148714)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299259 (=> res!157761 e!189014)))

(declare-fun b!299260 () Bool)

(assert (=> b!299260 (= e!189017 (bvsge (x!29641 lt!148714) #b01111111111111111111111111111110))))

(declare-fun b!299261 () Bool)

(assert (=> b!299261 (= e!189016 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148543 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299262 () Bool)

(assert (=> b!299262 (= e!189013 (Intermediate!2303 true lt!148543 #b00000000000000000000000000000000))))

(assert (= (and d!67375 c!48337) b!299262))

(assert (= (and d!67375 (not c!48337)) b!299255))

(assert (= (and b!299255 c!48336) b!299258))

(assert (= (and b!299255 (not c!48336)) b!299261))

(assert (= (and d!67375 c!48338) b!299260))

(assert (= (and d!67375 (not c!48338)) b!299256))

(assert (= (and b!299256 res!157762) b!299254))

(assert (= (and b!299254 (not res!157763)) b!299259))

(assert (= (and b!299259 (not res!157761)) b!299257))

(declare-fun m!311039 () Bool)

(assert (=> b!299254 m!311039))

(assert (=> b!299259 m!311039))

(assert (=> d!67375 m!310989))

(assert (=> d!67375 m!310837))

(assert (=> b!299261 m!310997))

(assert (=> b!299261 m!310997))

(declare-fun m!311041 () Bool)

(assert (=> b!299261 m!311041))

(assert (=> b!299257 m!311039))

(assert (=> b!298930 d!67375))

(declare-fun d!67377 () Bool)

(declare-fun lt!148721 () (_ BitVec 32))

(declare-fun lt!148720 () (_ BitVec 32))

(assert (=> d!67377 (= lt!148721 (bvmul (bvxor lt!148720 (bvlshr lt!148720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67377 (= lt!148720 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67377 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157764 (let ((h!5283 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29651 (bvmul (bvxor h!5283 (bvlshr h!5283 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29651 (bvlshr x!29651 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157764 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157764 #b00000000000000000000000000000000))))))

(assert (=> d!67377 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148721 (bvlshr lt!148721 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298930 d!67377))

(declare-fun d!67379 () Bool)

(assert (=> d!67379 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29638 d!67379))

(declare-fun d!67381 () Bool)

(assert (=> d!67381 (= (array_inv!5127 a!3312) (bvsge (size!7508 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29638 d!67381))

(check-sat (not d!67369) (not b!299169) (not b!298989) (not b!299006) (not bm!25783) (not bm!25784) (not d!67375) (not b!299149) (not b!299153) (not b!299252) (not b!299020) (not d!67335) (not d!67337) (not d!67323) (not b!299261) (not bm!25775) (not b!298991))
(check-sat)
