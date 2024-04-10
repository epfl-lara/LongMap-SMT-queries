; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59810 () Bool)

(assert start!59810)

(declare-fun b!660789 () Bool)

(declare-fun e!379698 () Bool)

(declare-datatypes ((List!12662 0))(
  ( (Nil!12659) (Cons!12658 (h!13703 (_ BitVec 64)) (t!18890 List!12662)) )
))
(declare-fun acc!681 () List!12662)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3239 (List!12662 (_ BitVec 64)) Bool)

(assert (=> b!660789 (= e!379698 (contains!3239 acc!681 k!2843))))

(declare-fun b!660790 () Bool)

(declare-fun res!428857 () Bool)

(declare-fun e!379697 () Bool)

(assert (=> b!660790 (=> (not res!428857) (not e!379697))))

(assert (=> b!660790 (= res!428857 (not (contains!3239 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660791 () Bool)

(declare-fun res!428859 () Bool)

(assert (=> b!660791 (=> (not res!428859) (not e!379697))))

(declare-datatypes ((array!38857 0))(
  ( (array!38858 (arr!18621 (Array (_ BitVec 32) (_ BitVec 64))) (size!18985 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38857)

(declare-fun arrayNoDuplicates!0 (array!38857 (_ BitVec 32) List!12662) Bool)

(assert (=> b!660791 (= res!428859 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12659))))

(declare-fun b!660792 () Bool)

(declare-fun e!379700 () Bool)

(assert (=> b!660792 (= e!379700 (not (contains!3239 acc!681 k!2843)))))

(declare-fun b!660793 () Bool)

(declare-fun res!428853 () Bool)

(assert (=> b!660793 (=> (not res!428853) (not e!379697))))

(declare-fun noDuplicate!486 (List!12662) Bool)

(assert (=> b!660793 (= res!428853 (noDuplicate!486 acc!681))))

(declare-fun b!660794 () Bool)

(declare-fun e!379699 () Bool)

(assert (=> b!660794 (= e!379699 e!379700)))

(declare-fun res!428855 () Bool)

(assert (=> b!660794 (=> (not res!428855) (not e!379700))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660794 (= res!428855 (bvsle from!3004 i!1382))))

(declare-fun b!660795 () Bool)

(declare-fun res!428854 () Bool)

(assert (=> b!660795 (=> (not res!428854) (not e!379697))))

(assert (=> b!660795 (= res!428854 e!379699)))

(declare-fun res!428861 () Bool)

(assert (=> b!660795 (=> res!428861 e!379699)))

(assert (=> b!660795 (= res!428861 e!379698)))

(declare-fun res!428858 () Bool)

(assert (=> b!660795 (=> (not res!428858) (not e!379698))))

(assert (=> b!660795 (= res!428858 (bvsgt from!3004 i!1382))))

(declare-fun b!660797 () Bool)

(declare-fun res!428860 () Bool)

(assert (=> b!660797 (=> (not res!428860) (not e!379697))))

(assert (=> b!660797 (= res!428860 (not (contains!3239 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428856 () Bool)

(assert (=> start!59810 (=> (not res!428856) (not e!379697))))

(assert (=> start!59810 (= res!428856 (and (bvslt (size!18985 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18985 a!3626))))))

(assert (=> start!59810 e!379697))

(assert (=> start!59810 true))

(declare-fun array_inv!14417 (array!38857) Bool)

(assert (=> start!59810 (array_inv!14417 a!3626)))

(declare-fun b!660796 () Bool)

(assert (=> b!660796 (= e!379697 false)))

(declare-fun lt!308812 () Bool)

(assert (=> b!660796 (= lt!308812 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59810 res!428856) b!660793))

(assert (= (and b!660793 res!428853) b!660797))

(assert (= (and b!660797 res!428860) b!660790))

(assert (= (and b!660790 res!428857) b!660795))

(assert (= (and b!660795 res!428858) b!660789))

(assert (= (and b!660795 (not res!428861)) b!660794))

(assert (= (and b!660794 res!428855) b!660792))

(assert (= (and b!660795 res!428854) b!660791))

(assert (= (and b!660791 res!428859) b!660796))

(declare-fun m!633293 () Bool)

(assert (=> b!660796 m!633293))

(declare-fun m!633295 () Bool)

(assert (=> b!660797 m!633295))

(declare-fun m!633297 () Bool)

(assert (=> b!660789 m!633297))

(assert (=> b!660792 m!633297))

(declare-fun m!633299 () Bool)

(assert (=> b!660790 m!633299))

(declare-fun m!633301 () Bool)

(assert (=> b!660791 m!633301))

(declare-fun m!633303 () Bool)

(assert (=> b!660793 m!633303))

(declare-fun m!633305 () Bool)

(assert (=> start!59810 m!633305))

(push 1)

(assert (not b!660791))

(assert (not b!660796))

(assert (not b!660789))

(assert (not b!660793))

(assert (not b!660797))

(assert (not start!59810))

(assert (not b!660792))

(assert (not b!660790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

