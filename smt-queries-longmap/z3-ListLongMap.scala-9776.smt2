; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115852 () Bool)

(assert start!115852)

(declare-fun b!1369546 () Bool)

(declare-fun res!913050 () Bool)

(declare-fun e!775839 () Bool)

(assert (=> b!1369546 (=> (not res!913050) (not e!775839))))

(declare-datatypes ((List!32030 0))(
  ( (Nil!32027) (Cons!32026 (h!33235 (_ BitVec 64)) (t!46716 List!32030)) )
))
(declare-fun acc!866 () List!32030)

(declare-fun noDuplicate!2538 (List!32030) Bool)

(assert (=> b!1369546 (= res!913050 (noDuplicate!2538 acc!866))))

(declare-fun res!913052 () Bool)

(assert (=> start!115852 (=> (not res!913052) (not e!775839))))

(declare-datatypes ((array!92925 0))(
  ( (array!92926 (arr!44884 (Array (_ BitVec 32) (_ BitVec 64))) (size!45436 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92925)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115852 (= res!913052 (and (bvslt (size!45436 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45436 a!3861))))))

(assert (=> start!115852 e!775839))

(declare-fun array_inv!34117 (array!92925) Bool)

(assert (=> start!115852 (array_inv!34117 a!3861)))

(assert (=> start!115852 true))

(declare-fun b!1369547 () Bool)

(declare-fun res!913053 () Bool)

(assert (=> b!1369547 (=> (not res!913053) (not e!775839))))

(declare-fun newAcc!98 () List!32030)

(declare-fun contains!9623 (List!32030 (_ BitVec 64)) Bool)

(assert (=> b!1369547 (= res!913053 (not (contains!9623 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369548 () Bool)

(assert (=> b!1369548 (= e!775839 false)))

(declare-fun lt!602111 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92925 (_ BitVec 32) List!32030) Bool)

(assert (=> b!1369548 (= lt!602111 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45096 0))(
  ( (Unit!45097) )
))
(declare-fun lt!602112 () Unit!45096)

(declare-fun noDuplicateSubseq!248 (List!32030 List!32030) Unit!45096)

(assert (=> b!1369548 (= lt!602112 (noDuplicateSubseq!248 newAcc!98 acc!866))))

(declare-fun b!1369549 () Bool)

(declare-fun res!913054 () Bool)

(assert (=> b!1369549 (=> (not res!913054) (not e!775839))))

(assert (=> b!1369549 (= res!913054 (not (contains!9623 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369550 () Bool)

(declare-fun res!913049 () Bool)

(assert (=> b!1369550 (=> (not res!913049) (not e!775839))))

(assert (=> b!1369550 (= res!913049 (not (contains!9623 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369551 () Bool)

(declare-fun res!913055 () Bool)

(assert (=> b!1369551 (=> (not res!913055) (not e!775839))))

(declare-fun subseq!1061 (List!32030 List!32030) Bool)

(assert (=> b!1369551 (= res!913055 (subseq!1061 newAcc!98 acc!866))))

(declare-fun b!1369552 () Bool)

(declare-fun res!913051 () Bool)

(assert (=> b!1369552 (=> (not res!913051) (not e!775839))))

(assert (=> b!1369552 (= res!913051 (not (contains!9623 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115852 res!913052) b!1369546))

(assert (= (and b!1369546 res!913050) b!1369549))

(assert (= (and b!1369549 res!913054) b!1369550))

(assert (= (and b!1369550 res!913049) b!1369552))

(assert (= (and b!1369552 res!913051) b!1369547))

(assert (= (and b!1369547 res!913053) b!1369551))

(assert (= (and b!1369551 res!913055) b!1369548))

(declare-fun m!1252839 () Bool)

(assert (=> b!1369549 m!1252839))

(declare-fun m!1252841 () Bool)

(assert (=> b!1369550 m!1252841))

(declare-fun m!1252843 () Bool)

(assert (=> b!1369551 m!1252843))

(declare-fun m!1252845 () Bool)

(assert (=> b!1369552 m!1252845))

(declare-fun m!1252847 () Bool)

(assert (=> start!115852 m!1252847))

(declare-fun m!1252849 () Bool)

(assert (=> b!1369547 m!1252849))

(declare-fun m!1252851 () Bool)

(assert (=> b!1369548 m!1252851))

(declare-fun m!1252853 () Bool)

(assert (=> b!1369548 m!1252853))

(declare-fun m!1252855 () Bool)

(assert (=> b!1369546 m!1252855))

(check-sat (not b!1369546) (not b!1369552) (not b!1369550) (not b!1369548) (not b!1369551) (not b!1369547) (not start!115852) (not b!1369549))
(check-sat)
