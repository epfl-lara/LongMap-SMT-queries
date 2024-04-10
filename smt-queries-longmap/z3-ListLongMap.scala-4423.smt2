; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61264 () Bool)

(assert start!61264)

(declare-fun b!686217 () Bool)

(declare-fun res!451410 () Bool)

(declare-fun e!390823 () Bool)

(assert (=> b!686217 (=> (not res!451410) (not e!390823))))

(declare-datatypes ((List!13041 0))(
  ( (Nil!13038) (Cons!13037 (h!14082 (_ BitVec 64)) (t!19296 List!13041)) )
))
(declare-fun acc!681 () List!13041)

(declare-fun contains!3618 (List!13041 (_ BitVec 64)) Bool)

(assert (=> b!686217 (= res!451410 (not (contains!3618 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686218 () Bool)

(declare-fun res!451406 () Bool)

(assert (=> b!686218 (=> (not res!451406) (not e!390823))))

(declare-datatypes ((array!39648 0))(
  ( (array!39649 (arr!19000 (Array (_ BitVec 32) (_ BitVec 64))) (size!19374 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39648)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39648 (_ BitVec 32) List!13041) Bool)

(assert (=> b!686218 (= res!451406 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686219 () Bool)

(declare-fun e!390822 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!686219 (= e!390822 (not (contains!3618 acc!681 k0!2843)))))

(declare-fun b!686220 () Bool)

(declare-fun res!451411 () Bool)

(assert (=> b!686220 (=> (not res!451411) (not e!390823))))

(assert (=> b!686220 (= res!451411 (not (contains!3618 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686221 () Bool)

(declare-datatypes ((Unit!24167 0))(
  ( (Unit!24168) )
))
(declare-fun e!390821 () Unit!24167)

(declare-fun Unit!24169 () Unit!24167)

(assert (=> b!686221 (= e!390821 Unit!24169)))

(declare-fun b!686223 () Bool)

(declare-fun e!390825 () Bool)

(assert (=> b!686223 (= e!390825 (contains!3618 acc!681 k0!2843))))

(declare-fun b!686224 () Bool)

(declare-fun e!390820 () Bool)

(assert (=> b!686224 (= e!390820 e!390822)))

(declare-fun res!451409 () Bool)

(assert (=> b!686224 (=> (not res!451409) (not e!390822))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686224 (= res!451409 (bvsle from!3004 i!1382))))

(declare-fun b!686225 () Bool)

(declare-fun res!451417 () Bool)

(assert (=> b!686225 (=> (not res!451417) (not e!390823))))

(assert (=> b!686225 (= res!451417 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19374 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686226 () Bool)

(assert (=> b!686226 (= e!390823 (not true))))

(declare-fun lt!314932 () List!13041)

(assert (=> b!686226 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314932)))

(declare-fun lt!314934 () Unit!24167)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39648 (_ BitVec 64) (_ BitVec 32) List!13041 List!13041) Unit!24167)

(assert (=> b!686226 (= lt!314934 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314932))))

(declare-fun -!169 (List!13041 (_ BitVec 64)) List!13041)

(assert (=> b!686226 (= (-!169 lt!314932 k0!2843) acc!681)))

(declare-fun $colon$colon!369 (List!13041 (_ BitVec 64)) List!13041)

(assert (=> b!686226 (= lt!314932 ($colon$colon!369 acc!681 k0!2843))))

(declare-fun lt!314929 () Unit!24167)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13041) Unit!24167)

(assert (=> b!686226 (= lt!314929 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!204 (List!13041 List!13041) Bool)

(assert (=> b!686226 (subseq!204 acc!681 acc!681)))

(declare-fun lt!314933 () Unit!24167)

(declare-fun lemmaListSubSeqRefl!0 (List!13041) Unit!24167)

(assert (=> b!686226 (= lt!314933 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686226 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314935 () Unit!24167)

(assert (=> b!686226 (= lt!314935 e!390821)))

(declare-fun c!77774 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686226 (= c!77774 (validKeyInArray!0 (select (arr!19000 a!3626) from!3004)))))

(declare-fun lt!314931 () Unit!24167)

(declare-fun e!390824 () Unit!24167)

(assert (=> b!686226 (= lt!314931 e!390824)))

(declare-fun c!77773 () Bool)

(declare-fun arrayContainsKey!0 (array!39648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686226 (= c!77773 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686226 (arrayContainsKey!0 (array!39649 (store (arr!19000 a!3626) i!1382 k0!2843) (size!19374 a!3626)) k0!2843 from!3004)))

(declare-fun b!686227 () Bool)

(declare-fun Unit!24170 () Unit!24167)

(assert (=> b!686227 (= e!390824 Unit!24170)))

(declare-fun b!686228 () Bool)

(declare-fun res!451408 () Bool)

(assert (=> b!686228 (=> (not res!451408) (not e!390823))))

(assert (=> b!686228 (= res!451408 (validKeyInArray!0 k0!2843))))

(declare-fun b!686229 () Bool)

(declare-fun res!451416 () Bool)

(assert (=> b!686229 (=> (not res!451416) (not e!390823))))

(assert (=> b!686229 (= res!451416 e!390820)))

(declare-fun res!451418 () Bool)

(assert (=> b!686229 (=> res!451418 e!390820)))

(assert (=> b!686229 (= res!451418 e!390825)))

(declare-fun res!451414 () Bool)

(assert (=> b!686229 (=> (not res!451414) (not e!390825))))

(assert (=> b!686229 (= res!451414 (bvsgt from!3004 i!1382))))

(declare-fun b!686230 () Bool)

(declare-fun res!451412 () Bool)

(assert (=> b!686230 (=> (not res!451412) (not e!390823))))

(assert (=> b!686230 (= res!451412 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19374 a!3626))))))

(declare-fun b!686231 () Bool)

(declare-fun res!451407 () Bool)

(assert (=> b!686231 (=> (not res!451407) (not e!390823))))

(declare-fun noDuplicate!865 (List!13041) Bool)

(assert (=> b!686231 (= res!451407 (noDuplicate!865 acc!681))))

(declare-fun b!686232 () Bool)

(declare-fun Unit!24171 () Unit!24167)

(assert (=> b!686232 (= e!390824 Unit!24171)))

(declare-fun lt!314930 () Unit!24167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39648 (_ BitVec 64) (_ BitVec 32)) Unit!24167)

(assert (=> b!686232 (= lt!314930 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686232 false))

(declare-fun b!686233 () Bool)

(declare-fun lt!314928 () Unit!24167)

(assert (=> b!686233 (= e!390821 lt!314928)))

(declare-fun lt!314927 () Unit!24167)

(assert (=> b!686233 (= lt!314927 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686233 (subseq!204 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39648 List!13041 List!13041 (_ BitVec 32)) Unit!24167)

(assert (=> b!686233 (= lt!314928 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!369 acc!681 (select (arr!19000 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686233 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686234 () Bool)

(declare-fun res!451415 () Bool)

(assert (=> b!686234 (=> (not res!451415) (not e!390823))))

(assert (=> b!686234 (= res!451415 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13038))))

(declare-fun b!686222 () Bool)

(declare-fun res!451413 () Bool)

(assert (=> b!686222 (=> (not res!451413) (not e!390823))))

(assert (=> b!686222 (= res!451413 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!451405 () Bool)

(assert (=> start!61264 (=> (not res!451405) (not e!390823))))

(assert (=> start!61264 (= res!451405 (and (bvslt (size!19374 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19374 a!3626))))))

(assert (=> start!61264 e!390823))

(assert (=> start!61264 true))

(declare-fun array_inv!14796 (array!39648) Bool)

(assert (=> start!61264 (array_inv!14796 a!3626)))

(assert (= (and start!61264 res!451405) b!686231))

(assert (= (and b!686231 res!451407) b!686217))

(assert (= (and b!686217 res!451410) b!686220))

(assert (= (and b!686220 res!451411) b!686229))

(assert (= (and b!686229 res!451414) b!686223))

(assert (= (and b!686229 (not res!451418)) b!686224))

(assert (= (and b!686224 res!451409) b!686219))

(assert (= (and b!686229 res!451416) b!686234))

(assert (= (and b!686234 res!451415) b!686218))

(assert (= (and b!686218 res!451406) b!686230))

(assert (= (and b!686230 res!451412) b!686228))

(assert (= (and b!686228 res!451408) b!686222))

(assert (= (and b!686222 res!451413) b!686225))

(assert (= (and b!686225 res!451417) b!686226))

(assert (= (and b!686226 c!77773) b!686232))

(assert (= (and b!686226 (not c!77773)) b!686227))

(assert (= (and b!686226 c!77774) b!686233))

(assert (= (and b!686226 (not c!77774)) b!686221))

(declare-fun m!650329 () Bool)

(assert (=> b!686226 m!650329))

(declare-fun m!650331 () Bool)

(assert (=> b!686226 m!650331))

(declare-fun m!650333 () Bool)

(assert (=> b!686226 m!650333))

(declare-fun m!650335 () Bool)

(assert (=> b!686226 m!650335))

(declare-fun m!650337 () Bool)

(assert (=> b!686226 m!650337))

(declare-fun m!650339 () Bool)

(assert (=> b!686226 m!650339))

(declare-fun m!650341 () Bool)

(assert (=> b!686226 m!650341))

(declare-fun m!650343 () Bool)

(assert (=> b!686226 m!650343))

(assert (=> b!686226 m!650333))

(declare-fun m!650345 () Bool)

(assert (=> b!686226 m!650345))

(declare-fun m!650347 () Bool)

(assert (=> b!686226 m!650347))

(declare-fun m!650349 () Bool)

(assert (=> b!686226 m!650349))

(declare-fun m!650351 () Bool)

(assert (=> b!686226 m!650351))

(declare-fun m!650353 () Bool)

(assert (=> b!686226 m!650353))

(declare-fun m!650355 () Bool)

(assert (=> b!686218 m!650355))

(declare-fun m!650357 () Bool)

(assert (=> b!686231 m!650357))

(declare-fun m!650359 () Bool)

(assert (=> b!686228 m!650359))

(declare-fun m!650361 () Bool)

(assert (=> start!61264 m!650361))

(declare-fun m!650363 () Bool)

(assert (=> b!686217 m!650363))

(declare-fun m!650365 () Bool)

(assert (=> b!686219 m!650365))

(declare-fun m!650367 () Bool)

(assert (=> b!686220 m!650367))

(declare-fun m!650369 () Bool)

(assert (=> b!686222 m!650369))

(declare-fun m!650371 () Bool)

(assert (=> b!686232 m!650371))

(declare-fun m!650373 () Bool)

(assert (=> b!686234 m!650373))

(assert (=> b!686233 m!650329))

(assert (=> b!686233 m!650333))

(declare-fun m!650375 () Bool)

(assert (=> b!686233 m!650375))

(declare-fun m!650377 () Bool)

(assert (=> b!686233 m!650377))

(assert (=> b!686233 m!650333))

(assert (=> b!686233 m!650375))

(assert (=> b!686233 m!650349))

(assert (=> b!686233 m!650353))

(assert (=> b!686223 m!650365))

(check-sat (not b!686233) (not b!686217) (not b!686219) (not b!686234) (not b!686218) (not b!686220) (not b!686223) (not b!686226) (not start!61264) (not b!686228) (not b!686222) (not b!686231) (not b!686232))
(check-sat)
