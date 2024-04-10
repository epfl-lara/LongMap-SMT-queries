; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59808 () Bool)

(assert start!59808)

(declare-fun b!660762 () Bool)

(declare-fun e!379686 () Bool)

(declare-datatypes ((List!12661 0))(
  ( (Nil!12658) (Cons!12657 (h!13702 (_ BitVec 64)) (t!18889 List!12661)) )
))
(declare-fun acc!681 () List!12661)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3238 (List!12661 (_ BitVec 64)) Bool)

(assert (=> b!660762 (= e!379686 (not (contains!3238 acc!681 k!2843)))))

(declare-fun b!660763 () Bool)

(declare-fun res!428827 () Bool)

(declare-fun e!379685 () Bool)

(assert (=> b!660763 (=> (not res!428827) (not e!379685))))

(declare-fun noDuplicate!485 (List!12661) Bool)

(assert (=> b!660763 (= res!428827 (noDuplicate!485 acc!681))))

(declare-fun b!660765 () Bool)

(declare-fun res!428828 () Bool)

(assert (=> b!660765 (=> (not res!428828) (not e!379685))))

(assert (=> b!660765 (= res!428828 (not (contains!3238 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660766 () Bool)

(declare-fun res!428833 () Bool)

(assert (=> b!660766 (=> (not res!428833) (not e!379685))))

(assert (=> b!660766 (= res!428833 (not (contains!3238 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660767 () Bool)

(declare-fun res!428832 () Bool)

(assert (=> b!660767 (=> (not res!428832) (not e!379685))))

(declare-datatypes ((array!38855 0))(
  ( (array!38856 (arr!18620 (Array (_ BitVec 32) (_ BitVec 64))) (size!18984 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38855)

(declare-fun arrayNoDuplicates!0 (array!38855 (_ BitVec 32) List!12661) Bool)

(assert (=> b!660767 (= res!428832 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12658))))

(declare-fun b!660768 () Bool)

(declare-fun e!379683 () Bool)

(assert (=> b!660768 (= e!379683 (contains!3238 acc!681 k!2843))))

(declare-fun res!428829 () Bool)

(assert (=> start!59808 (=> (not res!428829) (not e!379685))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59808 (= res!428829 (and (bvslt (size!18984 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18984 a!3626))))))

(assert (=> start!59808 e!379685))

(assert (=> start!59808 true))

(declare-fun array_inv!14416 (array!38855) Bool)

(assert (=> start!59808 (array_inv!14416 a!3626)))

(declare-fun b!660764 () Bool)

(declare-fun e!379684 () Bool)

(assert (=> b!660764 (= e!379684 e!379686)))

(declare-fun res!428834 () Bool)

(assert (=> b!660764 (=> (not res!428834) (not e!379686))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660764 (= res!428834 (bvsle from!3004 i!1382))))

(declare-fun b!660769 () Bool)

(declare-fun res!428831 () Bool)

(assert (=> b!660769 (=> (not res!428831) (not e!379685))))

(assert (=> b!660769 (= res!428831 e!379684)))

(declare-fun res!428830 () Bool)

(assert (=> b!660769 (=> res!428830 e!379684)))

(assert (=> b!660769 (= res!428830 e!379683)))

(declare-fun res!428826 () Bool)

(assert (=> b!660769 (=> (not res!428826) (not e!379683))))

(assert (=> b!660769 (= res!428826 (bvsgt from!3004 i!1382))))

(declare-fun b!660770 () Bool)

(assert (=> b!660770 (= e!379685 false)))

(declare-fun lt!308809 () Bool)

(assert (=> b!660770 (= lt!308809 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59808 res!428829) b!660763))

(assert (= (and b!660763 res!428827) b!660765))

(assert (= (and b!660765 res!428828) b!660766))

(assert (= (and b!660766 res!428833) b!660769))

(assert (= (and b!660769 res!428826) b!660768))

(assert (= (and b!660769 (not res!428830)) b!660764))

(assert (= (and b!660764 res!428834) b!660762))

(assert (= (and b!660769 res!428831) b!660767))

(assert (= (and b!660767 res!428832) b!660770))

(declare-fun m!633279 () Bool)

(assert (=> b!660768 m!633279))

(declare-fun m!633281 () Bool)

(assert (=> start!59808 m!633281))

(declare-fun m!633283 () Bool)

(assert (=> b!660763 m!633283))

(declare-fun m!633285 () Bool)

(assert (=> b!660767 m!633285))

(declare-fun m!633287 () Bool)

(assert (=> b!660765 m!633287))

(assert (=> b!660762 m!633279))

(declare-fun m!633289 () Bool)

(assert (=> b!660770 m!633289))

(declare-fun m!633291 () Bool)

(assert (=> b!660766 m!633291))

(push 1)

(assert (not b!660763))

(assert (not b!660767))

(assert (not b!660770))

(assert (not b!660768))

(assert (not b!660765))

(assert (not start!59808))

(assert (not b!660762))

(assert (not b!660766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

