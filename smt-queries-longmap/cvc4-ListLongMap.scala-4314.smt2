; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59916 () Bool)

(assert start!59916)

(declare-fun b!663624 () Bool)

(declare-fun e!380742 () Bool)

(declare-datatypes ((List!12715 0))(
  ( (Nil!12712) (Cons!12711 (h!13756 (_ BitVec 64)) (t!18943 List!12715)) )
))
(declare-fun acc!681 () List!12715)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3292 (List!12715 (_ BitVec 64)) Bool)

(assert (=> b!663624 (= e!380742 (not (contains!3292 acc!681 k!2843)))))

(declare-fun res!431484 () Bool)

(declare-fun e!380746 () Bool)

(assert (=> start!59916 (=> (not res!431484) (not e!380746))))

(declare-datatypes ((array!38963 0))(
  ( (array!38964 (arr!18674 (Array (_ BitVec 32) (_ BitVec 64))) (size!19038 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38963)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59916 (= res!431484 (and (bvslt (size!19038 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19038 a!3626))))))

(assert (=> start!59916 e!380746))

(assert (=> start!59916 true))

(declare-fun array_inv!14470 (array!38963) Bool)

(assert (=> start!59916 (array_inv!14470 a!3626)))

(declare-fun b!663625 () Bool)

(declare-fun res!431483 () Bool)

(assert (=> b!663625 (=> (not res!431483) (not e!380746))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663625 (= res!431483 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19038 a!3626))))))

(declare-fun b!663626 () Bool)

(declare-datatypes ((Unit!23095 0))(
  ( (Unit!23096) )
))
(declare-fun e!380745 () Unit!23095)

(declare-fun lt!309336 () Unit!23095)

(assert (=> b!663626 (= e!380745 lt!309336)))

(declare-fun lt!309339 () Unit!23095)

(declare-fun lemmaListSubSeqRefl!0 (List!12715) Unit!23095)

