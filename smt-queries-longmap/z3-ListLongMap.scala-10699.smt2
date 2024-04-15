; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125302 () Bool)

(assert start!125302)

(declare-fun b!1464234 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!822855 () Bool)

(declare-datatypes ((array!98728 0))(
  ( (array!98729 (arr!47653 (Array (_ BitVec 32) (_ BitVec 64))) (size!48205 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98728)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464234 (= e!822855 (or (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) (select (arr!47653 a!2862) j!93))))))

(declare-fun b!1464235 () Bool)

(declare-fun res!993433 () Bool)

(declare-fun e!822861 () Bool)

(assert (=> b!1464235 (=> (not res!993433) (not e!822861))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464235 (= res!993433 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!822863 () Bool)

(declare-fun lt!640849 () array!98728)

(declare-datatypes ((SeekEntryResult!11930 0))(
  ( (MissingZero!11930 (index!50112 (_ BitVec 32))) (Found!11930 (index!50113 (_ BitVec 32))) (Intermediate!11930 (undefined!12742 Bool) (index!50114 (_ BitVec 32)) (x!131694 (_ BitVec 32))) (Undefined!11930) (MissingVacant!11930 (index!50115 (_ BitVec 32))) )
))
(declare-fun lt!640854 () SeekEntryResult!11930)

(declare-fun lt!640852 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!640853 () (_ BitVec 32))

(declare-fun b!1464236 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11930)

(assert (=> b!1464236 (= e!822863 (not (= lt!640854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640853 lt!640852 lt!640849 mask!2687))))))

(declare-fun b!1464237 () Bool)

(declare-fun res!993435 () Bool)

(declare-fun e!822859 () Bool)

(assert (=> b!1464237 (=> (not res!993435) (not e!822859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464237 (= res!993435 (validKeyInArray!0 (select (arr!47653 a!2862) j!93)))))

(declare-fun b!1464238 () Bool)

(declare-fun res!993430 () Bool)

(assert (=> b!1464238 (=> (not res!993430) (not e!822855))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11930)

(assert (=> b!1464238 (= res!993430 (= (seekEntryOrOpen!0 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) (Found!11930 j!93)))))

(declare-fun b!1464239 () Bool)

(declare-fun e!822860 () Bool)

(assert (=> b!1464239 (= e!822860 e!822861)))

(declare-fun res!993438 () Bool)

(assert (=> b!1464239 (=> (not res!993438) (not e!822861))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464239 (= res!993438 (= lt!640854 (Intermediate!11930 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464239 (= lt!640854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640852 mask!2687) lt!640852 lt!640849 mask!2687))))

(assert (=> b!1464239 (= lt!640852 (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464240 () Bool)

(declare-fun e!822862 () Bool)

(assert (=> b!1464240 (= e!822862 e!822860)))

(declare-fun res!993422 () Bool)

(assert (=> b!1464240 (=> (not res!993422) (not e!822860))))

(declare-fun lt!640850 () SeekEntryResult!11930)

(assert (=> b!1464240 (= res!993422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47653 a!2862) j!93) mask!2687) (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640850))))

(assert (=> b!1464240 (= lt!640850 (Intermediate!11930 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!993424 () Bool)

(assert (=> start!125302 (=> (not res!993424) (not e!822859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125302 (= res!993424 (validMask!0 mask!2687))))

(assert (=> start!125302 e!822859))

(assert (=> start!125302 true))

(declare-fun array_inv!36886 (array!98728) Bool)

(assert (=> start!125302 (array_inv!36886 a!2862)))

(declare-fun b!1464241 () Bool)

(declare-fun e!822858 () Bool)

(assert (=> b!1464241 (= e!822861 (not e!822858))))

(declare-fun res!993425 () Bool)

(assert (=> b!1464241 (=> res!993425 e!822858)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1464241 (= res!993425 (or (and (= (select (arr!47653 a!2862) index!646) (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47653 a!2862) index!646) (select (arr!47653 a!2862) j!93))) (= (select (arr!47653 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464241 e!822855))

(declare-fun res!993436 () Bool)

(assert (=> b!1464241 (=> (not res!993436) (not e!822855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98728 (_ BitVec 32)) Bool)

(assert (=> b!1464241 (= res!993436 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49197 0))(
  ( (Unit!49198) )
))
(declare-fun lt!640851 () Unit!49197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49197)

(assert (=> b!1464241 (= lt!640851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464242 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11930)

(assert (=> b!1464242 (= e!822863 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640853 intermediateAfterIndex!19 lt!640852 lt!640849 mask!2687) (seekEntryOrOpen!0 lt!640852 lt!640849 mask!2687))))))

(declare-fun b!1464243 () Bool)

(declare-fun e!822857 () Bool)

(assert (=> b!1464243 (= e!822857 true)))

(declare-fun lt!640848 () Bool)

(assert (=> b!1464243 (= lt!640848 e!822863)))

(declare-fun c!134919 () Bool)

(assert (=> b!1464243 (= c!134919 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464244 () Bool)

(declare-fun res!993431 () Bool)

(assert (=> b!1464244 (=> (not res!993431) (not e!822860))))

(assert (=> b!1464244 (= res!993431 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640850))))

(declare-fun b!1464245 () Bool)

(declare-fun res!993426 () Bool)

(assert (=> b!1464245 (=> (not res!993426) (not e!822859))))

(assert (=> b!1464245 (= res!993426 (and (= (size!48205 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48205 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48205 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464246 () Bool)

(declare-fun res!993439 () Bool)

(assert (=> b!1464246 (=> (not res!993439) (not e!822859))))

(assert (=> b!1464246 (= res!993439 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48205 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48205 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48205 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464247 () Bool)

(assert (=> b!1464247 (= e!822858 e!822857)))

(declare-fun res!993429 () Bool)

(assert (=> b!1464247 (=> res!993429 e!822857)))

(assert (=> b!1464247 (= res!993429 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640853 #b00000000000000000000000000000000) (bvsge lt!640853 (size!48205 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464247 (= lt!640853 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464248 () Bool)

(declare-fun e!822856 () Bool)

(assert (=> b!1464248 (= e!822856 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640852 lt!640849 mask!2687) (seekEntryOrOpen!0 lt!640852 lt!640849 mask!2687)))))

(declare-fun b!1464249 () Bool)

(declare-fun res!993427 () Bool)

(assert (=> b!1464249 (=> (not res!993427) (not e!822861))))

(assert (=> b!1464249 (= res!993427 e!822856)))

(declare-fun c!134920 () Bool)

(assert (=> b!1464249 (= c!134920 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464250 () Bool)

(declare-fun res!993434 () Bool)

(assert (=> b!1464250 (=> (not res!993434) (not e!822859))))

(declare-datatypes ((List!34232 0))(
  ( (Nil!34229) (Cons!34228 (h!35578 (_ BitVec 64)) (t!48918 List!34232)) )
))
(declare-fun arrayNoDuplicates!0 (array!98728 (_ BitVec 32) List!34232) Bool)

(assert (=> b!1464250 (= res!993434 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34229))))

(declare-fun b!1464251 () Bool)

(assert (=> b!1464251 (= e!822859 e!822862)))

(declare-fun res!993437 () Bool)

(assert (=> b!1464251 (=> (not res!993437) (not e!822862))))

(assert (=> b!1464251 (= res!993437 (= (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464251 (= lt!640849 (array!98729 (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48205 a!2862)))))

(declare-fun b!1464252 () Bool)

(declare-fun res!993432 () Bool)

(assert (=> b!1464252 (=> res!993432 e!822857)))

(assert (=> b!1464252 (= res!993432 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640853 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640850)))))

(declare-fun b!1464253 () Bool)

(declare-fun res!993423 () Bool)

(assert (=> b!1464253 (=> (not res!993423) (not e!822859))))

(assert (=> b!1464253 (= res!993423 (validKeyInArray!0 (select (arr!47653 a!2862) i!1006)))))

(declare-fun b!1464254 () Bool)

(declare-fun res!993428 () Bool)

(assert (=> b!1464254 (=> (not res!993428) (not e!822859))))

(assert (=> b!1464254 (= res!993428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464255 () Bool)

(assert (=> b!1464255 (= e!822856 (= lt!640854 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640852 lt!640849 mask!2687)))))

(assert (= (and start!125302 res!993424) b!1464245))

(assert (= (and b!1464245 res!993426) b!1464253))

(assert (= (and b!1464253 res!993423) b!1464237))

(assert (= (and b!1464237 res!993435) b!1464254))

(assert (= (and b!1464254 res!993428) b!1464250))

(assert (= (and b!1464250 res!993434) b!1464246))

(assert (= (and b!1464246 res!993439) b!1464251))

(assert (= (and b!1464251 res!993437) b!1464240))

(assert (= (and b!1464240 res!993422) b!1464244))

(assert (= (and b!1464244 res!993431) b!1464239))

(assert (= (and b!1464239 res!993438) b!1464249))

(assert (= (and b!1464249 c!134920) b!1464255))

(assert (= (and b!1464249 (not c!134920)) b!1464248))

(assert (= (and b!1464249 res!993427) b!1464235))

(assert (= (and b!1464235 res!993433) b!1464241))

(assert (= (and b!1464241 res!993436) b!1464238))

(assert (= (and b!1464238 res!993430) b!1464234))

(assert (= (and b!1464241 (not res!993425)) b!1464247))

(assert (= (and b!1464247 (not res!993429)) b!1464252))

(assert (= (and b!1464252 (not res!993432)) b!1464243))

(assert (= (and b!1464243 c!134919) b!1464236))

(assert (= (and b!1464243 (not c!134919)) b!1464242))

(declare-fun m!1350969 () Bool)

(assert (=> b!1464248 m!1350969))

(declare-fun m!1350971 () Bool)

(assert (=> b!1464248 m!1350971))

(declare-fun m!1350973 () Bool)

(assert (=> b!1464242 m!1350973))

(assert (=> b!1464242 m!1350971))

(declare-fun m!1350975 () Bool)

(assert (=> b!1464252 m!1350975))

(assert (=> b!1464252 m!1350975))

(declare-fun m!1350977 () Bool)

(assert (=> b!1464252 m!1350977))

(assert (=> b!1464237 m!1350975))

(assert (=> b!1464237 m!1350975))

(declare-fun m!1350979 () Bool)

(assert (=> b!1464237 m!1350979))

(declare-fun m!1350981 () Bool)

(assert (=> start!125302 m!1350981))

(declare-fun m!1350983 () Bool)

(assert (=> start!125302 m!1350983))

(declare-fun m!1350985 () Bool)

(assert (=> b!1464247 m!1350985))

(declare-fun m!1350987 () Bool)

(assert (=> b!1464234 m!1350987))

(assert (=> b!1464234 m!1350975))

(assert (=> b!1464244 m!1350975))

(assert (=> b!1464244 m!1350975))

(declare-fun m!1350989 () Bool)

(assert (=> b!1464244 m!1350989))

(declare-fun m!1350991 () Bool)

(assert (=> b!1464255 m!1350991))

(declare-fun m!1350993 () Bool)

(assert (=> b!1464236 m!1350993))

(declare-fun m!1350995 () Bool)

(assert (=> b!1464250 m!1350995))

(declare-fun m!1350997 () Bool)

(assert (=> b!1464239 m!1350997))

(assert (=> b!1464239 m!1350997))

(declare-fun m!1350999 () Bool)

(assert (=> b!1464239 m!1350999))

(declare-fun m!1351001 () Bool)

(assert (=> b!1464239 m!1351001))

(declare-fun m!1351003 () Bool)

(assert (=> b!1464239 m!1351003))

(declare-fun m!1351005 () Bool)

(assert (=> b!1464241 m!1351005))

(assert (=> b!1464241 m!1351001))

(declare-fun m!1351007 () Bool)

(assert (=> b!1464241 m!1351007))

(declare-fun m!1351009 () Bool)

(assert (=> b!1464241 m!1351009))

(declare-fun m!1351011 () Bool)

(assert (=> b!1464241 m!1351011))

(assert (=> b!1464241 m!1350975))

(declare-fun m!1351013 () Bool)

(assert (=> b!1464254 m!1351013))

(assert (=> b!1464251 m!1351001))

(declare-fun m!1351015 () Bool)

(assert (=> b!1464251 m!1351015))

(assert (=> b!1464238 m!1350975))

(assert (=> b!1464238 m!1350975))

(declare-fun m!1351017 () Bool)

(assert (=> b!1464238 m!1351017))

(declare-fun m!1351019 () Bool)

(assert (=> b!1464253 m!1351019))

(assert (=> b!1464253 m!1351019))

(declare-fun m!1351021 () Bool)

(assert (=> b!1464253 m!1351021))

(assert (=> b!1464240 m!1350975))

(assert (=> b!1464240 m!1350975))

(declare-fun m!1351023 () Bool)

(assert (=> b!1464240 m!1351023))

(assert (=> b!1464240 m!1351023))

(assert (=> b!1464240 m!1350975))

(declare-fun m!1351025 () Bool)

(assert (=> b!1464240 m!1351025))

(check-sat (not b!1464250) (not b!1464241) (not b!1464253) (not start!125302) (not b!1464247) (not b!1464242) (not b!1464248) (not b!1464255) (not b!1464240) (not b!1464238) (not b!1464244) (not b!1464237) (not b!1464239) (not b!1464236) (not b!1464252) (not b!1464254))
(check-sat)
