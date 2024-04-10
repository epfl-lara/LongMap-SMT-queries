; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63208 () Bool)

(assert start!63208)

(declare-fun b!711883 () Bool)

(declare-fun e!400563 () Bool)

(declare-fun e!400562 () Bool)

(assert (=> b!711883 (= e!400563 e!400562)))

(declare-fun res!475126 () Bool)

(assert (=> b!711883 (=> res!475126 e!400562)))

(declare-datatypes ((List!13394 0))(
  ( (Nil!13391) (Cons!13390 (h!14435 (_ BitVec 64)) (t!19703 List!13394)) )
))
(declare-fun lt!318511 () List!13394)

(declare-fun contains!3971 (List!13394 (_ BitVec 64)) Bool)

(assert (=> b!711883 (= res!475126 (contains!3971 lt!318511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711884 () Bool)

(declare-fun res!475150 () Bool)

(declare-fun e!400565 () Bool)

(assert (=> b!711884 (=> (not res!475150) (not e!400565))))

(declare-datatypes ((array!40420 0))(
  ( (array!40421 (arr!19353 (Array (_ BitVec 32) (_ BitVec 64))) (size!19758 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40420)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711884 (= res!475150 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!711885 () Bool)

(declare-fun res!475138 () Bool)

(assert (=> b!711885 (=> (not res!475138) (not e!400565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711885 (= res!475138 (validKeyInArray!0 (select (arr!19353 a!3591) from!2969)))))

(declare-fun b!711886 () Bool)

(declare-fun res!475129 () Bool)

(assert (=> b!711886 (=> (not res!475129) (not e!400563))))

(declare-fun lt!318512 () List!13394)

(declare-fun noDuplicate!1218 (List!13394) Bool)

(assert (=> b!711886 (= res!475129 (noDuplicate!1218 lt!318512))))

(declare-fun b!711887 () Bool)

(declare-fun res!475137 () Bool)

(assert (=> b!711887 (=> (not res!475137) (not e!400565))))

(declare-fun acc!652 () List!13394)

(assert (=> b!711887 (= res!475137 (not (contains!3971 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711888 () Bool)

(declare-fun res!475134 () Bool)

(assert (=> b!711888 (=> (not res!475134) (not e!400563))))

(declare-fun arrayNoDuplicates!0 (array!40420 (_ BitVec 32) List!13394) Bool)

(assert (=> b!711888 (= res!475134 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318512))))

(declare-fun b!711889 () Bool)

(declare-fun res!475142 () Bool)

(assert (=> b!711889 (=> (not res!475142) (not e!400565))))

(assert (=> b!711889 (= res!475142 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19758 a!3591)))))

(declare-fun b!711890 () Bool)

(declare-fun res!475124 () Bool)

(assert (=> b!711890 (=> (not res!475124) (not e!400563))))

(assert (=> b!711890 (= res!475124 (contains!3971 lt!318511 k!2824))))

(declare-fun b!711891 () Bool)

(declare-fun res!475123 () Bool)

(assert (=> b!711891 (=> (not res!475123) (not e!400565))))

(assert (=> b!711891 (= res!475123 (not (contains!3971 acc!652 k!2824)))))

(declare-fun b!711893 () Bool)

(declare-fun res!475144 () Bool)

(assert (=> b!711893 (=> (not res!475144) (not e!400565))))

(assert (=> b!711893 (= res!475144 (not (contains!3971 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711894 () Bool)

(declare-fun res!475139 () Bool)

(assert (=> b!711894 (=> (not res!475139) (not e!400565))))

(assert (=> b!711894 (= res!475139 (validKeyInArray!0 k!2824))))

(declare-fun b!711895 () Bool)

(declare-fun res!475131 () Bool)

(assert (=> b!711895 (=> (not res!475131) (not e!400563))))

(assert (=> b!711895 (= res!475131 (not (contains!3971 lt!318512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711896 () Bool)

(declare-fun res!475127 () Bool)

(assert (=> b!711896 (=> (not res!475127) (not e!400563))))

(declare-fun -!381 (List!13394 (_ BitVec 64)) List!13394)

(assert (=> b!711896 (= res!475127 (= (-!381 lt!318511 k!2824) lt!318512))))

(declare-fun b!711897 () Bool)

(declare-fun res!475143 () Bool)

(assert (=> b!711897 (=> (not res!475143) (not e!400563))))

(assert (=> b!711897 (= res!475143 (not (contains!3971 lt!318512 k!2824)))))

(declare-fun b!711898 () Bool)

(declare-fun res!475141 () Bool)

(assert (=> b!711898 (=> (not res!475141) (not e!400565))))

(declare-fun newAcc!49 () List!13394)

(assert (=> b!711898 (= res!475141 (= (-!381 newAcc!49 k!2824) acc!652))))

(declare-fun b!711899 () Bool)

(declare-fun res!475148 () Bool)

(assert (=> b!711899 (=> (not res!475148) (not e!400565))))

(assert (=> b!711899 (= res!475148 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711900 () Bool)

(declare-fun res!475146 () Bool)

(assert (=> b!711900 (=> (not res!475146) (not e!400563))))

(assert (=> b!711900 (= res!475146 (not (contains!3971 lt!318512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711901 () Bool)

(declare-fun res!475128 () Bool)

(assert (=> b!711901 (=> (not res!475128) (not e!400563))))

(assert (=> b!711901 (= res!475128 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711902 () Bool)

(declare-fun res!475125 () Bool)

(assert (=> b!711902 (=> (not res!475125) (not e!400565))))

(assert (=> b!711902 (= res!475125 (not (contains!3971 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711903 () Bool)

(declare-fun res!475149 () Bool)

(assert (=> b!711903 (=> (not res!475149) (not e!400565))))

(declare-fun subseq!416 (List!13394 List!13394) Bool)

(assert (=> b!711903 (= res!475149 (subseq!416 acc!652 newAcc!49))))

(declare-fun b!711904 () Bool)

(declare-fun res!475136 () Bool)

(assert (=> b!711904 (=> (not res!475136) (not e!400563))))

(assert (=> b!711904 (= res!475136 (subseq!416 lt!318512 lt!318511))))

(declare-fun b!711905 () Bool)

(declare-fun res!475133 () Bool)

(assert (=> b!711905 (=> (not res!475133) (not e!400565))))

(assert (=> b!711905 (= res!475133 (contains!3971 newAcc!49 k!2824))))

(declare-fun res!475145 () Bool)

(assert (=> start!63208 (=> (not res!475145) (not e!400565))))

(assert (=> start!63208 (= res!475145 (and (bvslt (size!19758 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19758 a!3591))))))

(assert (=> start!63208 e!400565))

(assert (=> start!63208 true))

(declare-fun array_inv!15149 (array!40420) Bool)

(assert (=> start!63208 (array_inv!15149 a!3591)))

(declare-fun b!711892 () Bool)

(assert (=> b!711892 (= e!400562 (contains!3971 lt!318511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711906 () Bool)

(declare-fun res!475135 () Bool)

(assert (=> b!711906 (=> (not res!475135) (not e!400563))))

(assert (=> b!711906 (= res!475135 (noDuplicate!1218 lt!318511))))

(declare-fun b!711907 () Bool)

(declare-fun res!475130 () Bool)

(assert (=> b!711907 (=> (not res!475130) (not e!400565))))

(assert (=> b!711907 (= res!475130 (not (contains!3971 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711908 () Bool)

(assert (=> b!711908 (= e!400565 e!400563)))

(declare-fun res!475140 () Bool)

(assert (=> b!711908 (=> (not res!475140) (not e!400563))))

(assert (=> b!711908 (= res!475140 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!527 (List!13394 (_ BitVec 64)) List!13394)

(assert (=> b!711908 (= lt!318511 ($colon$colon!527 newAcc!49 (select (arr!19353 a!3591) from!2969)))))

(assert (=> b!711908 (= lt!318512 ($colon$colon!527 acc!652 (select (arr!19353 a!3591) from!2969)))))

(declare-fun b!711909 () Bool)

(declare-fun res!475132 () Bool)

(assert (=> b!711909 (=> (not res!475132) (not e!400565))))

(assert (=> b!711909 (= res!475132 (noDuplicate!1218 newAcc!49))))

(declare-fun b!711910 () Bool)

(declare-fun res!475147 () Bool)

(assert (=> b!711910 (=> (not res!475147) (not e!400565))))

(assert (=> b!711910 (= res!475147 (noDuplicate!1218 acc!652))))

(assert (= (and start!63208 res!475145) b!711910))

(assert (= (and b!711910 res!475147) b!711909))

(assert (= (and b!711909 res!475132) b!711887))

(assert (= (and b!711887 res!475137) b!711893))

(assert (= (and b!711893 res!475144) b!711884))

(assert (= (and b!711884 res!475150) b!711891))

(assert (= (and b!711891 res!475123) b!711894))

(assert (= (and b!711894 res!475139) b!711899))

(assert (= (and b!711899 res!475148) b!711903))

(assert (= (and b!711903 res!475149) b!711905))

(assert (= (and b!711905 res!475133) b!711898))

(assert (= (and b!711898 res!475141) b!711907))

(assert (= (and b!711907 res!475130) b!711902))

(assert (= (and b!711902 res!475125) b!711889))

(assert (= (and b!711889 res!475142) b!711885))

(assert (= (and b!711885 res!475138) b!711908))

(assert (= (and b!711908 res!475140) b!711886))

(assert (= (and b!711886 res!475129) b!711906))

(assert (= (and b!711906 res!475135) b!711895))

(assert (= (and b!711895 res!475131) b!711900))

(assert (= (and b!711900 res!475146) b!711901))

(assert (= (and b!711901 res!475128) b!711897))

(assert (= (and b!711897 res!475143) b!711888))

(assert (= (and b!711888 res!475134) b!711904))

(assert (= (and b!711904 res!475136) b!711890))

(assert (= (and b!711890 res!475124) b!711896))

(assert (= (and b!711896 res!475127) b!711883))

(assert (= (and b!711883 (not res!475126)) b!711892))

(declare-fun m!668863 () Bool)

(assert (=> b!711901 m!668863))

(declare-fun m!668865 () Bool)

(assert (=> b!711897 m!668865))

(declare-fun m!668867 () Bool)

(assert (=> b!711886 m!668867))

(declare-fun m!668869 () Bool)

(assert (=> b!711883 m!668869))

(declare-fun m!668871 () Bool)

(assert (=> b!711887 m!668871))

(declare-fun m!668873 () Bool)

(assert (=> start!63208 m!668873))

(declare-fun m!668875 () Bool)

(assert (=> b!711890 m!668875))

(declare-fun m!668877 () Bool)

(assert (=> b!711896 m!668877))

(declare-fun m!668879 () Bool)

(assert (=> b!711908 m!668879))

(assert (=> b!711908 m!668879))

(declare-fun m!668881 () Bool)

(assert (=> b!711908 m!668881))

(assert (=> b!711908 m!668879))

(declare-fun m!668883 () Bool)

(assert (=> b!711908 m!668883))

(declare-fun m!668885 () Bool)

(assert (=> b!711906 m!668885))

(declare-fun m!668887 () Bool)

(assert (=> b!711905 m!668887))

(declare-fun m!668889 () Bool)

(assert (=> b!711899 m!668889))

(declare-fun m!668891 () Bool)

(assert (=> b!711884 m!668891))

(declare-fun m!668893 () Bool)

(assert (=> b!711898 m!668893))

(declare-fun m!668895 () Bool)

(assert (=> b!711903 m!668895))

(declare-fun m!668897 () Bool)

(assert (=> b!711902 m!668897))

(declare-fun m!668899 () Bool)

(assert (=> b!711904 m!668899))

(declare-fun m!668901 () Bool)

(assert (=> b!711910 m!668901))

(declare-fun m!668903 () Bool)

(assert (=> b!711891 m!668903))

(declare-fun m!668905 () Bool)

(assert (=> b!711900 m!668905))

(declare-fun m!668907 () Bool)

(assert (=> b!711909 m!668907))

(assert (=> b!711885 m!668879))

(assert (=> b!711885 m!668879))

(declare-fun m!668909 () Bool)

(assert (=> b!711885 m!668909))

(declare-fun m!668911 () Bool)

(assert (=> b!711895 m!668911))

(declare-fun m!668913 () Bool)

(assert (=> b!711907 m!668913))

(declare-fun m!668915 () Bool)

(assert (=> b!711894 m!668915))

(declare-fun m!668917 () Bool)

(assert (=> b!711888 m!668917))

(declare-fun m!668919 () Bool)

(assert (=> b!711893 m!668919))

(declare-fun m!668921 () Bool)

(assert (=> b!711892 m!668921))

(push 1)

(assert (not b!711910))

(assert (not start!63208))

(assert (not b!711893))

(assert (not b!711897))

(assert (not b!711901))

(assert (not b!711891))

(assert (not b!711895))

(assert (not b!711887))

(assert (not b!711898))

(assert (not b!711907))

(assert (not b!711903))

(assert (not b!711908))

(assert (not b!711902))

(assert (not b!711899))

(assert (not b!711890))

(assert (not b!711904))

(assert (not b!711909))

(assert (not b!711900))

(assert (not b!711906))

(assert (not b!711884))

(assert (not b!711892))

(assert (not b!711896))

(assert (not b!711894))

(assert (not b!711886))

(assert (not b!711885))

(assert (not b!711888))

(assert (not b!711883))

(assert (not b!711905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97859 () Bool)

(declare-fun res!475366 () Bool)

(declare-fun e!400646 () Bool)

(assert (=> d!97859 (=> res!475366 e!400646)))

(assert (=> d!97859 (= res!475366 (is-Nil!13391 acc!652))))

(assert (=> d!97859 (= (noDuplicate!1218 acc!652) e!400646)))

(declare-fun b!712142 () Bool)

(declare-fun e!400647 () Bool)

(assert (=> b!712142 (= e!400646 e!400647)))

(declare-fun res!475367 () Bool)

(assert (=> b!712142 (=> (not res!475367) (not e!400647))))

(assert (=> b!712142 (= res!475367 (not (contains!3971 (t!19703 acc!652) (h!14435 acc!652))))))

(declare-fun b!712143 () Bool)

(assert (=> b!712143 (= e!400647 (noDuplicate!1218 (t!19703 acc!652)))))

(assert (= (and d!97859 (not res!475366)) b!712142))

(assert (= (and b!712142 res!475367) b!712143))

(declare-fun m!669085 () Bool)

(assert (=> b!712142 m!669085))

(declare-fun m!669087 () Bool)

(assert (=> b!712143 m!669087))

(assert (=> b!711910 d!97859))

(declare-fun d!97863 () Bool)

(declare-fun lt!318537 () Bool)

(declare-fun content!360 (List!13394) (Set (_ BitVec 64)))

(assert (=> d!97863 (= lt!318537 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!360 acc!652)))))

(declare-fun e!400657 () Bool)

(assert (=> d!97863 (= lt!318537 e!400657)))

(declare-fun res!475376 () Bool)

(assert (=> d!97863 (=> (not res!475376) (not e!400657))))

(assert (=> d!97863 (= res!475376 (is-Cons!13390 acc!652))))

(assert (=> d!97863 (= (contains!3971 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318537)))

(declare-fun b!712153 () Bool)

(declare-fun e!400656 () Bool)

(assert (=> b!712153 (= e!400657 e!400656)))

(declare-fun res!475375 () Bool)

(assert (=> b!712153 (=> res!475375 e!400656)))

(assert (=> b!712153 (= res!475375 (= (h!14435 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712154 () Bool)

(assert (=> b!712154 (= e!400656 (contains!3971 (t!19703 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97863 res!475376) b!712153))

(assert (= (and b!712153 (not res!475375)) b!712154))

(declare-fun m!669097 () Bool)

(assert (=> d!97863 m!669097))

(declare-fun m!669099 () Bool)

(assert (=> d!97863 m!669099))

(declare-fun m!669101 () Bool)

(assert (=> b!712154 m!669101))

(assert (=> b!711887 d!97863))

(declare-fun d!97869 () Bool)

(declare-fun res!475385 () Bool)

(declare-fun e!400666 () Bool)

(assert (=> d!97869 (=> res!475385 e!400666)))

(assert (=> d!97869 (= res!475385 (is-Nil!13391 newAcc!49))))

(assert (=> d!97869 (= (noDuplicate!1218 newAcc!49) e!400666)))

(declare-fun b!712163 () Bool)

(declare-fun e!400667 () Bool)

(assert (=> b!712163 (= e!400666 e!400667)))

(declare-fun res!475386 () Bool)

(assert (=> b!712163 (=> (not res!475386) (not e!400667))))

(assert (=> b!712163 (= res!475386 (not (contains!3971 (t!19703 newAcc!49) (h!14435 newAcc!49))))))

(declare-fun b!712166 () Bool)

(assert (=> b!712166 (= e!400667 (noDuplicate!1218 (t!19703 newAcc!49)))))

(assert (= (and d!97869 (not res!475385)) b!712163))

(assert (= (and b!712163 res!475386) b!712166))

(declare-fun m!669103 () Bool)

(assert (=> b!712163 m!669103))

(declare-fun m!669105 () Bool)

(assert (=> b!712166 m!669105))

(assert (=> b!711909 d!97869))

(declare-fun bm!34549 () Bool)

(declare-fun c!78762 () Bool)

(declare-fun call!34552 () Bool)

(assert (=> bm!34549 (= call!34552 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78762 (Cons!13390 (select (arr!19353 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318512) lt!318512)))))

(declare-fun b!712219 () Bool)

(declare-fun e!400717 () Bool)

(assert (=> b!712219 (= e!400717 call!34552)))

(declare-fun b!712220 () Bool)

(declare-fun e!400719 () Bool)

(assert (=> b!712220 (= e!400719 e!400717)))

(assert (=> b!712220 (= c!78762 (validKeyInArray!0 (select (arr!19353 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712221 () Bool)

(declare-fun e!400716 () Bool)

(assert (=> b!712221 (= e!400716 (contains!3971 lt!318512 (select (arr!19353 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97871 () Bool)

(declare-fun res!475429 () Bool)

(declare-fun e!400718 () Bool)

(assert (=> d!97871 (=> res!475429 e!400718)))

(assert (=> d!97871 (= res!475429 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19758 a!3591)))))

(assert (=> d!97871 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318512) e!400718)))

(declare-fun b!712222 () Bool)

(assert (=> b!712222 (= e!400718 e!400719)))

(declare-fun res!475431 () Bool)

(assert (=> b!712222 (=> (not res!475431) (not e!400719))))

(assert (=> b!712222 (= res!475431 (not e!400716))))

(declare-fun res!475430 () Bool)

(assert (=> b!712222 (=> (not res!475430) (not e!400716))))

(assert (=> b!712222 (= res!475430 (validKeyInArray!0 (select (arr!19353 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712223 () Bool)

(assert (=> b!712223 (= e!400717 call!34552)))

(assert (= (and d!97871 (not res!475429)) b!712222))

(assert (= (and b!712222 res!475430) b!712221))

(assert (= (and b!712222 res!475431) b!712220))

(assert (= (and b!712220 c!78762) b!712219))

(assert (= (and b!712220 (not c!78762)) b!712223))

(assert (= (or b!712219 b!712223) bm!34549))

(declare-fun m!669165 () Bool)

(assert (=> bm!34549 m!669165))

(declare-fun m!669173 () Bool)

(assert (=> bm!34549 m!669173))

(assert (=> b!712220 m!669165))

(assert (=> b!712220 m!669165))

(declare-fun m!669177 () Bool)

(assert (=> b!712220 m!669177))

(assert (=> b!712221 m!669165))

(assert (=> b!712221 m!669165))

(declare-fun m!669179 () Bool)

(assert (=> b!712221 m!669179))

(assert (=> b!712222 m!669165))

(assert (=> b!712222 m!669165))

(assert (=> b!712222 m!669177))

(assert (=> b!711888 d!97871))

(declare-fun d!97913 () Bool)

(declare-fun lt!318548 () Bool)

(assert (=> d!97913 (= lt!318548 (set.member k!2824 (content!360 acc!652)))))

(declare-fun e!400728 () Bool)

(assert (=> d!97913 (= lt!318548 e!400728)))

(declare-fun res!475438 () Bool)

(assert (=> d!97913 (=> (not res!475438) (not e!400728))))

(assert (=> d!97913 (= res!475438 (is-Cons!13390 acc!652))))

(assert (=> d!97913 (= (contains!3971 acc!652 k!2824) lt!318548)))

(declare-fun b!712233 () Bool)

(declare-fun e!400727 () Bool)

(assert (=> b!712233 (= e!400728 e!400727)))

(declare-fun res!475437 () Bool)

(assert (=> b!712233 (=> res!475437 e!400727)))

(assert (=> b!712233 (= res!475437 (= (h!14435 acc!652) k!2824))))

(declare-fun b!712234 () Bool)

(assert (=> b!712234 (= e!400727 (contains!3971 (t!19703 acc!652) k!2824))))

(assert (= (and d!97913 res!475438) b!712233))

(assert (= (and b!712233 (not res!475437)) b!712234))

(assert (=> d!97913 m!669097))

(declare-fun m!669191 () Bool)

(assert (=> d!97913 m!669191))

(declare-fun m!669195 () Bool)

(assert (=> b!712234 m!669195))

(assert (=> b!711891 d!97913))

(declare-fun d!97919 () Bool)

(declare-fun lt!318550 () Bool)

(assert (=> d!97919 (= lt!318550 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!360 lt!318511)))))

(declare-fun e!400732 () Bool)

(assert (=> d!97919 (= lt!318550 e!400732)))

(declare-fun res!475442 () Bool)

(assert (=> d!97919 (=> (not res!475442) (not e!400732))))

(assert (=> d!97919 (= res!475442 (is-Cons!13390 lt!318511))))

(assert (=> d!97919 (= (contains!3971 lt!318511 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318550)))

(declare-fun b!712237 () Bool)

(declare-fun e!400731 () Bool)

(assert (=> b!712237 (= e!400732 e!400731)))

(declare-fun res!475441 () Bool)

(assert (=> b!712237 (=> res!475441 e!400731)))

(assert (=> b!712237 (= res!475441 (= (h!14435 lt!318511) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712238 () Bool)

(assert (=> b!712238 (= e!400731 (contains!3971 (t!19703 lt!318511) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97919 res!475442) b!712237))

(assert (= (and b!712237 (not res!475441)) b!712238))

(declare-fun m!669199 () Bool)

(assert (=> d!97919 m!669199))

(declare-fun m!669205 () Bool)

(assert (=> d!97919 m!669205))

(declare-fun m!669207 () Bool)

(assert (=> b!712238 m!669207))

(assert (=> b!711892 d!97919))

(declare-fun d!97927 () Bool)

(declare-fun lt!318552 () Bool)

(assert (=> d!97927 (= lt!318552 (set.member k!2824 (content!360 lt!318511)))))

(declare-fun e!400740 () Bool)

(assert (=> d!97927 (= lt!318552 e!400740)))

(declare-fun res!475450 () Bool)

(assert (=> d!97927 (=> (not res!475450) (not e!400740))))

(assert (=> d!97927 (= res!475450 (is-Cons!13390 lt!318511))))

(assert (=> d!97927 (= (contains!3971 lt!318511 k!2824) lt!318552)))

(declare-fun b!712245 () Bool)

(declare-fun e!400739 () Bool)

(assert (=> b!712245 (= e!400740 e!400739)))

(declare-fun res!475449 () Bool)

(assert (=> b!712245 (=> res!475449 e!400739)))

(assert (=> b!712245 (= res!475449 (= (h!14435 lt!318511) k!2824))))

(declare-fun b!712246 () Bool)

(assert (=> b!712246 (= e!400739 (contains!3971 (t!19703 lt!318511) k!2824))))

(assert (= (and d!97927 res!475450) b!712245))

(assert (= (and b!712245 (not res!475449)) b!712246))

(assert (=> d!97927 m!669199))

(declare-fun m!669213 () Bool)

(assert (=> d!97927 m!669213))

(declare-fun m!669215 () Bool)

(assert (=> b!712246 m!669215))

(assert (=> b!711890 d!97927))

(declare-fun d!97929 () Bool)

(assert (=> d!97929 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711894 d!97929))

(declare-fun d!97931 () Bool)

(assert (=> d!97931 (= (array_inv!15149 a!3591) (bvsge (size!19758 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63208 d!97931))

(declare-fun d!97933 () Bool)

(declare-fun lt!318553 () Bool)

(assert (=> d!97933 (= lt!318553 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!360 acc!652)))))

(declare-fun e!400742 () Bool)

(assert (=> d!97933 (= lt!318553 e!400742)))

(declare-fun res!475452 () Bool)

(assert (=> d!97933 (=> (not res!475452) (not e!400742))))

(assert (=> d!97933 (= res!475452 (is-Cons!13390 acc!652))))

(assert (=> d!97933 (= (contains!3971 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318553)))

(declare-fun b!712247 () Bool)

(declare-fun e!400741 () Bool)

(assert (=> b!712247 (= e!400742 e!400741)))

(declare-fun res!475451 () Bool)

(assert (=> b!712247 (=> res!475451 e!400741)))

(assert (=> b!712247 (= res!475451 (= (h!14435 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712248 () Bool)

(assert (=> b!712248 (= e!400741 (contains!3971 (t!19703 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97933 res!475452) b!712247))

(assert (= (and b!712247 (not res!475451)) b!712248))

(assert (=> d!97933 m!669097))

(declare-fun m!669217 () Bool)

(assert (=> d!97933 m!669217))

(declare-fun m!669219 () Bool)

(assert (=> b!712248 m!669219))

(assert (=> b!711893 d!97933))

(declare-fun d!97935 () Bool)

(declare-fun lt!318554 () Bool)

(assert (=> d!97935 (= lt!318554 (set.member k!2824 (content!360 lt!318512)))))

(declare-fun e!400744 () Bool)

(assert (=> d!97935 (= lt!318554 e!400744)))

(declare-fun res!475454 () Bool)

(assert (=> d!97935 (=> (not res!475454) (not e!400744))))

(assert (=> d!97935 (= res!475454 (is-Cons!13390 lt!318512))))

(assert (=> d!97935 (= (contains!3971 lt!318512 k!2824) lt!318554)))

(declare-fun b!712249 () Bool)

(declare-fun e!400743 () Bool)

(assert (=> b!712249 (= e!400744 e!400743)))

(declare-fun res!475453 () Bool)

(assert (=> b!712249 (=> res!475453 e!400743)))

(assert (=> b!712249 (= res!475453 (= (h!14435 lt!318512) k!2824))))

(declare-fun b!712250 () Bool)

(assert (=> b!712250 (= e!400743 (contains!3971 (t!19703 lt!318512) k!2824))))

(assert (= (and d!97935 res!475454) b!712249))

(assert (= (and b!712249 (not res!475453)) b!712250))

(declare-fun m!669221 () Bool)

(assert (=> d!97935 m!669221))

(declare-fun m!669223 () Bool)

(assert (=> d!97935 m!669223))

(declare-fun m!669225 () Bool)

(assert (=> b!712250 m!669225))

(assert (=> b!711897 d!97935))

(declare-fun d!97937 () Bool)

(declare-fun lt!318557 () Bool)

(assert (=> d!97937 (= lt!318557 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!360 lt!318512)))))

(declare-fun e!400751 () Bool)

(assert (=> d!97937 (= lt!318557 e!400751)))

(declare-fun res!475456 () Bool)

(assert (=> d!97937 (=> (not res!475456) (not e!400751))))

(assert (=> d!97937 (= res!475456 (is-Cons!13390 lt!318512))))

(assert (=> d!97937 (= (contains!3971 lt!318512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318557)))

(declare-fun b!712259 () Bool)

(declare-fun e!400749 () Bool)

(assert (=> b!712259 (= e!400751 e!400749)))

(declare-fun res!475455 () Bool)

(assert (=> b!712259 (=> res!475455 e!400749)))

(assert (=> b!712259 (= res!475455 (= (h!14435 lt!318512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712260 () Bool)

(assert (=> b!712260 (= e!400749 (contains!3971 (t!19703 lt!318512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97937 res!475456) b!712259))

(assert (= (and b!712259 (not res!475455)) b!712260))

(assert (=> d!97937 m!669221))

(declare-fun m!669227 () Bool)

(assert (=> d!97937 m!669227))

(declare-fun m!669229 () Bool)

(assert (=> b!712260 m!669229))

(assert (=> b!711895 d!97937))

(declare-fun b!712284 () Bool)

(declare-fun e!400770 () List!13394)

(declare-fun call!34559 () List!13394)

(assert (=> b!712284 (= e!400770 (Cons!13390 (h!14435 lt!318511) call!34559))))

(declare-fun b!712285 () Bool)

(declare-fun e!400771 () List!13394)

(assert (=> b!712285 (= e!400771 e!400770)))

(declare-fun c!78775 () Bool)

(assert (=> b!712285 (= c!78775 (= k!2824 (h!14435 lt!318511)))))

(declare-fun b!712287 () Bool)

(assert (=> b!712287 (= e!400771 Nil!13391)))

(declare-fun bm!34556 () Bool)

(assert (=> bm!34556 (= call!34559 (-!381 (t!19703 lt!318511) k!2824))))

(declare-fun e!400772 () Bool)

(declare-fun b!712288 () Bool)

(declare-fun lt!318562 () List!13394)

(assert (=> b!712288 (= e!400772 (= (content!360 lt!318562) (set.minus (content!360 lt!318511) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun d!97939 () Bool)

(assert (=> d!97939 e!400772))

(declare-fun res!475468 () Bool)

(assert (=> d!97939 (=> (not res!475468) (not e!400772))))

(declare-fun size!19763 (List!13394) Int)

(assert (=> d!97939 (= res!475468 (<= (size!19763 lt!318562) (size!19763 lt!318511)))))

(assert (=> d!97939 (= lt!318562 e!400771)))

(declare-fun c!78776 () Bool)

(assert (=> d!97939 (= c!78776 (is-Cons!13390 lt!318511))))

(assert (=> d!97939 (= (-!381 lt!318511 k!2824) lt!318562)))

(declare-fun b!712286 () Bool)

(assert (=> b!712286 (= e!400770 call!34559)))

(assert (= (and d!97939 c!78776) b!712285))

(assert (= (and d!97939 (not c!78776)) b!712287))

(assert (= (and b!712285 c!78775) b!712286))

(assert (= (and b!712285 (not c!78775)) b!712284))

(assert (= (or b!712286 b!712284) bm!34556))

(assert (= (and d!97939 res!475468) b!712288))

(declare-fun m!669247 () Bool)

(assert (=> bm!34556 m!669247))

(declare-fun m!669249 () Bool)

(assert (=> b!712288 m!669249))

(assert (=> b!712288 m!669199))

(declare-fun m!669251 () Bool)

(assert (=> b!712288 m!669251))

(declare-fun m!669253 () Bool)

(assert (=> d!97939 m!669253))

(declare-fun m!669255 () Bool)

(assert (=> d!97939 m!669255))

(assert (=> b!711896 d!97939))

(declare-fun c!78777 () Bool)

(declare-fun bm!34557 () Bool)

(declare-fun call!34560 () Bool)

(assert (=> bm!34557 (= call!34560 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78777 (Cons!13390 (select (arr!19353 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!712291 () Bool)

(declare-fun e!400776 () Bool)

(assert (=> b!712291 (= e!400776 call!34560)))

(declare-fun b!712292 () Bool)

(declare-fun e!400778 () Bool)

(assert (=> b!712292 (= e!400778 e!400776)))

(assert (=> b!712292 (= c!78777 (validKeyInArray!0 (select (arr!19353 a!3591) from!2969)))))

(declare-fun b!712293 () Bool)

(declare-fun e!400775 () Bool)

(assert (=> b!712293 (= e!400775 (contains!3971 acc!652 (select (arr!19353 a!3591) from!2969)))))

(declare-fun d!97947 () Bool)

(declare-fun res!475471 () Bool)

(declare-fun e!400777 () Bool)

(assert (=> d!97947 (=> res!475471 e!400777)))

(assert (=> d!97947 (= res!475471 (bvsge from!2969 (size!19758 a!3591)))))

(assert (=> d!97947 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400777)))

(declare-fun b!712294 () Bool)

(assert (=> b!712294 (= e!400777 e!400778)))

(declare-fun res!475473 () Bool)

(assert (=> b!712294 (=> (not res!475473) (not e!400778))))

(assert (=> b!712294 (= res!475473 (not e!400775))))

(declare-fun res!475472 () Bool)

(assert (=> b!712294 (=> (not res!475472) (not e!400775))))

(assert (=> b!712294 (= res!475472 (validKeyInArray!0 (select (arr!19353 a!3591) from!2969)))))

(declare-fun b!712295 () Bool)

(assert (=> b!712295 (= e!400776 call!34560)))

(assert (= (and d!97947 (not res!475471)) b!712294))

(assert (= (and b!712294 res!475472) b!712293))

(assert (= (and b!712294 res!475473) b!712292))

(assert (= (and b!712292 c!78777) b!712291))

(assert (= (and b!712292 (not c!78777)) b!712295))

(assert (= (or b!712291 b!712295) bm!34557))

(assert (=> bm!34557 m!668879))

(declare-fun m!669257 () Bool)

(assert (=> bm!34557 m!669257))

(assert (=> b!712292 m!668879))

(assert (=> b!712292 m!668879))

(assert (=> b!712292 m!668909))

(assert (=> b!712293 m!668879))

(assert (=> b!712293 m!668879))

(declare-fun m!669259 () Bool)

(assert (=> b!712293 m!669259))

(assert (=> b!712294 m!668879))

(assert (=> b!712294 m!668879))

(assert (=> b!712294 m!668909))

(assert (=> b!711899 d!97947))

(declare-fun d!97949 () Bool)

(declare-fun lt!318563 () Bool)

(assert (=> d!97949 (= lt!318563 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!360 lt!318512)))))

(declare-fun e!400780 () Bool)

(assert (=> d!97949 (= lt!318563 e!400780)))

(declare-fun res!475475 () Bool)

(assert (=> d!97949 (=> (not res!475475) (not e!400780))))

(assert (=> d!97949 (= res!475475 (is-Cons!13390 lt!318512))))

(assert (=> d!97949 (= (contains!3971 lt!318512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318563)))

(declare-fun b!712296 () Bool)

(declare-fun e!400779 () Bool)

(assert (=> b!712296 (= e!400780 e!400779)))

(declare-fun res!475474 () Bool)

(assert (=> b!712296 (=> res!475474 e!400779)))

(assert (=> b!712296 (= res!475474 (= (h!14435 lt!318512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712297 () Bool)

(assert (=> b!712297 (= e!400779 (contains!3971 (t!19703 lt!318512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97949 res!475475) b!712296))

(assert (= (and b!712296 (not res!475474)) b!712297))

(assert (=> d!97949 m!669221))

(declare-fun m!669261 () Bool)

(assert (=> d!97949 m!669261))

(declare-fun m!669263 () Bool)

(assert (=> b!712297 m!669263))

(assert (=> b!711900 d!97949))

(declare-fun b!712298 () Bool)

(declare-fun e!400781 () List!13394)

(declare-fun call!34561 () List!13394)

(assert (=> b!712298 (= e!400781 (Cons!13390 (h!14435 newAcc!49) call!34561))))

(declare-fun b!712299 () Bool)

(declare-fun e!400782 () List!13394)

(assert (=> b!712299 (= e!400782 e!400781)))

(declare-fun c!78778 () Bool)

(assert (=> b!712299 (= c!78778 (= k!2824 (h!14435 newAcc!49)))))

(declare-fun b!712301 () Bool)

(assert (=> b!712301 (= e!400782 Nil!13391)))

(declare-fun bm!34558 () Bool)

(assert (=> bm!34558 (= call!34561 (-!381 (t!19703 newAcc!49) k!2824))))

(declare-fun b!712302 () Bool)

(declare-fun lt!318564 () List!13394)

(declare-fun e!400783 () Bool)

(assert (=> b!712302 (= e!400783 (= (content!360 lt!318564) (set.minus (content!360 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun d!97951 () Bool)

(assert (=> d!97951 e!400783))

(declare-fun res!475476 () Bool)

(assert (=> d!97951 (=> (not res!475476) (not e!400783))))

(assert (=> d!97951 (= res!475476 (<= (size!19763 lt!318564) (size!19763 newAcc!49)))))

(assert (=> d!97951 (= lt!318564 e!400782)))

(declare-fun c!78779 () Bool)

(assert (=> d!97951 (= c!78779 (is-Cons!13390 newAcc!49))))

(assert (=> d!97951 (= (-!381 newAcc!49 k!2824) lt!318564)))

(declare-fun b!712300 () Bool)

(assert (=> b!712300 (= e!400781 call!34561)))

(assert (= (and d!97951 c!78779) b!712299))

(assert (= (and d!97951 (not c!78779)) b!712301))

(assert (= (and b!712299 c!78778) b!712300))

(assert (= (and b!712299 (not c!78778)) b!712298))

(assert (= (or b!712300 b!712298) bm!34558))

(assert (= (and d!97951 res!475476) b!712302))

(declare-fun m!669265 () Bool)

(assert (=> bm!34558 m!669265))

(declare-fun m!669267 () Bool)

(assert (=> b!712302 m!669267))

(declare-fun m!669269 () Bool)

(assert (=> b!712302 m!669269))

(assert (=> b!712302 m!669251))

(declare-fun m!669271 () Bool)

(assert (=> d!97951 m!669271))

(declare-fun m!669273 () Bool)

(assert (=> d!97951 m!669273))

(assert (=> b!711898 d!97951))

(declare-fun d!97953 () Bool)

(declare-fun lt!318565 () Bool)

(assert (=> d!97953 (= lt!318565 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!360 newAcc!49)))))

(declare-fun e!400787 () Bool)

(assert (=> d!97953 (= lt!318565 e!400787)))

(declare-fun res!475480 () Bool)

(assert (=> d!97953 (=> (not res!475480) (not e!400787))))

(assert (=> d!97953 (= res!475480 (is-Cons!13390 newAcc!49))))

(assert (=> d!97953 (= (contains!3971 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318565)))

(declare-fun b!712305 () Bool)

(declare-fun e!400786 () Bool)

(assert (=> b!712305 (= e!400787 e!400786)))

(declare-fun res!475479 () Bool)

(assert (=> b!712305 (=> res!475479 e!400786)))

(assert (=> b!712305 (= res!475479 (= (h!14435 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712306 () Bool)

(assert (=> b!712306 (= e!400786 (contains!3971 (t!19703 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97953 res!475480) b!712305))

(assert (= (and b!712305 (not res!475479)) b!712306))

(assert (=> d!97953 m!669269))

(declare-fun m!669275 () Bool)

(assert (=> d!97953 m!669275))

(declare-fun m!669277 () Bool)

(assert (=> b!712306 m!669277))

(assert (=> b!711902 d!97953))

(declare-fun d!97955 () Bool)

(declare-fun res!475499 () Bool)

(declare-fun e!400806 () Bool)

(assert (=> d!97955 (=> res!475499 e!400806)))

(assert (=> d!97955 (= res!475499 (= (select (arr!19353 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97955 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400806)))

(declare-fun b!712325 () Bool)

(declare-fun e!400807 () Bool)

(assert (=> b!712325 (= e!400806 e!400807)))

(declare-fun res!475500 () Bool)

(assert (=> b!712325 (=> (not res!475500) (not e!400807))))

(assert (=> b!712325 (= res!475500 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19758 a!3591)))))

(declare-fun b!712326 () Bool)

(assert (=> b!712326 (= e!400807 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97955 (not res!475499)) b!712325))

(assert (= (and b!712325 res!475500) b!712326))

(assert (=> d!97955 m!669165))

(declare-fun m!669291 () Bool)

(assert (=> b!712326 m!669291))

(assert (=> b!711901 d!97955))

(declare-fun d!97965 () Bool)

(declare-fun lt!318568 () Bool)

(assert (=> d!97965 (= lt!318568 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!360 lt!318511)))))

(declare-fun e!400811 () Bool)

(assert (=> d!97965 (= lt!318568 e!400811)))

(declare-fun res!475504 () Bool)

(assert (=> d!97965 (=> (not res!475504) (not e!400811))))

(assert (=> d!97965 (= res!475504 (is-Cons!13390 lt!318511))))

(assert (=> d!97965 (= (contains!3971 lt!318511 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318568)))

(declare-fun b!712329 () Bool)

(declare-fun e!400810 () Bool)

(assert (=> b!712329 (= e!400811 e!400810)))

(declare-fun res!475503 () Bool)

(assert (=> b!712329 (=> res!475503 e!400810)))

(assert (=> b!712329 (= res!475503 (= (h!14435 lt!318511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712330 () Bool)

(assert (=> b!712330 (= e!400810 (contains!3971 (t!19703 lt!318511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97965 res!475504) b!712329))

(assert (= (and b!712329 (not res!475503)) b!712330))

(assert (=> d!97965 m!669199))

(declare-fun m!669299 () Bool)

(assert (=> d!97965 m!669299))

(declare-fun m!669301 () Bool)

(assert (=> b!712330 m!669301))

(assert (=> b!711883 d!97965))

(declare-fun d!97969 () Bool)

(declare-fun lt!318569 () Bool)

(assert (=> d!97969 (= lt!318569 (set.member k!2824 (content!360 newAcc!49)))))

(declare-fun e!400817 () Bool)

(assert (=> d!97969 (= lt!318569 e!400817)))

(declare-fun res!475509 () Bool)

(assert (=> d!97969 (=> (not res!475509) (not e!400817))))

(assert (=> d!97969 (= res!475509 (is-Cons!13390 newAcc!49))))

(assert (=> d!97969 (= (contains!3971 newAcc!49 k!2824) lt!318569)))

(declare-fun b!712336 () Bool)

(declare-fun e!400816 () Bool)

(assert (=> b!712336 (= e!400817 e!400816)))

