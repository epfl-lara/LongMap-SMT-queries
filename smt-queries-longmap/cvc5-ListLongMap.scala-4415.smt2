; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60972 () Bool)

(assert start!60972)

(declare-fun b!683627 () Bool)

(declare-fun res!449451 () Bool)

(declare-fun e!389387 () Bool)

(assert (=> b!683627 (=> (not res!449451) (not e!389387))))

(declare-datatypes ((array!39592 0))(
  ( (array!39593 (arr!18976 (Array (_ BitVec 32) (_ BitVec 64))) (size!19343 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39592)

(declare-datatypes ((List!13056 0))(
  ( (Nil!13053) (Cons!13052 (h!14097 (_ BitVec 64)) (t!19293 List!13056)) )
))
(declare-fun arrayNoDuplicates!0 (array!39592 (_ BitVec 32) List!13056) Bool)

(assert (=> b!683627 (= res!449451 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13053))))

(declare-fun res!449453 () Bool)

(assert (=> start!60972 (=> (not res!449453) (not e!389387))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60972 (= res!449453 (and (bvslt (size!19343 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19343 a!3626))))))

(assert (=> start!60972 e!389387))

(assert (=> start!60972 true))

(declare-fun array_inv!14859 (array!39592) Bool)

(assert (=> start!60972 (array_inv!14859 a!3626)))

(declare-fun b!683628 () Bool)

(declare-fun e!389388 () Bool)

(declare-fun e!389384 () Bool)

(assert (=> b!683628 (= e!389388 e!389384)))

(declare-fun res!449461 () Bool)

(assert (=> b!683628 (=> (not res!449461) (not e!389384))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683628 (= res!449461 (bvsle from!3004 i!1382))))

(declare-fun b!683629 () Bool)

(declare-fun res!449463 () Bool)

(assert (=> b!683629 (=> (not res!449463) (not e!389387))))

(declare-fun acc!681 () List!13056)

(declare-fun contains!3578 (List!13056 (_ BitVec 64)) Bool)

(assert (=> b!683629 (= res!449463 (not (contains!3578 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683630 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!683630 (= e!389384 (not (contains!3578 acc!681 k!2843)))))

(declare-fun b!683631 () Bool)

(declare-datatypes ((Unit!24030 0))(
  ( (Unit!24031) )
))
(declare-fun e!389386 () Unit!24030)

(declare-fun Unit!24032 () Unit!24030)

(assert (=> b!683631 (= e!389386 Unit!24032)))

(declare-fun b!683632 () Bool)

(declare-fun res!449449 () Bool)

(assert (=> b!683632 (=> (not res!449449) (not e!389387))))

(assert (=> b!683632 (= res!449449 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19343 a!3626))))))

(declare-fun b!683633 () Bool)

(declare-fun res!449455 () Bool)

(assert (=> b!683633 (=> (not res!449455) (not e!389387))))

(declare-fun arrayContainsKey!0 (array!39592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683633 (= res!449455 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683634 () Bool)

(declare-fun res!449457 () Bool)

(assert (=> b!683634 (=> (not res!449457) (not e!389387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683634 (= res!449457 (validKeyInArray!0 k!2843))))

(declare-fun b!683635 () Bool)

(declare-fun res!449456 () Bool)

(declare-fun e!389385 () Bool)

(assert (=> b!683635 (=> res!449456 e!389385)))

(declare-fun lt!313833 () List!13056)

(declare-fun noDuplicate!847 (List!13056) Bool)

(assert (=> b!683635 (= res!449456 (not (noDuplicate!847 lt!313833)))))

(declare-fun b!683636 () Bool)

(declare-fun res!449464 () Bool)

(assert (=> b!683636 (=> (not res!449464) (not e!389387))))

(assert (=> b!683636 (= res!449464 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683637 () Bool)

(declare-fun lt!313831 () Unit!24030)

(assert (=> b!683637 (= e!389386 lt!313831)))

(declare-fun lt!313837 () Unit!24030)

(declare-fun lemmaListSubSeqRefl!0 (List!13056) Unit!24030)

(assert (=> b!683637 (= lt!313837 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!181 (List!13056 List!13056) Bool)

(assert (=> b!683637 (subseq!181 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39592 List!13056 List!13056 (_ BitVec 32)) Unit!24030)

(declare-fun $colon$colon!345 (List!13056 (_ BitVec 64)) List!13056)

(assert (=> b!683637 (= lt!313831 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!345 acc!681 (select (arr!18976 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683637 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683638 () Bool)

(declare-fun lt!313839 () Bool)

(assert (=> b!683638 (= e!389385 (not lt!313839))))

(declare-fun b!683639 () Bool)

(declare-fun res!449450 () Bool)

(assert (=> b!683639 (=> (not res!449450) (not e!389387))))

(assert (=> b!683639 (= res!449450 (noDuplicate!847 acc!681))))

(declare-fun b!683640 () Bool)

(declare-fun e!389383 () Bool)

(assert (=> b!683640 (= e!389383 (contains!3578 acc!681 k!2843))))

(declare-fun b!683641 () Bool)

(declare-fun e!389390 () Unit!24030)

(declare-fun Unit!24033 () Unit!24030)

(assert (=> b!683641 (= e!389390 Unit!24033)))

(declare-fun lt!313834 () Unit!24030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39592 (_ BitVec 64) (_ BitVec 32)) Unit!24030)

(assert (=> b!683641 (= lt!313834 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683641 false))

(declare-fun b!683642 () Bool)

(assert (=> b!683642 (= e!389387 (not e!389385))))

(declare-fun res!449452 () Bool)

(assert (=> b!683642 (=> res!449452 e!389385)))

(assert (=> b!683642 (= res!449452 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!146 (List!13056 (_ BitVec 64)) List!13056)

(assert (=> b!683642 (= (-!146 lt!313833 k!2843) acc!681)))

(assert (=> b!683642 (= lt!313833 ($colon$colon!345 acc!681 k!2843))))

(declare-fun lt!313836 () Unit!24030)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13056) Unit!24030)

(assert (=> b!683642 (= lt!313836 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683642 (subseq!181 acc!681 acc!681)))

(declare-fun lt!313832 () Unit!24030)

(assert (=> b!683642 (= lt!313832 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683642 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313835 () Unit!24030)

(assert (=> b!683642 (= lt!313835 e!389386)))

(declare-fun c!77457 () Bool)

(assert (=> b!683642 (= c!77457 (validKeyInArray!0 (select (arr!18976 a!3626) from!3004)))))

(declare-fun lt!313838 () Unit!24030)

(assert (=> b!683642 (= lt!313838 e!389390)))

(declare-fun c!77456 () Bool)

(assert (=> b!683642 (= c!77456 lt!313839)))

(assert (=> b!683642 (= lt!313839 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683642 (arrayContainsKey!0 (array!39593 (store (arr!18976 a!3626) i!1382 k!2843) (size!19343 a!3626)) k!2843 from!3004)))

(declare-fun b!683643 () Bool)

(declare-fun res!449458 () Bool)

(assert (=> b!683643 (=> (not res!449458) (not e!389387))))

(assert (=> b!683643 (= res!449458 (not (contains!3578 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683644 () Bool)

(declare-fun res!449460 () Bool)

(assert (=> b!683644 (=> (not res!449460) (not e!389387))))

(assert (=> b!683644 (= res!449460 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19343 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683645 () Bool)

(declare-fun Unit!24034 () Unit!24030)

(assert (=> b!683645 (= e!389390 Unit!24034)))

(declare-fun b!683646 () Bool)

(declare-fun res!449462 () Bool)

(assert (=> b!683646 (=> (not res!449462) (not e!389387))))

(assert (=> b!683646 (= res!449462 e!389388)))

(declare-fun res!449454 () Bool)

(assert (=> b!683646 (=> res!449454 e!389388)))

(assert (=> b!683646 (= res!449454 e!389383)))

(declare-fun res!449459 () Bool)

(assert (=> b!683646 (=> (not res!449459) (not e!389383))))

(assert (=> b!683646 (= res!449459 (bvsgt from!3004 i!1382))))

(assert (= (and start!60972 res!449453) b!683639))

(assert (= (and b!683639 res!449450) b!683629))

(assert (= (and b!683629 res!449463) b!683643))

(assert (= (and b!683643 res!449458) b!683646))

(assert (= (and b!683646 res!449459) b!683640))

(assert (= (and b!683646 (not res!449454)) b!683628))

(assert (= (and b!683628 res!449461) b!683630))

(assert (= (and b!683646 res!449462) b!683627))

(assert (= (and b!683627 res!449451) b!683636))

(assert (= (and b!683636 res!449464) b!683632))

(assert (= (and b!683632 res!449449) b!683634))

(assert (= (and b!683634 res!449457) b!683633))

(assert (= (and b!683633 res!449455) b!683644))

(assert (= (and b!683644 res!449460) b!683642))

(assert (= (and b!683642 c!77456) b!683641))

(assert (= (and b!683642 (not c!77456)) b!683645))

(assert (= (and b!683642 c!77457) b!683637))

(assert (= (and b!683642 (not c!77457)) b!683631))

(assert (= (and b!683642 (not res!449452)) b!683635))

(assert (= (and b!683635 (not res!449456)) b!683638))

(declare-fun m!647619 () Bool)

(assert (=> b!683642 m!647619))

(declare-fun m!647621 () Bool)

(assert (=> b!683642 m!647621))

(declare-fun m!647623 () Bool)

(assert (=> b!683642 m!647623))

(declare-fun m!647625 () Bool)

(assert (=> b!683642 m!647625))

(declare-fun m!647627 () Bool)

(assert (=> b!683642 m!647627))

(declare-fun m!647629 () Bool)

(assert (=> b!683642 m!647629))

(declare-fun m!647631 () Bool)

(assert (=> b!683642 m!647631))

(declare-fun m!647633 () Bool)

(assert (=> b!683642 m!647633))

(assert (=> b!683642 m!647621))

(declare-fun m!647635 () Bool)

(assert (=> b!683642 m!647635))

(declare-fun m!647637 () Bool)

(assert (=> b!683642 m!647637))

(declare-fun m!647639 () Bool)

(assert (=> b!683642 m!647639))

(declare-fun m!647641 () Bool)

(assert (=> b!683630 m!647641))

(declare-fun m!647643 () Bool)

(assert (=> b!683633 m!647643))

(declare-fun m!647645 () Bool)

(assert (=> b!683635 m!647645))

(assert (=> b!683637 m!647619))

(assert (=> b!683637 m!647621))

(declare-fun m!647647 () Bool)

(assert (=> b!683637 m!647647))

(declare-fun m!647649 () Bool)

(assert (=> b!683637 m!647649))

(assert (=> b!683637 m!647621))

(assert (=> b!683637 m!647647))

(assert (=> b!683637 m!647629))

(assert (=> b!683637 m!647639))

(declare-fun m!647651 () Bool)

(assert (=> b!683639 m!647651))

(declare-fun m!647653 () Bool)

(assert (=> b!683627 m!647653))

(declare-fun m!647655 () Bool)

(assert (=> b!683634 m!647655))

(declare-fun m!647657 () Bool)

(assert (=> b!683629 m!647657))

(declare-fun m!647659 () Bool)

(assert (=> b!683641 m!647659))

(declare-fun m!647661 () Bool)

(assert (=> start!60972 m!647661))

(declare-fun m!647663 () Bool)

(assert (=> b!683643 m!647663))

(assert (=> b!683640 m!647641))

(declare-fun m!647665 () Bool)

(assert (=> b!683636 m!647665))

(push 1)

(assert (not b!683636))

(assert (not b!683643))

(assert (not b!683627))

(assert (not b!683633))

(assert (not b!683635))

(assert (not b!683637))

(assert (not b!683642))

(assert (not b!683629))

(assert (not start!60972))

(assert (not b!683630))

(assert (not b!683634))

(assert (not b!683640))

(assert (not b!683641))

(assert (not b!683639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

