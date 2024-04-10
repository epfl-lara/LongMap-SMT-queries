; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127742 () Bool)

(assert start!127742)

(declare-fun b!1501105 () Bool)

(declare-fun res!1022189 () Bool)

(declare-fun e!839805 () Bool)

(assert (=> b!1501105 (=> (not res!1022189) (not e!839805))))

(declare-datatypes ((array!100123 0))(
  ( (array!100124 (arr!48321 (Array (_ BitVec 32) (_ BitVec 64))) (size!48871 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100123)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501105 (= res!1022189 (not (= (select (arr!48321 a!2850) index!625) (select (arr!48321 a!2850) j!87))))))

(declare-fun b!1501106 () Bool)

(declare-fun res!1022183 () Bool)

(declare-fun e!839806 () Bool)

(assert (=> b!1501106 (=> (not res!1022183) (not e!839806))))

(declare-datatypes ((List!34813 0))(
  ( (Nil!34810) (Cons!34809 (h!36206 (_ BitVec 64)) (t!49507 List!34813)) )
))
(declare-fun arrayNoDuplicates!0 (array!100123 (_ BitVec 32) List!34813) Bool)

(assert (=> b!1501106 (= res!1022183 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34810))))

(declare-fun b!1501107 () Bool)

(declare-fun res!1022186 () Bool)

(assert (=> b!1501107 (=> (not res!1022186) (not e!839806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501107 (= res!1022186 (validKeyInArray!0 (select (arr!48321 a!2850) j!87)))))

(declare-fun b!1501108 () Bool)

(declare-fun e!839803 () Bool)

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1501108 (= e!839803 (not (bvsge mask!2661 #b00000000000000000000000000000000)))))

(declare-fun lt!653082 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12531 0))(
  ( (MissingZero!12531 (index!52516 (_ BitVec 32))) (Found!12531 (index!52517 (_ BitVec 32))) (Intermediate!12531 (undefined!13343 Bool) (index!52518 (_ BitVec 32)) (x!134181 (_ BitVec 32))) (Undefined!12531) (MissingVacant!12531 (index!52519 (_ BitVec 32))) )
))
(declare-fun lt!653083 () SeekEntryResult!12531)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100123 (_ BitVec 32)) SeekEntryResult!12531)

(assert (=> b!1501108 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653082 vacantAfter!10 (select (store (arr!48321 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100124 (store (arr!48321 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48871 a!2850)) mask!2661) lt!653083)))

(declare-datatypes ((Unit!50216 0))(
  ( (Unit!50217) )
))
(declare-fun lt!653081 () Unit!50216)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50216)

(assert (=> b!1501108 (= lt!653081 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653082 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501110 () Bool)

(declare-fun res!1022188 () Bool)

(assert (=> b!1501110 (=> (not res!1022188) (not e!839806))))

(assert (=> b!1501110 (= res!1022188 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48871 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48871 a!2850)) (= (select (arr!48321 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48321 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48871 a!2850))))))

(declare-fun b!1501111 () Bool)

(assert (=> b!1501111 (= e!839806 e!839805)))

(declare-fun res!1022191 () Bool)

(assert (=> b!1501111 (=> (not res!1022191) (not e!839805))))

(assert (=> b!1501111 (= res!1022191 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48321 a!2850) j!87) a!2850 mask!2661) lt!653083))))

(assert (=> b!1501111 (= lt!653083 (Found!12531 j!87))))

(declare-fun b!1501112 () Bool)

(declare-fun res!1022190 () Bool)

(assert (=> b!1501112 (=> (not res!1022190) (not e!839803))))

(assert (=> b!1501112 (= res!1022190 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653082 vacantBefore!10 (select (arr!48321 a!2850) j!87) a!2850 mask!2661) lt!653083))))

(declare-fun b!1501113 () Bool)

(declare-fun res!1022182 () Bool)

(assert (=> b!1501113 (=> (not res!1022182) (not e!839806))))

(assert (=> b!1501113 (= res!1022182 (validKeyInArray!0 (select (arr!48321 a!2850) i!996)))))

(declare-fun b!1501114 () Bool)

(declare-fun res!1022184 () Bool)

