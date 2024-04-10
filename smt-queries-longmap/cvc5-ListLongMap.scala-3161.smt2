; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44538 () Bool)

(assert start!44538)

(declare-fun b!488892 () Bool)

(declare-fun res!291941 () Bool)

(declare-fun e!287571 () Bool)

(assert (=> b!488892 (=> (not res!291941) (not e!287571))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31648 0))(
  ( (array!31649 (arr!15213 (Array (_ BitVec 32) (_ BitVec 64))) (size!15577 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31648)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488892 (= res!291941 (and (= (size!15577 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15577 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15577 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488893 () Bool)

(declare-fun res!291940 () Bool)

(assert (=> b!488893 (=> (not res!291940) (not e!287571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488893 (= res!291940 (validKeyInArray!0 (select (arr!15213 a!3235) j!176)))))

(declare-fun e!287569 () Bool)

(declare-fun b!488894 () Bool)

(declare-datatypes ((SeekEntryResult!3680 0))(
  ( (MissingZero!3680 (index!16899 (_ BitVec 32))) (Found!3680 (index!16900 (_ BitVec 32))) (Intermediate!3680 (undefined!4492 Bool) (index!16901 (_ BitVec 32)) (x!46015 (_ BitVec 32))) (Undefined!3680) (MissingVacant!3680 (index!16902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31648 (_ BitVec 32)) SeekEntryResult!3680)

(assert (=> b!488894 (= e!287569 (= (seekEntryOrOpen!0 (select (arr!15213 a!3235) j!176) a!3235 mask!3524) (Found!3680 j!176)))))

(declare-fun res!291946 () Bool)

(assert (=> start!44538 (=> (not res!291946) (not e!287571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44538 (= res!291946 (validMask!0 mask!3524))))

(assert (=> start!44538 e!287571))

(assert (=> start!44538 true))

(declare-fun array_inv!11009 (array!31648) Bool)

(assert (=> start!44538 (array_inv!11009 a!3235)))

(declare-fun b!488895 () Bool)

(declare-fun res!291943 () Bool)

(assert (=> b!488895 (=> (not res!291943) (not e!287571))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!488895 (= res!291943 (validKeyInArray!0 k!2280))))

(declare-fun b!488896 () Bool)

(declare-fun res!291945 () Bool)

(declare-fun e!287568 () Bool)

(assert (=> b!488896 (=> (not res!291945) (not e!287568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31648 (_ BitVec 32)) Bool)

(assert (=> b!488896 (= res!291945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488897 () Bool)

(declare-fun res!291939 () Bool)

(assert (=> b!488897 (=> (not res!291939) (not e!287568))))

(declare-datatypes ((List!9371 0))(
  ( (Nil!9368) (Cons!9367 (h!10226 (_ BitVec 64)) (t!15599 List!9371)) )
))
(declare-fun arrayNoDuplicates!0 (array!31648 (_ BitVec 32) List!9371) Bool)

(assert (=> b!488897 (= res!291939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9368))))

(declare-fun b!488898 () Bool)

(declare-fun res!291942 () Bool)

(assert (=> b!488898 (=> (not res!291942) (not e!287571))))

(declare-fun arrayContainsKey!0 (array!31648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488898 (= res!291942 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488899 () Bool)

(assert (=> b!488899 (= e!287571 e!287568)))

(declare-fun res!291944 () Bool)

(assert (=> b!488899 (=> (not res!291944) (not e!287568))))

(declare-fun lt!220566 () SeekEntryResult!3680)

(assert (=> b!488899 (= res!291944 (or (= lt!220566 (MissingZero!3680 i!1204)) (= lt!220566 (MissingVacant!3680 i!1204))))))

(assert (=> b!488899 (= lt!220566 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488900 () Bool)

(declare-fun lt!220567 () (_ BitVec 32))

(assert (=> b!488900 (= e!287568 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220567 #b00000000000000000000000000000000) (bvslt lt!220567 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488900 (= lt!220567 (toIndex!0 (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!488900 e!287569))

(declare-fun res!291947 () Bool)

(assert (=> b!488900 (=> (not res!291947) (not e!287569))))

(assert (=> b!488900 (= res!291947 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14306 0))(
  ( (Unit!14307) )
))
(declare-fun lt!220565 () Unit!14306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14306)

(assert (=> b!488900 (= lt!220565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44538 res!291946) b!488892))

(assert (= (and b!488892 res!291941) b!488893))

(assert (= (and b!488893 res!291940) b!488895))

(assert (= (and b!488895 res!291943) b!488898))

(assert (= (and b!488898 res!291942) b!488899))

(assert (= (and b!488899 res!291944) b!488896))

(assert (= (and b!488896 res!291945) b!488897))

(assert (= (and b!488897 res!291939) b!488900))

(assert (= (and b!488900 res!291947) b!488894))

(declare-fun m!468627 () Bool)

(assert (=> b!488893 m!468627))

(assert (=> b!488893 m!468627))

(declare-fun m!468629 () Bool)

(assert (=> b!488893 m!468629))

(declare-fun m!468631 () Bool)

(assert (=> b!488896 m!468631))

(declare-fun m!468633 () Bool)

(assert (=> b!488899 m!468633))

(declare-fun m!468635 () Bool)

(assert (=> b!488897 m!468635))

(declare-fun m!468637 () Bool)

(assert (=> b!488898 m!468637))

(declare-fun m!468639 () Bool)

(assert (=> b!488900 m!468639))

(declare-fun m!468641 () Bool)

(assert (=> b!488900 m!468641))

(declare-fun m!468643 () Bool)

(assert (=> b!488900 m!468643))

(declare-fun m!468645 () Bool)

(assert (=> b!488900 m!468645))

(assert (=> b!488900 m!468643))

(declare-fun m!468647 () Bool)

(assert (=> b!488900 m!468647))

(declare-fun m!468649 () Bool)

(assert (=> start!44538 m!468649))

(declare-fun m!468651 () Bool)

(assert (=> start!44538 m!468651))

(declare-fun m!468653 () Bool)

(assert (=> b!488895 m!468653))

(assert (=> b!488894 m!468627))

(assert (=> b!488894 m!468627))

(declare-fun m!468655 () Bool)

(assert (=> b!488894 m!468655))

(push 1)

(assert (not start!44538))

(assert (not b!488895))

(assert (not b!488894))

(assert (not b!488893))

(assert (not b!488897))

(assert (not b!488896))

(assert (not b!488899))

(assert (not b!488898))

(assert (not b!488900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!488963 () Bool)

(declare-fun e!287602 () Bool)

(declare-fun e!287604 () Bool)

(assert (=> b!488963 (= e!287602 e!287604)))

(declare-fun c!58748 () Bool)

(assert (=> b!488963 (= c!58748 (validKeyInArray!0 (select (arr!15213 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488964 () Bool)

(declare-fun e!287603 () Bool)

(assert (=> b!488964 (= e!287604 e!287603)))

(declare-fun lt!220600 () (_ BitVec 64))

(assert (=> b!488964 (= lt!220600 (select (arr!15213 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220598 () Unit!14306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31648 (_ BitVec 64) (_ BitVec 32)) Unit!14306)

(assert (=> b!488964 (= lt!220598 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220600 #b00000000000000000000000000000000))))

(assert (=> b!488964 (arrayContainsKey!0 a!3235 lt!220600 #b00000000000000000000000000000000)))

(declare-fun lt!220599 () Unit!14306)

(assert (=> b!488964 (= lt!220599 lt!220598)))

(declare-fun res!292007 () Bool)

(assert (=> b!488964 (= res!292007 (= (seekEntryOrOpen!0 (select (arr!15213 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3680 #b00000000000000000000000000000000)))))

(assert (=> b!488964 (=> (not res!292007) (not e!287603))))

(declare-fun d!77863 () Bool)

(declare-fun res!292008 () Bool)

(assert (=> d!77863 (=> res!292008 e!287602)))

(assert (=> d!77863 (= res!292008 (bvsge #b00000000000000000000000000000000 (size!15577 a!3235)))))

(assert (=> d!77863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287602)))

(declare-fun bm!31346 () Bool)

(declare-fun call!31349 () Bool)

(assert (=> bm!31346 (= call!31349 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488965 () Bool)

(assert (=> b!488965 (= e!287604 call!31349)))

(declare-fun b!488966 () Bool)

(assert (=> b!488966 (= e!287603 call!31349)))

(assert (= (and d!77863 (not res!292008)) b!488963))

(assert (= (and b!488963 c!58748) b!488964))

(assert (= (and b!488963 (not c!58748)) b!488965))

(assert (= (and b!488964 res!292007) b!488966))

(assert (= (or b!488966 b!488965) bm!31346))

(declare-fun m!468717 () Bool)

(assert (=> b!488963 m!468717))

(assert (=> b!488963 m!468717))

(declare-fun m!468719 () Bool)

(assert (=> b!488963 m!468719))

(assert (=> b!488964 m!468717))

(declare-fun m!468721 () Bool)

(assert (=> b!488964 m!468721))

(declare-fun m!468723 () Bool)

(assert (=> b!488964 m!468723))

(assert (=> b!488964 m!468717))

(declare-fun m!468725 () Bool)

(assert (=> b!488964 m!468725))

(declare-fun m!468727 () Bool)

(assert (=> bm!31346 m!468727))

(assert (=> b!488896 d!77863))

(declare-fun bm!31351 () Bool)

(declare-fun call!31354 () Bool)

(declare-fun c!58753 () Bool)

(assert (=> bm!31351 (= call!31354 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58753 (Cons!9367 (select (arr!15213 a!3235) #b00000000000000000000000000000000) Nil!9368) Nil!9368)))))

(declare-fun b!488985 () Bool)

(declare-fun e!287621 () Bool)

(declare-fun e!287622 () Bool)

(assert (=> b!488985 (= e!287621 e!287622)))

(assert (=> b!488985 (= c!58753 (validKeyInArray!0 (select (arr!15213 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488986 () Bool)

(declare-fun e!287620 () Bool)

(assert (=> b!488986 (= e!287620 e!287621)))

(declare-fun res!292020 () Bool)

(assert (=> b!488986 (=> (not res!292020) (not e!287621))))

(declare-fun e!287619 () Bool)

(assert (=> b!488986 (= res!292020 (not e!287619))))

(declare-fun res!292019 () Bool)

(assert (=> b!488986 (=> (not res!292019) (not e!287619))))

(assert (=> b!488986 (= res!292019 (validKeyInArray!0 (select (arr!15213 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488987 () Bool)

(assert (=> b!488987 (= e!287622 call!31354)))

(declare-fun d!77869 () Bool)

(declare-fun res!292021 () Bool)

(assert (=> d!77869 (=> res!292021 e!287620)))

(assert (=> d!77869 (= res!292021 (bvsge #b00000000000000000000000000000000 (size!15577 a!3235)))))

(assert (=> d!77869 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9368) e!287620)))

(declare-fun b!488988 () Bool)

(declare-fun contains!2706 (List!9371 (_ BitVec 64)) Bool)

(assert (=> b!488988 (= e!287619 (contains!2706 Nil!9368 (select (arr!15213 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488989 () Bool)

(assert (=> b!488989 (= e!287622 call!31354)))

(assert (= (and d!77869 (not res!292021)) b!488986))

(assert (= (and b!488986 res!292019) b!488988))

(assert (= (and b!488986 res!292020) b!488985))

(assert (= (and b!488985 c!58753) b!488989))

(assert (= (and b!488985 (not c!58753)) b!488987))

(assert (= (or b!488989 b!488987) bm!31351))

(assert (=> bm!31351 m!468717))

(declare-fun m!468729 () Bool)

(assert (=> bm!31351 m!468729))

(assert (=> b!488985 m!468717))

(assert (=> b!488985 m!468717))

(assert (=> b!488985 m!468719))

(assert (=> b!488986 m!468717))

(assert (=> b!488986 m!468717))

(assert (=> b!488986 m!468719))

(assert (=> b!488988 m!468717))

(assert (=> b!488988 m!468717))

(declare-fun m!468731 () Bool)

(assert (=> b!488988 m!468731))

(assert (=> b!488897 d!77869))

(declare-fun b!489039 () Bool)

(declare-fun c!58773 () Bool)

(declare-fun lt!220629 () (_ BitVec 64))

(assert (=> b!489039 (= c!58773 (= lt!220629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287654 () SeekEntryResult!3680)

(declare-fun e!287653 () SeekEntryResult!3680)

(assert (=> b!489039 (= e!287654 e!287653)))

(declare-fun b!489040 () Bool)

(declare-fun lt!220628 () SeekEntryResult!3680)

(assert (=> b!489040 (= e!287654 (Found!3680 (index!16901 lt!220628)))))

(declare-fun b!489041 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31648 (_ BitVec 32)) SeekEntryResult!3680)

(assert (=> b!489041 (= e!287653 (seekKeyOrZeroReturnVacant!0 (x!46015 lt!220628) (index!16901 lt!220628) (index!16901 lt!220628) k!2280 a!3235 mask!3524))))

(declare-fun b!489042 () Bool)

(declare-fun e!287655 () SeekEntryResult!3680)

(assert (=> b!489042 (= e!287655 e!287654)))

(assert (=> b!489042 (= lt!220629 (select (arr!15213 a!3235) (index!16901 lt!220628)))))

(declare-fun c!58775 () Bool)

(assert (=> b!489042 (= c!58775 (= lt!220629 k!2280))))

(declare-fun b!489043 () Bool)

(assert (=> b!489043 (= e!287653 (MissingZero!3680 (index!16901 lt!220628)))))

(declare-fun b!489044 () Bool)

(assert (=> b!489044 (= e!287655 Undefined!3680)))

(declare-fun d!77871 () Bool)

(declare-fun lt!220630 () SeekEntryResult!3680)

(assert (=> d!77871 (and (or (is-Undefined!3680 lt!220630) (not (is-Found!3680 lt!220630)) (and (bvsge (index!16900 lt!220630) #b00000000000000000000000000000000) (bvslt (index!16900 lt!220630) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220630) (is-Found!3680 lt!220630) (not (is-MissingZero!3680 lt!220630)) (and (bvsge (index!16899 lt!220630) #b00000000000000000000000000000000) (bvslt (index!16899 lt!220630) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220630) (is-Found!3680 lt!220630) (is-MissingZero!3680 lt!220630) (not (is-MissingVacant!3680 lt!220630)) (and (bvsge (index!16902 lt!220630) #b00000000000000000000000000000000) (bvslt (index!16902 lt!220630) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220630) (ite (is-Found!3680 lt!220630) (= (select (arr!15213 a!3235) (index!16900 lt!220630)) k!2280) (ite (is-MissingZero!3680 lt!220630) (= (select (arr!15213 a!3235) (index!16899 lt!220630)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3680 lt!220630) (= (select (arr!15213 a!3235) (index!16902 lt!220630)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77871 (= lt!220630 e!287655)))

(declare-fun c!58774 () Bool)

(assert (=> d!77871 (= c!58774 (and (is-Intermediate!3680 lt!220628) (undefined!4492 lt!220628)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31648 (_ BitVec 32)) SeekEntryResult!3680)

(assert (=> d!77871 (= lt!220628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77871 (validMask!0 mask!3524)))

(assert (=> d!77871 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220630)))

(assert (= (and d!77871 c!58774) b!489044))

(assert (= (and d!77871 (not c!58774)) b!489042))

(assert (= (and b!489042 c!58775) b!489040))

(assert (= (and b!489042 (not c!58775)) b!489039))

(assert (= (and b!489039 c!58773) b!489043))

(assert (= (and b!489039 (not c!58773)) b!489041))

(declare-fun m!468763 () Bool)

(assert (=> b!489041 m!468763))

(declare-fun m!468765 () Bool)

(assert (=> b!489042 m!468765))

(declare-fun m!468767 () Bool)

(assert (=> d!77871 m!468767))

(declare-fun m!468769 () Bool)

(assert (=> d!77871 m!468769))

(assert (=> d!77871 m!468769))

(declare-fun m!468771 () Bool)

(assert (=> d!77871 m!468771))

(assert (=> d!77871 m!468649))

(declare-fun m!468773 () Bool)

(assert (=> d!77871 m!468773))

(declare-fun m!468775 () Bool)

(assert (=> d!77871 m!468775))

(assert (=> b!488899 d!77871))

(declare-fun d!77885 () Bool)

(declare-fun res!292044 () Bool)

(declare-fun e!287666 () Bool)

(assert (=> d!77885 (=> res!292044 e!287666)))

(assert (=> d!77885 (= res!292044 (= (select (arr!15213 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77885 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!287666)))

(declare-fun b!489055 () Bool)

(declare-fun e!287667 () Bool)

(assert (=> b!489055 (= e!287666 e!287667)))

(declare-fun res!292045 () Bool)

(assert (=> b!489055 (=> (not res!292045) (not e!287667))))

(assert (=> b!489055 (= res!292045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15577 a!3235)))))

(declare-fun b!489056 () Bool)

(assert (=> b!489056 (= e!287667 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77885 (not res!292044)) b!489055))

(assert (= (and b!489055 res!292045) b!489056))

(assert (=> d!77885 m!468717))

(declare-fun m!468781 () Bool)

(assert (=> b!489056 m!468781))

(assert (=> b!488898 d!77885))

(declare-fun d!77891 () Bool)

(assert (=> d!77891 (= (validKeyInArray!0 (select (arr!15213 a!3235) j!176)) (and (not (= (select (arr!15213 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15213 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488893 d!77891))

(declare-fun d!77893 () Bool)

(declare-fun lt!220648 () (_ BitVec 32))

(declare-fun lt!220647 () (_ BitVec 32))

(assert (=> d!77893 (= lt!220648 (bvmul (bvxor lt!220647 (bvlshr lt!220647 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77893 (= lt!220647 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77893 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!292046 (let ((h!10231 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46020 (bvmul (bvxor h!10231 (bvlshr h!10231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46020 (bvlshr x!46020 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!292046 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!292046 #b00000000000000000000000000000000))))))

(assert (=> d!77893 (= (toIndex!0 (select (store (arr!15213 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!220648 (bvlshr lt!220648 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!488900 d!77893))

(declare-fun b!489065 () Bool)

(declare-fun e!287674 () Bool)

(declare-fun e!287676 () Bool)

(assert (=> b!489065 (= e!287674 e!287676)))

(declare-fun c!58778 () Bool)

(assert (=> b!489065 (= c!58778 (validKeyInArray!0 (select (arr!15213 a!3235) j!176)))))

(declare-fun b!489066 () Bool)

(declare-fun e!287675 () Bool)

(assert (=> b!489066 (= e!287676 e!287675)))

(declare-fun lt!220651 () (_ BitVec 64))

(assert (=> b!489066 (= lt!220651 (select (arr!15213 a!3235) j!176))))

(declare-fun lt!220649 () Unit!14306)

(assert (=> b!489066 (= lt!220649 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220651 j!176))))

(assert (=> b!489066 (arrayContainsKey!0 a!3235 lt!220651 #b00000000000000000000000000000000)))

(declare-fun lt!220650 () Unit!14306)

(assert (=> b!489066 (= lt!220650 lt!220649)))

(declare-fun res!292051 () Bool)

(assert (=> b!489066 (= res!292051 (= (seekEntryOrOpen!0 (select (arr!15213 a!3235) j!176) a!3235 mask!3524) (Found!3680 j!176)))))

(assert (=> b!489066 (=> (not res!292051) (not e!287675))))

(declare-fun d!77895 () Bool)

(declare-fun res!292052 () Bool)

(assert (=> d!77895 (=> res!292052 e!287674)))

(assert (=> d!77895 (= res!292052 (bvsge j!176 (size!15577 a!3235)))))

(assert (=> d!77895 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287674)))

(declare-fun bm!31358 () Bool)

(declare-fun call!31361 () Bool)

(assert (=> bm!31358 (= call!31361 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!489067 () Bool)

(assert (=> b!489067 (= e!287676 call!31361)))

(declare-fun b!489068 () Bool)

(assert (=> b!489068 (= e!287675 call!31361)))

(assert (= (and d!77895 (not res!292052)) b!489065))

(assert (= (and b!489065 c!58778) b!489066))

(assert (= (and b!489065 (not c!58778)) b!489067))

(assert (= (and b!489066 res!292051) b!489068))

(assert (= (or b!489068 b!489067) bm!31358))

(assert (=> b!489065 m!468627))

(assert (=> b!489065 m!468627))

(assert (=> b!489065 m!468629))

(assert (=> b!489066 m!468627))

(declare-fun m!468783 () Bool)

(assert (=> b!489066 m!468783))

(declare-fun m!468785 () Bool)

(assert (=> b!489066 m!468785))

(assert (=> b!489066 m!468627))

(assert (=> b!489066 m!468655))

(declare-fun m!468787 () Bool)

(assert (=> bm!31358 m!468787))

(assert (=> b!488900 d!77895))

(declare-fun d!77897 () Bool)

(assert (=> d!77897 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220657 () Unit!14306)

(declare-fun choose!38 (array!31648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14306)

(assert (=> d!77897 (= lt!220657 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77897 (validMask!0 mask!3524)))

(assert (=> d!77897 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220657)))

(declare-fun bs!15584 () Bool)

(assert (= bs!15584 d!77897))

(assert (=> bs!15584 m!468645))

(declare-fun m!468795 () Bool)

(assert (=> bs!15584 m!468795))

(assert (=> bs!15584 m!468649))

(assert (=> b!488900 d!77897))

(declare-fun d!77901 () Bool)

(assert (=> d!77901 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488895 d!77901))

(declare-fun b!489073 () Bool)

(declare-fun c!58780 () Bool)

(declare-fun lt!220659 () (_ BitVec 64))

(assert (=> b!489073 (= c!58780 (= lt!220659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287681 () SeekEntryResult!3680)

(declare-fun e!287680 () SeekEntryResult!3680)

(assert (=> b!489073 (= e!287681 e!287680)))

(declare-fun b!489074 () Bool)

(declare-fun lt!220658 () SeekEntryResult!3680)

(assert (=> b!489074 (= e!287681 (Found!3680 (index!16901 lt!220658)))))

(declare-fun b!489075 () Bool)

(assert (=> b!489075 (= e!287680 (seekKeyOrZeroReturnVacant!0 (x!46015 lt!220658) (index!16901 lt!220658) (index!16901 lt!220658) (select (arr!15213 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!489076 () Bool)

(declare-fun e!287682 () SeekEntryResult!3680)

(assert (=> b!489076 (= e!287682 e!287681)))

(assert (=> b!489076 (= lt!220659 (select (arr!15213 a!3235) (index!16901 lt!220658)))))

(declare-fun c!58782 () Bool)

(assert (=> b!489076 (= c!58782 (= lt!220659 (select (arr!15213 a!3235) j!176)))))

(declare-fun b!489077 () Bool)

(assert (=> b!489077 (= e!287680 (MissingZero!3680 (index!16901 lt!220658)))))

(declare-fun b!489078 () Bool)

(assert (=> b!489078 (= e!287682 Undefined!3680)))

(declare-fun d!77903 () Bool)

(declare-fun lt!220660 () SeekEntryResult!3680)

(assert (=> d!77903 (and (or (is-Undefined!3680 lt!220660) (not (is-Found!3680 lt!220660)) (and (bvsge (index!16900 lt!220660) #b00000000000000000000000000000000) (bvslt (index!16900 lt!220660) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220660) (is-Found!3680 lt!220660) (not (is-MissingZero!3680 lt!220660)) (and (bvsge (index!16899 lt!220660) #b00000000000000000000000000000000) (bvslt (index!16899 lt!220660) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220660) (is-Found!3680 lt!220660) (is-MissingZero!3680 lt!220660) (not (is-MissingVacant!3680 lt!220660)) (and (bvsge (index!16902 lt!220660) #b00000000000000000000000000000000) (bvslt (index!16902 lt!220660) (size!15577 a!3235)))) (or (is-Undefined!3680 lt!220660) (ite (is-Found!3680 lt!220660) (= (select (arr!15213 a!3235) (index!16900 lt!220660)) (select (arr!15213 a!3235) j!176)) (ite (is-MissingZero!3680 lt!220660) (= (select (arr!15213 a!3235) (index!16899 lt!220660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3680 lt!220660) (= (select (arr!15213 a!3235) (index!16902 lt!220660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77903 (= lt!220660 e!287682)))

(declare-fun c!58781 () Bool)

(assert (=> d!77903 (= c!58781 (and (is-Intermediate!3680 lt!220658) (undefined!4492 lt!220658)))))

(assert (=> d!77903 (= lt!220658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15213 a!3235) j!176) mask!3524) (select (arr!15213 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77903 (validMask!0 mask!3524)))

(assert (=> d!77903 (= (seekEntryOrOpen!0 (select (arr!15213 a!3235) j!176) a!3235 mask!3524) lt!220660)))

(assert (= (and d!77903 c!58781) b!489078))

(assert (= (and d!77903 (not c!58781)) b!489076))

(assert (= (and b!489076 c!58782) b!489074))

(assert (= (and b!489076 (not c!58782)) b!489073))

(assert (= (and b!489073 c!58780) b!489077))

(assert (= (and b!489073 (not c!58780)) b!489075))

(assert (=> b!489075 m!468627))

(declare-fun m!468797 () Bool)

(assert (=> b!489075 m!468797))

(declare-fun m!468799 () Bool)

(assert (=> b!489076 m!468799))

(declare-fun m!468801 () Bool)

(assert (=> d!77903 m!468801))

(assert (=> d!77903 m!468627))

(declare-fun m!468803 () Bool)

(assert (=> d!77903 m!468803))

(assert (=> d!77903 m!468803))

(assert (=> d!77903 m!468627))

(declare-fun m!468805 () Bool)

(assert (=> d!77903 m!468805))

(assert (=> d!77903 m!468649))

(declare-fun m!468807 () Bool)

(assert (=> d!77903 m!468807))

(declare-fun m!468809 () Bool)

(assert (=> d!77903 m!468809))

(assert (=> b!488894 d!77903))

(declare-fun d!77905 () Bool)

(assert (=> d!77905 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44538 d!77905))

(declare-fun d!77917 () Bool)

(assert (=> d!77917 (= (array_inv!11009 a!3235) (bvsge (size!15577 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44538 d!77917))

(push 1)

(assert (not b!489075))

(assert (not b!488986))

(assert (not b!488963))

(assert (not bm!31358))

(assert (not bm!31351))

(assert (not d!77897))

(assert (not b!489066))

(assert (not b!488964))

(assert (not bm!31346))

(assert (not b!489065))

(assert (not b!488988))

(assert (not b!489041))

(assert (not d!77871))

(assert (not d!77903))

(assert (not b!488985))

(assert (not b!489056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

