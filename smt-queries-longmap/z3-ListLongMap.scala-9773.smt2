; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116032 () Bool)

(assert start!116032)

(declare-fun b!1370542 () Bool)

(declare-fun res!913243 () Bool)

(declare-fun e!776502 () Bool)

(assert (=> b!1370542 (=> (not res!913243) (not e!776502))))

(declare-datatypes ((List!32008 0))(
  ( (Nil!32005) (Cons!32004 (h!33222 (_ BitVec 64)) (t!46694 List!32008)) )
))
(declare-fun newAcc!98 () List!32008)

(declare-fun acc!866 () List!32008)

(declare-fun subseq!1052 (List!32008 List!32008) Bool)

(assert (=> b!1370542 (= res!913243 (subseq!1052 newAcc!98 acc!866))))

(declare-fun b!1370543 () Bool)

(declare-fun res!913241 () Bool)

(assert (=> b!1370543 (=> (not res!913241) (not e!776502))))

(declare-fun contains!9693 (List!32008 (_ BitVec 64)) Bool)

(assert (=> b!1370543 (= res!913241 (not (contains!9693 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913245 () Bool)

(assert (=> start!116032 (=> (not res!913245) (not e!776502))))

(declare-datatypes ((array!93070 0))(
  ( (array!93071 (arr!44953 (Array (_ BitVec 32) (_ BitVec 64))) (size!45504 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93070)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116032 (= res!913245 (and (bvslt (size!45504 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45504 a!3861))))))

(assert (=> start!116032 e!776502))

(declare-fun array_inv!34234 (array!93070) Bool)

(assert (=> start!116032 (array_inv!34234 a!3861)))

(assert (=> start!116032 true))

(declare-fun b!1370544 () Bool)

(declare-fun res!913244 () Bool)

(assert (=> b!1370544 (=> (not res!913244) (not e!776502))))

(declare-fun noDuplicate!2524 (List!32008) Bool)

(assert (=> b!1370544 (= res!913244 (noDuplicate!2524 acc!866))))

(declare-fun b!1370545 () Bool)

(declare-fun res!913240 () Bool)

(assert (=> b!1370545 (=> (not res!913240) (not e!776502))))

(assert (=> b!1370545 (= res!913240 (not (contains!9693 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370546 () Bool)

(declare-fun res!913239 () Bool)

(assert (=> b!1370546 (=> (not res!913239) (not e!776502))))

(assert (=> b!1370546 (= res!913239 (not (contains!9693 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370547 () Bool)

(declare-fun res!913242 () Bool)

(assert (=> b!1370547 (=> (not res!913242) (not e!776502))))

(assert (=> b!1370547 (= res!913242 (not (contains!9693 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370548 () Bool)

(assert (=> b!1370548 (= e!776502 false)))

(declare-fun lt!602702 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93070 (_ BitVec 32) List!32008) Bool)

(assert (=> b!1370548 (= lt!602702 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45176 0))(
  ( (Unit!45177) )
))
(declare-fun lt!602703 () Unit!45176)

(declare-fun noDuplicateSubseq!239 (List!32008 List!32008) Unit!45176)

(assert (=> b!1370548 (= lt!602703 (noDuplicateSubseq!239 newAcc!98 acc!866))))

(assert (= (and start!116032 res!913245) b!1370544))

(assert (= (and b!1370544 res!913244) b!1370546))

(assert (= (and b!1370546 res!913239) b!1370547))

(assert (= (and b!1370547 res!913242) b!1370543))

(assert (= (and b!1370543 res!913241) b!1370545))

(assert (= (and b!1370545 res!913240) b!1370542))

(assert (= (and b!1370542 res!913243) b!1370548))

(declare-fun m!1254661 () Bool)

(assert (=> b!1370547 m!1254661))

(declare-fun m!1254663 () Bool)

(assert (=> b!1370543 m!1254663))

(declare-fun m!1254665 () Bool)

(assert (=> b!1370542 m!1254665))

(declare-fun m!1254667 () Bool)

(assert (=> b!1370548 m!1254667))

(declare-fun m!1254669 () Bool)

(assert (=> b!1370548 m!1254669))

(declare-fun m!1254671 () Bool)

(assert (=> start!116032 m!1254671))

(declare-fun m!1254673 () Bool)

(assert (=> b!1370545 m!1254673))

(declare-fun m!1254675 () Bool)

(assert (=> b!1370544 m!1254675))

(declare-fun m!1254677 () Bool)

(assert (=> b!1370546 m!1254677))

(check-sat (not b!1370548) (not b!1370544) (not b!1370547) (not b!1370542) (not b!1370546) (not b!1370545) (not b!1370543) (not start!116032))
(check-sat)
