; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127748 () Bool)

(assert start!127748)

(declare-fun b!1501204 () Bool)

(declare-fun res!1022290 () Bool)

(declare-fun e!839841 () Bool)

(assert (=> b!1501204 (=> (not res!1022290) (not e!839841))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12534 0))(
  ( (MissingZero!12534 (index!52528 (_ BitVec 32))) (Found!12534 (index!52529 (_ BitVec 32))) (Intermediate!12534 (undefined!13346 Bool) (index!52530 (_ BitVec 32)) (x!134192 (_ BitVec 32))) (Undefined!12534) (MissingVacant!12534 (index!52531 (_ BitVec 32))) )
))
(declare-fun lt!653109 () SeekEntryResult!12534)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!100129 0))(
  ( (array!100130 (arr!48324 (Array (_ BitVec 32) (_ BitVec 64))) (size!48874 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100129 (_ BitVec 32)) SeekEntryResult!12534)

(assert (=> b!1501204 (= res!1022290 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653108 vacantBefore!10 (select (arr!48324 a!2850) j!87) a!2850 mask!2661) lt!653109))))

(declare-fun b!1501205 () Bool)

(declare-fun e!839842 () Bool)

(declare-fun e!839839 () Bool)

(assert (=> b!1501205 (= e!839842 e!839839)))

(declare-fun res!1022283 () Bool)

(assert (=> b!1501205 (=> (not res!1022283) (not e!839839))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501205 (= res!1022283 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48324 a!2850) j!87) a!2850 mask!2661) lt!653109))))

(assert (=> b!1501205 (= lt!653109 (Found!12534 j!87))))

(declare-fun b!1501206 () Bool)

(declare-fun res!1022286 () Bool)

