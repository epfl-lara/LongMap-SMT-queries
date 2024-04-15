; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124504 () Bool)

(assert start!124504)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!97930 0))(
  ( (array!97931 (arr!47254 (Array (_ BitVec 32) (_ BitVec 64))) (size!47806 (_ BitVec 32))) )
))
(declare-fun lt!632908 () array!97930)

(declare-datatypes ((SeekEntryResult!11531 0))(
  ( (MissingZero!11531 (index!48516 (_ BitVec 32))) (Found!11531 (index!48517 (_ BitVec 32))) (Intermediate!11531 (undefined!12343 Bool) (index!48518 (_ BitVec 32)) (x!130231 (_ BitVec 32))) (Undefined!11531) (MissingVacant!11531 (index!48519 (_ BitVec 32))) )
))
(declare-fun lt!632906 () SeekEntryResult!11531)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!632907 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1440987 () Bool)

(declare-fun e!812335 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97930 (_ BitVec 32)) SeekEntryResult!11531)

(assert (=> b!1440987 (= e!812335 (not (= lt!632906 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!632907 lt!632908 mask!2687))))))

(declare-fun b!1440988 () Bool)

(declare-fun e!812340 () Bool)

(declare-fun e!812336 () Bool)

(assert (=> b!1440988 (= e!812340 e!812336)))

(declare-fun res!973496 () Bool)

