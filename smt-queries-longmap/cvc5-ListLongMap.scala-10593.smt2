; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124696 () Bool)

(assert start!124696)

(declare-fun b!1445204 () Bool)

(declare-fun e!814150 () Bool)

(declare-fun e!814146 () Bool)

(assert (=> b!1445204 (= e!814150 e!814146)))

(declare-fun res!977115 () Bool)

(assert (=> b!1445204 (=> (not res!977115) (not e!814146))))

(declare-datatypes ((SeekEntryResult!11612 0))(
  ( (MissingZero!11612 (index!48840 (_ BitVec 32))) (Found!11612 (index!48841 (_ BitVec 32))) (Intermediate!11612 (undefined!12424 Bool) (index!48842 (_ BitVec 32)) (x!130533 (_ BitVec 32))) (Undefined!11612) (MissingVacant!11612 (index!48843 (_ BitVec 32))) )
))
(declare-fun lt!634429 () SeekEntryResult!11612)

(declare-datatypes ((array!98144 0))(
  ( (array!98145 (arr!47360 (Array (_ BitVec 32) (_ BitVec 64))) (size!47910 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98144)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98144 (_ BitVec 32)) SeekEntryResult!11612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445204 (= res!977115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47360 a!2862) j!93) mask!2687) (select (arr!47360 a!2862) j!93) a!2862 mask!2687) lt!634429))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445204 (= lt!634429 (Intermediate!11612 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445205 () Bool)

(declare-fun e!814148 () Bool)

(assert (=> b!1445205 (= e!814148 (not true))))

(declare-fun e!814145 () Bool)

(assert (=> b!1445205 e!814145))

(declare-fun res!977108 () Bool)

(assert (=> b!1445205 (=> (not res!977108) (not e!814145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98144 (_ BitVec 32)) Bool)

(assert (=> b!1445205 (= res!977108 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48720 0))(
  ( (Unit!48721) )
))
(declare-fun lt!634430 () Unit!48720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48720)

(assert (=> b!1445205 (= lt!634430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445207 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814151 () Bool)

(declare-fun lt!634427 () (_ BitVec 64))

(declare-fun lt!634431 () array!98144)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!634428 () SeekEntryResult!11612)

(assert (=> b!1445207 (= e!814151 (= lt!634428 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634427 lt!634431 mask!2687)))))

(declare-fun b!1445208 () Bool)

(declare-fun res!977111 () Bool)

(declare-fun e!814149 () Bool)

(assert (=> b!1445208 (=> (not res!977111) (not e!814149))))

(assert (=> b!1445208 (= res!977111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445209 () Bool)

(declare-fun res!977118 () Bool)

(assert (=> b!1445209 (=> (not res!977118) (not e!814148))))

(assert (=> b!1445209 (= res!977118 e!814151)))

(declare-fun c!133560 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445209 (= c!133560 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445210 () Bool)

(declare-fun res!977105 () Bool)

(assert (=> b!1445210 (=> (not res!977105) (not e!814149))))

(declare-datatypes ((List!33861 0))(
  ( (Nil!33858) (Cons!33857 (h!35207 (_ BitVec 64)) (t!48555 List!33861)) )
))
(declare-fun arrayNoDuplicates!0 (array!98144 (_ BitVec 32) List!33861) Bool)

(assert (=> b!1445210 (= res!977105 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33858))))

(declare-fun b!1445211 () Bool)

(declare-fun res!977106 () Bool)

(assert (=> b!1445211 (=> (not res!977106) (not e!814149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445211 (= res!977106 (validKeyInArray!0 (select (arr!47360 a!2862) j!93)))))

(declare-fun b!1445212 () Bool)

(declare-fun res!977116 () Bool)

(assert (=> b!1445212 (=> (not res!977116) (not e!814148))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445212 (= res!977116 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445213 () Bool)

(assert (=> b!1445213 (= e!814149 e!814150)))

(declare-fun res!977112 () Bool)

(assert (=> b!1445213 (=> (not res!977112) (not e!814150))))

(assert (=> b!1445213 (= res!977112 (= (select (store (arr!47360 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445213 (= lt!634431 (array!98145 (store (arr!47360 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47910 a!2862)))))

(declare-fun b!1445214 () Bool)

(assert (=> b!1445214 (= e!814145 (or (= (select (arr!47360 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47360 a!2862) intermediateBeforeIndex!19) (select (arr!47360 a!2862) j!93))))))

(declare-fun b!1445215 () Bool)

(declare-fun res!977117 () Bool)

(assert (=> b!1445215 (=> (not res!977117) (not e!814149))))

(assert (=> b!1445215 (= res!977117 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47910 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47910 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47910 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445216 () Bool)

(declare-fun res!977109 () Bool)

(assert (=> b!1445216 (=> (not res!977109) (not e!814149))))

(assert (=> b!1445216 (= res!977109 (validKeyInArray!0 (select (arr!47360 a!2862) i!1006)))))

(declare-fun res!977110 () Bool)

(assert (=> start!124696 (=> (not res!977110) (not e!814149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124696 (= res!977110 (validMask!0 mask!2687))))

(assert (=> start!124696 e!814149))

(assert (=> start!124696 true))

(declare-fun array_inv!36388 (array!98144) Bool)

(assert (=> start!124696 (array_inv!36388 a!2862)))

(declare-fun b!1445206 () Bool)

(declare-fun res!977119 () Bool)

(assert (=> b!1445206 (=> (not res!977119) (not e!814149))))

(assert (=> b!1445206 (= res!977119 (and (= (size!47910 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47910 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47910 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445217 () Bool)

(assert (=> b!1445217 (= e!814146 e!814148)))

(declare-fun res!977107 () Bool)

(assert (=> b!1445217 (=> (not res!977107) (not e!814148))))

(assert (=> b!1445217 (= res!977107 (= lt!634428 (Intermediate!11612 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445217 (= lt!634428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634427 mask!2687) lt!634427 lt!634431 mask!2687))))

(assert (=> b!1445217 (= lt!634427 (select (store (arr!47360 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98144 (_ BitVec 32)) SeekEntryResult!11612)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98144 (_ BitVec 32)) SeekEntryResult!11612)

(assert (=> b!1445218 (= e!814151 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634427 lt!634431 mask!2687) (seekEntryOrOpen!0 lt!634427 lt!634431 mask!2687)))))

(declare-fun b!1445219 () Bool)

(declare-fun res!977113 () Bool)

(assert (=> b!1445219 (=> (not res!977113) (not e!814146))))

(assert (=> b!1445219 (= res!977113 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47360 a!2862) j!93) a!2862 mask!2687) lt!634429))))

(declare-fun b!1445220 () Bool)

(declare-fun res!977114 () Bool)

(assert (=> b!1445220 (=> (not res!977114) (not e!814145))))

(assert (=> b!1445220 (= res!977114 (= (seekEntryOrOpen!0 (select (arr!47360 a!2862) j!93) a!2862 mask!2687) (Found!11612 j!93)))))

(assert (= (and start!124696 res!977110) b!1445206))

(assert (= (and b!1445206 res!977119) b!1445216))

(assert (= (and b!1445216 res!977109) b!1445211))

(assert (= (and b!1445211 res!977106) b!1445208))

(assert (= (and b!1445208 res!977111) b!1445210))

(assert (= (and b!1445210 res!977105) b!1445215))

(assert (= (and b!1445215 res!977117) b!1445213))

(assert (= (and b!1445213 res!977112) b!1445204))

(assert (= (and b!1445204 res!977115) b!1445219))

(assert (= (and b!1445219 res!977113) b!1445217))

(assert (= (and b!1445217 res!977107) b!1445209))

(assert (= (and b!1445209 c!133560) b!1445207))

(assert (= (and b!1445209 (not c!133560)) b!1445218))

(assert (= (and b!1445209 res!977118) b!1445212))

(assert (= (and b!1445212 res!977116) b!1445205))

(assert (= (and b!1445205 res!977108) b!1445220))

(assert (= (and b!1445220 res!977114) b!1445214))

(declare-fun m!1334173 () Bool)

(assert (=> b!1445204 m!1334173))

(assert (=> b!1445204 m!1334173))

(declare-fun m!1334175 () Bool)

(assert (=> b!1445204 m!1334175))

(assert (=> b!1445204 m!1334175))

(assert (=> b!1445204 m!1334173))

(declare-fun m!1334177 () Bool)

(assert (=> b!1445204 m!1334177))

(declare-fun m!1334179 () Bool)

(assert (=> b!1445218 m!1334179))

(declare-fun m!1334181 () Bool)

(assert (=> b!1445218 m!1334181))

(declare-fun m!1334183 () Bool)

(assert (=> b!1445213 m!1334183))

(declare-fun m!1334185 () Bool)

(assert (=> b!1445213 m!1334185))

(declare-fun m!1334187 () Bool)

(assert (=> b!1445214 m!1334187))

(assert (=> b!1445214 m!1334173))

(declare-fun m!1334189 () Bool)

(assert (=> start!124696 m!1334189))

(declare-fun m!1334191 () Bool)

(assert (=> start!124696 m!1334191))

(declare-fun m!1334193 () Bool)

(assert (=> b!1445208 m!1334193))

(assert (=> b!1445211 m!1334173))

(assert (=> b!1445211 m!1334173))

(declare-fun m!1334195 () Bool)

(assert (=> b!1445211 m!1334195))

(assert (=> b!1445219 m!1334173))

(assert (=> b!1445219 m!1334173))

(declare-fun m!1334197 () Bool)

(assert (=> b!1445219 m!1334197))

(declare-fun m!1334199 () Bool)

(assert (=> b!1445207 m!1334199))

(declare-fun m!1334201 () Bool)

(assert (=> b!1445205 m!1334201))

(declare-fun m!1334203 () Bool)

(assert (=> b!1445205 m!1334203))

(declare-fun m!1334205 () Bool)

(assert (=> b!1445217 m!1334205))

(assert (=> b!1445217 m!1334205))

(declare-fun m!1334207 () Bool)

(assert (=> b!1445217 m!1334207))

(assert (=> b!1445217 m!1334183))

(declare-fun m!1334209 () Bool)

(assert (=> b!1445217 m!1334209))

(declare-fun m!1334211 () Bool)

(assert (=> b!1445210 m!1334211))

(assert (=> b!1445220 m!1334173))

(assert (=> b!1445220 m!1334173))

(declare-fun m!1334213 () Bool)

(assert (=> b!1445220 m!1334213))

(declare-fun m!1334215 () Bool)

(assert (=> b!1445216 m!1334215))

(assert (=> b!1445216 m!1334215))

(declare-fun m!1334217 () Bool)

(assert (=> b!1445216 m!1334217))

(push 1)

