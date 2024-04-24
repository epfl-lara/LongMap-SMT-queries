; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128012 () Bool)

(assert start!128012)

(declare-fun b!1502450 () Bool)

(declare-fun res!1022348 () Bool)

(declare-fun e!840784 () Bool)

(assert (=> b!1502450 (=> (not res!1022348) (not e!840784))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!100207 0))(
  ( (array!100208 (arr!48358 (Array (_ BitVec 32) (_ BitVec 64))) (size!48909 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100207)

(assert (=> b!1502450 (= res!1022348 (not (= (select (arr!48358 a!2850) index!625) (select (arr!48358 a!2850) j!87))))))

(declare-fun b!1502451 () Bool)

(declare-fun res!1022347 () Bool)

(assert (=> b!1502451 (=> (not res!1022347) (not e!840784))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502451 (= res!1022347 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48909 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48909 a!2850)) (= (select (arr!48358 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48358 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48909 a!2850))))))

(declare-fun b!1502452 () Bool)

(declare-fun e!840786 () Bool)

(assert (=> b!1502452 (= e!840786 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653637 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12461 0))(
  ( (MissingZero!12461 (index!52236 (_ BitVec 32))) (Found!12461 (index!52237 (_ BitVec 32))) (Intermediate!12461 (undefined!13273 Bool) (index!52238 (_ BitVec 32)) (x!134108 (_ BitVec 32))) (Undefined!12461) (MissingVacant!12461 (index!52239 (_ BitVec 32))) )
))
(declare-fun lt!653636 () SeekEntryResult!12461)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100207 (_ BitVec 32)) SeekEntryResult!12461)

(assert (=> b!1502452 (= lt!653636 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653637 vacantBefore!10 (select (arr!48358 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502453 () Bool)

(declare-fun res!1022345 () Bool)

(assert (=> b!1502453 (=> (not res!1022345) (not e!840784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502453 (= res!1022345 (validKeyInArray!0 (select (arr!48358 a!2850) i!996)))))

(declare-fun b!1502454 () Bool)

(declare-fun res!1022351 () Bool)

(assert (=> b!1502454 (=> (not res!1022351) (not e!840784))))

(assert (=> b!1502454 (= res!1022351 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48358 a!2850) j!87) a!2850 mask!2661) (Found!12461 j!87)))))

(declare-fun b!1502455 () Bool)

(declare-fun res!1022344 () Bool)

(assert (=> b!1502455 (=> (not res!1022344) (not e!840784))))

(declare-datatypes ((List!34837 0))(
  ( (Nil!34834) (Cons!34833 (h!36245 (_ BitVec 64)) (t!49523 List!34837)) )
))
(declare-fun arrayNoDuplicates!0 (array!100207 (_ BitVec 32) List!34837) Bool)

(assert (=> b!1502455 (= res!1022344 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34834))))

(declare-fun b!1502456 () Bool)

(assert (=> b!1502456 (= e!840784 e!840786)))

(declare-fun res!1022342 () Bool)

(assert (=> b!1502456 (=> (not res!1022342) (not e!840786))))

(assert (=> b!1502456 (= res!1022342 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653637 #b00000000000000000000000000000000) (bvslt lt!653637 (size!48909 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502456 (= lt!653637 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502449 () Bool)

(declare-fun res!1022349 () Bool)

(assert (=> b!1502449 (=> (not res!1022349) (not e!840784))))

(assert (=> b!1502449 (= res!1022349 (validKeyInArray!0 (select (arr!48358 a!2850) j!87)))))

(declare-fun res!1022350 () Bool)

(assert (=> start!128012 (=> (not res!1022350) (not e!840784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128012 (= res!1022350 (validMask!0 mask!2661))))

(assert (=> start!128012 e!840784))

(assert (=> start!128012 true))

(declare-fun array_inv!37639 (array!100207) Bool)

(assert (=> start!128012 (array_inv!37639 a!2850)))

(declare-fun b!1502457 () Bool)

(declare-fun res!1022343 () Bool)

(assert (=> b!1502457 (=> (not res!1022343) (not e!840784))))

(assert (=> b!1502457 (= res!1022343 (and (= (size!48909 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48909 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48909 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502458 () Bool)

(declare-fun res!1022346 () Bool)

(assert (=> b!1502458 (=> (not res!1022346) (not e!840784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100207 (_ BitVec 32)) Bool)

(assert (=> b!1502458 (= res!1022346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128012 res!1022350) b!1502457))

(assert (= (and b!1502457 res!1022343) b!1502453))

(assert (= (and b!1502453 res!1022345) b!1502449))

(assert (= (and b!1502449 res!1022349) b!1502458))

(assert (= (and b!1502458 res!1022346) b!1502455))

(assert (= (and b!1502455 res!1022344) b!1502451))

(assert (= (and b!1502451 res!1022347) b!1502454))

(assert (= (and b!1502454 res!1022351) b!1502450))

(assert (= (and b!1502450 res!1022348) b!1502456))

(assert (= (and b!1502456 res!1022342) b!1502452))

(declare-fun m!1385593 () Bool)

(assert (=> b!1502456 m!1385593))

(declare-fun m!1385595 () Bool)

(assert (=> b!1502451 m!1385595))

(declare-fun m!1385597 () Bool)

(assert (=> b!1502451 m!1385597))

(declare-fun m!1385599 () Bool)

(assert (=> b!1502451 m!1385599))

(declare-fun m!1385601 () Bool)

(assert (=> b!1502449 m!1385601))

(assert (=> b!1502449 m!1385601))

(declare-fun m!1385603 () Bool)

(assert (=> b!1502449 m!1385603))

(declare-fun m!1385605 () Bool)

(assert (=> start!128012 m!1385605))

(declare-fun m!1385607 () Bool)

(assert (=> start!128012 m!1385607))

(assert (=> b!1502454 m!1385601))

(assert (=> b!1502454 m!1385601))

(declare-fun m!1385609 () Bool)

(assert (=> b!1502454 m!1385609))

(assert (=> b!1502452 m!1385601))

(assert (=> b!1502452 m!1385601))

(declare-fun m!1385611 () Bool)

(assert (=> b!1502452 m!1385611))

(declare-fun m!1385613 () Bool)

(assert (=> b!1502450 m!1385613))

(assert (=> b!1502450 m!1385601))

(declare-fun m!1385615 () Bool)

(assert (=> b!1502458 m!1385615))

(declare-fun m!1385617 () Bool)

(assert (=> b!1502453 m!1385617))

(assert (=> b!1502453 m!1385617))

(declare-fun m!1385619 () Bool)

(assert (=> b!1502453 m!1385619))

(declare-fun m!1385621 () Bool)

(assert (=> b!1502455 m!1385621))

(check-sat (not b!1502458) (not b!1502452) (not start!128012) (not b!1502455) (not b!1502449) (not b!1502456) (not b!1502453) (not b!1502454))
(check-sat)
