; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115866 () Bool)

(assert start!115866)

(declare-fun b!1369660 () Bool)

(declare-fun res!913124 () Bool)

(declare-fun e!775884 () Bool)

(assert (=> b!1369660 (=> (not res!913124) (not e!775884))))

(declare-datatypes ((List!31979 0))(
  ( (Nil!31976) (Cons!31975 (h!33184 (_ BitVec 64)) (t!46673 List!31979)) )
))
(declare-fun acc!866 () List!31979)

(declare-fun noDuplicate!2518 (List!31979) Bool)

(assert (=> b!1369660 (= res!913124 (noDuplicate!2518 acc!866))))

(declare-fun res!913123 () Bool)

(assert (=> start!115866 (=> (not res!913123) (not e!775884))))

(declare-datatypes ((array!92980 0))(
  ( (array!92981 (arr!44911 (Array (_ BitVec 32) (_ BitVec 64))) (size!45461 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92980)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115866 (= res!913123 (and (bvslt (size!45461 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45461 a!3861))))))

(assert (=> start!115866 e!775884))

(declare-fun array_inv!33939 (array!92980) Bool)

(assert (=> start!115866 (array_inv!33939 a!3861)))

(assert (=> start!115866 true))

(declare-fun b!1369661 () Bool)

(assert (=> b!1369661 (= e!775884 false)))

(declare-fun lt!602310 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92980 (_ BitVec 32) List!31979) Bool)

(assert (=> b!1369661 (= lt!602310 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45259 0))(
  ( (Unit!45260) )
))
(declare-fun lt!602311 () Unit!45259)

(declare-fun newAcc!98 () List!31979)

(declare-fun noDuplicateSubseq!250 (List!31979 List!31979) Unit!45259)

(assert (=> b!1369661 (= lt!602311 (noDuplicateSubseq!250 newAcc!98 acc!866))))

(declare-fun b!1369662 () Bool)

(declare-fun res!913120 () Bool)

(assert (=> b!1369662 (=> (not res!913120) (not e!775884))))

(declare-fun subseq!1063 (List!31979 List!31979) Bool)

(assert (=> b!1369662 (= res!913120 (subseq!1063 newAcc!98 acc!866))))

(declare-fun b!1369663 () Bool)

(declare-fun res!913125 () Bool)

(assert (=> b!1369663 (=> (not res!913125) (not e!775884))))

(declare-fun contains!9661 (List!31979 (_ BitVec 64)) Bool)

(assert (=> b!1369663 (= res!913125 (not (contains!9661 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369664 () Bool)

(declare-fun res!913122 () Bool)

(assert (=> b!1369664 (=> (not res!913122) (not e!775884))))

(assert (=> b!1369664 (= res!913122 (not (contains!9661 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369665 () Bool)

(declare-fun res!913121 () Bool)

(assert (=> b!1369665 (=> (not res!913121) (not e!775884))))

(assert (=> b!1369665 (= res!913121 (not (contains!9661 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369666 () Bool)

(declare-fun res!913126 () Bool)

(assert (=> b!1369666 (=> (not res!913126) (not e!775884))))

(assert (=> b!1369666 (= res!913126 (not (contains!9661 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115866 res!913123) b!1369660))

(assert (= (and b!1369660 res!913124) b!1369665))

(assert (= (and b!1369665 res!913121) b!1369664))

(assert (= (and b!1369664 res!913122) b!1369663))

(assert (= (and b!1369663 res!913125) b!1369666))

(assert (= (and b!1369666 res!913126) b!1369662))

(assert (= (and b!1369662 res!913120) b!1369661))

(declare-fun m!1253401 () Bool)

(assert (=> b!1369664 m!1253401))

(declare-fun m!1253403 () Bool)

(assert (=> b!1369666 m!1253403))

(declare-fun m!1253405 () Bool)

(assert (=> b!1369662 m!1253405))

(declare-fun m!1253407 () Bool)

(assert (=> start!115866 m!1253407))

(declare-fun m!1253409 () Bool)

(assert (=> b!1369665 m!1253409))

(declare-fun m!1253411 () Bool)

(assert (=> b!1369663 m!1253411))

(declare-fun m!1253413 () Bool)

(assert (=> b!1369661 m!1253413))

(declare-fun m!1253415 () Bool)

(assert (=> b!1369661 m!1253415))

(declare-fun m!1253417 () Bool)

(assert (=> b!1369660 m!1253417))

(push 1)

(assert (not b!1369666))

(assert (not b!1369663))

(assert (not b!1369665))

(assert (not start!115866))

(assert (not b!1369661))

(assert (not b!1369662))

(assert (not b!1369664))

(assert (not b!1369660))

(check-sat)

