; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124634 () Bool)

(assert start!124634)

(declare-fun b!1443578 () Bool)

(declare-fun res!975667 () Bool)

(declare-fun e!813458 () Bool)

(assert (=> b!1443578 (=> (not res!975667) (not e!813458))))

(declare-datatypes ((array!98082 0))(
  ( (array!98083 (arr!47329 (Array (_ BitVec 32) (_ BitVec 64))) (size!47879 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98082)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443578 (= res!975667 (validKeyInArray!0 (select (arr!47329 a!2862) j!93)))))

(declare-fun b!1443579 () Bool)

(declare-fun e!813460 () Bool)

(declare-fun e!813462 () Bool)

(assert (=> b!1443579 (= e!813460 e!813462)))

(declare-fun res!975674 () Bool)

(assert (=> b!1443579 (=> (not res!975674) (not e!813462))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11581 0))(
  ( (MissingZero!11581 (index!48716 (_ BitVec 32))) (Found!11581 (index!48717 (_ BitVec 32))) (Intermediate!11581 (undefined!12393 Bool) (index!48718 (_ BitVec 32)) (x!130414 (_ BitVec 32))) (Undefined!11581) (MissingVacant!11581 (index!48719 (_ BitVec 32))) )
))
(declare-fun lt!633909 () SeekEntryResult!11581)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443579 (= res!975674 (= lt!633909 (Intermediate!11581 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633911 () array!98082)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633910 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98082 (_ BitVec 32)) SeekEntryResult!11581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443579 (= lt!633909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633910 mask!2687) lt!633910 lt!633911 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443579 (= lt!633910 (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!975669 () Bool)

(assert (=> start!124634 (=> (not res!975669) (not e!813458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124634 (= res!975669 (validMask!0 mask!2687))))

(assert (=> start!124634 e!813458))

(assert (=> start!124634 true))

(declare-fun array_inv!36357 (array!98082) Bool)

(assert (=> start!124634 (array_inv!36357 a!2862)))

(declare-fun b!1443580 () Bool)

(declare-fun e!813463 () Bool)

(assert (=> b!1443580 (= e!813463 e!813460)))

(declare-fun res!975673 () Bool)

(assert (=> b!1443580 (=> (not res!975673) (not e!813460))))

(declare-fun lt!633907 () SeekEntryResult!11581)

(assert (=> b!1443580 (= res!975673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47329 a!2862) j!93) mask!2687) (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!633907))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443580 (= lt!633907 (Intermediate!11581 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443581 () Bool)

(declare-fun res!975672 () Bool)

(assert (=> b!1443581 (=> (not res!975672) (not e!813458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98082 (_ BitVec 32)) Bool)

(assert (=> b!1443581 (= res!975672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443582 () Bool)

(declare-fun res!975668 () Bool)

(assert (=> b!1443582 (=> (not res!975668) (not e!813458))))

(declare-datatypes ((List!33830 0))(
  ( (Nil!33827) (Cons!33826 (h!35176 (_ BitVec 64)) (t!48524 List!33830)) )
))
(declare-fun arrayNoDuplicates!0 (array!98082 (_ BitVec 32) List!33830) Bool)

(assert (=> b!1443582 (= res!975668 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33827))))

(declare-fun b!1443583 () Bool)

(declare-fun res!975666 () Bool)

(assert (=> b!1443583 (=> (not res!975666) (not e!813458))))

(assert (=> b!1443583 (= res!975666 (validKeyInArray!0 (select (arr!47329 a!2862) i!1006)))))

(declare-fun b!1443584 () Bool)

(declare-fun e!813461 () Bool)

(assert (=> b!1443584 (= e!813461 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1443585 () Bool)

(declare-fun res!975679 () Bool)

(assert (=> b!1443585 (=> (not res!975679) (not e!813460))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443585 (= res!975679 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!633907))))

(declare-fun b!1443586 () Bool)

(declare-fun e!813459 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98082 (_ BitVec 32)) SeekEntryResult!11581)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98082 (_ BitVec 32)) SeekEntryResult!11581)

(assert (=> b!1443586 (= e!813459 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633910 lt!633911 mask!2687) (seekEntryOrOpen!0 lt!633910 lt!633911 mask!2687)))))

(declare-fun b!1443587 () Bool)

(declare-fun res!975671 () Bool)

(assert (=> b!1443587 (=> (not res!975671) (not e!813458))))

(assert (=> b!1443587 (= res!975671 (and (= (size!47879 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47879 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47879 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443588 () Bool)

(declare-fun res!975676 () Bool)

(assert (=> b!1443588 (=> (not res!975676) (not e!813458))))

(assert (=> b!1443588 (= res!975676 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47879 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47879 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47879 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443589 () Bool)

(declare-fun res!975677 () Bool)

(assert (=> b!1443589 (=> res!975677 e!813461)))

(declare-fun lt!633908 () SeekEntryResult!11581)

(assert (=> b!1443589 (= res!975677 (not (= lt!633908 (seekEntryOrOpen!0 lt!633910 lt!633911 mask!2687))))))

(declare-fun b!1443590 () Bool)

(declare-fun res!975665 () Bool)

(assert (=> b!1443590 (=> (not res!975665) (not e!813462))))

(assert (=> b!1443590 (= res!975665 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443591 () Bool)

(assert (=> b!1443591 (= e!813459 (= lt!633909 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633910 lt!633911 mask!2687)))))

(declare-fun b!1443592 () Bool)

(assert (=> b!1443592 (= e!813458 e!813463)))

(declare-fun res!975678 () Bool)

(assert (=> b!1443592 (=> (not res!975678) (not e!813463))))

(assert (=> b!1443592 (= res!975678 (= (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443592 (= lt!633911 (array!98083 (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47879 a!2862)))))

(declare-fun b!1443593 () Bool)

(declare-fun res!975670 () Bool)

(assert (=> b!1443593 (=> (not res!975670) (not e!813462))))

(assert (=> b!1443593 (= res!975670 e!813459)))

(declare-fun c!133467 () Bool)

(assert (=> b!1443593 (= c!133467 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443594 () Bool)

(assert (=> b!1443594 (= e!813462 (not e!813461))))

(declare-fun res!975675 () Bool)

(assert (=> b!1443594 (=> res!975675 e!813461)))

(assert (=> b!1443594 (= res!975675 (or (not (= (select (arr!47329 a!2862) index!646) (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47329 a!2862) index!646) (select (arr!47329 a!2862) j!93)))))))

(assert (=> b!1443594 (and (= lt!633908 (Found!11581 j!93)) (or (= (select (arr!47329 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47329 a!2862) intermediateBeforeIndex!19) (select (arr!47329 a!2862) j!93))))))

(assert (=> b!1443594 (= lt!633908 (seekEntryOrOpen!0 (select (arr!47329 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1443594 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48658 0))(
  ( (Unit!48659) )
))
(declare-fun lt!633912 () Unit!48658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48658)

(assert (=> b!1443594 (= lt!633912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124634 res!975669) b!1443587))

(assert (= (and b!1443587 res!975671) b!1443583))

(assert (= (and b!1443583 res!975666) b!1443578))

(assert (= (and b!1443578 res!975667) b!1443581))

(assert (= (and b!1443581 res!975672) b!1443582))

(assert (= (and b!1443582 res!975668) b!1443588))

(assert (= (and b!1443588 res!975676) b!1443592))

(assert (= (and b!1443592 res!975678) b!1443580))

(assert (= (and b!1443580 res!975673) b!1443585))

(assert (= (and b!1443585 res!975679) b!1443579))

(assert (= (and b!1443579 res!975674) b!1443593))

(assert (= (and b!1443593 c!133467) b!1443591))

(assert (= (and b!1443593 (not c!133467)) b!1443586))

(assert (= (and b!1443593 res!975670) b!1443590))

(assert (= (and b!1443590 res!975665) b!1443594))

(assert (= (and b!1443594 (not res!975675)) b!1443589))

(assert (= (and b!1443589 (not res!975677)) b!1443584))

(declare-fun m!1332653 () Bool)

(assert (=> start!124634 m!1332653))

(declare-fun m!1332655 () Bool)

(assert (=> start!124634 m!1332655))

(declare-fun m!1332657 () Bool)

(assert (=> b!1443585 m!1332657))

(assert (=> b!1443585 m!1332657))

(declare-fun m!1332659 () Bool)

(assert (=> b!1443585 m!1332659))

(declare-fun m!1332661 () Bool)

(assert (=> b!1443586 m!1332661))

(declare-fun m!1332663 () Bool)

(assert (=> b!1443586 m!1332663))

(declare-fun m!1332665 () Bool)

(assert (=> b!1443592 m!1332665))

(declare-fun m!1332667 () Bool)

(assert (=> b!1443592 m!1332667))

(declare-fun m!1332669 () Bool)

(assert (=> b!1443591 m!1332669))

(declare-fun m!1332671 () Bool)

(assert (=> b!1443582 m!1332671))

(declare-fun m!1332673 () Bool)

(assert (=> b!1443594 m!1332673))

(assert (=> b!1443594 m!1332665))

(declare-fun m!1332675 () Bool)

(assert (=> b!1443594 m!1332675))

(declare-fun m!1332677 () Bool)

(assert (=> b!1443594 m!1332677))

(declare-fun m!1332679 () Bool)

(assert (=> b!1443594 m!1332679))

(assert (=> b!1443594 m!1332657))

(declare-fun m!1332681 () Bool)

(assert (=> b!1443594 m!1332681))

(declare-fun m!1332683 () Bool)

(assert (=> b!1443594 m!1332683))

(assert (=> b!1443594 m!1332657))

(declare-fun m!1332685 () Bool)

(assert (=> b!1443583 m!1332685))

(assert (=> b!1443583 m!1332685))

(declare-fun m!1332687 () Bool)

(assert (=> b!1443583 m!1332687))

(assert (=> b!1443578 m!1332657))

(assert (=> b!1443578 m!1332657))

(declare-fun m!1332689 () Bool)

(assert (=> b!1443578 m!1332689))

(assert (=> b!1443589 m!1332663))

(declare-fun m!1332691 () Bool)

(assert (=> b!1443581 m!1332691))

(assert (=> b!1443580 m!1332657))

(assert (=> b!1443580 m!1332657))

(declare-fun m!1332693 () Bool)

(assert (=> b!1443580 m!1332693))

(assert (=> b!1443580 m!1332693))

(assert (=> b!1443580 m!1332657))

(declare-fun m!1332695 () Bool)

(assert (=> b!1443580 m!1332695))

(declare-fun m!1332697 () Bool)

(assert (=> b!1443579 m!1332697))

(assert (=> b!1443579 m!1332697))

(declare-fun m!1332699 () Bool)

(assert (=> b!1443579 m!1332699))

(assert (=> b!1443579 m!1332665))

(declare-fun m!1332701 () Bool)

(assert (=> b!1443579 m!1332701))

(push 1)

(assert (not b!1443591))

(assert (not b!1443579))

(assert (not b!1443589))

(assert (not b!1443585))

(assert (not b!1443583))

(assert (not start!124634))

(assert (not b!1443582))

(assert (not b!1443594))

(assert (not b!1443578))

