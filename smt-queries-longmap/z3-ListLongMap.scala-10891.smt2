; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127562 () Bool)

(assert start!127562)

(declare-fun b!1498806 () Bool)

(declare-fun res!1020076 () Bool)

(declare-fun e!839003 () Bool)

(assert (=> b!1498806 (=> (not res!1020076) (not e!839003))))

(declare-datatypes ((array!99937 0))(
  ( (array!99938 (arr!48229 (Array (_ BitVec 32) (_ BitVec 64))) (size!48781 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99937)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498806 (= res!1020076 (validKeyInArray!0 (select (arr!48229 a!2850) j!87)))))

(declare-fun b!1498807 () Bool)

(declare-fun res!1020071 () Bool)

(assert (=> b!1498807 (=> (not res!1020071) (not e!839003))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498807 (= res!1020071 (and (= (size!48781 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48781 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48781 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498808 () Bool)

(declare-fun res!1020077 () Bool)

(assert (=> b!1498808 (=> (not res!1020077) (not e!839003))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1498808 (= res!1020077 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48781 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48781 a!2850)) (= (select (arr!48229 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48229 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48781 a!2850))))))

(declare-fun b!1498809 () Bool)

(assert (=> b!1498809 (= e!839003 (and (not (= (select (arr!48229 a!2850) index!625) (select (arr!48229 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498810 () Bool)

(declare-fun res!1020073 () Bool)

(assert (=> b!1498810 (=> (not res!1020073) (not e!839003))))

(declare-datatypes ((SeekEntryResult!12460 0))(
  ( (MissingZero!12460 (index!52232 (_ BitVec 32))) (Found!12460 (index!52233 (_ BitVec 32))) (Intermediate!12460 (undefined!13272 Bool) (index!52234 (_ BitVec 32)) (x!133929 (_ BitVec 32))) (Undefined!12460) (MissingVacant!12460 (index!52235 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99937 (_ BitVec 32)) SeekEntryResult!12460)

(assert (=> b!1498810 (= res!1020073 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48229 a!2850) j!87) a!2850 mask!2661) (Found!12460 j!87)))))

(declare-fun b!1498812 () Bool)

(declare-fun res!1020070 () Bool)

(assert (=> b!1498812 (=> (not res!1020070) (not e!839003))))

(assert (=> b!1498812 (= res!1020070 (validKeyInArray!0 (select (arr!48229 a!2850) i!996)))))

(declare-fun b!1498813 () Bool)

(declare-fun res!1020074 () Bool)

(assert (=> b!1498813 (=> (not res!1020074) (not e!839003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99937 (_ BitVec 32)) Bool)

(assert (=> b!1498813 (= res!1020074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498811 () Bool)

(declare-fun res!1020072 () Bool)

(assert (=> b!1498811 (=> (not res!1020072) (not e!839003))))

(declare-datatypes ((List!34799 0))(
  ( (Nil!34796) (Cons!34795 (h!36193 (_ BitVec 64)) (t!49485 List!34799)) )
))
(declare-fun arrayNoDuplicates!0 (array!99937 (_ BitVec 32) List!34799) Bool)

(assert (=> b!1498811 (= res!1020072 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34796))))

(declare-fun res!1020075 () Bool)

(assert (=> start!127562 (=> (not res!1020075) (not e!839003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127562 (= res!1020075 (validMask!0 mask!2661))))

(assert (=> start!127562 e!839003))

(assert (=> start!127562 true))

(declare-fun array_inv!37462 (array!99937) Bool)

(assert (=> start!127562 (array_inv!37462 a!2850)))

(assert (= (and start!127562 res!1020075) b!1498807))

(assert (= (and b!1498807 res!1020071) b!1498812))

(assert (= (and b!1498812 res!1020070) b!1498806))

(assert (= (and b!1498806 res!1020076) b!1498813))

(assert (= (and b!1498813 res!1020074) b!1498811))

(assert (= (and b!1498811 res!1020072) b!1498808))

(assert (= (and b!1498808 res!1020077) b!1498810))

(assert (= (and b!1498810 res!1020073) b!1498809))

(declare-fun m!1381435 () Bool)

(assert (=> b!1498809 m!1381435))

(declare-fun m!1381437 () Bool)

(assert (=> b!1498809 m!1381437))

(assert (=> b!1498810 m!1381437))

(assert (=> b!1498810 m!1381437))

(declare-fun m!1381439 () Bool)

(assert (=> b!1498810 m!1381439))

(declare-fun m!1381441 () Bool)

(assert (=> b!1498811 m!1381441))

(declare-fun m!1381443 () Bool)

(assert (=> start!127562 m!1381443))

(declare-fun m!1381445 () Bool)

(assert (=> start!127562 m!1381445))

(assert (=> b!1498806 m!1381437))

(assert (=> b!1498806 m!1381437))

(declare-fun m!1381447 () Bool)

(assert (=> b!1498806 m!1381447))

(declare-fun m!1381449 () Bool)

(assert (=> b!1498813 m!1381449))

(declare-fun m!1381451 () Bool)

(assert (=> b!1498812 m!1381451))

(assert (=> b!1498812 m!1381451))

(declare-fun m!1381453 () Bool)

(assert (=> b!1498812 m!1381453))

(declare-fun m!1381455 () Bool)

(assert (=> b!1498808 m!1381455))

(declare-fun m!1381457 () Bool)

(assert (=> b!1498808 m!1381457))

(declare-fun m!1381459 () Bool)

(assert (=> b!1498808 m!1381459))

(check-sat (not b!1498811) (not start!127562) (not b!1498806) (not b!1498810) (not b!1498812) (not b!1498813))
(check-sat)
