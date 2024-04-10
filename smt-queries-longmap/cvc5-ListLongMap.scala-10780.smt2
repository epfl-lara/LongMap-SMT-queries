; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126178 () Bool)

(assert start!126178)

(declare-fun b!1477786 () Bool)

(declare-fun res!1003885 () Bool)

(declare-fun e!829019 () Bool)

(assert (=> b!1477786 (=> (not res!1003885) (not e!829019))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99284 0))(
  ( (array!99285 (arr!47921 (Array (_ BitVec 32) (_ BitVec 64))) (size!48471 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99284)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477786 (= res!1003885 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48471 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48471 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48471 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477787 () Bool)

(declare-fun e!829020 () Bool)

(declare-fun e!829022 () Bool)

(assert (=> b!1477787 (= e!829020 e!829022)))

(declare-fun res!1003887 () Bool)

(assert (=> b!1477787 (=> (not res!1003887) (not e!829022))))

(declare-datatypes ((SeekEntryResult!12161 0))(
  ( (MissingZero!12161 (index!51036 (_ BitVec 32))) (Found!12161 (index!51037 (_ BitVec 32))) (Intermediate!12161 (undefined!12973 Bool) (index!51038 (_ BitVec 32)) (x!132632 (_ BitVec 32))) (Undefined!12161) (MissingVacant!12161 (index!51039 (_ BitVec 32))) )
))
(declare-fun lt!645463 () SeekEntryResult!12161)

(assert (=> b!1477787 (= res!1003887 (= lt!645463 (Intermediate!12161 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645465 () array!99284)

(declare-fun lt!645466 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99284 (_ BitVec 32)) SeekEntryResult!12161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477787 (= lt!645463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645466 mask!2687) lt!645466 lt!645465 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477787 (= lt!645466 (select (store (arr!47921 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477788 () Bool)

(assert (=> b!1477788 (= e!829022 (not true))))

(declare-fun e!829021 () Bool)

(assert (=> b!1477788 e!829021))

(declare-fun res!1003888 () Bool)

(assert (=> b!1477788 (=> (not res!1003888) (not e!829021))))

(declare-fun lt!645468 () SeekEntryResult!12161)

(assert (=> b!1477788 (= res!1003888 (and (= lt!645468 (Found!12161 j!93)) (or (= (select (arr!47921 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47921 a!2862) intermediateBeforeIndex!19) (select (arr!47921 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99284 (_ BitVec 32)) SeekEntryResult!12161)

(assert (=> b!1477788 (= lt!645468 (seekEntryOrOpen!0 (select (arr!47921 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99284 (_ BitVec 32)) Bool)

(assert (=> b!1477788 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49662 0))(
  ( (Unit!49663) )
))
(declare-fun lt!645464 () Unit!49662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49662)

(assert (=> b!1477788 (= lt!645464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477789 () Bool)

(declare-fun e!829023 () Bool)

(assert (=> b!1477789 (= e!829023 (= lt!645463 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645466 lt!645465 mask!2687)))))

(declare-fun b!1477791 () Bool)

(declare-fun res!1003873 () Bool)

(assert (=> b!1477791 (=> (not res!1003873) (not e!829020))))

(declare-fun lt!645467 () SeekEntryResult!12161)

(assert (=> b!1477791 (= res!1003873 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47921 a!2862) j!93) a!2862 mask!2687) lt!645467))))

(declare-fun b!1477792 () Bool)

(declare-fun e!829018 () Bool)

(declare-fun e!829025 () Bool)

(assert (=> b!1477792 (= e!829018 e!829025)))

(declare-fun res!1003880 () Bool)

(assert (=> b!1477792 (=> (not res!1003880) (not e!829025))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99284 (_ BitVec 32)) SeekEntryResult!12161)

(assert (=> b!1477792 (= res!1003880 (= lt!645468 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47921 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477793 () Bool)

(declare-fun res!1003882 () Bool)

(assert (=> b!1477793 (=> (not res!1003882) (not e!829019))))

(declare-datatypes ((List!34422 0))(
  ( (Nil!34419) (Cons!34418 (h!35786 (_ BitVec 64)) (t!49116 List!34422)) )
))
(declare-fun arrayNoDuplicates!0 (array!99284 (_ BitVec 32) List!34422) Bool)

(assert (=> b!1477793 (= res!1003882 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34419))))

(declare-fun b!1477794 () Bool)

(declare-fun res!1003878 () Bool)

(assert (=> b!1477794 (=> (not res!1003878) (not e!829022))))

(assert (=> b!1477794 (= res!1003878 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477795 () Bool)

(assert (=> b!1477795 (= e!829021 e!829018)))

(declare-fun res!1003874 () Bool)

(assert (=> b!1477795 (=> res!1003874 e!829018)))

(assert (=> b!1477795 (= res!1003874 (or (and (= (select (arr!47921 a!2862) index!646) (select (store (arr!47921 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47921 a!2862) index!646) (select (arr!47921 a!2862) j!93))) (not (= (select (arr!47921 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477796 () Bool)

(declare-fun e!829017 () Bool)

(assert (=> b!1477796 (= e!829017 e!829020)))

(declare-fun res!1003886 () Bool)

(assert (=> b!1477796 (=> (not res!1003886) (not e!829020))))

(assert (=> b!1477796 (= res!1003886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47921 a!2862) j!93) mask!2687) (select (arr!47921 a!2862) j!93) a!2862 mask!2687) lt!645467))))

(assert (=> b!1477796 (= lt!645467 (Intermediate!12161 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477797 () Bool)

(assert (=> b!1477797 (= e!829019 e!829017)))

(declare-fun res!1003881 () Bool)

(assert (=> b!1477797 (=> (not res!1003881) (not e!829017))))

(assert (=> b!1477797 (= res!1003881 (= (select (store (arr!47921 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477797 (= lt!645465 (array!99285 (store (arr!47921 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48471 a!2862)))))

(declare-fun b!1477798 () Bool)

(declare-fun res!1003875 () Bool)

(assert (=> b!1477798 (=> (not res!1003875) (not e!829019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477798 (= res!1003875 (validKeyInArray!0 (select (arr!47921 a!2862) i!1006)))))

(declare-fun b!1477799 () Bool)

(assert (=> b!1477799 (= e!829023 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645466 lt!645465 mask!2687) (seekEntryOrOpen!0 lt!645466 lt!645465 mask!2687)))))

(declare-fun b!1477800 () Bool)

(declare-fun res!1003877 () Bool)

(assert (=> b!1477800 (=> (not res!1003877) (not e!829019))))

(assert (=> b!1477800 (= res!1003877 (and (= (size!48471 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48471 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48471 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477801 () Bool)

(declare-fun res!1003876 () Bool)

(assert (=> b!1477801 (=> (not res!1003876) (not e!829022))))

(assert (=> b!1477801 (= res!1003876 e!829023)))

(declare-fun c!136476 () Bool)

(assert (=> b!1477801 (= c!136476 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1003879 () Bool)

(assert (=> start!126178 (=> (not res!1003879) (not e!829019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126178 (= res!1003879 (validMask!0 mask!2687))))

(assert (=> start!126178 e!829019))

(assert (=> start!126178 true))

(declare-fun array_inv!36949 (array!99284) Bool)

(assert (=> start!126178 (array_inv!36949 a!2862)))

(declare-fun b!1477790 () Bool)

(assert (=> b!1477790 (= e!829025 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477802 () Bool)

(declare-fun res!1003884 () Bool)

(assert (=> b!1477802 (=> (not res!1003884) (not e!829019))))

(assert (=> b!1477802 (= res!1003884 (validKeyInArray!0 (select (arr!47921 a!2862) j!93)))))

(declare-fun b!1477803 () Bool)

(declare-fun res!1003883 () Bool)

(assert (=> b!1477803 (=> (not res!1003883) (not e!829019))))

(assert (=> b!1477803 (= res!1003883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126178 res!1003879) b!1477800))

(assert (= (and b!1477800 res!1003877) b!1477798))

(assert (= (and b!1477798 res!1003875) b!1477802))

(assert (= (and b!1477802 res!1003884) b!1477803))

(assert (= (and b!1477803 res!1003883) b!1477793))

(assert (= (and b!1477793 res!1003882) b!1477786))

(assert (= (and b!1477786 res!1003885) b!1477797))

(assert (= (and b!1477797 res!1003881) b!1477796))

(assert (= (and b!1477796 res!1003886) b!1477791))

(assert (= (and b!1477791 res!1003873) b!1477787))

(assert (= (and b!1477787 res!1003887) b!1477801))

(assert (= (and b!1477801 c!136476) b!1477789))

(assert (= (and b!1477801 (not c!136476)) b!1477799))

(assert (= (and b!1477801 res!1003876) b!1477794))

(assert (= (and b!1477794 res!1003878) b!1477788))

(assert (= (and b!1477788 res!1003888) b!1477795))

(assert (= (and b!1477795 (not res!1003874)) b!1477792))

(assert (= (and b!1477792 res!1003880) b!1477790))

(declare-fun m!1363723 () Bool)

(assert (=> b!1477795 m!1363723))

(declare-fun m!1363725 () Bool)

(assert (=> b!1477795 m!1363725))

(declare-fun m!1363727 () Bool)

(assert (=> b!1477795 m!1363727))

(declare-fun m!1363729 () Bool)

(assert (=> b!1477795 m!1363729))

(assert (=> b!1477792 m!1363729))

(assert (=> b!1477792 m!1363729))

(declare-fun m!1363731 () Bool)

(assert (=> b!1477792 m!1363731))

(assert (=> b!1477797 m!1363725))

(declare-fun m!1363733 () Bool)

(assert (=> b!1477797 m!1363733))

(declare-fun m!1363735 () Bool)

(assert (=> b!1477798 m!1363735))

(assert (=> b!1477798 m!1363735))

(declare-fun m!1363737 () Bool)

(assert (=> b!1477798 m!1363737))

(declare-fun m!1363739 () Bool)

(assert (=> b!1477789 m!1363739))

(declare-fun m!1363741 () Bool)

(assert (=> b!1477803 m!1363741))

(declare-fun m!1363743 () Bool)

(assert (=> b!1477793 m!1363743))

(assert (=> b!1477791 m!1363729))

(assert (=> b!1477791 m!1363729))

(declare-fun m!1363745 () Bool)

(assert (=> b!1477791 m!1363745))

(declare-fun m!1363747 () Bool)

(assert (=> b!1477787 m!1363747))

(assert (=> b!1477787 m!1363747))

(declare-fun m!1363749 () Bool)

(assert (=> b!1477787 m!1363749))

(assert (=> b!1477787 m!1363725))

(declare-fun m!1363751 () Bool)

(assert (=> b!1477787 m!1363751))

(declare-fun m!1363753 () Bool)

(assert (=> b!1477788 m!1363753))

(declare-fun m!1363755 () Bool)

(assert (=> b!1477788 m!1363755))

(assert (=> b!1477788 m!1363729))

(declare-fun m!1363757 () Bool)

(assert (=> b!1477788 m!1363757))

(declare-fun m!1363759 () Bool)

(assert (=> b!1477788 m!1363759))

(assert (=> b!1477788 m!1363729))

(assert (=> b!1477796 m!1363729))

(assert (=> b!1477796 m!1363729))

(declare-fun m!1363761 () Bool)

(assert (=> b!1477796 m!1363761))

(assert (=> b!1477796 m!1363761))

(assert (=> b!1477796 m!1363729))

(declare-fun m!1363763 () Bool)

(assert (=> b!1477796 m!1363763))

(declare-fun m!1363765 () Bool)

(assert (=> b!1477799 m!1363765))

(declare-fun m!1363767 () Bool)

(assert (=> b!1477799 m!1363767))

(declare-fun m!1363769 () Bool)

(assert (=> start!126178 m!1363769))

(declare-fun m!1363771 () Bool)

(assert (=> start!126178 m!1363771))

(assert (=> b!1477802 m!1363729))

(assert (=> b!1477802 m!1363729))

(declare-fun m!1363773 () Bool)

(assert (=> b!1477802 m!1363773))

(push 1)

