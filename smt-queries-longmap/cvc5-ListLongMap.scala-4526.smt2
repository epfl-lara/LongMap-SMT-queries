; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62624 () Bool)

(assert start!62624)

(declare-fun b!706824 () Bool)

(declare-fun res!470638 () Bool)

(declare-fun e!398010 () Bool)

(assert (=> b!706824 (=> (not res!470638) (not e!398010))))

(declare-datatypes ((List!13349 0))(
  ( (Nil!13346) (Cons!13345 (h!14390 (_ BitVec 64)) (t!19631 List!13349)) )
))
(declare-fun newAcc!49 () List!13349)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3926 (List!13349 (_ BitVec 64)) Bool)

(assert (=> b!706824 (= res!470638 (contains!3926 newAcc!49 k!2824))))

(declare-fun b!706825 () Bool)

(declare-fun res!470645 () Bool)

(assert (=> b!706825 (=> (not res!470645) (not e!398010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706825 (= res!470645 (validKeyInArray!0 k!2824))))

(declare-fun b!706826 () Bool)

(declare-fun res!470646 () Bool)

(assert (=> b!706826 (=> (not res!470646) (not e!398010))))

(assert (=> b!706826 (= res!470646 (not (contains!3926 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!470635 () Bool)

(assert (=> start!62624 (=> (not res!470635) (not e!398010))))

(declare-datatypes ((array!40303 0))(
  ( (array!40304 (arr!19308 (Array (_ BitVec 32) (_ BitVec 64))) (size!19693 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40303)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62624 (= res!470635 (and (bvslt (size!19693 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19693 a!3591))))))

(assert (=> start!62624 e!398010))

(assert (=> start!62624 true))

(declare-fun array_inv!15104 (array!40303) Bool)

(assert (=> start!62624 (array_inv!15104 a!3591)))

(declare-fun b!706827 () Bool)

(declare-fun res!470642 () Bool)

(assert (=> b!706827 (=> (not res!470642) (not e!398010))))

(declare-fun acc!652 () List!13349)

(assert (=> b!706827 (= res!470642 (not (contains!3926 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706828 () Bool)

(declare-fun res!470641 () Bool)

(assert (=> b!706828 (=> (not res!470641) (not e!398010))))

(declare-fun -!336 (List!13349 (_ BitVec 64)) List!13349)

(assert (=> b!706828 (= res!470641 (= (-!336 newAcc!49 k!2824) acc!652))))

(declare-fun b!706829 () Bool)

(declare-fun res!470640 () Bool)

(assert (=> b!706829 (=> (not res!470640) (not e!398010))))

(assert (=> b!706829 (= res!470640 (not (contains!3926 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706830 () Bool)

(declare-fun res!470636 () Bool)

(assert (=> b!706830 (=> (not res!470636) (not e!398010))))

(declare-fun arrayNoDuplicates!0 (array!40303 (_ BitVec 32) List!13349) Bool)

(assert (=> b!706830 (= res!470636 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706831 () Bool)

(declare-fun res!470643 () Bool)

(assert (=> b!706831 (=> (not res!470643) (not e!398010))))

(declare-fun arrayContainsKey!0 (array!40303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706831 (= res!470643 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706832 () Bool)

(declare-fun res!470637 () Bool)

(assert (=> b!706832 (=> (not res!470637) (not e!398010))))

(declare-fun subseq!371 (List!13349 List!13349) Bool)

(assert (=> b!706832 (= res!470637 (subseq!371 acc!652 newAcc!49))))

(declare-fun b!706833 () Bool)

(declare-fun res!470639 () Bool)

(assert (=> b!706833 (=> (not res!470639) (not e!398010))))

(assert (=> b!706833 (= res!470639 (not (contains!3926 acc!652 k!2824)))))

(declare-fun b!706834 () Bool)

(assert (=> b!706834 (= e!398010 false)))

(declare-fun lt!317970 () Bool)

(assert (=> b!706834 (= lt!317970 (contains!3926 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706835 () Bool)

(declare-fun res!470644 () Bool)

(assert (=> b!706835 (=> (not res!470644) (not e!398010))))

(declare-fun noDuplicate!1173 (List!13349) Bool)

(assert (=> b!706835 (= res!470644 (noDuplicate!1173 newAcc!49))))

(declare-fun b!706836 () Bool)

(declare-fun res!470634 () Bool)

(assert (=> b!706836 (=> (not res!470634) (not e!398010))))

(assert (=> b!706836 (= res!470634 (noDuplicate!1173 acc!652))))

(assert (= (and start!62624 res!470635) b!706836))

(assert (= (and b!706836 res!470634) b!706835))

(assert (= (and b!706835 res!470644) b!706829))

(assert (= (and b!706829 res!470640) b!706827))

(assert (= (and b!706827 res!470642) b!706831))

(assert (= (and b!706831 res!470643) b!706833))

(assert (= (and b!706833 res!470639) b!706825))

(assert (= (and b!706825 res!470645) b!706830))

(assert (= (and b!706830 res!470636) b!706832))

(assert (= (and b!706832 res!470637) b!706824))

(assert (= (and b!706824 res!470638) b!706828))

(assert (= (and b!706828 res!470641) b!706826))

(assert (= (and b!706826 res!470646) b!706834))

(declare-fun m!664579 () Bool)

(assert (=> b!706830 m!664579))

(declare-fun m!664581 () Bool)

(assert (=> b!706833 m!664581))

(declare-fun m!664583 () Bool)

(assert (=> b!706828 m!664583))

(declare-fun m!664585 () Bool)

(assert (=> b!706825 m!664585))

(declare-fun m!664587 () Bool)

(assert (=> b!706834 m!664587))

(declare-fun m!664589 () Bool)

(assert (=> b!706827 m!664589))

(declare-fun m!664591 () Bool)

(assert (=> b!706831 m!664591))

(declare-fun m!664593 () Bool)

(assert (=> b!706826 m!664593))

(declare-fun m!664595 () Bool)

(assert (=> b!706835 m!664595))

(declare-fun m!664597 () Bool)

(assert (=> b!706836 m!664597))

(declare-fun m!664599 () Bool)

(assert (=> b!706824 m!664599))

(declare-fun m!664601 () Bool)

(assert (=> b!706832 m!664601))

(declare-fun m!664603 () Bool)

(assert (=> b!706829 m!664603))

(declare-fun m!664605 () Bool)

(assert (=> start!62624 m!664605))

(push 1)

(assert (not b!706836))

(assert (not b!706833))

(assert (not b!706832))

(assert (not b!706835))

(assert (not b!706830))

(assert (not start!62624))

(assert (not b!706826))

(assert (not b!706827))

(assert (not b!706825))

(assert (not b!706831))

(assert (not b!706828))

(assert (not b!706824))

(assert (not b!706829))

(assert (not b!706834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

