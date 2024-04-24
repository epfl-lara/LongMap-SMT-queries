; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124854 () Bool)

(assert start!124854)

(declare-fun b!1444958 () Bool)

(declare-fun res!976226 () Bool)

(declare-fun e!814320 () Bool)

(assert (=> b!1444958 (=> (not res!976226) (not e!814320))))

(declare-datatypes ((array!98197 0))(
  ( (array!98198 (arr!47383 (Array (_ BitVec 32) (_ BitVec 64))) (size!47934 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98197)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444958 (= res!976226 (validKeyInArray!0 (select (arr!47383 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634404 () array!98197)

(declare-fun e!814325 () Bool)

(declare-fun lt!634406 () (_ BitVec 64))

(declare-fun b!1444959 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11532 0))(
  ( (MissingZero!11532 (index!48520 (_ BitVec 32))) (Found!11532 (index!48521 (_ BitVec 32))) (Intermediate!11532 (undefined!12344 Bool) (index!48522 (_ BitVec 32)) (x!130397 (_ BitVec 32))) (Undefined!11532) (MissingVacant!11532 (index!48523 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98197 (_ BitVec 32)) SeekEntryResult!11532)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98197 (_ BitVec 32)) SeekEntryResult!11532)

(assert (=> b!1444959 (= e!814325 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634406 lt!634404 mask!2687) (seekEntryOrOpen!0 lt!634406 lt!634404 mask!2687)))))

(declare-fun b!1444960 () Bool)

(declare-fun e!814319 () Bool)

(declare-fun e!814322 () Bool)

(assert (=> b!1444960 (= e!814319 (not e!814322))))

(declare-fun res!976222 () Bool)

(assert (=> b!1444960 (=> res!976222 e!814322)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444960 (= res!976222 (or (not (= (select (arr!47383 a!2862) index!646) (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47383 a!2862) index!646) (select (arr!47383 a!2862) j!93)))))))

(declare-fun e!814321 () Bool)

(assert (=> b!1444960 e!814321))

(declare-fun res!976218 () Bool)

(assert (=> b!1444960 (=> (not res!976218) (not e!814321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98197 (_ BitVec 32)) Bool)

(assert (=> b!1444960 (= res!976218 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48593 0))(
  ( (Unit!48594) )
))
(declare-fun lt!634405 () Unit!48593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48593)

(assert (=> b!1444960 (= lt!634405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444961 () Bool)

(declare-fun res!976216 () Bool)

(assert (=> b!1444961 (=> (not res!976216) (not e!814320))))

(assert (=> b!1444961 (= res!976216 (and (= (size!47934 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47934 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47934 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444962 () Bool)

(declare-fun res!976215 () Bool)

(assert (=> b!1444962 (=> (not res!976215) (not e!814320))))

(assert (=> b!1444962 (= res!976215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444963 () Bool)

(declare-fun res!976219 () Bool)

(declare-fun e!814324 () Bool)

(assert (=> b!1444963 (=> (not res!976219) (not e!814324))))

(declare-fun lt!634407 () SeekEntryResult!11532)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98197 (_ BitVec 32)) SeekEntryResult!11532)

(assert (=> b!1444963 (= res!976219 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!634407))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1444964 () Bool)

(assert (=> b!1444964 (= e!814321 (or (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) (select (arr!47383 a!2862) j!93))))))

(declare-fun b!1444965 () Bool)

(declare-fun res!976224 () Bool)

(assert (=> b!1444965 (=> (not res!976224) (not e!814320))))

(declare-datatypes ((List!33871 0))(
  ( (Nil!33868) (Cons!33867 (h!35228 (_ BitVec 64)) (t!48557 List!33871)) )
))
(declare-fun arrayNoDuplicates!0 (array!98197 (_ BitVec 32) List!33871) Bool)

(assert (=> b!1444965 (= res!976224 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33868))))

(declare-fun b!1444966 () Bool)

(assert (=> b!1444966 (= e!814324 e!814319)))

(declare-fun res!976229 () Bool)

(assert (=> b!1444966 (=> (not res!976229) (not e!814319))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634408 () SeekEntryResult!11532)

(assert (=> b!1444966 (= res!976229 (= lt!634408 (Intermediate!11532 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444966 (= lt!634408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634406 mask!2687) lt!634406 lt!634404 mask!2687))))

(assert (=> b!1444966 (= lt!634406 (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444967 () Bool)

(declare-fun e!814323 () Bool)

(assert (=> b!1444967 (= e!814320 e!814323)))

(declare-fun res!976214 () Bool)

(assert (=> b!1444967 (=> (not res!976214) (not e!814323))))

(assert (=> b!1444967 (= res!976214 (= (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444967 (= lt!634404 (array!98198 (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47934 a!2862)))))

(declare-fun b!1444968 () Bool)

(declare-fun res!976227 () Bool)

(assert (=> b!1444968 (=> (not res!976227) (not e!814319))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444968 (= res!976227 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444969 () Bool)

(assert (=> b!1444969 (= e!814322 true)))

(declare-fun lt!634403 () SeekEntryResult!11532)

(assert (=> b!1444969 (= lt!634403 (seekEntryOrOpen!0 lt!634406 lt!634404 mask!2687))))

(declare-fun b!1444970 () Bool)

(declare-fun res!976217 () Bool)

(assert (=> b!1444970 (=> (not res!976217) (not e!814321))))

(assert (=> b!1444970 (= res!976217 (= (seekEntryOrOpen!0 (select (arr!47383 a!2862) j!93) a!2862 mask!2687) (Found!11532 j!93)))))

(declare-fun b!1444971 () Bool)

(declare-fun res!976221 () Bool)

(assert (=> b!1444971 (=> (not res!976221) (not e!814319))))

(assert (=> b!1444971 (= res!976221 e!814325)))

(declare-fun c!133891 () Bool)

(assert (=> b!1444971 (= c!133891 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444972 () Bool)

(declare-fun res!976220 () Bool)

(assert (=> b!1444972 (=> (not res!976220) (not e!814320))))

(assert (=> b!1444972 (= res!976220 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47934 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47934 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47934 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444973 () Bool)

(assert (=> b!1444973 (= e!814323 e!814324)))

(declare-fun res!976228 () Bool)

(assert (=> b!1444973 (=> (not res!976228) (not e!814324))))

(assert (=> b!1444973 (= res!976228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47383 a!2862) j!93) mask!2687) (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!634407))))

(assert (=> b!1444973 (= lt!634407 (Intermediate!11532 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!976225 () Bool)

(assert (=> start!124854 (=> (not res!976225) (not e!814320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124854 (= res!976225 (validMask!0 mask!2687))))

(assert (=> start!124854 e!814320))

(assert (=> start!124854 true))

(declare-fun array_inv!36664 (array!98197) Bool)

(assert (=> start!124854 (array_inv!36664 a!2862)))

(declare-fun b!1444974 () Bool)

(declare-fun res!976223 () Bool)

(assert (=> b!1444974 (=> (not res!976223) (not e!814320))))

(assert (=> b!1444974 (= res!976223 (validKeyInArray!0 (select (arr!47383 a!2862) j!93)))))

(declare-fun b!1444975 () Bool)

(assert (=> b!1444975 (= e!814325 (= lt!634408 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634406 lt!634404 mask!2687)))))

(assert (= (and start!124854 res!976225) b!1444961))

(assert (= (and b!1444961 res!976216) b!1444958))

(assert (= (and b!1444958 res!976226) b!1444974))

(assert (= (and b!1444974 res!976223) b!1444962))

(assert (= (and b!1444962 res!976215) b!1444965))

(assert (= (and b!1444965 res!976224) b!1444972))

(assert (= (and b!1444972 res!976220) b!1444967))

(assert (= (and b!1444967 res!976214) b!1444973))

(assert (= (and b!1444973 res!976228) b!1444963))

(assert (= (and b!1444963 res!976219) b!1444966))

(assert (= (and b!1444966 res!976229) b!1444971))

(assert (= (and b!1444971 c!133891) b!1444975))

(assert (= (and b!1444971 (not c!133891)) b!1444959))

(assert (= (and b!1444971 res!976221) b!1444968))

(assert (= (and b!1444968 res!976227) b!1444960))

(assert (= (and b!1444960 res!976218) b!1444970))

(assert (= (and b!1444970 res!976217) b!1444964))

(assert (= (and b!1444960 (not res!976222)) b!1444969))

(declare-fun m!1334143 () Bool)

(assert (=> b!1444974 m!1334143))

(assert (=> b!1444974 m!1334143))

(declare-fun m!1334145 () Bool)

(assert (=> b!1444974 m!1334145))

(declare-fun m!1334147 () Bool)

(assert (=> b!1444958 m!1334147))

(assert (=> b!1444958 m!1334147))

(declare-fun m!1334149 () Bool)

(assert (=> b!1444958 m!1334149))

(assert (=> b!1444970 m!1334143))

(assert (=> b!1444970 m!1334143))

(declare-fun m!1334151 () Bool)

(assert (=> b!1444970 m!1334151))

(declare-fun m!1334153 () Bool)

(assert (=> b!1444965 m!1334153))

(declare-fun m!1334155 () Bool)

(assert (=> b!1444960 m!1334155))

(declare-fun m!1334157 () Bool)

(assert (=> b!1444960 m!1334157))

(declare-fun m!1334159 () Bool)

(assert (=> b!1444960 m!1334159))

(declare-fun m!1334161 () Bool)

(assert (=> b!1444960 m!1334161))

(declare-fun m!1334163 () Bool)

(assert (=> b!1444960 m!1334163))

(assert (=> b!1444960 m!1334143))

(declare-fun m!1334165 () Bool)

(assert (=> b!1444975 m!1334165))

(declare-fun m!1334167 () Bool)

(assert (=> b!1444959 m!1334167))

(declare-fun m!1334169 () Bool)

(assert (=> b!1444959 m!1334169))

(assert (=> b!1444967 m!1334157))

(declare-fun m!1334171 () Bool)

(assert (=> b!1444967 m!1334171))

(declare-fun m!1334173 () Bool)

(assert (=> b!1444966 m!1334173))

(assert (=> b!1444966 m!1334173))

(declare-fun m!1334175 () Bool)

(assert (=> b!1444966 m!1334175))

(assert (=> b!1444966 m!1334157))

(declare-fun m!1334177 () Bool)

(assert (=> b!1444966 m!1334177))

(declare-fun m!1334179 () Bool)

(assert (=> start!124854 m!1334179))

(declare-fun m!1334181 () Bool)

(assert (=> start!124854 m!1334181))

(declare-fun m!1334183 () Bool)

(assert (=> b!1444964 m!1334183))

(assert (=> b!1444964 m!1334143))

(assert (=> b!1444969 m!1334169))

(assert (=> b!1444973 m!1334143))

(assert (=> b!1444973 m!1334143))

(declare-fun m!1334185 () Bool)

(assert (=> b!1444973 m!1334185))

(assert (=> b!1444973 m!1334185))

(assert (=> b!1444973 m!1334143))

(declare-fun m!1334187 () Bool)

(assert (=> b!1444973 m!1334187))

(declare-fun m!1334189 () Bool)

(assert (=> b!1444962 m!1334189))

(assert (=> b!1444963 m!1334143))

(assert (=> b!1444963 m!1334143))

(declare-fun m!1334191 () Bool)

(assert (=> b!1444963 m!1334191))

(check-sat (not b!1444960) (not b!1444974) (not b!1444963) (not b!1444958) (not b!1444970) (not b!1444975) (not b!1444966) (not start!124854) (not b!1444962) (not b!1444965) (not b!1444969) (not b!1444959) (not b!1444973))
(check-sat)
