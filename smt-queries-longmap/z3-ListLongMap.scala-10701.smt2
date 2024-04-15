; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125314 () Bool)

(assert start!125314)

(declare-fun b!1464630 () Bool)

(declare-fun e!823037 () Bool)

(declare-fun e!823041 () Bool)

(assert (=> b!1464630 (= e!823037 e!823041)))

(declare-fun res!993753 () Bool)

(assert (=> b!1464630 (=> res!993753 e!823041)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640976 () (_ BitVec 32))

(declare-datatypes ((array!98740 0))(
  ( (array!98741 (arr!47659 (Array (_ BitVec 32) (_ BitVec 64))) (size!48211 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98740)

(assert (=> b!1464630 (= res!993753 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640976 #b00000000000000000000000000000000) (bvsge lt!640976 (size!48211 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464630 (= lt!640976 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464631 () Bool)

(declare-fun res!993754 () Bool)

(declare-fun e!823040 () Bool)

(assert (=> b!1464631 (=> (not res!993754) (not e!823040))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11936 0))(
  ( (MissingZero!11936 (index!50136 (_ BitVec 32))) (Found!11936 (index!50137 (_ BitVec 32))) (Intermediate!11936 (undefined!12748 Bool) (index!50138 (_ BitVec 32)) (x!131716 (_ BitVec 32))) (Undefined!11936) (MissingVacant!11936 (index!50139 (_ BitVec 32))) )
))
(declare-fun lt!640975 () SeekEntryResult!11936)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11936)

(assert (=> b!1464631 (= res!993754 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640975))))

(declare-fun e!823044 () Bool)

(declare-fun lt!640977 () array!98740)

(declare-fun b!1464632 () Bool)

(declare-fun lt!640980 () SeekEntryResult!11936)

(declare-fun lt!640978 () (_ BitVec 64))

(assert (=> b!1464632 (= e!823044 (= lt!640980 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640978 lt!640977 mask!2687)))))

(declare-fun b!1464633 () Bool)

(declare-fun res!993763 () Bool)

(assert (=> b!1464633 (=> res!993763 e!823041)))

(assert (=> b!1464633 (= res!993763 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640976 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640975)))))

(declare-fun res!993748 () Bool)

(declare-fun e!823043 () Bool)

(assert (=> start!125314 (=> (not res!993748) (not e!823043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125314 (= res!993748 (validMask!0 mask!2687))))

(assert (=> start!125314 e!823043))

(assert (=> start!125314 true))

(declare-fun array_inv!36892 (array!98740) Bool)

(assert (=> start!125314 (array_inv!36892 a!2862)))

(declare-fun b!1464634 () Bool)

(assert (=> b!1464634 (= e!823041 true)))

(declare-fun lt!640974 () Bool)

(declare-fun e!823036 () Bool)

(assert (=> b!1464634 (= lt!640974 e!823036)))

(declare-fun c!134956 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464634 (= c!134956 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464635 () Bool)

(declare-fun res!993750 () Bool)

(assert (=> b!1464635 (=> (not res!993750) (not e!823043))))

(declare-datatypes ((List!34238 0))(
  ( (Nil!34235) (Cons!34234 (h!35584 (_ BitVec 64)) (t!48924 List!34238)) )
))
(declare-fun arrayNoDuplicates!0 (array!98740 (_ BitVec 32) List!34238) Bool)

(assert (=> b!1464635 (= res!993750 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34235))))

(declare-fun b!1464636 () Bool)

(declare-fun res!993761 () Bool)

(assert (=> b!1464636 (=> (not res!993761) (not e!823043))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464636 (= res!993761 (and (= (size!48211 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48211 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48211 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464637 () Bool)

(declare-fun res!993759 () Bool)

(assert (=> b!1464637 (=> (not res!993759) (not e!823043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464637 (= res!993759 (validKeyInArray!0 (select (arr!47659 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!823039 () Bool)

(declare-fun b!1464638 () Bool)

(assert (=> b!1464638 (= e!823039 (or (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) (select (arr!47659 a!2862) j!93))))))

(declare-fun b!1464639 () Bool)

(declare-fun e!823038 () Bool)

(assert (=> b!1464639 (= e!823038 (not e!823037))))

(declare-fun res!993755 () Bool)

(assert (=> b!1464639 (=> res!993755 e!823037)))

(assert (=> b!1464639 (= res!993755 (or (and (= (select (arr!47659 a!2862) index!646) (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47659 a!2862) index!646) (select (arr!47659 a!2862) j!93))) (= (select (arr!47659 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464639 e!823039))

(declare-fun res!993747 () Bool)

(assert (=> b!1464639 (=> (not res!993747) (not e!823039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98740 (_ BitVec 32)) Bool)

(assert (=> b!1464639 (= res!993747 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49209 0))(
  ( (Unit!49210) )
))
(declare-fun lt!640979 () Unit!49209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49209)

(assert (=> b!1464639 (= lt!640979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464640 () Bool)

(declare-fun res!993757 () Bool)

(assert (=> b!1464640 (=> (not res!993757) (not e!823043))))

(assert (=> b!1464640 (= res!993757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464641 () Bool)

(declare-fun res!993751 () Bool)

(assert (=> b!1464641 (=> (not res!993751) (not e!823038))))

(assert (=> b!1464641 (= res!993751 e!823044)))

(declare-fun c!134955 () Bool)

(assert (=> b!1464641 (= c!134955 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464642 () Bool)

(assert (=> b!1464642 (= e!823040 e!823038)))

(declare-fun res!993749 () Bool)

(assert (=> b!1464642 (=> (not res!993749) (not e!823038))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464642 (= res!993749 (= lt!640980 (Intermediate!11936 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464642 (= lt!640980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640978 mask!2687) lt!640978 lt!640977 mask!2687))))

(assert (=> b!1464642 (= lt!640978 (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464643 () Bool)

(declare-fun res!993756 () Bool)

(assert (=> b!1464643 (=> (not res!993756) (not e!823043))))

(assert (=> b!1464643 (= res!993756 (validKeyInArray!0 (select (arr!47659 a!2862) j!93)))))

(declare-fun b!1464644 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11936)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11936)

(assert (=> b!1464644 (= e!823044 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640978 lt!640977 mask!2687) (seekEntryOrOpen!0 lt!640978 lt!640977 mask!2687)))))

(declare-fun b!1464645 () Bool)

(declare-fun e!823042 () Bool)

(assert (=> b!1464645 (= e!823043 e!823042)))

(declare-fun res!993762 () Bool)

(assert (=> b!1464645 (=> (not res!993762) (not e!823042))))

(assert (=> b!1464645 (= res!993762 (= (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464645 (= lt!640977 (array!98741 (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48211 a!2862)))))

(declare-fun b!1464646 () Bool)

(declare-fun res!993746 () Bool)

(assert (=> b!1464646 (=> (not res!993746) (not e!823038))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464646 (= res!993746 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464647 () Bool)

(declare-fun res!993760 () Bool)

(assert (=> b!1464647 (=> (not res!993760) (not e!823039))))

(assert (=> b!1464647 (= res!993760 (= (seekEntryOrOpen!0 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) (Found!11936 j!93)))))

(declare-fun b!1464648 () Bool)

(assert (=> b!1464648 (= e!823036 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640976 intermediateAfterIndex!19 lt!640978 lt!640977 mask!2687) (seekEntryOrOpen!0 lt!640978 lt!640977 mask!2687))))))

(declare-fun b!1464649 () Bool)

(assert (=> b!1464649 (= e!823042 e!823040)))

(declare-fun res!993752 () Bool)

(assert (=> b!1464649 (=> (not res!993752) (not e!823040))))

(assert (=> b!1464649 (= res!993752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47659 a!2862) j!93) mask!2687) (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640975))))

(assert (=> b!1464649 (= lt!640975 (Intermediate!11936 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464650 () Bool)

(assert (=> b!1464650 (= e!823036 (not (= lt!640980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640976 lt!640978 lt!640977 mask!2687))))))

(declare-fun b!1464651 () Bool)

(declare-fun res!993758 () Bool)

(assert (=> b!1464651 (=> (not res!993758) (not e!823043))))

(assert (=> b!1464651 (= res!993758 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48211 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48211 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48211 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125314 res!993748) b!1464636))

(assert (= (and b!1464636 res!993761) b!1464637))

(assert (= (and b!1464637 res!993759) b!1464643))

(assert (= (and b!1464643 res!993756) b!1464640))

(assert (= (and b!1464640 res!993757) b!1464635))

(assert (= (and b!1464635 res!993750) b!1464651))

(assert (= (and b!1464651 res!993758) b!1464645))

(assert (= (and b!1464645 res!993762) b!1464649))

(assert (= (and b!1464649 res!993752) b!1464631))

(assert (= (and b!1464631 res!993754) b!1464642))

(assert (= (and b!1464642 res!993749) b!1464641))

(assert (= (and b!1464641 c!134955) b!1464632))

(assert (= (and b!1464641 (not c!134955)) b!1464644))

(assert (= (and b!1464641 res!993751) b!1464646))

(assert (= (and b!1464646 res!993746) b!1464639))

(assert (= (and b!1464639 res!993747) b!1464647))

(assert (= (and b!1464647 res!993760) b!1464638))

(assert (= (and b!1464639 (not res!993755)) b!1464630))

(assert (= (and b!1464630 (not res!993753)) b!1464633))

(assert (= (and b!1464633 (not res!993763)) b!1464634))

(assert (= (and b!1464634 c!134956) b!1464650))

(assert (= (and b!1464634 (not c!134956)) b!1464648))

(declare-fun m!1351317 () Bool)

(assert (=> b!1464640 m!1351317))

(declare-fun m!1351319 () Bool)

(assert (=> b!1464635 m!1351319))

(declare-fun m!1351321 () Bool)

(assert (=> b!1464633 m!1351321))

(assert (=> b!1464633 m!1351321))

(declare-fun m!1351323 () Bool)

(assert (=> b!1464633 m!1351323))

(declare-fun m!1351325 () Bool)

(assert (=> b!1464637 m!1351325))

(assert (=> b!1464637 m!1351325))

(declare-fun m!1351327 () Bool)

(assert (=> b!1464637 m!1351327))

(assert (=> b!1464631 m!1351321))

(assert (=> b!1464631 m!1351321))

(declare-fun m!1351329 () Bool)

(assert (=> b!1464631 m!1351329))

(assert (=> b!1464649 m!1351321))

(assert (=> b!1464649 m!1351321))

(declare-fun m!1351331 () Bool)

(assert (=> b!1464649 m!1351331))

(assert (=> b!1464649 m!1351331))

(assert (=> b!1464649 m!1351321))

(declare-fun m!1351333 () Bool)

(assert (=> b!1464649 m!1351333))

(declare-fun m!1351335 () Bool)

(assert (=> b!1464630 m!1351335))

(declare-fun m!1351337 () Bool)

(assert (=> start!125314 m!1351337))

(declare-fun m!1351339 () Bool)

(assert (=> start!125314 m!1351339))

(declare-fun m!1351341 () Bool)

(assert (=> b!1464639 m!1351341))

(declare-fun m!1351343 () Bool)

(assert (=> b!1464639 m!1351343))

(declare-fun m!1351345 () Bool)

(assert (=> b!1464639 m!1351345))

(declare-fun m!1351347 () Bool)

(assert (=> b!1464639 m!1351347))

(declare-fun m!1351349 () Bool)

(assert (=> b!1464639 m!1351349))

(assert (=> b!1464639 m!1351321))

(declare-fun m!1351351 () Bool)

(assert (=> b!1464632 m!1351351))

(declare-fun m!1351353 () Bool)

(assert (=> b!1464644 m!1351353))

(declare-fun m!1351355 () Bool)

(assert (=> b!1464644 m!1351355))

(assert (=> b!1464643 m!1351321))

(assert (=> b!1464643 m!1351321))

(declare-fun m!1351357 () Bool)

(assert (=> b!1464643 m!1351357))

(assert (=> b!1464645 m!1351343))

(declare-fun m!1351359 () Bool)

(assert (=> b!1464645 m!1351359))

(assert (=> b!1464647 m!1351321))

(assert (=> b!1464647 m!1351321))

(declare-fun m!1351361 () Bool)

(assert (=> b!1464647 m!1351361))

(declare-fun m!1351363 () Bool)

(assert (=> b!1464650 m!1351363))

(declare-fun m!1351365 () Bool)

(assert (=> b!1464642 m!1351365))

(assert (=> b!1464642 m!1351365))

(declare-fun m!1351367 () Bool)

(assert (=> b!1464642 m!1351367))

(assert (=> b!1464642 m!1351343))

(declare-fun m!1351369 () Bool)

(assert (=> b!1464642 m!1351369))

(declare-fun m!1351371 () Bool)

(assert (=> b!1464638 m!1351371))

(assert (=> b!1464638 m!1351321))

(declare-fun m!1351373 () Bool)

(assert (=> b!1464648 m!1351373))

(assert (=> b!1464648 m!1351355))

(check-sat (not b!1464640) (not b!1464632) (not b!1464644) (not b!1464639) (not b!1464647) (not b!1464631) (not b!1464635) (not b!1464637) (not b!1464649) (not b!1464648) (not b!1464630) (not b!1464633) (not b!1464650) (not b!1464643) (not b!1464642) (not start!125314))
(check-sat)
