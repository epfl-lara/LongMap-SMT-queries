; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129656 () Bool)

(assert start!129656)

(declare-fun res!1039286 () Bool)

(declare-fun e!848477 () Bool)

(assert (=> start!129656 (=> (not res!1039286) (not e!848477))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129656 (= res!1039286 (validMask!0 mask!2512))))

(assert (=> start!129656 e!848477))

(assert (=> start!129656 true))

(declare-datatypes ((array!101275 0))(
  ( (array!101276 (arr!48868 (Array (_ BitVec 32) (_ BitVec 64))) (size!49419 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101275)

(declare-fun array_inv!38149 (array!101275) Bool)

(assert (=> start!129656 (array_inv!38149 a!2804)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1520730 () Bool)

(declare-fun e!848474 () Bool)

(declare-datatypes ((SeekEntryResult!12932 0))(
  ( (MissingZero!12932 (index!54123 (_ BitVec 32))) (Found!12932 (index!54124 (_ BitVec 32))) (Intermediate!12932 (undefined!13744 Bool) (index!54125 (_ BitVec 32)) (x!136005 (_ BitVec 32))) (Undefined!12932) (MissingVacant!12932 (index!54126 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101275 (_ BitVec 32)) SeekEntryResult!12932)

(assert (=> b!1520730 (= e!848474 (= (seekEntry!0 (select (arr!48868 a!2804) j!70) a!2804 mask!2512) (Found!12932 j!70)))))

(declare-fun b!1520731 () Bool)

(declare-fun res!1039283 () Bool)

(assert (=> b!1520731 (=> (not res!1039283) (not e!848477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520731 (= res!1039283 (validKeyInArray!0 (select (arr!48868 a!2804) j!70)))))

(declare-fun b!1520732 () Bool)

(declare-fun res!1039273 () Bool)

(declare-fun e!848478 () Bool)

(assert (=> b!1520732 (=> res!1039273 e!848478)))

(declare-fun lt!659053 () (_ BitVec 32))

(declare-fun lt!659058 () SeekEntryResult!12932)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101275 (_ BitVec 32)) SeekEntryResult!12932)

(assert (=> b!1520732 (= res!1039273 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659053 (select (arr!48868 a!2804) j!70) a!2804 mask!2512) lt!659058)))))

(declare-fun b!1520733 () Bool)

(declare-fun res!1039278 () Bool)

(assert (=> b!1520733 (=> (not res!1039278) (not e!848477))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520733 (= res!1039278 (validKeyInArray!0 (select (arr!48868 a!2804) i!961)))))

(declare-fun b!1520734 () Bool)

(declare-fun res!1039276 () Bool)

(declare-fun e!848473 () Bool)

(assert (=> b!1520734 (=> (not res!1039276) (not e!848473))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1520734 (= res!1039276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48868 a!2804) j!70) a!2804 mask!2512) lt!659058))))

(declare-fun b!1520735 () Bool)

(declare-fun res!1039285 () Bool)

(assert (=> b!1520735 (=> (not res!1039285) (not e!848477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101275 (_ BitVec 32)) Bool)

(assert (=> b!1520735 (= res!1039285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520736 () Bool)

(declare-fun res!1039280 () Bool)

(assert (=> b!1520736 (=> (not res!1039280) (not e!848477))))

(declare-datatypes ((List!35338 0))(
  ( (Nil!35335) (Cons!35334 (h!36764 (_ BitVec 64)) (t!50024 List!35338)) )
))
(declare-fun arrayNoDuplicates!0 (array!101275 (_ BitVec 32) List!35338) Bool)

(assert (=> b!1520736 (= res!1039280 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35335))))

(declare-fun b!1520737 () Bool)

(declare-fun e!848475 () Bool)

(assert (=> b!1520737 (= e!848473 e!848475)))

(declare-fun res!1039277 () Bool)

(assert (=> b!1520737 (=> (not res!1039277) (not e!848475))))

(declare-fun lt!659056 () (_ BitVec 64))

(declare-fun lt!659059 () SeekEntryResult!12932)

(declare-fun lt!659054 () array!101275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520737 (= res!1039277 (= lt!659059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659056 mask!2512) lt!659056 lt!659054 mask!2512)))))

(assert (=> b!1520737 (= lt!659056 (select (store (arr!48868 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1520737 (= lt!659054 (array!101276 (store (arr!48868 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49419 a!2804)))))

(declare-fun b!1520738 () Bool)

(declare-fun res!1039274 () Bool)

(assert (=> b!1520738 (=> (not res!1039274) (not e!848477))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520738 (= res!1039274 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49419 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49419 a!2804))))))

(declare-fun b!1520739 () Bool)

(assert (=> b!1520739 (= e!848477 e!848473)))

(declare-fun res!1039279 () Bool)

(assert (=> b!1520739 (=> (not res!1039279) (not e!848473))))

(assert (=> b!1520739 (= res!1039279 (= lt!659059 lt!659058))))

(assert (=> b!1520739 (= lt!659058 (Intermediate!12932 false resIndex!21 resX!21))))

(assert (=> b!1520739 (= lt!659059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48868 a!2804) j!70) mask!2512) (select (arr!48868 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520740 () Bool)

(assert (=> b!1520740 (= e!848478 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101275 (_ BitVec 32)) SeekEntryResult!12932)

(assert (=> b!1520740 (= (seekEntryOrOpen!0 (select (arr!48868 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659056 lt!659054 mask!2512))))

(declare-datatypes ((Unit!50767 0))(
  ( (Unit!50768) )
))
(declare-fun lt!659055 () Unit!50767)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50767)

(assert (=> b!1520740 (= lt!659055 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659053 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1520741 () Bool)

(declare-fun e!848476 () Bool)

(assert (=> b!1520741 (= e!848475 (not e!848476))))

(declare-fun res!1039282 () Bool)

(assert (=> b!1520741 (=> res!1039282 e!848476)))

(assert (=> b!1520741 (= res!1039282 (or (not (= (select (arr!48868 a!2804) j!70) lt!659056)) (= x!534 resX!21)))))

(assert (=> b!1520741 e!848474))

(declare-fun res!1039284 () Bool)

(assert (=> b!1520741 (=> (not res!1039284) (not e!848474))))

(assert (=> b!1520741 (= res!1039284 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!659057 () Unit!50767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50767)

(assert (=> b!1520741 (= lt!659057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520742 () Bool)

(declare-fun res!1039275 () Bool)

(assert (=> b!1520742 (=> (not res!1039275) (not e!848477))))

(assert (=> b!1520742 (= res!1039275 (and (= (size!49419 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49419 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49419 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520743 () Bool)

(assert (=> b!1520743 (= e!848476 e!848478)))

(declare-fun res!1039281 () Bool)

(assert (=> b!1520743 (=> res!1039281 e!848478)))

(assert (=> b!1520743 (= res!1039281 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659053 #b00000000000000000000000000000000) (bvsge lt!659053 (size!49419 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520743 (= lt!659053 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (= (and start!129656 res!1039286) b!1520742))

(assert (= (and b!1520742 res!1039275) b!1520733))

(assert (= (and b!1520733 res!1039278) b!1520731))

(assert (= (and b!1520731 res!1039283) b!1520735))

(assert (= (and b!1520735 res!1039285) b!1520736))

(assert (= (and b!1520736 res!1039280) b!1520738))

(assert (= (and b!1520738 res!1039274) b!1520739))

(assert (= (and b!1520739 res!1039279) b!1520734))

(assert (= (and b!1520734 res!1039276) b!1520737))

(assert (= (and b!1520737 res!1039277) b!1520741))

(assert (= (and b!1520741 res!1039284) b!1520730))

(assert (= (and b!1520741 (not res!1039282)) b!1520743))

(assert (= (and b!1520743 (not res!1039281)) b!1520732))

(assert (= (and b!1520732 (not res!1039273)) b!1520740))

(declare-fun m!1403907 () Bool)

(assert (=> b!1520737 m!1403907))

(assert (=> b!1520737 m!1403907))

(declare-fun m!1403909 () Bool)

(assert (=> b!1520737 m!1403909))

(declare-fun m!1403911 () Bool)

(assert (=> b!1520737 m!1403911))

(declare-fun m!1403913 () Bool)

(assert (=> b!1520737 m!1403913))

(declare-fun m!1403915 () Bool)

(assert (=> b!1520741 m!1403915))

(declare-fun m!1403917 () Bool)

(assert (=> b!1520741 m!1403917))

(declare-fun m!1403919 () Bool)

(assert (=> b!1520741 m!1403919))

(assert (=> b!1520734 m!1403915))

(assert (=> b!1520734 m!1403915))

(declare-fun m!1403921 () Bool)

(assert (=> b!1520734 m!1403921))

(assert (=> b!1520740 m!1403915))

(assert (=> b!1520740 m!1403915))

(declare-fun m!1403923 () Bool)

(assert (=> b!1520740 m!1403923))

(declare-fun m!1403925 () Bool)

(assert (=> b!1520740 m!1403925))

(declare-fun m!1403927 () Bool)

(assert (=> b!1520740 m!1403927))

(assert (=> b!1520732 m!1403915))

(assert (=> b!1520732 m!1403915))

(declare-fun m!1403929 () Bool)

(assert (=> b!1520732 m!1403929))

(assert (=> b!1520739 m!1403915))

(assert (=> b!1520739 m!1403915))

(declare-fun m!1403931 () Bool)

(assert (=> b!1520739 m!1403931))

(assert (=> b!1520739 m!1403931))

(assert (=> b!1520739 m!1403915))

(declare-fun m!1403933 () Bool)

(assert (=> b!1520739 m!1403933))

(declare-fun m!1403935 () Bool)

(assert (=> b!1520735 m!1403935))

(declare-fun m!1403937 () Bool)

(assert (=> b!1520733 m!1403937))

(assert (=> b!1520733 m!1403937))

(declare-fun m!1403939 () Bool)

(assert (=> b!1520733 m!1403939))

(declare-fun m!1403941 () Bool)

(assert (=> start!129656 m!1403941))

(declare-fun m!1403943 () Bool)

(assert (=> start!129656 m!1403943))

(assert (=> b!1520730 m!1403915))

(assert (=> b!1520730 m!1403915))

(declare-fun m!1403945 () Bool)

(assert (=> b!1520730 m!1403945))

(declare-fun m!1403947 () Bool)

(assert (=> b!1520743 m!1403947))

(assert (=> b!1520731 m!1403915))

(assert (=> b!1520731 m!1403915))

(declare-fun m!1403949 () Bool)

(assert (=> b!1520731 m!1403949))

(declare-fun m!1403951 () Bool)

(assert (=> b!1520736 m!1403951))

(check-sat (not b!1520743) (not b!1520733) (not b!1520731) (not b!1520739) (not b!1520741) (not b!1520730) (not b!1520740) (not b!1520732) (not b!1520737) (not b!1520734) (not b!1520735) (not start!129656) (not b!1520736))
(check-sat)
