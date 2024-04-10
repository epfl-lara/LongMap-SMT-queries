; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127638 () Bool)

(assert start!127638)

(declare-fun b!1499531 () Bool)

(declare-fun res!1020612 () Bool)

(declare-fun e!839322 () Bool)

(assert (=> b!1499531 (=> (not res!1020612) (not e!839322))))

(declare-datatypes ((array!100019 0))(
  ( (array!100020 (arr!48269 (Array (_ BitVec 32) (_ BitVec 64))) (size!48819 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100019)

(declare-datatypes ((List!34761 0))(
  ( (Nil!34758) (Cons!34757 (h!36154 (_ BitVec 64)) (t!49455 List!34761)) )
))
(declare-fun arrayNoDuplicates!0 (array!100019 (_ BitVec 32) List!34761) Bool)

(assert (=> b!1499531 (= res!1020612 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34758))))

(declare-fun b!1499532 () Bool)

(declare-fun e!839323 () Bool)

(assert (=> b!1499532 (= e!839322 e!839323)))

(declare-fun res!1020607 () Bool)

(assert (=> b!1499532 (=> (not res!1020607) (not e!839323))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652756 () (_ BitVec 32))

(assert (=> b!1499532 (= res!1020607 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652756 #b00000000000000000000000000000000) (bvslt lt!652756 (size!48819 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499532 (= lt!652756 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499533 () Bool)

(declare-fun res!1020614 () Bool)

(assert (=> b!1499533 (=> (not res!1020614) (not e!839322))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499533 (= res!1020614 (and (= (size!48819 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48819 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48819 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499534 () Bool)

(declare-fun res!1020611 () Bool)

(assert (=> b!1499534 (=> (not res!1020611) (not e!839322))))

(assert (=> b!1499534 (= res!1020611 (not (= (select (arr!48269 a!2850) index!625) (select (arr!48269 a!2850) j!87))))))

(declare-fun b!1499535 () Bool)

(declare-fun res!1020609 () Bool)

(assert (=> b!1499535 (=> (not res!1020609) (not e!839322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499535 (= res!1020609 (validKeyInArray!0 (select (arr!48269 a!2850) j!87)))))

(declare-fun b!1499536 () Bool)

(declare-fun res!1020613 () Bool)

(assert (=> b!1499536 (=> (not res!1020613) (not e!839322))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12479 0))(
  ( (MissingZero!12479 (index!52308 (_ BitVec 32))) (Found!12479 (index!52309 (_ BitVec 32))) (Intermediate!12479 (undefined!13291 Bool) (index!52310 (_ BitVec 32)) (x!133993 (_ BitVec 32))) (Undefined!12479) (MissingVacant!12479 (index!52311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100019 (_ BitVec 32)) SeekEntryResult!12479)

(assert (=> b!1499536 (= res!1020613 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48269 a!2850) j!87) a!2850 mask!2661) (Found!12479 j!87)))))

(declare-fun b!1499537 () Bool)

(declare-fun res!1020608 () Bool)

(assert (=> b!1499537 (=> (not res!1020608) (not e!839322))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499537 (= res!1020608 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48819 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48819 a!2850)) (= (select (arr!48269 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48269 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48819 a!2850))))))

(declare-fun b!1499538 () Bool)

(declare-fun res!1020610 () Bool)

(assert (=> b!1499538 (=> (not res!1020610) (not e!839322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100019 (_ BitVec 32)) Bool)

(assert (=> b!1499538 (= res!1020610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499539 () Bool)

(declare-fun res!1020616 () Bool)

(assert (=> b!1499539 (=> (not res!1020616) (not e!839322))))

(assert (=> b!1499539 (= res!1020616 (validKeyInArray!0 (select (arr!48269 a!2850) i!996)))))

(declare-fun res!1020615 () Bool)

(assert (=> start!127638 (=> (not res!1020615) (not e!839322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127638 (= res!1020615 (validMask!0 mask!2661))))

(assert (=> start!127638 e!839322))

(assert (=> start!127638 true))

(declare-fun array_inv!37297 (array!100019) Bool)

(assert (=> start!127638 (array_inv!37297 a!2850)))

(declare-fun b!1499540 () Bool)

(assert (=> b!1499540 (= e!839323 false)))

(declare-fun lt!652755 () SeekEntryResult!12479)

(assert (=> b!1499540 (= lt!652755 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652756 vacantBefore!10 (select (arr!48269 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127638 res!1020615) b!1499533))

(assert (= (and b!1499533 res!1020614) b!1499539))

(assert (= (and b!1499539 res!1020616) b!1499535))

(assert (= (and b!1499535 res!1020609) b!1499538))

(assert (= (and b!1499538 res!1020610) b!1499531))

(assert (= (and b!1499531 res!1020612) b!1499537))

(assert (= (and b!1499537 res!1020608) b!1499536))

(assert (= (and b!1499536 res!1020613) b!1499534))

(assert (= (and b!1499534 res!1020611) b!1499532))

(assert (= (and b!1499532 res!1020607) b!1499540))

(declare-fun m!1382725 () Bool)

(assert (=> b!1499536 m!1382725))

(assert (=> b!1499536 m!1382725))

(declare-fun m!1382727 () Bool)

(assert (=> b!1499536 m!1382727))

(declare-fun m!1382729 () Bool)

(assert (=> b!1499539 m!1382729))

(assert (=> b!1499539 m!1382729))

(declare-fun m!1382731 () Bool)

(assert (=> b!1499539 m!1382731))

(declare-fun m!1382733 () Bool)

(assert (=> b!1499538 m!1382733))

(assert (=> b!1499540 m!1382725))

(assert (=> b!1499540 m!1382725))

(declare-fun m!1382735 () Bool)

(assert (=> b!1499540 m!1382735))

(assert (=> b!1499535 m!1382725))

(assert (=> b!1499535 m!1382725))

(declare-fun m!1382737 () Bool)

(assert (=> b!1499535 m!1382737))

(declare-fun m!1382739 () Bool)

(assert (=> b!1499532 m!1382739))

(declare-fun m!1382741 () Bool)

(assert (=> b!1499534 m!1382741))

(assert (=> b!1499534 m!1382725))

(declare-fun m!1382743 () Bool)

(assert (=> start!127638 m!1382743))

(declare-fun m!1382745 () Bool)

(assert (=> start!127638 m!1382745))

(declare-fun m!1382747 () Bool)

(assert (=> b!1499537 m!1382747))

(declare-fun m!1382749 () Bool)

(assert (=> b!1499537 m!1382749))

(declare-fun m!1382751 () Bool)

(assert (=> b!1499537 m!1382751))

(declare-fun m!1382753 () Bool)

(assert (=> b!1499531 m!1382753))

(push 1)

