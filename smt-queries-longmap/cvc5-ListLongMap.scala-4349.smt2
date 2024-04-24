; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60184 () Bool)

(assert start!60184)

(declare-fun res!437737 () Bool)

(declare-fun e!383703 () Bool)

(assert (=> start!60184 (=> (not res!437737) (not e!383703))))

(declare-datatypes ((array!39169 0))(
  ( (array!39170 (arr!18774 (Array (_ BitVec 32) (_ BitVec 64))) (size!19138 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39169)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60184 (= res!437737 (and (bvslt (size!19138 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19138 a!3626))))))

(assert (=> start!60184 e!383703))

(assert (=> start!60184 true))

(declare-fun array_inv!14633 (array!39169) Bool)

(assert (=> start!60184 (array_inv!14633 a!3626)))

(declare-fun b!671147 () Bool)

(declare-fun res!437740 () Bool)

(assert (=> b!671147 (=> (not res!437740) (not e!383703))))

(declare-datatypes ((List!12722 0))(
  ( (Nil!12719) (Cons!12718 (h!13766 (_ BitVec 64)) (t!18942 List!12722)) )
))
(declare-fun arrayNoDuplicates!0 (array!39169 (_ BitVec 32) List!12722) Bool)

(assert (=> b!671147 (= res!437740 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12719))))

(declare-fun b!671148 () Bool)

(declare-fun e!383706 () Bool)

(declare-fun e!383704 () Bool)

(assert (=> b!671148 (= e!383706 e!383704)))

(declare-fun res!437732 () Bool)

(assert (=> b!671148 (=> (not res!437732) (not e!383704))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671148 (= res!437732 (bvsle from!3004 i!1382))))

(declare-fun b!671149 () Bool)

(declare-fun acc!681 () List!12722)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3374 (List!12722 (_ BitVec 64)) Bool)

(assert (=> b!671149 (= e!383704 (not (contains!3374 acc!681 k!2843)))))

(declare-fun b!671150 () Bool)

(declare-fun res!437735 () Bool)

(assert (=> b!671150 (=> (not res!437735) (not e!383703))))

(assert (=> b!671150 (= res!437735 (not (contains!3374 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671151 () Bool)

(declare-fun res!437734 () Bool)

(assert (=> b!671151 (=> (not res!437734) (not e!383703))))

(assert (=> b!671151 (= res!437734 (not (contains!3374 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671152 () Bool)

(declare-fun res!437738 () Bool)

(assert (=> b!671152 (=> (not res!437738) (not e!383703))))

(declare-fun noDuplicate!648 (List!12722) Bool)

(assert (=> b!671152 (= res!437738 (noDuplicate!648 acc!681))))

(declare-fun b!671153 () Bool)

(assert (=> b!671153 (= e!383703 false)))

(declare-fun lt!312268 () Bool)

(assert (=> b!671153 (= lt!312268 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671154 () Bool)

(declare-fun res!437739 () Bool)

(assert (=> b!671154 (=> (not res!437739) (not e!383703))))

(assert (=> b!671154 (= res!437739 e!383706)))

(declare-fun res!437736 () Bool)

(assert (=> b!671154 (=> res!437736 e!383706)))

(declare-fun e!383705 () Bool)

(assert (=> b!671154 (= res!437736 e!383705)))

(declare-fun res!437733 () Bool)

(assert (=> b!671154 (=> (not res!437733) (not e!383705))))

(assert (=> b!671154 (= res!437733 (bvsgt from!3004 i!1382))))

(declare-fun b!671155 () Bool)

(assert (=> b!671155 (= e!383705 (contains!3374 acc!681 k!2843))))

(assert (= (and start!60184 res!437737) b!671152))

(assert (= (and b!671152 res!437738) b!671151))

(assert (= (and b!671151 res!437734) b!671150))

(assert (= (and b!671150 res!437735) b!671154))

(assert (= (and b!671154 res!437733) b!671155))

(assert (= (and b!671154 (not res!437736)) b!671148))

(assert (= (and b!671148 res!437732) b!671149))

(assert (= (and b!671154 res!437739) b!671147))

(assert (= (and b!671147 res!437740) b!671153))

(declare-fun m!641369 () Bool)

(assert (=> b!671151 m!641369))

(declare-fun m!641371 () Bool)

(assert (=> b!671147 m!641371))

(declare-fun m!641373 () Bool)

(assert (=> b!671152 m!641373))

(declare-fun m!641375 () Bool)

(assert (=> b!671153 m!641375))

(declare-fun m!641377 () Bool)

(assert (=> start!60184 m!641377))

(declare-fun m!641379 () Bool)

(assert (=> b!671149 m!641379))

(declare-fun m!641381 () Bool)

(assert (=> b!671150 m!641381))

(assert (=> b!671155 m!641379))

(push 1)

(assert (not b!671147))

(assert (not b!671153))

(assert (not b!671152))

(assert (not b!671150))

(assert (not b!671155))

(assert (not start!60184))

(assert (not b!671149))

(assert (not b!671151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

