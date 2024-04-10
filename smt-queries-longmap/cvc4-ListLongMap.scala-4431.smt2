; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61566 () Bool)

(assert start!61566)

(declare-fun b!688643 () Bool)

(declare-fun res!453333 () Bool)

(declare-fun e!392203 () Bool)

(assert (=> b!688643 (=> res!453333 e!392203)))

(declare-datatypes ((List!13066 0))(
  ( (Nil!13063) (Cons!13062 (h!14107 (_ BitVec 64)) (t!19330 List!13066)) )
))
(declare-fun lt!315850 () List!13066)

(declare-fun contains!3643 (List!13066 (_ BitVec 64)) Bool)

(assert (=> b!688643 (= res!453333 (contains!3643 lt!315850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688644 () Bool)

(declare-datatypes ((Unit!24292 0))(
  ( (Unit!24293) )
))
(declare-fun e!392205 () Unit!24292)

(declare-fun Unit!24294 () Unit!24292)

(assert (=> b!688644 (= e!392205 Unit!24294)))

(declare-fun b!688645 () Bool)

(declare-fun res!453335 () Bool)

(declare-fun e!392204 () Bool)

(assert (=> b!688645 (=> (not res!453335) (not e!392204))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688645 (= res!453335 (validKeyInArray!0 k!2843))))

(declare-fun b!688646 () Bool)

(declare-fun res!453328 () Bool)

(assert (=> b!688646 (=> (not res!453328) (not e!392204))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39707 0))(
  ( (array!39708 (arr!19025 (Array (_ BitVec 32) (_ BitVec 64))) (size!19407 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39707)

(assert (=> b!688646 (= res!453328 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19407 a!3626))))))

(declare-fun b!688647 () Bool)

(declare-fun res!453315 () Bool)

(assert (=> b!688647 (=> (not res!453315) (not e!392204))))

(declare-fun acc!681 () List!13066)

(assert (=> b!688647 (= res!453315 (not (contains!3643 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688648 () Bool)

(declare-fun e!392200 () Bool)

(declare-fun e!392201 () Bool)

(assert (=> b!688648 (= e!392200 e!392201)))

(declare-fun res!453326 () Bool)

(assert (=> b!688648 (=> (not res!453326) (not e!392201))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!688648 (= res!453326 (bvsle from!3004 i!1382))))

(declare-fun b!688649 () Bool)

(assert (=> b!688649 (= e!392201 (not (contains!3643 acc!681 k!2843)))))

(declare-fun res!453324 () Bool)

(assert (=> start!61566 (=> (not res!453324) (not e!392204))))

(assert (=> start!61566 (= res!453324 (and (bvslt (size!19407 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19407 a!3626))))))

(assert (=> start!61566 e!392204))

(assert (=> start!61566 true))

(declare-fun array_inv!14821 (array!39707) Bool)

(assert (=> start!61566 (array_inv!14821 a!3626)))

(declare-fun b!688650 () Bool)

(declare-fun res!453316 () Bool)

(assert (=> b!688650 (=> (not res!453316) (not e!392204))))

(assert (=> b!688650 (= res!453316 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19407 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688651 () Bool)

(declare-fun res!453331 () Bool)

(assert (=> b!688651 (=> res!453331 e!392203)))

(declare-fun noDuplicate!890 (List!13066) Bool)

(assert (=> b!688651 (= res!453331 (not (noDuplicate!890 lt!315850)))))

(declare-fun b!688652 () Bool)

(declare-fun res!453320 () Bool)

(assert (=> b!688652 (=> (not res!453320) (not e!392204))))

(declare-fun arrayNoDuplicates!0 (array!39707 (_ BitVec 32) List!13066) Bool)

(assert (=> b!688652 (= res!453320 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688653 () Bool)

(declare-fun res!453317 () Bool)

(assert (=> b!688653 (=> (not res!453317) (not e!392204))))

(assert (=> b!688653 (= res!453317 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13063))))

(declare-fun b!688654 () Bool)

(declare-fun res!453327 () Bool)

(assert (=> b!688654 (=> (not res!453327) (not e!392204))))

(assert (=> b!688654 (= res!453327 e!392200)))

(declare-fun res!453325 () Bool)

(assert (=> b!688654 (=> res!453325 e!392200)))

(declare-fun e!392207 () Bool)

(assert (=> b!688654 (= res!453325 e!392207)))

(declare-fun res!453330 () Bool)

(assert (=> b!688654 (=> (not res!453330) (not e!392207))))

(assert (=> b!688654 (= res!453330 (bvsgt from!3004 i!1382))))

(declare-fun b!688655 () Bool)

(declare-fun e!392208 () Unit!24292)

(declare-fun Unit!24295 () Unit!24292)

(assert (=> b!688655 (= e!392208 Unit!24295)))

(declare-fun b!688656 () Bool)

(declare-fun res!453332 () Bool)

(assert (=> b!688656 (=> res!453332 e!392203)))

(assert (=> b!688656 (= res!453332 (contains!3643 lt!315850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688657 () Bool)

(declare-fun res!453322 () Bool)

(assert (=> b!688657 (=> (not res!453322) (not e!392204))))

(assert (=> b!688657 (= res!453322 (not (contains!3643 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688658 () Bool)

(assert (=> b!688658 (= e!392204 (not e!392203))))

(declare-fun res!453318 () Bool)

(assert (=> b!688658 (=> res!453318 e!392203)))

(assert (=> b!688658 (= res!453318 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688658 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315850)))

(declare-fun lt!315854 () Unit!24292)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39707 (_ BitVec 64) (_ BitVec 32) List!13066 List!13066) Unit!24292)

(assert (=> b!688658 (= lt!315854 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315850))))

(declare-fun -!194 (List!13066 (_ BitVec 64)) List!13066)

(assert (=> b!688658 (= (-!194 lt!315850 k!2843) acc!681)))

(declare-fun $colon$colon!394 (List!13066 (_ BitVec 64)) List!13066)

(assert (=> b!688658 (= lt!315850 ($colon$colon!394 acc!681 k!2843))))

(declare-fun lt!315855 () Unit!24292)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13066) Unit!24292)

(assert (=> b!688658 (= lt!315855 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!229 (List!13066 List!13066) Bool)

(assert (=> b!688658 (subseq!229 acc!681 acc!681)))

(declare-fun lt!315858 () Unit!24292)

(declare-fun lemmaListSubSeqRefl!0 (List!13066) Unit!24292)

(assert (=> b!688658 (= lt!315858 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688658 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315851 () Unit!24292)

(assert (=> b!688658 (= lt!315851 e!392208)))

(declare-fun c!78032 () Bool)

(assert (=> b!688658 (= c!78032 (validKeyInArray!0 (select (arr!19025 a!3626) from!3004)))))

(declare-fun lt!315857 () Unit!24292)

(assert (=> b!688658 (= lt!315857 e!392205)))

(declare-fun c!78031 () Bool)

(declare-fun arrayContainsKey!0 (array!39707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688658 (= c!78031 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688658 (arrayContainsKey!0 (array!39708 (store (arr!19025 a!3626) i!1382 k!2843) (size!19407 a!3626)) k!2843 from!3004)))

(declare-fun b!688659 () Bool)

(declare-fun e!392199 () Bool)

(assert (=> b!688659 (= e!392199 (not (contains!3643 lt!315850 k!2843)))))

(declare-fun b!688660 () Bool)

(assert (=> b!688660 (= e!392207 (contains!3643 acc!681 k!2843))))

(declare-fun b!688661 () Bool)

(declare-fun e!392206 () Bool)

(assert (=> b!688661 (= e!392206 (contains!3643 lt!315850 k!2843))))

(declare-fun b!688662 () Bool)

(declare-fun res!453329 () Bool)

(assert (=> b!688662 (=> (not res!453329) (not e!392204))))

(assert (=> b!688662 (= res!453329 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688663 () Bool)

(assert (=> b!688663 (= e!392203 true)))

(declare-fun lt!315856 () Bool)

(declare-fun e!392202 () Bool)

(assert (=> b!688663 (= lt!315856 e!392202)))

(declare-fun res!453319 () Bool)

(assert (=> b!688663 (=> res!453319 e!392202)))

(assert (=> b!688663 (= res!453319 e!392206)))

(declare-fun res!453321 () Bool)

(assert (=> b!688663 (=> (not res!453321) (not e!392206))))

(assert (=> b!688663 (= res!453321 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688664 () Bool)

(declare-fun Unit!24296 () Unit!24292)

(assert (=> b!688664 (= e!392205 Unit!24296)))

(declare-fun lt!315853 () Unit!24292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39707 (_ BitVec 64) (_ BitVec 32)) Unit!24292)

(assert (=> b!688664 (= lt!315853 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688664 false))

(declare-fun b!688665 () Bool)

(declare-fun res!453334 () Bool)

(assert (=> b!688665 (=> (not res!453334) (not e!392204))))

(assert (=> b!688665 (= res!453334 (noDuplicate!890 acc!681))))

(declare-fun b!688666 () Bool)

(assert (=> b!688666 (= e!392202 e!392199)))

(declare-fun res!453323 () Bool)

(assert (=> b!688666 (=> (not res!453323) (not e!392199))))

(assert (=> b!688666 (= res!453323 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688667 () Bool)

(declare-fun lt!315852 () Unit!24292)

(assert (=> b!688667 (= e!392208 lt!315852)))

(declare-fun lt!315859 () Unit!24292)

(assert (=> b!688667 (= lt!315859 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688667 (subseq!229 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39707 List!13066 List!13066 (_ BitVec 32)) Unit!24292)

(assert (=> b!688667 (= lt!315852 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!394 acc!681 (select (arr!19025 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688667 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!61566 res!453324) b!688665))

(assert (= (and b!688665 res!453334) b!688657))

(assert (= (and b!688657 res!453322) b!688647))

(assert (= (and b!688647 res!453315) b!688654))

(assert (= (and b!688654 res!453330) b!688660))

(assert (= (and b!688654 (not res!453325)) b!688648))

(assert (= (and b!688648 res!453326) b!688649))

(assert (= (and b!688654 res!453327) b!688653))

(assert (= (and b!688653 res!453317) b!688652))

(assert (= (and b!688652 res!453320) b!688646))

(assert (= (and b!688646 res!453328) b!688645))

(assert (= (and b!688645 res!453335) b!688662))

(assert (= (and b!688662 res!453329) b!688650))

(assert (= (and b!688650 res!453316) b!688658))

(assert (= (and b!688658 c!78031) b!688664))

(assert (= (and b!688658 (not c!78031)) b!688644))

(assert (= (and b!688658 c!78032) b!688667))

(assert (= (and b!688658 (not c!78032)) b!688655))

(assert (= (and b!688658 (not res!453318)) b!688651))

(assert (= (and b!688651 (not res!453331)) b!688656))

(assert (= (and b!688656 (not res!453332)) b!688643))

(assert (= (and b!688643 (not res!453333)) b!688663))

(assert (= (and b!688663 res!453321) b!688661))

(assert (= (and b!688663 (not res!453319)) b!688666))

(assert (= (and b!688666 res!453323) b!688659))

(declare-fun m!652489 () Bool)

(assert (=> start!61566 m!652489))

(declare-fun m!652491 () Bool)

(assert (=> b!688645 m!652491))

(declare-fun m!652493 () Bool)

(assert (=> b!688660 m!652493))

(declare-fun m!652495 () Bool)

(assert (=> b!688647 m!652495))

(declare-fun m!652497 () Bool)

(assert (=> b!688651 m!652497))

(declare-fun m!652499 () Bool)

(assert (=> b!688652 m!652499))

(declare-fun m!652501 () Bool)

(assert (=> b!688665 m!652501))

(declare-fun m!652503 () Bool)

(assert (=> b!688657 m!652503))

(declare-fun m!652505 () Bool)

(assert (=> b!688662 m!652505))

(declare-fun m!652507 () Bool)

(assert (=> b!688643 m!652507))

(declare-fun m!652509 () Bool)

(assert (=> b!688664 m!652509))

(declare-fun m!652511 () Bool)

(assert (=> b!688659 m!652511))

(declare-fun m!652513 () Bool)

(assert (=> b!688658 m!652513))

(declare-fun m!652515 () Bool)

(assert (=> b!688658 m!652515))

(declare-fun m!652517 () Bool)

(assert (=> b!688658 m!652517))

(declare-fun m!652519 () Bool)

(assert (=> b!688658 m!652519))

(declare-fun m!652521 () Bool)

(assert (=> b!688658 m!652521))

(declare-fun m!652523 () Bool)

(assert (=> b!688658 m!652523))

(declare-fun m!652525 () Bool)

(assert (=> b!688658 m!652525))

(declare-fun m!652527 () Bool)

(assert (=> b!688658 m!652527))

(assert (=> b!688658 m!652515))

(declare-fun m!652529 () Bool)

(assert (=> b!688658 m!652529))

(declare-fun m!652531 () Bool)

(assert (=> b!688658 m!652531))

(declare-fun m!652533 () Bool)

(assert (=> b!688658 m!652533))

(declare-fun m!652535 () Bool)

(assert (=> b!688658 m!652535))

(declare-fun m!652537 () Bool)

(assert (=> b!688658 m!652537))

(declare-fun m!652539 () Bool)

(assert (=> b!688653 m!652539))

(assert (=> b!688649 m!652493))

(assert (=> b!688661 m!652511))

(assert (=> b!688667 m!652513))

(assert (=> b!688667 m!652515))

(declare-fun m!652541 () Bool)

(assert (=> b!688667 m!652541))

(declare-fun m!652543 () Bool)

(assert (=> b!688667 m!652543))

(assert (=> b!688667 m!652515))

(assert (=> b!688667 m!652541))

(assert (=> b!688667 m!652523))

(assert (=> b!688667 m!652537))

(declare-fun m!652545 () Bool)

(assert (=> b!688656 m!652545))

(push 1)

(assert (not b!688660))

(assert (not b!688662))

(assert (not b!688658))

(assert (not b!688645))

(assert (not start!61566))

(assert (not b!688652))

(assert (not b!688649))

(assert (not b!688656))

(assert (not b!688664))

(assert (not b!688653))

(assert (not b!688665))

(assert (not b!688647))

(assert (not b!688667))

(assert (not b!688659))

(assert (not b!688643))

(assert (not b!688661))

(assert (not b!688651))

(assert (not b!688657))

(check-sat)

(pop 1)

