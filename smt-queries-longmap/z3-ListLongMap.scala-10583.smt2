; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124606 () Bool)

(assert start!124606)

(declare-fun b!1443436 () Bool)

(declare-fun e!813371 () Bool)

(declare-fun e!813372 () Bool)

(assert (=> b!1443436 (= e!813371 e!813372)))

(declare-fun res!975649 () Bool)

(assert (=> b!1443436 (=> (not res!975649) (not e!813372))))

(declare-datatypes ((SeekEntryResult!11582 0))(
  ( (MissingZero!11582 (index!48720 (_ BitVec 32))) (Found!11582 (index!48721 (_ BitVec 32))) (Intermediate!11582 (undefined!12394 Bool) (index!48722 (_ BitVec 32)) (x!130418 (_ BitVec 32))) (Undefined!11582) (MissingVacant!11582 (index!48723 (_ BitVec 32))) )
))
(declare-fun lt!633696 () SeekEntryResult!11582)

(declare-datatypes ((array!98032 0))(
  ( (array!98033 (arr!47305 (Array (_ BitVec 32) (_ BitVec 64))) (size!47857 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98032)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443436 (= res!975649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47305 a!2862) j!93) mask!2687) (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633696))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443436 (= lt!633696 (Intermediate!11582 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!633691 () array!98032)

(declare-fun e!813367 () Bool)

(declare-fun lt!633694 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1443437 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11582)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98032 (_ BitVec 32)) SeekEntryResult!11582)

(assert (=> b!1443437 (= e!813367 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633694 lt!633691 mask!2687) (seekEntryOrOpen!0 lt!633694 lt!633691 mask!2687)))))

(declare-fun b!1443438 () Bool)

(declare-fun res!975648 () Bool)

(declare-fun e!813370 () Bool)

