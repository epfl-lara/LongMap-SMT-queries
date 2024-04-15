; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129552 () Bool)

(assert start!129552)

(declare-fun b!1521122 () Bool)

(declare-fun res!1040553 () Bool)

(declare-fun e!848321 () Bool)

(assert (=> b!1521122 (=> (not res!1040553) (not e!848321))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101227 0))(
  ( (array!101228 (arr!48847 (Array (_ BitVec 32) (_ BitVec 64))) (size!49399 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101227)

(assert (=> b!1521122 (= res!1040553 (and (= (size!49399 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49399 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49399 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521123 () Bool)

(declare-fun res!1040557 () Bool)

(declare-fun e!848320 () Bool)

(assert (=> b!1521123 (=> (not res!1040557) (not e!848320))))

(declare-datatypes ((SeekEntryResult!13035 0))(
  ( (MissingZero!13035 (index!54535 (_ BitVec 32))) (Found!13035 (index!54536 (_ BitVec 32))) (Intermediate!13035 (undefined!13847 Bool) (index!54537 (_ BitVec 32)) (x!136233 (_ BitVec 32))) (Undefined!13035) (MissingVacant!13035 (index!54538 (_ BitVec 32))) )
))
(declare-fun lt!659061 () SeekEntryResult!13035)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101227 (_ BitVec 32)) SeekEntryResult!13035)

(assert (=> b!1521123 (= res!1040557 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48847 a!2804) j!70) a!2804 mask!2512) lt!659061))))

(declare-fun b!1521124 () Bool)

(declare-fun res!1040556 () Bool)

(assert (=> b!1521124 (=> (not res!1040556) (not e!848321))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521124 (= res!1040556 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49399 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49399 a!2804))))))

(declare-fun res!1040550 () Bool)

(assert (=> start!129552 (=> (not res!1040550) (not e!848321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129552 (= res!1040550 (validMask!0 mask!2512))))

(assert (=> start!129552 e!848321))

(assert (=> start!129552 true))

(declare-fun array_inv!38080 (array!101227) Bool)

(assert (=> start!129552 (array_inv!38080 a!2804)))

(declare-fun b!1521125 () Bool)

(declare-fun res!1040558 () Bool)

(assert (=> b!1521125 (=> (not res!1040558) (not e!848321))))

(declare-datatypes ((List!35408 0))(
  ( (Nil!35405) (Cons!35404 (h!36826 (_ BitVec 64)) (t!50094 List!35408)) )
))
(declare-fun arrayNoDuplicates!0 (array!101227 (_ BitVec 32) List!35408) Bool)

(assert (=> b!1521125 (= res!1040558 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35405))))

(declare-fun b!1521126 () Bool)

(declare-fun res!1040551 () Bool)

(assert (=> b!1521126 (=> (not res!1040551) (not e!848321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521126 (= res!1040551 (validKeyInArray!0 (select (arr!48847 a!2804) j!70)))))

(declare-fun b!1521127 () Bool)

(declare-fun res!1040555 () Bool)

(assert (=> b!1521127 (=> (not res!1040555) (not e!848321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101227 (_ BitVec 32)) Bool)

(assert (=> b!1521127 (= res!1040555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521128 () Bool)

(assert (=> b!1521128 (= e!848321 e!848320)))

(declare-fun res!1040552 () Bool)

(assert (=> b!1521128 (=> (not res!1040552) (not e!848320))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521128 (= res!1040552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48847 a!2804) j!70) mask!2512) (select (arr!48847 a!2804) j!70) a!2804 mask!2512) lt!659061))))

(assert (=> b!1521128 (= lt!659061 (Intermediate!13035 false resIndex!21 resX!21))))

(declare-fun b!1521129 () Bool)

(declare-fun res!1040554 () Bool)

(assert (=> b!1521129 (=> (not res!1040554) (not e!848321))))

(assert (=> b!1521129 (= res!1040554 (validKeyInArray!0 (select (arr!48847 a!2804) i!961)))))

(declare-fun b!1521130 () Bool)

(assert (=> b!1521130 (= e!848320 false)))

(declare-fun lt!659060 () (_ BitVec 32))

(assert (=> b!1521130 (= lt!659060 (toIndex!0 (select (store (arr!48847 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(assert (= (and start!129552 res!1040550) b!1521122))

(assert (= (and b!1521122 res!1040553) b!1521129))

(assert (= (and b!1521129 res!1040554) b!1521126))

(assert (= (and b!1521126 res!1040551) b!1521127))

(assert (= (and b!1521127 res!1040555) b!1521125))

(assert (= (and b!1521125 res!1040558) b!1521124))

(assert (= (and b!1521124 res!1040556) b!1521128))

(assert (= (and b!1521128 res!1040552) b!1521123))

(assert (= (and b!1521123 res!1040557) b!1521130))

(declare-fun m!1403643 () Bool)

(assert (=> b!1521128 m!1403643))

(assert (=> b!1521128 m!1403643))

(declare-fun m!1403645 () Bool)

(assert (=> b!1521128 m!1403645))

(assert (=> b!1521128 m!1403645))

(assert (=> b!1521128 m!1403643))

(declare-fun m!1403647 () Bool)

(assert (=> b!1521128 m!1403647))

(declare-fun m!1403649 () Bool)

(assert (=> b!1521129 m!1403649))

(assert (=> b!1521129 m!1403649))

(declare-fun m!1403651 () Bool)

(assert (=> b!1521129 m!1403651))

(assert (=> b!1521123 m!1403643))

(assert (=> b!1521123 m!1403643))

(declare-fun m!1403653 () Bool)

(assert (=> b!1521123 m!1403653))

(declare-fun m!1403655 () Bool)

(assert (=> b!1521127 m!1403655))

(declare-fun m!1403657 () Bool)

(assert (=> b!1521130 m!1403657))

(declare-fun m!1403659 () Bool)

(assert (=> b!1521130 m!1403659))

(assert (=> b!1521130 m!1403659))

(declare-fun m!1403661 () Bool)

(assert (=> b!1521130 m!1403661))

(declare-fun m!1403663 () Bool)

(assert (=> start!129552 m!1403663))

(declare-fun m!1403665 () Bool)

(assert (=> start!129552 m!1403665))

(declare-fun m!1403667 () Bool)

(assert (=> b!1521125 m!1403667))

(assert (=> b!1521126 m!1403643))

(assert (=> b!1521126 m!1403643))

(declare-fun m!1403669 () Bool)

(assert (=> b!1521126 m!1403669))

(check-sat (not b!1521130) (not b!1521126) (not b!1521129) (not start!129552) (not b!1521123) (not b!1521127) (not b!1521125) (not b!1521128))
(check-sat)
