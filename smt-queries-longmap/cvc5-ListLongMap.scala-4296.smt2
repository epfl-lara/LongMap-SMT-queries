; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59804 () Bool)

(assert start!59804)

(declare-fun b!660708 () Bool)

(declare-fun res!428774 () Bool)

(declare-fun e!379655 () Bool)

(assert (=> b!660708 (=> (not res!428774) (not e!379655))))

(declare-datatypes ((List!12659 0))(
  ( (Nil!12656) (Cons!12655 (h!13700 (_ BitVec 64)) (t!18887 List!12659)) )
))
(declare-fun acc!681 () List!12659)

(declare-fun contains!3236 (List!12659 (_ BitVec 64)) Bool)

(assert (=> b!660708 (= res!428774 (not (contains!3236 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660709 () Bool)

(declare-fun res!428779 () Bool)

(assert (=> b!660709 (=> (not res!428779) (not e!379655))))

(declare-fun noDuplicate!483 (List!12659) Bool)

(assert (=> b!660709 (= res!428779 (noDuplicate!483 acc!681))))

(declare-fun b!660710 () Bool)

(declare-fun res!428775 () Bool)

(assert (=> b!660710 (=> (not res!428775) (not e!379655))))

(assert (=> b!660710 (= res!428775 (not (contains!3236 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428780 () Bool)

(assert (=> start!59804 (=> (not res!428780) (not e!379655))))

(declare-datatypes ((array!38851 0))(
  ( (array!38852 (arr!18618 (Array (_ BitVec 32) (_ BitVec 64))) (size!18982 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38851)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59804 (= res!428780 (and (bvslt (size!18982 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18982 a!3626))))))

(assert (=> start!59804 e!379655))

(assert (=> start!59804 true))

(declare-fun array_inv!14414 (array!38851) Bool)

(assert (=> start!59804 (array_inv!14414 a!3626)))

(declare-fun b!660711 () Bool)

(declare-fun e!379653 () Bool)

(declare-fun e!379654 () Bool)

(assert (=> b!660711 (= e!379653 e!379654)))

(declare-fun res!428778 () Bool)

(assert (=> b!660711 (=> (not res!428778) (not e!379654))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660711 (= res!428778 (bvsle from!3004 i!1382))))

(declare-fun b!660712 () Bool)

(declare-fun res!428773 () Bool)

(assert (=> b!660712 (=> (not res!428773) (not e!379655))))

(assert (=> b!660712 (= res!428773 e!379653)))

(declare-fun res!428772 () Bool)

(assert (=> b!660712 (=> res!428772 e!379653)))

(declare-fun e!379656 () Bool)

(assert (=> b!660712 (= res!428772 e!379656)))

(declare-fun res!428777 () Bool)

(assert (=> b!660712 (=> (not res!428777) (not e!379656))))

(assert (=> b!660712 (= res!428777 (bvsgt from!3004 i!1382))))

(declare-fun b!660713 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660713 (= e!379656 (contains!3236 acc!681 k!2843))))

(declare-fun b!660714 () Bool)

(assert (=> b!660714 (= e!379654 (not (contains!3236 acc!681 k!2843)))))

(declare-fun b!660715 () Bool)

(assert (=> b!660715 (= e!379655 false)))

(declare-fun lt!308803 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38851 (_ BitVec 32) List!12659) Bool)

(assert (=> b!660715 (= lt!308803 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660716 () Bool)

(declare-fun res!428776 () Bool)

(assert (=> b!660716 (=> (not res!428776) (not e!379655))))

(assert (=> b!660716 (= res!428776 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12656))))

(assert (= (and start!59804 res!428780) b!660709))

(assert (= (and b!660709 res!428779) b!660710))

(assert (= (and b!660710 res!428775) b!660708))

(assert (= (and b!660708 res!428774) b!660712))

(assert (= (and b!660712 res!428777) b!660713))

(assert (= (and b!660712 (not res!428772)) b!660711))

(assert (= (and b!660711 res!428778) b!660714))

(assert (= (and b!660712 res!428773) b!660716))

(assert (= (and b!660716 res!428776) b!660715))

(declare-fun m!633251 () Bool)

(assert (=> b!660715 m!633251))

(declare-fun m!633253 () Bool)

(assert (=> b!660710 m!633253))

(declare-fun m!633255 () Bool)

(assert (=> b!660716 m!633255))

(declare-fun m!633257 () Bool)

(assert (=> b!660708 m!633257))

(declare-fun m!633259 () Bool)

(assert (=> start!59804 m!633259))

(declare-fun m!633261 () Bool)

(assert (=> b!660709 m!633261))

(declare-fun m!633263 () Bool)

(assert (=> b!660714 m!633263))

(assert (=> b!660713 m!633263))

(push 1)

(assert (not b!660714))

(assert (not start!59804))

(assert (not b!660710))

(assert (not b!660715))

(assert (not b!660709))

(assert (not b!660716))

(assert (not b!660713))

(assert (not b!660708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

