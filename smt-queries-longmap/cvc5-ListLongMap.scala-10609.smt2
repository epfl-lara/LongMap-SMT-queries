; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124792 () Bool)

(assert start!124792)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11660 0))(
  ( (MissingZero!11660 (index!49032 (_ BitVec 32))) (Found!11660 (index!49033 (_ BitVec 32))) (Intermediate!11660 (undefined!12472 Bool) (index!49034 (_ BitVec 32)) (x!130709 (_ BitVec 32))) (Undefined!11660) (MissingVacant!11660 (index!49035 (_ BitVec 32))) )
))
(declare-fun lt!635299 () SeekEntryResult!11660)

(declare-fun b!1447800 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!815383 () Bool)

(declare-datatypes ((array!98240 0))(
  ( (array!98241 (arr!47408 (Array (_ BitVec 32) (_ BitVec 64))) (size!47958 (_ BitVec 32))) )
))
(declare-fun lt!635295 () array!98240)

(declare-fun lt!635300 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98240 (_ BitVec 32)) SeekEntryResult!11660)

(assert (=> b!1447800 (= e!815383 (= lt!635299 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635300 lt!635295 mask!2687)))))

(declare-fun b!1447801 () Bool)

(declare-fun e!815378 () Bool)

(declare-fun e!815377 () Bool)

(assert (=> b!1447801 (= e!815378 e!815377)))

(declare-fun res!979429 () Bool)

