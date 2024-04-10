; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125784 () Bool)

(assert start!125784)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1472162 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!643491 () (_ BitVec 64))

(declare-datatypes ((array!99118 0))(
  ( (array!99119 (arr!47844 (Array (_ BitVec 32) (_ BitVec 64))) (size!48394 (_ BitVec 32))) )
))
(declare-fun lt!643494 () array!99118)

(declare-datatypes ((SeekEntryResult!12084 0))(
  ( (MissingZero!12084 (index!50728 (_ BitVec 32))) (Found!12084 (index!50729 (_ BitVec 32))) (Intermediate!12084 (undefined!12896 Bool) (index!50730 (_ BitVec 32)) (x!132311 (_ BitVec 32))) (Undefined!12084) (MissingVacant!12084 (index!50731 (_ BitVec 32))) )
))
(declare-fun lt!643492 () SeekEntryResult!12084)

(declare-fun e!826235 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99118 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1472162 (= e!826235 (= lt!643492 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643491 lt!643494 mask!2687)))))

(declare-fun b!1472163 () Bool)

(declare-fun res!999868 () Bool)

(declare-fun e!826239 () Bool)

(assert (=> b!1472163 (=> (not res!999868) (not e!826239))))

(declare-fun a!2862 () array!99118)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99118 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1472163 (= res!999868 (= (seekEntryOrOpen!0 (select (arr!47844 a!2862) j!93) a!2862 mask!2687) (Found!12084 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1472164 () Bool)

(assert (=> b!1472164 (= e!826239 (or (= (select (arr!47844 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47844 a!2862) intermediateBeforeIndex!19) (select (arr!47844 a!2862) j!93))))))

(declare-fun b!1472165 () Bool)

(declare-fun e!826241 () Bool)

(declare-fun e!826240 () Bool)

(assert (=> b!1472165 (= e!826241 e!826240)))

(declare-fun res!999860 () Bool)

(assert (=> b!1472165 (=> (not res!999860) (not e!826240))))

(declare-fun lt!643490 () SeekEntryResult!12084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472165 (= res!999860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47844 a!2862) j!93) mask!2687) (select (arr!47844 a!2862) j!93) a!2862 mask!2687) lt!643490))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472165 (= lt!643490 (Intermediate!12084 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472166 () Bool)

(declare-fun res!999867 () Bool)

(assert (=> b!1472166 (=> (not res!999867) (not e!826240))))

(assert (=> b!1472166 (= res!999867 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47844 a!2862) j!93) a!2862 mask!2687) lt!643490))))

(declare-fun b!1472167 () Bool)

(declare-fun e!826237 () Bool)

(assert (=> b!1472167 (= e!826237 (not true))))

(assert (=> b!1472167 e!826239))

(declare-fun res!999861 () Bool)

