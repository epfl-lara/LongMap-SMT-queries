; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30012 () Bool)

(assert start!30012)

(declare-fun b!301027 () Bool)

(declare-fun res!158927 () Bool)

(declare-fun e!189994 () Bool)

(assert (=> b!301027 (=> (not res!158927) (not e!189994))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301027 (= res!158927 (validKeyInArray!0 k0!2441))))

(declare-fun b!301028 () Bool)

(declare-fun res!158925 () Bool)

(assert (=> b!301028 (=> (not res!158925) (not e!189994))))

(declare-datatypes ((array!15239 0))(
  ( (array!15240 (arr!7212 (Array (_ BitVec 32) (_ BitVec 64))) (size!7565 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15239)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301028 (= res!158925 (and (= (size!7565 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7565 a!3293))))))

(declare-fun b!301029 () Bool)

(assert (=> b!301029 (= e!189994 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsgt mask!3709 #b00111111111111111111111111111111)))))

(declare-fun b!301030 () Bool)

(declare-fun res!158926 () Bool)

(assert (=> b!301030 (=> (not res!158926) (not e!189994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15239 (_ BitVec 32)) Bool)

(assert (=> b!301030 (= res!158926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301031 () Bool)

(declare-fun res!158928 () Bool)

(assert (=> b!301031 (=> (not res!158928) (not e!189994))))

(declare-fun arrayContainsKey!0 (array!15239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301031 (= res!158928 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301032 () Bool)

(declare-fun res!158924 () Bool)

(assert (=> b!301032 (=> (not res!158924) (not e!189994))))

(declare-datatypes ((SeekEntryResult!2351 0))(
  ( (MissingZero!2351 (index!11580 (_ BitVec 32))) (Found!2351 (index!11581 (_ BitVec 32))) (Intermediate!2351 (undefined!3163 Bool) (index!11582 (_ BitVec 32)) (x!29874 (_ BitVec 32))) (Undefined!2351) (MissingVacant!2351 (index!11583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15239 (_ BitVec 32)) SeekEntryResult!2351)

(assert (=> b!301032 (= res!158924 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2351 i!1240)))))

(declare-fun res!158923 () Bool)

(assert (=> start!30012 (=> (not res!158923) (not e!189994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30012 (= res!158923 (validMask!0 mask!3709))))

(assert (=> start!30012 e!189994))

(assert (=> start!30012 true))

(declare-fun array_inv!5184 (array!15239) Bool)

(assert (=> start!30012 (array_inv!5184 a!3293)))

(assert (= (and start!30012 res!158923) b!301028))

(assert (= (and b!301028 res!158925) b!301027))

(assert (= (and b!301027 res!158927) b!301031))

(assert (= (and b!301031 res!158928) b!301032))

(assert (= (and b!301032 res!158924) b!301030))

(assert (= (and b!301030 res!158926) b!301029))

(declare-fun m!312385 () Bool)

(assert (=> b!301030 m!312385))

(declare-fun m!312387 () Bool)

(assert (=> b!301031 m!312387))

(declare-fun m!312389 () Bool)

(assert (=> b!301032 m!312389))

(declare-fun m!312391 () Bool)

(assert (=> b!301027 m!312391))

(declare-fun m!312393 () Bool)

(assert (=> start!30012 m!312393))

(declare-fun m!312395 () Bool)

(assert (=> start!30012 m!312395))

(check-sat (not b!301030) (not b!301031) (not start!30012) (not b!301027) (not b!301032))
(check-sat)
(get-model)

(declare-fun b!301083 () Bool)

(declare-fun e!190020 () Bool)

(declare-fun e!190022 () Bool)

(assert (=> b!301083 (= e!190020 e!190022)))

(declare-fun c!48650 () Bool)

(assert (=> b!301083 (= c!48650 (validKeyInArray!0 (select (arr!7212 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25838 () Bool)

(declare-fun call!25841 () Bool)

(assert (=> bm!25838 (= call!25841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301084 () Bool)

(declare-fun e!190021 () Bool)

(assert (=> b!301084 (= e!190022 e!190021)))

(declare-fun lt!149564 () (_ BitVec 64))

(assert (=> b!301084 (= lt!149564 (select (arr!7212 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9333 0))(
  ( (Unit!9334) )
))
(declare-fun lt!149562 () Unit!9333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15239 (_ BitVec 64) (_ BitVec 32)) Unit!9333)

(assert (=> b!301084 (= lt!149562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149564 #b00000000000000000000000000000000))))

(assert (=> b!301084 (arrayContainsKey!0 a!3293 lt!149564 #b00000000000000000000000000000000)))

(declare-fun lt!149563 () Unit!9333)

(assert (=> b!301084 (= lt!149563 lt!149562)))

(declare-fun res!158976 () Bool)

(assert (=> b!301084 (= res!158976 (= (seekEntryOrOpen!0 (select (arr!7212 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2351 #b00000000000000000000000000000000)))))

(assert (=> b!301084 (=> (not res!158976) (not e!190021))))

(declare-fun b!301085 () Bool)

(assert (=> b!301085 (= e!190022 call!25841)))

(declare-fun d!67655 () Bool)

(declare-fun res!158975 () Bool)

(assert (=> d!67655 (=> res!158975 e!190020)))

(assert (=> d!67655 (= res!158975 (bvsge #b00000000000000000000000000000000 (size!7565 a!3293)))))

(assert (=> d!67655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190020)))

(declare-fun b!301086 () Bool)

(assert (=> b!301086 (= e!190021 call!25841)))

(assert (= (and d!67655 (not res!158975)) b!301083))

(assert (= (and b!301083 c!48650) b!301084))

(assert (= (and b!301083 (not c!48650)) b!301085))

(assert (= (and b!301084 res!158976) b!301086))

(assert (= (or b!301086 b!301085) bm!25838))

(declare-fun m!312425 () Bool)

(assert (=> b!301083 m!312425))

(assert (=> b!301083 m!312425))

(declare-fun m!312427 () Bool)

(assert (=> b!301083 m!312427))

(declare-fun m!312429 () Bool)

(assert (=> bm!25838 m!312429))

(assert (=> b!301084 m!312425))

(declare-fun m!312431 () Bool)

(assert (=> b!301084 m!312431))

(declare-fun m!312433 () Bool)

(assert (=> b!301084 m!312433))

(assert (=> b!301084 m!312425))

(declare-fun m!312435 () Bool)

(assert (=> b!301084 m!312435))

(assert (=> b!301030 d!67655))

(declare-fun d!67663 () Bool)

(declare-fun res!158981 () Bool)

(declare-fun e!190027 () Bool)

(assert (=> d!67663 (=> res!158981 e!190027)))

(assert (=> d!67663 (= res!158981 (= (select (arr!7212 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67663 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190027)))

(declare-fun b!301091 () Bool)

(declare-fun e!190028 () Bool)

(assert (=> b!301091 (= e!190027 e!190028)))

(declare-fun res!158982 () Bool)

(assert (=> b!301091 (=> (not res!158982) (not e!190028))))

(assert (=> b!301091 (= res!158982 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7565 a!3293)))))

(declare-fun b!301092 () Bool)

(assert (=> b!301092 (= e!190028 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67663 (not res!158981)) b!301091))

(assert (= (and b!301091 res!158982) b!301092))

(assert (=> d!67663 m!312425))

(declare-fun m!312437 () Bool)

(assert (=> b!301092 m!312437))

(assert (=> b!301031 d!67663))

(declare-fun d!67665 () Bool)

(assert (=> d!67665 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30012 d!67665))

(declare-fun d!67669 () Bool)

(assert (=> d!67669 (= (array_inv!5184 a!3293) (bvsge (size!7565 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30012 d!67669))

(declare-fun b!301153 () Bool)

(declare-fun e!190064 () SeekEntryResult!2351)

(declare-fun lt!149598 () SeekEntryResult!2351)

(assert (=> b!301153 (= e!190064 (MissingZero!2351 (index!11582 lt!149598)))))

(declare-fun b!301154 () Bool)

(declare-fun e!190063 () SeekEntryResult!2351)

(assert (=> b!301154 (= e!190063 Undefined!2351)))

(declare-fun b!301155 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15239 (_ BitVec 32)) SeekEntryResult!2351)

(assert (=> b!301155 (= e!190064 (seekKeyOrZeroReturnVacant!0 (x!29874 lt!149598) (index!11582 lt!149598) (index!11582 lt!149598) k0!2441 a!3293 mask!3709))))

(declare-fun d!67671 () Bool)

(declare-fun lt!149599 () SeekEntryResult!2351)

(get-info :version)

(assert (=> d!67671 (and (or ((_ is Undefined!2351) lt!149599) (not ((_ is Found!2351) lt!149599)) (and (bvsge (index!11581 lt!149599) #b00000000000000000000000000000000) (bvslt (index!11581 lt!149599) (size!7565 a!3293)))) (or ((_ is Undefined!2351) lt!149599) ((_ is Found!2351) lt!149599) (not ((_ is MissingZero!2351) lt!149599)) (and (bvsge (index!11580 lt!149599) #b00000000000000000000000000000000) (bvslt (index!11580 lt!149599) (size!7565 a!3293)))) (or ((_ is Undefined!2351) lt!149599) ((_ is Found!2351) lt!149599) ((_ is MissingZero!2351) lt!149599) (not ((_ is MissingVacant!2351) lt!149599)) (and (bvsge (index!11583 lt!149599) #b00000000000000000000000000000000) (bvslt (index!11583 lt!149599) (size!7565 a!3293)))) (or ((_ is Undefined!2351) lt!149599) (ite ((_ is Found!2351) lt!149599) (= (select (arr!7212 a!3293) (index!11581 lt!149599)) k0!2441) (ite ((_ is MissingZero!2351) lt!149599) (= (select (arr!7212 a!3293) (index!11580 lt!149599)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2351) lt!149599) (= (select (arr!7212 a!3293) (index!11583 lt!149599)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67671 (= lt!149599 e!190063)))

(declare-fun c!48679 () Bool)

(assert (=> d!67671 (= c!48679 (and ((_ is Intermediate!2351) lt!149598) (undefined!3163 lt!149598)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15239 (_ BitVec 32)) SeekEntryResult!2351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67671 (= lt!149598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67671 (validMask!0 mask!3709)))

(assert (=> d!67671 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149599)))

(declare-fun b!301156 () Bool)

(declare-fun c!48680 () Bool)

(declare-fun lt!149600 () (_ BitVec 64))

(assert (=> b!301156 (= c!48680 (= lt!149600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190062 () SeekEntryResult!2351)

(assert (=> b!301156 (= e!190062 e!190064)))

(declare-fun b!301157 () Bool)

(assert (=> b!301157 (= e!190062 (Found!2351 (index!11582 lt!149598)))))

(declare-fun b!301158 () Bool)

(assert (=> b!301158 (= e!190063 e!190062)))

(assert (=> b!301158 (= lt!149600 (select (arr!7212 a!3293) (index!11582 lt!149598)))))

(declare-fun c!48678 () Bool)

(assert (=> b!301158 (= c!48678 (= lt!149600 k0!2441))))

(assert (= (and d!67671 c!48679) b!301154))

(assert (= (and d!67671 (not c!48679)) b!301158))

(assert (= (and b!301158 c!48678) b!301157))

(assert (= (and b!301158 (not c!48678)) b!301156))

(assert (= (and b!301156 c!48680) b!301153))

(assert (= (and b!301156 (not c!48680)) b!301155))

(declare-fun m!312477 () Bool)

(assert (=> b!301155 m!312477))

(declare-fun m!312479 () Bool)

(assert (=> d!67671 m!312479))

(assert (=> d!67671 m!312393))

(declare-fun m!312481 () Bool)

(assert (=> d!67671 m!312481))

(declare-fun m!312483 () Bool)

(assert (=> d!67671 m!312483))

(declare-fun m!312485 () Bool)

(assert (=> d!67671 m!312485))

(declare-fun m!312487 () Bool)

(assert (=> d!67671 m!312487))

(assert (=> d!67671 m!312485))

(declare-fun m!312489 () Bool)

(assert (=> b!301158 m!312489))

(assert (=> b!301032 d!67671))

(declare-fun d!67681 () Bool)

(assert (=> d!67681 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301027 d!67681))

(check-sat (not b!301083) (not b!301155) (not b!301084) (not d!67671) (not b!301092) (not bm!25838))
(check-sat)
