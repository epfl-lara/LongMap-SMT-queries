; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60096 () Bool)

(assert start!60096)

(declare-fun b!670368 () Bool)

(declare-fun e!383233 () Bool)

(assert (=> b!670368 (= e!383233 true)))

(declare-datatypes ((array!39154 0))(
  ( (array!39155 (arr!18769 (Array (_ BitVec 32) (_ BitVec 64))) (size!19134 (_ BitVec 32))) )
))
(declare-fun lt!311883 () array!39154)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12849 0))(
  ( (Nil!12846) (Cons!12845 (h!13890 (_ BitVec 64)) (t!19068 List!12849)) )
))
(declare-fun lt!311879 () List!12849)

(declare-fun arrayNoDuplicates!0 (array!39154 (_ BitVec 32) List!12849) Bool)

(assert (=> b!670368 (arrayNoDuplicates!0 lt!311883 (bvadd #b00000000000000000000000000000001 from!3004) lt!311879)))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((Unit!23553 0))(
  ( (Unit!23554) )
))
(declare-fun lt!311880 () Unit!23553)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun a!3626 () array!39154)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39154 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12849) Unit!23553)

(assert (=> b!670368 (= lt!311880 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311879))))

(declare-fun b!670369 () Bool)

(declare-fun res!437238 () Bool)

(declare-fun e!383232 () Bool)

(assert (=> b!670369 (=> (not res!437238) (not e!383232))))

(declare-fun acc!681 () List!12849)

