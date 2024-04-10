; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124916 () Bool)

(assert start!124916)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817195 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1451381 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98364 0))(
  ( (array!98365 (arr!47470 (Array (_ BitVec 32) (_ BitVec 64))) (size!48020 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98364)

(assert (=> b!1451381 (= e!817195 (not (or (and (= (select (arr!47470 a!2862) index!646) (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47470 a!2862) index!646) (select (arr!47470 a!2862) j!93))) (= (select (arr!47470 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817198 () Bool)

(assert (=> b!1451381 e!817198))

(declare-fun res!982631 () Bool)

(assert (=> b!1451381 (=> (not res!982631) (not e!817198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98364 (_ BitVec 32)) Bool)

(assert (=> b!1451381 (= res!982631 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48940 0))(
  ( (Unit!48941) )
))
(declare-fun lt!636637 () Unit!48940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48940)

(assert (=> b!1451381 (= lt!636637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!817194 () Bool)

(declare-fun lt!636636 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11722 0))(
  ( (MissingZero!11722 (index!49280 (_ BitVec 32))) (Found!11722 (index!49281 (_ BitVec 32))) (Intermediate!11722 (undefined!12534 Bool) (index!49282 (_ BitVec 32)) (x!130931 (_ BitVec 32))) (Undefined!11722) (MissingVacant!11722 (index!49283 (_ BitVec 32))) )
))
(declare-fun lt!636639 () SeekEntryResult!11722)

(declare-fun b!1451382 () Bool)

(declare-fun lt!636638 () array!98364)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98364 (_ BitVec 32)) SeekEntryResult!11722)

(assert (=> b!1451382 (= e!817194 (= lt!636639 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636636 lt!636638 mask!2687)))))

(declare-fun b!1451383 () Bool)

(declare-fun res!982626 () Bool)

(declare-fun e!817196 () Bool)

(assert (=> b!1451383 (=> (not res!982626) (not e!817196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451383 (= res!982626 (validKeyInArray!0 (select (arr!47470 a!2862) i!1006)))))

(declare-fun b!1451384 () Bool)

(declare-fun res!982632 () Bool)

(assert (=> b!1451384 (=> (not res!982632) (not e!817198))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98364 (_ BitVec 32)) SeekEntryResult!11722)

(assert (=> b!1451384 (= res!982632 (= (seekEntryOrOpen!0 (select (arr!47470 a!2862) j!93) a!2862 mask!2687) (Found!11722 j!93)))))

(declare-fun b!1451385 () Bool)

(declare-fun e!817193 () Bool)

(assert (=> b!1451385 (= e!817193 e!817195)))

(declare-fun res!982627 () Bool)

(assert (=> b!1451385 (=> (not res!982627) (not e!817195))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451385 (= res!982627 (= lt!636639 (Intermediate!11722 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451385 (= lt!636639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636636 mask!2687) lt!636636 lt!636638 mask!2687))))

(assert (=> b!1451385 (= lt!636636 (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451387 () Bool)

(declare-fun e!817199 () Bool)

(assert (=> b!1451387 (= e!817196 e!817199)))

(declare-fun res!982633 () Bool)

(assert (=> b!1451387 (=> (not res!982633) (not e!817199))))

(assert (=> b!1451387 (= res!982633 (= (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451387 (= lt!636638 (array!98365 (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48020 a!2862)))))

(declare-fun b!1451388 () Bool)

(declare-fun res!982630 () Bool)

(assert (=> b!1451388 (=> (not res!982630) (not e!817195))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451388 (= res!982630 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451389 () Bool)

(declare-fun res!982622 () Bool)

(assert (=> b!1451389 (=> (not res!982622) (not e!817196))))

(assert (=> b!1451389 (= res!982622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451390 () Bool)

(assert (=> b!1451390 (= e!817199 e!817193)))

(declare-fun res!982629 () Bool)

(assert (=> b!1451390 (=> (not res!982629) (not e!817193))))

(declare-fun lt!636635 () SeekEntryResult!11722)

(assert (=> b!1451390 (= res!982629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47470 a!2862) j!93) mask!2687) (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!636635))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451390 (= lt!636635 (Intermediate!11722 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451391 () Bool)

(declare-fun res!982635 () Bool)

(assert (=> b!1451391 (=> (not res!982635) (not e!817196))))

(assert (=> b!1451391 (= res!982635 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48020 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48020 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48020 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451392 () Bool)

(declare-fun res!982624 () Bool)

(assert (=> b!1451392 (=> (not res!982624) (not e!817195))))

(assert (=> b!1451392 (= res!982624 e!817194)))

(declare-fun c!133890 () Bool)

(assert (=> b!1451392 (= c!133890 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451393 () Bool)

(declare-fun res!982623 () Bool)

(assert (=> b!1451393 (=> (not res!982623) (not e!817196))))

(declare-datatypes ((List!33971 0))(
  ( (Nil!33968) (Cons!33967 (h!35317 (_ BitVec 64)) (t!48665 List!33971)) )
))
(declare-fun arrayNoDuplicates!0 (array!98364 (_ BitVec 32) List!33971) Bool)

(assert (=> b!1451393 (= res!982623 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33968))))

(declare-fun b!1451394 () Bool)

(assert (=> b!1451394 (= e!817198 (and (or (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) (select (arr!47470 a!2862) j!93))) (or (and (= (select (arr!47470 a!2862) index!646) (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47470 a!2862) index!646) (select (arr!47470 a!2862) j!93))) (= (select (arr!47470 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451395 () Bool)

(declare-fun res!982628 () Bool)

(assert (=> b!1451395 (=> (not res!982628) (not e!817196))))

(assert (=> b!1451395 (= res!982628 (validKeyInArray!0 (select (arr!47470 a!2862) j!93)))))

(declare-fun b!1451396 () Bool)

(declare-fun res!982625 () Bool)

(assert (=> b!1451396 (=> (not res!982625) (not e!817193))))

(assert (=> b!1451396 (= res!982625 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!636635))))

(declare-fun b!1451397 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98364 (_ BitVec 32)) SeekEntryResult!11722)

(assert (=> b!1451397 (= e!817194 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636636 lt!636638 mask!2687) (seekEntryOrOpen!0 lt!636636 lt!636638 mask!2687)))))

(declare-fun res!982636 () Bool)

(assert (=> start!124916 (=> (not res!982636) (not e!817196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124916 (= res!982636 (validMask!0 mask!2687))))

(assert (=> start!124916 e!817196))

(assert (=> start!124916 true))

(declare-fun array_inv!36498 (array!98364) Bool)

(assert (=> start!124916 (array_inv!36498 a!2862)))

(declare-fun b!1451386 () Bool)

(declare-fun res!982634 () Bool)

(assert (=> b!1451386 (=> (not res!982634) (not e!817196))))

(assert (=> b!1451386 (= res!982634 (and (= (size!48020 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48020 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48020 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124916 res!982636) b!1451386))

(assert (= (and b!1451386 res!982634) b!1451383))

(assert (= (and b!1451383 res!982626) b!1451395))

(assert (= (and b!1451395 res!982628) b!1451389))

(assert (= (and b!1451389 res!982622) b!1451393))

(assert (= (and b!1451393 res!982623) b!1451391))

(assert (= (and b!1451391 res!982635) b!1451387))

(assert (= (and b!1451387 res!982633) b!1451390))

(assert (= (and b!1451390 res!982629) b!1451396))

(assert (= (and b!1451396 res!982625) b!1451385))

(assert (= (and b!1451385 res!982627) b!1451392))

(assert (= (and b!1451392 c!133890) b!1451382))

(assert (= (and b!1451392 (not c!133890)) b!1451397))

(assert (= (and b!1451392 res!982624) b!1451388))

(assert (= (and b!1451388 res!982630) b!1451381))

(assert (= (and b!1451381 res!982631) b!1451384))

(assert (= (and b!1451384 res!982632) b!1451394))

(declare-fun m!1339979 () Bool)

(assert (=> b!1451390 m!1339979))

(assert (=> b!1451390 m!1339979))

(declare-fun m!1339981 () Bool)

(assert (=> b!1451390 m!1339981))

(assert (=> b!1451390 m!1339981))

(assert (=> b!1451390 m!1339979))

(declare-fun m!1339983 () Bool)

(assert (=> b!1451390 m!1339983))

(assert (=> b!1451384 m!1339979))

(assert (=> b!1451384 m!1339979))

(declare-fun m!1339985 () Bool)

(assert (=> b!1451384 m!1339985))

(declare-fun m!1339987 () Bool)

(assert (=> b!1451389 m!1339987))

(declare-fun m!1339989 () Bool)

(assert (=> start!124916 m!1339989))

(declare-fun m!1339991 () Bool)

(assert (=> start!124916 m!1339991))

(declare-fun m!1339993 () Bool)

(assert (=> b!1451397 m!1339993))

(declare-fun m!1339995 () Bool)

(assert (=> b!1451397 m!1339995))

(declare-fun m!1339997 () Bool)

(assert (=> b!1451381 m!1339997))

(declare-fun m!1339999 () Bool)

(assert (=> b!1451381 m!1339999))

(declare-fun m!1340001 () Bool)

(assert (=> b!1451381 m!1340001))

(declare-fun m!1340003 () Bool)

(assert (=> b!1451381 m!1340003))

(declare-fun m!1340005 () Bool)

(assert (=> b!1451381 m!1340005))

(assert (=> b!1451381 m!1339979))

(assert (=> b!1451387 m!1339999))

(declare-fun m!1340007 () Bool)

(assert (=> b!1451387 m!1340007))

(assert (=> b!1451394 m!1339999))

(declare-fun m!1340009 () Bool)

(assert (=> b!1451394 m!1340009))

(assert (=> b!1451394 m!1340001))

(assert (=> b!1451394 m!1340003))

(assert (=> b!1451394 m!1339979))

(assert (=> b!1451395 m!1339979))

(assert (=> b!1451395 m!1339979))

(declare-fun m!1340011 () Bool)

(assert (=> b!1451395 m!1340011))

(declare-fun m!1340013 () Bool)

(assert (=> b!1451385 m!1340013))

(assert (=> b!1451385 m!1340013))

(declare-fun m!1340015 () Bool)

(assert (=> b!1451385 m!1340015))

(assert (=> b!1451385 m!1339999))

(declare-fun m!1340017 () Bool)

(assert (=> b!1451385 m!1340017))

(declare-fun m!1340019 () Bool)

(assert (=> b!1451383 m!1340019))

(assert (=> b!1451383 m!1340019))

(declare-fun m!1340021 () Bool)

(assert (=> b!1451383 m!1340021))

(assert (=> b!1451396 m!1339979))

(assert (=> b!1451396 m!1339979))

(declare-fun m!1340023 () Bool)

(assert (=> b!1451396 m!1340023))

(declare-fun m!1340025 () Bool)

(assert (=> b!1451393 m!1340025))

(declare-fun m!1340027 () Bool)

(assert (=> b!1451382 m!1340027))

(push 1)

(assert (not b!1451390))

(assert (not b!1451381))

(assert (not b!1451396))

(assert (not b!1451383))

(assert (not b!1451385))

(assert (not b!1451389))

(assert (not b!1451382))

