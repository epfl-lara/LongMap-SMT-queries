; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116608 () Bool)

(assert start!116608)

(declare-fun b!1374861 () Bool)

(declare-fun e!778858 () Bool)

(assert (=> b!1374861 (= e!778858 (not true))))

(declare-datatypes ((array!93293 0))(
  ( (array!93294 (arr!45051 (Array (_ BitVec 32) (_ BitVec 64))) (size!45601 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93293)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374861 (= (arrayCountValidKeys!0 (array!93294 (store (arr!45051 a!4142) i!1457 k0!2959) (size!45601 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45491 0))(
  ( (Unit!45492) )
))
(declare-fun lt!603909 () Unit!45491)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45491)

(assert (=> b!1374861 (= lt!603909 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374859 () Bool)

(declare-fun res!917986 () Bool)

(assert (=> b!1374859 (=> (not res!917986) (not e!778858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374859 (= res!917986 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374860 () Bool)

(declare-fun res!917987 () Bool)

(assert (=> b!1374860 (=> (not res!917987) (not e!778858))))

(assert (=> b!1374860 (= res!917987 (bvslt (size!45601 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917989 () Bool)

(assert (=> start!116608 (=> (not res!917989) (not e!778858))))

(assert (=> start!116608 (= res!917989 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45601 a!4142))))))

(assert (=> start!116608 e!778858))

(assert (=> start!116608 true))

(declare-fun array_inv!34079 (array!93293) Bool)

(assert (=> start!116608 (array_inv!34079 a!4142)))

(declare-fun b!1374858 () Bool)

(declare-fun res!917988 () Bool)

(assert (=> b!1374858 (=> (not res!917988) (not e!778858))))

(assert (=> b!1374858 (= res!917988 (validKeyInArray!0 (select (arr!45051 a!4142) i!1457)))))

(assert (= (and start!116608 res!917989) b!1374858))

(assert (= (and b!1374858 res!917988) b!1374859))

(assert (= (and b!1374859 res!917986) b!1374860))

(assert (= (and b!1374860 res!917987) b!1374861))

(declare-fun m!1258439 () Bool)

(assert (=> b!1374861 m!1258439))

(declare-fun m!1258441 () Bool)

(assert (=> b!1374861 m!1258441))

(declare-fun m!1258443 () Bool)

(assert (=> b!1374861 m!1258443))

(declare-fun m!1258445 () Bool)

(assert (=> b!1374861 m!1258445))

(declare-fun m!1258447 () Bool)

(assert (=> b!1374859 m!1258447))

(declare-fun m!1258449 () Bool)

(assert (=> start!116608 m!1258449))

(declare-fun m!1258451 () Bool)

(assert (=> b!1374858 m!1258451))

(assert (=> b!1374858 m!1258451))

(declare-fun m!1258453 () Bool)

(assert (=> b!1374858 m!1258453))

(check-sat (not start!116608) (not b!1374858) (not b!1374859) (not b!1374861))
