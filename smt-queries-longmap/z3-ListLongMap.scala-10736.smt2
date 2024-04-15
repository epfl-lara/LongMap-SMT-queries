; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125524 () Bool)

(assert start!125524)

(declare-fun b!1468798 () Bool)

(declare-fun res!997458 () Bool)

(declare-fun e!824651 () Bool)

(assert (=> b!1468798 (=> (not res!997458) (not e!824651))))

(declare-datatypes ((array!98950 0))(
  ( (array!98951 (arr!47764 (Array (_ BitVec 32) (_ BitVec 64))) (size!48316 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98950)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98950 (_ BitVec 32)) Bool)

(assert (=> b!1468798 (= res!997458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468799 () Bool)

(declare-fun res!997460 () Bool)

(assert (=> b!1468799 (=> (not res!997460) (not e!824651))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468799 (= res!997460 (validKeyInArray!0 (select (arr!47764 a!2862) j!93)))))

(declare-fun res!997461 () Bool)

(assert (=> start!125524 (=> (not res!997461) (not e!824651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125524 (= res!997461 (validMask!0 mask!2687))))

(assert (=> start!125524 e!824651))

(assert (=> start!125524 true))

(declare-fun array_inv!36997 (array!98950) Bool)

(assert (=> start!125524 (array_inv!36997 a!2862)))

(declare-fun b!1468800 () Bool)

(declare-fun res!997456 () Bool)

(assert (=> b!1468800 (=> (not res!997456) (not e!824651))))

(declare-datatypes ((List!34343 0))(
  ( (Nil!34340) (Cons!34339 (h!35689 (_ BitVec 64)) (t!49029 List!34343)) )
))
(declare-fun arrayNoDuplicates!0 (array!98950 (_ BitVec 32) List!34343) Bool)

(assert (=> b!1468800 (= res!997456 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34340))))

(declare-fun b!1468801 () Bool)

(declare-fun res!997462 () Bool)

(assert (=> b!1468801 (=> (not res!997462) (not e!824651))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468801 (= res!997462 (and (= (size!48316 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48316 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48316 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468802 () Bool)

(declare-fun res!997455 () Bool)

(assert (=> b!1468802 (=> (not res!997455) (not e!824651))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468802 (= res!997455 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48316 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48316 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48316 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468803 () Bool)

(declare-fun e!824652 () Bool)

(assert (=> b!1468803 (= e!824652 false)))

(declare-datatypes ((SeekEntryResult!12029 0))(
  ( (MissingZero!12029 (index!50508 (_ BitVec 32))) (Found!12029 (index!50509 (_ BitVec 32))) (Intermediate!12029 (undefined!12841 Bool) (index!50510 (_ BitVec 32)) (x!132089 (_ BitVec 32))) (Undefined!12029) (MissingVacant!12029 (index!50511 (_ BitVec 32))) )
))
(declare-fun lt!642180 () SeekEntryResult!12029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98950 (_ BitVec 32)) SeekEntryResult!12029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468803 (= lt!642180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98951 (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48316 a!2862)) mask!2687))))

(declare-fun b!1468804 () Bool)

(declare-fun res!997457 () Bool)

(assert (=> b!1468804 (=> (not res!997457) (not e!824651))))

(assert (=> b!1468804 (= res!997457 (validKeyInArray!0 (select (arr!47764 a!2862) i!1006)))))

(declare-fun b!1468805 () Bool)

(declare-fun res!997454 () Bool)

(assert (=> b!1468805 (=> (not res!997454) (not e!824652))))

(declare-fun lt!642179 () SeekEntryResult!12029)

(assert (=> b!1468805 (= res!997454 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642179))))

(declare-fun b!1468806 () Bool)

(assert (=> b!1468806 (= e!824651 e!824652)))

(declare-fun res!997459 () Bool)

(assert (=> b!1468806 (=> (not res!997459) (not e!824652))))

(assert (=> b!1468806 (= res!997459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47764 a!2862) j!93) mask!2687) (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642179))))

(assert (=> b!1468806 (= lt!642179 (Intermediate!12029 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125524 res!997461) b!1468801))

(assert (= (and b!1468801 res!997462) b!1468804))

(assert (= (and b!1468804 res!997457) b!1468799))

(assert (= (and b!1468799 res!997460) b!1468798))

(assert (= (and b!1468798 res!997458) b!1468800))

(assert (= (and b!1468800 res!997456) b!1468802))

(assert (= (and b!1468802 res!997455) b!1468806))

(assert (= (and b!1468806 res!997459) b!1468805))

(assert (= (and b!1468805 res!997454) b!1468803))

(declare-fun m!1355481 () Bool)

(assert (=> b!1468802 m!1355481))

(declare-fun m!1355483 () Bool)

(assert (=> b!1468802 m!1355483))

(declare-fun m!1355485 () Bool)

(assert (=> start!125524 m!1355485))

(declare-fun m!1355487 () Bool)

(assert (=> start!125524 m!1355487))

(declare-fun m!1355489 () Bool)

(assert (=> b!1468799 m!1355489))

(assert (=> b!1468799 m!1355489))

(declare-fun m!1355491 () Bool)

(assert (=> b!1468799 m!1355491))

(declare-fun m!1355493 () Bool)

(assert (=> b!1468798 m!1355493))

(declare-fun m!1355495 () Bool)

(assert (=> b!1468804 m!1355495))

(assert (=> b!1468804 m!1355495))

(declare-fun m!1355497 () Bool)

(assert (=> b!1468804 m!1355497))

(assert (=> b!1468803 m!1355481))

(declare-fun m!1355499 () Bool)

(assert (=> b!1468803 m!1355499))

(assert (=> b!1468803 m!1355499))

(declare-fun m!1355501 () Bool)

(assert (=> b!1468803 m!1355501))

(assert (=> b!1468803 m!1355501))

(assert (=> b!1468803 m!1355499))

(declare-fun m!1355503 () Bool)

(assert (=> b!1468803 m!1355503))

(assert (=> b!1468805 m!1355489))

(assert (=> b!1468805 m!1355489))

(declare-fun m!1355505 () Bool)

(assert (=> b!1468805 m!1355505))

(declare-fun m!1355507 () Bool)

(assert (=> b!1468800 m!1355507))

(assert (=> b!1468806 m!1355489))

(assert (=> b!1468806 m!1355489))

(declare-fun m!1355509 () Bool)

(assert (=> b!1468806 m!1355509))

(assert (=> b!1468806 m!1355509))

(assert (=> b!1468806 m!1355489))

(declare-fun m!1355511 () Bool)

(assert (=> b!1468806 m!1355511))

(check-sat (not b!1468798) (not b!1468799) (not b!1468803) (not b!1468800) (not b!1468805) (not start!125524) (not b!1468804) (not b!1468806))
(check-sat)