(assert (=> b!1472167 (=> (not res!999861) (not e!826239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99118 (_ BitVec 32)) Bool)

(assert (=> b!1472167 (= res!999861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49508 0))(
  ( (Unit!49509) )
))
(declare-fun lt!643493 () Unit!49508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49508)

(assert (=> b!1472167 (= lt!643493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472168 () Bool)

(declare-fun e!826238 () Bool)

(assert (=> b!1472168 (= e!826238 e!826241)))

(declare-fun res!999865 () Bool)

(assert (=> b!1472168 (=> (not res!999865) (not e!826241))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472168 (= res!999865 (= (select (store (arr!47844 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472168 (= lt!643494 (array!99119 (store (arr!47844 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48394 a!2862)))))

(declare-fun b!1472169 () Bool)

(declare-fun res!999863 () Bool)

(assert (=> b!1472169 (=> (not res!999863) (not e!826238))))

(assert (=> b!1472169 (= res!999863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472170 () Bool)

(declare-fun res!999871 () Bool)

(assert (=> b!1472170 (=> (not res!999871) (not e!826237))))

(assert (=> b!1472170 (= res!999871 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472171 () Bool)

(assert (=> b!1472171 (= e!826240 e!826237)))

(declare-fun res!999862 () Bool)

(assert (=> b!1472171 (=> (not res!999862) (not e!826237))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472171 (= res!999862 (= lt!643492 (Intermediate!12084 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472171 (= lt!643492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643491 mask!2687) lt!643491 lt!643494 mask!2687))))

(assert (=> b!1472171 (= lt!643491 (select (store (arr!47844 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472172 () Bool)

(declare-fun res!999864 () Bool)

(assert (=> b!1472172 (=> (not res!999864) (not e!826237))))

(assert (=> b!1472172 (= res!999864 e!826235)))

(declare-fun c!135666 () Bool)

(assert (=> b!1472172 (= c!135666 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472173 () Bool)

(declare-fun res!999858 () Bool)

(assert (=> b!1472173 (=> (not res!999858) (not e!826238))))

(assert (=> b!1472173 (= res!999858 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48394 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48394 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48394 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999859 () Bool)

(assert (=> start!125784 (=> (not res!999859) (not e!826238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125784 (= res!999859 (validMask!0 mask!2687))))

(assert (=> start!125784 e!826238))

(assert (=> start!125784 true))

(declare-fun array_inv!36872 (array!99118) Bool)

(assert (=> start!125784 (array_inv!36872 a!2862)))

(declare-fun b!1472174 () Bool)

(declare-fun res!999857 () Bool)

(assert (=> b!1472174 (=> (not res!999857) (not e!826238))))

(declare-datatypes ((List!34345 0))(
  ( (Nil!34342) (Cons!34341 (h!35697 (_ BitVec 64)) (t!49039 List!34345)) )
))
(declare-fun arrayNoDuplicates!0 (array!99118 (_ BitVec 32) List!34345) Bool)

(assert (=> b!1472174 (= res!999857 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34342))))

(declare-fun b!1472175 () Bool)

(declare-fun res!999870 () Bool)

(assert (=> b!1472175 (=> (not res!999870) (not e!826238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472175 (= res!999870 (validKeyInArray!0 (select (arr!47844 a!2862) i!1006)))))

(declare-fun b!1472176 () Bool)

(declare-fun res!999866 () Bool)

(assert (=> b!1472176 (=> (not res!999866) (not e!826238))))

(assert (=> b!1472176 (= res!999866 (validKeyInArray!0 (select (arr!47844 a!2862) j!93)))))

(declare-fun b!1472177 () Bool)

(declare-fun res!999869 () Bool)

(assert (=> b!1472177 (=> (not res!999869) (not e!826238))))

(assert (=> b!1472177 (= res!999869 (and (= (size!48394 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48394 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48394 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99118 (_ BitVec 32)) SeekEntryResult!12084)

(assert (=> b!1472178 (= e!826235 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643491 lt!643494 mask!2687) (seekEntryOrOpen!0 lt!643491 lt!643494 mask!2687)))))

(assert (= (and start!125784 res!999859) b!1472177))

(assert (= (and b!1472177 res!999869) b!1472175))

(assert (= (and b!1472175 res!999870) b!1472176))

(assert (= (and b!1472176 res!999866) b!1472169))

(assert (= (and b!1472169 res!999863) b!1472174))

(assert (= (and b!1472174 res!999857) b!1472173))

(assert (= (and b!1472173 res!999858) b!1472168))

(assert (= (and b!1472168 res!999865) b!1472165))

(assert (= (and b!1472165 res!999860) b!1472166))

(assert (= (and b!1472166 res!999867) b!1472171))

(assert (= (and b!1472171 res!999862) b!1472172))

(assert (= (and b!1472172 c!135666) b!1472162))

(assert (= (and b!1472172 (not c!135666)) b!1472178))

(assert (= (and b!1472172 res!999864) b!1472170))

(assert (= (and b!1472170 res!999871) b!1472167))

(assert (= (and b!1472167 res!999861) b!1472163))

(assert (= (and b!1472163 res!999868) b!1472164))

(declare-fun m!1358903 () Bool)

(assert (=> b!1472163 m!1358903))

(assert (=> b!1472163 m!1358903))

(declare-fun m!1358905 () Bool)

(assert (=> b!1472163 m!1358905))

(declare-fun m!1358907 () Bool)

(assert (=> b!1472174 m!1358907))

(declare-fun m!1358909 () Bool)

(assert (=> b!1472168 m!1358909))

(declare-fun m!1358911 () Bool)

(assert (=> b!1472168 m!1358911))

(declare-fun m!1358913 () Bool)

(assert (=> b!1472164 m!1358913))

(assert (=> b!1472164 m!1358903))

(declare-fun m!1358915 () Bool)

(assert (=> b!1472175 m!1358915))

(assert (=> b!1472175 m!1358915))

(declare-fun m!1358917 () Bool)

(assert (=> b!1472175 m!1358917))

(declare-fun m!1358919 () Bool)

(assert (=> b!1472178 m!1358919))

(declare-fun m!1358921 () Bool)

(assert (=> b!1472178 m!1358921))

(assert (=> b!1472165 m!1358903))

(assert (=> b!1472165 m!1358903))

(declare-fun m!1358923 () Bool)

(assert (=> b!1472165 m!1358923))

(assert (=> b!1472165 m!1358923))

(assert (=> b!1472165 m!1358903))

(declare-fun m!1358925 () Bool)

(assert (=> b!1472165 m!1358925))

(declare-fun m!1358927 () Bool)

(assert (=> b!1472171 m!1358927))

(assert (=> b!1472171 m!1358927))

(declare-fun m!1358929 () Bool)

(assert (=> b!1472171 m!1358929))

(assert (=> b!1472171 m!1358909))

(declare-fun m!1358931 () Bool)

(assert (=> b!1472171 m!1358931))

(assert (=> b!1472176 m!1358903))

(assert (=> b!1472176 m!1358903))

(declare-fun m!1358933 () Bool)

(assert (=> b!1472176 m!1358933))

(declare-fun m!1358935 () Bool)

(assert (=> b!1472162 m!1358935))

(declare-fun m!1358937 () Bool)

(assert (=> b!1472167 m!1358937))

(declare-fun m!1358939 () Bool)

(assert (=> b!1472167 m!1358939))

(declare-fun m!1358941 () Bool)

(assert (=> b!1472169 m!1358941))

(assert (=> b!1472166 m!1358903))

(assert (=> b!1472166 m!1358903))

(declare-fun m!1358943 () Bool)

(assert (=> b!1472166 m!1358943))

(declare-fun m!1358945 () Bool)

(assert (=> start!125784 m!1358945))

(declare-fun m!1358947 () Bool)

(assert (=> start!125784 m!1358947))

(check-sat (not b!1472167) (not b!1472171) (not b!1472163) (not b!1472166) (not start!125784) (not b!1472162) (not b!1472178) (not b!1472176) (not b!1472169) (not b!1472175) (not b!1472165) (not b!1472174))
(check-sat)
