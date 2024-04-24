; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115924 () Bool)

(assert start!115924)

(declare-fun b!1369380 () Bool)

(declare-fun res!912110 () Bool)

(declare-fun e!776078 () Bool)

(assert (=> b!1369380 (=> (not res!912110) (not e!776078))))

(declare-datatypes ((List!31978 0))(
  ( (Nil!31975) (Cons!31974 (h!33192 (_ BitVec 64)) (t!46664 List!31978)) )
))
(declare-fun newAcc!98 () List!31978)

(declare-fun contains!9663 (List!31978 (_ BitVec 64)) Bool)

(assert (=> b!1369380 (= res!912110 (not (contains!9663 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369381 () Bool)

(declare-fun res!912113 () Bool)

(assert (=> b!1369381 (=> (not res!912113) (not e!776078))))

(declare-fun acc!866 () List!31978)

(declare-fun subseq!1022 (List!31978 List!31978) Bool)

(assert (=> b!1369381 (= res!912113 (subseq!1022 newAcc!98 acc!866))))

(declare-fun b!1369382 () Bool)

(declare-fun res!912112 () Bool)

(assert (=> b!1369382 (=> (not res!912112) (not e!776078))))

(assert (=> b!1369382 (= res!912112 (not (contains!9663 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369383 () Bool)

(declare-fun res!912114 () Bool)

(assert (=> b!1369383 (=> (not res!912114) (not e!776078))))

(assert (=> b!1369383 (= res!912114 (not (contains!9663 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369384 () Bool)

(declare-fun e!776079 () Bool)

(assert (=> b!1369384 (= e!776078 e!776079)))

(declare-fun res!912116 () Bool)

(assert (=> b!1369384 (=> (not res!912116) (not e!776079))))

(declare-datatypes ((array!93007 0))(
  ( (array!93008 (arr!44923 (Array (_ BitVec 32) (_ BitVec 64))) (size!45474 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93007)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93007 (_ BitVec 32) List!31978) Bool)

(assert (=> b!1369384 (= res!912116 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45116 0))(
  ( (Unit!45117) )
))
(declare-fun lt!602477 () Unit!45116)

(declare-fun noDuplicateSubseq!209 (List!31978 List!31978) Unit!45116)

(assert (=> b!1369384 (= lt!602477 (noDuplicateSubseq!209 newAcc!98 acc!866))))

(declare-fun b!1369385 () Bool)

(declare-fun res!912115 () Bool)

(assert (=> b!1369385 (=> (not res!912115) (not e!776078))))

(declare-fun noDuplicate!2494 (List!31978) Bool)

(assert (=> b!1369385 (= res!912115 (noDuplicate!2494 acc!866))))

(declare-fun b!1369386 () Bool)

(declare-fun res!912111 () Bool)

(assert (=> b!1369386 (=> (not res!912111) (not e!776079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369386 (= res!912111 (not (validKeyInArray!0 (select (arr!44923 a!3861) from!3239))))))

(declare-fun b!1369387 () Bool)

(declare-fun res!912108 () Bool)

(assert (=> b!1369387 (=> (not res!912108) (not e!776079))))

(assert (=> b!1369387 (= res!912108 (bvslt from!3239 (size!45474 a!3861)))))

(declare-fun b!1369389 () Bool)

(declare-fun res!912109 () Bool)

(assert (=> b!1369389 (=> (not res!912109) (not e!776078))))

(assert (=> b!1369389 (= res!912109 (not (contains!9663 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369390 () Bool)

(declare-fun res!912107 () Bool)

(assert (=> b!1369390 (=> (not res!912107) (not e!776079))))

(assert (=> b!1369390 (= res!912107 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369388 () Bool)

(assert (=> b!1369388 (= e!776079 false)))

(declare-fun lt!602478 () Bool)

(assert (=> b!1369388 (= lt!602478 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun res!912117 () Bool)

(assert (=> start!115924 (=> (not res!912117) (not e!776078))))

(assert (=> start!115924 (= res!912117 (and (bvslt (size!45474 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45474 a!3861))))))

(assert (=> start!115924 e!776078))

(declare-fun array_inv!34204 (array!93007) Bool)

(assert (=> start!115924 (array_inv!34204 a!3861)))

(assert (=> start!115924 true))

(assert (= (and start!115924 res!912117) b!1369385))

(assert (= (and b!1369385 res!912115) b!1369383))

(assert (= (and b!1369383 res!912114) b!1369389))

(assert (= (and b!1369389 res!912109) b!1369380))

(assert (= (and b!1369380 res!912110) b!1369382))

(assert (= (and b!1369382 res!912112) b!1369381))

(assert (= (and b!1369381 res!912113) b!1369384))

(assert (= (and b!1369384 res!912116) b!1369387))

(assert (= (and b!1369387 res!912108) b!1369386))

(assert (= (and b!1369386 res!912111) b!1369390))

(assert (= (and b!1369390 res!912107) b!1369388))

(declare-fun m!1253743 () Bool)

(assert (=> b!1369380 m!1253743))

(declare-fun m!1253745 () Bool)

(assert (=> start!115924 m!1253745))

(declare-fun m!1253747 () Bool)

(assert (=> b!1369385 m!1253747))

(declare-fun m!1253749 () Bool)

(assert (=> b!1369388 m!1253749))

(declare-fun m!1253751 () Bool)

(assert (=> b!1369389 m!1253751))

(declare-fun m!1253753 () Bool)

(assert (=> b!1369384 m!1253753))

(declare-fun m!1253755 () Bool)

(assert (=> b!1369384 m!1253755))

(declare-fun m!1253757 () Bool)

(assert (=> b!1369382 m!1253757))

(declare-fun m!1253759 () Bool)

(assert (=> b!1369383 m!1253759))

(declare-fun m!1253761 () Bool)

(assert (=> b!1369381 m!1253761))

(declare-fun m!1253763 () Bool)

(assert (=> b!1369386 m!1253763))

(assert (=> b!1369386 m!1253763))

(declare-fun m!1253765 () Bool)

(assert (=> b!1369386 m!1253765))

(check-sat (not b!1369382) (not b!1369384) (not b!1369383) (not b!1369389) (not b!1369380) (not b!1369388) (not b!1369381) (not b!1369386) (not start!115924) (not b!1369385))
(check-sat)
