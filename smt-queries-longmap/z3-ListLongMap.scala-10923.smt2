; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127802 () Bool)

(assert start!127802)

(declare-fun b!1501912 () Bool)

(declare-fun res!1022992 () Bool)

(declare-fun e!840108 () Bool)

(assert (=> b!1501912 (=> (not res!1022992) (not e!840108))))

(declare-datatypes ((array!100183 0))(
  ( (array!100184 (arr!48351 (Array (_ BitVec 32) (_ BitVec 64))) (size!48901 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100183)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100183 (_ BitVec 32)) Bool)

(assert (=> b!1501912 (= res!1022992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501913 () Bool)

(declare-fun res!1022989 () Bool)

(assert (=> b!1501913 (=> (not res!1022989) (not e!840108))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501913 (= res!1022989 (validKeyInArray!0 (select (arr!48351 a!2850) i!996)))))

(declare-fun b!1501914 () Bool)

(declare-fun res!1022990 () Bool)

(assert (=> b!1501914 (=> (not res!1022990) (not e!840108))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501914 (= res!1022990 (validKeyInArray!0 (select (arr!48351 a!2850) j!87)))))

(declare-fun res!1022988 () Bool)

(assert (=> start!127802 (=> (not res!1022988) (not e!840108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127802 (= res!1022988 (validMask!0 mask!2661))))

(assert (=> start!127802 e!840108))

(assert (=> start!127802 true))

(declare-fun array_inv!37379 (array!100183) Bool)

(assert (=> start!127802 (array_inv!37379 a!2850)))

(declare-fun b!1501915 () Bool)

(assert (=> b!1501915 (= e!840108 false)))

(declare-fun lt!653287 () Bool)

(declare-datatypes ((List!34843 0))(
  ( (Nil!34840) (Cons!34839 (h!36236 (_ BitVec 64)) (t!49537 List!34843)) )
))
(declare-fun arrayNoDuplicates!0 (array!100183 (_ BitVec 32) List!34843) Bool)

(assert (=> b!1501915 (= lt!653287 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34840))))

(declare-fun b!1501916 () Bool)

(declare-fun res!1022991 () Bool)

(assert (=> b!1501916 (=> (not res!1022991) (not e!840108))))

(assert (=> b!1501916 (= res!1022991 (and (= (size!48901 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48901 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48901 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127802 res!1022988) b!1501916))

(assert (= (and b!1501916 res!1022991) b!1501913))

(assert (= (and b!1501913 res!1022989) b!1501914))

(assert (= (and b!1501914 res!1022990) b!1501912))

(assert (= (and b!1501912 res!1022992) b!1501915))

(declare-fun m!1385195 () Bool)

(assert (=> b!1501912 m!1385195))

(declare-fun m!1385197 () Bool)

(assert (=> b!1501913 m!1385197))

(assert (=> b!1501913 m!1385197))

(declare-fun m!1385199 () Bool)

(assert (=> b!1501913 m!1385199))

(declare-fun m!1385201 () Bool)

(assert (=> b!1501914 m!1385201))

(assert (=> b!1501914 m!1385201))

(declare-fun m!1385203 () Bool)

(assert (=> b!1501914 m!1385203))

(declare-fun m!1385205 () Bool)

(assert (=> b!1501915 m!1385205))

(declare-fun m!1385207 () Bool)

(assert (=> start!127802 m!1385207))

(declare-fun m!1385209 () Bool)

(assert (=> start!127802 m!1385209))

(check-sat (not b!1501913) (not start!127802) (not b!1501914) (not b!1501912) (not b!1501915))
