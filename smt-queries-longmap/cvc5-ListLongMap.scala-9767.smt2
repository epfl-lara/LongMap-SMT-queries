; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115724 () Bool)

(assert start!115724)

(declare-fun b!1368477 () Bool)

(declare-fun e!775344 () Bool)

(declare-fun e!775345 () Bool)

(assert (=> b!1368477 (= e!775344 e!775345)))

(declare-fun res!911993 () Bool)

(assert (=> b!1368477 (=> (not res!911993) (not e!775345))))

(declare-datatypes ((array!92916 0))(
  ( (array!92917 (arr!44882 (Array (_ BitVec 32) (_ BitVec 64))) (size!45432 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92916)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31950 0))(
  ( (Nil!31947) (Cons!31946 (h!33155 (_ BitVec 64)) (t!46644 List!31950)) )
))
(declare-fun acc!866 () List!31950)

(declare-fun arrayNoDuplicates!0 (array!92916 (_ BitVec 32) List!31950) Bool)

(assert (=> b!1368477 (= res!911993 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45201 0))(
  ( (Unit!45202) )
))
(declare-fun lt!602074 () Unit!45201)

(declare-fun newAcc!98 () List!31950)

(declare-fun noDuplicateSubseq!221 (List!31950 List!31950) Unit!45201)

(assert (=> b!1368477 (= lt!602074 (noDuplicateSubseq!221 newAcc!98 acc!866))))

(declare-fun b!1368479 () Bool)

(declare-fun res!911990 () Bool)

(assert (=> b!1368479 (=> (not res!911990) (not e!775345))))

(assert (=> b!1368479 (= res!911990 (bvslt from!3239 (size!45432 a!3861)))))

(declare-fun b!1368480 () Bool)

(declare-fun res!911987 () Bool)

(assert (=> b!1368480 (=> (not res!911987) (not e!775344))))

(declare-fun subseq!1034 (List!31950 List!31950) Bool)

(assert (=> b!1368480 (= res!911987 (subseq!1034 newAcc!98 acc!866))))

(declare-fun b!1368481 () Bool)

(declare-fun res!911995 () Bool)

(assert (=> b!1368481 (=> (not res!911995) (not e!775344))))

(declare-fun contains!9632 (List!31950 (_ BitVec 64)) Bool)

(assert (=> b!1368481 (= res!911995 (not (contains!9632 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368482 () Bool)

(declare-fun res!911985 () Bool)

(assert (=> b!1368482 (=> (not res!911985) (not e!775345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368482 (= res!911985 (not (validKeyInArray!0 (select (arr!44882 a!3861) from!3239))))))

(declare-fun b!1368483 () Bool)

(declare-fun res!911989 () Bool)

(assert (=> b!1368483 (=> (not res!911989) (not e!775344))))

(declare-fun noDuplicate!2489 (List!31950) Bool)

(assert (=> b!1368483 (= res!911989 (noDuplicate!2489 acc!866))))

(declare-fun b!1368478 () Bool)

(declare-fun res!911994 () Bool)

(assert (=> b!1368478 (=> (not res!911994) (not e!775344))))

(assert (=> b!1368478 (= res!911994 (not (contains!9632 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911986 () Bool)

(assert (=> start!115724 (=> (not res!911986) (not e!775344))))

(assert (=> start!115724 (= res!911986 (and (bvslt (size!45432 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45432 a!3861))))))

(assert (=> start!115724 e!775344))

(declare-fun array_inv!33910 (array!92916) Bool)

(assert (=> start!115724 (array_inv!33910 a!3861)))

(assert (=> start!115724 true))

(declare-fun b!1368484 () Bool)

(declare-fun res!911992 () Bool)

(assert (=> b!1368484 (=> (not res!911992) (not e!775344))))

(assert (=> b!1368484 (= res!911992 (not (contains!9632 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368485 () Bool)

(declare-fun res!911991 () Bool)

(assert (=> b!1368485 (=> (not res!911991) (not e!775344))))

(assert (=> b!1368485 (= res!911991 (not (contains!9632 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368486 () Bool)

(declare-fun res!911988 () Bool)

(assert (=> b!1368486 (=> (not res!911988) (not e!775345))))

(assert (=> b!1368486 (= res!911988 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368487 () Bool)

(assert (=> b!1368487 (= e!775345 false)))

(declare-fun lt!602073 () Bool)

(assert (=> b!1368487 (= lt!602073 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(assert (= (and start!115724 res!911986) b!1368483))

(assert (= (and b!1368483 res!911989) b!1368485))

(assert (= (and b!1368485 res!911991) b!1368481))

(assert (= (and b!1368481 res!911995) b!1368484))

(assert (= (and b!1368484 res!911992) b!1368478))

(assert (= (and b!1368478 res!911994) b!1368480))

(assert (= (and b!1368480 res!911987) b!1368477))

(assert (= (and b!1368477 res!911993) b!1368479))

(assert (= (and b!1368479 res!911990) b!1368482))

(assert (= (and b!1368482 res!911985) b!1368486))

(assert (= (and b!1368486 res!911988) b!1368487))

(declare-fun m!1252435 () Bool)

(assert (=> b!1368478 m!1252435))

(declare-fun m!1252437 () Bool)

(assert (=> b!1368484 m!1252437))

(declare-fun m!1252439 () Bool)

(assert (=> b!1368483 m!1252439))

(declare-fun m!1252441 () Bool)

(assert (=> b!1368487 m!1252441))

(declare-fun m!1252443 () Bool)

(assert (=> b!1368482 m!1252443))

(assert (=> b!1368482 m!1252443))

(declare-fun m!1252445 () Bool)

(assert (=> b!1368482 m!1252445))

(declare-fun m!1252447 () Bool)

(assert (=> b!1368480 m!1252447))

(declare-fun m!1252449 () Bool)

(assert (=> start!115724 m!1252449))

(declare-fun m!1252451 () Bool)

(assert (=> b!1368481 m!1252451))

(declare-fun m!1252453 () Bool)

(assert (=> b!1368485 m!1252453))

(declare-fun m!1252455 () Bool)

(assert (=> b!1368477 m!1252455))

(declare-fun m!1252457 () Bool)

(assert (=> b!1368477 m!1252457))

(push 1)

