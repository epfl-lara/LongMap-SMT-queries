; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126596 () Bool)

(assert start!126596)

(declare-fun b!1486072 () Bool)

(declare-fun e!833045 () Bool)

(declare-fun e!833050 () Bool)

(assert (=> b!1486072 (= e!833045 e!833050)))

(declare-fun res!1010663 () Bool)

(assert (=> b!1486072 (=> (not res!1010663) (not e!833050))))

(declare-datatypes ((array!99493 0))(
  ( (array!99494 (arr!48022 (Array (_ BitVec 32) (_ BitVec 64))) (size!48574 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99493)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12287 0))(
  ( (MissingZero!12287 (index!51540 (_ BitVec 32))) (Found!12287 (index!51541 (_ BitVec 32))) (Intermediate!12287 (undefined!13099 Bool) (index!51542 (_ BitVec 32)) (x!133120 (_ BitVec 32))) (Undefined!12287) (MissingVacant!12287 (index!51543 (_ BitVec 32))) )
))
(declare-fun lt!648168 () SeekEntryResult!12287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99493 (_ BitVec 32)) SeekEntryResult!12287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486072 (= res!1010663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48022 a!2862) j!93) mask!2687) (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!648168))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486072 (= lt!648168 (Intermediate!12287 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486073 () Bool)

(declare-fun res!1010649 () Bool)

(declare-fun e!833048 () Bool)

(assert (=> b!1486073 (=> (not res!1010649) (not e!833048))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486073 (= res!1010649 (validKeyInArray!0 (select (arr!48022 a!2862) i!1006)))))

(declare-fun res!1010656 () Bool)

(assert (=> start!126596 (=> (not res!1010656) (not e!833048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126596 (= res!1010656 (validMask!0 mask!2687))))

(assert (=> start!126596 e!833048))

(assert (=> start!126596 true))

(declare-fun array_inv!37255 (array!99493) Bool)

(assert (=> start!126596 (array_inv!37255 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1486074 () Bool)

(declare-fun e!833049 () Bool)

(declare-fun lt!648165 () array!99493)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!648170 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99493 (_ BitVec 32)) SeekEntryResult!12287)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99493 (_ BitVec 32)) SeekEntryResult!12287)

(assert (=> b!1486074 (= e!833049 (= (seekEntryOrOpen!0 lt!648170 lt!648165 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648170 lt!648165 mask!2687)))))

(declare-fun b!1486075 () Bool)

(declare-fun e!833047 () Bool)

(declare-fun e!833051 () Bool)

(assert (=> b!1486075 (= e!833047 (not e!833051))))

(declare-fun res!1010664 () Bool)

(assert (=> b!1486075 (=> res!1010664 e!833051)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486075 (= res!1010664 (or (and (= (select (arr!48022 a!2862) index!646) (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48022 a!2862) index!646) (select (arr!48022 a!2862) j!93))) (= (select (arr!48022 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833046 () Bool)

(assert (=> b!1486075 e!833046))

(declare-fun res!1010665 () Bool)

(assert (=> b!1486075 (=> (not res!1010665) (not e!833046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99493 (_ BitVec 32)) Bool)

(assert (=> b!1486075 (= res!1010665 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49755 0))(
  ( (Unit!49756) )
))
(declare-fun lt!648164 () Unit!49755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49755)

(assert (=> b!1486075 (= lt!648164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486076 () Bool)

(declare-fun res!1010655 () Bool)

(assert (=> b!1486076 (=> (not res!1010655) (not e!833046))))

(assert (=> b!1486076 (= res!1010655 (= (seekEntryOrOpen!0 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) (Found!12287 j!93)))))

(declare-fun b!1486077 () Bool)

(assert (=> b!1486077 (= e!833048 e!833045)))

(declare-fun res!1010657 () Bool)

(assert (=> b!1486077 (=> (not res!1010657) (not e!833045))))

(assert (=> b!1486077 (= res!1010657 (= (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486077 (= lt!648165 (array!99494 (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48574 a!2862)))))

(declare-fun b!1486078 () Bool)

(declare-fun e!833054 () Bool)

(assert (=> b!1486078 (= e!833054 e!833049)))

(declare-fun res!1010658 () Bool)

(assert (=> b!1486078 (=> (not res!1010658) (not e!833049))))

(declare-fun lt!648169 () (_ BitVec 64))

(assert (=> b!1486078 (= res!1010658 (and (= index!646 intermediateAfterIndex!19) (= lt!648169 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486079 () Bool)

(declare-fun res!1010647 () Bool)

(assert (=> b!1486079 (=> (not res!1010647) (not e!833046))))

(assert (=> b!1486079 (= res!1010647 (or (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48022 a!2862) intermediateBeforeIndex!19) (select (arr!48022 a!2862) j!93))))))

(declare-fun b!1486080 () Bool)

(declare-fun res!1010652 () Bool)

(assert (=> b!1486080 (=> (not res!1010652) (not e!833048))))

(assert (=> b!1486080 (= res!1010652 (and (= (size!48574 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48574 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48574 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486081 () Bool)

(assert (=> b!1486081 (= e!833051 true)))

(declare-fun lt!648166 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486081 (= lt!648166 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486082 () Bool)

(assert (=> b!1486082 (= e!833050 e!833047)))

(declare-fun res!1010660 () Bool)

(assert (=> b!1486082 (=> (not res!1010660) (not e!833047))))

(declare-fun lt!648167 () SeekEntryResult!12287)

(assert (=> b!1486082 (= res!1010660 (= lt!648167 (Intermediate!12287 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486082 (= lt!648167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648170 mask!2687) lt!648170 lt!648165 mask!2687))))

(assert (=> b!1486082 (= lt!648170 (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486083 () Bool)

(declare-fun res!1010648 () Bool)

(assert (=> b!1486083 (=> (not res!1010648) (not e!833048))))

(assert (=> b!1486083 (= res!1010648 (validKeyInArray!0 (select (arr!48022 a!2862) j!93)))))

(declare-fun b!1486084 () Bool)

(declare-fun res!1010659 () Bool)

(assert (=> b!1486084 (=> (not res!1010659) (not e!833048))))

(assert (=> b!1486084 (= res!1010659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!833053 () Bool)

(declare-fun b!1486085 () Bool)

(assert (=> b!1486085 (= e!833053 (= lt!648167 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648170 lt!648165 mask!2687)))))

(declare-fun b!1486086 () Bool)

(declare-fun res!1010661 () Bool)

(assert (=> b!1486086 (=> (not res!1010661) (not e!833048))))

(declare-datatypes ((List!34601 0))(
  ( (Nil!34598) (Cons!34597 (h!35974 (_ BitVec 64)) (t!49287 List!34601)) )
))
(declare-fun arrayNoDuplicates!0 (array!99493 (_ BitVec 32) List!34601) Bool)

(assert (=> b!1486086 (= res!1010661 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34598))))

(declare-fun b!1486087 () Bool)

(assert (=> b!1486087 (= e!833046 e!833054)))

(declare-fun res!1010654 () Bool)

(assert (=> b!1486087 (=> res!1010654 e!833054)))

(assert (=> b!1486087 (= res!1010654 (or (and (= (select (arr!48022 a!2862) index!646) lt!648169) (= (select (arr!48022 a!2862) index!646) (select (arr!48022 a!2862) j!93))) (= (select (arr!48022 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486087 (= lt!648169 (select (store (arr!48022 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486088 () Bool)

(declare-fun res!1010662 () Bool)

(assert (=> b!1486088 (=> (not res!1010662) (not e!833050))))

(assert (=> b!1486088 (= res!1010662 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48022 a!2862) j!93) a!2862 mask!2687) lt!648168))))

(declare-fun b!1486089 () Bool)

(declare-fun res!1010650 () Bool)

(assert (=> b!1486089 (=> (not res!1010650) (not e!833047))))

(assert (=> b!1486089 (= res!1010650 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486090 () Bool)

(declare-fun res!1010651 () Bool)

(assert (=> b!1486090 (=> (not res!1010651) (not e!833048))))

(assert (=> b!1486090 (= res!1010651 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48574 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48574 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48574 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486091 () Bool)

(declare-fun res!1010653 () Bool)

(assert (=> b!1486091 (=> (not res!1010653) (not e!833047))))

(assert (=> b!1486091 (= res!1010653 e!833053)))

(declare-fun c!137239 () Bool)

(assert (=> b!1486091 (= c!137239 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486092 () Bool)

(assert (=> b!1486092 (= e!833053 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648170 lt!648165 mask!2687) (seekEntryOrOpen!0 lt!648170 lt!648165 mask!2687)))))

(assert (= (and start!126596 res!1010656) b!1486080))

(assert (= (and b!1486080 res!1010652) b!1486073))

(assert (= (and b!1486073 res!1010649) b!1486083))

(assert (= (and b!1486083 res!1010648) b!1486084))

(assert (= (and b!1486084 res!1010659) b!1486086))

(assert (= (and b!1486086 res!1010661) b!1486090))

(assert (= (and b!1486090 res!1010651) b!1486077))

(assert (= (and b!1486077 res!1010657) b!1486072))

(assert (= (and b!1486072 res!1010663) b!1486088))

(assert (= (and b!1486088 res!1010662) b!1486082))

(assert (= (and b!1486082 res!1010660) b!1486091))

(assert (= (and b!1486091 c!137239) b!1486085))

(assert (= (and b!1486091 (not c!137239)) b!1486092))

(assert (= (and b!1486091 res!1010653) b!1486089))

(assert (= (and b!1486089 res!1010650) b!1486075))

(assert (= (and b!1486075 res!1010665) b!1486076))

(assert (= (and b!1486076 res!1010655) b!1486079))

(assert (= (and b!1486079 res!1010647) b!1486087))

(assert (= (and b!1486087 (not res!1010654)) b!1486078))

(assert (= (and b!1486078 res!1010658) b!1486074))

(assert (= (and b!1486075 (not res!1010664)) b!1486081))

(declare-fun m!1370415 () Bool)

(assert (=> b!1486073 m!1370415))

(assert (=> b!1486073 m!1370415))

(declare-fun m!1370417 () Bool)

(assert (=> b!1486073 m!1370417))

(declare-fun m!1370419 () Bool)

(assert (=> b!1486082 m!1370419))

(assert (=> b!1486082 m!1370419))

(declare-fun m!1370421 () Bool)

(assert (=> b!1486082 m!1370421))

(declare-fun m!1370423 () Bool)

(assert (=> b!1486082 m!1370423))

(declare-fun m!1370425 () Bool)

(assert (=> b!1486082 m!1370425))

(declare-fun m!1370427 () Bool)

(assert (=> b!1486072 m!1370427))

(assert (=> b!1486072 m!1370427))

(declare-fun m!1370429 () Bool)

(assert (=> b!1486072 m!1370429))

(assert (=> b!1486072 m!1370429))

(assert (=> b!1486072 m!1370427))

(declare-fun m!1370431 () Bool)

(assert (=> b!1486072 m!1370431))

(declare-fun m!1370433 () Bool)

(assert (=> b!1486087 m!1370433))

(assert (=> b!1486087 m!1370427))

(assert (=> b!1486087 m!1370423))

(declare-fun m!1370435 () Bool)

(assert (=> b!1486087 m!1370435))

(assert (=> b!1486088 m!1370427))

(assert (=> b!1486088 m!1370427))

(declare-fun m!1370437 () Bool)

(assert (=> b!1486088 m!1370437))

(declare-fun m!1370439 () Bool)

(assert (=> b!1486092 m!1370439))

(declare-fun m!1370441 () Bool)

(assert (=> b!1486092 m!1370441))

(assert (=> b!1486074 m!1370441))

(assert (=> b!1486074 m!1370439))

(assert (=> b!1486076 m!1370427))

(assert (=> b!1486076 m!1370427))

(declare-fun m!1370443 () Bool)

(assert (=> b!1486076 m!1370443))

(declare-fun m!1370445 () Bool)

(assert (=> b!1486085 m!1370445))

(assert (=> b!1486077 m!1370423))

(declare-fun m!1370447 () Bool)

(assert (=> b!1486077 m!1370447))

(declare-fun m!1370449 () Bool)

(assert (=> b!1486075 m!1370449))

(assert (=> b!1486075 m!1370423))

(assert (=> b!1486075 m!1370435))

(assert (=> b!1486075 m!1370433))

(declare-fun m!1370451 () Bool)

(assert (=> b!1486075 m!1370451))

(assert (=> b!1486075 m!1370427))

(declare-fun m!1370453 () Bool)

(assert (=> b!1486084 m!1370453))

(declare-fun m!1370455 () Bool)

(assert (=> start!126596 m!1370455))

(declare-fun m!1370457 () Bool)

(assert (=> start!126596 m!1370457))

(declare-fun m!1370459 () Bool)

(assert (=> b!1486086 m!1370459))

(declare-fun m!1370461 () Bool)

(assert (=> b!1486081 m!1370461))

(assert (=> b!1486083 m!1370427))

(assert (=> b!1486083 m!1370427))

(declare-fun m!1370463 () Bool)

(assert (=> b!1486083 m!1370463))

(declare-fun m!1370465 () Bool)

(assert (=> b!1486079 m!1370465))

(assert (=> b!1486079 m!1370427))

(check-sat (not b!1486082) (not b!1486086) (not b!1486073) (not b!1486076) (not b!1486075) (not b!1486074) (not b!1486092) (not b!1486083) (not b!1486081) (not b!1486072) (not b!1486085) (not b!1486088) (not start!126596) (not b!1486084))
(check-sat)
