; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129980 () Bool)

(assert start!129980)

(declare-fun b!1523753 () Bool)

(declare-fun e!849933 () Bool)

(declare-fun e!849932 () Bool)

(assert (=> b!1523753 (= e!849933 e!849932)))

(declare-fun res!1041557 () Bool)

(assert (=> b!1523753 (=> (not res!1041557) (not e!849932))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101404 0))(
  ( (array!101405 (arr!48928 (Array (_ BitVec 32) (_ BitVec 64))) (size!49479 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101404)

(declare-datatypes ((SeekEntryResult!12986 0))(
  ( (MissingZero!12986 (index!54339 (_ BitVec 32))) (Found!12986 (index!54340 (_ BitVec 32))) (Intermediate!12986 (undefined!13798 Bool) (index!54341 (_ BitVec 32)) (x!136243 (_ BitVec 32))) (Undefined!12986) (MissingVacant!12986 (index!54342 (_ BitVec 32))) )
))
(declare-fun lt!660213 () SeekEntryResult!12986)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101404 (_ BitVec 32)) SeekEntryResult!12986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523753 (= res!1041557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48928 a!2804) j!70) mask!2512) (select (arr!48928 a!2804) j!70) a!2804 mask!2512) lt!660213))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523753 (= lt!660213 (Intermediate!12986 false resIndex!21 resX!21))))

(declare-fun b!1523754 () Bool)

(declare-fun res!1041552 () Bool)

(assert (=> b!1523754 (=> (not res!1041552) (not e!849933))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523754 (= res!1041552 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49479 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49479 a!2804))))))

(declare-fun b!1523755 () Bool)

(declare-fun res!1041554 () Bool)

(assert (=> b!1523755 (=> (not res!1041554) (not e!849933))))

(declare-datatypes ((List!35398 0))(
  ( (Nil!35395) (Cons!35394 (h!36833 (_ BitVec 64)) (t!50084 List!35398)) )
))
(declare-fun arrayNoDuplicates!0 (array!101404 (_ BitVec 32) List!35398) Bool)

(assert (=> b!1523755 (= res!1041554 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35395))))

(declare-fun b!1523756 () Bool)

(declare-fun res!1041550 () Bool)

(assert (=> b!1523756 (=> (not res!1041550) (not e!849933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523756 (= res!1041550 (validKeyInArray!0 (select (arr!48928 a!2804) j!70)))))

(declare-fun b!1523757 () Bool)

(declare-fun res!1041556 () Bool)

(assert (=> b!1523757 (=> (not res!1041556) (not e!849932))))

(assert (=> b!1523757 (= res!1041556 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) lt!660213))))

(declare-fun b!1523758 () Bool)

(declare-fun res!1041549 () Bool)

(assert (=> b!1523758 (=> (not res!1041549) (not e!849933))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523758 (= res!1041549 (validKeyInArray!0 (select (arr!48928 a!2804) i!961)))))

(declare-fun b!1523759 () Bool)

(assert (=> b!1523759 (= e!849932 false)))

(declare-fun lt!660214 () (_ BitVec 32))

(assert (=> b!1523759 (= lt!660214 (toIndex!0 (select (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1523761 () Bool)

(declare-fun res!1041553 () Bool)

(assert (=> b!1523761 (=> (not res!1041553) (not e!849933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101404 (_ BitVec 32)) Bool)

(assert (=> b!1523761 (= res!1041553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523760 () Bool)

(declare-fun res!1041551 () Bool)

(assert (=> b!1523760 (=> (not res!1041551) (not e!849933))))

(assert (=> b!1523760 (= res!1041551 (and (= (size!49479 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49479 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49479 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1041555 () Bool)

(assert (=> start!129980 (=> (not res!1041555) (not e!849933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129980 (= res!1041555 (validMask!0 mask!2512))))

(assert (=> start!129980 e!849933))

(assert (=> start!129980 true))

(declare-fun array_inv!38209 (array!101404) Bool)

(assert (=> start!129980 (array_inv!38209 a!2804)))

(assert (= (and start!129980 res!1041555) b!1523760))

(assert (= (and b!1523760 res!1041551) b!1523758))

(assert (= (and b!1523758 res!1041549) b!1523756))

(assert (= (and b!1523756 res!1041550) b!1523761))

(assert (= (and b!1523761 res!1041553) b!1523755))

(assert (= (and b!1523755 res!1041554) b!1523754))

(assert (= (and b!1523754 res!1041552) b!1523753))

(assert (= (and b!1523753 res!1041557) b!1523757))

(assert (= (and b!1523757 res!1041556) b!1523759))

(declare-fun m!1406703 () Bool)

(assert (=> b!1523757 m!1406703))

(assert (=> b!1523757 m!1406703))

(declare-fun m!1406705 () Bool)

(assert (=> b!1523757 m!1406705))

(declare-fun m!1406707 () Bool)

(assert (=> start!129980 m!1406707))

(declare-fun m!1406709 () Bool)

(assert (=> start!129980 m!1406709))

(declare-fun m!1406711 () Bool)

(assert (=> b!1523761 m!1406711))

(assert (=> b!1523756 m!1406703))

(assert (=> b!1523756 m!1406703))

(declare-fun m!1406713 () Bool)

(assert (=> b!1523756 m!1406713))

(declare-fun m!1406715 () Bool)

(assert (=> b!1523755 m!1406715))

(declare-fun m!1406717 () Bool)

(assert (=> b!1523759 m!1406717))

(declare-fun m!1406719 () Bool)

(assert (=> b!1523759 m!1406719))

(assert (=> b!1523759 m!1406719))

(declare-fun m!1406721 () Bool)

(assert (=> b!1523759 m!1406721))

(declare-fun m!1406723 () Bool)

(assert (=> b!1523758 m!1406723))

(assert (=> b!1523758 m!1406723))

(declare-fun m!1406725 () Bool)

(assert (=> b!1523758 m!1406725))

(assert (=> b!1523753 m!1406703))

(assert (=> b!1523753 m!1406703))

(declare-fun m!1406727 () Bool)

(assert (=> b!1523753 m!1406727))

(assert (=> b!1523753 m!1406727))

(assert (=> b!1523753 m!1406703))

(declare-fun m!1406729 () Bool)

(assert (=> b!1523753 m!1406729))

(check-sat (not b!1523758) (not start!129980) (not b!1523753) (not b!1523761) (not b!1523757) (not b!1523759) (not b!1523755) (not b!1523756))
(check-sat)
