; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125124 () Bool)

(assert start!125124)

(declare-fun b!1452453 () Bool)

(declare-fun e!817926 () Bool)

(declare-fun e!817931 () Bool)

(assert (=> b!1452453 (= e!817926 e!817931)))

(declare-fun res!982908 () Bool)

(assert (=> b!1452453 (=> (not res!982908) (not e!817931))))

(declare-datatypes ((SeekEntryResult!11667 0))(
  ( (MissingZero!11667 (index!49060 (_ BitVec 32))) (Found!11667 (index!49061 (_ BitVec 32))) (Intermediate!11667 (undefined!12479 Bool) (index!49062 (_ BitVec 32)) (x!130892 (_ BitVec 32))) (Undefined!11667) (MissingVacant!11667 (index!49063 (_ BitVec 32))) )
))
(declare-fun lt!637041 () SeekEntryResult!11667)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452453 (= res!982908 (= lt!637041 (Intermediate!11667 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637040 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98467 0))(
  ( (array!98468 (arr!47518 (Array (_ BitVec 32) (_ BitVec 64))) (size!48069 (_ BitVec 32))) )
))
(declare-fun lt!637042 () array!98467)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98467 (_ BitVec 32)) SeekEntryResult!11667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452453 (= lt!637041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637040 mask!2687) lt!637040 lt!637042 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98467)

