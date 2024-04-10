; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124712 () Bool)

(assert start!124712)

(declare-fun b!1445612 () Bool)

(declare-fun res!977469 () Bool)

(declare-fun e!814317 () Bool)

(assert (=> b!1445612 (=> (not res!977469) (not e!814317))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98160 0))(
  ( (array!98161 (arr!47368 (Array (_ BitVec 32) (_ BitVec 64))) (size!47918 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98160)

(assert (=> b!1445612 (= res!977469 (and (= (size!47918 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47918 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47918 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!977467 () Bool)

(assert (=> start!124712 (=> (not res!977467) (not e!814317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124712 (= res!977467 (validMask!0 mask!2687))))

(assert (=> start!124712 e!814317))

(assert (=> start!124712 true))

(declare-fun array_inv!36396 (array!98160) Bool)

(assert (=> start!124712 (array_inv!36396 a!2862)))

(declare-fun b!1445613 () Bool)

(declare-fun e!814315 () Bool)

(declare-fun e!814314 () Bool)

(assert (=> b!1445613 (= e!814315 e!814314)))

(declare-fun res!977471 () Bool)

(assert (=> b!1445613 (=> (not res!977471) (not e!814314))))

(declare-datatypes ((SeekEntryResult!11620 0))(
  ( (MissingZero!11620 (index!48872 (_ BitVec 32))) (Found!11620 (index!48873 (_ BitVec 32))) (Intermediate!11620 (undefined!12432 Bool) (index!48874 (_ BitVec 32)) (x!130557 (_ BitVec 32))) (Undefined!11620) (MissingVacant!11620 (index!48875 (_ BitVec 32))) )
))
(declare-fun lt!634551 () SeekEntryResult!11620)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98160 (_ BitVec 32)) SeekEntryResult!11620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445613 (= res!977471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47368 a!2862) j!93) mask!2687) (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634551))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445613 (= lt!634551 (Intermediate!11620 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445614 () Bool)

(declare-fun res!977478 () Bool)

(declare-fun e!814316 () Bool)

(assert (=> b!1445614 (=> (not res!977478) (not e!814316))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445614 (= res!977478 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445615 () Bool)

(declare-fun res!977472 () Bool)

(assert (=> b!1445615 (=> (not res!977472) (not e!814317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445615 (= res!977472 (validKeyInArray!0 (select (arr!47368 a!2862) j!93)))))

(declare-fun b!1445616 () Bool)

(assert (=> b!1445616 (= e!814316 (not true))))

(declare-fun e!814313 () Bool)

(assert (=> b!1445616 e!814313))

(declare-fun res!977470 () Bool)

(assert (=> b!1445616 (=> (not res!977470) (not e!814313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98160 (_ BitVec 32)) Bool)

(assert (=> b!1445616 (= res!977470 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48736 0))(
  ( (Unit!48737) )
))
(declare-fun lt!634550 () Unit!48736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48736)

(assert (=> b!1445616 (= lt!634550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445617 () Bool)

(assert (=> b!1445617 (= e!814313 (or (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47368 a!2862) intermediateBeforeIndex!19) (select (arr!47368 a!2862) j!93))))))

(declare-fun b!1445618 () Bool)

(declare-fun lt!634547 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!634549 () array!98160)

(declare-fun e!814318 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98160 (_ BitVec 32)) SeekEntryResult!11620)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98160 (_ BitVec 32)) SeekEntryResult!11620)

(assert (=> b!1445618 (= e!814318 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634547 lt!634549 mask!2687) (seekEntryOrOpen!0 lt!634547 lt!634549 mask!2687)))))

(declare-fun b!1445619 () Bool)

(assert (=> b!1445619 (= e!814317 e!814315)))

(declare-fun res!977474 () Bool)

(assert (=> b!1445619 (=> (not res!977474) (not e!814315))))

(assert (=> b!1445619 (= res!977474 (= (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445619 (= lt!634549 (array!98161 (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47918 a!2862)))))

(declare-fun b!1445620 () Bool)

(declare-fun res!977468 () Bool)

(assert (=> b!1445620 (=> (not res!977468) (not e!814313))))

(assert (=> b!1445620 (= res!977468 (= (seekEntryOrOpen!0 (select (arr!47368 a!2862) j!93) a!2862 mask!2687) (Found!11620 j!93)))))

(declare-fun b!1445621 () Bool)

(declare-fun res!977475 () Bool)

(assert (=> b!1445621 (=> (not res!977475) (not e!814317))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445621 (= res!977475 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47918 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47918 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47918 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445622 () Bool)

(declare-fun res!977476 () Bool)

(assert (=> b!1445622 (=> (not res!977476) (not e!814317))))

(declare-datatypes ((List!33869 0))(
  ( (Nil!33866) (Cons!33865 (h!35215 (_ BitVec 64)) (t!48563 List!33869)) )
))
(declare-fun arrayNoDuplicates!0 (array!98160 (_ BitVec 32) List!33869) Bool)

(assert (=> b!1445622 (= res!977476 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33866))))

(declare-fun b!1445623 () Bool)

(declare-fun res!977473 () Bool)

(assert (=> b!1445623 (=> (not res!977473) (not e!814314))))

(assert (=> b!1445623 (= res!977473 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47368 a!2862) j!93) a!2862 mask!2687) lt!634551))))

(declare-fun lt!634548 () SeekEntryResult!11620)

(declare-fun b!1445624 () Bool)

(assert (=> b!1445624 (= e!814318 (= lt!634548 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634547 lt!634549 mask!2687)))))

(declare-fun b!1445625 () Bool)

(declare-fun res!977479 () Bool)

(assert (=> b!1445625 (=> (not res!977479) (not e!814317))))

(assert (=> b!1445625 (= res!977479 (validKeyInArray!0 (select (arr!47368 a!2862) i!1006)))))

(declare-fun b!1445626 () Bool)

(declare-fun res!977477 () Bool)

(assert (=> b!1445626 (=> (not res!977477) (not e!814316))))

(assert (=> b!1445626 (= res!977477 e!814318)))

(declare-fun c!133584 () Bool)

(assert (=> b!1445626 (= c!133584 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445627 () Bool)

(assert (=> b!1445627 (= e!814314 e!814316)))

(declare-fun res!977466 () Bool)

(assert (=> b!1445627 (=> (not res!977466) (not e!814316))))

(assert (=> b!1445627 (= res!977466 (= lt!634548 (Intermediate!11620 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445627 (= lt!634548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634547 mask!2687) lt!634547 lt!634549 mask!2687))))

(assert (=> b!1445627 (= lt!634547 (select (store (arr!47368 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445628 () Bool)

(declare-fun res!977465 () Bool)

(assert (=> b!1445628 (=> (not res!977465) (not e!814317))))

(assert (=> b!1445628 (= res!977465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124712 res!977467) b!1445612))

(assert (= (and b!1445612 res!977469) b!1445625))

(assert (= (and b!1445625 res!977479) b!1445615))

(assert (= (and b!1445615 res!977472) b!1445628))

(assert (= (and b!1445628 res!977465) b!1445622))

(assert (= (and b!1445622 res!977476) b!1445621))

(assert (= (and b!1445621 res!977475) b!1445619))

(assert (= (and b!1445619 res!977474) b!1445613))

(assert (= (and b!1445613 res!977471) b!1445623))

(assert (= (and b!1445623 res!977473) b!1445627))

(assert (= (and b!1445627 res!977466) b!1445626))

(assert (= (and b!1445626 c!133584) b!1445624))

(assert (= (and b!1445626 (not c!133584)) b!1445618))

(assert (= (and b!1445626 res!977477) b!1445614))

(assert (= (and b!1445614 res!977478) b!1445616))

(assert (= (and b!1445616 res!977470) b!1445620))

(assert (= (and b!1445620 res!977468) b!1445617))

(declare-fun m!1334553 () Bool)

(assert (=> b!1445623 m!1334553))

(assert (=> b!1445623 m!1334553))

(declare-fun m!1334555 () Bool)

(assert (=> b!1445623 m!1334555))

(declare-fun m!1334557 () Bool)

(assert (=> b!1445622 m!1334557))

(declare-fun m!1334559 () Bool)

(assert (=> b!1445625 m!1334559))

(assert (=> b!1445625 m!1334559))

(declare-fun m!1334561 () Bool)

(assert (=> b!1445625 m!1334561))

(assert (=> b!1445613 m!1334553))

(assert (=> b!1445613 m!1334553))

(declare-fun m!1334563 () Bool)

(assert (=> b!1445613 m!1334563))

(assert (=> b!1445613 m!1334563))

(assert (=> b!1445613 m!1334553))

(declare-fun m!1334565 () Bool)

(assert (=> b!1445613 m!1334565))

(declare-fun m!1334567 () Bool)

(assert (=> b!1445628 m!1334567))

(declare-fun m!1334569 () Bool)

(assert (=> b!1445624 m!1334569))

(declare-fun m!1334571 () Bool)

(assert (=> start!124712 m!1334571))

(declare-fun m!1334573 () Bool)

(assert (=> start!124712 m!1334573))

(declare-fun m!1334575 () Bool)

(assert (=> b!1445616 m!1334575))

(declare-fun m!1334577 () Bool)

(assert (=> b!1445616 m!1334577))

(declare-fun m!1334579 () Bool)

(assert (=> b!1445619 m!1334579))

(declare-fun m!1334581 () Bool)

(assert (=> b!1445619 m!1334581))

(declare-fun m!1334583 () Bool)

(assert (=> b!1445618 m!1334583))

(declare-fun m!1334585 () Bool)

(assert (=> b!1445618 m!1334585))

(declare-fun m!1334587 () Bool)

(assert (=> b!1445627 m!1334587))

(assert (=> b!1445627 m!1334587))

(declare-fun m!1334589 () Bool)

(assert (=> b!1445627 m!1334589))

(assert (=> b!1445627 m!1334579))

(declare-fun m!1334591 () Bool)

(assert (=> b!1445627 m!1334591))

(assert (=> b!1445620 m!1334553))

(assert (=> b!1445620 m!1334553))

(declare-fun m!1334593 () Bool)

(assert (=> b!1445620 m!1334593))

(assert (=> b!1445615 m!1334553))

(assert (=> b!1445615 m!1334553))

(declare-fun m!1334595 () Bool)

(assert (=> b!1445615 m!1334595))

(declare-fun m!1334597 () Bool)

(assert (=> b!1445617 m!1334597))

(assert (=> b!1445617 m!1334553))

(push 1)

