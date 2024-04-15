; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125206 () Bool)

(assert start!125206)

(declare-fun b!1461066 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11882 0))(
  ( (MissingZero!11882 (index!49920 (_ BitVec 32))) (Found!11882 (index!49921 (_ BitVec 32))) (Intermediate!11882 (undefined!12694 Bool) (index!49922 (_ BitVec 32)) (x!131518 (_ BitVec 32))) (Undefined!11882) (MissingVacant!11882 (index!49923 (_ BitVec 32))) )
))
(declare-fun lt!639843 () SeekEntryResult!11882)

(declare-fun e!821423 () Bool)

(declare-datatypes ((array!98632 0))(
  ( (array!98633 (arr!47605 (Array (_ BitVec 32) (_ BitVec 64))) (size!48157 (_ BitVec 32))) )
))
(declare-fun lt!639840 () array!98632)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639842 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11882)

(assert (=> b!1461066 (= e!821423 (= lt!639843 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639842 lt!639840 mask!2687)))))

(declare-fun b!1461068 () Bool)

(declare-fun e!821422 () Bool)

(declare-fun e!821421 () Bool)

(assert (=> b!1461068 (= e!821422 (not e!821421))))

(declare-fun res!990835 () Bool)

(assert (=> b!1461068 (=> res!990835 e!821421)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98632)

(assert (=> b!1461068 (= res!990835 (or (and (= (select (arr!47605 a!2862) index!646) (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47605 a!2862) index!646) (select (arr!47605 a!2862) j!93))) (= (select (arr!47605 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821424 () Bool)

(assert (=> b!1461068 e!821424))

(declare-fun res!990831 () Bool)

(assert (=> b!1461068 (=> (not res!990831) (not e!821424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98632 (_ BitVec 32)) Bool)

(assert (=> b!1461068 (= res!990831 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49101 0))(
  ( (Unit!49102) )
))
(declare-fun lt!639846 () Unit!49101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49101)

(assert (=> b!1461068 (= lt!639846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461069 () Bool)

(declare-fun e!821415 () Bool)

(assert (=> b!1461069 (= e!821415 e!821422)))

(declare-fun res!990834 () Bool)

(assert (=> b!1461069 (=> (not res!990834) (not e!821422))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461069 (= res!990834 (= lt!639843 (Intermediate!11882 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461069 (= lt!639843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639842 mask!2687) lt!639842 lt!639840 mask!2687))))

(assert (=> b!1461069 (= lt!639842 (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461070 () Bool)

(declare-fun res!990839 () Bool)

(assert (=> b!1461070 (=> (not res!990839) (not e!821422))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461070 (= res!990839 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!821420 () Bool)

(declare-fun b!1461071 () Bool)

(declare-fun lt!639841 () (_ BitVec 32))

(assert (=> b!1461071 (= e!821420 (not (= lt!639843 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639841 lt!639842 lt!639840 mask!2687))))))

(declare-fun b!1461072 () Bool)

(declare-fun e!821419 () Bool)

(assert (=> b!1461072 (= e!821419 e!821415)))

(declare-fun res!990844 () Bool)

(assert (=> b!1461072 (=> (not res!990844) (not e!821415))))

(declare-fun lt!639845 () SeekEntryResult!11882)

(assert (=> b!1461072 (= res!990844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47605 a!2862) j!93) mask!2687) (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639845))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461072 (= lt!639845 (Intermediate!11882 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461073 () Bool)

(declare-fun res!990846 () Bool)

(declare-fun e!821418 () Bool)

(assert (=> b!1461073 (=> (not res!990846) (not e!821418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461073 (= res!990846 (validKeyInArray!0 (select (arr!47605 a!2862) j!93)))))

(declare-fun b!1461067 () Bool)

(declare-fun e!821416 () Bool)

(assert (=> b!1461067 (= e!821421 e!821416)))

(declare-fun res!990832 () Bool)

(assert (=> b!1461067 (=> res!990832 e!821416)))

(assert (=> b!1461067 (= res!990832 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639841 #b00000000000000000000000000000000) (bvsge lt!639841 (size!48157 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461067 (= lt!639841 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!990838 () Bool)

(assert (=> start!125206 (=> (not res!990838) (not e!821418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125206 (= res!990838 (validMask!0 mask!2687))))

(assert (=> start!125206 e!821418))

(assert (=> start!125206 true))

(declare-fun array_inv!36838 (array!98632) Bool)

(assert (=> start!125206 (array_inv!36838 a!2862)))

(declare-fun b!1461074 () Bool)

(declare-fun res!990843 () Bool)

(assert (=> b!1461074 (=> (not res!990843) (not e!821418))))

(assert (=> b!1461074 (= res!990843 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48157 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48157 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48157 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461075 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11882)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11882)

(assert (=> b!1461075 (= e!821420 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639841 intermediateAfterIndex!19 lt!639842 lt!639840 mask!2687) (seekEntryOrOpen!0 lt!639842 lt!639840 mask!2687))))))

(declare-fun b!1461076 () Bool)

(declare-fun res!990841 () Bool)

(assert (=> b!1461076 (=> (not res!990841) (not e!821415))))

(assert (=> b!1461076 (= res!990841 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639845))))

(declare-fun b!1461077 () Bool)

(declare-fun res!990830 () Bool)

(assert (=> b!1461077 (=> (not res!990830) (not e!821418))))

(assert (=> b!1461077 (= res!990830 (validKeyInArray!0 (select (arr!47605 a!2862) i!1006)))))

(declare-fun b!1461078 () Bool)

(assert (=> b!1461078 (= e!821416 true)))

(declare-fun lt!639844 () Bool)

(assert (=> b!1461078 (= lt!639844 e!821420)))

(declare-fun c!134632 () Bool)

(assert (=> b!1461078 (= c!134632 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461079 () Bool)

(declare-fun res!990833 () Bool)

(assert (=> b!1461079 (=> (not res!990833) (not e!821418))))

(assert (=> b!1461079 (= res!990833 (and (= (size!48157 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48157 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48157 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461080 () Bool)

(declare-fun res!990837 () Bool)

(assert (=> b!1461080 (=> (not res!990837) (not e!821418))))

(assert (=> b!1461080 (= res!990837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461081 () Bool)

(assert (=> b!1461081 (= e!821423 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639842 lt!639840 mask!2687) (seekEntryOrOpen!0 lt!639842 lt!639840 mask!2687)))))

(declare-fun b!1461082 () Bool)

(declare-fun res!990847 () Bool)

(assert (=> b!1461082 (=> (not res!990847) (not e!821418))))

(declare-datatypes ((List!34184 0))(
  ( (Nil!34181) (Cons!34180 (h!35530 (_ BitVec 64)) (t!48870 List!34184)) )
))
(declare-fun arrayNoDuplicates!0 (array!98632 (_ BitVec 32) List!34184) Bool)

(assert (=> b!1461082 (= res!990847 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34181))))

(declare-fun b!1461083 () Bool)

(assert (=> b!1461083 (= e!821418 e!821419)))

(declare-fun res!990840 () Bool)

(assert (=> b!1461083 (=> (not res!990840) (not e!821419))))

(assert (=> b!1461083 (= res!990840 (= (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461083 (= lt!639840 (array!98633 (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48157 a!2862)))))

(declare-fun b!1461084 () Bool)

(declare-fun res!990842 () Bool)

(assert (=> b!1461084 (=> res!990842 e!821416)))

(assert (=> b!1461084 (= res!990842 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639841 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639845)))))

(declare-fun b!1461085 () Bool)

(assert (=> b!1461085 (= e!821424 (or (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) (select (arr!47605 a!2862) j!93))))))

(declare-fun b!1461086 () Bool)

(declare-fun res!990845 () Bool)

(assert (=> b!1461086 (=> (not res!990845) (not e!821424))))

(assert (=> b!1461086 (= res!990845 (= (seekEntryOrOpen!0 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) (Found!11882 j!93)))))

(declare-fun b!1461087 () Bool)

(declare-fun res!990836 () Bool)

(assert (=> b!1461087 (=> (not res!990836) (not e!821422))))

(assert (=> b!1461087 (= res!990836 e!821423)))

(declare-fun c!134631 () Bool)

(assert (=> b!1461087 (= c!134631 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125206 res!990838) b!1461079))

(assert (= (and b!1461079 res!990833) b!1461077))

(assert (= (and b!1461077 res!990830) b!1461073))

(assert (= (and b!1461073 res!990846) b!1461080))

(assert (= (and b!1461080 res!990837) b!1461082))

(assert (= (and b!1461082 res!990847) b!1461074))

(assert (= (and b!1461074 res!990843) b!1461083))

(assert (= (and b!1461083 res!990840) b!1461072))

(assert (= (and b!1461072 res!990844) b!1461076))

(assert (= (and b!1461076 res!990841) b!1461069))

(assert (= (and b!1461069 res!990834) b!1461087))

(assert (= (and b!1461087 c!134631) b!1461066))

(assert (= (and b!1461087 (not c!134631)) b!1461081))

(assert (= (and b!1461087 res!990836) b!1461070))

(assert (= (and b!1461070 res!990839) b!1461068))

(assert (= (and b!1461068 res!990831) b!1461086))

(assert (= (and b!1461086 res!990845) b!1461085))

(assert (= (and b!1461068 (not res!990835)) b!1461067))

(assert (= (and b!1461067 (not res!990832)) b!1461084))

(assert (= (and b!1461084 (not res!990842)) b!1461078))

(assert (= (and b!1461078 c!134632) b!1461071))

(assert (= (and b!1461078 (not c!134632)) b!1461075))

(declare-fun m!1348185 () Bool)

(assert (=> b!1461084 m!1348185))

(assert (=> b!1461084 m!1348185))

(declare-fun m!1348187 () Bool)

(assert (=> b!1461084 m!1348187))

(declare-fun m!1348189 () Bool)

(assert (=> b!1461077 m!1348189))

(assert (=> b!1461077 m!1348189))

(declare-fun m!1348191 () Bool)

(assert (=> b!1461077 m!1348191))

(declare-fun m!1348193 () Bool)

(assert (=> b!1461080 m!1348193))

(declare-fun m!1348195 () Bool)

(assert (=> b!1461082 m!1348195))

(declare-fun m!1348197 () Bool)

(assert (=> b!1461069 m!1348197))

(assert (=> b!1461069 m!1348197))

(declare-fun m!1348199 () Bool)

(assert (=> b!1461069 m!1348199))

(declare-fun m!1348201 () Bool)

(assert (=> b!1461069 m!1348201))

(declare-fun m!1348203 () Bool)

(assert (=> b!1461069 m!1348203))

(declare-fun m!1348205 () Bool)

(assert (=> b!1461081 m!1348205))

(declare-fun m!1348207 () Bool)

(assert (=> b!1461081 m!1348207))

(declare-fun m!1348209 () Bool)

(assert (=> b!1461067 m!1348209))

(assert (=> b!1461083 m!1348201))

(declare-fun m!1348211 () Bool)

(assert (=> b!1461083 m!1348211))

(declare-fun m!1348213 () Bool)

(assert (=> b!1461066 m!1348213))

(assert (=> b!1461076 m!1348185))

(assert (=> b!1461076 m!1348185))

(declare-fun m!1348215 () Bool)

(assert (=> b!1461076 m!1348215))

(declare-fun m!1348217 () Bool)

(assert (=> b!1461071 m!1348217))

(declare-fun m!1348219 () Bool)

(assert (=> b!1461085 m!1348219))

(assert (=> b!1461085 m!1348185))

(assert (=> b!1461073 m!1348185))

(assert (=> b!1461073 m!1348185))

(declare-fun m!1348221 () Bool)

(assert (=> b!1461073 m!1348221))

(assert (=> b!1461072 m!1348185))

(assert (=> b!1461072 m!1348185))

(declare-fun m!1348223 () Bool)

(assert (=> b!1461072 m!1348223))

(assert (=> b!1461072 m!1348223))

(assert (=> b!1461072 m!1348185))

(declare-fun m!1348225 () Bool)

(assert (=> b!1461072 m!1348225))

(declare-fun m!1348227 () Bool)

(assert (=> b!1461075 m!1348227))

(assert (=> b!1461075 m!1348207))

(declare-fun m!1348229 () Bool)

(assert (=> b!1461068 m!1348229))

(assert (=> b!1461068 m!1348201))

(declare-fun m!1348231 () Bool)

(assert (=> b!1461068 m!1348231))

(declare-fun m!1348233 () Bool)

(assert (=> b!1461068 m!1348233))

(declare-fun m!1348235 () Bool)

(assert (=> b!1461068 m!1348235))

(assert (=> b!1461068 m!1348185))

(assert (=> b!1461086 m!1348185))

(assert (=> b!1461086 m!1348185))

(declare-fun m!1348237 () Bool)

(assert (=> b!1461086 m!1348237))

(declare-fun m!1348239 () Bool)

(assert (=> start!125206 m!1348239))

(declare-fun m!1348241 () Bool)

(assert (=> start!125206 m!1348241))

(check-sat (not b!1461066) (not b!1461086) (not b!1461080) (not b!1461068) (not start!125206) (not b!1461076) (not b!1461071) (not b!1461069) (not b!1461084) (not b!1461081) (not b!1461067) (not b!1461072) (not b!1461073) (not b!1461077) (not b!1461082) (not b!1461075))
(check-sat)
