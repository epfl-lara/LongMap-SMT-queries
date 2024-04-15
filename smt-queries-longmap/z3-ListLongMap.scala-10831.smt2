; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126782 () Bool)

(assert start!126782)

(declare-fun b!1488692 () Bool)

(declare-fun res!1012431 () Bool)

(declare-fun e!834384 () Bool)

(assert (=> b!1488692 (=> res!1012431 e!834384)))

(declare-fun lt!649110 () (_ BitVec 32))

(declare-datatypes ((array!99553 0))(
  ( (array!99554 (arr!48049 (Array (_ BitVec 32) (_ BitVec 64))) (size!48601 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99553)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12314 0))(
  ( (MissingZero!12314 (index!51648 (_ BitVec 32))) (Found!12314 (index!51649 (_ BitVec 32))) (Intermediate!12314 (undefined!13126 Bool) (index!51650 (_ BitVec 32)) (x!133243 (_ BitVec 32))) (Undefined!12314) (MissingVacant!12314 (index!51651 (_ BitVec 32))) )
))
(declare-fun lt!649113 () SeekEntryResult!12314)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12314)

(assert (=> b!1488692 (= res!1012431 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649110 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!649113)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1488693 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!834379 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488693 (= e!834379 (and (or (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48049 a!2862) intermediateBeforeIndex!19) (select (arr!48049 a!2862) j!93))) (let ((bdg!54688 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48049 a!2862) index!646) bdg!54688) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54688 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!834385 () Bool)

(declare-fun lt!649114 () array!99553)

(declare-fun lt!649112 () (_ BitVec 64))

(declare-fun b!1488694 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12314)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99553 (_ BitVec 32)) SeekEntryResult!12314)

(assert (=> b!1488694 (= e!834385 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649112 lt!649114 mask!2687) (seekEntryOrOpen!0 lt!649112 lt!649114 mask!2687)))))

(declare-fun b!1488695 () Bool)

(declare-fun res!1012438 () Bool)

(declare-fun e!834381 () Bool)

(assert (=> b!1488695 (=> (not res!1012438) (not e!834381))))

(assert (=> b!1488695 (= res!1012438 e!834385)))

(declare-fun c!137662 () Bool)

