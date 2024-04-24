; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129146 () Bool)

(assert start!129146)

(declare-fun b!1511739 () Bool)

(declare-fun res!1030467 () Bool)

(declare-fun e!844397 () Bool)

(assert (=> b!1511739 (=> (not res!1030467) (not e!844397))))

(declare-datatypes ((array!100816 0))(
  ( (array!100817 (arr!48640 (Array (_ BitVec 32) (_ BitVec 64))) (size!49191 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100816)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511739 (= res!1030467 (validKeyInArray!0 (select (arr!48640 a!2804) j!70)))))

(declare-fun b!1511740 () Bool)

(declare-fun res!1030473 () Bool)

(assert (=> b!1511740 (=> (not res!1030473) (not e!844397))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511740 (= res!1030473 (validKeyInArray!0 (select (arr!48640 a!2804) i!961)))))

(declare-fun b!1511741 () Bool)

(declare-fun res!1030475 () Bool)

(declare-fun e!844395 () Bool)

(assert (=> b!1511741 (=> (not res!1030475) (not e!844395))))

(declare-datatypes ((SeekEntryResult!12704 0))(
  ( (MissingZero!12704 (index!53211 (_ BitVec 32))) (Found!12704 (index!53212 (_ BitVec 32))) (Intermediate!12704 (undefined!13516 Bool) (index!53213 (_ BitVec 32)) (x!135163 (_ BitVec 32))) (Undefined!12704) (MissingVacant!12704 (index!53214 (_ BitVec 32))) )
))
(declare-fun lt!655688 () SeekEntryResult!12704)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511741 (= res!1030475 (= lt!655688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100817 (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49191 a!2804)) mask!2512)))))

(declare-fun b!1511742 () Bool)

(assert (=> b!1511742 (= e!844395 (not true))))

(declare-fun e!844398 () Bool)

(assert (=> b!1511742 e!844398))

(declare-fun res!1030471 () Bool)

(assert (=> b!1511742 (=> (not res!1030471) (not e!844398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100816 (_ BitVec 32)) Bool)

(assert (=> b!1511742 (= res!1030471 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50311 0))(
  ( (Unit!50312) )
))
(declare-fun lt!655690 () Unit!50311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50311)

(assert (=> b!1511742 (= lt!655690 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511743 () Bool)

(declare-fun res!1030470 () Bool)

(assert (=> b!1511743 (=> (not res!1030470) (not e!844395))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!655689 () SeekEntryResult!12704)

(assert (=> b!1511743 (= res!1030470 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) lt!655689))))

(declare-fun b!1511744 () Bool)

(declare-fun res!1030466 () Bool)

(assert (=> b!1511744 (=> (not res!1030466) (not e!844397))))

(declare-datatypes ((List!35110 0))(
  ( (Nil!35107) (Cons!35106 (h!36533 (_ BitVec 64)) (t!49796 List!35110)) )
))
(declare-fun arrayNoDuplicates!0 (array!100816 (_ BitVec 32) List!35110) Bool)

(assert (=> b!1511744 (= res!1030466 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35107))))

(declare-fun b!1511745 () Bool)

(declare-fun res!1030465 () Bool)

(assert (=> b!1511745 (=> (not res!1030465) (not e!844397))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511745 (= res!1030465 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49191 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49191 a!2804))))))

(declare-fun res!1030468 () Bool)

