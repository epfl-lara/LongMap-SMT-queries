; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126132 () Bool)

(assert start!126132)

(declare-fun b!1476544 () Bool)

(declare-fun res!1002784 () Bool)

(declare-fun e!828402 () Bool)

(assert (=> b!1476544 (=> (not res!1002784) (not e!828402))))

(declare-datatypes ((array!99238 0))(
  ( (array!99239 (arr!47898 (Array (_ BitVec 32) (_ BitVec 64))) (size!48448 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99238)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476544 (= res!1002784 (validKeyInArray!0 (select (arr!47898 a!2862) i!1006)))))

(declare-fun b!1476545 () Bool)

(declare-fun res!1002770 () Bool)

(declare-fun e!828398 () Bool)

(assert (=> b!1476545 (=> (not res!1002770) (not e!828398))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476545 (= res!1002770 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((SeekEntryResult!12138 0))(
  ( (MissingZero!12138 (index!50944 (_ BitVec 32))) (Found!12138 (index!50945 (_ BitVec 32))) (Intermediate!12138 (undefined!12950 Bool) (index!50946 (_ BitVec 32)) (x!132545 (_ BitVec 32))) (Undefined!12138) (MissingVacant!12138 (index!50947 (_ BitVec 32))) )
))
(declare-fun lt!645051 () SeekEntryResult!12138)

(declare-fun b!1476546 () Bool)

(declare-fun lt!645054 () array!99238)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!645053 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!828401 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12138)

(assert (=> b!1476546 (= e!828401 (= lt!645051 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645053 lt!645054 mask!2687)))))

(declare-fun b!1476547 () Bool)

(declare-fun res!1002772 () Bool)

(declare-fun e!828396 () Bool)

(assert (=> b!1476547 (=> (not res!1002772) (not e!828396))))

(declare-fun lt!645052 () SeekEntryResult!12138)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476547 (= res!1002772 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47898 a!2862) j!93) a!2862 mask!2687) lt!645052))))

(declare-fun b!1476548 () Bool)

(declare-fun res!1002771 () Bool)

(assert (=> b!1476548 (=> (not res!1002771) (not e!828402))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476548 (= res!1002771 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48448 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48448 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48448 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476549 () Bool)

(declare-fun res!1002773 () Bool)

(assert (=> b!1476549 (=> (not res!1002773) (not e!828402))))

(declare-datatypes ((List!34399 0))(
  ( (Nil!34396) (Cons!34395 (h!35763 (_ BitVec 64)) (t!49093 List!34399)) )
))
(declare-fun arrayNoDuplicates!0 (array!99238 (_ BitVec 32) List!34399) Bool)

(assert (=> b!1476549 (= res!1002773 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34396))))

(declare-fun b!1476551 () Bool)

(declare-fun e!828403 () Bool)

(declare-fun e!828399 () Bool)

(assert (=> b!1476551 (= e!828403 e!828399)))

(declare-fun res!1002775 () Bool)

(assert (=> b!1476551 (=> (not res!1002775) (not e!828399))))

(declare-fun lt!645050 () SeekEntryResult!12138)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12138)

