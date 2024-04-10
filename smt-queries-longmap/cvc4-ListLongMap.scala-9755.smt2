; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115614 () Bool)

(assert start!115614)

(declare-fun b!1367217 () Bool)

(declare-fun res!910752 () Bool)

(declare-fun e!774890 () Bool)

(assert (=> b!1367217 (=> (not res!910752) (not e!774890))))

(declare-datatypes ((List!31916 0))(
  ( (Nil!31913) (Cons!31912 (h!33121 (_ BitVec 64)) (t!46610 List!31916)) )
))
(declare-fun acc!866 () List!31916)

(declare-fun contains!9598 (List!31916 (_ BitVec 64)) Bool)

(assert (=> b!1367217 (= res!910752 (not (contains!9598 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367218 () Bool)

(declare-fun res!910749 () Bool)

(assert (=> b!1367218 (=> (not res!910749) (not e!774890))))

(declare-fun newAcc!98 () List!31916)

(declare-fun subseq!1000 (List!31916 List!31916) Bool)

(assert (=> b!1367218 (= res!910749 (subseq!1000 newAcc!98 acc!866))))

(declare-fun res!910753 () Bool)

(assert (=> start!115614 (=> (not res!910753) (not e!774890))))

(declare-datatypes ((array!92845 0))(
  ( (array!92846 (arr!44848 (Array (_ BitVec 32) (_ BitVec 64))) (size!45398 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92845)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115614 (= res!910753 (and (bvslt (size!45398 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45398 a!3861))))))

(assert (=> start!115614 e!774890))

(declare-fun array_inv!33876 (array!92845) Bool)

(assert (=> start!115614 (array_inv!33876 a!3861)))

(assert (=> start!115614 true))

(declare-fun b!1367219 () Bool)

(declare-fun res!910751 () Bool)

(assert (=> b!1367219 (=> (not res!910751) (not e!774890))))

(assert (=> b!1367219 (= res!910751 (not (contains!9598 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367220 () Bool)

(declare-fun e!774891 () Bool)

(assert (=> b!1367220 (= e!774891 (not true))))

(declare-fun lt!601847 () Bool)

(declare-fun noDuplicate!2455 (List!31916) Bool)

(assert (=> b!1367220 (= lt!601847 (noDuplicate!2455 newAcc!98))))

(declare-datatypes ((Unit!45133 0))(
  ( (Unit!45134) )
))
(declare-fun lt!601846 () Unit!45133)

(declare-fun lt!601848 () List!31916)

(declare-fun lt!601845 () List!31916)

(declare-fun noDuplicateSubseq!187 (List!31916 List!31916) Unit!45133)

(assert (=> b!1367220 (= lt!601846 (noDuplicateSubseq!187 lt!601848 lt!601845))))

(declare-fun arrayNoDuplicates!0 (array!92845 (_ BitVec 32) List!31916) Bool)

(assert (=> b!1367220 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601848)))

(declare-fun lt!601844 () Unit!45133)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92845 List!31916 List!31916 (_ BitVec 32)) Unit!45133)

(assert (=> b!1367220 (= lt!601844 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601845 lt!601848 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367220 (= lt!601848 (Cons!31912 (select (arr!44848 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367220 (= lt!601845 (Cons!31912 (select (arr!44848 a!3861) from!3239) acc!866))))

(declare-fun b!1367221 () Bool)

(assert (=> b!1367221 (= e!774890 e!774891)))

(declare-fun res!910746 () Bool)

(assert (=> b!1367221 (=> (not res!910746) (not e!774891))))

(assert (=> b!1367221 (= res!910746 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601849 () Unit!45133)

(assert (=> b!1367221 (= lt!601849 (noDuplicateSubseq!187 newAcc!98 acc!866))))

(declare-fun b!1367222 () Bool)

(declare-fun res!910745 () Bool)

(assert (=> b!1367222 (=> (not res!910745) (not e!774891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367222 (= res!910745 (validKeyInArray!0 (select (arr!44848 a!3861) from!3239)))))

(declare-fun b!1367223 () Bool)

(declare-fun res!910748 () Bool)

(assert (=> b!1367223 (=> (not res!910748) (not e!774891))))

(assert (=> b!1367223 (= res!910748 (bvslt from!3239 (size!45398 a!3861)))))

(declare-fun b!1367224 () Bool)

(declare-fun res!910744 () Bool)

(assert (=> b!1367224 (=> (not res!910744) (not e!774891))))

(assert (=> b!1367224 (= res!910744 (not (contains!9598 acc!866 (select (arr!44848 a!3861) from!3239))))))

(declare-fun b!1367225 () Bool)

(declare-fun res!910743 () Bool)

(assert (=> b!1367225 (=> (not res!910743) (not e!774890))))

(assert (=> b!1367225 (= res!910743 (not (contains!9598 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367226 () Bool)

(declare-fun res!910747 () Bool)

(assert (=> b!1367226 (=> (not res!910747) (not e!774890))))

(assert (=> b!1367226 (= res!910747 (noDuplicate!2455 acc!866))))

(declare-fun b!1367227 () Bool)

(declare-fun res!910750 () Bool)

(assert (=> b!1367227 (=> (not res!910750) (not e!774890))))

(assert (=> b!1367227 (= res!910750 (not (contains!9598 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115614 res!910753) b!1367226))

(assert (= (and b!1367226 res!910747) b!1367219))

(assert (= (and b!1367219 res!910751) b!1367217))

(assert (= (and b!1367217 res!910752) b!1367225))

(assert (= (and b!1367225 res!910743) b!1367227))

(assert (= (and b!1367227 res!910750) b!1367218))

(assert (= (and b!1367218 res!910749) b!1367221))

(assert (= (and b!1367221 res!910746) b!1367223))

(assert (= (and b!1367223 res!910748) b!1367222))

(assert (= (and b!1367222 res!910745) b!1367224))

(assert (= (and b!1367224 res!910744) b!1367220))

(declare-fun m!1251479 () Bool)

(assert (=> b!1367221 m!1251479))

(declare-fun m!1251481 () Bool)

(assert (=> b!1367221 m!1251481))

(declare-fun m!1251483 () Bool)

(assert (=> b!1367218 m!1251483))

(declare-fun m!1251485 () Bool)

(assert (=> b!1367224 m!1251485))

(assert (=> b!1367224 m!1251485))

(declare-fun m!1251487 () Bool)

(assert (=> b!1367224 m!1251487))

(declare-fun m!1251489 () Bool)

(assert (=> b!1367225 m!1251489))

(assert (=> b!1367222 m!1251485))

(assert (=> b!1367222 m!1251485))

(declare-fun m!1251491 () Bool)

(assert (=> b!1367222 m!1251491))

(declare-fun m!1251493 () Bool)

(assert (=> b!1367217 m!1251493))

(declare-fun m!1251495 () Bool)

(assert (=> b!1367227 m!1251495))

(declare-fun m!1251497 () Bool)

(assert (=> b!1367220 m!1251497))

(declare-fun m!1251499 () Bool)

(assert (=> b!1367220 m!1251499))

(declare-fun m!1251501 () Bool)

(assert (=> b!1367220 m!1251501))

(assert (=> b!1367220 m!1251485))

(declare-fun m!1251503 () Bool)

(assert (=> b!1367220 m!1251503))

(declare-fun m!1251505 () Bool)

(assert (=> b!1367219 m!1251505))

(declare-fun m!1251507 () Bool)

(assert (=> b!1367226 m!1251507))

(declare-fun m!1251509 () Bool)

(assert (=> start!115614 m!1251509))

(push 1)

(assert (not b!1367220))

(assert (not start!115614))

(assert (not b!1367224))

(assert (not b!1367226))

(assert (not b!1367222))

(assert (not b!1367225))

(assert (not b!1367219))

(assert (not b!1367227))

(assert (not b!1367218))

(assert (not b!1367217))

(assert (not b!1367221))

(check-sat)

(pop 1)

(push 1)

