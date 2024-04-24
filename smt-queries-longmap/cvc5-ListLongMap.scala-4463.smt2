; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62188 () Bool)

(assert start!62188)

(declare-fun b!695858 () Bool)

(declare-fun e!395777 () Bool)

(assert (=> b!695858 (= e!395777 false)))

(declare-datatypes ((array!39916 0))(
  ( (array!39917 (arr!19116 (Array (_ BitVec 32) (_ BitVec 64))) (size!19499 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39916)

(declare-fun lt!317170 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13064 0))(
  ( (Nil!13061) (Cons!13060 (h!14108 (_ BitVec 64)) (t!19338 List!13064)) )
))
(declare-fun acc!681 () List!13064)

(declare-fun arrayNoDuplicates!0 (array!39916 (_ BitVec 32) List!13064) Bool)

(assert (=> b!695858 (= lt!317170 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695859 () Bool)

(declare-fun res!459703 () Bool)

(assert (=> b!695859 (=> (not res!459703) (not e!395777))))

(assert (=> b!695859 (= res!459703 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13061))))

(declare-fun b!695861 () Bool)

(declare-fun res!459697 () Bool)

(assert (=> b!695861 (=> (not res!459697) (not e!395777))))

(declare-fun contains!3716 (List!13064 (_ BitVec 64)) Bool)

(assert (=> b!695861 (= res!459697 (not (contains!3716 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695862 () Bool)

(declare-fun e!395781 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!695862 (= e!395781 (contains!3716 acc!681 k!2843))))

(declare-fun b!695863 () Bool)

(declare-fun res!459702 () Bool)

(assert (=> b!695863 (=> (not res!459702) (not e!395777))))

(declare-fun noDuplicate!990 (List!13064) Bool)

(assert (=> b!695863 (= res!459702 (noDuplicate!990 acc!681))))

(declare-fun b!695864 () Bool)

(declare-fun res!459701 () Bool)

(assert (=> b!695864 (=> (not res!459701) (not e!395777))))

(assert (=> b!695864 (= res!459701 (not (contains!3716 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695865 () Bool)

(declare-fun res!459699 () Bool)

(assert (=> b!695865 (=> (not res!459699) (not e!395777))))

(declare-fun e!395780 () Bool)

(assert (=> b!695865 (= res!459699 e!395780)))

(declare-fun res!459698 () Bool)

(assert (=> b!695865 (=> res!459698 e!395780)))

(assert (=> b!695865 (= res!459698 e!395781)))

(declare-fun res!459695 () Bool)

(assert (=> b!695865 (=> (not res!459695) (not e!395781))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695865 (= res!459695 (bvsgt from!3004 i!1382))))

(declare-fun b!695866 () Bool)

(declare-fun e!395778 () Bool)

(assert (=> b!695866 (= e!395780 e!395778)))

(declare-fun res!459696 () Bool)

(assert (=> b!695866 (=> (not res!459696) (not e!395778))))

(assert (=> b!695866 (= res!459696 (bvsle from!3004 i!1382))))

(declare-fun res!459700 () Bool)

(assert (=> start!62188 (=> (not res!459700) (not e!395777))))

(assert (=> start!62188 (= res!459700 (and (bvslt (size!19499 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19499 a!3626))))))

(assert (=> start!62188 e!395777))

(assert (=> start!62188 true))

(declare-fun array_inv!14975 (array!39916) Bool)

(assert (=> start!62188 (array_inv!14975 a!3626)))

(declare-fun b!695860 () Bool)

(assert (=> b!695860 (= e!395778 (not (contains!3716 acc!681 k!2843)))))

(assert (= (and start!62188 res!459700) b!695863))

(assert (= (and b!695863 res!459702) b!695861))

(assert (= (and b!695861 res!459697) b!695864))

(assert (= (and b!695864 res!459701) b!695865))

(assert (= (and b!695865 res!459695) b!695862))

(assert (= (and b!695865 (not res!459698)) b!695866))

(assert (= (and b!695866 res!459696) b!695860))

(assert (= (and b!695865 res!459699) b!695859))

(assert (= (and b!695859 res!459703) b!695858))

(declare-fun m!657743 () Bool)

(assert (=> b!695861 m!657743))

(declare-fun m!657745 () Bool)

(assert (=> b!695864 m!657745))

(declare-fun m!657747 () Bool)

(assert (=> b!695863 m!657747))

(declare-fun m!657749 () Bool)

(assert (=> b!695858 m!657749))

(declare-fun m!657751 () Bool)

(assert (=> start!62188 m!657751))

(declare-fun m!657753 () Bool)

(assert (=> b!695862 m!657753))

(assert (=> b!695860 m!657753))

(declare-fun m!657755 () Bool)

(assert (=> b!695859 m!657755))

(push 1)

(assert (not b!695858))

(assert (not b!695860))

(assert (not b!695859))

(assert (not b!695863))

(assert (not b!695862))

(assert (not start!62188))

(assert (not b!695861))

(assert (not b!695864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

