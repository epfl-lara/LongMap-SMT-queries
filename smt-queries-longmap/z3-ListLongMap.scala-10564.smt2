; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124740 () Bool)

(assert start!124740)

(declare-fun b!1442276 () Bool)

(declare-fun res!973873 () Bool)

(declare-fun e!813181 () Bool)

(assert (=> b!1442276 (=> (not res!973873) (not e!813181))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98083 0))(
  ( (array!98084 (arr!47326 (Array (_ BitVec 32) (_ BitVec 64))) (size!47877 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98083)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11475 0))(
  ( (MissingZero!11475 (index!48292 (_ BitVec 32))) (Found!11475 (index!48293 (_ BitVec 32))) (Intermediate!11475 (undefined!12287 Bool) (index!48294 (_ BitVec 32)) (x!130188 (_ BitVec 32))) (Undefined!11475) (MissingVacant!11475 (index!48295 (_ BitVec 32))) )
))
(declare-fun lt!633531 () SeekEntryResult!11475)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98083 (_ BitVec 32)) SeekEntryResult!11475)

(assert (=> b!1442276 (= res!973873 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!633531))))

(declare-fun b!1442277 () Bool)

(declare-fun e!813183 () Bool)

(assert (=> b!1442277 (= e!813183 e!813181)))

(declare-fun res!973874 () Bool)

(assert (=> b!1442277 (=> (not res!973874) (not e!813181))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442277 (= res!973874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47326 a!2862) j!93) mask!2687) (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!633531))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442277 (= lt!633531 (Intermediate!11475 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442278 () Bool)

(declare-fun res!973876 () Bool)

(declare-fun e!813186 () Bool)

(assert (=> b!1442278 (=> (not res!973876) (not e!813186))))

(declare-datatypes ((List!33814 0))(
  ( (Nil!33811) (Cons!33810 (h!35171 (_ BitVec 64)) (t!48500 List!33814)) )
))
(declare-fun arrayNoDuplicates!0 (array!98083 (_ BitVec 32) List!33814) Bool)

(assert (=> b!1442278 (= res!973876 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33811))))

(declare-fun b!1442279 () Bool)

(declare-fun e!813184 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633528 () array!98083)

(declare-fun lt!633532 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98083 (_ BitVec 32)) SeekEntryResult!11475)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98083 (_ BitVec 32)) SeekEntryResult!11475)

(assert (=> b!1442279 (= e!813184 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633532 lt!633528 mask!2687) (seekEntryOrOpen!0 lt!633532 lt!633528 mask!2687))))))

(declare-fun b!1442280 () Bool)

(declare-fun e!813185 () Bool)

(assert (=> b!1442280 (= e!813181 e!813185)))

(declare-fun res!973882 () Bool)

