; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60196 () Bool)

(assert start!60196)

(declare-fun b!673276 () Bool)

(declare-fun e!384499 () Bool)

(declare-datatypes ((List!12855 0))(
  ( (Nil!12852) (Cons!12851 (h!13896 (_ BitVec 64)) (t!19083 List!12855)) )
))
(declare-fun acc!681 () List!12855)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3432 (List!12855 (_ BitVec 64)) Bool)

(assert (=> b!673276 (= e!384499 (not (contains!3432 acc!681 k0!2843)))))

(declare-fun b!673277 () Bool)

(declare-fun res!439858 () Bool)

(declare-fun e!384500 () Bool)

(assert (=> b!673277 (=> (not res!439858) (not e!384500))))

(declare-fun e!384501 () Bool)

(assert (=> b!673277 (= res!439858 e!384501)))

(declare-fun res!439850 () Bool)

(assert (=> b!673277 (=> res!439850 e!384501)))

(declare-fun e!384497 () Bool)

(assert (=> b!673277 (= res!439850 e!384497)))

(declare-fun res!439855 () Bool)

(assert (=> b!673277 (=> (not res!439855) (not e!384497))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673277 (= res!439855 (bvsgt from!3004 i!1382))))

(declare-fun b!673278 () Bool)

(assert (=> b!673278 (= e!384497 (contains!3432 acc!681 k0!2843))))

(declare-fun b!673279 () Bool)

(declare-fun res!439846 () Bool)

