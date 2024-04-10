; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63506 () Bool)

(assert start!63506)

(declare-fun b!715298 () Bool)

(declare-fun res!478269 () Bool)

(declare-fun e!401849 () Bool)

(assert (=> b!715298 (=> (not res!478269) (not e!401849))))

(declare-datatypes ((List!13438 0))(
  ( (Nil!13435) (Cons!13434 (h!14479 (_ BitVec 64)) (t!19753 List!13438)) )
))
(declare-fun newAcc!49 () List!13438)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13438)

(declare-fun -!425 (List!13438 (_ BitVec 64)) List!13438)

(assert (=> b!715298 (= res!478269 (= (-!425 newAcc!49 k!2824) acc!652))))

(declare-fun b!715299 () Bool)

(assert (=> b!715299 (= e!401849 false)))

(declare-datatypes ((array!40520 0))(
  ( (array!40521 (arr!19397 (Array (_ BitVec 32) (_ BitVec 64))) (size!19813 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40520)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun lt!318833 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40520 (_ BitVec 32) List!13438) Bool)

(assert (=> b!715299 (= lt!318833 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715300 () Bool)

(declare-fun res!478285 () Bool)

(assert (=> b!715300 (=> (not res!478285) (not e!401849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715300 (= res!478285 (not (validKeyInArray!0 (select (arr!19397 a!3591) from!2969))))))

(declare-fun b!715301 () Bool)

(declare-fun res!478271 () Bool)

(assert (=> b!715301 (=> (not res!478271) (not e!401849))))

(assert (=> b!715301 (= res!478271 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19813 a!3591)))))

(declare-fun b!715302 () Bool)

(declare-fun res!478276 () Bool)

(assert (=> b!715302 (=> (not res!478276) (not e!401849))))

(declare-fun arrayContainsKey!0 (array!40520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715302 (= res!478276 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715303 () Bool)

(declare-fun res!478275 () Bool)

(assert (=> b!715303 (=> (not res!478275) (not e!401849))))

(declare-fun contains!4015 (List!13438 (_ BitVec 64)) Bool)

(assert (=> b!715303 (= res!478275 (not (contains!4015 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478281 () Bool)

(assert (=> start!63506 (=> (not res!478281) (not e!401849))))

(assert (=> start!63506 (= res!478281 (and (bvslt (size!19813 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19813 a!3591))))))

(assert (=> start!63506 e!401849))

(assert (=> start!63506 true))

(declare-fun array_inv!15193 (array!40520) Bool)

(assert (=> start!63506 (array_inv!15193 a!3591)))

(declare-fun b!715304 () Bool)

(declare-fun res!478282 () Bool)

(assert (=> b!715304 (=> (not res!478282) (not e!401849))))

(assert (=> b!715304 (= res!478282 (not (contains!4015 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715305 () Bool)

(declare-fun res!478277 () Bool)

(assert (=> b!715305 (=> (not res!478277) (not e!401849))))

(declare-fun noDuplicate!1262 (List!13438) Bool)

(assert (=> b!715305 (= res!478277 (noDuplicate!1262 acc!652))))

(declare-fun b!715306 () Bool)

(declare-fun res!478284 () Bool)

(assert (=> b!715306 (=> (not res!478284) (not e!401849))))

(assert (=> b!715306 (= res!478284 (not (contains!4015 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715307 () Bool)

(declare-fun res!478280 () Bool)

(assert (=> b!715307 (=> (not res!478280) (not e!401849))))

(assert (=> b!715307 (= res!478280 (not (contains!4015 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715308 () Bool)

(declare-fun res!478270 () Bool)

(assert (=> b!715308 (=> (not res!478270) (not e!401849))))

(assert (=> b!715308 (= res!478270 (contains!4015 newAcc!49 k!2824))))

(declare-fun b!715309 () Bool)

(declare-fun res!478274 () Bool)

(assert (=> b!715309 (=> (not res!478274) (not e!401849))))

(assert (=> b!715309 (= res!478274 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715310 () Bool)

(declare-fun res!478272 () Bool)

(assert (=> b!715310 (=> (not res!478272) (not e!401849))))

(assert (=> b!715310 (= res!478272 (not (contains!4015 acc!652 k!2824)))))

(declare-fun b!715311 () Bool)

(declare-fun res!478278 () Bool)

(assert (=> b!715311 (=> (not res!478278) (not e!401849))))

(declare-fun subseq!460 (List!13438 List!13438) Bool)

(assert (=> b!715311 (= res!478278 (subseq!460 acc!652 newAcc!49))))

(declare-fun b!715312 () Bool)

(declare-fun res!478273 () Bool)

(assert (=> b!715312 (=> (not res!478273) (not e!401849))))

(assert (=> b!715312 (= res!478273 (validKeyInArray!0 k!2824))))

(declare-fun b!715313 () Bool)

(declare-fun res!478268 () Bool)

(assert (=> b!715313 (=> (not res!478268) (not e!401849))))

(assert (=> b!715313 (= res!478268 (noDuplicate!1262 newAcc!49))))

(declare-fun b!715314 () Bool)

(declare-fun res!478283 () Bool)

(assert (=> b!715314 (=> (not res!478283) (not e!401849))))

(assert (=> b!715314 (= res!478283 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715315 () Bool)

(declare-fun res!478279 () Bool)

(assert (=> b!715315 (=> (not res!478279) (not e!401849))))

(assert (=> b!715315 (= res!478279 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!63506 res!478281) b!715305))

(assert (= (and b!715305 res!478277) b!715313))

(assert (= (and b!715313 res!478268) b!715304))

(assert (= (and b!715304 res!478282) b!715307))

(assert (= (and b!715307 res!478280) b!715302))

(assert (= (and b!715302 res!478276) b!715310))

(assert (= (and b!715310 res!478272) b!715312))

(assert (= (and b!715312 res!478273) b!715315))

(assert (= (and b!715315 res!478279) b!715311))

(assert (= (and b!715311 res!478278) b!715308))

(assert (= (and b!715308 res!478270) b!715298))

(assert (= (and b!715298 res!478269) b!715303))

(assert (= (and b!715303 res!478275) b!715306))

(assert (= (and b!715306 res!478284) b!715301))

(assert (= (and b!715301 res!478271) b!715300))

(assert (= (and b!715300 res!478285) b!715314))

(assert (= (and b!715314 res!478283) b!715309))

(assert (= (and b!715309 res!478274) b!715299))

(declare-fun m!671587 () Bool)

(assert (=> b!715315 m!671587))

(declare-fun m!671589 () Bool)

(assert (=> start!63506 m!671589))

(declare-fun m!671591 () Bool)

(assert (=> b!715300 m!671591))

(assert (=> b!715300 m!671591))

(declare-fun m!671593 () Bool)

(assert (=> b!715300 m!671593))

(declare-fun m!671595 () Bool)

(assert (=> b!715302 m!671595))

(declare-fun m!671597 () Bool)

(assert (=> b!715306 m!671597))

(declare-fun m!671599 () Bool)

(assert (=> b!715311 m!671599))

(declare-fun m!671601 () Bool)

(assert (=> b!715304 m!671601))

(declare-fun m!671603 () Bool)

(assert (=> b!715313 m!671603))

(declare-fun m!671605 () Bool)

(assert (=> b!715310 m!671605))

(declare-fun m!671607 () Bool)

(assert (=> b!715303 m!671607))

(declare-fun m!671609 () Bool)

(assert (=> b!715309 m!671609))

(declare-fun m!671611 () Bool)

(assert (=> b!715308 m!671611))

(declare-fun m!671613 () Bool)

(assert (=> b!715305 m!671613))

(declare-fun m!671615 () Bool)

(assert (=> b!715312 m!671615))

(declare-fun m!671617 () Bool)

(assert (=> b!715299 m!671617))

(declare-fun m!671619 () Bool)

(assert (=> b!715298 m!671619))

(declare-fun m!671621 () Bool)

(assert (=> b!715307 m!671621))

(push 1)

(assert (not b!715302))

(assert (not b!715307))

(assert (not b!715309))

(assert (not b!715300))

(assert (not b!715311))

(assert (not b!715305))

(assert (not b!715312))

(assert (not b!715299))

(assert (not b!715310))

(assert (not b!715308))

(assert (not b!715315))

(assert (not b!715303))

(assert (not b!715306))

(assert (not b!715313))

(assert (not start!63506))

(assert (not b!715298))

(assert (not b!715304))

(check-sat)

