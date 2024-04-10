; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115864 () Bool)

(assert start!115864)

(declare-fun b!1369640 () Bool)

(declare-fun res!913100 () Bool)

(declare-fun e!775878 () Bool)

(assert (=> b!1369640 (=> (not res!913100) (not e!775878))))

(declare-datatypes ((List!31978 0))(
  ( (Nil!31975) (Cons!31974 (h!33183 (_ BitVec 64)) (t!46672 List!31978)) )
))
(declare-fun newAcc!98 () List!31978)

(declare-fun acc!866 () List!31978)

(declare-fun subseq!1062 (List!31978 List!31978) Bool)

(assert (=> b!1369640 (= res!913100 (subseq!1062 newAcc!98 acc!866))))

(declare-fun b!1369641 () Bool)

(declare-fun res!913103 () Bool)

(assert (=> b!1369641 (=> (not res!913103) (not e!775878))))

(declare-fun contains!9660 (List!31978 (_ BitVec 64)) Bool)

(assert (=> b!1369641 (= res!913103 (not (contains!9660 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369642 () Bool)

(assert (=> b!1369642 (= e!775878 false)))

(declare-datatypes ((array!92978 0))(
  ( (array!92979 (arr!44910 (Array (_ BitVec 32) (_ BitVec 64))) (size!45460 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92978)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602304 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92978 (_ BitVec 32) List!31978) Bool)

(assert (=> b!1369642 (= lt!602304 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45257 0))(
  ( (Unit!45258) )
))
(declare-fun lt!602305 () Unit!45257)

(declare-fun noDuplicateSubseq!249 (List!31978 List!31978) Unit!45257)

(assert (=> b!1369642 (= lt!602305 (noDuplicateSubseq!249 newAcc!98 acc!866))))

(declare-fun b!1369643 () Bool)

(declare-fun res!913101 () Bool)

(assert (=> b!1369643 (=> (not res!913101) (not e!775878))))

(assert (=> b!1369643 (= res!913101 (not (contains!9660 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369644 () Bool)

(declare-fun res!913099 () Bool)

(assert (=> b!1369644 (=> (not res!913099) (not e!775878))))

(assert (=> b!1369644 (= res!913099 (not (contains!9660 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369645 () Bool)

(declare-fun res!913105 () Bool)

(assert (=> b!1369645 (=> (not res!913105) (not e!775878))))

(assert (=> b!1369645 (= res!913105 (not (contains!9660 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369639 () Bool)

(declare-fun res!913102 () Bool)

(assert (=> b!1369639 (=> (not res!913102) (not e!775878))))

(declare-fun noDuplicate!2517 (List!31978) Bool)

(assert (=> b!1369639 (= res!913102 (noDuplicate!2517 acc!866))))

(declare-fun res!913104 () Bool)

(assert (=> start!115864 (=> (not res!913104) (not e!775878))))

(assert (=> start!115864 (= res!913104 (and (bvslt (size!45460 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45460 a!3861))))))

(assert (=> start!115864 e!775878))

(declare-fun array_inv!33938 (array!92978) Bool)

(assert (=> start!115864 (array_inv!33938 a!3861)))

(assert (=> start!115864 true))

(assert (= (and start!115864 res!913104) b!1369639))

(assert (= (and b!1369639 res!913102) b!1369641))

(assert (= (and b!1369641 res!913103) b!1369644))

(assert (= (and b!1369644 res!913099) b!1369643))

(assert (= (and b!1369643 res!913101) b!1369645))

(assert (= (and b!1369645 res!913105) b!1369640))

(assert (= (and b!1369640 res!913100) b!1369642))

(declare-fun m!1253383 () Bool)

(assert (=> start!115864 m!1253383))

(declare-fun m!1253385 () Bool)

(assert (=> b!1369644 m!1253385))

(declare-fun m!1253387 () Bool)

(assert (=> b!1369643 m!1253387))

(declare-fun m!1253389 () Bool)

(assert (=> b!1369642 m!1253389))

(declare-fun m!1253391 () Bool)

(assert (=> b!1369642 m!1253391))

(declare-fun m!1253393 () Bool)

(assert (=> b!1369640 m!1253393))

(declare-fun m!1253395 () Bool)

(assert (=> b!1369645 m!1253395))

(declare-fun m!1253397 () Bool)

(assert (=> b!1369641 m!1253397))

(declare-fun m!1253399 () Bool)

(assert (=> b!1369639 m!1253399))

(check-sat (not b!1369640) (not b!1369641) (not b!1369644) (not start!115864) (not b!1369645) (not b!1369642) (not b!1369643) (not b!1369639))
(check-sat)