(assert (=> b!1443438 (=> (not res!975648) (not e!813370))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443438 (= res!975648 (and (= (size!47857 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47857 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47857 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975647 () Bool)

(assert (=> start!124606 (=> (not res!975647) (not e!813370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124606 (= res!975647 (validMask!0 mask!2687))))

(assert (=> start!124606 e!813370))

(assert (=> start!124606 true))

(declare-fun array_inv!36538 (array!98032) Bool)

(assert (=> start!124606 (array_inv!36538 a!2862)))

(declare-fun b!1443439 () Bool)

(declare-fun e!813368 () Bool)

(assert (=> b!1443439 (= e!813372 e!813368)))

(declare-fun res!975637 () Bool)

(assert (=> b!1443439 (=> (not res!975637) (not e!813368))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633692 () SeekEntryResult!11582)

(assert (=> b!1443439 (= res!975637 (= lt!633692 (Intermediate!11582 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443439 (= lt!633692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633694 mask!2687) lt!633694 lt!633691 mask!2687))))

(assert (=> b!1443439 (= lt!633694 (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!813366 () Bool)

(declare-fun b!1443440 () Bool)

(assert (=> b!1443440 (= e!813366 (or (= (select (arr!47305 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47305 a!2862) intermediateBeforeIndex!19) (select (arr!47305 a!2862) j!93))))))

(declare-fun b!1443441 () Bool)

(assert (=> b!1443441 (= e!813367 (= lt!633692 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633694 lt!633691 mask!2687)))))

(declare-fun b!1443442 () Bool)

(declare-fun res!975641 () Bool)

(assert (=> b!1443442 (=> (not res!975641) (not e!813370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98032 (_ BitVec 32)) Bool)

(assert (=> b!1443442 (= res!975641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443443 () Bool)

(assert (=> b!1443443 (= e!813370 e!813371)))

(declare-fun res!975645 () Bool)

(assert (=> b!1443443 (=> (not res!975645) (not e!813371))))

(assert (=> b!1443443 (= res!975645 (= (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443443 (= lt!633691 (array!98033 (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47857 a!2862)))))

(declare-fun b!1443444 () Bool)

(declare-fun res!975636 () Bool)

(assert (=> b!1443444 (=> (not res!975636) (not e!813368))))

(assert (=> b!1443444 (= res!975636 e!813367)))

(declare-fun c!133414 () Bool)

(assert (=> b!1443444 (= c!133414 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443445 () Bool)

(declare-fun res!975640 () Bool)

(assert (=> b!1443445 (=> (not res!975640) (not e!813368))))

(assert (=> b!1443445 (= res!975640 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443446 () Bool)

(declare-fun res!975634 () Bool)

(assert (=> b!1443446 (=> (not res!975634) (not e!813370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443446 (= res!975634 (validKeyInArray!0 (select (arr!47305 a!2862) i!1006)))))

(declare-fun b!1443447 () Bool)

(declare-fun e!813369 () Bool)

(assert (=> b!1443447 (= e!813368 (not e!813369))))

(declare-fun res!975643 () Bool)

(assert (=> b!1443447 (=> res!975643 e!813369)))

(assert (=> b!1443447 (= res!975643 (or (not (= (select (arr!47305 a!2862) index!646) (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47305 a!2862) index!646) (select (arr!47305 a!2862) j!93)))))))

(assert (=> b!1443447 e!813366))

(declare-fun res!975639 () Bool)

(assert (=> b!1443447 (=> (not res!975639) (not e!813366))))

(assert (=> b!1443447 (= res!975639 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48501 0))(
  ( (Unit!48502) )
))
(declare-fun lt!633693 () Unit!48501)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48501)

(assert (=> b!1443447 (= lt!633693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443448 () Bool)

(assert (=> b!1443448 (= e!813369 true)))

(declare-fun lt!633695 () SeekEntryResult!11582)

(assert (=> b!1443448 (= lt!633695 (seekEntryOrOpen!0 lt!633694 lt!633691 mask!2687))))

(declare-fun b!1443449 () Bool)

(declare-fun res!975644 () Bool)

(assert (=> b!1443449 (=> (not res!975644) (not e!813370))))

(declare-datatypes ((List!33884 0))(
  ( (Nil!33881) (Cons!33880 (h!35230 (_ BitVec 64)) (t!48570 List!33884)) )
))
(declare-fun arrayNoDuplicates!0 (array!98032 (_ BitVec 32) List!33884) Bool)

(assert (=> b!1443449 (= res!975644 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33881))))

(declare-fun b!1443450 () Bool)

(declare-fun res!975635 () Bool)

(assert (=> b!1443450 (=> (not res!975635) (not e!813372))))

(assert (=> b!1443450 (= res!975635 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633696))))

(declare-fun b!1443451 () Bool)

(declare-fun res!975646 () Bool)

(assert (=> b!1443451 (=> (not res!975646) (not e!813370))))

(assert (=> b!1443451 (= res!975646 (validKeyInArray!0 (select (arr!47305 a!2862) j!93)))))

(declare-fun b!1443452 () Bool)

(declare-fun res!975638 () Bool)

(assert (=> b!1443452 (=> (not res!975638) (not e!813370))))

(assert (=> b!1443452 (= res!975638 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47857 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47857 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47857 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443453 () Bool)

(declare-fun res!975642 () Bool)

(assert (=> b!1443453 (=> (not res!975642) (not e!813366))))

(assert (=> b!1443453 (= res!975642 (= (seekEntryOrOpen!0 (select (arr!47305 a!2862) j!93) a!2862 mask!2687) (Found!11582 j!93)))))

(assert (= (and start!124606 res!975647) b!1443438))

(assert (= (and b!1443438 res!975648) b!1443446))

(assert (= (and b!1443446 res!975634) b!1443451))

(assert (= (and b!1443451 res!975646) b!1443442))

(assert (= (and b!1443442 res!975641) b!1443449))

(assert (= (and b!1443449 res!975644) b!1443452))

(assert (= (and b!1443452 res!975638) b!1443443))

(assert (= (and b!1443443 res!975645) b!1443436))

(assert (= (and b!1443436 res!975649) b!1443450))

(assert (= (and b!1443450 res!975635) b!1443439))

(assert (= (and b!1443439 res!975637) b!1443444))

(assert (= (and b!1443444 c!133414) b!1443441))

(assert (= (and b!1443444 (not c!133414)) b!1443437))

(assert (= (and b!1443444 res!975636) b!1443445))

(assert (= (and b!1443445 res!975640) b!1443447))

(assert (= (and b!1443447 res!975639) b!1443453))

(assert (= (and b!1443453 res!975642) b!1443440))

(assert (= (and b!1443447 (not res!975643)) b!1443448))

(declare-fun m!1332027 () Bool)

(assert (=> b!1443447 m!1332027))

(declare-fun m!1332029 () Bool)

(assert (=> b!1443447 m!1332029))

(declare-fun m!1332031 () Bool)

(assert (=> b!1443447 m!1332031))

(declare-fun m!1332033 () Bool)

(assert (=> b!1443447 m!1332033))

(declare-fun m!1332035 () Bool)

(assert (=> b!1443447 m!1332035))

(declare-fun m!1332037 () Bool)

(assert (=> b!1443447 m!1332037))

(declare-fun m!1332039 () Bool)

(assert (=> b!1443437 m!1332039))

(declare-fun m!1332041 () Bool)

(assert (=> b!1443437 m!1332041))

(assert (=> b!1443443 m!1332029))

(declare-fun m!1332043 () Bool)

(assert (=> b!1443443 m!1332043))

(declare-fun m!1332045 () Bool)

(assert (=> b!1443439 m!1332045))

(assert (=> b!1443439 m!1332045))

(declare-fun m!1332047 () Bool)

(assert (=> b!1443439 m!1332047))

(assert (=> b!1443439 m!1332029))

(declare-fun m!1332049 () Bool)

(assert (=> b!1443439 m!1332049))

(declare-fun m!1332051 () Bool)

(assert (=> b!1443446 m!1332051))

(assert (=> b!1443446 m!1332051))

(declare-fun m!1332053 () Bool)

(assert (=> b!1443446 m!1332053))

(assert (=> b!1443453 m!1332037))

(assert (=> b!1443453 m!1332037))

(declare-fun m!1332055 () Bool)

(assert (=> b!1443453 m!1332055))

(declare-fun m!1332057 () Bool)

(assert (=> b!1443440 m!1332057))

(assert (=> b!1443440 m!1332037))

(assert (=> b!1443451 m!1332037))

(assert (=> b!1443451 m!1332037))

(declare-fun m!1332059 () Bool)

(assert (=> b!1443451 m!1332059))

(declare-fun m!1332061 () Bool)

(assert (=> start!124606 m!1332061))

(declare-fun m!1332063 () Bool)

(assert (=> start!124606 m!1332063))

(assert (=> b!1443436 m!1332037))

(assert (=> b!1443436 m!1332037))

(declare-fun m!1332065 () Bool)

(assert (=> b!1443436 m!1332065))

(assert (=> b!1443436 m!1332065))

(assert (=> b!1443436 m!1332037))

(declare-fun m!1332067 () Bool)

(assert (=> b!1443436 m!1332067))

(declare-fun m!1332069 () Bool)

(assert (=> b!1443442 m!1332069))

(declare-fun m!1332071 () Bool)

(assert (=> b!1443449 m!1332071))

(assert (=> b!1443450 m!1332037))

(assert (=> b!1443450 m!1332037))

(declare-fun m!1332073 () Bool)

(assert (=> b!1443450 m!1332073))

(assert (=> b!1443448 m!1332041))

(declare-fun m!1332075 () Bool)

(assert (=> b!1443441 m!1332075))

(check-sat (not b!1443451) (not b!1443453) (not b!1443441) (not b!1443447) (not b!1443442) (not b!1443450) (not b!1443449) (not b!1443446) (not b!1443436) (not b!1443437) (not b!1443439) (not b!1443448) (not start!124606))
(check-sat)
