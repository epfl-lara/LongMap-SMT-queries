; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125900 () Bool)

(assert start!125900)

(declare-fun b!1473997 () Bool)

(declare-fun e!827089 () Bool)

(declare-fun e!827087 () Bool)

(assert (=> b!1473997 (= e!827089 e!827087)))

(declare-fun res!1001252 () Bool)

(assert (=> b!1473997 (=> (not res!1001252) (not e!827087))))

(declare-datatypes ((array!99177 0))(
  ( (array!99178 (arr!47872 (Array (_ BitVec 32) (_ BitVec 64))) (size!48422 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99177)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12112 0))(
  ( (MissingZero!12112 (index!50840 (_ BitVec 32))) (Found!12112 (index!50841 (_ BitVec 32))) (Intermediate!12112 (undefined!12924 Bool) (index!50842 (_ BitVec 32)) (x!132420 (_ BitVec 32))) (Undefined!12112) (MissingVacant!12112 (index!50843 (_ BitVec 32))) )
))
(declare-fun lt!644118 () SeekEntryResult!12112)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99177 (_ BitVec 32)) SeekEntryResult!12112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473997 (= res!1001252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47872 a!2862) j!93) mask!2687) (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!644118))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473997 (= lt!644118 (Intermediate!12112 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644115 () array!99177)

(declare-fun b!1473998 () Bool)

(declare-fun e!827090 () Bool)

(declare-fun lt!644113 () SeekEntryResult!12112)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644114 () (_ BitVec 64))

(assert (=> b!1473998 (= e!827090 (= lt!644113 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644114 lt!644115 mask!2687)))))

(declare-fun b!1473999 () Bool)

(declare-fun res!1001261 () Bool)

(declare-fun e!827085 () Bool)

(assert (=> b!1473999 (=> (not res!1001261) (not e!827085))))

(assert (=> b!1473999 (= res!1001261 e!827090)))

(declare-fun c!135888 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473999 (= c!135888 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474000 () Bool)

(declare-fun res!1001264 () Bool)

(assert (=> b!1474000 (=> (not res!1001264) (not e!827087))))

(assert (=> b!1474000 (= res!1001264 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!644118))))

(declare-fun b!1474001 () Bool)

(declare-fun res!1001256 () Bool)

(declare-fun e!827084 () Bool)

