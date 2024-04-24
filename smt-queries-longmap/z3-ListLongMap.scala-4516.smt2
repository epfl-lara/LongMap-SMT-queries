; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62620 () Bool)

(assert start!62620)

(declare-fun b!705625 () Bool)

(declare-fun res!469340 () Bool)

(declare-fun e!397947 () Bool)

(assert (=> b!705625 (=> (not res!469340) (not e!397947))))

(declare-datatypes ((List!13221 0))(
  ( (Nil!13218) (Cons!13217 (h!14265 (_ BitVec 64)) (t!19495 List!13221)) )
))
(declare-fun acc!652 () List!13221)

(declare-fun contains!3873 (List!13221 (_ BitVec 64)) Bool)

(assert (=> b!705625 (= res!469340 (not (contains!3873 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705626 () Bool)

(declare-fun res!469345 () Bool)

(assert (=> b!705626 (=> (not res!469345) (not e!397947))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705626 (= res!469345 (validKeyInArray!0 k0!2824))))

(declare-fun b!705627 () Bool)

(declare-fun res!469341 () Bool)

(assert (=> b!705627 (=> (not res!469341) (not e!397947))))

(declare-fun noDuplicate!1147 (List!13221) Bool)

(assert (=> b!705627 (= res!469341 (noDuplicate!1147 acc!652))))

(declare-fun b!705628 () Bool)

(declare-fun res!469350 () Bool)

(assert (=> b!705628 (=> (not res!469350) (not e!397947))))

(declare-fun newAcc!49 () List!13221)

(assert (=> b!705628 (= res!469350 (not (contains!3873 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705629 () Bool)

(declare-fun res!469338 () Bool)

(assert (=> b!705629 (=> (not res!469338) (not e!397947))))

(assert (=> b!705629 (= res!469338 (not (contains!3873 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705630 () Bool)

(declare-fun res!469343 () Bool)

(assert (=> b!705630 (=> (not res!469343) (not e!397947))))

(declare-fun -!305 (List!13221 (_ BitVec 64)) List!13221)

(assert (=> b!705630 (= res!469343 (= (-!305 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705631 () Bool)

(declare-fun res!469339 () Bool)

(assert (=> b!705631 (=> (not res!469339) (not e!397947))))

(declare-datatypes ((array!40239 0))(
  ( (array!40240 (arr!19273 (Array (_ BitVec 32) (_ BitVec 64))) (size!19656 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40239)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40239 (_ BitVec 32) List!13221) Bool)

(assert (=> b!705631 (= res!469339 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705632 () Bool)

(declare-fun res!469336 () Bool)

(assert (=> b!705632 (=> (not res!469336) (not e!397947))))

(declare-fun arrayContainsKey!0 (array!40239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705632 (= res!469336 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705633 () Bool)

(declare-fun res!469348 () Bool)

(assert (=> b!705633 (=> (not res!469348) (not e!397947))))

(assert (=> b!705633 (= res!469348 (not (contains!3873 acc!652 k0!2824)))))

(declare-fun b!705634 () Bool)

(declare-fun res!469353 () Bool)

(assert (=> b!705634 (=> (not res!469353) (not e!397947))))

(assert (=> b!705634 (= res!469353 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705635 () Bool)

(declare-fun res!469354 () Bool)

(assert (=> b!705635 (=> (not res!469354) (not e!397947))))

(assert (=> b!705635 (= res!469354 (contains!3873 newAcc!49 k0!2824))))

(declare-fun b!705636 () Bool)

(declare-fun res!469346 () Bool)

(assert (=> b!705636 (=> (not res!469346) (not e!397947))))

(assert (=> b!705636 (= res!469346 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705638 () Bool)

(declare-fun res!469352 () Bool)

(assert (=> b!705638 (=> (not res!469352) (not e!397947))))

(assert (=> b!705638 (= res!469352 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705639 () Bool)

(assert (=> b!705639 (= e!397947 (not (bvsle from!2969 (size!19656 a!3591))))))

(assert (=> b!705639 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24585 0))(
  ( (Unit!24586) )
))
(declare-fun lt!317997 () Unit!24585)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40239 (_ BitVec 64) (_ BitVec 32) List!13221 List!13221) Unit!24585)

(assert (=> b!705639 (= lt!317997 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705640 () Bool)

(declare-fun res!469349 () Bool)

(assert (=> b!705640 (=> (not res!469349) (not e!397947))))

(declare-fun subseq!341 (List!13221 List!13221) Bool)

(assert (=> b!705640 (= res!469349 (subseq!341 acc!652 newAcc!49))))

(declare-fun b!705641 () Bool)

(declare-fun res!469337 () Bool)

(assert (=> b!705641 (=> (not res!469337) (not e!397947))))

(assert (=> b!705641 (= res!469337 (not (contains!3873 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705642 () Bool)

(declare-fun res!469351 () Bool)

(assert (=> b!705642 (=> (not res!469351) (not e!397947))))

(assert (=> b!705642 (= res!469351 (not (validKeyInArray!0 (select (arr!19273 a!3591) from!2969))))))

(declare-fun b!705643 () Bool)

(declare-fun res!469342 () Bool)

(assert (=> b!705643 (=> (not res!469342) (not e!397947))))

(assert (=> b!705643 (= res!469342 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19656 a!3591)))))

(declare-fun b!705637 () Bool)

(declare-fun res!469344 () Bool)

(assert (=> b!705637 (=> (not res!469344) (not e!397947))))

(assert (=> b!705637 (= res!469344 (noDuplicate!1147 newAcc!49))))

(declare-fun res!469347 () Bool)

(assert (=> start!62620 (=> (not res!469347) (not e!397947))))

(assert (=> start!62620 (= res!469347 (and (bvslt (size!19656 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19656 a!3591))))))

(assert (=> start!62620 e!397947))

(assert (=> start!62620 true))

(declare-fun array_inv!15132 (array!40239) Bool)

(assert (=> start!62620 (array_inv!15132 a!3591)))

(assert (= (and start!62620 res!469347) b!705627))

(assert (= (and b!705627 res!469341) b!705637))

(assert (= (and b!705637 res!469344) b!705625))

(assert (= (and b!705625 res!469340) b!705629))

(assert (= (and b!705629 res!469338) b!705632))

(assert (= (and b!705632 res!469336) b!705633))

(assert (= (and b!705633 res!469348) b!705626))

(assert (= (and b!705626 res!469345) b!705638))

(assert (= (and b!705638 res!469352) b!705640))

(assert (= (and b!705640 res!469349) b!705635))

(assert (= (and b!705635 res!469354) b!705630))

(assert (= (and b!705630 res!469343) b!705628))

(assert (= (and b!705628 res!469350) b!705641))

(assert (= (and b!705641 res!469337) b!705643))

(assert (= (and b!705643 res!469342) b!705642))

(assert (= (and b!705642 res!469351) b!705636))

(assert (= (and b!705636 res!469346) b!705634))

(assert (= (and b!705634 res!469353) b!705631))

(assert (= (and b!705631 res!469339) b!705639))

(declare-fun m!664251 () Bool)

(assert (=> b!705633 m!664251))

(declare-fun m!664253 () Bool)

(assert (=> b!705640 m!664253))

(declare-fun m!664255 () Bool)

(assert (=> start!62620 m!664255))

(declare-fun m!664257 () Bool)

(assert (=> b!705626 m!664257))

(declare-fun m!664259 () Bool)

(assert (=> b!705627 m!664259))

(declare-fun m!664261 () Bool)

(assert (=> b!705625 m!664261))

(declare-fun m!664263 () Bool)

(assert (=> b!705637 m!664263))

(declare-fun m!664265 () Bool)

(assert (=> b!705631 m!664265))

(declare-fun m!664267 () Bool)

(assert (=> b!705638 m!664267))

(declare-fun m!664269 () Bool)

(assert (=> b!705634 m!664269))

(declare-fun m!664271 () Bool)

(assert (=> b!705632 m!664271))

(declare-fun m!664273 () Bool)

(assert (=> b!705641 m!664273))

(declare-fun m!664275 () Bool)

(assert (=> b!705639 m!664275))

(declare-fun m!664277 () Bool)

(assert (=> b!705639 m!664277))

(declare-fun m!664279 () Bool)

(assert (=> b!705630 m!664279))

(declare-fun m!664281 () Bool)

(assert (=> b!705629 m!664281))

(declare-fun m!664283 () Bool)

(assert (=> b!705628 m!664283))

(declare-fun m!664285 () Bool)

(assert (=> b!705642 m!664285))

(assert (=> b!705642 m!664285))

(declare-fun m!664287 () Bool)

(assert (=> b!705642 m!664287))

(declare-fun m!664289 () Bool)

(assert (=> b!705635 m!664289))

(check-sat (not b!705635) (not b!705641) (not b!705630) (not b!705633) (not b!705638) (not start!62620) (not b!705625) (not b!705639) (not b!705642) (not b!705626) (not b!705637) (not b!705628) (not b!705640) (not b!705634) (not b!705629) (not b!705627) (not b!705632) (not b!705631))
(check-sat)
