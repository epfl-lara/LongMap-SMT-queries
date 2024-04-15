; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125752 () Bool)

(assert start!125752)

(declare-fun b!1471916 () Bool)

(declare-fun e!826100 () Bool)

(assert (=> b!1471916 (= e!826100 (not true))))

(declare-fun e!826102 () Bool)

(assert (=> b!1471916 e!826102))

(declare-fun res!999742 () Bool)

(assert (=> b!1471916 (=> (not res!999742) (not e!826102))))

(declare-datatypes ((array!99064 0))(
  ( (array!99065 (arr!47818 (Array (_ BitVec 32) (_ BitVec 64))) (size!48370 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99064)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99064 (_ BitVec 32)) Bool)

(assert (=> b!1471916 (= res!999742 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49347 0))(
  ( (Unit!49348) )
))
(declare-fun lt!643243 () Unit!49347)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49347)

(assert (=> b!1471916 (= lt!643243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471917 () Bool)

(declare-fun e!826099 () Bool)

(assert (=> b!1471917 (= e!826099 e!826100)))

(declare-fun res!999748 () Bool)

(assert (=> b!1471917 (=> (not res!999748) (not e!826100))))

(declare-datatypes ((SeekEntryResult!12083 0))(
  ( (MissingZero!12083 (index!50724 (_ BitVec 32))) (Found!12083 (index!50725 (_ BitVec 32))) (Intermediate!12083 (undefined!12895 Bool) (index!50726 (_ BitVec 32)) (x!132305 (_ BitVec 32))) (Undefined!12083) (MissingVacant!12083 (index!50727 (_ BitVec 32))) )
))
(declare-fun lt!643245 () SeekEntryResult!12083)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471917 (= res!999748 (= lt!643245 (Intermediate!12083 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643242 () array!99064)

(declare-fun lt!643241 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99064 (_ BitVec 32)) SeekEntryResult!12083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471917 (= lt!643245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643241 mask!2687) lt!643241 lt!643242 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471917 (= lt!643241 (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471918 () Bool)

(declare-fun res!999736 () Bool)

(assert (=> b!1471918 (=> (not res!999736) (not e!826100))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471918 (= res!999736 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!826098 () Bool)

(declare-fun b!1471919 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99064 (_ BitVec 32)) SeekEntryResult!12083)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99064 (_ BitVec 32)) SeekEntryResult!12083)

(assert (=> b!1471919 (= e!826098 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643241 lt!643242 mask!2687) (seekEntryOrOpen!0 lt!643241 lt!643242 mask!2687)))))

(declare-fun b!1471920 () Bool)

(declare-fun res!999735 () Bool)

(declare-fun e!826104 () Bool)

(assert (=> b!1471920 (=> (not res!999735) (not e!826104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471920 (= res!999735 (validKeyInArray!0 (select (arr!47818 a!2862) i!1006)))))

(declare-fun b!1471921 () Bool)

(declare-fun res!999738 () Bool)

(assert (=> b!1471921 (=> (not res!999738) (not e!826100))))

(assert (=> b!1471921 (= res!999738 e!826098)))

(declare-fun c!135607 () Bool)

(assert (=> b!1471921 (= c!135607 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471922 () Bool)

(assert (=> b!1471922 (= e!826098 (= lt!643245 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643241 lt!643242 mask!2687)))))

(declare-fun res!999734 () Bool)

(assert (=> start!125752 (=> (not res!999734) (not e!826104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125752 (= res!999734 (validMask!0 mask!2687))))

(assert (=> start!125752 e!826104))

(assert (=> start!125752 true))

(declare-fun array_inv!37051 (array!99064) Bool)

(assert (=> start!125752 (array_inv!37051 a!2862)))

(declare-fun b!1471923 () Bool)

(declare-fun res!999744 () Bool)

(assert (=> b!1471923 (=> (not res!999744) (not e!826104))))

(assert (=> b!1471923 (= res!999744 (validKeyInArray!0 (select (arr!47818 a!2862) j!93)))))

(declare-fun b!1471924 () Bool)

(declare-fun res!999747 () Bool)

(assert (=> b!1471924 (=> (not res!999747) (not e!826099))))

(declare-fun lt!643244 () SeekEntryResult!12083)

(assert (=> b!1471924 (= res!999747 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!643244))))

(declare-fun b!1471925 () Bool)

(declare-fun res!999737 () Bool)

(assert (=> b!1471925 (=> (not res!999737) (not e!826104))))

(declare-datatypes ((List!34397 0))(
  ( (Nil!34394) (Cons!34393 (h!35749 (_ BitVec 64)) (t!49083 List!34397)) )
))
(declare-fun arrayNoDuplicates!0 (array!99064 (_ BitVec 32) List!34397) Bool)

(assert (=> b!1471925 (= res!999737 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34394))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1471926 () Bool)

(assert (=> b!1471926 (= e!826102 (or (= (select (arr!47818 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47818 a!2862) intermediateBeforeIndex!19) (select (arr!47818 a!2862) j!93))))))

(declare-fun b!1471927 () Bool)

(declare-fun e!826101 () Bool)

(assert (=> b!1471927 (= e!826104 e!826101)))

(declare-fun res!999745 () Bool)

(assert (=> b!1471927 (=> (not res!999745) (not e!826101))))

(assert (=> b!1471927 (= res!999745 (= (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471927 (= lt!643242 (array!99065 (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48370 a!2862)))))

(declare-fun b!1471928 () Bool)

(assert (=> b!1471928 (= e!826101 e!826099)))

(declare-fun res!999740 () Bool)

(assert (=> b!1471928 (=> (not res!999740) (not e!826099))))

(assert (=> b!1471928 (= res!999740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47818 a!2862) j!93) mask!2687) (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!643244))))

(assert (=> b!1471928 (= lt!643244 (Intermediate!12083 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471929 () Bool)

(declare-fun res!999746 () Bool)

(assert (=> b!1471929 (=> (not res!999746) (not e!826104))))

(assert (=> b!1471929 (= res!999746 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48370 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48370 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48370 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471930 () Bool)

(declare-fun res!999743 () Bool)

(assert (=> b!1471930 (=> (not res!999743) (not e!826104))))

(assert (=> b!1471930 (= res!999743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471931 () Bool)

(declare-fun res!999741 () Bool)

(assert (=> b!1471931 (=> (not res!999741) (not e!826102))))

(assert (=> b!1471931 (= res!999741 (= (seekEntryOrOpen!0 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) (Found!12083 j!93)))))

(declare-fun b!1471932 () Bool)

(declare-fun res!999739 () Bool)

(assert (=> b!1471932 (=> (not res!999739) (not e!826104))))

(assert (=> b!1471932 (= res!999739 (and (= (size!48370 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48370 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48370 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125752 res!999734) b!1471932))

(assert (= (and b!1471932 res!999739) b!1471920))

(assert (= (and b!1471920 res!999735) b!1471923))

(assert (= (and b!1471923 res!999744) b!1471930))

(assert (= (and b!1471930 res!999743) b!1471925))

(assert (= (and b!1471925 res!999737) b!1471929))

(assert (= (and b!1471929 res!999746) b!1471927))

(assert (= (and b!1471927 res!999745) b!1471928))

(assert (= (and b!1471928 res!999740) b!1471924))

(assert (= (and b!1471924 res!999747) b!1471917))

(assert (= (and b!1471917 res!999748) b!1471921))

(assert (= (and b!1471921 c!135607) b!1471922))

(assert (= (and b!1471921 (not c!135607)) b!1471919))

(assert (= (and b!1471921 res!999738) b!1471918))

(assert (= (and b!1471918 res!999736) b!1471916))

(assert (= (and b!1471916 res!999742) b!1471931))

(assert (= (and b!1471931 res!999741) b!1471926))

(declare-fun m!1358181 () Bool)

(assert (=> b!1471922 m!1358181))

(declare-fun m!1358183 () Bool)

(assert (=> b!1471925 m!1358183))

(declare-fun m!1358185 () Bool)

(assert (=> b!1471919 m!1358185))

(declare-fun m!1358187 () Bool)

(assert (=> b!1471919 m!1358187))

(declare-fun m!1358189 () Bool)

(assert (=> b!1471927 m!1358189))

(declare-fun m!1358191 () Bool)

(assert (=> b!1471927 m!1358191))

(declare-fun m!1358193 () Bool)

(assert (=> b!1471923 m!1358193))

(assert (=> b!1471923 m!1358193))

(declare-fun m!1358195 () Bool)

(assert (=> b!1471923 m!1358195))

(declare-fun m!1358197 () Bool)

(assert (=> b!1471920 m!1358197))

(assert (=> b!1471920 m!1358197))

(declare-fun m!1358199 () Bool)

(assert (=> b!1471920 m!1358199))

(assert (=> b!1471931 m!1358193))

(assert (=> b!1471931 m!1358193))

(declare-fun m!1358201 () Bool)

(assert (=> b!1471931 m!1358201))

(declare-fun m!1358203 () Bool)

(assert (=> b!1471917 m!1358203))

(assert (=> b!1471917 m!1358203))

(declare-fun m!1358205 () Bool)

(assert (=> b!1471917 m!1358205))

(assert (=> b!1471917 m!1358189))

(declare-fun m!1358207 () Bool)

(assert (=> b!1471917 m!1358207))

(assert (=> b!1471928 m!1358193))

(assert (=> b!1471928 m!1358193))

(declare-fun m!1358209 () Bool)

(assert (=> b!1471928 m!1358209))

(assert (=> b!1471928 m!1358209))

(assert (=> b!1471928 m!1358193))

(declare-fun m!1358211 () Bool)

(assert (=> b!1471928 m!1358211))

(declare-fun m!1358213 () Bool)

(assert (=> b!1471930 m!1358213))

(declare-fun m!1358215 () Bool)

(assert (=> b!1471916 m!1358215))

(declare-fun m!1358217 () Bool)

(assert (=> b!1471916 m!1358217))

(declare-fun m!1358219 () Bool)

(assert (=> b!1471926 m!1358219))

(assert (=> b!1471926 m!1358193))

(declare-fun m!1358221 () Bool)

(assert (=> start!125752 m!1358221))

(declare-fun m!1358223 () Bool)

(assert (=> start!125752 m!1358223))

(assert (=> b!1471924 m!1358193))

(assert (=> b!1471924 m!1358193))

(declare-fun m!1358225 () Bool)

(assert (=> b!1471924 m!1358225))

(check-sat (not b!1471925) (not b!1471920) (not b!1471922) (not b!1471916) (not b!1471919) (not start!125752) (not b!1471928) (not b!1471931) (not b!1471930) (not b!1471917) (not b!1471923) (not b!1471924))
(check-sat)
