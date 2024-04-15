; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127572 () Bool)

(assert start!127572)

(declare-fun b!1498918 () Bool)

(declare-fun res!1020184 () Bool)

(declare-fun e!839033 () Bool)

(assert (=> b!1498918 (=> (not res!1020184) (not e!839033))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99947 0))(
  ( (array!99948 (arr!48234 (Array (_ BitVec 32) (_ BitVec 64))) (size!48786 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99947)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498918 (= res!1020184 (and (= (size!48786 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48786 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48786 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498919 () Bool)

(assert (=> b!1498919 (= e!839033 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12465 0))(
  ( (MissingZero!12465 (index!52252 (_ BitVec 32))) (Found!12465 (index!52253 (_ BitVec 32))) (Intermediate!12465 (undefined!13277 Bool) (index!52254 (_ BitVec 32)) (x!133942 (_ BitVec 32))) (Undefined!12465) (MissingVacant!12465 (index!52255 (_ BitVec 32))) )
))
(declare-fun lt!652417 () SeekEntryResult!12465)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99947 (_ BitVec 32)) SeekEntryResult!12465)

(assert (=> b!1498919 (= lt!652417 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48234 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498920 () Bool)

(declare-fun res!1020188 () Bool)

(assert (=> b!1498920 (=> (not res!1020188) (not e!839033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498920 (= res!1020188 (validKeyInArray!0 (select (arr!48234 a!2850) i!996)))))

(declare-fun res!1020187 () Bool)

(assert (=> start!127572 (=> (not res!1020187) (not e!839033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127572 (= res!1020187 (validMask!0 mask!2661))))

(assert (=> start!127572 e!839033))

(assert (=> start!127572 true))

(declare-fun array_inv!37467 (array!99947) Bool)

(assert (=> start!127572 (array_inv!37467 a!2850)))

(declare-fun b!1498921 () Bool)

(declare-fun res!1020183 () Bool)

(assert (=> b!1498921 (=> (not res!1020183) (not e!839033))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498921 (= res!1020183 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48786 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48786 a!2850)) (= (select (arr!48234 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48234 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48786 a!2850))))))

(declare-fun b!1498922 () Bool)

(declare-fun res!1020185 () Bool)

(assert (=> b!1498922 (=> (not res!1020185) (not e!839033))))

(declare-datatypes ((List!34804 0))(
  ( (Nil!34801) (Cons!34800 (h!36198 (_ BitVec 64)) (t!49490 List!34804)) )
))
(declare-fun arrayNoDuplicates!0 (array!99947 (_ BitVec 32) List!34804) Bool)

(assert (=> b!1498922 (= res!1020185 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34801))))

(declare-fun b!1498923 () Bool)

(declare-fun res!1020182 () Bool)

(assert (=> b!1498923 (=> (not res!1020182) (not e!839033))))

(assert (=> b!1498923 (= res!1020182 (validKeyInArray!0 (select (arr!48234 a!2850) j!87)))))

(declare-fun b!1498924 () Bool)

(declare-fun res!1020186 () Bool)

(assert (=> b!1498924 (=> (not res!1020186) (not e!839033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99947 (_ BitVec 32)) Bool)

(assert (=> b!1498924 (= res!1020186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127572 res!1020187) b!1498918))

(assert (= (and b!1498918 res!1020184) b!1498920))

(assert (= (and b!1498920 res!1020188) b!1498923))

(assert (= (and b!1498923 res!1020182) b!1498924))

(assert (= (and b!1498924 res!1020186) b!1498922))

(assert (= (and b!1498922 res!1020185) b!1498921))

(assert (= (and b!1498921 res!1020183) b!1498919))

(declare-fun m!1381561 () Bool)

(assert (=> b!1498920 m!1381561))

(assert (=> b!1498920 m!1381561))

(declare-fun m!1381563 () Bool)

(assert (=> b!1498920 m!1381563))

(declare-fun m!1381565 () Bool)

(assert (=> b!1498924 m!1381565))

(declare-fun m!1381567 () Bool)

(assert (=> b!1498919 m!1381567))

(assert (=> b!1498919 m!1381567))

(declare-fun m!1381569 () Bool)

(assert (=> b!1498919 m!1381569))

(declare-fun m!1381571 () Bool)

(assert (=> start!127572 m!1381571))

(declare-fun m!1381573 () Bool)

(assert (=> start!127572 m!1381573))

(assert (=> b!1498923 m!1381567))

(assert (=> b!1498923 m!1381567))

(declare-fun m!1381575 () Bool)

(assert (=> b!1498923 m!1381575))

(declare-fun m!1381577 () Bool)

(assert (=> b!1498922 m!1381577))

(declare-fun m!1381579 () Bool)

(assert (=> b!1498921 m!1381579))

(declare-fun m!1381581 () Bool)

(assert (=> b!1498921 m!1381581))

(declare-fun m!1381583 () Bool)

(assert (=> b!1498921 m!1381583))

(push 1)

(assert (not b!1498923))

(assert (not b!1498922))

(assert (not b!1498920))

(assert (not b!1498924))

(assert (not b!1498919))

(assert (not start!127572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

