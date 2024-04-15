; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124624 () Bool)

(assert start!124624)

(declare-fun b!1443920 () Bool)

(declare-fun res!976066 () Bool)

(declare-fun e!813583 () Bool)

(assert (=> b!1443920 (=> (not res!976066) (not e!813583))))

(declare-fun e!813581 () Bool)

(assert (=> b!1443920 (= res!976066 e!813581)))

(declare-fun c!133441 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443920 (= c!133441 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443921 () Bool)

(declare-fun res!976074 () Bool)

(declare-fun e!813580 () Bool)

(assert (=> b!1443921 (=> (not res!976074) (not e!813580))))

(declare-datatypes ((array!98050 0))(
  ( (array!98051 (arr!47314 (Array (_ BitVec 32) (_ BitVec 64))) (size!47866 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98050)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443921 (= res!976074 (validKeyInArray!0 (select (arr!47314 a!2862) i!1006)))))

(declare-fun b!1443922 () Bool)

(declare-fun res!976077 () Bool)

(declare-fun e!813584 () Bool)

(assert (=> b!1443922 (=> res!976077 e!813584)))

(declare-fun lt!633855 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11591 0))(
  ( (MissingZero!11591 (index!48756 (_ BitVec 32))) (Found!11591 (index!48757 (_ BitVec 32))) (Intermediate!11591 (undefined!12403 Bool) (index!48758 (_ BitVec 32)) (x!130451 (_ BitVec 32))) (Undefined!11591) (MissingVacant!11591 (index!48759 (_ BitVec 32))) )
))
(declare-fun lt!633853 () SeekEntryResult!11591)

(declare-fun lt!633856 () array!98050)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11591)

(assert (=> b!1443922 (= res!976077 (not (= lt!633853 (seekEntryOrOpen!0 lt!633855 lt!633856 mask!2687))))))

(declare-fun b!1443923 () Bool)

(declare-fun res!976076 () Bool)

