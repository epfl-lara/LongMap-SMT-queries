; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118068 () Bool)

(assert start!118068)

(declare-fun b!1382477 () Bool)

(declare-fun e!783590 () Bool)

(declare-datatypes ((array!94432 0))(
  ( (array!94433 (arr!45597 (Array (_ BitVec 32) (_ BitVec 64))) (size!46147 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94432)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382477 (= e!783590 (and (not (= (select (arr!45597 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45597 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!46147 a!2971))))))

(declare-fun b!1382478 () Bool)

(declare-fun res!924071 () Bool)

(assert (=> b!1382478 (=> (not res!924071) (not e!783590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382478 (= res!924071 (validKeyInArray!0 (select (arr!45597 a!2971) i!1094)))))

(declare-fun res!924069 () Bool)

(assert (=> start!118068 (=> (not res!924069) (not e!783590))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118068 (= res!924069 (validMask!0 mask!3034))))

(assert (=> start!118068 e!783590))

(assert (=> start!118068 true))

(declare-fun array_inv!34625 (array!94432) Bool)

(assert (=> start!118068 (array_inv!34625 a!2971)))

(declare-fun b!1382479 () Bool)

(declare-fun res!924073 () Bool)

(assert (=> b!1382479 (=> (not res!924073) (not e!783590))))

(assert (=> b!1382479 (= res!924073 (and (= (size!46147 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46147 a!2971))))))

(declare-fun b!1382480 () Bool)

(declare-fun res!924070 () Bool)

(assert (=> b!1382480 (=> (not res!924070) (not e!783590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94432 (_ BitVec 32)) Bool)

(assert (=> b!1382480 (= res!924070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382481 () Bool)

(declare-fun res!924072 () Bool)

(assert (=> b!1382481 (=> (not res!924072) (not e!783590))))

(declare-datatypes ((List!32131 0))(
  ( (Nil!32128) (Cons!32127 (h!33336 (_ BitVec 64)) (t!46825 List!32131)) )
))
(declare-fun arrayNoDuplicates!0 (array!94432 (_ BitVec 32) List!32131) Bool)

(assert (=> b!1382481 (= res!924072 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32128))))

(assert (= (and start!118068 res!924069) b!1382479))

(assert (= (and b!1382479 res!924073) b!1382478))

(assert (= (and b!1382478 res!924071) b!1382481))

(assert (= (and b!1382481 res!924072) b!1382480))

(assert (= (and b!1382480 res!924070) b!1382477))

(declare-fun m!1267611 () Bool)

(assert (=> b!1382478 m!1267611))

(assert (=> b!1382478 m!1267611))

(declare-fun m!1267613 () Bool)

(assert (=> b!1382478 m!1267613))

(assert (=> b!1382477 m!1267611))

(declare-fun m!1267615 () Bool)

(assert (=> b!1382481 m!1267615))

(declare-fun m!1267617 () Bool)

(assert (=> b!1382480 m!1267617))

(declare-fun m!1267619 () Bool)

(assert (=> start!118068 m!1267619))

(declare-fun m!1267621 () Bool)

(assert (=> start!118068 m!1267621))

(check-sat (not b!1382480) (not b!1382478) (not start!118068) (not b!1382481))
(check-sat)
