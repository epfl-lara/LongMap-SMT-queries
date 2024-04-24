; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116086 () Bool)

(assert start!116086)

(declare-fun b!1370917 () Bool)

(declare-fun res!913596 () Bool)

(declare-fun e!776716 () Bool)

(assert (=> b!1370917 (=> (not res!913596) (not e!776716))))

(declare-datatypes ((List!32017 0))(
  ( (Nil!32014) (Cons!32013 (h!33231 (_ BitVec 64)) (t!46703 List!32017)) )
))
(declare-fun newAcc!98 () List!32017)

(declare-fun contains!9702 (List!32017 (_ BitVec 64)) Bool)

(assert (=> b!1370917 (= res!913596 (not (contains!9702 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370918 () Bool)

(declare-fun res!913597 () Bool)

(assert (=> b!1370918 (=> (not res!913597) (not e!776716))))

(declare-fun acc!866 () List!32017)

(assert (=> b!1370918 (= res!913597 (not (contains!9702 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370919 () Bool)

(assert (=> b!1370919 (= e!776716 false)))

(declare-datatypes ((array!93091 0))(
  ( (array!93092 (arr!44962 (Array (_ BitVec 32) (_ BitVec 64))) (size!45513 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93091)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602775 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93091 (_ BitVec 32) List!32017) Bool)

(assert (=> b!1370919 (= lt!602775 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45194 0))(
  ( (Unit!45195) )
))
(declare-fun lt!602774 () Unit!45194)

(declare-fun noDuplicateSubseq!248 (List!32017 List!32017) Unit!45194)

(assert (=> b!1370919 (= lt!602774 (noDuplicateSubseq!248 newAcc!98 acc!866))))

(declare-fun res!913598 () Bool)

(assert (=> start!116086 (=> (not res!913598) (not e!776716))))

(assert (=> start!116086 (= res!913598 (and (bvslt (size!45513 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45513 a!3861))))))

(assert (=> start!116086 e!776716))

(declare-fun array_inv!34243 (array!93091) Bool)

(assert (=> start!116086 (array_inv!34243 a!3861)))

(assert (=> start!116086 true))

(declare-fun b!1370920 () Bool)

(declare-fun res!913600 () Bool)

(assert (=> b!1370920 (=> (not res!913600) (not e!776716))))

(assert (=> b!1370920 (= res!913600 (not (contains!9702 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370921 () Bool)

(declare-fun res!913602 () Bool)

(assert (=> b!1370921 (=> (not res!913602) (not e!776716))))

(assert (=> b!1370921 (= res!913602 (not (contains!9702 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370922 () Bool)

(declare-fun res!913601 () Bool)

(assert (=> b!1370922 (=> (not res!913601) (not e!776716))))

(declare-fun subseq!1061 (List!32017 List!32017) Bool)

(assert (=> b!1370922 (= res!913601 (subseq!1061 newAcc!98 acc!866))))

(declare-fun b!1370923 () Bool)

(declare-fun res!913599 () Bool)

(assert (=> b!1370923 (=> (not res!913599) (not e!776716))))

(declare-fun noDuplicate!2533 (List!32017) Bool)

(assert (=> b!1370923 (= res!913599 (noDuplicate!2533 acc!866))))

(assert (= (and start!116086 res!913598) b!1370923))

(assert (= (and b!1370923 res!913599) b!1370920))

(assert (= (and b!1370920 res!913600) b!1370918))

(assert (= (and b!1370918 res!913597) b!1370917))

(assert (= (and b!1370917 res!913596) b!1370921))

(assert (= (and b!1370921 res!913602) b!1370922))

(assert (= (and b!1370922 res!913601) b!1370919))

(declare-fun m!1254961 () Bool)

(assert (=> b!1370922 m!1254961))

(declare-fun m!1254963 () Bool)

(assert (=> start!116086 m!1254963))

(declare-fun m!1254965 () Bool)

(assert (=> b!1370923 m!1254965))

(declare-fun m!1254967 () Bool)

(assert (=> b!1370921 m!1254967))

(declare-fun m!1254969 () Bool)

(assert (=> b!1370919 m!1254969))

(declare-fun m!1254971 () Bool)

(assert (=> b!1370919 m!1254971))

(declare-fun m!1254973 () Bool)

(assert (=> b!1370920 m!1254973))

(declare-fun m!1254975 () Bool)

(assert (=> b!1370917 m!1254975))

(declare-fun m!1254977 () Bool)

(assert (=> b!1370918 m!1254977))

(check-sat (not b!1370922) (not b!1370917) (not b!1370919) (not b!1370920) (not b!1370923) (not start!116086) (not b!1370918) (not b!1370921))
(check-sat)
