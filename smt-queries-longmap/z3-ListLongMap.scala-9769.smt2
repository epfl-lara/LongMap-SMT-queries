; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115738 () Bool)

(assert start!115738)

(declare-fun b!1368723 () Bool)

(declare-fun res!912234 () Bool)

(declare-fun e!775406 () Bool)

(assert (=> b!1368723 (=> (not res!912234) (not e!775406))))

(declare-datatypes ((List!31957 0))(
  ( (Nil!31954) (Cons!31953 (h!33162 (_ BitVec 64)) (t!46651 List!31957)) )
))
(declare-fun newAcc!98 () List!31957)

(declare-fun contains!9639 (List!31957 (_ BitVec 64)) Bool)

(assert (=> b!1368723 (= res!912234 (not (contains!9639 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368724 () Bool)

(declare-fun res!912231 () Bool)

(declare-fun e!775407 () Bool)

(assert (=> b!1368724 (=> (not res!912231) (not e!775407))))

(declare-datatypes ((array!92930 0))(
  ( (array!92931 (arr!44889 (Array (_ BitVec 32) (_ BitVec 64))) (size!45439 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92930)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368724 (= res!912231 (not (validKeyInArray!0 (select (arr!44889 a!3861) from!3239))))))

(declare-fun b!1368725 () Bool)

(declare-fun res!912236 () Bool)

(assert (=> b!1368725 (=> (not res!912236) (not e!775406))))

(declare-fun acc!866 () List!31957)

(declare-fun subseq!1041 (List!31957 List!31957) Bool)

(assert (=> b!1368725 (= res!912236 (subseq!1041 newAcc!98 acc!866))))

(declare-fun b!1368726 () Bool)

(declare-fun res!912238 () Bool)

(assert (=> b!1368726 (=> (not res!912238) (not e!775406))))

(declare-fun noDuplicate!2496 (List!31957) Bool)

(assert (=> b!1368726 (= res!912238 (noDuplicate!2496 acc!866))))

(declare-fun b!1368727 () Bool)

(declare-fun res!912230 () Bool)

(assert (=> b!1368727 (=> (not res!912230) (not e!775406))))

(assert (=> b!1368727 (= res!912230 (not (contains!9639 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912237 () Bool)

(assert (=> start!115738 (=> (not res!912237) (not e!775406))))

(assert (=> start!115738 (= res!912237 (and (bvslt (size!45439 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45439 a!3861))))))

(assert (=> start!115738 e!775406))

(declare-fun array_inv!33917 (array!92930) Bool)

(assert (=> start!115738 (array_inv!33917 a!3861)))

(assert (=> start!115738 true))

(declare-fun b!1368722 () Bool)

(assert (=> b!1368722 (= e!775407 (not true))))

(declare-fun arrayNoDuplicates!0 (array!92930 (_ BitVec 32) List!31957) Bool)

(assert (=> b!1368722 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45215 0))(
  ( (Unit!45216) )
))
(declare-fun lt!602116 () Unit!45215)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92930 List!31957 List!31957 (_ BitVec 32)) Unit!45215)

(assert (=> b!1368722 (= lt!602116 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368728 () Bool)

(assert (=> b!1368728 (= e!775406 e!775407)))

(declare-fun res!912232 () Bool)

(assert (=> b!1368728 (=> (not res!912232) (not e!775407))))

(assert (=> b!1368728 (= res!912232 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602115 () Unit!45215)

(declare-fun noDuplicateSubseq!228 (List!31957 List!31957) Unit!45215)

(assert (=> b!1368728 (= lt!602115 (noDuplicateSubseq!228 newAcc!98 acc!866))))

(declare-fun b!1368729 () Bool)

(declare-fun res!912241 () Bool)

(assert (=> b!1368729 (=> (not res!912241) (not e!775407))))

(assert (=> b!1368729 (= res!912241 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368730 () Bool)

(declare-fun res!912233 () Bool)

(assert (=> b!1368730 (=> (not res!912233) (not e!775407))))

(assert (=> b!1368730 (= res!912233 (bvslt from!3239 (size!45439 a!3861)))))

(declare-fun b!1368731 () Bool)

(declare-fun res!912239 () Bool)

(assert (=> b!1368731 (=> (not res!912239) (not e!775407))))

(assert (=> b!1368731 (= res!912239 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368732 () Bool)

(declare-fun res!912240 () Bool)

(assert (=> b!1368732 (=> (not res!912240) (not e!775406))))

(assert (=> b!1368732 (= res!912240 (not (contains!9639 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368733 () Bool)

(declare-fun res!912235 () Bool)

(assert (=> b!1368733 (=> (not res!912235) (not e!775406))))

(assert (=> b!1368733 (= res!912235 (not (contains!9639 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115738 res!912237) b!1368726))

(assert (= (and b!1368726 res!912238) b!1368727))

(assert (= (and b!1368727 res!912230) b!1368733))

(assert (= (and b!1368733 res!912235) b!1368723))

(assert (= (and b!1368723 res!912234) b!1368732))

(assert (= (and b!1368732 res!912240) b!1368725))

(assert (= (and b!1368725 res!912236) b!1368728))

(assert (= (and b!1368728 res!912232) b!1368730))

(assert (= (and b!1368730 res!912233) b!1368724))

(assert (= (and b!1368724 res!912231) b!1368729))

(assert (= (and b!1368729 res!912241) b!1368731))

(assert (= (and b!1368731 res!912239) b!1368722))

(declare-fun m!1252619 () Bool)

(assert (=> b!1368733 m!1252619))

(declare-fun m!1252621 () Bool)

(assert (=> b!1368723 m!1252621))

(declare-fun m!1252623 () Bool)

(assert (=> b!1368731 m!1252623))

(declare-fun m!1252625 () Bool)

(assert (=> b!1368722 m!1252625))

(declare-fun m!1252627 () Bool)

(assert (=> b!1368722 m!1252627))

(declare-fun m!1252629 () Bool)

(assert (=> b!1368727 m!1252629))

(declare-fun m!1252631 () Bool)

(assert (=> b!1368728 m!1252631))

(declare-fun m!1252633 () Bool)

(assert (=> b!1368728 m!1252633))

(declare-fun m!1252635 () Bool)

(assert (=> start!115738 m!1252635))

(declare-fun m!1252637 () Bool)

(assert (=> b!1368726 m!1252637))

(declare-fun m!1252639 () Bool)

(assert (=> b!1368725 m!1252639))

(declare-fun m!1252641 () Bool)

(assert (=> b!1368732 m!1252641))

(declare-fun m!1252643 () Bool)

(assert (=> b!1368724 m!1252643))

(assert (=> b!1368724 m!1252643))

(declare-fun m!1252645 () Bool)

(assert (=> b!1368724 m!1252645))

(check-sat (not start!115738) (not b!1368726) (not b!1368728) (not b!1368724) (not b!1368733) (not b!1368725) (not b!1368723) (not b!1368732) (not b!1368727) (not b!1368731) (not b!1368722))
(check-sat)
