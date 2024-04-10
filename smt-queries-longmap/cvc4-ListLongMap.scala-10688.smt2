; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125270 () Bool)

(assert start!125270)

(declare-fun b!1462383 () Bool)

(declare-fun res!991826 () Bool)

(declare-fun e!822045 () Bool)

(assert (=> b!1462383 (=> (not res!991826) (not e!822045))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98718 0))(
  ( (array!98719 (arr!47647 (Array (_ BitVec 32) (_ BitVec 64))) (size!48197 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98718)

(assert (=> b!1462383 (= res!991826 (and (= (size!48197 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48197 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48197 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462384 () Bool)

(declare-fun e!822042 () Bool)

(declare-fun e!822050 () Bool)

(assert (=> b!1462384 (= e!822042 e!822050)))

(declare-fun res!991835 () Bool)

(assert (=> b!1462384 (=> (not res!991835) (not e!822050))))

(declare-datatypes ((SeekEntryResult!11899 0))(
  ( (MissingZero!11899 (index!49988 (_ BitVec 32))) (Found!11899 (index!49989 (_ BitVec 32))) (Intermediate!11899 (undefined!12711 Bool) (index!49990 (_ BitVec 32)) (x!131580 (_ BitVec 32))) (Undefined!11899) (MissingVacant!11899 (index!49991 (_ BitVec 32))) )
))
(declare-fun lt!640434 () SeekEntryResult!11899)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98718 (_ BitVec 32)) SeekEntryResult!11899)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462384 (= res!991835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47647 a!2862) j!93) mask!2687) (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640434))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462384 (= lt!640434 (Intermediate!11899 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1462385 () Bool)

(declare-fun lt!640432 () (_ BitVec 64))

(declare-fun lt!640436 () array!98718)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640435 () SeekEntryResult!11899)

(declare-fun e!822047 () Bool)

(assert (=> b!1462385 (= e!822047 (= lt!640435 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640432 lt!640436 mask!2687)))))

(declare-fun b!1462386 () Bool)

(declare-fun e!822048 () Bool)

(declare-fun e!822044 () Bool)

(assert (=> b!1462386 (= e!822048 e!822044)))

(declare-fun res!991827 () Bool)

(assert (=> b!1462386 (=> res!991827 e!822044)))

(declare-fun lt!640431 () (_ BitVec 32))

(assert (=> b!1462386 (= res!991827 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640431 #b00000000000000000000000000000000) (bvsge lt!640431 (size!48197 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462386 (= lt!640431 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462387 () Bool)

(declare-fun e!822049 () Bool)

(assert (=> b!1462387 (= e!822049 (or (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47647 a!2862) intermediateBeforeIndex!19) (select (arr!47647 a!2862) j!93))))))

(declare-fun b!1462388 () Bool)

(declare-fun res!991839 () Bool)

(assert (=> b!1462388 (=> (not res!991839) (not e!822045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462388 (= res!991839 (validKeyInArray!0 (select (arr!47647 a!2862) i!1006)))))

(declare-fun b!1462389 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98718 (_ BitVec 32)) SeekEntryResult!11899)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98718 (_ BitVec 32)) SeekEntryResult!11899)

(assert (=> b!1462389 (= e!822047 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640432 lt!640436 mask!2687) (seekEntryOrOpen!0 lt!640432 lt!640436 mask!2687)))))

(declare-fun b!1462390 () Bool)

(declare-fun e!822046 () Bool)

(assert (=> b!1462390 (= e!822046 (not (= lt!640435 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640431 lt!640432 lt!640436 mask!2687))))))

(declare-fun b!1462391 () Bool)

(declare-fun res!991832 () Bool)

