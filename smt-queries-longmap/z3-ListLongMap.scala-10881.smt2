; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127550 () Bool)

(assert start!127550)

(declare-fun b!1498457 () Bool)

(declare-fun res!1019535 () Bool)

(declare-fun e!839029 () Bool)

(assert (=> b!1498457 (=> (not res!1019535) (not e!839029))))

(declare-datatypes ((array!99931 0))(
  ( (array!99932 (arr!48225 (Array (_ BitVec 32) (_ BitVec 64))) (size!48775 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99931)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498457 (= res!1019535 (validKeyInArray!0 (select (arr!48225 a!2850) j!87)))))

(declare-fun b!1498458 () Bool)

(assert (=> b!1498458 (= e!839029 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12435 0))(
  ( (MissingZero!12435 (index!52132 (_ BitVec 32))) (Found!12435 (index!52133 (_ BitVec 32))) (Intermediate!12435 (undefined!13247 Bool) (index!52134 (_ BitVec 32)) (x!133829 (_ BitVec 32))) (Undefined!12435) (MissingVacant!12435 (index!52135 (_ BitVec 32))) )
))
(declare-fun lt!652648 () SeekEntryResult!12435)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99931 (_ BitVec 32)) SeekEntryResult!12435)

(assert (=> b!1498458 (= lt!652648 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48225 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1019539 () Bool)

(assert (=> start!127550 (=> (not res!1019539) (not e!839029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127550 (= res!1019539 (validMask!0 mask!2661))))

(assert (=> start!127550 e!839029))

(assert (=> start!127550 true))

(declare-fun array_inv!37253 (array!99931) Bool)

(assert (=> start!127550 (array_inv!37253 a!2850)))

(declare-fun b!1498459 () Bool)

(declare-fun res!1019537 () Bool)

(assert (=> b!1498459 (=> (not res!1019537) (not e!839029))))

(declare-datatypes ((List!34717 0))(
  ( (Nil!34714) (Cons!34713 (h!36110 (_ BitVec 64)) (t!49411 List!34717)) )
))
(declare-fun arrayNoDuplicates!0 (array!99931 (_ BitVec 32) List!34717) Bool)

(assert (=> b!1498459 (= res!1019537 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34714))))

(declare-fun b!1498460 () Bool)

(declare-fun res!1019536 () Bool)

(assert (=> b!1498460 (=> (not res!1019536) (not e!839029))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498460 (= res!1019536 (and (= (size!48775 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48775 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48775 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498461 () Bool)

(declare-fun res!1019534 () Bool)

(assert (=> b!1498461 (=> (not res!1019534) (not e!839029))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498461 (= res!1019534 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48775 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48775 a!2850)) (= (select (arr!48225 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48225 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48775 a!2850))))))

(declare-fun b!1498462 () Bool)

(declare-fun res!1019538 () Bool)

(assert (=> b!1498462 (=> (not res!1019538) (not e!839029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99931 (_ BitVec 32)) Bool)

(assert (=> b!1498462 (= res!1019538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498463 () Bool)

(declare-fun res!1019533 () Bool)

(assert (=> b!1498463 (=> (not res!1019533) (not e!839029))))

(assert (=> b!1498463 (= res!1019533 (validKeyInArray!0 (select (arr!48225 a!2850) i!996)))))

(assert (= (and start!127550 res!1019539) b!1498460))

(assert (= (and b!1498460 res!1019536) b!1498463))

(assert (= (and b!1498463 res!1019533) b!1498457))

(assert (= (and b!1498457 res!1019535) b!1498462))

(assert (= (and b!1498462 res!1019538) b!1498459))

(assert (= (and b!1498459 res!1019537) b!1498461))

(assert (= (and b!1498461 res!1019534) b!1498458))

(declare-fun m!1381567 () Bool)

(assert (=> b!1498462 m!1381567))

(declare-fun m!1381569 () Bool)

(assert (=> start!127550 m!1381569))

(declare-fun m!1381571 () Bool)

(assert (=> start!127550 m!1381571))

(declare-fun m!1381573 () Bool)

(assert (=> b!1498459 m!1381573))

(declare-fun m!1381575 () Bool)

(assert (=> b!1498458 m!1381575))

(assert (=> b!1498458 m!1381575))

(declare-fun m!1381577 () Bool)

(assert (=> b!1498458 m!1381577))

(declare-fun m!1381579 () Bool)

(assert (=> b!1498463 m!1381579))

(assert (=> b!1498463 m!1381579))

(declare-fun m!1381581 () Bool)

(assert (=> b!1498463 m!1381581))

(declare-fun m!1381583 () Bool)

(assert (=> b!1498461 m!1381583))

(declare-fun m!1381585 () Bool)

(assert (=> b!1498461 m!1381585))

(declare-fun m!1381587 () Bool)

(assert (=> b!1498461 m!1381587))

(assert (=> b!1498457 m!1381575))

(assert (=> b!1498457 m!1381575))

(declare-fun m!1381589 () Bool)

(assert (=> b!1498457 m!1381589))

(check-sat (not b!1498457) (not b!1498459) (not b!1498462) (not start!127550) (not b!1498458) (not b!1498463))
