; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62202 () Bool)

(assert start!62202)

(declare-fun b!696628 () Bool)

(declare-fun res!460553 () Bool)

(declare-fun e!396132 () Bool)

(assert (=> b!696628 (=> (not res!460553) (not e!396132))))

(declare-datatypes ((List!13180 0))(
  ( (Nil!13177) (Cons!13176 (h!14221 (_ BitVec 64)) (t!19462 List!13180)) )
))
(declare-fun acc!681 () List!13180)

(declare-fun noDuplicate!1004 (List!13180) Bool)

(assert (=> b!696628 (= res!460553 (noDuplicate!1004 acc!681))))

(declare-fun res!460556 () Bool)

(assert (=> start!62202 (=> (not res!460556) (not e!396132))))

(declare-datatypes ((array!39959 0))(
  ( (array!39960 (arr!19139 (Array (_ BitVec 32) (_ BitVec 64))) (size!19524 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39959)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62202 (= res!460556 (and (bvslt (size!19524 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19524 a!3626))))))

(assert (=> start!62202 e!396132))

(assert (=> start!62202 true))

(declare-fun array_inv!14935 (array!39959) Bool)

(assert (=> start!62202 (array_inv!14935 a!3626)))

(declare-fun b!696629 () Bool)

(declare-fun e!396131 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3757 (List!13180 (_ BitVec 64)) Bool)

(assert (=> b!696629 (= e!396131 (not (contains!3757 acc!681 k!2843)))))

(declare-fun b!696630 () Bool)

(declare-fun res!460547 () Bool)

(assert (=> b!696630 (=> (not res!460547) (not e!396132))))

(assert (=> b!696630 (= res!460547 (not (contains!3757 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696631 () Bool)

(declare-fun e!396133 () Bool)

(assert (=> b!696631 (= e!396133 (contains!3757 acc!681 k!2843))))

(declare-fun b!696632 () Bool)

(declare-fun e!396129 () Bool)

(assert (=> b!696632 (= e!396129 (not (contains!3757 acc!681 k!2843)))))

(declare-fun b!696633 () Bool)

(declare-fun res!460555 () Bool)

(assert (=> b!696633 (=> (not res!460555) (not e!396132))))

(assert (=> b!696633 (= res!460555 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696634 () Bool)

(declare-fun e!396134 () Bool)

(assert (=> b!696634 (= e!396134 e!396129)))

(declare-fun res!460564 () Bool)

(assert (=> b!696634 (=> (not res!460564) (not e!396129))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696634 (= res!460564 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696635 () Bool)

(declare-fun e!396130 () Bool)

(assert (=> b!696635 (= e!396130 (contains!3757 acc!681 k!2843))))

(declare-fun b!696636 () Bool)

(declare-fun res!460557 () Bool)

(assert (=> b!696636 (=> (not res!460557) (not e!396132))))

(assert (=> b!696636 (= res!460557 (not (contains!3757 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696637 () Bool)

(declare-fun res!460549 () Bool)

(assert (=> b!696637 (=> (not res!460549) (not e!396132))))

(assert (=> b!696637 (= res!460549 e!396134)))

(declare-fun res!460565 () Bool)

(assert (=> b!696637 (=> res!460565 e!396134)))

(assert (=> b!696637 (= res!460565 e!396133)))

(declare-fun res!460550 () Bool)

(assert (=> b!696637 (=> (not res!460550) (not e!396133))))

(assert (=> b!696637 (= res!460550 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696638 () Bool)

(declare-fun e!396135 () Bool)

(assert (=> b!696638 (= e!396135 e!396131)))

(declare-fun res!460563 () Bool)

(assert (=> b!696638 (=> (not res!460563) (not e!396131))))

(assert (=> b!696638 (= res!460563 (bvsle from!3004 i!1382))))

(declare-fun b!696639 () Bool)

(declare-fun res!460560 () Bool)

(assert (=> b!696639 (=> (not res!460560) (not e!396132))))

(declare-fun arrayNoDuplicates!0 (array!39959 (_ BitVec 32) List!13180) Bool)

(assert (=> b!696639 (= res!460560 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13177))))

(declare-fun b!696640 () Bool)

(declare-fun res!460548 () Bool)

(assert (=> b!696640 (=> (not res!460548) (not e!396132))))

(assert (=> b!696640 (= res!460548 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19524 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696641 () Bool)

(declare-fun res!460562 () Bool)

(assert (=> b!696641 (=> (not res!460562) (not e!396132))))

(assert (=> b!696641 (= res!460562 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19524 a!3626))))))

(declare-fun b!696642 () Bool)

(declare-fun res!460559 () Bool)

(assert (=> b!696642 (=> (not res!460559) (not e!396132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696642 (= res!460559 (validKeyInArray!0 k!2843))))

(declare-fun b!696643 () Bool)

(declare-fun res!460552 () Bool)

(assert (=> b!696643 (=> (not res!460552) (not e!396132))))

(assert (=> b!696643 (= res!460552 e!396135)))

(declare-fun res!460554 () Bool)

(assert (=> b!696643 (=> res!460554 e!396135)))

(assert (=> b!696643 (= res!460554 e!396130)))

(declare-fun res!460558 () Bool)

(assert (=> b!696643 (=> (not res!460558) (not e!396130))))

(assert (=> b!696643 (= res!460558 (bvsgt from!3004 i!1382))))

(declare-fun b!696644 () Bool)

(declare-fun res!460551 () Bool)

(assert (=> b!696644 (=> (not res!460551) (not e!396132))))

(assert (=> b!696644 (= res!460551 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696645 () Bool)

(declare-fun res!460561 () Bool)

(assert (=> b!696645 (=> (not res!460561) (not e!396132))))

(declare-fun arrayContainsKey!0 (array!39959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696645 (= res!460561 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696646 () Bool)

(declare-fun res!460546 () Bool)

(assert (=> b!696646 (=> (not res!460546) (not e!396132))))

(assert (=> b!696646 (= res!460546 (not (validKeyInArray!0 (select (arr!19139 a!3626) from!3004))))))

(declare-fun b!696647 () Bool)

(assert (=> b!696647 (= e!396132 false)))

(declare-fun lt!317119 () Bool)

(assert (=> b!696647 (= lt!317119 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!62202 res!460556) b!696628))

(assert (= (and b!696628 res!460553) b!696630))

(assert (= (and b!696630 res!460547) b!696636))

(assert (= (and b!696636 res!460557) b!696643))

(assert (= (and b!696643 res!460558) b!696635))

(assert (= (and b!696643 (not res!460554)) b!696638))

(assert (= (and b!696638 res!460563) b!696629))

(assert (= (and b!696643 res!460552) b!696639))

(assert (= (and b!696639 res!460560) b!696644))

(assert (= (and b!696644 res!460551) b!696641))

(assert (= (and b!696641 res!460562) b!696642))

(assert (= (and b!696642 res!460559) b!696645))

(assert (= (and b!696645 res!460561) b!696640))

(assert (= (and b!696640 res!460548) b!696646))

(assert (= (and b!696646 res!460546) b!696633))

(assert (= (and b!696633 res!460555) b!696637))

(assert (= (and b!696637 res!460550) b!696631))

(assert (= (and b!696637 (not res!460565)) b!696634))

(assert (= (and b!696634 res!460564) b!696632))

(assert (= (and b!696637 res!460549) b!696647))

(declare-fun m!657515 () Bool)

(assert (=> b!696630 m!657515))

(declare-fun m!657517 () Bool)

(assert (=> b!696646 m!657517))

(assert (=> b!696646 m!657517))

(declare-fun m!657519 () Bool)

(assert (=> b!696646 m!657519))

(declare-fun m!657521 () Bool)

(assert (=> b!696629 m!657521))

(declare-fun m!657523 () Bool)

(assert (=> b!696647 m!657523))

(declare-fun m!657525 () Bool)

(assert (=> b!696642 m!657525))

(assert (=> b!696631 m!657521))

(declare-fun m!657527 () Bool)

(assert (=> start!62202 m!657527))

(declare-fun m!657529 () Bool)

(assert (=> b!696628 m!657529))

(declare-fun m!657531 () Bool)

(assert (=> b!696639 m!657531))

(declare-fun m!657533 () Bool)

(assert (=> b!696644 m!657533))

(declare-fun m!657535 () Bool)

(assert (=> b!696645 m!657535))

(assert (=> b!696632 m!657521))

(assert (=> b!696635 m!657521))

(declare-fun m!657537 () Bool)

(assert (=> b!696636 m!657537))

(push 1)

(assert (not b!696629))

(assert (not b!696632))

(assert (not b!696636))

(assert (not b!696644))

(assert (not start!62202))

(assert (not b!696628))

(assert (not b!696646))

(assert (not b!696647))

(assert (not b!696630))

(assert (not b!696645))

(assert (not b!696635))

(assert (not b!696639))

(assert (not b!696631))

(assert (not b!696642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

