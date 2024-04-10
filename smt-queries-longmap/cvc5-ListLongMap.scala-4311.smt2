; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59894 () Bool)

(assert start!59894)

(declare-fun b!662966 () Bool)

(declare-fun res!430931 () Bool)

(declare-fun e!380497 () Bool)

(assert (=> b!662966 (=> (not res!430931) (not e!380497))))

(declare-fun e!380500 () Bool)

(assert (=> b!662966 (= res!430931 e!380500)))

(declare-fun res!430929 () Bool)

(assert (=> b!662966 (=> res!430929 e!380500)))

(declare-fun e!380499 () Bool)

(assert (=> b!662966 (= res!430929 e!380499)))

(declare-fun res!430923 () Bool)

(assert (=> b!662966 (=> (not res!430923) (not e!380499))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662966 (= res!430923 (bvsgt from!3004 i!1382))))

(declare-fun b!662967 () Bool)

(declare-datatypes ((Unit!23046 0))(
  ( (Unit!23047) )
))
(declare-fun e!380495 () Unit!23046)

(declare-fun Unit!23048 () Unit!23046)

(assert (=> b!662967 (= e!380495 Unit!23048)))

(declare-fun b!662968 () Bool)

(declare-fun res!430919 () Bool)

(assert (=> b!662968 (=> (not res!430919) (not e!380497))))