(assert (=> start!129146 (=> (not res!1030468) (not e!844397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129146 (= res!1030468 (validMask!0 mask!2512))))

(assert (=> start!129146 e!844397))

(assert (=> start!129146 true))

(declare-fun array_inv!37921 (array!100816) Bool)

(assert (=> start!129146 (array_inv!37921 a!2804)))

(declare-fun b!1511746 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12704)

(assert (=> b!1511746 (= e!844398 (= (seekEntry!0 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) (Found!12704 j!70)))))

(declare-fun b!1511747 () Bool)

(assert (=> b!1511747 (= e!844397 e!844395)))

(declare-fun res!1030469 () Bool)

(assert (=> b!1511747 (=> (not res!1030469) (not e!844395))))

(assert (=> b!1511747 (= res!1030469 (= lt!655688 lt!655689))))

(assert (=> b!1511747 (= lt!655689 (Intermediate!12704 false resIndex!21 resX!21))))

(assert (=> b!1511747 (= lt!655688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48640 a!2804) j!70) mask!2512) (select (arr!48640 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511748 () Bool)

(declare-fun res!1030474 () Bool)

(assert (=> b!1511748 (=> (not res!1030474) (not e!844397))))

(assert (=> b!1511748 (= res!1030474 (and (= (size!49191 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49191 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49191 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511749 () Bool)

(declare-fun res!1030472 () Bool)

(assert (=> b!1511749 (=> (not res!1030472) (not e!844397))))

(assert (=> b!1511749 (= res!1030472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129146 res!1030468) b!1511748))

(assert (= (and b!1511748 res!1030474) b!1511740))

(assert (= (and b!1511740 res!1030473) b!1511739))

(assert (= (and b!1511739 res!1030467) b!1511749))

(assert (= (and b!1511749 res!1030472) b!1511744))

(assert (= (and b!1511744 res!1030466) b!1511745))

(assert (= (and b!1511745 res!1030465) b!1511747))

(assert (= (and b!1511747 res!1030469) b!1511743))

(assert (= (and b!1511743 res!1030470) b!1511741))

(assert (= (and b!1511741 res!1030475) b!1511742))

(assert (= (and b!1511742 res!1030471) b!1511746))

(declare-fun m!1394235 () Bool)

(assert (=> b!1511747 m!1394235))

(assert (=> b!1511747 m!1394235))

(declare-fun m!1394237 () Bool)

(assert (=> b!1511747 m!1394237))

(assert (=> b!1511747 m!1394237))

(assert (=> b!1511747 m!1394235))

(declare-fun m!1394239 () Bool)

(assert (=> b!1511747 m!1394239))

(declare-fun m!1394241 () Bool)

(assert (=> b!1511744 m!1394241))

(assert (=> b!1511743 m!1394235))

(assert (=> b!1511743 m!1394235))

(declare-fun m!1394243 () Bool)

(assert (=> b!1511743 m!1394243))

(declare-fun m!1394245 () Bool)

(assert (=> start!129146 m!1394245))

(declare-fun m!1394247 () Bool)

(assert (=> start!129146 m!1394247))

(assert (=> b!1511746 m!1394235))

(assert (=> b!1511746 m!1394235))

(declare-fun m!1394249 () Bool)

(assert (=> b!1511746 m!1394249))

(assert (=> b!1511739 m!1394235))

(assert (=> b!1511739 m!1394235))

(declare-fun m!1394251 () Bool)

(assert (=> b!1511739 m!1394251))

(declare-fun m!1394253 () Bool)

(assert (=> b!1511741 m!1394253))

(declare-fun m!1394255 () Bool)

(assert (=> b!1511741 m!1394255))

(assert (=> b!1511741 m!1394255))

(declare-fun m!1394257 () Bool)

(assert (=> b!1511741 m!1394257))

(assert (=> b!1511741 m!1394257))

(assert (=> b!1511741 m!1394255))

(declare-fun m!1394259 () Bool)

(assert (=> b!1511741 m!1394259))

(declare-fun m!1394261 () Bool)

(assert (=> b!1511742 m!1394261))

(declare-fun m!1394263 () Bool)

(assert (=> b!1511742 m!1394263))

(declare-fun m!1394265 () Bool)

(assert (=> b!1511749 m!1394265))

(declare-fun m!1394267 () Bool)

(assert (=> b!1511740 m!1394267))

(assert (=> b!1511740 m!1394267))

(declare-fun m!1394269 () Bool)

(assert (=> b!1511740 m!1394269))

(check-sat (not b!1511746) (not b!1511749) (not b!1511743) (not b!1511741) (not b!1511744) (not b!1511740) (not start!129146) (not b!1511739) (not b!1511742) (not b!1511747))
(check-sat)