(assert (=> b!1462391 (=> (not res!991832) (not e!822045))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462391 (= res!991832 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48197 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48197 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48197 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!991834 () Bool)

(assert (=> start!125270 (=> (not res!991834) (not e!822045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125270 (= res!991834 (validMask!0 mask!2687))))

(assert (=> start!125270 e!822045))

(assert (=> start!125270 true))

(declare-fun array_inv!36675 (array!98718) Bool)

(assert (=> start!125270 (array_inv!36675 a!2862)))

(declare-fun b!1462392 () Bool)

(declare-fun res!991842 () Bool)

(declare-fun e!822041 () Bool)

(assert (=> b!1462392 (=> (not res!991842) (not e!822041))))

(assert (=> b!1462392 (= res!991842 e!822047)))

(declare-fun c!134789 () Bool)

(assert (=> b!1462392 (= c!134789 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462393 () Bool)

(declare-fun res!991840 () Bool)

(assert (=> b!1462393 (=> (not res!991840) (not e!822050))))

(assert (=> b!1462393 (= res!991840 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640434))))

(declare-fun b!1462394 () Bool)

(declare-fun res!991838 () Bool)

(assert (=> b!1462394 (=> (not res!991838) (not e!822041))))

(assert (=> b!1462394 (= res!991838 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462395 () Bool)

(declare-fun res!991837 () Bool)

(assert (=> b!1462395 (=> (not res!991837) (not e!822045))))

(declare-datatypes ((List!34148 0))(
  ( (Nil!34145) (Cons!34144 (h!35494 (_ BitVec 64)) (t!48842 List!34148)) )
))
(declare-fun arrayNoDuplicates!0 (array!98718 (_ BitVec 32) List!34148) Bool)

(assert (=> b!1462395 (= res!991837 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34145))))

(declare-fun b!1462396 () Bool)

(assert (=> b!1462396 (= e!822041 (not e!822048))))

(declare-fun res!991841 () Bool)

(assert (=> b!1462396 (=> res!991841 e!822048)))

(assert (=> b!1462396 (= res!991841 (or (and (= (select (arr!47647 a!2862) index!646) (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47647 a!2862) index!646) (select (arr!47647 a!2862) j!93))) (= (select (arr!47647 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462396 e!822049))

(declare-fun res!991830 () Bool)

(assert (=> b!1462396 (=> (not res!991830) (not e!822049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98718 (_ BitVec 32)) Bool)

(assert (=> b!1462396 (= res!991830 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49294 0))(
  ( (Unit!49295) )
))
(declare-fun lt!640437 () Unit!49294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49294)

(assert (=> b!1462396 (= lt!640437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462397 () Bool)

(assert (=> b!1462397 (= e!822044 true)))

(declare-fun lt!640433 () Bool)

(assert (=> b!1462397 (= lt!640433 e!822046)))

(declare-fun c!134790 () Bool)

(assert (=> b!1462397 (= c!134790 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462398 () Bool)

(declare-fun res!991843 () Bool)

(assert (=> b!1462398 (=> (not res!991843) (not e!822049))))

(assert (=> b!1462398 (= res!991843 (= (seekEntryOrOpen!0 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) (Found!11899 j!93)))))

(declare-fun b!1462399 () Bool)

(declare-fun res!991828 () Bool)

(assert (=> b!1462399 (=> res!991828 e!822044)))

(assert (=> b!1462399 (= res!991828 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640431 (select (arr!47647 a!2862) j!93) a!2862 mask!2687) lt!640434)))))

(declare-fun b!1462400 () Bool)

(declare-fun res!991831 () Bool)

(assert (=> b!1462400 (=> (not res!991831) (not e!822045))))

(assert (=> b!1462400 (= res!991831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462401 () Bool)

(declare-fun res!991836 () Bool)

(assert (=> b!1462401 (=> (not res!991836) (not e!822045))))

(assert (=> b!1462401 (= res!991836 (validKeyInArray!0 (select (arr!47647 a!2862) j!93)))))

(declare-fun b!1462402 () Bool)

(assert (=> b!1462402 (= e!822046 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640431 intermediateAfterIndex!19 lt!640432 lt!640436 mask!2687) (seekEntryOrOpen!0 lt!640432 lt!640436 mask!2687))))))

(declare-fun b!1462403 () Bool)

(assert (=> b!1462403 (= e!822045 e!822042)))

(declare-fun res!991833 () Bool)

(assert (=> b!1462403 (=> (not res!991833) (not e!822042))))

(assert (=> b!1462403 (= res!991833 (= (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462403 (= lt!640436 (array!98719 (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48197 a!2862)))))

(declare-fun b!1462404 () Bool)

(assert (=> b!1462404 (= e!822050 e!822041)))

(declare-fun res!991829 () Bool)

(assert (=> b!1462404 (=> (not res!991829) (not e!822041))))

(assert (=> b!1462404 (= res!991829 (= lt!640435 (Intermediate!11899 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462404 (= lt!640435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640432 mask!2687) lt!640432 lt!640436 mask!2687))))

(assert (=> b!1462404 (= lt!640432 (select (store (arr!47647 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125270 res!991834) b!1462383))

(assert (= (and b!1462383 res!991826) b!1462388))

(assert (= (and b!1462388 res!991839) b!1462401))

(assert (= (and b!1462401 res!991836) b!1462400))

(assert (= (and b!1462400 res!991831) b!1462395))

(assert (= (and b!1462395 res!991837) b!1462391))

(assert (= (and b!1462391 res!991832) b!1462403))

(assert (= (and b!1462403 res!991833) b!1462384))

(assert (= (and b!1462384 res!991835) b!1462393))

(assert (= (and b!1462393 res!991840) b!1462404))

(assert (= (and b!1462404 res!991829) b!1462392))

(assert (= (and b!1462392 c!134789) b!1462385))

(assert (= (and b!1462392 (not c!134789)) b!1462389))

(assert (= (and b!1462392 res!991842) b!1462394))

(assert (= (and b!1462394 res!991838) b!1462396))

(assert (= (and b!1462396 res!991830) b!1462398))

(assert (= (and b!1462398 res!991843) b!1462387))

(assert (= (and b!1462396 (not res!991841)) b!1462386))

(assert (= (and b!1462386 (not res!991827)) b!1462399))

(assert (= (and b!1462399 (not res!991828)) b!1462397))

(assert (= (and b!1462397 c!134790) b!1462390))

(assert (= (and b!1462397 (not c!134790)) b!1462402))

(declare-fun m!1349847 () Bool)

(assert (=> b!1462389 m!1349847))

(declare-fun m!1349849 () Bool)

(assert (=> b!1462389 m!1349849))

(declare-fun m!1349851 () Bool)

(assert (=> b!1462399 m!1349851))

(assert (=> b!1462399 m!1349851))

(declare-fun m!1349853 () Bool)

(assert (=> b!1462399 m!1349853))

(assert (=> b!1462393 m!1349851))

(assert (=> b!1462393 m!1349851))

(declare-fun m!1349855 () Bool)

(assert (=> b!1462393 m!1349855))

(declare-fun m!1349857 () Bool)

(assert (=> b!1462396 m!1349857))

(declare-fun m!1349859 () Bool)

(assert (=> b!1462396 m!1349859))

(declare-fun m!1349861 () Bool)

(assert (=> b!1462396 m!1349861))

(declare-fun m!1349863 () Bool)

(assert (=> b!1462396 m!1349863))

(declare-fun m!1349865 () Bool)

(assert (=> b!1462396 m!1349865))

(assert (=> b!1462396 m!1349851))

(declare-fun m!1349867 () Bool)

(assert (=> b!1462390 m!1349867))

(declare-fun m!1349869 () Bool)

(assert (=> b!1462385 m!1349869))

(declare-fun m!1349871 () Bool)

(assert (=> b!1462400 m!1349871))

(assert (=> b!1462384 m!1349851))

(assert (=> b!1462384 m!1349851))

(declare-fun m!1349873 () Bool)

(assert (=> b!1462384 m!1349873))

(assert (=> b!1462384 m!1349873))

(assert (=> b!1462384 m!1349851))

(declare-fun m!1349875 () Bool)

(assert (=> b!1462384 m!1349875))

(declare-fun m!1349877 () Bool)

(assert (=> b!1462387 m!1349877))

(assert (=> b!1462387 m!1349851))

(declare-fun m!1349879 () Bool)

(assert (=> b!1462402 m!1349879))

(assert (=> b!1462402 m!1349849))

(declare-fun m!1349881 () Bool)

(assert (=> b!1462404 m!1349881))

(assert (=> b!1462404 m!1349881))

(declare-fun m!1349883 () Bool)

(assert (=> b!1462404 m!1349883))

(assert (=> b!1462404 m!1349859))

(declare-fun m!1349885 () Bool)

(assert (=> b!1462404 m!1349885))

(assert (=> b!1462403 m!1349859))

(declare-fun m!1349887 () Bool)

(assert (=> b!1462403 m!1349887))

(declare-fun m!1349889 () Bool)

(assert (=> start!125270 m!1349889))

(declare-fun m!1349891 () Bool)

(assert (=> start!125270 m!1349891))

(assert (=> b!1462398 m!1349851))

(assert (=> b!1462398 m!1349851))

(declare-fun m!1349893 () Bool)

(assert (=> b!1462398 m!1349893))

(declare-fun m!1349895 () Bool)

(assert (=> b!1462388 m!1349895))

(assert (=> b!1462388 m!1349895))

(declare-fun m!1349897 () Bool)

(assert (=> b!1462388 m!1349897))

(declare-fun m!1349899 () Bool)

(assert (=> b!1462395 m!1349899))

(declare-fun m!1349901 () Bool)

(assert (=> b!1462386 m!1349901))

(assert (=> b!1462401 m!1349851))

(assert (=> b!1462401 m!1349851))

(declare-fun m!1349903 () Bool)

(assert (=> b!1462401 m!1349903))

(push 1)

