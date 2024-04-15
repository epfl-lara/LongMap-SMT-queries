; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126166 () Bool)

(assert start!126166)

(declare-fun b!1478077 () Bool)

(declare-fun res!1004240 () Bool)

(declare-fun e!829145 () Bool)

(assert (=> b!1478077 (=> (not res!1004240) (not e!829145))))

(declare-datatypes ((array!99250 0))(
  ( (array!99251 (arr!47905 (Array (_ BitVec 32) (_ BitVec 64))) (size!48457 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99250)

(declare-datatypes ((List!34484 0))(
  ( (Nil!34481) (Cons!34480 (h!35848 (_ BitVec 64)) (t!49170 List!34484)) )
))
(declare-fun arrayNoDuplicates!0 (array!99250 (_ BitVec 32) List!34484) Bool)

(assert (=> b!1478077 (= res!1004240 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34481))))

(declare-fun res!1004237 () Bool)

(assert (=> start!126166 (=> (not res!1004237) (not e!829145))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126166 (= res!1004237 (validMask!0 mask!2687))))

(assert (=> start!126166 e!829145))

(assert (=> start!126166 true))

(declare-fun array_inv!37138 (array!99250) Bool)

(assert (=> start!126166 (array_inv!37138 a!2862)))

(declare-fun b!1478078 () Bool)

(declare-fun res!1004239 () Bool)

(assert (=> b!1478078 (=> (not res!1004239) (not e!829145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99250 (_ BitVec 32)) Bool)

(assert (=> b!1478078 (= res!1004239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478079 () Bool)

(declare-fun e!829146 () Bool)

(assert (=> b!1478079 (= e!829146 (not true))))

(declare-fun e!829147 () Bool)

(assert (=> b!1478079 e!829147))

(declare-fun res!1004232 () Bool)

(assert (=> b!1478079 (=> (not res!1004232) (not e!829147))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12170 0))(
  ( (MissingZero!12170 (index!51072 (_ BitVec 32))) (Found!12170 (index!51073 (_ BitVec 32))) (Intermediate!12170 (undefined!12982 Bool) (index!51074 (_ BitVec 32)) (x!132660 (_ BitVec 32))) (Undefined!12170) (MissingVacant!12170 (index!51075 (_ BitVec 32))) )
))
(declare-fun lt!645395 () SeekEntryResult!12170)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1478079 (= res!1004232 (and (= lt!645395 (Found!12170 j!93)) (or (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) (select (arr!47905 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478079 (= lt!645395 (seekEntryOrOpen!0 (select (arr!47905 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478079 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49521 0))(
  ( (Unit!49522) )
))
(declare-fun lt!645393 () Unit!49521)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49521)

(assert (=> b!1478079 (= lt!645393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!645391 () SeekEntryResult!12170)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645394 () array!99250)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!829150 () Bool)

(declare-fun lt!645392 () (_ BitVec 64))

(declare-fun b!1478080 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478080 (= e!829150 (= lt!645391 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645392 lt!645394 mask!2687)))))

(declare-fun b!1478081 () Bool)

(declare-fun res!1004229 () Bool)

(assert (=> b!1478081 (=> (not res!1004229) (not e!829146))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478081 (= res!1004229 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478082 () Bool)

(declare-fun e!829148 () Bool)

(assert (=> b!1478082 (= e!829147 e!829148)))

(declare-fun res!1004234 () Bool)

(assert (=> b!1478082 (=> res!1004234 e!829148)))

(assert (=> b!1478082 (= res!1004234 (or (and (= (select (arr!47905 a!2862) index!646) (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47905 a!2862) index!646) (select (arr!47905 a!2862) j!93))) (not (= (select (arr!47905 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478083 () Bool)

(declare-fun res!1004227 () Bool)

(assert (=> b!1478083 (=> (not res!1004227) (not e!829146))))

(assert (=> b!1478083 (= res!1004227 e!829150)))

(declare-fun c!136447 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478083 (= c!136447 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478084 () Bool)

(declare-fun e!829152 () Bool)

(assert (=> b!1478084 (= e!829148 e!829152)))

(declare-fun res!1004230 () Bool)

(assert (=> b!1478084 (=> (not res!1004230) (not e!829152))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12170)

(assert (=> b!1478084 (= res!1004230 (= lt!645395 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47905 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478085 () Bool)

(declare-fun res!1004231 () Bool)

(assert (=> b!1478085 (=> (not res!1004231) (not e!829145))))

(assert (=> b!1478085 (= res!1004231 (and (= (size!48457 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48457 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48457 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478086 () Bool)

(assert (=> b!1478086 (= e!829150 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645392 lt!645394 mask!2687) (seekEntryOrOpen!0 lt!645392 lt!645394 mask!2687)))))

(declare-fun b!1478087 () Bool)

(declare-fun e!829144 () Bool)

(assert (=> b!1478087 (= e!829144 e!829146)))

(declare-fun res!1004233 () Bool)

(assert (=> b!1478087 (=> (not res!1004233) (not e!829146))))

(assert (=> b!1478087 (= res!1004233 (= lt!645391 (Intermediate!12170 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478087 (= lt!645391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645392 mask!2687) lt!645392 lt!645394 mask!2687))))

(assert (=> b!1478087 (= lt!645392 (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478088 () Bool)

(assert (=> b!1478088 (= e!829152 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478089 () Bool)

(declare-fun res!1004236 () Bool)

(assert (=> b!1478089 (=> (not res!1004236) (not e!829145))))

(assert (=> b!1478089 (= res!1004236 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48457 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48457 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48457 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478090 () Bool)

(declare-fun e!829151 () Bool)

(assert (=> b!1478090 (= e!829145 e!829151)))

(declare-fun res!1004228 () Bool)

(assert (=> b!1478090 (=> (not res!1004228) (not e!829151))))

(assert (=> b!1478090 (= res!1004228 (= (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478090 (= lt!645394 (array!99251 (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48457 a!2862)))))

(declare-fun b!1478091 () Bool)

(declare-fun res!1004238 () Bool)

(assert (=> b!1478091 (=> (not res!1004238) (not e!829145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478091 (= res!1004238 (validKeyInArray!0 (select (arr!47905 a!2862) j!93)))))

(declare-fun b!1478092 () Bool)

(declare-fun res!1004241 () Bool)

(assert (=> b!1478092 (=> (not res!1004241) (not e!829144))))

(declare-fun lt!645396 () SeekEntryResult!12170)

(assert (=> b!1478092 (= res!1004241 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!645396))))

(declare-fun b!1478093 () Bool)

(assert (=> b!1478093 (= e!829151 e!829144)))

(declare-fun res!1004235 () Bool)

(assert (=> b!1478093 (=> (not res!1004235) (not e!829144))))

(assert (=> b!1478093 (= res!1004235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47905 a!2862) j!93) mask!2687) (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!645396))))

(assert (=> b!1478093 (= lt!645396 (Intermediate!12170 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478094 () Bool)

(declare-fun res!1004242 () Bool)

(assert (=> b!1478094 (=> (not res!1004242) (not e!829145))))

(assert (=> b!1478094 (= res!1004242 (validKeyInArray!0 (select (arr!47905 a!2862) i!1006)))))

(assert (= (and start!126166 res!1004237) b!1478085))

(assert (= (and b!1478085 res!1004231) b!1478094))

(assert (= (and b!1478094 res!1004242) b!1478091))

(assert (= (and b!1478091 res!1004238) b!1478078))

(assert (= (and b!1478078 res!1004239) b!1478077))

(assert (= (and b!1478077 res!1004240) b!1478089))

(assert (= (and b!1478089 res!1004236) b!1478090))

(assert (= (and b!1478090 res!1004228) b!1478093))

(assert (= (and b!1478093 res!1004235) b!1478092))

(assert (= (and b!1478092 res!1004241) b!1478087))

(assert (= (and b!1478087 res!1004233) b!1478083))

(assert (= (and b!1478083 c!136447) b!1478080))

(assert (= (and b!1478083 (not c!136447)) b!1478086))

(assert (= (and b!1478083 res!1004227) b!1478081))

(assert (= (and b!1478081 res!1004229) b!1478079))

(assert (= (and b!1478079 res!1004232) b!1478082))

(assert (= (and b!1478082 (not res!1004234)) b!1478084))

(assert (= (and b!1478084 res!1004230) b!1478088))

(declare-fun m!1363515 () Bool)

(assert (=> b!1478079 m!1363515))

(declare-fun m!1363517 () Bool)

(assert (=> b!1478079 m!1363517))

(declare-fun m!1363519 () Bool)

(assert (=> b!1478079 m!1363519))

(declare-fun m!1363521 () Bool)

(assert (=> b!1478079 m!1363521))

(declare-fun m!1363523 () Bool)

(assert (=> b!1478079 m!1363523))

(assert (=> b!1478079 m!1363519))

(declare-fun m!1363525 () Bool)

(assert (=> b!1478094 m!1363525))

(assert (=> b!1478094 m!1363525))

(declare-fun m!1363527 () Bool)

(assert (=> b!1478094 m!1363527))

(declare-fun m!1363529 () Bool)

(assert (=> b!1478077 m!1363529))

(assert (=> b!1478093 m!1363519))

(assert (=> b!1478093 m!1363519))

(declare-fun m!1363531 () Bool)

(assert (=> b!1478093 m!1363531))

(assert (=> b!1478093 m!1363531))

(assert (=> b!1478093 m!1363519))

(declare-fun m!1363533 () Bool)

(assert (=> b!1478093 m!1363533))

(declare-fun m!1363535 () Bool)

(assert (=> b!1478078 m!1363535))

(declare-fun m!1363537 () Bool)

(assert (=> b!1478087 m!1363537))

(assert (=> b!1478087 m!1363537))

(declare-fun m!1363539 () Bool)

(assert (=> b!1478087 m!1363539))

(declare-fun m!1363541 () Bool)

(assert (=> b!1478087 m!1363541))

(declare-fun m!1363543 () Bool)

(assert (=> b!1478087 m!1363543))

(assert (=> b!1478084 m!1363519))

(assert (=> b!1478084 m!1363519))

(declare-fun m!1363545 () Bool)

(assert (=> b!1478084 m!1363545))

(declare-fun m!1363547 () Bool)

(assert (=> start!126166 m!1363547))

(declare-fun m!1363549 () Bool)

(assert (=> start!126166 m!1363549))

(declare-fun m!1363551 () Bool)

(assert (=> b!1478080 m!1363551))

(assert (=> b!1478090 m!1363541))

(declare-fun m!1363553 () Bool)

(assert (=> b!1478090 m!1363553))

(assert (=> b!1478092 m!1363519))

(assert (=> b!1478092 m!1363519))

(declare-fun m!1363555 () Bool)

(assert (=> b!1478092 m!1363555))

(declare-fun m!1363557 () Bool)

(assert (=> b!1478082 m!1363557))

(assert (=> b!1478082 m!1363541))

(declare-fun m!1363559 () Bool)

(assert (=> b!1478082 m!1363559))

(assert (=> b!1478082 m!1363519))

(assert (=> b!1478091 m!1363519))

(assert (=> b!1478091 m!1363519))

(declare-fun m!1363561 () Bool)

(assert (=> b!1478091 m!1363561))

(declare-fun m!1363563 () Bool)

(assert (=> b!1478086 m!1363563))

(declare-fun m!1363565 () Bool)

(assert (=> b!1478086 m!1363565))

(check-sat (not b!1478087) (not start!126166) (not b!1478094) (not b!1478078) (not b!1478084) (not b!1478077) (not b!1478091) (not b!1478093) (not b!1478079) (not b!1478092) (not b!1478080) (not b!1478086))
(check-sat)