(assert (=> b!1501114 (=> (not res!1022184) (not e!839806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100123 (_ BitVec 32)) Bool)

(assert (=> b!1501114 (= res!1022184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501115 () Bool)

(assert (=> b!1501115 (= e!839805 e!839803)))

(declare-fun res!1022185 () Bool)

(assert (=> b!1501115 (=> (not res!1022185) (not e!839803))))

(assert (=> b!1501115 (= res!1022185 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653082 #b00000000000000000000000000000000) (bvslt lt!653082 (size!48871 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501115 (= lt!653082 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501109 () Bool)

(declare-fun res!1022181 () Bool)

(assert (=> b!1501109 (=> (not res!1022181) (not e!839806))))

(assert (=> b!1501109 (= res!1022181 (and (= (size!48871 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48871 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48871 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022187 () Bool)

(assert (=> start!127742 (=> (not res!1022187) (not e!839806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127742 (= res!1022187 (validMask!0 mask!2661))))

(assert (=> start!127742 e!839806))

(assert (=> start!127742 true))

(declare-fun array_inv!37349 (array!100123) Bool)

(assert (=> start!127742 (array_inv!37349 a!2850)))

(assert (= (and start!127742 res!1022187) b!1501109))

(assert (= (and b!1501109 res!1022181) b!1501113))

(assert (= (and b!1501113 res!1022182) b!1501107))

(assert (= (and b!1501107 res!1022186) b!1501114))

(assert (= (and b!1501114 res!1022184) b!1501106))

(assert (= (and b!1501106 res!1022183) b!1501110))

(assert (= (and b!1501110 res!1022188) b!1501111))

(assert (= (and b!1501111 res!1022191) b!1501105))

(assert (= (and b!1501105 res!1022189) b!1501115))

(assert (= (and b!1501115 res!1022185) b!1501112))

(assert (= (and b!1501112 res!1022190) b!1501108))

(declare-fun m!1384309 () Bool)

(assert (=> b!1501111 m!1384309))

(assert (=> b!1501111 m!1384309))

(declare-fun m!1384311 () Bool)

(assert (=> b!1501111 m!1384311))

(declare-fun m!1384313 () Bool)

(assert (=> b!1501106 m!1384313))

(declare-fun m!1384315 () Bool)

(assert (=> b!1501115 m!1384315))

(declare-fun m!1384317 () Bool)

(assert (=> b!1501108 m!1384317))

(declare-fun m!1384319 () Bool)

(assert (=> b!1501108 m!1384319))

(assert (=> b!1501108 m!1384319))

(declare-fun m!1384321 () Bool)

(assert (=> b!1501108 m!1384321))

(declare-fun m!1384323 () Bool)

(assert (=> b!1501108 m!1384323))

(declare-fun m!1384325 () Bool)

(assert (=> b!1501113 m!1384325))

(assert (=> b!1501113 m!1384325))

(declare-fun m!1384327 () Bool)

(assert (=> b!1501113 m!1384327))

(declare-fun m!1384329 () Bool)

(assert (=> start!127742 m!1384329))

(declare-fun m!1384331 () Bool)

(assert (=> start!127742 m!1384331))

(declare-fun m!1384333 () Bool)

(assert (=> b!1501114 m!1384333))

(assert (=> b!1501107 m!1384309))

(assert (=> b!1501107 m!1384309))

(declare-fun m!1384335 () Bool)

(assert (=> b!1501107 m!1384335))

(declare-fun m!1384337 () Bool)

(assert (=> b!1501110 m!1384337))

(assert (=> b!1501110 m!1384317))

(declare-fun m!1384339 () Bool)

(assert (=> b!1501110 m!1384339))

(assert (=> b!1501112 m!1384309))

(assert (=> b!1501112 m!1384309))

(declare-fun m!1384341 () Bool)

(assert (=> b!1501112 m!1384341))

(declare-fun m!1384343 () Bool)

(assert (=> b!1501105 m!1384343))

(assert (=> b!1501105 m!1384309))

(check-sat (not b!1501112) (not b!1501111) (not b!1501115) (not b!1501113) (not b!1501108) (not b!1501106) (not start!127742) (not b!1501114) (not b!1501107))
(check-sat)
