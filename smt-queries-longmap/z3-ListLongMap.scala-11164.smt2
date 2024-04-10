; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130528 () Bool)

(assert start!130528)

(declare-fun b!1531747 () Bool)

(declare-fun e!853489 () Bool)

(declare-fun e!853485 () Bool)

(assert (=> b!1531747 (= e!853489 e!853485)))

(declare-fun res!1048899 () Bool)

(assert (=> b!1531747 (=> (not res!1048899) (not e!853485))))

(declare-datatypes ((SeekEntryResult!13239 0))(
  ( (MissingZero!13239 (index!55351 (_ BitVec 32))) (Found!13239 (index!55352 (_ BitVec 32))) (Intermediate!13239 (undefined!14051 Bool) (index!55353 (_ BitVec 32)) (x!137049 (_ BitVec 32))) (Undefined!13239) (MissingVacant!13239 (index!55354 (_ BitVec 32))) )
))
(declare-fun lt!663362 () SeekEntryResult!13239)

(declare-fun lt!663363 () SeekEntryResult!13239)

(assert (=> b!1531747 (= res!1048899 (= lt!663362 lt!663363))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531747 (= lt!663363 (Intermediate!13239 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101707 0))(
  ( (array!101708 (arr!49074 (Array (_ BitVec 32) (_ BitVec 64))) (size!49624 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101707 (_ BitVec 32)) SeekEntryResult!13239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531747 (= lt!663362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49074 a!2804) j!70) mask!2512) (select (arr!49074 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531748 () Bool)

(declare-fun res!1048895 () Bool)

(assert (=> b!1531748 (=> (not res!1048895) (not e!853489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101707 (_ BitVec 32)) Bool)

(assert (=> b!1531748 (= res!1048895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!853487 () Bool)

(declare-fun b!1531749 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101707 (_ BitVec 32)) SeekEntryResult!13239)

(assert (=> b!1531749 (= e!853487 (= (seekEntry!0 (select (arr!49074 a!2804) j!70) a!2804 mask!2512) (Found!13239 j!70)))))

(declare-fun b!1531750 () Bool)

(declare-fun e!853486 () Bool)

(declare-fun e!853484 () Bool)

(assert (=> b!1531750 (= e!853486 e!853484)))

(declare-fun res!1048887 () Bool)

(assert (=> b!1531750 (=> res!1048887 e!853484)))

(declare-fun lt!663358 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531750 (= res!1048887 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663358 #b00000000000000000000000000000000) (bvsge lt!663358 (size!49624 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531750 (= lt!663358 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531751 () Bool)

(declare-fun e!853488 () Bool)

(assert (=> b!1531751 (= e!853488 (not e!853486))))

(declare-fun res!1048892 () Bool)

(assert (=> b!1531751 (=> res!1048892 e!853486)))

(declare-fun lt!663359 () (_ BitVec 64))

(assert (=> b!1531751 (= res!1048892 (or (not (= (select (arr!49074 a!2804) j!70) lt!663359)) (= x!534 resX!21)))))

(assert (=> b!1531751 e!853487))

(declare-fun res!1048900 () Bool)

(assert (=> b!1531751 (=> (not res!1048900) (not e!853487))))

(assert (=> b!1531751 (= res!1048900 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51262 0))(
  ( (Unit!51263) )
))
(declare-fun lt!663360 () Unit!51262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51262)

(assert (=> b!1531751 (= lt!663360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531752 () Bool)

(declare-fun res!1048888 () Bool)

(assert (=> b!1531752 (=> (not res!1048888) (not e!853489))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531752 (= res!1048888 (and (= (size!49624 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49624 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49624 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531753 () Bool)

(declare-fun res!1048896 () Bool)

(assert (=> b!1531753 (=> res!1048896 e!853484)))

(assert (=> b!1531753 (= res!1048896 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663358 (select (arr!49074 a!2804) j!70) a!2804 mask!2512) lt!663363)))))

(declare-fun b!1531754 () Bool)

(declare-fun res!1048890 () Bool)

(assert (=> b!1531754 (=> (not res!1048890) (not e!853489))))

(declare-datatypes ((List!35557 0))(
  ( (Nil!35554) (Cons!35553 (h!36998 (_ BitVec 64)) (t!50251 List!35557)) )
))
(declare-fun arrayNoDuplicates!0 (array!101707 (_ BitVec 32) List!35557) Bool)

(assert (=> b!1531754 (= res!1048890 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35554))))

(declare-fun b!1531755 () Bool)

(declare-fun res!1048893 () Bool)

(assert (=> b!1531755 (=> (not res!1048893) (not e!853489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531755 (= res!1048893 (validKeyInArray!0 (select (arr!49074 a!2804) i!961)))))

(declare-fun b!1531756 () Bool)

(declare-fun res!1048897 () Bool)

(assert (=> b!1531756 (=> (not res!1048897) (not e!853489))))

(assert (=> b!1531756 (= res!1048897 (validKeyInArray!0 (select (arr!49074 a!2804) j!70)))))

(declare-fun b!1531757 () Bool)

(assert (=> b!1531757 (= e!853485 e!853488)))

(declare-fun res!1048894 () Bool)

(assert (=> b!1531757 (=> (not res!1048894) (not e!853488))))

(declare-fun lt!663364 () array!101707)

(assert (=> b!1531757 (= res!1048894 (= lt!663362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663359 mask!2512) lt!663359 lt!663364 mask!2512)))))

(assert (=> b!1531757 (= lt!663359 (select (store (arr!49074 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531757 (= lt!663364 (array!101708 (store (arr!49074 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49624 a!2804)))))

(declare-fun b!1531758 () Bool)

(declare-fun res!1048889 () Bool)

(assert (=> b!1531758 (=> (not res!1048889) (not e!853489))))

(assert (=> b!1531758 (= res!1048889 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49624 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49624 a!2804))))))

(declare-fun b!1531759 () Bool)

(assert (=> b!1531759 (= e!853484 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101707 (_ BitVec 32)) SeekEntryResult!13239)

(assert (=> b!1531759 (= (seekEntryOrOpen!0 (select (arr!49074 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663359 lt!663364 mask!2512))))

(declare-fun lt!663361 () Unit!51262)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51262)

(assert (=> b!1531759 (= lt!663361 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663358 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1048891 () Bool)

(assert (=> start!130528 (=> (not res!1048891) (not e!853489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130528 (= res!1048891 (validMask!0 mask!2512))))

(assert (=> start!130528 e!853489))

(assert (=> start!130528 true))

(declare-fun array_inv!38102 (array!101707) Bool)

(assert (=> start!130528 (array_inv!38102 a!2804)))

(declare-fun b!1531760 () Bool)

(declare-fun res!1048898 () Bool)

(assert (=> b!1531760 (=> (not res!1048898) (not e!853485))))

(assert (=> b!1531760 (= res!1048898 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49074 a!2804) j!70) a!2804 mask!2512) lt!663363))))

(assert (= (and start!130528 res!1048891) b!1531752))

(assert (= (and b!1531752 res!1048888) b!1531755))

(assert (= (and b!1531755 res!1048893) b!1531756))

(assert (= (and b!1531756 res!1048897) b!1531748))

(assert (= (and b!1531748 res!1048895) b!1531754))

(assert (= (and b!1531754 res!1048890) b!1531758))

(assert (= (and b!1531758 res!1048889) b!1531747))

(assert (= (and b!1531747 res!1048899) b!1531760))

(assert (= (and b!1531760 res!1048898) b!1531757))

(assert (= (and b!1531757 res!1048894) b!1531751))

(assert (= (and b!1531751 res!1048900) b!1531749))

(assert (= (and b!1531751 (not res!1048892)) b!1531750))

(assert (= (and b!1531750 (not res!1048887)) b!1531753))

(assert (= (and b!1531753 (not res!1048896)) b!1531759))

(declare-fun m!1414405 () Bool)

(assert (=> b!1531747 m!1414405))

(assert (=> b!1531747 m!1414405))

(declare-fun m!1414407 () Bool)

(assert (=> b!1531747 m!1414407))

(assert (=> b!1531747 m!1414407))

(assert (=> b!1531747 m!1414405))

(declare-fun m!1414409 () Bool)

(assert (=> b!1531747 m!1414409))

(assert (=> b!1531753 m!1414405))

(assert (=> b!1531753 m!1414405))

(declare-fun m!1414411 () Bool)

(assert (=> b!1531753 m!1414411))

(declare-fun m!1414413 () Bool)

(assert (=> start!130528 m!1414413))

(declare-fun m!1414415 () Bool)

(assert (=> start!130528 m!1414415))

(assert (=> b!1531756 m!1414405))

(assert (=> b!1531756 m!1414405))

(declare-fun m!1414417 () Bool)

(assert (=> b!1531756 m!1414417))

(declare-fun m!1414419 () Bool)

(assert (=> b!1531750 m!1414419))

(assert (=> b!1531759 m!1414405))

(assert (=> b!1531759 m!1414405))

(declare-fun m!1414421 () Bool)

(assert (=> b!1531759 m!1414421))

(declare-fun m!1414423 () Bool)

(assert (=> b!1531759 m!1414423))

(declare-fun m!1414425 () Bool)

(assert (=> b!1531759 m!1414425))

(declare-fun m!1414427 () Bool)

(assert (=> b!1531757 m!1414427))

(assert (=> b!1531757 m!1414427))

(declare-fun m!1414429 () Bool)

(assert (=> b!1531757 m!1414429))

(declare-fun m!1414431 () Bool)

(assert (=> b!1531757 m!1414431))

(declare-fun m!1414433 () Bool)

(assert (=> b!1531757 m!1414433))

(declare-fun m!1414435 () Bool)

(assert (=> b!1531754 m!1414435))

(declare-fun m!1414437 () Bool)

(assert (=> b!1531748 m!1414437))

(assert (=> b!1531749 m!1414405))

(assert (=> b!1531749 m!1414405))

(declare-fun m!1414439 () Bool)

(assert (=> b!1531749 m!1414439))

(declare-fun m!1414441 () Bool)

(assert (=> b!1531755 m!1414441))

(assert (=> b!1531755 m!1414441))

(declare-fun m!1414443 () Bool)

(assert (=> b!1531755 m!1414443))

(assert (=> b!1531760 m!1414405))

(assert (=> b!1531760 m!1414405))

(declare-fun m!1414445 () Bool)

(assert (=> b!1531760 m!1414445))

(assert (=> b!1531751 m!1414405))

(declare-fun m!1414447 () Bool)

(assert (=> b!1531751 m!1414447))

(declare-fun m!1414449 () Bool)

(assert (=> b!1531751 m!1414449))

(check-sat (not start!130528) (not b!1531757) (not b!1531753) (not b!1531759) (not b!1531755) (not b!1531750) (not b!1531754) (not b!1531747) (not b!1531749) (not b!1531748) (not b!1531756) (not b!1531751) (not b!1531760))
(check-sat)
