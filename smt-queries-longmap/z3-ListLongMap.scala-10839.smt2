; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126882 () Bool)

(assert start!126882)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99655 0))(
  ( (array!99656 (arr!48099 (Array (_ BitVec 32) (_ BitVec 64))) (size!48649 (_ BitVec 32))) )
))
(declare-fun lt!650009 () array!99655)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!835268 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650008 () (_ BitVec 64))

(declare-fun b!1490626 () Bool)

(declare-datatypes ((SeekEntryResult!12339 0))(
  ( (MissingZero!12339 (index!51748 (_ BitVec 32))) (Found!12339 (index!51749 (_ BitVec 32))) (Intermediate!12339 (undefined!13151 Bool) (index!51750 (_ BitVec 32)) (x!133339 (_ BitVec 32))) (Undefined!12339) (MissingVacant!12339 (index!51751 (_ BitVec 32))) )
))
(declare-fun lt!650005 () SeekEntryResult!12339)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12339)

(assert (=> b!1490626 (= e!835268 (= lt!650005 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650008 lt!650009 mask!2687)))))

(declare-fun b!1490627 () Bool)

(declare-fun res!1013895 () Bool)

(declare-fun e!835265 () Bool)

(assert (=> b!1490627 (=> (not res!1013895) (not e!835265))))

(declare-fun a!2862 () array!99655)

(declare-datatypes ((List!34600 0))(
  ( (Nil!34597) (Cons!34596 (h!35979 (_ BitVec 64)) (t!49294 List!34600)) )
))
(declare-fun arrayNoDuplicates!0 (array!99655 (_ BitVec 32) List!34600) Bool)

(assert (=> b!1490627 (= res!1013895 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34597))))

(declare-fun b!1490628 () Bool)

(declare-fun e!835269 () Bool)

(declare-fun e!835266 () Bool)

(assert (=> b!1490628 (= e!835269 e!835266)))

(declare-fun res!1013891 () Bool)

(assert (=> b!1490628 (=> (not res!1013891) (not e!835266))))

