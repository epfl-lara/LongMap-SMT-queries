; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124906 () Bool)

(assert start!124906)

(declare-fun b!1451705 () Bool)

(declare-fun res!983008 () Bool)

(declare-fun e!817296 () Bool)

(assert (=> b!1451705 (=> (not res!983008) (not e!817296))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451705 (= res!983008 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451706 () Bool)

(declare-fun res!983004 () Bool)

(declare-fun e!817300 () Bool)

(assert (=> b!1451706 (=> (not res!983004) (not e!817300))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98332 0))(
  ( (array!98333 (arr!47455 (Array (_ BitVec 32) (_ BitVec 64))) (size!48007 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98332)

(assert (=> b!1451706 (= res!983004 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48007 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48007 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48007 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451707 () Bool)

(declare-fun res!983014 () Bool)

(assert (=> b!1451707 (=> (not res!983014) (not e!817300))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451707 (= res!983014 (validKeyInArray!0 (select (arr!47455 a!2862) j!93)))))

(declare-fun lt!636553 () array!98332)

(declare-fun b!1451708 () Bool)

(declare-fun lt!636552 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!817298 () Bool)

(declare-datatypes ((SeekEntryResult!11732 0))(
  ( (MissingZero!11732 (index!49320 (_ BitVec 32))) (Found!11732 (index!49321 (_ BitVec 32))) (Intermediate!11732 (undefined!12544 Bool) (index!49322 (_ BitVec 32)) (x!130968 (_ BitVec 32))) (Undefined!11732) (MissingVacant!11732 (index!49323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11732)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11732)

(assert (=> b!1451708 (= e!817298 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636552 lt!636553 mask!2687) (seekEntryOrOpen!0 lt!636552 lt!636553 mask!2687)))))

(declare-fun b!1451710 () Bool)

(declare-fun res!983009 () Bool)

(declare-fun e!817297 () Bool)

(assert (=> b!1451710 (=> (not res!983009) (not e!817297))))

(declare-fun lt!636555 () SeekEntryResult!11732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98332 (_ BitVec 32)) SeekEntryResult!11732)

(assert (=> b!1451710 (= res!983009 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!636555))))

(declare-fun b!1451711 () Bool)

(assert (=> b!1451711 (= e!817296 (not (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817301 () Bool)

(assert (=> b!1451711 e!817301))

(declare-fun res!983016 () Bool)

(assert (=> b!1451711 (=> (not res!983016) (not e!817301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98332 (_ BitVec 32)) Bool)

(assert (=> b!1451711 (= res!983016 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48801 0))(
  ( (Unit!48802) )
))
(declare-fun lt!636554 () Unit!48801)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48801)

(assert (=> b!1451711 (= lt!636554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451712 () Bool)

(declare-fun res!983015 () Bool)

(assert (=> b!1451712 (=> (not res!983015) (not e!817300))))

(assert (=> b!1451712 (= res!983015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451713 () Bool)

(assert (=> b!1451713 (= e!817297 e!817296)))

(declare-fun res!983006 () Bool)

(assert (=> b!1451713 (=> (not res!983006) (not e!817296))))

(declare-fun lt!636551 () SeekEntryResult!11732)

(assert (=> b!1451713 (= res!983006 (= lt!636551 (Intermediate!11732 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451713 (= lt!636551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636552 mask!2687) lt!636552 lt!636553 mask!2687))))

(assert (=> b!1451713 (= lt!636552 (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451714 () Bool)

(declare-fun res!983011 () Bool)

(assert (=> b!1451714 (=> (not res!983011) (not e!817300))))

(declare-datatypes ((List!34034 0))(
  ( (Nil!34031) (Cons!34030 (h!35380 (_ BitVec 64)) (t!48720 List!34034)) )
))
(declare-fun arrayNoDuplicates!0 (array!98332 (_ BitVec 32) List!34034) Bool)

(assert (=> b!1451714 (= res!983011 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34031))))

(declare-fun b!1451715 () Bool)

(declare-fun res!983012 () Bool)

(assert (=> b!1451715 (=> (not res!983012) (not e!817300))))

(assert (=> b!1451715 (= res!983012 (and (= (size!48007 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48007 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48007 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451716 () Bool)

(declare-fun e!817299 () Bool)

(assert (=> b!1451716 (= e!817300 e!817299)))

(declare-fun res!983007 () Bool)

(assert (=> b!1451716 (=> (not res!983007) (not e!817299))))

(assert (=> b!1451716 (= res!983007 (= (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451716 (= lt!636553 (array!98333 (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48007 a!2862)))))

(declare-fun b!1451717 () Bool)

(assert (=> b!1451717 (= e!817299 e!817297)))

(declare-fun res!983017 () Bool)

(assert (=> b!1451717 (=> (not res!983017) (not e!817297))))

(assert (=> b!1451717 (= res!983017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47455 a!2862) j!93) mask!2687) (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!636555))))

(assert (=> b!1451717 (= lt!636555 (Intermediate!11732 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451718 () Bool)

(assert (=> b!1451718 (= e!817298 (= lt!636551 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636552 lt!636553 mask!2687)))))

(declare-fun b!1451719 () Bool)

(declare-fun res!983003 () Bool)

(assert (=> b!1451719 (=> (not res!983003) (not e!817301))))

(assert (=> b!1451719 (= res!983003 (= (seekEntryOrOpen!0 (select (arr!47455 a!2862) j!93) a!2862 mask!2687) (Found!11732 j!93)))))

(declare-fun b!1451709 () Bool)

(declare-fun res!983013 () Bool)

(assert (=> b!1451709 (=> (not res!983013) (not e!817296))))

(assert (=> b!1451709 (= res!983013 e!817298)))

(declare-fun c!133864 () Bool)

(assert (=> b!1451709 (= c!133864 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983005 () Bool)

(assert (=> start!124906 (=> (not res!983005) (not e!817300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124906 (= res!983005 (validMask!0 mask!2687))))

(assert (=> start!124906 e!817300))

(assert (=> start!124906 true))

(declare-fun array_inv!36688 (array!98332) Bool)

(assert (=> start!124906 (array_inv!36688 a!2862)))

(declare-fun b!1451720 () Bool)

(declare-fun res!983010 () Bool)

(assert (=> b!1451720 (=> (not res!983010) (not e!817300))))

(assert (=> b!1451720 (= res!983010 (validKeyInArray!0 (select (arr!47455 a!2862) i!1006)))))

(declare-fun b!1451721 () Bool)

(assert (=> b!1451721 (= e!817301 (and (or (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) (select (arr!47455 a!2862) j!93))) (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124906 res!983005) b!1451715))

(assert (= (and b!1451715 res!983012) b!1451720))

(assert (= (and b!1451720 res!983010) b!1451707))

(assert (= (and b!1451707 res!983014) b!1451712))

(assert (= (and b!1451712 res!983015) b!1451714))

(assert (= (and b!1451714 res!983011) b!1451706))

(assert (= (and b!1451706 res!983004) b!1451716))

(assert (= (and b!1451716 res!983007) b!1451717))

(assert (= (and b!1451717 res!983017) b!1451710))

(assert (= (and b!1451710 res!983009) b!1451713))

(assert (= (and b!1451713 res!983006) b!1451709))

(assert (= (and b!1451709 c!133864) b!1451718))

(assert (= (and b!1451709 (not c!133864)) b!1451708))

(assert (= (and b!1451709 res!983013) b!1451705))

(assert (= (and b!1451705 res!983008) b!1451711))

(assert (= (and b!1451711 res!983016) b!1451719))

(assert (= (and b!1451719 res!983003) b!1451721))

(declare-fun m!1339809 () Bool)

(assert (=> b!1451719 m!1339809))

(assert (=> b!1451719 m!1339809))

(declare-fun m!1339811 () Bool)

(assert (=> b!1451719 m!1339811))

(declare-fun m!1339813 () Bool)

(assert (=> b!1451716 m!1339813))

(declare-fun m!1339815 () Bool)

(assert (=> b!1451716 m!1339815))

(declare-fun m!1339817 () Bool)

(assert (=> b!1451712 m!1339817))

(assert (=> b!1451717 m!1339809))

(assert (=> b!1451717 m!1339809))

(declare-fun m!1339819 () Bool)

(assert (=> b!1451717 m!1339819))

(assert (=> b!1451717 m!1339819))

(assert (=> b!1451717 m!1339809))

(declare-fun m!1339821 () Bool)

(assert (=> b!1451717 m!1339821))

(assert (=> b!1451721 m!1339813))

(declare-fun m!1339823 () Bool)

(assert (=> b!1451721 m!1339823))

(declare-fun m!1339825 () Bool)

(assert (=> b!1451721 m!1339825))

(declare-fun m!1339827 () Bool)

(assert (=> b!1451721 m!1339827))

(assert (=> b!1451721 m!1339809))

(declare-fun m!1339829 () Bool)

(assert (=> start!124906 m!1339829))

(declare-fun m!1339831 () Bool)

(assert (=> start!124906 m!1339831))

(declare-fun m!1339833 () Bool)

(assert (=> b!1451711 m!1339833))

(assert (=> b!1451711 m!1339813))

(assert (=> b!1451711 m!1339825))

(assert (=> b!1451711 m!1339827))

(declare-fun m!1339835 () Bool)

(assert (=> b!1451711 m!1339835))

(assert (=> b!1451711 m!1339809))

(declare-fun m!1339837 () Bool)

(assert (=> b!1451708 m!1339837))

(declare-fun m!1339839 () Bool)

(assert (=> b!1451708 m!1339839))

(assert (=> b!1451710 m!1339809))

(assert (=> b!1451710 m!1339809))

(declare-fun m!1339841 () Bool)

(assert (=> b!1451710 m!1339841))

(assert (=> b!1451707 m!1339809))

(assert (=> b!1451707 m!1339809))

(declare-fun m!1339843 () Bool)

(assert (=> b!1451707 m!1339843))

(declare-fun m!1339845 () Bool)

(assert (=> b!1451718 m!1339845))

(declare-fun m!1339847 () Bool)

(assert (=> b!1451714 m!1339847))

(declare-fun m!1339849 () Bool)

(assert (=> b!1451713 m!1339849))

(assert (=> b!1451713 m!1339849))

(declare-fun m!1339851 () Bool)

(assert (=> b!1451713 m!1339851))

(assert (=> b!1451713 m!1339813))

(declare-fun m!1339853 () Bool)

(assert (=> b!1451713 m!1339853))

(declare-fun m!1339855 () Bool)

(assert (=> b!1451720 m!1339855))

(assert (=> b!1451720 m!1339855))

(declare-fun m!1339857 () Bool)

(assert (=> b!1451720 m!1339857))

(check-sat (not start!124906) (not b!1451710) (not b!1451719) (not b!1451712) (not b!1451717) (not b!1451713) (not b!1451708) (not b!1451707) (not b!1451720) (not b!1451711) (not b!1451714) (not b!1451718))
(check-sat)
