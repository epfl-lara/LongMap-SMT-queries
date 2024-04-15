; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59978 () Bool)

(assert start!59978)

(declare-fun b!665907 () Bool)

(declare-fun res!433488 () Bool)

(declare-fun e!381418 () Bool)

(assert (=> b!665907 (=> res!433488 e!381418)))

(declare-datatypes ((List!12790 0))(
  ( (Nil!12787) (Cons!12786 (h!13831 (_ BitVec 64)) (t!19009 List!12790)) )
))
(declare-fun acc!681 () List!12790)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3312 (List!12790 (_ BitVec 64)) Bool)

(assert (=> b!665907 (= res!433488 (contains!3312 acc!681 k0!2843))))

(declare-fun b!665908 () Bool)

(declare-fun res!433476 () Bool)

(declare-fun e!381414 () Bool)

(assert (=> b!665908 (=> (not res!433476) (not e!381414))))

(declare-datatypes ((array!39036 0))(
  ( (array!39037 (arr!18710 (Array (_ BitVec 32) (_ BitVec 64))) (size!19075 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39036)

(declare-fun arrayContainsKey!0 (array!39036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665908 (= res!433476 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665909 () Bool)

(declare-fun e!381415 () Bool)

(assert (=> b!665909 (= e!381415 (not (contains!3312 acc!681 k0!2843)))))

(declare-fun b!665910 () Bool)

(declare-datatypes ((Unit!23258 0))(
  ( (Unit!23259) )
))
(declare-fun e!381413 () Unit!23258)

(declare-fun Unit!23260 () Unit!23258)

(assert (=> b!665910 (= e!381413 Unit!23260)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!310073 () Unit!23258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39036 (_ BitVec 64) (_ BitVec 32)) Unit!23258)

(assert (=> b!665910 (= lt!310073 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665910 false))

(declare-fun b!665911 () Bool)

(declare-fun res!433482 () Bool)

(assert (=> b!665911 (=> (not res!433482) (not e!381414))))

(assert (=> b!665911 (= res!433482 (not (contains!3312 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665912 () Bool)

(declare-fun res!433485 () Bool)

(assert (=> b!665912 (=> (not res!433485) (not e!381414))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665912 (= res!433485 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19075 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665913 () Bool)

(declare-fun res!433481 () Bool)

(assert (=> b!665913 (=> (not res!433481) (not e!381414))))

(declare-fun noDuplicate!581 (List!12790) Bool)

(assert (=> b!665913 (= res!433481 (noDuplicate!581 acc!681))))

(declare-fun b!665914 () Bool)

(declare-fun res!433489 () Bool)

(assert (=> b!665914 (=> (not res!433489) (not e!381414))))

(assert (=> b!665914 (= res!433489 (not (contains!3312 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665915 () Bool)

(declare-fun e!381416 () Unit!23258)

(declare-fun Unit!23261 () Unit!23258)

(assert (=> b!665915 (= e!381416 Unit!23261)))

(declare-fun b!665916 () Bool)

(declare-fun lt!310076 () Unit!23258)

(assert (=> b!665916 (= e!381416 lt!310076)))

(declare-fun lt!310069 () Unit!23258)

(declare-fun lemmaListSubSeqRefl!0 (List!12790) Unit!23258)

(assert (=> b!665916 (= lt!310069 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!68 (List!12790 List!12790) Bool)

(assert (=> b!665916 (subseq!68 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39036 List!12790 List!12790 (_ BitVec 32)) Unit!23258)

(declare-fun $colon$colon!199 (List!12790 (_ BitVec 64)) List!12790)

(assert (=> b!665916 (= lt!310076 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!199 acc!681 (select (arr!18710 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39036 (_ BitVec 32) List!12790) Bool)

(assert (=> b!665916 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665917 () Bool)

(declare-fun e!381412 () Bool)

(assert (=> b!665917 (= e!381412 (contains!3312 acc!681 k0!2843))))

(declare-fun b!665918 () Bool)

(declare-fun res!433483 () Bool)

(assert (=> b!665918 (=> (not res!433483) (not e!381414))))

(assert (=> b!665918 (= res!433483 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19075 a!3626))))))

(declare-fun b!665919 () Bool)

(declare-fun Unit!23262 () Unit!23258)

(assert (=> b!665919 (= e!381413 Unit!23262)))

(declare-fun b!665920 () Bool)

(assert (=> b!665920 (= e!381414 (not e!381418))))

(declare-fun res!433492 () Bool)

(assert (=> b!665920 (=> res!433492 e!381418)))

(assert (=> b!665920 (= res!433492 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310071 () List!12790)

(declare-fun -!66 (List!12790 (_ BitVec 64)) List!12790)

(assert (=> b!665920 (= (-!66 lt!310071 k0!2843) acc!681)))

(assert (=> b!665920 (= lt!310071 ($colon$colon!199 acc!681 k0!2843))))

(declare-fun lt!310075 () Unit!23258)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12790) Unit!23258)

(assert (=> b!665920 (= lt!310075 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665920 (subseq!68 acc!681 acc!681)))

(declare-fun lt!310070 () Unit!23258)

(assert (=> b!665920 (= lt!310070 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665920 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310074 () Unit!23258)

(assert (=> b!665920 (= lt!310074 e!381416)))

(declare-fun c!76583 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665920 (= c!76583 (validKeyInArray!0 (select (arr!18710 a!3626) from!3004)))))

(declare-fun lt!310068 () Unit!23258)

(assert (=> b!665920 (= lt!310068 e!381413)))

(declare-fun c!76584 () Bool)

(declare-fun lt!310072 () Bool)

(assert (=> b!665920 (= c!76584 lt!310072)))

(assert (=> b!665920 (= lt!310072 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665920 (arrayContainsKey!0 (array!39037 (store (arr!18710 a!3626) i!1382 k0!2843) (size!19075 a!3626)) k0!2843 from!3004)))

(declare-fun b!665921 () Bool)

(declare-fun res!433486 () Bool)

(assert (=> b!665921 (=> res!433486 e!381418)))

(assert (=> b!665921 (= res!433486 lt!310072)))

(declare-fun b!665922 () Bool)

(declare-fun res!433475 () Bool)

(assert (=> b!665922 (=> res!433475 e!381418)))

(assert (=> b!665922 (= res!433475 (not (noDuplicate!581 lt!310071)))))

(declare-fun b!665923 () Bool)

(declare-fun res!433480 () Bool)

(assert (=> b!665923 (=> (not res!433480) (not e!381414))))

(assert (=> b!665923 (= res!433480 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12787))))

(declare-fun b!665924 () Bool)

(declare-fun res!433494 () Bool)

(assert (=> b!665924 (=> res!433494 e!381418)))

(assert (=> b!665924 (= res!433494 (not (contains!3312 lt!310071 k0!2843)))))

(declare-fun b!665925 () Bool)

(declare-fun res!433477 () Bool)

(assert (=> b!665925 (=> (not res!433477) (not e!381414))))

(assert (=> b!665925 (= res!433477 (validKeyInArray!0 k0!2843))))

(declare-fun b!665926 () Bool)

(declare-fun res!433479 () Bool)

(assert (=> b!665926 (=> (not res!433479) (not e!381414))))

(assert (=> b!665926 (= res!433479 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665927 () Bool)

(declare-fun res!433487 () Bool)

(assert (=> b!665927 (=> res!433487 e!381418)))

(assert (=> b!665927 (= res!433487 (contains!3312 lt!310071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665928 () Bool)

(declare-fun e!381419 () Bool)

(assert (=> b!665928 (= e!381419 e!381415)))

(declare-fun res!433491 () Bool)

(assert (=> b!665928 (=> (not res!433491) (not e!381415))))

(assert (=> b!665928 (= res!433491 (bvsle from!3004 i!1382))))

(declare-fun b!665929 () Bool)

(assert (=> b!665929 (= e!381418 true)))

(declare-fun lt!310077 () Bool)

(assert (=> b!665929 (= lt!310077 (contains!3312 lt!310071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!433490 () Bool)

(assert (=> start!59978 (=> (not res!433490) (not e!381414))))

(assert (=> start!59978 (= res!433490 (and (bvslt (size!19075 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19075 a!3626))))))

(assert (=> start!59978 e!381414))

(assert (=> start!59978 true))

(declare-fun array_inv!14593 (array!39036) Bool)

(assert (=> start!59978 (array_inv!14593 a!3626)))

(declare-fun b!665930 () Bool)

(declare-fun res!433478 () Bool)

(assert (=> b!665930 (=> res!433478 e!381418)))

(assert (=> b!665930 (= res!433478 (not (subseq!68 acc!681 lt!310071)))))

(declare-fun b!665931 () Bool)

(declare-fun res!433495 () Bool)

(assert (=> b!665931 (=> (not res!433495) (not e!381414))))

(assert (=> b!665931 (= res!433495 e!381419)))

(declare-fun res!433484 () Bool)

(assert (=> b!665931 (=> res!433484 e!381419)))

(assert (=> b!665931 (= res!433484 e!381412)))

(declare-fun res!433493 () Bool)

(assert (=> b!665931 (=> (not res!433493) (not e!381412))))

(assert (=> b!665931 (= res!433493 (bvsgt from!3004 i!1382))))

(assert (= (and start!59978 res!433490) b!665913))

(assert (= (and b!665913 res!433481) b!665911))

(assert (= (and b!665911 res!433482) b!665914))

(assert (= (and b!665914 res!433489) b!665931))

(assert (= (and b!665931 res!433493) b!665917))

(assert (= (and b!665931 (not res!433484)) b!665928))

(assert (= (and b!665928 res!433491) b!665909))

(assert (= (and b!665931 res!433495) b!665923))

(assert (= (and b!665923 res!433480) b!665926))

(assert (= (and b!665926 res!433479) b!665918))

(assert (= (and b!665918 res!433483) b!665925))

(assert (= (and b!665925 res!433477) b!665908))

(assert (= (and b!665908 res!433476) b!665912))

(assert (= (and b!665912 res!433485) b!665920))

(assert (= (and b!665920 c!76584) b!665910))

(assert (= (and b!665920 (not c!76584)) b!665919))

(assert (= (and b!665920 c!76583) b!665916))

(assert (= (and b!665920 (not c!76583)) b!665915))

(assert (= (and b!665920 (not res!433492)) b!665922))

(assert (= (and b!665922 (not res!433475)) b!665921))

(assert (= (and b!665921 (not res!433486)) b!665907))

(assert (= (and b!665907 (not res!433488)) b!665930))

(assert (= (and b!665930 (not res!433478)) b!665924))

(assert (= (and b!665924 (not res!433494)) b!665927))

(assert (= (and b!665927 (not res!433487)) b!665929))

(declare-fun m!636279 () Bool)

(assert (=> b!665930 m!636279))

(declare-fun m!636281 () Bool)

(assert (=> b!665909 m!636281))

(declare-fun m!636283 () Bool)

(assert (=> start!59978 m!636283))

(declare-fun m!636285 () Bool)

(assert (=> b!665911 m!636285))

(assert (=> b!665917 m!636281))

(declare-fun m!636287 () Bool)

(assert (=> b!665920 m!636287))

(declare-fun m!636289 () Bool)

(assert (=> b!665920 m!636289))

(declare-fun m!636291 () Bool)

(assert (=> b!665920 m!636291))

(declare-fun m!636293 () Bool)

(assert (=> b!665920 m!636293))

(declare-fun m!636295 () Bool)

(assert (=> b!665920 m!636295))

(declare-fun m!636297 () Bool)

(assert (=> b!665920 m!636297))

(assert (=> b!665920 m!636289))

(declare-fun m!636299 () Bool)

(assert (=> b!665920 m!636299))

(declare-fun m!636301 () Bool)

(assert (=> b!665920 m!636301))

(declare-fun m!636303 () Bool)

(assert (=> b!665920 m!636303))

(declare-fun m!636305 () Bool)

(assert (=> b!665920 m!636305))

(declare-fun m!636307 () Bool)

(assert (=> b!665920 m!636307))

(assert (=> b!665907 m!636281))

(declare-fun m!636309 () Bool)

(assert (=> b!665910 m!636309))

(declare-fun m!636311 () Bool)

(assert (=> b!665925 m!636311))

(assert (=> b!665916 m!636287))

(assert (=> b!665916 m!636289))

(declare-fun m!636313 () Bool)

(assert (=> b!665916 m!636313))

(declare-fun m!636315 () Bool)

(assert (=> b!665916 m!636315))

(assert (=> b!665916 m!636289))

(assert (=> b!665916 m!636313))

(assert (=> b!665916 m!636295))

(assert (=> b!665916 m!636307))

(declare-fun m!636317 () Bool)

(assert (=> b!665929 m!636317))

(declare-fun m!636319 () Bool)

(assert (=> b!665908 m!636319))

(declare-fun m!636321 () Bool)

(assert (=> b!665913 m!636321))

(declare-fun m!636323 () Bool)

(assert (=> b!665927 m!636323))

(declare-fun m!636325 () Bool)

(assert (=> b!665922 m!636325))

(declare-fun m!636327 () Bool)

(assert (=> b!665924 m!636327))

(declare-fun m!636329 () Bool)

(assert (=> b!665926 m!636329))

(declare-fun m!636331 () Bool)

(assert (=> b!665923 m!636331))

(declare-fun m!636333 () Bool)

(assert (=> b!665914 m!636333))

(check-sat (not b!665916) (not b!665926) (not b!665917) (not b!665920) (not b!665925) (not b!665907) (not b!665914) (not b!665924) (not b!665911) (not b!665923) (not b!665927) (not b!665909) (not b!665922) (not start!59978) (not b!665913) (not b!665930) (not b!665929) (not b!665908) (not b!665910))
(check-sat)
