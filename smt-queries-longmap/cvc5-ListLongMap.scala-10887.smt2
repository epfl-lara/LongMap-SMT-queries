; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127856 () Bool)

(assert start!127856)

(declare-fun b!1500589 () Bool)

(declare-fun res!1020571 () Bool)

(declare-fun e!840201 () Bool)

(assert (=> b!1500589 (=> (not res!1020571) (not e!840201))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100082 0))(
  ( (array!100083 (arr!48297 (Array (_ BitVec 32) (_ BitVec 64))) (size!48848 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100082)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500589 (= res!1020571 (and (= (size!48848 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48848 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48848 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500590 () Bool)

(declare-fun res!1020567 () Bool)

(assert (=> b!1500590 (=> (not res!1020567) (not e!840201))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500590 (= res!1020567 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48848 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48848 a!2850)) (= (select (arr!48297 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48297 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48848 a!2850))))))

(declare-fun b!1500592 () Bool)

(assert (=> b!1500592 (= e!840201 false)))

(declare-datatypes ((SeekEntryResult!12400 0))(
  ( (MissingZero!12400 (index!51992 (_ BitVec 32))) (Found!12400 (index!51993 (_ BitVec 32))) (Intermediate!12400 (undefined!13212 Bool) (index!51994 (_ BitVec 32)) (x!133876 (_ BitVec 32))) (Undefined!12400) (MissingVacant!12400 (index!51995 (_ BitVec 32))) )
))
(declare-fun lt!653316 () SeekEntryResult!12400)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100082 (_ BitVec 32)) SeekEntryResult!12400)

(assert (=> b!1500592 (= lt!653316 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48297 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500593 () Bool)

(declare-fun res!1020566 () Bool)

(assert (=> b!1500593 (=> (not res!1020566) (not e!840201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500593 (= res!1020566 (validKeyInArray!0 (select (arr!48297 a!2850) j!87)))))

(declare-fun b!1500594 () Bool)

(declare-fun res!1020572 () Bool)

(assert (=> b!1500594 (=> (not res!1020572) (not e!840201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100082 (_ BitVec 32)) Bool)

(assert (=> b!1500594 (= res!1020572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500595 () Bool)

(declare-fun res!1020569 () Bool)

(assert (=> b!1500595 (=> (not res!1020569) (not e!840201))))

(declare-datatypes ((List!34776 0))(
  ( (Nil!34773) (Cons!34772 (h!36184 (_ BitVec 64)) (t!49462 List!34776)) )
))
(declare-fun arrayNoDuplicates!0 (array!100082 (_ BitVec 32) List!34776) Bool)

(assert (=> b!1500595 (= res!1020569 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34773))))

(declare-fun res!1020568 () Bool)

(assert (=> start!127856 (=> (not res!1020568) (not e!840201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127856 (= res!1020568 (validMask!0 mask!2661))))

(assert (=> start!127856 e!840201))

(assert (=> start!127856 true))

(declare-fun array_inv!37578 (array!100082) Bool)

(assert (=> start!127856 (array_inv!37578 a!2850)))

(declare-fun b!1500591 () Bool)

(declare-fun res!1020570 () Bool)

(assert (=> b!1500591 (=> (not res!1020570) (not e!840201))))

(assert (=> b!1500591 (= res!1020570 (validKeyInArray!0 (select (arr!48297 a!2850) i!996)))))

(assert (= (and start!127856 res!1020568) b!1500589))

(assert (= (and b!1500589 res!1020571) b!1500591))

(assert (= (and b!1500591 res!1020570) b!1500593))

(assert (= (and b!1500593 res!1020566) b!1500594))

(assert (= (and b!1500594 res!1020572) b!1500595))

(assert (= (and b!1500595 res!1020569) b!1500590))

(assert (= (and b!1500590 res!1020567) b!1500592))

(declare-fun m!1383767 () Bool)

(assert (=> b!1500590 m!1383767))

(declare-fun m!1383769 () Bool)

(assert (=> b!1500590 m!1383769))

(declare-fun m!1383771 () Bool)

(assert (=> b!1500590 m!1383771))

(declare-fun m!1383773 () Bool)

(assert (=> b!1500591 m!1383773))

(assert (=> b!1500591 m!1383773))

(declare-fun m!1383775 () Bool)

(assert (=> b!1500591 m!1383775))

(declare-fun m!1383777 () Bool)

(assert (=> b!1500592 m!1383777))

(assert (=> b!1500592 m!1383777))

(declare-fun m!1383779 () Bool)

(assert (=> b!1500592 m!1383779))

(declare-fun m!1383781 () Bool)

(assert (=> b!1500595 m!1383781))

(declare-fun m!1383783 () Bool)

(assert (=> start!127856 m!1383783))

(declare-fun m!1383785 () Bool)

(assert (=> start!127856 m!1383785))

(declare-fun m!1383787 () Bool)

(assert (=> b!1500594 m!1383787))

(assert (=> b!1500593 m!1383777))

(assert (=> b!1500593 m!1383777))

(declare-fun m!1383789 () Bool)

(assert (=> b!1500593 m!1383789))

(push 1)

(assert (not b!1500594))

(assert (not b!1500593))

(assert (not b!1500591))

(assert (not start!127856))

(assert (not b!1500592))

(assert (not b!1500595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

