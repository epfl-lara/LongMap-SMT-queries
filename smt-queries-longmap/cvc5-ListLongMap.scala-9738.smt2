; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115412 () Bool)

(assert start!115412)

(declare-fun b!1364777 () Bool)

(declare-fun e!774042 () Bool)

(assert (=> b!1364777 (= e!774042 false)))

(declare-fun b!1364778 () Bool)

(declare-fun res!908352 () Bool)

(assert (=> b!1364778 (=> (not res!908352) (not e!774042))))

(declare-datatypes ((List!31863 0))(
  ( (Nil!31860) (Cons!31859 (h!33068 (_ BitVec 64)) (t!46557 List!31863)) )
))
(declare-fun newAcc!98 () List!31863)

(declare-fun contains!9545 (List!31863 (_ BitVec 64)) Bool)

(assert (=> b!1364778 (= res!908352 (not (contains!9545 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364779 () Bool)

(declare-fun res!908356 () Bool)

(assert (=> b!1364779 (=> (not res!908356) (not e!774042))))

(declare-fun acc!866 () List!31863)

(assert (=> b!1364779 (= res!908356 (not (contains!9545 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364780 () Bool)

(declare-fun res!908353 () Bool)

(assert (=> b!1364780 (=> (not res!908353) (not e!774042))))

(assert (=> b!1364780 (= res!908353 (not (contains!9545 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364781 () Bool)

(declare-fun res!908351 () Bool)

(assert (=> b!1364781 (=> (not res!908351) (not e!774042))))

(declare-fun noDuplicate!2402 (List!31863) Bool)

(assert (=> b!1364781 (= res!908351 (noDuplicate!2402 acc!866))))

(declare-fun res!908355 () Bool)

(assert (=> start!115412 (=> (not res!908355) (not e!774042))))

(declare-datatypes ((array!92733 0))(
  ( (array!92734 (arr!44795 (Array (_ BitVec 32) (_ BitVec 64))) (size!45345 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92733)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115412 (= res!908355 (and (bvslt (size!45345 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45345 a!3861))))))

(assert (=> start!115412 e!774042))

(declare-fun array_inv!33823 (array!92733) Bool)

(assert (=> start!115412 (array_inv!33823 a!3861)))

(assert (=> start!115412 true))

(declare-fun b!1364782 () Bool)

(declare-fun res!908354 () Bool)

(assert (=> b!1364782 (=> (not res!908354) (not e!774042))))

(assert (=> b!1364782 (= res!908354 (not (contains!9545 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115412 res!908355) b!1364781))

(assert (= (and b!1364781 res!908351) b!1364782))

(assert (= (and b!1364782 res!908354) b!1364779))

(assert (= (and b!1364779 res!908356) b!1364780))

(assert (= (and b!1364780 res!908353) b!1364778))

(assert (= (and b!1364778 res!908352) b!1364777))

(declare-fun m!1249513 () Bool)

(assert (=> start!115412 m!1249513))

(declare-fun m!1249515 () Bool)

(assert (=> b!1364782 m!1249515))

(declare-fun m!1249517 () Bool)

(assert (=> b!1364779 m!1249517))

(declare-fun m!1249519 () Bool)

(assert (=> b!1364778 m!1249519))

(declare-fun m!1249521 () Bool)

(assert (=> b!1364780 m!1249521))

(declare-fun m!1249523 () Bool)

(assert (=> b!1364781 m!1249523))

(push 1)

(assert (not b!1364779))

(assert (not b!1364781))

(assert (not b!1364778))

(assert (not b!1364782))

(assert (not start!115412))

(assert (not b!1364780))

(check-sat)

(pop 1)

