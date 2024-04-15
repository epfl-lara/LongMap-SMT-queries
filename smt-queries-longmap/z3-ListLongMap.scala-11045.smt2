; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129050 () Bool)

(assert start!129050)

(declare-fun b!1514451 () Bool)

(declare-fun res!1034573 () Bool)

(declare-fun e!845136 () Bool)

(assert (=> b!1514451 (=> (not res!1034573) (not e!845136))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100906 0))(
  ( (array!100907 (arr!48691 (Array (_ BitVec 32) (_ BitVec 64))) (size!49243 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100906)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514451 (= res!1034573 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49243 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49243 a!2804))))))

(declare-fun b!1514452 () Bool)

(declare-fun e!845131 () Bool)

(assert (=> b!1514452 (= e!845136 e!845131)))

(declare-fun res!1034561 () Bool)

(assert (=> b!1514452 (=> (not res!1034561) (not e!845131))))

(declare-datatypes ((SeekEntryResult!12885 0))(
  ( (MissingZero!12885 (index!53935 (_ BitVec 32))) (Found!12885 (index!53936 (_ BitVec 32))) (Intermediate!12885 (undefined!13697 Bool) (index!53937 (_ BitVec 32)) (x!135645 (_ BitVec 32))) (Undefined!12885) (MissingVacant!12885 (index!53938 (_ BitVec 32))) )
))
(declare-fun lt!656165 () SeekEntryResult!12885)

(declare-fun lt!656166 () SeekEntryResult!12885)

(assert (=> b!1514452 (= res!1034561 (= lt!656165 lt!656166))))

