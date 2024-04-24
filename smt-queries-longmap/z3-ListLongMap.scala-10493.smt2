; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123766 () Bool)

(assert start!123766)

(declare-fun b!1433438 () Bool)

(declare-fun res!966469 () Bool)

(declare-fun e!809318 () Bool)

(assert (=> b!1433438 (=> (not res!966469) (not e!809318))))

(declare-datatypes ((SeekEntryResult!11294 0))(
  ( (MissingZero!11294 (index!47568 (_ BitVec 32))) (Found!11294 (index!47569 (_ BitVec 32))) (Intermediate!11294 (undefined!12106 Bool) (index!47570 (_ BitVec 32)) (x!129376 (_ BitVec 32))) (Undefined!11294) (MissingVacant!11294 (index!47571 (_ BitVec 32))) )
))
(declare-fun lt!630938 () SeekEntryResult!11294)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!630934 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((array!97619 0))(
  ( (array!97620 (arr!47113 (Array (_ BitVec 32) (_ BitVec 64))) (size!47664 (_ BitVec 32))) )
))
(declare-fun lt!630935 () array!97619)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97619 (_ BitVec 32)) SeekEntryResult!11294)

(assert (=> b!1433438 (= res!966469 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630934 lt!630935 mask!2608) lt!630938))))

(declare-fun b!1433439 () Bool)

(declare-fun e!809319 () Bool)

(declare-fun e!809317 () Bool)

(assert (=> b!1433439 (= e!809319 e!809317)))

(declare-fun res!966465 () Bool)

(assert (=> b!1433439 (=> (not res!966465) (not e!809317))))

