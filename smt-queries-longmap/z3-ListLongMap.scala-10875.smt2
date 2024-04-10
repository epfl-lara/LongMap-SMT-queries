; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127514 () Bool)

(assert start!127514)

(declare-fun b!1498159 () Bool)

(declare-fun res!1019237 () Bool)

(declare-fun e!838921 () Bool)

(assert (=> b!1498159 (=> (not res!1019237) (not e!838921))))

(declare-datatypes ((array!99895 0))(
  ( (array!99896 (arr!48207 (Array (_ BitVec 32) (_ BitVec 64))) (size!48757 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99895)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1498159 (= res!1019237 (and (= (size!48757 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48757 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48757 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498160 () Bool)

(assert (=> b!1498160 (= e!838921 false)))

(declare-fun lt!652612 () Bool)

(declare-datatypes ((List!34699 0))(
  ( (Nil!34696) (Cons!34695 (h!36092 (_ BitVec 64)) (t!49393 List!34699)) )
))
(declare-fun arrayNoDuplicates!0 (array!99895 (_ BitVec 32) List!34699) Bool)

(assert (=> b!1498160 (= lt!652612 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34696))))

(declare-fun res!1019239 () Bool)

(assert (=> start!127514 (=> (not res!1019239) (not e!838921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127514 (= res!1019239 (validMask!0 mask!2661))))

(assert (=> start!127514 e!838921))

(assert (=> start!127514 true))

(declare-fun array_inv!37235 (array!99895) Bool)

(assert (=> start!127514 (array_inv!37235 a!2850)))

(declare-fun b!1498161 () Bool)

(declare-fun res!1019238 () Bool)

(assert (=> b!1498161 (=> (not res!1019238) (not e!838921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498161 (= res!1019238 (validKeyInArray!0 (select (arr!48207 a!2850) i!996)))))

(declare-fun b!1498162 () Bool)

(declare-fun res!1019236 () Bool)

(assert (=> b!1498162 (=> (not res!1019236) (not e!838921))))

(assert (=> b!1498162 (= res!1019236 (validKeyInArray!0 (select (arr!48207 a!2850) j!87)))))

(declare-fun b!1498163 () Bool)

(declare-fun res!1019235 () Bool)

(assert (=> b!1498163 (=> (not res!1019235) (not e!838921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99895 (_ BitVec 32)) Bool)

(assert (=> b!1498163 (= res!1019235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127514 res!1019239) b!1498159))

(assert (= (and b!1498159 res!1019237) b!1498161))

(assert (= (and b!1498161 res!1019238) b!1498162))

(assert (= (and b!1498162 res!1019236) b!1498163))

(assert (= (and b!1498163 res!1019235) b!1498160))

(declare-fun m!1381235 () Bool)

(assert (=> b!1498163 m!1381235))

(declare-fun m!1381237 () Bool)

(assert (=> b!1498162 m!1381237))

(assert (=> b!1498162 m!1381237))

(declare-fun m!1381239 () Bool)

(assert (=> b!1498162 m!1381239))

(declare-fun m!1381241 () Bool)

(assert (=> start!127514 m!1381241))

(declare-fun m!1381243 () Bool)

(assert (=> start!127514 m!1381243))

(declare-fun m!1381245 () Bool)

(assert (=> b!1498161 m!1381245))

(assert (=> b!1498161 m!1381245))

(declare-fun m!1381247 () Bool)

(assert (=> b!1498161 m!1381247))

(declare-fun m!1381249 () Bool)

(assert (=> b!1498160 m!1381249))

(check-sat (not b!1498162) (not b!1498161) (not b!1498160) (not b!1498163) (not start!127514))
