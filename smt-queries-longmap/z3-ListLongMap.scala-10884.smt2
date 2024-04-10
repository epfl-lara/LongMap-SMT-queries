; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127568 () Bool)

(assert start!127568)

(declare-fun b!1498660 () Bool)

(declare-fun res!1019737 () Bool)

(declare-fun e!839083 () Bool)

(assert (=> b!1498660 (=> (not res!1019737) (not e!839083))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99949 0))(
  ( (array!99950 (arr!48234 (Array (_ BitVec 32) (_ BitVec 64))) (size!48784 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99949)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498660 (= res!1019737 (and (= (size!48784 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48784 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48784 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019742 () Bool)

(assert (=> start!127568 (=> (not res!1019742) (not e!839083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127568 (= res!1019742 (validMask!0 mask!2661))))

(assert (=> start!127568 e!839083))

(assert (=> start!127568 true))

(declare-fun array_inv!37262 (array!99949) Bool)

(assert (=> start!127568 (array_inv!37262 a!2850)))

(declare-fun b!1498661 () Bool)

(declare-fun res!1019741 () Bool)

(assert (=> b!1498661 (=> (not res!1019741) (not e!839083))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12444 0))(
  ( (MissingZero!12444 (index!52168 (_ BitVec 32))) (Found!12444 (index!52169 (_ BitVec 32))) (Intermediate!12444 (undefined!13256 Bool) (index!52170 (_ BitVec 32)) (x!133862 (_ BitVec 32))) (Undefined!12444) (MissingVacant!12444 (index!52171 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99949 (_ BitVec 32)) SeekEntryResult!12444)

(assert (=> b!1498661 (= res!1019741 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48234 a!2850) j!87) a!2850 mask!2661) (Found!12444 j!87)))))

(declare-fun b!1498662 () Bool)

(declare-fun res!1019743 () Bool)

(assert (=> b!1498662 (=> (not res!1019743) (not e!839083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99949 (_ BitVec 32)) Bool)

(assert (=> b!1498662 (= res!1019743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498663 () Bool)

(declare-fun res!1019740 () Bool)

(assert (=> b!1498663 (=> (not res!1019740) (not e!839083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498663 (= res!1019740 (validKeyInArray!0 (select (arr!48234 a!2850) j!87)))))

(declare-fun b!1498664 () Bool)

(assert (=> b!1498664 (= e!839083 (and (= (select (arr!48234 a!2850) index!625) (select (arr!48234 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498665 () Bool)

(declare-fun res!1019739 () Bool)

(assert (=> b!1498665 (=> (not res!1019739) (not e!839083))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498665 (= res!1019739 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48784 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48784 a!2850)) (= (select (arr!48234 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48234 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48784 a!2850))))))

(declare-fun b!1498666 () Bool)

(declare-fun res!1019736 () Bool)

(assert (=> b!1498666 (=> (not res!1019736) (not e!839083))))

(assert (=> b!1498666 (= res!1019736 (validKeyInArray!0 (select (arr!48234 a!2850) i!996)))))

(declare-fun b!1498667 () Bool)

(declare-fun res!1019738 () Bool)

(assert (=> b!1498667 (=> (not res!1019738) (not e!839083))))

(declare-datatypes ((List!34726 0))(
  ( (Nil!34723) (Cons!34722 (h!36119 (_ BitVec 64)) (t!49420 List!34726)) )
))
(declare-fun arrayNoDuplicates!0 (array!99949 (_ BitVec 32) List!34726) Bool)

(assert (=> b!1498667 (= res!1019738 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34723))))

(assert (= (and start!127568 res!1019742) b!1498660))

(assert (= (and b!1498660 res!1019737) b!1498666))

(assert (= (and b!1498666 res!1019736) b!1498663))

(assert (= (and b!1498663 res!1019740) b!1498662))

(assert (= (and b!1498662 res!1019743) b!1498667))

(assert (= (and b!1498667 res!1019738) b!1498665))

(assert (= (and b!1498665 res!1019739) b!1498661))

(assert (= (and b!1498661 res!1019741) b!1498664))

(declare-fun m!1381791 () Bool)

(assert (=> b!1498665 m!1381791))

(declare-fun m!1381793 () Bool)

(assert (=> b!1498665 m!1381793))

(declare-fun m!1381795 () Bool)

(assert (=> b!1498665 m!1381795))

(declare-fun m!1381797 () Bool)

(assert (=> b!1498662 m!1381797))

(declare-fun m!1381799 () Bool)

(assert (=> b!1498664 m!1381799))

(declare-fun m!1381801 () Bool)

(assert (=> b!1498664 m!1381801))

(declare-fun m!1381803 () Bool)

(assert (=> b!1498666 m!1381803))

(assert (=> b!1498666 m!1381803))

(declare-fun m!1381805 () Bool)

(assert (=> b!1498666 m!1381805))

(assert (=> b!1498661 m!1381801))

(assert (=> b!1498661 m!1381801))

(declare-fun m!1381807 () Bool)

(assert (=> b!1498661 m!1381807))

(declare-fun m!1381809 () Bool)

(assert (=> b!1498667 m!1381809))

(assert (=> b!1498663 m!1381801))

(assert (=> b!1498663 m!1381801))

(declare-fun m!1381811 () Bool)

(assert (=> b!1498663 m!1381811))

(declare-fun m!1381813 () Bool)

(assert (=> start!127568 m!1381813))

(declare-fun m!1381815 () Bool)

(assert (=> start!127568 m!1381815))

(check-sat (not b!1498662) (not b!1498667) (not start!127568) (not b!1498666) (not b!1498663) (not b!1498661))
(check-sat)