(assert (=> b!1452453 (= lt!637040 (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452454 () Bool)

(declare-fun e!817929 () Bool)

(declare-fun e!817930 () Bool)

(assert (=> b!1452454 (= e!817929 e!817930)))

(declare-fun res!982911 () Bool)

(assert (=> b!1452454 (=> (not res!982911) (not e!817930))))

(assert (=> b!1452454 (= res!982911 (= (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452454 (= lt!637042 (array!98468 (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48069 a!2862)))))

(declare-fun b!1452455 () Bool)

(declare-fun res!982913 () Bool)

(assert (=> b!1452455 (=> (not res!982913) (not e!817931))))

(declare-fun e!817927 () Bool)

(assert (=> b!1452455 (= res!982913 e!817927)))

(declare-fun c!134296 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1452455 (= c!134296 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452456 () Bool)

(declare-fun res!982901 () Bool)

(assert (=> b!1452456 (=> (not res!982901) (not e!817926))))

(declare-fun lt!637038 () SeekEntryResult!11667)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1452456 (= res!982901 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637038))))

(declare-fun b!1452457 () Bool)

(assert (=> b!1452457 (= e!817930 e!817926)))

(declare-fun res!982905 () Bool)

(assert (=> b!1452457 (=> (not res!982905) (not e!817926))))

(assert (=> b!1452457 (= res!982905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47518 a!2862) j!93) mask!2687) (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637038))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452457 (= lt!637038 (Intermediate!11667 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!817928 () Bool)

(declare-fun b!1452458 () Bool)

(assert (=> b!1452458 (= e!817928 (and (or (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) (select (arr!47518 a!2862) j!93))) (or (and (= (select (arr!47518 a!2862) index!646) (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47518 a!2862) index!646) (select (arr!47518 a!2862) j!93))) (= (select (arr!47518 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452459 () Bool)

(declare-fun res!982903 () Bool)

(assert (=> b!1452459 (=> (not res!982903) (not e!817929))))

(declare-datatypes ((List!34006 0))(
  ( (Nil!34003) (Cons!34002 (h!35363 (_ BitVec 64)) (t!48692 List!34006)) )
))
(declare-fun arrayNoDuplicates!0 (array!98467 (_ BitVec 32) List!34006) Bool)

(assert (=> b!1452459 (= res!982903 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34003))))

(declare-fun res!982906 () Bool)

(assert (=> start!125124 (=> (not res!982906) (not e!817929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125124 (= res!982906 (validMask!0 mask!2687))))

(assert (=> start!125124 e!817929))

(assert (=> start!125124 true))

(declare-fun array_inv!36799 (array!98467) Bool)

(assert (=> start!125124 (array_inv!36799 a!2862)))

(declare-fun b!1452460 () Bool)

(declare-fun res!982899 () Bool)

(assert (=> b!1452460 (=> (not res!982899) (not e!817931))))

(assert (=> b!1452460 (= res!982899 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452461 () Bool)

(declare-fun res!982900 () Bool)

(assert (=> b!1452461 (=> (not res!982900) (not e!817929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452461 (= res!982900 (validKeyInArray!0 (select (arr!47518 a!2862) i!1006)))))

(declare-fun b!1452462 () Bool)

(declare-fun res!982902 () Bool)

(assert (=> b!1452462 (=> (not res!982902) (not e!817928))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98467 (_ BitVec 32)) SeekEntryResult!11667)

(assert (=> b!1452462 (= res!982902 (= (seekEntryOrOpen!0 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) (Found!11667 j!93)))))

(declare-fun b!1452463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98467 (_ BitVec 32)) SeekEntryResult!11667)

(assert (=> b!1452463 (= e!817927 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637040 lt!637042 mask!2687) (seekEntryOrOpen!0 lt!637040 lt!637042 mask!2687)))))

(declare-fun b!1452464 () Bool)

(declare-fun res!982904 () Bool)

(assert (=> b!1452464 (=> (not res!982904) (not e!817929))))

(assert (=> b!1452464 (= res!982904 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48069 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48069 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48069 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452465 () Bool)

(declare-fun res!982910 () Bool)

(assert (=> b!1452465 (=> (not res!982910) (not e!817929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98467 (_ BitVec 32)) Bool)

(assert (=> b!1452465 (= res!982910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452466 () Bool)

(declare-fun res!982907 () Bool)

(assert (=> b!1452466 (=> (not res!982907) (not e!817929))))

(assert (=> b!1452466 (= res!982907 (and (= (size!48069 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48069 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48069 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452467 () Bool)

(assert (=> b!1452467 (= e!817927 (= lt!637041 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637040 lt!637042 mask!2687)))))

(declare-fun b!1452468 () Bool)

(assert (=> b!1452468 (= e!817931 (not true))))

(assert (=> b!1452468 e!817928))

(declare-fun res!982909 () Bool)

(assert (=> b!1452468 (=> (not res!982909) (not e!817928))))

(assert (=> b!1452468 (= res!982909 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48863 0))(
  ( (Unit!48864) )
))
(declare-fun lt!637039 () Unit!48863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48863)

(assert (=> b!1452468 (= lt!637039 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452469 () Bool)

(declare-fun res!982912 () Bool)

(assert (=> b!1452469 (=> (not res!982912) (not e!817929))))

(assert (=> b!1452469 (= res!982912 (validKeyInArray!0 (select (arr!47518 a!2862) j!93)))))

(assert (= (and start!125124 res!982906) b!1452466))

(assert (= (and b!1452466 res!982907) b!1452461))

(assert (= (and b!1452461 res!982900) b!1452469))

(assert (= (and b!1452469 res!982912) b!1452465))

(assert (= (and b!1452465 res!982910) b!1452459))

(assert (= (and b!1452459 res!982903) b!1452464))

(assert (= (and b!1452464 res!982904) b!1452454))

(assert (= (and b!1452454 res!982911) b!1452457))

(assert (= (and b!1452457 res!982905) b!1452456))

(assert (= (and b!1452456 res!982901) b!1452453))

(assert (= (and b!1452453 res!982908) b!1452455))

(assert (= (and b!1452455 c!134296) b!1452467))

(assert (= (and b!1452455 (not c!134296)) b!1452463))

(assert (= (and b!1452455 res!982913) b!1452460))

(assert (= (and b!1452460 res!982899) b!1452468))

(assert (= (and b!1452468 res!982909) b!1452462))

(assert (= (and b!1452462 res!982902) b!1452458))

(declare-fun m!1341169 () Bool)

(assert (=> b!1452459 m!1341169))

(declare-fun m!1341171 () Bool)

(assert (=> b!1452461 m!1341171))

(assert (=> b!1452461 m!1341171))

(declare-fun m!1341173 () Bool)

(assert (=> b!1452461 m!1341173))

(declare-fun m!1341175 () Bool)

(assert (=> b!1452463 m!1341175))

(declare-fun m!1341177 () Bool)

(assert (=> b!1452463 m!1341177))

(declare-fun m!1341179 () Bool)

(assert (=> b!1452453 m!1341179))

(assert (=> b!1452453 m!1341179))

(declare-fun m!1341181 () Bool)

(assert (=> b!1452453 m!1341181))

(declare-fun m!1341183 () Bool)

(assert (=> b!1452453 m!1341183))

(declare-fun m!1341185 () Bool)

(assert (=> b!1452453 m!1341185))

(assert (=> b!1452458 m!1341183))

(declare-fun m!1341187 () Bool)

(assert (=> b!1452458 m!1341187))

(declare-fun m!1341189 () Bool)

(assert (=> b!1452458 m!1341189))

(declare-fun m!1341191 () Bool)

(assert (=> b!1452458 m!1341191))

(declare-fun m!1341193 () Bool)

(assert (=> b!1452458 m!1341193))

(declare-fun m!1341195 () Bool)

(assert (=> start!125124 m!1341195))

(declare-fun m!1341197 () Bool)

(assert (=> start!125124 m!1341197))

(assert (=> b!1452462 m!1341193))

(assert (=> b!1452462 m!1341193))

(declare-fun m!1341199 () Bool)

(assert (=> b!1452462 m!1341199))

(declare-fun m!1341201 () Bool)

(assert (=> b!1452468 m!1341201))

(declare-fun m!1341203 () Bool)

(assert (=> b!1452468 m!1341203))

(assert (=> b!1452469 m!1341193))

(assert (=> b!1452469 m!1341193))

(declare-fun m!1341205 () Bool)

(assert (=> b!1452469 m!1341205))

(declare-fun m!1341207 () Bool)

(assert (=> b!1452465 m!1341207))

(assert (=> b!1452456 m!1341193))

(assert (=> b!1452456 m!1341193))

(declare-fun m!1341209 () Bool)

(assert (=> b!1452456 m!1341209))

(assert (=> b!1452457 m!1341193))

(assert (=> b!1452457 m!1341193))

(declare-fun m!1341211 () Bool)

(assert (=> b!1452457 m!1341211))

(assert (=> b!1452457 m!1341211))

(assert (=> b!1452457 m!1341193))

(declare-fun m!1341213 () Bool)

(assert (=> b!1452457 m!1341213))

(assert (=> b!1452454 m!1341183))

(declare-fun m!1341215 () Bool)

(assert (=> b!1452454 m!1341215))

(declare-fun m!1341217 () Bool)

(assert (=> b!1452467 m!1341217))

(check-sat (not b!1452461) (not b!1452467) (not b!1452456) (not b!1452468) (not b!1452457) (not b!1452459) (not start!125124) (not b!1452453) (not b!1452463) (not b!1452465) (not b!1452462) (not b!1452469))
(check-sat)
