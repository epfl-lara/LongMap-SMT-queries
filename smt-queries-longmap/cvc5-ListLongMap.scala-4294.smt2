; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59854 () Bool)

(assert start!59854)

(declare-fun b!660824 () Bool)

(declare-fun res!428780 () Bool)

(declare-fun e!379737 () Bool)

(assert (=> b!660824 (=> (not res!428780) (not e!379737))))

(declare-datatypes ((List!12557 0))(
  ( (Nil!12554) (Cons!12553 (h!13601 (_ BitVec 64)) (t!18777 List!12557)) )
))
(declare-fun acc!681 () List!12557)

(declare-fun noDuplicate!483 (List!12557) Bool)

(assert (=> b!660824 (= res!428780 (noDuplicate!483 acc!681))))

(declare-fun b!660825 () Bool)

(declare-fun res!428785 () Bool)

(assert (=> b!660825 (=> (not res!428785) (not e!379737))))

(declare-fun contains!3209 (List!12557 (_ BitVec 64)) Bool)

(assert (=> b!660825 (= res!428785 (not (contains!3209 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660826 () Bool)

(declare-fun res!428782 () Bool)

(assert (=> b!660826 (=> (not res!428782) (not e!379737))))

(declare-datatypes ((array!38839 0))(
  ( (array!38840 (arr!18609 (Array (_ BitVec 32) (_ BitVec 64))) (size!18973 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38839)

(declare-fun arrayNoDuplicates!0 (array!38839 (_ BitVec 32) List!12557) Bool)

(assert (=> b!660826 (= res!428782 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12554))))

(declare-fun b!660827 () Bool)

(declare-fun e!379734 () Bool)

(declare-fun e!379736 () Bool)

(assert (=> b!660827 (= e!379734 e!379736)))

(declare-fun res!428781 () Bool)

(assert (=> b!660827 (=> (not res!428781) (not e!379736))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660827 (= res!428781 (bvsle from!3004 i!1382))))

(declare-fun res!428778 () Bool)

(assert (=> start!59854 (=> (not res!428778) (not e!379737))))

(assert (=> start!59854 (= res!428778 (and (bvslt (size!18973 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18973 a!3626))))))

(assert (=> start!59854 e!379737))

(assert (=> start!59854 true))

(declare-fun array_inv!14468 (array!38839) Bool)

(assert (=> start!59854 (array_inv!14468 a!3626)))

(declare-fun b!660828 () Bool)

(declare-fun e!379735 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660828 (= e!379735 (contains!3209 acc!681 k!2843))))

(declare-fun b!660829 () Bool)

(assert (=> b!660829 (= e!379736 (not (contains!3209 acc!681 k!2843)))))

(declare-fun b!660830 () Bool)

(assert (=> b!660830 (= e!379737 false)))

(declare-fun lt!308893 () Bool)

(assert (=> b!660830 (= lt!308893 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660831 () Bool)

(declare-fun res!428779 () Bool)

(assert (=> b!660831 (=> (not res!428779) (not e!379737))))

(assert (=> b!660831 (= res!428779 e!379734)))

(declare-fun res!428777 () Bool)

(assert (=> b!660831 (=> res!428777 e!379734)))

(assert (=> b!660831 (= res!428777 e!379735)))

(declare-fun res!428784 () Bool)

(assert (=> b!660831 (=> (not res!428784) (not e!379735))))

(assert (=> b!660831 (= res!428784 (bvsgt from!3004 i!1382))))

(declare-fun b!660832 () Bool)

(declare-fun res!428783 () Bool)

(assert (=> b!660832 (=> (not res!428783) (not e!379737))))

(assert (=> b!660832 (= res!428783 (not (contains!3209 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59854 res!428778) b!660824))

(assert (= (and b!660824 res!428780) b!660825))

(assert (= (and b!660825 res!428785) b!660832))

(assert (= (and b!660832 res!428783) b!660831))

(assert (= (and b!660831 res!428784) b!660828))

(assert (= (and b!660831 (not res!428777)) b!660827))

(assert (= (and b!660827 res!428781) b!660829))

(assert (= (and b!660831 res!428779) b!660826))

(assert (= (and b!660826 res!428782) b!660830))

(declare-fun m!633893 () Bool)

(assert (=> b!660829 m!633893))

(declare-fun m!633895 () Bool)

(assert (=> b!660832 m!633895))

(declare-fun m!633897 () Bool)

(assert (=> b!660830 m!633897))

(declare-fun m!633899 () Bool)

(assert (=> b!660824 m!633899))

(assert (=> b!660828 m!633893))

(declare-fun m!633901 () Bool)

(assert (=> b!660826 m!633901))

(declare-fun m!633903 () Bool)

(assert (=> start!59854 m!633903))

(declare-fun m!633905 () Bool)

(assert (=> b!660825 m!633905))

(push 1)

(assert (not b!660825))

(assert (not b!660828))

(assert (not start!59854))

(assert (not b!660826))

(assert (not b!660829))

(assert (not b!660824))

(assert (not b!660830))

(assert (not b!660832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