(assert (=> b!1488695 (= c!137662 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488696 () Bool)

(declare-fun res!1012444 () Bool)

(assert (=> b!1488696 (=> (not res!1012444) (not e!834381))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488696 (= res!1012444 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488697 () Bool)

(declare-fun res!1012432 () Bool)

(declare-fun e!834377 () Bool)

(assert (=> b!1488697 (=> (not res!1012432) (not e!834377))))

(assert (=> b!1488697 (= res!1012432 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!649113))))

(declare-fun b!1488698 () Bool)

(declare-fun res!1012433 () Bool)

(declare-fun e!834378 () Bool)

(assert (=> b!1488698 (=> (not res!1012433) (not e!834378))))

(declare-datatypes ((List!34628 0))(
  ( (Nil!34625) (Cons!34624 (h!36007 (_ BitVec 64)) (t!49314 List!34628)) )
))
(declare-fun arrayNoDuplicates!0 (array!99553 (_ BitVec 32) List!34628) Bool)

(assert (=> b!1488698 (= res!1012433 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34625))))

(declare-fun b!1488699 () Bool)

(declare-fun res!1012430 () Bool)

(assert (=> b!1488699 (=> (not res!1012430) (not e!834378))))

(assert (=> b!1488699 (= res!1012430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48601 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48601 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48601 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488700 () Bool)

(declare-fun e!834380 () Bool)

(assert (=> b!1488700 (= e!834378 e!834380)))

(declare-fun res!1012436 () Bool)

(assert (=> b!1488700 (=> (not res!1012436) (not e!834380))))

(assert (=> b!1488700 (= res!1012436 (= (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488700 (= lt!649114 (array!99554 (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48601 a!2862)))))

(declare-fun b!1488701 () Bool)

(declare-fun res!1012429 () Bool)

(assert (=> b!1488701 (=> (not res!1012429) (not e!834378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99553 (_ BitVec 32)) Bool)

(assert (=> b!1488701 (= res!1012429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488702 () Bool)

(declare-fun res!1012439 () Bool)

(assert (=> b!1488702 (=> (not res!1012439) (not e!834378))))

(assert (=> b!1488702 (= res!1012439 (and (= (size!48601 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48601 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48601 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488703 () Bool)

(declare-fun res!1012447 () Bool)

(assert (=> b!1488703 (=> (not res!1012447) (not e!834378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488703 (= res!1012447 (validKeyInArray!0 (select (arr!48049 a!2862) j!93)))))

(declare-fun b!1488704 () Bool)

(declare-fun e!834382 () Bool)

(assert (=> b!1488704 (= e!834382 e!834384)))

(declare-fun res!1012445 () Bool)

(assert (=> b!1488704 (=> res!1012445 e!834384)))

(assert (=> b!1488704 (= res!1012445 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649110 #b00000000000000000000000000000000) (bvsge lt!649110 (size!48601 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488704 (= lt!649110 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649111 () SeekEntryResult!12314)

(assert (=> b!1488704 (= lt!649111 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649112 lt!649114 mask!2687))))

(assert (=> b!1488704 (= lt!649111 (seekEntryOrOpen!0 lt!649112 lt!649114 mask!2687))))

(declare-fun res!1012435 () Bool)

(assert (=> start!126782 (=> (not res!1012435) (not e!834378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126782 (= res!1012435 (validMask!0 mask!2687))))

(assert (=> start!126782 e!834378))

(assert (=> start!126782 true))

(declare-fun array_inv!37282 (array!99553) Bool)

(assert (=> start!126782 (array_inv!37282 a!2862)))

(declare-fun b!1488705 () Bool)

(assert (=> b!1488705 (= e!834384 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1488706 () Bool)

(declare-fun res!1012442 () Bool)

(assert (=> b!1488706 (=> (not res!1012442) (not e!834378))))

(assert (=> b!1488706 (= res!1012442 (validKeyInArray!0 (select (arr!48049 a!2862) i!1006)))))

(declare-fun b!1488707 () Bool)

(declare-fun res!1012446 () Bool)

(assert (=> b!1488707 (=> res!1012446 e!834384)))

(declare-fun e!834386 () Bool)

(assert (=> b!1488707 (= res!1012446 e!834386)))

(declare-fun c!137661 () Bool)

(assert (=> b!1488707 (= c!137661 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488708 () Bool)

(assert (=> b!1488708 (= e!834380 e!834377)))

(declare-fun res!1012437 () Bool)

(assert (=> b!1488708 (=> (not res!1012437) (not e!834377))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488708 (= res!1012437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48049 a!2862) j!93) mask!2687) (select (arr!48049 a!2862) j!93) a!2862 mask!2687) lt!649113))))

(assert (=> b!1488708 (= lt!649113 (Intermediate!12314 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488709 () Bool)

(assert (=> b!1488709 (= e!834386 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649110 intermediateAfterIndex!19 lt!649112 lt!649114 mask!2687) lt!649111)))))

(declare-fun b!1488710 () Bool)

(declare-fun res!1012440 () Bool)

(assert (=> b!1488710 (=> (not res!1012440) (not e!834379))))

(assert (=> b!1488710 (= res!1012440 (= (seekEntryOrOpen!0 (select (arr!48049 a!2862) j!93) a!2862 mask!2687) (Found!12314 j!93)))))

(declare-fun b!1488711 () Bool)

(declare-fun lt!649115 () SeekEntryResult!12314)

(assert (=> b!1488711 (= e!834386 (not (= lt!649115 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649110 lt!649112 lt!649114 mask!2687))))))

(declare-fun b!1488712 () Bool)

(assert (=> b!1488712 (= e!834377 e!834381)))

(declare-fun res!1012441 () Bool)

(assert (=> b!1488712 (=> (not res!1012441) (not e!834381))))

(assert (=> b!1488712 (= res!1012441 (= lt!649115 (Intermediate!12314 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488712 (= lt!649115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649112 mask!2687) lt!649112 lt!649114 mask!2687))))

(assert (=> b!1488712 (= lt!649112 (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488713 () Bool)

(assert (=> b!1488713 (= e!834381 (not e!834382))))

(declare-fun res!1012443 () Bool)

(assert (=> b!1488713 (=> res!1012443 e!834382)))

(assert (=> b!1488713 (= res!1012443 (or (and (= (select (arr!48049 a!2862) index!646) (select (store (arr!48049 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48049 a!2862) index!646) (select (arr!48049 a!2862) j!93))) (= (select (arr!48049 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488713 e!834379))

(declare-fun res!1012434 () Bool)

(assert (=> b!1488713 (=> (not res!1012434) (not e!834379))))

(assert (=> b!1488713 (= res!1012434 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49809 0))(
  ( (Unit!49810) )
))
(declare-fun lt!649109 () Unit!49809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49809)

(assert (=> b!1488713 (= lt!649109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488714 () Bool)

(assert (=> b!1488714 (= e!834385 (= lt!649115 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649112 lt!649114 mask!2687)))))

(assert (= (and start!126782 res!1012435) b!1488702))

(assert (= (and b!1488702 res!1012439) b!1488706))

(assert (= (and b!1488706 res!1012442) b!1488703))

(assert (= (and b!1488703 res!1012447) b!1488701))

(assert (= (and b!1488701 res!1012429) b!1488698))

(assert (= (and b!1488698 res!1012433) b!1488699))

(assert (= (and b!1488699 res!1012430) b!1488700))

(assert (= (and b!1488700 res!1012436) b!1488708))

(assert (= (and b!1488708 res!1012437) b!1488697))

(assert (= (and b!1488697 res!1012432) b!1488712))

(assert (= (and b!1488712 res!1012441) b!1488695))

(assert (= (and b!1488695 c!137662) b!1488714))

(assert (= (and b!1488695 (not c!137662)) b!1488694))

(assert (= (and b!1488695 res!1012438) b!1488696))

(assert (= (and b!1488696 res!1012444) b!1488713))

(assert (= (and b!1488713 res!1012434) b!1488710))

(assert (= (and b!1488710 res!1012440) b!1488693))

(assert (= (and b!1488713 (not res!1012443)) b!1488704))

(assert (= (and b!1488704 (not res!1012445)) b!1488692))

(assert (= (and b!1488692 (not res!1012431)) b!1488707))

(assert (= (and b!1488707 c!137661) b!1488711))

(assert (= (and b!1488707 (not c!137661)) b!1488709))

(assert (= (and b!1488707 (not res!1012446)) b!1488705))

(declare-fun m!1372437 () Bool)

(assert (=> b!1488692 m!1372437))

(assert (=> b!1488692 m!1372437))

(declare-fun m!1372439 () Bool)

(assert (=> b!1488692 m!1372439))

(declare-fun m!1372441 () Bool)

(assert (=> b!1488704 m!1372441))

(declare-fun m!1372443 () Bool)

(assert (=> b!1488704 m!1372443))

(declare-fun m!1372445 () Bool)

(assert (=> b!1488704 m!1372445))

(assert (=> b!1488694 m!1372443))

(assert (=> b!1488694 m!1372445))

(assert (=> b!1488697 m!1372437))

(assert (=> b!1488697 m!1372437))

(declare-fun m!1372447 () Bool)

(assert (=> b!1488697 m!1372447))

(declare-fun m!1372449 () Bool)

(assert (=> b!1488698 m!1372449))

(declare-fun m!1372451 () Bool)

(assert (=> b!1488701 m!1372451))

(declare-fun m!1372453 () Bool)

(assert (=> b!1488712 m!1372453))

(assert (=> b!1488712 m!1372453))

(declare-fun m!1372455 () Bool)

(assert (=> b!1488712 m!1372455))

(declare-fun m!1372457 () Bool)

(assert (=> b!1488712 m!1372457))

(declare-fun m!1372459 () Bool)

(assert (=> b!1488712 m!1372459))

(declare-fun m!1372461 () Bool)

(assert (=> start!126782 m!1372461))

(declare-fun m!1372463 () Bool)

(assert (=> start!126782 m!1372463))

(declare-fun m!1372465 () Bool)

(assert (=> b!1488711 m!1372465))

(assert (=> b!1488700 m!1372457))

(declare-fun m!1372467 () Bool)

(assert (=> b!1488700 m!1372467))

(assert (=> b!1488710 m!1372437))

(assert (=> b!1488710 m!1372437))

(declare-fun m!1372469 () Bool)

(assert (=> b!1488710 m!1372469))

(declare-fun m!1372471 () Bool)

(assert (=> b!1488709 m!1372471))

(declare-fun m!1372473 () Bool)

(assert (=> b!1488714 m!1372473))

(assert (=> b!1488708 m!1372437))

(assert (=> b!1488708 m!1372437))

(declare-fun m!1372475 () Bool)

(assert (=> b!1488708 m!1372475))

(assert (=> b!1488708 m!1372475))

(assert (=> b!1488708 m!1372437))

(declare-fun m!1372477 () Bool)

(assert (=> b!1488708 m!1372477))

(declare-fun m!1372479 () Bool)

(assert (=> b!1488706 m!1372479))

(assert (=> b!1488706 m!1372479))

(declare-fun m!1372481 () Bool)

(assert (=> b!1488706 m!1372481))

(declare-fun m!1372483 () Bool)

(assert (=> b!1488713 m!1372483))

(assert (=> b!1488713 m!1372457))

(declare-fun m!1372485 () Bool)

(assert (=> b!1488713 m!1372485))

(declare-fun m!1372487 () Bool)

(assert (=> b!1488713 m!1372487))

(declare-fun m!1372489 () Bool)

(assert (=> b!1488713 m!1372489))

(assert (=> b!1488713 m!1372437))

(assert (=> b!1488703 m!1372437))

(assert (=> b!1488703 m!1372437))

(declare-fun m!1372491 () Bool)

(assert (=> b!1488703 m!1372491))

(assert (=> b!1488693 m!1372457))

(declare-fun m!1372493 () Bool)

(assert (=> b!1488693 m!1372493))

(assert (=> b!1488693 m!1372485))

(assert (=> b!1488693 m!1372487))

(assert (=> b!1488693 m!1372437))

(check-sat (not b!1488712) (not b!1488703) (not b!1488701) (not b!1488694) (not b!1488697) (not b!1488698) (not b!1488710) (not b!1488711) (not b!1488692) (not b!1488704) (not b!1488708) (not b!1488709) (not start!126782) (not b!1488713) (not b!1488706) (not b!1488714))
(check-sat)
