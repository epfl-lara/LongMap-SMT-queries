; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126180 () Bool)

(assert start!126180)

(declare-fun b!1475759 () Bool)

(declare-fun res!1001921 () Bool)

(declare-fun e!828170 () Bool)

(assert (=> b!1475759 (=> (not res!1001921) (not e!828170))))

(declare-datatypes ((array!99295 0))(
  ( (array!99296 (arr!47926 (Array (_ BitVec 32) (_ BitVec 64))) (size!48477 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99295)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99295 (_ BitVec 32)) Bool)

(assert (=> b!1475759 (= res!1001921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!644768 () (_ BitVec 64))

(declare-fun e!828176 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644771 () array!99295)

(declare-datatypes ((SeekEntryResult!12063 0))(
  ( (MissingZero!12063 (index!50644 (_ BitVec 32))) (Found!12063 (index!50645 (_ BitVec 32))) (Intermediate!12063 (undefined!12875 Bool) (index!50646 (_ BitVec 32)) (x!132412 (_ BitVec 32))) (Undefined!12063) (MissingVacant!12063 (index!50647 (_ BitVec 32))) )
))
(declare-fun lt!644772 () SeekEntryResult!12063)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1475760 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99295 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1475760 (= e!828176 (= lt!644772 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644768 lt!644771 mask!2687)))))

(declare-fun b!1475761 () Bool)

(declare-fun res!1001916 () Bool)

(declare-fun e!828175 () Bool)

(assert (=> b!1475761 (=> (not res!1001916) (not e!828175))))

(declare-fun lt!644769 () SeekEntryResult!12063)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1475761 (= res!1001916 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!644769))))

(declare-fun b!1475763 () Bool)

(declare-fun res!1001919 () Bool)

