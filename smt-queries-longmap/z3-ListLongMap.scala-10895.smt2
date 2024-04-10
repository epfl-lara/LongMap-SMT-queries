; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127634 () Bool)

(assert start!127634)

(declare-fun b!1499471 () Bool)

(declare-fun res!1020551 () Bool)

(declare-fun e!839305 () Bool)

(assert (=> b!1499471 (=> (not res!1020551) (not e!839305))))

(declare-datatypes ((array!100015 0))(
  ( (array!100016 (arr!48267 (Array (_ BitVec 32) (_ BitVec 64))) (size!48817 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100015)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100015 (_ BitVec 32)) Bool)

(assert (=> b!1499471 (= res!1020551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499472 () Bool)

(declare-fun res!1020553 () Bool)

(assert (=> b!1499472 (=> (not res!1020553) (not e!839305))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499472 (= res!1020553 (and (= (size!48817 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48817 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48817 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499473 () Bool)

(declare-fun res!1020549 () Bool)

(assert (=> b!1499473 (=> (not res!1020549) (not e!839305))))

(declare-datatypes ((List!34759 0))(
  ( (Nil!34756) (Cons!34755 (h!36152 (_ BitVec 64)) (t!49453 List!34759)) )
))
(declare-fun arrayNoDuplicates!0 (array!100015 (_ BitVec 32) List!34759) Bool)

(assert (=> b!1499473 (= res!1020549 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34756))))

(declare-fun b!1499475 () Bool)

(declare-fun res!1020548 () Bool)

(assert (=> b!1499475 (=> (not res!1020548) (not e!839305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499475 (= res!1020548 (validKeyInArray!0 (select (arr!48267 a!2850) i!996)))))

(declare-fun b!1499476 () Bool)

(declare-fun res!1020550 () Bool)

(assert (=> b!1499476 (=> (not res!1020550) (not e!839305))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1499476 (= res!1020550 (not (= (select (arr!48267 a!2850) index!625) (select (arr!48267 a!2850) j!87))))))

(declare-fun b!1499477 () Bool)

(declare-fun res!1020552 () Bool)

(assert (=> b!1499477 (=> (not res!1020552) (not e!839305))))

(assert (=> b!1499477 (= res!1020552 (validKeyInArray!0 (select (arr!48267 a!2850) j!87)))))

(declare-fun b!1499478 () Bool)

(declare-fun res!1020556 () Bool)

(assert (=> b!1499478 (=> (not res!1020556) (not e!839305))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499478 (= res!1020556 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48817 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48817 a!2850)) (= (select (arr!48267 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48267 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48817 a!2850))))))

(declare-fun b!1499479 () Bool)

(declare-fun e!839303 () Bool)

(assert (=> b!1499479 (= e!839303 false)))

(declare-datatypes ((SeekEntryResult!12477 0))(
  ( (MissingZero!12477 (index!52300 (_ BitVec 32))) (Found!12477 (index!52301 (_ BitVec 32))) (Intermediate!12477 (undefined!13289 Bool) (index!52302 (_ BitVec 32)) (x!133983 (_ BitVec 32))) (Undefined!12477) (MissingVacant!12477 (index!52303 (_ BitVec 32))) )
))
(declare-fun lt!652744 () SeekEntryResult!12477)

(declare-fun lt!652743 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100015 (_ BitVec 32)) SeekEntryResult!12477)

(assert (=> b!1499479 (= lt!652744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652743 vacantBefore!10 (select (arr!48267 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499480 () Bool)

(assert (=> b!1499480 (= e!839305 e!839303)))

(declare-fun res!1020547 () Bool)

(assert (=> b!1499480 (=> (not res!1020547) (not e!839303))))

(assert (=> b!1499480 (= res!1020547 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652743 #b00000000000000000000000000000000) (bvslt lt!652743 (size!48817 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499480 (= lt!652743 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499474 () Bool)

(declare-fun res!1020555 () Bool)

(assert (=> b!1499474 (=> (not res!1020555) (not e!839305))))

(assert (=> b!1499474 (= res!1020555 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48267 a!2850) j!87) a!2850 mask!2661) (Found!12477 j!87)))))

(declare-fun res!1020554 () Bool)

(assert (=> start!127634 (=> (not res!1020554) (not e!839305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127634 (= res!1020554 (validMask!0 mask!2661))))

(assert (=> start!127634 e!839305))

(assert (=> start!127634 true))

(declare-fun array_inv!37295 (array!100015) Bool)

(assert (=> start!127634 (array_inv!37295 a!2850)))

(assert (= (and start!127634 res!1020554) b!1499472))

(assert (= (and b!1499472 res!1020553) b!1499475))

(assert (= (and b!1499475 res!1020548) b!1499477))

(assert (= (and b!1499477 res!1020552) b!1499471))

(assert (= (and b!1499471 res!1020551) b!1499473))

(assert (= (and b!1499473 res!1020549) b!1499478))

(assert (= (and b!1499478 res!1020556) b!1499474))

(assert (= (and b!1499474 res!1020555) b!1499476))

(assert (= (and b!1499476 res!1020550) b!1499480))

(assert (= (and b!1499480 res!1020547) b!1499479))

(declare-fun m!1382665 () Bool)

(assert (=> start!127634 m!1382665))

(declare-fun m!1382667 () Bool)

(assert (=> start!127634 m!1382667))

(declare-fun m!1382669 () Bool)

(assert (=> b!1499480 m!1382669))

(declare-fun m!1382671 () Bool)

(assert (=> b!1499473 m!1382671))

(declare-fun m!1382673 () Bool)

(assert (=> b!1499474 m!1382673))

(assert (=> b!1499474 m!1382673))

(declare-fun m!1382675 () Bool)

(assert (=> b!1499474 m!1382675))

(declare-fun m!1382677 () Bool)

(assert (=> b!1499471 m!1382677))

(assert (=> b!1499477 m!1382673))

(assert (=> b!1499477 m!1382673))

(declare-fun m!1382679 () Bool)

(assert (=> b!1499477 m!1382679))

(assert (=> b!1499479 m!1382673))

(assert (=> b!1499479 m!1382673))

(declare-fun m!1382681 () Bool)

(assert (=> b!1499479 m!1382681))

(declare-fun m!1382683 () Bool)

(assert (=> b!1499475 m!1382683))

(assert (=> b!1499475 m!1382683))

(declare-fun m!1382685 () Bool)

(assert (=> b!1499475 m!1382685))

(declare-fun m!1382687 () Bool)

(assert (=> b!1499478 m!1382687))

(declare-fun m!1382689 () Bool)

(assert (=> b!1499478 m!1382689))

(declare-fun m!1382691 () Bool)

(assert (=> b!1499478 m!1382691))

(declare-fun m!1382693 () Bool)

(assert (=> b!1499476 m!1382693))

(assert (=> b!1499476 m!1382673))

(check-sat (not b!1499475) (not b!1499471) (not b!1499480) (not b!1499473) (not b!1499474) (not b!1499479) (not start!127634) (not b!1499477))
(check-sat)
