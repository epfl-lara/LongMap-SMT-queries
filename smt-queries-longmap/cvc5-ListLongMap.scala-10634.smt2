; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124942 () Bool)

(assert start!124942)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98390 0))(
  ( (array!98391 (arr!47483 (Array (_ BitVec 32) (_ BitVec 64))) (size!48033 (_ BitVec 32))) )
))
(declare-fun lt!636830 () array!98390)

(declare-fun e!817478 () Bool)

(declare-fun lt!636834 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1452053 () Bool)

(declare-datatypes ((SeekEntryResult!11735 0))(
  ( (MissingZero!11735 (index!49332 (_ BitVec 32))) (Found!11735 (index!49333 (_ BitVec 32))) (Intermediate!11735 (undefined!12547 Bool) (index!49334 (_ BitVec 32)) (x!130984 (_ BitVec 32))) (Undefined!11735) (MissingVacant!11735 (index!49335 (_ BitVec 32))) )
))
(declare-fun lt!636832 () SeekEntryResult!11735)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98390 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1452053 (= e!817478 (= lt!636832 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636834 lt!636830 mask!2687)))))

(declare-fun b!1452054 () Bool)

(declare-fun res!983217 () Bool)

(declare-fun e!817480 () Bool)

(assert (=> b!1452054 (=> (not res!983217) (not e!817480))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98390)

(assert (=> b!1452054 (= res!983217 (and (= (size!48033 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48033 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48033 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452055 () Bool)

(declare-fun res!983222 () Bool)

(assert (=> b!1452055 (=> (not res!983222) (not e!817480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452055 (= res!983222 (validKeyInArray!0 (select (arr!47483 a!2862) i!1006)))))

(declare-fun b!1452056 () Bool)

(declare-fun res!983224 () Bool)

(declare-fun e!817476 () Bool)

(assert (=> b!1452056 (=> (not res!983224) (not e!817476))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98390 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1452056 (= res!983224 (= (seekEntryOrOpen!0 (select (arr!47483 a!2862) j!93) a!2862 mask!2687) (Found!11735 j!93)))))

(declare-fun b!1452057 () Bool)

(declare-fun res!983220 () Bool)

(assert (=> b!1452057 (=> (not res!983220) (not e!817480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98390 (_ BitVec 32)) Bool)

(assert (=> b!1452057 (= res!983220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452058 () Bool)

(declare-fun res!983228 () Bool)

(declare-fun e!817479 () Bool)

(assert (=> b!1452058 (=> (not res!983228) (not e!817479))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452058 (= res!983228 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452059 () Bool)

(declare-fun res!983229 () Bool)

(assert (=> b!1452059 (=> (not res!983229) (not e!817480))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452059 (= res!983229 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48033 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48033 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48033 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452060 () Bool)

(assert (=> b!1452060 (= e!817479 (not true))))

(assert (=> b!1452060 e!817476))

(declare-fun res!983218 () Bool)

(assert (=> b!1452060 (=> (not res!983218) (not e!817476))))

(assert (=> b!1452060 (= res!983218 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48966 0))(
  ( (Unit!48967) )
))
(declare-fun lt!636833 () Unit!48966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48966)

(assert (=> b!1452060 (= lt!636833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452061 () Bool)

(assert (=> b!1452061 (= e!817476 (and (or (= (select (arr!47483 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47483 a!2862) intermediateBeforeIndex!19) (select (arr!47483 a!2862) j!93))) (or (and (= (select (arr!47483 a!2862) index!646) (select (store (arr!47483 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47483 a!2862) index!646) (select (arr!47483 a!2862) j!93))) (= (select (arr!47483 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47483 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452062 () Bool)

(declare-fun e!817481 () Bool)

(declare-fun e!817475 () Bool)

(assert (=> b!1452062 (= e!817481 e!817475)))

(declare-fun res!983221 () Bool)

(assert (=> b!1452062 (=> (not res!983221) (not e!817475))))

(declare-fun lt!636831 () SeekEntryResult!11735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452062 (= res!983221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47483 a!2862) j!93) mask!2687) (select (arr!47483 a!2862) j!93) a!2862 mask!2687) lt!636831))))

(assert (=> b!1452062 (= lt!636831 (Intermediate!11735 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452063 () Bool)

(assert (=> b!1452063 (= e!817480 e!817481)))

(declare-fun res!983216 () Bool)

(assert (=> b!1452063 (=> (not res!983216) (not e!817481))))

(assert (=> b!1452063 (= res!983216 (= (select (store (arr!47483 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452063 (= lt!636830 (array!98391 (store (arr!47483 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48033 a!2862)))))

(declare-fun b!1452064 () Bool)

(declare-fun res!983223 () Bool)

(assert (=> b!1452064 (=> (not res!983223) (not e!817480))))

(assert (=> b!1452064 (= res!983223 (validKeyInArray!0 (select (arr!47483 a!2862) j!93)))))

(declare-fun b!1452065 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98390 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1452065 (= e!817478 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636834 lt!636830 mask!2687) (seekEntryOrOpen!0 lt!636834 lt!636830 mask!2687)))))

(declare-fun b!1452066 () Bool)

(assert (=> b!1452066 (= e!817475 e!817479)))

(declare-fun res!983226 () Bool)

(assert (=> b!1452066 (=> (not res!983226) (not e!817479))))

(assert (=> b!1452066 (= res!983226 (= lt!636832 (Intermediate!11735 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452066 (= lt!636832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636834 mask!2687) lt!636834 lt!636830 mask!2687))))

(assert (=> b!1452066 (= lt!636834 (select (store (arr!47483 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452067 () Bool)

(declare-fun res!983225 () Bool)

(assert (=> b!1452067 (=> (not res!983225) (not e!817480))))

(declare-datatypes ((List!33984 0))(
  ( (Nil!33981) (Cons!33980 (h!35330 (_ BitVec 64)) (t!48678 List!33984)) )
))
(declare-fun arrayNoDuplicates!0 (array!98390 (_ BitVec 32) List!33984) Bool)

(assert (=> b!1452067 (= res!983225 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33981))))

(declare-fun b!1452068 () Bool)

(declare-fun res!983227 () Bool)

(assert (=> b!1452068 (=> (not res!983227) (not e!817475))))

(assert (=> b!1452068 (= res!983227 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47483 a!2862) j!93) a!2862 mask!2687) lt!636831))))

(declare-fun b!1452069 () Bool)

(declare-fun res!983219 () Bool)

(assert (=> b!1452069 (=> (not res!983219) (not e!817479))))

(assert (=> b!1452069 (= res!983219 e!817478)))

(declare-fun c!133929 () Bool)

(assert (=> b!1452069 (= c!133929 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983230 () Bool)

(assert (=> start!124942 (=> (not res!983230) (not e!817480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124942 (= res!983230 (validMask!0 mask!2687))))

(assert (=> start!124942 e!817480))

(assert (=> start!124942 true))

(declare-fun array_inv!36511 (array!98390) Bool)

(assert (=> start!124942 (array_inv!36511 a!2862)))

(assert (= (and start!124942 res!983230) b!1452054))

(assert (= (and b!1452054 res!983217) b!1452055))

(assert (= (and b!1452055 res!983222) b!1452064))

(assert (= (and b!1452064 res!983223) b!1452057))

(assert (= (and b!1452057 res!983220) b!1452067))

(assert (= (and b!1452067 res!983225) b!1452059))

(assert (= (and b!1452059 res!983229) b!1452063))

(assert (= (and b!1452063 res!983216) b!1452062))

(assert (= (and b!1452062 res!983221) b!1452068))

(assert (= (and b!1452068 res!983227) b!1452066))

(assert (= (and b!1452066 res!983226) b!1452069))

(assert (= (and b!1452069 c!133929) b!1452053))

(assert (= (and b!1452069 (not c!133929)) b!1452065))

(assert (= (and b!1452069 res!983219) b!1452058))

(assert (= (and b!1452058 res!983228) b!1452060))

(assert (= (and b!1452060 res!983218) b!1452056))

(assert (= (and b!1452056 res!983224) b!1452061))

(declare-fun m!1340635 () Bool)

(assert (=> b!1452068 m!1340635))

(assert (=> b!1452068 m!1340635))

(declare-fun m!1340637 () Bool)

(assert (=> b!1452068 m!1340637))

(declare-fun m!1340639 () Bool)

(assert (=> b!1452060 m!1340639))

(declare-fun m!1340641 () Bool)

(assert (=> b!1452060 m!1340641))

(declare-fun m!1340643 () Bool)

(assert (=> b!1452057 m!1340643))

(declare-fun m!1340645 () Bool)

(assert (=> b!1452055 m!1340645))

(assert (=> b!1452055 m!1340645))

(declare-fun m!1340647 () Bool)

(assert (=> b!1452055 m!1340647))

(declare-fun m!1340649 () Bool)

(assert (=> b!1452067 m!1340649))

(assert (=> b!1452056 m!1340635))

(assert (=> b!1452056 m!1340635))

(declare-fun m!1340651 () Bool)

(assert (=> b!1452056 m!1340651))

(assert (=> b!1452064 m!1340635))

(assert (=> b!1452064 m!1340635))

(declare-fun m!1340653 () Bool)

(assert (=> b!1452064 m!1340653))

(assert (=> b!1452062 m!1340635))

(assert (=> b!1452062 m!1340635))

(declare-fun m!1340655 () Bool)

(assert (=> b!1452062 m!1340655))

(assert (=> b!1452062 m!1340655))

(assert (=> b!1452062 m!1340635))

(declare-fun m!1340657 () Bool)

(assert (=> b!1452062 m!1340657))

(declare-fun m!1340659 () Bool)

(assert (=> start!124942 m!1340659))

(declare-fun m!1340661 () Bool)

(assert (=> start!124942 m!1340661))

(declare-fun m!1340663 () Bool)

(assert (=> b!1452065 m!1340663))

(declare-fun m!1340665 () Bool)

(assert (=> b!1452065 m!1340665))

(declare-fun m!1340667 () Bool)

(assert (=> b!1452066 m!1340667))

(assert (=> b!1452066 m!1340667))

(declare-fun m!1340669 () Bool)

(assert (=> b!1452066 m!1340669))

(declare-fun m!1340671 () Bool)

(assert (=> b!1452066 m!1340671))

(declare-fun m!1340673 () Bool)

(assert (=> b!1452066 m!1340673))

(assert (=> b!1452061 m!1340671))

(declare-fun m!1340675 () Bool)

(assert (=> b!1452061 m!1340675))

(declare-fun m!1340677 () Bool)

(assert (=> b!1452061 m!1340677))

(declare-fun m!1340679 () Bool)

(assert (=> b!1452061 m!1340679))

(assert (=> b!1452061 m!1340635))

(declare-fun m!1340681 () Bool)

(assert (=> b!1452053 m!1340681))

(assert (=> b!1452063 m!1340671))

(declare-fun m!1340683 () Bool)

(assert (=> b!1452063 m!1340683))

(push 1)

