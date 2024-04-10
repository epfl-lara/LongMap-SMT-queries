; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115728 () Bool)

(assert start!115728)

(declare-fun b!1368543 () Bool)

(declare-fun res!912058 () Bool)

(declare-fun e!775363 () Bool)

(assert (=> b!1368543 (=> (not res!912058) (not e!775363))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92920 0))(
  ( (array!92921 (arr!44884 (Array (_ BitVec 32) (_ BitVec 64))) (size!45434 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92920)

(assert (=> b!1368543 (= res!912058 (bvslt from!3239 (size!45434 a!3861)))))

(declare-fun res!912054 () Bool)

(declare-fun e!775362 () Bool)

(assert (=> start!115728 (=> (not res!912054) (not e!775362))))

(assert (=> start!115728 (= res!912054 (and (bvslt (size!45434 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45434 a!3861))))))

(assert (=> start!115728 e!775362))

(declare-fun array_inv!33912 (array!92920) Bool)

(assert (=> start!115728 (array_inv!33912 a!3861)))

(assert (=> start!115728 true))

(declare-fun b!1368544 () Bool)

(declare-fun res!912053 () Bool)

(assert (=> b!1368544 (=> (not res!912053) (not e!775362))))

(declare-datatypes ((List!31952 0))(
  ( (Nil!31949) (Cons!31948 (h!33157 (_ BitVec 64)) (t!46646 List!31952)) )
))
(declare-fun newAcc!98 () List!31952)

(declare-fun acc!866 () List!31952)

(declare-fun subseq!1036 (List!31952 List!31952) Bool)

(assert (=> b!1368544 (= res!912053 (subseq!1036 newAcc!98 acc!866))))

(declare-fun b!1368545 () Bool)

(declare-fun res!912059 () Bool)

(assert (=> b!1368545 (=> (not res!912059) (not e!775363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368545 (= res!912059 (not (validKeyInArray!0 (select (arr!44884 a!3861) from!3239))))))

(declare-fun b!1368546 () Bool)

(declare-fun res!912052 () Bool)

(assert (=> b!1368546 (=> (not res!912052) (not e!775362))))

(declare-fun noDuplicate!2491 (List!31952) Bool)

(assert (=> b!1368546 (= res!912052 (noDuplicate!2491 acc!866))))

(declare-fun b!1368547 () Bool)

(assert (=> b!1368547 (= e!775363 false)))

(declare-fun lt!602086 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92920 (_ BitVec 32) List!31952) Bool)

(assert (=> b!1368547 (= lt!602086 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368548 () Bool)

(declare-fun res!912057 () Bool)

(assert (=> b!1368548 (=> (not res!912057) (not e!775362))))

(declare-fun contains!9634 (List!31952 (_ BitVec 64)) Bool)

(assert (=> b!1368548 (= res!912057 (not (contains!9634 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368549 () Bool)

(declare-fun res!912061 () Bool)

(assert (=> b!1368549 (=> (not res!912061) (not e!775363))))

(assert (=> b!1368549 (= res!912061 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368550 () Bool)

(declare-fun res!912055 () Bool)

(assert (=> b!1368550 (=> (not res!912055) (not e!775362))))

(assert (=> b!1368550 (= res!912055 (not (contains!9634 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368551 () Bool)

(assert (=> b!1368551 (= e!775362 e!775363)))

(declare-fun res!912060 () Bool)

(assert (=> b!1368551 (=> (not res!912060) (not e!775363))))

(assert (=> b!1368551 (= res!912060 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45205 0))(
  ( (Unit!45206) )
))
(declare-fun lt!602085 () Unit!45205)

(declare-fun noDuplicateSubseq!223 (List!31952 List!31952) Unit!45205)

(assert (=> b!1368551 (= lt!602085 (noDuplicateSubseq!223 newAcc!98 acc!866))))

(declare-fun b!1368552 () Bool)

(declare-fun res!912051 () Bool)

(assert (=> b!1368552 (=> (not res!912051) (not e!775362))))

(assert (=> b!1368552 (= res!912051 (not (contains!9634 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368553 () Bool)

(declare-fun res!912056 () Bool)

(assert (=> b!1368553 (=> (not res!912056) (not e!775362))))

(assert (=> b!1368553 (= res!912056 (not (contains!9634 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115728 res!912054) b!1368546))

(assert (= (and b!1368546 res!912052) b!1368548))

(assert (= (and b!1368548 res!912057) b!1368553))

(assert (= (and b!1368553 res!912056) b!1368550))

(assert (= (and b!1368550 res!912055) b!1368552))

(assert (= (and b!1368552 res!912051) b!1368544))

(assert (= (and b!1368544 res!912053) b!1368551))

(assert (= (and b!1368551 res!912060) b!1368543))

(assert (= (and b!1368543 res!912058) b!1368545))

(assert (= (and b!1368545 res!912059) b!1368549))

(assert (= (and b!1368549 res!912061) b!1368547))

(declare-fun m!1252483 () Bool)

(assert (=> b!1368544 m!1252483))

(declare-fun m!1252485 () Bool)

(assert (=> b!1368546 m!1252485))

(declare-fun m!1252487 () Bool)

(assert (=> b!1368553 m!1252487))

(declare-fun m!1252489 () Bool)

(assert (=> b!1368550 m!1252489))

(declare-fun m!1252491 () Bool)

(assert (=> b!1368548 m!1252491))

(declare-fun m!1252493 () Bool)

(assert (=> b!1368551 m!1252493))

(declare-fun m!1252495 () Bool)

(assert (=> b!1368551 m!1252495))

(declare-fun m!1252497 () Bool)

(assert (=> b!1368545 m!1252497))

(assert (=> b!1368545 m!1252497))

(declare-fun m!1252499 () Bool)

(assert (=> b!1368545 m!1252499))

(declare-fun m!1252501 () Bool)

(assert (=> b!1368547 m!1252501))

(declare-fun m!1252503 () Bool)

(assert (=> b!1368552 m!1252503))

(declare-fun m!1252505 () Bool)

(assert (=> start!115728 m!1252505))

(push 1)

