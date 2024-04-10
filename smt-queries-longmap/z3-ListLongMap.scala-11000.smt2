; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128834 () Bool)

(assert start!128834)

(declare-fun b!1509742 () Bool)

(declare-fun res!1029649 () Bool)

(declare-fun e!843199 () Bool)

(assert (=> b!1509742 (=> (not res!1029649) (not e!843199))))

(declare-datatypes ((SeekEntryResult!12753 0))(
  ( (MissingZero!12753 (index!53407 (_ BitVec 32))) (Found!12753 (index!53408 (_ BitVec 32))) (Intermediate!12753 (undefined!13565 Bool) (index!53409 (_ BitVec 32)) (x!135159 (_ BitVec 32))) (Undefined!12753) (MissingVacant!12753 (index!53410 (_ BitVec 32))) )
))
(declare-fun lt!654980 () SeekEntryResult!12753)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100690 0))(
  ( (array!100691 (arr!48582 (Array (_ BitVec 32) (_ BitVec 64))) (size!49132 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100690)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100690 (_ BitVec 32)) SeekEntryResult!12753)

(assert (=> b!1509742 (= res!1029649 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48582 a!2804) j!70) a!2804 mask!2512) lt!654980))))

(declare-fun b!1509743 () Bool)

(declare-fun res!1029646 () Bool)

(declare-fun e!843200 () Bool)

(assert (=> b!1509743 (=> (not res!1029646) (not e!843200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509743 (= res!1029646 (validKeyInArray!0 (select (arr!48582 a!2804) j!70)))))

(declare-fun b!1509744 () Bool)

(declare-fun res!1029647 () Bool)

(assert (=> b!1509744 (=> (not res!1029647) (not e!843199))))

(declare-fun lt!654981 () SeekEntryResult!12753)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509744 (= res!1029647 (= lt!654981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48582 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48582 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100691 (store (arr!48582 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49132 a!2804)) mask!2512)))))

(declare-fun b!1509745 () Bool)

(declare-fun res!1029648 () Bool)

(assert (=> b!1509745 (=> (not res!1029648) (not e!843200))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509745 (= res!1029648 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49132 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49132 a!2804))))))

(declare-fun b!1509746 () Bool)

(assert (=> b!1509746 (= e!843200 e!843199)))

(declare-fun res!1029652 () Bool)

(assert (=> b!1509746 (=> (not res!1029652) (not e!843199))))

(assert (=> b!1509746 (= res!1029652 (= lt!654981 lt!654980))))

(assert (=> b!1509746 (= lt!654980 (Intermediate!12753 false resIndex!21 resX!21))))

(assert (=> b!1509746 (= lt!654981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48582 a!2804) j!70) mask!2512) (select (arr!48582 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509747 () Bool)

(declare-fun res!1029651 () Bool)

(assert (=> b!1509747 (=> (not res!1029651) (not e!843200))))

(declare-datatypes ((List!35065 0))(
  ( (Nil!35062) (Cons!35061 (h!36473 (_ BitVec 64)) (t!49759 List!35065)) )
))
(declare-fun arrayNoDuplicates!0 (array!100690 (_ BitVec 32) List!35065) Bool)

(assert (=> b!1509747 (= res!1029651 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35062))))

(declare-fun res!1029653 () Bool)

