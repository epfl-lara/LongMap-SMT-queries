; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123476 () Bool)

(assert start!123476)

(declare-fun b!1430274 () Bool)

(declare-fun res!964028 () Bool)

(declare-fun e!807831 () Bool)

(assert (=> b!1430274 (=> (not res!964028) (not e!807831))))

(declare-datatypes ((array!97508 0))(
  ( (array!97509 (arr!47062 (Array (_ BitVec 32) (_ BitVec 64))) (size!47613 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97508)

(declare-datatypes ((List!33559 0))(
  ( (Nil!33556) (Cons!33555 (h!34880 (_ BitVec 64)) (t!48245 List!33559)) )
))
(declare-fun arrayNoDuplicates!0 (array!97508 (_ BitVec 32) List!33559) Bool)

(assert (=> b!1430274 (= res!964028 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33556))))

(declare-fun b!1430276 () Bool)

(declare-fun e!807833 () Bool)

(assert (=> b!1430276 (= e!807831 e!807833)))

(declare-fun res!964018 () Bool)

(assert (=> b!1430276 (=> (not res!964018) (not e!807833))))

(declare-datatypes ((SeekEntryResult!11243 0))(
  ( (MissingZero!11243 (index!47364 (_ BitVec 32))) (Found!11243 (index!47365 (_ BitVec 32))) (Intermediate!11243 (undefined!12055 Bool) (index!47366 (_ BitVec 32)) (x!129166 (_ BitVec 32))) (Undefined!11243) (MissingVacant!11243 (index!47367 (_ BitVec 32))) )
))
(declare-fun lt!629662 () SeekEntryResult!11243)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97508 (_ BitVec 32)) SeekEntryResult!11243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430276 (= res!964018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!629662))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1430276 (= lt!629662 (Intermediate!11243 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430277 () Bool)

(declare-fun e!807829 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97508 (_ BitVec 32)) SeekEntryResult!11243)

(assert (=> b!1430277 (= e!807829 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) (Found!11243 j!81)))))

(declare-fun b!1430278 () Bool)

(declare-fun res!964030 () Bool)

