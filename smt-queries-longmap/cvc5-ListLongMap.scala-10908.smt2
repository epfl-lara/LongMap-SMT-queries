; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127710 () Bool)

(assert start!127710)

(declare-fun res!1021691 () Bool)

(declare-fun e!839645 () Bool)

(assert (=> start!127710 (=> (not res!1021691) (not e!839645))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127710 (= res!1021691 (validMask!0 mask!2661))))

(assert (=> start!127710 e!839645))

(assert (=> start!127710 true))

(declare-datatypes ((array!100091 0))(
  ( (array!100092 (arr!48305 (Array (_ BitVec 32) (_ BitVec 64))) (size!48855 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100091)

(declare-fun array_inv!37333 (array!100091) Bool)

(assert (=> start!127710 (array_inv!37333 a!2850)))

(declare-fun b!1500611 () Bool)

(declare-fun e!839647 () Bool)

(assert (=> b!1500611 (= e!839647 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun lt!652971 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12515 0))(
  ( (MissingZero!12515 (index!52452 (_ BitVec 32))) (Found!12515 (index!52453 (_ BitVec 32))) (Intermediate!12515 (undefined!13327 Bool) (index!52454 (_ BitVec 32)) (x!134125 (_ BitVec 32))) (Undefined!12515) (MissingVacant!12515 (index!52455 (_ BitVec 32))) )
))
(declare-fun lt!652972 () SeekEntryResult!12515)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100091 (_ BitVec 32)) SeekEntryResult!12515)

(assert (=> b!1500611 (= lt!652972 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652971 vacantBefore!10 (select (arr!48305 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500612 () Bool)

(declare-fun res!1021695 () Bool)

(assert (=> b!1500612 (=> (not res!1021695) (not e!839645))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500612 (= res!1021695 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48305 a!2850) j!87) a!2850 mask!2661) (Found!12515 j!87)))))

(declare-fun b!1500613 () Bool)

(declare-fun res!1021690 () Bool)

(assert (=> b!1500613 (=> (not res!1021690) (not e!839645))))

(assert (=> b!1500613 (= res!1021690 (not (= (select (arr!48305 a!2850) index!625) (select (arr!48305 a!2850) j!87))))))

(declare-fun b!1500614 () Bool)

(declare-fun res!1021687 () Bool)

(assert (=> b!1500614 (=> (not res!1021687) (not e!839645))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500614 (= res!1021687 (validKeyInArray!0 (select (arr!48305 a!2850) i!996)))))

(declare-fun b!1500615 () Bool)

(assert (=> b!1500615 (= e!839645 e!839647)))

(declare-fun res!1021689 () Bool)

(assert (=> b!1500615 (=> (not res!1021689) (not e!839647))))

(assert (=> b!1500615 (= res!1021689 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652971 #b00000000000000000000000000000000) (bvslt lt!652971 (size!48855 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500615 (= lt!652971 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500616 () Bool)

(declare-fun res!1021692 () Bool)

(assert (=> b!1500616 (=> (not res!1021692) (not e!839645))))

(assert (=> b!1500616 (= res!1021692 (and (= (size!48855 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48855 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48855 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500617 () Bool)

(declare-fun res!1021694 () Bool)

(assert (=> b!1500617 (=> (not res!1021694) (not e!839645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100091 (_ BitVec 32)) Bool)

(assert (=> b!1500617 (= res!1021694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500618 () Bool)

(declare-fun res!1021693 () Bool)

(assert (=> b!1500618 (=> (not res!1021693) (not e!839645))))

(assert (=> b!1500618 (= res!1021693 (validKeyInArray!0 (select (arr!48305 a!2850) j!87)))))

(declare-fun b!1500619 () Bool)

(declare-fun res!1021688 () Bool)

(assert (=> b!1500619 (=> (not res!1021688) (not e!839645))))

(declare-datatypes ((List!34797 0))(
  ( (Nil!34794) (Cons!34793 (h!36190 (_ BitVec 64)) (t!49491 List!34797)) )
))
(declare-fun arrayNoDuplicates!0 (array!100091 (_ BitVec 32) List!34797) Bool)

(assert (=> b!1500619 (= res!1021688 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34794))))

(declare-fun b!1500620 () Bool)

(declare-fun res!1021696 () Bool)

(assert (=> b!1500620 (=> (not res!1021696) (not e!839645))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500620 (= res!1021696 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48855 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48855 a!2850)) (= (select (arr!48305 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48305 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48855 a!2850))))))

(assert (= (and start!127710 res!1021691) b!1500616))

(assert (= (and b!1500616 res!1021692) b!1500614))

(assert (= (and b!1500614 res!1021687) b!1500618))

(assert (= (and b!1500618 res!1021693) b!1500617))

(assert (= (and b!1500617 res!1021694) b!1500619))

(assert (= (and b!1500619 res!1021688) b!1500620))

(assert (= (and b!1500620 res!1021696) b!1500612))

(assert (= (and b!1500612 res!1021695) b!1500613))

(assert (= (and b!1500613 res!1021690) b!1500615))

(assert (= (and b!1500615 res!1021689) b!1500611))

(declare-fun m!1383805 () Bool)

(assert (=> b!1500618 m!1383805))

(assert (=> b!1500618 m!1383805))

(declare-fun m!1383807 () Bool)

(assert (=> b!1500618 m!1383807))

(declare-fun m!1383809 () Bool)

(assert (=> b!1500617 m!1383809))

(declare-fun m!1383811 () Bool)

(assert (=> b!1500614 m!1383811))

(assert (=> b!1500614 m!1383811))

(declare-fun m!1383813 () Bool)

(assert (=> b!1500614 m!1383813))

(assert (=> b!1500612 m!1383805))

(assert (=> b!1500612 m!1383805))

(declare-fun m!1383815 () Bool)

(assert (=> b!1500612 m!1383815))

(declare-fun m!1383817 () Bool)

(assert (=> b!1500613 m!1383817))

(assert (=> b!1500613 m!1383805))

(declare-fun m!1383819 () Bool)

(assert (=> b!1500619 m!1383819))

(assert (=> b!1500611 m!1383805))

(assert (=> b!1500611 m!1383805))

(declare-fun m!1383821 () Bool)

(assert (=> b!1500611 m!1383821))

(declare-fun m!1383823 () Bool)

(assert (=> b!1500615 m!1383823))

(declare-fun m!1383825 () Bool)

(assert (=> start!127710 m!1383825))

(declare-fun m!1383827 () Bool)

(assert (=> start!127710 m!1383827))

(declare-fun m!1383829 () Bool)

(assert (=> b!1500620 m!1383829))

(declare-fun m!1383831 () Bool)

(assert (=> b!1500620 m!1383831))

(declare-fun m!1383833 () Bool)

(assert (=> b!1500620 m!1383833))

(push 1)

