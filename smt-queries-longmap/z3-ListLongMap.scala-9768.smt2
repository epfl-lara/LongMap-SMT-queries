; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115732 () Bool)

(assert start!115732)

(declare-fun res!912133 () Bool)

(declare-fun e!775380 () Bool)

(assert (=> start!115732 (=> (not res!912133) (not e!775380))))

(declare-datatypes ((array!92924 0))(
  ( (array!92925 (arr!44886 (Array (_ BitVec 32) (_ BitVec 64))) (size!45436 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92924)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115732 (= res!912133 (and (bvslt (size!45436 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45436 a!3861))))))

(assert (=> start!115732 e!775380))

(declare-fun array_inv!33914 (array!92924) Bool)

(assert (=> start!115732 (array_inv!33914 a!3861)))

(assert (=> start!115732 true))

(declare-fun b!1368614 () Bool)

(declare-fun e!775381 () Bool)

(assert (=> b!1368614 (= e!775381 (not true))))

(declare-datatypes ((List!31954 0))(
  ( (Nil!31951) (Cons!31950 (h!33159 (_ BitVec 64)) (t!46648 List!31954)) )
))
(declare-fun newAcc!98 () List!31954)

(declare-fun arrayNoDuplicates!0 (array!92924 (_ BitVec 32) List!31954) Bool)

(assert (=> b!1368614 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45209 0))(
  ( (Unit!45210) )
))
(declare-fun lt!602098 () Unit!45209)

(declare-fun acc!866 () List!31954)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92924 List!31954 List!31954 (_ BitVec 32)) Unit!45209)

(assert (=> b!1368614 (= lt!602098 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368615 () Bool)

(declare-fun res!912129 () Bool)

(assert (=> b!1368615 (=> (not res!912129) (not e!775380))))

(declare-fun contains!9636 (List!31954 (_ BitVec 64)) Bool)

(assert (=> b!1368615 (= res!912129 (not (contains!9636 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368616 () Bool)

(declare-fun res!912125 () Bool)

(assert (=> b!1368616 (=> (not res!912125) (not e!775380))))

(assert (=> b!1368616 (= res!912125 (not (contains!9636 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368617 () Bool)

(declare-fun res!912126 () Bool)

(assert (=> b!1368617 (=> (not res!912126) (not e!775380))))

(declare-fun noDuplicate!2493 (List!31954) Bool)

(assert (=> b!1368617 (= res!912126 (noDuplicate!2493 acc!866))))

(declare-fun b!1368618 () Bool)

(declare-fun res!912132 () Bool)

(assert (=> b!1368618 (=> (not res!912132) (not e!775380))))

(assert (=> b!1368618 (= res!912132 (not (contains!9636 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368619 () Bool)

(declare-fun res!912124 () Bool)

(assert (=> b!1368619 (=> (not res!912124) (not e!775380))))

(assert (=> b!1368619 (= res!912124 (not (contains!9636 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368620 () Bool)

(declare-fun res!912128 () Bool)

(assert (=> b!1368620 (=> (not res!912128) (not e!775381))))

(assert (=> b!1368620 (= res!912128 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368621 () Bool)

(assert (=> b!1368621 (= e!775380 e!775381)))

(declare-fun res!912122 () Bool)

(assert (=> b!1368621 (=> (not res!912122) (not e!775381))))

(assert (=> b!1368621 (= res!912122 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602097 () Unit!45209)

(declare-fun noDuplicateSubseq!225 (List!31954 List!31954) Unit!45209)

(assert (=> b!1368621 (= lt!602097 (noDuplicateSubseq!225 newAcc!98 acc!866))))

(declare-fun b!1368622 () Bool)

(declare-fun res!912123 () Bool)

(assert (=> b!1368622 (=> (not res!912123) (not e!775381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368622 (= res!912123 (not (validKeyInArray!0 (select (arr!44886 a!3861) from!3239))))))

(declare-fun b!1368623 () Bool)

(declare-fun res!912131 () Bool)

(assert (=> b!1368623 (=> (not res!912131) (not e!775380))))

(declare-fun subseq!1038 (List!31954 List!31954) Bool)

(assert (=> b!1368623 (= res!912131 (subseq!1038 newAcc!98 acc!866))))

(declare-fun b!1368624 () Bool)

(declare-fun res!912127 () Bool)

(assert (=> b!1368624 (=> (not res!912127) (not e!775381))))

(assert (=> b!1368624 (= res!912127 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368625 () Bool)

(declare-fun res!912130 () Bool)

(assert (=> b!1368625 (=> (not res!912130) (not e!775381))))

(assert (=> b!1368625 (= res!912130 (bvslt from!3239 (size!45436 a!3861)))))

(assert (= (and start!115732 res!912133) b!1368617))

(assert (= (and b!1368617 res!912126) b!1368618))

(assert (= (and b!1368618 res!912132) b!1368619))

(assert (= (and b!1368619 res!912124) b!1368616))

(assert (= (and b!1368616 res!912125) b!1368615))

(assert (= (and b!1368615 res!912129) b!1368623))

(assert (= (and b!1368623 res!912131) b!1368621))

(assert (= (and b!1368621 res!912122) b!1368625))

(assert (= (and b!1368625 res!912130) b!1368622))

(assert (= (and b!1368622 res!912123) b!1368620))

(assert (= (and b!1368620 res!912128) b!1368624))

(assert (= (and b!1368624 res!912127) b!1368614))

(declare-fun m!1252535 () Bool)

(assert (=> b!1368624 m!1252535))

(declare-fun m!1252537 () Bool)

(assert (=> b!1368615 m!1252537))

(declare-fun m!1252539 () Bool)

(assert (=> start!115732 m!1252539))

(declare-fun m!1252541 () Bool)

(assert (=> b!1368619 m!1252541))

(declare-fun m!1252543 () Bool)

(assert (=> b!1368623 m!1252543))

(declare-fun m!1252545 () Bool)

(assert (=> b!1368621 m!1252545))

(declare-fun m!1252547 () Bool)

(assert (=> b!1368621 m!1252547))

(declare-fun m!1252549 () Bool)

(assert (=> b!1368617 m!1252549))

(declare-fun m!1252551 () Bool)

(assert (=> b!1368618 m!1252551))

(declare-fun m!1252553 () Bool)

(assert (=> b!1368616 m!1252553))

(declare-fun m!1252555 () Bool)

(assert (=> b!1368622 m!1252555))

(assert (=> b!1368622 m!1252555))

(declare-fun m!1252557 () Bool)

(assert (=> b!1368622 m!1252557))

(declare-fun m!1252559 () Bool)

(assert (=> b!1368614 m!1252559))

(declare-fun m!1252561 () Bool)

(assert (=> b!1368614 m!1252561))

(check-sat (not b!1368616) (not b!1368623) (not b!1368621) (not start!115732) (not b!1368617) (not b!1368618) (not b!1368615) (not b!1368614) (not b!1368619) (not b!1368624) (not b!1368622))
(check-sat)
