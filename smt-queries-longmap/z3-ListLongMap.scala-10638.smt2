; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124936 () Bool)

(assert start!124936)

(declare-fun b!1452470 () Bool)

(declare-fun res!983684 () Bool)

(declare-fun e!817616 () Bool)

(assert (=> b!1452470 (=> (not res!983684) (not e!817616))))

(declare-datatypes ((array!98362 0))(
  ( (array!98363 (arr!47470 (Array (_ BitVec 32) (_ BitVec 64))) (size!48022 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98362)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11747 0))(
  ( (MissingZero!11747 (index!49380 (_ BitVec 32))) (Found!11747 (index!49381 (_ BitVec 32))) (Intermediate!11747 (undefined!12559 Bool) (index!49382 (_ BitVec 32)) (x!131023 (_ BitVec 32))) (Undefined!11747) (MissingVacant!11747 (index!49383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11747)

(assert (=> b!1452470 (= res!983684 (= (seekEntryOrOpen!0 (select (arr!47470 a!2862) j!93) a!2862 mask!2687) (Found!11747 j!93)))))

(declare-fun b!1452471 () Bool)

(declare-fun e!817614 () Bool)

(declare-fun e!817612 () Bool)

(assert (=> b!1452471 (= e!817614 e!817612)))

(declare-fun res!983688 () Bool)

(assert (=> b!1452471 (=> (not res!983688) (not e!817612))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452471 (= res!983688 (= (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636777 () array!98362)

(assert (=> b!1452471 (= lt!636777 (array!98363 (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48022 a!2862)))))

(declare-fun b!1452472 () Bool)

(declare-fun e!817613 () Bool)

(assert (=> b!1452472 (= e!817612 e!817613)))

(declare-fun res!983691 () Bool)

(assert (=> b!1452472 (=> (not res!983691) (not e!817613))))

(declare-fun lt!636780 () SeekEntryResult!11747)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452472 (= res!983691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47470 a!2862) j!93) mask!2687) (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!636780))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452472 (= lt!636780 (Intermediate!11747 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636778 () (_ BitVec 64))

(declare-fun e!817611 () Bool)

(declare-fun b!1452473 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636776 () SeekEntryResult!11747)

(assert (=> b!1452473 (= e!817611 (= lt!636776 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636778 lt!636777 mask!2687)))))

(declare-fun b!1452474 () Bool)

(declare-fun res!983682 () Bool)

(assert (=> b!1452474 (=> (not res!983682) (not e!817614))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452474 (= res!983682 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48022 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48022 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48022 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452475 () Bool)

(declare-fun res!983692 () Bool)

(assert (=> b!1452475 (=> (not res!983692) (not e!817614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452475 (= res!983692 (validKeyInArray!0 (select (arr!47470 a!2862) i!1006)))))

(declare-fun b!1452476 () Bool)

(declare-fun res!983685 () Bool)

(declare-fun e!817617 () Bool)

(assert (=> b!1452476 (=> (not res!983685) (not e!817617))))

(assert (=> b!1452476 (= res!983685 e!817611)))

(declare-fun c!133909 () Bool)

(assert (=> b!1452476 (= c!133909 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452477 () Bool)

(assert (=> b!1452477 (= e!817616 (and (or (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) (select (arr!47470 a!2862) j!93))) (or (and (= (select (arr!47470 a!2862) index!646) (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47470 a!2862) index!646) (select (arr!47470 a!2862) j!93))) (= (select (arr!47470 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452478 () Bool)

(declare-fun res!983681 () Bool)

(assert (=> b!1452478 (=> (not res!983681) (not e!817614))))

(declare-datatypes ((List!34049 0))(
  ( (Nil!34046) (Cons!34045 (h!35395 (_ BitVec 64)) (t!48735 List!34049)) )
))
(declare-fun arrayNoDuplicates!0 (array!98362 (_ BitVec 32) List!34049) Bool)

(assert (=> b!1452478 (= res!983681 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34046))))

(declare-fun b!1452479 () Bool)

(declare-fun res!983679 () Bool)

(assert (=> b!1452479 (=> (not res!983679) (not e!817617))))

(assert (=> b!1452479 (= res!983679 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452481 () Bool)

(declare-fun res!983683 () Bool)

(assert (=> b!1452481 (=> (not res!983683) (not e!817614))))

(assert (=> b!1452481 (= res!983683 (and (= (size!48022 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48022 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48022 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452482 () Bool)

(declare-fun res!983690 () Bool)

(assert (=> b!1452482 (=> (not res!983690) (not e!817614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98362 (_ BitVec 32)) Bool)

(assert (=> b!1452482 (= res!983690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452483 () Bool)

(declare-fun res!983678 () Bool)

(assert (=> b!1452483 (=> (not res!983678) (not e!817613))))

(assert (=> b!1452483 (= res!983678 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!636780))))

(declare-fun b!1452484 () Bool)

(assert (=> b!1452484 (= e!817617 (not true))))

(assert (=> b!1452484 e!817616))

(declare-fun res!983687 () Bool)

(assert (=> b!1452484 (=> (not res!983687) (not e!817616))))

(assert (=> b!1452484 (= res!983687 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48831 0))(
  ( (Unit!48832) )
))
(declare-fun lt!636779 () Unit!48831)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48831)

(assert (=> b!1452484 (= lt!636779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452480 () Bool)

(assert (=> b!1452480 (= e!817613 e!817617)))

(declare-fun res!983686 () Bool)

(assert (=> b!1452480 (=> (not res!983686) (not e!817617))))

(assert (=> b!1452480 (= res!983686 (= lt!636776 (Intermediate!11747 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452480 (= lt!636776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636778 mask!2687) lt!636778 lt!636777 mask!2687))))

(assert (=> b!1452480 (= lt!636778 (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!983689 () Bool)

(assert (=> start!124936 (=> (not res!983689) (not e!817614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124936 (= res!983689 (validMask!0 mask!2687))))

(assert (=> start!124936 e!817614))

(assert (=> start!124936 true))

(declare-fun array_inv!36703 (array!98362) Bool)

(assert (=> start!124936 (array_inv!36703 a!2862)))

(declare-fun b!1452485 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11747)

(assert (=> b!1452485 (= e!817611 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636778 lt!636777 mask!2687) (seekEntryOrOpen!0 lt!636778 lt!636777 mask!2687)))))

(declare-fun b!1452486 () Bool)

(declare-fun res!983680 () Bool)

(assert (=> b!1452486 (=> (not res!983680) (not e!817614))))

(assert (=> b!1452486 (= res!983680 (validKeyInArray!0 (select (arr!47470 a!2862) j!93)))))

(assert (= (and start!124936 res!983689) b!1452481))

(assert (= (and b!1452481 res!983683) b!1452475))

(assert (= (and b!1452475 res!983692) b!1452486))

(assert (= (and b!1452486 res!983680) b!1452482))

(assert (= (and b!1452482 res!983690) b!1452478))

(assert (= (and b!1452478 res!983681) b!1452474))

(assert (= (and b!1452474 res!983682) b!1452471))

(assert (= (and b!1452471 res!983688) b!1452472))

(assert (= (and b!1452472 res!983691) b!1452483))

(assert (= (and b!1452483 res!983678) b!1452480))

(assert (= (and b!1452480 res!983686) b!1452476))

(assert (= (and b!1452476 c!133909) b!1452473))

(assert (= (and b!1452476 (not c!133909)) b!1452485))

(assert (= (and b!1452476 res!983685) b!1452479))

(assert (= (and b!1452479 res!983679) b!1452484))

(assert (= (and b!1452484 res!983687) b!1452470))

(assert (= (and b!1452470 res!983684) b!1452477))

(declare-fun m!1340559 () Bool)

(assert (=> b!1452470 m!1340559))

(assert (=> b!1452470 m!1340559))

(declare-fun m!1340561 () Bool)

(assert (=> b!1452470 m!1340561))

(declare-fun m!1340563 () Bool)

(assert (=> b!1452478 m!1340563))

(declare-fun m!1340565 () Bool)

(assert (=> b!1452477 m!1340565))

(declare-fun m!1340567 () Bool)

(assert (=> b!1452477 m!1340567))

(declare-fun m!1340569 () Bool)

(assert (=> b!1452477 m!1340569))

(declare-fun m!1340571 () Bool)

(assert (=> b!1452477 m!1340571))

(assert (=> b!1452477 m!1340559))

(declare-fun m!1340573 () Bool)

(assert (=> b!1452485 m!1340573))

(declare-fun m!1340575 () Bool)

(assert (=> b!1452485 m!1340575))

(assert (=> b!1452483 m!1340559))

(assert (=> b!1452483 m!1340559))

(declare-fun m!1340577 () Bool)

(assert (=> b!1452483 m!1340577))

(declare-fun m!1340579 () Bool)

(assert (=> start!124936 m!1340579))

(declare-fun m!1340581 () Bool)

(assert (=> start!124936 m!1340581))

(assert (=> b!1452472 m!1340559))

(assert (=> b!1452472 m!1340559))

(declare-fun m!1340583 () Bool)

(assert (=> b!1452472 m!1340583))

(assert (=> b!1452472 m!1340583))

(assert (=> b!1452472 m!1340559))

(declare-fun m!1340585 () Bool)

(assert (=> b!1452472 m!1340585))

(declare-fun m!1340587 () Bool)

(assert (=> b!1452475 m!1340587))

(assert (=> b!1452475 m!1340587))

(declare-fun m!1340589 () Bool)

(assert (=> b!1452475 m!1340589))

(declare-fun m!1340591 () Bool)

(assert (=> b!1452484 m!1340591))

(declare-fun m!1340593 () Bool)

(assert (=> b!1452484 m!1340593))

(declare-fun m!1340595 () Bool)

(assert (=> b!1452473 m!1340595))

(declare-fun m!1340597 () Bool)

(assert (=> b!1452482 m!1340597))

(declare-fun m!1340599 () Bool)

(assert (=> b!1452480 m!1340599))

(assert (=> b!1452480 m!1340599))

(declare-fun m!1340601 () Bool)

(assert (=> b!1452480 m!1340601))

(assert (=> b!1452480 m!1340565))

(declare-fun m!1340603 () Bool)

(assert (=> b!1452480 m!1340603))

(assert (=> b!1452486 m!1340559))

(assert (=> b!1452486 m!1340559))

(declare-fun m!1340605 () Bool)

(assert (=> b!1452486 m!1340605))

(assert (=> b!1452471 m!1340565))

(declare-fun m!1340607 () Bool)

(assert (=> b!1452471 m!1340607))

(check-sat (not b!1452478) (not b!1452486) (not start!124936) (not b!1452480) (not b!1452485) (not b!1452475) (not b!1452482) (not b!1452484) (not b!1452472) (not b!1452473) (not b!1452470) (not b!1452483))
(check-sat)
