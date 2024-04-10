; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127560 () Bool)

(assert start!127560)

(declare-fun b!1498571 () Bool)

(declare-fun res!1019653 () Bool)

(declare-fun e!839059 () Bool)

(assert (=> b!1498571 (=> (not res!1019653) (not e!839059))))

(declare-datatypes ((array!99941 0))(
  ( (array!99942 (arr!48230 (Array (_ BitVec 32) (_ BitVec 64))) (size!48780 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99941)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498571 (= res!1019653 (validKeyInArray!0 (select (arr!48230 a!2850) j!87)))))

(declare-fun b!1498572 () Bool)

(declare-fun res!1019648 () Bool)

(assert (=> b!1498572 (=> (not res!1019648) (not e!839059))))

(declare-datatypes ((List!34722 0))(
  ( (Nil!34719) (Cons!34718 (h!36115 (_ BitVec 64)) (t!49416 List!34722)) )
))
(declare-fun arrayNoDuplicates!0 (array!99941 (_ BitVec 32) List!34722) Bool)

(assert (=> b!1498572 (= res!1019648 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34719))))

(declare-fun res!1019649 () Bool)

(assert (=> start!127560 (=> (not res!1019649) (not e!839059))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127560 (= res!1019649 (validMask!0 mask!2661))))

(assert (=> start!127560 e!839059))

(assert (=> start!127560 true))

(declare-fun array_inv!37258 (array!99941) Bool)

(assert (=> start!127560 (array_inv!37258 a!2850)))

(declare-fun b!1498573 () Bool)

(declare-fun res!1019650 () Bool)

(assert (=> b!1498573 (=> (not res!1019650) (not e!839059))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498573 (= res!1019650 (validKeyInArray!0 (select (arr!48230 a!2850) i!996)))))

(declare-fun b!1498574 () Bool)

(declare-fun res!1019647 () Bool)

(assert (=> b!1498574 (=> (not res!1019647) (not e!839059))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1498574 (= res!1019647 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48780 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48780 a!2850)) (= (select (arr!48230 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48230 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48780 a!2850))))))

(declare-fun b!1498575 () Bool)

(declare-fun res!1019652 () Bool)

(assert (=> b!1498575 (=> (not res!1019652) (not e!839059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99941 (_ BitVec 32)) Bool)

(assert (=> b!1498575 (= res!1019652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498576 () Bool)

(assert (=> b!1498576 (= e!839059 false)))

(declare-datatypes ((SeekEntryResult!12440 0))(
  ( (MissingZero!12440 (index!52152 (_ BitVec 32))) (Found!12440 (index!52153 (_ BitVec 32))) (Intermediate!12440 (undefined!13252 Bool) (index!52154 (_ BitVec 32)) (x!133850 (_ BitVec 32))) (Undefined!12440) (MissingVacant!12440 (index!52155 (_ BitVec 32))) )
))
(declare-fun lt!652654 () SeekEntryResult!12440)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99941 (_ BitVec 32)) SeekEntryResult!12440)

(assert (=> b!1498576 (= lt!652654 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48230 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498577 () Bool)

(declare-fun res!1019651 () Bool)

(assert (=> b!1498577 (=> (not res!1019651) (not e!839059))))

(assert (=> b!1498577 (= res!1019651 (and (= (size!48780 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48780 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48780 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127560 res!1019649) b!1498577))

(assert (= (and b!1498577 res!1019651) b!1498573))

(assert (= (and b!1498573 res!1019650) b!1498571))

(assert (= (and b!1498571 res!1019653) b!1498575))

(assert (= (and b!1498575 res!1019652) b!1498572))

(assert (= (and b!1498572 res!1019648) b!1498574))

(assert (= (and b!1498574 res!1019647) b!1498576))

(declare-fun m!1381693 () Bool)

(assert (=> b!1498575 m!1381693))

(declare-fun m!1381695 () Bool)

(assert (=> b!1498574 m!1381695))

(declare-fun m!1381697 () Bool)

(assert (=> b!1498574 m!1381697))

(declare-fun m!1381699 () Bool)

(assert (=> b!1498574 m!1381699))

(declare-fun m!1381701 () Bool)

(assert (=> b!1498573 m!1381701))

(assert (=> b!1498573 m!1381701))

(declare-fun m!1381703 () Bool)

(assert (=> b!1498573 m!1381703))

(declare-fun m!1381705 () Bool)

(assert (=> b!1498572 m!1381705))

(declare-fun m!1381707 () Bool)

(assert (=> b!1498571 m!1381707))

(assert (=> b!1498571 m!1381707))

(declare-fun m!1381709 () Bool)

(assert (=> b!1498571 m!1381709))

(declare-fun m!1381711 () Bool)

(assert (=> start!127560 m!1381711))

(declare-fun m!1381713 () Bool)

(assert (=> start!127560 m!1381713))

(assert (=> b!1498576 m!1381707))

(assert (=> b!1498576 m!1381707))

(declare-fun m!1381715 () Bool)

(assert (=> b!1498576 m!1381715))

(push 1)

(assert (not b!1498575))

(assert (not b!1498571))

(assert (not b!1498576))

(assert (not b!1498573))

(assert (not b!1498572))

(assert (not start!127560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

