; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63826 () Bool)

(assert start!63826)

(declare-fun res!480332 () Bool)

(declare-fun e!402938 () Bool)

(assert (=> start!63826 (=> (not res!480332) (not e!402938))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63826 (= res!480332 (validMask!0 mask!3328))))

(assert (=> start!63826 e!402938))

(declare-datatypes ((array!40650 0))(
  ( (array!40651 (arr!19455 (Array (_ BitVec 32) (_ BitVec 64))) (size!19876 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40650)

(declare-fun array_inv!15251 (array!40650) Bool)

(assert (=> start!63826 (array_inv!15251 a!3186)))

(assert (=> start!63826 true))

(declare-fun b!717687 () Bool)

(declare-fun res!480336 () Bool)

(declare-fun e!402936 () Bool)

(assert (=> b!717687 (=> (not res!480336) (not e!402936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40650 (_ BitVec 32)) Bool)

(assert (=> b!717687 (= res!480336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717688 () Bool)

(declare-fun e!402935 () Bool)

(assert (=> b!717688 (= e!402936 e!402935)))

(declare-fun res!480337 () Bool)

(assert (=> b!717688 (=> res!480337 e!402935)))

(declare-datatypes ((List!13457 0))(
  ( (Nil!13454) (Cons!13453 (h!14498 (_ BitVec 64)) (t!19772 List!13457)) )
))
(declare-fun contains!4032 (List!13457 (_ BitVec 64)) Bool)

(assert (=> b!717688 (= res!480337 (contains!4032 Nil!13454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717689 () Bool)

(assert (=> b!717689 (= e!402938 e!402936)))

(declare-fun res!480329 () Bool)

(assert (=> b!717689 (=> (not res!480329) (not e!402936))))

(declare-datatypes ((SeekEntryResult!7055 0))(
  ( (MissingZero!7055 (index!30588 (_ BitVec 32))) (Found!7055 (index!30589 (_ BitVec 32))) (Intermediate!7055 (undefined!7867 Bool) (index!30590 (_ BitVec 32)) (x!61611 (_ BitVec 32))) (Undefined!7055) (MissingVacant!7055 (index!30591 (_ BitVec 32))) )
))
(declare-fun lt!319166 () SeekEntryResult!7055)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717689 (= res!480329 (or (= lt!319166 (MissingZero!7055 i!1173)) (= lt!319166 (MissingVacant!7055 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40650 (_ BitVec 32)) SeekEntryResult!7055)

(assert (=> b!717689 (= lt!319166 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717690 () Bool)

(declare-fun res!480335 () Bool)

(assert (=> b!717690 (=> (not res!480335) (not e!402938))))

(declare-fun arrayContainsKey!0 (array!40650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717690 (= res!480335 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717691 () Bool)

(declare-fun res!480333 () Bool)

(assert (=> b!717691 (=> (not res!480333) (not e!402938))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717691 (= res!480333 (and (= (size!19876 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19876 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19876 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717692 () Bool)

(declare-fun res!480334 () Bool)

(assert (=> b!717692 (=> (not res!480334) (not e!402936))))

(declare-fun noDuplicate!1281 (List!13457) Bool)

(assert (=> b!717692 (= res!480334 (noDuplicate!1281 Nil!13454))))

(declare-fun b!717693 () Bool)

(declare-fun res!480331 () Bool)

(assert (=> b!717693 (=> (not res!480331) (not e!402938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717693 (= res!480331 (validKeyInArray!0 (select (arr!19455 a!3186) j!159)))))

(declare-fun b!717694 () Bool)

(declare-fun res!480330 () Bool)

(assert (=> b!717694 (=> (not res!480330) (not e!402938))))

(assert (=> b!717694 (= res!480330 (validKeyInArray!0 k!2102))))

(declare-fun b!717695 () Bool)

(declare-fun res!480338 () Bool)

(assert (=> b!717695 (=> (not res!480338) (not e!402936))))

(assert (=> b!717695 (= res!480338 (and (bvsle #b00000000000000000000000000000000 (size!19876 a!3186)) (bvslt (size!19876 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717696 () Bool)

(assert (=> b!717696 (= e!402935 (contains!4032 Nil!13454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63826 res!480332) b!717691))

(assert (= (and b!717691 res!480333) b!717693))

(assert (= (and b!717693 res!480331) b!717694))

(assert (= (and b!717694 res!480330) b!717690))

(assert (= (and b!717690 res!480335) b!717689))

(assert (= (and b!717689 res!480329) b!717687))

(assert (= (and b!717687 res!480336) b!717695))

(assert (= (and b!717695 res!480338) b!717692))

(assert (= (and b!717692 res!480334) b!717688))

(assert (= (and b!717688 (not res!480337)) b!717696))

(declare-fun m!673525 () Bool)

(assert (=> b!717688 m!673525))

(declare-fun m!673527 () Bool)

(assert (=> b!717690 m!673527))

(declare-fun m!673529 () Bool)

(assert (=> b!717693 m!673529))

(assert (=> b!717693 m!673529))

(declare-fun m!673531 () Bool)

(assert (=> b!717693 m!673531))

(declare-fun m!673533 () Bool)

(assert (=> b!717694 m!673533))

(declare-fun m!673535 () Bool)

(assert (=> b!717692 m!673535))

(declare-fun m!673537 () Bool)

(assert (=> b!717687 m!673537))

(declare-fun m!673539 () Bool)

(assert (=> b!717689 m!673539))

(declare-fun m!673541 () Bool)

(assert (=> start!63826 m!673541))

(declare-fun m!673543 () Bool)

(assert (=> start!63826 m!673543))

(declare-fun m!673545 () Bool)

(assert (=> b!717696 m!673545))

(push 1)

(assert (not b!717688))

(assert (not b!717690))

(assert (not b!717692))

(assert (not b!717696))

(assert (not start!63826))

(assert (not b!717693))

(assert (not b!717694))

(assert (not b!717689))

(assert (not b!717687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98901 () Bool)

(assert (=> d!98901 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63826 d!98901))

(declare-fun d!98913 () Bool)

(assert (=> d!98913 (= (array_inv!15251 a!3186) (bvsge (size!19876 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63826 d!98913))

(declare-fun d!98915 () Bool)

(declare-fun res!480423 () Bool)

(declare-fun e!402987 () Bool)

(assert (=> d!98915 (=> res!480423 e!402987)))

(assert (=> d!98915 (= res!480423 (= (select (arr!19455 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98915 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402987)))

(declare-fun b!717781 () Bool)

(declare-fun e!402988 () Bool)

(assert (=> b!717781 (= e!402987 e!402988)))

(declare-fun res!480424 () Bool)

(assert (=> b!717781 (=> (not res!480424) (not e!402988))))

(assert (=> b!717781 (= res!480424 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19876 a!3186)))))

(declare-fun b!717782 () Bool)

(assert (=> b!717782 (= e!402988 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98915 (not res!480423)) b!717781))

(assert (= (and b!717781 res!480424) b!717782))

(declare-fun m!673609 () Bool)

(assert (=> d!98915 m!673609))

(declare-fun m!673611 () Bool)

(assert (=> b!717782 m!673611))

(assert (=> b!717690 d!98915))

(declare-fun d!98921 () Bool)

(declare-fun lt!319179 () Bool)

(declare-fun content!377 (List!13457) (Set (_ BitVec 64)))

(assert (=> d!98921 (= lt!319179 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!377 Nil!13454)))))

(declare-fun e!402994 () Bool)

(assert (=> d!98921 (= lt!319179 e!402994)))

(declare-fun res!480429 () Bool)

(assert (=> d!98921 (=> (not res!480429) (not e!402994))))

(assert (=> d!98921 (= res!480429 (is-Cons!13453 Nil!13454))))

(assert (=> d!98921 (= (contains!4032 Nil!13454 #b1000000000000000000000000000000000000000000000000000000000000000) lt!319179)))

(declare-fun b!717787 () Bool)

(declare-fun e!402993 () Bool)

(assert (=> b!717787 (= e!402994 e!402993)))

(declare-fun res!480430 () Bool)

(assert (=> b!717787 (=> res!480430 e!402993)))

(assert (=> b!717787 (= res!480430 (= (h!14498 Nil!13454) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717788 () Bool)

(assert (=> b!717788 (= e!402993 (contains!4032 (t!19772 Nil!13454) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98921 res!480429) b!717787))

(assert (= (and b!717787 (not res!480430)) b!717788))

(declare-fun m!673613 () Bool)

(assert (=> d!98921 m!673613))

(declare-fun m!673615 () Bool)

(assert (=> d!98921 m!673615))

(declare-fun m!673617 () Bool)

(assert (=> b!717788 m!673617))

(assert (=> b!717696 d!98921))

(declare-fun d!98923 () Bool)

(assert (=> d!98923 (= (validKeyInArray!0 (select (arr!19455 a!3186) j!159)) (and (not (= (select (arr!19455 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19455 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717693 d!98923))

(declare-fun b!717833 () Bool)

(declare-fun e!403027 () Bool)

(declare-fun e!403025 () Bool)

(assert (=> b!717833 (= e!403027 e!403025)))

(declare-fun c!79060 () Bool)

(assert (=> b!717833 (= c!79060 (validKeyInArray!0 (select (arr!19455 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98925 () Bool)

(declare-fun res!480448 () Bool)

(assert (=> d!98925 (=> res!480448 e!403027)))

(assert (=> d!98925 (= res!480448 (bvsge #b00000000000000000000000000000000 (size!19876 a!3186)))))

(assert (=> d!98925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403027)))

(declare-fun bm!34707 () Bool)

(declare-fun call!34710 () Bool)

(assert (=> bm!34707 (= call!34710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717834 () Bool)

(assert (=> b!717834 (= e!403025 call!34710)))

(declare-fun b!717835 () Bool)

(declare-fun e!403026 () Bool)

(assert (=> b!717835 (= e!403026 call!34710)))

(declare-fun b!717836 () Bool)

(assert (=> b!717836 (= e!403025 e!403026)))

(declare-fun lt!319209 () (_ BitVec 64))

(assert (=> b!717836 (= lt!319209 (select (arr!19455 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24656 0))(
  ( (Unit!24657) )
))
(declare-fun lt!319207 () Unit!24656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40650 (_ BitVec 64) (_ BitVec 32)) Unit!24656)

(assert (=> b!717836 (= lt!319207 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319209 #b00000000000000000000000000000000))))

(assert (=> b!717836 (arrayContainsKey!0 a!3186 lt!319209 #b00000000000000000000000000000000)))

(declare-fun lt!319208 () Unit!24656)

(assert (=> b!717836 (= lt!319208 lt!319207)))

(declare-fun res!480447 () Bool)

(assert (=> b!717836 (= res!480447 (= (seekEntryOrOpen!0 (select (arr!19455 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7055 #b00000000000000000000000000000000)))))

(assert (=> b!717836 (=> (not res!480447) (not e!403026))))

(assert (= (and d!98925 (not res!480448)) b!717833))

(assert (= (and b!717833 c!79060) b!717836))

(assert (= (and b!717833 (not c!79060)) b!717834))

(assert (= (and b!717836 res!480447) b!717835))

(assert (= (or b!717835 b!717834) bm!34707))

(assert (=> b!717833 m!673609))

(assert (=> b!717833 m!673609))

(declare-fun m!673649 () Bool)

(assert (=> b!717833 m!673649))

(declare-fun m!673651 () Bool)

(assert (=> bm!34707 m!673651))

(assert (=> b!717836 m!673609))

(declare-fun m!673653 () Bool)

(assert (=> b!717836 m!673653))

(declare-fun m!673655 () Bool)

(assert (=> b!717836 m!673655))

(assert (=> b!717836 m!673609))

(declare-fun m!673657 () Bool)

(assert (=> b!717836 m!673657))

(assert (=> b!717687 d!98925))

(declare-fun d!98933 () Bool)

(declare-fun res!480453 () Bool)

(declare-fun e!403032 () Bool)

(assert (=> d!98933 (=> res!480453 e!403032)))

(assert (=> d!98933 (= res!480453 (is-Nil!13454 Nil!13454))))

(assert (=> d!98933 (= (noDuplicate!1281 Nil!13454) e!403032)))

(declare-fun b!717841 () Bool)

(declare-fun e!403033 () Bool)

(assert (=> b!717841 (= e!403032 e!403033)))

(declare-fun res!480454 () Bool)

(assert (=> b!717841 (=> (not res!480454) (not e!403033))))

(assert (=> b!717841 (= res!480454 (not (contains!4032 (t!19772 Nil!13454) (h!14498 Nil!13454))))))

(declare-fun b!717842 () Bool)

(assert (=> b!717842 (= e!403033 (noDuplicate!1281 (t!19772 Nil!13454)))))

(assert (= (and d!98933 (not res!480453)) b!717841))

(assert (= (and b!717841 res!480454) b!717842))

(declare-fun m!673659 () Bool)

(assert (=> b!717841 m!673659))

(declare-fun m!673661 () Bool)

(assert (=> b!717842 m!673661))

(assert (=> b!717692 d!98933))

(declare-fun b!717891 () Bool)

(declare-fun e!403066 () SeekEntryResult!7055)

(declare-fun lt!319235 () SeekEntryResult!7055)

(assert (=> b!717891 (= e!403066 (Found!7055 (index!30590 lt!319235)))))

(declare-fun b!717892 () Bool)

(declare-fun e!403065 () SeekEntryResult!7055)

(assert (=> b!717892 (= e!403065 (MissingZero!7055 (index!30590 lt!319235)))))

(declare-fun b!717893 () Bool)

(declare-fun c!79079 () Bool)

(declare-fun lt!319234 () (_ BitVec 64))

(assert (=> b!717893 (= c!79079 (= lt!319234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717893 (= e!403066 e!403065)))

(declare-fun b!717894 () Bool)

(declare-fun e!403064 () SeekEntryResult!7055)

(assert (=> b!717894 (= e!403064 e!403066)))

(assert (=> b!717894 (= lt!319234 (select (arr!19455 a!3186) (index!30590 lt!319235)))))

(declare-fun c!79080 () Bool)

(assert (=> b!717894 (= c!79080 (= lt!319234 k!2102))))

(declare-fun d!98935 () Bool)

(declare-fun lt!319236 () SeekEntryResult!7055)

(assert (=> d!98935 (and (or (is-Undefined!7055 lt!319236) (not (is-Found!7055 lt!319236)) (and (bvsge (index!30589 lt!319236) #b00000000000000000000000000000000) (bvslt (index!30589 lt!319236) (size!19876 a!3186)))) (or (is-Undefined!7055 lt!319236) (is-Found!7055 lt!319236) (not (is-MissingZero!7055 lt!319236)) (and (bvsge (index!30588 lt!319236) #b00000000000000000000000000000000) (bvslt (index!30588 lt!319236) (size!19876 a!3186)))) (or (is-Undefined!7055 lt!319236) (is-Found!7055 lt!319236) (is-MissingZero!7055 lt!319236) (not (is-MissingVacant!7055 lt!319236)) (and (bvsge (index!30591 lt!319236) #b00000000000000000000000000000000) (bvslt (index!30591 lt!319236) (size!19876 a!3186)))) (or (is-Undefined!7055 lt!319236) (ite (is-Found!7055 lt!319236) (= (select (arr!19455 a!3186) (index!30589 lt!319236)) k!2102) (ite (is-MissingZero!7055 lt!319236) (= (select (arr!19455 a!3186) (index!30588 lt!319236)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7055 lt!319236) (= (select (arr!19455 a!3186) (index!30591 lt!319236)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98935 (= lt!319236 e!403064)))

(declare-fun c!79081 () Bool)

(assert (=> d!98935 (= c!79081 (and (is-Intermediate!7055 lt!319235) (undefined!7867 lt!319235)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40650 (_ BitVec 32)) SeekEntryResult!7055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98935 (= lt!319235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98935 (validMask!0 mask!3328)))

(assert (=> d!98935 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319236)))

(declare-fun b!717895 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40650 (_ BitVec 32)) SeekEntryResult!7055)