(declare-fun lt!650006 () SeekEntryResult!12339)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490628 (= res!1013891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48099 a!2862) j!93) mask!2687) (select (arr!48099 a!2862) j!93) a!2862 mask!2687) lt!650006))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490628 (= lt!650006 (Intermediate!12339 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490629 () Bool)

(declare-fun e!835271 () Bool)

(declare-fun e!835270 () Bool)

(assert (=> b!1490629 (= e!835271 (not e!835270))))

(declare-fun res!1013890 () Bool)

(assert (=> b!1490629 (=> res!1013890 e!835270)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490629 (= res!1013890 (or (and (= (select (arr!48099 a!2862) index!646) (select (store (arr!48099 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48099 a!2862) index!646) (select (arr!48099 a!2862) j!93))) (= (select (arr!48099 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835264 () Bool)

(assert (=> b!1490629 e!835264))

(declare-fun res!1013887 () Bool)

(assert (=> b!1490629 (=> (not res!1013887) (not e!835264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99655 (_ BitVec 32)) Bool)

(assert (=> b!1490629 (= res!1013887 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50018 0))(
  ( (Unit!50019) )
))
(declare-fun lt!650010 () Unit!50018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50018)

(assert (=> b!1490629 (= lt!650010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490630 () Bool)

(declare-fun res!1013896 () Bool)

(assert (=> b!1490630 (=> (not res!1013896) (not e!835265))))

(assert (=> b!1490630 (= res!1013896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490631 () Bool)

(declare-fun res!1013886 () Bool)

(assert (=> b!1490631 (=> (not res!1013886) (not e!835265))))

(assert (=> b!1490631 (= res!1013886 (and (= (size!48649 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48649 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48649 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490632 () Bool)

(declare-fun res!1013897 () Bool)

(assert (=> b!1490632 (=> (not res!1013897) (not e!835271))))

(assert (=> b!1490632 (= res!1013897 e!835268)))

(declare-fun c!137898 () Bool)

(assert (=> b!1490632 (= c!137898 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490633 () Bool)

(assert (=> b!1490633 (= e!835270 true)))

(declare-fun lt!650007 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490633 (= lt!650007 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490634 () Bool)

(declare-fun res!1013888 () Bool)

(assert (=> b!1490634 (=> (not res!1013888) (not e!835265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490634 (= res!1013888 (validKeyInArray!0 (select (arr!48099 a!2862) i!1006)))))

(declare-fun b!1490635 () Bool)

(declare-fun res!1013884 () Bool)

(assert (=> b!1490635 (=> (not res!1013884) (not e!835271))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490635 (= res!1013884 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490636 () Bool)

(assert (=> b!1490636 (= e!835264 (or (= (select (arr!48099 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48099 a!2862) intermediateBeforeIndex!19) (select (arr!48099 a!2862) j!93))))))

(declare-fun b!1490637 () Bool)

(declare-fun res!1013894 () Bool)

(assert (=> b!1490637 (=> (not res!1013894) (not e!835266))))

(assert (=> b!1490637 (= res!1013894 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48099 a!2862) j!93) a!2862 mask!2687) lt!650006))))

(declare-fun b!1490638 () Bool)

(assert (=> b!1490638 (= e!835266 e!835271)))

(declare-fun res!1013898 () Bool)

(assert (=> b!1490638 (=> (not res!1013898) (not e!835271))))

(assert (=> b!1490638 (= res!1013898 (= lt!650005 (Intermediate!12339 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490638 (= lt!650005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650008 mask!2687) lt!650008 lt!650009 mask!2687))))

(assert (=> b!1490638 (= lt!650008 (select (store (arr!48099 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490639 () Bool)

(declare-fun res!1013885 () Bool)

(assert (=> b!1490639 (=> (not res!1013885) (not e!835265))))

(assert (=> b!1490639 (= res!1013885 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48649 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48649 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48649 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1013893 () Bool)

(assert (=> start!126882 (=> (not res!1013893) (not e!835265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126882 (= res!1013893 (validMask!0 mask!2687))))

(assert (=> start!126882 e!835265))

(assert (=> start!126882 true))

(declare-fun array_inv!37127 (array!99655) Bool)

(assert (=> start!126882 (array_inv!37127 a!2862)))

(declare-fun b!1490640 () Bool)

(declare-fun res!1013892 () Bool)

(assert (=> b!1490640 (=> (not res!1013892) (not e!835264))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12339)

(assert (=> b!1490640 (= res!1013892 (= (seekEntryOrOpen!0 (select (arr!48099 a!2862) j!93) a!2862 mask!2687) (Found!12339 j!93)))))

(declare-fun b!1490641 () Bool)

(declare-fun res!1013899 () Bool)

(assert (=> b!1490641 (=> (not res!1013899) (not e!835265))))

(assert (=> b!1490641 (= res!1013899 (validKeyInArray!0 (select (arr!48099 a!2862) j!93)))))

(declare-fun b!1490642 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12339)

(assert (=> b!1490642 (= e!835268 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650008 lt!650009 mask!2687) (seekEntryOrOpen!0 lt!650008 lt!650009 mask!2687)))))

(declare-fun b!1490643 () Bool)

(assert (=> b!1490643 (= e!835265 e!835269)))

(declare-fun res!1013889 () Bool)

(assert (=> b!1490643 (=> (not res!1013889) (not e!835269))))

(assert (=> b!1490643 (= res!1013889 (= (select (store (arr!48099 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490643 (= lt!650009 (array!99656 (store (arr!48099 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48649 a!2862)))))

(assert (= (and start!126882 res!1013893) b!1490631))

(assert (= (and b!1490631 res!1013886) b!1490634))

(assert (= (and b!1490634 res!1013888) b!1490641))

(assert (= (and b!1490641 res!1013899) b!1490630))

(assert (= (and b!1490630 res!1013896) b!1490627))

(assert (= (and b!1490627 res!1013895) b!1490639))

(assert (= (and b!1490639 res!1013885) b!1490643))

(assert (= (and b!1490643 res!1013889) b!1490628))

(assert (= (and b!1490628 res!1013891) b!1490637))

(assert (= (and b!1490637 res!1013894) b!1490638))

(assert (= (and b!1490638 res!1013898) b!1490632))

(assert (= (and b!1490632 c!137898) b!1490626))

(assert (= (and b!1490632 (not c!137898)) b!1490642))

(assert (= (and b!1490632 res!1013897) b!1490635))

(assert (= (and b!1490635 res!1013884) b!1490629))

(assert (= (and b!1490629 res!1013887) b!1490640))

(assert (= (and b!1490640 res!1013892) b!1490636))

(assert (= (and b!1490629 (not res!1013890)) b!1490633))

(declare-fun m!1374779 () Bool)

(assert (=> b!1490626 m!1374779))

(declare-fun m!1374781 () Bool)

(assert (=> b!1490638 m!1374781))

(assert (=> b!1490638 m!1374781))

(declare-fun m!1374783 () Bool)

(assert (=> b!1490638 m!1374783))

(declare-fun m!1374785 () Bool)

(assert (=> b!1490638 m!1374785))

(declare-fun m!1374787 () Bool)

(assert (=> b!1490638 m!1374787))

(declare-fun m!1374789 () Bool)

(assert (=> b!1490628 m!1374789))

(assert (=> b!1490628 m!1374789))

(declare-fun m!1374791 () Bool)

(assert (=> b!1490628 m!1374791))

(assert (=> b!1490628 m!1374791))

(assert (=> b!1490628 m!1374789))

(declare-fun m!1374793 () Bool)

(assert (=> b!1490628 m!1374793))

(assert (=> b!1490637 m!1374789))

(assert (=> b!1490637 m!1374789))

(declare-fun m!1374795 () Bool)

(assert (=> b!1490637 m!1374795))

(declare-fun m!1374797 () Bool)

(assert (=> b!1490634 m!1374797))

(assert (=> b!1490634 m!1374797))

(declare-fun m!1374799 () Bool)

(assert (=> b!1490634 m!1374799))

(declare-fun m!1374801 () Bool)

(assert (=> b!1490627 m!1374801))

(declare-fun m!1374803 () Bool)

(assert (=> b!1490642 m!1374803))

(declare-fun m!1374805 () Bool)

(assert (=> b!1490642 m!1374805))

(declare-fun m!1374807 () Bool)

(assert (=> b!1490629 m!1374807))

(assert (=> b!1490629 m!1374785))

(declare-fun m!1374809 () Bool)

(assert (=> b!1490629 m!1374809))

(declare-fun m!1374811 () Bool)

(assert (=> b!1490629 m!1374811))

(declare-fun m!1374813 () Bool)

(assert (=> b!1490629 m!1374813))

(assert (=> b!1490629 m!1374789))

(declare-fun m!1374815 () Bool)

(assert (=> b!1490630 m!1374815))

(declare-fun m!1374817 () Bool)

(assert (=> b!1490633 m!1374817))

(assert (=> b!1490643 m!1374785))

(declare-fun m!1374819 () Bool)

(assert (=> b!1490643 m!1374819))

(assert (=> b!1490640 m!1374789))

(assert (=> b!1490640 m!1374789))

(declare-fun m!1374821 () Bool)

(assert (=> b!1490640 m!1374821))

(declare-fun m!1374823 () Bool)

(assert (=> b!1490636 m!1374823))

(assert (=> b!1490636 m!1374789))

(declare-fun m!1374825 () Bool)

(assert (=> start!126882 m!1374825))

(declare-fun m!1374827 () Bool)

(assert (=> start!126882 m!1374827))

(assert (=> b!1490641 m!1374789))

(assert (=> b!1490641 m!1374789))

(declare-fun m!1374829 () Bool)

(assert (=> b!1490641 m!1374829))

(check-sat (not b!1490627) (not b!1490630) (not b!1490634) (not b!1490637) (not b!1490638) (not b!1490628) (not b!1490626) (not b!1490629) (not b!1490633) (not b!1490641) (not b!1490640) (not b!1490642) (not start!126882))
(check-sat)
