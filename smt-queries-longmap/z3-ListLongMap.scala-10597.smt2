; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124938 () Bool)

(assert start!124938)

(declare-fun b!1447143 () Bool)

(declare-fun res!978149 () Bool)

(declare-fun e!815235 () Bool)

(assert (=> b!1447143 (=> (not res!978149) (not e!815235))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98281 0))(
  ( (array!98282 (arr!47425 (Array (_ BitVec 32) (_ BitVec 64))) (size!47976 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98281)

(assert (=> b!1447143 (= res!978149 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47976 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47976 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47976 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447144 () Bool)

(declare-fun e!815238 () Bool)

(declare-fun e!815241 () Bool)

(assert (=> b!1447144 (= e!815238 e!815241)))

(declare-fun res!978151 () Bool)

(assert (=> b!1447144 (=> (not res!978151) (not e!815241))))

(declare-datatypes ((SeekEntryResult!11574 0))(
  ( (MissingZero!11574 (index!48688 (_ BitVec 32))) (Found!11574 (index!48689 (_ BitVec 32))) (Intermediate!11574 (undefined!12386 Bool) (index!48690 (_ BitVec 32)) (x!130551 (_ BitVec 32))) (Undefined!11574) (MissingVacant!11574 (index!48691 (_ BitVec 32))) )
))
(declare-fun lt!635085 () SeekEntryResult!11574)

(assert (=> b!1447144 (= res!978151 (= lt!635085 (Intermediate!11574 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635088 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635087 () array!98281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98281 (_ BitVec 32)) SeekEntryResult!11574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447144 (= lt!635085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635088 mask!2687) lt!635088 lt!635087 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447144 (= lt!635088 (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!978154 () Bool)

(assert (=> start!124938 (=> (not res!978154) (not e!815235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124938 (= res!978154 (validMask!0 mask!2687))))

(assert (=> start!124938 e!815235))

(assert (=> start!124938 true))

(declare-fun array_inv!36706 (array!98281) Bool)

(assert (=> start!124938 (array_inv!36706 a!2862)))

(declare-fun b!1447145 () Bool)

(declare-fun e!815239 () Bool)

(assert (=> b!1447145 (= e!815239 (= lt!635085 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635088 lt!635087 mask!2687)))))

(declare-fun b!1447146 () Bool)

(declare-fun res!978156 () Bool)

(assert (=> b!1447146 (=> (not res!978156) (not e!815235))))

(assert (=> b!1447146 (= res!978156 (and (= (size!47976 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47976 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47976 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447147 () Bool)

(declare-fun e!815236 () Bool)

(assert (=> b!1447147 (= e!815235 e!815236)))

(declare-fun res!978152 () Bool)

(assert (=> b!1447147 (=> (not res!978152) (not e!815236))))

(assert (=> b!1447147 (= res!978152 (= (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447147 (= lt!635087 (array!98282 (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47976 a!2862)))))

(declare-fun b!1447148 () Bool)

(declare-fun res!978159 () Bool)

(assert (=> b!1447148 (=> (not res!978159) (not e!815235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447148 (= res!978159 (validKeyInArray!0 (select (arr!47425 a!2862) i!1006)))))

(declare-fun b!1447149 () Bool)

(declare-fun res!978161 () Bool)

(assert (=> b!1447149 (=> (not res!978161) (not e!815235))))

(assert (=> b!1447149 (= res!978161 (validKeyInArray!0 (select (arr!47425 a!2862) j!93)))))

(declare-fun b!1447150 () Bool)

(assert (=> b!1447150 (= e!815236 e!815238)))

(declare-fun res!978150 () Bool)

(assert (=> b!1447150 (=> (not res!978150) (not e!815238))))

(declare-fun lt!635086 () SeekEntryResult!11574)

(assert (=> b!1447150 (= res!978150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47425 a!2862) j!93) mask!2687) (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635086))))

(assert (=> b!1447150 (= lt!635086 (Intermediate!11574 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447151 () Bool)

(declare-fun res!978157 () Bool)

(declare-fun e!815240 () Bool)

(assert (=> b!1447151 (=> (not res!978157) (not e!815240))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98281 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1447151 (= res!978157 (= (seekEntryOrOpen!0 (select (arr!47425 a!2862) j!93) a!2862 mask!2687) (Found!11574 j!93)))))

(declare-fun b!1447152 () Bool)

(assert (=> b!1447152 (= e!815241 (not true))))

(assert (=> b!1447152 e!815240))

(declare-fun res!978153 () Bool)

(assert (=> b!1447152 (=> (not res!978153) (not e!815240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98281 (_ BitVec 32)) Bool)

(assert (=> b!1447152 (= res!978153 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48677 0))(
  ( (Unit!48678) )
))
(declare-fun lt!635089 () Unit!48677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48677)

(assert (=> b!1447152 (= lt!635089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447153 () Bool)

(declare-fun res!978160 () Bool)

(assert (=> b!1447153 (=> (not res!978160) (not e!815235))))

(assert (=> b!1447153 (= res!978160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447154 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98281 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1447154 (= e!815239 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635088 lt!635087 mask!2687) (seekEntryOrOpen!0 lt!635088 lt!635087 mask!2687)))))

(declare-fun b!1447155 () Bool)

(declare-fun res!978155 () Bool)

(assert (=> b!1447155 (=> (not res!978155) (not e!815241))))

(assert (=> b!1447155 (= res!978155 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447156 () Bool)

(declare-fun res!978158 () Bool)

(assert (=> b!1447156 (=> (not res!978158) (not e!815241))))

(assert (=> b!1447156 (= res!978158 e!815239)))

(declare-fun c!134017 () Bool)

(assert (=> b!1447156 (= c!134017 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447157 () Bool)

(declare-fun res!978147 () Bool)

(assert (=> b!1447157 (=> (not res!978147) (not e!815238))))

(assert (=> b!1447157 (= res!978147 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635086))))

(declare-fun b!1447158 () Bool)

(assert (=> b!1447158 (= e!815240 (or (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) (select (arr!47425 a!2862) j!93))))))

(declare-fun b!1447159 () Bool)

(declare-fun res!978148 () Bool)

(assert (=> b!1447159 (=> (not res!978148) (not e!815235))))

(declare-datatypes ((List!33913 0))(
  ( (Nil!33910) (Cons!33909 (h!35270 (_ BitVec 64)) (t!48599 List!33913)) )
))
(declare-fun arrayNoDuplicates!0 (array!98281 (_ BitVec 32) List!33913) Bool)

(assert (=> b!1447159 (= res!978148 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33910))))

(assert (= (and start!124938 res!978154) b!1447146))

(assert (= (and b!1447146 res!978156) b!1447148))

(assert (= (and b!1447148 res!978159) b!1447149))

(assert (= (and b!1447149 res!978161) b!1447153))

(assert (= (and b!1447153 res!978160) b!1447159))

(assert (= (and b!1447159 res!978148) b!1447143))

(assert (= (and b!1447143 res!978149) b!1447147))

(assert (= (and b!1447147 res!978152) b!1447150))

(assert (= (and b!1447150 res!978150) b!1447157))

(assert (= (and b!1447157 res!978147) b!1447144))

(assert (= (and b!1447144 res!978151) b!1447156))

(assert (= (and b!1447156 c!134017) b!1447145))

(assert (= (and b!1447156 (not c!134017)) b!1447154))

(assert (= (and b!1447156 res!978158) b!1447155))

(assert (= (and b!1447155 res!978155) b!1447152))

(assert (= (and b!1447152 res!978153) b!1447151))

(assert (= (and b!1447151 res!978157) b!1447158))

(declare-fun m!1336189 () Bool)

(assert (=> b!1447145 m!1336189))

(declare-fun m!1336191 () Bool)

(assert (=> b!1447151 m!1336191))

(assert (=> b!1447151 m!1336191))

(declare-fun m!1336193 () Bool)

(assert (=> b!1447151 m!1336193))

(declare-fun m!1336195 () Bool)

(assert (=> b!1447158 m!1336195))

(assert (=> b!1447158 m!1336191))

(declare-fun m!1336197 () Bool)

(assert (=> b!1447153 m!1336197))

(declare-fun m!1336199 () Bool)

(assert (=> b!1447147 m!1336199))

(declare-fun m!1336201 () Bool)

(assert (=> b!1447147 m!1336201))

(declare-fun m!1336203 () Bool)

(assert (=> b!1447148 m!1336203))

(assert (=> b!1447148 m!1336203))

(declare-fun m!1336205 () Bool)

(assert (=> b!1447148 m!1336205))

(assert (=> b!1447149 m!1336191))

(assert (=> b!1447149 m!1336191))

(declare-fun m!1336207 () Bool)

(assert (=> b!1447149 m!1336207))

(declare-fun m!1336209 () Bool)

(assert (=> b!1447159 m!1336209))

(assert (=> b!1447157 m!1336191))

(assert (=> b!1447157 m!1336191))

(declare-fun m!1336211 () Bool)

(assert (=> b!1447157 m!1336211))

(declare-fun m!1336213 () Bool)

(assert (=> b!1447144 m!1336213))

(assert (=> b!1447144 m!1336213))

(declare-fun m!1336215 () Bool)

(assert (=> b!1447144 m!1336215))

(assert (=> b!1447144 m!1336199))

(declare-fun m!1336217 () Bool)

(assert (=> b!1447144 m!1336217))

(declare-fun m!1336219 () Bool)

(assert (=> b!1447154 m!1336219))

(declare-fun m!1336221 () Bool)

(assert (=> b!1447154 m!1336221))

(declare-fun m!1336223 () Bool)

(assert (=> start!124938 m!1336223))

(declare-fun m!1336225 () Bool)

(assert (=> start!124938 m!1336225))

(declare-fun m!1336227 () Bool)

(assert (=> b!1447152 m!1336227))

(declare-fun m!1336229 () Bool)

(assert (=> b!1447152 m!1336229))

(assert (=> b!1447150 m!1336191))

(assert (=> b!1447150 m!1336191))

(declare-fun m!1336231 () Bool)

(assert (=> b!1447150 m!1336231))

(assert (=> b!1447150 m!1336231))

(assert (=> b!1447150 m!1336191))

(declare-fun m!1336233 () Bool)

(assert (=> b!1447150 m!1336233))

(check-sat (not b!1447144) (not b!1447150) (not b!1447152) (not start!124938) (not b!1447157) (not b!1447159) (not b!1447145) (not b!1447153) (not b!1447148) (not b!1447149) (not b!1447151) (not b!1447154))
(check-sat)