(assert (=> b!1430278 (=> (not res!964030) (not e!807831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97508 (_ BitVec 32)) Bool)

(assert (=> b!1430278 (= res!964030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430279 () Bool)

(declare-fun res!964029 () Bool)

(assert (=> b!1430279 (=> (not res!964029) (not e!807831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430279 (= res!964029 (validKeyInArray!0 (select (arr!47062 a!2831) j!81)))))

(declare-fun b!1430280 () Bool)

(declare-fun res!964019 () Bool)

(assert (=> b!1430280 (=> (not res!964019) (not e!807831))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430280 (= res!964019 (validKeyInArray!0 (select (arr!47062 a!2831) i!982)))))

(declare-fun b!1430281 () Bool)

(declare-fun res!964027 () Bool)

(declare-fun e!807832 () Bool)

(assert (=> b!1430281 (=> (not res!964027) (not e!807832))))

(declare-fun lt!629660 () (_ BitVec 64))

(declare-fun lt!629659 () array!97508)

(declare-fun lt!629663 () SeekEntryResult!11243)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1430281 (= res!964027 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629660 lt!629659 mask!2608) lt!629663))))

(declare-fun b!1430282 () Bool)

(declare-fun res!964021 () Bool)

(assert (=> b!1430282 (=> (not res!964021) (not e!807832))))

(assert (=> b!1430282 (= res!964021 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!629662))))

(declare-fun b!1430283 () Bool)

(declare-fun res!964024 () Bool)

(assert (=> b!1430283 (=> (not res!964024) (not e!807832))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1430283 (= res!964024 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430284 () Bool)

(assert (=> b!1430284 (= e!807832 (not true))))

(assert (=> b!1430284 e!807829))

(declare-fun res!964026 () Bool)

(assert (=> b!1430284 (=> (not res!964026) (not e!807829))))

(assert (=> b!1430284 (= res!964026 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48263 0))(
  ( (Unit!48264) )
))
(declare-fun lt!629661 () Unit!48263)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48263)

(assert (=> b!1430284 (= lt!629661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430285 () Bool)

(declare-fun res!964025 () Bool)

(assert (=> b!1430285 (=> (not res!964025) (not e!807831))))

(assert (=> b!1430285 (= res!964025 (and (= (size!47613 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47613 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47613 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430286 () Bool)

(declare-fun res!964020 () Bool)

(assert (=> b!1430286 (=> (not res!964020) (not e!807831))))

(assert (=> b!1430286 (= res!964020 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47613 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47613 a!2831))))))

(declare-fun b!1430275 () Bool)

(assert (=> b!1430275 (= e!807833 e!807832)))

(declare-fun res!964022 () Bool)

(assert (=> b!1430275 (=> (not res!964022) (not e!807832))))

(assert (=> b!1430275 (= res!964022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629660 mask!2608) lt!629660 lt!629659 mask!2608) lt!629663))))

(assert (=> b!1430275 (= lt!629663 (Intermediate!11243 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430275 (= lt!629660 (select (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430275 (= lt!629659 (array!97509 (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47613 a!2831)))))

(declare-fun res!964023 () Bool)

(assert (=> start!123476 (=> (not res!964023) (not e!807831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123476 (= res!964023 (validMask!0 mask!2608))))

(assert (=> start!123476 e!807831))

(assert (=> start!123476 true))

(declare-fun array_inv!36343 (array!97508) Bool)

(assert (=> start!123476 (array_inv!36343 a!2831)))

(assert (= (and start!123476 res!964023) b!1430285))

(assert (= (and b!1430285 res!964025) b!1430280))

(assert (= (and b!1430280 res!964019) b!1430279))

(assert (= (and b!1430279 res!964029) b!1430278))

(assert (= (and b!1430278 res!964030) b!1430274))

(assert (= (and b!1430274 res!964028) b!1430286))

(assert (= (and b!1430286 res!964020) b!1430276))

(assert (= (and b!1430276 res!964018) b!1430275))

(assert (= (and b!1430275 res!964022) b!1430282))

(assert (= (and b!1430282 res!964021) b!1430281))

(assert (= (and b!1430281 res!964027) b!1430283))

(assert (= (and b!1430283 res!964024) b!1430284))

(assert (= (and b!1430284 res!964026) b!1430277))

(declare-fun m!1320507 () Bool)

(assert (=> b!1430275 m!1320507))

(assert (=> b!1430275 m!1320507))

(declare-fun m!1320509 () Bool)

(assert (=> b!1430275 m!1320509))

(declare-fun m!1320511 () Bool)

(assert (=> b!1430275 m!1320511))

(declare-fun m!1320513 () Bool)

(assert (=> b!1430275 m!1320513))

(declare-fun m!1320515 () Bool)

(assert (=> b!1430279 m!1320515))

(assert (=> b!1430279 m!1320515))

(declare-fun m!1320517 () Bool)

(assert (=> b!1430279 m!1320517))

(declare-fun m!1320519 () Bool)

(assert (=> b!1430274 m!1320519))

(assert (=> b!1430282 m!1320515))

(assert (=> b!1430282 m!1320515))

(declare-fun m!1320521 () Bool)

(assert (=> b!1430282 m!1320521))

(assert (=> b!1430276 m!1320515))

(assert (=> b!1430276 m!1320515))

(declare-fun m!1320523 () Bool)

(assert (=> b!1430276 m!1320523))

(assert (=> b!1430276 m!1320523))

(assert (=> b!1430276 m!1320515))

(declare-fun m!1320525 () Bool)

(assert (=> b!1430276 m!1320525))

(declare-fun m!1320527 () Bool)

(assert (=> b!1430284 m!1320527))

(declare-fun m!1320529 () Bool)

(assert (=> b!1430284 m!1320529))

(declare-fun m!1320531 () Bool)

(assert (=> b!1430281 m!1320531))

(declare-fun m!1320533 () Bool)

(assert (=> b!1430278 m!1320533))

(declare-fun m!1320535 () Bool)

(assert (=> b!1430280 m!1320535))

(assert (=> b!1430280 m!1320535))

(declare-fun m!1320537 () Bool)

(assert (=> b!1430280 m!1320537))

(assert (=> b!1430277 m!1320515))

(assert (=> b!1430277 m!1320515))

(declare-fun m!1320539 () Bool)

(assert (=> b!1430277 m!1320539))

(declare-fun m!1320541 () Bool)

(assert (=> start!123476 m!1320541))

(declare-fun m!1320543 () Bool)

(assert (=> start!123476 m!1320543))

(check-sat (not b!1430275) (not b!1430280) (not b!1430282) (not b!1430279) (not b!1430276) (not start!123476) (not b!1430274) (not b!1430278) (not b!1430284) (not b!1430281) (not b!1430277))
(check-sat)
