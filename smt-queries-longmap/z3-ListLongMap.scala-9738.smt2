; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115636 () Bool)

(assert start!115636)

(declare-fun b!1366076 () Bool)

(declare-fun res!908874 () Bool)

(declare-fun e!774886 () Bool)

(assert (=> b!1366076 (=> (not res!908874) (not e!774886))))

(declare-datatypes ((List!31903 0))(
  ( (Nil!31900) (Cons!31899 (h!33117 (_ BitVec 64)) (t!46589 List!31903)) )
))
(declare-fun acc!866 () List!31903)

(declare-fun contains!9588 (List!31903 (_ BitVec 64)) Bool)

(assert (=> b!1366076 (= res!908874 (not (contains!9588 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366077 () Bool)

(assert (=> b!1366077 (= e!774886 false)))

(declare-fun res!908871 () Bool)

(assert (=> start!115636 (=> (not res!908871) (not e!774886))))

(declare-datatypes ((array!92848 0))(
  ( (array!92849 (arr!44848 (Array (_ BitVec 32) (_ BitVec 64))) (size!45399 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92848)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115636 (= res!908871 (and (bvslt (size!45399 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45399 a!3861))))))

(assert (=> start!115636 e!774886))

(declare-fun array_inv!34129 (array!92848) Bool)

(assert (=> start!115636 (array_inv!34129 a!3861)))

(assert (=> start!115636 true))

(declare-fun b!1366078 () Bool)

(declare-fun res!908869 () Bool)

(assert (=> b!1366078 (=> (not res!908869) (not e!774886))))

(declare-fun newAcc!98 () List!31903)

(assert (=> b!1366078 (= res!908869 (not (contains!9588 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366079 () Bool)

(declare-fun res!908873 () Bool)

(assert (=> b!1366079 (=> (not res!908873) (not e!774886))))

(declare-fun noDuplicate!2419 (List!31903) Bool)

(assert (=> b!1366079 (= res!908873 (noDuplicate!2419 acc!866))))

(declare-fun b!1366080 () Bool)

(declare-fun res!908872 () Bool)

(assert (=> b!1366080 (=> (not res!908872) (not e!774886))))

(assert (=> b!1366080 (= res!908872 (not (contains!9588 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366081 () Bool)

(declare-fun res!908870 () Bool)

(assert (=> b!1366081 (=> (not res!908870) (not e!774886))))

(assert (=> b!1366081 (= res!908870 (not (contains!9588 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115636 res!908871) b!1366079))

(assert (= (and b!1366079 res!908873) b!1366076))

(assert (= (and b!1366076 res!908874) b!1366080))

(assert (= (and b!1366080 res!908872) b!1366081))

(assert (= (and b!1366081 res!908870) b!1366078))

(assert (= (and b!1366078 res!908869) b!1366077))

(declare-fun m!1251109 () Bool)

(assert (=> b!1366081 m!1251109))

(declare-fun m!1251111 () Bool)

(assert (=> b!1366078 m!1251111))

(declare-fun m!1251113 () Bool)

(assert (=> start!115636 m!1251113))

(declare-fun m!1251115 () Bool)

(assert (=> b!1366076 m!1251115))

(declare-fun m!1251117 () Bool)

(assert (=> b!1366079 m!1251117))

(declare-fun m!1251119 () Bool)

(assert (=> b!1366080 m!1251119))

(check-sat (not b!1366076) (not b!1366078) (not start!115636) (not b!1366079) (not b!1366080) (not b!1366081))
(check-sat)
