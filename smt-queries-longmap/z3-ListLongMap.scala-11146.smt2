; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130188 () Bool)

(assert start!130188)

(declare-fun b!1528535 () Bool)

(declare-fun res!1046437 () Bool)

(declare-fun e!851889 () Bool)

(assert (=> b!1528535 (=> (not res!1046437) (not e!851889))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101536 0))(
  ( (array!101537 (arr!48994 (Array (_ BitVec 32) (_ BitVec 64))) (size!49546 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101536)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528535 (= res!1046437 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49546 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49546 a!2804))))))

(declare-fun b!1528536 () Bool)

(declare-fun e!851890 () Bool)

(assert (=> b!1528536 (= e!851890 true)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!661953 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528536 (= lt!661953 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528537 () Bool)

(declare-fun res!1046431 () Bool)

(assert (=> b!1528537 (=> (not res!1046431) (not e!851889))))

(declare-datatypes ((List!35555 0))(
  ( (Nil!35552) (Cons!35551 (h!36988 (_ BitVec 64)) (t!50241 List!35555)) )
))
(declare-fun arrayNoDuplicates!0 (array!101536 (_ BitVec 32) List!35555) Bool)

(assert (=> b!1528537 (= res!1046431 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35552))))

(declare-fun b!1528538 () Bool)

(declare-fun e!851887 () Bool)

(assert (=> b!1528538 (= e!851887 (not e!851890))))

(declare-fun res!1046433 () Bool)

(assert (=> b!1528538 (=> res!1046433 e!851890)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528538 (= res!1046433 (or (not (= (select (arr!48994 a!2804) j!70) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!851888 () Bool)

(assert (=> b!1528538 e!851888))

(declare-fun res!1046427 () Bool)

(assert (=> b!1528538 (=> (not res!1046427) (not e!851888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101536 (_ BitVec 32)) Bool)

(assert (=> b!1528538 (= res!1046427 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50987 0))(
  ( (Unit!50988) )
))
(declare-fun lt!661950 () Unit!50987)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50987)

(assert (=> b!1528538 (= lt!661950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528539 () Bool)

(declare-fun res!1046428 () Bool)

(assert (=> b!1528539 (=> (not res!1046428) (not e!851887))))

(declare-datatypes ((SeekEntryResult!13182 0))(
  ( (MissingZero!13182 (index!55123 (_ BitVec 32))) (Found!13182 (index!55124 (_ BitVec 32))) (Intermediate!13182 (undefined!13994 Bool) (index!55125 (_ BitVec 32)) (x!136816 (_ BitVec 32))) (Undefined!13182) (MissingVacant!13182 (index!55126 (_ BitVec 32))) )
))
(declare-fun lt!661951 () SeekEntryResult!13182)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101536 (_ BitVec 32)) SeekEntryResult!13182)

(assert (=> b!1528539 (= res!1046428 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661951))))

(declare-fun b!1528540 () Bool)

(declare-fun res!1046435 () Bool)

(assert (=> b!1528540 (=> (not res!1046435) (not e!851889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528540 (= res!1046435 (validKeyInArray!0 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1528541 () Bool)

(assert (=> b!1528541 (= e!851889 e!851887)))

(declare-fun res!1046432 () Bool)

(assert (=> b!1528541 (=> (not res!1046432) (not e!851887))))

(declare-fun lt!661952 () SeekEntryResult!13182)

(assert (=> b!1528541 (= res!1046432 (= lt!661952 lt!661951))))

(assert (=> b!1528541 (= lt!661951 (Intermediate!13182 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528541 (= lt!661952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528542 () Bool)

(declare-fun res!1046430 () Bool)

(assert (=> b!1528542 (=> (not res!1046430) (not e!851887))))

(assert (=> b!1528542 (= res!1046430 (= lt!661952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101537 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49546 a!2804)) mask!2512)))))

(declare-fun b!1528543 () Bool)

(declare-fun res!1046434 () Bool)

(assert (=> b!1528543 (=> (not res!1046434) (not e!851889))))

(assert (=> b!1528543 (= res!1046434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528544 () Bool)

(declare-fun res!1046429 () Bool)

(assert (=> b!1528544 (=> (not res!1046429) (not e!851889))))

(assert (=> b!1528544 (= res!1046429 (and (= (size!49546 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49546 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49546 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1046436 () Bool)

(assert (=> start!130188 (=> (not res!1046436) (not e!851889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130188 (= res!1046436 (validMask!0 mask!2512))))

(assert (=> start!130188 e!851889))

(assert (=> start!130188 true))

(declare-fun array_inv!38227 (array!101536) Bool)

(assert (=> start!130188 (array_inv!38227 a!2804)))

(declare-fun b!1528545 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101536 (_ BitVec 32)) SeekEntryResult!13182)

(assert (=> b!1528545 (= e!851888 (= (seekEntry!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (Found!13182 j!70)))))

(declare-fun b!1528546 () Bool)

(declare-fun res!1046426 () Bool)

(assert (=> b!1528546 (=> (not res!1046426) (not e!851889))))

(assert (=> b!1528546 (= res!1046426 (validKeyInArray!0 (select (arr!48994 a!2804) i!961)))))

(assert (= (and start!130188 res!1046436) b!1528544))

(assert (= (and b!1528544 res!1046429) b!1528546))

(assert (= (and b!1528546 res!1046426) b!1528540))

(assert (= (and b!1528540 res!1046435) b!1528543))

(assert (= (and b!1528543 res!1046434) b!1528537))

(assert (= (and b!1528537 res!1046431) b!1528535))

(assert (= (and b!1528535 res!1046437) b!1528541))

(assert (= (and b!1528541 res!1046432) b!1528539))

(assert (= (and b!1528539 res!1046428) b!1528542))

(assert (= (and b!1528542 res!1046430) b!1528538))

(assert (= (and b!1528538 res!1046427) b!1528545))

(assert (= (and b!1528538 (not res!1046433)) b!1528536))

(declare-fun m!1410869 () Bool)

(assert (=> b!1528543 m!1410869))

(declare-fun m!1410871 () Bool)

(assert (=> b!1528536 m!1410871))

(declare-fun m!1410873 () Bool)

(assert (=> b!1528540 m!1410873))

(assert (=> b!1528540 m!1410873))

(declare-fun m!1410875 () Bool)

(assert (=> b!1528540 m!1410875))

(declare-fun m!1410877 () Bool)

(assert (=> b!1528537 m!1410877))

(declare-fun m!1410879 () Bool)

(assert (=> start!130188 m!1410879))

(declare-fun m!1410881 () Bool)

(assert (=> start!130188 m!1410881))

(assert (=> b!1528545 m!1410873))

(assert (=> b!1528545 m!1410873))

(declare-fun m!1410883 () Bool)

(assert (=> b!1528545 m!1410883))

(declare-fun m!1410885 () Bool)

(assert (=> b!1528546 m!1410885))

(assert (=> b!1528546 m!1410885))

(declare-fun m!1410887 () Bool)

(assert (=> b!1528546 m!1410887))

(assert (=> b!1528539 m!1410873))

(assert (=> b!1528539 m!1410873))

(declare-fun m!1410889 () Bool)

(assert (=> b!1528539 m!1410889))

(declare-fun m!1410891 () Bool)

(assert (=> b!1528542 m!1410891))

(declare-fun m!1410893 () Bool)

(assert (=> b!1528542 m!1410893))

(assert (=> b!1528542 m!1410893))

(declare-fun m!1410895 () Bool)

(assert (=> b!1528542 m!1410895))

(assert (=> b!1528542 m!1410895))

(assert (=> b!1528542 m!1410893))

(declare-fun m!1410897 () Bool)

(assert (=> b!1528542 m!1410897))

(assert (=> b!1528541 m!1410873))

(assert (=> b!1528541 m!1410873))

(declare-fun m!1410899 () Bool)

(assert (=> b!1528541 m!1410899))

(assert (=> b!1528541 m!1410899))

(assert (=> b!1528541 m!1410873))

(declare-fun m!1410901 () Bool)

(assert (=> b!1528541 m!1410901))

(assert (=> b!1528538 m!1410873))

(declare-fun m!1410903 () Bool)

(assert (=> b!1528538 m!1410903))

(assert (=> b!1528538 m!1410891))

(assert (=> b!1528538 m!1410893))

(declare-fun m!1410905 () Bool)

(assert (=> b!1528538 m!1410905))

(check-sat (not b!1528537) (not b!1528538) (not b!1528542) (not start!130188) (not b!1528539) (not b!1528543) (not b!1528546) (not b!1528540) (not b!1528545) (not b!1528536) (not b!1528541))
(check-sat)