(assert (=> b!1442280 (=> (not res!973882) (not e!813185))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633529 () SeekEntryResult!11475)

(assert (=> b!1442280 (= res!973882 (= lt!633529 (Intermediate!11475 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442280 (= lt!633529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633532 mask!2687) lt!633532 lt!633528 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442280 (= lt!633532 (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442281 () Bool)

(declare-fun res!973881 () Bool)

(assert (=> b!1442281 (=> (not res!973881) (not e!813186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98083 (_ BitVec 32)) Bool)

(assert (=> b!1442281 (= res!973881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442282 () Bool)

(assert (=> b!1442282 (= e!813186 e!813183)))

(declare-fun res!973878 () Bool)

(assert (=> b!1442282 (=> (not res!973878) (not e!813183))))

(assert (=> b!1442282 (= res!973878 (= (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442282 (= lt!633528 (array!98084 (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47877 a!2862)))))

(declare-fun b!1442283 () Bool)

(assert (=> b!1442283 (= e!813185 false)))

(declare-fun lt!633530 () Bool)

(assert (=> b!1442283 (= lt!633530 e!813184)))

(declare-fun c!133720 () Bool)

(assert (=> b!1442283 (= c!133720 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442284 () Bool)

(assert (=> b!1442284 (= e!813184 (not (= lt!633529 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633532 lt!633528 mask!2687))))))

(declare-fun b!1442275 () Bool)

(declare-fun res!973875 () Bool)

(assert (=> b!1442275 (=> (not res!973875) (not e!813186))))

(assert (=> b!1442275 (= res!973875 (and (= (size!47877 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47877 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47877 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973877 () Bool)

(assert (=> start!124740 (=> (not res!973877) (not e!813186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124740 (= res!973877 (validMask!0 mask!2687))))

(assert (=> start!124740 e!813186))

(assert (=> start!124740 true))

(declare-fun array_inv!36607 (array!98083) Bool)

(assert (=> start!124740 (array_inv!36607 a!2862)))

(declare-fun b!1442285 () Bool)

(declare-fun res!973880 () Bool)

(assert (=> b!1442285 (=> (not res!973880) (not e!813186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442285 (= res!973880 (validKeyInArray!0 (select (arr!47326 a!2862) j!93)))))

(declare-fun b!1442286 () Bool)

(declare-fun res!973879 () Bool)

(assert (=> b!1442286 (=> (not res!973879) (not e!813186))))

(assert (=> b!1442286 (= res!973879 (validKeyInArray!0 (select (arr!47326 a!2862) i!1006)))))

(declare-fun b!1442287 () Bool)

(declare-fun res!973883 () Bool)

(assert (=> b!1442287 (=> (not res!973883) (not e!813186))))

(assert (=> b!1442287 (= res!973883 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47877 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47877 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47877 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124740 res!973877) b!1442275))

(assert (= (and b!1442275 res!973875) b!1442286))

(assert (= (and b!1442286 res!973879) b!1442285))

(assert (= (and b!1442285 res!973880) b!1442281))

(assert (= (and b!1442281 res!973881) b!1442278))

(assert (= (and b!1442278 res!973876) b!1442287))

(assert (= (and b!1442287 res!973883) b!1442282))

(assert (= (and b!1442282 res!973878) b!1442277))

(assert (= (and b!1442277 res!973874) b!1442276))

(assert (= (and b!1442276 res!973873) b!1442280))

(assert (= (and b!1442280 res!973882) b!1442283))

(assert (= (and b!1442283 c!133720) b!1442284))

(assert (= (and b!1442283 (not c!133720)) b!1442279))

(declare-fun m!1331623 () Bool)

(assert (=> b!1442286 m!1331623))

(assert (=> b!1442286 m!1331623))

(declare-fun m!1331625 () Bool)

(assert (=> b!1442286 m!1331625))

(declare-fun m!1331627 () Bool)

(assert (=> b!1442280 m!1331627))

(assert (=> b!1442280 m!1331627))

(declare-fun m!1331629 () Bool)

(assert (=> b!1442280 m!1331629))

(declare-fun m!1331631 () Bool)

(assert (=> b!1442280 m!1331631))

(declare-fun m!1331633 () Bool)

(assert (=> b!1442280 m!1331633))

(declare-fun m!1331635 () Bool)

(assert (=> b!1442281 m!1331635))

(declare-fun m!1331637 () Bool)

(assert (=> start!124740 m!1331637))

(declare-fun m!1331639 () Bool)

(assert (=> start!124740 m!1331639))

(declare-fun m!1331641 () Bool)

(assert (=> b!1442279 m!1331641))

(declare-fun m!1331643 () Bool)

(assert (=> b!1442279 m!1331643))

(declare-fun m!1331645 () Bool)

(assert (=> b!1442276 m!1331645))

(assert (=> b!1442276 m!1331645))

(declare-fun m!1331647 () Bool)

(assert (=> b!1442276 m!1331647))

(declare-fun m!1331649 () Bool)

(assert (=> b!1442284 m!1331649))

(assert (=> b!1442282 m!1331631))

(declare-fun m!1331651 () Bool)

(assert (=> b!1442282 m!1331651))

(assert (=> b!1442277 m!1331645))

(assert (=> b!1442277 m!1331645))

(declare-fun m!1331653 () Bool)

(assert (=> b!1442277 m!1331653))

(assert (=> b!1442277 m!1331653))

(assert (=> b!1442277 m!1331645))

(declare-fun m!1331655 () Bool)

(assert (=> b!1442277 m!1331655))

(declare-fun m!1331657 () Bool)

(assert (=> b!1442278 m!1331657))

(assert (=> b!1442285 m!1331645))

(assert (=> b!1442285 m!1331645))

(declare-fun m!1331659 () Bool)

(assert (=> b!1442285 m!1331659))

(check-sat (not b!1442278) (not b!1442281) (not start!124740) (not b!1442276) (not b!1442279) (not b!1442285) (not b!1442286) (not b!1442277) (not b!1442280) (not b!1442284))
(check-sat)
