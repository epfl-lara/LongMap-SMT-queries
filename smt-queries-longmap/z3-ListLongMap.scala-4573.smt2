; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63724 () Bool)

(assert start!63724)

(declare-fun b!717074 () Bool)

(declare-fun res!480001 () Bool)

(declare-fun e!402577 () Bool)

(assert (=> b!717074 (=> (not res!480001) (not e!402577))))

(declare-datatypes ((array!40630 0))(
  ( (array!40631 (arr!19448 (Array (_ BitVec 32) (_ BitVec 64))) (size!19869 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40630)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717074 (= res!480001 (and (= (size!19869 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19869 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19869 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717075 () Bool)

(declare-fun res!480005 () Bool)

(assert (=> b!717075 (=> (not res!480005) (not e!402577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717075 (= res!480005 (validKeyInArray!0 (select (arr!19448 a!3186) j!159)))))

(declare-fun b!717076 () Bool)

(declare-fun res!480000 () Bool)

(assert (=> b!717076 (=> (not res!480000) (not e!402577))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717076 (= res!480000 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717077 () Bool)

(declare-fun e!402576 () Bool)

(assert (=> b!717077 (= e!402576 (and (bvsle #b00000000000000000000000000000000 (size!19869 a!3186)) (bvsge (size!19869 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717078 () Bool)

(assert (=> b!717078 (= e!402577 e!402576)))

(declare-fun res!480006 () Bool)

(assert (=> b!717078 (=> (not res!480006) (not e!402576))))

(declare-datatypes ((SeekEntryResult!7045 0))(
  ( (MissingZero!7045 (index!30548 (_ BitVec 32))) (Found!7045 (index!30549 (_ BitVec 32))) (Intermediate!7045 (undefined!7857 Bool) (index!30550 (_ BitVec 32)) (x!61580 (_ BitVec 32))) (Undefined!7045) (MissingVacant!7045 (index!30551 (_ BitVec 32))) )
))
(declare-fun lt!318800 () SeekEntryResult!7045)

(assert (=> b!717078 (= res!480006 (or (= lt!318800 (MissingZero!7045 i!1173)) (= lt!318800 (MissingVacant!7045 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40630 (_ BitVec 32)) SeekEntryResult!7045)

(assert (=> b!717078 (= lt!318800 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717079 () Bool)

(declare-fun res!480003 () Bool)

(assert (=> b!717079 (=> (not res!480003) (not e!402577))))

(assert (=> b!717079 (= res!480003 (validKeyInArray!0 k0!2102))))

(declare-fun res!480004 () Bool)

(assert (=> start!63724 (=> (not res!480004) (not e!402577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63724 (= res!480004 (validMask!0 mask!3328))))

(assert (=> start!63724 e!402577))

(declare-fun array_inv!15331 (array!40630) Bool)

(assert (=> start!63724 (array_inv!15331 a!3186)))

(assert (=> start!63724 true))

(declare-fun b!717080 () Bool)

(declare-fun res!480002 () Bool)

(assert (=> b!717080 (=> (not res!480002) (not e!402576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40630 (_ BitVec 32)) Bool)

(assert (=> b!717080 (= res!480002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63724 res!480004) b!717074))

(assert (= (and b!717074 res!480001) b!717075))

(assert (= (and b!717075 res!480005) b!717079))

(assert (= (and b!717079 res!480003) b!717076))

(assert (= (and b!717076 res!480000) b!717078))

(assert (= (and b!717078 res!480006) b!717080))

(assert (= (and b!717080 res!480002) b!717077))

(declare-fun m!672543 () Bool)

(assert (=> b!717080 m!672543))

(declare-fun m!672545 () Bool)

(assert (=> b!717079 m!672545))

(declare-fun m!672547 () Bool)

(assert (=> b!717076 m!672547))

(declare-fun m!672549 () Bool)

(assert (=> start!63724 m!672549))

(declare-fun m!672551 () Bool)

(assert (=> start!63724 m!672551))

(declare-fun m!672553 () Bool)

(assert (=> b!717078 m!672553))

(declare-fun m!672555 () Bool)

(assert (=> b!717075 m!672555))

(assert (=> b!717075 m!672555))

(declare-fun m!672557 () Bool)

(assert (=> b!717075 m!672557))

(check-sat (not start!63724) (not b!717079) (not b!717080) (not b!717076) (not b!717078) (not b!717075))
(check-sat)
(get-model)

(declare-fun b!717135 () Bool)

(declare-fun e!402604 () SeekEntryResult!7045)

(assert (=> b!717135 (= e!402604 Undefined!7045)))

(declare-fun b!717136 () Bool)

(declare-fun e!402602 () SeekEntryResult!7045)

(assert (=> b!717136 (= e!402604 e!402602)))

(declare-fun lt!318813 () (_ BitVec 64))

(declare-fun lt!318814 () SeekEntryResult!7045)

(assert (=> b!717136 (= lt!318813 (select (arr!19448 a!3186) (index!30550 lt!318814)))))

(declare-fun c!78912 () Bool)

(assert (=> b!717136 (= c!78912 (= lt!318813 k0!2102))))

(declare-fun d!98619 () Bool)

(declare-fun lt!318815 () SeekEntryResult!7045)

(get-info :version)

(assert (=> d!98619 (and (or ((_ is Undefined!7045) lt!318815) (not ((_ is Found!7045) lt!318815)) (and (bvsge (index!30549 lt!318815) #b00000000000000000000000000000000) (bvslt (index!30549 lt!318815) (size!19869 a!3186)))) (or ((_ is Undefined!7045) lt!318815) ((_ is Found!7045) lt!318815) (not ((_ is MissingZero!7045) lt!318815)) (and (bvsge (index!30548 lt!318815) #b00000000000000000000000000000000) (bvslt (index!30548 lt!318815) (size!19869 a!3186)))) (or ((_ is Undefined!7045) lt!318815) ((_ is Found!7045) lt!318815) ((_ is MissingZero!7045) lt!318815) (not ((_ is MissingVacant!7045) lt!318815)) (and (bvsge (index!30551 lt!318815) #b00000000000000000000000000000000) (bvslt (index!30551 lt!318815) (size!19869 a!3186)))) (or ((_ is Undefined!7045) lt!318815) (ite ((_ is Found!7045) lt!318815) (= (select (arr!19448 a!3186) (index!30549 lt!318815)) k0!2102) (ite ((_ is MissingZero!7045) lt!318815) (= (select (arr!19448 a!3186) (index!30548 lt!318815)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7045) lt!318815) (= (select (arr!19448 a!3186) (index!30551 lt!318815)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98619 (= lt!318815 e!402604)))

(declare-fun c!78911 () Bool)

(assert (=> d!98619 (= c!78911 (and ((_ is Intermediate!7045) lt!318814) (undefined!7857 lt!318814)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40630 (_ BitVec 32)) SeekEntryResult!7045)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98619 (= lt!318814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98619 (validMask!0 mask!3328)))

(assert (=> d!98619 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!318815)))

(declare-fun b!717137 () Bool)

(declare-fun c!78910 () Bool)

(assert (=> b!717137 (= c!78910 (= lt!318813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402603 () SeekEntryResult!7045)

(assert (=> b!717137 (= e!402602 e!402603)))

(declare-fun b!717138 () Bool)

(assert (=> b!717138 (= e!402603 (MissingZero!7045 (index!30550 lt!318814)))))

(declare-fun b!717139 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40630 (_ BitVec 32)) SeekEntryResult!7045)

(assert (=> b!717139 (= e!402603 (seekKeyOrZeroReturnVacant!0 (x!61580 lt!318814) (index!30550 lt!318814) (index!30550 lt!318814) k0!2102 a!3186 mask!3328))))

(declare-fun b!717140 () Bool)

(assert (=> b!717140 (= e!402602 (Found!7045 (index!30550 lt!318814)))))

(assert (= (and d!98619 c!78911) b!717135))

(assert (= (and d!98619 (not c!78911)) b!717136))

(assert (= (and b!717136 c!78912) b!717140))

(assert (= (and b!717136 (not c!78912)) b!717137))

(assert (= (and b!717137 c!78910) b!717138))

(assert (= (and b!717137 (not c!78910)) b!717139))

(declare-fun m!672591 () Bool)

(assert (=> b!717136 m!672591))

(declare-fun m!672593 () Bool)

(assert (=> d!98619 m!672593))

(declare-fun m!672595 () Bool)

(assert (=> d!98619 m!672595))

(assert (=> d!98619 m!672593))

(declare-fun m!672597 () Bool)

(assert (=> d!98619 m!672597))

(declare-fun m!672599 () Bool)

(assert (=> d!98619 m!672599))

(declare-fun m!672601 () Bool)

(assert (=> d!98619 m!672601))

(assert (=> d!98619 m!672549))

(declare-fun m!672603 () Bool)

(assert (=> b!717139 m!672603))

(assert (=> b!717078 d!98619))

(declare-fun d!98629 () Bool)

(declare-fun res!480053 () Bool)

(declare-fun e!402609 () Bool)

(assert (=> d!98629 (=> res!480053 e!402609)))

(assert (=> d!98629 (= res!480053 (= (select (arr!19448 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98629 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!402609)))

(declare-fun b!717145 () Bool)

(declare-fun e!402610 () Bool)

(assert (=> b!717145 (= e!402609 e!402610)))

(declare-fun res!480054 () Bool)

(assert (=> b!717145 (=> (not res!480054) (not e!402610))))

(assert (=> b!717145 (= res!480054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19869 a!3186)))))

(declare-fun b!717146 () Bool)

(assert (=> b!717146 (= e!402610 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98629 (not res!480053)) b!717145))

(assert (= (and b!717145 res!480054) b!717146))

(declare-fun m!672605 () Bool)

(assert (=> d!98629 m!672605))

(declare-fun m!672607 () Bool)

(assert (=> b!717146 m!672607))

(assert (=> b!717076 d!98629))

(declare-fun d!98631 () Bool)

(assert (=> d!98631 (= (validKeyInArray!0 (select (arr!19448 a!3186) j!159)) (and (not (= (select (arr!19448 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19448 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717075 d!98631))

(declare-fun b!717161 () Bool)

(declare-fun e!402619 () Bool)

(declare-fun call!34663 () Bool)

(assert (=> b!717161 (= e!402619 call!34663)))

(declare-fun d!98633 () Bool)

(declare-fun res!480059 () Bool)

(declare-fun e!402621 () Bool)

(assert (=> d!98633 (=> res!480059 e!402621)))

(assert (=> d!98633 (= res!480059 (bvsge #b00000000000000000000000000000000 (size!19869 a!3186)))))

(assert (=> d!98633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402621)))

(declare-fun b!717162 () Bool)

(declare-fun e!402620 () Bool)

(assert (=> b!717162 (= e!402619 e!402620)))

(declare-fun lt!318830 () (_ BitVec 64))

(assert (=> b!717162 (= lt!318830 (select (arr!19448 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24620 0))(
  ( (Unit!24621) )
))
(declare-fun lt!318831 () Unit!24620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40630 (_ BitVec 64) (_ BitVec 32)) Unit!24620)

(assert (=> b!717162 (= lt!318831 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!318830 #b00000000000000000000000000000000))))

(assert (=> b!717162 (arrayContainsKey!0 a!3186 lt!318830 #b00000000000000000000000000000000)))

(declare-fun lt!318832 () Unit!24620)

(assert (=> b!717162 (= lt!318832 lt!318831)))

(declare-fun res!480060 () Bool)

(assert (=> b!717162 (= res!480060 (= (seekEntryOrOpen!0 (select (arr!19448 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7045 #b00000000000000000000000000000000)))))

(assert (=> b!717162 (=> (not res!480060) (not e!402620))))

(declare-fun b!717163 () Bool)

(assert (=> b!717163 (= e!402620 call!34663)))

(declare-fun b!717164 () Bool)

(assert (=> b!717164 (= e!402621 e!402619)))

(declare-fun c!78917 () Bool)

(assert (=> b!717164 (= c!78917 (validKeyInArray!0 (select (arr!19448 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34660 () Bool)

(assert (=> bm!34660 (= call!34663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!98633 (not res!480059)) b!717164))

(assert (= (and b!717164 c!78917) b!717162))

(assert (= (and b!717164 (not c!78917)) b!717161))

(assert (= (and b!717162 res!480060) b!717163))

(assert (= (or b!717163 b!717161) bm!34660))

(assert (=> b!717162 m!672605))

(declare-fun m!672609 () Bool)

(assert (=> b!717162 m!672609))

(declare-fun m!672611 () Bool)

(assert (=> b!717162 m!672611))

(assert (=> b!717162 m!672605))

(declare-fun m!672613 () Bool)

(assert (=> b!717162 m!672613))

(assert (=> b!717164 m!672605))

(assert (=> b!717164 m!672605))

(declare-fun m!672615 () Bool)

(assert (=> b!717164 m!672615))

(declare-fun m!672617 () Bool)

(assert (=> bm!34660 m!672617))

(assert (=> b!717080 d!98633))

(declare-fun d!98635 () Bool)

(assert (=> d!98635 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717079 d!98635))

(declare-fun d!98637 () Bool)

(assert (=> d!98637 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63724 d!98637))

(declare-fun d!98643 () Bool)

(assert (=> d!98643 (= (array_inv!15331 a!3186) (bvsge (size!19869 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63724 d!98643))

(check-sat (not bm!34660) (not b!717164) (not b!717146) (not d!98619) (not b!717162) (not b!717139))
(check-sat)
