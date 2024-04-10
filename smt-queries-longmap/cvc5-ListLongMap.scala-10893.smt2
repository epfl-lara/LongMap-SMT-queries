; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127620 () Bool)

(assert start!127620)

(declare-fun b!1499261 () Bool)

(declare-fun e!839242 () Bool)

(declare-fun e!839241 () Bool)

(assert (=> b!1499261 (= e!839242 e!839241)))

(declare-fun res!1020341 () Bool)

(assert (=> b!1499261 (=> (not res!1020341) (not e!839241))))

(declare-datatypes ((array!100001 0))(
  ( (array!100002 (arr!48260 (Array (_ BitVec 32) (_ BitVec 64))) (size!48810 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100001)

(declare-fun lt!652702 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1499261 (= res!1020341 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652702 #b00000000000000000000000000000000) (bvslt lt!652702 (size!48810 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499261 (= lt!652702 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499262 () Bool)

(declare-fun res!1020343 () Bool)

(assert (=> b!1499262 (=> (not res!1020343) (not e!839242))))

(declare-datatypes ((List!34752 0))(
  ( (Nil!34749) (Cons!34748 (h!36145 (_ BitVec 64)) (t!49446 List!34752)) )
))
(declare-fun arrayNoDuplicates!0 (array!100001 (_ BitVec 32) List!34752) Bool)

(assert (=> b!1499262 (= res!1020343 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34749))))

(declare-fun b!1499263 () Bool)

(declare-fun res!1020346 () Bool)

(assert (=> b!1499263 (=> (not res!1020346) (not e!839242))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12470 0))(
  ( (MissingZero!12470 (index!52272 (_ BitVec 32))) (Found!12470 (index!52273 (_ BitVec 32))) (Intermediate!12470 (undefined!13282 Bool) (index!52274 (_ BitVec 32)) (x!133960 (_ BitVec 32))) (Undefined!12470) (MissingVacant!12470 (index!52275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100001 (_ BitVec 32)) SeekEntryResult!12470)

(assert (=> b!1499263 (= res!1020346 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48260 a!2850) j!87) a!2850 mask!2661) (Found!12470 j!87)))))

(declare-fun b!1499264 () Bool)

(declare-fun res!1020339 () Bool)

(assert (=> b!1499264 (=> (not res!1020339) (not e!839242))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499264 (= res!1020339 (validKeyInArray!0 (select (arr!48260 a!2850) i!996)))))

(declare-fun res!1020337 () Bool)

(assert (=> start!127620 (=> (not res!1020337) (not e!839242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127620 (= res!1020337 (validMask!0 mask!2661))))

(assert (=> start!127620 e!839242))

(assert (=> start!127620 true))

(declare-fun array_inv!37288 (array!100001) Bool)

(assert (=> start!127620 (array_inv!37288 a!2850)))

(declare-fun b!1499265 () Bool)

(declare-fun res!1020342 () Bool)

(assert (=> b!1499265 (=> (not res!1020342) (not e!839242))))

(assert (=> b!1499265 (= res!1020342 (not (= (select (arr!48260 a!2850) index!625) (select (arr!48260 a!2850) j!87))))))

(declare-fun b!1499266 () Bool)

(assert (=> b!1499266 (= e!839241 false)))

(declare-fun lt!652701 () SeekEntryResult!12470)

(assert (=> b!1499266 (= lt!652701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652702 vacantBefore!10 (select (arr!48260 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499267 () Bool)

(declare-fun res!1020345 () Bool)

(assert (=> b!1499267 (=> (not res!1020345) (not e!839242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100001 (_ BitVec 32)) Bool)

(assert (=> b!1499267 (= res!1020345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499268 () Bool)

(declare-fun res!1020340 () Bool)

(assert (=> b!1499268 (=> (not res!1020340) (not e!839242))))

(assert (=> b!1499268 (= res!1020340 (validKeyInArray!0 (select (arr!48260 a!2850) j!87)))))

(declare-fun b!1499269 () Bool)

(declare-fun res!1020344 () Bool)

(assert (=> b!1499269 (=> (not res!1020344) (not e!839242))))

(assert (=> b!1499269 (= res!1020344 (and (= (size!48810 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48810 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48810 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499270 () Bool)

(declare-fun res!1020338 () Bool)

(assert (=> b!1499270 (=> (not res!1020338) (not e!839242))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499270 (= res!1020338 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48810 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48810 a!2850)) (= (select (arr!48260 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48260 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48810 a!2850))))))

(assert (= (and start!127620 res!1020337) b!1499269))

(assert (= (and b!1499269 res!1020344) b!1499264))

(assert (= (and b!1499264 res!1020339) b!1499268))

(assert (= (and b!1499268 res!1020340) b!1499267))

(assert (= (and b!1499267 res!1020345) b!1499262))

(assert (= (and b!1499262 res!1020343) b!1499270))

(assert (= (and b!1499270 res!1020338) b!1499263))

(assert (= (and b!1499263 res!1020346) b!1499265))

(assert (= (and b!1499265 res!1020342) b!1499261))

(assert (= (and b!1499261 res!1020341) b!1499266))

(declare-fun m!1382455 () Bool)

(assert (=> start!127620 m!1382455))

(declare-fun m!1382457 () Bool)

(assert (=> start!127620 m!1382457))

(declare-fun m!1382459 () Bool)

(assert (=> b!1499262 m!1382459))

(declare-fun m!1382461 () Bool)

(assert (=> b!1499264 m!1382461))

(assert (=> b!1499264 m!1382461))

(declare-fun m!1382463 () Bool)

(assert (=> b!1499264 m!1382463))

(declare-fun m!1382465 () Bool)

(assert (=> b!1499267 m!1382465))

(declare-fun m!1382467 () Bool)

(assert (=> b!1499270 m!1382467))

(declare-fun m!1382469 () Bool)

(assert (=> b!1499270 m!1382469))

(declare-fun m!1382471 () Bool)

(assert (=> b!1499270 m!1382471))

(declare-fun m!1382473 () Bool)

(assert (=> b!1499265 m!1382473))

(declare-fun m!1382475 () Bool)

(assert (=> b!1499265 m!1382475))

(assert (=> b!1499263 m!1382475))

(assert (=> b!1499263 m!1382475))

(declare-fun m!1382477 () Bool)

(assert (=> b!1499263 m!1382477))

(assert (=> b!1499266 m!1382475))

(assert (=> b!1499266 m!1382475))

(declare-fun m!1382479 () Bool)

(assert (=> b!1499266 m!1382479))

(declare-fun m!1382481 () Bool)

(assert (=> b!1499261 m!1382481))

(assert (=> b!1499268 m!1382475))

(assert (=> b!1499268 m!1382475))

(declare-fun m!1382483 () Bool)

(assert (=> b!1499268 m!1382483))

(push 1)

