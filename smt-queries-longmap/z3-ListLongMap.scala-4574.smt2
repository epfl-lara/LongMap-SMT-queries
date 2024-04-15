; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63760 () Bool)

(assert start!63760)

(declare-fun b!717241 () Bool)

(declare-fun res!480098 () Bool)

(declare-fun e!402670 () Bool)

(assert (=> b!717241 (=> (not res!480098) (not e!402670))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717241 (= res!480098 (validKeyInArray!0 k0!2102))))

(declare-fun b!717242 () Bool)

(declare-fun e!402668 () Bool)

(declare-datatypes ((List!13492 0))(
  ( (Nil!13489) (Cons!13488 (h!14533 (_ BitVec 64)) (t!19798 List!13492)) )
))
(declare-fun noDuplicate!1283 (List!13492) Bool)

(assert (=> b!717242 (= e!402668 (not (noDuplicate!1283 Nil!13489)))))

(declare-fun b!717243 () Bool)

(declare-fun res!480100 () Bool)

(assert (=> b!717243 (=> (not res!480100) (not e!402670))))

(declare-datatypes ((array!40638 0))(
  ( (array!40639 (arr!19451 (Array (_ BitVec 32) (_ BitVec 64))) (size!19872 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40638)

(declare-fun arrayContainsKey!0 (array!40638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717243 (= res!480100 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480101 () Bool)

(assert (=> start!63760 (=> (not res!480101) (not e!402670))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63760 (= res!480101 (validMask!0 mask!3328))))

(assert (=> start!63760 e!402670))

(declare-fun array_inv!15334 (array!40638) Bool)

(assert (=> start!63760 (array_inv!15334 a!3186)))

(assert (=> start!63760 true))

(declare-fun b!717244 () Bool)

(declare-fun res!480102 () Bool)

(assert (=> b!717244 (=> (not res!480102) (not e!402670))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717244 (= res!480102 (validKeyInArray!0 (select (arr!19451 a!3186) j!159)))))

(declare-fun b!717245 () Bool)

(declare-fun res!480096 () Bool)

(assert (=> b!717245 (=> (not res!480096) (not e!402668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40638 (_ BitVec 32)) Bool)

(assert (=> b!717245 (= res!480096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717246 () Bool)

(assert (=> b!717246 (= e!402670 e!402668)))

(declare-fun res!480095 () Bool)

(assert (=> b!717246 (=> (not res!480095) (not e!402668))))

(declare-datatypes ((SeekEntryResult!7048 0))(
  ( (MissingZero!7048 (index!30560 (_ BitVec 32))) (Found!7048 (index!30561 (_ BitVec 32))) (Intermediate!7048 (undefined!7860 Bool) (index!30562 (_ BitVec 32)) (x!61591 (_ BitVec 32))) (Undefined!7048) (MissingVacant!7048 (index!30563 (_ BitVec 32))) )
))
(declare-fun lt!318863 () SeekEntryResult!7048)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717246 (= res!480095 (or (= lt!318863 (MissingZero!7048 i!1173)) (= lt!318863 (MissingVacant!7048 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40638 (_ BitVec 32)) SeekEntryResult!7048)

(assert (=> b!717246 (= lt!318863 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717247 () Bool)

(declare-fun res!480099 () Bool)

(assert (=> b!717247 (=> (not res!480099) (not e!402670))))

(assert (=> b!717247 (= res!480099 (and (= (size!19872 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19872 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19872 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717248 () Bool)

(declare-fun res!480097 () Bool)

(assert (=> b!717248 (=> (not res!480097) (not e!402668))))

(assert (=> b!717248 (= res!480097 (and (bvsle #b00000000000000000000000000000000 (size!19872 a!3186)) (bvslt (size!19872 a!3186) #b01111111111111111111111111111111)))))

(assert (= (and start!63760 res!480101) b!717247))

(assert (= (and b!717247 res!480099) b!717244))

(assert (= (and b!717244 res!480102) b!717241))

(assert (= (and b!717241 res!480098) b!717243))

(assert (= (and b!717243 res!480100) b!717246))

(assert (= (and b!717246 res!480095) b!717245))

(assert (= (and b!717245 res!480096) b!717248))

(assert (= (and b!717248 res!480097) b!717242))

(declare-fun m!672663 () Bool)

(assert (=> start!63760 m!672663))

(declare-fun m!672665 () Bool)

(assert (=> start!63760 m!672665))

(declare-fun m!672667 () Bool)

(assert (=> b!717246 m!672667))

(declare-fun m!672669 () Bool)

(assert (=> b!717243 m!672669))

(declare-fun m!672671 () Bool)

(assert (=> b!717244 m!672671))

(assert (=> b!717244 m!672671))

(declare-fun m!672673 () Bool)

(assert (=> b!717244 m!672673))

(declare-fun m!672675 () Bool)

(assert (=> b!717242 m!672675))

(declare-fun m!672677 () Bool)

(assert (=> b!717245 m!672677))

(declare-fun m!672679 () Bool)

(assert (=> b!717241 m!672679))

(check-sat (not b!717243) (not b!717244) (not b!717241) (not b!717242) (not b!717245) (not b!717246) (not start!63760))
(check-sat)
(get-model)

(declare-fun b!717315 () Bool)

(declare-fun e!402702 () SeekEntryResult!7048)

(assert (=> b!717315 (= e!402702 Undefined!7048)))

(declare-fun b!717316 () Bool)

(declare-fun e!402701 () SeekEntryResult!7048)

(assert (=> b!717316 (= e!402702 e!402701)))

(declare-fun lt!318876 () (_ BitVec 64))

(declare-fun lt!318878 () SeekEntryResult!7048)

(assert (=> b!717316 (= lt!318876 (select (arr!19451 a!3186) (index!30562 lt!318878)))))

(declare-fun c!78947 () Bool)

(assert (=> b!717316 (= c!78947 (= lt!318876 k0!2102))))

(declare-fun d!98655 () Bool)

(declare-fun lt!318877 () SeekEntryResult!7048)

(get-info :version)

(assert (=> d!98655 (and (or ((_ is Undefined!7048) lt!318877) (not ((_ is Found!7048) lt!318877)) (and (bvsge (index!30561 lt!318877) #b00000000000000000000000000000000) (bvslt (index!30561 lt!318877) (size!19872 a!3186)))) (or ((_ is Undefined!7048) lt!318877) ((_ is Found!7048) lt!318877) (not ((_ is MissingZero!7048) lt!318877)) (and (bvsge (index!30560 lt!318877) #b00000000000000000000000000000000) (bvslt (index!30560 lt!318877) (size!19872 a!3186)))) (or ((_ is Undefined!7048) lt!318877) ((_ is Found!7048) lt!318877) ((_ is MissingZero!7048) lt!318877) (not ((_ is MissingVacant!7048) lt!318877)) (and (bvsge (index!30563 lt!318877) #b00000000000000000000000000000000) (bvslt (index!30563 lt!318877) (size!19872 a!3186)))) (or ((_ is Undefined!7048) lt!318877) (ite ((_ is Found!7048) lt!318877) (= (select (arr!19451 a!3186) (index!30561 lt!318877)) k0!2102) (ite ((_ is MissingZero!7048) lt!318877) (= (select (arr!19451 a!3186) (index!30560 lt!318877)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7048) lt!318877) (= (select (arr!19451 a!3186) (index!30563 lt!318877)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98655 (= lt!318877 e!402702)))

(declare-fun c!78946 () Bool)

(assert (=> d!98655 (= c!78946 (and ((_ is Intermediate!7048) lt!318878) (undefined!7860 lt!318878)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40638 (_ BitVec 32)) SeekEntryResult!7048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98655 (= lt!318878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98655 (validMask!0 mask!3328)))

(assert (=> d!98655 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!318877)))

(declare-fun b!717317 () Bool)

(declare-fun e!402703 () SeekEntryResult!7048)

(assert (=> b!717317 (= e!402703 (MissingZero!7048 (index!30562 lt!318878)))))

(declare-fun b!717318 () Bool)

(declare-fun c!78948 () Bool)

(assert (=> b!717318 (= c!78948 (= lt!318876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717318 (= e!402701 e!402703)))

(declare-fun b!717319 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40638 (_ BitVec 32)) SeekEntryResult!7048)

(assert (=> b!717319 (= e!402703 (seekKeyOrZeroReturnVacant!0 (x!61591 lt!318878) (index!30562 lt!318878) (index!30562 lt!318878) k0!2102 a!3186 mask!3328))))

(declare-fun b!717320 () Bool)

(assert (=> b!717320 (= e!402701 (Found!7048 (index!30562 lt!318878)))))

(assert (= (and d!98655 c!78946) b!717315))

(assert (= (and d!98655 (not c!78946)) b!717316))

(assert (= (and b!717316 c!78947) b!717320))

(assert (= (and b!717316 (not c!78947)) b!717318))

(assert (= (and b!717318 c!78948) b!717317))

(assert (= (and b!717318 (not c!78948)) b!717319))

(declare-fun m!672721 () Bool)

(assert (=> b!717316 m!672721))

(declare-fun m!672723 () Bool)

(assert (=> d!98655 m!672723))

(assert (=> d!98655 m!672723))

(declare-fun m!672725 () Bool)

(assert (=> d!98655 m!672725))

(declare-fun m!672727 () Bool)

(assert (=> d!98655 m!672727))

(declare-fun m!672729 () Bool)

(assert (=> d!98655 m!672729))

(assert (=> d!98655 m!672663))

(declare-fun m!672731 () Bool)

(assert (=> d!98655 m!672731))

(declare-fun m!672733 () Bool)

(assert (=> b!717319 m!672733))

(assert (=> b!717246 d!98655))

(declare-fun d!98669 () Bool)

(assert (=> d!98669 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63760 d!98669))

(declare-fun d!98671 () Bool)

(assert (=> d!98671 (= (array_inv!15334 a!3186) (bvsge (size!19872 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63760 d!98671))

(declare-fun d!98673 () Bool)

(assert (=> d!98673 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717241 d!98673))

(declare-fun b!717359 () Bool)

(declare-fun e!402725 () Bool)

(declare-fun e!402727 () Bool)

(assert (=> b!717359 (= e!402725 e!402727)))

(declare-fun lt!318900 () (_ BitVec 64))

(assert (=> b!717359 (= lt!318900 (select (arr!19451 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24622 0))(
  ( (Unit!24623) )
))
(declare-fun lt!318902 () Unit!24622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40638 (_ BitVec 64) (_ BitVec 32)) Unit!24622)

(assert (=> b!717359 (= lt!318902 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!318900 #b00000000000000000000000000000000))))

(assert (=> b!717359 (arrayContainsKey!0 a!3186 lt!318900 #b00000000000000000000000000000000)))

(declare-fun lt!318901 () Unit!24622)

(assert (=> b!717359 (= lt!318901 lt!318902)))

(declare-fun res!480162 () Bool)

(assert (=> b!717359 (= res!480162 (= (seekEntryOrOpen!0 (select (arr!19451 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7048 #b00000000000000000000000000000000)))))

(assert (=> b!717359 (=> (not res!480162) (not e!402727))))

(declare-fun b!717360 () Bool)

(declare-fun e!402726 () Bool)

(assert (=> b!717360 (= e!402726 e!402725)))

(declare-fun c!78966 () Bool)

(assert (=> b!717360 (= c!78966 (validKeyInArray!0 (select (arr!19451 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717361 () Bool)

(declare-fun call!34672 () Bool)

(assert (=> b!717361 (= e!402727 call!34672)))

(declare-fun bm!34669 () Bool)

(assert (=> bm!34669 (= call!34672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!98675 () Bool)

(declare-fun res!480161 () Bool)

(assert (=> d!98675 (=> res!480161 e!402726)))

(assert (=> d!98675 (= res!480161 (bvsge #b00000000000000000000000000000000 (size!19872 a!3186)))))

(assert (=> d!98675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402726)))

(declare-fun b!717362 () Bool)

(assert (=> b!717362 (= e!402725 call!34672)))

(assert (= (and d!98675 (not res!480161)) b!717360))

(assert (= (and b!717360 c!78966) b!717359))

(assert (= (and b!717360 (not c!78966)) b!717362))

(assert (= (and b!717359 res!480162) b!717361))

(assert (= (or b!717361 b!717362) bm!34669))

(declare-fun m!672749 () Bool)

(assert (=> b!717359 m!672749))

(declare-fun m!672751 () Bool)

(assert (=> b!717359 m!672751))

(declare-fun m!672753 () Bool)

(assert (=> b!717359 m!672753))

(assert (=> b!717359 m!672749))

(declare-fun m!672755 () Bool)

(assert (=> b!717359 m!672755))

(assert (=> b!717360 m!672749))

(assert (=> b!717360 m!672749))

(declare-fun m!672757 () Bool)

(assert (=> b!717360 m!672757))

(declare-fun m!672759 () Bool)

(assert (=> bm!34669 m!672759))

(assert (=> b!717245 d!98675))

(declare-fun d!98679 () Bool)

(declare-fun res!480167 () Bool)

(declare-fun e!402732 () Bool)

(assert (=> d!98679 (=> res!480167 e!402732)))

(assert (=> d!98679 (= res!480167 (= (select (arr!19451 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98679 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!402732)))

(declare-fun b!717367 () Bool)

(declare-fun e!402733 () Bool)

(assert (=> b!717367 (= e!402732 e!402733)))

(declare-fun res!480168 () Bool)

(assert (=> b!717367 (=> (not res!480168) (not e!402733))))

(assert (=> b!717367 (= res!480168 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19872 a!3186)))))

(declare-fun b!717368 () Bool)

(assert (=> b!717368 (= e!402733 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98679 (not res!480167)) b!717367))

(assert (= (and b!717367 res!480168) b!717368))

(assert (=> d!98679 m!672749))

(declare-fun m!672761 () Bool)

(assert (=> b!717368 m!672761))

(assert (=> b!717243 d!98679))

(declare-fun d!98681 () Bool)

(assert (=> d!98681 (= (validKeyInArray!0 (select (arr!19451 a!3186) j!159)) (and (not (= (select (arr!19451 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19451 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717244 d!98681))

(declare-fun d!98683 () Bool)

(declare-fun res!480173 () Bool)

(declare-fun e!402741 () Bool)

(assert (=> d!98683 (=> res!480173 e!402741)))

(assert (=> d!98683 (= res!480173 ((_ is Nil!13489) Nil!13489))))

(assert (=> d!98683 (= (noDuplicate!1283 Nil!13489) e!402741)))

(declare-fun b!717379 () Bool)

(declare-fun e!402742 () Bool)

(assert (=> b!717379 (= e!402741 e!402742)))

(declare-fun res!480174 () Bool)

(assert (=> b!717379 (=> (not res!480174) (not e!402742))))

(declare-fun contains!4014 (List!13492 (_ BitVec 64)) Bool)

(assert (=> b!717379 (= res!480174 (not (contains!4014 (t!19798 Nil!13489) (h!14533 Nil!13489))))))

(declare-fun b!717380 () Bool)

(assert (=> b!717380 (= e!402742 (noDuplicate!1283 (t!19798 Nil!13489)))))

(assert (= (and d!98683 (not res!480173)) b!717379))

(assert (= (and b!717379 res!480174) b!717380))

(declare-fun m!672777 () Bool)

(assert (=> b!717379 m!672777))

(declare-fun m!672779 () Bool)

(assert (=> b!717380 m!672779))

(assert (=> b!717242 d!98683))

(check-sat (not b!717368) (not b!717360) (not b!717319) (not bm!34669) (not b!717359) (not b!717380) (not d!98655) (not b!717379))
(check-sat)
