; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127978 () Bool)

(assert start!127978)

(declare-fun b!1503471 () Bool)

(declare-fun res!1024351 () Bool)

(declare-fun e!840618 () Bool)

(assert (=> b!1503471 (=> (not res!1024351) (not e!840618))))

(declare-datatypes ((array!100293 0))(
  ( (array!100294 (arr!48403 (Array (_ BitVec 32) (_ BitVec 64))) (size!48953 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100293)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503471 (= res!1024351 (not (= (select (arr!48403 a!2850) index!625) (select (arr!48403 a!2850) j!87))))))

(declare-fun b!1503472 () Bool)

(declare-fun res!1024357 () Bool)

(assert (=> b!1503472 (=> (not res!1024357) (not e!840618))))

(declare-datatypes ((List!34895 0))(
  ( (Nil!34892) (Cons!34891 (h!36288 (_ BitVec 64)) (t!49589 List!34895)) )
))
(declare-fun arrayNoDuplicates!0 (array!100293 (_ BitVec 32) List!34895) Bool)

(assert (=> b!1503472 (= res!1024357 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34892))))

(declare-fun b!1503473 () Bool)

(declare-fun res!1024354 () Bool)

(assert (=> b!1503473 (=> (not res!1024354) (not e!840618))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503473 (= res!1024354 (and (= (size!48953 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48953 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48953 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503474 () Bool)

(declare-fun res!1024356 () Bool)

(assert (=> b!1503474 (=> (not res!1024356) (not e!840618))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12601 0))(
  ( (MissingZero!12601 (index!52796 (_ BitVec 32))) (Found!12601 (index!52797 (_ BitVec 32))) (Intermediate!12601 (undefined!13413 Bool) (index!52798 (_ BitVec 32)) (x!134473 (_ BitVec 32))) (Undefined!12601) (MissingVacant!12601 (index!52799 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100293 (_ BitVec 32)) SeekEntryResult!12601)

(assert (=> b!1503474 (= res!1024356 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48403 a!2850) j!87) a!2850 mask!2661) (Found!12601 j!87)))))

(declare-fun b!1503475 () Bool)

(declare-fun res!1024352 () Bool)

(assert (=> b!1503475 (=> (not res!1024352) (not e!840618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100293 (_ BitVec 32)) Bool)

(assert (=> b!1503475 (= res!1024352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503476 () Bool)

(declare-fun res!1024355 () Bool)

(assert (=> b!1503476 (=> (not res!1024355) (not e!840618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503476 (= res!1024355 (validKeyInArray!0 (select (arr!48403 a!2850) i!996)))))

(declare-fun res!1024353 () Bool)

(assert (=> start!127978 (=> (not res!1024353) (not e!840618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127978 (= res!1024353 (validMask!0 mask!2661))))

(assert (=> start!127978 e!840618))

(assert (=> start!127978 true))

(declare-fun array_inv!37431 (array!100293) Bool)

(assert (=> start!127978 (array_inv!37431 a!2850)))

(declare-fun b!1503477 () Bool)

(assert (=> b!1503477 (= e!840618 false)))

(declare-fun lt!653530 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503477 (= lt!653530 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503478 () Bool)

(declare-fun res!1024349 () Bool)

(assert (=> b!1503478 (=> (not res!1024349) (not e!840618))))

(assert (=> b!1503478 (= res!1024349 (validKeyInArray!0 (select (arr!48403 a!2850) j!87)))))

(declare-fun b!1503479 () Bool)

(declare-fun res!1024350 () Bool)

(assert (=> b!1503479 (=> (not res!1024350) (not e!840618))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503479 (= res!1024350 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48953 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48953 a!2850)) (= (select (arr!48403 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48403 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48953 a!2850))))))

(assert (= (and start!127978 res!1024353) b!1503473))

(assert (= (and b!1503473 res!1024354) b!1503476))

(assert (= (and b!1503476 res!1024355) b!1503478))

(assert (= (and b!1503478 res!1024349) b!1503475))

(assert (= (and b!1503475 res!1024352) b!1503472))

(assert (= (and b!1503472 res!1024357) b!1503479))

(assert (= (and b!1503479 res!1024350) b!1503474))

(assert (= (and b!1503474 res!1024356) b!1503471))

(assert (= (and b!1503471 res!1024351) b!1503477))

(declare-fun m!1386723 () Bool)

(assert (=> b!1503477 m!1386723))

(declare-fun m!1386725 () Bool)

(assert (=> b!1503472 m!1386725))

(declare-fun m!1386727 () Bool)

(assert (=> b!1503476 m!1386727))

(assert (=> b!1503476 m!1386727))

(declare-fun m!1386729 () Bool)

(assert (=> b!1503476 m!1386729))

(declare-fun m!1386731 () Bool)

(assert (=> start!127978 m!1386731))

(declare-fun m!1386733 () Bool)

(assert (=> start!127978 m!1386733))

(declare-fun m!1386735 () Bool)

(assert (=> b!1503478 m!1386735))

(assert (=> b!1503478 m!1386735))

(declare-fun m!1386737 () Bool)

(assert (=> b!1503478 m!1386737))

(declare-fun m!1386739 () Bool)

(assert (=> b!1503479 m!1386739))

(declare-fun m!1386741 () Bool)

(assert (=> b!1503479 m!1386741))

(declare-fun m!1386743 () Bool)

(assert (=> b!1503479 m!1386743))

(declare-fun m!1386745 () Bool)

(assert (=> b!1503475 m!1386745))

(assert (=> b!1503474 m!1386735))

(assert (=> b!1503474 m!1386735))

(declare-fun m!1386747 () Bool)

(assert (=> b!1503474 m!1386747))

(declare-fun m!1386749 () Bool)

(assert (=> b!1503471 m!1386749))

(assert (=> b!1503471 m!1386735))

(push 1)

(assert (not b!1503477))

(assert (not b!1503476))

(assert (not b!1503478))

(assert (not b!1503474))

(assert (not start!127978))

(assert (not b!1503472))

(assert (not b!1503475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