(assert (=> b!1440988 (=> (not res!973496) (not e!812336))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!97930)

(assert (=> b!1440988 (= res!973496 (= (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440988 (= lt!632908 (array!97931 (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47806 a!2862)))))

(declare-fun b!1440989 () Bool)

(declare-fun res!973491 () Bool)

(assert (=> b!1440989 (=> (not res!973491) (not e!812340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440989 (= res!973491 (validKeyInArray!0 (select (arr!47254 a!2862) i!1006)))))

(declare-fun res!973497 () Bool)

(assert (=> start!124504 (=> (not res!973497) (not e!812340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124504 (= res!973497 (validMask!0 mask!2687))))

(assert (=> start!124504 e!812340))

(assert (=> start!124504 true))

(declare-fun array_inv!36487 (array!97930) Bool)

(assert (=> start!124504 (array_inv!36487 a!2862)))

(declare-fun b!1440990 () Bool)

(declare-fun res!973498 () Bool)

(assert (=> b!1440990 (=> (not res!973498) (not e!812340))))

(declare-datatypes ((List!33833 0))(
  ( (Nil!33830) (Cons!33829 (h!35179 (_ BitVec 64)) (t!48519 List!33833)) )
))
(declare-fun arrayNoDuplicates!0 (array!97930 (_ BitVec 32) List!33833) Bool)

(assert (=> b!1440990 (= res!973498 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33830))))

(declare-fun b!1440991 () Bool)

(declare-fun res!973501 () Bool)

(assert (=> b!1440991 (=> (not res!973501) (not e!812340))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440991 (= res!973501 (and (= (size!47806 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47806 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47806 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440992 () Bool)

(declare-fun e!812338 () Bool)

(assert (=> b!1440992 (= e!812338 false)))

(declare-fun lt!632910 () Bool)

(assert (=> b!1440992 (= lt!632910 e!812335)))

(declare-fun c!133261 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1440992 (= c!133261 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1440993 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97930 (_ BitVec 32)) SeekEntryResult!11531)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97930 (_ BitVec 32)) SeekEntryResult!11531)

(assert (=> b!1440993 (= e!812335 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!632907 lt!632908 mask!2687) (seekEntryOrOpen!0 lt!632907 lt!632908 mask!2687))))))

(declare-fun b!1440994 () Bool)

(declare-fun e!812339 () Bool)

(assert (=> b!1440994 (= e!812339 e!812338)))

(declare-fun res!973494 () Bool)

(assert (=> b!1440994 (=> (not res!973494) (not e!812338))))

(assert (=> b!1440994 (= res!973494 (= lt!632906 (Intermediate!11531 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440994 (= lt!632906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632907 mask!2687) lt!632907 lt!632908 mask!2687))))

(assert (=> b!1440994 (= lt!632907 (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1440995 () Bool)

(declare-fun res!973495 () Bool)

(assert (=> b!1440995 (=> (not res!973495) (not e!812340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97930 (_ BitVec 32)) Bool)

(assert (=> b!1440995 (= res!973495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440996 () Bool)

(assert (=> b!1440996 (= e!812336 e!812339)))

(declare-fun res!973492 () Bool)

(assert (=> b!1440996 (=> (not res!973492) (not e!812339))))

(declare-fun lt!632909 () SeekEntryResult!11531)

(assert (=> b!1440996 (= res!973492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47254 a!2862) j!93) mask!2687) (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!632909))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440996 (= lt!632909 (Intermediate!11531 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440997 () Bool)

(declare-fun res!973493 () Bool)

(assert (=> b!1440997 (=> (not res!973493) (not e!812340))))

(assert (=> b!1440997 (= res!973493 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47806 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47806 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47806 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1440998 () Bool)

(declare-fun res!973500 () Bool)

(assert (=> b!1440998 (=> (not res!973500) (not e!812339))))

(assert (=> b!1440998 (= res!973500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!632909))))

(declare-fun b!1440999 () Bool)

(declare-fun res!973499 () Bool)

(assert (=> b!1440999 (=> (not res!973499) (not e!812340))))

(assert (=> b!1440999 (= res!973499 (validKeyInArray!0 (select (arr!47254 a!2862) j!93)))))

(assert (= (and start!124504 res!973497) b!1440991))

(assert (= (and b!1440991 res!973501) b!1440989))

(assert (= (and b!1440989 res!973491) b!1440999))

(assert (= (and b!1440999 res!973499) b!1440995))

(assert (= (and b!1440995 res!973495) b!1440990))

(assert (= (and b!1440990 res!973498) b!1440997))

(assert (= (and b!1440997 res!973493) b!1440988))

(assert (= (and b!1440988 res!973496) b!1440996))

(assert (= (and b!1440996 res!973492) b!1440998))

(assert (= (and b!1440998 res!973500) b!1440994))

(assert (= (and b!1440994 res!973494) b!1440992))

(assert (= (and b!1440992 c!133261) b!1440987))

(assert (= (and b!1440992 (not c!133261)) b!1440993))

(declare-fun m!1329735 () Bool)

(assert (=> b!1440988 m!1329735))

(declare-fun m!1329737 () Bool)

(assert (=> b!1440988 m!1329737))

(declare-fun m!1329739 () Bool)

(assert (=> b!1440987 m!1329739))

(declare-fun m!1329741 () Bool)

(assert (=> b!1440999 m!1329741))

(assert (=> b!1440999 m!1329741))

(declare-fun m!1329743 () Bool)

(assert (=> b!1440999 m!1329743))

(assert (=> b!1440996 m!1329741))

(assert (=> b!1440996 m!1329741))

(declare-fun m!1329745 () Bool)

(assert (=> b!1440996 m!1329745))

(assert (=> b!1440996 m!1329745))

(assert (=> b!1440996 m!1329741))

(declare-fun m!1329747 () Bool)

(assert (=> b!1440996 m!1329747))

(declare-fun m!1329749 () Bool)

(assert (=> b!1440989 m!1329749))

(assert (=> b!1440989 m!1329749))

(declare-fun m!1329751 () Bool)

(assert (=> b!1440989 m!1329751))

(declare-fun m!1329753 () Bool)

(assert (=> b!1440995 m!1329753))

(assert (=> b!1440998 m!1329741))

(assert (=> b!1440998 m!1329741))

(declare-fun m!1329755 () Bool)

(assert (=> b!1440998 m!1329755))

(declare-fun m!1329757 () Bool)

(assert (=> start!124504 m!1329757))

(declare-fun m!1329759 () Bool)

(assert (=> start!124504 m!1329759))

(declare-fun m!1329761 () Bool)

(assert (=> b!1440990 m!1329761))

(declare-fun m!1329763 () Bool)

(assert (=> b!1440994 m!1329763))

(assert (=> b!1440994 m!1329763))

(declare-fun m!1329765 () Bool)

(assert (=> b!1440994 m!1329765))

(assert (=> b!1440994 m!1329735))

(declare-fun m!1329767 () Bool)

(assert (=> b!1440994 m!1329767))

(declare-fun m!1329769 () Bool)

(assert (=> b!1440993 m!1329769))

(declare-fun m!1329771 () Bool)

(assert (=> b!1440993 m!1329771))

(check-sat (not b!1440994) (not b!1440995) (not b!1440993) (not b!1440999) (not b!1440996) (not start!124504) (not b!1440987) (not b!1440989) (not b!1440990) (not b!1440998))
(check-sat)
