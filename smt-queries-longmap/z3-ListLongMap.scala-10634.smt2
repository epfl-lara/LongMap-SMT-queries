; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124912 () Bool)

(assert start!124912)

(declare-fun e!817364 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1451858 () Bool)

(declare-fun lt!636599 () (_ BitVec 64))

(declare-datatypes ((array!98338 0))(
  ( (array!98339 (arr!47458 (Array (_ BitVec 32) (_ BitVec 64))) (size!48010 (_ BitVec 32))) )
))
(declare-fun lt!636600 () array!98338)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11735 0))(
  ( (MissingZero!11735 (index!49332 (_ BitVec 32))) (Found!11735 (index!49333 (_ BitVec 32))) (Intermediate!11735 (undefined!12547 Bool) (index!49334 (_ BitVec 32)) (x!130979 (_ BitVec 32))) (Undefined!11735) (MissingVacant!11735 (index!49335 (_ BitVec 32))) )
))
(declare-fun lt!636598 () SeekEntryResult!11735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1451858 (= e!817364 (= lt!636598 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636599 lt!636600 mask!2687)))))

(declare-fun b!1451859 () Bool)

(declare-fun e!817361 () Bool)

(declare-fun e!817363 () Bool)

(assert (=> b!1451859 (= e!817361 e!817363)))

(declare-fun res!983149 () Bool)

(assert (=> b!1451859 (=> (not res!983149) (not e!817363))))

