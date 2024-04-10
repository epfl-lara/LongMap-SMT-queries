; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124344 () Bool)

(assert start!124344)

(declare-fun b!1438749 () Bool)

(declare-fun res!971301 () Bool)

(declare-fun e!811569 () Bool)

(assert (=> b!1438749 (=> (not res!971301) (not e!811569))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97831 0))(
  ( (array!97832 (arr!47205 (Array (_ BitVec 32) (_ BitVec 64))) (size!47755 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97831)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1438749 (= res!971301 (and (= (size!47755 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47755 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47755 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!971307 () Bool)

(assert (=> start!124344 (=> (not res!971307) (not e!811569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124344 (= res!971307 (validMask!0 mask!2687))))

(assert (=> start!124344 e!811569))

(assert (=> start!124344 true))

(declare-fun array_inv!36233 (array!97831) Bool)

(assert (=> start!124344 (array_inv!36233 a!2862)))

(declare-fun b!1438750 () Bool)

(declare-fun res!971306 () Bool)

(assert (=> b!1438750 (=> (not res!971306) (not e!811569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97831 (_ BitVec 32)) Bool)

(assert (=> b!1438750 (= res!971306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438751 () Bool)

(declare-fun res!971300 () Bool)

(declare-fun e!811571 () Bool)

(assert (=> b!1438751 (=> (not res!971300) (not e!811571))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11457 0))(
  ( (MissingZero!11457 (index!48220 (_ BitVec 32))) (Found!11457 (index!48221 (_ BitVec 32))) (Intermediate!11457 (undefined!12269 Bool) (index!48222 (_ BitVec 32)) (x!129956 (_ BitVec 32))) (Undefined!11457) (MissingVacant!11457 (index!48223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97831 (_ BitVec 32)) SeekEntryResult!11457)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438751 (= res!971300 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97832 (store (arr!47205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47755 a!2862)) mask!2687) (Intermediate!11457 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438752 () Bool)

(declare-fun res!971304 () Bool)

(assert (=> b!1438752 (=> (not res!971304) (not e!811569))))

(declare-datatypes ((List!33706 0))(
  ( (Nil!33703) (Cons!33702 (h!35049 (_ BitVec 64)) (t!48400 List!33706)) )
))
(declare-fun arrayNoDuplicates!0 (array!97831 (_ BitVec 32) List!33706) Bool)

(assert (=> b!1438752 (= res!971304 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33703))))

(declare-fun b!1438753 () Bool)

(declare-fun res!971299 () Bool)

(assert (=> b!1438753 (=> (not res!971299) (not e!811569))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438753 (= res!971299 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47755 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47755 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47755 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438754 () Bool)

(declare-fun res!971305 () Bool)

(assert (=> b!1438754 (=> (not res!971305) (not e!811571))))

(declare-fun lt!632640 () SeekEntryResult!11457)

(assert (=> b!1438754 (= res!971305 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47205 a!2862) j!93) a!2862 mask!2687) lt!632640))))

(declare-fun b!1438755 () Bool)

(declare-fun res!971302 () Bool)

(assert (=> b!1438755 (=> (not res!971302) (not e!811569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438755 (= res!971302 (validKeyInArray!0 (select (arr!47205 a!2862) i!1006)))))

(declare-fun b!1438756 () Bool)

(assert (=> b!1438756 (= e!811571 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438757 () Bool)

(assert (=> b!1438757 (= e!811569 e!811571)))

(declare-fun res!971308 () Bool)

(assert (=> b!1438757 (=> (not res!971308) (not e!811571))))

(assert (=> b!1438757 (= res!971308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47205 a!2862) j!93) mask!2687) (select (arr!47205 a!2862) j!93) a!2862 mask!2687) lt!632640))))

(assert (=> b!1438757 (= lt!632640 (Intermediate!11457 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438758 () Bool)

(declare-fun res!971303 () Bool)

(assert (=> b!1438758 (=> (not res!971303) (not e!811569))))

(assert (=> b!1438758 (= res!971303 (validKeyInArray!0 (select (arr!47205 a!2862) j!93)))))

(assert (= (and start!124344 res!971307) b!1438749))

(assert (= (and b!1438749 res!971301) b!1438755))

(assert (= (and b!1438755 res!971302) b!1438758))

(assert (= (and b!1438758 res!971303) b!1438750))

(assert (= (and b!1438750 res!971306) b!1438752))

(assert (= (and b!1438752 res!971304) b!1438753))

(assert (= (and b!1438753 res!971299) b!1438757))

(assert (= (and b!1438757 res!971308) b!1438754))

(assert (= (and b!1438754 res!971305) b!1438751))

(assert (= (and b!1438751 res!971300) b!1438756))

(declare-fun m!1327863 () Bool)

(assert (=> b!1438752 m!1327863))

(declare-fun m!1327865 () Bool)

(assert (=> b!1438751 m!1327865))

(declare-fun m!1327867 () Bool)

(assert (=> b!1438751 m!1327867))

(assert (=> b!1438751 m!1327867))

(declare-fun m!1327869 () Bool)

(assert (=> b!1438751 m!1327869))

(assert (=> b!1438751 m!1327869))

(assert (=> b!1438751 m!1327867))

(declare-fun m!1327871 () Bool)

(assert (=> b!1438751 m!1327871))

(declare-fun m!1327873 () Bool)

(assert (=> b!1438757 m!1327873))

(assert (=> b!1438757 m!1327873))

(declare-fun m!1327875 () Bool)

(assert (=> b!1438757 m!1327875))

(assert (=> b!1438757 m!1327875))

(assert (=> b!1438757 m!1327873))

(declare-fun m!1327877 () Bool)

(assert (=> b!1438757 m!1327877))

(declare-fun m!1327879 () Bool)

(assert (=> start!124344 m!1327879))

(declare-fun m!1327881 () Bool)

(assert (=> start!124344 m!1327881))

(assert (=> b!1438758 m!1327873))

(assert (=> b!1438758 m!1327873))

(declare-fun m!1327883 () Bool)

(assert (=> b!1438758 m!1327883))

(assert (=> b!1438753 m!1327865))

(declare-fun m!1327885 () Bool)

(assert (=> b!1438753 m!1327885))

(declare-fun m!1327887 () Bool)

(assert (=> b!1438755 m!1327887))

(assert (=> b!1438755 m!1327887))

(declare-fun m!1327889 () Bool)

(assert (=> b!1438755 m!1327889))

(declare-fun m!1327891 () Bool)

(assert (=> b!1438750 m!1327891))

(assert (=> b!1438754 m!1327873))

(assert (=> b!1438754 m!1327873))

(declare-fun m!1327893 () Bool)

(assert (=> b!1438754 m!1327893))

(check-sat (not b!1438754) (not b!1438755) (not b!1438751) (not start!124344) (not b!1438758) (not b!1438757) (not b!1438750) (not b!1438752))
(check-sat)
