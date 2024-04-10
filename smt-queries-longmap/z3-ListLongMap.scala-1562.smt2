; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29718 () Bool)

(assert start!29718)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2313 0))(
  ( (MissingZero!2313 (index!11428 (_ BitVec 32))) (Found!2313 (index!11429 (_ BitVec 32))) (Intermediate!2313 (undefined!3125 Bool) (index!11430 (_ BitVec 32)) (x!29673 (_ BitVec 32))) (Undefined!2313) (MissingVacant!2313 (index!11431 (_ BitVec 32))) )
))
(declare-fun lt!149010 () SeekEntryResult!2313)

(declare-fun e!189241 () Bool)

(declare-fun lt!149013 () SeekEntryResult!2313)

(declare-fun b!299619 () Bool)

(declare-fun lt!149009 () Bool)

(declare-datatypes ((array!15131 0))(
  ( (array!15132 (arr!7164 (Array (_ BitVec 32) (_ BitVec 64))) (size!7516 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15131)

(get-info :version)

(assert (=> b!299619 (= e!189241 (and (not lt!149009) (= lt!149013 (MissingVacant!2313 i!1256)) (let ((bdg!6446 (not ((_ is Intermediate!2313) lt!149010)))) (and (or bdg!6446 (not (undefined!3125 lt!149010))) (or bdg!6446 (not (= (select (arr!7164 a!3312) (index!11430 lt!149010)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6446) (or (bvslt (index!11430 lt!149010) #b00000000000000000000000000000000) (bvsge (index!11430 lt!149010) (size!7516 a!3312)))))))))

(declare-fun lt!149011 () (_ BitVec 32))

(declare-fun lt!149012 () SeekEntryResult!2313)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15131 (_ BitVec 32)) SeekEntryResult!2313)

(assert (=> b!299619 (= lt!149012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149011 k0!2524 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)) mask!3809))))

(assert (=> b!299619 (= lt!149010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149011 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299619 (= lt!149011 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!157933 () Bool)

(declare-fun e!189239 () Bool)

(assert (=> start!29718 (=> (not res!157933) (not e!189239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29718 (= res!157933 (validMask!0 mask!3809))))

(assert (=> start!29718 e!189239))

(assert (=> start!29718 true))

(declare-fun array_inv!5127 (array!15131) Bool)

(assert (=> start!29718 (array_inv!5127 a!3312)))

(declare-fun b!299620 () Bool)

(declare-fun res!157937 () Bool)

(assert (=> b!299620 (=> (not res!157937) (not e!189239))))

(assert (=> b!299620 (= res!157937 (and (= (size!7516 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7516 a!3312))))))

(declare-fun b!299621 () Bool)

(declare-fun res!157936 () Bool)

(assert (=> b!299621 (=> (not res!157936) (not e!189239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299621 (= res!157936 (validKeyInArray!0 k0!2524))))

(declare-fun b!299622 () Bool)

(assert (=> b!299622 (= e!189239 e!189241)))

(declare-fun res!157938 () Bool)

(assert (=> b!299622 (=> (not res!157938) (not e!189241))))

(assert (=> b!299622 (= res!157938 (or lt!149009 (= lt!149013 (MissingVacant!2313 i!1256))))))

(assert (=> b!299622 (= lt!149009 (= lt!149013 (MissingZero!2313 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15131 (_ BitVec 32)) SeekEntryResult!2313)

(assert (=> b!299622 (= lt!149013 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299623 () Bool)

(declare-fun res!157934 () Bool)

(assert (=> b!299623 (=> (not res!157934) (not e!189239))))

(declare-fun arrayContainsKey!0 (array!15131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299623 (= res!157934 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299624 () Bool)

(declare-fun res!157935 () Bool)

(assert (=> b!299624 (=> (not res!157935) (not e!189241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15131 (_ BitVec 32)) Bool)

(assert (=> b!299624 (= res!157935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29718 res!157933) b!299620))

(assert (= (and b!299620 res!157937) b!299621))

(assert (= (and b!299621 res!157936) b!299623))

(assert (= (and b!299623 res!157934) b!299622))

(assert (= (and b!299622 res!157938) b!299624))

(assert (= (and b!299624 res!157935) b!299619))

(declare-fun m!311833 () Bool)

(assert (=> b!299622 m!311833))

(declare-fun m!311835 () Bool)

(assert (=> start!29718 m!311835))

(declare-fun m!311837 () Bool)

(assert (=> start!29718 m!311837))

(declare-fun m!311839 () Bool)

(assert (=> b!299621 m!311839))

(declare-fun m!311841 () Bool)

(assert (=> b!299619 m!311841))

(declare-fun m!311843 () Bool)

(assert (=> b!299619 m!311843))

(declare-fun m!311845 () Bool)

(assert (=> b!299619 m!311845))

(declare-fun m!311847 () Bool)

(assert (=> b!299619 m!311847))

(declare-fun m!311849 () Bool)

(assert (=> b!299619 m!311849))

(declare-fun m!311851 () Bool)

(assert (=> b!299623 m!311851))

(declare-fun m!311853 () Bool)

(assert (=> b!299624 m!311853))

(check-sat (not b!299622) (not b!299621) (not b!299624) (not start!29718) (not b!299623) (not b!299619))
(check-sat)
(get-model)

(declare-fun d!67599 () Bool)

(assert (=> d!67599 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299621 d!67599))

(declare-fun d!67601 () Bool)

(declare-fun res!157961 () Bool)

(declare-fun e!189258 () Bool)

(assert (=> d!67601 (=> res!157961 e!189258)))

(assert (=> d!67601 (= res!157961 (bvsge #b00000000000000000000000000000000 (size!7516 a!3312)))))

(assert (=> d!67601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189258)))

(declare-fun b!299651 () Bool)

(declare-fun e!189259 () Bool)

(declare-fun call!25831 () Bool)

(assert (=> b!299651 (= e!189259 call!25831)))

(declare-fun b!299652 () Bool)

(declare-fun e!189257 () Bool)

(assert (=> b!299652 (= e!189258 e!189257)))

(declare-fun c!48435 () Bool)

(assert (=> b!299652 (= c!48435 (validKeyInArray!0 (select (arr!7164 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299653 () Bool)

(assert (=> b!299653 (= e!189257 e!189259)))

(declare-fun lt!149035 () (_ BitVec 64))

(assert (=> b!299653 (= lt!149035 (select (arr!7164 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9351 0))(
  ( (Unit!9352) )
))
(declare-fun lt!149037 () Unit!9351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15131 (_ BitVec 64) (_ BitVec 32)) Unit!9351)

(assert (=> b!299653 (= lt!149037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149035 #b00000000000000000000000000000000))))

(assert (=> b!299653 (arrayContainsKey!0 a!3312 lt!149035 #b00000000000000000000000000000000)))

(declare-fun lt!149036 () Unit!9351)

(assert (=> b!299653 (= lt!149036 lt!149037)))

(declare-fun res!157962 () Bool)

(assert (=> b!299653 (= res!157962 (= (seekEntryOrOpen!0 (select (arr!7164 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2313 #b00000000000000000000000000000000)))))

(assert (=> b!299653 (=> (not res!157962) (not e!189259))))

(declare-fun bm!25828 () Bool)

(assert (=> bm!25828 (= call!25831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299654 () Bool)

(assert (=> b!299654 (= e!189257 call!25831)))

(assert (= (and d!67601 (not res!157961)) b!299652))

(assert (= (and b!299652 c!48435) b!299653))

(assert (= (and b!299652 (not c!48435)) b!299654))

(assert (= (and b!299653 res!157962) b!299651))

(assert (= (or b!299651 b!299654) bm!25828))

(declare-fun m!311877 () Bool)

(assert (=> b!299652 m!311877))

(assert (=> b!299652 m!311877))

(declare-fun m!311879 () Bool)

(assert (=> b!299652 m!311879))

(assert (=> b!299653 m!311877))

(declare-fun m!311881 () Bool)

(assert (=> b!299653 m!311881))

(declare-fun m!311883 () Bool)

(assert (=> b!299653 m!311883))

(assert (=> b!299653 m!311877))

(declare-fun m!311885 () Bool)

(assert (=> b!299653 m!311885))

(declare-fun m!311887 () Bool)

(assert (=> bm!25828 m!311887))

(assert (=> b!299624 d!67601))

(declare-fun lt!149043 () SeekEntryResult!2313)

(declare-fun b!299679 () Bool)

(assert (=> b!299679 (and (bvsge (index!11430 lt!149043) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149043) (size!7516 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)))))))

(declare-fun res!157975 () Bool)

(assert (=> b!299679 (= res!157975 (= (select (arr!7164 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312))) (index!11430 lt!149043)) k0!2524))))

(declare-fun e!189279 () Bool)

(assert (=> b!299679 (=> res!157975 e!189279)))

(declare-fun e!189280 () Bool)

(assert (=> b!299679 (= e!189280 e!189279)))

(declare-fun e!189278 () SeekEntryResult!2313)

(declare-fun b!299680 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299680 (= e!189278 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149011 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)) mask!3809))))

(declare-fun b!299681 () Bool)

(declare-fun e!189276 () Bool)

(assert (=> b!299681 (= e!189276 (bvsge (x!29673 lt!149043) #b01111111111111111111111111111110))))

(declare-fun b!299682 () Bool)

(assert (=> b!299682 (and (bvsge (index!11430 lt!149043) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149043) (size!7516 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)))))))

(assert (=> b!299682 (= e!189279 (= (select (arr!7164 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312))) (index!11430 lt!149043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299683 () Bool)

(declare-fun e!189277 () SeekEntryResult!2313)

(assert (=> b!299683 (= e!189277 (Intermediate!2313 true lt!149011 #b00000000000000000000000000000000))))

(declare-fun b!299685 () Bool)

(assert (=> b!299685 (= e!189276 e!189280)))

(declare-fun res!157977 () Bool)

(assert (=> b!299685 (= res!157977 (and ((_ is Intermediate!2313) lt!149043) (not (undefined!3125 lt!149043)) (bvslt (x!29673 lt!149043) #b01111111111111111111111111111110) (bvsge (x!29673 lt!149043) #b00000000000000000000000000000000) (bvsge (x!29673 lt!149043) #b00000000000000000000000000000000)))))

(assert (=> b!299685 (=> (not res!157977) (not e!189280))))

(declare-fun b!299686 () Bool)

(assert (=> b!299686 (and (bvsge (index!11430 lt!149043) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149043) (size!7516 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)))))))

(declare-fun res!157976 () Bool)

(assert (=> b!299686 (= res!157976 (= (select (arr!7164 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312))) (index!11430 lt!149043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299686 (=> res!157976 e!189279)))

(declare-fun b!299687 () Bool)

(assert (=> b!299687 (= e!189277 e!189278)))

(declare-fun c!48442 () Bool)

(declare-fun lt!149042 () (_ BitVec 64))

(assert (=> b!299687 (= c!48442 (or (= lt!149042 k0!2524) (= (bvadd lt!149042 lt!149042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67603 () Bool)

(assert (=> d!67603 e!189276))

(declare-fun c!48443 () Bool)

(assert (=> d!67603 (= c!48443 (and ((_ is Intermediate!2313) lt!149043) (undefined!3125 lt!149043)))))

(assert (=> d!67603 (= lt!149043 e!189277)))

(declare-fun c!48444 () Bool)

(assert (=> d!67603 (= c!48444 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67603 (= lt!149042 (select (arr!7164 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312))) lt!149011))))

(assert (=> d!67603 (validMask!0 mask!3809)))

(assert (=> d!67603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149011 k0!2524 (array!15132 (store (arr!7164 a!3312) i!1256 k0!2524) (size!7516 a!3312)) mask!3809) lt!149043)))

(declare-fun b!299684 () Bool)

(assert (=> b!299684 (= e!189278 (Intermediate!2313 false lt!149011 #b00000000000000000000000000000000))))

(assert (= (and d!67603 c!48444) b!299683))

(assert (= (and d!67603 (not c!48444)) b!299687))

(assert (= (and b!299687 c!48442) b!299684))

(assert (= (and b!299687 (not c!48442)) b!299680))

(assert (= (and d!67603 c!48443) b!299681))

(assert (= (and d!67603 (not c!48443)) b!299685))

(assert (= (and b!299685 res!157977) b!299679))

(assert (= (and b!299679 (not res!157975)) b!299686))

(assert (= (and b!299686 (not res!157976)) b!299682))

(declare-fun m!311893 () Bool)

(assert (=> b!299679 m!311893))

(assert (=> b!299682 m!311893))

(assert (=> b!299686 m!311893))

(declare-fun m!311895 () Bool)

(assert (=> b!299680 m!311895))

(assert (=> b!299680 m!311895))

(declare-fun m!311897 () Bool)

(assert (=> b!299680 m!311897))

(declare-fun m!311899 () Bool)

(assert (=> d!67603 m!311899))

(assert (=> d!67603 m!311835))

(assert (=> b!299619 d!67603))

(declare-fun b!299688 () Bool)

(declare-fun lt!149045 () SeekEntryResult!2313)

(assert (=> b!299688 (and (bvsge (index!11430 lt!149045) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149045) (size!7516 a!3312)))))

(declare-fun res!157978 () Bool)

(assert (=> b!299688 (= res!157978 (= (select (arr!7164 a!3312) (index!11430 lt!149045)) k0!2524))))

(declare-fun e!189284 () Bool)

(assert (=> b!299688 (=> res!157978 e!189284)))

(declare-fun e!189285 () Bool)

(assert (=> b!299688 (= e!189285 e!189284)))

(declare-fun e!189283 () SeekEntryResult!2313)

(declare-fun b!299689 () Bool)

(assert (=> b!299689 (= e!189283 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149011 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299690 () Bool)

(declare-fun e!189281 () Bool)

(assert (=> b!299690 (= e!189281 (bvsge (x!29673 lt!149045) #b01111111111111111111111111111110))))

(declare-fun b!299691 () Bool)

(assert (=> b!299691 (and (bvsge (index!11430 lt!149045) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149045) (size!7516 a!3312)))))

(assert (=> b!299691 (= e!189284 (= (select (arr!7164 a!3312) (index!11430 lt!149045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299692 () Bool)

(declare-fun e!189282 () SeekEntryResult!2313)

(assert (=> b!299692 (= e!189282 (Intermediate!2313 true lt!149011 #b00000000000000000000000000000000))))

(declare-fun b!299694 () Bool)

(assert (=> b!299694 (= e!189281 e!189285)))

(declare-fun res!157980 () Bool)

(assert (=> b!299694 (= res!157980 (and ((_ is Intermediate!2313) lt!149045) (not (undefined!3125 lt!149045)) (bvslt (x!29673 lt!149045) #b01111111111111111111111111111110) (bvsge (x!29673 lt!149045) #b00000000000000000000000000000000) (bvsge (x!29673 lt!149045) #b00000000000000000000000000000000)))))

(assert (=> b!299694 (=> (not res!157980) (not e!189285))))

(declare-fun b!299695 () Bool)

(assert (=> b!299695 (and (bvsge (index!11430 lt!149045) #b00000000000000000000000000000000) (bvslt (index!11430 lt!149045) (size!7516 a!3312)))))

(declare-fun res!157979 () Bool)

(assert (=> b!299695 (= res!157979 (= (select (arr!7164 a!3312) (index!11430 lt!149045)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299695 (=> res!157979 e!189284)))

(declare-fun b!299696 () Bool)

(assert (=> b!299696 (= e!189282 e!189283)))

(declare-fun c!48445 () Bool)

(declare-fun lt!149044 () (_ BitVec 64))

(assert (=> b!299696 (= c!48445 (or (= lt!149044 k0!2524) (= (bvadd lt!149044 lt!149044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67613 () Bool)

(assert (=> d!67613 e!189281))

(declare-fun c!48446 () Bool)

(assert (=> d!67613 (= c!48446 (and ((_ is Intermediate!2313) lt!149045) (undefined!3125 lt!149045)))))

(assert (=> d!67613 (= lt!149045 e!189282)))

(declare-fun c!48447 () Bool)

(assert (=> d!67613 (= c!48447 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67613 (= lt!149044 (select (arr!7164 a!3312) lt!149011))))

(assert (=> d!67613 (validMask!0 mask!3809)))

(assert (=> d!67613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149011 k0!2524 a!3312 mask!3809) lt!149045)))

(declare-fun b!299693 () Bool)

(assert (=> b!299693 (= e!189283 (Intermediate!2313 false lt!149011 #b00000000000000000000000000000000))))

(assert (= (and d!67613 c!48447) b!299692))

(assert (= (and d!67613 (not c!48447)) b!299696))

(assert (= (and b!299696 c!48445) b!299693))

(assert (= (and b!299696 (not c!48445)) b!299689))

(assert (= (and d!67613 c!48446) b!299690))

(assert (= (and d!67613 (not c!48446)) b!299694))

(assert (= (and b!299694 res!157980) b!299688))

(assert (= (and b!299688 (not res!157978)) b!299695))

(assert (= (and b!299695 (not res!157979)) b!299691))

(declare-fun m!311901 () Bool)

(assert (=> b!299688 m!311901))

(assert (=> b!299691 m!311901))

(assert (=> b!299695 m!311901))

(assert (=> b!299689 m!311895))

(assert (=> b!299689 m!311895))

(declare-fun m!311903 () Bool)

(assert (=> b!299689 m!311903))

(declare-fun m!311905 () Bool)

(assert (=> d!67613 m!311905))

(assert (=> d!67613 m!311835))

(assert (=> b!299619 d!67613))

(declare-fun d!67615 () Bool)

(declare-fun lt!149051 () (_ BitVec 32))

(declare-fun lt!149050 () (_ BitVec 32))

(assert (=> d!67615 (= lt!149051 (bvmul (bvxor lt!149050 (bvlshr lt!149050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67615 (= lt!149050 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67615 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157981 (let ((h!5316 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29676 (bvmul (bvxor h!5316 (bvlshr h!5316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29676 (bvlshr x!29676 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157981 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157981 #b00000000000000000000000000000000))))))

(assert (=> d!67615 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149051 (bvlshr lt!149051 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299619 d!67615))

(declare-fun d!67617 () Bool)

(assert (=> d!67617 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29718 d!67617))

(declare-fun d!67623 () Bool)

(assert (=> d!67623 (= (array_inv!5127 a!3312) (bvsge (size!7516 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29718 d!67623))

(declare-fun d!67627 () Bool)

(declare-fun res!157998 () Bool)

(declare-fun e!189314 () Bool)

(assert (=> d!67627 (=> res!157998 e!189314)))

(assert (=> d!67627 (= res!157998 (= (select (arr!7164 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67627 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189314)))

(declare-fun b!299737 () Bool)

(declare-fun e!189315 () Bool)

(assert (=> b!299737 (= e!189314 e!189315)))

(declare-fun res!157999 () Bool)

(assert (=> b!299737 (=> (not res!157999) (not e!189315))))

(assert (=> b!299737 (= res!157999 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7516 a!3312)))))

(declare-fun b!299738 () Bool)

(assert (=> b!299738 (= e!189315 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67627 (not res!157998)) b!299737))

(assert (= (and b!299737 res!157999) b!299738))

(assert (=> d!67627 m!311877))

(declare-fun m!311933 () Bool)

(assert (=> b!299738 m!311933))

(assert (=> b!299623 d!67627))

(declare-fun b!299775 () Bool)

(declare-fun e!189339 () SeekEntryResult!2313)

(declare-fun e!189338 () SeekEntryResult!2313)

(assert (=> b!299775 (= e!189339 e!189338)))

(declare-fun lt!149091 () (_ BitVec 64))

(declare-fun lt!149092 () SeekEntryResult!2313)

(assert (=> b!299775 (= lt!149091 (select (arr!7164 a!3312) (index!11430 lt!149092)))))

(declare-fun c!48476 () Bool)

(assert (=> b!299775 (= c!48476 (= lt!149091 k0!2524))))

(declare-fun b!299776 () Bool)

(assert (=> b!299776 (= e!189339 Undefined!2313)))

(declare-fun b!299777 () Bool)

(declare-fun e!189337 () SeekEntryResult!2313)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15131 (_ BitVec 32)) SeekEntryResult!2313)

(assert (=> b!299777 (= e!189337 (seekKeyOrZeroReturnVacant!0 (x!29673 lt!149092) (index!11430 lt!149092) (index!11430 lt!149092) k0!2524 a!3312 mask!3809))))

(declare-fun b!299778 () Bool)

(declare-fun c!48477 () Bool)

(assert (=> b!299778 (= c!48477 (= lt!149091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299778 (= e!189338 e!189337)))

(declare-fun d!67629 () Bool)

(declare-fun lt!149093 () SeekEntryResult!2313)

(assert (=> d!67629 (and (or ((_ is Undefined!2313) lt!149093) (not ((_ is Found!2313) lt!149093)) (and (bvsge (index!11429 lt!149093) #b00000000000000000000000000000000) (bvslt (index!11429 lt!149093) (size!7516 a!3312)))) (or ((_ is Undefined!2313) lt!149093) ((_ is Found!2313) lt!149093) (not ((_ is MissingZero!2313) lt!149093)) (and (bvsge (index!11428 lt!149093) #b00000000000000000000000000000000) (bvslt (index!11428 lt!149093) (size!7516 a!3312)))) (or ((_ is Undefined!2313) lt!149093) ((_ is Found!2313) lt!149093) ((_ is MissingZero!2313) lt!149093) (not ((_ is MissingVacant!2313) lt!149093)) (and (bvsge (index!11431 lt!149093) #b00000000000000000000000000000000) (bvslt (index!11431 lt!149093) (size!7516 a!3312)))) (or ((_ is Undefined!2313) lt!149093) (ite ((_ is Found!2313) lt!149093) (= (select (arr!7164 a!3312) (index!11429 lt!149093)) k0!2524) (ite ((_ is MissingZero!2313) lt!149093) (= (select (arr!7164 a!3312) (index!11428 lt!149093)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2313) lt!149093) (= (select (arr!7164 a!3312) (index!11431 lt!149093)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67629 (= lt!149093 e!189339)))

(declare-fun c!48475 () Bool)

(assert (=> d!67629 (= c!48475 (and ((_ is Intermediate!2313) lt!149092) (undefined!3125 lt!149092)))))

(assert (=> d!67629 (= lt!149092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67629 (validMask!0 mask!3809)))

(assert (=> d!67629 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149093)))

(declare-fun b!299779 () Bool)

(assert (=> b!299779 (= e!189337 (MissingZero!2313 (index!11430 lt!149092)))))

(declare-fun b!299780 () Bool)

(assert (=> b!299780 (= e!189338 (Found!2313 (index!11430 lt!149092)))))

(assert (= (and d!67629 c!48475) b!299776))

(assert (= (and d!67629 (not c!48475)) b!299775))

(assert (= (and b!299775 c!48476) b!299780))

(assert (= (and b!299775 (not c!48476)) b!299778))

(assert (= (and b!299778 c!48477) b!299779))

(assert (= (and b!299778 (not c!48477)) b!299777))

(declare-fun m!311945 () Bool)

(assert (=> b!299775 m!311945))

(declare-fun m!311947 () Bool)

(assert (=> b!299777 m!311947))

(assert (=> d!67629 m!311835))

(declare-fun m!311949 () Bool)

(assert (=> d!67629 m!311949))

(declare-fun m!311951 () Bool)

(assert (=> d!67629 m!311951))

(assert (=> d!67629 m!311849))

(declare-fun m!311953 () Bool)

(assert (=> d!67629 m!311953))

(declare-fun m!311955 () Bool)

(assert (=> d!67629 m!311955))

(assert (=> d!67629 m!311849))

(assert (=> b!299622 d!67629))

(check-sat (not d!67629) (not bm!25828) (not b!299653) (not b!299680) (not d!67613) (not b!299652) (not b!299689) (not d!67603) (not b!299777) (not b!299738))
(check-sat)
