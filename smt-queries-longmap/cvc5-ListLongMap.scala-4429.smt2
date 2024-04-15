; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61542 () Bool)

(assert start!61542)

(declare-fun b!687897 () Bool)

(declare-fun res!452814 () Bool)

(declare-fun e!391813 () Bool)

(assert (=> b!687897 (=> (not res!452814) (not e!391813))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39694 0))(
  ( (array!39695 (arr!19018 (Array (_ BitVec 32) (_ BitVec 64))) (size!19399 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39694)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!687897 (= res!452814 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19399 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687898 () Bool)

(declare-datatypes ((Unit!24240 0))(
  ( (Unit!24241) )
))
(declare-fun e!391820 () Unit!24240)

(declare-fun Unit!24242 () Unit!24240)

(assert (=> b!687898 (= e!391820 Unit!24242)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lt!315422 () Unit!24240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39694 (_ BitVec 64) (_ BitVec 32)) Unit!24240)

(assert (=> b!687898 (= lt!315422 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!687898 false))

(declare-fun b!687899 () Bool)

(declare-fun res!452812 () Bool)

(assert (=> b!687899 (=> (not res!452812) (not e!391813))))

(declare-datatypes ((List!13098 0))(
  ( (Nil!13095) (Cons!13094 (h!14139 (_ BitVec 64)) (t!19353 List!13098)) )
))
(declare-fun arrayNoDuplicates!0 (array!39694 (_ BitVec 32) List!13098) Bool)

(assert (=> b!687899 (= res!452812 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13095))))

(declare-fun b!687900 () Bool)

(declare-fun e!391818 () Unit!24240)

(declare-fun Unit!24243 () Unit!24240)

(assert (=> b!687900 (= e!391818 Unit!24243)))

(declare-fun b!687901 () Bool)

(declare-fun e!391810 () Bool)

(declare-fun acc!681 () List!13098)

(declare-fun contains!3620 (List!13098 (_ BitVec 64)) Bool)

(assert (=> b!687901 (= e!391810 (not (contains!3620 acc!681 k!2843)))))

(declare-fun b!687902 () Bool)

(declare-fun res!452817 () Bool)

(declare-fun e!391812 () Bool)

(assert (=> b!687902 (=> res!452817 e!391812)))

(declare-fun lt!315423 () List!13098)

(assert (=> b!687902 (= res!452817 (contains!3620 lt!315423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687903 () Bool)

(declare-fun res!452810 () Bool)

(assert (=> b!687903 (=> (not res!452810) (not e!391813))))

(assert (=> b!687903 (= res!452810 (not (contains!3620 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687904 () Bool)

(declare-fun res!452802 () Bool)

(assert (=> b!687904 (=> res!452802 e!391812)))

(assert (=> b!687904 (= res!452802 (contains!3620 lt!315423 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687905 () Bool)

(declare-fun res!452808 () Bool)

(assert (=> b!687905 (=> (not res!452808) (not e!391813))))

(declare-fun arrayContainsKey!0 (array!39694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687905 (= res!452808 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687906 () Bool)

(declare-fun e!391816 () Bool)

(assert (=> b!687906 (= e!391816 e!391810)))

(declare-fun res!452819 () Bool)

(assert (=> b!687906 (=> (not res!452819) (not e!391810))))

(assert (=> b!687906 (= res!452819 (bvsle from!3004 i!1382))))

(declare-fun b!687907 () Bool)

(declare-fun e!391815 () Bool)

(declare-fun e!391817 () Bool)

(assert (=> b!687907 (= e!391815 e!391817)))

(declare-fun res!452807 () Bool)

(assert (=> b!687907 (=> (not res!452807) (not e!391817))))

(assert (=> b!687907 (= res!452807 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687908 () Bool)

(assert (=> b!687908 (= e!391812 true)))

(declare-fun lt!315414 () Bool)

(assert (=> b!687908 (= lt!315414 e!391815)))

(declare-fun res!452805 () Bool)

(assert (=> b!687908 (=> res!452805 e!391815)))

(declare-fun e!391819 () Bool)

(assert (=> b!687908 (= res!452805 e!391819)))

(declare-fun res!452803 () Bool)

(assert (=> b!687908 (=> (not res!452803) (not e!391819))))

(assert (=> b!687908 (= res!452803 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687909 () Bool)

(declare-fun res!452816 () Bool)

(assert (=> b!687909 (=> (not res!452816) (not e!391813))))

(assert (=> b!687909 (= res!452816 e!391816)))

(declare-fun res!452815 () Bool)

(assert (=> b!687909 (=> res!452815 e!391816)))

(declare-fun e!391811 () Bool)

(assert (=> b!687909 (= res!452815 e!391811)))

(declare-fun res!452821 () Bool)

(assert (=> b!687909 (=> (not res!452821) (not e!391811))))

(assert (=> b!687909 (= res!452821 (bvsgt from!3004 i!1382))))

(declare-fun b!687910 () Bool)

(assert (=> b!687910 (= e!391811 (contains!3620 acc!681 k!2843))))

(declare-fun b!687911 () Bool)

(assert (=> b!687911 (= e!391813 (not e!391812))))

(declare-fun res!452804 () Bool)

(assert (=> b!687911 (=> res!452804 e!391812)))

(assert (=> b!687911 (= res!452804 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687911 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315423)))

(declare-fun lt!315420 () Unit!24240)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39694 (_ BitVec 64) (_ BitVec 32) List!13098 List!13098) Unit!24240)

(assert (=> b!687911 (= lt!315420 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315423))))

(declare-fun -!188 (List!13098 (_ BitVec 64)) List!13098)

(assert (=> b!687911 (= (-!188 lt!315423 k!2843) acc!681)))

(declare-fun $colon$colon!387 (List!13098 (_ BitVec 64)) List!13098)

(assert (=> b!687911 (= lt!315423 ($colon$colon!387 acc!681 k!2843))))

(declare-fun lt!315417 () Unit!24240)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13098) Unit!24240)

(assert (=> b!687911 (= lt!315417 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!223 (List!13098 List!13098) Bool)

(assert (=> b!687911 (subseq!223 acc!681 acc!681)))

(declare-fun lt!315415 () Unit!24240)

(declare-fun lemmaListSubSeqRefl!0 (List!13098) Unit!24240)

(assert (=> b!687911 (= lt!315415 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687911 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315416 () Unit!24240)

(assert (=> b!687911 (= lt!315416 e!391818)))

(declare-fun c!77916 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687911 (= c!77916 (validKeyInArray!0 (select (arr!19018 a!3626) from!3004)))))

(declare-fun lt!315421 () Unit!24240)

(assert (=> b!687911 (= lt!315421 e!391820)))

(declare-fun c!77915 () Bool)

(assert (=> b!687911 (= c!77915 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687911 (arrayContainsKey!0 (array!39695 (store (arr!19018 a!3626) i!1382 k!2843) (size!19399 a!3626)) k!2843 from!3004)))

(declare-fun res!452801 () Bool)

(assert (=> start!61542 (=> (not res!452801) (not e!391813))))

(assert (=> start!61542 (= res!452801 (and (bvslt (size!19399 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19399 a!3626))))))

(assert (=> start!61542 e!391813))

(assert (=> start!61542 true))

(declare-fun array_inv!14901 (array!39694) Bool)

(assert (=> start!61542 (array_inv!14901 a!3626)))

(declare-fun b!687912 () Bool)

(declare-fun Unit!24244 () Unit!24240)

(assert (=> b!687912 (= e!391820 Unit!24244)))

(declare-fun b!687913 () Bool)

(declare-fun res!452806 () Bool)

(assert (=> b!687913 (=> (not res!452806) (not e!391813))))

(assert (=> b!687913 (= res!452806 (validKeyInArray!0 k!2843))))

(declare-fun b!687914 () Bool)

(assert (=> b!687914 (= e!391817 (not (contains!3620 lt!315423 k!2843)))))

(declare-fun b!687915 () Bool)

(declare-fun res!452820 () Bool)

(assert (=> b!687915 (=> (not res!452820) (not e!391813))))

(declare-fun noDuplicate!889 (List!13098) Bool)

(assert (=> b!687915 (= res!452820 (noDuplicate!889 acc!681))))

(declare-fun b!687916 () Bool)

(declare-fun lt!315418 () Unit!24240)

(assert (=> b!687916 (= e!391818 lt!315418)))

(declare-fun lt!315419 () Unit!24240)

(assert (=> b!687916 (= lt!315419 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687916 (subseq!223 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39694 List!13098 List!13098 (_ BitVec 32)) Unit!24240)

(assert (=> b!687916 (= lt!315418 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!387 acc!681 (select (arr!19018 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687916 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687917 () Bool)

(declare-fun res!452813 () Bool)

(assert (=> b!687917 (=> (not res!452813) (not e!391813))))

(assert (=> b!687917 (= res!452813 (not (contains!3620 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687918 () Bool)

(declare-fun res!452818 () Bool)

(assert (=> b!687918 (=> (not res!452818) (not e!391813))))

(assert (=> b!687918 (= res!452818 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19399 a!3626))))))

(declare-fun b!687919 () Bool)

(declare-fun res!452809 () Bool)

(assert (=> b!687919 (=> (not res!452809) (not e!391813))))

(assert (=> b!687919 (= res!452809 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687920 () Bool)

(declare-fun res!452811 () Bool)

(assert (=> b!687920 (=> res!452811 e!391812)))

(assert (=> b!687920 (= res!452811 (not (noDuplicate!889 lt!315423)))))

(declare-fun b!687921 () Bool)

(assert (=> b!687921 (= e!391819 (contains!3620 lt!315423 k!2843))))

(assert (= (and start!61542 res!452801) b!687915))

(assert (= (and b!687915 res!452820) b!687917))

(assert (= (and b!687917 res!452813) b!687903))

(assert (= (and b!687903 res!452810) b!687909))

(assert (= (and b!687909 res!452821) b!687910))

(assert (= (and b!687909 (not res!452815)) b!687906))

(assert (= (and b!687906 res!452819) b!687901))

(assert (= (and b!687909 res!452816) b!687899))

(assert (= (and b!687899 res!452812) b!687919))

(assert (= (and b!687919 res!452809) b!687918))

(assert (= (and b!687918 res!452818) b!687913))

(assert (= (and b!687913 res!452806) b!687905))

(assert (= (and b!687905 res!452808) b!687897))

(assert (= (and b!687897 res!452814) b!687911))

(assert (= (and b!687911 c!77915) b!687898))

(assert (= (and b!687911 (not c!77915)) b!687912))

(assert (= (and b!687911 c!77916) b!687916))

(assert (= (and b!687911 (not c!77916)) b!687900))

(assert (= (and b!687911 (not res!452804)) b!687920))

(assert (= (and b!687920 (not res!452811)) b!687902))

(assert (= (and b!687902 (not res!452817)) b!687904))

(assert (= (and b!687904 (not res!452802)) b!687908))

(assert (= (and b!687908 res!452803) b!687921))

(assert (= (and b!687908 (not res!452805)) b!687907))

(assert (= (and b!687907 res!452807) b!687914))

(declare-fun m!651359 () Bool)

(assert (=> b!687903 m!651359))

(declare-fun m!651361 () Bool)

(assert (=> b!687916 m!651361))

(declare-fun m!651363 () Bool)

(assert (=> b!687916 m!651363))

(declare-fun m!651365 () Bool)

(assert (=> b!687916 m!651365))

(declare-fun m!651367 () Bool)

(assert (=> b!687916 m!651367))

(assert (=> b!687916 m!651363))

(assert (=> b!687916 m!651365))

(declare-fun m!651369 () Bool)

(assert (=> b!687916 m!651369))

(declare-fun m!651371 () Bool)

(assert (=> b!687916 m!651371))

(declare-fun m!651373 () Bool)

(assert (=> start!61542 m!651373))

(declare-fun m!651375 () Bool)

(assert (=> b!687917 m!651375))

(declare-fun m!651377 () Bool)

(assert (=> b!687921 m!651377))

(declare-fun m!651379 () Bool)

(assert (=> b!687904 m!651379))

(declare-fun m!651381 () Bool)

(assert (=> b!687915 m!651381))

(declare-fun m!651383 () Bool)

(assert (=> b!687919 m!651383))

(assert (=> b!687914 m!651377))

(declare-fun m!651385 () Bool)

(assert (=> b!687905 m!651385))

(declare-fun m!651387 () Bool)

(assert (=> b!687899 m!651387))

(declare-fun m!651389 () Bool)

(assert (=> b!687902 m!651389))

(declare-fun m!651391 () Bool)

(assert (=> b!687920 m!651391))

(declare-fun m!651393 () Bool)

(assert (=> b!687910 m!651393))

(declare-fun m!651395 () Bool)

(assert (=> b!687898 m!651395))

(assert (=> b!687901 m!651393))

(declare-fun m!651397 () Bool)

(assert (=> b!687913 m!651397))

(declare-fun m!651399 () Bool)

(assert (=> b!687911 m!651399))

(assert (=> b!687911 m!651361))

(assert (=> b!687911 m!651363))

(declare-fun m!651401 () Bool)

(assert (=> b!687911 m!651401))

(assert (=> b!687911 m!651369))

(declare-fun m!651403 () Bool)

(assert (=> b!687911 m!651403))

(declare-fun m!651405 () Bool)

(assert (=> b!687911 m!651405))

(declare-fun m!651407 () Bool)

(assert (=> b!687911 m!651407))

(declare-fun m!651409 () Bool)

(assert (=> b!687911 m!651409))

(declare-fun m!651411 () Bool)

(assert (=> b!687911 m!651411))

(assert (=> b!687911 m!651363))

(declare-fun m!651413 () Bool)

(assert (=> b!687911 m!651413))

(declare-fun m!651415 () Bool)

(assert (=> b!687911 m!651415))

(assert (=> b!687911 m!651371))

(push 1)

(assert (not b!687898))

(assert (not b!687913))

(assert (not b!687904))

(assert (not b!687914))

(assert (not b!687899))

(assert (not b!687917))

(assert (not b!687901))

(assert (not b!687910))

(assert (not b!687905))

(assert (not b!687921))

(assert (not b!687911))

(assert (not start!61542))

(assert (not b!687903))

(assert (not b!687902))

(assert (not b!687915))

(assert (not b!687916))

(assert (not b!687920))

(assert (not b!687919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