(declare-fun a!2862 () array!98338)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!636596 () SeekEntryResult!11735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451859 (= res!983149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47458 a!2862) j!93) mask!2687) (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!636596))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451859 (= lt!636596 (Intermediate!11735 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451860 () Bool)

(declare-fun res!983138 () Bool)

(declare-fun e!817360 () Bool)

(assert (=> b!1451860 (=> (not res!983138) (not e!817360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98338 (_ BitVec 32)) Bool)

(assert (=> b!1451860 (= res!983138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451861 () Bool)

(declare-fun res!983141 () Bool)

(assert (=> b!1451861 (=> (not res!983141) (not e!817360))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451861 (= res!983141 (and (= (size!48010 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48010 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48010 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451862 () Bool)

(declare-fun res!983150 () Bool)

(assert (=> b!1451862 (=> (not res!983150) (not e!817360))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451862 (= res!983150 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48010 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48010 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48010 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!983139 () Bool)

(assert (=> start!124912 (=> (not res!983139) (not e!817360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124912 (= res!983139 (validMask!0 mask!2687))))

(assert (=> start!124912 e!817360))

(assert (=> start!124912 true))

(declare-fun array_inv!36691 (array!98338) Bool)

(assert (=> start!124912 (array_inv!36691 a!2862)))

(declare-fun b!1451863 () Bool)

(declare-fun e!817362 () Bool)

(assert (=> b!1451863 (= e!817362 (not true))))

(declare-fun e!817359 () Bool)

(assert (=> b!1451863 e!817359))

(declare-fun res!983148 () Bool)

(assert (=> b!1451863 (=> (not res!983148) (not e!817359))))

(assert (=> b!1451863 (= res!983148 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48807 0))(
  ( (Unit!48808) )
))
(declare-fun lt!636597 () Unit!48807)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48807)

(assert (=> b!1451863 (= lt!636597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451864 () Bool)

(assert (=> b!1451864 (= e!817359 (and (or (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47458 a!2862) intermediateBeforeIndex!19) (select (arr!47458 a!2862) j!93))) (or (and (= (select (arr!47458 a!2862) index!646) (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47458 a!2862) index!646) (select (arr!47458 a!2862) j!93))) (= (select (arr!47458 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451865 () Bool)

(assert (=> b!1451865 (= e!817363 e!817362)))

(declare-fun res!983142 () Bool)

(assert (=> b!1451865 (=> (not res!983142) (not e!817362))))

(assert (=> b!1451865 (= res!983142 (= lt!636598 (Intermediate!11735 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451865 (= lt!636598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636599 mask!2687) lt!636599 lt!636600 mask!2687))))

(assert (=> b!1451865 (= lt!636599 (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451866 () Bool)

(assert (=> b!1451866 (= e!817360 e!817361)))

(declare-fun res!983144 () Bool)

(assert (=> b!1451866 (=> (not res!983144) (not e!817361))))

(assert (=> b!1451866 (= res!983144 (= (select (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451866 (= lt!636600 (array!98339 (store (arr!47458 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48010 a!2862)))))

(declare-fun b!1451867 () Bool)

(declare-fun res!983152 () Bool)

(assert (=> b!1451867 (=> (not res!983152) (not e!817363))))

(assert (=> b!1451867 (= res!983152 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47458 a!2862) j!93) a!2862 mask!2687) lt!636596))))

(declare-fun b!1451868 () Bool)

(declare-fun res!983143 () Bool)

(assert (=> b!1451868 (=> (not res!983143) (not e!817359))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1451868 (= res!983143 (= (seekEntryOrOpen!0 (select (arr!47458 a!2862) j!93) a!2862 mask!2687) (Found!11735 j!93)))))

(declare-fun b!1451869 () Bool)

(declare-fun res!983140 () Bool)

(assert (=> b!1451869 (=> (not res!983140) (not e!817360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451869 (= res!983140 (validKeyInArray!0 (select (arr!47458 a!2862) i!1006)))))

(declare-fun b!1451870 () Bool)

(declare-fun res!983145 () Bool)

(assert (=> b!1451870 (=> (not res!983145) (not e!817362))))

(assert (=> b!1451870 (= res!983145 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451871 () Bool)

(declare-fun res!983147 () Bool)

(assert (=> b!1451871 (=> (not res!983147) (not e!817362))))

(assert (=> b!1451871 (= res!983147 e!817364)))

(declare-fun c!133873 () Bool)

(assert (=> b!1451871 (= c!133873 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451872 () Bool)

(declare-fun res!983151 () Bool)

(assert (=> b!1451872 (=> (not res!983151) (not e!817360))))

(declare-datatypes ((List!34037 0))(
  ( (Nil!34034) (Cons!34033 (h!35383 (_ BitVec 64)) (t!48723 List!34037)) )
))
(declare-fun arrayNoDuplicates!0 (array!98338 (_ BitVec 32) List!34037) Bool)

(assert (=> b!1451872 (= res!983151 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34034))))

(declare-fun b!1451873 () Bool)

(declare-fun res!983146 () Bool)

(assert (=> b!1451873 (=> (not res!983146) (not e!817360))))

(assert (=> b!1451873 (= res!983146 (validKeyInArray!0 (select (arr!47458 a!2862) j!93)))))

(declare-fun b!1451874 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11735)

(assert (=> b!1451874 (= e!817364 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636599 lt!636600 mask!2687) (seekEntryOrOpen!0 lt!636599 lt!636600 mask!2687)))))

(assert (= (and start!124912 res!983139) b!1451861))

(assert (= (and b!1451861 res!983141) b!1451869))

(assert (= (and b!1451869 res!983140) b!1451873))

(assert (= (and b!1451873 res!983146) b!1451860))

(assert (= (and b!1451860 res!983138) b!1451872))

(assert (= (and b!1451872 res!983151) b!1451862))

(assert (= (and b!1451862 res!983150) b!1451866))

(assert (= (and b!1451866 res!983144) b!1451859))

(assert (= (and b!1451859 res!983149) b!1451867))

(assert (= (and b!1451867 res!983152) b!1451865))

(assert (= (and b!1451865 res!983142) b!1451871))

(assert (= (and b!1451871 c!133873) b!1451858))

(assert (= (and b!1451871 (not c!133873)) b!1451874))

(assert (= (and b!1451871 res!983147) b!1451870))

(assert (= (and b!1451870 res!983145) b!1451863))

(assert (= (and b!1451863 res!983148) b!1451868))

(assert (= (and b!1451868 res!983143) b!1451864))

(declare-fun m!1339959 () Bool)

(assert (=> b!1451858 m!1339959))

(declare-fun m!1339961 () Bool)

(assert (=> b!1451874 m!1339961))

(declare-fun m!1339963 () Bool)

(assert (=> b!1451874 m!1339963))

(declare-fun m!1339965 () Bool)

(assert (=> b!1451869 m!1339965))

(assert (=> b!1451869 m!1339965))

(declare-fun m!1339967 () Bool)

(assert (=> b!1451869 m!1339967))

(declare-fun m!1339969 () Bool)

(assert (=> b!1451865 m!1339969))

(assert (=> b!1451865 m!1339969))

(declare-fun m!1339971 () Bool)

(assert (=> b!1451865 m!1339971))

(declare-fun m!1339973 () Bool)

(assert (=> b!1451865 m!1339973))

(declare-fun m!1339975 () Bool)

(assert (=> b!1451865 m!1339975))

(declare-fun m!1339977 () Bool)

(assert (=> b!1451859 m!1339977))

(assert (=> b!1451859 m!1339977))

(declare-fun m!1339979 () Bool)

(assert (=> b!1451859 m!1339979))

(assert (=> b!1451859 m!1339979))

(assert (=> b!1451859 m!1339977))

(declare-fun m!1339981 () Bool)

(assert (=> b!1451859 m!1339981))

(assert (=> b!1451867 m!1339977))

(assert (=> b!1451867 m!1339977))

(declare-fun m!1339983 () Bool)

(assert (=> b!1451867 m!1339983))

(declare-fun m!1339985 () Bool)

(assert (=> b!1451872 m!1339985))

(assert (=> b!1451868 m!1339977))

(assert (=> b!1451868 m!1339977))

(declare-fun m!1339987 () Bool)

(assert (=> b!1451868 m!1339987))

(declare-fun m!1339989 () Bool)

(assert (=> b!1451860 m!1339989))

(declare-fun m!1339991 () Bool)

(assert (=> b!1451863 m!1339991))

(declare-fun m!1339993 () Bool)

(assert (=> b!1451863 m!1339993))

(assert (=> b!1451864 m!1339973))

(declare-fun m!1339995 () Bool)

(assert (=> b!1451864 m!1339995))

(declare-fun m!1339997 () Bool)

(assert (=> b!1451864 m!1339997))

(declare-fun m!1339999 () Bool)

(assert (=> b!1451864 m!1339999))

(assert (=> b!1451864 m!1339977))

(assert (=> b!1451866 m!1339973))

(declare-fun m!1340001 () Bool)

(assert (=> b!1451866 m!1340001))

(declare-fun m!1340003 () Bool)

(assert (=> start!124912 m!1340003))

(declare-fun m!1340005 () Bool)

(assert (=> start!124912 m!1340005))

(assert (=> b!1451873 m!1339977))

(assert (=> b!1451873 m!1339977))

(declare-fun m!1340007 () Bool)

(assert (=> b!1451873 m!1340007))

(check-sat (not b!1451873) (not b!1451867) (not start!124912) (not b!1451860) (not b!1451872) (not b!1451869) (not b!1451868) (not b!1451863) (not b!1451859) (not b!1451874) (not b!1451858) (not b!1451865))
(check-sat)
