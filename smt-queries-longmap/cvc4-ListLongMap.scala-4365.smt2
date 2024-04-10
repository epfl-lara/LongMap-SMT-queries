; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60222 () Bool)

(assert start!60222)

(declare-fun b!674298 () Bool)

(declare-datatypes ((Unit!23720 0))(
  ( (Unit!23721) )
))
(declare-fun e!384923 () Unit!23720)

(declare-fun Unit!23722 () Unit!23720)

(assert (=> b!674298 (= e!384923 Unit!23722)))

(declare-datatypes ((array!39269 0))(
  ( (array!39270 (arr!18827 (Array (_ BitVec 32) (_ BitVec 64))) (size!19191 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39269)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674298 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312595 () Unit!23720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39269 (_ BitVec 64) (_ BitVec 32)) Unit!23720)

(assert (=> b!674298 (= lt!312595 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674298 false))

(declare-fun b!674299 () Bool)

(declare-fun res!440800 () Bool)

(declare-fun e!384931 () Bool)

(assert (=> b!674299 (=> (not res!440800) (not e!384931))))

(declare-datatypes ((List!12868 0))(
  ( (Nil!12865) (Cons!12864 (h!13909 (_ BitVec 64)) (t!19096 List!12868)) )
))
(declare-fun acc!681 () List!12868)

(declare-fun arrayNoDuplicates!0 (array!39269 (_ BitVec 32) List!12868) Bool)

(assert (=> b!674299 (= res!440800 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674300 () Bool)

(declare-fun res!440784 () Bool)

(declare-fun e!384932 () Bool)

(assert (=> b!674300 (=> (not res!440784) (not e!384932))))

(declare-fun lt!312596 () List!12868)

(assert (=> b!674300 (= res!440784 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312596))))

(declare-fun b!674301 () Bool)

(declare-fun res!440801 () Bool)

(assert (=> b!674301 (=> (not res!440801) (not e!384931))))

(declare-fun noDuplicate!692 (List!12868) Bool)

(assert (=> b!674301 (= res!440801 (noDuplicate!692 acc!681))))

(declare-fun b!674302 () Bool)

(declare-fun e!384926 () Bool)

(assert (=> b!674302 (= e!384931 e!384926)))

(declare-fun res!440794 () Bool)

(assert (=> b!674302 (=> (not res!440794) (not e!384926))))

(assert (=> b!674302 (= res!440794 (not (= (select (arr!18827 a!3626) from!3004) k!2843)))))

(declare-fun lt!312598 () Unit!23720)

(assert (=> b!674302 (= lt!312598 e!384923)))

(declare-fun c!77126 () Bool)

(assert (=> b!674302 (= c!77126 (= (select (arr!18827 a!3626) from!3004) k!2843))))

(declare-fun b!674303 () Bool)

(declare-fun res!440796 () Bool)

(assert (=> b!674303 (=> (not res!440796) (not e!384932))))

(declare-fun contains!3445 (List!12868 (_ BitVec 64)) Bool)

(assert (=> b!674303 (= res!440796 (not (contains!3445 lt!312596 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674304 () Bool)

(declare-fun res!440780 () Bool)

(assert (=> b!674304 (=> (not res!440780) (not e!384931))))

(assert (=> b!674304 (= res!440780 (not (contains!3445 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674305 () Bool)

(declare-fun res!440789 () Bool)

(assert (=> b!674305 (=> (not res!440789) (not e!384931))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674305 (= res!440789 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19191 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674306 () Bool)

(declare-fun res!440782 () Bool)

(assert (=> b!674306 (=> (not res!440782) (not e!384932))))

(declare-fun e!384930 () Bool)

(assert (=> b!674306 (= res!440782 e!384930)))

(declare-fun res!440799 () Bool)

(assert (=> b!674306 (=> res!440799 e!384930)))

(declare-fun e!384928 () Bool)

(assert (=> b!674306 (= res!440799 e!384928)))

(declare-fun res!440793 () Bool)

(assert (=> b!674306 (=> (not res!440793) (not e!384928))))

(assert (=> b!674306 (= res!440793 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!440783 () Bool)

(assert (=> start!60222 (=> (not res!440783) (not e!384931))))

(assert (=> start!60222 (= res!440783 (and (bvslt (size!19191 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19191 a!3626))))))

(assert (=> start!60222 e!384931))

(assert (=> start!60222 true))

(declare-fun array_inv!14623 (array!39269) Bool)

(assert (=> start!60222 (array_inv!14623 a!3626)))

(declare-fun b!674307 () Bool)

(declare-fun res!440786 () Bool)

(assert (=> b!674307 (=> (not res!440786) (not e!384932))))

(assert (=> b!674307 (= res!440786 (not (contains!3445 lt!312596 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674308 () Bool)

(declare-fun res!440790 () Bool)

(assert (=> b!674308 (=> (not res!440790) (not e!384931))))

(assert (=> b!674308 (= res!440790 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674309 () Bool)

(declare-fun e!384925 () Bool)

(assert (=> b!674309 (= e!384925 (not (contains!3445 acc!681 k!2843)))))

(declare-fun b!674310 () Bool)

(assert (=> b!674310 (= e!384926 e!384932)))

(declare-fun res!440798 () Bool)

(assert (=> b!674310 (=> (not res!440798) (not e!384932))))

(assert (=> b!674310 (= res!440798 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!295 (List!12868 (_ BitVec 64)) List!12868)

(assert (=> b!674310 (= lt!312596 ($colon$colon!295 acc!681 (select (arr!18827 a!3626) from!3004)))))

(declare-fun b!674311 () Bool)

(declare-fun e!384924 () Bool)

(assert (=> b!674311 (= e!384924 (not (contains!3445 lt!312596 k!2843)))))

(declare-fun b!674312 () Bool)

(declare-fun res!440795 () Bool)

(assert (=> b!674312 (=> (not res!440795) (not e!384931))))

(assert (=> b!674312 (= res!440795 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19191 a!3626))))))

(declare-fun b!674313 () Bool)

(declare-fun res!440791 () Bool)

(assert (=> b!674313 (=> (not res!440791) (not e!384931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674313 (= res!440791 (validKeyInArray!0 (select (arr!18827 a!3626) from!3004)))))

(declare-fun b!674314 () Bool)

(declare-fun res!440781 () Bool)

(assert (=> b!674314 (=> (not res!440781) (not e!384931))))

(assert (=> b!674314 (= res!440781 (validKeyInArray!0 k!2843))))

(declare-fun b!674315 () Bool)

(declare-fun e!384927 () Bool)

(assert (=> b!674315 (= e!384927 e!384925)))

(declare-fun res!440787 () Bool)

(assert (=> b!674315 (=> (not res!440787) (not e!384925))))

(assert (=> b!674315 (= res!440787 (bvsle from!3004 i!1382))))

(declare-fun b!674316 () Bool)

(assert (=> b!674316 (= e!384932 (not (bvsle from!3004 (size!19191 a!3626))))))

(assert (=> b!674316 (arrayNoDuplicates!0 (array!39270 (store (arr!18827 a!3626) i!1382 k!2843) (size!19191 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312596)))

(declare-fun lt!312597 () Unit!23720)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12868) Unit!23720)

(assert (=> b!674316 (= lt!312597 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312596))))

(declare-fun b!674317 () Bool)

(declare-fun res!440797 () Bool)

(assert (=> b!674317 (=> (not res!440797) (not e!384931))))

(assert (=> b!674317 (= res!440797 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12865))))

(declare-fun b!674318 () Bool)

(declare-fun Unit!23723 () Unit!23720)

(assert (=> b!674318 (= e!384923 Unit!23723)))

(declare-fun b!674319 () Bool)

(declare-fun res!440792 () Bool)

(assert (=> b!674319 (=> (not res!440792) (not e!384932))))

(assert (=> b!674319 (= res!440792 (noDuplicate!692 lt!312596))))

(declare-fun b!674320 () Bool)

(assert (=> b!674320 (= e!384930 e!384924)))

(declare-fun res!440788 () Bool)

(assert (=> b!674320 (=> (not res!440788) (not e!384924))))

(assert (=> b!674320 (= res!440788 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674321 () Bool)

(declare-fun e!384929 () Bool)

(assert (=> b!674321 (= e!384929 (contains!3445 acc!681 k!2843))))

(declare-fun b!674322 () Bool)

(assert (=> b!674322 (= e!384928 (contains!3445 lt!312596 k!2843))))

(declare-fun b!674323 () Bool)

(declare-fun res!440803 () Bool)

(assert (=> b!674323 (=> (not res!440803) (not e!384931))))

(assert (=> b!674323 (= res!440803 (not (contains!3445 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674324 () Bool)

(declare-fun res!440804 () Bool)

(assert (=> b!674324 (=> (not res!440804) (not e!384931))))

(assert (=> b!674324 (= res!440804 e!384927)))

(declare-fun res!440802 () Bool)

(assert (=> b!674324 (=> res!440802 e!384927)))

(assert (=> b!674324 (= res!440802 e!384929)))

(declare-fun res!440785 () Bool)

(assert (=> b!674324 (=> (not res!440785) (not e!384929))))

(assert (=> b!674324 (= res!440785 (bvsgt from!3004 i!1382))))

(assert (= (and start!60222 res!440783) b!674301))

(assert (= (and b!674301 res!440801) b!674304))

(assert (= (and b!674304 res!440780) b!674323))

(assert (= (and b!674323 res!440803) b!674324))

(assert (= (and b!674324 res!440785) b!674321))

(assert (= (and b!674324 (not res!440802)) b!674315))

(assert (= (and b!674315 res!440787) b!674309))

(assert (= (and b!674324 res!440804) b!674317))

(assert (= (and b!674317 res!440797) b!674299))

(assert (= (and b!674299 res!440800) b!674312))

(assert (= (and b!674312 res!440795) b!674314))

(assert (= (and b!674314 res!440781) b!674308))

(assert (= (and b!674308 res!440790) b!674305))

(assert (= (and b!674305 res!440789) b!674313))

(assert (= (and b!674313 res!440791) b!674302))

(assert (= (and b!674302 c!77126) b!674298))

(assert (= (and b!674302 (not c!77126)) b!674318))

(assert (= (and b!674302 res!440794) b!674310))

(assert (= (and b!674310 res!440798) b!674319))

(assert (= (and b!674319 res!440792) b!674303))

(assert (= (and b!674303 res!440796) b!674307))

(assert (= (and b!674307 res!440786) b!674306))

(assert (= (and b!674306 res!440793) b!674322))

(assert (= (and b!674306 (not res!440799)) b!674320))

(assert (= (and b!674320 res!440788) b!674311))

(assert (= (and b!674306 res!440782) b!674300))

(assert (= (and b!674300 res!440784) b!674316))

(declare-fun m!642315 () Bool)

(assert (=> b!674301 m!642315))

(declare-fun m!642317 () Bool)

(assert (=> b!674314 m!642317))

(declare-fun m!642319 () Bool)

(assert (=> b!674299 m!642319))

(declare-fun m!642321 () Bool)

(assert (=> b!674307 m!642321))

(declare-fun m!642323 () Bool)

(assert (=> b!674310 m!642323))

(assert (=> b!674310 m!642323))

(declare-fun m!642325 () Bool)

(assert (=> b!674310 m!642325))

(assert (=> b!674302 m!642323))

(declare-fun m!642327 () Bool)

(assert (=> start!60222 m!642327))

(declare-fun m!642329 () Bool)

(assert (=> b!674308 m!642329))

(declare-fun m!642331 () Bool)

(assert (=> b!674311 m!642331))

(declare-fun m!642333 () Bool)

(assert (=> b!674316 m!642333))

(declare-fun m!642335 () Bool)

(assert (=> b!674316 m!642335))

(declare-fun m!642337 () Bool)

(assert (=> b!674316 m!642337))

(declare-fun m!642339 () Bool)

(assert (=> b!674321 m!642339))

(assert (=> b!674309 m!642339))

(declare-fun m!642341 () Bool)

(assert (=> b!674298 m!642341))

(declare-fun m!642343 () Bool)

(assert (=> b!674298 m!642343))

(assert (=> b!674322 m!642331))

(declare-fun m!642345 () Bool)

(assert (=> b!674303 m!642345))

(declare-fun m!642347 () Bool)

(assert (=> b!674304 m!642347))

(assert (=> b!674313 m!642323))

(assert (=> b!674313 m!642323))

(declare-fun m!642349 () Bool)

(assert (=> b!674313 m!642349))

(declare-fun m!642351 () Bool)

(assert (=> b!674300 m!642351))

(declare-fun m!642353 () Bool)

(assert (=> b!674319 m!642353))

(declare-fun m!642355 () Bool)

(assert (=> b!674317 m!642355))

(declare-fun m!642357 () Bool)

(assert (=> b!674323 m!642357))

(push 1)

(assert (not b!674298))

(assert (not b!674304))

(assert (not start!60222))

(assert (not b!674316))

(assert (not b!674323))

(assert (not b!674313))

(assert (not b!674311))

(assert (not b!674307))

(assert (not b!674301))

(assert (not b!674299))

(assert (not b!674310))

(assert (not b!674322))

(assert (not b!674300))

(assert (not b!674321))

(assert (not b!674309))

(assert (not b!674303))

(assert (not b!674319))

(assert (not b!674308))

(assert (not b!674314))

(assert (not b!674317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

