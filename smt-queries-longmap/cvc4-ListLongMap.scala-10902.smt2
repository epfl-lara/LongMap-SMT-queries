; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127678 () Bool)

(assert start!127678)

(declare-fun b!1500131 () Bool)

(declare-fun res!1021210 () Bool)

(declare-fun e!839502 () Bool)

(assert (=> b!1500131 (=> (not res!1021210) (not e!839502))))

(declare-datatypes ((array!100059 0))(
  ( (array!100060 (arr!48289 (Array (_ BitVec 32) (_ BitVec 64))) (size!48839 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100059)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500131 (= res!1021210 (not (= (select (arr!48289 a!2850) index!625) (select (arr!48289 a!2850) j!87))))))

(declare-fun b!1500132 () Bool)

(declare-fun res!1021216 () Bool)

(assert (=> b!1500132 (=> (not res!1021216) (not e!839502))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100059 (_ BitVec 32)) Bool)

(assert (=> b!1500132 (= res!1021216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500133 () Bool)

(declare-fun e!839503 () Bool)

(assert (=> b!1500133 (= e!839503 false)))

(declare-datatypes ((SeekEntryResult!12499 0))(
  ( (MissingZero!12499 (index!52388 (_ BitVec 32))) (Found!12499 (index!52389 (_ BitVec 32))) (Intermediate!12499 (undefined!13311 Bool) (index!52390 (_ BitVec 32)) (x!134061 (_ BitVec 32))) (Undefined!12499) (MissingVacant!12499 (index!52391 (_ BitVec 32))) )
))
(declare-fun lt!652876 () SeekEntryResult!12499)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652875 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100059 (_ BitVec 32)) SeekEntryResult!12499)

(assert (=> b!1500133 (= lt!652876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652875 vacantBefore!10 (select (arr!48289 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500134 () Bool)

(declare-fun res!1021213 () Bool)

(assert (=> b!1500134 (=> (not res!1021213) (not e!839502))))

(declare-datatypes ((List!34781 0))(
  ( (Nil!34778) (Cons!34777 (h!36174 (_ BitVec 64)) (t!49475 List!34781)) )
))
(declare-fun arrayNoDuplicates!0 (array!100059 (_ BitVec 32) List!34781) Bool)

(assert (=> b!1500134 (= res!1021213 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34778))))

(declare-fun res!1021215 () Bool)

(assert (=> start!127678 (=> (not res!1021215) (not e!839502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127678 (= res!1021215 (validMask!0 mask!2661))))

(assert (=> start!127678 e!839502))

(assert (=> start!127678 true))

(declare-fun array_inv!37317 (array!100059) Bool)

(assert (=> start!127678 (array_inv!37317 a!2850)))

(declare-fun b!1500135 () Bool)

(declare-fun res!1021208 () Bool)

(assert (=> b!1500135 (=> (not res!1021208) (not e!839502))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500135 (= res!1021208 (validKeyInArray!0 (select (arr!48289 a!2850) i!996)))))

(declare-fun b!1500136 () Bool)

(declare-fun res!1021214 () Bool)

(assert (=> b!1500136 (=> (not res!1021214) (not e!839502))))

(assert (=> b!1500136 (= res!1021214 (validKeyInArray!0 (select (arr!48289 a!2850) j!87)))))

(declare-fun b!1500137 () Bool)

(declare-fun res!1021211 () Bool)

(assert (=> b!1500137 (=> (not res!1021211) (not e!839502))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500137 (= res!1021211 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48839 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48839 a!2850)) (= (select (arr!48289 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48289 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48839 a!2850))))))

(declare-fun b!1500138 () Bool)

(declare-fun res!1021209 () Bool)

(assert (=> b!1500138 (=> (not res!1021209) (not e!839502))))

(assert (=> b!1500138 (= res!1021209 (and (= (size!48839 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48839 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48839 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500139 () Bool)

(declare-fun res!1021212 () Bool)

(assert (=> b!1500139 (=> (not res!1021212) (not e!839502))))

(assert (=> b!1500139 (= res!1021212 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48289 a!2850) j!87) a!2850 mask!2661) (Found!12499 j!87)))))

(declare-fun b!1500140 () Bool)

(assert (=> b!1500140 (= e!839502 e!839503)))

(declare-fun res!1021207 () Bool)

(assert (=> b!1500140 (=> (not res!1021207) (not e!839503))))

(assert (=> b!1500140 (= res!1021207 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652875 #b00000000000000000000000000000000) (bvslt lt!652875 (size!48839 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500140 (= lt!652875 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127678 res!1021215) b!1500138))

(assert (= (and b!1500138 res!1021209) b!1500135))

(assert (= (and b!1500135 res!1021208) b!1500136))

(assert (= (and b!1500136 res!1021214) b!1500132))

(assert (= (and b!1500132 res!1021216) b!1500134))

(assert (= (and b!1500134 res!1021213) b!1500137))

(assert (= (and b!1500137 res!1021211) b!1500139))

(assert (= (and b!1500139 res!1021212) b!1500131))

(assert (= (and b!1500131 res!1021210) b!1500140))

(assert (= (and b!1500140 res!1021207) b!1500133))

(declare-fun m!1383325 () Bool)

(assert (=> b!1500131 m!1383325))

(declare-fun m!1383327 () Bool)

(assert (=> b!1500131 m!1383327))

(declare-fun m!1383329 () Bool)

(assert (=> start!127678 m!1383329))

(declare-fun m!1383331 () Bool)

(assert (=> start!127678 m!1383331))

(assert (=> b!1500139 m!1383327))

(assert (=> b!1500139 m!1383327))

(declare-fun m!1383333 () Bool)

(assert (=> b!1500139 m!1383333))

(declare-fun m!1383335 () Bool)

(assert (=> b!1500134 m!1383335))

(declare-fun m!1383337 () Bool)

(assert (=> b!1500132 m!1383337))

(declare-fun m!1383339 () Bool)

(assert (=> b!1500140 m!1383339))

(assert (=> b!1500133 m!1383327))

(assert (=> b!1500133 m!1383327))

(declare-fun m!1383341 () Bool)

(assert (=> b!1500133 m!1383341))

(assert (=> b!1500136 m!1383327))

(assert (=> b!1500136 m!1383327))

(declare-fun m!1383343 () Bool)

(assert (=> b!1500136 m!1383343))

(declare-fun m!1383345 () Bool)

(assert (=> b!1500135 m!1383345))

(assert (=> b!1500135 m!1383345))

(declare-fun m!1383347 () Bool)

(assert (=> b!1500135 m!1383347))

(declare-fun m!1383349 () Bool)

(assert (=> b!1500137 m!1383349))

(declare-fun m!1383351 () Bool)

(assert (=> b!1500137 m!1383351))

(declare-fun m!1383353 () Bool)

(assert (=> b!1500137 m!1383353))

(push 1)

(assert (not b!1500135))

(assert (not b!1500133))

(assert (not start!127678))

(assert (not b!1500140))

(assert (not b!1500134))

(assert (not b!1500139))

(assert (not b!1500132))

(assert (not b!1500136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

