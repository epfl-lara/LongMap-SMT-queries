; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115708 () Bool)

(assert start!115708)

(declare-fun b!1368306 () Bool)

(declare-fun res!911867 () Bool)

(declare-fun e!775284 () Bool)

(assert (=> b!1368306 (=> (not res!911867) (not e!775284))))

(declare-datatypes ((List!32000 0))(
  ( (Nil!31997) (Cons!31996 (h!33205 (_ BitVec 64)) (t!46686 List!32000)) )
))
(declare-fun newAcc!98 () List!32000)

(declare-fun contains!9593 (List!32000 (_ BitVec 64)) Bool)

(assert (=> b!1368306 (= res!911867 (not (contains!9593 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911863 () Bool)

(assert (=> start!115708 (=> (not res!911863) (not e!775284))))

(declare-datatypes ((array!92859 0))(
  ( (array!92860 (arr!44854 (Array (_ BitVec 32) (_ BitVec 64))) (size!45406 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92859)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115708 (= res!911863 (and (bvslt (size!45406 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45406 a!3861))))))

(assert (=> start!115708 e!775284))

(declare-fun array_inv!34087 (array!92859) Bool)

(assert (=> start!115708 (array_inv!34087 a!3861)))

(assert (=> start!115708 true))

(declare-fun b!1368307 () Bool)

(declare-fun res!911857 () Bool)

(assert (=> b!1368307 (=> (not res!911857) (not e!775284))))

(assert (=> b!1368307 (= res!911857 (not (contains!9593 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368308 () Bool)

(declare-fun res!911862 () Bool)

(declare-fun e!775283 () Bool)

(assert (=> b!1368308 (=> (not res!911862) (not e!775283))))

(assert (=> b!1368308 (= res!911862 (bvslt from!3239 (size!45406 a!3861)))))

(declare-fun b!1368309 () Bool)

(declare-fun res!911860 () Bool)

(assert (=> b!1368309 (=> (not res!911860) (not e!775284))))

(declare-fun acc!866 () List!32000)

(assert (=> b!1368309 (= res!911860 (not (contains!9593 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368310 () Bool)

(declare-fun res!911864 () Bool)

(assert (=> b!1368310 (=> (not res!911864) (not e!775284))))

(assert (=> b!1368310 (= res!911864 (not (contains!9593 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368311 () Bool)

(declare-fun res!911865 () Bool)

(assert (=> b!1368311 (=> (not res!911865) (not e!775284))))

(declare-fun subseq!1031 (List!32000 List!32000) Bool)

(assert (=> b!1368311 (= res!911865 (subseq!1031 newAcc!98 acc!866))))

(declare-fun b!1368312 () Bool)

(assert (=> b!1368312 (= e!775284 e!775283)))

(declare-fun res!911866 () Bool)

(assert (=> b!1368312 (=> (not res!911866) (not e!775283))))

(declare-fun arrayNoDuplicates!0 (array!92859 (_ BitVec 32) List!32000) Bool)

(assert (=> b!1368312 (= res!911866 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45036 0))(
  ( (Unit!45037) )
))
(declare-fun lt!601869 () Unit!45036)

(declare-fun noDuplicateSubseq!218 (List!32000 List!32000) Unit!45036)

(assert (=> b!1368312 (= lt!601869 (noDuplicateSubseq!218 newAcc!98 acc!866))))

(declare-fun b!1368313 () Bool)

(assert (=> b!1368313 (= e!775283 false)))

(declare-fun lt!601868 () Bool)

(assert (=> b!1368313 (= lt!601868 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368314 () Bool)

(declare-fun res!911859 () Bool)

(assert (=> b!1368314 (=> (not res!911859) (not e!775283))))

(assert (=> b!1368314 (= res!911859 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368315 () Bool)

(declare-fun res!911858 () Bool)

(assert (=> b!1368315 (=> (not res!911858) (not e!775283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368315 (= res!911858 (not (validKeyInArray!0 (select (arr!44854 a!3861) from!3239))))))

(declare-fun b!1368316 () Bool)

(declare-fun res!911861 () Bool)

(assert (=> b!1368316 (=> (not res!911861) (not e!775284))))

(declare-fun noDuplicate!2508 (List!32000) Bool)

(assert (=> b!1368316 (= res!911861 (noDuplicate!2508 acc!866))))

(assert (= (and start!115708 res!911863) b!1368316))

(assert (= (and b!1368316 res!911861) b!1368309))

(assert (= (and b!1368309 res!911860) b!1368310))

(assert (= (and b!1368310 res!911864) b!1368307))

(assert (= (and b!1368307 res!911857) b!1368306))

(assert (= (and b!1368306 res!911867) b!1368311))

(assert (= (and b!1368311 res!911865) b!1368312))

(assert (= (and b!1368312 res!911866) b!1368308))

(assert (= (and b!1368308 res!911862) b!1368315))

(assert (= (and b!1368315 res!911858) b!1368314))

(assert (= (and b!1368314 res!911859) b!1368313))

(declare-fun m!1251837 () Bool)

(assert (=> b!1368316 m!1251837))

(declare-fun m!1251839 () Bool)

(assert (=> b!1368313 m!1251839))

(declare-fun m!1251841 () Bool)

(assert (=> b!1368312 m!1251841))

(declare-fun m!1251843 () Bool)

(assert (=> b!1368312 m!1251843))

(declare-fun m!1251845 () Bool)

(assert (=> b!1368310 m!1251845))

(declare-fun m!1251847 () Bool)

(assert (=> b!1368306 m!1251847))

(declare-fun m!1251849 () Bool)

(assert (=> start!115708 m!1251849))

(declare-fun m!1251851 () Bool)

(assert (=> b!1368315 m!1251851))

(assert (=> b!1368315 m!1251851))

(declare-fun m!1251853 () Bool)

(assert (=> b!1368315 m!1251853))

(declare-fun m!1251855 () Bool)

(assert (=> b!1368309 m!1251855))

(declare-fun m!1251857 () Bool)

(assert (=> b!1368311 m!1251857))

(declare-fun m!1251859 () Bool)

(assert (=> b!1368307 m!1251859))

(check-sat (not b!1368310) (not b!1368306) (not b!1368307) (not b!1368309) (not b!1368315) (not b!1368311) (not b!1368313) (not b!1368312) (not start!115708) (not b!1368316))
(check-sat)
