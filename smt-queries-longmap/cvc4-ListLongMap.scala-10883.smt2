; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127564 () Bool)

(assert start!127564)

(declare-fun b!1498613 () Bool)

(declare-fun res!1019689 () Bool)

(declare-fun e!839071 () Bool)

(assert (=> b!1498613 (=> (not res!1019689) (not e!839071))))

(declare-datatypes ((array!99945 0))(
  ( (array!99946 (arr!48232 (Array (_ BitVec 32) (_ BitVec 64))) (size!48782 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99945)

(declare-datatypes ((List!34724 0))(
  ( (Nil!34721) (Cons!34720 (h!36117 (_ BitVec 64)) (t!49418 List!34724)) )
))
(declare-fun arrayNoDuplicates!0 (array!99945 (_ BitVec 32) List!34724) Bool)

(assert (=> b!1498613 (= res!1019689 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34721))))

(declare-fun b!1498614 () Bool)

(assert (=> b!1498614 (= e!839071 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12442 0))(
  ( (MissingZero!12442 (index!52160 (_ BitVec 32))) (Found!12442 (index!52161 (_ BitVec 32))) (Intermediate!12442 (undefined!13254 Bool) (index!52162 (_ BitVec 32)) (x!133852 (_ BitVec 32))) (Undefined!12442) (MissingVacant!12442 (index!52163 (_ BitVec 32))) )
))
(declare-fun lt!652660 () SeekEntryResult!12442)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99945 (_ BitVec 32)) SeekEntryResult!12442)

(assert (=> b!1498614 (= lt!652660 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48232 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498615 () Bool)

(declare-fun res!1019691 () Bool)

(assert (=> b!1498615 (=> (not res!1019691) (not e!839071))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498615 (= res!1019691 (and (= (size!48782 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48782 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48782 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498616 () Bool)

(declare-fun res!1019694 () Bool)

(assert (=> b!1498616 (=> (not res!1019694) (not e!839071))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498616 (= res!1019694 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48782 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48782 a!2850)) (= (select (arr!48232 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48232 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48782 a!2850))))))

(declare-fun b!1498617 () Bool)

(declare-fun res!1019690 () Bool)

(assert (=> b!1498617 (=> (not res!1019690) (not e!839071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99945 (_ BitVec 32)) Bool)

(assert (=> b!1498617 (= res!1019690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019692 () Bool)

(assert (=> start!127564 (=> (not res!1019692) (not e!839071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127564 (= res!1019692 (validMask!0 mask!2661))))

(assert (=> start!127564 e!839071))

(assert (=> start!127564 true))

(declare-fun array_inv!37260 (array!99945) Bool)

(assert (=> start!127564 (array_inv!37260 a!2850)))

(declare-fun b!1498618 () Bool)

(declare-fun res!1019695 () Bool)

(assert (=> b!1498618 (=> (not res!1019695) (not e!839071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498618 (= res!1019695 (validKeyInArray!0 (select (arr!48232 a!2850) i!996)))))

(declare-fun b!1498619 () Bool)

(declare-fun res!1019693 () Bool)

(assert (=> b!1498619 (=> (not res!1019693) (not e!839071))))

(assert (=> b!1498619 (= res!1019693 (validKeyInArray!0 (select (arr!48232 a!2850) j!87)))))

(assert (= (and start!127564 res!1019692) b!1498615))

(assert (= (and b!1498615 res!1019691) b!1498618))

(assert (= (and b!1498618 res!1019695) b!1498619))

(assert (= (and b!1498619 res!1019693) b!1498617))

(assert (= (and b!1498617 res!1019690) b!1498613))

(assert (= (and b!1498613 res!1019689) b!1498616))

(assert (= (and b!1498616 res!1019694) b!1498614))

(declare-fun m!1381741 () Bool)

(assert (=> b!1498613 m!1381741))

(declare-fun m!1381743 () Bool)

(assert (=> start!127564 m!1381743))

(declare-fun m!1381745 () Bool)

(assert (=> start!127564 m!1381745))

(declare-fun m!1381747 () Bool)

(assert (=> b!1498617 m!1381747))

(declare-fun m!1381749 () Bool)

(assert (=> b!1498619 m!1381749))

(assert (=> b!1498619 m!1381749))

(declare-fun m!1381751 () Bool)

(assert (=> b!1498619 m!1381751))

(assert (=> b!1498614 m!1381749))

(assert (=> b!1498614 m!1381749))

(declare-fun m!1381753 () Bool)

(assert (=> b!1498614 m!1381753))

(declare-fun m!1381755 () Bool)

(assert (=> b!1498618 m!1381755))

(assert (=> b!1498618 m!1381755))

(declare-fun m!1381757 () Bool)

(assert (=> b!1498618 m!1381757))

(declare-fun m!1381759 () Bool)

(assert (=> b!1498616 m!1381759))

(declare-fun m!1381761 () Bool)

(assert (=> b!1498616 m!1381761))

(declare-fun m!1381763 () Bool)

(assert (=> b!1498616 m!1381763))

(push 1)

(assert (not start!127564))

(assert (not b!1498617))

(assert (not b!1498613))

(assert (not b!1498618))

(assert (not b!1498614))

(assert (not b!1498619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

