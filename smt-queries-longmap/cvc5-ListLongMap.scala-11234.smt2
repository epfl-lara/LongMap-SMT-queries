; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131036 () Bool)

(assert start!131036)

(declare-fun b!1537516 () Bool)

(declare-fun res!1054605 () Bool)

(declare-fun e!855672 () Bool)

(assert (=> b!1537516 (=> (not res!1054605) (not e!855672))))

(declare-datatypes ((array!102134 0))(
  ( (array!102135 (arr!49283 (Array (_ BitVec 32) (_ BitVec 64))) (size!49833 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102134)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537516 (= res!1054605 (validKeyInArray!0 (select (arr!49283 a!2792) j!64)))))

(declare-fun b!1537517 () Bool)

(assert (=> b!1537517 (= e!855672 false)))

(declare-fun lt!664741 () Bool)

(declare-datatypes ((List!35757 0))(
  ( (Nil!35754) (Cons!35753 (h!37198 (_ BitVec 64)) (t!50451 List!35757)) )
))
(declare-fun arrayNoDuplicates!0 (array!102134 (_ BitVec 32) List!35757) Bool)

(assert (=> b!1537517 (= lt!664741 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35754))))

(declare-fun b!1537518 () Bool)

(declare-fun res!1054606 () Bool)

(assert (=> b!1537518 (=> (not res!1054606) (not e!855672))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537518 (= res!1054606 (and (= (size!49833 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49833 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49833 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054602 () Bool)

(assert (=> start!131036 (=> (not res!1054602) (not e!855672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131036 (= res!1054602 (validMask!0 mask!2480))))

(assert (=> start!131036 e!855672))

(assert (=> start!131036 true))

(declare-fun array_inv!38311 (array!102134) Bool)

(assert (=> start!131036 (array_inv!38311 a!2792)))

(declare-fun b!1537519 () Bool)

(declare-fun res!1054604 () Bool)

(assert (=> b!1537519 (=> (not res!1054604) (not e!855672))))

(assert (=> b!1537519 (= res!1054604 (validKeyInArray!0 (select (arr!49283 a!2792) i!951)))))

(declare-fun b!1537520 () Bool)

(declare-fun res!1054603 () Bool)

(assert (=> b!1537520 (=> (not res!1054603) (not e!855672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102134 (_ BitVec 32)) Bool)

(assert (=> b!1537520 (= res!1054603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131036 res!1054602) b!1537518))

(assert (= (and b!1537518 res!1054606) b!1537519))

(assert (= (and b!1537519 res!1054604) b!1537516))

(assert (= (and b!1537516 res!1054605) b!1537520))

(assert (= (and b!1537520 res!1054603) b!1537517))

(declare-fun m!1420035 () Bool)

(assert (=> b!1537519 m!1420035))

(assert (=> b!1537519 m!1420035))

(declare-fun m!1420037 () Bool)

(assert (=> b!1537519 m!1420037))

(declare-fun m!1420039 () Bool)

(assert (=> b!1537517 m!1420039))

(declare-fun m!1420041 () Bool)

(assert (=> start!131036 m!1420041))

(declare-fun m!1420043 () Bool)

(assert (=> start!131036 m!1420043))

(declare-fun m!1420045 () Bool)

(assert (=> b!1537520 m!1420045))

(declare-fun m!1420047 () Bool)

(assert (=> b!1537516 m!1420047))

(assert (=> b!1537516 m!1420047))

(declare-fun m!1420049 () Bool)

(assert (=> b!1537516 m!1420049))

(push 1)

(assert (not b!1537517))

(assert (not b!1537520))

(assert (not b!1537516))

(assert (not start!131036))

(assert (not b!1537519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

