; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115870 () Bool)

(assert start!115870)

(declare-fun b!1369703 () Bool)

(declare-fun res!913166 () Bool)

(declare-fun e!775897 () Bool)

(assert (=> b!1369703 (=> (not res!913166) (not e!775897))))

(declare-datatypes ((List!31981 0))(
  ( (Nil!31978) (Cons!31977 (h!33186 (_ BitVec 64)) (t!46675 List!31981)) )
))
(declare-fun acc!866 () List!31981)

(declare-fun contains!9663 (List!31981 (_ BitVec 64)) Bool)

(assert (=> b!1369703 (= res!913166 (not (contains!9663 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369704 () Bool)

(assert (=> b!1369704 (= e!775897 false)))

(declare-datatypes ((array!92984 0))(
  ( (array!92985 (arr!44913 (Array (_ BitVec 32) (_ BitVec 64))) (size!45463 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92984)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602322 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92984 (_ BitVec 32) List!31981) Bool)

(assert (=> b!1369704 (= lt!602322 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45263 0))(
  ( (Unit!45264) )
))
(declare-fun lt!602323 () Unit!45263)

(declare-fun newAcc!98 () List!31981)

(declare-fun noDuplicateSubseq!252 (List!31981 List!31981) Unit!45263)

(assert (=> b!1369704 (= lt!602323 (noDuplicateSubseq!252 newAcc!98 acc!866))))

(declare-fun b!1369705 () Bool)

(declare-fun res!913163 () Bool)

(assert (=> b!1369705 (=> (not res!913163) (not e!775897))))

(declare-fun noDuplicate!2520 (List!31981) Bool)

(assert (=> b!1369705 (= res!913163 (noDuplicate!2520 acc!866))))

(declare-fun b!1369706 () Bool)

(declare-fun res!913168 () Bool)

(assert (=> b!1369706 (=> (not res!913168) (not e!775897))))

(declare-fun subseq!1065 (List!31981 List!31981) Bool)

(assert (=> b!1369706 (= res!913168 (subseq!1065 newAcc!98 acc!866))))

(declare-fun b!1369707 () Bool)

(declare-fun res!913164 () Bool)

(assert (=> b!1369707 (=> (not res!913164) (not e!775897))))

(assert (=> b!1369707 (= res!913164 (not (contains!9663 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369708 () Bool)

(declare-fun res!913167 () Bool)

(assert (=> b!1369708 (=> (not res!913167) (not e!775897))))

(assert (=> b!1369708 (= res!913167 (not (contains!9663 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369702 () Bool)

(declare-fun res!913165 () Bool)

(assert (=> b!1369702 (=> (not res!913165) (not e!775897))))

(assert (=> b!1369702 (= res!913165 (not (contains!9663 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913162 () Bool)

(assert (=> start!115870 (=> (not res!913162) (not e!775897))))

(assert (=> start!115870 (= res!913162 (and (bvslt (size!45463 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45463 a!3861))))))

(assert (=> start!115870 e!775897))

(declare-fun array_inv!33941 (array!92984) Bool)

(assert (=> start!115870 (array_inv!33941 a!3861)))

(assert (=> start!115870 true))

(assert (= (and start!115870 res!913162) b!1369705))

(assert (= (and b!1369705 res!913163) b!1369703))

(assert (= (and b!1369703 res!913166) b!1369707))

(assert (= (and b!1369707 res!913164) b!1369702))

(assert (= (and b!1369702 res!913165) b!1369708))

(assert (= (and b!1369708 res!913167) b!1369706))

(assert (= (and b!1369706 res!913168) b!1369704))

(declare-fun m!1253437 () Bool)

(assert (=> b!1369705 m!1253437))

(declare-fun m!1253439 () Bool)

(assert (=> b!1369707 m!1253439))

(declare-fun m!1253441 () Bool)

(assert (=> b!1369708 m!1253441))

(declare-fun m!1253443 () Bool)

(assert (=> b!1369702 m!1253443))

(declare-fun m!1253445 () Bool)

(assert (=> b!1369706 m!1253445))

(declare-fun m!1253447 () Bool)

(assert (=> b!1369704 m!1253447))

(declare-fun m!1253449 () Bool)

(assert (=> b!1369704 m!1253449))

(declare-fun m!1253451 () Bool)

(assert (=> start!115870 m!1253451))

(declare-fun m!1253453 () Bool)

(assert (=> b!1369703 m!1253453))

(check-sat (not b!1369704) (not b!1369706) (not b!1369703) (not b!1369705) (not b!1369702) (not b!1369707) (not b!1369708) (not start!115870))
(check-sat)
