; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127642 () Bool)

(assert start!127642)

(declare-fun b!1499591 () Bool)

(declare-fun res!1020671 () Bool)

(declare-fun e!839341 () Bool)

(assert (=> b!1499591 (=> (not res!1020671) (not e!839341))))

(declare-datatypes ((array!100023 0))(
  ( (array!100024 (arr!48271 (Array (_ BitVec 32) (_ BitVec 64))) (size!48821 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100023)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499591 (= res!1020671 (validKeyInArray!0 (select (arr!48271 a!2850) i!996)))))

(declare-fun b!1499592 () Bool)

(declare-fun res!1020672 () Bool)

(assert (=> b!1499592 (=> (not res!1020672) (not e!839341))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499592 (= res!1020672 (not (= (select (arr!48271 a!2850) index!625) (select (arr!48271 a!2850) j!87))))))

(declare-fun b!1499593 () Bool)

(declare-fun res!1020674 () Bool)

(assert (=> b!1499593 (=> (not res!1020674) (not e!839341))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12481 0))(
  ( (MissingZero!12481 (index!52316 (_ BitVec 32))) (Found!12481 (index!52317 (_ BitVec 32))) (Intermediate!12481 (undefined!13293 Bool) (index!52318 (_ BitVec 32)) (x!133995 (_ BitVec 32))) (Undefined!12481) (MissingVacant!12481 (index!52319 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100023 (_ BitVec 32)) SeekEntryResult!12481)

(assert (=> b!1499593 (= res!1020674 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48271 a!2850) j!87) a!2850 mask!2661) (Found!12481 j!87)))))

(declare-fun b!1499594 () Bool)

(declare-fun res!1020676 () Bool)

(assert (=> b!1499594 (=> (not res!1020676) (not e!839341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100023 (_ BitVec 32)) Bool)

(assert (=> b!1499594 (= res!1020676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499595 () Bool)

(declare-fun res!1020675 () Bool)

(assert (=> b!1499595 (=> (not res!1020675) (not e!839341))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499595 (= res!1020675 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48821 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48821 a!2850)) (= (select (arr!48271 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48271 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48821 a!2850))))))

(declare-fun b!1499596 () Bool)

(declare-fun e!839339 () Bool)

(assert (=> b!1499596 (= e!839339 false)))

(declare-fun lt!652767 () (_ BitVec 32))

(declare-fun lt!652768 () SeekEntryResult!12481)

(assert (=> b!1499596 (= lt!652768 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652767 vacantBefore!10 (select (arr!48271 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1020673 () Bool)

(assert (=> start!127642 (=> (not res!1020673) (not e!839341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127642 (= res!1020673 (validMask!0 mask!2661))))

(assert (=> start!127642 e!839341))

(assert (=> start!127642 true))

(declare-fun array_inv!37299 (array!100023) Bool)

(assert (=> start!127642 (array_inv!37299 a!2850)))

(declare-fun b!1499597 () Bool)

(declare-fun res!1020670 () Bool)

(assert (=> b!1499597 (=> (not res!1020670) (not e!839341))))

(assert (=> b!1499597 (= res!1020670 (and (= (size!48821 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48821 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48821 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499598 () Bool)

(assert (=> b!1499598 (= e!839341 e!839339)))

(declare-fun res!1020669 () Bool)

(assert (=> b!1499598 (=> (not res!1020669) (not e!839339))))

(assert (=> b!1499598 (= res!1020669 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652767 #b00000000000000000000000000000000) (bvslt lt!652767 (size!48821 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499598 (= lt!652767 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499599 () Bool)

(declare-fun res!1020668 () Bool)

(assert (=> b!1499599 (=> (not res!1020668) (not e!839341))))

(declare-datatypes ((List!34763 0))(
  ( (Nil!34760) (Cons!34759 (h!36156 (_ BitVec 64)) (t!49457 List!34763)) )
))
(declare-fun arrayNoDuplicates!0 (array!100023 (_ BitVec 32) List!34763) Bool)

(assert (=> b!1499599 (= res!1020668 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34760))))

(declare-fun b!1499600 () Bool)

(declare-fun res!1020667 () Bool)

(assert (=> b!1499600 (=> (not res!1020667) (not e!839341))))

(assert (=> b!1499600 (= res!1020667 (validKeyInArray!0 (select (arr!48271 a!2850) j!87)))))

(assert (= (and start!127642 res!1020673) b!1499597))

(assert (= (and b!1499597 res!1020670) b!1499591))

(assert (= (and b!1499591 res!1020671) b!1499600))

(assert (= (and b!1499600 res!1020667) b!1499594))

(assert (= (and b!1499594 res!1020676) b!1499599))

(assert (= (and b!1499599 res!1020668) b!1499595))

(assert (= (and b!1499595 res!1020675) b!1499593))

(assert (= (and b!1499593 res!1020674) b!1499592))

(assert (= (and b!1499592 res!1020672) b!1499598))

(assert (= (and b!1499598 res!1020669) b!1499596))

(declare-fun m!1382785 () Bool)

(assert (=> start!127642 m!1382785))

(declare-fun m!1382787 () Bool)

(assert (=> start!127642 m!1382787))

(declare-fun m!1382789 () Bool)

(assert (=> b!1499600 m!1382789))

(assert (=> b!1499600 m!1382789))

(declare-fun m!1382791 () Bool)

(assert (=> b!1499600 m!1382791))

(declare-fun m!1382793 () Bool)

(assert (=> b!1499598 m!1382793))

(declare-fun m!1382795 () Bool)

(assert (=> b!1499595 m!1382795))

(declare-fun m!1382797 () Bool)

(assert (=> b!1499595 m!1382797))

(declare-fun m!1382799 () Bool)

(assert (=> b!1499595 m!1382799))

(assert (=> b!1499596 m!1382789))

(assert (=> b!1499596 m!1382789))

(declare-fun m!1382801 () Bool)

(assert (=> b!1499596 m!1382801))

(declare-fun m!1382803 () Bool)

(assert (=> b!1499591 m!1382803))

(assert (=> b!1499591 m!1382803))

(declare-fun m!1382805 () Bool)

(assert (=> b!1499591 m!1382805))

(declare-fun m!1382807 () Bool)

(assert (=> b!1499594 m!1382807))

(declare-fun m!1382809 () Bool)

(assert (=> b!1499592 m!1382809))

(assert (=> b!1499592 m!1382789))

(assert (=> b!1499593 m!1382789))

(assert (=> b!1499593 m!1382789))

(declare-fun m!1382811 () Bool)

(assert (=> b!1499593 m!1382811))

(declare-fun m!1382813 () Bool)

(assert (=> b!1499599 m!1382813))

(push 1)

(assert (not b!1499600))

(assert (not b!1499593))

(assert (not b!1499591))

(assert (not b!1499598))

(assert (not b!1499599))

(assert (not b!1499596))

(assert (not b!1499594))

(assert (not start!127642))

(check-sat)

(pop 1)

(push 1)

