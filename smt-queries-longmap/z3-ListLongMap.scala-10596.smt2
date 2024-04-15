; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124684 () Bool)

(assert start!124684)

(declare-fun b!1445468 () Bool)

(declare-fun res!977434 () Bool)

(declare-fun e!814224 () Bool)

(assert (=> b!1445468 (=> (not res!977434) (not e!814224))))

(declare-datatypes ((array!98110 0))(
  ( (array!98111 (arr!47344 (Array (_ BitVec 32) (_ BitVec 64))) (size!47896 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98110)

(declare-datatypes ((List!33923 0))(
  ( (Nil!33920) (Cons!33919 (h!35269 (_ BitVec 64)) (t!48609 List!33923)) )
))
(declare-fun arrayNoDuplicates!0 (array!98110 (_ BitVec 32) List!33923) Bool)

(assert (=> b!1445468 (= res!977434 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33920))))

(declare-fun b!1445469 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814221 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445469 (= e!814221 (or (= (select (arr!47344 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47344 a!2862) intermediateBeforeIndex!19) (select (arr!47344 a!2862) j!93))))))

(declare-fun b!1445470 () Bool)

(declare-fun res!977445 () Bool)

(assert (=> b!1445470 (=> (not res!977445) (not e!814224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445470 (= res!977445 (validKeyInArray!0 (select (arr!47344 a!2862) j!93)))))

(declare-fun b!1445471 () Bool)

(declare-fun e!814218 () Bool)

(declare-fun e!814220 () Bool)

(assert (=> b!1445471 (= e!814218 e!814220)))

(declare-fun res!977443 () Bool)

(assert (=> b!1445471 (=> (not res!977443) (not e!814220))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11621 0))(
  ( (MissingZero!11621 (index!48876 (_ BitVec 32))) (Found!11621 (index!48877 (_ BitVec 32))) (Intermediate!11621 (undefined!12433 Bool) (index!48878 (_ BitVec 32)) (x!130561 (_ BitVec 32))) (Undefined!11621) (MissingVacant!11621 (index!48879 (_ BitVec 32))) )
))
(declare-fun lt!634330 () SeekEntryResult!11621)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445471 (= res!977443 (= lt!634330 (Intermediate!11621 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634331 () array!98110)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634328 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445471 (= lt!634330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634328 mask!2687) lt!634328 lt!634331 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445471 (= lt!634328 (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!977438 () Bool)

(assert (=> start!124684 (=> (not res!977438) (not e!814224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124684 (= res!977438 (validMask!0 mask!2687))))

(assert (=> start!124684 e!814224))

(assert (=> start!124684 true))

(declare-fun array_inv!36577 (array!98110) Bool)

(assert (=> start!124684 (array_inv!36577 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814219 () Bool)

(declare-fun b!1445472 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445472 (= e!814219 (= lt!634330 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634328 lt!634331 mask!2687)))))

(declare-fun b!1445473 () Bool)

(declare-fun e!814223 () Bool)

(assert (=> b!1445473 (= e!814224 e!814223)))

(declare-fun res!977432 () Bool)

(assert (=> b!1445473 (=> (not res!977432) (not e!814223))))

(assert (=> b!1445473 (= res!977432 (= (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445473 (= lt!634331 (array!98111 (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47896 a!2862)))))

(declare-fun b!1445474 () Bool)

(declare-fun res!977440 () Bool)

(assert (=> b!1445474 (=> (not res!977440) (not e!814220))))

(assert (=> b!1445474 (= res!977440 e!814219)))

(declare-fun c!133531 () Bool)

(assert (=> b!1445474 (= c!133531 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445475 () Bool)

(declare-fun res!977439 () Bool)

(assert (=> b!1445475 (=> (not res!977439) (not e!814224))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445475 (= res!977439 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47896 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47896 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47896 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445476 () Bool)

(declare-fun res!977444 () Bool)

(assert (=> b!1445476 (=> (not res!977444) (not e!814224))))

(assert (=> b!1445476 (= res!977444 (validKeyInArray!0 (select (arr!47344 a!2862) i!1006)))))

(declare-fun b!1445477 () Bool)

(assert (=> b!1445477 (= e!814220 (not (or (and (= (select (arr!47344 a!2862) index!646) (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47344 a!2862) index!646) (select (arr!47344 a!2862) j!93))) (not (= (select (arr!47344 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1445477 e!814221))

(declare-fun res!977435 () Bool)

(assert (=> b!1445477 (=> (not res!977435) (not e!814221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98110 (_ BitVec 32)) Bool)

(assert (=> b!1445477 (= res!977435 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48579 0))(
  ( (Unit!48580) )
))
(declare-fun lt!634332 () Unit!48579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48579)

(assert (=> b!1445477 (= lt!634332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11621)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11621)

(assert (=> b!1445478 (= e!814219 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634328 lt!634331 mask!2687) (seekEntryOrOpen!0 lt!634328 lt!634331 mask!2687)))))

(declare-fun b!1445479 () Bool)

(assert (=> b!1445479 (= e!814223 e!814218)))

(declare-fun res!977442 () Bool)

(assert (=> b!1445479 (=> (not res!977442) (not e!814218))))

(declare-fun lt!634329 () SeekEntryResult!11621)

(assert (=> b!1445479 (= res!977442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47344 a!2862) j!93) mask!2687) (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!634329))))

(assert (=> b!1445479 (= lt!634329 (Intermediate!11621 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445480 () Bool)

(declare-fun res!977446 () Bool)

(assert (=> b!1445480 (=> (not res!977446) (not e!814224))))

(assert (=> b!1445480 (= res!977446 (and (= (size!47896 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47896 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47896 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445481 () Bool)

(declare-fun res!977433 () Bool)

(assert (=> b!1445481 (=> (not res!977433) (not e!814221))))

(assert (=> b!1445481 (= res!977433 (= (seekEntryOrOpen!0 (select (arr!47344 a!2862) j!93) a!2862 mask!2687) (Found!11621 j!93)))))

(declare-fun b!1445482 () Bool)

(declare-fun res!977441 () Bool)

(assert (=> b!1445482 (=> (not res!977441) (not e!814220))))

(assert (=> b!1445482 (= res!977441 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445483 () Bool)

(declare-fun res!977436 () Bool)

(assert (=> b!1445483 (=> (not res!977436) (not e!814224))))

(assert (=> b!1445483 (= res!977436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445484 () Bool)

(declare-fun res!977437 () Bool)

(assert (=> b!1445484 (=> (not res!977437) (not e!814218))))

(assert (=> b!1445484 (= res!977437 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!634329))))

(assert (= (and start!124684 res!977438) b!1445480))

(assert (= (and b!1445480 res!977446) b!1445476))

(assert (= (and b!1445476 res!977444) b!1445470))

(assert (= (and b!1445470 res!977445) b!1445483))

(assert (= (and b!1445483 res!977436) b!1445468))

(assert (= (and b!1445468 res!977434) b!1445475))

(assert (= (and b!1445475 res!977439) b!1445473))

(assert (= (and b!1445473 res!977432) b!1445479))

(assert (= (and b!1445479 res!977442) b!1445484))

(assert (= (and b!1445484 res!977437) b!1445471))

(assert (= (and b!1445471 res!977443) b!1445474))

(assert (= (and b!1445474 c!133531) b!1445472))

(assert (= (and b!1445474 (not c!133531)) b!1445478))

(assert (= (and b!1445474 res!977440) b!1445482))

(assert (= (and b!1445482 res!977441) b!1445477))

(assert (= (and b!1445477 res!977435) b!1445481))

(assert (= (and b!1445481 res!977433) b!1445469))

(declare-fun m!1333923 () Bool)

(assert (=> b!1445471 m!1333923))

(assert (=> b!1445471 m!1333923))

(declare-fun m!1333925 () Bool)

(assert (=> b!1445471 m!1333925))

(declare-fun m!1333927 () Bool)

(assert (=> b!1445471 m!1333927))

(declare-fun m!1333929 () Bool)

(assert (=> b!1445471 m!1333929))

(declare-fun m!1333931 () Bool)

(assert (=> b!1445478 m!1333931))

(declare-fun m!1333933 () Bool)

(assert (=> b!1445478 m!1333933))

(declare-fun m!1333935 () Bool)

(assert (=> b!1445469 m!1333935))

(declare-fun m!1333937 () Bool)

(assert (=> b!1445469 m!1333937))

(declare-fun m!1333939 () Bool)

(assert (=> b!1445477 m!1333939))

(assert (=> b!1445477 m!1333927))

(declare-fun m!1333941 () Bool)

(assert (=> b!1445477 m!1333941))

(declare-fun m!1333943 () Bool)

(assert (=> b!1445477 m!1333943))

(declare-fun m!1333945 () Bool)

(assert (=> b!1445477 m!1333945))

(assert (=> b!1445477 m!1333937))

(declare-fun m!1333947 () Bool)

(assert (=> b!1445476 m!1333947))

(assert (=> b!1445476 m!1333947))

(declare-fun m!1333949 () Bool)

(assert (=> b!1445476 m!1333949))

(declare-fun m!1333951 () Bool)

(assert (=> b!1445468 m!1333951))

(assert (=> b!1445470 m!1333937))

(assert (=> b!1445470 m!1333937))

(declare-fun m!1333953 () Bool)

(assert (=> b!1445470 m!1333953))

(assert (=> b!1445481 m!1333937))

(assert (=> b!1445481 m!1333937))

(declare-fun m!1333955 () Bool)

(assert (=> b!1445481 m!1333955))

(assert (=> b!1445473 m!1333927))

(declare-fun m!1333957 () Bool)

(assert (=> b!1445473 m!1333957))

(declare-fun m!1333959 () Bool)

(assert (=> start!124684 m!1333959))

(declare-fun m!1333961 () Bool)

(assert (=> start!124684 m!1333961))

(declare-fun m!1333963 () Bool)

(assert (=> b!1445483 m!1333963))

(assert (=> b!1445479 m!1333937))

(assert (=> b!1445479 m!1333937))

(declare-fun m!1333965 () Bool)

(assert (=> b!1445479 m!1333965))

(assert (=> b!1445479 m!1333965))

(assert (=> b!1445479 m!1333937))

(declare-fun m!1333967 () Bool)

(assert (=> b!1445479 m!1333967))

(assert (=> b!1445484 m!1333937))

(assert (=> b!1445484 m!1333937))

(declare-fun m!1333969 () Bool)

(assert (=> b!1445484 m!1333969))

(declare-fun m!1333971 () Bool)

(assert (=> b!1445472 m!1333971))

(check-sat (not b!1445472) (not start!124684) (not b!1445468) (not b!1445484) (not b!1445481) (not b!1445479) (not b!1445477) (not b!1445483) (not b!1445476) (not b!1445478) (not b!1445471) (not b!1445470))
(check-sat)