(declare-datatypes ((array!38941 0))(
  ( (array!38942 (arr!18663 (Array (_ BitVec 32) (_ BitVec 64))) (size!19027 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38941)

(declare-datatypes ((List!12704 0))(
  ( (Nil!12701) (Cons!12700 (h!13745 (_ BitVec 64)) (t!18932 List!12704)) )
))
(declare-fun arrayNoDuplicates!0 (array!38941 (_ BitVec 32) List!12704) Bool)

(assert (=> b!662968 (= res!430919 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12701))))

(declare-fun b!662969 () Bool)

(declare-fun res!430934 () Bool)

(assert (=> b!662969 (=> (not res!430934) (not e!380497))))

(declare-fun acc!681 () List!12704)

(declare-fun contains!3281 (List!12704 (_ BitVec 64)) Bool)

(assert (=> b!662969 (= res!430934 (not (contains!3281 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662970 () Bool)

(declare-fun res!430933 () Bool)

(assert (=> b!662970 (=> (not res!430933) (not e!380497))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662970 (= res!430933 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662972 () Bool)

(declare-fun res!430927 () Bool)

(assert (=> b!662972 (=> (not res!430927) (not e!380497))))

(assert (=> b!662972 (= res!430927 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662973 () Bool)

(declare-fun res!430930 () Bool)

(declare-fun e!380496 () Bool)

(assert (=> b!662973 (=> res!430930 e!380496)))

(declare-fun lt!309155 () List!12704)

(declare-fun subseq!20 (List!12704 List!12704) Bool)

(assert (=> b!662973 (= res!430930 (not (subseq!20 acc!681 lt!309155)))))

(declare-fun b!662974 () Bool)

(declare-fun e!380498 () Bool)

(assert (=> b!662974 (= e!380498 (not (contains!3281 acc!681 k!2843)))))

(declare-fun b!662975 () Bool)

(declare-fun res!430920 () Bool)

(assert (=> b!662975 (=> res!430920 e!380496)))

(assert (=> b!662975 (= res!430920 (contains!3281 lt!309155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662976 () Bool)

(declare-fun res!430937 () Bool)

(assert (=> b!662976 (=> (not res!430937) (not e!380497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662976 (= res!430937 (validKeyInArray!0 k!2843))))

(declare-fun b!662977 () Bool)

(assert (=> b!662977 (= e!380496 true)))

(declare-fun lt!309159 () Bool)

(assert (=> b!662977 (= lt!309159 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309155))))

(declare-fun lt!309160 () Unit!23046)

(declare-fun noDuplicateSubseq!20 (List!12704 List!12704) Unit!23046)

(assert (=> b!662977 (= lt!309160 (noDuplicateSubseq!20 acc!681 lt!309155))))

(declare-fun b!662978 () Bool)

(declare-fun res!430926 () Bool)

(assert (=> b!662978 (=> res!430926 e!380496)))

(assert (=> b!662978 (= res!430926 (contains!3281 lt!309155 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662979 () Bool)

(declare-fun res!430928 () Bool)

(assert (=> b!662979 (=> (not res!430928) (not e!380497))))

(assert (=> b!662979 (= res!430928 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19027 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662980 () Bool)

(declare-fun res!430935 () Bool)

(assert (=> b!662980 (=> (not res!430935) (not e!380497))))

(assert (=> b!662980 (= res!430935 (not (contains!3281 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662981 () Bool)

(declare-fun Unit!23049 () Unit!23046)

(assert (=> b!662981 (= e!380495 Unit!23049)))

(declare-fun lt!309156 () Unit!23046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38941 (_ BitVec 64) (_ BitVec 32)) Unit!23046)

(assert (=> b!662981 (= lt!309156 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662981 false))

(declare-fun res!430921 () Bool)

(assert (=> start!59894 (=> (not res!430921) (not e!380497))))

(assert (=> start!59894 (= res!430921 (and (bvslt (size!19027 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19027 a!3626))))))

(assert (=> start!59894 e!380497))

(assert (=> start!59894 true))

(declare-fun array_inv!14459 (array!38941) Bool)

(assert (=> start!59894 (array_inv!14459 a!3626)))

(declare-fun b!662971 () Bool)

(assert (=> b!662971 (= e!380499 (contains!3281 acc!681 k!2843))))

(declare-fun b!662982 () Bool)

(declare-fun e!380502 () Bool)

(assert (=> b!662982 (= e!380497 (not e!380502))))

(declare-fun res!430932 () Bool)

(assert (=> b!662982 (=> res!430932 e!380502)))

(assert (=> b!662982 (= res!430932 (not (validKeyInArray!0 (select (arr!18663 a!3626) from!3004))))))

(declare-fun lt!309158 () Unit!23046)

(assert (=> b!662982 (= lt!309158 e!380495)))

(declare-fun c!76391 () Bool)

(assert (=> b!662982 (= c!76391 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662982 (arrayContainsKey!0 (array!38942 (store (arr!18663 a!3626) i!1382 k!2843) (size!19027 a!3626)) k!2843 from!3004)))

(declare-fun b!662983 () Bool)

(assert (=> b!662983 (= e!380502 e!380496)))

(declare-fun res!430918 () Bool)

(assert (=> b!662983 (=> res!430918 e!380496)))

(assert (=> b!662983 (= res!430918 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!152 (List!12704 (_ BitVec 64)) List!12704)

(assert (=> b!662983 (= lt!309155 ($colon$colon!152 acc!681 (select (arr!18663 a!3626) from!3004)))))

(assert (=> b!662983 (subseq!20 acc!681 acc!681)))

(declare-fun lt!309157 () Unit!23046)

(declare-fun lemmaListSubSeqRefl!0 (List!12704) Unit!23046)

(assert (=> b!662983 (= lt!309157 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662984 () Bool)

(declare-fun res!430924 () Bool)

(assert (=> b!662984 (=> (not res!430924) (not e!380497))))

(assert (=> b!662984 (= res!430924 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19027 a!3626))))))

(declare-fun b!662985 () Bool)

(declare-fun res!430925 () Bool)

(assert (=> b!662985 (=> res!430925 e!380496)))

(declare-fun noDuplicate!528 (List!12704) Bool)

(assert (=> b!662985 (= res!430925 (not (noDuplicate!528 lt!309155)))))

(declare-fun b!662986 () Bool)

(declare-fun res!430936 () Bool)

(assert (=> b!662986 (=> (not res!430936) (not e!380497))))

(assert (=> b!662986 (= res!430936 (noDuplicate!528 acc!681))))

(declare-fun b!662987 () Bool)

(assert (=> b!662987 (= e!380500 e!380498)))

(declare-fun res!430922 () Bool)

(assert (=> b!662987 (=> (not res!430922) (not e!380498))))

(assert (=> b!662987 (= res!430922 (bvsle from!3004 i!1382))))

(assert (= (and start!59894 res!430921) b!662986))

(assert (= (and b!662986 res!430936) b!662980))

(assert (= (and b!662980 res!430935) b!662969))

(assert (= (and b!662969 res!430934) b!662966))

(assert (= (and b!662966 res!430923) b!662971))

(assert (= (and b!662966 (not res!430929)) b!662987))

(assert (= (and b!662987 res!430922) b!662974))

(assert (= (and b!662966 res!430931) b!662968))

(assert (= (and b!662968 res!430919) b!662972))

(assert (= (and b!662972 res!430927) b!662984))

(assert (= (and b!662984 res!430924) b!662976))

(assert (= (and b!662976 res!430937) b!662970))

(assert (= (and b!662970 res!430933) b!662979))

(assert (= (and b!662979 res!430928) b!662982))

(assert (= (and b!662982 c!76391) b!662981))

(assert (= (and b!662982 (not c!76391)) b!662967))

(assert (= (and b!662982 (not res!430932)) b!662983))

(assert (= (and b!662983 (not res!430918)) b!662985))

(assert (= (and b!662985 (not res!430925)) b!662975))

(assert (= (and b!662975 (not res!430920)) b!662978))

(assert (= (and b!662978 (not res!430926)) b!662973))

(assert (= (and b!662973 (not res!430930)) b!662977))

(declare-fun m!634661 () Bool)

(assert (=> b!662982 m!634661))

(declare-fun m!634663 () Bool)

(assert (=> b!662982 m!634663))

(declare-fun m!634665 () Bool)

(assert (=> b!662982 m!634665))

(assert (=> b!662982 m!634661))

(declare-fun m!634667 () Bool)

(assert (=> b!662982 m!634667))

(declare-fun m!634669 () Bool)

(assert (=> b!662982 m!634669))

(declare-fun m!634671 () Bool)

(assert (=> b!662985 m!634671))

(declare-fun m!634673 () Bool)

(assert (=> start!59894 m!634673))

(declare-fun m!634675 () Bool)

(assert (=> b!662980 m!634675))

(declare-fun m!634677 () Bool)

(assert (=> b!662974 m!634677))

(declare-fun m!634679 () Bool)

(assert (=> b!662970 m!634679))

(declare-fun m!634681 () Bool)

(assert (=> b!662973 m!634681))

(declare-fun m!634683 () Bool)

(assert (=> b!662978 m!634683))

(declare-fun m!634685 () Bool)

(assert (=> b!662972 m!634685))

(declare-fun m!634687 () Bool)

(assert (=> b!662969 m!634687))

(declare-fun m!634689 () Bool)

(assert (=> b!662968 m!634689))

(assert (=> b!662971 m!634677))

(declare-fun m!634691 () Bool)

(assert (=> b!662981 m!634691))

(assert (=> b!662983 m!634661))

(assert (=> b!662983 m!634661))

(declare-fun m!634693 () Bool)

(assert (=> b!662983 m!634693))

(declare-fun m!634695 () Bool)

(assert (=> b!662983 m!634695))

(declare-fun m!634697 () Bool)

(assert (=> b!662983 m!634697))

(declare-fun m!634699 () Bool)

(assert (=> b!662976 m!634699))

(declare-fun m!634701 () Bool)

(assert (=> b!662977 m!634701))

(declare-fun m!634703 () Bool)

(assert (=> b!662977 m!634703))

(declare-fun m!634705 () Bool)

(assert (=> b!662975 m!634705))

(declare-fun m!634707 () Bool)

(assert (=> b!662986 m!634707))

(push 1)

