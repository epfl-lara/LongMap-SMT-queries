; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127874 () Bool)

(assert start!127874)

(declare-fun b!1502426 () Bool)

(declare-fun res!1023413 () Bool)

(declare-fun e!840307 () Bool)

(assert (=> b!1502426 (=> (not res!1023413) (not e!840307))))

(declare-datatypes ((array!100222 0))(
  ( (array!100223 (arr!48369 (Array (_ BitVec 32) (_ BitVec 64))) (size!48919 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100222)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502426 (= res!1023413 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48919 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48919 a!2850)) (= (select (arr!48369 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48369 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48919 a!2850))))))

(declare-fun b!1502427 () Bool)

(declare-fun res!1023418 () Bool)

(assert (=> b!1502427 (=> (not res!1023418) (not e!840307))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502427 (= res!1023418 (and (= (size!48919 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48919 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48919 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502428 () Bool)

(declare-fun res!1023412 () Bool)

(assert (=> b!1502428 (=> (not res!1023412) (not e!840307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502428 (= res!1023412 (validKeyInArray!0 (select (arr!48369 a!2850) j!87)))))

(declare-fun b!1502429 () Bool)

(declare-fun res!1023415 () Bool)

(assert (=> b!1502429 (=> (not res!1023415) (not e!840307))))

(declare-datatypes ((List!34861 0))(
  ( (Nil!34858) (Cons!34857 (h!36254 (_ BitVec 64)) (t!49555 List!34861)) )
))
(declare-fun arrayNoDuplicates!0 (array!100222 (_ BitVec 32) List!34861) Bool)

(assert (=> b!1502429 (= res!1023415 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34858))))

(declare-fun b!1502430 () Bool)

(assert (=> b!1502430 (= e!840307 false)))

(declare-datatypes ((SeekEntryResult!12567 0))(
  ( (MissingZero!12567 (index!52660 (_ BitVec 32))) (Found!12567 (index!52661 (_ BitVec 32))) (Intermediate!12567 (undefined!13379 Bool) (index!52662 (_ BitVec 32)) (x!134348 (_ BitVec 32))) (Undefined!12567) (MissingVacant!12567 (index!52663 (_ BitVec 32))) )
))
(declare-fun lt!653377 () SeekEntryResult!12567)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100222 (_ BitVec 32)) SeekEntryResult!12567)

(assert (=> b!1502430 (= lt!653377 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48369 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1023416 () Bool)

(assert (=> start!127874 (=> (not res!1023416) (not e!840307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127874 (= res!1023416 (validMask!0 mask!2661))))

(assert (=> start!127874 e!840307))

(assert (=> start!127874 true))

(declare-fun array_inv!37397 (array!100222) Bool)

(assert (=> start!127874 (array_inv!37397 a!2850)))

(declare-fun b!1502431 () Bool)

(declare-fun res!1023417 () Bool)

(assert (=> b!1502431 (=> (not res!1023417) (not e!840307))))

(assert (=> b!1502431 (= res!1023417 (validKeyInArray!0 (select (arr!48369 a!2850) i!996)))))

(declare-fun b!1502432 () Bool)

(declare-fun res!1023414 () Bool)

(assert (=> b!1502432 (=> (not res!1023414) (not e!840307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100222 (_ BitVec 32)) Bool)

(assert (=> b!1502432 (= res!1023414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127874 res!1023416) b!1502427))

(assert (= (and b!1502427 res!1023418) b!1502431))

(assert (= (and b!1502431 res!1023417) b!1502428))

(assert (= (and b!1502428 res!1023412) b!1502432))

(assert (= (and b!1502432 res!1023414) b!1502429))

(assert (= (and b!1502429 res!1023415) b!1502426))

(assert (= (and b!1502426 res!1023413) b!1502430))

(declare-fun m!1385689 () Bool)

(assert (=> b!1502428 m!1385689))

(assert (=> b!1502428 m!1385689))

(declare-fun m!1385691 () Bool)

(assert (=> b!1502428 m!1385691))

(declare-fun m!1385693 () Bool)

(assert (=> b!1502426 m!1385693))

(declare-fun m!1385695 () Bool)

(assert (=> b!1502426 m!1385695))

(declare-fun m!1385697 () Bool)

(assert (=> b!1502426 m!1385697))

(assert (=> b!1502430 m!1385689))

(assert (=> b!1502430 m!1385689))

(declare-fun m!1385699 () Bool)

(assert (=> b!1502430 m!1385699))

(declare-fun m!1385701 () Bool)

(assert (=> start!127874 m!1385701))

(declare-fun m!1385703 () Bool)

(assert (=> start!127874 m!1385703))

(declare-fun m!1385705 () Bool)

(assert (=> b!1502432 m!1385705))

(declare-fun m!1385707 () Bool)

(assert (=> b!1502429 m!1385707))

(declare-fun m!1385709 () Bool)

(assert (=> b!1502431 m!1385709))

(assert (=> b!1502431 m!1385709))

(declare-fun m!1385711 () Bool)

(assert (=> b!1502431 m!1385711))

(check-sat (not b!1502429) (not b!1502431) (not b!1502430) (not start!127874) (not b!1502428) (not b!1502432))
