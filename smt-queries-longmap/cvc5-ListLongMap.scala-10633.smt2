; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124936 () Bool)

(assert start!124936)

(declare-fun b!1451900 () Bool)

(declare-fun res!983085 () Bool)

(declare-fun e!817412 () Bool)

(assert (=> b!1451900 (=> (not res!983085) (not e!817412))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98384 0))(
  ( (array!98385 (arr!47480 (Array (_ BitVec 32) (_ BitVec 64))) (size!48030 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98384)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1451900 (= res!983085 (and (= (size!48030 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48030 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48030 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451901 () Bool)

(declare-fun res!983084 () Bool)

(declare-fun e!817417 () Bool)

(assert (=> b!1451901 (=> (not res!983084) (not e!817417))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451901 (= res!983084 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1451902 () Bool)

(declare-fun e!817418 () Bool)

(assert (=> b!1451902 (= e!817418 (and (or (= (select (arr!47480 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47480 a!2862) intermediateBeforeIndex!19) (select (arr!47480 a!2862) j!93))) (or (and (= (select (arr!47480 a!2862) index!646) (select (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47480 a!2862) index!646) (select (arr!47480 a!2862) j!93))) (= (select (arr!47480 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451903 () Bool)

(declare-fun res!983082 () Bool)

(assert (=> b!1451903 (=> (not res!983082) (not e!817418))))

(declare-datatypes ((SeekEntryResult!11732 0))(
  ( (MissingZero!11732 (index!49320 (_ BitVec 32))) (Found!11732 (index!49321 (_ BitVec 32))) (Intermediate!11732 (undefined!12544 Bool) (index!49322 (_ BitVec 32)) (x!130973 (_ BitVec 32))) (Undefined!11732) (MissingVacant!11732 (index!49323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98384 (_ BitVec 32)) SeekEntryResult!11732)

(assert (=> b!1451903 (= res!983082 (= (seekEntryOrOpen!0 (select (arr!47480 a!2862) j!93) a!2862 mask!2687) (Found!11732 j!93)))))

(declare-fun b!1451904 () Bool)

(declare-fun res!983092 () Bool)

(assert (=> b!1451904 (=> (not res!983092) (not e!817417))))

(declare-fun e!817413 () Bool)

(assert (=> b!1451904 (= res!983092 e!817413)))

(declare-fun c!133920 () Bool)

(assert (=> b!1451904 (= c!133920 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451905 () Bool)

(declare-fun e!817414 () Bool)

(assert (=> b!1451905 (= e!817414 e!817417)))

(declare-fun res!983081 () Bool)

(assert (=> b!1451905 (=> (not res!983081) (not e!817417))))

(declare-fun lt!636789 () SeekEntryResult!11732)

(assert (=> b!1451905 (= res!983081 (= lt!636789 (Intermediate!11732 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636787 () array!98384)

(declare-fun lt!636788 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98384 (_ BitVec 32)) SeekEntryResult!11732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451905 (= lt!636789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636788 mask!2687) lt!636788 lt!636787 mask!2687))))

(assert (=> b!1451905 (= lt!636788 (select (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451906 () Bool)

(declare-fun res!983095 () Bool)

(assert (=> b!1451906 (=> (not res!983095) (not e!817412))))

(declare-datatypes ((List!33981 0))(
  ( (Nil!33978) (Cons!33977 (h!35327 (_ BitVec 64)) (t!48675 List!33981)) )
))
(declare-fun arrayNoDuplicates!0 (array!98384 (_ BitVec 32) List!33981) Bool)

(assert (=> b!1451906 (= res!983095 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33978))))

(declare-fun res!983087 () Bool)

(assert (=> start!124936 (=> (not res!983087) (not e!817412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124936 (= res!983087 (validMask!0 mask!2687))))

(assert (=> start!124936 e!817412))

(assert (=> start!124936 true))

(declare-fun array_inv!36508 (array!98384) Bool)

(assert (=> start!124936 (array_inv!36508 a!2862)))

(declare-fun b!1451907 () Bool)

(declare-fun res!983090 () Bool)

(assert (=> b!1451907 (=> (not res!983090) (not e!817412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98384 (_ BitVec 32)) Bool)

(assert (=> b!1451907 (= res!983090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451908 () Bool)

(declare-fun res!983091 () Bool)

(assert (=> b!1451908 (=> (not res!983091) (not e!817412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451908 (= res!983091 (validKeyInArray!0 (select (arr!47480 a!2862) j!93)))))

(declare-fun b!1451909 () Bool)

(declare-fun res!983088 () Bool)

(assert (=> b!1451909 (=> (not res!983088) (not e!817412))))

(assert (=> b!1451909 (= res!983088 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48030 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48030 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48030 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451910 () Bool)

(assert (=> b!1451910 (= e!817417 (not (or (and (= (select (arr!47480 a!2862) index!646) (select (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47480 a!2862) index!646) (select (arr!47480 a!2862) j!93))) (= (select (arr!47480 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1451910 e!817418))

(declare-fun res!983093 () Bool)

(assert (=> b!1451910 (=> (not res!983093) (not e!817418))))

(assert (=> b!1451910 (= res!983093 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48960 0))(
  ( (Unit!48961) )
))
(declare-fun lt!636785 () Unit!48960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48960)

(assert (=> b!1451910 (= lt!636785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451911 () Bool)

(assert (=> b!1451911 (= e!817413 (= lt!636789 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636788 lt!636787 mask!2687)))))

(declare-fun b!1451912 () Bool)

(declare-fun res!983094 () Bool)

(assert (=> b!1451912 (=> (not res!983094) (not e!817414))))

(declare-fun lt!636786 () SeekEntryResult!11732)

(assert (=> b!1451912 (= res!983094 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47480 a!2862) j!93) a!2862 mask!2687) lt!636786))))

(declare-fun b!1451913 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98384 (_ BitVec 32)) SeekEntryResult!11732)

(assert (=> b!1451913 (= e!817413 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636788 lt!636787 mask!2687) (seekEntryOrOpen!0 lt!636788 lt!636787 mask!2687)))))

(declare-fun b!1451914 () Bool)

(declare-fun e!817415 () Bool)

(assert (=> b!1451914 (= e!817412 e!817415)))

(declare-fun res!983089 () Bool)

(assert (=> b!1451914 (=> (not res!983089) (not e!817415))))

(assert (=> b!1451914 (= res!983089 (= (select (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451914 (= lt!636787 (array!98385 (store (arr!47480 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48030 a!2862)))))

(declare-fun b!1451915 () Bool)

(declare-fun res!983086 () Bool)

(assert (=> b!1451915 (=> (not res!983086) (not e!817412))))

(assert (=> b!1451915 (= res!983086 (validKeyInArray!0 (select (arr!47480 a!2862) i!1006)))))

(declare-fun b!1451916 () Bool)

(assert (=> b!1451916 (= e!817415 e!817414)))

(declare-fun res!983083 () Bool)

(assert (=> b!1451916 (=> (not res!983083) (not e!817414))))

(assert (=> b!1451916 (= res!983083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47480 a!2862) j!93) mask!2687) (select (arr!47480 a!2862) j!93) a!2862 mask!2687) lt!636786))))

(assert (=> b!1451916 (= lt!636786 (Intermediate!11732 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124936 res!983087) b!1451900))

(assert (= (and b!1451900 res!983085) b!1451915))

(assert (= (and b!1451915 res!983086) b!1451908))

(assert (= (and b!1451908 res!983091) b!1451907))

(assert (= (and b!1451907 res!983090) b!1451906))

(assert (= (and b!1451906 res!983095) b!1451909))

(assert (= (and b!1451909 res!983088) b!1451914))

(assert (= (and b!1451914 res!983089) b!1451916))

(assert (= (and b!1451916 res!983083) b!1451912))

(assert (= (and b!1451912 res!983094) b!1451905))

(assert (= (and b!1451905 res!983081) b!1451904))

(assert (= (and b!1451904 c!133920) b!1451911))

(assert (= (and b!1451904 (not c!133920)) b!1451913))

(assert (= (and b!1451904 res!983092) b!1451901))

(assert (= (and b!1451901 res!983084) b!1451910))

(assert (= (and b!1451910 res!983093) b!1451903))

(assert (= (and b!1451903 res!983082) b!1451902))

(declare-fun m!1340485 () Bool)

(assert (=> b!1451908 m!1340485))

(assert (=> b!1451908 m!1340485))

(declare-fun m!1340487 () Bool)

(assert (=> b!1451908 m!1340487))

(declare-fun m!1340489 () Bool)

(assert (=> b!1451910 m!1340489))

(declare-fun m!1340491 () Bool)

(assert (=> b!1451910 m!1340491))

(declare-fun m!1340493 () Bool)

(assert (=> b!1451910 m!1340493))

(declare-fun m!1340495 () Bool)

(assert (=> b!1451910 m!1340495))

(declare-fun m!1340497 () Bool)

(assert (=> b!1451910 m!1340497))

(assert (=> b!1451910 m!1340485))

(declare-fun m!1340499 () Bool)

(assert (=> b!1451915 m!1340499))

(assert (=> b!1451915 m!1340499))

(declare-fun m!1340501 () Bool)

(assert (=> b!1451915 m!1340501))

(assert (=> b!1451916 m!1340485))

(assert (=> b!1451916 m!1340485))

(declare-fun m!1340503 () Bool)

(assert (=> b!1451916 m!1340503))

(assert (=> b!1451916 m!1340503))

(assert (=> b!1451916 m!1340485))

(declare-fun m!1340505 () Bool)

(assert (=> b!1451916 m!1340505))

(declare-fun m!1340507 () Bool)

(assert (=> b!1451907 m!1340507))

(declare-fun m!1340509 () Bool)

(assert (=> b!1451911 m!1340509))

(declare-fun m!1340511 () Bool)

(assert (=> start!124936 m!1340511))

(declare-fun m!1340513 () Bool)

(assert (=> start!124936 m!1340513))

(declare-fun m!1340515 () Bool)

(assert (=> b!1451905 m!1340515))

(assert (=> b!1451905 m!1340515))

(declare-fun m!1340517 () Bool)

(assert (=> b!1451905 m!1340517))

(assert (=> b!1451905 m!1340491))

(declare-fun m!1340519 () Bool)

(assert (=> b!1451905 m!1340519))

(declare-fun m!1340521 () Bool)

(assert (=> b!1451913 m!1340521))

(declare-fun m!1340523 () Bool)

(assert (=> b!1451913 m!1340523))

(assert (=> b!1451914 m!1340491))

(declare-fun m!1340525 () Bool)

(assert (=> b!1451914 m!1340525))

(declare-fun m!1340527 () Bool)

(assert (=> b!1451906 m!1340527))

(assert (=> b!1451912 m!1340485))

(assert (=> b!1451912 m!1340485))

(declare-fun m!1340529 () Bool)

(assert (=> b!1451912 m!1340529))

(assert (=> b!1451902 m!1340491))

(declare-fun m!1340531 () Bool)

(assert (=> b!1451902 m!1340531))

(assert (=> b!1451902 m!1340493))

(assert (=> b!1451902 m!1340495))

(assert (=> b!1451902 m!1340485))

(assert (=> b!1451903 m!1340485))

(assert (=> b!1451903 m!1340485))

(declare-fun m!1340533 () Bool)

(assert (=> b!1451903 m!1340533))

(push 1)

