; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126830 () Bool)

(assert start!126830)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!834575 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99603 0))(
  ( (array!99604 (arr!48073 (Array (_ BitVec 32) (_ BitVec 64))) (size!48623 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99603)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1488993 () Bool)

(assert (=> b!1488993 (= e!834575 (and (or (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) (select (arr!48073 a!2862) j!93))) (let ((bdg!54677 (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48073 a!2862) index!646) bdg!54677) (= (select (arr!48073 a!2862) index!646) (select (arr!48073 a!2862) j!93))) (= (select (arr!48073 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54677 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488994 () Bool)

(declare-fun e!834583 () Bool)

(assert (=> b!1488994 (= e!834583 true)))

(declare-fun lt!649398 () Bool)

(declare-fun e!834579 () Bool)

(assert (=> b!1488994 (= lt!649398 e!834579)))

(declare-fun c!137766 () Bool)

(assert (=> b!1488994 (= c!137766 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488995 () Bool)

(declare-fun res!1012521 () Bool)

(declare-fun e!834578 () Bool)

(assert (=> b!1488995 (=> (not res!1012521) (not e!834578))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1488995 (= res!1012521 (and (= (size!48623 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48623 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48623 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488996 () Bool)

(declare-fun res!1012533 () Bool)

(declare-fun e!834580 () Bool)

(assert (=> b!1488996 (=> (not res!1012533) (not e!834580))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488996 (= res!1012533 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488997 () Bool)

(declare-fun res!1012517 () Bool)

(assert (=> b!1488997 (=> (not res!1012517) (not e!834575))))

(declare-datatypes ((SeekEntryResult!12313 0))(
  ( (MissingZero!12313 (index!51644 (_ BitVec 32))) (Found!12313 (index!51645 (_ BitVec 32))) (Intermediate!12313 (undefined!13125 Bool) (index!51646 (_ BitVec 32)) (x!133241 (_ BitVec 32))) (Undefined!12313) (MissingVacant!12313 (index!51647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99603 (_ BitVec 32)) SeekEntryResult!12313)

(assert (=> b!1488997 (= res!1012517 (= (seekEntryOrOpen!0 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) (Found!12313 j!93)))))

(declare-fun b!1488998 () Bool)

(declare-fun res!1012519 () Bool)

(declare-fun e!834577 () Bool)

(assert (=> b!1488998 (=> (not res!1012519) (not e!834577))))

(declare-fun lt!649397 () SeekEntryResult!12313)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99603 (_ BitVec 32)) SeekEntryResult!12313)

(assert (=> b!1488998 (= res!1012519 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!649397))))

(declare-fun e!834581 () Bool)

(declare-fun b!1488999 () Bool)

(declare-fun lt!649394 () array!99603)

(declare-fun lt!649392 () SeekEntryResult!12313)

(declare-fun lt!649395 () (_ BitVec 64))

(assert (=> b!1488999 (= e!834581 (= lt!649392 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649395 lt!649394 mask!2687)))))

(declare-fun b!1489000 () Bool)

(declare-fun e!834576 () Bool)

(assert (=> b!1489000 (= e!834576 e!834577)))

(declare-fun res!1012520 () Bool)

(assert (=> b!1489000 (=> (not res!1012520) (not e!834577))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489000 (= res!1012520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48073 a!2862) j!93) mask!2687) (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!649397))))

(assert (=> b!1489000 (= lt!649397 (Intermediate!12313 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489001 () Bool)

(declare-fun res!1012523 () Bool)

(assert (=> b!1489001 (=> (not res!1012523) (not e!834578))))

(declare-datatypes ((List!34574 0))(
  ( (Nil!34571) (Cons!34570 (h!35953 (_ BitVec 64)) (t!49268 List!34574)) )
))
(declare-fun arrayNoDuplicates!0 (array!99603 (_ BitVec 32) List!34574) Bool)

(assert (=> b!1489001 (= res!1012523 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34571))))

(declare-fun res!1012528 () Bool)

(assert (=> start!126830 (=> (not res!1012528) (not e!834578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126830 (= res!1012528 (validMask!0 mask!2687))))

(assert (=> start!126830 e!834578))

(assert (=> start!126830 true))

(declare-fun array_inv!37101 (array!99603) Bool)

(assert (=> start!126830 (array_inv!37101 a!2862)))

(declare-fun b!1489002 () Bool)

(declare-fun res!1012526 () Bool)

(assert (=> b!1489002 (=> (not res!1012526) (not e!834578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99603 (_ BitVec 32)) Bool)

(assert (=> b!1489002 (= res!1012526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489003 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99603 (_ BitVec 32)) SeekEntryResult!12313)

(assert (=> b!1489003 (= e!834581 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649395 lt!649394 mask!2687) (seekEntryOrOpen!0 lt!649395 lt!649394 mask!2687)))))

(declare-fun lt!649393 () (_ BitVec 32))

(declare-fun b!1489004 () Bool)

(assert (=> b!1489004 (= e!834579 (not (= lt!649392 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649393 lt!649395 lt!649394 mask!2687))))))

(declare-fun b!1489005 () Bool)

(declare-fun res!1012530 () Bool)

(assert (=> b!1489005 (=> (not res!1012530) (not e!834580))))

(assert (=> b!1489005 (= res!1012530 e!834581)))

(declare-fun c!137765 () Bool)

(assert (=> b!1489005 (= c!137765 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489006 () Bool)

(declare-fun res!1012524 () Bool)

(assert (=> b!1489006 (=> (not res!1012524) (not e!834578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489006 (= res!1012524 (validKeyInArray!0 (select (arr!48073 a!2862) i!1006)))))

(declare-fun b!1489007 () Bool)

(declare-fun lt!649391 () SeekEntryResult!12313)

(assert (=> b!1489007 (= e!834579 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649393 intermediateAfterIndex!19 lt!649395 lt!649394 mask!2687) lt!649391)))))

(declare-fun b!1489008 () Bool)

(declare-fun e!834582 () Bool)

(assert (=> b!1489008 (= e!834580 (not e!834582))))

(declare-fun res!1012525 () Bool)

(assert (=> b!1489008 (=> res!1012525 e!834582)))

(assert (=> b!1489008 (= res!1012525 (or (and (= (select (arr!48073 a!2862) index!646) (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48073 a!2862) index!646) (select (arr!48073 a!2862) j!93))) (= (select (arr!48073 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489008 e!834575))

(declare-fun res!1012531 () Bool)

(assert (=> b!1489008 (=> (not res!1012531) (not e!834575))))

(assert (=> b!1489008 (= res!1012531 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49966 0))(
  ( (Unit!49967) )
))
(declare-fun lt!649396 () Unit!49966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49966)

(assert (=> b!1489008 (= lt!649396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489009 () Bool)

(declare-fun res!1012532 () Bool)

(assert (=> b!1489009 (=> (not res!1012532) (not e!834578))))

(assert (=> b!1489009 (= res!1012532 (validKeyInArray!0 (select (arr!48073 a!2862) j!93)))))

(declare-fun b!1489010 () Bool)

(assert (=> b!1489010 (= e!834578 e!834576)))

(declare-fun res!1012522 () Bool)

(assert (=> b!1489010 (=> (not res!1012522) (not e!834576))))

(assert (=> b!1489010 (= res!1012522 (= (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489010 (= lt!649394 (array!99604 (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48623 a!2862)))))

(declare-fun b!1489011 () Bool)

(assert (=> b!1489011 (= e!834577 e!834580)))

(declare-fun res!1012534 () Bool)

(assert (=> b!1489011 (=> (not res!1012534) (not e!834580))))

(assert (=> b!1489011 (= res!1012534 (= lt!649392 (Intermediate!12313 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489011 (= lt!649392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649395 mask!2687) lt!649395 lt!649394 mask!2687))))

(assert (=> b!1489011 (= lt!649395 (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489012 () Bool)

(assert (=> b!1489012 (= e!834582 e!834583)))

(declare-fun res!1012518 () Bool)

(assert (=> b!1489012 (=> res!1012518 e!834583)))

(assert (=> b!1489012 (= res!1012518 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649393 #b00000000000000000000000000000000) (bvsge lt!649393 (size!48623 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489012 (= lt!649393 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489012 (= lt!649391 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649395 lt!649394 mask!2687))))

(assert (=> b!1489012 (= lt!649391 (seekEntryOrOpen!0 lt!649395 lt!649394 mask!2687))))

(declare-fun b!1489013 () Bool)

(declare-fun res!1012529 () Bool)

(assert (=> b!1489013 (=> res!1012529 e!834583)))

(assert (=> b!1489013 (= res!1012529 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649393 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!649397)))))

(declare-fun b!1489014 () Bool)

(declare-fun res!1012527 () Bool)

(assert (=> b!1489014 (=> (not res!1012527) (not e!834578))))

(assert (=> b!1489014 (= res!1012527 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48623 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48623 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48623 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126830 res!1012528) b!1488995))

(assert (= (and b!1488995 res!1012521) b!1489006))

(assert (= (and b!1489006 res!1012524) b!1489009))

(assert (= (and b!1489009 res!1012532) b!1489002))

(assert (= (and b!1489002 res!1012526) b!1489001))

(assert (= (and b!1489001 res!1012523) b!1489014))

(assert (= (and b!1489014 res!1012527) b!1489010))

(assert (= (and b!1489010 res!1012522) b!1489000))

(assert (= (and b!1489000 res!1012520) b!1488998))

(assert (= (and b!1488998 res!1012519) b!1489011))

(assert (= (and b!1489011 res!1012534) b!1489005))

(assert (= (and b!1489005 c!137765) b!1488999))

(assert (= (and b!1489005 (not c!137765)) b!1489003))

(assert (= (and b!1489005 res!1012530) b!1488996))

(assert (= (and b!1488996 res!1012533) b!1489008))

(assert (= (and b!1489008 res!1012531) b!1488997))

(assert (= (and b!1488997 res!1012517) b!1488993))

(assert (= (and b!1489008 (not res!1012525)) b!1489012))

(assert (= (and b!1489012 (not res!1012518)) b!1489013))

(assert (= (and b!1489013 (not res!1012529)) b!1488994))

(assert (= (and b!1488994 c!137766) b!1489004))

(assert (= (and b!1488994 (not c!137766)) b!1489007))

(declare-fun m!1373283 () Bool)

(assert (=> b!1489000 m!1373283))

(assert (=> b!1489000 m!1373283))

(declare-fun m!1373285 () Bool)

(assert (=> b!1489000 m!1373285))

(assert (=> b!1489000 m!1373285))

(assert (=> b!1489000 m!1373283))

(declare-fun m!1373287 () Bool)

(assert (=> b!1489000 m!1373287))

(declare-fun m!1373289 () Bool)

(assert (=> b!1488999 m!1373289))

(declare-fun m!1373291 () Bool)

(assert (=> start!126830 m!1373291))

(declare-fun m!1373293 () Bool)

(assert (=> start!126830 m!1373293))

(declare-fun m!1373295 () Bool)

(assert (=> b!1489012 m!1373295))

(declare-fun m!1373297 () Bool)

(assert (=> b!1489012 m!1373297))

(declare-fun m!1373299 () Bool)

(assert (=> b!1489012 m!1373299))

(declare-fun m!1373301 () Bool)

(assert (=> b!1489006 m!1373301))

(assert (=> b!1489006 m!1373301))

(declare-fun m!1373303 () Bool)

(assert (=> b!1489006 m!1373303))

(declare-fun m!1373305 () Bool)

(assert (=> b!1489010 m!1373305))

(declare-fun m!1373307 () Bool)

(assert (=> b!1489010 m!1373307))

(declare-fun m!1373309 () Bool)

(assert (=> b!1489002 m!1373309))

(assert (=> b!1488993 m!1373305))

(declare-fun m!1373311 () Bool)

(assert (=> b!1488993 m!1373311))

(declare-fun m!1373313 () Bool)

(assert (=> b!1488993 m!1373313))

(declare-fun m!1373315 () Bool)

(assert (=> b!1488993 m!1373315))

(assert (=> b!1488993 m!1373283))

(declare-fun m!1373317 () Bool)

(assert (=> b!1489008 m!1373317))

(assert (=> b!1489008 m!1373305))

(assert (=> b!1489008 m!1373313))

(assert (=> b!1489008 m!1373315))

(declare-fun m!1373319 () Bool)

(assert (=> b!1489008 m!1373319))

(assert (=> b!1489008 m!1373283))

(assert (=> b!1489003 m!1373297))

(assert (=> b!1489003 m!1373299))

(assert (=> b!1488997 m!1373283))

(assert (=> b!1488997 m!1373283))

(declare-fun m!1373321 () Bool)

(assert (=> b!1488997 m!1373321))

(declare-fun m!1373323 () Bool)

(assert (=> b!1489011 m!1373323))

(assert (=> b!1489011 m!1373323))

(declare-fun m!1373325 () Bool)

(assert (=> b!1489011 m!1373325))

(assert (=> b!1489011 m!1373305))

(declare-fun m!1373327 () Bool)

(assert (=> b!1489011 m!1373327))

(declare-fun m!1373329 () Bool)

(assert (=> b!1489004 m!1373329))

(assert (=> b!1489009 m!1373283))

(assert (=> b!1489009 m!1373283))

(declare-fun m!1373331 () Bool)

(assert (=> b!1489009 m!1373331))

(assert (=> b!1488998 m!1373283))

(assert (=> b!1488998 m!1373283))

(declare-fun m!1373333 () Bool)

(assert (=> b!1488998 m!1373333))

(declare-fun m!1373335 () Bool)

(assert (=> b!1489007 m!1373335))

(assert (=> b!1489013 m!1373283))

(assert (=> b!1489013 m!1373283))

(declare-fun m!1373337 () Bool)

(assert (=> b!1489013 m!1373337))

(declare-fun m!1373339 () Bool)

(assert (=> b!1489001 m!1373339))

(push 1)

