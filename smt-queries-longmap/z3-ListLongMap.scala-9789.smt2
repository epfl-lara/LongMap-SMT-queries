; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116260 () Bool)

(assert start!116260)

(declare-fun b!1372537 () Bool)

(declare-fun e!777619 () Bool)

(assert (=> b!1372537 (= e!777619 false)))

(declare-datatypes ((array!93077 0))(
  ( (array!93078 (arr!44949 (Array (_ BitVec 32) (_ BitVec 64))) (size!45499 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93077)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602884 () Bool)

(declare-datatypes ((List!32017 0))(
  ( (Nil!32014) (Cons!32013 (h!33222 (_ BitVec 64)) (t!46711 List!32017)) )
))
(declare-fun acc!866 () List!32017)

(declare-fun arrayNoDuplicates!0 (array!93077 (_ BitVec 32) List!32017) Bool)

(assert (=> b!1372537 (= lt!602884 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45335 0))(
  ( (Unit!45336) )
))
(declare-fun lt!602883 () Unit!45335)

(declare-fun newAcc!98 () List!32017)

(declare-fun noDuplicateSubseq!288 (List!32017 List!32017) Unit!45335)

(assert (=> b!1372537 (= lt!602883 (noDuplicateSubseq!288 newAcc!98 acc!866))))

(declare-fun res!915809 () Bool)

(assert (=> start!116260 (=> (not res!915809) (not e!777619))))

(assert (=> start!116260 (= res!915809 (and (bvslt (size!45499 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45499 a!3861))))))

(assert (=> start!116260 e!777619))

(declare-fun array_inv!33977 (array!93077) Bool)

(assert (=> start!116260 (array_inv!33977 a!3861)))

(assert (=> start!116260 true))

(declare-fun b!1372538 () Bool)

(declare-fun res!915811 () Bool)

(assert (=> b!1372538 (=> (not res!915811) (not e!777619))))

(declare-fun contains!9699 (List!32017 (_ BitVec 64)) Bool)

(assert (=> b!1372538 (= res!915811 (not (contains!9699 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372539 () Bool)

(declare-fun res!915805 () Bool)

(assert (=> b!1372539 (=> (not res!915805) (not e!777619))))

(assert (=> b!1372539 (= res!915805 (not (contains!9699 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372540 () Bool)

(declare-fun res!915807 () Bool)

(assert (=> b!1372540 (=> (not res!915807) (not e!777619))))

(declare-fun subseq!1101 (List!32017 List!32017) Bool)

(assert (=> b!1372540 (= res!915807 (subseq!1101 newAcc!98 acc!866))))

(declare-fun b!1372541 () Bool)

(declare-fun res!915810 () Bool)

(assert (=> b!1372541 (=> (not res!915810) (not e!777619))))

(assert (=> b!1372541 (= res!915810 (not (contains!9699 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372542 () Bool)

(declare-fun res!915808 () Bool)

(assert (=> b!1372542 (=> (not res!915808) (not e!777619))))

(assert (=> b!1372542 (= res!915808 (not (contains!9699 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372543 () Bool)

(declare-fun res!915806 () Bool)

(assert (=> b!1372543 (=> (not res!915806) (not e!777619))))

(declare-fun noDuplicate!2556 (List!32017) Bool)

(assert (=> b!1372543 (= res!915806 (noDuplicate!2556 acc!866))))

(assert (= (and start!116260 res!915809) b!1372543))

(assert (= (and b!1372543 res!915806) b!1372539))

(assert (= (and b!1372539 res!915805) b!1372538))

(assert (= (and b!1372538 res!915811) b!1372542))

(assert (= (and b!1372542 res!915808) b!1372541))

(assert (= (and b!1372541 res!915810) b!1372540))

(assert (= (and b!1372540 res!915807) b!1372537))

(declare-fun m!1255969 () Bool)

(assert (=> b!1372537 m!1255969))

(declare-fun m!1255971 () Bool)

(assert (=> b!1372537 m!1255971))

(declare-fun m!1255973 () Bool)

(assert (=> b!1372539 m!1255973))

(declare-fun m!1255975 () Bool)

(assert (=> b!1372540 m!1255975))

(declare-fun m!1255977 () Bool)

(assert (=> b!1372543 m!1255977))

(declare-fun m!1255979 () Bool)

(assert (=> start!116260 m!1255979))

(declare-fun m!1255981 () Bool)

(assert (=> b!1372541 m!1255981))

(declare-fun m!1255983 () Bool)

(assert (=> b!1372538 m!1255983))

(declare-fun m!1255985 () Bool)

(assert (=> b!1372542 m!1255985))

(check-sat (not b!1372541) (not b!1372537) (not b!1372538) (not start!116260) (not b!1372540) (not b!1372542) (not b!1372539) (not b!1372543))
(check-sat)
