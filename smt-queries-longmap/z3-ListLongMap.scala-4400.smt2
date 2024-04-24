; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60558 () Bool)

(assert start!60558)

(declare-fun b!680259 () Bool)

(declare-fun res!446451 () Bool)

(declare-fun e!387511 () Bool)

(assert (=> b!680259 (=> (not res!446451) (not e!387511))))

(declare-datatypes ((List!12873 0))(
  ( (Nil!12870) (Cons!12869 (h!13917 (_ BitVec 64)) (t!19093 List!12873)) )
))
(declare-fun acc!681 () List!12873)

(declare-fun noDuplicate!799 (List!12873) Bool)

(assert (=> b!680259 (= res!446451 (noDuplicate!799 acc!681))))

(declare-fun res!446452 () Bool)

(assert (=> start!60558 (=> (not res!446452) (not e!387511))))

(declare-datatypes ((array!39477 0))(
  ( (array!39478 (arr!18925 (Array (_ BitVec 32) (_ BitVec 64))) (size!19289 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39477)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60558 (= res!446452 (and (bvslt (size!19289 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19289 a!3626))))))

(assert (=> start!60558 e!387511))

(assert (=> start!60558 true))

(declare-fun array_inv!14784 (array!39477) Bool)

(assert (=> start!60558 (array_inv!14784 a!3626)))

(declare-fun b!680260 () Bool)

(declare-fun e!387516 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3525 (List!12873 (_ BitVec 64)) Bool)

(assert (=> b!680260 (= e!387516 (contains!3525 acc!681 k0!2843))))

(declare-fun b!680261 () Bool)

(declare-datatypes ((Unit!23817 0))(
  ( (Unit!23818) )
))
(declare-fun e!387512 () Unit!23817)

(declare-fun Unit!23819 () Unit!23817)

(assert (=> b!680261 (= e!387512 Unit!23819)))

(declare-fun b!680262 () Bool)

(declare-fun res!446453 () Bool)

(assert (=> b!680262 (=> (not res!446453) (not e!387511))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680262 (= res!446453 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19289 a!3626))))))

(declare-fun b!680263 () Bool)

(declare-fun res!446454 () Bool)

(assert (=> b!680263 (=> (not res!446454) (not e!387511))))

