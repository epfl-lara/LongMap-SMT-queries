; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115438 () Bool)

(assert start!115438)

(declare-fun b!1365043 () Bool)

(declare-fun res!908623 () Bool)

(declare-fun e!774121 () Bool)

(assert (=> b!1365043 (=> (not res!908623) (not e!774121))))

(declare-datatypes ((List!31876 0))(
  ( (Nil!31873) (Cons!31872 (h!33081 (_ BitVec 64)) (t!46570 List!31876)) )
))
(declare-fun newAcc!98 () List!31876)

(declare-fun contains!9558 (List!31876 (_ BitVec 64)) Bool)

(assert (=> b!1365043 (= res!908623 (not (contains!9558 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365044 () Bool)

(declare-fun res!908622 () Bool)

(assert (=> b!1365044 (=> (not res!908622) (not e!774121))))

(assert (=> b!1365044 (= res!908622 (not (contains!9558 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365045 () Bool)

(declare-fun res!908617 () Bool)

(assert (=> b!1365045 (=> (not res!908617) (not e!774121))))

(declare-fun acc!866 () List!31876)

(declare-fun subseq!960 (List!31876 List!31876) Bool)

(assert (=> b!1365045 (= res!908617 (subseq!960 newAcc!98 acc!866))))

(declare-fun res!908621 () Bool)

(assert (=> start!115438 (=> (not res!908621) (not e!774121))))

(declare-datatypes ((array!92759 0))(
  ( (array!92760 (arr!44808 (Array (_ BitVec 32) (_ BitVec 64))) (size!45358 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92759)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115438 (= res!908621 (and (bvslt (size!45358 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45358 a!3861))))))

(assert (=> start!115438 e!774121))

(declare-fun array_inv!33836 (array!92759) Bool)

(assert (=> start!115438 (array_inv!33836 a!3861)))

(assert (=> start!115438 true))

(declare-fun b!1365046 () Bool)

(assert (=> b!1365046 (= e!774121 false)))

(declare-datatypes ((Unit!45053 0))(
  ( (Unit!45054) )
))
(declare-fun lt!601180 () Unit!45053)

(declare-fun noDuplicateSubseq!147 (List!31876 List!31876) Unit!45053)

(assert (=> b!1365046 (= lt!601180 (noDuplicateSubseq!147 newAcc!98 acc!866))))

(declare-fun b!1365047 () Bool)

(declare-fun res!908618 () Bool)

(assert (=> b!1365047 (=> (not res!908618) (not e!774121))))

(declare-fun noDuplicate!2415 (List!31876) Bool)

(assert (=> b!1365047 (= res!908618 (noDuplicate!2415 acc!866))))

(declare-fun b!1365048 () Bool)

(declare-fun res!908620 () Bool)

(assert (=> b!1365048 (=> (not res!908620) (not e!774121))))

(assert (=> b!1365048 (= res!908620 (not (contains!9558 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365049 () Bool)

(declare-fun res!908619 () Bool)

(assert (=> b!1365049 (=> (not res!908619) (not e!774121))))

(assert (=> b!1365049 (= res!908619 (not (contains!9558 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115438 res!908621) b!1365047))

(assert (= (and b!1365047 res!908618) b!1365048))

(assert (= (and b!1365048 res!908620) b!1365049))

(assert (= (and b!1365049 res!908619) b!1365043))

(assert (= (and b!1365043 res!908623) b!1365044))

(assert (= (and b!1365044 res!908622) b!1365045))

(assert (= (and b!1365045 res!908617) b!1365046))

(declare-fun m!1249709 () Bool)

(assert (=> b!1365043 m!1249709))

(declare-fun m!1249711 () Bool)

(assert (=> b!1365045 m!1249711))

(declare-fun m!1249713 () Bool)

(assert (=> b!1365048 m!1249713))

(declare-fun m!1249715 () Bool)

(assert (=> b!1365046 m!1249715))

(declare-fun m!1249717 () Bool)

(assert (=> b!1365047 m!1249717))

(declare-fun m!1249719 () Bool)

(assert (=> b!1365049 m!1249719))

(declare-fun m!1249721 () Bool)

(assert (=> start!115438 m!1249721))

(declare-fun m!1249723 () Bool)

(assert (=> b!1365044 m!1249723))

(check-sat (not b!1365048) (not b!1365046) (not b!1365044) (not start!115438) (not b!1365049) (not b!1365047) (not b!1365045) (not b!1365043))
(check-sat)
