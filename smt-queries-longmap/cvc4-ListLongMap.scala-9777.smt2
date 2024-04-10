; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115872 () Bool)

(assert start!115872)

(declare-fun b!1369723 () Bool)

(declare-fun res!913185 () Bool)

(declare-fun e!775903 () Bool)

(assert (=> b!1369723 (=> (not res!913185) (not e!775903))))

(declare-datatypes ((List!31982 0))(
  ( (Nil!31979) (Cons!31978 (h!33187 (_ BitVec 64)) (t!46676 List!31982)) )
))
(declare-fun acc!866 () List!31982)

(declare-fun contains!9664 (List!31982 (_ BitVec 64)) Bool)

(assert (=> b!1369723 (= res!913185 (not (contains!9664 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913183 () Bool)

(assert (=> start!115872 (=> (not res!913183) (not e!775903))))

(declare-datatypes ((array!92986 0))(
  ( (array!92987 (arr!44914 (Array (_ BitVec 32) (_ BitVec 64))) (size!45464 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92986)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115872 (= res!913183 (and (bvslt (size!45464 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45464 a!3861))))))

(assert (=> start!115872 e!775903))

(declare-fun array_inv!33942 (array!92986) Bool)

(assert (=> start!115872 (array_inv!33942 a!3861)))

(assert (=> start!115872 true))

(declare-fun b!1369724 () Bool)

(assert (=> b!1369724 (= e!775903 false)))

(declare-fun lt!602329 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92986 (_ BitVec 32) List!31982) Bool)

(assert (=> b!1369724 (= lt!602329 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45265 0))(
  ( (Unit!45266) )
))
(declare-fun lt!602328 () Unit!45265)

(declare-fun newAcc!98 () List!31982)

(declare-fun noDuplicateSubseq!253 (List!31982 List!31982) Unit!45265)

(assert (=> b!1369724 (= lt!602328 (noDuplicateSubseq!253 newAcc!98 acc!866))))

(declare-fun b!1369725 () Bool)

(declare-fun res!913187 () Bool)

(assert (=> b!1369725 (=> (not res!913187) (not e!775903))))

(declare-fun subseq!1066 (List!31982 List!31982) Bool)

(assert (=> b!1369725 (= res!913187 (subseq!1066 newAcc!98 acc!866))))

(declare-fun b!1369726 () Bool)

(declare-fun res!913189 () Bool)

(assert (=> b!1369726 (=> (not res!913189) (not e!775903))))

(assert (=> b!1369726 (= res!913189 (not (contains!9664 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369727 () Bool)

(declare-fun res!913186 () Bool)

(assert (=> b!1369727 (=> (not res!913186) (not e!775903))))

(assert (=> b!1369727 (= res!913186 (not (contains!9664 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369728 () Bool)

(declare-fun res!913188 () Bool)

(assert (=> b!1369728 (=> (not res!913188) (not e!775903))))

(assert (=> b!1369728 (= res!913188 (not (contains!9664 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369729 () Bool)

(declare-fun res!913184 () Bool)

(assert (=> b!1369729 (=> (not res!913184) (not e!775903))))

(declare-fun noDuplicate!2521 (List!31982) Bool)

(assert (=> b!1369729 (= res!913184 (noDuplicate!2521 acc!866))))

(assert (= (and start!115872 res!913183) b!1369729))

(assert (= (and b!1369729 res!913184) b!1369723))

(assert (= (and b!1369723 res!913185) b!1369728))

(assert (= (and b!1369728 res!913188) b!1369726))

(assert (= (and b!1369726 res!913189) b!1369727))

(assert (= (and b!1369727 res!913186) b!1369725))

(assert (= (and b!1369725 res!913187) b!1369724))

(declare-fun m!1253455 () Bool)

(assert (=> b!1369726 m!1253455))

(declare-fun m!1253457 () Bool)

(assert (=> b!1369725 m!1253457))

(declare-fun m!1253459 () Bool)

(assert (=> b!1369727 m!1253459))

(declare-fun m!1253461 () Bool)

(assert (=> start!115872 m!1253461))

(declare-fun m!1253463 () Bool)

(assert (=> b!1369724 m!1253463))

(declare-fun m!1253465 () Bool)

(assert (=> b!1369724 m!1253465))

(declare-fun m!1253467 () Bool)

(assert (=> b!1369728 m!1253467))

(declare-fun m!1253469 () Bool)

(assert (=> b!1369723 m!1253469))

(declare-fun m!1253471 () Bool)

(assert (=> b!1369729 m!1253471))

(push 1)

(assert (not b!1369724))

(assert (not b!1369723))

(assert (not b!1369729))

(assert (not b!1369725))

(assert (not start!115872))

(assert (not b!1369727))

(assert (not b!1369728))

(assert (not b!1369726))

(check-sat)