(assert (=> b!1475763 (=> (not res!1001919) (not e!828170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475763 (= res!1001919 (validKeyInArray!0 (select (arr!47926 a!2862) j!93)))))

(declare-fun b!1475764 () Bool)

(declare-fun e!828177 () Bool)

(assert (=> b!1475764 (= e!828170 e!828177)))

(declare-fun res!1001923 () Bool)

(assert (=> b!1475764 (=> (not res!1001923) (not e!828177))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1475764 (= res!1001923 (= (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475764 (= lt!644771 (array!99296 (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48477 a!2862)))))

(declare-fun b!1475765 () Bool)

(declare-fun res!1001909 () Bool)

(assert (=> b!1475765 (=> (not res!1001909) (not e!828170))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475765 (= res!1001909 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48477 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48477 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48477 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475766 () Bool)

(declare-fun res!1001913 () Bool)

(declare-fun e!828174 () Bool)

(assert (=> b!1475766 (=> (not res!1001913) (not e!828174))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99295 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1475766 (= res!1001913 (= (seekEntryOrOpen!0 (select (arr!47926 a!2862) j!93) a!2862 mask!2687) (Found!12063 j!93)))))

(declare-fun b!1475767 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99295 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1475767 (= e!828176 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644768 lt!644771 mask!2687) (seekEntryOrOpen!0 lt!644768 lt!644771 mask!2687)))))

(declare-fun b!1475768 () Bool)

(assert (=> b!1475768 (= e!828177 e!828175)))

(declare-fun res!1001914 () Bool)

(assert (=> b!1475768 (=> (not res!1001914) (not e!828175))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475768 (= res!1001914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47926 a!2862) j!93) mask!2687) (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!644769))))

(assert (=> b!1475768 (= lt!644769 (Intermediate!12063 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475769 () Bool)

(declare-fun res!1001910 () Bool)

(declare-fun e!828173 () Bool)

(assert (=> b!1475769 (=> (not res!1001910) (not e!828173))))

(assert (=> b!1475769 (= res!1001910 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475770 () Bool)

(declare-fun res!1001915 () Bool)

(assert (=> b!1475770 (=> (not res!1001915) (not e!828173))))

(assert (=> b!1475770 (= res!1001915 e!828176)))

(declare-fun c!136450 () Bool)

(assert (=> b!1475770 (= c!136450 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475771 () Bool)

(declare-fun e!828171 () Bool)

(assert (=> b!1475771 (= e!828173 (not e!828171))))

(declare-fun res!1001917 () Bool)

(assert (=> b!1475771 (=> res!1001917 e!828171)))

(assert (=> b!1475771 (= res!1001917 (or (not (= (select (arr!47926 a!2862) index!646) (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47926 a!2862) index!646) (select (arr!47926 a!2862) j!93)))))))

(assert (=> b!1475771 e!828174))

(declare-fun res!1001911 () Bool)

(assert (=> b!1475771 (=> (not res!1001911) (not e!828174))))

(assert (=> b!1475771 (= res!1001911 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49499 0))(
  ( (Unit!49500) )
))
(declare-fun lt!644770 () Unit!49499)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49499)

(assert (=> b!1475771 (= lt!644770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475772 () Bool)

(declare-fun res!1001924 () Bool)

(assert (=> b!1475772 (=> (not res!1001924) (not e!828170))))

(assert (=> b!1475772 (= res!1001924 (and (= (size!48477 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48477 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48477 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475773 () Bool)

(assert (=> b!1475773 (= e!828174 (or (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) (select (arr!47926 a!2862) j!93))))))

(declare-fun b!1475774 () Bool)

(declare-fun res!1001918 () Bool)

(assert (=> b!1475774 (=> (not res!1001918) (not e!828170))))

(declare-datatypes ((List!34414 0))(
  ( (Nil!34411) (Cons!34410 (h!35783 (_ BitVec 64)) (t!49100 List!34414)) )
))
(declare-fun arrayNoDuplicates!0 (array!99295 (_ BitVec 32) List!34414) Bool)

(assert (=> b!1475774 (= res!1001918 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34411))))

(declare-fun b!1475762 () Bool)

(assert (=> b!1475762 (= e!828175 e!828173)))

(declare-fun res!1001922 () Bool)

(assert (=> b!1475762 (=> (not res!1001922) (not e!828173))))

(assert (=> b!1475762 (= res!1001922 (= lt!644772 (Intermediate!12063 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475762 (= lt!644772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644768 mask!2687) lt!644768 lt!644771 mask!2687))))

(assert (=> b!1475762 (= lt!644768 (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1001912 () Bool)

(assert (=> start!126180 (=> (not res!1001912) (not e!828170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126180 (= res!1001912 (validMask!0 mask!2687))))

(assert (=> start!126180 e!828170))

(assert (=> start!126180 true))

(declare-fun array_inv!37207 (array!99295) Bool)

(assert (=> start!126180 (array_inv!37207 a!2862)))

(declare-fun b!1475775 () Bool)

(assert (=> b!1475775 (= e!828171 true)))

(declare-fun lt!644773 () SeekEntryResult!12063)

(assert (=> b!1475775 (= lt!644773 (seekEntryOrOpen!0 lt!644768 lt!644771 mask!2687))))

(declare-fun b!1475776 () Bool)

(declare-fun res!1001920 () Bool)

(assert (=> b!1475776 (=> (not res!1001920) (not e!828170))))

(assert (=> b!1475776 (= res!1001920 (validKeyInArray!0 (select (arr!47926 a!2862) i!1006)))))

(assert (= (and start!126180 res!1001912) b!1475772))

(assert (= (and b!1475772 res!1001924) b!1475776))

(assert (= (and b!1475776 res!1001920) b!1475763))

(assert (= (and b!1475763 res!1001919) b!1475759))

(assert (= (and b!1475759 res!1001921) b!1475774))

(assert (= (and b!1475774 res!1001918) b!1475765))

(assert (= (and b!1475765 res!1001909) b!1475764))

(assert (= (and b!1475764 res!1001923) b!1475768))

(assert (= (and b!1475768 res!1001914) b!1475761))

(assert (= (and b!1475761 res!1001916) b!1475762))

(assert (= (and b!1475762 res!1001922) b!1475770))

(assert (= (and b!1475770 c!136450) b!1475760))

(assert (= (and b!1475770 (not c!136450)) b!1475767))

(assert (= (and b!1475770 res!1001915) b!1475769))

(assert (= (and b!1475769 res!1001910) b!1475771))

(assert (= (and b!1475771 res!1001911) b!1475766))

(assert (= (and b!1475766 res!1001913) b!1475773))

(assert (= (and b!1475771 (not res!1001917)) b!1475775))

(declare-fun m!1362217 () Bool)

(assert (=> start!126180 m!1362217))

(declare-fun m!1362219 () Bool)

(assert (=> start!126180 m!1362219))

(declare-fun m!1362221 () Bool)

(assert (=> b!1475768 m!1362221))

(assert (=> b!1475768 m!1362221))

(declare-fun m!1362223 () Bool)

(assert (=> b!1475768 m!1362223))

(assert (=> b!1475768 m!1362223))

(assert (=> b!1475768 m!1362221))

(declare-fun m!1362225 () Bool)

(assert (=> b!1475768 m!1362225))

(assert (=> b!1475766 m!1362221))

(assert (=> b!1475766 m!1362221))

(declare-fun m!1362227 () Bool)

(assert (=> b!1475766 m!1362227))

(declare-fun m!1362229 () Bool)

(assert (=> b!1475762 m!1362229))

(assert (=> b!1475762 m!1362229))

(declare-fun m!1362231 () Bool)

(assert (=> b!1475762 m!1362231))

(declare-fun m!1362233 () Bool)

(assert (=> b!1475762 m!1362233))

(declare-fun m!1362235 () Bool)

(assert (=> b!1475762 m!1362235))

(declare-fun m!1362237 () Bool)

(assert (=> b!1475776 m!1362237))

(assert (=> b!1475776 m!1362237))

(declare-fun m!1362239 () Bool)

(assert (=> b!1475776 m!1362239))

(declare-fun m!1362241 () Bool)

(assert (=> b!1475775 m!1362241))

(assert (=> b!1475764 m!1362233))

(declare-fun m!1362243 () Bool)

(assert (=> b!1475764 m!1362243))

(declare-fun m!1362245 () Bool)

(assert (=> b!1475759 m!1362245))

(declare-fun m!1362247 () Bool)

(assert (=> b!1475771 m!1362247))

(assert (=> b!1475771 m!1362233))

(declare-fun m!1362249 () Bool)

(assert (=> b!1475771 m!1362249))

(declare-fun m!1362251 () Bool)

(assert (=> b!1475771 m!1362251))

(declare-fun m!1362253 () Bool)

(assert (=> b!1475771 m!1362253))

(assert (=> b!1475771 m!1362221))

(assert (=> b!1475763 m!1362221))

(assert (=> b!1475763 m!1362221))

(declare-fun m!1362255 () Bool)

(assert (=> b!1475763 m!1362255))

(declare-fun m!1362257 () Bool)

(assert (=> b!1475767 m!1362257))

(assert (=> b!1475767 m!1362241))

(declare-fun m!1362259 () Bool)

(assert (=> b!1475774 m!1362259))

(assert (=> b!1475761 m!1362221))

(assert (=> b!1475761 m!1362221))

(declare-fun m!1362261 () Bool)

(assert (=> b!1475761 m!1362261))

(declare-fun m!1362263 () Bool)

(assert (=> b!1475773 m!1362263))

(assert (=> b!1475773 m!1362221))

(declare-fun m!1362265 () Bool)

(assert (=> b!1475760 m!1362265))

(check-sat (not b!1475776) (not b!1475766) (not b!1475761) (not b!1475771) (not b!1475774) (not b!1475768) (not start!126180) (not b!1475760) (not b!1475763) (not b!1475759) (not b!1475762) (not b!1475767) (not b!1475775))
(check-sat)
