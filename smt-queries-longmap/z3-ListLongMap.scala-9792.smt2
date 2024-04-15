; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116266 () Bool)

(assert start!116266)

(declare-fun b!1372660 () Bool)

(declare-fun res!915974 () Bool)

(declare-fun e!777642 () Bool)

(assert (=> b!1372660 (=> (not res!915974) (not e!777642))))

(declare-datatypes ((List!32078 0))(
  ( (Nil!32075) (Cons!32074 (h!33283 (_ BitVec 64)) (t!46764 List!32078)) )
))
(declare-fun newAcc!98 () List!32078)

(declare-fun contains!9671 (List!32078 (_ BitVec 64)) Bool)

(assert (=> b!1372660 (= res!915974 (not (contains!9671 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372661 () Bool)

(assert (=> b!1372661 (= e!777642 false)))

(declare-datatypes ((array!93042 0))(
  ( (array!93043 (arr!44932 (Array (_ BitVec 32) (_ BitVec 64))) (size!45484 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93042)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602736 () Bool)

(declare-fun acc!866 () List!32078)

(declare-fun arrayNoDuplicates!0 (array!93042 (_ BitVec 32) List!32078) Bool)

(assert (=> b!1372661 (= lt!602736 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45192 0))(
  ( (Unit!45193) )
))
(declare-fun lt!602735 () Unit!45192)

(declare-fun noDuplicateSubseq!296 (List!32078 List!32078) Unit!45192)

(assert (=> b!1372661 (= lt!602735 (noDuplicateSubseq!296 newAcc!98 acc!866))))

(declare-fun b!1372662 () Bool)

(declare-fun res!915972 () Bool)

(assert (=> b!1372662 (=> (not res!915972) (not e!777642))))

(declare-fun subseq!1109 (List!32078 List!32078) Bool)

(assert (=> b!1372662 (= res!915972 (subseq!1109 newAcc!98 acc!866))))

(declare-fun b!1372663 () Bool)

(declare-fun res!915976 () Bool)

(assert (=> b!1372663 (=> (not res!915976) (not e!777642))))

(assert (=> b!1372663 (= res!915976 (not (contains!9671 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372664 () Bool)

(declare-fun res!915977 () Bool)

(assert (=> b!1372664 (=> (not res!915977) (not e!777642))))

(declare-fun noDuplicate!2586 (List!32078) Bool)

(assert (=> b!1372664 (= res!915977 (noDuplicate!2586 acc!866))))

(declare-fun res!915971 () Bool)

(assert (=> start!116266 (=> (not res!915971) (not e!777642))))

(assert (=> start!116266 (= res!915971 (and (bvslt (size!45484 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45484 a!3861))))))

(assert (=> start!116266 e!777642))

(declare-fun array_inv!34165 (array!93042) Bool)

(assert (=> start!116266 (array_inv!34165 a!3861)))

(assert (=> start!116266 true))

(declare-fun b!1372665 () Bool)

(declare-fun res!915975 () Bool)

(assert (=> b!1372665 (=> (not res!915975) (not e!777642))))

(assert (=> b!1372665 (= res!915975 (not (contains!9671 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372666 () Bool)

(declare-fun res!915973 () Bool)

(assert (=> b!1372666 (=> (not res!915973) (not e!777642))))

(assert (=> b!1372666 (= res!915973 (not (contains!9671 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116266 res!915971) b!1372664))

(assert (= (and b!1372664 res!915977) b!1372663))

(assert (= (and b!1372663 res!915976) b!1372665))

(assert (= (and b!1372665 res!915975) b!1372666))

(assert (= (and b!1372666 res!915973) b!1372660))

(assert (= (and b!1372660 res!915974) b!1372662))

(assert (= (and b!1372662 res!915972) b!1372661))

(declare-fun m!1255599 () Bool)

(assert (=> b!1372662 m!1255599))

(declare-fun m!1255601 () Bool)

(assert (=> b!1372660 m!1255601))

(declare-fun m!1255603 () Bool)

(assert (=> b!1372663 m!1255603))

(declare-fun m!1255605 () Bool)

(assert (=> start!116266 m!1255605))

(declare-fun m!1255607 () Bool)

(assert (=> b!1372661 m!1255607))

(declare-fun m!1255609 () Bool)

(assert (=> b!1372661 m!1255609))

(declare-fun m!1255611 () Bool)

(assert (=> b!1372666 m!1255611))

(declare-fun m!1255613 () Bool)

(assert (=> b!1372665 m!1255613))

(declare-fun m!1255615 () Bool)

(assert (=> b!1372664 m!1255615))

(check-sat (not start!116266) (not b!1372660) (not b!1372661) (not b!1372662) (not b!1372666) (not b!1372663) (not b!1372664) (not b!1372665))
(check-sat)
