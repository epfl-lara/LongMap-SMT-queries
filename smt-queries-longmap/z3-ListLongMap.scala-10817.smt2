; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126828 () Bool)

(assert start!126828)

(declare-fun b!1486823 () Bool)

(declare-fun e!833670 () Bool)

(declare-fun e!833669 () Bool)

(assert (=> b!1486823 (= e!833670 e!833669)))

(declare-fun res!1010438 () Bool)

(assert (=> b!1486823 (=> res!1010438 e!833669)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99628 0))(
  ( (array!99629 (arr!48085 (Array (_ BitVec 32) (_ BitVec 64))) (size!48636 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99628)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!648627 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1486823 (= res!1010438 (or (and (= (select (arr!48085 a!2862) index!646) lt!648627) (= (select (arr!48085 a!2862) index!646) (select (arr!48085 a!2862) j!93))) (= (select (arr!48085 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486823 (= lt!648627 (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun lt!648624 () array!99628)

(declare-fun e!833664 () Bool)

(declare-fun b!1486824 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!648628 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12222 0))(
  ( (MissingZero!12222 (index!51280 (_ BitVec 32))) (Found!12222 (index!51281 (_ BitVec 32))) (Intermediate!12222 (undefined!13034 Bool) (index!51282 (_ BitVec 32)) (x!133043 (_ BitVec 32))) (Undefined!12222) (MissingVacant!12222 (index!51283 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99628 (_ BitVec 32)) SeekEntryResult!12222)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99628 (_ BitVec 32)) SeekEntryResult!12222)

(assert (=> b!1486824 (= e!833664 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648628 lt!648624 mask!2687) (seekEntryOrOpen!0 lt!648628 lt!648624 mask!2687)))))

(declare-fun b!1486825 () Bool)

(declare-fun res!1010456 () Bool)

(declare-fun e!833662 () Bool)

(assert (=> b!1486825 (=> (not res!1010456) (not e!833662))))

(declare-fun lt!648626 () SeekEntryResult!12222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99628 (_ BitVec 32)) SeekEntryResult!12222)

(assert (=> b!1486825 (= res!1010456 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!648626))))

(declare-fun b!1486826 () Bool)

(declare-fun e!833668 () Bool)

(assert (=> b!1486826 (= e!833669 e!833668)))

(declare-fun res!1010448 () Bool)

(assert (=> b!1486826 (=> (not res!1010448) (not e!833668))))

(assert (=> b!1486826 (= res!1010448 (and (= index!646 intermediateAfterIndex!19) (= lt!648627 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486827 () Bool)

(declare-fun lt!648625 () SeekEntryResult!12222)

(assert (=> b!1486827 (= e!833664 (= lt!648625 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648628 lt!648624 mask!2687)))))

(declare-fun b!1486828 () Bool)

(declare-fun res!1010449 () Bool)

(declare-fun e!833666 () Bool)

(assert (=> b!1486828 (=> (not res!1010449) (not e!833666))))

(declare-datatypes ((List!34573 0))(
  ( (Nil!34570) (Cons!34569 (h!35957 (_ BitVec 64)) (t!49259 List!34573)) )
))
(declare-fun arrayNoDuplicates!0 (array!99628 (_ BitVec 32) List!34573) Bool)

(assert (=> b!1486828 (= res!1010449 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34570))))

(declare-fun res!1010441 () Bool)

(assert (=> start!126828 (=> (not res!1010441) (not e!833666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126828 (= res!1010441 (validMask!0 mask!2687))))

(assert (=> start!126828 e!833666))

(assert (=> start!126828 true))

(declare-fun array_inv!37366 (array!99628) Bool)

(assert (=> start!126828 (array_inv!37366 a!2862)))

(declare-fun b!1486829 () Bool)

(declare-fun res!1010443 () Bool)

(assert (=> b!1486829 (=> (not res!1010443) (not e!833670))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1486829 (= res!1010443 (or (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) (select (arr!48085 a!2862) j!93))))))

(declare-fun b!1486830 () Bool)

(declare-fun res!1010439 () Bool)

(assert (=> b!1486830 (=> (not res!1010439) (not e!833666))))

(assert (=> b!1486830 (= res!1010439 (and (= (size!48636 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48636 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48636 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486831 () Bool)

(declare-fun res!1010445 () Bool)

(assert (=> b!1486831 (=> (not res!1010445) (not e!833670))))

(assert (=> b!1486831 (= res!1010445 (= (seekEntryOrOpen!0 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) (Found!12222 j!93)))))

(declare-fun b!1486832 () Bool)

(declare-fun res!1010442 () Bool)

(declare-fun e!833661 () Bool)

(assert (=> b!1486832 (=> (not res!1010442) (not e!833661))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486832 (= res!1010442 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486833 () Bool)

(declare-fun e!833667 () Bool)

(assert (=> b!1486833 (= e!833666 e!833667)))

(declare-fun res!1010453 () Bool)

(assert (=> b!1486833 (=> (not res!1010453) (not e!833667))))

(assert (=> b!1486833 (= res!1010453 (= (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486833 (= lt!648624 (array!99629 (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48636 a!2862)))))

(declare-fun b!1486834 () Bool)

(declare-fun res!1010454 () Bool)

(assert (=> b!1486834 (=> (not res!1010454) (not e!833666))))

(assert (=> b!1486834 (= res!1010454 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48636 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48636 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48636 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486835 () Bool)

(assert (=> b!1486835 (= e!833662 e!833661)))

(declare-fun res!1010446 () Bool)

(assert (=> b!1486835 (=> (not res!1010446) (not e!833661))))

(assert (=> b!1486835 (= res!1010446 (= lt!648625 (Intermediate!12222 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486835 (= lt!648625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648628 mask!2687) lt!648628 lt!648624 mask!2687))))

(assert (=> b!1486835 (= lt!648628 (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486836 () Bool)

(declare-fun e!833665 () Bool)

(assert (=> b!1486836 (= e!833661 (not e!833665))))

(declare-fun res!1010455 () Bool)

(assert (=> b!1486836 (=> res!1010455 e!833665)))

(assert (=> b!1486836 (= res!1010455 (or (and (= (select (arr!48085 a!2862) index!646) (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48085 a!2862) index!646) (select (arr!48085 a!2862) j!93))) (= (select (arr!48085 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486836 e!833670))

(declare-fun res!1010450 () Bool)

(assert (=> b!1486836 (=> (not res!1010450) (not e!833670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99628 (_ BitVec 32)) Bool)

(assert (=> b!1486836 (= res!1010450 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49817 0))(
  ( (Unit!49818) )
))
(declare-fun lt!648623 () Unit!49817)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49817)

(assert (=> b!1486836 (= lt!648623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486837 () Bool)

(declare-fun res!1010452 () Bool)

(assert (=> b!1486837 (=> (not res!1010452) (not e!833661))))

(assert (=> b!1486837 (= res!1010452 e!833664)))

(declare-fun c!137725 () Bool)

(assert (=> b!1486837 (= c!137725 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486838 () Bool)

(assert (=> b!1486838 (= e!833668 (= (seekEntryOrOpen!0 lt!648628 lt!648624 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648628 lt!648624 mask!2687)))))

(declare-fun b!1486839 () Bool)

(declare-fun res!1010451 () Bool)

(assert (=> b!1486839 (=> (not res!1010451) (not e!833666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486839 (= res!1010451 (validKeyInArray!0 (select (arr!48085 a!2862) i!1006)))))

(declare-fun b!1486840 () Bool)

(assert (=> b!1486840 (= e!833667 e!833662)))

(declare-fun res!1010447 () Bool)

(assert (=> b!1486840 (=> (not res!1010447) (not e!833662))))

(assert (=> b!1486840 (= res!1010447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48085 a!2862) j!93) mask!2687) (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!648626))))

(assert (=> b!1486840 (= lt!648626 (Intermediate!12222 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486841 () Bool)

(assert (=> b!1486841 (= e!833665 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!648622 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486841 (= lt!648622 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1486842 () Bool)

(declare-fun res!1010440 () Bool)

(assert (=> b!1486842 (=> (not res!1010440) (not e!833666))))

(assert (=> b!1486842 (= res!1010440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486843 () Bool)

(declare-fun res!1010444 () Bool)

(assert (=> b!1486843 (=> (not res!1010444) (not e!833666))))

(assert (=> b!1486843 (= res!1010444 (validKeyInArray!0 (select (arr!48085 a!2862) j!93)))))

(assert (= (and start!126828 res!1010441) b!1486830))

(assert (= (and b!1486830 res!1010439) b!1486839))

(assert (= (and b!1486839 res!1010451) b!1486843))

(assert (= (and b!1486843 res!1010444) b!1486842))

(assert (= (and b!1486842 res!1010440) b!1486828))

(assert (= (and b!1486828 res!1010449) b!1486834))

(assert (= (and b!1486834 res!1010454) b!1486833))

(assert (= (and b!1486833 res!1010453) b!1486840))

(assert (= (and b!1486840 res!1010447) b!1486825))

(assert (= (and b!1486825 res!1010456) b!1486835))

(assert (= (and b!1486835 res!1010446) b!1486837))

(assert (= (and b!1486837 c!137725) b!1486827))

(assert (= (and b!1486837 (not c!137725)) b!1486824))

(assert (= (and b!1486837 res!1010452) b!1486832))

(assert (= (and b!1486832 res!1010442) b!1486836))

(assert (= (and b!1486836 res!1010450) b!1486831))

(assert (= (and b!1486831 res!1010445) b!1486829))

(assert (= (and b!1486829 res!1010443) b!1486823))

(assert (= (and b!1486823 (not res!1010438)) b!1486826))

(assert (= (and b!1486826 res!1010448) b!1486838))

(assert (= (and b!1486836 (not res!1010455)) b!1486841))

(declare-fun m!1371991 () Bool)

(assert (=> b!1486823 m!1371991))

(declare-fun m!1371993 () Bool)

(assert (=> b!1486823 m!1371993))

(declare-fun m!1371995 () Bool)

(assert (=> b!1486823 m!1371995))

(declare-fun m!1371997 () Bool)

(assert (=> b!1486823 m!1371997))

(declare-fun m!1371999 () Bool)

(assert (=> b!1486841 m!1371999))

(declare-fun m!1372001 () Bool)

(assert (=> b!1486836 m!1372001))

(assert (=> b!1486836 m!1371995))

(assert (=> b!1486836 m!1371997))

(assert (=> b!1486836 m!1371991))

(declare-fun m!1372003 () Bool)

(assert (=> b!1486836 m!1372003))

(assert (=> b!1486836 m!1371993))

(assert (=> b!1486833 m!1371995))

(declare-fun m!1372005 () Bool)

(assert (=> b!1486833 m!1372005))

(declare-fun m!1372007 () Bool)

(assert (=> b!1486839 m!1372007))

(assert (=> b!1486839 m!1372007))

(declare-fun m!1372009 () Bool)

(assert (=> b!1486839 m!1372009))

(declare-fun m!1372011 () Bool)

(assert (=> start!126828 m!1372011))

(declare-fun m!1372013 () Bool)

(assert (=> start!126828 m!1372013))

(declare-fun m!1372015 () Bool)

(assert (=> b!1486824 m!1372015))

(declare-fun m!1372017 () Bool)

(assert (=> b!1486824 m!1372017))

(declare-fun m!1372019 () Bool)

(assert (=> b!1486827 m!1372019))

(assert (=> b!1486838 m!1372017))

(assert (=> b!1486838 m!1372015))

(declare-fun m!1372021 () Bool)

(assert (=> b!1486828 m!1372021))

(assert (=> b!1486840 m!1371993))

(assert (=> b!1486840 m!1371993))

(declare-fun m!1372023 () Bool)

(assert (=> b!1486840 m!1372023))

(assert (=> b!1486840 m!1372023))

(assert (=> b!1486840 m!1371993))

(declare-fun m!1372025 () Bool)

(assert (=> b!1486840 m!1372025))

(assert (=> b!1486825 m!1371993))

(assert (=> b!1486825 m!1371993))

(declare-fun m!1372027 () Bool)

(assert (=> b!1486825 m!1372027))

(declare-fun m!1372029 () Bool)

(assert (=> b!1486829 m!1372029))

(assert (=> b!1486829 m!1371993))

(declare-fun m!1372031 () Bool)

(assert (=> b!1486842 m!1372031))

(assert (=> b!1486843 m!1371993))

(assert (=> b!1486843 m!1371993))

(declare-fun m!1372033 () Bool)

(assert (=> b!1486843 m!1372033))

(declare-fun m!1372035 () Bool)

(assert (=> b!1486835 m!1372035))

(assert (=> b!1486835 m!1372035))

(declare-fun m!1372037 () Bool)

(assert (=> b!1486835 m!1372037))

(assert (=> b!1486835 m!1371995))

(declare-fun m!1372039 () Bool)

(assert (=> b!1486835 m!1372039))

(assert (=> b!1486831 m!1371993))

(assert (=> b!1486831 m!1371993))

(declare-fun m!1372041 () Bool)

(assert (=> b!1486831 m!1372041))

(check-sat (not b!1486836) (not b!1486843) (not b!1486824) (not b!1486840) (not b!1486835) (not b!1486838) (not b!1486825) (not b!1486842) (not start!126828) (not b!1486831) (not b!1486841) (not b!1486839) (not b!1486828) (not b!1486827))
(check-sat)
