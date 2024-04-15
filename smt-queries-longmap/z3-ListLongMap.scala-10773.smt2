; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126106 () Bool)

(assert start!126106)

(declare-fun b!1476457 () Bool)

(declare-fun e!828335 () Bool)

(assert (=> b!1476457 (= e!828335 (not true))))

(declare-fun e!828341 () Bool)

(assert (=> b!1476457 e!828341))

(declare-fun res!1002800 () Bool)

(assert (=> b!1476457 (=> (not res!1002800) (not e!828341))))

(declare-datatypes ((SeekEntryResult!12140 0))(
  ( (MissingZero!12140 (index!50952 (_ BitVec 32))) (Found!12140 (index!50953 (_ BitVec 32))) (Intermediate!12140 (undefined!12952 Bool) (index!50954 (_ BitVec 32)) (x!132550 (_ BitVec 32))) (Undefined!12140) (MissingVacant!12140 (index!50955 (_ BitVec 32))) )
))
(declare-fun lt!644854 () SeekEntryResult!12140)

(declare-datatypes ((array!99190 0))(
  ( (array!99191 (arr!47875 (Array (_ BitVec 32) (_ BitVec 64))) (size!48427 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99190)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1476457 (= res!1002800 (and (= lt!644854 (Found!12140 j!93)) (or (= (select (arr!47875 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47875 a!2862) intermediateBeforeIndex!19) (select (arr!47875 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99190 (_ BitVec 32)) SeekEntryResult!12140)

(assert (=> b!1476457 (= lt!644854 (seekEntryOrOpen!0 (select (arr!47875 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99190 (_ BitVec 32)) Bool)

(assert (=> b!1476457 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49461 0))(
  ( (Unit!49462) )
))
(declare-fun lt!644852 () Unit!49461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49461)

(assert (=> b!1476457 (= lt!644852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476458 () Bool)

(declare-fun res!1002792 () Bool)

(declare-fun e!828337 () Bool)

(assert (=> b!1476458 (=> (not res!1002792) (not e!828337))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476458 (= res!1002792 (and (= (size!48427 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48427 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48427 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476460 () Bool)

(declare-fun e!828340 () Bool)

(assert (=> b!1476460 (= e!828341 e!828340)))

(declare-fun res!1002795 () Bool)

(assert (=> b!1476460 (=> res!1002795 e!828340)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1476460 (= res!1002795 (or (and (= (select (arr!47875 a!2862) index!646) (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47875 a!2862) index!646) (select (arr!47875 a!2862) j!93))) (not (= (select (arr!47875 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476461 () Bool)

(declare-fun e!828334 () Bool)

(declare-fun e!828339 () Bool)

(assert (=> b!1476461 (= e!828334 e!828339)))

(declare-fun res!1002790 () Bool)

(assert (=> b!1476461 (=> (not res!1002790) (not e!828339))))

(declare-fun lt!644856 () SeekEntryResult!12140)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99190 (_ BitVec 32)) SeekEntryResult!12140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476461 (= res!1002790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47875 a!2862) j!93) mask!2687) (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!644856))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476461 (= lt!644856 (Intermediate!12140 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476462 () Bool)

(declare-fun e!828342 () Bool)

(assert (=> b!1476462 (= e!828340 e!828342)))

(declare-fun res!1002798 () Bool)

(assert (=> b!1476462 (=> (not res!1002798) (not e!828342))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99190 (_ BitVec 32)) SeekEntryResult!12140)

(assert (=> b!1476462 (= res!1002798 (= lt!644854 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47875 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476463 () Bool)

(declare-fun res!1002794 () Bool)

(assert (=> b!1476463 (=> (not res!1002794) (not e!828337))))

(declare-datatypes ((List!34454 0))(
  ( (Nil!34451) (Cons!34450 (h!35818 (_ BitVec 64)) (t!49140 List!34454)) )
))
(declare-fun arrayNoDuplicates!0 (array!99190 (_ BitVec 32) List!34454) Bool)

(assert (=> b!1476463 (= res!1002794 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34451))))

(declare-fun lt!644851 () SeekEntryResult!12140)

(declare-fun e!828336 () Bool)

(declare-fun b!1476464 () Bool)

(declare-fun lt!644853 () (_ BitVec 64))

(declare-fun lt!644855 () array!99190)

(assert (=> b!1476464 (= e!828336 (= lt!644851 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644853 lt!644855 mask!2687)))))

(declare-fun b!1476465 () Bool)

(declare-fun res!1002799 () Bool)

(assert (=> b!1476465 (=> (not res!1002799) (not e!828335))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476465 (= res!1002799 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476466 () Bool)

(declare-fun res!1002802 () Bool)

(assert (=> b!1476466 (=> (not res!1002802) (not e!828337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476466 (= res!1002802 (validKeyInArray!0 (select (arr!47875 a!2862) i!1006)))))

(declare-fun b!1476459 () Bool)

(assert (=> b!1476459 (= e!828337 e!828334)))

(declare-fun res!1002797 () Bool)

(assert (=> b!1476459 (=> (not res!1002797) (not e!828334))))

(assert (=> b!1476459 (= res!1002797 (= (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476459 (= lt!644855 (array!99191 (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48427 a!2862)))))

(declare-fun res!1002793 () Bool)

(assert (=> start!126106 (=> (not res!1002793) (not e!828337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126106 (= res!1002793 (validMask!0 mask!2687))))

(assert (=> start!126106 e!828337))

(assert (=> start!126106 true))

(declare-fun array_inv!37108 (array!99190) Bool)

(assert (=> start!126106 (array_inv!37108 a!2862)))

(declare-fun b!1476467 () Bool)

(declare-fun res!1002787 () Bool)

(assert (=> b!1476467 (=> (not res!1002787) (not e!828335))))

(assert (=> b!1476467 (= res!1002787 e!828336)))

(declare-fun c!136357 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476467 (= c!136357 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476468 () Bool)

(declare-fun res!1002789 () Bool)

(assert (=> b!1476468 (=> (not res!1002789) (not e!828337))))

(assert (=> b!1476468 (= res!1002789 (validKeyInArray!0 (select (arr!47875 a!2862) j!93)))))

(declare-fun b!1476469 () Bool)

(declare-fun res!1002801 () Bool)

(assert (=> b!1476469 (=> (not res!1002801) (not e!828337))))

(assert (=> b!1476469 (= res!1002801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48427 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48427 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48427 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476470 () Bool)

(declare-fun res!1002791 () Bool)

(assert (=> b!1476470 (=> (not res!1002791) (not e!828339))))

(assert (=> b!1476470 (= res!1002791 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!644856))))

(declare-fun b!1476471 () Bool)

(assert (=> b!1476471 (= e!828339 e!828335)))

(declare-fun res!1002796 () Bool)

(assert (=> b!1476471 (=> (not res!1002796) (not e!828335))))

(assert (=> b!1476471 (= res!1002796 (= lt!644851 (Intermediate!12140 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476471 (= lt!644851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644853 mask!2687) lt!644853 lt!644855 mask!2687))))

(assert (=> b!1476471 (= lt!644853 (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476472 () Bool)

(assert (=> b!1476472 (= e!828342 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476473 () Bool)

(declare-fun res!1002788 () Bool)

(assert (=> b!1476473 (=> (not res!1002788) (not e!828337))))

(assert (=> b!1476473 (= res!1002788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476474 () Bool)

(assert (=> b!1476474 (= e!828336 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644853 lt!644855 mask!2687) (seekEntryOrOpen!0 lt!644853 lt!644855 mask!2687)))))

(assert (= (and start!126106 res!1002793) b!1476458))

(assert (= (and b!1476458 res!1002792) b!1476466))

(assert (= (and b!1476466 res!1002802) b!1476468))

(assert (= (and b!1476468 res!1002789) b!1476473))

(assert (= (and b!1476473 res!1002788) b!1476463))

(assert (= (and b!1476463 res!1002794) b!1476469))

(assert (= (and b!1476469 res!1002801) b!1476459))

(assert (= (and b!1476459 res!1002797) b!1476461))

(assert (= (and b!1476461 res!1002790) b!1476470))

(assert (= (and b!1476470 res!1002791) b!1476471))

(assert (= (and b!1476471 res!1002796) b!1476467))

(assert (= (and b!1476467 c!136357) b!1476464))

(assert (= (and b!1476467 (not c!136357)) b!1476474))

(assert (= (and b!1476467 res!1002787) b!1476465))

(assert (= (and b!1476465 res!1002799) b!1476457))

(assert (= (and b!1476457 res!1002800) b!1476460))

(assert (= (and b!1476460 (not res!1002795)) b!1476462))

(assert (= (and b!1476462 res!1002798) b!1476472))

(declare-fun m!1361955 () Bool)

(assert (=> b!1476473 m!1361955))

(declare-fun m!1361957 () Bool)

(assert (=> b!1476464 m!1361957))

(declare-fun m!1361959 () Bool)

(assert (=> b!1476463 m!1361959))

(declare-fun m!1361961 () Bool)

(assert (=> b!1476474 m!1361961))

(declare-fun m!1361963 () Bool)

(assert (=> b!1476474 m!1361963))

(declare-fun m!1361965 () Bool)

(assert (=> b!1476459 m!1361965))

(declare-fun m!1361967 () Bool)

(assert (=> b!1476459 m!1361967))

(declare-fun m!1361969 () Bool)

(assert (=> b!1476460 m!1361969))

(assert (=> b!1476460 m!1361965))

(declare-fun m!1361971 () Bool)

(assert (=> b!1476460 m!1361971))

(declare-fun m!1361973 () Bool)

(assert (=> b!1476460 m!1361973))

(declare-fun m!1361975 () Bool)

(assert (=> b!1476466 m!1361975))

(assert (=> b!1476466 m!1361975))

(declare-fun m!1361977 () Bool)

(assert (=> b!1476466 m!1361977))

(declare-fun m!1361979 () Bool)

(assert (=> b!1476457 m!1361979))

(declare-fun m!1361981 () Bool)

(assert (=> b!1476457 m!1361981))

(assert (=> b!1476457 m!1361973))

(declare-fun m!1361983 () Bool)

(assert (=> b!1476457 m!1361983))

(declare-fun m!1361985 () Bool)

(assert (=> b!1476457 m!1361985))

(assert (=> b!1476457 m!1361973))

(assert (=> b!1476462 m!1361973))

(assert (=> b!1476462 m!1361973))

(declare-fun m!1361987 () Bool)

(assert (=> b!1476462 m!1361987))

(assert (=> b!1476461 m!1361973))

(assert (=> b!1476461 m!1361973))

(declare-fun m!1361989 () Bool)

(assert (=> b!1476461 m!1361989))

(assert (=> b!1476461 m!1361989))

(assert (=> b!1476461 m!1361973))

(declare-fun m!1361991 () Bool)

(assert (=> b!1476461 m!1361991))

(assert (=> b!1476468 m!1361973))

(assert (=> b!1476468 m!1361973))

(declare-fun m!1361993 () Bool)

(assert (=> b!1476468 m!1361993))

(declare-fun m!1361995 () Bool)

(assert (=> b!1476471 m!1361995))

(assert (=> b!1476471 m!1361995))

(declare-fun m!1361997 () Bool)

(assert (=> b!1476471 m!1361997))

(assert (=> b!1476471 m!1361965))

(declare-fun m!1361999 () Bool)

(assert (=> b!1476471 m!1361999))

(assert (=> b!1476470 m!1361973))

(assert (=> b!1476470 m!1361973))

(declare-fun m!1362001 () Bool)

(assert (=> b!1476470 m!1362001))

(declare-fun m!1362003 () Bool)

(assert (=> start!126106 m!1362003))

(declare-fun m!1362005 () Bool)

(assert (=> start!126106 m!1362005))

(check-sat (not b!1476464) (not b!1476457) (not b!1476463) (not b!1476471) (not b!1476461) (not b!1476474) (not b!1476473) (not b!1476466) (not b!1476462) (not start!126106) (not b!1476468) (not b!1476470))
(check-sat)
