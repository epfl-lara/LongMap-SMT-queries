; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129554 () Bool)

(assert start!129554)

(declare-fun b!1518730 () Bool)

(declare-fun e!847548 () Bool)

(assert (=> b!1518730 (= e!847548 true)))

(declare-datatypes ((SeekEntryResult!12881 0))(
  ( (MissingZero!12881 (index!53919 (_ BitVec 32))) (Found!12881 (index!53920 (_ BitVec 32))) (Intermediate!12881 (undefined!13693 Bool) (index!53921 (_ BitVec 32)) (x!135818 (_ BitVec 32))) (Undefined!12881) (MissingVacant!12881 (index!53922 (_ BitVec 32))) )
))
(declare-fun lt!658270 () SeekEntryResult!12881)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101173 0))(
  ( (array!101174 (arr!48817 (Array (_ BitVec 32) (_ BitVec 64))) (size!49368 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101173)

(declare-fun lt!658269 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101173 (_ BitVec 32)) SeekEntryResult!12881)

(assert (=> b!1518730 (= lt!658270 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658269 (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518731 () Bool)

(declare-fun res!1037273 () Bool)

(declare-fun e!847544 () Bool)

(assert (=> b!1518731 (=> (not res!1037273) (not e!847544))))

(declare-fun lt!658266 () SeekEntryResult!12881)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518731 (= res!1037273 (= lt!658266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101174 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49368 a!2804)) mask!2512)))))

(declare-fun b!1518732 () Bool)

(declare-fun e!847546 () Bool)

(assert (=> b!1518732 (= e!847546 e!847544)))

(declare-fun res!1037283 () Bool)

(assert (=> b!1518732 (=> (not res!1037283) (not e!847544))))

(declare-fun lt!658268 () SeekEntryResult!12881)

(assert (=> b!1518732 (= res!1037283 (= lt!658266 lt!658268))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518732 (= lt!658268 (Intermediate!12881 false resIndex!21 resX!21))))

