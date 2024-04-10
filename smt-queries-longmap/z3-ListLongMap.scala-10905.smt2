; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127694 () Bool)

(assert start!127694)

(declare-fun b!1500371 () Bool)

(declare-fun res!1021452 () Bool)

(declare-fun e!839573 () Bool)

(assert (=> b!1500371 (=> (not res!1021452) (not e!839573))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100075 0))(
  ( (array!100076 (arr!48297 (Array (_ BitVec 32) (_ BitVec 64))) (size!48847 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100075)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500371 (= res!1021452 (and (= (size!48847 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48847 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48847 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1021448 () Bool)

(assert (=> start!127694 (=> (not res!1021448) (not e!839573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127694 (= res!1021448 (validMask!0 mask!2661))))

(assert (=> start!127694 e!839573))

(assert (=> start!127694 true))

(declare-fun array_inv!37325 (array!100075) Bool)

(assert (=> start!127694 (array_inv!37325 a!2850)))

(declare-fun b!1500372 () Bool)

(declare-fun res!1021449 () Bool)

(assert (=> b!1500372 (=> (not res!1021449) (not e!839573))))

(declare-datatypes ((List!34789 0))(
  ( (Nil!34786) (Cons!34785 (h!36182 (_ BitVec 64)) (t!49483 List!34789)) )
))
(declare-fun arrayNoDuplicates!0 (array!100075 (_ BitVec 32) List!34789) Bool)

(assert (=> b!1500372 (= res!1021449 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34786))))

(declare-fun b!1500373 () Bool)

(declare-fun e!839574 () Bool)

(assert (=> b!1500373 (= e!839573 e!839574)))

(declare-fun res!1021447 () Bool)

(assert (=> b!1500373 (=> (not res!1021447) (not e!839574))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652923 () (_ BitVec 32))

(assert (=> b!1500373 (= res!1021447 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652923 #b00000000000000000000000000000000) (bvslt lt!652923 (size!48847 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500373 (= lt!652923 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500374 () Bool)

(declare-fun res!1021454 () Bool)

(assert (=> b!1500374 (=> (not res!1021454) (not e!839573))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12507 0))(
  ( (MissingZero!12507 (index!52420 (_ BitVec 32))) (Found!12507 (index!52421 (_ BitVec 32))) (Intermediate!12507 (undefined!13319 Bool) (index!52422 (_ BitVec 32)) (x!134093 (_ BitVec 32))) (Undefined!12507) (MissingVacant!12507 (index!52423 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100075 (_ BitVec 32)) SeekEntryResult!12507)

(assert (=> b!1500374 (= res!1021454 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48297 a!2850) j!87) a!2850 mask!2661) (Found!12507 j!87)))))

(declare-fun b!1500375 () Bool)

(declare-fun res!1021451 () Bool)

(assert (=> b!1500375 (=> (not res!1021451) (not e!839573))))

(assert (=> b!1500375 (= res!1021451 (not (= (select (arr!48297 a!2850) index!625) (select (arr!48297 a!2850) j!87))))))

(declare-fun b!1500376 () Bool)

(declare-fun res!1021453 () Bool)

(assert (=> b!1500376 (=> (not res!1021453) (not e!839573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500376 (= res!1021453 (validKeyInArray!0 (select (arr!48297 a!2850) i!996)))))

(declare-fun b!1500377 () Bool)

(assert (=> b!1500377 (= e!839574 false)))

(declare-fun lt!652924 () SeekEntryResult!12507)

(assert (=> b!1500377 (= lt!652924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652923 vacantBefore!10 (select (arr!48297 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500378 () Bool)

(declare-fun res!1021450 () Bool)

(assert (=> b!1500378 (=> (not res!1021450) (not e!839573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100075 (_ BitVec 32)) Bool)

(assert (=> b!1500378 (= res!1021450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500379 () Bool)

(declare-fun res!1021456 () Bool)

(assert (=> b!1500379 (=> (not res!1021456) (not e!839573))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500379 (= res!1021456 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48847 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48847 a!2850)) (= (select (arr!48297 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48297 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48847 a!2850))))))

(declare-fun b!1500380 () Bool)

(declare-fun res!1021455 () Bool)

(assert (=> b!1500380 (=> (not res!1021455) (not e!839573))))

(assert (=> b!1500380 (= res!1021455 (validKeyInArray!0 (select (arr!48297 a!2850) j!87)))))

(assert (= (and start!127694 res!1021448) b!1500371))

(assert (= (and b!1500371 res!1021452) b!1500376))

(assert (= (and b!1500376 res!1021453) b!1500380))

(assert (= (and b!1500380 res!1021455) b!1500378))

(assert (= (and b!1500378 res!1021450) b!1500372))

(assert (= (and b!1500372 res!1021449) b!1500379))

(assert (= (and b!1500379 res!1021456) b!1500374))

(assert (= (and b!1500374 res!1021454) b!1500375))

(assert (= (and b!1500375 res!1021451) b!1500373))

(assert (= (and b!1500373 res!1021447) b!1500377))

(declare-fun m!1383565 () Bool)

(assert (=> b!1500378 m!1383565))

(declare-fun m!1383567 () Bool)

(assert (=> b!1500379 m!1383567))

(declare-fun m!1383569 () Bool)

(assert (=> b!1500379 m!1383569))

(declare-fun m!1383571 () Bool)

(assert (=> b!1500379 m!1383571))

(declare-fun m!1383573 () Bool)

(assert (=> b!1500375 m!1383573))

(declare-fun m!1383575 () Bool)

(assert (=> b!1500375 m!1383575))

(declare-fun m!1383577 () Bool)

(assert (=> b!1500372 m!1383577))

(assert (=> b!1500374 m!1383575))

(assert (=> b!1500374 m!1383575))

(declare-fun m!1383579 () Bool)

(assert (=> b!1500374 m!1383579))

(assert (=> b!1500377 m!1383575))

(assert (=> b!1500377 m!1383575))

(declare-fun m!1383581 () Bool)

(assert (=> b!1500377 m!1383581))

(declare-fun m!1383583 () Bool)

(assert (=> b!1500373 m!1383583))

(declare-fun m!1383585 () Bool)

(assert (=> start!127694 m!1383585))

(declare-fun m!1383587 () Bool)

(assert (=> start!127694 m!1383587))

(assert (=> b!1500380 m!1383575))

(assert (=> b!1500380 m!1383575))

(declare-fun m!1383589 () Bool)

(assert (=> b!1500380 m!1383589))

(declare-fun m!1383591 () Bool)

(assert (=> b!1500376 m!1383591))

(assert (=> b!1500376 m!1383591))

(declare-fun m!1383593 () Bool)

(assert (=> b!1500376 m!1383593))

(check-sat (not b!1500374) (not b!1500373) (not b!1500376) (not b!1500380) (not b!1500372) (not start!127694) (not b!1500377) (not b!1500378))
(check-sat)
