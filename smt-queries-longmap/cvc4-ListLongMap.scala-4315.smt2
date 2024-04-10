; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59922 () Bool)

(assert start!59922)

(declare-fun b!663786 () Bool)

(declare-fun e!380809 () Bool)

(declare-datatypes ((List!12718 0))(
  ( (Nil!12715) (Cons!12714 (h!13759 (_ BitVec 64)) (t!18946 List!12718)) )
))
(declare-fun acc!681 () List!12718)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3295 (List!12718 (_ BitVec 64)) Bool)

(assert (=> b!663786 (= e!380809 (not (contains!3295 acc!681 k!2843)))))

(declare-fun b!663787 () Bool)

(declare-fun res!431606 () Bool)

(declare-fun e!380806 () Bool)

(assert (=> b!663787 (=> (not res!431606) (not e!380806))))

(declare-fun noDuplicate!542 (List!12718) Bool)

(assert (=> b!663787 (= res!431606 (noDuplicate!542 acc!681))))

(declare-fun b!663788 () Bool)

(declare-fun res!431607 () Bool)

(assert (=> b!663788 (=> (not res!431607) (not e!380806))))

(assert (=> b!663788 (= res!431607 (not (contains!3295 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663789 () Bool)

(declare-fun res!431605 () Bool)

(assert (=> b!663789 (=> (not res!431605) (not e!380806))))

(declare-datatypes ((array!38969 0))(
  ( (array!38970 (arr!18677 (Array (_ BitVec 32) (_ BitVec 64))) (size!19041 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38969)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663789 (= res!431605 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19041 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663790 () Bool)

(assert (=> b!663790 (= e!380806 (not true))))

(declare-datatypes ((Unit!23110 0))(
  ( (Unit!23111) )
))
(declare-fun lt!309385 () Unit!23110)

(declare-fun e!380811 () Unit!23110)

(assert (=> b!663790 (= lt!309385 e!380811)))

(declare-fun c!76459 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663790 (= c!76459 (validKeyInArray!0 (select (arr!18677 a!3626) from!3004)))))

(declare-fun lt!309382 () Unit!23110)

(declare-fun e!380808 () Unit!23110)

(assert (=> b!663790 (= lt!309382 e!380808)))

(declare-fun c!76460 () Bool)

(declare-fun arrayContainsKey!0 (array!38969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663790 (= c!76460 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663790 (arrayContainsKey!0 (array!38970 (store (arr!18677 a!3626) i!1382 k!2843) (size!19041 a!3626)) k!2843 from!3004)))

(declare-fun b!663791 () Bool)

(declare-fun Unit!23112 () Unit!23110)

(assert (=> b!663791 (= e!380808 Unit!23112)))

(declare-fun b!663792 () Bool)

(declare-fun Unit!23113 () Unit!23110)

(assert (=> b!663792 (= e!380811 Unit!23113)))

(declare-fun b!663793 () Bool)

(declare-fun Unit!23114 () Unit!23110)

(assert (=> b!663793 (= e!380808 Unit!23114)))

(declare-fun lt!309384 () Unit!23110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38969 (_ BitVec 64) (_ BitVec 32)) Unit!23110)

(assert (=> b!663793 (= lt!309384 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663793 false))

(declare-fun b!663794 () Bool)

(declare-fun res!431602 () Bool)

(assert (=> b!663794 (=> (not res!431602) (not e!380806))))

(declare-fun arrayNoDuplicates!0 (array!38969 (_ BitVec 32) List!12718) Bool)

(assert (=> b!663794 (= res!431602 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663796 () Bool)

(declare-fun res!431610 () Bool)

(assert (=> b!663796 (=> (not res!431610) (not e!380806))))

(assert (=> b!663796 (= res!431610 (not (contains!3295 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663797 () Bool)

(declare-fun res!431608 () Bool)

(assert (=> b!663797 (=> (not res!431608) (not e!380806))))

(assert (=> b!663797 (= res!431608 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12715))))

(declare-fun b!663798 () Bool)

(declare-fun res!431611 () Bool)

(assert (=> b!663798 (=> (not res!431611) (not e!380806))))

(assert (=> b!663798 (= res!431611 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19041 a!3626))))))

(declare-fun b!663799 () Bool)

(declare-fun lt!309383 () Unit!23110)

(assert (=> b!663799 (= e!380811 lt!309383)))

(declare-fun lt!309381 () Unit!23110)

(declare-fun lemmaListSubSeqRefl!0 (List!12718) Unit!23110)

(assert (=> b!663799 (= lt!309381 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!34 (List!12718 List!12718) Bool)

(assert (=> b!663799 (subseq!34 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38969 List!12718 List!12718 (_ BitVec 32)) Unit!23110)

(declare-fun $colon$colon!166 (List!12718 (_ BitVec 64)) List!12718)

(assert (=> b!663799 (= lt!309383 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!166 acc!681 (select (arr!18677 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663799 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!431609 () Bool)

(assert (=> start!59922 (=> (not res!431609) (not e!380806))))

(assert (=> start!59922 (= res!431609 (and (bvslt (size!19041 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19041 a!3626))))))

(assert (=> start!59922 e!380806))

(assert (=> start!59922 true))

(declare-fun array_inv!14473 (array!38969) Bool)

(assert (=> start!59922 (array_inv!14473 a!3626)))

(declare-fun b!663795 () Bool)

(declare-fun e!380810 () Bool)

(assert (=> b!663795 (= e!380810 e!380809)))

(declare-fun res!431613 () Bool)

(assert (=> b!663795 (=> (not res!431613) (not e!380809))))

(assert (=> b!663795 (= res!431613 (bvsle from!3004 i!1382))))

(declare-fun b!663800 () Bool)

(declare-fun res!431615 () Bool)

(assert (=> b!663800 (=> (not res!431615) (not e!380806))))

(assert (=> b!663800 (= res!431615 (validKeyInArray!0 k!2843))))

(declare-fun b!663801 () Bool)

(declare-fun res!431612 () Bool)

(assert (=> b!663801 (=> (not res!431612) (not e!380806))))

(assert (=> b!663801 (= res!431612 e!380810)))

(declare-fun res!431603 () Bool)

(assert (=> b!663801 (=> res!431603 e!380810)))

(declare-fun e!380805 () Bool)

(assert (=> b!663801 (= res!431603 e!380805)))

(declare-fun res!431604 () Bool)

(assert (=> b!663801 (=> (not res!431604) (not e!380805))))

(assert (=> b!663801 (= res!431604 (bvsgt from!3004 i!1382))))

(declare-fun b!663802 () Bool)

(declare-fun res!431614 () Bool)

(assert (=> b!663802 (=> (not res!431614) (not e!380806))))

(assert (=> b!663802 (= res!431614 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663803 () Bool)

(assert (=> b!663803 (= e!380805 (contains!3295 acc!681 k!2843))))

(assert (= (and start!59922 res!431609) b!663787))

(assert (= (and b!663787 res!431606) b!663796))

(assert (= (and b!663796 res!431610) b!663788))

(assert (= (and b!663788 res!431607) b!663801))

(assert (= (and b!663801 res!431604) b!663803))

(assert (= (and b!663801 (not res!431603)) b!663795))

(assert (= (and b!663795 res!431613) b!663786))

(assert (= (and b!663801 res!431612) b!663797))

(assert (= (and b!663797 res!431608) b!663794))

(assert (= (and b!663794 res!431602) b!663798))

(assert (= (and b!663798 res!431611) b!663800))

(assert (= (and b!663800 res!431615) b!663802))

(assert (= (and b!663802 res!431614) b!663789))

(assert (= (and b!663789 res!431605) b!663790))

(assert (= (and b!663790 c!76460) b!663793))

(assert (= (and b!663790 (not c!76460)) b!663791))

(assert (= (and b!663790 c!76459) b!663799))

(assert (= (and b!663790 (not c!76459)) b!663792))

(declare-fun m!635269 () Bool)

(assert (=> b!663796 m!635269))

(declare-fun m!635271 () Bool)

(assert (=> b!663787 m!635271))

(declare-fun m!635273 () Bool)

(assert (=> start!59922 m!635273))

(declare-fun m!635275 () Bool)

(assert (=> b!663788 m!635275))

(declare-fun m!635277 () Bool)

(assert (=> b!663799 m!635277))

(declare-fun m!635279 () Bool)

(assert (=> b!663799 m!635279))

(declare-fun m!635281 () Bool)

(assert (=> b!663799 m!635281))

(declare-fun m!635283 () Bool)

(assert (=> b!663799 m!635283))

(assert (=> b!663799 m!635279))

(assert (=> b!663799 m!635281))

(declare-fun m!635285 () Bool)

(assert (=> b!663799 m!635285))

(declare-fun m!635287 () Bool)

(assert (=> b!663799 m!635287))

(declare-fun m!635289 () Bool)

(assert (=> b!663793 m!635289))

(assert (=> b!663790 m!635279))

(declare-fun m!635291 () Bool)

(assert (=> b!663790 m!635291))

(declare-fun m!635293 () Bool)

(assert (=> b!663790 m!635293))

(assert (=> b!663790 m!635279))

(declare-fun m!635295 () Bool)

(assert (=> b!663790 m!635295))

(declare-fun m!635297 () Bool)

(assert (=> b!663790 m!635297))

(declare-fun m!635299 () Bool)

(assert (=> b!663797 m!635299))

(declare-fun m!635301 () Bool)

(assert (=> b!663803 m!635301))

(assert (=> b!663786 m!635301))

(declare-fun m!635303 () Bool)

(assert (=> b!663802 m!635303))

(declare-fun m!635305 () Bool)

(assert (=> b!663800 m!635305))

(declare-fun m!635307 () Bool)

(assert (=> b!663794 m!635307))

(push 1)

(assert (not b!663788))

(assert (not b!663793))

(assert (not b!663803))

(assert (not start!59922))

(assert (not b!663787))

(assert (not b!663802))

(assert (not b!663796))

(assert (not b!663799))

(assert (not b!663800))

(assert (not b!663790))

(assert (not b!663786))

(assert (not b!663794))

(assert (not b!663797))

(check-sat)

(pop 1)

