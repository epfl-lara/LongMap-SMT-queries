; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61358 () Bool)

(assert start!61358)

(declare-fun b!686785 () Bool)

(declare-fun res!451930 () Bool)

(declare-fun e!391098 () Bool)

(assert (=> b!686785 (=> (not res!451930) (not e!391098))))

(declare-datatypes ((array!39672 0))(
  ( (array!39673 (arr!19010 (Array (_ BitVec 32) (_ BitVec 64))) (size!19385 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39672)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686785 (= res!451930 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686786 () Bool)

(declare-fun e!391103 () Bool)

(declare-datatypes ((List!13090 0))(
  ( (Nil!13087) (Cons!13086 (h!14131 (_ BitVec 64)) (t!19339 List!13090)) )
))
(declare-fun acc!681 () List!13090)

(declare-fun contains!3612 (List!13090 (_ BitVec 64)) Bool)

(assert (=> b!686786 (= e!391103 (not (contains!3612 acc!681 k0!2843)))))

(declare-fun b!686787 () Bool)

(declare-fun res!451932 () Bool)

(assert (=> b!686787 (=> (not res!451932) (not e!391098))))

(declare-fun arrayNoDuplicates!0 (array!39672 (_ BitVec 32) List!13090) Bool)

(assert (=> b!686787 (= res!451932 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13087))))

(declare-fun b!686788 () Bool)

(declare-fun e!391099 () Bool)

(declare-fun lt!315043 () List!13090)

(assert (=> b!686788 (= e!391099 (not (contains!3612 lt!315043 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686789 () Bool)

(declare-fun res!451943 () Bool)

(assert (=> b!686789 (=> (not res!451943) (not e!391098))))

(assert (=> b!686789 (= res!451943 (not (contains!3612 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686790 () Bool)

(declare-fun res!451929 () Bool)

(assert (=> b!686790 (=> (not res!451929) (not e!391098))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!686790 (= res!451929 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686791 () Bool)

(declare-fun e!391095 () Bool)

(assert (=> b!686791 (= e!391095 e!391099)))

(declare-fun res!451931 () Bool)

(assert (=> b!686791 (=> (not res!451931) (not e!391099))))

(assert (=> b!686791 (= res!451931 (not (contains!3612 lt!315043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686792 () Bool)

(declare-datatypes ((Unit!24200 0))(
  ( (Unit!24201) )
))
(declare-fun e!391097 () Unit!24200)

(declare-fun lt!315042 () Unit!24200)

(assert (=> b!686792 (= e!391097 lt!315042)))

(declare-fun lt!315045 () Unit!24200)

(declare-fun lemmaListSubSeqRefl!0 (List!13090) Unit!24200)

(assert (=> b!686792 (= lt!315045 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!215 (List!13090 List!13090) Bool)

(assert (=> b!686792 (subseq!215 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39672 List!13090 List!13090 (_ BitVec 32)) Unit!24200)

(declare-fun $colon$colon!379 (List!13090 (_ BitVec 64)) List!13090)

(assert (=> b!686792 (= lt!315042 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686792 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686793 () Bool)

(declare-fun res!451945 () Bool)

(assert (=> b!686793 (=> (not res!451945) (not e!391098))))

(declare-fun e!391102 () Bool)

(assert (=> b!686793 (= res!451945 e!391102)))

(declare-fun res!451936 () Bool)

(assert (=> b!686793 (=> res!451936 e!391102)))

(declare-fun e!391096 () Bool)

(assert (=> b!686793 (= res!451936 e!391096)))

(declare-fun res!451933 () Bool)

(assert (=> b!686793 (=> (not res!451933) (not e!391096))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686793 (= res!451933 (bvsgt from!3004 i!1382))))

(declare-fun b!686794 () Bool)

(declare-fun res!451941 () Bool)

(assert (=> b!686794 (=> (not res!451941) (not e!391098))))

(declare-fun noDuplicate!881 (List!13090) Bool)

(assert (=> b!686794 (= res!451941 (noDuplicate!881 acc!681))))

(declare-fun b!686795 () Bool)

(assert (=> b!686795 (= e!391102 e!391103)))

(declare-fun res!451944 () Bool)

(assert (=> b!686795 (=> (not res!451944) (not e!391103))))

(assert (=> b!686795 (= res!451944 (bvsle from!3004 i!1382))))

(declare-fun b!686796 () Bool)

(declare-fun e!391100 () Unit!24200)

(declare-fun Unit!24202 () Unit!24200)

(assert (=> b!686796 (= e!391100 Unit!24202)))

(declare-fun b!686797 () Bool)

(declare-fun res!451939 () Bool)

(assert (=> b!686797 (=> (not res!451939) (not e!391098))))

(assert (=> b!686797 (= res!451939 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19385 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686798 () Bool)

(declare-fun res!451935 () Bool)

(assert (=> b!686798 (=> (not res!451935) (not e!391098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686798 (= res!451935 (validKeyInArray!0 k0!2843))))

(declare-fun b!686799 () Bool)

(declare-fun Unit!24203 () Unit!24200)

(assert (=> b!686799 (= e!391100 Unit!24203)))

(declare-fun lt!315037 () Unit!24200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39672 (_ BitVec 64) (_ BitVec 32)) Unit!24200)

(assert (=> b!686799 (= lt!315037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686799 false))

(declare-fun res!451940 () Bool)

(assert (=> start!61358 (=> (not res!451940) (not e!391098))))

(assert (=> start!61358 (= res!451940 (and (bvslt (size!19385 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19385 a!3626))))))

(assert (=> start!61358 e!391098))

(assert (=> start!61358 true))

(declare-fun array_inv!14893 (array!39672) Bool)

(assert (=> start!61358 (array_inv!14893 a!3626)))

(declare-fun b!686800 () Bool)

(declare-fun res!451942 () Bool)

(assert (=> b!686800 (=> (not res!451942) (not e!391098))))

(assert (=> b!686800 (= res!451942 (not (contains!3612 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686801 () Bool)

(declare-fun Unit!24204 () Unit!24200)

(assert (=> b!686801 (= e!391097 Unit!24204)))

(declare-fun b!686802 () Bool)

(assert (=> b!686802 (= e!391096 (contains!3612 acc!681 k0!2843))))

(declare-fun b!686803 () Bool)

(declare-fun res!451938 () Bool)

(assert (=> b!686803 (=> (not res!451938) (not e!391098))))

(assert (=> b!686803 (= res!451938 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19385 a!3626))))))

(declare-fun b!686804 () Bool)

(declare-fun res!451934 () Bool)

(assert (=> b!686804 (=> res!451934 e!391095)))

(assert (=> b!686804 (= res!451934 (not (noDuplicate!881 lt!315043)))))

(declare-fun b!686805 () Bool)

(assert (=> b!686805 (= e!391098 (not e!391095))))

(declare-fun res!451937 () Bool)

(assert (=> b!686805 (=> res!451937 e!391095)))

(assert (=> b!686805 (= res!451937 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!686805 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315043)))

(declare-fun lt!315044 () Unit!24200)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39672 (_ BitVec 64) (_ BitVec 32) List!13090 List!13090) Unit!24200)

(assert (=> b!686805 (= lt!315044 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315043))))

(declare-fun -!180 (List!13090 (_ BitVec 64)) List!13090)

(assert (=> b!686805 (= (-!180 lt!315043 k0!2843) acc!681)))

(assert (=> b!686805 (= lt!315043 ($colon$colon!379 acc!681 k0!2843))))

(declare-fun lt!315041 () Unit!24200)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13090) Unit!24200)

(assert (=> b!686805 (= lt!315041 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!686805 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315040 () Unit!24200)

(assert (=> b!686805 (= lt!315040 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686805 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315038 () Unit!24200)

(assert (=> b!686805 (= lt!315038 e!391097)))

(declare-fun c!77795 () Bool)

(assert (=> b!686805 (= c!77795 (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)))))

(declare-fun lt!315039 () Unit!24200)

(assert (=> b!686805 (= lt!315039 e!391100)))

(declare-fun c!77796 () Bool)

(assert (=> b!686805 (= c!77796 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686805 (arrayContainsKey!0 (array!39673 (store (arr!19010 a!3626) i!1382 k0!2843) (size!19385 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61358 res!451940) b!686794))

(assert (= (and b!686794 res!451941) b!686800))

(assert (= (and b!686800 res!451942) b!686789))

(assert (= (and b!686789 res!451943) b!686793))

(assert (= (and b!686793 res!451933) b!686802))

(assert (= (and b!686793 (not res!451936)) b!686795))

(assert (= (and b!686795 res!451944) b!686786))

(assert (= (and b!686793 res!451945) b!686787))

(assert (= (and b!686787 res!451932) b!686790))

(assert (= (and b!686790 res!451929) b!686803))

(assert (= (and b!686803 res!451938) b!686798))

(assert (= (and b!686798 res!451935) b!686785))

(assert (= (and b!686785 res!451930) b!686797))

(assert (= (and b!686797 res!451939) b!686805))

(assert (= (and b!686805 c!77796) b!686799))

(assert (= (and b!686805 (not c!77796)) b!686796))

(assert (= (and b!686805 c!77795) b!686792))

(assert (= (and b!686805 (not c!77795)) b!686801))

(assert (= (and b!686805 (not res!451937)) b!686804))

(assert (= (and b!686804 (not res!451934)) b!686791))

(assert (= (and b!686791 res!451931) b!686788))

(declare-fun m!650349 () Bool)

(assert (=> b!686789 m!650349))

(declare-fun m!650351 () Bool)

(assert (=> b!686802 m!650351))

(declare-fun m!650353 () Bool)

(assert (=> b!686791 m!650353))

(declare-fun m!650355 () Bool)

(assert (=> b!686792 m!650355))

(declare-fun m!650357 () Bool)

(assert (=> b!686792 m!650357))

(declare-fun m!650359 () Bool)

(assert (=> b!686792 m!650359))

(declare-fun m!650361 () Bool)

(assert (=> b!686792 m!650361))

(assert (=> b!686792 m!650357))

(assert (=> b!686792 m!650359))

(declare-fun m!650363 () Bool)

(assert (=> b!686792 m!650363))

(declare-fun m!650365 () Bool)

(assert (=> b!686792 m!650365))

(declare-fun m!650367 () Bool)

(assert (=> b!686787 m!650367))

(declare-fun m!650369 () Bool)

(assert (=> b!686805 m!650369))

(assert (=> b!686805 m!650355))

(assert (=> b!686805 m!650357))

(declare-fun m!650371 () Bool)

(assert (=> b!686805 m!650371))

(declare-fun m!650373 () Bool)

(assert (=> b!686805 m!650373))

(declare-fun m!650375 () Bool)

(assert (=> b!686805 m!650375))

(assert (=> b!686805 m!650363))

(declare-fun m!650377 () Bool)

(assert (=> b!686805 m!650377))

(declare-fun m!650379 () Bool)

(assert (=> b!686805 m!650379))

(declare-fun m!650381 () Bool)

(assert (=> b!686805 m!650381))

(assert (=> b!686805 m!650357))

(declare-fun m!650383 () Bool)

(assert (=> b!686805 m!650383))

(declare-fun m!650385 () Bool)

(assert (=> b!686805 m!650385))

(assert (=> b!686805 m!650365))

(declare-fun m!650387 () Bool)

(assert (=> b!686790 m!650387))

(declare-fun m!650389 () Bool)

(assert (=> b!686804 m!650389))

(declare-fun m!650391 () Bool)

(assert (=> b!686799 m!650391))

(declare-fun m!650393 () Bool)

(assert (=> b!686798 m!650393))

(declare-fun m!650395 () Bool)

(assert (=> b!686800 m!650395))

(declare-fun m!650397 () Bool)

(assert (=> b!686788 m!650397))

(declare-fun m!650399 () Bool)

(assert (=> start!61358 m!650399))

(declare-fun m!650401 () Bool)

(assert (=> b!686794 m!650401))

(declare-fun m!650403 () Bool)

(assert (=> b!686785 m!650403))

(assert (=> b!686786 m!650351))

(check-sat (not b!686791) (not b!686787) (not b!686802) (not b!686800) (not start!61358) (not b!686799) (not b!686786) (not b!686798) (not b!686794) (not b!686805) (not b!686790) (not b!686804) (not b!686785) (not b!686788) (not b!686789) (not b!686792))
(check-sat)
(get-model)

(declare-fun d!94697 () Bool)

(declare-fun res!452052 () Bool)

(declare-fun e!391162 () Bool)

(assert (=> d!94697 (=> res!452052 e!391162)))

(get-info :version)

(assert (=> d!94697 (= res!452052 ((_ is Nil!13087) lt!315043))))

(assert (=> d!94697 (= (noDuplicate!881 lt!315043) e!391162)))

(declare-fun b!686936 () Bool)

(declare-fun e!391163 () Bool)

(assert (=> b!686936 (= e!391162 e!391163)))

(declare-fun res!452053 () Bool)

(assert (=> b!686936 (=> (not res!452053) (not e!391163))))

(assert (=> b!686936 (= res!452053 (not (contains!3612 (t!19339 lt!315043) (h!14131 lt!315043))))))

(declare-fun b!686937 () Bool)

(assert (=> b!686937 (= e!391163 (noDuplicate!881 (t!19339 lt!315043)))))

(assert (= (and d!94697 (not res!452052)) b!686936))

(assert (= (and b!686936 res!452053) b!686937))

(declare-fun m!650517 () Bool)

(assert (=> b!686936 m!650517))

(declare-fun m!650519 () Bool)

(assert (=> b!686937 m!650519))

(assert (=> b!686804 d!94697))

(declare-fun d!94699 () Bool)

(declare-fun res!452054 () Bool)

(declare-fun e!391164 () Bool)

(assert (=> d!94699 (=> res!452054 e!391164)))

(assert (=> d!94699 (= res!452054 ((_ is Nil!13087) acc!681))))

(assert (=> d!94699 (= (noDuplicate!881 acc!681) e!391164)))

(declare-fun b!686938 () Bool)

(declare-fun e!391165 () Bool)

(assert (=> b!686938 (= e!391164 e!391165)))

(declare-fun res!452055 () Bool)

(assert (=> b!686938 (=> (not res!452055) (not e!391165))))

(assert (=> b!686938 (= res!452055 (not (contains!3612 (t!19339 acc!681) (h!14131 acc!681))))))

(declare-fun b!686939 () Bool)

(assert (=> b!686939 (= e!391165 (noDuplicate!881 (t!19339 acc!681)))))

(assert (= (and d!94699 (not res!452054)) b!686938))

(assert (= (and b!686938 res!452055) b!686939))

(declare-fun m!650521 () Bool)

(assert (=> b!686938 m!650521))

(declare-fun m!650523 () Bool)

(assert (=> b!686939 m!650523))

(assert (=> b!686794 d!94699))

(declare-fun b!686950 () Bool)

(declare-fun e!391177 () Bool)

(assert (=> b!686950 (= e!391177 (contains!3612 lt!315043 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686951 () Bool)

(declare-fun e!391175 () Bool)

(declare-fun e!391176 () Bool)

(assert (=> b!686951 (= e!391175 e!391176)))

(declare-fun c!77811 () Bool)

(assert (=> b!686951 (= c!77811 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686952 () Bool)

(declare-fun call!34102 () Bool)

(assert (=> b!686952 (= e!391176 call!34102)))

(declare-fun b!686953 () Bool)

(declare-fun e!391174 () Bool)

(assert (=> b!686953 (= e!391174 e!391175)))

(declare-fun res!452063 () Bool)

(assert (=> b!686953 (=> (not res!452063) (not e!391175))))

(assert (=> b!686953 (= res!452063 (not e!391177))))

(declare-fun res!452064 () Bool)

(assert (=> b!686953 (=> (not res!452064) (not e!391177))))

(assert (=> b!686953 (= res!452064 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94701 () Bool)

(declare-fun res!452062 () Bool)

(assert (=> d!94701 (=> res!452062 e!391174)))

(assert (=> d!94701 (= res!452062 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19385 a!3626)))))

(assert (=> d!94701 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315043) e!391174)))

(declare-fun bm!34099 () Bool)

(assert (=> bm!34099 (= call!34102 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77811 (Cons!13086 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315043) lt!315043)))))

(declare-fun b!686954 () Bool)

(assert (=> b!686954 (= e!391176 call!34102)))

(assert (= (and d!94701 (not res!452062)) b!686953))

(assert (= (and b!686953 res!452064) b!686950))

(assert (= (and b!686953 res!452063) b!686951))

(assert (= (and b!686951 c!77811) b!686952))

(assert (= (and b!686951 (not c!77811)) b!686954))

(assert (= (or b!686952 b!686954) bm!34099))

(declare-fun m!650525 () Bool)

(assert (=> b!686950 m!650525))

(assert (=> b!686950 m!650525))

(declare-fun m!650527 () Bool)

(assert (=> b!686950 m!650527))

(assert (=> b!686951 m!650525))

(assert (=> b!686951 m!650525))

(declare-fun m!650529 () Bool)

(assert (=> b!686951 m!650529))

(assert (=> b!686953 m!650525))

(assert (=> b!686953 m!650525))

(assert (=> b!686953 m!650529))

(assert (=> bm!34099 m!650525))

(declare-fun m!650531 () Bool)

(assert (=> bm!34099 m!650531))

(assert (=> b!686805 d!94701))

(declare-fun b!686979 () Bool)

(declare-fun e!391198 () Bool)

(assert (=> b!686979 (= e!391198 (subseq!215 (t!19339 acc!681) (t!19339 acc!681)))))

(declare-fun b!686977 () Bool)

(declare-fun e!391201 () Bool)

(declare-fun e!391200 () Bool)

(assert (=> b!686977 (= e!391201 e!391200)))

(declare-fun res!452084 () Bool)

(assert (=> b!686977 (=> (not res!452084) (not e!391200))))

(assert (=> b!686977 (= res!452084 ((_ is Cons!13086) acc!681))))

(declare-fun b!686980 () Bool)

(declare-fun e!391199 () Bool)

(assert (=> b!686980 (= e!391199 (subseq!215 acc!681 (t!19339 acc!681)))))

(declare-fun b!686978 () Bool)

(assert (=> b!686978 (= e!391200 e!391199)))

(declare-fun res!452083 () Bool)

(assert (=> b!686978 (=> res!452083 e!391199)))

(assert (=> b!686978 (= res!452083 e!391198)))

(declare-fun res!452086 () Bool)

(assert (=> b!686978 (=> (not res!452086) (not e!391198))))

(assert (=> b!686978 (= res!452086 (= (h!14131 acc!681) (h!14131 acc!681)))))

(declare-fun d!94707 () Bool)

(declare-fun res!452085 () Bool)

(assert (=> d!94707 (=> res!452085 e!391201)))

(assert (=> d!94707 (= res!452085 ((_ is Nil!13087) acc!681))))

(assert (=> d!94707 (= (subseq!215 acc!681 acc!681) e!391201)))

(assert (= (and d!94707 (not res!452085)) b!686977))

(assert (= (and b!686977 res!452084) b!686978))

(assert (= (and b!686978 res!452086) b!686979))

(assert (= (and b!686978 (not res!452083)) b!686980))

(declare-fun m!650533 () Bool)

(assert (=> b!686979 m!650533))

(declare-fun m!650535 () Bool)

(assert (=> b!686980 m!650535))

(assert (=> b!686805 d!94707))

(declare-fun d!94711 () Bool)

(declare-fun res!452104 () Bool)

(declare-fun e!391220 () Bool)

(assert (=> d!94711 (=> res!452104 e!391220)))

(assert (=> d!94711 (= res!452104 (= (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94711 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391220)))

(declare-fun b!687000 () Bool)

(declare-fun e!391221 () Bool)

(assert (=> b!687000 (= e!391220 e!391221)))

(declare-fun res!452105 () Bool)

(assert (=> b!687000 (=> (not res!452105) (not e!391221))))

(assert (=> b!687000 (= res!452105 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19385 a!3626)))))

(declare-fun b!687001 () Bool)

(assert (=> b!687001 (= e!391221 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94711 (not res!452104)) b!687000))

(assert (= (and b!687000 res!452105) b!687001))

(assert (=> d!94711 m!650525))

(declare-fun m!650545 () Bool)

(assert (=> b!687001 m!650545))

(assert (=> b!686805 d!94711))

(declare-fun d!94717 () Bool)

(assert (=> d!94717 (= (-!180 ($colon$colon!379 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315102 () Unit!24200)

(declare-fun choose!16 ((_ BitVec 64) List!13090) Unit!24200)

(assert (=> d!94717 (= lt!315102 (choose!16 k0!2843 acc!681))))

(assert (=> d!94717 (not (contains!3612 acc!681 k0!2843))))

(assert (=> d!94717 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315102)))

(declare-fun bs!20118 () Bool)

(assert (= bs!20118 d!94717))

(assert (=> bs!20118 m!650379))

(assert (=> bs!20118 m!650379))

(declare-fun m!650559 () Bool)

(assert (=> bs!20118 m!650559))

(declare-fun m!650561 () Bool)

(assert (=> bs!20118 m!650561))

(assert (=> bs!20118 m!650351))

(assert (=> b!686805 d!94717))

(declare-fun d!94729 () Bool)

(declare-fun res!452116 () Bool)

(declare-fun e!391232 () Bool)

(assert (=> d!94729 (=> res!452116 e!391232)))

(assert (=> d!94729 (= res!452116 (= (select (arr!19010 (array!39673 (store (arr!19010 a!3626) i!1382 k0!2843) (size!19385 a!3626))) from!3004) k0!2843))))

(assert (=> d!94729 (= (arrayContainsKey!0 (array!39673 (store (arr!19010 a!3626) i!1382 k0!2843) (size!19385 a!3626)) k0!2843 from!3004) e!391232)))

(declare-fun b!687012 () Bool)

(declare-fun e!391233 () Bool)

(assert (=> b!687012 (= e!391232 e!391233)))

(declare-fun res!452117 () Bool)

(assert (=> b!687012 (=> (not res!452117) (not e!391233))))

(assert (=> b!687012 (= res!452117 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19385 (array!39673 (store (arr!19010 a!3626) i!1382 k0!2843) (size!19385 a!3626)))))))

(declare-fun b!687013 () Bool)

(assert (=> b!687013 (= e!391233 (arrayContainsKey!0 (array!39673 (store (arr!19010 a!3626) i!1382 k0!2843) (size!19385 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94729 (not res!452116)) b!687012))

(assert (= (and b!687012 res!452117) b!687013))

(declare-fun m!650563 () Bool)

(assert (=> d!94729 m!650563))

(declare-fun m!650565 () Bool)

(assert (=> b!687013 m!650565))

(assert (=> b!686805 d!94729))

(declare-fun bm!34107 () Bool)

(declare-fun call!34110 () List!13090)

(assert (=> bm!34107 (= call!34110 (-!180 (t!19339 lt!315043) k0!2843))))

(declare-fun b!687048 () Bool)

(declare-fun e!391265 () List!13090)

(declare-fun e!391264 () List!13090)

(assert (=> b!687048 (= e!391265 e!391264)))

(declare-fun c!77822 () Bool)

(assert (=> b!687048 (= c!77822 (= k0!2843 (h!14131 lt!315043)))))

(declare-fun b!687049 () Bool)

(assert (=> b!687049 (= e!391265 Nil!13087)))

(declare-fun d!94731 () Bool)

(declare-fun e!391263 () Bool)

(assert (=> d!94731 e!391263))

(declare-fun res!452140 () Bool)

(assert (=> d!94731 (=> (not res!452140) (not e!391263))))

(declare-fun lt!315111 () List!13090)

(declare-fun size!19388 (List!13090) Int)

(assert (=> d!94731 (= res!452140 (<= (size!19388 lt!315111) (size!19388 lt!315043)))))

(assert (=> d!94731 (= lt!315111 e!391265)))

(declare-fun c!77821 () Bool)

(assert (=> d!94731 (= c!77821 ((_ is Cons!13086) lt!315043))))

(assert (=> d!94731 (= (-!180 lt!315043 k0!2843) lt!315111)))

(declare-fun b!687050 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!297 (List!13090) (InoxSet (_ BitVec 64)))

(assert (=> b!687050 (= e!391263 (= (content!297 lt!315111) ((_ map and) (content!297 lt!315043) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!687051 () Bool)

(assert (=> b!687051 (= e!391264 (Cons!13086 (h!14131 lt!315043) call!34110))))

(declare-fun b!687052 () Bool)

(assert (=> b!687052 (= e!391264 call!34110)))

(assert (= (and d!94731 c!77821) b!687048))

(assert (= (and d!94731 (not c!77821)) b!687049))

(assert (= (and b!687048 c!77822) b!687052))

(assert (= (and b!687048 (not c!77822)) b!687051))

(assert (= (or b!687052 b!687051) bm!34107))

(assert (= (and d!94731 res!452140) b!687050))

(declare-fun m!650579 () Bool)

(assert (=> bm!34107 m!650579))

(declare-fun m!650581 () Bool)

(assert (=> d!94731 m!650581))

(declare-fun m!650583 () Bool)

(assert (=> d!94731 m!650583))

(declare-fun m!650585 () Bool)

(assert (=> b!687050 m!650585))

(declare-fun m!650587 () Bool)

(assert (=> b!687050 m!650587))

(declare-fun m!650589 () Bool)

(assert (=> b!687050 m!650589))

(assert (=> b!686805 d!94731))

(declare-fun d!94739 () Bool)

(assert (=> d!94739 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315043)))

(declare-fun lt!315117 () Unit!24200)

(declare-fun choose!66 (array!39672 (_ BitVec 64) (_ BitVec 32) List!13090 List!13090) Unit!24200)

(assert (=> d!94739 (= lt!315117 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315043))))

(assert (=> d!94739 (bvslt (size!19385 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94739 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315043) lt!315117)))

(declare-fun bs!20121 () Bool)

(assert (= bs!20121 d!94739))

(assert (=> bs!20121 m!650373))

(declare-fun m!650615 () Bool)

(assert (=> bs!20121 m!650615))

(assert (=> b!686805 d!94739))

(declare-fun d!94751 () Bool)

(assert (=> d!94751 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315120 () Unit!24200)

(declare-fun choose!36 (List!13090) Unit!24200)

(assert (=> d!94751 (= lt!315120 (choose!36 acc!681))))

(assert (=> d!94751 (= (lemmaListSubSeqRefl!0 acc!681) lt!315120)))

(declare-fun bs!20122 () Bool)

(assert (= bs!20122 d!94751))

(assert (=> bs!20122 m!650365))

(declare-fun m!650617 () Bool)

(assert (=> bs!20122 m!650617))

(assert (=> b!686805 d!94751))

(declare-fun d!94753 () Bool)

(assert (=> d!94753 (= (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)) (and (not (= (select (arr!19010 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19010 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686805 d!94753))

(declare-fun d!94755 () Bool)

(assert (=> d!94755 (= ($colon$colon!379 acc!681 k0!2843) (Cons!13086 k0!2843 acc!681))))

(assert (=> b!686805 d!94755))

(declare-fun b!687086 () Bool)

(declare-fun e!391299 () Bool)

(assert (=> b!687086 (= e!391299 (contains!3612 acc!681 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687087 () Bool)

(declare-fun e!391297 () Bool)

(declare-fun e!391298 () Bool)

(assert (=> b!687087 (= e!391297 e!391298)))

(declare-fun c!77826 () Bool)

(assert (=> b!687087 (= c!77826 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687088 () Bool)

(declare-fun call!34114 () Bool)

(assert (=> b!687088 (= e!391298 call!34114)))

(declare-fun b!687089 () Bool)

(declare-fun e!391296 () Bool)

(assert (=> b!687089 (= e!391296 e!391297)))

(declare-fun res!452169 () Bool)

(assert (=> b!687089 (=> (not res!452169) (not e!391297))))

(assert (=> b!687089 (= res!452169 (not e!391299))))

(declare-fun res!452170 () Bool)

(assert (=> b!687089 (=> (not res!452170) (not e!391299))))

(assert (=> b!687089 (= res!452170 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94757 () Bool)

(declare-fun res!452168 () Bool)

(assert (=> d!94757 (=> res!452168 e!391296)))

(assert (=> d!94757 (= res!452168 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19385 a!3626)))))

(assert (=> d!94757 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391296)))

(declare-fun bm!34111 () Bool)

(assert (=> bm!34111 (= call!34114 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77826 (Cons!13086 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687090 () Bool)

(assert (=> b!687090 (= e!391298 call!34114)))

(assert (= (and d!94757 (not res!452168)) b!687089))

(assert (= (and b!687089 res!452170) b!687086))

(assert (= (and b!687089 res!452169) b!687087))

(assert (= (and b!687087 c!77826) b!687088))

(assert (= (and b!687087 (not c!77826)) b!687090))

(assert (= (or b!687088 b!687090) bm!34111))

(assert (=> b!687086 m!650525))

(assert (=> b!687086 m!650525))

(declare-fun m!650631 () Bool)

(assert (=> b!687086 m!650631))

(assert (=> b!687087 m!650525))

(assert (=> b!687087 m!650525))

(assert (=> b!687087 m!650529))

(assert (=> b!687089 m!650525))

(assert (=> b!687089 m!650525))

(assert (=> b!687089 m!650529))

(assert (=> bm!34111 m!650525))

(declare-fun m!650637 () Bool)

(assert (=> bm!34111 m!650637))

(assert (=> b!686805 d!94757))

(declare-fun e!391307 () Bool)

(declare-fun b!687095 () Bool)

(assert (=> b!687095 (= e!391307 (contains!3612 acc!681 (select (arr!19010 a!3626) from!3004)))))

(declare-fun b!687096 () Bool)

(declare-fun e!391305 () Bool)

(declare-fun e!391306 () Bool)

(assert (=> b!687096 (= e!391305 e!391306)))

(declare-fun c!77827 () Bool)

(assert (=> b!687096 (= c!77827 (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)))))

(declare-fun b!687097 () Bool)

(declare-fun call!34115 () Bool)

(assert (=> b!687097 (= e!391306 call!34115)))

(declare-fun b!687098 () Bool)

(declare-fun e!391304 () Bool)

(assert (=> b!687098 (= e!391304 e!391305)))

(declare-fun res!452176 () Bool)

(assert (=> b!687098 (=> (not res!452176) (not e!391305))))

(assert (=> b!687098 (= res!452176 (not e!391307))))

(declare-fun res!452177 () Bool)

(assert (=> b!687098 (=> (not res!452177) (not e!391307))))

(assert (=> b!687098 (= res!452177 (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)))))

(declare-fun d!94765 () Bool)

(declare-fun res!452175 () Bool)

(assert (=> d!94765 (=> res!452175 e!391304)))

(assert (=> d!94765 (= res!452175 (bvsge from!3004 (size!19385 a!3626)))))

(assert (=> d!94765 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391304)))

(declare-fun bm!34112 () Bool)

(assert (=> bm!34112 (= call!34115 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77827 (Cons!13086 (select (arr!19010 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687099 () Bool)

(assert (=> b!687099 (= e!391306 call!34115)))

(assert (= (and d!94765 (not res!452175)) b!687098))

(assert (= (and b!687098 res!452177) b!687095))

(assert (= (and b!687098 res!452176) b!687096))

(assert (= (and b!687096 c!77827) b!687097))

(assert (= (and b!687096 (not c!77827)) b!687099))

(assert (= (or b!687097 b!687099) bm!34112))

(assert (=> b!687095 m!650357))

(assert (=> b!687095 m!650357))

(declare-fun m!650643 () Bool)

(assert (=> b!687095 m!650643))

(assert (=> b!687096 m!650357))

(assert (=> b!687096 m!650357))

(assert (=> b!687096 m!650383))

(assert (=> b!687098 m!650357))

(assert (=> b!687098 m!650357))

(assert (=> b!687098 m!650383))

(assert (=> bm!34112 m!650357))

(declare-fun m!650645 () Bool)

(assert (=> bm!34112 m!650645))

(assert (=> b!686790 d!94765))

(declare-fun d!94769 () Bool)

(declare-fun lt!315134 () Bool)

(assert (=> d!94769 (= lt!315134 (select (content!297 acc!681) k0!2843))))

(declare-fun e!391322 () Bool)

(assert (=> d!94769 (= lt!315134 e!391322)))

(declare-fun res!452191 () Bool)

(assert (=> d!94769 (=> (not res!452191) (not e!391322))))

(assert (=> d!94769 (= res!452191 ((_ is Cons!13086) acc!681))))

(assert (=> d!94769 (= (contains!3612 acc!681 k0!2843) lt!315134)))

(declare-fun b!687115 () Bool)

(declare-fun e!391323 () Bool)

(assert (=> b!687115 (= e!391322 e!391323)))

(declare-fun res!452192 () Bool)

(assert (=> b!687115 (=> res!452192 e!391323)))

(assert (=> b!687115 (= res!452192 (= (h!14131 acc!681) k0!2843))))

(declare-fun b!687116 () Bool)

(assert (=> b!687116 (= e!391323 (contains!3612 (t!19339 acc!681) k0!2843))))

(assert (= (and d!94769 res!452191) b!687115))

(assert (= (and b!687115 (not res!452192)) b!687116))

(declare-fun m!650653 () Bool)

(assert (=> d!94769 m!650653))

(declare-fun m!650655 () Bool)

(assert (=> d!94769 m!650655))

(declare-fun m!650659 () Bool)

(assert (=> b!687116 m!650659))

(assert (=> b!686802 d!94769))

(declare-fun d!94777 () Bool)

(declare-fun lt!315135 () Bool)

(assert (=> d!94777 (= lt!315135 (select (content!297 lt!315043) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391324 () Bool)

(assert (=> d!94777 (= lt!315135 e!391324)))

(declare-fun res!452193 () Bool)

(assert (=> d!94777 (=> (not res!452193) (not e!391324))))

(assert (=> d!94777 (= res!452193 ((_ is Cons!13086) lt!315043))))

(assert (=> d!94777 (= (contains!3612 lt!315043 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315135)))

(declare-fun b!687117 () Bool)

(declare-fun e!391325 () Bool)

(assert (=> b!687117 (= e!391324 e!391325)))

(declare-fun res!452194 () Bool)

(assert (=> b!687117 (=> res!452194 e!391325)))

(assert (=> b!687117 (= res!452194 (= (h!14131 lt!315043) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687118 () Bool)

(assert (=> b!687118 (= e!391325 (contains!3612 (t!19339 lt!315043) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94777 res!452193) b!687117))

(assert (= (and b!687117 (not res!452194)) b!687118))

(assert (=> d!94777 m!650587))

(declare-fun m!650667 () Bool)

(assert (=> d!94777 m!650667))

(declare-fun m!650669 () Bool)

(assert (=> b!687118 m!650669))

(assert (=> b!686791 d!94777))

(declare-fun d!94781 () Bool)

(assert (=> d!94781 (= (array_inv!14893 a!3626) (bvsge (size!19385 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61358 d!94781))

(declare-fun d!94785 () Bool)

(assert (=> d!94785 (= ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) (Cons!13086 (select (arr!19010 a!3626) from!3004) acc!681))))

(assert (=> b!686792 d!94785))

(assert (=> b!686792 d!94707))

(declare-fun d!94789 () Bool)

(assert (=> d!94789 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315142 () Unit!24200)

(declare-fun choose!80 (array!39672 List!13090 List!13090 (_ BitVec 32)) Unit!24200)

(assert (=> d!94789 (= lt!315142 (choose!80 a!3626 ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94789 (bvslt (size!19385 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94789 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315142)))

(declare-fun bs!20126 () Bool)

(assert (= bs!20126 d!94789))

(assert (=> bs!20126 m!650355))

(assert (=> bs!20126 m!650359))

(declare-fun m!650685 () Bool)

(assert (=> bs!20126 m!650685))

(assert (=> b!686792 d!94789))

(assert (=> b!686792 d!94751))

(assert (=> b!686792 d!94757))

(declare-fun d!94797 () Bool)

(assert (=> d!94797 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686798 d!94797))

(declare-fun b!687125 () Bool)

(declare-fun e!391335 () Bool)

(assert (=> b!687125 (= e!391335 (contains!3612 Nil!13087 (select (arr!19010 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687126 () Bool)

(declare-fun e!391333 () Bool)

(declare-fun e!391334 () Bool)

(assert (=> b!687126 (= e!391333 e!391334)))

(declare-fun c!77829 () Bool)

(assert (=> b!687126 (= c!77829 (validKeyInArray!0 (select (arr!19010 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687127 () Bool)

(declare-fun call!34117 () Bool)

(assert (=> b!687127 (= e!391334 call!34117)))

(declare-fun b!687128 () Bool)

(declare-fun e!391332 () Bool)

(assert (=> b!687128 (= e!391332 e!391333)))

(declare-fun res!452202 () Bool)

(assert (=> b!687128 (=> (not res!452202) (not e!391333))))

(assert (=> b!687128 (= res!452202 (not e!391335))))

(declare-fun res!452203 () Bool)

(assert (=> b!687128 (=> (not res!452203) (not e!391335))))

(assert (=> b!687128 (= res!452203 (validKeyInArray!0 (select (arr!19010 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94799 () Bool)

(declare-fun res!452201 () Bool)

(assert (=> d!94799 (=> res!452201 e!391332)))

(assert (=> d!94799 (= res!452201 (bvsge #b00000000000000000000000000000000 (size!19385 a!3626)))))

(assert (=> d!94799 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13087) e!391332)))

(declare-fun bm!34114 () Bool)

(assert (=> bm!34114 (= call!34117 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77829 (Cons!13086 (select (arr!19010 a!3626) #b00000000000000000000000000000000) Nil!13087) Nil!13087)))))

(declare-fun b!687129 () Bool)

(assert (=> b!687129 (= e!391334 call!34117)))

(assert (= (and d!94799 (not res!452201)) b!687128))

(assert (= (and b!687128 res!452203) b!687125))

(assert (= (and b!687128 res!452202) b!687126))

(assert (= (and b!687126 c!77829) b!687127))

(assert (= (and b!687126 (not c!77829)) b!687129))

(assert (= (or b!687127 b!687129) bm!34114))

(declare-fun m!650687 () Bool)

(assert (=> b!687125 m!650687))

(assert (=> b!687125 m!650687))

(declare-fun m!650689 () Bool)

(assert (=> b!687125 m!650689))

(assert (=> b!687126 m!650687))

(assert (=> b!687126 m!650687))

(declare-fun m!650691 () Bool)

(assert (=> b!687126 m!650691))

(assert (=> b!687128 m!650687))

(assert (=> b!687128 m!650687))

(assert (=> b!687128 m!650691))

(assert (=> bm!34114 m!650687))

(declare-fun m!650693 () Bool)

(assert (=> bm!34114 m!650693))

(assert (=> b!686787 d!94799))

(declare-fun d!94801 () Bool)

(declare-fun lt!315143 () Bool)

(assert (=> d!94801 (= lt!315143 (select (content!297 lt!315043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391336 () Bool)

(assert (=> d!94801 (= lt!315143 e!391336)))

(declare-fun res!452204 () Bool)

(assert (=> d!94801 (=> (not res!452204) (not e!391336))))

(assert (=> d!94801 (= res!452204 ((_ is Cons!13086) lt!315043))))

(assert (=> d!94801 (= (contains!3612 lt!315043 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315143)))

(declare-fun b!687130 () Bool)

(declare-fun e!391337 () Bool)

(assert (=> b!687130 (= e!391336 e!391337)))

(declare-fun res!452205 () Bool)

(assert (=> b!687130 (=> res!452205 e!391337)))

(assert (=> b!687130 (= res!452205 (= (h!14131 lt!315043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687131 () Bool)

(assert (=> b!687131 (= e!391337 (contains!3612 (t!19339 lt!315043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94801 res!452204) b!687130))

(assert (= (and b!687130 (not res!452205)) b!687131))

(assert (=> d!94801 m!650587))

(declare-fun m!650695 () Bool)

(assert (=> d!94801 m!650695))

(declare-fun m!650697 () Bool)

(assert (=> b!687131 m!650697))

(assert (=> b!686788 d!94801))

(declare-fun d!94803 () Bool)

(assert (=> d!94803 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315150 () Unit!24200)

(declare-fun choose!13 (array!39672 (_ BitVec 64) (_ BitVec 32)) Unit!24200)

(assert (=> d!94803 (= lt!315150 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94803 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94803 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315150)))

(declare-fun bs!20127 () Bool)

(assert (= bs!20127 d!94803))

(assert (=> bs!20127 m!650403))

(declare-fun m!650699 () Bool)

(assert (=> bs!20127 m!650699))

(assert (=> b!686799 d!94803))

(declare-fun d!94805 () Bool)

(declare-fun lt!315151 () Bool)

(assert (=> d!94805 (= lt!315151 (select (content!297 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391352 () Bool)

(assert (=> d!94805 (= lt!315151 e!391352)))

(declare-fun res!452210 () Bool)

(assert (=> d!94805 (=> (not res!452210) (not e!391352))))

(assert (=> d!94805 (= res!452210 ((_ is Cons!13086) acc!681))))

(assert (=> d!94805 (= (contains!3612 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315151)))

(declare-fun b!687152 () Bool)

(declare-fun e!391353 () Bool)

(assert (=> b!687152 (= e!391352 e!391353)))

(declare-fun res!452211 () Bool)

(assert (=> b!687152 (=> res!452211 e!391353)))

(assert (=> b!687152 (= res!452211 (= (h!14131 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687153 () Bool)

(assert (=> b!687153 (= e!391353 (contains!3612 (t!19339 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94805 res!452210) b!687152))

(assert (= (and b!687152 (not res!452211)) b!687153))

(assert (=> d!94805 m!650653))

(declare-fun m!650701 () Bool)

(assert (=> d!94805 m!650701))

(declare-fun m!650703 () Bool)

(assert (=> b!687153 m!650703))

(assert (=> b!686800 d!94805))

(declare-fun d!94807 () Bool)

(declare-fun lt!315152 () Bool)

(assert (=> d!94807 (= lt!315152 (select (content!297 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391354 () Bool)

(assert (=> d!94807 (= lt!315152 e!391354)))

(declare-fun res!452212 () Bool)

(assert (=> d!94807 (=> (not res!452212) (not e!391354))))

(assert (=> d!94807 (= res!452212 ((_ is Cons!13086) acc!681))))

(assert (=> d!94807 (= (contains!3612 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315152)))

(declare-fun b!687154 () Bool)

(declare-fun e!391355 () Bool)

(assert (=> b!687154 (= e!391354 e!391355)))

(declare-fun res!452213 () Bool)

(assert (=> b!687154 (=> res!452213 e!391355)))

(assert (=> b!687154 (= res!452213 (= (h!14131 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687155 () Bool)

(assert (=> b!687155 (= e!391355 (contains!3612 (t!19339 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94807 res!452212) b!687154))

(assert (= (and b!687154 (not res!452213)) b!687155))

(assert (=> d!94807 m!650653))

(declare-fun m!650705 () Bool)

(assert (=> d!94807 m!650705))

(declare-fun m!650707 () Bool)

(assert (=> b!687155 m!650707))

(assert (=> b!686789 d!94807))

(declare-fun d!94809 () Bool)

(declare-fun res!452215 () Bool)

(declare-fun e!391359 () Bool)

(assert (=> d!94809 (=> res!452215 e!391359)))

(assert (=> d!94809 (= res!452215 (= (select (arr!19010 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94809 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391359)))

(declare-fun b!687161 () Bool)

(declare-fun e!391360 () Bool)

(assert (=> b!687161 (= e!391359 e!391360)))

(declare-fun res!452216 () Bool)

(assert (=> b!687161 (=> (not res!452216) (not e!391360))))

(assert (=> b!687161 (= res!452216 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19385 a!3626)))))

(declare-fun b!687162 () Bool)

(assert (=> b!687162 (= e!391360 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94809 (not res!452215)) b!687161))

(assert (= (and b!687161 res!452216) b!687162))

(assert (=> d!94809 m!650687))

(declare-fun m!650709 () Bool)

(assert (=> b!687162 m!650709))

(assert (=> b!686785 d!94809))

(assert (=> b!686786 d!94769))

(check-sat (not b!687096) (not d!94769) (not d!94739) (not b!686950) (not b!687098) (not d!94717) (not b!686936) (not bm!34099) (not bm!34107) (not b!686939) (not b!687001) (not b!687013) (not b!687131) (not d!94731) (not d!94801) (not b!687155) (not b!686937) (not bm!34112) (not d!94777) (not b!687125) (not b!687162) (not d!94807) (not b!687086) (not b!687153) (not d!94803) (not d!94789) (not b!687089) (not b!687118) (not b!687095) (not b!687050) (not b!687087) (not bm!34111) (not b!686953) (not bm!34114) (not b!687128) (not b!687116) (not b!686979) (not b!686951) (not d!94751) (not b!686938) (not b!686980) (not b!687126) (not d!94805))
(check-sat)
