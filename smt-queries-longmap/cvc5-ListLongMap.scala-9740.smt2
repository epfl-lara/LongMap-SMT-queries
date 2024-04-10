; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115424 () Bool)

(assert start!115424)

(declare-fun b!1364896 () Bool)

(declare-fun res!908476 () Bool)

(declare-fun e!774079 () Bool)

(assert (=> b!1364896 (=> (not res!908476) (not e!774079))))

(declare-datatypes ((List!31869 0))(
  ( (Nil!31866) (Cons!31865 (h!33074 (_ BitVec 64)) (t!46563 List!31869)) )
))
(declare-fun newAcc!98 () List!31869)

(declare-fun acc!866 () List!31869)

(declare-fun subseq!953 (List!31869 List!31869) Bool)

(assert (=> b!1364896 (= res!908476 (subseq!953 newAcc!98 acc!866))))

(declare-fun b!1364897 () Bool)

(assert (=> b!1364897 (= e!774079 false)))

(declare-datatypes ((Unit!45039 0))(
  ( (Unit!45040) )
))
(declare-fun lt!601159 () Unit!45039)

(declare-fun noDuplicateSubseq!140 (List!31869 List!31869) Unit!45039)

(assert (=> b!1364897 (= lt!601159 (noDuplicateSubseq!140 newAcc!98 acc!866))))

(declare-fun res!908475 () Bool)

(assert (=> start!115424 (=> (not res!908475) (not e!774079))))

(declare-datatypes ((array!92745 0))(
  ( (array!92746 (arr!44801 (Array (_ BitVec 32) (_ BitVec 64))) (size!45351 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92745)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115424 (= res!908475 (and (bvslt (size!45351 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45351 a!3861))))))

(assert (=> start!115424 e!774079))

(declare-fun array_inv!33829 (array!92745) Bool)

(assert (=> start!115424 (array_inv!33829 a!3861)))

(assert (=> start!115424 true))

(declare-fun b!1364898 () Bool)

(declare-fun res!908470 () Bool)

(assert (=> b!1364898 (=> (not res!908470) (not e!774079))))

(declare-fun noDuplicate!2408 (List!31869) Bool)

(assert (=> b!1364898 (= res!908470 (noDuplicate!2408 acc!866))))

(declare-fun b!1364899 () Bool)

(declare-fun res!908471 () Bool)

(assert (=> b!1364899 (=> (not res!908471) (not e!774079))))

(declare-fun contains!9551 (List!31869 (_ BitVec 64)) Bool)

(assert (=> b!1364899 (= res!908471 (not (contains!9551 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364900 () Bool)

(declare-fun res!908472 () Bool)

(assert (=> b!1364900 (=> (not res!908472) (not e!774079))))

(assert (=> b!1364900 (= res!908472 (not (contains!9551 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364901 () Bool)

(declare-fun res!908474 () Bool)

(assert (=> b!1364901 (=> (not res!908474) (not e!774079))))

(assert (=> b!1364901 (= res!908474 (not (contains!9551 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364902 () Bool)

(declare-fun res!908473 () Bool)

(assert (=> b!1364902 (=> (not res!908473) (not e!774079))))

(assert (=> b!1364902 (= res!908473 (not (contains!9551 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115424 res!908475) b!1364898))

(assert (= (and b!1364898 res!908470) b!1364899))

(assert (= (and b!1364899 res!908471) b!1364901))

(assert (= (and b!1364901 res!908474) b!1364902))

(assert (= (and b!1364902 res!908473) b!1364900))

(assert (= (and b!1364900 res!908472) b!1364896))

(assert (= (and b!1364896 res!908476) b!1364897))

(declare-fun m!1249597 () Bool)

(assert (=> b!1364899 m!1249597))

(declare-fun m!1249599 () Bool)

(assert (=> b!1364900 m!1249599))

(declare-fun m!1249601 () Bool)

(assert (=> b!1364901 m!1249601))

(declare-fun m!1249603 () Bool)

(assert (=> b!1364902 m!1249603))

(declare-fun m!1249605 () Bool)

(assert (=> b!1364897 m!1249605))

(declare-fun m!1249607 () Bool)

(assert (=> b!1364896 m!1249607))

(declare-fun m!1249609 () Bool)

(assert (=> start!115424 m!1249609))

(declare-fun m!1249611 () Bool)

(assert (=> b!1364898 m!1249611))

(push 1)

(assert (not b!1364900))

(assert (not b!1364899))

(assert (not b!1364896))

(assert (not b!1364897))

(assert (not b!1364902))

(assert (not b!1364898))

(assert (not start!115424))

(assert (not b!1364901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

