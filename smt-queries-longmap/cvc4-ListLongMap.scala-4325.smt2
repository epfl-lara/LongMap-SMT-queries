; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59982 () Bool)

(assert start!59982)

(declare-fun b!665903 () Bool)

(declare-fun e!381506 () Bool)

(declare-datatypes ((List!12748 0))(
  ( (Nil!12745) (Cons!12744 (h!13789 (_ BitVec 64)) (t!18976 List!12748)) )
))
(declare-fun acc!681 () List!12748)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3325 (List!12748 (_ BitVec 64)) Bool)

(assert (=> b!665903 (= e!381506 (not (contains!3325 acc!681 k!2843)))))

(declare-fun b!665904 () Bool)

(declare-fun res!433377 () Bool)

(declare-fun e!381510 () Bool)

(assert (=> b!665904 (=> (not res!433377) (not e!381510))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39029 0))(
  ( (array!39030 (arr!18707 (Array (_ BitVec 32) (_ BitVec 64))) (size!19071 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39029)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665904 (= res!433377 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19071 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665905 () Bool)

(declare-fun res!433364 () Bool)

(assert (=> b!665905 (=> (not res!433364) (not e!381510))))

(assert (=> b!665905 (= res!433364 (not (contains!3325 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665906 () Bool)

(declare-fun res!433373 () Bool)

(assert (=> b!665906 (=> (not res!433373) (not e!381510))))

(declare-fun e!381508 () Bool)

(assert (=> b!665906 (= res!433373 e!381508)))

(declare-fun res!433367 () Bool)

(assert (=> b!665906 (=> res!433367 e!381508)))

(declare-fun e!381512 () Bool)

(assert (=> b!665906 (= res!433367 e!381512)))

(declare-fun res!433363 () Bool)

(assert (=> b!665906 (=> (not res!433363) (not e!381512))))

(assert (=> b!665906 (= res!433363 (bvsgt from!3004 i!1382))))

(declare-fun b!665907 () Bool)

(declare-fun e!381513 () Bool)

(assert (=> b!665907 (= e!381513 true)))

(declare-fun lt!310211 () Bool)

(declare-fun lt!310207 () List!12748)

(assert (=> b!665907 (= lt!310211 (contains!3325 lt!310207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665908 () Bool)

(declare-fun res!433365 () Bool)

(assert (=> b!665908 (=> (not res!433365) (not e!381510))))

(declare-fun noDuplicate!572 (List!12748) Bool)

(assert (=> b!665908 (= res!433365 (noDuplicate!572 acc!681))))

(declare-fun b!665909 () Bool)

(declare-datatypes ((Unit!23260 0))(
  ( (Unit!23261) )
))
(declare-fun e!381511 () Unit!23260)

(declare-fun lt!310206 () Unit!23260)

(assert (=> b!665909 (= e!381511 lt!310206)))

(declare-fun lt!310205 () Unit!23260)

(declare-fun lemmaListSubSeqRefl!0 (List!12748) Unit!23260)

(assert (=> b!665909 (= lt!310205 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!64 (List!12748 List!12748) Bool)

(assert (=> b!665909 (subseq!64 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39029 List!12748 List!12748 (_ BitVec 32)) Unit!23260)

(declare-fun $colon$colon!196 (List!12748 (_ BitVec 64)) List!12748)

(assert (=> b!665909 (= lt!310206 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!196 acc!681 (select (arr!18707 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39029 (_ BitVec 32) List!12748) Bool)

(assert (=> b!665909 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665910 () Bool)

(assert (=> b!665910 (= e!381512 (contains!3325 acc!681 k!2843))))

(declare-fun b!665911 () Bool)

(declare-fun res!433372 () Bool)

(assert (=> b!665911 (=> res!433372 e!381513)))

(declare-fun lt!310210 () Bool)

(assert (=> b!665911 (= res!433372 lt!310210)))

(declare-fun b!665912 () Bool)

(declare-fun res!433359 () Bool)

(assert (=> b!665912 (=> (not res!433359) (not e!381510))))

(assert (=> b!665912 (= res!433359 (not (contains!3325 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665913 () Bool)

(declare-fun res!433368 () Bool)

(assert (=> b!665913 (=> (not res!433368) (not e!381510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665913 (= res!433368 (validKeyInArray!0 k!2843))))

(declare-fun b!665914 () Bool)

(declare-fun res!433370 () Bool)

(assert (=> b!665914 (=> (not res!433370) (not e!381510))))

(assert (=> b!665914 (= res!433370 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19071 a!3626))))))

(declare-fun b!665915 () Bool)

(declare-fun Unit!23262 () Unit!23260)

(assert (=> b!665915 (= e!381511 Unit!23262)))

(declare-fun b!665916 () Bool)

(declare-fun res!433376 () Bool)

(assert (=> b!665916 (=> res!433376 e!381513)))

(assert (=> b!665916 (= res!433376 (contains!3325 lt!310207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665917 () Bool)

(declare-fun res!433361 () Bool)

(assert (=> b!665917 (=> res!433361 e!381513)))

(assert (=> b!665917 (= res!433361 (contains!3325 acc!681 k!2843))))

(declare-fun b!665918 () Bool)

(declare-fun e!381509 () Unit!23260)

(declare-fun Unit!23263 () Unit!23260)

(assert (=> b!665918 (= e!381509 Unit!23263)))

(declare-fun b!665919 () Bool)

(declare-fun res!433375 () Bool)

(assert (=> b!665919 (=> res!433375 e!381513)))

(assert (=> b!665919 (= res!433375 (not (subseq!64 acc!681 lt!310207)))))

(declare-fun b!665920 () Bool)

(declare-fun res!433360 () Bool)

(assert (=> b!665920 (=> res!433360 e!381513)))

(assert (=> b!665920 (= res!433360 (not (contains!3325 lt!310207 k!2843)))))

(declare-fun b!665921 () Bool)

(assert (=> b!665921 (= e!381510 (not e!381513))))

(declare-fun res!433379 () Bool)

(assert (=> b!665921 (=> res!433379 e!381513)))

(assert (=> b!665921 (= res!433379 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!62 (List!12748 (_ BitVec 64)) List!12748)

(assert (=> b!665921 (= (-!62 lt!310207 k!2843) acc!681)))

(assert (=> b!665921 (= lt!310207 ($colon$colon!196 acc!681 k!2843))))

(declare-fun lt!310213 () Unit!23260)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12748) Unit!23260)

(assert (=> b!665921 (= lt!310213 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665921 (subseq!64 acc!681 acc!681)))

(declare-fun lt!310208 () Unit!23260)

(assert (=> b!665921 (= lt!310208 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665921 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310212 () Unit!23260)

(assert (=> b!665921 (= lt!310212 e!381511)))

(declare-fun c!76640 () Bool)

(assert (=> b!665921 (= c!76640 (validKeyInArray!0 (select (arr!18707 a!3626) from!3004)))))

(declare-fun lt!310204 () Unit!23260)

(assert (=> b!665921 (= lt!310204 e!381509)))

(declare-fun c!76639 () Bool)

(assert (=> b!665921 (= c!76639 lt!310210)))

(declare-fun arrayContainsKey!0 (array!39029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665921 (= lt!310210 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665921 (arrayContainsKey!0 (array!39030 (store (arr!18707 a!3626) i!1382 k!2843) (size!19071 a!3626)) k!2843 from!3004)))

(declare-fun b!665922 () Bool)

(declare-fun res!433362 () Bool)

(assert (=> b!665922 (=> res!433362 e!381513)))

(assert (=> b!665922 (= res!433362 (not (noDuplicate!572 lt!310207)))))

(declare-fun b!665923 () Bool)

(declare-fun res!433374 () Bool)

(assert (=> b!665923 (=> (not res!433374) (not e!381510))))

(assert (=> b!665923 (= res!433374 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665924 () Bool)

(declare-fun res!433366 () Bool)

(assert (=> b!665924 (=> (not res!433366) (not e!381510))))

(assert (=> b!665924 (= res!433366 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665925 () Bool)

(declare-fun res!433378 () Bool)

(assert (=> b!665925 (=> (not res!433378) (not e!381510))))

(assert (=> b!665925 (= res!433378 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12745))))

(declare-fun res!433371 () Bool)

(assert (=> start!59982 (=> (not res!433371) (not e!381510))))

(assert (=> start!59982 (= res!433371 (and (bvslt (size!19071 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19071 a!3626))))))

(assert (=> start!59982 e!381510))

(assert (=> start!59982 true))

(declare-fun array_inv!14503 (array!39029) Bool)

(assert (=> start!59982 (array_inv!14503 a!3626)))

(declare-fun b!665926 () Bool)

(declare-fun Unit!23264 () Unit!23260)

(assert (=> b!665926 (= e!381509 Unit!23264)))

(declare-fun lt!310209 () Unit!23260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39029 (_ BitVec 64) (_ BitVec 32)) Unit!23260)

(assert (=> b!665926 (= lt!310209 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665926 false))

(declare-fun b!665927 () Bool)

(assert (=> b!665927 (= e!381508 e!381506)))

(declare-fun res!433369 () Bool)

(assert (=> b!665927 (=> (not res!433369) (not e!381506))))

(assert (=> b!665927 (= res!433369 (bvsle from!3004 i!1382))))

(assert (= (and start!59982 res!433371) b!665908))

(assert (= (and b!665908 res!433365) b!665912))

(assert (= (and b!665912 res!433359) b!665905))

(assert (= (and b!665905 res!433364) b!665906))

(assert (= (and b!665906 res!433363) b!665910))

(assert (= (and b!665906 (not res!433367)) b!665927))

(assert (= (and b!665927 res!433369) b!665903))

(assert (= (and b!665906 res!433373) b!665925))

(assert (= (and b!665925 res!433378) b!665923))

(assert (= (and b!665923 res!433374) b!665914))

(assert (= (and b!665914 res!433370) b!665913))

(assert (= (and b!665913 res!433368) b!665924))

(assert (= (and b!665924 res!433366) b!665904))

(assert (= (and b!665904 res!433377) b!665921))

(assert (= (and b!665921 c!76639) b!665926))

(assert (= (and b!665921 (not c!76639)) b!665918))

(assert (= (and b!665921 c!76640) b!665909))

(assert (= (and b!665921 (not c!76640)) b!665915))

(assert (= (and b!665921 (not res!433379)) b!665922))

(assert (= (and b!665922 (not res!433362)) b!665911))

(assert (= (and b!665911 (not res!433372)) b!665917))

(assert (= (and b!665917 (not res!433361)) b!665919))

(assert (= (and b!665919 (not res!433375)) b!665920))

(assert (= (and b!665920 (not res!433360)) b!665916))

(assert (= (and b!665916 (not res!433376)) b!665907))

(declare-fun m!636837 () Bool)

(assert (=> b!665907 m!636837))

(declare-fun m!636839 () Bool)

(assert (=> b!665903 m!636839))

(declare-fun m!636841 () Bool)

(assert (=> b!665921 m!636841))

(declare-fun m!636843 () Bool)

(assert (=> b!665921 m!636843))

(declare-fun m!636845 () Bool)

(assert (=> b!665921 m!636845))

(declare-fun m!636847 () Bool)

(assert (=> b!665921 m!636847))

(declare-fun m!636849 () Bool)

(assert (=> b!665921 m!636849))

(declare-fun m!636851 () Bool)

(assert (=> b!665921 m!636851))

(declare-fun m!636853 () Bool)

(assert (=> b!665921 m!636853))

(declare-fun m!636855 () Bool)

(assert (=> b!665921 m!636855))

(assert (=> b!665921 m!636843))

(declare-fun m!636857 () Bool)

(assert (=> b!665921 m!636857))

(declare-fun m!636859 () Bool)

(assert (=> b!665921 m!636859))

(declare-fun m!636861 () Bool)

(assert (=> b!665921 m!636861))

(declare-fun m!636863 () Bool)

(assert (=> b!665916 m!636863))

(declare-fun m!636865 () Bool)

(assert (=> b!665925 m!636865))

(declare-fun m!636867 () Bool)

(assert (=> b!665908 m!636867))

(declare-fun m!636869 () Bool)

(assert (=> b!665924 m!636869))

(declare-fun m!636871 () Bool)

(assert (=> start!59982 m!636871))

(declare-fun m!636873 () Bool)

(assert (=> b!665913 m!636873))

(declare-fun m!636875 () Bool)

(assert (=> b!665905 m!636875))

(assert (=> b!665910 m!636839))

(declare-fun m!636877 () Bool)

(assert (=> b!665919 m!636877))

(declare-fun m!636879 () Bool)

(assert (=> b!665920 m!636879))

(assert (=> b!665917 m!636839))

(declare-fun m!636881 () Bool)

(assert (=> b!665912 m!636881))

(declare-fun m!636883 () Bool)

(assert (=> b!665923 m!636883))

(declare-fun m!636885 () Bool)

(assert (=> b!665922 m!636885))

(declare-fun m!636887 () Bool)

(assert (=> b!665926 m!636887))

(assert (=> b!665909 m!636841))

(assert (=> b!665909 m!636843))

(declare-fun m!636889 () Bool)

(assert (=> b!665909 m!636889))

(declare-fun m!636891 () Bool)

(assert (=> b!665909 m!636891))

(assert (=> b!665909 m!636843))

(assert (=> b!665909 m!636889))

(assert (=> b!665909 m!636851))

(assert (=> b!665909 m!636861))

(push 1)

(assert (not b!665926))

(assert (not b!665921))

(assert (not b!665917))

(assert (not b!665922))

(assert (not b!665907))

(assert (not b!665924))

(assert (not b!665923))

(assert (not b!665925))

(assert (not start!59982))

(assert (not b!665905))

(assert (not b!665912))

(assert (not b!665913))

(assert (not b!665910))

(assert (not b!665919))

(assert (not b!665920))

(assert (not b!665903))

(assert (not b!665916))

(assert (not b!665908))

(assert (not b!665909))

(check-sat)

