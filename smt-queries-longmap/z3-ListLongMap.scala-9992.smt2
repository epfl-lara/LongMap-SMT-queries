; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117960 () Bool)

(assert start!117960)

(declare-fun b!1381844 () Bool)

(declare-fun res!923472 () Bool)

(declare-fun e!783293 () Bool)

(assert (=> b!1381844 (=> (not res!923472) (not e!783293))))

(declare-datatypes ((array!94351 0))(
  ( (array!94352 (arr!45558 (Array (_ BitVec 32) (_ BitVec 64))) (size!46108 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94351)

(declare-datatypes ((List!32092 0))(
  ( (Nil!32089) (Cons!32088 (h!33297 (_ BitVec 64)) (t!46786 List!32092)) )
))
(declare-fun arrayNoDuplicates!0 (array!94351 (_ BitVec 32) List!32092) Bool)

(assert (=> b!1381844 (= res!923472 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32089))))

(declare-fun b!1381842 () Bool)

(declare-fun res!923471 () Bool)

(assert (=> b!1381842 (=> (not res!923471) (not e!783293))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381842 (= res!923471 (and (= (size!46108 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46108 a!2971))))))

(declare-fun res!923470 () Bool)

(assert (=> start!117960 (=> (not res!923470) (not e!783293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117960 (= res!923470 (validMask!0 mask!3034))))

(assert (=> start!117960 e!783293))

(assert (=> start!117960 true))

(declare-fun array_inv!34586 (array!94351) Bool)

(assert (=> start!117960 (array_inv!34586 a!2971)))

(declare-fun b!1381843 () Bool)

(declare-fun res!923473 () Bool)

(assert (=> b!1381843 (=> (not res!923473) (not e!783293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381843 (= res!923473 (validKeyInArray!0 (select (arr!45558 a!2971) i!1094)))))

(declare-fun b!1381845 () Bool)

(assert (=> b!1381845 (= e!783293 false)))

(declare-fun lt!608301 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94351 (_ BitVec 32)) Bool)

(assert (=> b!1381845 (= lt!608301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117960 res!923470) b!1381842))

(assert (= (and b!1381842 res!923471) b!1381843))

(assert (= (and b!1381843 res!923473) b!1381844))

(assert (= (and b!1381844 res!923472) b!1381845))

(declare-fun m!1267023 () Bool)

(assert (=> b!1381844 m!1267023))

(declare-fun m!1267025 () Bool)

(assert (=> start!117960 m!1267025))

(declare-fun m!1267027 () Bool)

(assert (=> start!117960 m!1267027))

(declare-fun m!1267029 () Bool)

(assert (=> b!1381843 m!1267029))

(assert (=> b!1381843 m!1267029))

(declare-fun m!1267031 () Bool)

(assert (=> b!1381843 m!1267031))

(declare-fun m!1267033 () Bool)

(assert (=> b!1381845 m!1267033))

(check-sat (not b!1381843) (not start!117960) (not b!1381844) (not b!1381845))
(check-sat)
