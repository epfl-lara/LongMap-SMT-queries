; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117906 () Bool)

(assert start!117906)

(declare-fun res!923147 () Bool)

(declare-fun e!783131 () Bool)

(assert (=> start!117906 (=> (not res!923147) (not e!783131))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117906 (= res!923147 (validMask!0 mask!3034))))

(assert (=> start!117906 e!783131))

(assert (=> start!117906 true))

(declare-datatypes ((array!94297 0))(
  ( (array!94298 (arr!45531 (Array (_ BitVec 32) (_ BitVec 64))) (size!46081 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94297)

(declare-fun array_inv!34559 (array!94297) Bool)

(assert (=> start!117906 (array_inv!34559 a!2971)))

(declare-fun b!1381521 () Bool)

(assert (=> b!1381521 (= e!783131 (bvsgt #b00000000000000000000000000000000 (size!46081 a!2971)))))

(declare-fun b!1381520 () Bool)

(declare-fun res!923148 () Bool)

(assert (=> b!1381520 (=> (not res!923148) (not e!783131))))

(declare-datatypes ((List!32065 0))(
  ( (Nil!32062) (Cons!32061 (h!33270 (_ BitVec 64)) (t!46759 List!32065)) )
))
(declare-fun arrayNoDuplicates!0 (array!94297 (_ BitVec 32) List!32065) Bool)

(assert (=> b!1381520 (= res!923148 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32062))))

(declare-fun b!1381518 () Bool)

(declare-fun res!923149 () Bool)

(assert (=> b!1381518 (=> (not res!923149) (not e!783131))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381518 (= res!923149 (and (= (size!46081 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46081 a!2971))))))

(declare-fun b!1381519 () Bool)

(declare-fun res!923146 () Bool)

(assert (=> b!1381519 (=> (not res!923146) (not e!783131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381519 (= res!923146 (validKeyInArray!0 (select (arr!45531 a!2971) i!1094)))))

(assert (= (and start!117906 res!923147) b!1381518))

(assert (= (and b!1381518 res!923149) b!1381519))

(assert (= (and b!1381519 res!923146) b!1381520))

(assert (= (and b!1381520 res!923148) b!1381521))

(declare-fun m!1266703 () Bool)

(assert (=> start!117906 m!1266703))

(declare-fun m!1266705 () Bool)

(assert (=> start!117906 m!1266705))

(declare-fun m!1266707 () Bool)

(assert (=> b!1381520 m!1266707))

(declare-fun m!1266709 () Bool)

(assert (=> b!1381519 m!1266709))

(assert (=> b!1381519 m!1266709))

(declare-fun m!1266711 () Bool)

(assert (=> b!1381519 m!1266711))

(check-sat (not start!117906) (not b!1381520) (not b!1381519))
(check-sat)
