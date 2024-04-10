; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63278 () Bool)

(assert start!63278)

(declare-fun b!712884 () Bool)

(declare-fun res!476071 () Bool)

(declare-fun e!400922 () Bool)

(assert (=> b!712884 (=> (not res!476071) (not e!400922))))

(declare-datatypes ((List!13402 0))(
  ( (Nil!13399) (Cons!13398 (h!14443 (_ BitVec 64)) (t!19714 List!13402)) )
))
(declare-fun lt!318623 () List!13402)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3979 (List!13402 (_ BitVec 64)) Bool)

(assert (=> b!712884 (= res!476071 (contains!3979 lt!318623 k!2824))))

(declare-fun b!712885 () Bool)

(declare-fun e!400921 () Bool)

(assert (=> b!712885 (= e!400921 e!400922)))

(declare-fun res!476059 () Bool)

(assert (=> b!712885 (=> (not res!476059) (not e!400922))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!712885 (= res!476059 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13402)

(declare-datatypes ((array!40439 0))(
  ( (array!40440 (arr!19361 (Array (_ BitVec 32) (_ BitVec 64))) (size!19769 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40439)

(declare-fun $colon$colon!535 (List!13402 (_ BitVec 64)) List!13402)

(assert (=> b!712885 (= lt!318623 ($colon$colon!535 newAcc!49 (select (arr!19361 a!3591) from!2969)))))

(declare-fun acc!652 () List!13402)

(declare-fun lt!318621 () List!13402)

(assert (=> b!712885 (= lt!318621 ($colon$colon!535 acc!652 (select (arr!19361 a!3591) from!2969)))))

(declare-fun b!712886 () Bool)

(declare-fun res!476080 () Bool)

(assert (=> b!712886 (=> (not res!476080) (not e!400921))))

(declare-fun arrayNoDuplicates!0 (array!40439 (_ BitVec 32) List!13402) Bool)

(assert (=> b!712886 (= res!476080 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712887 () Bool)

(declare-fun res!476066 () Bool)

(assert (=> b!712887 (=> (not res!476066) (not e!400922))))

(declare-fun noDuplicate!1226 (List!13402) Bool)

(assert (=> b!712887 (= res!476066 (noDuplicate!1226 lt!318623))))

(declare-fun b!712888 () Bool)

(declare-fun res!476060 () Bool)

(assert (=> b!712888 (=> (not res!476060) (not e!400922))))

(assert (=> b!712888 (= res!476060 (not (contains!3979 lt!318621 k!2824)))))

(declare-fun b!712889 () Bool)

(declare-fun res!476069 () Bool)

(assert (=> b!712889 (=> (not res!476069) (not e!400921))))

(declare-fun subseq!424 (List!13402 List!13402) Bool)

(assert (=> b!712889 (= res!476069 (subseq!424 acc!652 newAcc!49))))

(declare-fun b!712890 () Bool)

(declare-fun res!476065 () Bool)

(assert (=> b!712890 (=> (not res!476065) (not e!400921))))

(declare-fun arrayContainsKey!0 (array!40439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712890 (= res!476065 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!712892 () Bool)

(declare-fun res!476078 () Bool)

(assert (=> b!712892 (=> (not res!476078) (not e!400921))))

(assert (=> b!712892 (= res!476078 (noDuplicate!1226 newAcc!49))))

(declare-fun b!712893 () Bool)

(declare-fun res!476057 () Bool)

(assert (=> b!712893 (=> (not res!476057) (not e!400922))))

(assert (=> b!712893 (= res!476057 (not (contains!3979 lt!318623 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712894 () Bool)

(declare-fun res!476062 () Bool)

(assert (=> b!712894 (=> (not res!476062) (not e!400922))))

(assert (=> b!712894 (= res!476062 (not (contains!3979 lt!318621 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712895 () Bool)

(declare-fun res!476058 () Bool)

(assert (=> b!712895 (=> (not res!476058) (not e!400921))))

(assert (=> b!712895 (= res!476058 (contains!3979 newAcc!49 k!2824))))

(declare-fun b!712896 () Bool)

(declare-fun res!476063 () Bool)

(assert (=> b!712896 (=> (not res!476063) (not e!400921))))

(assert (=> b!712896 (= res!476063 (not (contains!3979 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712897 () Bool)

(assert (=> b!712897 (= e!400922 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!712897 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318623)))

(declare-datatypes ((Unit!24634 0))(
  ( (Unit!24635) )
))
(declare-fun lt!318622 () Unit!24634)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40439 (_ BitVec 64) (_ BitVec 32) List!13402 List!13402) Unit!24634)

(assert (=> b!712897 (= lt!318622 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318621 lt!318623))))

(declare-fun b!712898 () Bool)

(declare-fun res!476067 () Bool)

(assert (=> b!712898 (=> (not res!476067) (not e!400921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712898 (= res!476067 (validKeyInArray!0 (select (arr!19361 a!3591) from!2969)))))

(declare-fun b!712899 () Bool)

(declare-fun res!476073 () Bool)

(assert (=> b!712899 (=> (not res!476073) (not e!400922))))

(assert (=> b!712899 (= res!476073 (subseq!424 lt!318621 lt!318623))))

(declare-fun b!712900 () Bool)

(declare-fun res!476079 () Bool)

(assert (=> b!712900 (=> (not res!476079) (not e!400921))))

(declare-fun -!389 (List!13402 (_ BitVec 64)) List!13402)

(assert (=> b!712900 (= res!476079 (= (-!389 newAcc!49 k!2824) acc!652))))

(declare-fun b!712901 () Bool)

(declare-fun res!476053 () Bool)

(assert (=> b!712901 (=> (not res!476053) (not e!400922))))

(assert (=> b!712901 (= res!476053 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712902 () Bool)

(declare-fun res!476070 () Bool)

(assert (=> b!712902 (=> (not res!476070) (not e!400921))))

(assert (=> b!712902 (= res!476070 (not (contains!3979 acc!652 k!2824)))))

(declare-fun b!712903 () Bool)

(declare-fun res!476074 () Bool)

(assert (=> b!712903 (=> (not res!476074) (not e!400921))))

(assert (=> b!712903 (= res!476074 (not (contains!3979 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712904 () Bool)

(declare-fun res!476052 () Bool)

(assert (=> b!712904 (=> (not res!476052) (not e!400921))))

(assert (=> b!712904 (= res!476052 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19769 a!3591)))))

(declare-fun b!712905 () Bool)

(declare-fun res!476075 () Bool)

(assert (=> b!712905 (=> (not res!476075) (not e!400922))))

(assert (=> b!712905 (= res!476075 (not (contains!3979 lt!318623 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712906 () Bool)

(declare-fun res!476056 () Bool)

(assert (=> b!712906 (=> (not res!476056) (not e!400922))))

(assert (=> b!712906 (= res!476056 (= (-!389 lt!318623 k!2824) lt!318621))))

(declare-fun b!712907 () Bool)

(declare-fun res!476076 () Bool)

(assert (=> b!712907 (=> (not res!476076) (not e!400921))))

(assert (=> b!712907 (= res!476076 (not (contains!3979 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712891 () Bool)

(declare-fun res!476064 () Bool)

(assert (=> b!712891 (=> (not res!476064) (not e!400921))))

(assert (=> b!712891 (= res!476064 (not (contains!3979 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476061 () Bool)

(assert (=> start!63278 (=> (not res!476061) (not e!400921))))

(assert (=> start!63278 (= res!476061 (and (bvslt (size!19769 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19769 a!3591))))))

(assert (=> start!63278 e!400921))

(assert (=> start!63278 true))

(declare-fun array_inv!15157 (array!40439) Bool)

(assert (=> start!63278 (array_inv!15157 a!3591)))

(declare-fun b!712908 () Bool)

(declare-fun res!476077 () Bool)

(assert (=> b!712908 (=> (not res!476077) (not e!400922))))

(assert (=> b!712908 (= res!476077 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318621))))

(declare-fun b!712909 () Bool)

(declare-fun res!476055 () Bool)

(assert (=> b!712909 (=> (not res!476055) (not e!400922))))

(assert (=> b!712909 (= res!476055 (noDuplicate!1226 lt!318621))))

(declare-fun b!712910 () Bool)

(declare-fun res!476054 () Bool)

(assert (=> b!712910 (=> (not res!476054) (not e!400921))))

(assert (=> b!712910 (= res!476054 (noDuplicate!1226 acc!652))))

(declare-fun b!712911 () Bool)

(declare-fun res!476068 () Bool)

(assert (=> b!712911 (=> (not res!476068) (not e!400922))))

(assert (=> b!712911 (= res!476068 (not (contains!3979 lt!318621 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712912 () Bool)

(declare-fun res!476072 () Bool)

(assert (=> b!712912 (=> (not res!476072) (not e!400921))))

(assert (=> b!712912 (= res!476072 (validKeyInArray!0 k!2824))))

(assert (= (and start!63278 res!476061) b!712910))

(assert (= (and b!712910 res!476054) b!712892))

(assert (= (and b!712892 res!476078) b!712896))

(assert (= (and b!712896 res!476063) b!712903))

(assert (= (and b!712903 res!476074) b!712890))

(assert (= (and b!712890 res!476065) b!712902))

(assert (= (and b!712902 res!476070) b!712912))

(assert (= (and b!712912 res!476072) b!712886))

(assert (= (and b!712886 res!476080) b!712889))

(assert (= (and b!712889 res!476069) b!712895))

(assert (= (and b!712895 res!476058) b!712900))

(assert (= (and b!712900 res!476079) b!712907))

(assert (= (and b!712907 res!476076) b!712891))

(assert (= (and b!712891 res!476064) b!712904))

(assert (= (and b!712904 res!476052) b!712898))

(assert (= (and b!712898 res!476067) b!712885))

(assert (= (and b!712885 res!476059) b!712909))

(assert (= (and b!712909 res!476055) b!712887))

(assert (= (and b!712887 res!476066) b!712911))

(assert (= (and b!712911 res!476068) b!712894))

(assert (= (and b!712894 res!476062) b!712901))

(assert (= (and b!712901 res!476053) b!712888))

(assert (= (and b!712888 res!476060) b!712908))

(assert (= (and b!712908 res!476077) b!712899))

(assert (= (and b!712899 res!476073) b!712884))

(assert (= (and b!712884 res!476071) b!712906))

(assert (= (and b!712906 res!476056) b!712893))

(assert (= (and b!712893 res!476057) b!712905))

(assert (= (and b!712905 res!476075) b!712897))

(declare-fun m!669697 () Bool)

(assert (=> b!712893 m!669697))

(declare-fun m!669699 () Bool)

(assert (=> b!712891 m!669699))

(declare-fun m!669701 () Bool)

(assert (=> b!712901 m!669701))

(declare-fun m!669703 () Bool)

(assert (=> b!712907 m!669703))

(declare-fun m!669705 () Bool)

(assert (=> b!712886 m!669705))

(declare-fun m!669707 () Bool)

(assert (=> b!712910 m!669707))

(declare-fun m!669709 () Bool)

(assert (=> b!712896 m!669709))

(declare-fun m!669711 () Bool)

(assert (=> start!63278 m!669711))

(declare-fun m!669713 () Bool)

(assert (=> b!712900 m!669713))

(declare-fun m!669715 () Bool)

(assert (=> b!712898 m!669715))

(assert (=> b!712898 m!669715))

(declare-fun m!669717 () Bool)

(assert (=> b!712898 m!669717))

(declare-fun m!669719 () Bool)

(assert (=> b!712889 m!669719))

(declare-fun m!669721 () Bool)

(assert (=> b!712895 m!669721))

(declare-fun m!669723 () Bool)

(assert (=> b!712894 m!669723))

(declare-fun m!669725 () Bool)

(assert (=> b!712890 m!669725))

(declare-fun m!669727 () Bool)

(assert (=> b!712902 m!669727))

(declare-fun m!669729 () Bool)

(assert (=> b!712911 m!669729))

(declare-fun m!669731 () Bool)

(assert (=> b!712888 m!669731))

(declare-fun m!669733 () Bool)

(assert (=> b!712908 m!669733))

(declare-fun m!669735 () Bool)

(assert (=> b!712897 m!669735))

(declare-fun m!669737 () Bool)

(assert (=> b!712897 m!669737))

(declare-fun m!669739 () Bool)

(assert (=> b!712897 m!669739))

(declare-fun m!669741 () Bool)

(assert (=> b!712899 m!669741))

(declare-fun m!669743 () Bool)

(assert (=> b!712912 m!669743))

(assert (=> b!712885 m!669715))

(assert (=> b!712885 m!669715))

(declare-fun m!669745 () Bool)

(assert (=> b!712885 m!669745))

(assert (=> b!712885 m!669715))

(declare-fun m!669747 () Bool)

(assert (=> b!712885 m!669747))

(declare-fun m!669749 () Bool)

(assert (=> b!712887 m!669749))

(declare-fun m!669751 () Bool)

(assert (=> b!712903 m!669751))

(declare-fun m!669753 () Bool)

(assert (=> b!712884 m!669753))

(declare-fun m!669755 () Bool)

(assert (=> b!712892 m!669755))

(declare-fun m!669757 () Bool)

(assert (=> b!712905 m!669757))

(declare-fun m!669759 () Bool)

(assert (=> b!712906 m!669759))

(declare-fun m!669761 () Bool)

(assert (=> b!712909 m!669761))

(push 1)

(assert (not b!712895))

(assert (not b!712897))

(assert (not b!712905))

(assert (not b!712886))

(assert (not b!712911))

(assert (not b!712901))

(assert (not b!712888))

(assert (not b!712898))

(assert (not b!712885))

(assert (not b!712893))

(assert (not b!712900))

(assert (not b!712903))

(assert (not b!712907))

(assert (not b!712899))

(assert (not b!712889))

(assert (not b!712909))

(assert (not start!63278))

(assert (not b!712912))

(assert (not b!712906))

(assert (not b!712910))

(assert (not b!712891))

(assert (not b!712884))

(assert (not b!712896))

(assert (not b!712902))

(assert (not b!712890))

(assert (not b!712887))

(assert (not b!712908))

(assert (not b!712892))

(assert (not b!712894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!712972 () Bool)

(declare-fun e!400976 () List!13402)

(declare-fun e!400975 () List!13402)

(assert (=> b!712972 (= e!400976 e!400975)))

(declare-fun c!78794 () Bool)

(assert (=> b!712972 (= c!78794 (= k!2824 (h!14443 newAcc!49)))))

(declare-fun bm!34566 () Bool)

(declare-fun call!34569 () List!13402)

(assert (=> bm!34566 (= call!34569 (-!389 (t!19714 newAcc!49) k!2824))))

(declare-fun d!98029 () Bool)

(declare-fun e!400974 () Bool)

(assert (=> d!98029 e!400974))

(declare-fun res!476120 () Bool)

(assert (=> d!98029 (=> (not res!476120) (not e!400974))))

(declare-fun lt!318635 () List!13402)

(declare-fun size!19771 (List!13402) Int)

(assert (=> d!98029 (= res!476120 (<= (size!19771 lt!318635) (size!19771 newAcc!49)))))

(assert (=> d!98029 (= lt!318635 e!400976)))

(declare-fun c!78793 () Bool)

(assert (=> d!98029 (= c!78793 (is-Cons!13398 newAcc!49))))

(assert (=> d!98029 (= (-!389 newAcc!49 k!2824) lt!318635)))

(declare-fun b!712973 () Bool)

(assert (=> b!712973 (= e!400976 Nil!13399)))

(declare-fun b!712974 () Bool)

(declare-fun content!363 (List!13402) (Set (_ BitVec 64)))

(assert (=> b!712974 (= e!400974 (= (content!363 lt!318635) (setminus (content!363 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!712975 () Bool)

(assert (=> b!712975 (= e!400975 (Cons!13398 (h!14443 newAcc!49) call!34569))))

(declare-fun b!712976 () Bool)

(assert (=> b!712976 (= e!400975 call!34569)))

(assert (= (and d!98029 c!78793) b!712972))

(assert (= (and d!98029 (not c!78793)) b!712973))

(assert (= (and b!712972 c!78794) b!712976))

(assert (= (and b!712972 (not c!78794)) b!712975))

(assert (= (or b!712976 b!712975) bm!34566))

(assert (= (and d!98029 res!476120) b!712974))

(declare-fun m!669795 () Bool)

(assert (=> bm!34566 m!669795))

(declare-fun m!669797 () Bool)

(assert (=> d!98029 m!669797))

(declare-fun m!669799 () Bool)

(assert (=> d!98029 m!669799))

(declare-fun m!669801 () Bool)

(assert (=> b!712974 m!669801))

(declare-fun m!669803 () Bool)

(assert (=> b!712974 m!669803))

(declare-fun m!669805 () Bool)

(assert (=> b!712974 m!669805))

(assert (=> b!712900 d!98029))

(declare-fun d!98039 () Bool)

(declare-fun res!476141 () Bool)

(declare-fun e!400997 () Bool)

(assert (=> d!98039 (=> res!476141 e!400997)))

(assert (=> d!98039 (= res!476141 (= (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98039 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400997)))

(declare-fun b!712997 () Bool)

(declare-fun e!400998 () Bool)

(assert (=> b!712997 (= e!400997 e!400998)))

(declare-fun res!476142 () Bool)

(assert (=> b!712997 (=> (not res!476142) (not e!400998))))

(assert (=> b!712997 (= res!476142 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19769 a!3591)))))

(declare-fun b!712998 () Bool)

(assert (=> b!712998 (= e!400998 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98039 (not res!476141)) b!712997))

(assert (= (and b!712997 res!476142) b!712998))

(declare-fun m!669823 () Bool)

(assert (=> d!98039 m!669823))

(declare-fun m!669825 () Bool)

(assert (=> b!712998 m!669825))

(assert (=> b!712901 d!98039))

(declare-fun d!98051 () Bool)

(declare-fun lt!318643 () Bool)

(assert (=> d!98051 (= lt!318643 (member k!2824 (content!363 acc!652)))))

(declare-fun e!401021 () Bool)

(assert (=> d!98051 (= lt!318643 e!401021)))

(declare-fun res!476165 () Bool)

(assert (=> d!98051 (=> (not res!476165) (not e!401021))))

(assert (=> d!98051 (= res!476165 (is-Cons!13398 acc!652))))

(assert (=> d!98051 (= (contains!3979 acc!652 k!2824) lt!318643)))

(declare-fun b!713023 () Bool)

(declare-fun e!401022 () Bool)

(assert (=> b!713023 (= e!401021 e!401022)))

(declare-fun res!476166 () Bool)

(assert (=> b!713023 (=> res!476166 e!401022)))

(assert (=> b!713023 (= res!476166 (= (h!14443 acc!652) k!2824))))

(declare-fun b!713024 () Bool)

(assert (=> b!713024 (= e!401022 (contains!3979 (t!19714 acc!652) k!2824))))

(assert (= (and d!98051 res!476165) b!713023))

(assert (= (and b!713023 (not res!476166)) b!713024))

(declare-fun m!669847 () Bool)

(assert (=> d!98051 m!669847))

(declare-fun m!669849 () Bool)

(assert (=> d!98051 m!669849))

(declare-fun m!669851 () Bool)

(assert (=> b!713024 m!669851))

(assert (=> b!712902 d!98051))

(declare-fun d!98061 () Bool)

(declare-fun lt!318644 () Bool)

(assert (=> d!98061 (= lt!318644 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!363 acc!652)))))

(declare-fun e!401027 () Bool)

(assert (=> d!98061 (= lt!318644 e!401027)))

(declare-fun res!476169 () Bool)

(assert (=> d!98061 (=> (not res!476169) (not e!401027))))

(assert (=> d!98061 (= res!476169 (is-Cons!13398 acc!652))))

(assert (=> d!98061 (= (contains!3979 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318644)))

(declare-fun b!713029 () Bool)

(declare-fun e!401028 () Bool)

(assert (=> b!713029 (= e!401027 e!401028)))

(declare-fun res!476170 () Bool)

(assert (=> b!713029 (=> res!476170 e!401028)))

(assert (=> b!713029 (= res!476170 (= (h!14443 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713030 () Bool)

(assert (=> b!713030 (= e!401028 (contains!3979 (t!19714 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98061 res!476169) b!713029))

(assert (= (and b!713029 (not res!476170)) b!713030))

(assert (=> d!98061 m!669847))

(declare-fun m!669853 () Bool)

(assert (=> d!98061 m!669853))

(declare-fun m!669855 () Bool)

(assert (=> b!713030 m!669855))

(assert (=> b!712903 d!98061))

(declare-fun d!98063 () Bool)

(declare-fun lt!318645 () Bool)

(assert (=> d!98063 (= lt!318645 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!363 lt!318623)))))

(declare-fun e!401029 () Bool)

(assert (=> d!98063 (= lt!318645 e!401029)))

(declare-fun res!476171 () Bool)

(assert (=> d!98063 (=> (not res!476171) (not e!401029))))

(assert (=> d!98063 (= res!476171 (is-Cons!13398 lt!318623))))

(assert (=> d!98063 (= (contains!3979 lt!318623 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318645)))

(declare-fun b!713031 () Bool)

(declare-fun e!401030 () Bool)

(assert (=> b!713031 (= e!401029 e!401030)))

(declare-fun res!476172 () Bool)

(assert (=> b!713031 (=> res!476172 e!401030)))

(assert (=> b!713031 (= res!476172 (= (h!14443 lt!318623) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713032 () Bool)

(assert (=> b!713032 (= e!401030 (contains!3979 (t!19714 lt!318623) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98063 res!476171) b!713031))

(assert (= (and b!713031 (not res!476172)) b!713032))

(declare-fun m!669857 () Bool)

(assert (=> d!98063 m!669857))

(declare-fun m!669859 () Bool)

(assert (=> d!98063 m!669859))

(declare-fun m!669861 () Bool)

(assert (=> b!713032 m!669861))

(assert (=> b!712905 d!98063))

(declare-fun d!98065 () Bool)

(declare-fun lt!318646 () Bool)

(assert (=> d!98065 (= lt!318646 (member k!2824 (content!363 lt!318623)))))

(declare-fun e!401031 () Bool)

(assert (=> d!98065 (= lt!318646 e!401031)))

(declare-fun res!476173 () Bool)

(assert (=> d!98065 (=> (not res!476173) (not e!401031))))

(assert (=> d!98065 (= res!476173 (is-Cons!13398 lt!318623))))

(assert (=> d!98065 (= (contains!3979 lt!318623 k!2824) lt!318646)))

(declare-fun b!713033 () Bool)

(declare-fun e!401032 () Bool)

(assert (=> b!713033 (= e!401031 e!401032)))

(declare-fun res!476174 () Bool)

(assert (=> b!713033 (=> res!476174 e!401032)))

(assert (=> b!713033 (= res!476174 (= (h!14443 lt!318623) k!2824))))

(declare-fun b!713034 () Bool)

(assert (=> b!713034 (= e!401032 (contains!3979 (t!19714 lt!318623) k!2824))))

(assert (= (and d!98065 res!476173) b!713033))

(assert (= (and b!713033 (not res!476174)) b!713034))

(assert (=> d!98065 m!669857))

(declare-fun m!669863 () Bool)

(assert (=> d!98065 m!669863))

(declare-fun m!669867 () Bool)

(assert (=> b!713034 m!669867))

(assert (=> b!712884 d!98065))

(declare-fun b!713037 () Bool)

(declare-fun e!401037 () List!13402)

(declare-fun e!401036 () List!13402)

(assert (=> b!713037 (= e!401037 e!401036)))

(declare-fun c!78798 () Bool)

(assert (=> b!713037 (= c!78798 (= k!2824 (h!14443 lt!318623)))))

(declare-fun bm!34569 () Bool)

(declare-fun call!34572 () List!13402)

(assert (=> bm!34569 (= call!34572 (-!389 (t!19714 lt!318623) k!2824))))

(declare-fun d!98067 () Bool)

(declare-fun e!401035 () Bool)

(assert (=> d!98067 e!401035))

(declare-fun res!476177 () Bool)

(assert (=> d!98067 (=> (not res!476177) (not e!401035))))

(declare-fun lt!318647 () List!13402)

(assert (=> d!98067 (= res!476177 (<= (size!19771 lt!318647) (size!19771 lt!318623)))))

(assert (=> d!98067 (= lt!318647 e!401037)))

(declare-fun c!78797 () Bool)

(assert (=> d!98067 (= c!78797 (is-Cons!13398 lt!318623))))

(assert (=> d!98067 (= (-!389 lt!318623 k!2824) lt!318647)))

(declare-fun b!713038 () Bool)

(assert (=> b!713038 (= e!401037 Nil!13399)))

(declare-fun b!713039 () Bool)

(assert (=> b!713039 (= e!401035 (= (content!363 lt!318647) (setminus (content!363 lt!318623) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!713040 () Bool)

(assert (=> b!713040 (= e!401036 (Cons!13398 (h!14443 lt!318623) call!34572))))

(declare-fun b!713041 () Bool)

(assert (=> b!713041 (= e!401036 call!34572)))

(assert (= (and d!98067 c!78797) b!713037))

(assert (= (and d!98067 (not c!78797)) b!713038))

(assert (= (and b!713037 c!78798) b!713041))

(assert (= (and b!713037 (not c!78798)) b!713040))

(assert (= (or b!713041 b!713040) bm!34569))

(assert (= (and d!98067 res!476177) b!713039))

(declare-fun m!669871 () Bool)

(assert (=> bm!34569 m!669871))

(declare-fun m!669873 () Bool)

(assert (=> d!98067 m!669873))

(declare-fun m!669875 () Bool)

(assert (=> d!98067 m!669875))

(declare-fun m!669877 () Bool)

(assert (=> b!713039 m!669877))

(assert (=> b!713039 m!669857))

(assert (=> b!713039 m!669805))

(assert (=> b!712906 d!98067))

(declare-fun d!98071 () Bool)

(assert (=> d!98071 (= ($colon$colon!535 newAcc!49 (select (arr!19361 a!3591) from!2969)) (Cons!13398 (select (arr!19361 a!3591) from!2969) newAcc!49))))

(assert (=> b!712885 d!98071))

(declare-fun d!98073 () Bool)

(assert (=> d!98073 (= ($colon$colon!535 acc!652 (select (arr!19361 a!3591) from!2969)) (Cons!13398 (select (arr!19361 a!3591) from!2969) acc!652))))

(assert (=> b!712885 d!98073))

(declare-fun d!98075 () Bool)

(declare-fun lt!318648 () Bool)

(assert (=> d!98075 (= lt!318648 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!363 newAcc!49)))))

(declare-fun e!401038 () Bool)

(assert (=> d!98075 (= lt!318648 e!401038)))

(declare-fun res!476178 () Bool)

(assert (=> d!98075 (=> (not res!476178) (not e!401038))))

(assert (=> d!98075 (= res!476178 (is-Cons!13398 newAcc!49))))

(assert (=> d!98075 (= (contains!3979 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318648)))

(declare-fun b!713042 () Bool)

(declare-fun e!401039 () Bool)

(assert (=> b!713042 (= e!401038 e!401039)))

(declare-fun res!476179 () Bool)

(assert (=> b!713042 (=> res!476179 e!401039)))

(assert (=> b!713042 (= res!476179 (= (h!14443 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713043 () Bool)

(assert (=> b!713043 (= e!401039 (contains!3979 (t!19714 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98075 res!476178) b!713042))

(assert (= (and b!713042 (not res!476179)) b!713043))

(assert (=> d!98075 m!669803))

(declare-fun m!669879 () Bool)

(assert (=> d!98075 m!669879))

(declare-fun m!669881 () Bool)

(assert (=> b!713043 m!669881))

(assert (=> b!712907 d!98075))

(declare-fun b!713094 () Bool)

(declare-fun e!401081 () Bool)

(declare-fun e!401079 () Bool)

(assert (=> b!713094 (= e!401081 e!401079)))

(declare-fun c!78808 () Bool)

(assert (=> b!713094 (= c!78808 (validKeyInArray!0 (select (arr!19361 a!3591) from!2969)))))

(declare-fun bm!34579 () Bool)

(declare-fun call!34582 () Bool)

(assert (=> bm!34579 (= call!34582 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78808 (Cons!13398 (select (arr!19361 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!713095 () Bool)

(assert (=> b!713095 (= e!401079 call!34582)))

(declare-fun b!713096 () Bool)

(assert (=> b!713096 (= e!401079 call!34582)))

(declare-fun b!713097 () Bool)

(declare-fun e!401082 () Bool)

(assert (=> b!713097 (= e!401082 (contains!3979 acc!652 (select (arr!19361 a!3591) from!2969)))))

(declare-fun d!98077 () Bool)

(declare-fun res!476210 () Bool)

(declare-fun e!401083 () Bool)

(assert (=> d!98077 (=> res!476210 e!401083)))

(assert (=> d!98077 (= res!476210 (bvsge from!2969 (size!19769 a!3591)))))

(assert (=> d!98077 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401083)))

(declare-fun b!713093 () Bool)

(assert (=> b!713093 (= e!401083 e!401081)))

(declare-fun res!476212 () Bool)

(assert (=> b!713093 (=> (not res!476212) (not e!401081))))

(assert (=> b!713093 (= res!476212 (not e!401082))))

(declare-fun res!476213 () Bool)

(assert (=> b!713093 (=> (not res!476213) (not e!401082))))

(assert (=> b!713093 (= res!476213 (validKeyInArray!0 (select (arr!19361 a!3591) from!2969)))))

(assert (= (and d!98077 (not res!476210)) b!713093))

(assert (= (and b!713093 res!476213) b!713097))

(assert (= (and b!713093 res!476212) b!713094))

(assert (= (and b!713094 c!78808) b!713095))

(assert (= (and b!713094 (not c!78808)) b!713096))

(assert (= (or b!713095 b!713096) bm!34579))

(assert (=> b!713094 m!669715))

(assert (=> b!713094 m!669715))

(assert (=> b!713094 m!669717))

(assert (=> bm!34579 m!669715))

(declare-fun m!669927 () Bool)

(assert (=> bm!34579 m!669927))

(assert (=> b!713097 m!669715))

(assert (=> b!713097 m!669715))

(declare-fun m!669929 () Bool)

(assert (=> b!713097 m!669929))

(assert (=> b!713093 m!669715))

(assert (=> b!713093 m!669715))

(assert (=> b!713093 m!669717))

(assert (=> b!712886 d!98077))

(declare-fun b!713106 () Bool)

(declare-fun e!401091 () Bool)

(declare-fun e!401090 () Bool)

(assert (=> b!713106 (= e!401091 e!401090)))

(declare-fun c!78810 () Bool)

(assert (=> b!713106 (= c!78810 (validKeyInArray!0 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun call!34584 () Bool)

(declare-fun bm!34581 () Bool)

(assert (=> bm!34581 (= call!34584 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78810 (Cons!13398 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318621) lt!318621)))))

(declare-fun b!713107 () Bool)

(assert (=> b!713107 (= e!401090 call!34584)))

(declare-fun b!713108 () Bool)

(assert (=> b!713108 (= e!401090 call!34584)))

(declare-fun b!713109 () Bool)

(declare-fun e!401092 () Bool)

(assert (=> b!713109 (= e!401092 (contains!3979 lt!318621 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98099 () Bool)

(declare-fun res!476219 () Bool)

(declare-fun e!401093 () Bool)

(assert (=> d!98099 (=> res!476219 e!401093)))

(assert (=> d!98099 (= res!476219 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19769 a!3591)))))

(assert (=> d!98099 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318621) e!401093)))

(declare-fun b!713105 () Bool)

(assert (=> b!713105 (= e!401093 e!401091)))

(declare-fun res!476220 () Bool)

(assert (=> b!713105 (=> (not res!476220) (not e!401091))))

(assert (=> b!713105 (= res!476220 (not e!401092))))

(declare-fun res!476221 () Bool)

(assert (=> b!713105 (=> (not res!476221) (not e!401092))))

(assert (=> b!713105 (= res!476221 (validKeyInArray!0 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98099 (not res!476219)) b!713105))

(assert (= (and b!713105 res!476221) b!713109))

(assert (= (and b!713105 res!476220) b!713106))

(assert (= (and b!713106 c!78810) b!713107))

(assert (= (and b!713106 (not c!78810)) b!713108))

(assert (= (or b!713107 b!713108) bm!34581))

(assert (=> b!713106 m!669823))

(assert (=> b!713106 m!669823))

(declare-fun m!669935 () Bool)

(assert (=> b!713106 m!669935))

(assert (=> bm!34581 m!669823))

(declare-fun m!669937 () Bool)

(assert (=> bm!34581 m!669937))

(assert (=> b!713109 m!669823))

(assert (=> b!713109 m!669823))

(declare-fun m!669939 () Bool)

(assert (=> b!713109 m!669939))

(assert (=> b!713105 m!669823))

(assert (=> b!713105 m!669823))

(assert (=> b!713105 m!669935))

(assert (=> b!712908 d!98099))

(declare-fun d!98103 () Bool)

(declare-fun res!476236 () Bool)

(declare-fun e!401111 () Bool)

(assert (=> d!98103 (=> res!476236 e!401111)))

(assert (=> d!98103 (= res!476236 (is-Nil!13399 lt!318623))))

(assert (=> d!98103 (= (noDuplicate!1226 lt!318623) e!401111)))

(declare-fun b!713130 () Bool)

(declare-fun e!401112 () Bool)

(assert (=> b!713130 (= e!401111 e!401112)))

(declare-fun res!476237 () Bool)

(assert (=> b!713130 (=> (not res!476237) (not e!401112))))

(assert (=> b!713130 (= res!476237 (not (contains!3979 (t!19714 lt!318623) (h!14443 lt!318623))))))

(declare-fun b!713131 () Bool)

(assert (=> b!713131 (= e!401112 (noDuplicate!1226 (t!19714 lt!318623)))))

(assert (= (and d!98103 (not res!476236)) b!713130))

(assert (= (and b!713130 res!476237) b!713131))

(declare-fun m!669967 () Bool)

(assert (=> b!713130 m!669967))

(declare-fun m!669969 () Bool)

(assert (=> b!713131 m!669969))

(assert (=> b!712887 d!98103))

(declare-fun d!98121 () Bool)

(declare-fun res!476240 () Bool)

(declare-fun e!401115 () Bool)

(assert (=> d!98121 (=> res!476240 e!401115)))

(assert (=> d!98121 (= res!476240 (is-Nil!13399 lt!318621))))

(assert (=> d!98121 (= (noDuplicate!1226 lt!318621) e!401115)))

(declare-fun b!713134 () Bool)

(declare-fun e!401116 () Bool)

(assert (=> b!713134 (= e!401115 e!401116)))

(declare-fun res!476241 () Bool)

(assert (=> b!713134 (=> (not res!476241) (not e!401116))))

(assert (=> b!713134 (= res!476241 (not (contains!3979 (t!19714 lt!318621) (h!14443 lt!318621))))))

(declare-fun b!713135 () Bool)

(assert (=> b!713135 (= e!401116 (noDuplicate!1226 (t!19714 lt!318621)))))

(assert (= (and d!98121 (not res!476240)) b!713134))

(assert (= (and b!713134 res!476241) b!713135))

(declare-fun m!669977 () Bool)

(assert (=> b!713134 m!669977))

(declare-fun m!669979 () Bool)

(assert (=> b!713135 m!669979))

(assert (=> b!712909 d!98121))

(declare-fun d!98127 () Bool)

(declare-fun lt!318662 () Bool)

(assert (=> d!98127 (= lt!318662 (member k!2824 (content!363 lt!318621)))))

(declare-fun e!401119 () Bool)

(assert (=> d!98127 (= lt!318662 e!401119)))

(declare-fun res!476244 () Bool)

(assert (=> d!98127 (=> (not res!476244) (not e!401119))))

(assert (=> d!98127 (= res!476244 (is-Cons!13398 lt!318621))))

(assert (=> d!98127 (= (contains!3979 lt!318621 k!2824) lt!318662)))

(declare-fun b!713138 () Bool)

(declare-fun e!401120 () Bool)

(assert (=> b!713138 (= e!401119 e!401120)))

(declare-fun res!476245 () Bool)

(assert (=> b!713138 (=> res!476245 e!401120)))

(assert (=> b!713138 (= res!476245 (= (h!14443 lt!318621) k!2824))))

(declare-fun b!713139 () Bool)

(assert (=> b!713139 (= e!401120 (contains!3979 (t!19714 lt!318621) k!2824))))

(assert (= (and d!98127 res!476244) b!713138))

(assert (= (and b!713138 (not res!476245)) b!713139))

(declare-fun m!669985 () Bool)

(assert (=> d!98127 m!669985))

(declare-fun m!669987 () Bool)

(assert (=> d!98127 m!669987))

(declare-fun m!669989 () Bool)

(assert (=> b!713139 m!669989))

(assert (=> b!712888 d!98127))

(declare-fun d!98131 () Bool)

(declare-fun res!476250 () Bool)

(declare-fun e!401125 () Bool)

(assert (=> d!98131 (=> res!476250 e!401125)))

(assert (=> d!98131 (= res!476250 (is-Nil!13399 acc!652))))

(assert (=> d!98131 (= (noDuplicate!1226 acc!652) e!401125)))

(declare-fun b!713144 () Bool)

(declare-fun e!401126 () Bool)

(assert (=> b!713144 (= e!401125 e!401126)))

(declare-fun res!476251 () Bool)

(assert (=> b!713144 (=> (not res!476251) (not e!401126))))

(assert (=> b!713144 (= res!476251 (not (contains!3979 (t!19714 acc!652) (h!14443 acc!652))))))

(declare-fun b!713145 () Bool)

(assert (=> b!713145 (= e!401126 (noDuplicate!1226 (t!19714 acc!652)))))

(assert (= (and d!98131 (not res!476250)) b!713144))

(assert (= (and b!713144 res!476251) b!713145))

(declare-fun m!669995 () Bool)

(assert (=> b!713144 m!669995))

(declare-fun m!669997 () Bool)

(assert (=> b!713145 m!669997))

(assert (=> b!712910 d!98131))

(declare-fun b!713175 () Bool)

(declare-fun e!401154 () Bool)

(declare-fun e!401152 () Bool)

(assert (=> b!713175 (= e!401154 e!401152)))

(declare-fun res!476272 () Bool)

(assert (=> b!713175 (=> res!476272 e!401152)))

(declare-fun e!401155 () Bool)

(assert (=> b!713175 (= res!476272 e!401155)))

(declare-fun res!476274 () Bool)

(assert (=> b!713175 (=> (not res!476274) (not e!401155))))

(assert (=> b!713175 (= res!476274 (= (h!14443 acc!652) (h!14443 newAcc!49)))))

(declare-fun b!713177 () Bool)

(assert (=> b!713177 (= e!401152 (subseq!424 acc!652 (t!19714 newAcc!49)))))

(declare-fun b!713174 () Bool)

(declare-fun e!401153 () Bool)

(assert (=> b!713174 (= e!401153 e!401154)))

(declare-fun res!476273 () Bool)

(assert (=> b!713174 (=> (not res!476273) (not e!401154))))

(assert (=> b!713174 (= res!476273 (is-Cons!13398 newAcc!49))))

(declare-fun b!713176 () Bool)

(assert (=> b!713176 (= e!401155 (subseq!424 (t!19714 acc!652) (t!19714 newAcc!49)))))

(declare-fun d!98135 () Bool)

(declare-fun res!476275 () Bool)

(assert (=> d!98135 (=> res!476275 e!401153)))

(assert (=> d!98135 (= res!476275 (is-Nil!13399 acc!652))))

(assert (=> d!98135 (= (subseq!424 acc!652 newAcc!49) e!401153)))

(assert (= (and d!98135 (not res!476275)) b!713174))

(assert (= (and b!713174 res!476273) b!713175))

(assert (= (and b!713175 res!476274) b!713176))

(assert (= (and b!713175 (not res!476272)) b!713177))

(declare-fun m!670017 () Bool)

(assert (=> b!713177 m!670017))

(declare-fun m!670019 () Bool)

(assert (=> b!713176 m!670019))

(assert (=> b!712889 d!98135))

(declare-fun d!98145 () Bool)

(declare-fun lt!318669 () Bool)

(assert (=> d!98145 (= lt!318669 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!363 lt!318621)))))

(declare-fun e!401156 () Bool)

(assert (=> d!98145 (= lt!318669 e!401156)))

(declare-fun res!476276 () Bool)

(assert (=> d!98145 (=> (not res!476276) (not e!401156))))

(assert (=> d!98145 (= res!476276 (is-Cons!13398 lt!318621))))

(assert (=> d!98145 (= (contains!3979 lt!318621 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318669)))

(declare-fun b!713178 () Bool)

(declare-fun e!401157 () Bool)

(assert (=> b!713178 (= e!401156 e!401157)))

(declare-fun res!476277 () Bool)

(assert (=> b!713178 (=> res!476277 e!401157)))

(assert (=> b!713178 (= res!476277 (= (h!14443 lt!318621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713179 () Bool)

(assert (=> b!713179 (= e!401157 (contains!3979 (t!19714 lt!318621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98145 res!476276) b!713178))

(assert (= (and b!713178 (not res!476277)) b!713179))

(assert (=> d!98145 m!669985))

(declare-fun m!670021 () Bool)

(assert (=> d!98145 m!670021))

(declare-fun m!670023 () Bool)

(assert (=> b!713179 m!670023))

(assert (=> b!712911 d!98145))

(declare-fun d!98147 () Bool)

(declare-fun res!476278 () Bool)

(declare-fun e!401158 () Bool)

(assert (=> d!98147 (=> res!476278 e!401158)))

(assert (=> d!98147 (= res!476278 (= (select (arr!19361 a!3591) from!2969) k!2824))))

(assert (=> d!98147 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!401158)))

(declare-fun b!713180 () Bool)

(declare-fun e!401159 () Bool)

(assert (=> b!713180 (= e!401158 e!401159)))

(declare-fun res!476279 () Bool)

(assert (=> b!713180 (=> (not res!476279) (not e!401159))))

(assert (=> b!713180 (= res!476279 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19769 a!3591)))))

(declare-fun b!713181 () Bool)

(assert (=> b!713181 (= e!401159 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98147 (not res!476278)) b!713180))

(assert (= (and b!713180 res!476279) b!713181))

(assert (=> d!98147 m!669715))

(declare-fun m!670025 () Bool)

(assert (=> b!713181 m!670025))

(assert (=> b!712890 d!98147))

(declare-fun d!98149 () Bool)

(assert (=> d!98149 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712912 d!98149))

(declare-fun d!98153 () Bool)

(assert (=> d!98153 (= (array_inv!15157 a!3591) (bvsge (size!19769 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63278 d!98153))

(declare-fun d!98157 () Bool)

(declare-fun lt!318671 () Bool)

(assert (=> d!98157 (= lt!318671 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!363 newAcc!49)))))

(declare-fun e!401165 () Bool)

(assert (=> d!98157 (= lt!318671 e!401165)))

(declare-fun res!476283 () Bool)

(assert (=> d!98157 (=> (not res!476283) (not e!401165))))

(assert (=> d!98157 (= res!476283 (is-Cons!13398 newAcc!49))))

(assert (=> d!98157 (= (contains!3979 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318671)))

(declare-fun b!713189 () Bool)

(declare-fun e!401166 () Bool)

(assert (=> b!713189 (= e!401165 e!401166)))

(declare-fun res!476284 () Bool)

(assert (=> b!713189 (=> res!476284 e!401166)))

(assert (=> b!713189 (= res!476284 (= (h!14443 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713190 () Bool)

(assert (=> b!713190 (= e!401166 (contains!3979 (t!19714 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98157 res!476283) b!713189))

(assert (= (and b!713189 (not res!476284)) b!713190))

(assert (=> d!98157 m!669803))

(declare-fun m!670041 () Bool)

(assert (=> d!98157 m!670041))

(declare-fun m!670043 () Bool)

(assert (=> b!713190 m!670043))

(assert (=> b!712891 d!98157))

(declare-fun d!98159 () Bool)

(declare-fun res!476285 () Bool)

(declare-fun e!401167 () Bool)

(assert (=> d!98159 (=> res!476285 e!401167)))

(assert (=> d!98159 (= res!476285 (is-Nil!13399 newAcc!49))))

(assert (=> d!98159 (= (noDuplicate!1226 newAcc!49) e!401167)))

(declare-fun b!713191 () Bool)

(declare-fun e!401168 () Bool)

(assert (=> b!713191 (= e!401167 e!401168)))

(declare-fun res!476286 () Bool)

(assert (=> b!713191 (=> (not res!476286) (not e!401168))))

(assert (=> b!713191 (= res!476286 (not (contains!3979 (t!19714 newAcc!49) (h!14443 newAcc!49))))))

(declare-fun b!713192 () Bool)

(assert (=> b!713192 (= e!401168 (noDuplicate!1226 (t!19714 newAcc!49)))))

(assert (= (and d!98159 (not res!476285)) b!713191))

(assert (= (and b!713191 res!476286) b!713192))

(declare-fun m!670045 () Bool)

(assert (=> b!713191 m!670045))

(declare-fun m!670047 () Bool)

(assert (=> b!713192 m!670047))

(assert (=> b!712892 d!98159))

(declare-fun d!98161 () Bool)

(declare-fun lt!318672 () Bool)

(assert (=> d!98161 (= lt!318672 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!363 lt!318623)))))

(declare-fun e!401169 () Bool)

(assert (=> d!98161 (= lt!318672 e!401169)))

(declare-fun res!476287 () Bool)

(assert (=> d!98161 (=> (not res!476287) (not e!401169))))

(assert (=> d!98161 (= res!476287 (is-Cons!13398 lt!318623))))

(assert (=> d!98161 (= (contains!3979 lt!318623 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318672)))

(declare-fun b!713193 () Bool)

(declare-fun e!401170 () Bool)

(assert (=> b!713193 (= e!401169 e!401170)))

(declare-fun res!476288 () Bool)

(assert (=> b!713193 (=> res!476288 e!401170)))

(assert (=> b!713193 (= res!476288 (= (h!14443 lt!318623) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713194 () Bool)

(assert (=> b!713194 (= e!401170 (contains!3979 (t!19714 lt!318623) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98161 res!476287) b!713193))

(assert (= (and b!713193 (not res!476288)) b!713194))

(assert (=> d!98161 m!669857))

(declare-fun m!670049 () Bool)

(assert (=> d!98161 m!670049))

(declare-fun m!670051 () Bool)

(assert (=> b!713194 m!670051))

(assert (=> b!712893 d!98161))

(declare-fun d!98163 () Bool)

(declare-fun lt!318673 () Bool)

(assert (=> d!98163 (= lt!318673 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!363 lt!318621)))))

(declare-fun e!401175 () Bool)

(assert (=> d!98163 (= lt!318673 e!401175)))

(declare-fun res!476293 () Bool)

(assert (=> d!98163 (=> (not res!476293) (not e!401175))))

(assert (=> d!98163 (= res!476293 (is-Cons!13398 lt!318621))))

(assert (=> d!98163 (= (contains!3979 lt!318621 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318673)))

(declare-fun b!713199 () Bool)

(declare-fun e!401176 () Bool)

(assert (=> b!713199 (= e!401175 e!401176)))

(declare-fun res!476294 () Bool)

(assert (=> b!713199 (=> res!476294 e!401176)))

(assert (=> b!713199 (= res!476294 (= (h!14443 lt!318621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713200 () Bool)

(assert (=> b!713200 (= e!401176 (contains!3979 (t!19714 lt!318621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98163 res!476293) b!713199))

(assert (= (and b!713199 (not res!476294)) b!713200))

(assert (=> d!98163 m!669985))

(declare-fun m!670053 () Bool)

(assert (=> d!98163 m!670053))

(declare-fun m!670055 () Bool)

(assert (=> b!713200 m!670055))

(assert (=> b!712894 d!98163))

(declare-fun d!98165 () Bool)

(declare-fun lt!318674 () Bool)

(assert (=> d!98165 (= lt!318674 (member k!2824 (content!363 newAcc!49)))))

(declare-fun e!401177 () Bool)

(assert (=> d!98165 (= lt!318674 e!401177)))

(declare-fun res!476295 () Bool)

(assert (=> d!98165 (=> (not res!476295) (not e!401177))))

(assert (=> d!98165 (= res!476295 (is-Cons!13398 newAcc!49))))

(assert (=> d!98165 (= (contains!3979 newAcc!49 k!2824) lt!318674)))

(declare-fun b!713201 () Bool)

(declare-fun e!401178 () Bool)

(assert (=> b!713201 (= e!401177 e!401178)))

(declare-fun res!476296 () Bool)

(assert (=> b!713201 (=> res!476296 e!401178)))

(assert (=> b!713201 (= res!476296 (= (h!14443 newAcc!49) k!2824))))

(declare-fun b!713202 () Bool)

(assert (=> b!713202 (= e!401178 (contains!3979 (t!19714 newAcc!49) k!2824))))

(assert (= (and d!98165 res!476295) b!713201))

(assert (= (and b!713201 (not res!476296)) b!713202))

(assert (=> d!98165 m!669803))

(declare-fun m!670057 () Bool)

(assert (=> d!98165 m!670057))

(declare-fun m!670059 () Bool)

(assert (=> b!713202 m!670059))

(assert (=> b!712895 d!98165))

(declare-fun d!98167 () Bool)

(declare-fun lt!318675 () Bool)

(assert (=> d!98167 (= lt!318675 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!363 acc!652)))))

(declare-fun e!401179 () Bool)

(assert (=> d!98167 (= lt!318675 e!401179)))

(declare-fun res!476297 () Bool)

(assert (=> d!98167 (=> (not res!476297) (not e!401179))))

(assert (=> d!98167 (= res!476297 (is-Cons!13398 acc!652))))

(assert (=> d!98167 (= (contains!3979 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318675)))

(declare-fun b!713203 () Bool)

(declare-fun e!401180 () Bool)

(assert (=> b!713203 (= e!401179 e!401180)))

(declare-fun res!476298 () Bool)

(assert (=> b!713203 (=> res!476298 e!401180)))

(assert (=> b!713203 (= res!476298 (= (h!14443 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713204 () Bool)

(assert (=> b!713204 (= e!401180 (contains!3979 (t!19714 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98167 res!476297) b!713203))

(assert (= (and b!713203 (not res!476298)) b!713204))

(assert (=> d!98167 m!669847))

(declare-fun m!670061 () Bool)

(assert (=> d!98167 m!670061))

(declare-fun m!670063 () Bool)

(assert (=> b!713204 m!670063))

(assert (=> b!712896 d!98167))

(declare-fun b!713208 () Bool)

(declare-fun e!401184 () Bool)

(declare-fun e!401183 () Bool)

(assert (=> b!713208 (= e!401184 e!401183)))

(declare-fun c!78820 () Bool)

(assert (=> b!713208 (= c!78820 (validKeyInArray!0 (select (arr!19361 a!3591) from!2969)))))

(declare-fun call!34590 () Bool)

(declare-fun bm!34587 () Bool)

(assert (=> bm!34587 (= call!34590 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78820 (Cons!13398 (select (arr!19361 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!713209 () Bool)

(assert (=> b!713209 (= e!401183 call!34590)))

(declare-fun b!713210 () Bool)

(assert (=> b!713210 (= e!401183 call!34590)))

(declare-fun e!401185 () Bool)

(declare-fun b!713211 () Bool)

(assert (=> b!713211 (= e!401185 (contains!3979 newAcc!49 (select (arr!19361 a!3591) from!2969)))))

(declare-fun d!98169 () Bool)

(declare-fun res!476301 () Bool)

(declare-fun e!401186 () Bool)

(assert (=> d!98169 (=> res!476301 e!401186)))

(assert (=> d!98169 (= res!476301 (bvsge from!2969 (size!19769 a!3591)))))

(assert (=> d!98169 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401186)))

(declare-fun b!713207 () Bool)

(assert (=> b!713207 (= e!401186 e!401184)))

(declare-fun res!476302 () Bool)

(assert (=> b!713207 (=> (not res!476302) (not e!401184))))

(assert (=> b!713207 (= res!476302 (not e!401185))))

(declare-fun res!476303 () Bool)

(assert (=> b!713207 (=> (not res!476303) (not e!401185))))

(assert (=> b!713207 (= res!476303 (validKeyInArray!0 (select (arr!19361 a!3591) from!2969)))))

(assert (= (and d!98169 (not res!476301)) b!713207))

(assert (= (and b!713207 res!476303) b!713211))

(assert (= (and b!713207 res!476302) b!713208))

(assert (= (and b!713208 c!78820) b!713209))

(assert (= (and b!713208 (not c!78820)) b!713210))

(assert (= (or b!713209 b!713210) bm!34587))

(assert (=> b!713208 m!669715))

(assert (=> b!713208 m!669715))

(assert (=> b!713208 m!669717))

(assert (=> bm!34587 m!669715))

(declare-fun m!670067 () Bool)

(assert (=> bm!34587 m!670067))

(assert (=> b!713211 m!669715))

(assert (=> b!713211 m!669715))

(declare-fun m!670069 () Bool)

(assert (=> b!713211 m!670069))

(assert (=> b!713207 m!669715))

(assert (=> b!713207 m!669715))

(assert (=> b!713207 m!669717))

(assert (=> b!712897 d!98169))

(declare-fun b!713218 () Bool)

(declare-fun e!401192 () Bool)

(declare-fun e!401191 () Bool)

(assert (=> b!713218 (= e!401192 e!401191)))

(declare-fun c!78822 () Bool)

(assert (=> b!713218 (= c!78822 (validKeyInArray!0 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun call!34592 () Bool)

(declare-fun bm!34589 () Bool)

(assert (=> bm!34589 (= call!34592 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78822 (Cons!13398 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318623) lt!318623)))))

(declare-fun b!713219 () Bool)

(assert (=> b!713219 (= e!401191 call!34592)))

(declare-fun b!713220 () Bool)

(assert (=> b!713220 (= e!401191 call!34592)))

(declare-fun b!713221 () Bool)

(declare-fun e!401193 () Bool)

(assert (=> b!713221 (= e!401193 (contains!3979 lt!318623 (select (arr!19361 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98173 () Bool)

(declare-fun res!476307 () Bool)

(declare-fun e!401194 () Bool)

(assert (=> d!98173 (=> res!476307 e!401194)))

(assert (=> d!98173 (= res!476307 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19769 a!3591)))))

(assert (=> d!98173 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318623) e!401194)))

