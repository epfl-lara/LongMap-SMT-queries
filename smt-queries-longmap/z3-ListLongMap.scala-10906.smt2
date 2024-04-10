; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127700 () Bool)

(assert start!127700)

(declare-fun b!1500461 () Bool)

(declare-fun e!839602 () Bool)

(declare-fun e!839601 () Bool)

(assert (=> b!1500461 (= e!839602 e!839601)))

(declare-fun res!1021545 () Bool)

(assert (=> b!1500461 (=> (not res!1021545) (not e!839601))))

(declare-datatypes ((array!100081 0))(
  ( (array!100082 (arr!48300 (Array (_ BitVec 32) (_ BitVec 64))) (size!48850 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100081)

(declare-fun lt!652941 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500461 (= res!1021545 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652941 #b00000000000000000000000000000000) (bvslt lt!652941 (size!48850 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500461 (= lt!652941 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500462 () Bool)

(declare-fun res!1021546 () Bool)

(assert (=> b!1500462 (=> (not res!1021546) (not e!839602))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500462 (= res!1021546 (not (= (select (arr!48300 a!2850) index!625) (select (arr!48300 a!2850) j!87))))))

(declare-fun b!1500463 () Bool)

(assert (=> b!1500463 (= e!839601 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12510 0))(
  ( (MissingZero!12510 (index!52432 (_ BitVec 32))) (Found!12510 (index!52433 (_ BitVec 32))) (Intermediate!12510 (undefined!13322 Bool) (index!52434 (_ BitVec 32)) (x!134104 (_ BitVec 32))) (Undefined!12510) (MissingVacant!12510 (index!52435 (_ BitVec 32))) )
))
(declare-fun lt!652942 () SeekEntryResult!12510)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100081 (_ BitVec 32)) SeekEntryResult!12510)

(assert (=> b!1500463 (= lt!652942 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652941 vacantBefore!10 (select (arr!48300 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500464 () Bool)

(declare-fun res!1021539 () Bool)

(assert (=> b!1500464 (=> (not res!1021539) (not e!839602))))

(declare-datatypes ((List!34792 0))(
  ( (Nil!34789) (Cons!34788 (h!36185 (_ BitVec 64)) (t!49486 List!34792)) )
))
(declare-fun arrayNoDuplicates!0 (array!100081 (_ BitVec 32) List!34792) Bool)

(assert (=> b!1500464 (= res!1021539 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34789))))

(declare-fun b!1500465 () Bool)

(declare-fun res!1021544 () Bool)

(assert (=> b!1500465 (=> (not res!1021544) (not e!839602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500465 (= res!1021544 (validKeyInArray!0 (select (arr!48300 a!2850) j!87)))))

(declare-fun res!1021541 () Bool)

(assert (=> start!127700 (=> (not res!1021541) (not e!839602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127700 (= res!1021541 (validMask!0 mask!2661))))

(assert (=> start!127700 e!839602))

(assert (=> start!127700 true))

(declare-fun array_inv!37328 (array!100081) Bool)

(assert (=> start!127700 (array_inv!37328 a!2850)))

(declare-fun b!1500466 () Bool)

(declare-fun res!1021540 () Bool)

(assert (=> b!1500466 (=> (not res!1021540) (not e!839602))))

(assert (=> b!1500466 (= res!1021540 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48300 a!2850) j!87) a!2850 mask!2661) (Found!12510 j!87)))))

(declare-fun b!1500467 () Bool)

(declare-fun res!1021542 () Bool)

(assert (=> b!1500467 (=> (not res!1021542) (not e!839602))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500467 (= res!1021542 (validKeyInArray!0 (select (arr!48300 a!2850) i!996)))))

(declare-fun b!1500468 () Bool)

(declare-fun res!1021538 () Bool)

(assert (=> b!1500468 (=> (not res!1021538) (not e!839602))))

(assert (=> b!1500468 (= res!1021538 (and (= (size!48850 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48850 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48850 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500469 () Bool)

(declare-fun res!1021537 () Bool)

(assert (=> b!1500469 (=> (not res!1021537) (not e!839602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100081 (_ BitVec 32)) Bool)

(assert (=> b!1500469 (= res!1021537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500470 () Bool)

(declare-fun res!1021543 () Bool)

(assert (=> b!1500470 (=> (not res!1021543) (not e!839602))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500470 (= res!1021543 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48850 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48850 a!2850)) (= (select (arr!48300 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48300 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48850 a!2850))))))

(assert (= (and start!127700 res!1021541) b!1500468))

(assert (= (and b!1500468 res!1021538) b!1500467))

(assert (= (and b!1500467 res!1021542) b!1500465))

(assert (= (and b!1500465 res!1021544) b!1500469))

(assert (= (and b!1500469 res!1021537) b!1500464))

(assert (= (and b!1500464 res!1021539) b!1500470))

(assert (= (and b!1500470 res!1021543) b!1500466))

(assert (= (and b!1500466 res!1021540) b!1500462))

(assert (= (and b!1500462 res!1021546) b!1500461))

(assert (= (and b!1500461 res!1021545) b!1500463))

(declare-fun m!1383655 () Bool)

(assert (=> b!1500461 m!1383655))

(declare-fun m!1383657 () Bool)

(assert (=> b!1500462 m!1383657))

(declare-fun m!1383659 () Bool)

(assert (=> b!1500462 m!1383659))

(declare-fun m!1383661 () Bool)

(assert (=> b!1500469 m!1383661))

(declare-fun m!1383663 () Bool)

(assert (=> b!1500467 m!1383663))

(assert (=> b!1500467 m!1383663))

(declare-fun m!1383665 () Bool)

(assert (=> b!1500467 m!1383665))

(declare-fun m!1383667 () Bool)

(assert (=> b!1500470 m!1383667))

(declare-fun m!1383669 () Bool)

(assert (=> b!1500470 m!1383669))

(declare-fun m!1383671 () Bool)

(assert (=> b!1500470 m!1383671))

(assert (=> b!1500463 m!1383659))

(assert (=> b!1500463 m!1383659))

(declare-fun m!1383673 () Bool)

(assert (=> b!1500463 m!1383673))

(assert (=> b!1500465 m!1383659))

(assert (=> b!1500465 m!1383659))

(declare-fun m!1383675 () Bool)

(assert (=> b!1500465 m!1383675))

(declare-fun m!1383677 () Bool)

(assert (=> b!1500464 m!1383677))

(assert (=> b!1500466 m!1383659))

(assert (=> b!1500466 m!1383659))

(declare-fun m!1383679 () Bool)

(assert (=> b!1500466 m!1383679))

(declare-fun m!1383681 () Bool)

(assert (=> start!127700 m!1383681))

(declare-fun m!1383683 () Bool)

(assert (=> start!127700 m!1383683))

(check-sat (not b!1500463) (not b!1500466) (not b!1500467) (not b!1500469) (not b!1500464) (not b!1500465) (not b!1500461) (not start!127700))
