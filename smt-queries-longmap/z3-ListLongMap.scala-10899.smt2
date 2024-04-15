; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127610 () Bool)

(assert start!127610)

(declare-fun b!1499485 () Bool)

(declare-fun res!1020750 () Bool)

(declare-fun e!839205 () Bool)

(assert (=> b!1499485 (=> (not res!1020750) (not e!839205))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!99985 0))(
  ( (array!99986 (arr!48253 (Array (_ BitVec 32) (_ BitVec 64))) (size!48805 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99985)

(declare-datatypes ((SeekEntryResult!12484 0))(
  ( (MissingZero!12484 (index!52328 (_ BitVec 32))) (Found!12484 (index!52329 (_ BitVec 32))) (Intermediate!12484 (undefined!13296 Bool) (index!52330 (_ BitVec 32)) (x!134017 (_ BitVec 32))) (Undefined!12484) (MissingVacant!12484 (index!52331 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99985 (_ BitVec 32)) SeekEntryResult!12484)

(assert (=> b!1499485 (= res!1020750 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48253 a!2850) j!87) a!2850 mask!2661) (Found!12484 j!87)))))

(declare-fun b!1499486 () Bool)

(declare-fun res!1020752 () Bool)

(assert (=> b!1499486 (=> (not res!1020752) (not e!839205))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499486 (= res!1020752 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48805 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48805 a!2850)) (= (select (arr!48253 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48253 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48805 a!2850))))))

(declare-fun b!1499487 () Bool)

(declare-fun res!1020751 () Bool)

(assert (=> b!1499487 (=> (not res!1020751) (not e!839205))))

(assert (=> b!1499487 (= res!1020751 (and (= (size!48805 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48805 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48805 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499488 () Bool)

(declare-fun res!1020754 () Bool)

(assert (=> b!1499488 (=> (not res!1020754) (not e!839205))))

(declare-datatypes ((List!34823 0))(
  ( (Nil!34820) (Cons!34819 (h!36217 (_ BitVec 64)) (t!49509 List!34823)) )
))
(declare-fun arrayNoDuplicates!0 (array!99985 (_ BitVec 32) List!34823) Bool)

(assert (=> b!1499488 (= res!1020754 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34820))))

(declare-fun b!1499489 () Bool)

(declare-fun e!839203 () Bool)

(assert (=> b!1499489 (= e!839205 e!839203)))

(declare-fun res!1020756 () Bool)

(assert (=> b!1499489 (=> (not res!1020756) (not e!839203))))

(declare-fun lt!652530 () (_ BitVec 32))

(assert (=> b!1499489 (= res!1020756 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652530 #b00000000000000000000000000000000) (bvslt lt!652530 (size!48805 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499489 (= lt!652530 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1020753 () Bool)

(assert (=> start!127610 (=> (not res!1020753) (not e!839205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127610 (= res!1020753 (validMask!0 mask!2661))))

(assert (=> start!127610 e!839205))

(assert (=> start!127610 true))

(declare-fun array_inv!37486 (array!99985) Bool)

(assert (=> start!127610 (array_inv!37486 a!2850)))

(declare-fun b!1499490 () Bool)

(declare-fun res!1020749 () Bool)

(assert (=> b!1499490 (=> (not res!1020749) (not e!839205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499490 (= res!1020749 (validKeyInArray!0 (select (arr!48253 a!2850) i!996)))))

(declare-fun b!1499491 () Bool)

(declare-fun res!1020757 () Bool)

(assert (=> b!1499491 (=> (not res!1020757) (not e!839205))))

(assert (=> b!1499491 (= res!1020757 (validKeyInArray!0 (select (arr!48253 a!2850) j!87)))))

(declare-fun b!1499492 () Bool)

(declare-fun res!1020758 () Bool)

(assert (=> b!1499492 (=> (not res!1020758) (not e!839205))))

(assert (=> b!1499492 (= res!1020758 (not (= (select (arr!48253 a!2850) index!625) (select (arr!48253 a!2850) j!87))))))

(declare-fun b!1499493 () Bool)

(assert (=> b!1499493 (= e!839203 false)))

(declare-fun lt!652531 () SeekEntryResult!12484)

(assert (=> b!1499493 (= lt!652531 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652530 vacantBefore!10 (select (arr!48253 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499494 () Bool)

(declare-fun res!1020755 () Bool)

(assert (=> b!1499494 (=> (not res!1020755) (not e!839205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99985 (_ BitVec 32)) Bool)

(assert (=> b!1499494 (= res!1020755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127610 res!1020753) b!1499487))

(assert (= (and b!1499487 res!1020751) b!1499490))

(assert (= (and b!1499490 res!1020749) b!1499491))

(assert (= (and b!1499491 res!1020757) b!1499494))

(assert (= (and b!1499494 res!1020755) b!1499488))

(assert (= (and b!1499488 res!1020754) b!1499486))

(assert (= (and b!1499486 res!1020752) b!1499485))

(assert (= (and b!1499485 res!1020750) b!1499492))

(assert (= (and b!1499492 res!1020758) b!1499489))

(assert (= (and b!1499489 res!1020756) b!1499493))

(declare-fun m!1382125 () Bool)

(assert (=> b!1499488 m!1382125))

(declare-fun m!1382127 () Bool)

(assert (=> b!1499489 m!1382127))

(declare-fun m!1382129 () Bool)

(assert (=> b!1499493 m!1382129))

(assert (=> b!1499493 m!1382129))

(declare-fun m!1382131 () Bool)

(assert (=> b!1499493 m!1382131))

(declare-fun m!1382133 () Bool)

(assert (=> start!127610 m!1382133))

(declare-fun m!1382135 () Bool)

(assert (=> start!127610 m!1382135))

(assert (=> b!1499485 m!1382129))

(assert (=> b!1499485 m!1382129))

(declare-fun m!1382137 () Bool)

(assert (=> b!1499485 m!1382137))

(declare-fun m!1382139 () Bool)

(assert (=> b!1499486 m!1382139))

(declare-fun m!1382141 () Bool)

(assert (=> b!1499486 m!1382141))

(declare-fun m!1382143 () Bool)

(assert (=> b!1499486 m!1382143))

(declare-fun m!1382145 () Bool)

(assert (=> b!1499490 m!1382145))

(assert (=> b!1499490 m!1382145))

(declare-fun m!1382147 () Bool)

(assert (=> b!1499490 m!1382147))

(assert (=> b!1499491 m!1382129))

(assert (=> b!1499491 m!1382129))

(declare-fun m!1382149 () Bool)

(assert (=> b!1499491 m!1382149))

(declare-fun m!1382151 () Bool)

(assert (=> b!1499494 m!1382151))

(declare-fun m!1382153 () Bool)

(assert (=> b!1499492 m!1382153))

(assert (=> b!1499492 m!1382129))

(check-sat (not b!1499493) (not start!127610) (not b!1499491) (not b!1499490) (not b!1499485) (not b!1499488) (not b!1499494) (not b!1499489))
(check-sat)
