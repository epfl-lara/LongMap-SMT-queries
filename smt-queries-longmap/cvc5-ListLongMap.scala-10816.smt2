; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126544 () Bool)

(assert start!126544)

(declare-fun b!1484926 () Bool)

(declare-fun e!832517 () Bool)

(declare-fun e!832511 () Bool)

(assert (=> b!1484926 (= e!832517 e!832511)))

(declare-fun res!1009667 () Bool)

(assert (=> b!1484926 (=> (not res!1009667) (not e!832511))))

(declare-datatypes ((array!99506 0))(
  ( (array!99507 (arr!48029 (Array (_ BitVec 32) (_ BitVec 64))) (size!48579 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99506)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12269 0))(
  ( (MissingZero!12269 (index!51468 (_ BitVec 32))) (Found!12269 (index!51469 (_ BitVec 32))) (Intermediate!12269 (undefined!13081 Bool) (index!51470 (_ BitVec 32)) (x!133049 (_ BitVec 32))) (Undefined!12269) (MissingVacant!12269 (index!51471 (_ BitVec 32))) )
))
(declare-fun lt!647922 () SeekEntryResult!12269)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99506 (_ BitVec 32)) SeekEntryResult!12269)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484926 (= res!1009667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48029 a!2862) j!93) mask!2687) (select (arr!48029 a!2862) j!93) a!2862 mask!2687) lt!647922))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484926 (= lt!647922 (Intermediate!12269 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484927 () Bool)

(declare-fun res!1009675 () Bool)

(declare-fun e!832516 () Bool)

(assert (=> b!1484927 (=> (not res!1009675) (not e!832516))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484927 (= res!1009675 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48579 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48579 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48579 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484928 () Bool)

(declare-fun res!1009660 () Bool)

(assert (=> b!1484928 (=> (not res!1009660) (not e!832516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484928 (= res!1009660 (validKeyInArray!0 (select (arr!48029 a!2862) j!93)))))

(declare-fun b!1484929 () Bool)

(declare-fun res!1009659 () Bool)

(assert (=> b!1484929 (=> (not res!1009659) (not e!832516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99506 (_ BitVec 32)) Bool)

(assert (=> b!1484929 (= res!1009659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484930 () Bool)

(declare-fun res!1009658 () Bool)

(assert (=> b!1484930 (=> (not res!1009658) (not e!832511))))

(assert (=> b!1484930 (= res!1009658 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48029 a!2862) j!93) a!2862 mask!2687) lt!647922))))

(declare-fun b!1484931 () Bool)

(declare-fun res!1009662 () Bool)

(declare-fun e!832514 () Bool)

(assert (=> b!1484931 (=> (not res!1009662) (not e!832514))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484931 (= res!1009662 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484932 () Bool)

(declare-fun res!1009674 () Bool)

(declare-fun e!832515 () Bool)

(assert (=> b!1484932 (=> (not res!1009674) (not e!832515))))

(assert (=> b!1484932 (= res!1009674 (or (= (select (arr!48029 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48029 a!2862) intermediateBeforeIndex!19) (select (arr!48029 a!2862) j!93))))))

(declare-fun lt!647926 () SeekEntryResult!12269)

(declare-fun e!832513 () Bool)

(declare-fun lt!647923 () array!99506)

(declare-fun b!1484933 () Bool)

(declare-fun lt!647925 () (_ BitVec 64))

(assert (=> b!1484933 (= e!832513 (= lt!647926 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647925 lt!647923 mask!2687)))))

(declare-fun e!832510 () Bool)

(declare-fun b!1484934 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99506 (_ BitVec 32)) SeekEntryResult!12269)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99506 (_ BitVec 32)) SeekEntryResult!12269)

(assert (=> b!1484934 (= e!832510 (= (seekEntryOrOpen!0 lt!647925 lt!647923 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647925 lt!647923 mask!2687)))))

(declare-fun b!1484935 () Bool)

(declare-fun e!832512 () Bool)

(assert (=> b!1484935 (= e!832512 true)))

(declare-fun lt!647924 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484935 (= lt!647924 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1009666 () Bool)

(assert (=> start!126544 (=> (not res!1009666) (not e!832516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126544 (= res!1009666 (validMask!0 mask!2687))))

(assert (=> start!126544 e!832516))

(assert (=> start!126544 true))

(declare-fun array_inv!37057 (array!99506) Bool)

(assert (=> start!126544 (array_inv!37057 a!2862)))

(declare-fun b!1484936 () Bool)

(declare-fun res!1009664 () Bool)

(assert (=> b!1484936 (=> (not res!1009664) (not e!832516))))

(declare-datatypes ((List!34530 0))(
  ( (Nil!34527) (Cons!34526 (h!35900 (_ BitVec 64)) (t!49224 List!34530)) )
))
(declare-fun arrayNoDuplicates!0 (array!99506 (_ BitVec 32) List!34530) Bool)

(assert (=> b!1484936 (= res!1009664 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34527))))

(declare-fun b!1484937 () Bool)

(declare-fun res!1009670 () Bool)

(assert (=> b!1484937 (=> (not res!1009670) (not e!832516))))

(assert (=> b!1484937 (= res!1009670 (and (= (size!48579 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48579 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48579 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484938 () Bool)

(assert (=> b!1484938 (= e!832511 e!832514)))

(declare-fun res!1009669 () Bool)

(assert (=> b!1484938 (=> (not res!1009669) (not e!832514))))

(assert (=> b!1484938 (= res!1009669 (= lt!647926 (Intermediate!12269 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484938 (= lt!647926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647925 mask!2687) lt!647925 lt!647923 mask!2687))))

(assert (=> b!1484938 (= lt!647925 (select (store (arr!48029 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484939 () Bool)

(assert (=> b!1484939 (= e!832513 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647925 lt!647923 mask!2687) (seekEntryOrOpen!0 lt!647925 lt!647923 mask!2687)))))

(declare-fun b!1484940 () Bool)

(declare-fun res!1009671 () Bool)

(assert (=> b!1484940 (=> (not res!1009671) (not e!832515))))

(assert (=> b!1484940 (= res!1009671 (= (seekEntryOrOpen!0 (select (arr!48029 a!2862) j!93) a!2862 mask!2687) (Found!12269 j!93)))))

(declare-fun b!1484941 () Bool)

(declare-fun res!1009663 () Bool)

(assert (=> b!1484941 (=> (not res!1009663) (not e!832516))))

(assert (=> b!1484941 (= res!1009663 (validKeyInArray!0 (select (arr!48029 a!2862) i!1006)))))

(declare-fun b!1484942 () Bool)

(declare-fun res!1009657 () Bool)

(assert (=> b!1484942 (=> (not res!1009657) (not e!832514))))

(assert (=> b!1484942 (= res!1009657 e!832513)))

(declare-fun c!137157 () Bool)

(assert (=> b!1484942 (= c!137157 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484943 () Bool)

(assert (=> b!1484943 (= e!832514 (not e!832512))))

(declare-fun res!1009672 () Bool)

(assert (=> b!1484943 (=> res!1009672 e!832512)))

(assert (=> b!1484943 (= res!1009672 (or (and (= (select (arr!48029 a!2862) index!646) (select (store (arr!48029 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48029 a!2862) index!646) (select (arr!48029 a!2862) j!93))) (= (select (arr!48029 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484943 e!832515))

(declare-fun res!1009668 () Bool)

(assert (=> b!1484943 (=> (not res!1009668) (not e!832515))))

(assert (=> b!1484943 (= res!1009668 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49878 0))(
  ( (Unit!49879) )
))
(declare-fun lt!647927 () Unit!49878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49878)

(assert (=> b!1484943 (= lt!647927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484944 () Bool)

(declare-fun e!832509 () Bool)

(assert (=> b!1484944 (= e!832509 e!832510)))

(declare-fun res!1009673 () Bool)

(assert (=> b!1484944 (=> (not res!1009673) (not e!832510))))

(declare-fun lt!647928 () (_ BitVec 64))

(assert (=> b!1484944 (= res!1009673 (and (= index!646 intermediateAfterIndex!19) (= lt!647928 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484945 () Bool)

(assert (=> b!1484945 (= e!832515 e!832509)))

(declare-fun res!1009665 () Bool)

(assert (=> b!1484945 (=> res!1009665 e!832509)))

(assert (=> b!1484945 (= res!1009665 (or (and (= (select (arr!48029 a!2862) index!646) lt!647928) (= (select (arr!48029 a!2862) index!646) (select (arr!48029 a!2862) j!93))) (= (select (arr!48029 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484945 (= lt!647928 (select (store (arr!48029 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484946 () Bool)

(assert (=> b!1484946 (= e!832516 e!832517)))

(declare-fun res!1009661 () Bool)

(assert (=> b!1484946 (=> (not res!1009661) (not e!832517))))

(assert (=> b!1484946 (= res!1009661 (= (select (store (arr!48029 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484946 (= lt!647923 (array!99507 (store (arr!48029 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48579 a!2862)))))

(assert (= (and start!126544 res!1009666) b!1484937))

(assert (= (and b!1484937 res!1009670) b!1484941))

(assert (= (and b!1484941 res!1009663) b!1484928))

(assert (= (and b!1484928 res!1009660) b!1484929))

(assert (= (and b!1484929 res!1009659) b!1484936))

(assert (= (and b!1484936 res!1009664) b!1484927))

(assert (= (and b!1484927 res!1009675) b!1484946))

(assert (= (and b!1484946 res!1009661) b!1484926))

(assert (= (and b!1484926 res!1009667) b!1484930))

(assert (= (and b!1484930 res!1009658) b!1484938))

(assert (= (and b!1484938 res!1009669) b!1484942))

(assert (= (and b!1484942 c!137157) b!1484933))

(assert (= (and b!1484942 (not c!137157)) b!1484939))

(assert (= (and b!1484942 res!1009657) b!1484931))

(assert (= (and b!1484931 res!1009662) b!1484943))

(assert (= (and b!1484943 res!1009668) b!1484940))

(assert (= (and b!1484940 res!1009671) b!1484932))

(assert (= (and b!1484932 res!1009674) b!1484945))

(assert (= (and b!1484945 (not res!1009665)) b!1484944))

(assert (= (and b!1484944 res!1009673) b!1484934))

(assert (= (and b!1484943 (not res!1009672)) b!1484935))

(declare-fun m!1370149 () Bool)

(assert (=> b!1484936 m!1370149))

(declare-fun m!1370151 () Bool)

(assert (=> b!1484941 m!1370151))

(assert (=> b!1484941 m!1370151))

(declare-fun m!1370153 () Bool)

(assert (=> b!1484941 m!1370153))

(declare-fun m!1370155 () Bool)

(assert (=> b!1484939 m!1370155))

(declare-fun m!1370157 () Bool)

(assert (=> b!1484939 m!1370157))

(declare-fun m!1370159 () Bool)

(assert (=> b!1484928 m!1370159))

(assert (=> b!1484928 m!1370159))

(declare-fun m!1370161 () Bool)

(assert (=> b!1484928 m!1370161))

(declare-fun m!1370163 () Bool)

(assert (=> start!126544 m!1370163))

(declare-fun m!1370165 () Bool)

(assert (=> start!126544 m!1370165))

(declare-fun m!1370167 () Bool)

(assert (=> b!1484933 m!1370167))

(assert (=> b!1484934 m!1370157))

(assert (=> b!1484934 m!1370155))

(declare-fun m!1370169 () Bool)

(assert (=> b!1484935 m!1370169))

(declare-fun m!1370171 () Bool)

(assert (=> b!1484932 m!1370171))

(assert (=> b!1484932 m!1370159))

(declare-fun m!1370173 () Bool)

(assert (=> b!1484945 m!1370173))

(assert (=> b!1484945 m!1370159))

(declare-fun m!1370175 () Bool)

(assert (=> b!1484945 m!1370175))

(declare-fun m!1370177 () Bool)

(assert (=> b!1484945 m!1370177))

(assert (=> b!1484946 m!1370175))

(declare-fun m!1370179 () Bool)

(assert (=> b!1484946 m!1370179))

(assert (=> b!1484940 m!1370159))

(assert (=> b!1484940 m!1370159))

(declare-fun m!1370181 () Bool)

(assert (=> b!1484940 m!1370181))

(assert (=> b!1484926 m!1370159))

(assert (=> b!1484926 m!1370159))

(declare-fun m!1370183 () Bool)

(assert (=> b!1484926 m!1370183))

(assert (=> b!1484926 m!1370183))

(assert (=> b!1484926 m!1370159))

(declare-fun m!1370185 () Bool)

(assert (=> b!1484926 m!1370185))

(declare-fun m!1370187 () Bool)

(assert (=> b!1484938 m!1370187))

(assert (=> b!1484938 m!1370187))

(declare-fun m!1370189 () Bool)

(assert (=> b!1484938 m!1370189))

(assert (=> b!1484938 m!1370175))

(declare-fun m!1370191 () Bool)

(assert (=> b!1484938 m!1370191))

(declare-fun m!1370193 () Bool)

(assert (=> b!1484929 m!1370193))

(assert (=> b!1484930 m!1370159))

(assert (=> b!1484930 m!1370159))

(declare-fun m!1370195 () Bool)

(assert (=> b!1484930 m!1370195))

(declare-fun m!1370197 () Bool)

(assert (=> b!1484943 m!1370197))

(assert (=> b!1484943 m!1370175))

(assert (=> b!1484943 m!1370177))

(assert (=> b!1484943 m!1370173))

(declare-fun m!1370199 () Bool)

(assert (=> b!1484943 m!1370199))

(assert (=> b!1484943 m!1370159))

(push 1)

