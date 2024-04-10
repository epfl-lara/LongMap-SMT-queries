; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60974 () Bool)

(assert start!60974)

(declare-fun b!683630 () Bool)

(declare-datatypes ((Unit!24027 0))(
  ( (Unit!24028) )
))
(declare-fun e!389457 () Unit!24027)

(declare-fun Unit!24029 () Unit!24027)

(assert (=> b!683630 (= e!389457 Unit!24029)))

(declare-fun b!683631 () Bool)

(declare-fun res!449366 () Bool)

(declare-fun e!389460 () Bool)

(assert (=> b!683631 (=> (not res!449366) (not e!389460))))

(declare-datatypes ((array!39583 0))(
  ( (array!39584 (arr!18972 (Array (_ BitVec 32) (_ BitVec 64))) (size!19339 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39583)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13013 0))(
  ( (Nil!13010) (Cons!13009 (h!14054 (_ BitVec 64)) (t!19259 List!13013)) )
))
(declare-fun acc!681 () List!13013)

(declare-fun arrayNoDuplicates!0 (array!39583 (_ BitVec 32) List!13013) Bool)

(assert (=> b!683631 (= res!449366 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683633 () Bool)

(declare-fun e!389454 () Bool)

(assert (=> b!683633 (= e!389460 (not e!389454))))

(declare-fun res!449357 () Bool)

(assert (=> b!683633 (=> res!449357 e!389454)))

(assert (=> b!683633 (= res!449357 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313958 () List!13013)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun -!141 (List!13013 (_ BitVec 64)) List!13013)

(assert (=> b!683633 (= (-!141 lt!313958 k!2843) acc!681)))

(declare-fun $colon$colon!341 (List!13013 (_ BitVec 64)) List!13013)

(assert (=> b!683633 (= lt!313958 ($colon$colon!341 acc!681 k!2843))))

(declare-fun lt!313960 () Unit!24027)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13013) Unit!24027)

(assert (=> b!683633 (= lt!313960 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!176 (List!13013 List!13013) Bool)

(assert (=> b!683633 (subseq!176 acc!681 acc!681)))

(declare-fun lt!313956 () Unit!24027)

(declare-fun lemmaListSubSeqRefl!0 (List!13013) Unit!24027)

(assert (=> b!683633 (= lt!313956 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683633 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313955 () Unit!24027)

(assert (=> b!683633 (= lt!313955 e!389457)))

(declare-fun c!77506 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683633 (= c!77506 (validKeyInArray!0 (select (arr!18972 a!3626) from!3004)))))

(declare-fun lt!313959 () Unit!24027)

(declare-fun e!389453 () Unit!24027)

(assert (=> b!683633 (= lt!313959 e!389453)))

(declare-fun c!77507 () Bool)

(declare-fun arrayContainsKey!0 (array!39583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683633 (= c!77507 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683633 (arrayContainsKey!0 (array!39584 (store (arr!18972 a!3626) i!1382 k!2843) (size!19339 a!3626)) k!2843 from!3004)))

(declare-fun b!683634 () Bool)

(declare-fun Unit!24030 () Unit!24027)

(assert (=> b!683634 (= e!389453 Unit!24030)))

(declare-fun lt!313957 () Unit!24027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39583 (_ BitVec 64) (_ BitVec 32)) Unit!24027)

(assert (=> b!683634 (= lt!313957 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683634 false))

(declare-fun b!683635 () Bool)

(declare-fun e!389455 () Bool)

(declare-fun contains!3590 (List!13013 (_ BitVec 64)) Bool)

(assert (=> b!683635 (= e!389455 (contains!3590 acc!681 k!2843))))

(declare-fun b!683636 () Bool)

(declare-fun res!449360 () Bool)

(assert (=> b!683636 (=> (not res!449360) (not e!389460))))

(declare-fun e!389458 () Bool)

(assert (=> b!683636 (= res!449360 e!389458)))

(declare-fun res!449361 () Bool)

(assert (=> b!683636 (=> res!449361 e!389458)))

(assert (=> b!683636 (= res!449361 e!389455)))

(declare-fun res!449359 () Bool)

(assert (=> b!683636 (=> (not res!449359) (not e!389455))))

(assert (=> b!683636 (= res!449359 (bvsgt from!3004 i!1382))))

(declare-fun b!683637 () Bool)

(declare-fun e!389456 () Bool)

(assert (=> b!683637 (= e!389458 e!389456)))

(declare-fun res!449352 () Bool)

(assert (=> b!683637 (=> (not res!449352) (not e!389456))))

(assert (=> b!683637 (= res!449352 (bvsle from!3004 i!1382))))

(declare-fun b!683638 () Bool)

(assert (=> b!683638 (= e!389456 (not (contains!3590 acc!681 k!2843)))))

(declare-fun b!683639 () Bool)

(declare-fun res!449358 () Bool)

(assert (=> b!683639 (=> (not res!449358) (not e!389460))))

(declare-fun noDuplicate!837 (List!13013) Bool)

(assert (=> b!683639 (= res!449358 (noDuplicate!837 acc!681))))

(declare-fun b!683640 () Bool)

(declare-fun res!449365 () Bool)

(assert (=> b!683640 (=> (not res!449365) (not e!389460))))

(assert (=> b!683640 (= res!449365 (not (contains!3590 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683641 () Bool)

(declare-fun res!449362 () Bool)

(assert (=> b!683641 (=> (not res!449362) (not e!389460))))

(assert (=> b!683641 (= res!449362 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19339 a!3626))))))

(declare-fun b!683642 () Bool)

(declare-fun res!449364 () Bool)

(assert (=> b!683642 (=> (not res!449364) (not e!389460))))

(assert (=> b!683642 (= res!449364 (validKeyInArray!0 k!2843))))

(declare-fun b!683643 () Bool)

(declare-fun res!449354 () Bool)

(assert (=> b!683643 (=> (not res!449354) (not e!389460))))

(assert (=> b!683643 (= res!449354 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13010))))

(declare-fun b!683644 () Bool)

(declare-fun res!449356 () Bool)

(assert (=> b!683644 (=> (not res!449356) (not e!389460))))

(assert (=> b!683644 (= res!449356 (not (contains!3590 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!449353 () Bool)

(assert (=> start!60974 (=> (not res!449353) (not e!389460))))

(assert (=> start!60974 (= res!449353 (and (bvslt (size!19339 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19339 a!3626))))))

(assert (=> start!60974 e!389460))

(assert (=> start!60974 true))

(declare-fun array_inv!14768 (array!39583) Bool)

(assert (=> start!60974 (array_inv!14768 a!3626)))

(declare-fun b!683632 () Bool)

(assert (=> b!683632 (= e!389454 true)))

(declare-fun lt!313953 () Bool)

(assert (=> b!683632 (= lt!313953 (noDuplicate!837 lt!313958))))

(declare-fun b!683645 () Bool)

(declare-fun Unit!24031 () Unit!24027)

(assert (=> b!683645 (= e!389453 Unit!24031)))

(declare-fun b!683646 () Bool)

(declare-fun res!449355 () Bool)

(assert (=> b!683646 (=> (not res!449355) (not e!389460))))

(assert (=> b!683646 (= res!449355 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19339 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683647 () Bool)

(declare-fun res!449363 () Bool)

(assert (=> b!683647 (=> (not res!449363) (not e!389460))))

(assert (=> b!683647 (= res!449363 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683648 () Bool)

(declare-fun lt!313954 () Unit!24027)

(assert (=> b!683648 (= e!389457 lt!313954)))

(declare-fun lt!313952 () Unit!24027)

(assert (=> b!683648 (= lt!313952 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683648 (subseq!176 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39583 List!13013 List!13013 (_ BitVec 32)) Unit!24027)

(assert (=> b!683648 (= lt!313954 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!341 acc!681 (select (arr!18972 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683648 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60974 res!449353) b!683639))

(assert (= (and b!683639 res!449358) b!683644))

(assert (= (and b!683644 res!449356) b!683640))

(assert (= (and b!683640 res!449365) b!683636))

(assert (= (and b!683636 res!449359) b!683635))

(assert (= (and b!683636 (not res!449361)) b!683637))

(assert (= (and b!683637 res!449352) b!683638))

(assert (= (and b!683636 res!449360) b!683643))

(assert (= (and b!683643 res!449354) b!683631))

(assert (= (and b!683631 res!449366) b!683641))

(assert (= (and b!683641 res!449362) b!683642))

(assert (= (and b!683642 res!449364) b!683647))

(assert (= (and b!683647 res!449363) b!683646))

(assert (= (and b!683646 res!449355) b!683633))

(assert (= (and b!683633 c!77507) b!683634))

(assert (= (and b!683633 (not c!77507)) b!683645))

(assert (= (and b!683633 c!77506) b!683648))

(assert (= (and b!683633 (not c!77506)) b!683630))

(assert (= (and b!683633 (not res!449357)) b!683632))

(declare-fun m!648161 () Bool)

(assert (=> b!683638 m!648161))

(declare-fun m!648163 () Bool)

(assert (=> start!60974 m!648163))

(declare-fun m!648165 () Bool)

(assert (=> b!683639 m!648165))

(declare-fun m!648167 () Bool)

(assert (=> b!683634 m!648167))

(declare-fun m!648169 () Bool)

(assert (=> b!683631 m!648169))

(declare-fun m!648171 () Bool)

(assert (=> b!683632 m!648171))

(declare-fun m!648173 () Bool)

(assert (=> b!683647 m!648173))

(declare-fun m!648175 () Bool)

(assert (=> b!683644 m!648175))

(declare-fun m!648177 () Bool)

(assert (=> b!683633 m!648177))

(declare-fun m!648179 () Bool)

(assert (=> b!683633 m!648179))

(declare-fun m!648181 () Bool)

(assert (=> b!683633 m!648181))

(declare-fun m!648183 () Bool)

(assert (=> b!683633 m!648183))

(declare-fun m!648185 () Bool)

(assert (=> b!683633 m!648185))

(declare-fun m!648187 () Bool)

(assert (=> b!683633 m!648187))

(declare-fun m!648189 () Bool)

(assert (=> b!683633 m!648189))

(declare-fun m!648191 () Bool)

(assert (=> b!683633 m!648191))

(assert (=> b!683633 m!648181))

(declare-fun m!648193 () Bool)

(assert (=> b!683633 m!648193))

(declare-fun m!648195 () Bool)

(assert (=> b!683633 m!648195))

(declare-fun m!648197 () Bool)

(assert (=> b!683633 m!648197))

(assert (=> b!683635 m!648161))

(declare-fun m!648199 () Bool)

(assert (=> b!683643 m!648199))

(declare-fun m!648201 () Bool)

(assert (=> b!683642 m!648201))

(declare-fun m!648203 () Bool)

(assert (=> b!683640 m!648203))

(assert (=> b!683648 m!648179))

(assert (=> b!683648 m!648181))

(declare-fun m!648205 () Bool)

(assert (=> b!683648 m!648205))

(declare-fun m!648207 () Bool)

(assert (=> b!683648 m!648207))

(assert (=> b!683648 m!648181))

(assert (=> b!683648 m!648205))

(assert (=> b!683648 m!648187))

(assert (=> b!683648 m!648197))

(push 1)

(assert (not b!683633))

(assert (not b!683635))

(assert (not b!683638))

(assert (not b!683632))

(assert (not b!683642))

(assert (not b!683647))

(assert (not b!683643))

(assert (not start!60974))

(assert (not b!683631))

(assert (not b!683640))

(assert (not b!683639))

(assert (not b!683634))

(assert (not b!683648))

(assert (not b!683644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