(assert (=> b!1501206 (=> (not res!1022286) (not e!839842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501206 (= res!1022286 (validKeyInArray!0 (select (arr!48324 a!2850) j!87)))))

(declare-fun b!1501207 () Bool)

(assert (=> b!1501207 (= e!839839 e!839841)))

(declare-fun res!1022287 () Bool)

(assert (=> b!1501207 (=> (not res!1022287) (not e!839841))))

(assert (=> b!1501207 (= res!1022287 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653108 #b00000000000000000000000000000000) (bvslt lt!653108 (size!48874 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501207 (= lt!653108 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1022284 () Bool)

(assert (=> start!127748 (=> (not res!1022284) (not e!839842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127748 (= res!1022284 (validMask!0 mask!2661))))

(assert (=> start!127748 e!839842))

(assert (=> start!127748 true))

(declare-fun array_inv!37352 (array!100129) Bool)

(assert (=> start!127748 (array_inv!37352 a!2850)))

(declare-fun b!1501208 () Bool)

(declare-fun res!1022285 () Bool)

(assert (=> b!1501208 (=> (not res!1022285) (not e!839842))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501208 (= res!1022285 (validKeyInArray!0 (select (arr!48324 a!2850) i!996)))))

(declare-fun b!1501209 () Bool)

(declare-fun res!1022288 () Bool)

(assert (=> b!1501209 (=> (not res!1022288) (not e!839839))))

(assert (=> b!1501209 (= res!1022288 (not (= (select (arr!48324 a!2850) index!625) (select (arr!48324 a!2850) j!87))))))

(declare-fun b!1501210 () Bool)

(declare-fun res!1022281 () Bool)

(assert (=> b!1501210 (=> (not res!1022281) (not e!839842))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501210 (= res!1022281 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48874 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48874 a!2850)) (= (select (arr!48324 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48324 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48874 a!2850))))))

(declare-fun b!1501211 () Bool)

(declare-fun res!1022289 () Bool)

(assert (=> b!1501211 (=> (not res!1022289) (not e!839842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100129 (_ BitVec 32)) Bool)

(assert (=> b!1501211 (= res!1022289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501212 () Bool)

(declare-fun res!1022282 () Bool)

(assert (=> b!1501212 (=> (not res!1022282) (not e!839842))))

(declare-datatypes ((List!34816 0))(
  ( (Nil!34813) (Cons!34812 (h!36209 (_ BitVec 64)) (t!49510 List!34816)) )
))
(declare-fun arrayNoDuplicates!0 (array!100129 (_ BitVec 32) List!34816) Bool)

(assert (=> b!1501212 (= res!1022282 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34813))))

(declare-fun b!1501213 () Bool)

(assert (=> b!1501213 (= e!839841 (not true))))

(assert (=> b!1501213 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653108 vacantAfter!10 (select (store (arr!48324 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100130 (store (arr!48324 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48874 a!2850)) mask!2661) lt!653109)))

(declare-datatypes ((Unit!50222 0))(
  ( (Unit!50223) )
))
(declare-fun lt!653110 () Unit!50222)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50222)

(assert (=> b!1501213 (= lt!653110 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653108 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501214 () Bool)

(declare-fun res!1022280 () Bool)

(assert (=> b!1501214 (=> (not res!1022280) (not e!839842))))

(assert (=> b!1501214 (= res!1022280 (and (= (size!48874 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48874 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48874 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127748 res!1022284) b!1501214))

(assert (= (and b!1501214 res!1022280) b!1501208))

(assert (= (and b!1501208 res!1022285) b!1501206))

(assert (= (and b!1501206 res!1022286) b!1501211))

(assert (= (and b!1501211 res!1022289) b!1501212))

(assert (= (and b!1501212 res!1022282) b!1501210))

(assert (= (and b!1501210 res!1022281) b!1501205))

(assert (= (and b!1501205 res!1022283) b!1501209))

(assert (= (and b!1501209 res!1022288) b!1501207))

(assert (= (and b!1501207 res!1022287) b!1501204))

(assert (= (and b!1501204 res!1022290) b!1501213))

(declare-fun m!1384417 () Bool)

(assert (=> b!1501206 m!1384417))

(assert (=> b!1501206 m!1384417))

(declare-fun m!1384419 () Bool)

(assert (=> b!1501206 m!1384419))

(declare-fun m!1384421 () Bool)

(assert (=> start!127748 m!1384421))

(declare-fun m!1384423 () Bool)

(assert (=> start!127748 m!1384423))

(assert (=> b!1501204 m!1384417))

(assert (=> b!1501204 m!1384417))

(declare-fun m!1384425 () Bool)

(assert (=> b!1501204 m!1384425))

(declare-fun m!1384427 () Bool)

(assert (=> b!1501210 m!1384427))

(declare-fun m!1384429 () Bool)

(assert (=> b!1501210 m!1384429))

(declare-fun m!1384431 () Bool)

(assert (=> b!1501210 m!1384431))

(declare-fun m!1384433 () Bool)

(assert (=> b!1501212 m!1384433))

(declare-fun m!1384435 () Bool)

(assert (=> b!1501209 m!1384435))

(assert (=> b!1501209 m!1384417))

(assert (=> b!1501213 m!1384429))

(declare-fun m!1384437 () Bool)

(assert (=> b!1501213 m!1384437))

(assert (=> b!1501213 m!1384437))

(declare-fun m!1384439 () Bool)

(assert (=> b!1501213 m!1384439))

(declare-fun m!1384441 () Bool)

(assert (=> b!1501213 m!1384441))

(assert (=> b!1501205 m!1384417))

(assert (=> b!1501205 m!1384417))

(declare-fun m!1384443 () Bool)

(assert (=> b!1501205 m!1384443))

(declare-fun m!1384445 () Bool)

(assert (=> b!1501207 m!1384445))

(declare-fun m!1384447 () Bool)

(assert (=> b!1501211 m!1384447))

(declare-fun m!1384449 () Bool)

(assert (=> b!1501208 m!1384449))

(assert (=> b!1501208 m!1384449))

(declare-fun m!1384451 () Bool)

(assert (=> b!1501208 m!1384451))

(check-sat (not b!1501204) (not b!1501206) (not b!1501208) (not b!1501207) (not b!1501213) (not b!1501212) (not b!1501205) (not b!1501211) (not start!127748))
(check-sat)