(assert (=> b!1447801 (=> (not res!979429) (not e!815377))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98240)

(assert (=> b!1447801 (= res!979429 (= (select (store (arr!47408 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447801 (= lt!635295 (array!98241 (store (arr!47408 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47958 a!2862)))))

(declare-fun b!1447802 () Bool)

(declare-fun e!815381 () Bool)

(declare-fun e!815382 () Bool)

(assert (=> b!1447802 (= e!815381 e!815382)))

(declare-fun res!979426 () Bool)

(assert (=> b!1447802 (=> (not res!979426) (not e!815382))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447802 (= res!979426 (= lt!635299 (Intermediate!11660 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447802 (= lt!635299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635300 mask!2687) lt!635300 lt!635295 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447802 (= lt!635300 (select (store (arr!47408 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447803 () Bool)

(declare-fun res!979421 () Bool)

(assert (=> b!1447803 (=> (not res!979421) (not e!815378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447803 (= res!979421 (validKeyInArray!0 (select (arr!47408 a!2862) j!93)))))

(declare-fun b!1447804 () Bool)

(declare-fun e!815379 () Bool)

(assert (=> b!1447804 (= e!815379 true)))

(declare-fun lt!635298 () SeekEntryResult!11660)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98240 (_ BitVec 32)) SeekEntryResult!11660)

(assert (=> b!1447804 (= lt!635298 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47408 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447805 () Bool)

(declare-fun res!979428 () Bool)

(assert (=> b!1447805 (=> (not res!979428) (not e!815378))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447805 (= res!979428 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47958 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47958 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47958 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!979419 () Bool)

(assert (=> start!124792 (=> (not res!979419) (not e!815378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124792 (= res!979419 (validMask!0 mask!2687))))

(assert (=> start!124792 e!815378))

(assert (=> start!124792 true))

(declare-fun array_inv!36436 (array!98240) Bool)

(assert (=> start!124792 (array_inv!36436 a!2862)))

(declare-fun b!1447806 () Bool)

(declare-fun e!815376 () Bool)

(declare-fun e!815384 () Bool)

(assert (=> b!1447806 (= e!815376 e!815384)))

(declare-fun res!979423 () Bool)

(assert (=> b!1447806 (=> res!979423 e!815384)))

(assert (=> b!1447806 (= res!979423 (or (and (= (select (arr!47408 a!2862) index!646) (select (store (arr!47408 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47408 a!2862) index!646) (select (arr!47408 a!2862) j!93))) (not (= (select (arr!47408 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447807 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98240 (_ BitVec 32)) SeekEntryResult!11660)

(assert (=> b!1447807 (= e!815383 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635300 lt!635295 mask!2687) (seekEntryOrOpen!0 lt!635300 lt!635295 mask!2687)))))

(declare-fun b!1447808 () Bool)

(assert (=> b!1447808 (= e!815377 e!815381)))

(declare-fun res!979427 () Bool)

(assert (=> b!1447808 (=> (not res!979427) (not e!815381))))

(declare-fun lt!635301 () SeekEntryResult!11660)

(assert (=> b!1447808 (= res!979427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47408 a!2862) j!93) mask!2687) (select (arr!47408 a!2862) j!93) a!2862 mask!2687) lt!635301))))

(assert (=> b!1447808 (= lt!635301 (Intermediate!11660 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!815375 () Bool)

(declare-fun b!1447809 () Bool)

(assert (=> b!1447809 (= e!815375 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447810 () Bool)

(declare-fun res!979414 () Bool)

(assert (=> b!1447810 (=> (not res!979414) (not e!815378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98240 (_ BitVec 32)) Bool)

(assert (=> b!1447810 (= res!979414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447811 () Bool)

(declare-fun res!979413 () Bool)

(assert (=> b!1447811 (=> (not res!979413) (not e!815378))))

(assert (=> b!1447811 (= res!979413 (validKeyInArray!0 (select (arr!47408 a!2862) i!1006)))))

(declare-fun b!1447812 () Bool)

(declare-fun res!979418 () Bool)

(assert (=> b!1447812 (=> (not res!979418) (not e!815382))))

(assert (=> b!1447812 (= res!979418 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447813 () Bool)

(declare-fun res!979420 () Bool)

(assert (=> b!1447813 (=> (not res!979420) (not e!815381))))

(assert (=> b!1447813 (= res!979420 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47408 a!2862) j!93) a!2862 mask!2687) lt!635301))))

(declare-fun b!1447814 () Bool)

(declare-fun res!979424 () Bool)

(assert (=> b!1447814 (=> (not res!979424) (not e!815378))))

(assert (=> b!1447814 (= res!979424 (and (= (size!47958 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47958 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47958 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447815 () Bool)

(assert (=> b!1447815 (= e!815382 (not e!815379))))

(declare-fun res!979425 () Bool)

(assert (=> b!1447815 (=> res!979425 e!815379)))

(assert (=> b!1447815 (= res!979425 (or (and (= (select (arr!47408 a!2862) index!646) (select (store (arr!47408 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47408 a!2862) index!646) (select (arr!47408 a!2862) j!93))) (not (= (select (arr!47408 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47408 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447815 e!815376))

(declare-fun res!979416 () Bool)

(assert (=> b!1447815 (=> (not res!979416) (not e!815376))))

(declare-fun lt!635296 () SeekEntryResult!11660)

(assert (=> b!1447815 (= res!979416 (and (= lt!635296 (Found!11660 j!93)) (or (= (select (arr!47408 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47408 a!2862) intermediateBeforeIndex!19) (select (arr!47408 a!2862) j!93)))))))

(assert (=> b!1447815 (= lt!635296 (seekEntryOrOpen!0 (select (arr!47408 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447815 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48816 0))(
  ( (Unit!48817) )
))
(declare-fun lt!635297 () Unit!48816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48816)

(assert (=> b!1447815 (= lt!635297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447816 () Bool)

(declare-fun res!979422 () Bool)

(assert (=> b!1447816 (=> (not res!979422) (not e!815382))))

(assert (=> b!1447816 (= res!979422 e!815383)))

(declare-fun c!133704 () Bool)

(assert (=> b!1447816 (= c!133704 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447817 () Bool)

(assert (=> b!1447817 (= e!815384 e!815375)))

(declare-fun res!979417 () Bool)

(assert (=> b!1447817 (=> (not res!979417) (not e!815375))))

(assert (=> b!1447817 (= res!979417 (= lt!635296 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47408 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447818 () Bool)

(declare-fun res!979415 () Bool)

(assert (=> b!1447818 (=> (not res!979415) (not e!815378))))

(declare-datatypes ((List!33909 0))(
  ( (Nil!33906) (Cons!33905 (h!35255 (_ BitVec 64)) (t!48603 List!33909)) )
))
(declare-fun arrayNoDuplicates!0 (array!98240 (_ BitVec 32) List!33909) Bool)

(assert (=> b!1447818 (= res!979415 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33906))))

(assert (= (and start!124792 res!979419) b!1447814))

(assert (= (and b!1447814 res!979424) b!1447811))

(assert (= (and b!1447811 res!979413) b!1447803))

(assert (= (and b!1447803 res!979421) b!1447810))

(assert (= (and b!1447810 res!979414) b!1447818))

(assert (= (and b!1447818 res!979415) b!1447805))

(assert (= (and b!1447805 res!979428) b!1447801))

(assert (= (and b!1447801 res!979429) b!1447808))

(assert (= (and b!1447808 res!979427) b!1447813))

(assert (= (and b!1447813 res!979420) b!1447802))

(assert (= (and b!1447802 res!979426) b!1447816))

(assert (= (and b!1447816 c!133704) b!1447800))

(assert (= (and b!1447816 (not c!133704)) b!1447807))

(assert (= (and b!1447816 res!979422) b!1447812))

(assert (= (and b!1447812 res!979418) b!1447815))

(assert (= (and b!1447815 res!979416) b!1447806))

(assert (= (and b!1447806 (not res!979423)) b!1447817))

(assert (= (and b!1447817 res!979417) b!1447809))

(assert (= (and b!1447815 (not res!979425)) b!1447804))

(declare-fun m!1336597 () Bool)

(assert (=> b!1447818 m!1336597))

(declare-fun m!1336599 () Bool)

(assert (=> b!1447803 m!1336599))

(assert (=> b!1447803 m!1336599))

(declare-fun m!1336601 () Bool)

(assert (=> b!1447803 m!1336601))

(assert (=> b!1447804 m!1336599))

(assert (=> b!1447804 m!1336599))

(declare-fun m!1336603 () Bool)

(assert (=> b!1447804 m!1336603))

(declare-fun m!1336605 () Bool)

(assert (=> b!1447802 m!1336605))

(assert (=> b!1447802 m!1336605))

(declare-fun m!1336607 () Bool)

(assert (=> b!1447802 m!1336607))

(declare-fun m!1336609 () Bool)

(assert (=> b!1447802 m!1336609))

(declare-fun m!1336611 () Bool)

(assert (=> b!1447802 m!1336611))

(assert (=> b!1447817 m!1336599))

(assert (=> b!1447817 m!1336599))

(declare-fun m!1336613 () Bool)

(assert (=> b!1447817 m!1336613))

(declare-fun m!1336615 () Bool)

(assert (=> b!1447800 m!1336615))

(declare-fun m!1336617 () Bool)

(assert (=> start!124792 m!1336617))

(declare-fun m!1336619 () Bool)

(assert (=> start!124792 m!1336619))

(declare-fun m!1336621 () Bool)

(assert (=> b!1447810 m!1336621))

(declare-fun m!1336623 () Bool)

(assert (=> b!1447811 m!1336623))

(assert (=> b!1447811 m!1336623))

(declare-fun m!1336625 () Bool)

(assert (=> b!1447811 m!1336625))

(assert (=> b!1447808 m!1336599))

(assert (=> b!1447808 m!1336599))

(declare-fun m!1336627 () Bool)

(assert (=> b!1447808 m!1336627))

(assert (=> b!1447808 m!1336627))

(assert (=> b!1447808 m!1336599))

(declare-fun m!1336629 () Bool)

(assert (=> b!1447808 m!1336629))

(declare-fun m!1336631 () Bool)

(assert (=> b!1447815 m!1336631))

(assert (=> b!1447815 m!1336609))

(declare-fun m!1336633 () Bool)

(assert (=> b!1447815 m!1336633))

(declare-fun m!1336635 () Bool)

(assert (=> b!1447815 m!1336635))

(declare-fun m!1336637 () Bool)

(assert (=> b!1447815 m!1336637))

(assert (=> b!1447815 m!1336599))

(declare-fun m!1336639 () Bool)

(assert (=> b!1447815 m!1336639))

(declare-fun m!1336641 () Bool)

(assert (=> b!1447815 m!1336641))

(assert (=> b!1447815 m!1336599))

(assert (=> b!1447806 m!1336637))

(assert (=> b!1447806 m!1336609))

(assert (=> b!1447806 m!1336635))

(assert (=> b!1447806 m!1336599))

(assert (=> b!1447813 m!1336599))

(assert (=> b!1447813 m!1336599))

(declare-fun m!1336643 () Bool)

(assert (=> b!1447813 m!1336643))

(declare-fun m!1336645 () Bool)

(assert (=> b!1447807 m!1336645))

(declare-fun m!1336647 () Bool)

(assert (=> b!1447807 m!1336647))

(assert (=> b!1447801 m!1336609))

(declare-fun m!1336649 () Bool)

(assert (=> b!1447801 m!1336649))

(push 1)

