; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62508 () Bool)

(assert start!62508)

(declare-fun b!703918 () Bool)

(declare-fun res!467740 () Bool)

(declare-fun e!397663 () Bool)

(assert (=> b!703918 (=> (not res!467740) (not e!397663))))

(declare-datatypes ((List!13291 0))(
  ( (Nil!13288) (Cons!13287 (h!14332 (_ BitVec 64)) (t!19573 List!13291)) )
))
(declare-fun newAcc!49 () List!13291)

(declare-fun contains!3868 (List!13291 (_ BitVec 64)) Bool)

(assert (=> b!703918 (= res!467740 (not (contains!3868 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703919 () Bool)

(assert (=> b!703919 (= e!397663 false)))

(declare-fun lt!317814 () Bool)

(declare-datatypes ((array!40187 0))(
  ( (array!40188 (arr!19250 (Array (_ BitVec 32) (_ BitVec 64))) (size!19635 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40187)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13291)

(declare-fun arrayNoDuplicates!0 (array!40187 (_ BitVec 32) List!13291) Bool)

(assert (=> b!703919 (= lt!317814 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703920 () Bool)

(declare-fun res!467739 () Bool)

(assert (=> b!703920 (=> (not res!467739) (not e!397663))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703920 (= res!467739 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703921 () Bool)

(declare-fun res!467744 () Bool)

(assert (=> b!703921 (=> (not res!467744) (not e!397663))))

(assert (=> b!703921 (= res!467744 (not (contains!3868 acc!652 k!2824)))))

(declare-fun b!703922 () Bool)

(declare-fun res!467735 () Bool)

(assert (=> b!703922 (=> (not res!467735) (not e!397663))))

(declare-fun subseq!313 (List!13291 List!13291) Bool)

(assert (=> b!703922 (= res!467735 (subseq!313 acc!652 newAcc!49))))

(declare-fun b!703923 () Bool)

(declare-fun res!467733 () Bool)

(assert (=> b!703923 (=> (not res!467733) (not e!397663))))

(assert (=> b!703923 (= res!467733 (not (contains!3868 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703924 () Bool)

(declare-fun res!467734 () Bool)

(assert (=> b!703924 (=> (not res!467734) (not e!397663))))

(assert (=> b!703924 (= res!467734 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703925 () Bool)

(declare-fun res!467742 () Bool)

(assert (=> b!703925 (=> (not res!467742) (not e!397663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703925 (= res!467742 (validKeyInArray!0 k!2824))))

(declare-fun b!703926 () Bool)

(declare-fun res!467731 () Bool)

(assert (=> b!703926 (=> (not res!467731) (not e!397663))))

(assert (=> b!703926 (= res!467731 (not (contains!3868 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703927 () Bool)

(declare-fun res!467730 () Bool)

(assert (=> b!703927 (=> (not res!467730) (not e!397663))))

(declare-fun -!278 (List!13291 (_ BitVec 64)) List!13291)

(assert (=> b!703927 (= res!467730 (= (-!278 newAcc!49 k!2824) acc!652))))

(declare-fun b!703928 () Bool)

(declare-fun res!467728 () Bool)

(assert (=> b!703928 (=> (not res!467728) (not e!397663))))

(assert (=> b!703928 (= res!467728 (not (contains!3868 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703929 () Bool)

(declare-fun res!467736 () Bool)

(assert (=> b!703929 (=> (not res!467736) (not e!397663))))

(declare-fun noDuplicate!1115 (List!13291) Bool)

(assert (=> b!703929 (= res!467736 (noDuplicate!1115 acc!652))))

(declare-fun b!703930 () Bool)

(declare-fun res!467738 () Bool)

(assert (=> b!703930 (=> (not res!467738) (not e!397663))))

(assert (=> b!703930 (= res!467738 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703931 () Bool)

(declare-fun res!467737 () Bool)

(assert (=> b!703931 (=> (not res!467737) (not e!397663))))

(assert (=> b!703931 (= res!467737 (contains!3868 newAcc!49 k!2824))))

(declare-fun b!703932 () Bool)

(declare-fun res!467743 () Bool)

(assert (=> b!703932 (=> (not res!467743) (not e!397663))))

(assert (=> b!703932 (= res!467743 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!467732 () Bool)

(assert (=> start!62508 (=> (not res!467732) (not e!397663))))

(assert (=> start!62508 (= res!467732 (and (bvslt (size!19635 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19635 a!3591))))))

(assert (=> start!62508 e!397663))

(assert (=> start!62508 true))

(declare-fun array_inv!15046 (array!40187) Bool)

(assert (=> start!62508 (array_inv!15046 a!3591)))

(declare-fun b!703933 () Bool)

(declare-fun res!467745 () Bool)

(assert (=> b!703933 (=> (not res!467745) (not e!397663))))

(assert (=> b!703933 (= res!467745 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19635 a!3591)))))

(declare-fun b!703934 () Bool)

(declare-fun res!467729 () Bool)

(assert (=> b!703934 (=> (not res!467729) (not e!397663))))

(assert (=> b!703934 (= res!467729 (not (validKeyInArray!0 (select (arr!19250 a!3591) from!2969))))))

(declare-fun b!703935 () Bool)

(declare-fun res!467741 () Bool)

(assert (=> b!703935 (=> (not res!467741) (not e!397663))))

(assert (=> b!703935 (= res!467741 (noDuplicate!1115 newAcc!49))))

(assert (= (and start!62508 res!467732) b!703929))

(assert (= (and b!703929 res!467736) b!703935))

(assert (= (and b!703935 res!467741) b!703926))

(assert (= (and b!703926 res!467731) b!703923))

(assert (= (and b!703923 res!467733) b!703920))

(assert (= (and b!703920 res!467739) b!703921))

(assert (= (and b!703921 res!467744) b!703925))

(assert (= (and b!703925 res!467742) b!703924))

(assert (= (and b!703924 res!467734) b!703922))

(assert (= (and b!703922 res!467735) b!703931))

(assert (= (and b!703931 res!467737) b!703927))

(assert (= (and b!703927 res!467730) b!703928))

(assert (= (and b!703928 res!467728) b!703918))

(assert (= (and b!703918 res!467740) b!703933))

(assert (= (and b!703933 res!467745) b!703934))

(assert (= (and b!703934 res!467729) b!703930))

(assert (= (and b!703930 res!467738) b!703932))

(assert (= (and b!703932 res!467743) b!703919))

(declare-fun m!662587 () Bool)

(assert (=> b!703928 m!662587))

(declare-fun m!662589 () Bool)

(assert (=> b!703929 m!662589))

(declare-fun m!662591 () Bool)

(assert (=> b!703926 m!662591))

(declare-fun m!662593 () Bool)

(assert (=> b!703919 m!662593))

(declare-fun m!662595 () Bool)

(assert (=> b!703921 m!662595))

(declare-fun m!662597 () Bool)

(assert (=> b!703918 m!662597))

(declare-fun m!662599 () Bool)

(assert (=> b!703925 m!662599))

(declare-fun m!662601 () Bool)

(assert (=> start!62508 m!662601))

(declare-fun m!662603 () Bool)

(assert (=> b!703927 m!662603))

(declare-fun m!662605 () Bool)

(assert (=> b!703932 m!662605))

(declare-fun m!662607 () Bool)

(assert (=> b!703934 m!662607))

(assert (=> b!703934 m!662607))

(declare-fun m!662609 () Bool)

(assert (=> b!703934 m!662609))

(declare-fun m!662611 () Bool)

(assert (=> b!703920 m!662611))

(declare-fun m!662613 () Bool)

(assert (=> b!703935 m!662613))

(declare-fun m!662615 () Bool)

(assert (=> b!703931 m!662615))

(declare-fun m!662617 () Bool)

(assert (=> b!703923 m!662617))

(declare-fun m!662619 () Bool)

(assert (=> b!703924 m!662619))

(declare-fun m!662621 () Bool)

(assert (=> b!703922 m!662621))

(push 1)

(assert (not b!703935))

(assert (not b!703923))

(assert (not b!703932))

(assert (not b!703934))

(assert (not b!703924))

(assert (not b!703925))

(assert (not b!703919))

(assert (not b!703918))

(assert (not b!703920))

(assert (not b!703927))

(assert (not b!703929))

(assert (not b!703926))

(assert (not start!62508))

(assert (not b!703928))

(assert (not b!703931))

(assert (not b!703921))

(assert (not b!703922))

(check-sat)