(assert (=> b!1443923 (=> (not res!976076) (not e!813580))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443923 (= res!976076 (and (= (size!47866 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47866 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47866 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443924 () Bool)

(declare-fun res!976075 () Bool)

(assert (=> b!1443924 (=> (not res!976075) (not e!813580))))

(assert (=> b!1443924 (= res!976075 (validKeyInArray!0 (select (arr!47314 a!2862) j!93)))))

(declare-fun b!1443925 () Bool)

(declare-fun e!813582 () Bool)

(declare-fun e!813579 () Bool)

(assert (=> b!1443925 (= e!813582 e!813579)))

(declare-fun res!976078 () Bool)

(assert (=> b!1443925 (=> (not res!976078) (not e!813579))))

(declare-fun lt!633858 () SeekEntryResult!11591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443925 (= res!976078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47314 a!2862) j!93) mask!2687) (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633858))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443925 (= lt!633858 (Intermediate!11591 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443926 () Bool)

(assert (=> b!1443926 (= e!813583 (not e!813584))))

(declare-fun res!976070 () Bool)

(assert (=> b!1443926 (=> res!976070 e!813584)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443926 (= res!976070 (or (not (= (select (arr!47314 a!2862) index!646) (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47314 a!2862) index!646) (select (arr!47314 a!2862) j!93)))))))

(assert (=> b!1443926 (and (= lt!633853 (Found!11591 j!93)) (or (= (select (arr!47314 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47314 a!2862) intermediateBeforeIndex!19) (select (arr!47314 a!2862) j!93))))))

(assert (=> b!1443926 (= lt!633853 (seekEntryOrOpen!0 (select (arr!47314 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98050 (_ BitVec 32)) Bool)

(assert (=> b!1443926 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48519 0))(
  ( (Unit!48520) )
))
(declare-fun lt!633854 () Unit!48519)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48519)

(assert (=> b!1443926 (= lt!633854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443927 () Bool)

(declare-fun res!976073 () Bool)

(assert (=> b!1443927 (=> (not res!976073) (not e!813583))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443927 (= res!976073 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!976067 () Bool)

(assert (=> start!124624 (=> (not res!976067) (not e!813580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124624 (= res!976067 (validMask!0 mask!2687))))

(assert (=> start!124624 e!813580))

(assert (=> start!124624 true))

(declare-fun array_inv!36547 (array!98050) Bool)

(assert (=> start!124624 (array_inv!36547 a!2862)))

(declare-fun b!1443928 () Bool)

(declare-fun res!976065 () Bool)

(assert (=> b!1443928 (=> (not res!976065) (not e!813580))))

(assert (=> b!1443928 (= res!976065 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47866 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47866 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47866 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!633857 () SeekEntryResult!11591)

(declare-fun b!1443929 () Bool)

(assert (=> b!1443929 (= e!813581 (= lt!633857 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633855 lt!633856 mask!2687)))))

(declare-fun b!1443930 () Bool)

(assert (=> b!1443930 (= e!813580 e!813582)))

(declare-fun res!976072 () Bool)

(assert (=> b!1443930 (=> (not res!976072) (not e!813582))))

(assert (=> b!1443930 (= res!976072 (= (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443930 (= lt!633856 (array!98051 (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47866 a!2862)))))

(declare-fun b!1443931 () Bool)

(declare-fun res!976069 () Bool)

(assert (=> b!1443931 (=> (not res!976069) (not e!813579))))

(assert (=> b!1443931 (= res!976069 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633858))))

(declare-fun b!1443932 () Bool)

(assert (=> b!1443932 (= e!813584 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1443933 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98050 (_ BitVec 32)) SeekEntryResult!11591)

(assert (=> b!1443933 (= e!813581 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633855 lt!633856 mask!2687) (seekEntryOrOpen!0 lt!633855 lt!633856 mask!2687)))))

(declare-fun b!1443934 () Bool)

(declare-fun res!976064 () Bool)

(assert (=> b!1443934 (=> (not res!976064) (not e!813580))))

(assert (=> b!1443934 (= res!976064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443935 () Bool)

(assert (=> b!1443935 (= e!813579 e!813583)))

(declare-fun res!976071 () Bool)

(assert (=> b!1443935 (=> (not res!976071) (not e!813583))))

(assert (=> b!1443935 (= res!976071 (= lt!633857 (Intermediate!11591 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443935 (= lt!633857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633855 mask!2687) lt!633855 lt!633856 mask!2687))))

(assert (=> b!1443935 (= lt!633855 (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443936 () Bool)

(declare-fun res!976068 () Bool)

(assert (=> b!1443936 (=> (not res!976068) (not e!813580))))

(declare-datatypes ((List!33893 0))(
  ( (Nil!33890) (Cons!33889 (h!35239 (_ BitVec 64)) (t!48579 List!33893)) )
))
(declare-fun arrayNoDuplicates!0 (array!98050 (_ BitVec 32) List!33893) Bool)

(assert (=> b!1443936 (= res!976068 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33890))))

(assert (= (and start!124624 res!976067) b!1443923))

(assert (= (and b!1443923 res!976076) b!1443921))

(assert (= (and b!1443921 res!976074) b!1443924))

(assert (= (and b!1443924 res!976075) b!1443934))

(assert (= (and b!1443934 res!976064) b!1443936))

(assert (= (and b!1443936 res!976068) b!1443928))

(assert (= (and b!1443928 res!976065) b!1443930))

(assert (= (and b!1443930 res!976072) b!1443925))

(assert (= (and b!1443925 res!976078) b!1443931))

(assert (= (and b!1443931 res!976069) b!1443935))

(assert (= (and b!1443935 res!976071) b!1443920))

(assert (= (and b!1443920 c!133441) b!1443929))

(assert (= (and b!1443920 (not c!133441)) b!1443933))

(assert (= (and b!1443920 res!976066) b!1443927))

(assert (= (and b!1443927 res!976073) b!1443926))

(assert (= (and b!1443926 (not res!976070)) b!1443922))

(assert (= (and b!1443922 (not res!976077)) b!1443932))

(declare-fun m!1332477 () Bool)

(assert (=> b!1443926 m!1332477))

(declare-fun m!1332479 () Bool)

(assert (=> b!1443926 m!1332479))

(declare-fun m!1332481 () Bool)

(assert (=> b!1443926 m!1332481))

(declare-fun m!1332483 () Bool)

(assert (=> b!1443926 m!1332483))

(declare-fun m!1332485 () Bool)

(assert (=> b!1443926 m!1332485))

(declare-fun m!1332487 () Bool)

(assert (=> b!1443926 m!1332487))

(declare-fun m!1332489 () Bool)

(assert (=> b!1443926 m!1332489))

(declare-fun m!1332491 () Bool)

(assert (=> b!1443926 m!1332491))

(assert (=> b!1443926 m!1332487))

(declare-fun m!1332493 () Bool)

(assert (=> b!1443936 m!1332493))

(declare-fun m!1332495 () Bool)

(assert (=> b!1443929 m!1332495))

(declare-fun m!1332497 () Bool)

(assert (=> b!1443934 m!1332497))

(assert (=> b!1443930 m!1332479))

(declare-fun m!1332499 () Bool)

(assert (=> b!1443930 m!1332499))

(assert (=> b!1443931 m!1332487))

(assert (=> b!1443931 m!1332487))

(declare-fun m!1332501 () Bool)

(assert (=> b!1443931 m!1332501))

(declare-fun m!1332503 () Bool)

(assert (=> start!124624 m!1332503))

(declare-fun m!1332505 () Bool)

(assert (=> start!124624 m!1332505))

(declare-fun m!1332507 () Bool)

(assert (=> b!1443922 m!1332507))

(declare-fun m!1332509 () Bool)

(assert (=> b!1443933 m!1332509))

(assert (=> b!1443933 m!1332507))

(declare-fun m!1332511 () Bool)

(assert (=> b!1443935 m!1332511))

(assert (=> b!1443935 m!1332511))

(declare-fun m!1332513 () Bool)

(assert (=> b!1443935 m!1332513))

(assert (=> b!1443935 m!1332479))

(declare-fun m!1332515 () Bool)

(assert (=> b!1443935 m!1332515))

(declare-fun m!1332517 () Bool)

(assert (=> b!1443921 m!1332517))

(assert (=> b!1443921 m!1332517))

(declare-fun m!1332519 () Bool)

(assert (=> b!1443921 m!1332519))

(assert (=> b!1443925 m!1332487))

(assert (=> b!1443925 m!1332487))

(declare-fun m!1332521 () Bool)

(assert (=> b!1443925 m!1332521))

(assert (=> b!1443925 m!1332521))

(assert (=> b!1443925 m!1332487))

(declare-fun m!1332523 () Bool)

(assert (=> b!1443925 m!1332523))

(assert (=> b!1443924 m!1332487))

(assert (=> b!1443924 m!1332487))

(declare-fun m!1332525 () Bool)

(assert (=> b!1443924 m!1332525))

(check-sat (not b!1443925) (not b!1443934) (not b!1443922) (not b!1443935) (not b!1443921) (not b!1443936) (not b!1443924) (not b!1443933) (not b!1443931) (not b!1443926) (not start!124624) (not b!1443929))
(check-sat)
