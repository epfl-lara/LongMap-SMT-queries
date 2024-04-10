; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59862 () Bool)

(assert start!59862)

(declare-fun b!661910 () Bool)

(declare-fun e!380115 () Bool)

(declare-datatypes ((List!12688 0))(
  ( (Nil!12685) (Cons!12684 (h!13729 (_ BitVec 64)) (t!18916 List!12688)) )
))
(declare-fun acc!681 () List!12688)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3265 (List!12688 (_ BitVec 64)) Bool)

(assert (=> b!661910 (= e!380115 (not (contains!3265 acc!681 k!2843)))))

(declare-fun b!661911 () Bool)

(declare-fun res!429965 () Bool)

(declare-fun e!380117 () Bool)

(assert (=> b!661911 (=> res!429965 e!380117)))

(declare-fun lt!308872 () List!12688)

(declare-fun subseq!4 (List!12688 List!12688) Bool)

(assert (=> b!661911 (= res!429965 (not (subseq!4 acc!681 lt!308872)))))

(declare-fun b!661912 () Bool)

(declare-fun res!429962 () Bool)

(declare-fun e!380111 () Bool)

(assert (=> b!661912 (=> (not res!429962) (not e!380111))))

(declare-datatypes ((array!38909 0))(
  ( (array!38910 (arr!18647 (Array (_ BitVec 32) (_ BitVec 64))) (size!19011 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38909)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38909 (_ BitVec 32) List!12688) Bool)

(assert (=> b!661912 (= res!429962 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661913 () Bool)

(declare-fun e!380112 () Bool)

(assert (=> b!661913 (= e!380112 (contains!3265 acc!681 k!2843))))

(declare-fun b!661914 () Bool)

(declare-fun e!380116 () Bool)

(assert (=> b!661914 (= e!380116 e!380115)))

(declare-fun res!429973 () Bool)

(assert (=> b!661914 (=> (not res!429973) (not e!380115))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661914 (= res!429973 (bvsle from!3004 i!1382))))

(declare-fun b!661915 () Bool)

(declare-fun res!429959 () Bool)

(assert (=> b!661915 (=> (not res!429959) (not e!380111))))

(assert (=> b!661915 (= res!429959 (not (contains!3265 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429975 () Bool)

(assert (=> start!59862 (=> (not res!429975) (not e!380111))))

(assert (=> start!59862 (= res!429975 (and (bvslt (size!19011 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19011 a!3626))))))

(assert (=> start!59862 e!380111))

(assert (=> start!59862 true))

(declare-fun array_inv!14443 (array!38909) Bool)

(assert (=> start!59862 (array_inv!14443 a!3626)))

(declare-fun b!661916 () Bool)

(declare-fun res!429968 () Bool)

(assert (=> b!661916 (=> res!429968 e!380117)))

(declare-fun noDuplicate!512 (List!12688) Bool)

(assert (=> b!661916 (= res!429968 (not (noDuplicate!512 lt!308872)))))

(declare-fun b!661917 () Bool)

(declare-fun res!429969 () Bool)

(assert (=> b!661917 (=> (not res!429969) (not e!380111))))

(assert (=> b!661917 (= res!429969 (noDuplicate!512 acc!681))))

(declare-fun b!661918 () Bool)

(declare-fun res!429977 () Bool)

(assert (=> b!661918 (=> res!429977 e!380117)))

(assert (=> b!661918 (= res!429977 (contains!3265 lt!308872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661919 () Bool)

(assert (=> b!661919 (= e!380117 true)))

(declare-fun lt!308870 () Bool)

(assert (=> b!661919 (= lt!308870 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308872))))

(declare-datatypes ((Unit!22982 0))(
  ( (Unit!22983) )
))
(declare-fun lt!308868 () Unit!22982)

(declare-fun noDuplicateSubseq!4 (List!12688 List!12688) Unit!22982)

(assert (=> b!661919 (= lt!308868 (noDuplicateSubseq!4 acc!681 lt!308872))))

(declare-fun b!661920 () Bool)

(declare-fun res!429967 () Bool)

(assert (=> b!661920 (=> (not res!429967) (not e!380111))))

(assert (=> b!661920 (= res!429967 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19011 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661921 () Bool)

(declare-fun res!429970 () Bool)

(assert (=> b!661921 (=> (not res!429970) (not e!380111))))

(declare-fun arrayContainsKey!0 (array!38909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661921 (= res!429970 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661922 () Bool)

(declare-fun e!380118 () Unit!22982)

(declare-fun Unit!22984 () Unit!22982)

(assert (=> b!661922 (= e!380118 Unit!22984)))

(declare-fun b!661923 () Bool)

(declare-fun e!380114 () Bool)

(assert (=> b!661923 (= e!380114 e!380117)))

(declare-fun res!429974 () Bool)

(assert (=> b!661923 (=> res!429974 e!380117)))

(assert (=> b!661923 (= res!429974 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!136 (List!12688 (_ BitVec 64)) List!12688)

(assert (=> b!661923 (= lt!308872 ($colon$colon!136 acc!681 (select (arr!18647 a!3626) from!3004)))))

(assert (=> b!661923 (subseq!4 acc!681 acc!681)))

(declare-fun lt!308871 () Unit!22982)

(declare-fun lemmaListSubSeqRefl!0 (List!12688) Unit!22982)

(assert (=> b!661923 (= lt!308871 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661924 () Bool)

(assert (=> b!661924 (= e!380111 (not e!380114))))

(declare-fun res!429976 () Bool)

(assert (=> b!661924 (=> res!429976 e!380114)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661924 (= res!429976 (not (validKeyInArray!0 (select (arr!18647 a!3626) from!3004))))))

(declare-fun lt!308867 () Unit!22982)

(assert (=> b!661924 (= lt!308867 e!380118)))

(declare-fun c!76343 () Bool)

(assert (=> b!661924 (= c!76343 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661924 (arrayContainsKey!0 (array!38910 (store (arr!18647 a!3626) i!1382 k!2843) (size!19011 a!3626)) k!2843 from!3004)))

(declare-fun b!661925 () Bool)

(declare-fun Unit!22985 () Unit!22982)

(assert (=> b!661925 (= e!380118 Unit!22985)))

(declare-fun lt!308869 () Unit!22982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38909 (_ BitVec 64) (_ BitVec 32)) Unit!22982)

(assert (=> b!661925 (= lt!308869 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!661925 false))

(declare-fun b!661926 () Bool)

(declare-fun res!429961 () Bool)

(assert (=> b!661926 (=> (not res!429961) (not e!380111))))

(assert (=> b!661926 (= res!429961 (not (contains!3265 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661927 () Bool)

(declare-fun res!429964 () Bool)

(assert (=> b!661927 (=> (not res!429964) (not e!380111))))

(assert (=> b!661927 (= res!429964 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12685))))

(declare-fun b!661928 () Bool)

(declare-fun res!429971 () Bool)

(assert (=> b!661928 (=> (not res!429971) (not e!380111))))

(assert (=> b!661928 (= res!429971 e!380116)))

(declare-fun res!429966 () Bool)

(assert (=> b!661928 (=> res!429966 e!380116)))

(assert (=> b!661928 (= res!429966 e!380112)))

(declare-fun res!429958 () Bool)

(assert (=> b!661928 (=> (not res!429958) (not e!380112))))

(assert (=> b!661928 (= res!429958 (bvsgt from!3004 i!1382))))

(declare-fun b!661929 () Bool)

(declare-fun res!429963 () Bool)

(assert (=> b!661929 (=> (not res!429963) (not e!380111))))

(assert (=> b!661929 (= res!429963 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19011 a!3626))))))

(declare-fun b!661930 () Bool)

(declare-fun res!429960 () Bool)

(assert (=> b!661930 (=> res!429960 e!380117)))

(assert (=> b!661930 (= res!429960 (contains!3265 lt!308872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661931 () Bool)

(declare-fun res!429972 () Bool)

(assert (=> b!661931 (=> (not res!429972) (not e!380111))))

(assert (=> b!661931 (= res!429972 (validKeyInArray!0 k!2843))))

(assert (= (and start!59862 res!429975) b!661917))

(assert (= (and b!661917 res!429969) b!661926))

(assert (= (and b!661926 res!429961) b!661915))

(assert (= (and b!661915 res!429959) b!661928))

(assert (= (and b!661928 res!429958) b!661913))

(assert (= (and b!661928 (not res!429966)) b!661914))

(assert (= (and b!661914 res!429973) b!661910))

(assert (= (and b!661928 res!429971) b!661927))

(assert (= (and b!661927 res!429964) b!661912))

(assert (= (and b!661912 res!429962) b!661929))

(assert (= (and b!661929 res!429963) b!661931))

(assert (= (and b!661931 res!429972) b!661921))

(assert (= (and b!661921 res!429970) b!661920))

(assert (= (and b!661920 res!429967) b!661924))

(assert (= (and b!661924 c!76343) b!661925))

(assert (= (and b!661924 (not c!76343)) b!661922))

(assert (= (and b!661924 (not res!429976)) b!661923))

(assert (= (and b!661923 (not res!429974)) b!661916))

(assert (= (and b!661916 (not res!429968)) b!661930))

(assert (= (and b!661930 (not res!429960)) b!661918))

(assert (= (and b!661918 (not res!429977)) b!661911))

(assert (= (and b!661911 (not res!429965)) b!661919))

(declare-fun m!633893 () Bool)

(assert (=> b!661921 m!633893))

(declare-fun m!633895 () Bool)

(assert (=> b!661913 m!633895))

(declare-fun m!633897 () Bool)

(assert (=> b!661931 m!633897))

(declare-fun m!633899 () Bool)

(assert (=> b!661923 m!633899))

(assert (=> b!661923 m!633899))

(declare-fun m!633901 () Bool)

(assert (=> b!661923 m!633901))

(declare-fun m!633903 () Bool)

(assert (=> b!661923 m!633903))

(declare-fun m!633905 () Bool)

(assert (=> b!661923 m!633905))

(declare-fun m!633907 () Bool)

(assert (=> b!661925 m!633907))

(declare-fun m!633909 () Bool)

(assert (=> b!661918 m!633909))

(declare-fun m!633911 () Bool)

(assert (=> start!59862 m!633911))

(assert (=> b!661924 m!633899))

(declare-fun m!633913 () Bool)

(assert (=> b!661924 m!633913))

(declare-fun m!633915 () Bool)

(assert (=> b!661924 m!633915))

(assert (=> b!661924 m!633899))

(declare-fun m!633917 () Bool)

(assert (=> b!661924 m!633917))

(declare-fun m!633919 () Bool)

(assert (=> b!661924 m!633919))

(declare-fun m!633921 () Bool)

(assert (=> b!661911 m!633921))

(assert (=> b!661910 m!633895))

(declare-fun m!633923 () Bool)

(assert (=> b!661916 m!633923))

(declare-fun m!633925 () Bool)

(assert (=> b!661912 m!633925))

(declare-fun m!633927 () Bool)

(assert (=> b!661927 m!633927))

(declare-fun m!633929 () Bool)

(assert (=> b!661919 m!633929))

(declare-fun m!633931 () Bool)

(assert (=> b!661919 m!633931))

(declare-fun m!633933 () Bool)

(assert (=> b!661926 m!633933))

(declare-fun m!633935 () Bool)

(assert (=> b!661917 m!633935))

(declare-fun m!633937 () Bool)

(assert (=> b!661915 m!633937))

(declare-fun m!633939 () Bool)

(assert (=> b!661930 m!633939))

(push 1)

