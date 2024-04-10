; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62420 () Bool)

(assert start!62420)

(declare-fun b!700626 () Bool)

(declare-fun res!464453 () Bool)

(declare-fun e!397311 () Bool)

(assert (=> b!700626 (=> (not res!464453) (not e!397311))))

(declare-datatypes ((array!40099 0))(
  ( (array!40100 (arr!19206 (Array (_ BitVec 32) (_ BitVec 64))) (size!19591 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40099)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700626 (= res!464453 (validKeyInArray!0 (select (arr!19206 a!3591) from!2969)))))

(declare-fun b!700627 () Bool)

(declare-fun res!464457 () Bool)

(assert (=> b!700627 (=> (not res!464457) (not e!397311))))

(declare-datatypes ((List!13247 0))(
  ( (Nil!13244) (Cons!13243 (h!14288 (_ BitVec 64)) (t!19529 List!13247)) )
))
(declare-fun newAcc!49 () List!13247)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3824 (List!13247 (_ BitVec 64)) Bool)

(assert (=> b!700627 (= res!464457 (contains!3824 newAcc!49 k!2824))))

(declare-fun b!700628 () Bool)

(declare-fun res!464443 () Bool)

(assert (=> b!700628 (=> (not res!464443) (not e!397311))))

(assert (=> b!700628 (= res!464443 (not (contains!3824 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700629 () Bool)

(declare-fun res!464451 () Bool)

(declare-fun e!397310 () Bool)

(assert (=> b!700629 (=> (not res!464451) (not e!397310))))

(declare-fun lt!317506 () List!13247)

(assert (=> b!700629 (= res!464451 (contains!3824 lt!317506 k!2824))))

(declare-fun b!700630 () Bool)

(declare-fun res!464448 () Bool)

(assert (=> b!700630 (=> (not res!464448) (not e!397311))))

(declare-fun acc!652 () List!13247)

(assert (=> b!700630 (= res!464448 (not (contains!3824 acc!652 k!2824)))))

(declare-fun b!700631 () Bool)

(declare-fun res!464450 () Bool)

(assert (=> b!700631 (=> (not res!464450) (not e!397311))))

(assert (=> b!700631 (= res!464450 (not (contains!3824 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700632 () Bool)

(declare-fun res!464437 () Bool)

(assert (=> b!700632 (=> (not res!464437) (not e!397311))))

(assert (=> b!700632 (= res!464437 (not (contains!3824 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700633 () Bool)

(declare-fun res!464454 () Bool)

(assert (=> b!700633 (=> (not res!464454) (not e!397311))))

(declare-fun -!234 (List!13247 (_ BitVec 64)) List!13247)

(assert (=> b!700633 (= res!464454 (= (-!234 newAcc!49 k!2824) acc!652))))

(declare-fun b!700634 () Bool)

(declare-fun res!464455 () Bool)

(assert (=> b!700634 (=> (not res!464455) (not e!397311))))

(assert (=> b!700634 (= res!464455 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19591 a!3591)))))

(declare-fun b!700635 () Bool)

(declare-fun res!464462 () Bool)

(assert (=> b!700635 (=> (not res!464462) (not e!397311))))

(declare-fun arrayNoDuplicates!0 (array!40099 (_ BitVec 32) List!13247) Bool)

(assert (=> b!700635 (= res!464462 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!700637 () Bool)

(declare-fun res!464440 () Bool)

(assert (=> b!700637 (=> (not res!464440) (not e!397311))))

(declare-fun noDuplicate!1071 (List!13247) Bool)

(assert (=> b!700637 (= res!464440 (noDuplicate!1071 newAcc!49))))

(declare-fun b!700638 () Bool)

(declare-fun res!464439 () Bool)

(assert (=> b!700638 (=> (not res!464439) (not e!397311))))

(assert (=> b!700638 (= res!464439 (noDuplicate!1071 acc!652))))

(declare-fun b!700639 () Bool)

(declare-fun res!464463 () Bool)

(assert (=> b!700639 (=> (not res!464463) (not e!397310))))

(declare-fun lt!317508 () List!13247)

(declare-fun subseq!269 (List!13247 List!13247) Bool)

(assert (=> b!700639 (= res!464463 (subseq!269 lt!317508 lt!317506))))

(declare-fun b!700640 () Bool)

(assert (=> b!700640 (= e!397311 e!397310)))

(declare-fun res!464436 () Bool)

(assert (=> b!700640 (=> (not res!464436) (not e!397310))))

(assert (=> b!700640 (= res!464436 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!467 (List!13247 (_ BitVec 64)) List!13247)

(assert (=> b!700640 (= lt!317506 ($colon$colon!467 newAcc!49 (select (arr!19206 a!3591) from!2969)))))

(assert (=> b!700640 (= lt!317508 ($colon$colon!467 acc!652 (select (arr!19206 a!3591) from!2969)))))

(declare-fun b!700641 () Bool)

(declare-fun res!464446 () Bool)

(assert (=> b!700641 (=> (not res!464446) (not e!397310))))

(declare-fun arrayContainsKey!0 (array!40099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700641 (= res!464446 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700642 () Bool)

(declare-fun res!464442 () Bool)

(assert (=> b!700642 (=> (not res!464442) (not e!397310))))

(assert (=> b!700642 (= res!464442 (not (contains!3824 lt!317508 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700643 () Bool)

(declare-fun res!464456 () Bool)

(assert (=> b!700643 (=> (not res!464456) (not e!397311))))

(assert (=> b!700643 (= res!464456 (validKeyInArray!0 k!2824))))

(declare-fun b!700644 () Bool)

(declare-fun res!464461 () Bool)

(assert (=> b!700644 (=> (not res!464461) (not e!397311))))

(assert (=> b!700644 (= res!464461 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!700645 () Bool)

(declare-fun res!464460 () Bool)

(assert (=> b!700645 (=> (not res!464460) (not e!397310))))

(assert (=> b!700645 (= res!464460 (= (-!234 lt!317506 k!2824) lt!317508))))

(declare-fun b!700646 () Bool)

(declare-fun res!464444 () Bool)

(assert (=> b!700646 (=> (not res!464444) (not e!397310))))

(assert (=> b!700646 (= res!464444 (not (contains!3824 lt!317506 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700647 () Bool)

(declare-fun res!464458 () Bool)

(assert (=> b!700647 (=> (not res!464458) (not e!397310))))

(assert (=> b!700647 (= res!464458 (not (contains!3824 lt!317508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700648 () Bool)

(declare-fun res!464447 () Bool)

(assert (=> b!700648 (=> (not res!464447) (not e!397310))))

(assert (=> b!700648 (= res!464447 (not (contains!3824 lt!317508 k!2824)))))

(declare-fun b!700649 () Bool)

(declare-fun res!464452 () Bool)

(assert (=> b!700649 (=> (not res!464452) (not e!397310))))

(assert (=> b!700649 (= res!464452 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317508))))

(declare-fun b!700636 () Bool)

(assert (=> b!700636 (= e!397310 false)))

(declare-fun lt!317507 () Bool)

(assert (=> b!700636 (= lt!317507 (contains!3824 lt!317506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!464438 () Bool)

(assert (=> start!62420 (=> (not res!464438) (not e!397311))))

(assert (=> start!62420 (= res!464438 (and (bvslt (size!19591 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19591 a!3591))))))

(assert (=> start!62420 e!397311))

(assert (=> start!62420 true))

(declare-fun array_inv!15002 (array!40099) Bool)

(assert (=> start!62420 (array_inv!15002 a!3591)))

(declare-fun b!700650 () Bool)

(declare-fun res!464445 () Bool)

(assert (=> b!700650 (=> (not res!464445) (not e!397310))))

(assert (=> b!700650 (= res!464445 (noDuplicate!1071 lt!317506))))

(declare-fun b!700651 () Bool)

(declare-fun res!464441 () Bool)

(assert (=> b!700651 (=> (not res!464441) (not e!397311))))

(assert (=> b!700651 (= res!464441 (subseq!269 acc!652 newAcc!49))))

(declare-fun b!700652 () Bool)

(declare-fun res!464449 () Bool)

(assert (=> b!700652 (=> (not res!464449) (not e!397311))))

(assert (=> b!700652 (= res!464449 (not (contains!3824 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700653 () Bool)

(declare-fun res!464459 () Bool)

(assert (=> b!700653 (=> (not res!464459) (not e!397310))))

(assert (=> b!700653 (= res!464459 (noDuplicate!1071 lt!317508))))

(assert (= (and start!62420 res!464438) b!700638))

(assert (= (and b!700638 res!464439) b!700637))

(assert (= (and b!700637 res!464440) b!700631))

(assert (= (and b!700631 res!464450) b!700652))

(assert (= (and b!700652 res!464449) b!700644))

(assert (= (and b!700644 res!464461) b!700630))

(assert (= (and b!700630 res!464448) b!700643))

(assert (= (and b!700643 res!464456) b!700635))

(assert (= (and b!700635 res!464462) b!700651))

(assert (= (and b!700651 res!464441) b!700627))

(assert (= (and b!700627 res!464457) b!700633))

(assert (= (and b!700633 res!464454) b!700628))

(assert (= (and b!700628 res!464443) b!700632))

(assert (= (and b!700632 res!464437) b!700634))

(assert (= (and b!700634 res!464455) b!700626))

(assert (= (and b!700626 res!464453) b!700640))

(assert (= (and b!700640 res!464436) b!700653))

(assert (= (and b!700653 res!464459) b!700650))

(assert (= (and b!700650 res!464445) b!700647))

(assert (= (and b!700647 res!464458) b!700642))

(assert (= (and b!700642 res!464442) b!700641))

(assert (= (and b!700641 res!464446) b!700648))

(assert (= (and b!700648 res!464447) b!700649))

(assert (= (and b!700649 res!464452) b!700639))

(assert (= (and b!700639 res!464463) b!700629))

(assert (= (and b!700629 res!464451) b!700645))

(assert (= (and b!700645 res!464460) b!700646))

(assert (= (and b!700646 res!464444) b!700636))

(declare-fun m!660235 () Bool)

(assert (=> b!700650 m!660235))

(declare-fun m!660237 () Bool)

(assert (=> b!700649 m!660237))

(declare-fun m!660239 () Bool)

(assert (=> b!700631 m!660239))

(declare-fun m!660241 () Bool)

(assert (=> b!700628 m!660241))

(declare-fun m!660243 () Bool)

(assert (=> b!700645 m!660243))

(declare-fun m!660245 () Bool)

(assert (=> b!700642 m!660245))

(declare-fun m!660247 () Bool)

(assert (=> b!700647 m!660247))

(declare-fun m!660249 () Bool)

(assert (=> b!700646 m!660249))

(declare-fun m!660251 () Bool)

(assert (=> b!700651 m!660251))

(declare-fun m!660253 () Bool)

(assert (=> b!700633 m!660253))

(declare-fun m!660255 () Bool)

(assert (=> b!700635 m!660255))

(declare-fun m!660257 () Bool)

(assert (=> b!700653 m!660257))

(declare-fun m!660259 () Bool)

(assert (=> b!700636 m!660259))

(declare-fun m!660261 () Bool)

(assert (=> b!700637 m!660261))

(declare-fun m!660263 () Bool)

(assert (=> b!700652 m!660263))

(declare-fun m!660265 () Bool)

(assert (=> b!700632 m!660265))

(declare-fun m!660267 () Bool)

(assert (=> b!700629 m!660267))

(declare-fun m!660269 () Bool)

(assert (=> b!700630 m!660269))

(declare-fun m!660271 () Bool)

(assert (=> b!700627 m!660271))

(declare-fun m!660273 () Bool)

(assert (=> b!700648 m!660273))

(declare-fun m!660275 () Bool)

(assert (=> b!700640 m!660275))

(assert (=> b!700640 m!660275))

(declare-fun m!660277 () Bool)

(assert (=> b!700640 m!660277))

(assert (=> b!700640 m!660275))

(declare-fun m!660279 () Bool)

(assert (=> b!700640 m!660279))

(declare-fun m!660281 () Bool)

(assert (=> start!62420 m!660281))

(declare-fun m!660283 () Bool)

(assert (=> b!700643 m!660283))

(declare-fun m!660285 () Bool)

(assert (=> b!700644 m!660285))

(assert (=> b!700626 m!660275))

(assert (=> b!700626 m!660275))

(declare-fun m!660287 () Bool)

(assert (=> b!700626 m!660287))

(declare-fun m!660289 () Bool)

(assert (=> b!700639 m!660289))

(declare-fun m!660291 () Bool)

(assert (=> b!700641 m!660291))

(declare-fun m!660293 () Bool)

(assert (=> b!700638 m!660293))

(push 1)

