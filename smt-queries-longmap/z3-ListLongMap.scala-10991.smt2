; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129080 () Bool)

(assert start!129080)

(declare-fun b!1510763 () Bool)

(declare-fun res!1029493 () Bool)

(declare-fun e!844069 () Bool)

(assert (=> b!1510763 (=> (not res!1029493) (not e!844069))))

(declare-datatypes ((array!100750 0))(
  ( (array!100751 (arr!48607 (Array (_ BitVec 32) (_ BitVec 64))) (size!49158 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100750)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510763 (= res!1029493 (validKeyInArray!0 (select (arr!48607 a!2804) i!961)))))

(declare-fun b!1510764 () Bool)

(declare-fun res!1029494 () Bool)

(assert (=> b!1510764 (=> (not res!1029494) (not e!844069))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1510764 (= res!1029494 (and (= (size!49158 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49158 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49158 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029492 () Bool)

(assert (=> start!129080 (=> (not res!1029492) (not e!844069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129080 (= res!1029492 (validMask!0 mask!2512))))

(assert (=> start!129080 e!844069))

(assert (=> start!129080 true))

(declare-fun array_inv!37888 (array!100750) Bool)

(assert (=> start!129080 (array_inv!37888 a!2804)))

(declare-fun b!1510765 () Bool)

(declare-fun res!1029491 () Bool)

(assert (=> b!1510765 (=> (not res!1029491) (not e!844069))))

(declare-datatypes ((List!35077 0))(
  ( (Nil!35074) (Cons!35073 (h!36500 (_ BitVec 64)) (t!49763 List!35077)) )
))
(declare-fun arrayNoDuplicates!0 (array!100750 (_ BitVec 32) List!35077) Bool)

(assert (=> b!1510765 (= res!1029491 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35074))))

(declare-fun b!1510766 () Bool)

(declare-fun res!1029489 () Bool)

(assert (=> b!1510766 (=> (not res!1029489) (not e!844069))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510766 (= res!1029489 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49158 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49158 a!2804))))))

(declare-fun b!1510767 () Bool)

(declare-fun e!844070 () Bool)

(assert (=> b!1510767 (= e!844070 false)))

(declare-datatypes ((SeekEntryResult!12671 0))(
  ( (MissingZero!12671 (index!53079 (_ BitVec 32))) (Found!12671 (index!53080 (_ BitVec 32))) (Intermediate!12671 (undefined!13483 Bool) (index!53081 (_ BitVec 32)) (x!135042 (_ BitVec 32))) (Undefined!12671) (MissingVacant!12671 (index!53082 (_ BitVec 32))) )
))
(declare-fun lt!655435 () SeekEntryResult!12671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510767 (= lt!655435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100751 (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49158 a!2804)) mask!2512))))

(declare-fun b!1510768 () Bool)

(declare-fun res!1029495 () Bool)

(assert (=> b!1510768 (=> (not res!1029495) (not e!844070))))

(declare-fun lt!655434 () SeekEntryResult!12671)

(assert (=> b!1510768 (= res!1029495 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48607 a!2804) j!70) a!2804 mask!2512) lt!655434))))

(declare-fun b!1510769 () Bool)

(declare-fun res!1029496 () Bool)

(assert (=> b!1510769 (=> (not res!1029496) (not e!844069))))

(assert (=> b!1510769 (= res!1029496 (validKeyInArray!0 (select (arr!48607 a!2804) j!70)))))

(declare-fun b!1510770 () Bool)

(declare-fun res!1029497 () Bool)

(assert (=> b!1510770 (=> (not res!1029497) (not e!844069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100750 (_ BitVec 32)) Bool)

(assert (=> b!1510770 (= res!1029497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510771 () Bool)

(assert (=> b!1510771 (= e!844069 e!844070)))

(declare-fun res!1029490 () Bool)

(assert (=> b!1510771 (=> (not res!1029490) (not e!844070))))

(assert (=> b!1510771 (= res!1029490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48607 a!2804) j!70) mask!2512) (select (arr!48607 a!2804) j!70) a!2804 mask!2512) lt!655434))))

(assert (=> b!1510771 (= lt!655434 (Intermediate!12671 false resIndex!21 resX!21))))

(assert (= (and start!129080 res!1029492) b!1510764))

(assert (= (and b!1510764 res!1029494) b!1510763))

(assert (= (and b!1510763 res!1029493) b!1510769))

(assert (= (and b!1510769 res!1029496) b!1510770))

(assert (= (and b!1510770 res!1029497) b!1510765))

(assert (= (and b!1510765 res!1029491) b!1510766))

(assert (= (and b!1510766 res!1029489) b!1510771))

(assert (= (and b!1510771 res!1029490) b!1510768))

(assert (= (and b!1510768 res!1029495) b!1510767))

(declare-fun m!1393149 () Bool)

(assert (=> b!1510771 m!1393149))

(assert (=> b!1510771 m!1393149))

(declare-fun m!1393151 () Bool)

(assert (=> b!1510771 m!1393151))

(assert (=> b!1510771 m!1393151))

(assert (=> b!1510771 m!1393149))

(declare-fun m!1393153 () Bool)

(assert (=> b!1510771 m!1393153))

(declare-fun m!1393155 () Bool)

(assert (=> b!1510770 m!1393155))

(assert (=> b!1510769 m!1393149))

(assert (=> b!1510769 m!1393149))

(declare-fun m!1393157 () Bool)

(assert (=> b!1510769 m!1393157))

(declare-fun m!1393159 () Bool)

(assert (=> start!129080 m!1393159))

(declare-fun m!1393161 () Bool)

(assert (=> start!129080 m!1393161))

(declare-fun m!1393163 () Bool)

(assert (=> b!1510765 m!1393163))

(declare-fun m!1393165 () Bool)

(assert (=> b!1510767 m!1393165))

(declare-fun m!1393167 () Bool)

(assert (=> b!1510767 m!1393167))

(assert (=> b!1510767 m!1393167))

(declare-fun m!1393169 () Bool)

(assert (=> b!1510767 m!1393169))

(assert (=> b!1510767 m!1393169))

(assert (=> b!1510767 m!1393167))

(declare-fun m!1393171 () Bool)

(assert (=> b!1510767 m!1393171))

(declare-fun m!1393173 () Bool)

(assert (=> b!1510763 m!1393173))

(assert (=> b!1510763 m!1393173))

(declare-fun m!1393175 () Bool)

(assert (=> b!1510763 m!1393175))

(assert (=> b!1510768 m!1393149))

(assert (=> b!1510768 m!1393149))

(declare-fun m!1393177 () Bool)

(assert (=> b!1510768 m!1393177))

(check-sat (not b!1510769) (not b!1510767) (not b!1510768) (not b!1510770) (not b!1510765) (not b!1510763) (not b!1510771) (not start!129080))
(check-sat)