(assert (=> b!1518732 (= lt!658266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518733 () Bool)

(declare-fun res!1037282 () Bool)

(assert (=> b!1518733 (=> (not res!1037282) (not e!847546))))

(assert (=> b!1518733 (= res!1037282 (and (= (size!49368 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49368 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49368 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1037276 () Bool)

(assert (=> start!129554 (=> (not res!1037276) (not e!847546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129554 (= res!1037276 (validMask!0 mask!2512))))

(assert (=> start!129554 e!847546))

(assert (=> start!129554 true))

(declare-fun array_inv!38098 (array!101173) Bool)

(assert (=> start!129554 (array_inv!38098 a!2804)))

(declare-fun e!847543 () Bool)

(declare-fun b!1518734 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101173 (_ BitVec 32)) SeekEntryResult!12881)

(assert (=> b!1518734 (= e!847543 (= (seekEntry!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) (Found!12881 j!70)))))

(declare-fun b!1518735 () Bool)

(declare-fun e!847547 () Bool)

(assert (=> b!1518735 (= e!847547 e!847548)))

(declare-fun res!1037281 () Bool)

(assert (=> b!1518735 (=> res!1037281 e!847548)))

(assert (=> b!1518735 (= res!1037281 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658269 #b00000000000000000000000000000000) (bvsge lt!658269 (size!49368 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518735 (= lt!658269 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1518736 () Bool)

(declare-fun res!1037278 () Bool)

(assert (=> b!1518736 (=> (not res!1037278) (not e!847546))))

(assert (=> b!1518736 (= res!1037278 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49368 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49368 a!2804))))))

(declare-fun b!1518737 () Bool)

(declare-fun res!1037284 () Bool)

(assert (=> b!1518737 (=> (not res!1037284) (not e!847546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518737 (= res!1037284 (validKeyInArray!0 (select (arr!48817 a!2804) j!70)))))

(declare-fun b!1518738 () Bool)

(declare-fun res!1037277 () Bool)

(assert (=> b!1518738 (=> (not res!1037277) (not e!847546))))

(declare-datatypes ((List!35287 0))(
  ( (Nil!35284) (Cons!35283 (h!36713 (_ BitVec 64)) (t!49973 List!35287)) )
))
(declare-fun arrayNoDuplicates!0 (array!101173 (_ BitVec 32) List!35287) Bool)

(assert (=> b!1518738 (= res!1037277 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35284))))

(declare-fun b!1518739 () Bool)

(declare-fun res!1037285 () Bool)

(assert (=> b!1518739 (=> (not res!1037285) (not e!847546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101173 (_ BitVec 32)) Bool)

(assert (=> b!1518739 (= res!1037285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518740 () Bool)

(declare-fun res!1037274 () Bool)

(assert (=> b!1518740 (=> (not res!1037274) (not e!847544))))

(assert (=> b!1518740 (= res!1037274 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658268))))

(declare-fun b!1518741 () Bool)

(assert (=> b!1518741 (= e!847544 (not e!847547))))

(declare-fun res!1037280 () Bool)

(assert (=> b!1518741 (=> res!1037280 e!847547)))

(assert (=> b!1518741 (= res!1037280 (or (not (= (select (arr!48817 a!2804) j!70) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518741 e!847543))

(declare-fun res!1037275 () Bool)

(assert (=> b!1518741 (=> (not res!1037275) (not e!847543))))

(assert (=> b!1518741 (= res!1037275 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50665 0))(
  ( (Unit!50666) )
))
(declare-fun lt!658267 () Unit!50665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50665)

(assert (=> b!1518741 (= lt!658267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518742 () Bool)

(declare-fun res!1037279 () Bool)

(assert (=> b!1518742 (=> (not res!1037279) (not e!847546))))

(assert (=> b!1518742 (= res!1037279 (validKeyInArray!0 (select (arr!48817 a!2804) i!961)))))

(assert (= (and start!129554 res!1037276) b!1518733))

(assert (= (and b!1518733 res!1037282) b!1518742))

(assert (= (and b!1518742 res!1037279) b!1518737))

(assert (= (and b!1518737 res!1037284) b!1518739))

(assert (= (and b!1518739 res!1037285) b!1518738))

(assert (= (and b!1518738 res!1037277) b!1518736))

(assert (= (and b!1518736 res!1037278) b!1518732))

(assert (= (and b!1518732 res!1037283) b!1518740))

(assert (= (and b!1518740 res!1037274) b!1518731))

(assert (= (and b!1518731 res!1037273) b!1518741))

(assert (= (and b!1518741 res!1037275) b!1518734))

(assert (= (and b!1518741 (not res!1037280)) b!1518735))

(assert (= (and b!1518735 (not res!1037281)) b!1518730))

(declare-fun m!1401849 () Bool)

(assert (=> b!1518742 m!1401849))

(assert (=> b!1518742 m!1401849))

(declare-fun m!1401851 () Bool)

(assert (=> b!1518742 m!1401851))

(declare-fun m!1401853 () Bool)

(assert (=> b!1518735 m!1401853))

(declare-fun m!1401855 () Bool)

(assert (=> b!1518731 m!1401855))

(declare-fun m!1401857 () Bool)

(assert (=> b!1518731 m!1401857))

(assert (=> b!1518731 m!1401857))

(declare-fun m!1401859 () Bool)

(assert (=> b!1518731 m!1401859))

(assert (=> b!1518731 m!1401859))

(assert (=> b!1518731 m!1401857))

(declare-fun m!1401861 () Bool)

(assert (=> b!1518731 m!1401861))

(declare-fun m!1401863 () Bool)

(assert (=> b!1518737 m!1401863))

(assert (=> b!1518737 m!1401863))

(declare-fun m!1401865 () Bool)

(assert (=> b!1518737 m!1401865))

(declare-fun m!1401867 () Bool)

(assert (=> start!129554 m!1401867))

(declare-fun m!1401869 () Bool)

(assert (=> start!129554 m!1401869))

(assert (=> b!1518732 m!1401863))

(assert (=> b!1518732 m!1401863))

(declare-fun m!1401871 () Bool)

(assert (=> b!1518732 m!1401871))

(assert (=> b!1518732 m!1401871))

(assert (=> b!1518732 m!1401863))

(declare-fun m!1401873 () Bool)

(assert (=> b!1518732 m!1401873))

(assert (=> b!1518730 m!1401863))

(assert (=> b!1518730 m!1401863))

(declare-fun m!1401875 () Bool)

(assert (=> b!1518730 m!1401875))

(declare-fun m!1401877 () Bool)

(assert (=> b!1518738 m!1401877))

(assert (=> b!1518741 m!1401863))

(declare-fun m!1401879 () Bool)

(assert (=> b!1518741 m!1401879))

(assert (=> b!1518741 m!1401855))

(assert (=> b!1518741 m!1401857))

(declare-fun m!1401881 () Bool)

(assert (=> b!1518741 m!1401881))

(assert (=> b!1518734 m!1401863))

(assert (=> b!1518734 m!1401863))

(declare-fun m!1401883 () Bool)

(assert (=> b!1518734 m!1401883))

(declare-fun m!1401885 () Bool)

(assert (=> b!1518739 m!1401885))

(assert (=> b!1518740 m!1401863))

(assert (=> b!1518740 m!1401863))

(declare-fun m!1401887 () Bool)

(assert (=> b!1518740 m!1401887))

(check-sat (not b!1518731) (not b!1518734) (not start!129554) (not b!1518730) (not b!1518740) (not b!1518737) (not b!1518742) (not b!1518732) (not b!1518738) (not b!1518739) (not b!1518741) (not b!1518735))
(check-sat)