(assert (=> b!673279 (=> (not res!439846) (not e!384500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673279 (= res!439846 (validKeyInArray!0 k0!2843))))

(declare-fun b!673280 () Bool)

(declare-fun e!384498 () Bool)

(assert (=> b!673280 (= e!384500 e!384498)))

(declare-fun res!439836 () Bool)

(assert (=> b!673280 (=> (not res!439836) (not e!384498))))

(declare-datatypes ((array!39243 0))(
  ( (array!39244 (arr!18814 (Array (_ BitVec 32) (_ BitVec 64))) (size!19178 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39243)

(assert (=> b!673280 (= res!439836 (not (= (select (arr!18814 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23668 0))(
  ( (Unit!23669) )
))
(declare-fun lt!312439 () Unit!23668)

(declare-fun e!384503 () Unit!23668)

(assert (=> b!673280 (= lt!312439 e!384503)))

(declare-fun c!77087 () Bool)

(assert (=> b!673280 (= c!77087 (= (select (arr!18814 a!3626) from!3004) k0!2843))))

(declare-fun b!673281 () Bool)

(declare-fun e!384502 () Bool)

(declare-fun lt!312441 () List!12855)

(assert (=> b!673281 (= e!384502 (contains!3432 lt!312441 k0!2843))))

(declare-fun b!673282 () Bool)

(declare-fun res!439856 () Bool)

(declare-fun e!384494 () Bool)

(assert (=> b!673282 (=> (not res!439856) (not e!384494))))

(declare-fun noDuplicate!679 (List!12855) Bool)

(assert (=> b!673282 (= res!439856 (noDuplicate!679 lt!312441))))

(declare-fun b!673283 () Bool)

(declare-fun res!439844 () Bool)

(assert (=> b!673283 (=> (not res!439844) (not e!384500))))

(assert (=> b!673283 (= res!439844 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19178 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673284 () Bool)

(declare-fun res!439857 () Bool)

(assert (=> b!673284 (=> (not res!439857) (not e!384500))))

(assert (=> b!673284 (= res!439857 (noDuplicate!679 acc!681))))

(declare-fun b!673285 () Bool)

(assert (=> b!673285 (= e!384498 e!384494)))

(declare-fun res!439853 () Bool)

(assert (=> b!673285 (=> (not res!439853) (not e!384494))))

(assert (=> b!673285 (= res!439853 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!282 (List!12855 (_ BitVec 64)) List!12855)

(assert (=> b!673285 (= lt!312441 ($colon$colon!282 acc!681 (select (arr!18814 a!3626) from!3004)))))

(declare-fun b!673286 () Bool)

(declare-fun res!439841 () Bool)

(assert (=> b!673286 (=> (not res!439841) (not e!384500))))

(declare-fun arrayNoDuplicates!0 (array!39243 (_ BitVec 32) List!12855) Bool)

(assert (=> b!673286 (= res!439841 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673287 () Bool)

(declare-fun Unit!23670 () Unit!23668)

(assert (=> b!673287 (= e!384503 Unit!23670)))

(declare-fun arrayContainsKey!0 (array!39243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673287 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312442 () Unit!23668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39243 (_ BitVec 64) (_ BitVec 32)) Unit!23668)

(assert (=> b!673287 (= lt!312442 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673287 false))

(declare-fun res!439843 () Bool)

(assert (=> start!60196 (=> (not res!439843) (not e!384500))))

(assert (=> start!60196 (= res!439843 (and (bvslt (size!19178 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19178 a!3626))))))

(assert (=> start!60196 e!384500))

(assert (=> start!60196 true))

(declare-fun array_inv!14610 (array!39243) Bool)

(assert (=> start!60196 (array_inv!14610 a!3626)))

(declare-fun b!673288 () Bool)

(declare-fun res!439852 () Bool)

(assert (=> b!673288 (=> (not res!439852) (not e!384500))))

(assert (=> b!673288 (= res!439852 (validKeyInArray!0 (select (arr!18814 a!3626) from!3004)))))

(declare-fun b!673289 () Bool)

(declare-fun res!439848 () Bool)

(assert (=> b!673289 (=> (not res!439848) (not e!384500))))

(assert (=> b!673289 (= res!439848 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673290 () Bool)

(declare-fun res!439837 () Bool)

(assert (=> b!673290 (=> (not res!439837) (not e!384500))))

(assert (=> b!673290 (= res!439837 (not (contains!3432 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673291 () Bool)

(declare-fun res!439842 () Bool)

(assert (=> b!673291 (=> (not res!439842) (not e!384494))))

(declare-fun e!384496 () Bool)

(assert (=> b!673291 (= res!439842 e!384496)))

(declare-fun res!439840 () Bool)

(assert (=> b!673291 (=> res!439840 e!384496)))

(assert (=> b!673291 (= res!439840 e!384502)))

(declare-fun res!439845 () Bool)

(assert (=> b!673291 (=> (not res!439845) (not e!384502))))

(assert (=> b!673291 (= res!439845 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673292 () Bool)

(declare-fun e!384504 () Bool)

(assert (=> b!673292 (= e!384496 e!384504)))

(declare-fun res!439854 () Bool)

(assert (=> b!673292 (=> (not res!439854) (not e!384504))))

(assert (=> b!673292 (= res!439854 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673293 () Bool)

(declare-fun res!439847 () Bool)

(assert (=> b!673293 (=> (not res!439847) (not e!384500))))

(assert (=> b!673293 (= res!439847 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12852))))

(declare-fun b!673294 () Bool)

(assert (=> b!673294 (= e!384504 (not (contains!3432 lt!312441 k0!2843)))))

(declare-fun b!673295 () Bool)

(declare-fun res!439849 () Bool)

(assert (=> b!673295 (=> (not res!439849) (not e!384494))))

(assert (=> b!673295 (= res!439849 (not (contains!3432 lt!312441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673296 () Bool)

(assert (=> b!673296 (= e!384494 false)))

(declare-fun lt!312440 () Bool)

(assert (=> b!673296 (= lt!312440 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312441))))

(declare-fun b!673297 () Bool)

(assert (=> b!673297 (= e!384501 e!384499)))

(declare-fun res!439859 () Bool)

(assert (=> b!673297 (=> (not res!439859) (not e!384499))))

(assert (=> b!673297 (= res!439859 (bvsle from!3004 i!1382))))

(declare-fun b!673298 () Bool)

(declare-fun res!439838 () Bool)

(assert (=> b!673298 (=> (not res!439838) (not e!384500))))

(assert (=> b!673298 (= res!439838 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19178 a!3626))))))

(declare-fun b!673299 () Bool)

(declare-fun res!439851 () Bool)

(assert (=> b!673299 (=> (not res!439851) (not e!384500))))

(assert (=> b!673299 (= res!439851 (not (contains!3432 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673300 () Bool)

(declare-fun res!439839 () Bool)

(assert (=> b!673300 (=> (not res!439839) (not e!384494))))

(assert (=> b!673300 (= res!439839 (not (contains!3432 lt!312441 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673301 () Bool)

(declare-fun Unit!23671 () Unit!23668)

(assert (=> b!673301 (= e!384503 Unit!23671)))

(assert (= (and start!60196 res!439843) b!673284))

(assert (= (and b!673284 res!439857) b!673299))

(assert (= (and b!673299 res!439851) b!673290))

(assert (= (and b!673290 res!439837) b!673277))

(assert (= (and b!673277 res!439855) b!673278))

(assert (= (and b!673277 (not res!439850)) b!673297))

(assert (= (and b!673297 res!439859) b!673276))

(assert (= (and b!673277 res!439858) b!673293))

(assert (= (and b!673293 res!439847) b!673286))

(assert (= (and b!673286 res!439841) b!673298))

(assert (= (and b!673298 res!439838) b!673279))

(assert (= (and b!673279 res!439846) b!673289))

(assert (= (and b!673289 res!439848) b!673283))

(assert (= (and b!673283 res!439844) b!673288))

(assert (= (and b!673288 res!439852) b!673280))

(assert (= (and b!673280 c!77087) b!673287))

(assert (= (and b!673280 (not c!77087)) b!673301))

(assert (= (and b!673280 res!439836) b!673285))

(assert (= (and b!673285 res!439853) b!673282))

(assert (= (and b!673282 res!439856) b!673295))

(assert (= (and b!673295 res!439849) b!673300))

(assert (= (and b!673300 res!439839) b!673291))

(assert (= (and b!673291 res!439845) b!673281))

(assert (= (and b!673291 (not res!439840)) b!673292))

(assert (= (and b!673292 res!439854) b!673294))

(assert (= (and b!673291 res!439842) b!673296))

(declare-fun m!641809 () Bool)

(assert (=> b!673285 m!641809))

(assert (=> b!673285 m!641809))

(declare-fun m!641811 () Bool)

(assert (=> b!673285 m!641811))

(declare-fun m!641813 () Bool)

(assert (=> b!673278 m!641813))

(assert (=> b!673288 m!641809))

(assert (=> b!673288 m!641809))

(declare-fun m!641815 () Bool)

(assert (=> b!673288 m!641815))

(declare-fun m!641817 () Bool)

(assert (=> b!673300 m!641817))

(declare-fun m!641819 () Bool)

(assert (=> b!673296 m!641819))

(declare-fun m!641821 () Bool)

(assert (=> b!673279 m!641821))

(assert (=> b!673276 m!641813))

(declare-fun m!641823 () Bool)

(assert (=> b!673295 m!641823))

(assert (=> b!673280 m!641809))

(declare-fun m!641825 () Bool)

(assert (=> b!673281 m!641825))

(assert (=> b!673294 m!641825))

(declare-fun m!641827 () Bool)

(assert (=> b!673290 m!641827))

(declare-fun m!641829 () Bool)

(assert (=> b!673284 m!641829))

(declare-fun m!641831 () Bool)

(assert (=> b!673299 m!641831))

(declare-fun m!641833 () Bool)

(assert (=> b!673287 m!641833))

(declare-fun m!641835 () Bool)

(assert (=> b!673287 m!641835))

(declare-fun m!641837 () Bool)

(assert (=> b!673289 m!641837))

(declare-fun m!641839 () Bool)

(assert (=> start!60196 m!641839))

(declare-fun m!641841 () Bool)

(assert (=> b!673282 m!641841))

(declare-fun m!641843 () Bool)

(assert (=> b!673293 m!641843))

(declare-fun m!641845 () Bool)

(assert (=> b!673286 m!641845))

(check-sat (not b!673295) (not b!673282) (not b!673288) (not b!673279) (not b!673289) (not b!673284) (not b!673300) (not start!60196) (not b!673278) (not b!673296) (not b!673293) (not b!673294) (not b!673285) (not b!673287) (not b!673299) (not b!673290) (not b!673281) (not b!673276) (not b!673286))
(check-sat)