(assert (=> b!1476551 (= res!1002775 (= lt!645050 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47898 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476552 () Bool)

(assert (=> b!1476552 (= e!828399 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476553 () Bool)

(declare-fun e!828400 () Bool)

(assert (=> b!1476553 (= e!828400 e!828403)))

(declare-fun res!1002777 () Bool)

(assert (=> b!1476553 (=> res!1002777 e!828403)))

(assert (=> b!1476553 (= res!1002777 (or (and (= (select (arr!47898 a!2862) index!646) (select (store (arr!47898 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47898 a!2862) index!646) (select (arr!47898 a!2862) j!93))) (not (= (select (arr!47898 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476554 () Bool)

(declare-fun res!1002780 () Bool)

(assert (=> b!1476554 (=> (not res!1002780) (not e!828402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99238 (_ BitVec 32)) Bool)

(assert (=> b!1476554 (= res!1002780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476555 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12138)

(assert (=> b!1476555 (= e!828401 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645053 lt!645054 mask!2687) (seekEntryOrOpen!0 lt!645053 lt!645054 mask!2687)))))

(declare-fun b!1476556 () Bool)

(assert (=> b!1476556 (= e!828396 e!828398)))

(declare-fun res!1002776 () Bool)

(assert (=> b!1476556 (=> (not res!1002776) (not e!828398))))

(assert (=> b!1476556 (= res!1002776 (= lt!645051 (Intermediate!12138 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476556 (= lt!645051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645053 mask!2687) lt!645053 lt!645054 mask!2687))))

(assert (=> b!1476556 (= lt!645053 (select (store (arr!47898 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476557 () Bool)

(declare-fun res!1002782 () Bool)

(assert (=> b!1476557 (=> (not res!1002782) (not e!828402))))

(assert (=> b!1476557 (= res!1002782 (validKeyInArray!0 (select (arr!47898 a!2862) j!93)))))

(declare-fun b!1476558 () Bool)

(assert (=> b!1476558 (= e!828398 (not true))))

(assert (=> b!1476558 e!828400))

(declare-fun res!1002774 () Bool)

(assert (=> b!1476558 (=> (not res!1002774) (not e!828400))))

(assert (=> b!1476558 (= res!1002774 (and (= lt!645050 (Found!12138 j!93)) (or (= (select (arr!47898 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47898 a!2862) intermediateBeforeIndex!19) (select (arr!47898 a!2862) j!93)))))))

(assert (=> b!1476558 (= lt!645050 (seekEntryOrOpen!0 (select (arr!47898 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476558 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49616 0))(
  ( (Unit!49617) )
))
(declare-fun lt!645049 () Unit!49616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49616)

(assert (=> b!1476558 (= lt!645049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476559 () Bool)

(declare-fun res!1002778 () Bool)

(assert (=> b!1476559 (=> (not res!1002778) (not e!828402))))

(assert (=> b!1476559 (= res!1002778 (and (= (size!48448 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48448 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48448 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1002769 () Bool)

(assert (=> start!126132 (=> (not res!1002769) (not e!828402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126132 (= res!1002769 (validMask!0 mask!2687))))

(assert (=> start!126132 e!828402))

(assert (=> start!126132 true))

(declare-fun array_inv!36926 (array!99238) Bool)

(assert (=> start!126132 (array_inv!36926 a!2862)))

(declare-fun b!1476550 () Bool)

(declare-fun res!1002781 () Bool)

(assert (=> b!1476550 (=> (not res!1002781) (not e!828398))))

(assert (=> b!1476550 (= res!1002781 e!828401)))

(declare-fun c!136407 () Bool)

(assert (=> b!1476550 (= c!136407 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476560 () Bool)

(declare-fun e!828397 () Bool)

(assert (=> b!1476560 (= e!828402 e!828397)))

(declare-fun res!1002779 () Bool)

(assert (=> b!1476560 (=> (not res!1002779) (not e!828397))))

(assert (=> b!1476560 (= res!1002779 (= (select (store (arr!47898 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476560 (= lt!645054 (array!99239 (store (arr!47898 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48448 a!2862)))))

(declare-fun b!1476561 () Bool)

(assert (=> b!1476561 (= e!828397 e!828396)))

(declare-fun res!1002783 () Bool)

(assert (=> b!1476561 (=> (not res!1002783) (not e!828396))))

(assert (=> b!1476561 (= res!1002783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47898 a!2862) j!93) mask!2687) (select (arr!47898 a!2862) j!93) a!2862 mask!2687) lt!645052))))

(assert (=> b!1476561 (= lt!645052 (Intermediate!12138 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126132 res!1002769) b!1476559))

(assert (= (and b!1476559 res!1002778) b!1476544))

(assert (= (and b!1476544 res!1002784) b!1476557))

(assert (= (and b!1476557 res!1002782) b!1476554))

(assert (= (and b!1476554 res!1002780) b!1476549))

(assert (= (and b!1476549 res!1002773) b!1476548))

(assert (= (and b!1476548 res!1002771) b!1476560))

(assert (= (and b!1476560 res!1002779) b!1476561))

(assert (= (and b!1476561 res!1002783) b!1476547))

(assert (= (and b!1476547 res!1002772) b!1476556))

(assert (= (and b!1476556 res!1002776) b!1476550))

(assert (= (and b!1476550 c!136407) b!1476546))

(assert (= (and b!1476550 (not c!136407)) b!1476555))

(assert (= (and b!1476550 res!1002781) b!1476545))

(assert (= (and b!1476545 res!1002770) b!1476558))

(assert (= (and b!1476558 res!1002774) b!1476553))

(assert (= (and b!1476553 (not res!1002777)) b!1476551))

(assert (= (and b!1476551 res!1002775) b!1476552))

(declare-fun m!1362527 () Bool)

(assert (=> b!1476557 m!1362527))

(assert (=> b!1476557 m!1362527))

(declare-fun m!1362529 () Bool)

(assert (=> b!1476557 m!1362529))

(declare-fun m!1362531 () Bool)

(assert (=> b!1476556 m!1362531))

(assert (=> b!1476556 m!1362531))

(declare-fun m!1362533 () Bool)

(assert (=> b!1476556 m!1362533))

(declare-fun m!1362535 () Bool)

(assert (=> b!1476556 m!1362535))

(declare-fun m!1362537 () Bool)

(assert (=> b!1476556 m!1362537))

(assert (=> b!1476560 m!1362535))

(declare-fun m!1362539 () Bool)

(assert (=> b!1476560 m!1362539))

(declare-fun m!1362541 () Bool)

(assert (=> b!1476549 m!1362541))

(declare-fun m!1362543 () Bool)

(assert (=> b!1476544 m!1362543))

(assert (=> b!1476544 m!1362543))

(declare-fun m!1362545 () Bool)

(assert (=> b!1476544 m!1362545))

(declare-fun m!1362547 () Bool)

(assert (=> b!1476553 m!1362547))

(assert (=> b!1476553 m!1362535))

(declare-fun m!1362549 () Bool)

(assert (=> b!1476553 m!1362549))

(assert (=> b!1476553 m!1362527))

(declare-fun m!1362551 () Bool)

(assert (=> b!1476555 m!1362551))

(declare-fun m!1362553 () Bool)

(assert (=> b!1476555 m!1362553))

(declare-fun m!1362555 () Bool)

(assert (=> b!1476554 m!1362555))

(declare-fun m!1362557 () Bool)

(assert (=> b!1476546 m!1362557))

(declare-fun m!1362559 () Bool)

(assert (=> b!1476558 m!1362559))

(declare-fun m!1362561 () Bool)

(assert (=> b!1476558 m!1362561))

(assert (=> b!1476558 m!1362527))

(declare-fun m!1362563 () Bool)

(assert (=> b!1476558 m!1362563))

(declare-fun m!1362565 () Bool)

(assert (=> b!1476558 m!1362565))

(assert (=> b!1476558 m!1362527))

(assert (=> b!1476561 m!1362527))

(assert (=> b!1476561 m!1362527))

(declare-fun m!1362567 () Bool)

(assert (=> b!1476561 m!1362567))

(assert (=> b!1476561 m!1362567))

(assert (=> b!1476561 m!1362527))

(declare-fun m!1362569 () Bool)

(assert (=> b!1476561 m!1362569))

(assert (=> b!1476551 m!1362527))

(assert (=> b!1476551 m!1362527))

(declare-fun m!1362571 () Bool)

(assert (=> b!1476551 m!1362571))

(assert (=> b!1476547 m!1362527))

(assert (=> b!1476547 m!1362527))

(declare-fun m!1362573 () Bool)

(assert (=> b!1476547 m!1362573))

(declare-fun m!1362575 () Bool)

(assert (=> start!126132 m!1362575))

(declare-fun m!1362577 () Bool)

(assert (=> start!126132 m!1362577))

(check-sat (not b!1476555) (not start!126132) (not b!1476547) (not b!1476544) (not b!1476556) (not b!1476558) (not b!1476557) (not b!1476561) (not b!1476546) (not b!1476549) (not b!1476554) (not b!1476551))
(check-sat)
