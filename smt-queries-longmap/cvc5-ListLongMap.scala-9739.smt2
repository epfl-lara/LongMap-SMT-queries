; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115418 () Bool)

(assert start!115418)

(declare-fun b!1364833 () Bool)

(declare-fun res!908407 () Bool)

(declare-fun e!774060 () Bool)

(assert (=> b!1364833 (=> (not res!908407) (not e!774060))))

(declare-datatypes ((List!31866 0))(
  ( (Nil!31863) (Cons!31862 (h!33071 (_ BitVec 64)) (t!46560 List!31866)) )
))
(declare-fun acc!866 () List!31866)

(declare-fun noDuplicate!2405 (List!31866) Bool)

(assert (=> b!1364833 (= res!908407 (noDuplicate!2405 acc!866))))

(declare-fun b!1364834 () Bool)

(declare-fun res!908409 () Bool)

(assert (=> b!1364834 (=> (not res!908409) (not e!774060))))

(declare-fun newAcc!98 () List!31866)

(declare-fun contains!9548 (List!31866 (_ BitVec 64)) Bool)

(assert (=> b!1364834 (= res!908409 (not (contains!9548 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364836 () Bool)

(assert (=> b!1364836 (= e!774060 false)))

(declare-datatypes ((Unit!45033 0))(
  ( (Unit!45034) )
))
(declare-fun lt!601150 () Unit!45033)

(declare-fun noDuplicateSubseq!137 (List!31866 List!31866) Unit!45033)

(assert (=> b!1364836 (= lt!601150 (noDuplicateSubseq!137 newAcc!98 acc!866))))

(declare-fun b!1364837 () Bool)

(declare-fun res!908408 () Bool)

(assert (=> b!1364837 (=> (not res!908408) (not e!774060))))

(declare-fun subseq!950 (List!31866 List!31866) Bool)

(assert (=> b!1364837 (= res!908408 (subseq!950 newAcc!98 acc!866))))

(declare-fun b!1364838 () Bool)

(declare-fun res!908413 () Bool)

(assert (=> b!1364838 (=> (not res!908413) (not e!774060))))

(assert (=> b!1364838 (= res!908413 (not (contains!9548 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364839 () Bool)

(declare-fun res!908411 () Bool)

(assert (=> b!1364839 (=> (not res!908411) (not e!774060))))

(assert (=> b!1364839 (= res!908411 (not (contains!9548 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908412 () Bool)

(assert (=> start!115418 (=> (not res!908412) (not e!774060))))

(declare-datatypes ((array!92739 0))(
  ( (array!92740 (arr!44798 (Array (_ BitVec 32) (_ BitVec 64))) (size!45348 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92739)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115418 (= res!908412 (and (bvslt (size!45348 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45348 a!3861))))))

(assert (=> start!115418 e!774060))

(declare-fun array_inv!33826 (array!92739) Bool)

(assert (=> start!115418 (array_inv!33826 a!3861)))

(assert (=> start!115418 true))

(declare-fun b!1364835 () Bool)

(declare-fun res!908410 () Bool)

(assert (=> b!1364835 (=> (not res!908410) (not e!774060))))

(assert (=> b!1364835 (= res!908410 (not (contains!9548 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115418 res!908412) b!1364833))

(assert (= (and b!1364833 res!908407) b!1364839))

(assert (= (and b!1364839 res!908411) b!1364838))

(assert (= (and b!1364838 res!908413) b!1364835))

(assert (= (and b!1364835 res!908410) b!1364834))

(assert (= (and b!1364834 res!908409) b!1364837))

(assert (= (and b!1364837 res!908408) b!1364836))

(declare-fun m!1249549 () Bool)

(assert (=> b!1364833 m!1249549))

(declare-fun m!1249551 () Bool)

(assert (=> start!115418 m!1249551))

(declare-fun m!1249553 () Bool)

(assert (=> b!1364836 m!1249553))

(declare-fun m!1249555 () Bool)

(assert (=> b!1364837 m!1249555))

(declare-fun m!1249557 () Bool)

(assert (=> b!1364835 m!1249557))

(declare-fun m!1249559 () Bool)

(assert (=> b!1364834 m!1249559))

(declare-fun m!1249561 () Bool)

(assert (=> b!1364839 m!1249561))

(declare-fun m!1249563 () Bool)

(assert (=> b!1364838 m!1249563))

(push 1)

(assert (not b!1364839))

(assert (not b!1364838))

(assert (not b!1364836))

(assert (not b!1364835))

(assert (not start!115418))

(assert (not b!1364833))

(assert (not b!1364834))

(assert (not b!1364837))

(check-sat)

(pop 1)

