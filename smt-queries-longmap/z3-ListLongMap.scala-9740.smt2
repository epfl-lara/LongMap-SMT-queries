; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115426 () Bool)

(assert start!115426)

(declare-fun b!1364917 () Bool)

(declare-fun res!908493 () Bool)

(declare-fun e!774085 () Bool)

(assert (=> b!1364917 (=> (not res!908493) (not e!774085))))

(declare-datatypes ((List!31870 0))(
  ( (Nil!31867) (Cons!31866 (h!33075 (_ BitVec 64)) (t!46564 List!31870)) )
))
(declare-fun acc!866 () List!31870)

(declare-fun contains!9552 (List!31870 (_ BitVec 64)) Bool)

(assert (=> b!1364917 (= res!908493 (not (contains!9552 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364918 () Bool)

(declare-fun res!908496 () Bool)

(assert (=> b!1364918 (=> (not res!908496) (not e!774085))))

(declare-fun newAcc!98 () List!31870)

(declare-fun subseq!954 (List!31870 List!31870) Bool)

(assert (=> b!1364918 (= res!908496 (subseq!954 newAcc!98 acc!866))))

(declare-fun b!1364919 () Bool)

(declare-fun res!908492 () Bool)

(assert (=> b!1364919 (=> (not res!908492) (not e!774085))))

(assert (=> b!1364919 (= res!908492 (not (contains!9552 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908491 () Bool)

(assert (=> start!115426 (=> (not res!908491) (not e!774085))))

(declare-datatypes ((array!92747 0))(
  ( (array!92748 (arr!44802 (Array (_ BitVec 32) (_ BitVec 64))) (size!45352 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92747)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115426 (= res!908491 (and (bvslt (size!45352 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45352 a!3861))))))

(assert (=> start!115426 e!774085))

(declare-fun array_inv!33830 (array!92747) Bool)

(assert (=> start!115426 (array_inv!33830 a!3861)))

(assert (=> start!115426 true))

(declare-fun b!1364920 () Bool)

(assert (=> b!1364920 (= e!774085 false)))

(declare-datatypes ((Unit!45041 0))(
  ( (Unit!45042) )
))
(declare-fun lt!601162 () Unit!45041)

(declare-fun noDuplicateSubseq!141 (List!31870 List!31870) Unit!45041)

(assert (=> b!1364920 (= lt!601162 (noDuplicateSubseq!141 newAcc!98 acc!866))))

(declare-fun b!1364921 () Bool)

(declare-fun res!908494 () Bool)

(assert (=> b!1364921 (=> (not res!908494) (not e!774085))))

(declare-fun noDuplicate!2409 (List!31870) Bool)

(assert (=> b!1364921 (= res!908494 (noDuplicate!2409 acc!866))))

(declare-fun b!1364922 () Bool)

(declare-fun res!908497 () Bool)

(assert (=> b!1364922 (=> (not res!908497) (not e!774085))))

(assert (=> b!1364922 (= res!908497 (not (contains!9552 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364923 () Bool)

(declare-fun res!908495 () Bool)

(assert (=> b!1364923 (=> (not res!908495) (not e!774085))))

(assert (=> b!1364923 (= res!908495 (not (contains!9552 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115426 res!908491) b!1364921))

(assert (= (and b!1364921 res!908494) b!1364917))

(assert (= (and b!1364917 res!908493) b!1364923))

(assert (= (and b!1364923 res!908495) b!1364922))

(assert (= (and b!1364922 res!908497) b!1364919))

(assert (= (and b!1364919 res!908492) b!1364918))

(assert (= (and b!1364918 res!908496) b!1364920))

(declare-fun m!1249613 () Bool)

(assert (=> b!1364917 m!1249613))

(declare-fun m!1249615 () Bool)

(assert (=> b!1364923 m!1249615))

(declare-fun m!1249617 () Bool)

(assert (=> b!1364922 m!1249617))

(declare-fun m!1249619 () Bool)

(assert (=> start!115426 m!1249619))

(declare-fun m!1249621 () Bool)

(assert (=> b!1364918 m!1249621))

(declare-fun m!1249623 () Bool)

(assert (=> b!1364921 m!1249623))

(declare-fun m!1249625 () Bool)

(assert (=> b!1364919 m!1249625))

(declare-fun m!1249627 () Bool)

(assert (=> b!1364920 m!1249627))

(check-sat (not b!1364922) (not b!1364917) (not b!1364920) (not b!1364918) (not b!1364921) (not b!1364919) (not start!115426) (not b!1364923))
(check-sat)
