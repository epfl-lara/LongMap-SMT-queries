; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61582 () Bool)

(assert start!61582)

(declare-fun b!689248 () Bool)

(declare-fun e!392464 () Bool)

(declare-datatypes ((List!13074 0))(
  ( (Nil!13071) (Cons!13070 (h!14115 (_ BitVec 64)) (t!19338 List!13074)) )
))
(declare-fun acc!681 () List!13074)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3651 (List!13074 (_ BitVec 64)) Bool)

(assert (=> b!689248 (= e!392464 (not (contains!3651 acc!681 k0!2843)))))

(declare-fun b!689249 () Bool)

(declare-fun e!392471 () Bool)

(assert (=> b!689249 (= e!392471 e!392464)))

(declare-fun res!453842 () Bool)

(assert (=> b!689249 (=> (not res!453842) (not e!392464))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689249 (= res!453842 (bvsle from!3004 i!1382))))

(declare-fun b!689250 () Bool)

(declare-fun res!453839 () Bool)

(declare-fun e!392468 () Bool)

(assert (=> b!689250 (=> (not res!453839) (not e!392468))))

(declare-datatypes ((array!39723 0))(
  ( (array!39724 (arr!19033 (Array (_ BitVec 32) (_ BitVec 64))) (size!19415 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39723)

(declare-fun arrayNoDuplicates!0 (array!39723 (_ BitVec 32) List!13074) Bool)

(assert (=> b!689250 (= res!453839 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13071))))

(declare-fun res!453827 () Bool)

(assert (=> start!61582 (=> (not res!453827) (not e!392468))))

(assert (=> start!61582 (= res!453827 (and (bvslt (size!19415 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19415 a!3626))))))

(assert (=> start!61582 e!392468))

(assert (=> start!61582 true))

(declare-fun array_inv!14829 (array!39723) Bool)

(assert (=> start!61582 (array_inv!14829 a!3626)))

(declare-fun b!689251 () Bool)

(declare-fun res!453831 () Bool)

(assert (=> b!689251 (=> (not res!453831) (not e!392468))))

(assert (=> b!689251 (= res!453831 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19415 a!3626))))))

(declare-fun b!689252 () Bool)

(declare-fun res!453836 () Bool)

(declare-fun e!392472 () Bool)

(assert (=> b!689252 (=> res!453836 e!392472)))

(declare-fun e!392467 () Bool)

(assert (=> b!689252 (= res!453836 e!392467)))

(declare-fun res!453833 () Bool)

(assert (=> b!689252 (=> (not res!453833) (not e!392467))))

(declare-fun e!392465 () Bool)

(assert (=> b!689252 (= res!453833 e!392465)))

(declare-fun res!453834 () Bool)

(assert (=> b!689252 (=> res!453834 e!392465)))

