; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119030 () Bool)

(assert start!119030)

(declare-fun b!1389073 () Bool)

(declare-fun e!786872 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389073 (= e!786872 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((array!94953 0))(
  ( (array!94954 (arr!45844 (Array (_ BitVec 32) (_ BitVec 64))) (size!46396 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94953)

(declare-fun lt!610298 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389073 (= lt!610298 (toIndex!0 (select (arr!45844 a!2901) j!112) mask!2840))))

(declare-fun b!1389074 () Bool)

(declare-fun res!929320 () Bool)

(assert (=> b!1389074 (=> (not res!929320) (not e!786872))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389074 (= res!929320 (validKeyInArray!0 (select (arr!45844 a!2901) i!1037)))))

(declare-fun b!1389075 () Bool)

(declare-fun res!929321 () Bool)

(assert (=> b!1389075 (=> (not res!929321) (not e!786872))))

(assert (=> b!1389075 (= res!929321 (validKeyInArray!0 (select (arr!45844 a!2901) j!112)))))

(declare-fun res!929318 () Bool)

(assert (=> start!119030 (=> (not res!929318) (not e!786872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119030 (= res!929318 (validMask!0 mask!2840))))

(assert (=> start!119030 e!786872))

(assert (=> start!119030 true))

(declare-fun array_inv!35077 (array!94953) Bool)

(assert (=> start!119030 (array_inv!35077 a!2901)))

(declare-fun b!1389076 () Bool)

(declare-fun res!929322 () Bool)

(assert (=> b!1389076 (=> (not res!929322) (not e!786872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94953 (_ BitVec 32)) Bool)

(assert (=> b!1389076 (= res!929322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389077 () Bool)

(declare-fun res!929319 () Bool)

(assert (=> b!1389077 (=> (not res!929319) (not e!786872))))

(assert (=> b!1389077 (= res!929319 (and (= (size!46396 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46396 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46396 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389078 () Bool)

(declare-fun res!929323 () Bool)

(assert (=> b!1389078 (=> (not res!929323) (not e!786872))))

(declare-datatypes ((List!32441 0))(
  ( (Nil!32438) (Cons!32437 (h!33652 (_ BitVec 64)) (t!47127 List!32441)) )
))
(declare-fun arrayNoDuplicates!0 (array!94953 (_ BitVec 32) List!32441) Bool)

(assert (=> b!1389078 (= res!929323 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32438))))

(assert (= (and start!119030 res!929318) b!1389077))

(assert (= (and b!1389077 res!929319) b!1389074))

(assert (= (and b!1389074 res!929320) b!1389075))

(assert (= (and b!1389075 res!929321) b!1389076))

(assert (= (and b!1389076 res!929322) b!1389078))

(assert (= (and b!1389078 res!929323) b!1389073))

(declare-fun m!1274293 () Bool)

(assert (=> b!1389078 m!1274293))

(declare-fun m!1274295 () Bool)

(assert (=> b!1389075 m!1274295))

(assert (=> b!1389075 m!1274295))

(declare-fun m!1274297 () Bool)

(assert (=> b!1389075 m!1274297))

(declare-fun m!1274299 () Bool)

(assert (=> b!1389074 m!1274299))

(assert (=> b!1389074 m!1274299))

(declare-fun m!1274301 () Bool)

(assert (=> b!1389074 m!1274301))

(declare-fun m!1274303 () Bool)

(assert (=> b!1389076 m!1274303))

(declare-fun m!1274305 () Bool)

(assert (=> start!119030 m!1274305))

(declare-fun m!1274307 () Bool)

(assert (=> start!119030 m!1274307))

(assert (=> b!1389073 m!1274295))

(assert (=> b!1389073 m!1274295))

(declare-fun m!1274309 () Bool)

(assert (=> b!1389073 m!1274309))

(check-sat (not start!119030) (not b!1389078) (not b!1389075) (not b!1389076) (not b!1389073) (not b!1389074))
(check-sat)
