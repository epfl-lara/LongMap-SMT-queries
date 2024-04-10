; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127750 () Bool)

(assert start!127750)

(declare-fun b!1501237 () Bool)

(declare-fun res!1022314 () Bool)

(declare-fun e!839851 () Bool)

(assert (=> b!1501237 (=> (not res!1022314) (not e!839851))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100131 0))(
  ( (array!100132 (arr!48325 (Array (_ BitVec 32) (_ BitVec 64))) (size!48875 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100131)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501237 (= res!1022314 (and (= (size!48875 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48875 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48875 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501238 () Bool)

(declare-fun e!839854 () Bool)

(declare-fun e!839853 () Bool)

(assert (=> b!1501238 (= e!839854 e!839853)))

(declare-fun res!1022316 () Bool)

(assert (=> b!1501238 (=> (not res!1022316) (not e!839853))))

(declare-fun lt!653119 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1501238 (= res!1022316 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653119 #b00000000000000000000000000000000) (bvslt lt!653119 (size!48875 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501238 (= lt!653119 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501239 () Bool)

(declare-fun res!1022318 () Bool)

(assert (=> b!1501239 (=> (not res!1022318) (not e!839851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100131 (_ BitVec 32)) Bool)

(assert (=> b!1501239 (= res!1022318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501240 () Bool)

(assert (=> b!1501240 (= e!839853 (not true))))

(declare-datatypes ((SeekEntryResult!12535 0))(
  ( (MissingZero!12535 (index!52532 (_ BitVec 32))) (Found!12535 (index!52533 (_ BitVec 32))) (Intermediate!12535 (undefined!13347 Bool) (index!52534 (_ BitVec 32)) (x!134193 (_ BitVec 32))) (Undefined!12535) (MissingVacant!12535 (index!52535 (_ BitVec 32))) )
))
(declare-fun lt!653117 () SeekEntryResult!12535)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100131 (_ BitVec 32)) SeekEntryResult!12535)

(assert (=> b!1501240 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653119 vacantAfter!10 (select (store (arr!48325 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100132 (store (arr!48325 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48875 a!2850)) mask!2661) lt!653117)))

(declare-datatypes ((Unit!50224 0))(
  ( (Unit!50225) )
))
(declare-fun lt!653118 () Unit!50224)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50224)

(assert (=> b!1501240 (= lt!653118 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653119 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501241 () Bool)

(declare-fun res!1022323 () Bool)

(assert (=> b!1501241 (=> (not res!1022323) (not e!839851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501241 (= res!1022323 (validKeyInArray!0 (select (arr!48325 a!2850) i!996)))))

(declare-fun res!1022320 () Bool)

(assert (=> start!127750 (=> (not res!1022320) (not e!839851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127750 (= res!1022320 (validMask!0 mask!2661))))

(assert (=> start!127750 e!839851))

(assert (=> start!127750 true))

(declare-fun array_inv!37353 (array!100131) Bool)

(assert (=> start!127750 (array_inv!37353 a!2850)))

(declare-fun b!1501242 () Bool)

(declare-fun res!1022315 () Bool)

(assert (=> b!1501242 (=> (not res!1022315) (not e!839854))))

(assert (=> b!1501242 (= res!1022315 (not (= (select (arr!48325 a!2850) index!625) (select (arr!48325 a!2850) j!87))))))

(declare-fun b!1501243 () Bool)

(declare-fun res!1022317 () Bool)

(assert (=> b!1501243 (=> (not res!1022317) (not e!839853))))

(assert (=> b!1501243 (= res!1022317 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653119 vacantBefore!10 (select (arr!48325 a!2850) j!87) a!2850 mask!2661) lt!653117))))

(declare-fun b!1501244 () Bool)

(declare-fun res!1022313 () Bool)

(assert (=> b!1501244 (=> (not res!1022313) (not e!839851))))

(declare-datatypes ((List!34817 0))(
  ( (Nil!34814) (Cons!34813 (h!36210 (_ BitVec 64)) (t!49511 List!34817)) )
))
(declare-fun arrayNoDuplicates!0 (array!100131 (_ BitVec 32) List!34817) Bool)

(assert (=> b!1501244 (= res!1022313 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34814))))

(declare-fun b!1501245 () Bool)

(declare-fun res!1022322 () Bool)

(assert (=> b!1501245 (=> (not res!1022322) (not e!839851))))

(assert (=> b!1501245 (= res!1022322 (validKeyInArray!0 (select (arr!48325 a!2850) j!87)))))

(declare-fun b!1501246 () Bool)

(declare-fun res!1022319 () Bool)

(assert (=> b!1501246 (=> (not res!1022319) (not e!839851))))

(assert (=> b!1501246 (= res!1022319 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48875 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48875 a!2850)) (= (select (arr!48325 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48325 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48875 a!2850))))))

(declare-fun b!1501247 () Bool)

(assert (=> b!1501247 (= e!839851 e!839854)))

(declare-fun res!1022321 () Bool)

(assert (=> b!1501247 (=> (not res!1022321) (not e!839854))))

(assert (=> b!1501247 (= res!1022321 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48325 a!2850) j!87) a!2850 mask!2661) lt!653117))))

(assert (=> b!1501247 (= lt!653117 (Found!12535 j!87))))

(assert (= (and start!127750 res!1022320) b!1501237))

(assert (= (and b!1501237 res!1022314) b!1501241))

(assert (= (and b!1501241 res!1022323) b!1501245))

(assert (= (and b!1501245 res!1022322) b!1501239))

(assert (= (and b!1501239 res!1022318) b!1501244))

(assert (= (and b!1501244 res!1022313) b!1501246))

(assert (= (and b!1501246 res!1022319) b!1501247))

(assert (= (and b!1501247 res!1022321) b!1501242))

(assert (= (and b!1501242 res!1022315) b!1501238))

(assert (= (and b!1501238 res!1022316) b!1501243))

(assert (= (and b!1501243 res!1022317) b!1501240))

(declare-fun m!1384453 () Bool)

(assert (=> b!1501238 m!1384453))

(declare-fun m!1384455 () Bool)

(assert (=> b!1501244 m!1384455))

(declare-fun m!1384457 () Bool)

(assert (=> b!1501246 m!1384457))

(declare-fun m!1384459 () Bool)

(assert (=> b!1501246 m!1384459))

(declare-fun m!1384461 () Bool)

(assert (=> b!1501246 m!1384461))

(declare-fun m!1384463 () Bool)

(assert (=> b!1501243 m!1384463))

(assert (=> b!1501243 m!1384463))

(declare-fun m!1384465 () Bool)

(assert (=> b!1501243 m!1384465))

(assert (=> b!1501245 m!1384463))

(assert (=> b!1501245 m!1384463))

(declare-fun m!1384467 () Bool)

(assert (=> b!1501245 m!1384467))

(assert (=> b!1501247 m!1384463))

(assert (=> b!1501247 m!1384463))

(declare-fun m!1384469 () Bool)

(assert (=> b!1501247 m!1384469))

(declare-fun m!1384471 () Bool)

(assert (=> b!1501241 m!1384471))

(assert (=> b!1501241 m!1384471))

(declare-fun m!1384473 () Bool)

(assert (=> b!1501241 m!1384473))

(declare-fun m!1384475 () Bool)

(assert (=> b!1501239 m!1384475))

(declare-fun m!1384477 () Bool)

(assert (=> start!127750 m!1384477))

(declare-fun m!1384479 () Bool)

(assert (=> start!127750 m!1384479))

(declare-fun m!1384481 () Bool)

(assert (=> b!1501242 m!1384481))

(assert (=> b!1501242 m!1384463))

(assert (=> b!1501240 m!1384459))

(declare-fun m!1384483 () Bool)

(assert (=> b!1501240 m!1384483))

(assert (=> b!1501240 m!1384483))

(declare-fun m!1384485 () Bool)

(assert (=> b!1501240 m!1384485))

(declare-fun m!1384487 () Bool)

(assert (=> b!1501240 m!1384487))

(push 1)

(assert (not b!1501247))

(assert (not b!1501238))

(assert (not b!1501240))

(assert (not b!1501243))

(assert (not b!1501244))

(assert (not b!1501241))

