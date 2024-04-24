; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115642 () Bool)

(assert start!115642)

(declare-fun b!1366132 () Bool)

(declare-fun res!908928 () Bool)

(declare-fun e!774903 () Bool)

(assert (=> b!1366132 (=> (not res!908928) (not e!774903))))

(declare-datatypes ((List!31906 0))(
  ( (Nil!31903) (Cons!31902 (h!33120 (_ BitVec 64)) (t!46592 List!31906)) )
))
(declare-fun newAcc!98 () List!31906)

(declare-fun contains!9591 (List!31906 (_ BitVec 64)) Bool)

(assert (=> b!1366132 (= res!908928 (not (contains!9591 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366133 () Bool)

(declare-fun res!908925 () Bool)

(assert (=> b!1366133 (=> (not res!908925) (not e!774903))))

(assert (=> b!1366133 (= res!908925 (not (contains!9591 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366134 () Bool)

(declare-fun res!908930 () Bool)

(assert (=> b!1366134 (=> (not res!908930) (not e!774903))))

(declare-fun acc!866 () List!31906)

(declare-fun noDuplicate!2422 (List!31906) Bool)

(assert (=> b!1366134 (= res!908930 (noDuplicate!2422 acc!866))))

(declare-fun res!908926 () Bool)

(assert (=> start!115642 (=> (not res!908926) (not e!774903))))

(declare-datatypes ((array!92854 0))(
  ( (array!92855 (arr!44851 (Array (_ BitVec 32) (_ BitVec 64))) (size!45402 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92854)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115642 (= res!908926 (and (bvslt (size!45402 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45402 a!3861))))))

(assert (=> start!115642 e!774903))

(declare-fun array_inv!34132 (array!92854) Bool)

(assert (=> start!115642 (array_inv!34132 a!3861)))

(assert (=> start!115642 true))

(declare-fun b!1366135 () Bool)

(declare-fun res!908931 () Bool)

(assert (=> b!1366135 (=> (not res!908931) (not e!774903))))

(assert (=> b!1366135 (= res!908931 (not (contains!9591 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366136 () Bool)

(declare-fun res!908929 () Bool)

(assert (=> b!1366136 (=> (not res!908929) (not e!774903))))

(assert (=> b!1366136 (= res!908929 (not (contains!9591 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366137 () Bool)

(declare-fun res!908927 () Bool)

(assert (=> b!1366137 (=> (not res!908927) (not e!774903))))

(declare-fun subseq!950 (List!31906 List!31906) Bool)

(assert (=> b!1366137 (= res!908927 (subseq!950 newAcc!98 acc!866))))

(declare-fun b!1366138 () Bool)

(assert (=> b!1366138 (= e!774903 false)))

(declare-datatypes ((Unit!44972 0))(
  ( (Unit!44973) )
))
(declare-fun lt!601626 () Unit!44972)

(declare-fun noDuplicateSubseq!137 (List!31906 List!31906) Unit!44972)

(assert (=> b!1366138 (= lt!601626 (noDuplicateSubseq!137 newAcc!98 acc!866))))

(assert (= (and start!115642 res!908926) b!1366134))

(assert (= (and b!1366134 res!908930) b!1366135))

(assert (= (and b!1366135 res!908931) b!1366136))

(assert (= (and b!1366136 res!908929) b!1366133))

(assert (= (and b!1366133 res!908925) b!1366132))

(assert (= (and b!1366132 res!908928) b!1366137))

(assert (= (and b!1366137 res!908927) b!1366138))

(declare-fun m!1251145 () Bool)

(assert (=> b!1366136 m!1251145))

(declare-fun m!1251147 () Bool)

(assert (=> b!1366134 m!1251147))

(declare-fun m!1251149 () Bool)

(assert (=> start!115642 m!1251149))

(declare-fun m!1251151 () Bool)

(assert (=> b!1366137 m!1251151))

(declare-fun m!1251153 () Bool)

(assert (=> b!1366135 m!1251153))

(declare-fun m!1251155 () Bool)

(assert (=> b!1366138 m!1251155))

(declare-fun m!1251157 () Bool)

(assert (=> b!1366133 m!1251157))

(declare-fun m!1251159 () Bool)

(assert (=> b!1366132 m!1251159))

(check-sat (not b!1366136) (not b!1366137) (not b!1366135) (not b!1366132) (not b!1366134) (not b!1366138) (not start!115642) (not b!1366133))
(check-sat)
