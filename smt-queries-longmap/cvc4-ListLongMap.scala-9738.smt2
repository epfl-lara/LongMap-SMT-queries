; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115416 () Bool)

(assert start!115416)

(declare-fun b!1364813 () Bool)

(declare-fun res!908390 () Bool)

(declare-fun e!774055 () Bool)

(assert (=> b!1364813 (=> (not res!908390) (not e!774055))))

(declare-datatypes ((List!31865 0))(
  ( (Nil!31862) (Cons!31861 (h!33070 (_ BitVec 64)) (t!46559 List!31865)) )
))
(declare-fun newAcc!98 () List!31865)

(declare-fun contains!9547 (List!31865 (_ BitVec 64)) Bool)

(assert (=> b!1364813 (= res!908390 (not (contains!9547 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364814 () Bool)

(declare-fun res!908389 () Bool)

(assert (=> b!1364814 (=> (not res!908389) (not e!774055))))

(declare-fun acc!866 () List!31865)

(assert (=> b!1364814 (= res!908389 (not (contains!9547 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908388 () Bool)

(assert (=> start!115416 (=> (not res!908388) (not e!774055))))

(declare-datatypes ((array!92737 0))(
  ( (array!92738 (arr!44797 (Array (_ BitVec 32) (_ BitVec 64))) (size!45347 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92737)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115416 (= res!908388 (and (bvslt (size!45347 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45347 a!3861))))))

(assert (=> start!115416 e!774055))

(declare-fun array_inv!33825 (array!92737) Bool)

(assert (=> start!115416 (array_inv!33825 a!3861)))

(assert (=> start!115416 true))

(declare-fun b!1364815 () Bool)

(declare-fun res!908391 () Bool)

(assert (=> b!1364815 (=> (not res!908391) (not e!774055))))

(assert (=> b!1364815 (= res!908391 (not (contains!9547 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364816 () Bool)

(declare-fun res!908387 () Bool)

(assert (=> b!1364816 (=> (not res!908387) (not e!774055))))

(declare-fun noDuplicate!2404 (List!31865) Bool)

(assert (=> b!1364816 (= res!908387 (noDuplicate!2404 acc!866))))

(declare-fun b!1364817 () Bool)

(declare-fun res!908392 () Bool)

(assert (=> b!1364817 (=> (not res!908392) (not e!774055))))

(assert (=> b!1364817 (= res!908392 (not (contains!9547 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364818 () Bool)

(assert (=> b!1364818 (= e!774055 false)))

(assert (= (and start!115416 res!908388) b!1364816))

(assert (= (and b!1364816 res!908387) b!1364817))

(assert (= (and b!1364817 res!908392) b!1364814))

(assert (= (and b!1364814 res!908389) b!1364813))

(assert (= (and b!1364813 res!908390) b!1364815))

(assert (= (and b!1364815 res!908391) b!1364818))

(declare-fun m!1249537 () Bool)

(assert (=> b!1364813 m!1249537))

(declare-fun m!1249539 () Bool)

(assert (=> b!1364814 m!1249539))

(declare-fun m!1249541 () Bool)

(assert (=> b!1364816 m!1249541))

(declare-fun m!1249543 () Bool)

(assert (=> b!1364815 m!1249543))

(declare-fun m!1249545 () Bool)

(assert (=> b!1364817 m!1249545))

(declare-fun m!1249547 () Bool)

(assert (=> start!115416 m!1249547))

(push 1)

(assert (not b!1364813))

(assert (not b!1364816))

(assert (not b!1364817))

(assert (not start!115416))

(assert (not b!1364815))

(assert (not b!1364814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

