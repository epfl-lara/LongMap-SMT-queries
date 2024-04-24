; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62284 () Bool)

(assert start!62284)

(declare-fun b!697589 () Bool)

(declare-fun e!396563 () Bool)

(declare-fun e!396561 () Bool)

(assert (=> b!697589 (= e!396563 e!396561)))

(declare-fun res!461404 () Bool)

(assert (=> b!697589 (=> (not res!461404) (not e!396561))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697589 (= res!461404 (bvsle from!3004 i!1382))))

(declare-fun b!697590 () Bool)

(declare-fun e!396562 () Bool)

(declare-datatypes ((List!13094 0))(
  ( (Nil!13091) (Cons!13090 (h!14138 (_ BitVec 64)) (t!19368 List!13094)) )
))
(declare-fun acc!681 () List!13094)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3746 (List!13094 (_ BitVec 64)) Bool)

(assert (=> b!697590 (= e!396562 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!697591 () Bool)

(declare-fun res!461412 () Bool)

(declare-fun e!396559 () Bool)

(assert (=> b!697591 (=> (not res!461412) (not e!396559))))

(declare-datatypes ((array!39979 0))(
  ( (array!39980 (arr!19146 (Array (_ BitVec 32) (_ BitVec 64))) (size!19529 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39979)

(assert (=> b!697591 (= res!461412 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19529 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697592 () Bool)

(declare-fun res!461415 () Bool)

(assert (=> b!697592 (=> (not res!461415) (not e!396559))))

(declare-fun arrayNoDuplicates!0 (array!39979 (_ BitVec 32) List!13094) Bool)

(assert (=> b!697592 (= res!461415 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun res!461409 () Bool)

(assert (=> start!62284 (=> (not res!461409) (not e!396559))))

(assert (=> start!62284 (= res!461409 (and (bvslt (size!19529 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19529 a!3626))))))

(assert (=> start!62284 e!396559))

(assert (=> start!62284 true))

(declare-fun array_inv!15005 (array!39979) Bool)

(assert (=> start!62284 (array_inv!15005 a!3626)))

(declare-fun b!697593 () Bool)

(declare-fun res!461406 () Bool)

(assert (=> b!697593 (=> (not res!461406) (not e!396559))))

(assert (=> b!697593 (= res!461406 e!396563)))

(declare-fun res!461399 () Bool)

(assert (=> b!697593 (=> res!461399 e!396563)))

(declare-fun e!396564 () Bool)

(assert (=> b!697593 (= res!461399 e!396564)))

(declare-fun res!461405 () Bool)

(assert (=> b!697593 (=> (not res!461405) (not e!396564))))

(assert (=> b!697593 (= res!461405 (bvsgt from!3004 i!1382))))

(declare-fun b!697594 () Bool)

(declare-fun e!396560 () Bool)

(assert (=> b!697594 (= e!396560 e!396562)))

(declare-fun res!461398 () Bool)

(assert (=> b!697594 (=> (not res!461398) (not e!396562))))

(assert (=> b!697594 (= res!461398 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697595 () Bool)

(declare-fun res!461396 () Bool)

(assert (=> b!697595 (=> (not res!461396) (not e!396559))))

(assert (=> b!697595 (= res!461396 (not (contains!3746 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697596 () Bool)

(assert (=> b!697596 (= e!396561 (not (contains!3746 acc!681 k!2843)))))

(declare-fun b!697597 () Bool)

(declare-fun res!461414 () Bool)

(assert (=> b!697597 (=> (not res!461414) (not e!396559))))

(assert (=> b!697597 (= res!461414 e!396560)))

(declare-fun res!461401 () Bool)

(assert (=> b!697597 (=> res!461401 e!396560)))

(declare-fun e!396557 () Bool)

(assert (=> b!697597 (= res!461401 e!396557)))

(declare-fun res!461400 () Bool)

(assert (=> b!697597 (=> (not res!461400) (not e!396557))))

(assert (=> b!697597 (= res!461400 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697598 () Bool)

(declare-fun res!461402 () Bool)

(assert (=> b!697598 (=> (not res!461402) (not e!396559))))

(declare-fun noDuplicate!1020 (List!13094) Bool)

(assert (=> b!697598 (= res!461402 (noDuplicate!1020 acc!681))))

(declare-fun b!697599 () Bool)

(assert (=> b!697599 (= e!396559 (not true))))

(assert (=> b!697599 (arrayNoDuplicates!0 (array!39980 (store (arr!19146 a!3626) i!1382 k!2843) (size!19529 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!24553 0))(
  ( (Unit!24554) )
))
(declare-fun lt!317248 () Unit!24553)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13094) Unit!24553)

(assert (=> b!697599 (= lt!317248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697600 () Bool)

(declare-fun res!461410 () Bool)

(assert (=> b!697600 (=> (not res!461410) (not e!396559))))

(assert (=> b!697600 (= res!461410 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697601 () Bool)

(declare-fun res!461416 () Bool)

(assert (=> b!697601 (=> (not res!461416) (not e!396559))))

(declare-fun arrayContainsKey!0 (array!39979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697601 (= res!461416 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697602 () Bool)

(declare-fun res!461397 () Bool)

(assert (=> b!697602 (=> (not res!461397) (not e!396559))))

(assert (=> b!697602 (= res!461397 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19529 a!3626))))))

(declare-fun b!697603 () Bool)

(declare-fun res!461403 () Bool)

(assert (=> b!697603 (=> (not res!461403) (not e!396559))))

(assert (=> b!697603 (= res!461403 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697604 () Bool)

(assert (=> b!697604 (= e!396564 (contains!3746 acc!681 k!2843))))

(declare-fun b!697605 () Bool)

(declare-fun res!461413 () Bool)

(assert (=> b!697605 (=> (not res!461413) (not e!396559))))

(assert (=> b!697605 (= res!461413 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13091))))

(declare-fun b!697606 () Bool)

(declare-fun res!461408 () Bool)

(assert (=> b!697606 (=> (not res!461408) (not e!396559))))

(assert (=> b!697606 (= res!461408 (not (contains!3746 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697607 () Bool)

(assert (=> b!697607 (= e!396557 (contains!3746 acc!681 k!2843))))

(declare-fun b!697608 () Bool)

(declare-fun res!461411 () Bool)

(assert (=> b!697608 (=> (not res!461411) (not e!396559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697608 (= res!461411 (validKeyInArray!0 k!2843))))

(declare-fun b!697609 () Bool)

(declare-fun res!461407 () Bool)

(assert (=> b!697609 (=> (not res!461407) (not e!396559))))

(assert (=> b!697609 (= res!461407 (not (validKeyInArray!0 (select (arr!19146 a!3626) from!3004))))))

(assert (= (and start!62284 res!461409) b!697598))

(assert (= (and b!697598 res!461402) b!697595))

(assert (= (and b!697595 res!461396) b!697606))

(assert (= (and b!697606 res!461408) b!697593))

(assert (= (and b!697593 res!461405) b!697604))

(assert (= (and b!697593 (not res!461399)) b!697589))

(assert (= (and b!697589 res!461404) b!697596))

(assert (= (and b!697593 res!461406) b!697605))

(assert (= (and b!697605 res!461413) b!697600))

(assert (= (and b!697600 res!461410) b!697602))

(assert (= (and b!697602 res!461397) b!697608))

(assert (= (and b!697608 res!461411) b!697601))

(assert (= (and b!697601 res!461416) b!697591))

(assert (= (and b!697591 res!461412) b!697609))

(assert (= (and b!697609 res!461407) b!697603))

(assert (= (and b!697603 res!461403) b!697597))

(assert (= (and b!697597 res!461400) b!697607))

(assert (= (and b!697597 (not res!461401)) b!697594))

(assert (= (and b!697594 res!461398) b!697590))

(assert (= (and b!697597 res!461414) b!697592))

(assert (= (and b!697592 res!461415) b!697599))

(declare-fun m!658513 () Bool)

(assert (=> b!697598 m!658513))

(declare-fun m!658515 () Bool)

(assert (=> b!697596 m!658515))

(declare-fun m!658517 () Bool)

(assert (=> b!697599 m!658517))

(declare-fun m!658519 () Bool)

(assert (=> b!697599 m!658519))

(declare-fun m!658521 () Bool)

(assert (=> b!697599 m!658521))

(declare-fun m!658523 () Bool)

(assert (=> b!697592 m!658523))

(assert (=> b!697590 m!658515))

(declare-fun m!658525 () Bool)

(assert (=> b!697608 m!658525))

(declare-fun m!658527 () Bool)

(assert (=> b!697601 m!658527))

(assert (=> b!697607 m!658515))

(declare-fun m!658529 () Bool)

(assert (=> b!697605 m!658529))

(declare-fun m!658531 () Bool)

(assert (=> start!62284 m!658531))

(assert (=> b!697604 m!658515))

(declare-fun m!658533 () Bool)

(assert (=> b!697600 m!658533))

(declare-fun m!658535 () Bool)

(assert (=> b!697609 m!658535))

(assert (=> b!697609 m!658535))

(declare-fun m!658537 () Bool)

(assert (=> b!697609 m!658537))

(declare-fun m!658539 () Bool)

(assert (=> b!697595 m!658539))

(declare-fun m!658541 () Bool)

(assert (=> b!697606 m!658541))

(push 1)

(assert (not b!697607))

(assert (not start!62284))

(assert (not b!697595))

(assert (not b!697605))

(assert (not b!697599))

(assert (not b!697592))

(assert (not b!697590))

(assert (not b!697601))

(assert (not b!697600))

(assert (not b!697606))

(assert (not b!697609))

(assert (not b!697598))

(assert (not b!697608))

(assert (not b!697596))

(assert (not b!697604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

