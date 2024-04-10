; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125254 () Bool)

(assert start!125254)

(declare-fun b!1461855 () Bool)

(declare-fun res!991397 () Bool)

(declare-fun e!821808 () Bool)

(assert (=> b!1461855 (=> (not res!991397) (not e!821808))))

(declare-datatypes ((array!98702 0))(
  ( (array!98703 (arr!47639 (Array (_ BitVec 32) (_ BitVec 64))) (size!48189 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98702)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98702 (_ BitVec 32)) Bool)

(assert (=> b!1461855 (= res!991397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461856 () Bool)

(declare-fun res!991400 () Bool)

(assert (=> b!1461856 (=> (not res!991400) (not e!821808))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461856 (= res!991400 (validKeyInArray!0 (select (arr!47639 a!2862) i!1006)))))

(declare-fun b!1461857 () Bool)

(declare-fun e!821806 () Bool)

(declare-fun e!821810 () Bool)

(assert (=> b!1461857 (= e!821806 e!821810)))

(declare-fun res!991407 () Bool)

(assert (=> b!1461857 (=> (not res!991407) (not e!821810))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11891 0))(
  ( (MissingZero!11891 (index!49956 (_ BitVec 32))) (Found!11891 (index!49957 (_ BitVec 32))) (Intermediate!11891 (undefined!12703 Bool) (index!49958 (_ BitVec 32)) (x!131556 (_ BitVec 32))) (Undefined!11891) (MissingVacant!11891 (index!49959 (_ BitVec 32))) )
))
(declare-fun lt!640265 () SeekEntryResult!11891)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461857 (= res!991407 (= lt!640265 (Intermediate!11891 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640269 () (_ BitVec 64))

(declare-fun lt!640264 () array!98702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98702 (_ BitVec 32)) SeekEntryResult!11891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461857 (= lt!640265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640269 mask!2687) lt!640269 lt!640264 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461857 (= lt!640269 (select (store (arr!47639 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!640267 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1461858 () Bool)

(declare-fun e!821809 () Bool)

(assert (=> b!1461858 (= e!821809 (not (= lt!640265 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640267 lt!640269 lt!640264 mask!2687))))))

(declare-fun b!1461859 () Bool)

(declare-fun e!821803 () Bool)

(assert (=> b!1461859 (= e!821808 e!821803)))

(declare-fun res!991406 () Bool)

(assert (=> b!1461859 (=> (not res!991406) (not e!821803))))

(assert (=> b!1461859 (= res!991406 (= (select (store (arr!47639 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461859 (= lt!640264 (array!98703 (store (arr!47639 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48189 a!2862)))))

(declare-fun b!1461860 () Bool)

(declare-fun res!991405 () Bool)

(assert (=> b!1461860 (=> (not res!991405) (not e!821808))))

(assert (=> b!1461860 (= res!991405 (validKeyInArray!0 (select (arr!47639 a!2862) j!93)))))

(declare-fun b!1461861 () Bool)

(declare-fun res!991410 () Bool)

(declare-fun e!821807 () Bool)

(assert (=> b!1461861 (=> (not res!991410) (not e!821807))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98702 (_ BitVec 32)) SeekEntryResult!11891)

(assert (=> b!1461861 (= res!991410 (= (seekEntryOrOpen!0 (select (arr!47639 a!2862) j!93) a!2862 mask!2687) (Found!11891 j!93)))))

(declare-fun b!1461862 () Bool)

(declare-fun res!991411 () Bool)

(assert (=> b!1461862 (=> (not res!991411) (not e!821808))))

(declare-datatypes ((List!34140 0))(
  ( (Nil!34137) (Cons!34136 (h!35486 (_ BitVec 64)) (t!48834 List!34140)) )
))
(declare-fun arrayNoDuplicates!0 (array!98702 (_ BitVec 32) List!34140) Bool)

(assert (=> b!1461862 (= res!991411 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34137))))

(declare-fun res!991404 () Bool)

(assert (=> start!125254 (=> (not res!991404) (not e!821808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125254 (= res!991404 (validMask!0 mask!2687))))

(assert (=> start!125254 e!821808))

(assert (=> start!125254 true))

(declare-fun array_inv!36667 (array!98702) Bool)

(assert (=> start!125254 (array_inv!36667 a!2862)))

(declare-fun b!1461863 () Bool)

(declare-fun res!991394 () Bool)

(assert (=> b!1461863 (=> (not res!991394) (not e!821810))))

(declare-fun e!821805 () Bool)

(assert (=> b!1461863 (= res!991394 e!821805)))

(declare-fun c!134742 () Bool)

(assert (=> b!1461863 (= c!134742 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461864 () Bool)

(declare-fun e!821801 () Bool)

(assert (=> b!1461864 (= e!821810 (not e!821801))))

(declare-fun res!991403 () Bool)

(assert (=> b!1461864 (=> res!991403 e!821801)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1461864 (= res!991403 (or (and (= (select (arr!47639 a!2862) index!646) (select (store (arr!47639 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47639 a!2862) index!646) (select (arr!47639 a!2862) j!93))) (= (select (arr!47639 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461864 e!821807))

(declare-fun res!991408 () Bool)

(assert (=> b!1461864 (=> (not res!991408) (not e!821807))))

(assert (=> b!1461864 (= res!991408 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49278 0))(
  ( (Unit!49279) )
))
(declare-fun lt!640266 () Unit!49278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49278)

(assert (=> b!1461864 (= lt!640266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461865 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98702 (_ BitVec 32)) SeekEntryResult!11891)

(assert (=> b!1461865 (= e!821805 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640269 lt!640264 mask!2687) (seekEntryOrOpen!0 lt!640269 lt!640264 mask!2687)))))

(declare-fun b!1461866 () Bool)

(declare-fun res!991396 () Bool)

(declare-fun e!821802 () Bool)

(assert (=> b!1461866 (=> res!991396 e!821802)))

(declare-fun lt!640268 () SeekEntryResult!11891)

(assert (=> b!1461866 (= res!991396 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640267 (select (arr!47639 a!2862) j!93) a!2862 mask!2687) lt!640268)))))

(declare-fun b!1461867 () Bool)

(assert (=> b!1461867 (= e!821802 true)))

(declare-fun lt!640263 () Bool)

(assert (=> b!1461867 (= lt!640263 e!821809)))

(declare-fun c!134741 () Bool)

(assert (=> b!1461867 (= c!134741 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461868 () Bool)

(assert (=> b!1461868 (= e!821805 (= lt!640265 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640269 lt!640264 mask!2687)))))

(declare-fun b!1461869 () Bool)

(declare-fun res!991401 () Bool)

(assert (=> b!1461869 (=> (not res!991401) (not e!821808))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461869 (= res!991401 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48189 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48189 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48189 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461870 () Bool)

(assert (=> b!1461870 (= e!821803 e!821806)))

(declare-fun res!991409 () Bool)

(assert (=> b!1461870 (=> (not res!991409) (not e!821806))))

(assert (=> b!1461870 (= res!991409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47639 a!2862) j!93) mask!2687) (select (arr!47639 a!2862) j!93) a!2862 mask!2687) lt!640268))))

(assert (=> b!1461870 (= lt!640268 (Intermediate!11891 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461871 () Bool)

(assert (=> b!1461871 (= e!821809 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640267 intermediateAfterIndex!19 lt!640269 lt!640264 mask!2687) (seekEntryOrOpen!0 lt!640269 lt!640264 mask!2687))))))

(declare-fun b!1461872 () Bool)

(declare-fun res!991395 () Bool)

(assert (=> b!1461872 (=> (not res!991395) (not e!821810))))

(assert (=> b!1461872 (= res!991395 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461873 () Bool)

(declare-fun res!991402 () Bool)

(assert (=> b!1461873 (=> (not res!991402) (not e!821806))))

(assert (=> b!1461873 (= res!991402 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47639 a!2862) j!93) a!2862 mask!2687) lt!640268))))

(declare-fun b!1461874 () Bool)

(assert (=> b!1461874 (= e!821801 e!821802)))

(declare-fun res!991399 () Bool)

(assert (=> b!1461874 (=> res!991399 e!821802)))

(assert (=> b!1461874 (= res!991399 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640267 #b00000000000000000000000000000000) (bvsge lt!640267 (size!48189 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461874 (= lt!640267 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461875 () Bool)

(declare-fun res!991398 () Bool)

(assert (=> b!1461875 (=> (not res!991398) (not e!821808))))

(assert (=> b!1461875 (= res!991398 (and (= (size!48189 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48189 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48189 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461876 () Bool)

(assert (=> b!1461876 (= e!821807 (or (= (select (arr!47639 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47639 a!2862) intermediateBeforeIndex!19) (select (arr!47639 a!2862) j!93))))))

(assert (= (and start!125254 res!991404) b!1461875))

(assert (= (and b!1461875 res!991398) b!1461856))

(assert (= (and b!1461856 res!991400) b!1461860))

(assert (= (and b!1461860 res!991405) b!1461855))

(assert (= (and b!1461855 res!991397) b!1461862))

(assert (= (and b!1461862 res!991411) b!1461869))

(assert (= (and b!1461869 res!991401) b!1461859))

(assert (= (and b!1461859 res!991406) b!1461870))

(assert (= (and b!1461870 res!991409) b!1461873))

(assert (= (and b!1461873 res!991402) b!1461857))

(assert (= (and b!1461857 res!991407) b!1461863))

(assert (= (and b!1461863 c!134742) b!1461868))

(assert (= (and b!1461863 (not c!134742)) b!1461865))

(assert (= (and b!1461863 res!991394) b!1461872))

(assert (= (and b!1461872 res!991395) b!1461864))

(assert (= (and b!1461864 res!991408) b!1461861))

(assert (= (and b!1461861 res!991410) b!1461876))

(assert (= (and b!1461864 (not res!991403)) b!1461874))

(assert (= (and b!1461874 (not res!991399)) b!1461866))

(assert (= (and b!1461866 (not res!991396)) b!1461867))

(assert (= (and b!1461867 c!134741) b!1461858))

(assert (= (and b!1461867 (not c!134741)) b!1461871))

(declare-fun m!1349383 () Bool)

(assert (=> b!1461862 m!1349383))

(declare-fun m!1349385 () Bool)

(assert (=> b!1461871 m!1349385))

(declare-fun m!1349387 () Bool)

(assert (=> b!1461871 m!1349387))

(declare-fun m!1349389 () Bool)

(assert (=> b!1461876 m!1349389))

(declare-fun m!1349391 () Bool)

(assert (=> b!1461876 m!1349391))

(assert (=> b!1461861 m!1349391))

(assert (=> b!1461861 m!1349391))

(declare-fun m!1349393 () Bool)

(assert (=> b!1461861 m!1349393))

(declare-fun m!1349395 () Bool)

(assert (=> b!1461855 m!1349395))

(declare-fun m!1349397 () Bool)

(assert (=> b!1461868 m!1349397))

(declare-fun m!1349399 () Bool)

(assert (=> b!1461857 m!1349399))

(assert (=> b!1461857 m!1349399))

(declare-fun m!1349401 () Bool)

(assert (=> b!1461857 m!1349401))

(declare-fun m!1349403 () Bool)

(assert (=> b!1461857 m!1349403))

(declare-fun m!1349405 () Bool)

(assert (=> b!1461857 m!1349405))

(declare-fun m!1349407 () Bool)

(assert (=> b!1461858 m!1349407))

(assert (=> b!1461866 m!1349391))

(assert (=> b!1461866 m!1349391))

(declare-fun m!1349409 () Bool)

(assert (=> b!1461866 m!1349409))

(assert (=> b!1461870 m!1349391))

(assert (=> b!1461870 m!1349391))

(declare-fun m!1349411 () Bool)

(assert (=> b!1461870 m!1349411))

(assert (=> b!1461870 m!1349411))

(assert (=> b!1461870 m!1349391))

(declare-fun m!1349413 () Bool)

(assert (=> b!1461870 m!1349413))

(declare-fun m!1349415 () Bool)

(assert (=> b!1461865 m!1349415))

(assert (=> b!1461865 m!1349387))

(declare-fun m!1349417 () Bool)

(assert (=> b!1461864 m!1349417))

(assert (=> b!1461864 m!1349403))

(declare-fun m!1349419 () Bool)

(assert (=> b!1461864 m!1349419))

(declare-fun m!1349421 () Bool)

(assert (=> b!1461864 m!1349421))

(declare-fun m!1349423 () Bool)

(assert (=> b!1461864 m!1349423))

(assert (=> b!1461864 m!1349391))

(declare-fun m!1349425 () Bool)

(assert (=> start!125254 m!1349425))

(declare-fun m!1349427 () Bool)

(assert (=> start!125254 m!1349427))

(declare-fun m!1349429 () Bool)

(assert (=> b!1461874 m!1349429))

(declare-fun m!1349431 () Bool)

(assert (=> b!1461856 m!1349431))

(assert (=> b!1461856 m!1349431))

(declare-fun m!1349433 () Bool)

(assert (=> b!1461856 m!1349433))

(assert (=> b!1461859 m!1349403))

(declare-fun m!1349435 () Bool)

(assert (=> b!1461859 m!1349435))

(assert (=> b!1461860 m!1349391))

(assert (=> b!1461860 m!1349391))

(declare-fun m!1349437 () Bool)

(assert (=> b!1461860 m!1349437))

(assert (=> b!1461873 m!1349391))

(assert (=> b!1461873 m!1349391))

(declare-fun m!1349439 () Bool)

(assert (=> b!1461873 m!1349439))

(push 1)

