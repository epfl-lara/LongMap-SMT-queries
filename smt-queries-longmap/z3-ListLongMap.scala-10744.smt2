; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125604 () Bool)

(assert start!125604)

(declare-fun b!1469932 () Bool)

(declare-fun res!998358 () Bool)

(declare-fun e!825170 () Bool)

(assert (=> b!1469932 (=> (not res!998358) (not e!825170))))

(declare-datatypes ((array!99052 0))(
  ( (array!99053 (arr!47814 (Array (_ BitVec 32) (_ BitVec 64))) (size!48364 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99052)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469932 (= res!998358 (validKeyInArray!0 (select (arr!47814 a!2862) i!1006)))))

(declare-fun b!1469933 () Bool)

(declare-fun e!825172 () Bool)

(assert (=> b!1469933 (= e!825170 e!825172)))

(declare-fun res!998357 () Bool)

(assert (=> b!1469933 (=> (not res!998357) (not e!825172))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469933 (= res!998357 (= (select (store (arr!47814 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642723 () array!99052)

(assert (=> b!1469933 (= lt!642723 (array!99053 (store (arr!47814 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48364 a!2862)))))

(declare-fun b!1469934 () Bool)

(declare-fun res!998361 () Bool)

(declare-fun e!825173 () Bool)

(assert (=> b!1469934 (=> (not res!998361) (not e!825173))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12054 0))(
  ( (MissingZero!12054 (index!50608 (_ BitVec 32))) (Found!12054 (index!50609 (_ BitVec 32))) (Intermediate!12054 (undefined!12866 Bool) (index!50610 (_ BitVec 32)) (x!132183 (_ BitVec 32))) (Undefined!12054) (MissingVacant!12054 (index!50611 (_ BitVec 32))) )
))
(declare-fun lt!642724 () SeekEntryResult!12054)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12054)

(assert (=> b!1469934 (= res!998361 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47814 a!2862) j!93) a!2862 mask!2687) lt!642724))))

(declare-fun e!825171 () Bool)

(declare-fun lt!642726 () SeekEntryResult!12054)

(declare-fun b!1469935 () Bool)

(declare-fun lt!642725 () (_ BitVec 64))

(assert (=> b!1469935 (= e!825171 (= lt!642726 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642725 lt!642723 mask!2687)))))

(declare-fun b!1469936 () Bool)

(declare-fun res!998355 () Bool)

(assert (=> b!1469936 (=> (not res!998355) (not e!825170))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469936 (= res!998355 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48364 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48364 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48364 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469937 () Bool)

(declare-fun e!825169 () Bool)

(assert (=> b!1469937 (= e!825173 e!825169)))

(declare-fun res!998363 () Bool)

(assert (=> b!1469937 (=> (not res!998363) (not e!825169))))

(assert (=> b!1469937 (= res!998363 (= lt!642726 (Intermediate!12054 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469937 (= lt!642726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642725 mask!2687) lt!642725 lt!642723 mask!2687))))

(assert (=> b!1469937 (= lt!642725 (select (store (arr!47814 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469938 () Bool)

(declare-fun res!998362 () Bool)

(assert (=> b!1469938 (=> (not res!998362) (not e!825170))))

(assert (=> b!1469938 (= res!998362 (and (= (size!48364 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48364 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48364 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!998356 () Bool)

(assert (=> start!125604 (=> (not res!998356) (not e!825170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125604 (= res!998356 (validMask!0 mask!2687))))

(assert (=> start!125604 e!825170))

(assert (=> start!125604 true))

(declare-fun array_inv!36842 (array!99052) Bool)

(assert (=> start!125604 (array_inv!36842 a!2862)))

(declare-fun b!1469939 () Bool)

(declare-fun res!998353 () Bool)

(assert (=> b!1469939 (=> (not res!998353) (not e!825169))))

(assert (=> b!1469939 (= res!998353 e!825171)))

(declare-fun c!135300 () Bool)

(assert (=> b!1469939 (= c!135300 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469940 () Bool)

(declare-fun res!998360 () Bool)

(assert (=> b!1469940 (=> (not res!998360) (not e!825170))))

(assert (=> b!1469940 (= res!998360 (validKeyInArray!0 (select (arr!47814 a!2862) j!93)))))

(declare-fun b!1469941 () Bool)

(assert (=> b!1469941 (= e!825172 e!825173)))

(declare-fun res!998364 () Bool)

(assert (=> b!1469941 (=> (not res!998364) (not e!825173))))

(assert (=> b!1469941 (= res!998364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47814 a!2862) j!93) mask!2687) (select (arr!47814 a!2862) j!93) a!2862 mask!2687) lt!642724))))

(assert (=> b!1469941 (= lt!642724 (Intermediate!12054 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469942 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12054)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!12054)

(assert (=> b!1469942 (= e!825171 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642725 lt!642723 mask!2687) (seekEntryOrOpen!0 lt!642725 lt!642723 mask!2687)))))

(declare-fun b!1469943 () Bool)

(declare-fun res!998359 () Bool)

(assert (=> b!1469943 (=> (not res!998359) (not e!825170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99052 (_ BitVec 32)) Bool)

(assert (=> b!1469943 (= res!998359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469944 () Bool)

(assert (=> b!1469944 (= e!825169 (not true))))

(assert (=> b!1469944 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49448 0))(
  ( (Unit!49449) )
))
(declare-fun lt!642722 () Unit!49448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49448)

(assert (=> b!1469944 (= lt!642722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1469945 () Bool)

(declare-fun res!998354 () Bool)

(assert (=> b!1469945 (=> (not res!998354) (not e!825170))))

(declare-datatypes ((List!34315 0))(
  ( (Nil!34312) (Cons!34311 (h!35661 (_ BitVec 64)) (t!49009 List!34315)) )
))
(declare-fun arrayNoDuplicates!0 (array!99052 (_ BitVec 32) List!34315) Bool)

(assert (=> b!1469945 (= res!998354 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34312))))

(declare-fun b!1469946 () Bool)

(declare-fun res!998365 () Bool)

(assert (=> b!1469946 (=> (not res!998365) (not e!825169))))

(assert (=> b!1469946 (= res!998365 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125604 res!998356) b!1469938))

(assert (= (and b!1469938 res!998362) b!1469932))

(assert (= (and b!1469932 res!998358) b!1469940))

(assert (= (and b!1469940 res!998360) b!1469943))

(assert (= (and b!1469943 res!998359) b!1469945))

(assert (= (and b!1469945 res!998354) b!1469936))

(assert (= (and b!1469936 res!998355) b!1469933))

(assert (= (and b!1469933 res!998357) b!1469941))

(assert (= (and b!1469941 res!998364) b!1469934))

(assert (= (and b!1469934 res!998361) b!1469937))

(assert (= (and b!1469937 res!998363) b!1469939))

(assert (= (and b!1469939 c!135300) b!1469935))

(assert (= (and b!1469939 (not c!135300)) b!1469942))

(assert (= (and b!1469939 res!998353) b!1469946))

(assert (= (and b!1469946 res!998365) b!1469944))

(declare-fun m!1357075 () Bool)

(assert (=> b!1469937 m!1357075))

(assert (=> b!1469937 m!1357075))

(declare-fun m!1357077 () Bool)

(assert (=> b!1469937 m!1357077))

(declare-fun m!1357079 () Bool)

(assert (=> b!1469937 m!1357079))

(declare-fun m!1357081 () Bool)

(assert (=> b!1469937 m!1357081))

(declare-fun m!1357083 () Bool)

(assert (=> start!125604 m!1357083))

(declare-fun m!1357085 () Bool)

(assert (=> start!125604 m!1357085))

(assert (=> b!1469933 m!1357079))

(declare-fun m!1357087 () Bool)

(assert (=> b!1469933 m!1357087))

(declare-fun m!1357089 () Bool)

(assert (=> b!1469935 m!1357089))

(declare-fun m!1357091 () Bool)

(assert (=> b!1469934 m!1357091))

(assert (=> b!1469934 m!1357091))

(declare-fun m!1357093 () Bool)

(assert (=> b!1469934 m!1357093))

(declare-fun m!1357095 () Bool)

(assert (=> b!1469944 m!1357095))

(declare-fun m!1357097 () Bool)

(assert (=> b!1469944 m!1357097))

(assert (=> b!1469941 m!1357091))

(assert (=> b!1469941 m!1357091))

(declare-fun m!1357099 () Bool)

(assert (=> b!1469941 m!1357099))

(assert (=> b!1469941 m!1357099))

(assert (=> b!1469941 m!1357091))

(declare-fun m!1357101 () Bool)

(assert (=> b!1469941 m!1357101))

(declare-fun m!1357103 () Bool)

(assert (=> b!1469945 m!1357103))

(declare-fun m!1357105 () Bool)

(assert (=> b!1469943 m!1357105))

(assert (=> b!1469940 m!1357091))

(assert (=> b!1469940 m!1357091))

(declare-fun m!1357107 () Bool)

(assert (=> b!1469940 m!1357107))

(declare-fun m!1357109 () Bool)

(assert (=> b!1469932 m!1357109))

(assert (=> b!1469932 m!1357109))

(declare-fun m!1357111 () Bool)

(assert (=> b!1469932 m!1357111))

(declare-fun m!1357113 () Bool)

(assert (=> b!1469942 m!1357113))

(declare-fun m!1357115 () Bool)

(assert (=> b!1469942 m!1357115))

(check-sat (not b!1469941) (not b!1469935) (not b!1469945) (not start!125604) (not b!1469942) (not b!1469944) (not b!1469937) (not b!1469934) (not b!1469943) (not b!1469940) (not b!1469932))
(check-sat)