(assert (=> b!1514452 (= lt!656166 (Intermediate!12885 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514452 (= lt!656165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48691 a!2804) j!70) mask!2512) (select (arr!48691 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514453 () Bool)

(declare-fun res!1034571 () Bool)

(assert (=> b!1514453 (=> (not res!1034571) (not e!845136))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514453 (= res!1034571 (and (= (size!49243 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49243 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49243 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514454 () Bool)

(declare-fun res!1034560 () Bool)

(declare-fun e!845130 () Bool)

(assert (=> b!1514454 (=> (not res!1034560) (not e!845130))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12885)

(assert (=> b!1514454 (= res!1034560 (= (seekEntry!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (Found!12885 j!70)))))

(declare-fun b!1514455 () Bool)

(declare-fun e!845135 () Bool)

(assert (=> b!1514455 (= e!845135 (not true))))

(assert (=> b!1514455 e!845130))

(declare-fun res!1034569 () Bool)

(assert (=> b!1514455 (=> (not res!1034569) (not e!845130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100906 (_ BitVec 32)) Bool)

(assert (=> b!1514455 (= res!1034569 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50477 0))(
  ( (Unit!50478) )
))
(declare-fun lt!656169 () Unit!50477)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50477)

(assert (=> b!1514455 (= lt!656169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514456 () Bool)

(declare-fun res!1034570 () Bool)

(assert (=> b!1514456 (=> (not res!1034570) (not e!845136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514456 (= res!1034570 (validKeyInArray!0 (select (arr!48691 a!2804) i!961)))))

(declare-fun res!1034562 () Bool)

(assert (=> start!129050 (=> (not res!1034562) (not e!845136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129050 (= res!1034562 (validMask!0 mask!2512))))

(assert (=> start!129050 e!845136))

(assert (=> start!129050 true))

(declare-fun array_inv!37924 (array!100906) Bool)

(assert (=> start!129050 (array_inv!37924 a!2804)))

(declare-fun b!1514457 () Bool)

(declare-fun res!1034567 () Bool)

(assert (=> b!1514457 (=> (not res!1034567) (not e!845136))))

(assert (=> b!1514457 (= res!1034567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun lt!656167 () (_ BitVec 64))

(declare-fun e!845132 () Bool)

(declare-fun lt!656168 () array!100906)

(declare-fun b!1514458 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12885)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12885)

(assert (=> b!1514458 (= e!845132 (= (seekEntryOrOpen!0 lt!656167 lt!656168 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656167 lt!656168 mask!2512)))))

(declare-fun b!1514459 () Bool)

(assert (=> b!1514459 (= e!845131 e!845135)))

(declare-fun res!1034568 () Bool)

(assert (=> b!1514459 (=> (not res!1034568) (not e!845135))))

(assert (=> b!1514459 (= res!1034568 (= lt!656165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656167 mask!2512) lt!656167 lt!656168 mask!2512)))))

(assert (=> b!1514459 (= lt!656167 (select (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514459 (= lt!656168 (array!100907 (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49243 a!2804)))))

(declare-fun b!1514460 () Bool)

(declare-fun e!845133 () Bool)

(assert (=> b!1514460 (= e!845130 e!845133)))

(declare-fun res!1034572 () Bool)

(assert (=> b!1514460 (=> res!1034572 e!845133)))

(assert (=> b!1514460 (= res!1034572 (or (not (= (select (arr!48691 a!2804) j!70) lt!656167)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48691 a!2804) index!487) (select (arr!48691 a!2804) j!70)) (not (= (select (arr!48691 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514461 () Bool)

(declare-fun res!1034564 () Bool)

(assert (=> b!1514461 (=> (not res!1034564) (not e!845131))))

(assert (=> b!1514461 (= res!1034564 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) lt!656166))))

(declare-fun b!1514462 () Bool)

(declare-fun res!1034565 () Bool)

(assert (=> b!1514462 (=> (not res!1034565) (not e!845136))))

(assert (=> b!1514462 (= res!1034565 (validKeyInArray!0 (select (arr!48691 a!2804) j!70)))))

(declare-fun b!1514463 () Bool)

(declare-fun res!1034563 () Bool)

(assert (=> b!1514463 (=> (not res!1034563) (not e!845136))))

(declare-datatypes ((List!35252 0))(
  ( (Nil!35249) (Cons!35248 (h!36661 (_ BitVec 64)) (t!49938 List!35252)) )
))
(declare-fun arrayNoDuplicates!0 (array!100906 (_ BitVec 32) List!35252) Bool)

(assert (=> b!1514463 (= res!1034563 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35249))))

(declare-fun b!1514464 () Bool)

(assert (=> b!1514464 (= e!845133 e!845132)))

(declare-fun res!1034566 () Bool)

(assert (=> b!1514464 (=> (not res!1034566) (not e!845132))))

(assert (=> b!1514464 (= res!1034566 (= (seekEntryOrOpen!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129050 res!1034562) b!1514453))

(assert (= (and b!1514453 res!1034571) b!1514456))

(assert (= (and b!1514456 res!1034570) b!1514462))

(assert (= (and b!1514462 res!1034565) b!1514457))

(assert (= (and b!1514457 res!1034567) b!1514463))

(assert (= (and b!1514463 res!1034563) b!1514451))

(assert (= (and b!1514451 res!1034573) b!1514452))

(assert (= (and b!1514452 res!1034561) b!1514461))

(assert (= (and b!1514461 res!1034564) b!1514459))

(assert (= (and b!1514459 res!1034568) b!1514455))

(assert (= (and b!1514455 res!1034569) b!1514454))

(assert (= (and b!1514454 res!1034560) b!1514460))

(assert (= (and b!1514460 (not res!1034572)) b!1514464))

(assert (= (and b!1514464 res!1034566) b!1514458))

(declare-fun m!1396871 () Bool)

(assert (=> b!1514457 m!1396871))

(declare-fun m!1396873 () Bool)

(assert (=> b!1514458 m!1396873))

(declare-fun m!1396875 () Bool)

(assert (=> b!1514458 m!1396875))

(declare-fun m!1396877 () Bool)

(assert (=> b!1514460 m!1396877))

(declare-fun m!1396879 () Bool)

(assert (=> b!1514460 m!1396879))

(declare-fun m!1396881 () Bool)

(assert (=> b!1514463 m!1396881))

(declare-fun m!1396883 () Bool)

(assert (=> b!1514459 m!1396883))

(assert (=> b!1514459 m!1396883))

(declare-fun m!1396885 () Bool)

(assert (=> b!1514459 m!1396885))

(declare-fun m!1396887 () Bool)

(assert (=> b!1514459 m!1396887))

(declare-fun m!1396889 () Bool)

(assert (=> b!1514459 m!1396889))

(declare-fun m!1396891 () Bool)

(assert (=> start!129050 m!1396891))

(declare-fun m!1396893 () Bool)

(assert (=> start!129050 m!1396893))

(assert (=> b!1514452 m!1396877))

(assert (=> b!1514452 m!1396877))

(declare-fun m!1396895 () Bool)

(assert (=> b!1514452 m!1396895))

(assert (=> b!1514452 m!1396895))

(assert (=> b!1514452 m!1396877))

(declare-fun m!1396897 () Bool)

(assert (=> b!1514452 m!1396897))

(assert (=> b!1514454 m!1396877))

(assert (=> b!1514454 m!1396877))

(declare-fun m!1396899 () Bool)

(assert (=> b!1514454 m!1396899))

(assert (=> b!1514462 m!1396877))

(assert (=> b!1514462 m!1396877))

(declare-fun m!1396901 () Bool)

(assert (=> b!1514462 m!1396901))

(assert (=> b!1514461 m!1396877))

(assert (=> b!1514461 m!1396877))

(declare-fun m!1396903 () Bool)

(assert (=> b!1514461 m!1396903))

(declare-fun m!1396905 () Bool)

(assert (=> b!1514455 m!1396905))

(declare-fun m!1396907 () Bool)

(assert (=> b!1514455 m!1396907))

(declare-fun m!1396909 () Bool)

(assert (=> b!1514456 m!1396909))

(assert (=> b!1514456 m!1396909))

(declare-fun m!1396911 () Bool)

(assert (=> b!1514456 m!1396911))

(assert (=> b!1514464 m!1396877))

(assert (=> b!1514464 m!1396877))

(declare-fun m!1396913 () Bool)

(assert (=> b!1514464 m!1396913))

(assert (=> b!1514464 m!1396877))

(declare-fun m!1396915 () Bool)

(assert (=> b!1514464 m!1396915))

(check-sat (not b!1514452) (not b!1514463) (not b!1514458) (not b!1514464) (not b!1514454) (not start!129050) (not b!1514462) (not b!1514459) (not b!1514455) (not b!1514457) (not b!1514461) (not b!1514456))
(check-sat)
