; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125454 () Bool)

(assert start!125454)

(declare-fun b!1467665 () Bool)

(declare-fun res!996211 () Bool)

(declare-fun e!824338 () Bool)

(assert (=> b!1467665 (=> (not res!996211) (not e!824338))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((array!98902 0))(
  ( (array!98903 (arr!47739 (Array (_ BitVec 32) (_ BitVec 64))) (size!48289 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98902)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11979 0))(
  ( (MissingZero!11979 (index!50308 (_ BitVec 32))) (Found!11979 (index!50309 (_ BitVec 32))) (Intermediate!11979 (undefined!12791 Bool) (index!50310 (_ BitVec 32)) (x!131908 (_ BitVec 32))) (Undefined!11979) (MissingVacant!11979 (index!50311 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98902 (_ BitVec 32)) SeekEntryResult!11979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467665 (= res!996211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47739 a!2862) j!93) mask!2687) (select (arr!47739 a!2862) j!93) a!2862 mask!2687) (Intermediate!11979 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467666 () Bool)

(declare-fun res!996206 () Bool)

(assert (=> b!1467666 (=> (not res!996206) (not e!824338))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467666 (= res!996206 (validKeyInArray!0 (select (arr!47739 a!2862) i!1006)))))

(declare-fun b!1467667 () Bool)

(declare-fun res!996210 () Bool)

(assert (=> b!1467667 (=> (not res!996210) (not e!824338))))

(assert (=> b!1467667 (= res!996210 (and (= (size!48289 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48289 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48289 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467668 () Bool)

(declare-fun res!996208 () Bool)

(assert (=> b!1467668 (=> (not res!996208) (not e!824338))))

(declare-datatypes ((List!34240 0))(
  ( (Nil!34237) (Cons!34236 (h!35586 (_ BitVec 64)) (t!48934 List!34240)) )
))
(declare-fun arrayNoDuplicates!0 (array!98902 (_ BitVec 32) List!34240) Bool)

(assert (=> b!1467668 (= res!996208 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34237))))

(declare-fun res!996209 () Bool)

(assert (=> start!125454 (=> (not res!996209) (not e!824338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125454 (= res!996209 (validMask!0 mask!2687))))

(assert (=> start!125454 e!824338))

(assert (=> start!125454 true))

(declare-fun array_inv!36767 (array!98902) Bool)

(assert (=> start!125454 (array_inv!36767 a!2862)))

(declare-fun b!1467669 () Bool)

(declare-fun res!996204 () Bool)

(assert (=> b!1467669 (=> (not res!996204) (not e!824338))))

(assert (=> b!1467669 (= res!996204 (validKeyInArray!0 (select (arr!47739 a!2862) j!93)))))

(declare-fun b!1467670 () Bool)

(assert (=> b!1467670 (= e!824338 false)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642135 () SeekEntryResult!11979)

(assert (=> b!1467670 (= lt!642135 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47739 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467671 () Bool)

(declare-fun res!996207 () Bool)

(assert (=> b!1467671 (=> (not res!996207) (not e!824338))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467671 (= res!996207 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48289 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48289 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48289 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47739 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467672 () Bool)

(declare-fun res!996205 () Bool)

(assert (=> b!1467672 (=> (not res!996205) (not e!824338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98902 (_ BitVec 32)) Bool)

(assert (=> b!1467672 (= res!996205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125454 res!996209) b!1467667))

(assert (= (and b!1467667 res!996210) b!1467666))

(assert (= (and b!1467666 res!996206) b!1467669))

(assert (= (and b!1467669 res!996204) b!1467672))

(assert (= (and b!1467672 res!996205) b!1467668))

(assert (= (and b!1467668 res!996208) b!1467671))

(assert (= (and b!1467671 res!996207) b!1467665))

(assert (= (and b!1467665 res!996211) b!1467670))

(declare-fun m!1354617 () Bool)

(assert (=> b!1467665 m!1354617))

(assert (=> b!1467665 m!1354617))

(declare-fun m!1354619 () Bool)

(assert (=> b!1467665 m!1354619))

(assert (=> b!1467665 m!1354619))

(assert (=> b!1467665 m!1354617))

(declare-fun m!1354621 () Bool)

(assert (=> b!1467665 m!1354621))

(declare-fun m!1354623 () Bool)

(assert (=> b!1467666 m!1354623))

(assert (=> b!1467666 m!1354623))

(declare-fun m!1354625 () Bool)

(assert (=> b!1467666 m!1354625))

(assert (=> b!1467669 m!1354617))

(assert (=> b!1467669 m!1354617))

(declare-fun m!1354627 () Bool)

(assert (=> b!1467669 m!1354627))

(declare-fun m!1354629 () Bool)

(assert (=> start!125454 m!1354629))

(declare-fun m!1354631 () Bool)

(assert (=> start!125454 m!1354631))

(assert (=> b!1467670 m!1354617))

(assert (=> b!1467670 m!1354617))

(declare-fun m!1354633 () Bool)

(assert (=> b!1467670 m!1354633))

(declare-fun m!1354635 () Bool)

(assert (=> b!1467671 m!1354635))

(declare-fun m!1354637 () Bool)

(assert (=> b!1467671 m!1354637))

(declare-fun m!1354639 () Bool)

(assert (=> b!1467672 m!1354639))

(declare-fun m!1354641 () Bool)

(assert (=> b!1467668 m!1354641))

(check-sat (not b!1467669) (not start!125454) (not b!1467670) (not b!1467672) (not b!1467665) (not b!1467668) (not b!1467666))