(assert (=> b!1474001 (=> (not res!1001256) (not e!827084))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474001 (= res!1001256 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48422 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48422 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48422 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474002 () Bool)

(declare-fun res!1001251 () Bool)

(assert (=> b!1474002 (=> (not res!1001251) (not e!827084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474002 (= res!1001251 (validKeyInArray!0 (select (arr!47872 a!2862) j!93)))))

(declare-fun b!1474003 () Bool)

(declare-fun res!1001265 () Bool)

(assert (=> b!1474003 (=> (not res!1001265) (not e!827084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99177 (_ BitVec 32)) Bool)

(assert (=> b!1474003 (= res!1001265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1001254 () Bool)

(assert (=> start!125900 (=> (not res!1001254) (not e!827084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125900 (= res!1001254 (validMask!0 mask!2687))))

(assert (=> start!125900 e!827084))

(assert (=> start!125900 true))

(declare-fun array_inv!36900 (array!99177) Bool)

(assert (=> start!125900 (array_inv!36900 a!2862)))

(declare-fun b!1474004 () Bool)

(assert (=> b!1474004 (= e!827087 e!827085)))

(declare-fun res!1001259 () Bool)

(assert (=> b!1474004 (=> (not res!1001259) (not e!827085))))

(assert (=> b!1474004 (= res!1001259 (= lt!644113 (Intermediate!12112 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474004 (= lt!644113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644114 mask!2687) lt!644114 lt!644115 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474004 (= lt!644114 (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474005 () Bool)

(declare-fun res!1001262 () Bool)

(assert (=> b!1474005 (=> (not res!1001262) (not e!827084))))

(assert (=> b!1474005 (= res!1001262 (and (= (size!48422 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48422 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48422 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474006 () Bool)

(declare-fun res!1001266 () Bool)

(assert (=> b!1474006 (=> (not res!1001266) (not e!827084))))

(assert (=> b!1474006 (= res!1001266 (validKeyInArray!0 (select (arr!47872 a!2862) i!1006)))))

(declare-fun b!1474007 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99177 (_ BitVec 32)) SeekEntryResult!12112)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99177 (_ BitVec 32)) SeekEntryResult!12112)

(assert (=> b!1474007 (= e!827090 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644114 lt!644115 mask!2687) (seekEntryOrOpen!0 lt!644114 lt!644115 mask!2687)))))

(declare-fun b!1474008 () Bool)

(declare-fun res!1001255 () Bool)

(assert (=> b!1474008 (=> (not res!1001255) (not e!827085))))

(assert (=> b!1474008 (= res!1001255 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474009 () Bool)

(declare-fun e!827083 () Bool)

(assert (=> b!1474009 (= e!827083 true)))

(declare-fun lt!644116 () SeekEntryResult!12112)

(assert (=> b!1474009 (= lt!644116 (seekEntryOrOpen!0 lt!644114 lt!644115 mask!2687))))

(declare-fun b!1474010 () Bool)

(declare-fun res!1001258 () Bool)

(declare-fun e!827088 () Bool)

(assert (=> b!1474010 (=> (not res!1001258) (not e!827088))))

(assert (=> b!1474010 (= res!1001258 (= (seekEntryOrOpen!0 (select (arr!47872 a!2862) j!93) a!2862 mask!2687) (Found!12112 j!93)))))

(declare-fun b!1474011 () Bool)

(assert (=> b!1474011 (= e!827085 (not e!827083))))

(declare-fun res!1001253 () Bool)

(assert (=> b!1474011 (=> res!1001253 e!827083)))

(assert (=> b!1474011 (= res!1001253 (or (not (= (select (arr!47872 a!2862) index!646) (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47872 a!2862) index!646) (select (arr!47872 a!2862) j!93)))))))

(assert (=> b!1474011 e!827088))

(declare-fun res!1001257 () Bool)

(assert (=> b!1474011 (=> (not res!1001257) (not e!827088))))

(assert (=> b!1474011 (= res!1001257 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49564 0))(
  ( (Unit!49565) )
))
(declare-fun lt!644117 () Unit!49564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49564)

(assert (=> b!1474011 (= lt!644117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474012 () Bool)

(assert (=> b!1474012 (= e!827084 e!827089)))

(declare-fun res!1001263 () Bool)

(assert (=> b!1474012 (=> (not res!1001263) (not e!827089))))

(assert (=> b!1474012 (= res!1001263 (= (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474012 (= lt!644115 (array!99178 (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48422 a!2862)))))

(declare-fun b!1474013 () Bool)

(declare-fun res!1001260 () Bool)

(assert (=> b!1474013 (=> (not res!1001260) (not e!827084))))

(declare-datatypes ((List!34373 0))(
  ( (Nil!34370) (Cons!34369 (h!35728 (_ BitVec 64)) (t!49067 List!34373)) )
))
(declare-fun arrayNoDuplicates!0 (array!99177 (_ BitVec 32) List!34373) Bool)

(assert (=> b!1474013 (= res!1001260 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34370))))

(declare-fun b!1474014 () Bool)

(assert (=> b!1474014 (= e!827088 (or (= (select (arr!47872 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47872 a!2862) intermediateBeforeIndex!19) (select (arr!47872 a!2862) j!93))))))

(assert (= (and start!125900 res!1001254) b!1474005))

(assert (= (and b!1474005 res!1001262) b!1474006))

(assert (= (and b!1474006 res!1001266) b!1474002))

(assert (= (and b!1474002 res!1001251) b!1474003))

(assert (= (and b!1474003 res!1001265) b!1474013))

(assert (= (and b!1474013 res!1001260) b!1474001))

(assert (= (and b!1474001 res!1001256) b!1474012))

(assert (= (and b!1474012 res!1001263) b!1473997))

(assert (= (and b!1473997 res!1001252) b!1474000))

(assert (= (and b!1474000 res!1001264) b!1474004))

(assert (= (and b!1474004 res!1001259) b!1473999))

(assert (= (and b!1473999 c!135888) b!1473998))

(assert (= (and b!1473999 (not c!135888)) b!1474007))

(assert (= (and b!1473999 res!1001261) b!1474008))

(assert (= (and b!1474008 res!1001255) b!1474011))

(assert (= (and b!1474011 res!1001257) b!1474010))

(assert (= (and b!1474010 res!1001258) b!1474014))

(assert (= (and b!1474011 (not res!1001253)) b!1474009))

(declare-fun m!1360481 () Bool)

(assert (=> b!1474006 m!1360481))

(assert (=> b!1474006 m!1360481))

(declare-fun m!1360483 () Bool)

(assert (=> b!1474006 m!1360483))

(declare-fun m!1360485 () Bool)

(assert (=> b!1474011 m!1360485))

(declare-fun m!1360487 () Bool)

(assert (=> b!1474011 m!1360487))

(declare-fun m!1360489 () Bool)

(assert (=> b!1474011 m!1360489))

(declare-fun m!1360491 () Bool)

(assert (=> b!1474011 m!1360491))

(declare-fun m!1360493 () Bool)

(assert (=> b!1474011 m!1360493))

(declare-fun m!1360495 () Bool)

(assert (=> b!1474011 m!1360495))

(declare-fun m!1360497 () Bool)

(assert (=> b!1474003 m!1360497))

(assert (=> b!1474012 m!1360487))

(declare-fun m!1360499 () Bool)

(assert (=> b!1474012 m!1360499))

(assert (=> b!1474000 m!1360495))

(assert (=> b!1474000 m!1360495))

(declare-fun m!1360501 () Bool)

(assert (=> b!1474000 m!1360501))

(assert (=> b!1474010 m!1360495))

(assert (=> b!1474010 m!1360495))

(declare-fun m!1360503 () Bool)

(assert (=> b!1474010 m!1360503))

(declare-fun m!1360505 () Bool)

(assert (=> b!1474009 m!1360505))

(assert (=> b!1474002 m!1360495))

(assert (=> b!1474002 m!1360495))

(declare-fun m!1360507 () Bool)

(assert (=> b!1474002 m!1360507))

(declare-fun m!1360509 () Bool)

(assert (=> start!125900 m!1360509))

(declare-fun m!1360511 () Bool)

(assert (=> start!125900 m!1360511))

(declare-fun m!1360513 () Bool)

(assert (=> b!1474004 m!1360513))

(assert (=> b!1474004 m!1360513))

(declare-fun m!1360515 () Bool)

(assert (=> b!1474004 m!1360515))

(assert (=> b!1474004 m!1360487))

(declare-fun m!1360517 () Bool)

(assert (=> b!1474004 m!1360517))

(declare-fun m!1360519 () Bool)

(assert (=> b!1473998 m!1360519))

(assert (=> b!1473997 m!1360495))

(assert (=> b!1473997 m!1360495))

(declare-fun m!1360521 () Bool)

(assert (=> b!1473997 m!1360521))

(assert (=> b!1473997 m!1360521))

(assert (=> b!1473997 m!1360495))

(declare-fun m!1360523 () Bool)

(assert (=> b!1473997 m!1360523))

(declare-fun m!1360525 () Bool)

(assert (=> b!1474014 m!1360525))

(assert (=> b!1474014 m!1360495))

(declare-fun m!1360527 () Bool)

(assert (=> b!1474007 m!1360527))

(assert (=> b!1474007 m!1360505))

(declare-fun m!1360529 () Bool)

(assert (=> b!1474013 m!1360529))

(push 1)

