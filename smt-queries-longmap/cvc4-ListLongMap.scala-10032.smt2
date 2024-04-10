; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118300 () Bool)

(assert start!118300)

(declare-fun b!1383612 () Bool)

(declare-fun res!925206 () Bool)

(declare-fun e!784151 () Bool)

(assert (=> b!1383612 (=> (not res!925206) (not e!784151))))

(declare-datatypes ((array!94603 0))(
  ( (array!94604 (arr!45679 (Array (_ BitVec 32) (_ BitVec 64))) (size!46229 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94603)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94603 (_ BitVec 32)) Bool)

(assert (=> b!1383612 (= res!925206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383613 () Bool)

(declare-fun res!925205 () Bool)

(assert (=> b!1383613 (=> (not res!925205) (not e!784151))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383613 (= res!925205 (and (= (size!46229 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46229 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46229 a!2938))))))

(declare-fun res!925204 () Bool)

(assert (=> start!118300 (=> (not res!925204) (not e!784151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118300 (= res!925204 (validMask!0 mask!2987))))

(assert (=> start!118300 e!784151))

(assert (=> start!118300 true))

(declare-fun array_inv!34707 (array!94603) Bool)

(assert (=> start!118300 (array_inv!34707 a!2938)))

(declare-fun b!1383614 () Bool)

(declare-fun res!925210 () Bool)

(assert (=> b!1383614 (=> (not res!925210) (not e!784151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383614 (= res!925210 (validKeyInArray!0 (select (arr!45679 a!2938) startIndex!16)))))

(declare-fun b!1383615 () Bool)

(declare-fun res!925209 () Bool)

(assert (=> b!1383615 (=> (not res!925209) (not e!784151))))

(declare-datatypes ((List!32207 0))(
  ( (Nil!32204) (Cons!32203 (h!33412 (_ BitVec 64)) (t!46901 List!32207)) )
))
(declare-fun arrayNoDuplicates!0 (array!94603 (_ BitVec 32) List!32207) Bool)

(assert (=> b!1383615 (= res!925209 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32204))))

(declare-fun b!1383616 () Bool)

(assert (=> b!1383616 (= e!784151 (not true))))

(declare-datatypes ((SeekEntryResult!10072 0))(
  ( (MissingZero!10072 (index!42659 (_ BitVec 32))) (Found!10072 (index!42660 (_ BitVec 32))) (Intermediate!10072 (undefined!10884 Bool) (index!42661 (_ BitVec 32)) (x!124169 (_ BitVec 32))) (Undefined!10072) (MissingVacant!10072 (index!42662 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94603 (_ BitVec 32)) SeekEntryResult!10072)

(assert (=> b!1383616 (= (seekEntryOrOpen!0 (select (arr!45679 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45679 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94604 (store (arr!45679 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46229 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46081 0))(
  ( (Unit!46082) )
))
(declare-fun lt!608640 () Unit!46081)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46081)

(assert (=> b!1383616 (= lt!608640 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383617 () Bool)

(declare-fun res!925207 () Bool)

(assert (=> b!1383617 (=> (not res!925207) (not e!784151))))

(assert (=> b!1383617 (= res!925207 (and (not (= (select (arr!45679 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45679 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383618 () Bool)

(declare-fun res!925208 () Bool)

(assert (=> b!1383618 (=> (not res!925208) (not e!784151))))

(assert (=> b!1383618 (= res!925208 (validKeyInArray!0 (select (arr!45679 a!2938) i!1065)))))

(assert (= (and start!118300 res!925204) b!1383613))

(assert (= (and b!1383613 res!925205) b!1383618))

(assert (= (and b!1383618 res!925208) b!1383615))

(assert (= (and b!1383615 res!925209) b!1383612))

(assert (= (and b!1383612 res!925206) b!1383617))

(assert (= (and b!1383617 res!925207) b!1383614))

(assert (= (and b!1383614 res!925210) b!1383616))

(declare-fun m!1268749 () Bool)

(assert (=> b!1383616 m!1268749))

(assert (=> b!1383616 m!1268749))

(declare-fun m!1268751 () Bool)

(assert (=> b!1383616 m!1268751))

(declare-fun m!1268753 () Bool)

(assert (=> b!1383616 m!1268753))

(declare-fun m!1268755 () Bool)

(assert (=> b!1383616 m!1268755))

(declare-fun m!1268757 () Bool)

(assert (=> b!1383616 m!1268757))

(assert (=> b!1383616 m!1268757))

(declare-fun m!1268759 () Bool)

(assert (=> b!1383616 m!1268759))

(declare-fun m!1268761 () Bool)

(assert (=> b!1383618 m!1268761))

(assert (=> b!1383618 m!1268761))

(declare-fun m!1268763 () Bool)

(assert (=> b!1383618 m!1268763))

(assert (=> b!1383614 m!1268757))

(assert (=> b!1383614 m!1268757))

(declare-fun m!1268765 () Bool)

(assert (=> b!1383614 m!1268765))

(declare-fun m!1268767 () Bool)

(assert (=> b!1383612 m!1268767))

(assert (=> b!1383617 m!1268761))

(declare-fun m!1268769 () Bool)

(assert (=> start!118300 m!1268769))

(declare-fun m!1268771 () Bool)

(assert (=> start!118300 m!1268771))

(declare-fun m!1268773 () Bool)

(assert (=> b!1383615 m!1268773))

(push 1)

(assert (not b!1383614))

(assert (not b!1383616))

(assert (not b!1383618))

(assert (not b!1383615))

(assert (not b!1383612))

(assert (not start!118300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