(assert (=> b!670369 (= res!437238 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670370 () Bool)

(declare-fun e!383239 () Unit!23553)

(declare-fun Unit!23555 () Unit!23553)

(assert (=> b!670370 (= e!383239 Unit!23555)))

(declare-fun lt!311873 () Unit!23553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39154 (_ BitVec 64) (_ BitVec 32)) Unit!23553)

(assert (=> b!670370 (= lt!311873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670370 false))

(declare-fun b!670371 () Bool)

(declare-fun e!383237 () Bool)

(declare-fun contains!3371 (List!12849 (_ BitVec 64)) Bool)

(assert (=> b!670371 (= e!383237 (not (contains!3371 acc!681 k!2843)))))

(declare-fun b!670372 () Bool)

(declare-fun res!437231 () Bool)

(assert (=> b!670372 (=> (not res!437231) (not e!383232))))

(assert (=> b!670372 (= res!437231 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19134 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670373 () Bool)

(declare-fun res!437227 () Bool)

(assert (=> b!670373 (=> res!437227 e!383233)))

(declare-fun noDuplicate!640 (List!12849) Bool)

(assert (=> b!670373 (= res!437227 (not (noDuplicate!640 lt!311879)))))

(declare-fun b!670374 () Bool)

(declare-fun res!437243 () Bool)

(assert (=> b!670374 (=> res!437243 e!383233)))

(assert (=> b!670374 (= res!437243 (contains!3371 lt!311879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670375 () Bool)

(declare-fun e!383238 () Bool)

(assert (=> b!670375 (= e!383238 (contains!3371 lt!311879 k!2843))))

(declare-fun b!670376 () Bool)

(declare-fun res!437239 () Bool)

(assert (=> b!670376 (=> (not res!437239) (not e!383232))))

(declare-fun arrayContainsKey!0 (array!39154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670376 (= res!437239 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670377 () Bool)

(declare-fun Unit!23556 () Unit!23553)

(assert (=> b!670377 (= e!383239 Unit!23556)))

(declare-fun b!670378 () Bool)

(assert (=> b!670378 (= e!383232 (not e!383233))))

(declare-fun res!437246 () Bool)

(assert (=> b!670378 (=> res!437246 e!383233)))

(assert (=> b!670378 (= res!437246 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670378 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311879)))

(declare-fun lt!311878 () Unit!23553)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39154 (_ BitVec 64) (_ BitVec 32) List!12849 List!12849) Unit!23553)

(assert (=> b!670378 (= lt!311878 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311879))))

(declare-fun -!125 (List!12849 (_ BitVec 64)) List!12849)

(assert (=> b!670378 (= (-!125 lt!311879 k!2843) acc!681)))

(declare-fun $colon$colon!258 (List!12849 (_ BitVec 64)) List!12849)

(assert (=> b!670378 (= lt!311879 ($colon$colon!258 acc!681 k!2843))))

(declare-fun lt!311875 () Unit!23553)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12849) Unit!23553)

(assert (=> b!670378 (= lt!311875 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!127 (List!12849 List!12849) Bool)

(assert (=> b!670378 (subseq!127 acc!681 acc!681)))

(declare-fun lt!311877 () Unit!23553)

(declare-fun lemmaListSubSeqRefl!0 (List!12849) Unit!23553)

(assert (=> b!670378 (= lt!311877 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670378 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311876 () Unit!23553)

(declare-fun e!383230 () Unit!23553)

(assert (=> b!670378 (= lt!311876 e!383230)))

(declare-fun c!76937 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670378 (= c!76937 (validKeyInArray!0 (select (arr!18769 a!3626) from!3004)))))

(declare-fun lt!311881 () Unit!23553)

(assert (=> b!670378 (= lt!311881 e!383239)))

(declare-fun c!76938 () Bool)

(assert (=> b!670378 (= c!76938 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670378 (arrayContainsKey!0 lt!311883 k!2843 from!3004)))

(assert (=> b!670378 (= lt!311883 (array!39155 (store (arr!18769 a!3626) i!1382 k!2843) (size!19134 a!3626)))))

(declare-fun b!670379 () Bool)

(declare-fun e!383235 () Bool)

(assert (=> b!670379 (= e!383235 e!383237)))

(declare-fun res!437241 () Bool)

(assert (=> b!670379 (=> (not res!437241) (not e!383237))))

(assert (=> b!670379 (= res!437241 (bvsle from!3004 i!1382))))

(declare-fun b!670380 () Bool)

(declare-fun Unit!23557 () Unit!23553)

(assert (=> b!670380 (= e!383230 Unit!23557)))

(declare-fun b!670367 () Bool)

(declare-fun e!383236 () Bool)

(assert (=> b!670367 (= e!383236 (not (contains!3371 lt!311879 k!2843)))))

(declare-fun res!437229 () Bool)

(assert (=> start!60096 (=> (not res!437229) (not e!383232))))

(assert (=> start!60096 (= res!437229 (and (bvslt (size!19134 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19134 a!3626))))))

(assert (=> start!60096 e!383232))

(assert (=> start!60096 true))

(declare-fun array_inv!14652 (array!39154) Bool)

(assert (=> start!60096 (array_inv!14652 a!3626)))

(declare-fun b!670381 () Bool)

(declare-fun res!437240 () Bool)

(assert (=> b!670381 (=> res!437240 e!383233)))

(assert (=> b!670381 (= res!437240 (contains!3371 lt!311879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670382 () Bool)

(declare-fun res!437237 () Bool)

(assert (=> b!670382 (=> res!437237 e!383233)))

(declare-fun e!383240 () Bool)

(assert (=> b!670382 (= res!437237 e!383240)))

(declare-fun res!437233 () Bool)

(assert (=> b!670382 (=> (not res!437233) (not e!383240))))

(assert (=> b!670382 (= res!437233 e!383236)))

(declare-fun res!437248 () Bool)

(assert (=> b!670382 (=> res!437248 e!383236)))

(assert (=> b!670382 (= res!437248 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670383 () Bool)

(declare-fun res!437232 () Bool)

(assert (=> b!670383 (=> (not res!437232) (not e!383232))))

(assert (=> b!670383 (= res!437232 (not (contains!3371 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670384 () Bool)

(declare-fun res!437230 () Bool)

(assert (=> b!670384 (=> (not res!437230) (not e!383232))))

(assert (=> b!670384 (= res!437230 (not (contains!3371 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670385 () Bool)

(declare-fun res!437247 () Bool)

(assert (=> b!670385 (=> (not res!437247) (not e!383232))))

(assert (=> b!670385 (= res!437247 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12846))))

(declare-fun b!670386 () Bool)

(declare-fun res!437242 () Bool)

(assert (=> b!670386 (=> (not res!437242) (not e!383232))))

(assert (=> b!670386 (= res!437242 e!383235)))

(declare-fun res!437245 () Bool)

(assert (=> b!670386 (=> res!437245 e!383235)))

(declare-fun e!383231 () Bool)

(assert (=> b!670386 (= res!437245 e!383231)))

(declare-fun res!437228 () Bool)

(assert (=> b!670386 (=> (not res!437228) (not e!383231))))

(assert (=> b!670386 (= res!437228 (bvsgt from!3004 i!1382))))

(declare-fun b!670387 () Bool)

(assert (=> b!670387 (= e!383231 (contains!3371 acc!681 k!2843))))

(declare-fun b!670388 () Bool)

(declare-fun res!437235 () Bool)

(assert (=> b!670388 (=> (not res!437235) (not e!383232))))

(assert (=> b!670388 (= res!437235 (validKeyInArray!0 k!2843))))

(declare-fun b!670389 () Bool)

(declare-fun res!437244 () Bool)

(assert (=> b!670389 (=> (not res!437244) (not e!383232))))

(assert (=> b!670389 (= res!437244 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19134 a!3626))))))

(declare-fun b!670390 () Bool)

(declare-fun lt!311882 () Unit!23553)

(assert (=> b!670390 (= e!383230 lt!311882)))

(declare-fun lt!311874 () Unit!23553)

(assert (=> b!670390 (= lt!311874 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670390 (subseq!127 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39154 List!12849 List!12849 (_ BitVec 32)) Unit!23553)

(assert (=> b!670390 (= lt!311882 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!258 acc!681 (select (arr!18769 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670390 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670391 () Bool)

(declare-fun res!437236 () Bool)

(assert (=> b!670391 (=> (not res!437236) (not e!383232))))

(assert (=> b!670391 (= res!437236 (noDuplicate!640 acc!681))))

(declare-fun b!670392 () Bool)

(assert (=> b!670392 (= e!383240 e!383238)))

(declare-fun res!437234 () Bool)

(assert (=> b!670392 (=> res!437234 e!383238)))

(assert (=> b!670392 (= res!437234 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60096 res!437229) b!670391))

(assert (= (and b!670391 res!437236) b!670384))

(assert (= (and b!670384 res!437230) b!670383))

(assert (= (and b!670383 res!437232) b!670386))

(assert (= (and b!670386 res!437228) b!670387))

(assert (= (and b!670386 (not res!437245)) b!670379))

(assert (= (and b!670379 res!437241) b!670371))

(assert (= (and b!670386 res!437242) b!670385))

(assert (= (and b!670385 res!437247) b!670369))

(assert (= (and b!670369 res!437238) b!670389))

(assert (= (and b!670389 res!437244) b!670388))

(assert (= (and b!670388 res!437235) b!670376))

(assert (= (and b!670376 res!437239) b!670372))

(assert (= (and b!670372 res!437231) b!670378))

(assert (= (and b!670378 c!76938) b!670370))

(assert (= (and b!670378 (not c!76938)) b!670377))

(assert (= (and b!670378 c!76937) b!670390))

(assert (= (and b!670378 (not c!76937)) b!670380))

(assert (= (and b!670378 (not res!437246)) b!670373))

(assert (= (and b!670373 (not res!437227)) b!670374))

(assert (= (and b!670374 (not res!437243)) b!670381))

(assert (= (and b!670381 (not res!437240)) b!670382))

(assert (= (and b!670382 (not res!437248)) b!670367))

(assert (= (and b!670382 res!437233) b!670392))

(assert (= (and b!670392 (not res!437234)) b!670375))

(assert (= (and b!670382 (not res!437237)) b!670368))

(declare-fun m!639715 () Bool)

(assert (=> b!670375 m!639715))

(declare-fun m!639717 () Bool)

(assert (=> b!670376 m!639717))

(declare-fun m!639719 () Bool)

(assert (=> b!670387 m!639719))

(declare-fun m!639721 () Bool)

(assert (=> b!670385 m!639721))

(declare-fun m!639723 () Bool)

(assert (=> b!670391 m!639723))

(declare-fun m!639725 () Bool)

(assert (=> b!670374 m!639725))

(declare-fun m!639727 () Bool)

(assert (=> b!670368 m!639727))

(declare-fun m!639729 () Bool)

(assert (=> b!670368 m!639729))

(declare-fun m!639731 () Bool)

(assert (=> b!670388 m!639731))

(declare-fun m!639733 () Bool)

(assert (=> b!670390 m!639733))

(declare-fun m!639735 () Bool)

(assert (=> b!670390 m!639735))

(declare-fun m!639737 () Bool)

(assert (=> b!670390 m!639737))

(declare-fun m!639739 () Bool)

(assert (=> b!670390 m!639739))

(assert (=> b!670390 m!639735))

(assert (=> b!670390 m!639737))

(declare-fun m!639741 () Bool)

(assert (=> b!670390 m!639741))

(declare-fun m!639743 () Bool)

(assert (=> b!670390 m!639743))

(assert (=> b!670371 m!639719))

(declare-fun m!639745 () Bool)

(assert (=> b!670373 m!639745))

(declare-fun m!639747 () Bool)

(assert (=> b!670378 m!639747))

(assert (=> b!670378 m!639733))

(assert (=> b!670378 m!639735))

(declare-fun m!639749 () Bool)

(assert (=> b!670378 m!639749))

(declare-fun m!639751 () Bool)

(assert (=> b!670378 m!639751))

(declare-fun m!639753 () Bool)

(assert (=> b!670378 m!639753))

(assert (=> b!670378 m!639741))

(declare-fun m!639755 () Bool)

(assert (=> b!670378 m!639755))

(declare-fun m!639757 () Bool)

(assert (=> b!670378 m!639757))

(declare-fun m!639759 () Bool)

(assert (=> b!670378 m!639759))

(declare-fun m!639761 () Bool)

(assert (=> b!670378 m!639761))

(assert (=> b!670378 m!639735))

(declare-fun m!639763 () Bool)

(assert (=> b!670378 m!639763))

(assert (=> b!670378 m!639743))

(assert (=> b!670367 m!639715))

(declare-fun m!639765 () Bool)

(assert (=> start!60096 m!639765))

(declare-fun m!639767 () Bool)

(assert (=> b!670381 m!639767))

(declare-fun m!639769 () Bool)

(assert (=> b!670369 m!639769))

(declare-fun m!639771 () Bool)

(assert (=> b!670384 m!639771))

(declare-fun m!639773 () Bool)

(assert (=> b!670383 m!639773))

(declare-fun m!639775 () Bool)

(assert (=> b!670370 m!639775))

(push 1)

(assert (not b!670370))

(assert (not b!670369))

(assert (not b!670378))

(assert (not b!670375))

(assert (not start!60096))

(assert (not b!670388))

(assert (not b!670371))

(assert (not b!670376))

(assert (not b!670373))

(assert (not b!670381))

(assert (not b!670367))

(assert (not b!670387))

(assert (not b!670391))

(assert (not b!670383))

(assert (not b!670384))

(assert (not b!670368))

(assert (not b!670385))

(assert (not b!670374))

(assert (not b!670390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

