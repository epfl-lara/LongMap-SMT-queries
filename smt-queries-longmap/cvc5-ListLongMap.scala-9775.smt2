; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115856 () Bool)

(assert start!115856)

(declare-fun res!913003 () Bool)

(declare-fun e!775849 () Bool)

(assert (=> start!115856 (=> (not res!913003) (not e!775849))))

(declare-datatypes ((array!92970 0))(
  ( (array!92971 (arr!44906 (Array (_ BitVec 32) (_ BitVec 64))) (size!45456 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92970)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115856 (= res!913003 (and (bvslt (size!45456 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45456 a!3861))))))

(assert (=> start!115856 e!775849))

(declare-fun array_inv!33934 (array!92970) Bool)

(assert (=> start!115856 (array_inv!33934 a!3861)))

(assert (=> start!115856 true))

(declare-fun b!1369541 () Bool)

(declare-fun res!913005 () Bool)

(assert (=> b!1369541 (=> (not res!913005) (not e!775849))))

(declare-datatypes ((List!31974 0))(
  ( (Nil!31971) (Cons!31970 (h!33179 (_ BitVec 64)) (t!46668 List!31974)) )
))
(declare-fun acc!866 () List!31974)

(declare-fun contains!9656 (List!31974 (_ BitVec 64)) Bool)

(assert (=> b!1369541 (= res!913005 (not (contains!9656 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369542 () Bool)

(declare-fun res!913002 () Bool)

(assert (=> b!1369542 (=> (not res!913002) (not e!775849))))

(declare-fun noDuplicate!2513 (List!31974) Bool)

(assert (=> b!1369542 (= res!913002 (noDuplicate!2513 acc!866))))

(declare-fun b!1369543 () Bool)

(declare-fun res!913009 () Bool)

(assert (=> b!1369543 (=> (not res!913009) (not e!775849))))

(declare-fun newAcc!98 () List!31974)

(declare-fun subseq!1058 (List!31974 List!31974) Bool)

(assert (=> b!1369543 (= res!913009 (subseq!1058 newAcc!98 acc!866))))

(declare-fun b!1369544 () Bool)

(declare-fun res!913007 () Bool)

(declare-fun e!775848 () Bool)

(assert (=> b!1369544 (=> (not res!913007) (not e!775848))))

(assert (=> b!1369544 (= res!913007 (bvsge from!3239 (size!45456 a!3861)))))

(declare-fun b!1369545 () Bool)

(declare-fun res!913006 () Bool)

(assert (=> b!1369545 (=> (not res!913006) (not e!775849))))

(assert (=> b!1369545 (= res!913006 (not (contains!9656 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369546 () Bool)

(declare-fun res!913004 () Bool)

(assert (=> b!1369546 (=> (not res!913004) (not e!775849))))

(assert (=> b!1369546 (= res!913004 (not (contains!9656 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369547 () Bool)

(declare-fun res!913001 () Bool)

(assert (=> b!1369547 (=> (not res!913001) (not e!775849))))

(assert (=> b!1369547 (= res!913001 (not (contains!9656 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369548 () Bool)

(assert (=> b!1369548 (= e!775849 e!775848)))

(declare-fun res!913008 () Bool)

(assert (=> b!1369548 (=> (not res!913008) (not e!775848))))

(declare-fun arrayNoDuplicates!0 (array!92970 (_ BitVec 32) List!31974) Bool)

(assert (=> b!1369548 (= res!913008 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45249 0))(
  ( (Unit!45250) )
))
(declare-fun lt!602280 () Unit!45249)

(declare-fun noDuplicateSubseq!245 (List!31974 List!31974) Unit!45249)

(assert (=> b!1369548 (= lt!602280 (noDuplicateSubseq!245 newAcc!98 acc!866))))

(declare-fun b!1369549 () Bool)

(assert (=> b!1369549 (= e!775848 false)))

(declare-fun lt!602281 () Bool)

(assert (=> b!1369549 (= lt!602281 (noDuplicate!2513 newAcc!98))))

(assert (= (and start!115856 res!913003) b!1369542))

(assert (= (and b!1369542 res!913002) b!1369547))

(assert (= (and b!1369547 res!913001) b!1369541))

(assert (= (and b!1369541 res!913005) b!1369545))

(assert (= (and b!1369545 res!913006) b!1369546))

(assert (= (and b!1369546 res!913004) b!1369543))

(assert (= (and b!1369543 res!913009) b!1369548))

(assert (= (and b!1369548 res!913008) b!1369544))

(assert (= (and b!1369544 res!913007) b!1369549))

(declare-fun m!1253305 () Bool)

(assert (=> b!1369546 m!1253305))

(declare-fun m!1253307 () Bool)

(assert (=> b!1369543 m!1253307))

(declare-fun m!1253309 () Bool)

(assert (=> b!1369549 m!1253309))

(declare-fun m!1253311 () Bool)

(assert (=> b!1369548 m!1253311))

(declare-fun m!1253313 () Bool)

(assert (=> b!1369548 m!1253313))

(declare-fun m!1253315 () Bool)

(assert (=> b!1369542 m!1253315))

(declare-fun m!1253317 () Bool)

(assert (=> b!1369545 m!1253317))

(declare-fun m!1253319 () Bool)

(assert (=> b!1369547 m!1253319))

(declare-fun m!1253321 () Bool)

(assert (=> b!1369541 m!1253321))

(declare-fun m!1253323 () Bool)

(assert (=> start!115856 m!1253323))

(push 1)