(assert (=> b!663626 (= lt!309339 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!31 (List!12715 List!12715) Bool)

(assert (=> b!663626 (subseq!31 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38963 List!12715 List!12715 (_ BitVec 32)) Unit!23095)

(declare-fun $colon$colon!163 (List!12715 (_ BitVec 64)) List!12715)

(assert (=> b!663626 (= lt!309336 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!163 acc!681 (select (arr!18674 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38963 (_ BitVec 32) List!12715) Bool)

(assert (=> b!663626 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663627 () Bool)

(declare-fun res!431478 () Bool)

(assert (=> b!663627 (=> (not res!431478) (not e!380746))))

(declare-fun arrayContainsKey!0 (array!38963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663627 (= res!431478 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663628 () Bool)

(assert (=> b!663628 (= e!380746 (not true))))

(declare-fun lt!309337 () Unit!23095)

(assert (=> b!663628 (= lt!309337 e!380745)))

(declare-fun c!76442 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663628 (= c!76442 (validKeyInArray!0 (select (arr!18674 a!3626) from!3004)))))

(declare-fun lt!309340 () Unit!23095)

(declare-fun e!380747 () Unit!23095)

(assert (=> b!663628 (= lt!309340 e!380747)))

(declare-fun c!76441 () Bool)

(assert (=> b!663628 (= c!76441 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663628 (arrayContainsKey!0 (array!38964 (store (arr!18674 a!3626) i!1382 k!2843) (size!19038 a!3626)) k!2843 from!3004)))

(declare-fun b!663629 () Bool)

(declare-fun e!380743 () Bool)

(assert (=> b!663629 (= e!380743 (contains!3292 acc!681 k!2843))))

(declare-fun b!663630 () Bool)

(declare-fun res!431480 () Bool)

(assert (=> b!663630 (=> (not res!431480) (not e!380746))))

(assert (=> b!663630 (= res!431480 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663631 () Bool)

(declare-fun res!431482 () Bool)

(assert (=> b!663631 (=> (not res!431482) (not e!380746))))

(declare-fun e!380748 () Bool)

(assert (=> b!663631 (= res!431482 e!380748)))

(declare-fun res!431479 () Bool)

(assert (=> b!663631 (=> res!431479 e!380748)))

(assert (=> b!663631 (= res!431479 e!380743)))

(declare-fun res!431488 () Bool)

(assert (=> b!663631 (=> (not res!431488) (not e!380743))))

(assert (=> b!663631 (= res!431488 (bvsgt from!3004 i!1382))))

(declare-fun b!663632 () Bool)

(declare-fun res!431476 () Bool)

(assert (=> b!663632 (=> (not res!431476) (not e!380746))))

(assert (=> b!663632 (= res!431476 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12712))))

(declare-fun b!663633 () Bool)

(declare-fun res!431487 () Bool)

(assert (=> b!663633 (=> (not res!431487) (not e!380746))))

(assert (=> b!663633 (= res!431487 (not (contains!3292 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663634 () Bool)

(assert (=> b!663634 (= e!380748 e!380742)))

(declare-fun res!431486 () Bool)

(assert (=> b!663634 (=> (not res!431486) (not e!380742))))

(assert (=> b!663634 (= res!431486 (bvsle from!3004 i!1382))))

(declare-fun b!663635 () Bool)

(declare-fun Unit!23097 () Unit!23095)

(assert (=> b!663635 (= e!380747 Unit!23097)))

(declare-fun lt!309338 () Unit!23095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38963 (_ BitVec 64) (_ BitVec 32)) Unit!23095)

(assert (=> b!663635 (= lt!309338 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663635 false))

(declare-fun b!663636 () Bool)

(declare-fun res!431481 () Bool)

(assert (=> b!663636 (=> (not res!431481) (not e!380746))))

(assert (=> b!663636 (= res!431481 (not (contains!3292 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663637 () Bool)

(declare-fun Unit!23098 () Unit!23095)

(assert (=> b!663637 (= e!380747 Unit!23098)))

(declare-fun b!663638 () Bool)

(declare-fun res!431485 () Bool)

(assert (=> b!663638 (=> (not res!431485) (not e!380746))))

(assert (=> b!663638 (= res!431485 (validKeyInArray!0 k!2843))))

(declare-fun b!663639 () Bool)

(declare-fun res!431477 () Bool)

(assert (=> b!663639 (=> (not res!431477) (not e!380746))))

(assert (=> b!663639 (= res!431477 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19038 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663640 () Bool)

(declare-fun res!431489 () Bool)

(assert (=> b!663640 (=> (not res!431489) (not e!380746))))

(declare-fun noDuplicate!539 (List!12715) Bool)

(assert (=> b!663640 (= res!431489 (noDuplicate!539 acc!681))))

(declare-fun b!663641 () Bool)

(declare-fun Unit!23099 () Unit!23095)

(assert (=> b!663641 (= e!380745 Unit!23099)))

(assert (= (and start!59916 res!431484) b!663640))

(assert (= (and b!663640 res!431489) b!663636))

(assert (= (and b!663636 res!431481) b!663633))

(assert (= (and b!663633 res!431487) b!663631))

(assert (= (and b!663631 res!431488) b!663629))

(assert (= (and b!663631 (not res!431479)) b!663634))

(assert (= (and b!663634 res!431486) b!663624))

(assert (= (and b!663631 res!431482) b!663632))

(assert (= (and b!663632 res!431476) b!663630))

(assert (= (and b!663630 res!431480) b!663625))

(assert (= (and b!663625 res!431483) b!663638))

(assert (= (and b!663638 res!431485) b!663627))

(assert (= (and b!663627 res!431478) b!663639))

(assert (= (and b!663639 res!431477) b!663628))

(assert (= (and b!663628 c!76441) b!663635))

(assert (= (and b!663628 (not c!76441)) b!663637))

(assert (= (and b!663628 c!76442) b!663626))

(assert (= (and b!663628 (not c!76442)) b!663641))

(declare-fun m!635149 () Bool)

(assert (=> b!663636 m!635149))

(declare-fun m!635151 () Bool)

(assert (=> b!663629 m!635151))

(assert (=> b!663624 m!635151))

(declare-fun m!635153 () Bool)

(assert (=> b!663630 m!635153))

(declare-fun m!635155 () Bool)

(assert (=> b!663626 m!635155))

(declare-fun m!635157 () Bool)

(assert (=> b!663626 m!635157))

(declare-fun m!635159 () Bool)

(assert (=> b!663626 m!635159))

(declare-fun m!635161 () Bool)

(assert (=> b!663626 m!635161))

(assert (=> b!663626 m!635157))

(assert (=> b!663626 m!635159))

(declare-fun m!635163 () Bool)

(assert (=> b!663626 m!635163))

(declare-fun m!635165 () Bool)

(assert (=> b!663626 m!635165))

(declare-fun m!635167 () Bool)

(assert (=> b!663627 m!635167))

(declare-fun m!635169 () Bool)

(assert (=> b!663635 m!635169))

(declare-fun m!635171 () Bool)

(assert (=> b!663638 m!635171))

(declare-fun m!635173 () Bool)

(assert (=> start!59916 m!635173))

(declare-fun m!635175 () Bool)

(assert (=> b!663632 m!635175))

(declare-fun m!635177 () Bool)

(assert (=> b!663640 m!635177))

(assert (=> b!663628 m!635157))

(declare-fun m!635179 () Bool)

(assert (=> b!663628 m!635179))

(declare-fun m!635181 () Bool)

(assert (=> b!663628 m!635181))

(assert (=> b!663628 m!635157))

(declare-fun m!635183 () Bool)

(assert (=> b!663628 m!635183))

(declare-fun m!635185 () Bool)

(assert (=> b!663628 m!635185))

(declare-fun m!635187 () Bool)

(assert (=> b!663633 m!635187))

(push 1)

(assert (not b!663629))

(assert (not b!663636))

(assert (not b!663640))

(assert (not b!663630))

(assert (not b!663638))

(assert (not b!663624))

(assert (not b!663633))

(assert (not b!663632))

(assert (not b!663635))

(assert (not b!663626))

(assert (not b!663627))

(assert (not b!663628))

