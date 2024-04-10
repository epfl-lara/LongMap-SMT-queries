; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115432 () Bool)

(assert start!115432)

(declare-fun b!1364980 () Bool)

(declare-fun e!774103 () Bool)

(assert (=> b!1364980 (= e!774103 false)))

(declare-datatypes ((Unit!45047 0))(
  ( (Unit!45048) )
))
(declare-fun lt!601171 () Unit!45047)

(declare-datatypes ((List!31873 0))(
  ( (Nil!31870) (Cons!31869 (h!33078 (_ BitVec 64)) (t!46567 List!31873)) )
))
(declare-fun newAcc!98 () List!31873)

(declare-fun acc!866 () List!31873)

(declare-fun noDuplicateSubseq!144 (List!31873 List!31873) Unit!45047)

(assert (=> b!1364980 (= lt!601171 (noDuplicateSubseq!144 newAcc!98 acc!866))))

(declare-fun res!908558 () Bool)

(assert (=> start!115432 (=> (not res!908558) (not e!774103))))

(declare-datatypes ((array!92753 0))(
  ( (array!92754 (arr!44805 (Array (_ BitVec 32) (_ BitVec 64))) (size!45355 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92753)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115432 (= res!908558 (and (bvslt (size!45355 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45355 a!3861))))))

(assert (=> start!115432 e!774103))

(declare-fun array_inv!33833 (array!92753) Bool)

(assert (=> start!115432 (array_inv!33833 a!3861)))

(assert (=> start!115432 true))

(declare-fun b!1364981 () Bool)

(declare-fun res!908556 () Bool)

(assert (=> b!1364981 (=> (not res!908556) (not e!774103))))

(declare-fun contains!9555 (List!31873 (_ BitVec 64)) Bool)

(assert (=> b!1364981 (= res!908556 (not (contains!9555 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364982 () Bool)

(declare-fun res!908557 () Bool)

(assert (=> b!1364982 (=> (not res!908557) (not e!774103))))

(declare-fun subseq!957 (List!31873 List!31873) Bool)

(assert (=> b!1364982 (= res!908557 (subseq!957 newAcc!98 acc!866))))

(declare-fun b!1364983 () Bool)

(declare-fun res!908555 () Bool)

(assert (=> b!1364983 (=> (not res!908555) (not e!774103))))

(assert (=> b!1364983 (= res!908555 (not (contains!9555 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364984 () Bool)

(declare-fun res!908560 () Bool)

(assert (=> b!1364984 (=> (not res!908560) (not e!774103))))

(declare-fun noDuplicate!2412 (List!31873) Bool)

(assert (=> b!1364984 (= res!908560 (noDuplicate!2412 acc!866))))

(declare-fun b!1364985 () Bool)

(declare-fun res!908554 () Bool)

(assert (=> b!1364985 (=> (not res!908554) (not e!774103))))

(assert (=> b!1364985 (= res!908554 (not (contains!9555 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364986 () Bool)

(declare-fun res!908559 () Bool)

(assert (=> b!1364986 (=> (not res!908559) (not e!774103))))

(assert (=> b!1364986 (= res!908559 (not (contains!9555 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115432 res!908558) b!1364984))

(assert (= (and b!1364984 res!908560) b!1364986))

(assert (= (and b!1364986 res!908559) b!1364981))

(assert (= (and b!1364981 res!908556) b!1364983))

(assert (= (and b!1364983 res!908555) b!1364985))

(assert (= (and b!1364985 res!908554) b!1364982))

(assert (= (and b!1364982 res!908557) b!1364980))

(declare-fun m!1249661 () Bool)

(assert (=> b!1364984 m!1249661))

(declare-fun m!1249663 () Bool)

(assert (=> b!1364985 m!1249663))

(declare-fun m!1249665 () Bool)

(assert (=> start!115432 m!1249665))

(declare-fun m!1249667 () Bool)

(assert (=> b!1364982 m!1249667))

(declare-fun m!1249669 () Bool)

(assert (=> b!1364981 m!1249669))

(declare-fun m!1249671 () Bool)

(assert (=> b!1364980 m!1249671))

(declare-fun m!1249673 () Bool)

(assert (=> b!1364986 m!1249673))

(declare-fun m!1249675 () Bool)

(assert (=> b!1364983 m!1249675))

(check-sat (not b!1364980) (not start!115432) (not b!1364985) (not b!1364983) (not b!1364982) (not b!1364984) (not b!1364981) (not b!1364986))
(check-sat)
