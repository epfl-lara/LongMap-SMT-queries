; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127556 () Bool)

(assert start!127556)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99937 0))(
  ( (array!99938 (arr!48228 (Array (_ BitVec 32) (_ BitVec 64))) (size!48778 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99937)

(declare-fun b!1498525 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun e!839046 () Bool)

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1498525 (= e!839046 (and (= (select (arr!48228 a!2850) index!625) (select (arr!48228 a!2850) j!87)) (= j!87 index!625) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498526 () Bool)

(declare-fun res!1019606 () Bool)

(assert (=> b!1498526 (=> (not res!1019606) (not e!839046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498526 (= res!1019606 (validKeyInArray!0 (select (arr!48228 a!2850) j!87)))))

(declare-fun b!1498528 () Bool)

(declare-fun res!1019607 () Bool)

(assert (=> b!1498528 (=> (not res!1019607) (not e!839046))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12438 0))(
  ( (MissingZero!12438 (index!52144 (_ BitVec 32))) (Found!12438 (index!52145 (_ BitVec 32))) (Intermediate!12438 (undefined!13250 Bool) (index!52146 (_ BitVec 32)) (x!133840 (_ BitVec 32))) (Undefined!12438) (MissingVacant!12438 (index!52147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99937 (_ BitVec 32)) SeekEntryResult!12438)

(assert (=> b!1498528 (= res!1019607 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48228 a!2850) j!87) a!2850 mask!2661) (Found!12438 j!87)))))

(declare-fun b!1498529 () Bool)

(declare-fun res!1019603 () Bool)

(assert (=> b!1498529 (=> (not res!1019603) (not e!839046))))

(declare-datatypes ((List!34720 0))(
  ( (Nil!34717) (Cons!34716 (h!36113 (_ BitVec 64)) (t!49414 List!34720)) )
))
(declare-fun arrayNoDuplicates!0 (array!99937 (_ BitVec 32) List!34720) Bool)

(assert (=> b!1498529 (= res!1019603 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34717))))

(declare-fun b!1498530 () Bool)

(declare-fun res!1019604 () Bool)

(assert (=> b!1498530 (=> (not res!1019604) (not e!839046))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498530 (= res!1019604 (validKeyInArray!0 (select (arr!48228 a!2850) i!996)))))

(declare-fun b!1498531 () Bool)

(declare-fun res!1019608 () Bool)

(assert (=> b!1498531 (=> (not res!1019608) (not e!839046))))

(assert (=> b!1498531 (= res!1019608 (and (= (size!48778 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48778 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48778 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498532 () Bool)

(declare-fun res!1019601 () Bool)

(assert (=> b!1498532 (=> (not res!1019601) (not e!839046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99937 (_ BitVec 32)) Bool)

(assert (=> b!1498532 (= res!1019601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498527 () Bool)

(declare-fun res!1019605 () Bool)

(assert (=> b!1498527 (=> (not res!1019605) (not e!839046))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498527 (= res!1019605 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48778 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48778 a!2850)) (= (select (arr!48228 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48228 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48778 a!2850))))))

(declare-fun res!1019602 () Bool)

(assert (=> start!127556 (=> (not res!1019602) (not e!839046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127556 (= res!1019602 (validMask!0 mask!2661))))

(assert (=> start!127556 e!839046))

(assert (=> start!127556 true))

(declare-fun array_inv!37256 (array!99937) Bool)

(assert (=> start!127556 (array_inv!37256 a!2850)))

(assert (= (and start!127556 res!1019602) b!1498531))

(assert (= (and b!1498531 res!1019608) b!1498530))

(assert (= (and b!1498530 res!1019604) b!1498526))

(assert (= (and b!1498526 res!1019606) b!1498532))

(assert (= (and b!1498532 res!1019601) b!1498529))

(assert (= (and b!1498529 res!1019603) b!1498527))

(assert (= (and b!1498527 res!1019605) b!1498528))

(assert (= (and b!1498528 res!1019607) b!1498525))

(declare-fun m!1381641 () Bool)

(assert (=> b!1498530 m!1381641))

(assert (=> b!1498530 m!1381641))

(declare-fun m!1381643 () Bool)

(assert (=> b!1498530 m!1381643))

(declare-fun m!1381645 () Bool)

(assert (=> b!1498525 m!1381645))

(declare-fun m!1381647 () Bool)

(assert (=> b!1498525 m!1381647))

(declare-fun m!1381649 () Bool)

(assert (=> b!1498527 m!1381649))

(declare-fun m!1381651 () Bool)

(assert (=> b!1498527 m!1381651))

(declare-fun m!1381653 () Bool)

(assert (=> b!1498527 m!1381653))

(declare-fun m!1381655 () Bool)

(assert (=> b!1498529 m!1381655))

(declare-fun m!1381657 () Bool)

(assert (=> b!1498532 m!1381657))

(assert (=> b!1498528 m!1381647))

(assert (=> b!1498528 m!1381647))

(declare-fun m!1381659 () Bool)

(assert (=> b!1498528 m!1381659))

(assert (=> b!1498526 m!1381647))

(assert (=> b!1498526 m!1381647))

(declare-fun m!1381661 () Bool)

(assert (=> b!1498526 m!1381661))

(declare-fun m!1381663 () Bool)

(assert (=> start!127556 m!1381663))

(declare-fun m!1381665 () Bool)

(assert (=> start!127556 m!1381665))

(check-sat (not start!127556) (not b!1498526) (not b!1498528) (not b!1498530) (not b!1498532) (not b!1498529))
(check-sat)
