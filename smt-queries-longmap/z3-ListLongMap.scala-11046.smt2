; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129410 () Bool)

(assert start!129410)

(declare-fun b!1516749 () Bool)

(declare-fun res!1035478 () Bool)

(declare-fun e!846545 () Bool)

(assert (=> b!1516749 (=> (not res!1035478) (not e!846545))))

(declare-datatypes ((array!101080 0))(
  ( (array!101081 (arr!48772 (Array (_ BitVec 32) (_ BitVec 64))) (size!49323 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101080)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101080 (_ BitVec 32)) Bool)

(assert (=> b!1516749 (= res!1035478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516750 () Bool)

(declare-fun res!1035481 () Bool)

(assert (=> b!1516750 (=> (not res!1035481) (not e!846545))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1516750 (= res!1035481 (and (= (size!49323 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49323 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49323 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516751 () Bool)

(declare-fun e!846546 () Bool)

(declare-fun e!846548 () Bool)

(assert (=> b!1516751 (= e!846546 e!846548)))

(declare-fun res!1035475 () Bool)

(assert (=> b!1516751 (=> res!1035475 e!846548)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!657170 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516751 (= res!1035475 (or (not (= (select (arr!48772 a!2804) j!70) lt!657170)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48772 a!2804) index!487) (select (arr!48772 a!2804) j!70)) (not (= (select (arr!48772 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516752 () Bool)

(declare-fun res!1035477 () Bool)

(assert (=> b!1516752 (=> (not res!1035477) (not e!846545))))

(declare-datatypes ((List!35242 0))(
  ( (Nil!35239) (Cons!35238 (h!36665 (_ BitVec 64)) (t!49928 List!35242)) )
))
(declare-fun arrayNoDuplicates!0 (array!101080 (_ BitVec 32) List!35242) Bool)

(assert (=> b!1516752 (= res!1035477 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35239))))

(declare-fun b!1516753 () Bool)

(declare-fun res!1035483 () Bool)

(assert (=> b!1516753 (=> (not res!1035483) (not e!846546))))

(declare-datatypes ((SeekEntryResult!12836 0))(
  ( (MissingZero!12836 (index!53739 (_ BitVec 32))) (Found!12836 (index!53740 (_ BitVec 32))) (Intermediate!12836 (undefined!13648 Bool) (index!53741 (_ BitVec 32)) (x!135647 (_ BitVec 32))) (Undefined!12836) (MissingVacant!12836 (index!53742 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12836)

(assert (=> b!1516753 (= res!1035483 (= (seekEntry!0 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) (Found!12836 j!70)))))

(declare-fun b!1516754 () Bool)

(declare-fun res!1035484 () Bool)

(assert (=> b!1516754 (=> (not res!1035484) (not e!846545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516754 (= res!1035484 (validKeyInArray!0 (select (arr!48772 a!2804) j!70)))))

(declare-fun b!1516755 () Bool)

(declare-fun res!1035488 () Bool)

(declare-fun e!846549 () Bool)

(assert (=> b!1516755 (=> (not res!1035488) (not e!846549))))

(declare-fun lt!657168 () SeekEntryResult!12836)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12836)

(assert (=> b!1516755 (= res!1035488 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) lt!657168))))

(declare-fun e!846544 () Bool)

(declare-fun lt!657169 () array!101080)

(declare-fun b!1516756 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12836)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12836)

(assert (=> b!1516756 (= e!846544 (= (seekEntryOrOpen!0 lt!657170 lt!657169 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657170 lt!657169 mask!2512)))))

(declare-fun b!1516757 () Bool)

(declare-fun e!846543 () Bool)

(assert (=> b!1516757 (= e!846543 (not true))))

(assert (=> b!1516757 e!846546))

(declare-fun res!1035485 () Bool)

(assert (=> b!1516757 (=> (not res!1035485) (not e!846546))))

(assert (=> b!1516757 (= res!1035485 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50575 0))(
  ( (Unit!50576) )
))
(declare-fun lt!657171 () Unit!50575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50575)

(assert (=> b!1516757 (= lt!657171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1035480 () Bool)

(assert (=> start!129410 (=> (not res!1035480) (not e!846545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129410 (= res!1035480 (validMask!0 mask!2512))))

(assert (=> start!129410 e!846545))

(assert (=> start!129410 true))

(declare-fun array_inv!38053 (array!101080) Bool)

(assert (=> start!129410 (array_inv!38053 a!2804)))

(declare-fun b!1516758 () Bool)

(assert (=> b!1516758 (= e!846548 e!846544)))

(declare-fun res!1035482 () Bool)

(assert (=> b!1516758 (=> (not res!1035482) (not e!846544))))

(assert (=> b!1516758 (= res!1035482 (= (seekEntryOrOpen!0 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48772 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516759 () Bool)

(assert (=> b!1516759 (= e!846545 e!846549)))

(declare-fun res!1035476 () Bool)

(assert (=> b!1516759 (=> (not res!1035476) (not e!846549))))

(declare-fun lt!657172 () SeekEntryResult!12836)

(assert (=> b!1516759 (= res!1035476 (= lt!657172 lt!657168))))

(assert (=> b!1516759 (= lt!657168 (Intermediate!12836 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516759 (= lt!657172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48772 a!2804) j!70) mask!2512) (select (arr!48772 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516760 () Bool)

(assert (=> b!1516760 (= e!846549 e!846543)))

(declare-fun res!1035486 () Bool)

(assert (=> b!1516760 (=> (not res!1035486) (not e!846543))))

(assert (=> b!1516760 (= res!1035486 (= lt!657172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657170 mask!2512) lt!657170 lt!657169 mask!2512)))))

(assert (=> b!1516760 (= lt!657170 (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516760 (= lt!657169 (array!101081 (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49323 a!2804)))))

(declare-fun b!1516761 () Bool)

(declare-fun res!1035479 () Bool)

(assert (=> b!1516761 (=> (not res!1035479) (not e!846545))))

(assert (=> b!1516761 (= res!1035479 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49323 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49323 a!2804))))))

(declare-fun b!1516762 () Bool)

(declare-fun res!1035487 () Bool)

(assert (=> b!1516762 (=> (not res!1035487) (not e!846545))))

(assert (=> b!1516762 (= res!1035487 (validKeyInArray!0 (select (arr!48772 a!2804) i!961)))))

(assert (= (and start!129410 res!1035480) b!1516750))

(assert (= (and b!1516750 res!1035481) b!1516762))

(assert (= (and b!1516762 res!1035487) b!1516754))

(assert (= (and b!1516754 res!1035484) b!1516749))

(assert (= (and b!1516749 res!1035478) b!1516752))

(assert (= (and b!1516752 res!1035477) b!1516761))

(assert (= (and b!1516761 res!1035479) b!1516759))

(assert (= (and b!1516759 res!1035476) b!1516755))

(assert (= (and b!1516755 res!1035488) b!1516760))

(assert (= (and b!1516760 res!1035486) b!1516757))

(assert (= (and b!1516757 res!1035485) b!1516753))

(assert (= (and b!1516753 res!1035483) b!1516751))

(assert (= (and b!1516751 (not res!1035475)) b!1516758))

(assert (= (and b!1516758 res!1035482) b!1516756))

(declare-fun m!1399713 () Bool)

(assert (=> start!129410 m!1399713))

(declare-fun m!1399715 () Bool)

(assert (=> start!129410 m!1399715))

(declare-fun m!1399717 () Bool)

(assert (=> b!1516755 m!1399717))

(assert (=> b!1516755 m!1399717))

(declare-fun m!1399719 () Bool)

(assert (=> b!1516755 m!1399719))

(declare-fun m!1399721 () Bool)

(assert (=> b!1516757 m!1399721))

(declare-fun m!1399723 () Bool)

(assert (=> b!1516757 m!1399723))

(declare-fun m!1399725 () Bool)

(assert (=> b!1516756 m!1399725))

(declare-fun m!1399727 () Bool)

(assert (=> b!1516756 m!1399727))

(assert (=> b!1516759 m!1399717))

(assert (=> b!1516759 m!1399717))

(declare-fun m!1399729 () Bool)

(assert (=> b!1516759 m!1399729))

(assert (=> b!1516759 m!1399729))

(assert (=> b!1516759 m!1399717))

(declare-fun m!1399731 () Bool)

(assert (=> b!1516759 m!1399731))

(declare-fun m!1399733 () Bool)

(assert (=> b!1516760 m!1399733))

(assert (=> b!1516760 m!1399733))

(declare-fun m!1399735 () Bool)

(assert (=> b!1516760 m!1399735))

(declare-fun m!1399737 () Bool)

(assert (=> b!1516760 m!1399737))

(declare-fun m!1399739 () Bool)

(assert (=> b!1516760 m!1399739))

(declare-fun m!1399741 () Bool)

(assert (=> b!1516752 m!1399741))

(assert (=> b!1516754 m!1399717))

(assert (=> b!1516754 m!1399717))

(declare-fun m!1399743 () Bool)

(assert (=> b!1516754 m!1399743))

(assert (=> b!1516753 m!1399717))

(assert (=> b!1516753 m!1399717))

(declare-fun m!1399745 () Bool)

(assert (=> b!1516753 m!1399745))

(declare-fun m!1399747 () Bool)

(assert (=> b!1516762 m!1399747))

(assert (=> b!1516762 m!1399747))

(declare-fun m!1399749 () Bool)

(assert (=> b!1516762 m!1399749))

(declare-fun m!1399751 () Bool)

(assert (=> b!1516749 m!1399751))

(assert (=> b!1516751 m!1399717))

(declare-fun m!1399753 () Bool)

(assert (=> b!1516751 m!1399753))

(assert (=> b!1516758 m!1399717))

(assert (=> b!1516758 m!1399717))

(declare-fun m!1399755 () Bool)

(assert (=> b!1516758 m!1399755))

(assert (=> b!1516758 m!1399717))

(declare-fun m!1399757 () Bool)

(assert (=> b!1516758 m!1399757))

(check-sat (not b!1516753) (not b!1516757) (not start!129410) (not b!1516749) (not b!1516755) (not b!1516756) (not b!1516752) (not b!1516759) (not b!1516754) (not b!1516762) (not b!1516760) (not b!1516758))
(check-sat)
