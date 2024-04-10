; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63888 () Bool)

(assert start!63888)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40667 0))(
  ( (array!40668 (arr!19462 (Array (_ BitVec 32) (_ BitVec 64))) (size!19883 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40667)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!403119 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!718019 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718019 (= e!403119 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19883 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19883 a!3186)) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!718020 () Bool)

(declare-fun e!403120 () Bool)

(assert (=> b!718020 (= e!403120 e!403119)))

(declare-fun res!480594 () Bool)

(assert (=> b!718020 (=> (not res!480594) (not e!403119))))

(declare-datatypes ((SeekEntryResult!7062 0))(
  ( (MissingZero!7062 (index!30616 (_ BitVec 32))) (Found!7062 (index!30617 (_ BitVec 32))) (Intermediate!7062 (undefined!7874 Bool) (index!30618 (_ BitVec 32)) (x!61634 (_ BitVec 32))) (Undefined!7062) (MissingVacant!7062 (index!30619 (_ BitVec 32))) )
))
(declare-fun lt!319253 () SeekEntryResult!7062)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718020 (= res!480594 (or (= lt!319253 (MissingZero!7062 i!1173)) (= lt!319253 (MissingVacant!7062 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40667 (_ BitVec 32)) SeekEntryResult!7062)

(assert (=> b!718020 (= lt!319253 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718021 () Bool)

(declare-fun res!480596 () Bool)

(assert (=> b!718021 (=> (not res!480596) (not e!403119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40667 (_ BitVec 32)) Bool)

(assert (=> b!718021 (= res!480596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718022 () Bool)

(declare-fun res!480589 () Bool)

(assert (=> b!718022 (=> (not res!480589) (not e!403120))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718022 (= res!480589 (validKeyInArray!0 (select (arr!19462 a!3186) j!159)))))

(declare-fun b!718023 () Bool)

(declare-fun res!480593 () Bool)

(assert (=> b!718023 (=> (not res!480593) (not e!403120))))

(assert (=> b!718023 (= res!480593 (and (= (size!19883 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19883 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19883 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718024 () Bool)

(declare-fun res!480591 () Bool)

(assert (=> b!718024 (=> (not res!480591) (not e!403120))))

(declare-fun arrayContainsKey!0 (array!40667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718024 (= res!480591 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480590 () Bool)

(assert (=> start!63888 (=> (not res!480590) (not e!403120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63888 (= res!480590 (validMask!0 mask!3328))))

(assert (=> start!63888 e!403120))

(assert (=> start!63888 true))

(declare-fun array_inv!15258 (array!40667) Bool)

(assert (=> start!63888 (array_inv!15258 a!3186)))

(declare-fun b!718025 () Bool)

(declare-fun res!480595 () Bool)

(assert (=> b!718025 (=> (not res!480595) (not e!403120))))

(assert (=> b!718025 (= res!480595 (validKeyInArray!0 k0!2102))))

(declare-fun b!718026 () Bool)

(declare-fun res!480592 () Bool)

(assert (=> b!718026 (=> (not res!480592) (not e!403119))))

(declare-datatypes ((List!13464 0))(
  ( (Nil!13461) (Cons!13460 (h!14505 (_ BitVec 64)) (t!19779 List!13464)) )
))
(declare-fun arrayNoDuplicates!0 (array!40667 (_ BitVec 32) List!13464) Bool)

(assert (=> b!718026 (= res!480592 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13461))))

(assert (= (and start!63888 res!480590) b!718023))

(assert (= (and b!718023 res!480593) b!718022))

(assert (= (and b!718022 res!480589) b!718025))

(assert (= (and b!718025 res!480595) b!718024))

(assert (= (and b!718024 res!480591) b!718020))

(assert (= (and b!718020 res!480594) b!718021))

(assert (= (and b!718021 res!480596) b!718026))

(assert (= (and b!718026 res!480592) b!718019))

(declare-fun m!673789 () Bool)

(assert (=> b!718021 m!673789))

(declare-fun m!673791 () Bool)

(assert (=> b!718025 m!673791))

(declare-fun m!673793 () Bool)

(assert (=> b!718022 m!673793))

(assert (=> b!718022 m!673793))

(declare-fun m!673795 () Bool)

(assert (=> b!718022 m!673795))

(declare-fun m!673797 () Bool)

(assert (=> b!718026 m!673797))

(declare-fun m!673799 () Bool)

(assert (=> start!63888 m!673799))

(declare-fun m!673801 () Bool)

(assert (=> start!63888 m!673801))

(declare-fun m!673803 () Bool)

(assert (=> b!718024 m!673803))

(declare-fun m!673805 () Bool)

(assert (=> b!718020 m!673805))

(check-sat (not start!63888) (not b!718025) (not b!718022) (not b!718020) (not b!718026) (not b!718024) (not b!718021))
(check-sat)
(get-model)

(declare-fun d!98957 () Bool)

(declare-fun res!480625 () Bool)

(declare-fun e!403135 () Bool)

(assert (=> d!98957 (=> res!480625 e!403135)))

(assert (=> d!98957 (= res!480625 (= (select (arr!19462 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98957 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403135)))

(declare-fun b!718055 () Bool)

(declare-fun e!403136 () Bool)

(assert (=> b!718055 (= e!403135 e!403136)))

(declare-fun res!480626 () Bool)

(assert (=> b!718055 (=> (not res!480626) (not e!403136))))

(assert (=> b!718055 (= res!480626 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19883 a!3186)))))

(declare-fun b!718056 () Bool)

(assert (=> b!718056 (= e!403136 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98957 (not res!480625)) b!718055))

(assert (= (and b!718055 res!480626) b!718056))

(declare-fun m!673825 () Bool)

(assert (=> d!98957 m!673825))

(declare-fun m!673827 () Bool)

(assert (=> b!718056 m!673827))

(assert (=> b!718024 d!98957))

(declare-fun d!98959 () Bool)

(assert (=> d!98959 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63888 d!98959))

(declare-fun d!98963 () Bool)

(assert (=> d!98963 (= (array_inv!15258 a!3186) (bvsge (size!19883 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63888 d!98963))

(declare-fun b!718092 () Bool)

(declare-fun e!403163 () SeekEntryResult!7062)

(declare-fun e!403161 () SeekEntryResult!7062)

(assert (=> b!718092 (= e!403163 e!403161)))

(declare-fun lt!319269 () (_ BitVec 64))

(declare-fun lt!319270 () SeekEntryResult!7062)

(assert (=> b!718092 (= lt!319269 (select (arr!19462 a!3186) (index!30618 lt!319270)))))

(declare-fun c!79094 () Bool)

(assert (=> b!718092 (= c!79094 (= lt!319269 k0!2102))))

(declare-fun b!718093 () Bool)

(assert (=> b!718093 (= e!403163 Undefined!7062)))

(declare-fun b!718094 () Bool)

(declare-fun e!403162 () SeekEntryResult!7062)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40667 (_ BitVec 32)) SeekEntryResult!7062)

(assert (=> b!718094 (= e!403162 (seekKeyOrZeroReturnVacant!0 (x!61634 lt!319270) (index!30618 lt!319270) (index!30618 lt!319270) k0!2102 a!3186 mask!3328))))

(declare-fun d!98965 () Bool)

(declare-fun lt!319271 () SeekEntryResult!7062)

(get-info :version)

(assert (=> d!98965 (and (or ((_ is Undefined!7062) lt!319271) (not ((_ is Found!7062) lt!319271)) (and (bvsge (index!30617 lt!319271) #b00000000000000000000000000000000) (bvslt (index!30617 lt!319271) (size!19883 a!3186)))) (or ((_ is Undefined!7062) lt!319271) ((_ is Found!7062) lt!319271) (not ((_ is MissingZero!7062) lt!319271)) (and (bvsge (index!30616 lt!319271) #b00000000000000000000000000000000) (bvslt (index!30616 lt!319271) (size!19883 a!3186)))) (or ((_ is Undefined!7062) lt!319271) ((_ is Found!7062) lt!319271) ((_ is MissingZero!7062) lt!319271) (not ((_ is MissingVacant!7062) lt!319271)) (and (bvsge (index!30619 lt!319271) #b00000000000000000000000000000000) (bvslt (index!30619 lt!319271) (size!19883 a!3186)))) (or ((_ is Undefined!7062) lt!319271) (ite ((_ is Found!7062) lt!319271) (= (select (arr!19462 a!3186) (index!30617 lt!319271)) k0!2102) (ite ((_ is MissingZero!7062) lt!319271) (= (select (arr!19462 a!3186) (index!30616 lt!319271)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7062) lt!319271) (= (select (arr!19462 a!3186) (index!30619 lt!319271)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98965 (= lt!319271 e!403163)))

(declare-fun c!79095 () Bool)

(assert (=> d!98965 (= c!79095 (and ((_ is Intermediate!7062) lt!319270) (undefined!7874 lt!319270)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40667 (_ BitVec 32)) SeekEntryResult!7062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98965 (= lt!319270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98965 (validMask!0 mask!3328)))

(assert (=> d!98965 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319271)))

(declare-fun b!718095 () Bool)

(assert (=> b!718095 (= e!403161 (Found!7062 (index!30618 lt!319270)))))

(declare-fun b!718096 () Bool)

(declare-fun c!79093 () Bool)

(assert (=> b!718096 (= c!79093 (= lt!319269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!718096 (= e!403161 e!403162)))

(declare-fun b!718097 () Bool)

(assert (=> b!718097 (= e!403162 (MissingZero!7062 (index!30618 lt!319270)))))

(assert (= (and d!98965 c!79095) b!718093))

(assert (= (and d!98965 (not c!79095)) b!718092))

(assert (= (and b!718092 c!79094) b!718095))

(assert (= (and b!718092 (not c!79094)) b!718096))

(assert (= (and b!718096 c!79093) b!718097))

(assert (= (and b!718096 (not c!79093)) b!718094))

(declare-fun m!673837 () Bool)

(assert (=> b!718092 m!673837))

(declare-fun m!673839 () Bool)

(assert (=> b!718094 m!673839))

(declare-fun m!673841 () Bool)

(assert (=> d!98965 m!673841))

(declare-fun m!673843 () Bool)

(assert (=> d!98965 m!673843))

(declare-fun m!673845 () Bool)

(assert (=> d!98965 m!673845))

(declare-fun m!673847 () Bool)

(assert (=> d!98965 m!673847))

(declare-fun m!673849 () Bool)

(assert (=> d!98965 m!673849))

(assert (=> d!98965 m!673845))

(assert (=> d!98965 m!673799))

(assert (=> b!718020 d!98965))

(declare-fun d!98985 () Bool)

(assert (=> d!98985 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718025 d!98985))

(declare-fun b!718130 () Bool)

(declare-fun e!403191 () Bool)

(declare-fun call!34725 () Bool)

(assert (=> b!718130 (= e!403191 call!34725)))

(declare-fun b!718131 () Bool)

(assert (=> b!718131 (= e!403191 call!34725)))

(declare-fun d!98987 () Bool)

(declare-fun res!480660 () Bool)

(declare-fun e!403190 () Bool)

(assert (=> d!98987 (=> res!480660 e!403190)))

(assert (=> d!98987 (= res!480660 (bvsge #b00000000000000000000000000000000 (size!19883 a!3186)))))

(assert (=> d!98987 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13461) e!403190)))

(declare-fun b!718132 () Bool)

(declare-fun e!403192 () Bool)

(declare-fun contains!4035 (List!13464 (_ BitVec 64)) Bool)

(assert (=> b!718132 (= e!403192 (contains!4035 Nil!13461 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34722 () Bool)

(declare-fun c!79102 () Bool)

(assert (=> bm!34722 (= call!34725 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79102 (Cons!13460 (select (arr!19462 a!3186) #b00000000000000000000000000000000) Nil!13461) Nil!13461)))))

(declare-fun b!718133 () Bool)

(declare-fun e!403193 () Bool)

(assert (=> b!718133 (= e!403190 e!403193)))

(declare-fun res!480662 () Bool)

(assert (=> b!718133 (=> (not res!480662) (not e!403193))))

(assert (=> b!718133 (= res!480662 (not e!403192))))

(declare-fun res!480661 () Bool)

(assert (=> b!718133 (=> (not res!480661) (not e!403192))))

(assert (=> b!718133 (= res!480661 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718134 () Bool)

(assert (=> b!718134 (= e!403193 e!403191)))

(assert (=> b!718134 (= c!79102 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98987 (not res!480660)) b!718133))

(assert (= (and b!718133 res!480661) b!718132))

(assert (= (and b!718133 res!480662) b!718134))

(assert (= (and b!718134 c!79102) b!718130))

(assert (= (and b!718134 (not c!79102)) b!718131))

(assert (= (or b!718130 b!718131) bm!34722))

(assert (=> b!718132 m!673825))

(assert (=> b!718132 m!673825))

(declare-fun m!673873 () Bool)

(assert (=> b!718132 m!673873))

(assert (=> bm!34722 m!673825))

(declare-fun m!673875 () Bool)

(assert (=> bm!34722 m!673875))

(assert (=> b!718133 m!673825))

(assert (=> b!718133 m!673825))

(declare-fun m!673877 () Bool)

(assert (=> b!718133 m!673877))

(assert (=> b!718134 m!673825))

(assert (=> b!718134 m!673825))

(assert (=> b!718134 m!673877))

(assert (=> b!718026 d!98987))

(declare-fun b!718164 () Bool)

(declare-fun e!403218 () Bool)

(declare-fun call!34731 () Bool)

(assert (=> b!718164 (= e!403218 call!34731)))

(declare-fun bm!34728 () Bool)

(assert (=> bm!34728 (= call!34731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!98997 () Bool)

(declare-fun res!480682 () Bool)

(declare-fun e!403220 () Bool)

(assert (=> d!98997 (=> res!480682 e!403220)))

(assert (=> d!98997 (= res!480682 (bvsge #b00000000000000000000000000000000 (size!19883 a!3186)))))

(assert (=> d!98997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403220)))

(declare-fun b!718165 () Bool)

(declare-fun e!403219 () Bool)

(assert (=> b!718165 (= e!403218 e!403219)))

(declare-fun lt!319290 () (_ BitVec 64))

(assert (=> b!718165 (= lt!319290 (select (arr!19462 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24660 0))(
  ( (Unit!24661) )
))
(declare-fun lt!319292 () Unit!24660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40667 (_ BitVec 64) (_ BitVec 32)) Unit!24660)

(assert (=> b!718165 (= lt!319292 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319290 #b00000000000000000000000000000000))))

(assert (=> b!718165 (arrayContainsKey!0 a!3186 lt!319290 #b00000000000000000000000000000000)))

(declare-fun lt!319291 () Unit!24660)

(assert (=> b!718165 (= lt!319291 lt!319292)))

(declare-fun res!480683 () Bool)

(assert (=> b!718165 (= res!480683 (= (seekEntryOrOpen!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7062 #b00000000000000000000000000000000)))))

(assert (=> b!718165 (=> (not res!480683) (not e!403219))))

(declare-fun b!718166 () Bool)

(assert (=> b!718166 (= e!403219 call!34731)))

(declare-fun b!718167 () Bool)

(assert (=> b!718167 (= e!403220 e!403218)))

(declare-fun c!79108 () Bool)

(assert (=> b!718167 (= c!79108 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98997 (not res!480682)) b!718167))

(assert (= (and b!718167 c!79108) b!718165))

(assert (= (and b!718167 (not c!79108)) b!718164))

(assert (= (and b!718165 res!480683) b!718166))

(assert (= (or b!718166 b!718164) bm!34728))

(declare-fun m!673885 () Bool)

(assert (=> bm!34728 m!673885))

(assert (=> b!718165 m!673825))

(declare-fun m!673887 () Bool)

(assert (=> b!718165 m!673887))

(declare-fun m!673889 () Bool)

(assert (=> b!718165 m!673889))

(assert (=> b!718165 m!673825))

(declare-fun m!673891 () Bool)

(assert (=> b!718165 m!673891))

(assert (=> b!718167 m!673825))

(assert (=> b!718167 m!673825))

(assert (=> b!718167 m!673877))

(assert (=> b!718021 d!98997))

(declare-fun d!99003 () Bool)

(assert (=> d!99003 (= (validKeyInArray!0 (select (arr!19462 a!3186) j!159)) (and (not (= (select (arr!19462 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19462 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718022 d!99003))

(check-sat (not bm!34728) (not d!98965) (not b!718094) (not b!718167) (not b!718165) (not b!718133) (not b!718134) (not bm!34722) (not b!718132) (not b!718056))
(check-sat)
