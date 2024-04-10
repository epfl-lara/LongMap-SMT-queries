; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124978 () Bool)

(assert start!124978)

(declare-fun b!1452986 () Bool)

(declare-fun res!984053 () Bool)

(declare-fun e!817871 () Bool)

(assert (=> b!1452986 (=> (not res!984053) (not e!817871))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452986 (= res!984053 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452987 () Bool)

(declare-fun res!984043 () Bool)

(declare-fun e!817867 () Bool)

(assert (=> b!1452987 (=> (not res!984043) (not e!817867))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98426 0))(
  ( (array!98427 (arr!47501 (Array (_ BitVec 32) (_ BitVec 64))) (size!48051 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98426)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1452987 (= res!984043 (or (= (select (arr!47501 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47501 a!2862) intermediateBeforeIndex!19) (select (arr!47501 a!2862) j!93))))))

(declare-fun b!1452988 () Bool)

(assert (=> b!1452988 (= e!817871 (not true))))

(assert (=> b!1452988 e!817867))

(declare-fun res!984055 () Bool)

(assert (=> b!1452988 (=> (not res!984055) (not e!817867))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98426 (_ BitVec 32)) Bool)

(assert (=> b!1452988 (= res!984055 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49002 0))(
  ( (Unit!49003) )
))
(declare-fun lt!637104 () Unit!49002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49002)

(assert (=> b!1452988 (= lt!637104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452989 () Bool)

(declare-fun res!984051 () Bool)

(assert (=> b!1452989 (=> (not res!984051) (not e!817871))))

(declare-fun e!817873 () Bool)

(assert (=> b!1452989 (= res!984051 e!817873)))

(declare-fun c!133983 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452989 (= c!133983 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452990 () Bool)

(declare-fun res!984058 () Bool)

(declare-fun e!817866 () Bool)

(assert (=> b!1452990 (=> (not res!984058) (not e!817866))))

(declare-datatypes ((List!34002 0))(
  ( (Nil!33999) (Cons!33998 (h!35348 (_ BitVec 64)) (t!48696 List!34002)) )
))
(declare-fun arrayNoDuplicates!0 (array!98426 (_ BitVec 32) List!34002) Bool)

(assert (=> b!1452990 (= res!984058 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33999))))

(declare-fun b!1452991 () Bool)

(declare-fun e!817870 () Bool)

(assert (=> b!1452991 (= e!817870 e!817871)))

(declare-fun res!984056 () Bool)

(assert (=> b!1452991 (=> (not res!984056) (not e!817871))))

(declare-datatypes ((SeekEntryResult!11753 0))(
  ( (MissingZero!11753 (index!49404 (_ BitVec 32))) (Found!11753 (index!49405 (_ BitVec 32))) (Intermediate!11753 (undefined!12565 Bool) (index!49406 (_ BitVec 32)) (x!131050 (_ BitVec 32))) (Undefined!11753) (MissingVacant!11753 (index!49407 (_ BitVec 32))) )
))
(declare-fun lt!637106 () SeekEntryResult!11753)

(assert (=> b!1452991 (= res!984056 (= lt!637106 (Intermediate!11753 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637105 () array!98426)

(declare-fun lt!637107 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98426 (_ BitVec 32)) SeekEntryResult!11753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452991 (= lt!637106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637107 mask!2687) lt!637107 lt!637105 mask!2687))))

(assert (=> b!1452991 (= lt!637107 (select (store (arr!47501 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452992 () Bool)

(declare-fun e!817869 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98426 (_ BitVec 32)) SeekEntryResult!11753)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98426 (_ BitVec 32)) SeekEntryResult!11753)

(assert (=> b!1452992 (= e!817869 (= (seekEntryOrOpen!0 lt!637107 lt!637105 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637107 lt!637105 mask!2687)))))

(declare-fun b!1452993 () Bool)

(declare-fun res!984045 () Bool)

(assert (=> b!1452993 (=> (not res!984045) (not e!817866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452993 (= res!984045 (validKeyInArray!0 (select (arr!47501 a!2862) j!93)))))

(declare-fun b!1452994 () Bool)

(assert (=> b!1452994 (= e!817873 (= lt!637106 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637107 lt!637105 mask!2687)))))

(declare-fun res!984057 () Bool)

(assert (=> start!124978 (=> (not res!984057) (not e!817866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124978 (= res!984057 (validMask!0 mask!2687))))

(assert (=> start!124978 e!817866))

(assert (=> start!124978 true))

(declare-fun array_inv!36529 (array!98426) Bool)

(assert (=> start!124978 (array_inv!36529 a!2862)))

(declare-fun b!1452995 () Bool)

(declare-fun e!817868 () Bool)

(assert (=> b!1452995 (= e!817867 e!817868)))

(declare-fun res!984054 () Bool)

(assert (=> b!1452995 (=> res!984054 e!817868)))

(declare-fun lt!637102 () (_ BitVec 64))

(assert (=> b!1452995 (= res!984054 (or (and (= (select (arr!47501 a!2862) index!646) lt!637102) (= (select (arr!47501 a!2862) index!646) (select (arr!47501 a!2862) j!93))) (= (select (arr!47501 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1452995 (= lt!637102 (select (store (arr!47501 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1452996 () Bool)

(declare-fun e!817872 () Bool)

(assert (=> b!1452996 (= e!817872 e!817870)))

(declare-fun res!984052 () Bool)

(assert (=> b!1452996 (=> (not res!984052) (not e!817870))))

(declare-fun lt!637103 () SeekEntryResult!11753)

(assert (=> b!1452996 (= res!984052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47501 a!2862) j!93) mask!2687) (select (arr!47501 a!2862) j!93) a!2862 mask!2687) lt!637103))))

(assert (=> b!1452996 (= lt!637103 (Intermediate!11753 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452997 () Bool)

(declare-fun res!984047 () Bool)

(assert (=> b!1452997 (=> (not res!984047) (not e!817866))))

(assert (=> b!1452997 (= res!984047 (and (= (size!48051 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48051 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48051 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452998 () Bool)

(declare-fun res!984048 () Bool)

(assert (=> b!1452998 (=> (not res!984048) (not e!817867))))

(assert (=> b!1452998 (= res!984048 (= (seekEntryOrOpen!0 (select (arr!47501 a!2862) j!93) a!2862 mask!2687) (Found!11753 j!93)))))

(declare-fun b!1452999 () Bool)

(assert (=> b!1452999 (= e!817868 e!817869)))

(declare-fun res!984046 () Bool)

(assert (=> b!1452999 (=> (not res!984046) (not e!817869))))

(assert (=> b!1452999 (= res!984046 (and (= index!646 intermediateAfterIndex!19) (= lt!637102 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453000 () Bool)

(declare-fun res!984049 () Bool)

(assert (=> b!1453000 (=> (not res!984049) (not e!817866))))

(assert (=> b!1453000 (= res!984049 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48051 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48051 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48051 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453001 () Bool)

(declare-fun res!984041 () Bool)

(assert (=> b!1453001 (=> (not res!984041) (not e!817866))))

(assert (=> b!1453001 (= res!984041 (validKeyInArray!0 (select (arr!47501 a!2862) i!1006)))))

(declare-fun b!1453002 () Bool)

(assert (=> b!1453002 (= e!817873 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637107 lt!637105 mask!2687) (seekEntryOrOpen!0 lt!637107 lt!637105 mask!2687)))))

(declare-fun b!1453003 () Bool)

(declare-fun res!984044 () Bool)

(assert (=> b!1453003 (=> (not res!984044) (not e!817870))))

(assert (=> b!1453003 (= res!984044 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47501 a!2862) j!93) a!2862 mask!2687) lt!637103))))

(declare-fun b!1453004 () Bool)

(declare-fun res!984050 () Bool)

(assert (=> b!1453004 (=> (not res!984050) (not e!817866))))

(assert (=> b!1453004 (= res!984050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453005 () Bool)

(assert (=> b!1453005 (= e!817866 e!817872)))

(declare-fun res!984042 () Bool)

(assert (=> b!1453005 (=> (not res!984042) (not e!817872))))

(assert (=> b!1453005 (= res!984042 (= (select (store (arr!47501 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453005 (= lt!637105 (array!98427 (store (arr!47501 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48051 a!2862)))))

(assert (= (and start!124978 res!984057) b!1452997))

(assert (= (and b!1452997 res!984047) b!1453001))

(assert (= (and b!1453001 res!984041) b!1452993))

(assert (= (and b!1452993 res!984045) b!1453004))

(assert (= (and b!1453004 res!984050) b!1452990))

(assert (= (and b!1452990 res!984058) b!1453000))

(assert (= (and b!1453000 res!984049) b!1453005))

(assert (= (and b!1453005 res!984042) b!1452996))

(assert (= (and b!1452996 res!984052) b!1453003))

(assert (= (and b!1453003 res!984044) b!1452991))

(assert (= (and b!1452991 res!984056) b!1452989))

(assert (= (and b!1452989 c!133983) b!1452994))

(assert (= (and b!1452989 (not c!133983)) b!1453002))

(assert (= (and b!1452989 res!984051) b!1452986))

(assert (= (and b!1452986 res!984053) b!1452988))

(assert (= (and b!1452988 res!984055) b!1452998))

(assert (= (and b!1452998 res!984048) b!1452987))

(assert (= (and b!1452987 res!984043) b!1452995))

(assert (= (and b!1452995 (not res!984054)) b!1452999))

(assert (= (and b!1452999 res!984046) b!1452992))

(declare-fun m!1341541 () Bool)

(assert (=> b!1452995 m!1341541))

(declare-fun m!1341543 () Bool)

(assert (=> b!1452995 m!1341543))

(declare-fun m!1341545 () Bool)

(assert (=> b!1452995 m!1341545))

(declare-fun m!1341547 () Bool)

(assert (=> b!1452995 m!1341547))

(declare-fun m!1341549 () Bool)

(assert (=> b!1452991 m!1341549))

(assert (=> b!1452991 m!1341549))

(declare-fun m!1341551 () Bool)

(assert (=> b!1452991 m!1341551))

(assert (=> b!1452991 m!1341545))

(declare-fun m!1341553 () Bool)

(assert (=> b!1452991 m!1341553))

(assert (=> b!1452996 m!1341543))

(assert (=> b!1452996 m!1341543))

(declare-fun m!1341555 () Bool)

(assert (=> b!1452996 m!1341555))

(assert (=> b!1452996 m!1341555))

(assert (=> b!1452996 m!1341543))

(declare-fun m!1341557 () Bool)

(assert (=> b!1452996 m!1341557))

(declare-fun m!1341559 () Bool)

(assert (=> b!1452990 m!1341559))

(assert (=> b!1453003 m!1341543))

(assert (=> b!1453003 m!1341543))

(declare-fun m!1341561 () Bool)

(assert (=> b!1453003 m!1341561))

(assert (=> b!1452993 m!1341543))

(assert (=> b!1452993 m!1341543))

(declare-fun m!1341563 () Bool)

(assert (=> b!1452993 m!1341563))

(declare-fun m!1341565 () Bool)

(assert (=> b!1453001 m!1341565))

(assert (=> b!1453001 m!1341565))

(declare-fun m!1341567 () Bool)

(assert (=> b!1453001 m!1341567))

(declare-fun m!1341569 () Bool)

(assert (=> b!1452994 m!1341569))

(declare-fun m!1341571 () Bool)

(assert (=> b!1452988 m!1341571))

(declare-fun m!1341573 () Bool)

(assert (=> b!1452988 m!1341573))

(assert (=> b!1453005 m!1341545))

(declare-fun m!1341575 () Bool)

(assert (=> b!1453005 m!1341575))

(assert (=> b!1452998 m!1341543))

(assert (=> b!1452998 m!1341543))

(declare-fun m!1341577 () Bool)

(assert (=> b!1452998 m!1341577))

(declare-fun m!1341579 () Bool)

(assert (=> b!1452992 m!1341579))

(declare-fun m!1341581 () Bool)

(assert (=> b!1452992 m!1341581))

(declare-fun m!1341583 () Bool)

(assert (=> b!1452987 m!1341583))

(assert (=> b!1452987 m!1341543))

(declare-fun m!1341585 () Bool)

(assert (=> b!1453004 m!1341585))

(assert (=> b!1453002 m!1341581))

(assert (=> b!1453002 m!1341579))

(declare-fun m!1341587 () Bool)

(assert (=> start!124978 m!1341587))

(declare-fun m!1341589 () Bool)

(assert (=> start!124978 m!1341589))

(push 1)

