; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62636 () Bool)

(assert start!62636)

(declare-fun b!707058 () Bool)

(declare-fun res!470876 () Bool)

(declare-fun e!398046 () Bool)

(assert (=> b!707058 (=> (not res!470876) (not e!398046))))

(declare-datatypes ((List!13355 0))(
  ( (Nil!13352) (Cons!13351 (h!14396 (_ BitVec 64)) (t!19637 List!13355)) )
))
(declare-fun acc!652 () List!13355)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3932 (List!13355 (_ BitVec 64)) Bool)

(assert (=> b!707058 (= res!470876 (not (contains!3932 acc!652 k!2824)))))

(declare-fun res!470875 () Bool)

(assert (=> start!62636 (=> (not res!470875) (not e!398046))))

(declare-datatypes ((array!40315 0))(
  ( (array!40316 (arr!19314 (Array (_ BitVec 32) (_ BitVec 64))) (size!19699 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40315)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62636 (= res!470875 (and (bvslt (size!19699 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19699 a!3591))))))

(assert (=> start!62636 e!398046))

(assert (=> start!62636 true))

(declare-fun array_inv!15110 (array!40315) Bool)

(assert (=> start!62636 (array_inv!15110 a!3591)))

(declare-fun b!707059 () Bool)

(declare-fun res!470868 () Bool)

(assert (=> b!707059 (=> (not res!470868) (not e!398046))))

(assert (=> b!707059 (= res!470868 (not (contains!3932 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707060 () Bool)

(declare-fun res!470880 () Bool)

(assert (=> b!707060 (=> (not res!470880) (not e!398046))))

(declare-fun newAcc!49 () List!13355)

(declare-fun -!342 (List!13355 (_ BitVec 64)) List!13355)

(assert (=> b!707060 (= res!470880 (= (-!342 newAcc!49 k!2824) acc!652))))

(declare-fun b!707061 () Bool)

(declare-fun res!470878 () Bool)

(assert (=> b!707061 (=> (not res!470878) (not e!398046))))

(declare-fun noDuplicate!1179 (List!13355) Bool)

(assert (=> b!707061 (= res!470878 (noDuplicate!1179 acc!652))))

(declare-fun b!707062 () Bool)

(assert (=> b!707062 (= e!398046 false)))

(declare-fun lt!317988 () Bool)

(assert (=> b!707062 (= lt!317988 (contains!3932 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707063 () Bool)

(declare-fun res!470870 () Bool)

(assert (=> b!707063 (=> (not res!470870) (not e!398046))))

(declare-fun subseq!377 (List!13355 List!13355) Bool)

(assert (=> b!707063 (= res!470870 (subseq!377 acc!652 newAcc!49))))

(declare-fun b!707064 () Bool)

(declare-fun res!470871 () Bool)

(assert (=> b!707064 (=> (not res!470871) (not e!398046))))

(assert (=> b!707064 (= res!470871 (not (contains!3932 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707065 () Bool)

(declare-fun res!470874 () Bool)

(assert (=> b!707065 (=> (not res!470874) (not e!398046))))

(assert (=> b!707065 (= res!470874 (contains!3932 newAcc!49 k!2824))))

(declare-fun b!707066 () Bool)

(declare-fun res!470879 () Bool)

(assert (=> b!707066 (=> (not res!470879) (not e!398046))))

(assert (=> b!707066 (= res!470879 (not (contains!3932 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707067 () Bool)

(declare-fun res!470872 () Bool)

(assert (=> b!707067 (=> (not res!470872) (not e!398046))))

(declare-fun arrayContainsKey!0 (array!40315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707067 (= res!470872 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707068 () Bool)

(declare-fun res!470873 () Bool)

(assert (=> b!707068 (=> (not res!470873) (not e!398046))))

(declare-fun arrayNoDuplicates!0 (array!40315 (_ BitVec 32) List!13355) Bool)

(assert (=> b!707068 (= res!470873 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707069 () Bool)

(declare-fun res!470877 () Bool)

(assert (=> b!707069 (=> (not res!470877) (not e!398046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707069 (= res!470877 (validKeyInArray!0 k!2824))))

(declare-fun b!707070 () Bool)

(declare-fun res!470869 () Bool)

(assert (=> b!707070 (=> (not res!470869) (not e!398046))))

(assert (=> b!707070 (= res!470869 (noDuplicate!1179 newAcc!49))))

(assert (= (and start!62636 res!470875) b!707061))

(assert (= (and b!707061 res!470878) b!707070))

(assert (= (and b!707070 res!470869) b!707066))

(assert (= (and b!707066 res!470879) b!707059))

(assert (= (and b!707059 res!470868) b!707067))

(assert (= (and b!707067 res!470872) b!707058))

(assert (= (and b!707058 res!470876) b!707069))

(assert (= (and b!707069 res!470877) b!707068))

(assert (= (and b!707068 res!470873) b!707063))

(assert (= (and b!707063 res!470870) b!707065))

(assert (= (and b!707065 res!470874) b!707060))

(assert (= (and b!707060 res!470880) b!707064))

(assert (= (and b!707064 res!470871) b!707062))

(declare-fun m!664747 () Bool)

(assert (=> b!707059 m!664747))

(declare-fun m!664749 () Bool)

(assert (=> start!62636 m!664749))

(declare-fun m!664751 () Bool)

(assert (=> b!707062 m!664751))

(declare-fun m!664753 () Bool)

(assert (=> b!707060 m!664753))

(declare-fun m!664755 () Bool)

(assert (=> b!707070 m!664755))

(declare-fun m!664757 () Bool)

(assert (=> b!707063 m!664757))

(declare-fun m!664759 () Bool)

(assert (=> b!707069 m!664759))

(declare-fun m!664761 () Bool)

(assert (=> b!707064 m!664761))

(declare-fun m!664763 () Bool)

(assert (=> b!707061 m!664763))

(declare-fun m!664765 () Bool)

(assert (=> b!707065 m!664765))

(declare-fun m!664767 () Bool)

(assert (=> b!707066 m!664767))

(declare-fun m!664769 () Bool)

(assert (=> b!707067 m!664769))

(declare-fun m!664771 () Bool)

(assert (=> b!707068 m!664771))

(declare-fun m!664773 () Bool)

(assert (=> b!707058 m!664773))

(push 1)

(assert (not b!707067))

(assert (not b!707063))

(assert (not b!707062))

(assert (not b!707070))

(assert (not b!707058))

(assert (not b!707069))

(assert (not b!707068))

(assert (not b!707060))

