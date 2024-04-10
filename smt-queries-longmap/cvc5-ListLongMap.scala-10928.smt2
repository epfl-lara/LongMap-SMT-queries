; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127866 () Bool)

(assert start!127866)

(declare-fun b!1502342 () Bool)

(declare-fun res!1023328 () Bool)

(declare-fun e!840282 () Bool)

(assert (=> b!1502342 (=> (not res!1023328) (not e!840282))))

(declare-datatypes ((array!100214 0))(
  ( (array!100215 (arr!48365 (Array (_ BitVec 32) (_ BitVec 64))) (size!48915 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100214)

(declare-datatypes ((List!34857 0))(
  ( (Nil!34854) (Cons!34853 (h!36250 (_ BitVec 64)) (t!49551 List!34857)) )
))
(declare-fun arrayNoDuplicates!0 (array!100214 (_ BitVec 32) List!34857) Bool)

(assert (=> b!1502342 (= res!1023328 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34854))))

(declare-fun b!1502343 () Bool)

(declare-fun res!1023330 () Bool)

(assert (=> b!1502343 (=> (not res!1023330) (not e!840282))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100214 (_ BitVec 32)) Bool)

(assert (=> b!1502343 (= res!1023330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502344 () Bool)

(declare-fun res!1023329 () Bool)

(assert (=> b!1502344 (=> (not res!1023329) (not e!840282))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502344 (= res!1023329 (and (= (size!48915 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48915 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48915 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502345 () Bool)

(declare-fun res!1023334 () Bool)

(assert (=> b!1502345 (=> (not res!1023334) (not e!840282))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502345 (= res!1023334 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48915 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48915 a!2850)) (= (select (arr!48365 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48365 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48915 a!2850))))))

(declare-fun res!1023333 () Bool)

(assert (=> start!127866 (=> (not res!1023333) (not e!840282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127866 (= res!1023333 (validMask!0 mask!2661))))

(assert (=> start!127866 e!840282))

(assert (=> start!127866 true))

(declare-fun array_inv!37393 (array!100214) Bool)

(assert (=> start!127866 (array_inv!37393 a!2850)))

(declare-fun b!1502346 () Bool)

(declare-fun res!1023332 () Bool)

(assert (=> b!1502346 (=> (not res!1023332) (not e!840282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502346 (= res!1023332 (validKeyInArray!0 (select (arr!48365 a!2850) i!996)))))

(declare-fun b!1502347 () Bool)

(declare-fun res!1023331 () Bool)

(assert (=> b!1502347 (=> (not res!1023331) (not e!840282))))

(assert (=> b!1502347 (= res!1023331 (validKeyInArray!0 (select (arr!48365 a!2850) j!87)))))

(declare-fun b!1502348 () Bool)

(assert (=> b!1502348 (= e!840282 false)))

(declare-datatypes ((SeekEntryResult!12563 0))(
  ( (MissingZero!12563 (index!52644 (_ BitVec 32))) (Found!12563 (index!52645 (_ BitVec 32))) (Intermediate!12563 (undefined!13375 Bool) (index!52646 (_ BitVec 32)) (x!134336 (_ BitVec 32))) (Undefined!12563) (MissingVacant!12563 (index!52647 (_ BitVec 32))) )
))
(declare-fun lt!653365 () SeekEntryResult!12563)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100214 (_ BitVec 32)) SeekEntryResult!12563)

(assert (=> b!1502348 (= lt!653365 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48365 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127866 res!1023333) b!1502344))

(assert (= (and b!1502344 res!1023329) b!1502346))

(assert (= (and b!1502346 res!1023332) b!1502347))

(assert (= (and b!1502347 res!1023331) b!1502343))

(assert (= (and b!1502343 res!1023330) b!1502342))

(assert (= (and b!1502342 res!1023328) b!1502345))

(assert (= (and b!1502345 res!1023334) b!1502348))

(declare-fun m!1385593 () Bool)

(assert (=> start!127866 m!1385593))

(declare-fun m!1385595 () Bool)

(assert (=> start!127866 m!1385595))

(declare-fun m!1385597 () Bool)

(assert (=> b!1502346 m!1385597))

(assert (=> b!1502346 m!1385597))

(declare-fun m!1385599 () Bool)

(assert (=> b!1502346 m!1385599))

(declare-fun m!1385601 () Bool)

(assert (=> b!1502345 m!1385601))

(declare-fun m!1385603 () Bool)

(assert (=> b!1502345 m!1385603))

(declare-fun m!1385605 () Bool)

(assert (=> b!1502345 m!1385605))

(declare-fun m!1385607 () Bool)

(assert (=> b!1502348 m!1385607))

(assert (=> b!1502348 m!1385607))

(declare-fun m!1385609 () Bool)

(assert (=> b!1502348 m!1385609))

(assert (=> b!1502347 m!1385607))

(assert (=> b!1502347 m!1385607))

(declare-fun m!1385611 () Bool)

(assert (=> b!1502347 m!1385611))

(declare-fun m!1385613 () Bool)

(assert (=> b!1502343 m!1385613))

(declare-fun m!1385615 () Bool)

(assert (=> b!1502342 m!1385615))

(push 1)

(assert (not b!1502343))

(assert (not b!1502347))

(assert (not b!1502342))

(assert (not start!127866))

(assert (not b!1502348))

(assert (not b!1502346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

