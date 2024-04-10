; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115862 () Bool)

(assert start!115862)

(declare-fun b!1369618 () Bool)

(declare-fun res!913079 () Bool)

(declare-fun e!775872 () Bool)

(assert (=> b!1369618 (=> (not res!913079) (not e!775872))))

(declare-datatypes ((List!31977 0))(
  ( (Nil!31974) (Cons!31973 (h!33182 (_ BitVec 64)) (t!46671 List!31977)) )
))
(declare-fun newAcc!98 () List!31977)

(declare-fun contains!9659 (List!31977 (_ BitVec 64)) Bool)

(assert (=> b!1369618 (= res!913079 (not (contains!9659 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369619 () Bool)

(declare-fun res!913082 () Bool)

(assert (=> b!1369619 (=> (not res!913082) (not e!775872))))

(assert (=> b!1369619 (= res!913082 (not (contains!9659 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369620 () Bool)

(declare-fun res!913078 () Bool)

(assert (=> b!1369620 (=> (not res!913078) (not e!775872))))

(declare-fun acc!866 () List!31977)

(declare-fun subseq!1061 (List!31977 List!31977) Bool)

(assert (=> b!1369620 (= res!913078 (subseq!1061 newAcc!98 acc!866))))

(declare-fun b!1369621 () Bool)

(declare-fun res!913083 () Bool)

(assert (=> b!1369621 (=> (not res!913083) (not e!775872))))

(assert (=> b!1369621 (= res!913083 (not (contains!9659 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369622 () Bool)

(declare-fun res!913080 () Bool)

(assert (=> b!1369622 (=> (not res!913080) (not e!775872))))

(declare-fun noDuplicate!2516 (List!31977) Bool)

(assert (=> b!1369622 (= res!913080 (noDuplicate!2516 acc!866))))

(declare-fun res!913084 () Bool)

(assert (=> start!115862 (=> (not res!913084) (not e!775872))))

(declare-datatypes ((array!92976 0))(
  ( (array!92977 (arr!44909 (Array (_ BitVec 32) (_ BitVec 64))) (size!45459 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92976)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115862 (= res!913084 (and (bvslt (size!45459 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45459 a!3861))))))

(assert (=> start!115862 e!775872))

(declare-fun array_inv!33937 (array!92976) Bool)

(assert (=> start!115862 (array_inv!33937 a!3861)))

(assert (=> start!115862 true))

(declare-fun b!1369623 () Bool)

(assert (=> b!1369623 (= e!775872 false)))

(declare-fun lt!602299 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92976 (_ BitVec 32) List!31977) Bool)

(assert (=> b!1369623 (= lt!602299 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45255 0))(
  ( (Unit!45256) )
))
(declare-fun lt!602298 () Unit!45255)

(declare-fun noDuplicateSubseq!248 (List!31977 List!31977) Unit!45255)

(assert (=> b!1369623 (= lt!602298 (noDuplicateSubseq!248 newAcc!98 acc!866))))

(declare-fun b!1369624 () Bool)

(declare-fun res!913081 () Bool)

(assert (=> b!1369624 (=> (not res!913081) (not e!775872))))

(assert (=> b!1369624 (= res!913081 (not (contains!9659 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115862 res!913084) b!1369622))

(assert (= (and b!1369622 res!913080) b!1369624))

(assert (= (and b!1369624 res!913081) b!1369621))

(assert (= (and b!1369621 res!913083) b!1369618))

(assert (= (and b!1369618 res!913079) b!1369619))

(assert (= (and b!1369619 res!913082) b!1369620))

(assert (= (and b!1369620 res!913078) b!1369623))

(declare-fun m!1253365 () Bool)

(assert (=> b!1369623 m!1253365))

(declare-fun m!1253367 () Bool)

(assert (=> b!1369623 m!1253367))

(declare-fun m!1253369 () Bool)

(assert (=> b!1369622 m!1253369))

(declare-fun m!1253371 () Bool)

(assert (=> start!115862 m!1253371))

(declare-fun m!1253373 () Bool)

(assert (=> b!1369621 m!1253373))

(declare-fun m!1253375 () Bool)

(assert (=> b!1369618 m!1253375))

(declare-fun m!1253377 () Bool)

(assert (=> b!1369624 m!1253377))

(declare-fun m!1253379 () Bool)

(assert (=> b!1369620 m!1253379))

(declare-fun m!1253381 () Bool)

(assert (=> b!1369619 m!1253381))

(push 1)

(assert (not b!1369618))

(assert (not b!1369622))

(assert (not start!115862))

(assert (not b!1369620))

(assert (not b!1369621))

(assert (not b!1369623))

(assert (not b!1369624))

(assert (not b!1369619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

