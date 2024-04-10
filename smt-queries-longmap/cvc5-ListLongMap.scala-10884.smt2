; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127566 () Bool)

(assert start!127566)

(declare-fun b!1498636 () Bool)

(declare-fun res!1019719 () Bool)

(declare-fun e!839077 () Bool)

(assert (=> b!1498636 (=> (not res!1019719) (not e!839077))))

(declare-datatypes ((array!99947 0))(
  ( (array!99948 (arr!48233 (Array (_ BitVec 32) (_ BitVec 64))) (size!48783 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99947)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99947 (_ BitVec 32)) Bool)

(assert (=> b!1498636 (= res!1019719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498637 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1498637 (= e!839077 (and (= (select (arr!48233 a!2850) index!625) (select (arr!48233 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498638 () Bool)

(declare-fun res!1019715 () Bool)

(assert (=> b!1498638 (=> (not res!1019715) (not e!839077))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498638 (= res!1019715 (and (= (size!48783 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48783 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48783 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019713 () Bool)

(assert (=> start!127566 (=> (not res!1019713) (not e!839077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127566 (= res!1019713 (validMask!0 mask!2661))))

(assert (=> start!127566 e!839077))

(assert (=> start!127566 true))

(declare-fun array_inv!37261 (array!99947) Bool)

(assert (=> start!127566 (array_inv!37261 a!2850)))

(declare-fun b!1498639 () Bool)

(declare-fun res!1019718 () Bool)

(assert (=> b!1498639 (=> (not res!1019718) (not e!839077))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12443 0))(
  ( (MissingZero!12443 (index!52164 (_ BitVec 32))) (Found!12443 (index!52165 (_ BitVec 32))) (Intermediate!12443 (undefined!13255 Bool) (index!52166 (_ BitVec 32)) (x!133861 (_ BitVec 32))) (Undefined!12443) (MissingVacant!12443 (index!52167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99947 (_ BitVec 32)) SeekEntryResult!12443)

(assert (=> b!1498639 (= res!1019718 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48233 a!2850) j!87) a!2850 mask!2661) (Found!12443 j!87)))))

(declare-fun b!1498640 () Bool)

(declare-fun res!1019714 () Bool)

(assert (=> b!1498640 (=> (not res!1019714) (not e!839077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498640 (= res!1019714 (validKeyInArray!0 (select (arr!48233 a!2850) i!996)))))

(declare-fun b!1498641 () Bool)

(declare-fun res!1019717 () Bool)

(assert (=> b!1498641 (=> (not res!1019717) (not e!839077))))

(declare-datatypes ((List!34725 0))(
  ( (Nil!34722) (Cons!34721 (h!36118 (_ BitVec 64)) (t!49419 List!34725)) )
))
(declare-fun arrayNoDuplicates!0 (array!99947 (_ BitVec 32) List!34725) Bool)

(assert (=> b!1498641 (= res!1019717 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34722))))

(declare-fun b!1498642 () Bool)

(declare-fun res!1019712 () Bool)

(assert (=> b!1498642 (=> (not res!1019712) (not e!839077))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498642 (= res!1019712 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48783 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48783 a!2850)) (= (select (arr!48233 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48233 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48783 a!2850))))))

(declare-fun b!1498643 () Bool)

(declare-fun res!1019716 () Bool)

(assert (=> b!1498643 (=> (not res!1019716) (not e!839077))))

(assert (=> b!1498643 (= res!1019716 (validKeyInArray!0 (select (arr!48233 a!2850) j!87)))))

(assert (= (and start!127566 res!1019713) b!1498638))

(assert (= (and b!1498638 res!1019715) b!1498640))

(assert (= (and b!1498640 res!1019714) b!1498643))

(assert (= (and b!1498643 res!1019716) b!1498636))

(assert (= (and b!1498636 res!1019719) b!1498641))

(assert (= (and b!1498641 res!1019717) b!1498642))

(assert (= (and b!1498642 res!1019712) b!1498639))

(assert (= (and b!1498639 res!1019718) b!1498637))

(declare-fun m!1381765 () Bool)

(assert (=> b!1498641 m!1381765))

(declare-fun m!1381767 () Bool)

(assert (=> b!1498639 m!1381767))

(assert (=> b!1498639 m!1381767))

(declare-fun m!1381769 () Bool)

(assert (=> b!1498639 m!1381769))

(declare-fun m!1381771 () Bool)

(assert (=> b!1498637 m!1381771))

(assert (=> b!1498637 m!1381767))

(declare-fun m!1381773 () Bool)

(assert (=> start!127566 m!1381773))

(declare-fun m!1381775 () Bool)

(assert (=> start!127566 m!1381775))

(assert (=> b!1498643 m!1381767))

(assert (=> b!1498643 m!1381767))

(declare-fun m!1381777 () Bool)

(assert (=> b!1498643 m!1381777))

(declare-fun m!1381779 () Bool)

(assert (=> b!1498640 m!1381779))

(assert (=> b!1498640 m!1381779))

(declare-fun m!1381781 () Bool)

(assert (=> b!1498640 m!1381781))

(declare-fun m!1381783 () Bool)

(assert (=> b!1498636 m!1381783))

(declare-fun m!1381785 () Bool)

(assert (=> b!1498642 m!1381785))

(declare-fun m!1381787 () Bool)

(assert (=> b!1498642 m!1381787))

(declare-fun m!1381789 () Bool)

(assert (=> b!1498642 m!1381789))

(push 1)

(assert (not b!1498636))

(assert (not b!1498639))

(assert (not b!1498641))

(assert (not b!1498643))

(assert (not start!127566))

(assert (not b!1498640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