(assert (=> b!680263 (= res!446454 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19289 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680264 () Bool)

(declare-fun e!387515 () Bool)

(declare-fun e!387513 () Bool)

(assert (=> b!680264 (= e!387515 e!387513)))

(declare-fun res!446455 () Bool)

(assert (=> b!680264 (=> (not res!446455) (not e!387513))))

(assert (=> b!680264 (= res!446455 (bvsle from!3004 i!1382))))

(declare-fun b!680265 () Bool)

(declare-fun res!446450 () Bool)

(assert (=> b!680265 (=> (not res!446450) (not e!387511))))

(declare-fun arrayNoDuplicates!0 (array!39477 (_ BitVec 32) List!12873) Bool)

(assert (=> b!680265 (= res!446450 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680266 () Bool)

(declare-fun res!446459 () Bool)

(assert (=> b!680266 (=> (not res!446459) (not e!387511))))

(assert (=> b!680266 (= res!446459 e!387515)))

(declare-fun res!446456 () Bool)

(assert (=> b!680266 (=> res!446456 e!387515)))

(assert (=> b!680266 (= res!446456 e!387516)))

(declare-fun res!446460 () Bool)

(assert (=> b!680266 (=> (not res!446460) (not e!387516))))

(assert (=> b!680266 (= res!446460 (bvsgt from!3004 i!1382))))

(declare-fun b!680267 () Bool)

(declare-fun e!387514 () Bool)

(assert (=> b!680267 (= e!387511 (not e!387514))))

(declare-fun res!446464 () Bool)

(assert (=> b!680267 (=> res!446464 e!387514)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680267 (= res!446464 (not (validKeyInArray!0 (select (arr!18925 a!3626) from!3004))))))

(declare-fun lt!313117 () Unit!23817)

(assert (=> b!680267 (= lt!313117 e!387512)))

(declare-fun c!77273 () Bool)

(declare-fun arrayContainsKey!0 (array!39477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680267 (= c!77273 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680267 (arrayContainsKey!0 (array!39478 (store (arr!18925 a!3626) i!1382 k0!2843) (size!19289 a!3626)) k0!2843 from!3004)))

(declare-fun b!680268 () Bool)

(declare-fun res!446462 () Bool)

(assert (=> b!680268 (=> (not res!446462) (not e!387511))))

(assert (=> b!680268 (= res!446462 (not (contains!3525 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680269 () Bool)

(declare-fun res!446461 () Bool)

(assert (=> b!680269 (=> (not res!446461) (not e!387511))))

(assert (=> b!680269 (= res!446461 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680270 () Bool)

(declare-fun Unit!23820 () Unit!23817)

(assert (=> b!680270 (= e!387512 Unit!23820)))

(declare-fun lt!313116 () Unit!23817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39477 (_ BitVec 64) (_ BitVec 32)) Unit!23817)

(assert (=> b!680270 (= lt!313116 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680270 false))

(declare-fun b!680271 () Bool)

(assert (=> b!680271 (= e!387514 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!134 (List!12873 List!12873) Bool)

(assert (=> b!680271 (subseq!134 acc!681 acc!681)))

(declare-fun lt!313115 () Unit!23817)

(declare-fun lemmaListSubSeqRefl!0 (List!12873) Unit!23817)

(assert (=> b!680271 (= lt!313115 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680272 () Bool)

(declare-fun res!446457 () Bool)

(assert (=> b!680272 (=> (not res!446457) (not e!387511))))

(assert (=> b!680272 (= res!446457 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12870))))

(declare-fun b!680273 () Bool)

(assert (=> b!680273 (= e!387513 (not (contains!3525 acc!681 k0!2843)))))

(declare-fun b!680274 () Bool)

(declare-fun res!446463 () Bool)

(assert (=> b!680274 (=> (not res!446463) (not e!387511))))

(assert (=> b!680274 (= res!446463 (validKeyInArray!0 k0!2843))))

(declare-fun b!680275 () Bool)

(declare-fun res!446458 () Bool)

(assert (=> b!680275 (=> (not res!446458) (not e!387511))))

(assert (=> b!680275 (= res!446458 (not (contains!3525 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60558 res!446452) b!680259))

(assert (= (and b!680259 res!446451) b!680275))

(assert (= (and b!680275 res!446458) b!680268))

(assert (= (and b!680268 res!446462) b!680266))

(assert (= (and b!680266 res!446460) b!680260))

(assert (= (and b!680266 (not res!446456)) b!680264))

(assert (= (and b!680264 res!446455) b!680273))

(assert (= (and b!680266 res!446459) b!680272))

(assert (= (and b!680272 res!446457) b!680265))

(assert (= (and b!680265 res!446450) b!680262))

(assert (= (and b!680262 res!446453) b!680274))

(assert (= (and b!680274 res!446463) b!680269))

(assert (= (and b!680269 res!446461) b!680263))

(assert (= (and b!680263 res!446454) b!680267))

(assert (= (and b!680267 c!77273) b!680270))

(assert (= (and b!680267 (not c!77273)) b!680261))

(assert (= (and b!680267 (not res!446464)) b!680271))

(declare-fun m!645919 () Bool)

(assert (=> b!680265 m!645919))

(declare-fun m!645921 () Bool)

(assert (=> b!680271 m!645921))

(declare-fun m!645923 () Bool)

(assert (=> b!680271 m!645923))

(declare-fun m!645925 () Bool)

(assert (=> b!680270 m!645925))

(declare-fun m!645927 () Bool)

(assert (=> b!680267 m!645927))

(declare-fun m!645929 () Bool)

(assert (=> b!680267 m!645929))

(declare-fun m!645931 () Bool)

(assert (=> b!680267 m!645931))

(assert (=> b!680267 m!645927))

(declare-fun m!645933 () Bool)

(assert (=> b!680267 m!645933))

(declare-fun m!645935 () Bool)

(assert (=> b!680267 m!645935))

(declare-fun m!645937 () Bool)

(assert (=> b!680274 m!645937))

(declare-fun m!645939 () Bool)

(assert (=> b!680268 m!645939))

(declare-fun m!645941 () Bool)

(assert (=> start!60558 m!645941))

(declare-fun m!645943 () Bool)

(assert (=> b!680275 m!645943))

(declare-fun m!645945 () Bool)

(assert (=> b!680273 m!645945))

(declare-fun m!645947 () Bool)

(assert (=> b!680269 m!645947))

(declare-fun m!645949 () Bool)

(assert (=> b!680272 m!645949))

(assert (=> b!680260 m!645945))

(declare-fun m!645951 () Bool)

(assert (=> b!680259 m!645951))

(check-sat (not b!680260) (not b!680268) (not b!680259) (not b!680269) (not b!680265) (not b!680272) (not b!680270) (not b!680271) (not start!60558) (not b!680274) (not b!680275) (not b!680267) (not b!680273))
(check-sat)