(assert (=> start!128834 (=> (not res!1029653) (not e!843200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128834 (= res!1029653 (validMask!0 mask!2512))))

(assert (=> start!128834 e!843200))

(assert (=> start!128834 true))

(declare-fun array_inv!37610 (array!100690) Bool)

(assert (=> start!128834 (array_inv!37610 a!2804)))

(declare-fun b!1509748 () Bool)

(declare-fun res!1029655 () Bool)

(assert (=> b!1509748 (=> (not res!1029655) (not e!843200))))

(assert (=> b!1509748 (= res!1029655 (validKeyInArray!0 (select (arr!48582 a!2804) i!961)))))

(declare-fun b!1509749 () Bool)

(declare-fun res!1029650 () Bool)

(assert (=> b!1509749 (=> (not res!1029650) (not e!843200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100690 (_ BitVec 32)) Bool)

(assert (=> b!1509749 (= res!1029650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509750 () Bool)

(declare-fun res!1029645 () Bool)

(assert (=> b!1509750 (=> (not res!1029645) (not e!843200))))

(assert (=> b!1509750 (= res!1029645 (and (= (size!49132 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49132 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49132 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509751 () Bool)

(declare-fun e!843201 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100690 (_ BitVec 32)) SeekEntryResult!12753)

(assert (=> b!1509751 (= e!843201 (= (seekEntry!0 (select (arr!48582 a!2804) j!70) a!2804 mask!2512) (Found!12753 j!70)))))

(declare-fun b!1509752 () Bool)

(assert (=> b!1509752 (= e!843199 (not (or (not (= (select (arr!48582 a!2804) j!70) (select (store (arr!48582 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48582 a!2804) index!487) (select (arr!48582 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1509752 e!843201))

(declare-fun res!1029654 () Bool)

(assert (=> b!1509752 (=> (not res!1029654) (not e!843201))))

(assert (=> b!1509752 (= res!1029654 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50374 0))(
  ( (Unit!50375) )
))
(declare-fun lt!654982 () Unit!50374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50374)

(assert (=> b!1509752 (= lt!654982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128834 res!1029653) b!1509750))

(assert (= (and b!1509750 res!1029645) b!1509748))

(assert (= (and b!1509748 res!1029655) b!1509743))

(assert (= (and b!1509743 res!1029646) b!1509749))

(assert (= (and b!1509749 res!1029650) b!1509747))

(assert (= (and b!1509747 res!1029651) b!1509745))

(assert (= (and b!1509745 res!1029648) b!1509746))

(assert (= (and b!1509746 res!1029652) b!1509742))

(assert (= (and b!1509742 res!1029649) b!1509744))

(assert (= (and b!1509744 res!1029647) b!1509752))

(assert (= (and b!1509752 res!1029654) b!1509751))

(declare-fun m!1392255 () Bool)

(assert (=> b!1509748 m!1392255))

(assert (=> b!1509748 m!1392255))

(declare-fun m!1392257 () Bool)

(assert (=> b!1509748 m!1392257))

(declare-fun m!1392259 () Bool)

(assert (=> b!1509743 m!1392259))

(assert (=> b!1509743 m!1392259))

(declare-fun m!1392261 () Bool)

(assert (=> b!1509743 m!1392261))

(assert (=> b!1509751 m!1392259))

(assert (=> b!1509751 m!1392259))

(declare-fun m!1392263 () Bool)

(assert (=> b!1509751 m!1392263))

(declare-fun m!1392265 () Bool)

(assert (=> start!128834 m!1392265))

(declare-fun m!1392267 () Bool)

(assert (=> start!128834 m!1392267))

(assert (=> b!1509742 m!1392259))

(assert (=> b!1509742 m!1392259))

(declare-fun m!1392269 () Bool)

(assert (=> b!1509742 m!1392269))

(declare-fun m!1392271 () Bool)

(assert (=> b!1509749 m!1392271))

(assert (=> b!1509746 m!1392259))

(assert (=> b!1509746 m!1392259))

(declare-fun m!1392273 () Bool)

(assert (=> b!1509746 m!1392273))

(assert (=> b!1509746 m!1392273))

(assert (=> b!1509746 m!1392259))

(declare-fun m!1392275 () Bool)

(assert (=> b!1509746 m!1392275))

(assert (=> b!1509752 m!1392259))

(declare-fun m!1392277 () Bool)

(assert (=> b!1509752 m!1392277))

(declare-fun m!1392279 () Bool)

(assert (=> b!1509752 m!1392279))

(declare-fun m!1392281 () Bool)

(assert (=> b!1509752 m!1392281))

(declare-fun m!1392283 () Bool)

(assert (=> b!1509752 m!1392283))

(declare-fun m!1392285 () Bool)

(assert (=> b!1509752 m!1392285))

(declare-fun m!1392287 () Bool)

(assert (=> b!1509747 m!1392287))

(assert (=> b!1509744 m!1392279))

(assert (=> b!1509744 m!1392283))

(assert (=> b!1509744 m!1392283))

(declare-fun m!1392289 () Bool)

(assert (=> b!1509744 m!1392289))

(assert (=> b!1509744 m!1392289))

(assert (=> b!1509744 m!1392283))

(declare-fun m!1392291 () Bool)

(assert (=> b!1509744 m!1392291))

(check-sat (not b!1509744) (not b!1509752) (not start!128834) (not b!1509742) (not b!1509747) (not b!1509746) (not b!1509743) (not b!1509748) (not b!1509751) (not b!1509749))
(check-sat)