(assert (=> b!689252 (= res!453834 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689253 () Bool)

(declare-fun res!453841 () Bool)

(assert (=> b!689253 (=> (not res!453841) (not e!392468))))

(assert (=> b!689253 (= res!453841 e!392471)))

(declare-fun res!453824 () Bool)

(assert (=> b!689253 (=> res!453824 e!392471)))

(declare-fun e!392463 () Bool)

(assert (=> b!689253 (= res!453824 e!392463)))

(declare-fun res!453843 () Bool)

(assert (=> b!689253 (=> (not res!453843) (not e!392463))))

(assert (=> b!689253 (= res!453843 (bvsgt from!3004 i!1382))))

(declare-fun b!689254 () Bool)

(declare-fun res!453830 () Bool)

(assert (=> b!689254 (=> (not res!453830) (not e!392468))))

(assert (=> b!689254 (= res!453830 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689255 () Bool)

(declare-fun res!453832 () Bool)

(assert (=> b!689255 (=> (not res!453832) (not e!392468))))

(assert (=> b!689255 (= res!453832 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19415 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689256 () Bool)

(declare-fun res!453835 () Bool)

(assert (=> b!689256 (=> (not res!453835) (not e!392468))))

(assert (=> b!689256 (= res!453835 (not (contains!3651 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689257 () Bool)

(declare-fun res!453840 () Bool)

(assert (=> b!689257 (=> (not res!453840) (not e!392468))))

(declare-fun noDuplicate!898 (List!13074) Bool)

(assert (=> b!689257 (= res!453840 (noDuplicate!898 acc!681))))

(declare-fun b!689258 () Bool)

(declare-fun res!453845 () Bool)

(assert (=> b!689258 (=> (not res!453845) (not e!392468))))

(declare-fun arrayContainsKey!0 (array!39723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689258 (= res!453845 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689259 () Bool)

(assert (=> b!689259 (= e!392463 (contains!3651 acc!681 k0!2843))))

(declare-fun b!689260 () Bool)

(declare-datatypes ((Unit!24332 0))(
  ( (Unit!24333) )
))
(declare-fun e!392466 () Unit!24332)

(declare-fun Unit!24334 () Unit!24332)

(assert (=> b!689260 (= e!392466 Unit!24334)))

(declare-fun b!689261 () Bool)

(declare-fun res!453825 () Bool)

(assert (=> b!689261 (=> (not res!453825) (not e!392468))))

(assert (=> b!689261 (= res!453825 (not (contains!3651 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689262 () Bool)

(declare-fun e!392462 () Bool)

(assert (=> b!689262 (= e!392467 e!392462)))

(declare-fun res!453828 () Bool)

(assert (=> b!689262 (=> res!453828 e!392462)))

(assert (=> b!689262 (= res!453828 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689263 () Bool)

(declare-fun res!453826 () Bool)

(assert (=> b!689263 (=> (not res!453826) (not e!392468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689263 (= res!453826 (validKeyInArray!0 k0!2843))))

(declare-fun b!689264 () Bool)

(declare-fun res!453838 () Bool)

(assert (=> b!689264 (=> res!453838 e!392472)))

(declare-fun lt!316086 () List!13074)

(assert (=> b!689264 (= res!453838 (contains!3651 lt!316086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689265 () Bool)

(assert (=> b!689265 (= e!392465 (not (contains!3651 lt!316086 k0!2843)))))

(declare-fun b!689266 () Bool)

(declare-fun e!392469 () Unit!24332)

(declare-fun Unit!24335 () Unit!24332)

(assert (=> b!689266 (= e!392469 Unit!24335)))

(declare-fun b!689267 () Bool)

(declare-fun Unit!24336 () Unit!24332)

(assert (=> b!689267 (= e!392469 Unit!24336)))

(declare-fun lt!316091 () Unit!24332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39723 (_ BitVec 64) (_ BitVec 32)) Unit!24332)

(assert (=> b!689267 (= lt!316091 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689267 false))

(declare-fun b!689268 () Bool)

(declare-fun res!453829 () Bool)

(assert (=> b!689268 (=> res!453829 e!392472)))

(assert (=> b!689268 (= res!453829 (not (noDuplicate!898 lt!316086)))))

(declare-fun b!689269 () Bool)

(assert (=> b!689269 (= e!392468 (not e!392472))))

(declare-fun res!453837 () Bool)

(assert (=> b!689269 (=> res!453837 e!392472)))

(assert (=> b!689269 (= res!453837 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689269 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316086)))

(declare-fun lt!316088 () Unit!24332)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39723 (_ BitVec 64) (_ BitVec 32) List!13074 List!13074) Unit!24332)

(assert (=> b!689269 (= lt!316088 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316086))))

(declare-fun -!202 (List!13074 (_ BitVec 64)) List!13074)

(assert (=> b!689269 (= (-!202 lt!316086 k0!2843) acc!681)))

(declare-fun $colon$colon!402 (List!13074 (_ BitVec 64)) List!13074)

(assert (=> b!689269 (= lt!316086 ($colon$colon!402 acc!681 k0!2843))))

(declare-fun lt!316092 () Unit!24332)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13074) Unit!24332)

(assert (=> b!689269 (= lt!316092 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!237 (List!13074 List!13074) Bool)

(assert (=> b!689269 (subseq!237 acc!681 acc!681)))

(declare-fun lt!316089 () Unit!24332)

(declare-fun lemmaListSubSeqRefl!0 (List!13074) Unit!24332)

(assert (=> b!689269 (= lt!316089 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689269 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316090 () Unit!24332)

(assert (=> b!689269 (= lt!316090 e!392466)))

(declare-fun c!78079 () Bool)

(assert (=> b!689269 (= c!78079 (validKeyInArray!0 (select (arr!19033 a!3626) from!3004)))))

(declare-fun lt!316093 () Unit!24332)

(assert (=> b!689269 (= lt!316093 e!392469)))

(declare-fun c!78080 () Bool)

(assert (=> b!689269 (= c!78080 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689269 (arrayContainsKey!0 (array!39724 (store (arr!19033 a!3626) i!1382 k0!2843) (size!19415 a!3626)) k0!2843 from!3004)))

(declare-fun b!689270 () Bool)

(assert (=> b!689270 (= e!392462 (contains!3651 lt!316086 k0!2843))))

(declare-fun b!689271 () Bool)

(declare-fun lt!316087 () Unit!24332)

(assert (=> b!689271 (= e!392466 lt!316087)))

(declare-fun lt!316085 () Unit!24332)

(assert (=> b!689271 (= lt!316085 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689271 (subseq!237 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39723 List!13074 List!13074 (_ BitVec 32)) Unit!24332)

(assert (=> b!689271 (= lt!316087 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!402 acc!681 (select (arr!19033 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689271 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689272 () Bool)

(declare-fun res!453844 () Bool)

(assert (=> b!689272 (=> res!453844 e!392472)))

(assert (=> b!689272 (= res!453844 (contains!3651 lt!316086 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689273 () Bool)

(assert (=> b!689273 (= e!392472 (bvslt (bvsub (size!19415 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19415 a!3626) from!3004)))))

(assert (= (and start!61582 res!453827) b!689257))

(assert (= (and b!689257 res!453840) b!689256))

(assert (= (and b!689256 res!453835) b!689261))

(assert (= (and b!689261 res!453825) b!689253))

(assert (= (and b!689253 res!453843) b!689259))

(assert (= (and b!689253 (not res!453824)) b!689249))

(assert (= (and b!689249 res!453842) b!689248))

(assert (= (and b!689253 res!453841) b!689250))

(assert (= (and b!689250 res!453839) b!689254))

(assert (= (and b!689254 res!453830) b!689251))

(assert (= (and b!689251 res!453831) b!689263))

(assert (= (and b!689263 res!453826) b!689258))

(assert (= (and b!689258 res!453845) b!689255))

(assert (= (and b!689255 res!453832) b!689269))

(assert (= (and b!689269 c!78080) b!689267))

(assert (= (and b!689269 (not c!78080)) b!689266))

(assert (= (and b!689269 c!78079) b!689271))

(assert (= (and b!689269 (not c!78079)) b!689260))

(assert (= (and b!689269 (not res!453837)) b!689268))

(assert (= (and b!689268 (not res!453829)) b!689264))

(assert (= (and b!689264 (not res!453838)) b!689272))

(assert (= (and b!689272 (not res!453844)) b!689252))

(assert (= (and b!689252 (not res!453834)) b!689265))

(assert (= (and b!689252 res!453833) b!689262))

(assert (= (and b!689262 (not res!453828)) b!689270))

(assert (= (and b!689252 (not res!453836)) b!689273))

(declare-fun m!652953 () Bool)

(assert (=> b!689258 m!652953))

(declare-fun m!652955 () Bool)

(assert (=> b!689263 m!652955))

(declare-fun m!652957 () Bool)

(assert (=> b!689268 m!652957))

(declare-fun m!652959 () Bool)

(assert (=> b!689264 m!652959))

(declare-fun m!652961 () Bool)

(assert (=> b!689254 m!652961))

(declare-fun m!652963 () Bool)

(assert (=> start!61582 m!652963))

(declare-fun m!652965 () Bool)

(assert (=> b!689248 m!652965))

(declare-fun m!652967 () Bool)

(assert (=> b!689269 m!652967))

(declare-fun m!652969 () Bool)

(assert (=> b!689269 m!652969))

(declare-fun m!652971 () Bool)

(assert (=> b!689269 m!652971))

(declare-fun m!652973 () Bool)

(assert (=> b!689269 m!652973))

(declare-fun m!652975 () Bool)

(assert (=> b!689269 m!652975))

(declare-fun m!652977 () Bool)

(assert (=> b!689269 m!652977))

(declare-fun m!652979 () Bool)

(assert (=> b!689269 m!652979))

(declare-fun m!652981 () Bool)

(assert (=> b!689269 m!652981))

(assert (=> b!689269 m!652969))

(declare-fun m!652983 () Bool)

(assert (=> b!689269 m!652983))

(declare-fun m!652985 () Bool)

(assert (=> b!689269 m!652985))

(declare-fun m!652987 () Bool)

(assert (=> b!689269 m!652987))

(declare-fun m!652989 () Bool)

(assert (=> b!689269 m!652989))

(declare-fun m!652991 () Bool)

(assert (=> b!689269 m!652991))

(assert (=> b!689271 m!652967))

(assert (=> b!689271 m!652969))

(declare-fun m!652993 () Bool)

(assert (=> b!689271 m!652993))

(declare-fun m!652995 () Bool)

(assert (=> b!689271 m!652995))

(assert (=> b!689271 m!652969))

(assert (=> b!689271 m!652993))

(assert (=> b!689271 m!652975))

(assert (=> b!689271 m!652991))

(declare-fun m!652997 () Bool)

(assert (=> b!689270 m!652997))

(declare-fun m!652999 () Bool)

(assert (=> b!689267 m!652999))

(declare-fun m!653001 () Bool)

(assert (=> b!689250 m!653001))

(declare-fun m!653003 () Bool)

(assert (=> b!689272 m!653003))

(declare-fun m!653005 () Bool)

(assert (=> b!689257 m!653005))

(declare-fun m!653007 () Bool)

(assert (=> b!689256 m!653007))

(declare-fun m!653009 () Bool)

(assert (=> b!689261 m!653009))

(assert (=> b!689259 m!652965))

(assert (=> b!689265 m!652997))

(check-sat (not b!689268) (not b!689271) (not b!689270) (not b!689259) (not b!689257) (not b!689248) (not b!689264) (not b!689272) (not b!689267) (not b!689263) (not b!689261) (not b!689250) (not start!61582) (not b!689254) (not b!689269) (not b!689265) (not b!689258) (not b!689256))
(check-sat)
