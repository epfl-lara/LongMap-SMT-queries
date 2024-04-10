; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125048 () Bool)

(assert start!125048)

(declare-fun b!1455228 () Bool)

(declare-fun e!818884 () Bool)

(declare-fun e!818882 () Bool)

(assert (=> b!1455228 (= e!818884 e!818882)))

(declare-fun res!985945 () Bool)

(assert (=> b!1455228 (=> res!985945 e!818882)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98496 0))(
  ( (array!98497 (arr!47536 (Array (_ BitVec 32) (_ BitVec 64))) (size!48086 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98496)

(declare-fun lt!637879 () (_ BitVec 32))

(assert (=> b!1455228 (= res!985945 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637879 #b00000000000000000000000000000000) (bvsge lt!637879 (size!48086 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455228 (= lt!637879 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!11788 0))(
  ( (MissingZero!11788 (index!49544 (_ BitVec 32))) (Found!11788 (index!49545 (_ BitVec 32))) (Intermediate!11788 (undefined!12600 Bool) (index!49546 (_ BitVec 32)) (x!131173 (_ BitVec 32))) (Undefined!11788) (MissingVacant!11788 (index!49547 (_ BitVec 32))) )
))
(declare-fun lt!637874 () SeekEntryResult!11788)

(declare-fun lt!637876 () array!98496)

(declare-fun lt!637875 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98496 (_ BitVec 32)) SeekEntryResult!11788)

(assert (=> b!1455228 (= lt!637874 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637875 lt!637876 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98496 (_ BitVec 32)) SeekEntryResult!11788)

(assert (=> b!1455228 (= lt!637874 (seekEntryOrOpen!0 lt!637875 lt!637876 mask!2687))))

(declare-fun b!1455229 () Bool)

(declare-fun res!985948 () Bool)

(declare-fun e!818891 () Bool)

(assert (=> b!1455229 (=> (not res!985948) (not e!818891))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455229 (= res!985948 (and (= (size!48086 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48086 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48086 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455230 () Bool)

(declare-fun res!985946 () Bool)

(declare-fun e!818885 () Bool)

(assert (=> b!1455230 (=> (not res!985946) (not e!818885))))

(declare-fun e!818888 () Bool)

(assert (=> b!1455230 (= res!985946 e!818888)))

(declare-fun c!134160 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455230 (= c!134160 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455231 () Bool)

(declare-fun res!985936 () Bool)

(assert (=> b!1455231 (=> (not res!985936) (not e!818891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455231 (= res!985936 (validKeyInArray!0 (select (arr!47536 a!2862) j!93)))))

(declare-fun lt!637880 () SeekEntryResult!11788)

(declare-fun b!1455232 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98496 (_ BitVec 32)) SeekEntryResult!11788)

(assert (=> b!1455232 (= e!818888 (= lt!637880 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637875 lt!637876 mask!2687)))))

(declare-fun b!1455233 () Bool)

(assert (=> b!1455233 (= e!818882 true)))

(declare-fun lt!637878 () Bool)

(declare-fun e!818886 () Bool)

(assert (=> b!1455233 (= lt!637878 e!818886)))

(declare-fun c!134159 () Bool)

(assert (=> b!1455233 (= c!134159 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455234 () Bool)

(declare-fun res!985942 () Bool)

(assert (=> b!1455234 (=> (not res!985942) (not e!818891))))

(assert (=> b!1455234 (= res!985942 (validKeyInArray!0 (select (arr!47536 a!2862) i!1006)))))

(declare-fun b!1455235 () Bool)

(assert (=> b!1455235 (= e!818886 (not (= lt!637880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637879 lt!637875 lt!637876 mask!2687))))))

(declare-fun b!1455236 () Bool)

(assert (=> b!1455236 (= e!818885 (not e!818884))))

(declare-fun res!985937 () Bool)

(assert (=> b!1455236 (=> res!985937 e!818884)))

(assert (=> b!1455236 (= res!985937 (or (and (= (select (arr!47536 a!2862) index!646) (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47536 a!2862) index!646) (select (arr!47536 a!2862) j!93))) (= (select (arr!47536 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818883 () Bool)

(assert (=> b!1455236 e!818883))

(declare-fun res!985932 () Bool)

(assert (=> b!1455236 (=> (not res!985932) (not e!818883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98496 (_ BitVec 32)) Bool)

(assert (=> b!1455236 (= res!985932 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49072 0))(
  ( (Unit!49073) )
))
(declare-fun lt!637881 () Unit!49072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49072)

(assert (=> b!1455236 (= lt!637881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455237 () Bool)

(assert (=> b!1455237 (= e!818886 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637879 intermediateAfterIndex!19 lt!637875 lt!637876 mask!2687) lt!637874)))))

(declare-fun b!1455238 () Bool)

(declare-fun res!985934 () Bool)

(assert (=> b!1455238 (=> (not res!985934) (not e!818891))))

(assert (=> b!1455238 (= res!985934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455239 () Bool)

(declare-fun e!818889 () Bool)

(assert (=> b!1455239 (= e!818891 e!818889)))

(declare-fun res!985940 () Bool)

(assert (=> b!1455239 (=> (not res!985940) (not e!818889))))

(assert (=> b!1455239 (= res!985940 (= (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455239 (= lt!637876 (array!98497 (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48086 a!2862)))))

(declare-fun b!1455240 () Bool)

(declare-fun res!985931 () Bool)

(assert (=> b!1455240 (=> (not res!985931) (not e!818885))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455240 (= res!985931 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455241 () Bool)

(assert (=> b!1455241 (= e!818888 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637875 lt!637876 mask!2687) (seekEntryOrOpen!0 lt!637875 lt!637876 mask!2687)))))

(declare-fun b!1455243 () Bool)

(declare-fun res!985939 () Bool)

(declare-fun e!818890 () Bool)

(assert (=> b!1455243 (=> (not res!985939) (not e!818890))))

(declare-fun lt!637877 () SeekEntryResult!11788)

(assert (=> b!1455243 (= res!985939 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!637877))))

(declare-fun b!1455244 () Bool)

(assert (=> b!1455244 (= e!818890 e!818885)))

(declare-fun res!985947 () Bool)

(assert (=> b!1455244 (=> (not res!985947) (not e!818885))))

(assert (=> b!1455244 (= res!985947 (= lt!637880 (Intermediate!11788 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455244 (= lt!637880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637875 mask!2687) lt!637875 lt!637876 mask!2687))))

(assert (=> b!1455244 (= lt!637875 (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455245 () Bool)

(declare-fun res!985941 () Bool)

(assert (=> b!1455245 (=> (not res!985941) (not e!818891))))

(declare-datatypes ((List!34037 0))(
  ( (Nil!34034) (Cons!34033 (h!35383 (_ BitVec 64)) (t!48731 List!34037)) )
))
(declare-fun arrayNoDuplicates!0 (array!98496 (_ BitVec 32) List!34037) Bool)

(assert (=> b!1455245 (= res!985941 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34034))))

(declare-fun b!1455246 () Bool)

(assert (=> b!1455246 (= e!818889 e!818890)))

(declare-fun res!985935 () Bool)

(assert (=> b!1455246 (=> (not res!985935) (not e!818890))))

(assert (=> b!1455246 (= res!985935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47536 a!2862) j!93) mask!2687) (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!637877))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1455246 (= lt!637877 (Intermediate!11788 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455247 () Bool)

(declare-fun res!985944 () Bool)

(assert (=> b!1455247 (=> (not res!985944) (not e!818883))))

(assert (=> b!1455247 (= res!985944 (= (seekEntryOrOpen!0 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) (Found!11788 j!93)))))

(declare-fun res!985938 () Bool)

(assert (=> start!125048 (=> (not res!985938) (not e!818891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125048 (= res!985938 (validMask!0 mask!2687))))

(assert (=> start!125048 e!818891))

(assert (=> start!125048 true))

(declare-fun array_inv!36564 (array!98496) Bool)

(assert (=> start!125048 (array_inv!36564 a!2862)))

(declare-fun b!1455242 () Bool)

(declare-fun res!985943 () Bool)

(assert (=> b!1455242 (=> res!985943 e!818882)))

(assert (=> b!1455242 (= res!985943 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637879 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!637877)))))

(declare-fun b!1455248 () Bool)

(declare-fun res!985933 () Bool)

(assert (=> b!1455248 (=> (not res!985933) (not e!818891))))

(assert (=> b!1455248 (= res!985933 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48086 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48086 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48086 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455249 () Bool)

(assert (=> b!1455249 (= e!818883 (and (or (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) (select (arr!47536 a!2862) j!93))) (let ((bdg!53131 (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47536 a!2862) index!646) bdg!53131) (= (select (arr!47536 a!2862) index!646) (select (arr!47536 a!2862) j!93))) (= (select (arr!47536 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53131 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125048 res!985938) b!1455229))

(assert (= (and b!1455229 res!985948) b!1455234))

(assert (= (and b!1455234 res!985942) b!1455231))

(assert (= (and b!1455231 res!985936) b!1455238))

(assert (= (and b!1455238 res!985934) b!1455245))

(assert (= (and b!1455245 res!985941) b!1455248))

(assert (= (and b!1455248 res!985933) b!1455239))

(assert (= (and b!1455239 res!985940) b!1455246))

(assert (= (and b!1455246 res!985935) b!1455243))

(assert (= (and b!1455243 res!985939) b!1455244))

(assert (= (and b!1455244 res!985947) b!1455230))

(assert (= (and b!1455230 c!134160) b!1455232))

(assert (= (and b!1455230 (not c!134160)) b!1455241))

(assert (= (and b!1455230 res!985946) b!1455240))

(assert (= (and b!1455240 res!985931) b!1455236))

(assert (= (and b!1455236 res!985932) b!1455247))

(assert (= (and b!1455247 res!985944) b!1455249))

(assert (= (and b!1455236 (not res!985937)) b!1455228))

(assert (= (and b!1455228 (not res!985945)) b!1455242))

(assert (= (and b!1455242 (not res!985943)) b!1455233))

(assert (= (and b!1455233 c!134159) b!1455235))

(assert (= (and b!1455233 (not c!134159)) b!1455237))

(declare-fun m!1343475 () Bool)

(assert (=> b!1455247 m!1343475))

(assert (=> b!1455247 m!1343475))

(declare-fun m!1343477 () Bool)

(assert (=> b!1455247 m!1343477))

(declare-fun m!1343479 () Bool)

(assert (=> b!1455241 m!1343479))

(declare-fun m!1343481 () Bool)

(assert (=> b!1455241 m!1343481))

(assert (=> b!1455243 m!1343475))

(assert (=> b!1455243 m!1343475))

(declare-fun m!1343483 () Bool)

(assert (=> b!1455243 m!1343483))

(assert (=> b!1455246 m!1343475))

(assert (=> b!1455246 m!1343475))

(declare-fun m!1343485 () Bool)

(assert (=> b!1455246 m!1343485))

(assert (=> b!1455246 m!1343485))

(assert (=> b!1455246 m!1343475))

(declare-fun m!1343487 () Bool)

(assert (=> b!1455246 m!1343487))

(declare-fun m!1343489 () Bool)

(assert (=> b!1455239 m!1343489))

(declare-fun m!1343491 () Bool)

(assert (=> b!1455239 m!1343491))

(declare-fun m!1343493 () Bool)

(assert (=> b!1455238 m!1343493))

(assert (=> b!1455242 m!1343475))

(assert (=> b!1455242 m!1343475))

(declare-fun m!1343495 () Bool)

(assert (=> b!1455242 m!1343495))

(declare-fun m!1343497 () Bool)

(assert (=> b!1455244 m!1343497))

(assert (=> b!1455244 m!1343497))

(declare-fun m!1343499 () Bool)

(assert (=> b!1455244 m!1343499))

(assert (=> b!1455244 m!1343489))

(declare-fun m!1343501 () Bool)

(assert (=> b!1455244 m!1343501))

(declare-fun m!1343503 () Bool)

(assert (=> b!1455232 m!1343503))

(assert (=> b!1455231 m!1343475))

(assert (=> b!1455231 m!1343475))

(declare-fun m!1343505 () Bool)

(assert (=> b!1455231 m!1343505))

(declare-fun m!1343507 () Bool)

(assert (=> b!1455234 m!1343507))

(assert (=> b!1455234 m!1343507))

(declare-fun m!1343509 () Bool)

(assert (=> b!1455234 m!1343509))

(declare-fun m!1343511 () Bool)

(assert (=> start!125048 m!1343511))

(declare-fun m!1343513 () Bool)

(assert (=> start!125048 m!1343513))

(declare-fun m!1343515 () Bool)

(assert (=> b!1455235 m!1343515))

(declare-fun m!1343517 () Bool)

(assert (=> b!1455236 m!1343517))

(assert (=> b!1455236 m!1343489))

(declare-fun m!1343519 () Bool)

(assert (=> b!1455236 m!1343519))

(declare-fun m!1343521 () Bool)

(assert (=> b!1455236 m!1343521))

(declare-fun m!1343523 () Bool)

(assert (=> b!1455236 m!1343523))

(assert (=> b!1455236 m!1343475))

(declare-fun m!1343525 () Bool)

(assert (=> b!1455245 m!1343525))

(declare-fun m!1343527 () Bool)

(assert (=> b!1455228 m!1343527))

(assert (=> b!1455228 m!1343479))

(assert (=> b!1455228 m!1343481))

(declare-fun m!1343529 () Bool)

(assert (=> b!1455237 m!1343529))

(assert (=> b!1455249 m!1343489))

(declare-fun m!1343531 () Bool)

(assert (=> b!1455249 m!1343531))

(assert (=> b!1455249 m!1343519))

(assert (=> b!1455249 m!1343521))

(assert (=> b!1455249 m!1343475))

(push 1)

