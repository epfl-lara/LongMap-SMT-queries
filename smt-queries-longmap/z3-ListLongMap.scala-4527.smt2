; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62632 () Bool)

(assert start!62632)

(declare-fun b!706980 () Bool)

(declare-fun res!470799 () Bool)

(declare-fun e!398035 () Bool)

(assert (=> b!706980 (=> (not res!470799) (not e!398035))))

(declare-datatypes ((List!13353 0))(
  ( (Nil!13350) (Cons!13349 (h!14394 (_ BitVec 64)) (t!19635 List!13353)) )
))
(declare-fun acc!652 () List!13353)

(declare-fun contains!3930 (List!13353 (_ BitVec 64)) Bool)

(assert (=> b!706980 (= res!470799 (not (contains!3930 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706981 () Bool)

(declare-fun res!470797 () Bool)

(assert (=> b!706981 (=> (not res!470797) (not e!398035))))

(declare-fun newAcc!49 () List!13353)

(assert (=> b!706981 (= res!470797 (not (contains!3930 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706982 () Bool)

(declare-fun res!470795 () Bool)

(assert (=> b!706982 (=> (not res!470795) (not e!398035))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40311 0))(
  ( (array!40312 (arr!19312 (Array (_ BitVec 32) (_ BitVec 64))) (size!19697 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40311)

(declare-fun arrayContainsKey!0 (array!40311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706982 (= res!470795 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706983 () Bool)

(declare-fun res!470802 () Bool)

(assert (=> b!706983 (=> (not res!470802) (not e!398035))))

(declare-fun noDuplicate!1177 (List!13353) Bool)

(assert (=> b!706983 (= res!470802 (noDuplicate!1177 newAcc!49))))

(declare-fun b!706984 () Bool)

(declare-fun res!470792 () Bool)

(assert (=> b!706984 (=> (not res!470792) (not e!398035))))

(declare-fun arrayNoDuplicates!0 (array!40311 (_ BitVec 32) List!13353) Bool)

(assert (=> b!706984 (= res!470792 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706985 () Bool)

(assert (=> b!706985 (= e!398035 false)))

(declare-fun lt!317982 () Bool)

(assert (=> b!706985 (= lt!317982 (contains!3930 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706986 () Bool)

(declare-fun res!470790 () Bool)

(assert (=> b!706986 (=> (not res!470790) (not e!398035))))

(assert (=> b!706986 (= res!470790 (not (contains!3930 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706987 () Bool)

(declare-fun res!470796 () Bool)

(assert (=> b!706987 (=> (not res!470796) (not e!398035))))

(assert (=> b!706987 (= res!470796 (not (contains!3930 acc!652 k0!2824)))))

(declare-fun b!706989 () Bool)

(declare-fun res!470793 () Bool)

(assert (=> b!706989 (=> (not res!470793) (not e!398035))))

(declare-fun -!340 (List!13353 (_ BitVec 64)) List!13353)

(assert (=> b!706989 (= res!470793 (= (-!340 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706990 () Bool)

(declare-fun res!470794 () Bool)

(assert (=> b!706990 (=> (not res!470794) (not e!398035))))

(assert (=> b!706990 (= res!470794 (noDuplicate!1177 acc!652))))

(declare-fun b!706991 () Bool)

(declare-fun res!470798 () Bool)

(assert (=> b!706991 (=> (not res!470798) (not e!398035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706991 (= res!470798 (validKeyInArray!0 k0!2824))))

(declare-fun b!706992 () Bool)

(declare-fun res!470801 () Bool)

(assert (=> b!706992 (=> (not res!470801) (not e!398035))))

(declare-fun subseq!375 (List!13353 List!13353) Bool)

(assert (=> b!706992 (= res!470801 (subseq!375 acc!652 newAcc!49))))

(declare-fun b!706988 () Bool)

(declare-fun res!470800 () Bool)

(assert (=> b!706988 (=> (not res!470800) (not e!398035))))

(assert (=> b!706988 (= res!470800 (contains!3930 newAcc!49 k0!2824))))

(declare-fun res!470791 () Bool)

(assert (=> start!62632 (=> (not res!470791) (not e!398035))))

(assert (=> start!62632 (= res!470791 (and (bvslt (size!19697 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19697 a!3591))))))

(assert (=> start!62632 e!398035))

(assert (=> start!62632 true))

(declare-fun array_inv!15108 (array!40311) Bool)

(assert (=> start!62632 (array_inv!15108 a!3591)))

(assert (= (and start!62632 res!470791) b!706990))

(assert (= (and b!706990 res!470794) b!706983))

(assert (= (and b!706983 res!470802) b!706986))

(assert (= (and b!706986 res!470790) b!706980))

(assert (= (and b!706980 res!470799) b!706982))

(assert (= (and b!706982 res!470795) b!706987))

(assert (= (and b!706987 res!470796) b!706991))

(assert (= (and b!706991 res!470798) b!706984))

(assert (= (and b!706984 res!470792) b!706992))

(assert (= (and b!706992 res!470801) b!706988))

(assert (= (and b!706988 res!470800) b!706989))

(assert (= (and b!706989 res!470793) b!706981))

(assert (= (and b!706981 res!470797) b!706985))

(declare-fun m!664691 () Bool)

(assert (=> b!706987 m!664691))

(declare-fun m!664693 () Bool)

(assert (=> b!706980 m!664693))

(declare-fun m!664695 () Bool)

(assert (=> b!706989 m!664695))

(declare-fun m!664697 () Bool)

(assert (=> b!706985 m!664697))

(declare-fun m!664699 () Bool)

(assert (=> b!706991 m!664699))

(declare-fun m!664701 () Bool)

(assert (=> b!706983 m!664701))

(declare-fun m!664703 () Bool)

(assert (=> b!706990 m!664703))

(declare-fun m!664705 () Bool)

(assert (=> b!706984 m!664705))

(declare-fun m!664707 () Bool)

(assert (=> b!706992 m!664707))

(declare-fun m!664709 () Bool)

(assert (=> b!706981 m!664709))

(declare-fun m!664711 () Bool)

(assert (=> b!706982 m!664711))

(declare-fun m!664713 () Bool)

(assert (=> b!706986 m!664713))

(declare-fun m!664715 () Bool)

(assert (=> start!62632 m!664715))

(declare-fun m!664717 () Bool)

(assert (=> b!706988 m!664717))

(check-sat (not b!706980) (not b!706982) (not b!706989) (not b!706987) (not b!706985) (not b!706986) (not b!706981) (not b!706984) (not b!706992) (not start!62632) (not b!706990) (not b!706988) (not b!706991) (not b!706983))
(check-sat)
