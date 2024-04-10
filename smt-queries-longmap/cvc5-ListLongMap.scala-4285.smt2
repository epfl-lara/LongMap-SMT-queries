; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59702 () Bool)

(assert start!59702)

(declare-fun b!659693 () Bool)

(declare-fun e!379032 () Bool)

(assert (=> b!659693 (= e!379032 false)))

(declare-fun lt!308704 () Bool)

(declare-fun e!379029 () Bool)

(assert (=> b!659693 (= lt!308704 e!379029)))

(declare-fun res!427762 () Bool)

(assert (=> b!659693 (=> res!427762 e!379029)))

(declare-fun e!379030 () Bool)

(assert (=> b!659693 (= res!427762 e!379030)))

(declare-fun res!427760 () Bool)

(assert (=> b!659693 (=> (not res!427760) (not e!379030))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659693 (= res!427760 (bvsgt from!3004 i!1382))))

(declare-fun res!427758 () Bool)

(assert (=> start!59702 (=> (not res!427758) (not e!379032))))

(declare-datatypes ((array!38779 0))(
  ( (array!38780 (arr!18585 (Array (_ BitVec 32) (_ BitVec 64))) (size!18949 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38779)

(assert (=> start!59702 (= res!427758 (and (bvslt (size!18949 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18949 a!3626))))))

(assert (=> start!59702 e!379032))

(assert (=> start!59702 true))

(declare-fun array_inv!14381 (array!38779) Bool)

(assert (=> start!59702 (array_inv!14381 a!3626)))

(declare-fun b!659694 () Bool)

(declare-fun res!427759 () Bool)

(assert (=> b!659694 (=> (not res!427759) (not e!379032))))

(declare-datatypes ((List!12626 0))(
  ( (Nil!12623) (Cons!12622 (h!13667 (_ BitVec 64)) (t!18854 List!12626)) )
))
(declare-fun acc!681 () List!12626)

(declare-fun contains!3203 (List!12626 (_ BitVec 64)) Bool)

(assert (=> b!659694 (= res!427759 (not (contains!3203 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659695 () Bool)

(declare-fun e!379031 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659695 (= e!379031 (not (contains!3203 acc!681 k!2843)))))

(declare-fun b!659696 () Bool)

(declare-fun res!427761 () Bool)

(assert (=> b!659696 (=> (not res!427761) (not e!379032))))

(declare-fun noDuplicate!450 (List!12626) Bool)

(assert (=> b!659696 (= res!427761 (noDuplicate!450 acc!681))))

(declare-fun b!659697 () Bool)

(assert (=> b!659697 (= e!379029 e!379031)))

(declare-fun res!427763 () Bool)

(assert (=> b!659697 (=> (not res!427763) (not e!379031))))

(assert (=> b!659697 (= res!427763 (bvsle from!3004 i!1382))))

(declare-fun b!659698 () Bool)

(assert (=> b!659698 (= e!379030 (contains!3203 acc!681 k!2843))))

(declare-fun b!659699 () Bool)

(declare-fun res!427757 () Bool)

(assert (=> b!659699 (=> (not res!427757) (not e!379032))))

(assert (=> b!659699 (= res!427757 (not (contains!3203 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59702 res!427758) b!659696))

(assert (= (and b!659696 res!427761) b!659694))

(assert (= (and b!659694 res!427759) b!659699))

(assert (= (and b!659699 res!427757) b!659693))

(assert (= (and b!659693 res!427760) b!659698))

(assert (= (and b!659693 (not res!427762)) b!659697))

(assert (= (and b!659697 res!427763) b!659695))

(declare-fun m!632657 () Bool)

(assert (=> b!659694 m!632657))

(declare-fun m!632659 () Bool)

(assert (=> start!59702 m!632659))

(declare-fun m!632661 () Bool)

(assert (=> b!659696 m!632661))

(declare-fun m!632663 () Bool)

(assert (=> b!659699 m!632663))

(declare-fun m!632665 () Bool)

(assert (=> b!659698 m!632665))

(assert (=> b!659695 m!632665))

(push 1)

(assert (not b!659696))

(assert (not start!59702))

(assert (not b!659698))

(assert (not b!659695))

(assert (not b!659694))

(assert (not b!659699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

