; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118256 () Bool)

(assert start!118256)

(declare-fun b!1383625 () Bool)

(declare-fun res!924430 () Bool)

(declare-fun e!784360 () Bool)

(assert (=> b!1383625 (=> (not res!924430) (not e!784360))))

(declare-datatypes ((array!94516 0))(
  ( (array!94517 (arr!45637 (Array (_ BitVec 32) (_ BitVec 64))) (size!46188 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94516)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383625 (= res!924430 (validKeyInArray!0 (select (arr!45637 a!2971) i!1094)))))

(declare-fun res!924429 () Bool)

(assert (=> start!118256 (=> (not res!924429) (not e!784360))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118256 (= res!924429 (validMask!0 mask!3034))))

(assert (=> start!118256 e!784360))

(assert (=> start!118256 true))

(declare-fun array_inv!34918 (array!94516) Bool)

(assert (=> start!118256 (array_inv!34918 a!2971)))

(declare-fun b!1383626 () Bool)

(declare-fun res!924427 () Bool)

(assert (=> b!1383626 (=> (not res!924427) (not e!784360))))

(declare-datatypes ((List!32158 0))(
  ( (Nil!32155) (Cons!32154 (h!33372 (_ BitVec 64)) (t!46844 List!32158)) )
))
(declare-fun arrayNoDuplicates!0 (array!94516 (_ BitVec 32) List!32158) Bool)

(assert (=> b!1383626 (= res!924427 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32155))))

(declare-fun b!1383624 () Bool)

(declare-fun res!924428 () Bool)

(assert (=> b!1383624 (=> (not res!924428) (not e!784360))))

(assert (=> b!1383624 (= res!924428 (and (= (size!46188 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46188 a!2971))))))

(declare-fun b!1383627 () Bool)

(assert (=> b!1383627 (= e!784360 false)))

(declare-fun lt!608877 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94516 (_ BitVec 32)) Bool)

(assert (=> b!1383627 (= lt!608877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118256 res!924429) b!1383624))

(assert (= (and b!1383624 res!924428) b!1383625))

(assert (= (and b!1383625 res!924430) b!1383626))

(assert (= (and b!1383626 res!924427) b!1383627))

(declare-fun m!1269087 () Bool)

(assert (=> b!1383625 m!1269087))

(assert (=> b!1383625 m!1269087))

(declare-fun m!1269089 () Bool)

(assert (=> b!1383625 m!1269089))

(declare-fun m!1269091 () Bool)

(assert (=> start!118256 m!1269091))

(declare-fun m!1269093 () Bool)

(assert (=> start!118256 m!1269093))

(declare-fun m!1269095 () Bool)

(assert (=> b!1383626 m!1269095))

(declare-fun m!1269097 () Bool)

(assert (=> b!1383627 m!1269097))

(check-sat (not b!1383625) (not b!1383627) (not start!118256) (not b!1383626))
(check-sat)
