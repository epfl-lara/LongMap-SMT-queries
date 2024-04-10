; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59856 () Bool)

(assert start!59856)

(declare-fun b!661720 () Bool)

(declare-fun e!380046 () Bool)

(declare-datatypes ((List!12685 0))(
  ( (Nil!12682) (Cons!12681 (h!13726 (_ BitVec 64)) (t!18913 List!12685)) )
))
(declare-fun acc!681 () List!12685)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3262 (List!12685 (_ BitVec 64)) Bool)

(assert (=> b!661720 (= e!380046 (not (contains!3262 acc!681 k!2843)))))

(declare-fun b!661721 () Bool)

(declare-fun res!429793 () Bool)

(declare-fun e!380044 () Bool)

(assert (=> b!661721 (=> (not res!429793) (not e!380044))))

(assert (=> b!661721 (= res!429793 (not (contains!3262 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661722 () Bool)

(declare-fun res!429787 () Bool)

(assert (=> b!661722 (=> (not res!429787) (not e!380044))))

(declare-fun e!380042 () Bool)

(assert (=> b!661722 (= res!429787 e!380042)))

(declare-fun res!429790 () Bool)

(assert (=> b!661722 (=> res!429790 e!380042)))

(declare-fun e!380043 () Bool)

(assert (=> b!661722 (= res!429790 e!380043)))

(declare-fun res!429797 () Bool)

(assert (=> b!661722 (=> (not res!429797) (not e!380043))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661722 (= res!429797 (bvsgt from!3004 i!1382))))

(declare-fun b!661723 () Bool)

(assert (=> b!661723 (= e!380044 (not true))))

(declare-datatypes ((array!38903 0))(
  ( (array!38904 (arr!18644 (Array (_ BitVec 32) (_ BitVec 64))) (size!19008 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38903)

(declare-fun arrayContainsKey!0 (array!38903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661723 (arrayContainsKey!0 (array!38904 (store (arr!18644 a!3626) i!1382 k!2843) (size!19008 a!3626)) k!2843 from!3004)))

(declare-fun b!661724 () Bool)

(assert (=> b!661724 (= e!380042 e!380046)))

(declare-fun res!429785 () Bool)

(assert (=> b!661724 (=> (not res!429785) (not e!380046))))

(assert (=> b!661724 (= res!429785 (bvsle from!3004 i!1382))))

(declare-fun b!661725 () Bool)

(declare-fun res!429788 () Bool)

(assert (=> b!661725 (=> (not res!429788) (not e!380044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661725 (= res!429788 (validKeyInArray!0 k!2843))))

(declare-fun b!661726 () Bool)

(declare-fun res!429786 () Bool)

(assert (=> b!661726 (=> (not res!429786) (not e!380044))))

(declare-fun arrayNoDuplicates!0 (array!38903 (_ BitVec 32) List!12685) Bool)

(assert (=> b!661726 (= res!429786 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661727 () Bool)

(declare-fun res!429796 () Bool)

(assert (=> b!661727 (=> (not res!429796) (not e!380044))))

(assert (=> b!661727 (= res!429796 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12682))))

(declare-fun res!429791 () Bool)

(assert (=> start!59856 (=> (not res!429791) (not e!380044))))

(assert (=> start!59856 (= res!429791 (and (bvslt (size!19008 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19008 a!3626))))))

(assert (=> start!59856 e!380044))

(assert (=> start!59856 true))

(declare-fun array_inv!14440 (array!38903) Bool)

(assert (=> start!59856 (array_inv!14440 a!3626)))

(declare-fun b!661728 () Bool)

(declare-fun res!429784 () Bool)

(assert (=> b!661728 (=> (not res!429784) (not e!380044))))

(declare-fun noDuplicate!509 (List!12685) Bool)

(assert (=> b!661728 (= res!429784 (noDuplicate!509 acc!681))))

(declare-fun b!661729 () Bool)

(assert (=> b!661729 (= e!380043 (contains!3262 acc!681 k!2843))))

(declare-fun b!661730 () Bool)

(declare-fun res!429794 () Bool)

(assert (=> b!661730 (=> (not res!429794) (not e!380044))))

(assert (=> b!661730 (= res!429794 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661731 () Bool)

(declare-fun res!429789 () Bool)

(assert (=> b!661731 (=> (not res!429789) (not e!380044))))

(assert (=> b!661731 (= res!429789 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19008 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661732 () Bool)

(declare-fun res!429795 () Bool)

(assert (=> b!661732 (=> (not res!429795) (not e!380044))))

(assert (=> b!661732 (= res!429795 (not (contains!3262 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661733 () Bool)

(declare-fun res!429792 () Bool)

(assert (=> b!661733 (=> (not res!429792) (not e!380044))))

(assert (=> b!661733 (= res!429792 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19008 a!3626))))))

(assert (= (and start!59856 res!429791) b!661728))

(assert (= (and b!661728 res!429784) b!661732))

(assert (= (and b!661732 res!429795) b!661721))

(assert (= (and b!661721 res!429793) b!661722))

(assert (= (and b!661722 res!429797) b!661729))

(assert (= (and b!661722 (not res!429790)) b!661724))

(assert (= (and b!661724 res!429785) b!661720))

(assert (= (and b!661722 res!429787) b!661727))

(assert (= (and b!661727 res!429796) b!661726))

(assert (= (and b!661726 res!429786) b!661733))

(assert (= (and b!661733 res!429792) b!661725))

(assert (= (and b!661725 res!429788) b!661730))

(assert (= (and b!661730 res!429794) b!661731))

(assert (= (and b!661731 res!429789) b!661723))

(declare-fun m!633775 () Bool)

(assert (=> b!661728 m!633775))

(declare-fun m!633777 () Bool)

(assert (=> b!661727 m!633777))

(declare-fun m!633779 () Bool)

(assert (=> b!661725 m!633779))

(declare-fun m!633781 () Bool)

(assert (=> b!661729 m!633781))

(declare-fun m!633783 () Bool)

(assert (=> b!661726 m!633783))

(declare-fun m!633785 () Bool)

(assert (=> start!59856 m!633785))

(declare-fun m!633787 () Bool)

(assert (=> b!661730 m!633787))

(declare-fun m!633789 () Bool)

(assert (=> b!661721 m!633789))

(declare-fun m!633791 () Bool)

(assert (=> b!661732 m!633791))

(declare-fun m!633793 () Bool)

(assert (=> b!661723 m!633793))

(declare-fun m!633795 () Bool)

(assert (=> b!661723 m!633795))

(assert (=> b!661720 m!633781))

(push 1)

(assert (not b!661730))

(assert (not b!661729))

(assert (not b!661723))

(assert (not b!661725))

(assert (not b!661727))

(assert (not b!661732))

(assert (not b!661720))

(assert (not b!661721))

(assert (not b!661728))

(assert (not start!59856))

(assert (not b!661726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