(declare-fun lt!630937 () SeekEntryResult!11294)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433439 (= res!966465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47113 a!2831) j!81) mask!2608) (select (arr!47113 a!2831) j!81) a!2831 mask!2608) lt!630937))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433439 (= lt!630937 (Intermediate!11294 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!966474 () Bool)

(assert (=> start!123766 (=> (not res!966474) (not e!809319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123766 (= res!966474 (validMask!0 mask!2608))))

(assert (=> start!123766 e!809319))

(assert (=> start!123766 true))

(declare-fun array_inv!36394 (array!97619) Bool)

(assert (=> start!123766 (array_inv!36394 a!2831)))

(declare-fun e!809320 () Bool)

(declare-fun b!1433440 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97619 (_ BitVec 32)) SeekEntryResult!11294)

(assert (=> b!1433440 (= e!809320 (= (seekEntryOrOpen!0 (select (arr!47113 a!2831) j!81) a!2831 mask!2608) (Found!11294 j!81)))))

(declare-fun b!1433441 () Bool)

(declare-fun res!966466 () Bool)

(assert (=> b!1433441 (=> (not res!966466) (not e!809319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97619 (_ BitVec 32)) Bool)

(assert (=> b!1433441 (= res!966466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433442 () Bool)

(declare-fun e!809321 () Bool)

(assert (=> b!1433442 (= e!809321 true)))

(declare-fun lt!630933 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433442 (= lt!630933 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433443 () Bool)

(assert (=> b!1433443 (= e!809317 e!809318)))

(declare-fun res!966476 () Bool)

(assert (=> b!1433443 (=> (not res!966476) (not e!809318))))

(assert (=> b!1433443 (= res!966476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630934 mask!2608) lt!630934 lt!630935 mask!2608) lt!630938))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433443 (= lt!630938 (Intermediate!11294 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433443 (= lt!630934 (select (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433443 (= lt!630935 (array!97620 (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47664 a!2831)))))

(declare-fun b!1433444 () Bool)

(declare-fun res!966472 () Bool)

(assert (=> b!1433444 (=> (not res!966472) (not e!809318))))

(assert (=> b!1433444 (= res!966472 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433445 () Bool)

(declare-fun res!966473 () Bool)

(assert (=> b!1433445 (=> (not res!966473) (not e!809319))))

(assert (=> b!1433445 (= res!966473 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47664 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47664 a!2831))))))

(declare-fun b!1433446 () Bool)

(assert (=> b!1433446 (= e!809318 (not e!809321))))

(declare-fun res!966477 () Bool)

(assert (=> b!1433446 (=> res!966477 e!809321)))

(assert (=> b!1433446 (= res!966477 (or (= (select (arr!47113 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47113 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47113 a!2831) index!585) (select (arr!47113 a!2831) j!81)) (= (select (store (arr!47113 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433446 e!809320))

(declare-fun res!966471 () Bool)

(assert (=> b!1433446 (=> (not res!966471) (not e!809320))))

(assert (=> b!1433446 (= res!966471 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48365 0))(
  ( (Unit!48366) )
))
(declare-fun lt!630936 () Unit!48365)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48365)

(assert (=> b!1433446 (= lt!630936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433447 () Bool)

(declare-fun res!966470 () Bool)

(assert (=> b!1433447 (=> (not res!966470) (not e!809319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433447 (= res!966470 (validKeyInArray!0 (select (arr!47113 a!2831) i!982)))))

(declare-fun b!1433448 () Bool)

(declare-fun res!966468 () Bool)

(assert (=> b!1433448 (=> (not res!966468) (not e!809319))))

(declare-datatypes ((List!33610 0))(
  ( (Nil!33607) (Cons!33606 (h!34940 (_ BitVec 64)) (t!48296 List!33610)) )
))
(declare-fun arrayNoDuplicates!0 (array!97619 (_ BitVec 32) List!33610) Bool)

(assert (=> b!1433448 (= res!966468 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33607))))

(declare-fun b!1433449 () Bool)

(declare-fun res!966475 () Bool)

(assert (=> b!1433449 (=> (not res!966475) (not e!809319))))

(assert (=> b!1433449 (= res!966475 (validKeyInArray!0 (select (arr!47113 a!2831) j!81)))))

(declare-fun b!1433450 () Bool)

(declare-fun res!966478 () Bool)

(assert (=> b!1433450 (=> (not res!966478) (not e!809319))))

(assert (=> b!1433450 (= res!966478 (and (= (size!47664 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47664 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47664 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433451 () Bool)

(declare-fun res!966467 () Bool)

(assert (=> b!1433451 (=> (not res!966467) (not e!809318))))

(assert (=> b!1433451 (= res!966467 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47113 a!2831) j!81) a!2831 mask!2608) lt!630937))))

(assert (= (and start!123766 res!966474) b!1433450))

(assert (= (and b!1433450 res!966478) b!1433447))

(assert (= (and b!1433447 res!966470) b!1433449))

(assert (= (and b!1433449 res!966475) b!1433441))

(assert (= (and b!1433441 res!966466) b!1433448))

(assert (= (and b!1433448 res!966468) b!1433445))

(assert (= (and b!1433445 res!966473) b!1433439))

(assert (= (and b!1433439 res!966465) b!1433443))

(assert (= (and b!1433443 res!966476) b!1433451))

(assert (= (and b!1433451 res!966467) b!1433438))

(assert (= (and b!1433438 res!966469) b!1433444))

(assert (= (and b!1433444 res!966472) b!1433446))

(assert (= (and b!1433446 res!966471) b!1433440))

(assert (= (and b!1433446 (not res!966477)) b!1433442))

(declare-fun m!1323331 () Bool)

(assert (=> b!1433438 m!1323331))

(declare-fun m!1323333 () Bool)

(assert (=> start!123766 m!1323333))

(declare-fun m!1323335 () Bool)

(assert (=> start!123766 m!1323335))

(declare-fun m!1323337 () Bool)

(assert (=> b!1433441 m!1323337))

(declare-fun m!1323339 () Bool)

(assert (=> b!1433451 m!1323339))

(assert (=> b!1433451 m!1323339))

(declare-fun m!1323341 () Bool)

(assert (=> b!1433451 m!1323341))

(declare-fun m!1323343 () Bool)

(assert (=> b!1433448 m!1323343))

(assert (=> b!1433439 m!1323339))

(assert (=> b!1433439 m!1323339))

(declare-fun m!1323345 () Bool)

(assert (=> b!1433439 m!1323345))

(assert (=> b!1433439 m!1323345))

(assert (=> b!1433439 m!1323339))

(declare-fun m!1323347 () Bool)

(assert (=> b!1433439 m!1323347))

(assert (=> b!1433449 m!1323339))

(assert (=> b!1433449 m!1323339))

(declare-fun m!1323349 () Bool)

(assert (=> b!1433449 m!1323349))

(declare-fun m!1323351 () Bool)

(assert (=> b!1433443 m!1323351))

(assert (=> b!1433443 m!1323351))

(declare-fun m!1323353 () Bool)

(assert (=> b!1433443 m!1323353))

(declare-fun m!1323355 () Bool)

(assert (=> b!1433443 m!1323355))

(declare-fun m!1323357 () Bool)

(assert (=> b!1433443 m!1323357))

(declare-fun m!1323359 () Bool)

(assert (=> b!1433447 m!1323359))

(assert (=> b!1433447 m!1323359))

(declare-fun m!1323361 () Bool)

(assert (=> b!1433447 m!1323361))

(assert (=> b!1433446 m!1323355))

(declare-fun m!1323363 () Bool)

(assert (=> b!1433446 m!1323363))

(declare-fun m!1323365 () Bool)

(assert (=> b!1433446 m!1323365))

(declare-fun m!1323367 () Bool)

(assert (=> b!1433446 m!1323367))

(assert (=> b!1433446 m!1323339))

(declare-fun m!1323369 () Bool)

(assert (=> b!1433446 m!1323369))

(assert (=> b!1433440 m!1323339))

(assert (=> b!1433440 m!1323339))

(declare-fun m!1323371 () Bool)

(assert (=> b!1433440 m!1323371))

(declare-fun m!1323373 () Bool)

(assert (=> b!1433442 m!1323373))

(check-sat (not b!1433439) (not b!1433446) (not b!1433441) (not b!1433448) (not b!1433443) (not b!1433442) (not b!1433451) (not b!1433440) (not b!1433447) (not b!1433438) (not b!1433449) (not start!123766))
(check-sat)
