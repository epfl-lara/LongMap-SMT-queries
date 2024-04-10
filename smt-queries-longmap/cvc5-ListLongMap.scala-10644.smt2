; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125002 () Bool)

(assert start!125002)

(declare-fun b!1453710 () Bool)

(declare-fun res!984693 () Bool)

(declare-fun e!818198 () Bool)

(assert (=> b!1453710 (=> (not res!984693) (not e!818198))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98450 0))(
  ( (array!98451 (arr!47513 (Array (_ BitVec 32) (_ BitVec 64))) (size!48063 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98450)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453710 (= res!984693 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48063 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48063 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48063 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453711 () Bool)

(declare-fun e!818200 () Bool)

(declare-fun e!818194 () Bool)

(assert (=> b!1453711 (= e!818200 (not e!818194))))

(declare-fun res!984698 () Bool)

(assert (=> b!1453711 (=> res!984698 e!818194)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453711 (= res!984698 (or (and (= (select (arr!47513 a!2862) index!646) (select (store (arr!47513 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47513 a!2862) index!646) (select (arr!47513 a!2862) j!93))) (= (select (arr!47513 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818199 () Bool)

(assert (=> b!1453711 e!818199))

(declare-fun res!984699 () Bool)

(assert (=> b!1453711 (=> (not res!984699) (not e!818199))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98450 (_ BitVec 32)) Bool)

(assert (=> b!1453711 (= res!984699 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49026 0))(
  ( (Unit!49027) )
))
(declare-fun lt!637326 () Unit!49026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49026)

(assert (=> b!1453711 (= lt!637326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453712 () Bool)

(declare-fun e!818196 () Bool)

(declare-fun e!818201 () Bool)

(assert (=> b!1453712 (= e!818196 e!818201)))

(declare-fun res!984696 () Bool)

(assert (=> b!1453712 (=> (not res!984696) (not e!818201))))

(declare-datatypes ((SeekEntryResult!11765 0))(
  ( (MissingZero!11765 (index!49452 (_ BitVec 32))) (Found!11765 (index!49453 (_ BitVec 32))) (Intermediate!11765 (undefined!12577 Bool) (index!49454 (_ BitVec 32)) (x!131094 (_ BitVec 32))) (Undefined!11765) (MissingVacant!11765 (index!49455 (_ BitVec 32))) )
))
(declare-fun lt!637324 () SeekEntryResult!11765)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98450 (_ BitVec 32)) SeekEntryResult!11765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453712 (= res!984696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47513 a!2862) j!93) mask!2687) (select (arr!47513 a!2862) j!93) a!2862 mask!2687) lt!637324))))

(assert (=> b!1453712 (= lt!637324 (Intermediate!11765 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!637322 () (_ BitVec 32))

(declare-fun e!818193 () Bool)

(declare-fun lt!637325 () (_ BitVec 64))

(declare-fun lt!637329 () SeekEntryResult!11765)

(declare-fun b!1453713 () Bool)

(declare-fun lt!637323 () array!98450)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98450 (_ BitVec 32)) SeekEntryResult!11765)

(assert (=> b!1453713 (= e!818193 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637322 intermediateAfterIndex!19 lt!637325 lt!637323 mask!2687) lt!637329)))))

(declare-fun b!1453714 () Bool)

(declare-fun res!984697 () Bool)

(assert (=> b!1453714 (=> (not res!984697) (not e!818200))))

(declare-fun e!818195 () Bool)

(assert (=> b!1453714 (= res!984697 e!818195)))

(declare-fun c!134022 () Bool)

(assert (=> b!1453714 (= c!134022 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453716 () Bool)

(declare-fun res!984695 () Bool)

(assert (=> b!1453716 (=> (not res!984695) (not e!818198))))

(assert (=> b!1453716 (= res!984695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453717 () Bool)

(declare-fun res!984692 () Bool)

(assert (=> b!1453717 (=> (not res!984692) (not e!818198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453717 (= res!984692 (validKeyInArray!0 (select (arr!47513 a!2862) j!93)))))

(declare-fun b!1453718 () Bool)

(declare-fun e!818192 () Bool)

(assert (=> b!1453718 (= e!818194 e!818192)))

(declare-fun res!984700 () Bool)

(assert (=> b!1453718 (=> res!984700 e!818192)))

(assert (=> b!1453718 (= res!984700 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637322 #b00000000000000000000000000000000) (bvsge lt!637322 (size!48063 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453718 (= lt!637322 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453718 (= lt!637329 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637325 lt!637323 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98450 (_ BitVec 32)) SeekEntryResult!11765)

(assert (=> b!1453718 (= lt!637329 (seekEntryOrOpen!0 lt!637325 lt!637323 mask!2687))))

(declare-fun b!1453719 () Bool)

(assert (=> b!1453719 (= e!818201 e!818200)))

(declare-fun res!984705 () Bool)

(assert (=> b!1453719 (=> (not res!984705) (not e!818200))))

(declare-fun lt!637327 () SeekEntryResult!11765)

(assert (=> b!1453719 (= res!984705 (= lt!637327 (Intermediate!11765 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453719 (= lt!637327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637325 mask!2687) lt!637325 lt!637323 mask!2687))))

(assert (=> b!1453719 (= lt!637325 (select (store (arr!47513 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453720 () Bool)

(declare-fun res!984690 () Bool)

(assert (=> b!1453720 (=> (not res!984690) (not e!818198))))

(assert (=> b!1453720 (= res!984690 (validKeyInArray!0 (select (arr!47513 a!2862) i!1006)))))

(declare-fun b!1453721 () Bool)

(assert (=> b!1453721 (= e!818195 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637325 lt!637323 mask!2687) (seekEntryOrOpen!0 lt!637325 lt!637323 mask!2687)))))

(declare-fun b!1453722 () Bool)

(declare-fun res!984702 () Bool)

(assert (=> b!1453722 (=> (not res!984702) (not e!818198))))

(declare-datatypes ((List!34014 0))(
  ( (Nil!34011) (Cons!34010 (h!35360 (_ BitVec 64)) (t!48708 List!34014)) )
))
(declare-fun arrayNoDuplicates!0 (array!98450 (_ BitVec 32) List!34014) Bool)

(assert (=> b!1453722 (= res!984702 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34011))))

(declare-fun b!1453723 () Bool)

(assert (=> b!1453723 (= e!818192 true)))

(declare-fun lt!637328 () Bool)

(assert (=> b!1453723 (= lt!637328 e!818193)))

(declare-fun c!134021 () Bool)

(assert (=> b!1453723 (= c!134021 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453724 () Bool)

(declare-fun res!984701 () Bool)

(assert (=> b!1453724 (=> (not res!984701) (not e!818198))))

(assert (=> b!1453724 (= res!984701 (and (= (size!48063 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48063 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48063 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453725 () Bool)

(assert (=> b!1453725 (= e!818198 e!818196)))

(declare-fun res!984703 () Bool)

(assert (=> b!1453725 (=> (not res!984703) (not e!818196))))

(assert (=> b!1453725 (= res!984703 (= (select (store (arr!47513 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453725 (= lt!637323 (array!98451 (store (arr!47513 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48063 a!2862)))))

(declare-fun res!984706 () Bool)

(assert (=> start!125002 (=> (not res!984706) (not e!818198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125002 (= res!984706 (validMask!0 mask!2687))))

(assert (=> start!125002 e!818198))

(assert (=> start!125002 true))

(declare-fun array_inv!36541 (array!98450) Bool)

(assert (=> start!125002 (array_inv!36541 a!2862)))

(declare-fun b!1453715 () Bool)

(declare-fun res!984694 () Bool)

(assert (=> b!1453715 (=> (not res!984694) (not e!818201))))

(assert (=> b!1453715 (= res!984694 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47513 a!2862) j!93) a!2862 mask!2687) lt!637324))))

(declare-fun b!1453726 () Bool)

(declare-fun res!984691 () Bool)

(assert (=> b!1453726 (=> (not res!984691) (not e!818199))))

(assert (=> b!1453726 (= res!984691 (= (seekEntryOrOpen!0 (select (arr!47513 a!2862) j!93) a!2862 mask!2687) (Found!11765 j!93)))))

(declare-fun b!1453727 () Bool)

(assert (=> b!1453727 (= e!818193 (not (= lt!637327 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637322 lt!637325 lt!637323 mask!2687))))))

(declare-fun b!1453728 () Bool)

(declare-fun res!984689 () Bool)

(assert (=> b!1453728 (=> (not res!984689) (not e!818200))))

(assert (=> b!1453728 (= res!984689 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453729 () Bool)

(assert (=> b!1453729 (= e!818199 (and (or (= (select (arr!47513 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47513 a!2862) intermediateBeforeIndex!19) (select (arr!47513 a!2862) j!93))) (let ((bdg!52999 (select (store (arr!47513 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47513 a!2862) index!646) bdg!52999) (= (select (arr!47513 a!2862) index!646) (select (arr!47513 a!2862) j!93))) (= (select (arr!47513 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!52999 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453730 () Bool)

(declare-fun res!984704 () Bool)

(assert (=> b!1453730 (=> res!984704 e!818192)))

(assert (=> b!1453730 (= res!984704 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637322 (select (arr!47513 a!2862) j!93) a!2862 mask!2687) lt!637324)))))

(declare-fun b!1453731 () Bool)

(assert (=> b!1453731 (= e!818195 (= lt!637327 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637325 lt!637323 mask!2687)))))

(assert (= (and start!125002 res!984706) b!1453724))

(assert (= (and b!1453724 res!984701) b!1453720))

(assert (= (and b!1453720 res!984690) b!1453717))

(assert (= (and b!1453717 res!984692) b!1453716))

(assert (= (and b!1453716 res!984695) b!1453722))

(assert (= (and b!1453722 res!984702) b!1453710))

(assert (= (and b!1453710 res!984693) b!1453725))

(assert (= (and b!1453725 res!984703) b!1453712))

(assert (= (and b!1453712 res!984696) b!1453715))

(assert (= (and b!1453715 res!984694) b!1453719))

(assert (= (and b!1453719 res!984705) b!1453714))

(assert (= (and b!1453714 c!134022) b!1453731))

(assert (= (and b!1453714 (not c!134022)) b!1453721))

(assert (= (and b!1453714 res!984697) b!1453728))

(assert (= (and b!1453728 res!984689) b!1453711))

(assert (= (and b!1453711 res!984699) b!1453726))

(assert (= (and b!1453726 res!984691) b!1453729))

(assert (= (and b!1453711 (not res!984698)) b!1453718))

(assert (= (and b!1453718 (not res!984700)) b!1453730))

(assert (= (and b!1453730 (not res!984704)) b!1453723))

(assert (= (and b!1453723 c!134021) b!1453727))

(assert (= (and b!1453723 (not c!134021)) b!1453713))

(declare-fun m!1342141 () Bool)

(assert (=> b!1453718 m!1342141))

(declare-fun m!1342143 () Bool)

(assert (=> b!1453718 m!1342143))

(declare-fun m!1342145 () Bool)

(assert (=> b!1453718 m!1342145))

(declare-fun m!1342147 () Bool)

(assert (=> b!1453716 m!1342147))

(declare-fun m!1342149 () Bool)

(assert (=> start!125002 m!1342149))

(declare-fun m!1342151 () Bool)

(assert (=> start!125002 m!1342151))

(declare-fun m!1342153 () Bool)

(assert (=> b!1453720 m!1342153))

(assert (=> b!1453720 m!1342153))

(declare-fun m!1342155 () Bool)

(assert (=> b!1453720 m!1342155))

(declare-fun m!1342157 () Bool)

(assert (=> b!1453712 m!1342157))

(assert (=> b!1453712 m!1342157))

(declare-fun m!1342159 () Bool)

(assert (=> b!1453712 m!1342159))

(assert (=> b!1453712 m!1342159))

(assert (=> b!1453712 m!1342157))

(declare-fun m!1342161 () Bool)

(assert (=> b!1453712 m!1342161))

(declare-fun m!1342163 () Bool)

(assert (=> b!1453711 m!1342163))

(declare-fun m!1342165 () Bool)

(assert (=> b!1453711 m!1342165))

(declare-fun m!1342167 () Bool)

(assert (=> b!1453711 m!1342167))

(declare-fun m!1342169 () Bool)

(assert (=> b!1453711 m!1342169))

(declare-fun m!1342171 () Bool)

(assert (=> b!1453711 m!1342171))

(assert (=> b!1453711 m!1342157))

(assert (=> b!1453726 m!1342157))

(assert (=> b!1453726 m!1342157))

(declare-fun m!1342173 () Bool)

(assert (=> b!1453726 m!1342173))

(declare-fun m!1342175 () Bool)

(assert (=> b!1453713 m!1342175))

(assert (=> b!1453717 m!1342157))

(assert (=> b!1453717 m!1342157))

(declare-fun m!1342177 () Bool)

(assert (=> b!1453717 m!1342177))

(declare-fun m!1342179 () Bool)

(assert (=> b!1453722 m!1342179))

(assert (=> b!1453730 m!1342157))

(assert (=> b!1453730 m!1342157))

(declare-fun m!1342181 () Bool)

(assert (=> b!1453730 m!1342181))

(declare-fun m!1342183 () Bool)

(assert (=> b!1453727 m!1342183))

(declare-fun m!1342185 () Bool)

(assert (=> b!1453731 m!1342185))

(declare-fun m!1342187 () Bool)

(assert (=> b!1453719 m!1342187))

(assert (=> b!1453719 m!1342187))

(declare-fun m!1342189 () Bool)

(assert (=> b!1453719 m!1342189))

(assert (=> b!1453719 m!1342165))

(declare-fun m!1342191 () Bool)

(assert (=> b!1453719 m!1342191))

(assert (=> b!1453725 m!1342165))

(declare-fun m!1342193 () Bool)

(assert (=> b!1453725 m!1342193))

(assert (=> b!1453715 m!1342157))

(assert (=> b!1453715 m!1342157))

(declare-fun m!1342195 () Bool)

(assert (=> b!1453715 m!1342195))

(assert (=> b!1453721 m!1342143))

(assert (=> b!1453721 m!1342145))

(assert (=> b!1453729 m!1342165))

(declare-fun m!1342197 () Bool)

(assert (=> b!1453729 m!1342197))

(assert (=> b!1453729 m!1342167))

(assert (=> b!1453729 m!1342169))

(assert (=> b!1453729 m!1342157))

(push 1)

