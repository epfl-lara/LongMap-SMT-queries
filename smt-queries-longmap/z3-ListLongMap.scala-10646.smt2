; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125232 () Bool)

(assert start!125232)

(declare-fun b!1455433 () Bool)

(declare-fun res!985516 () Bool)

(declare-fun e!819211 () Bool)

(assert (=> b!1455433 (=> (not res!985516) (not e!819211))))

(declare-datatypes ((array!98575 0))(
  ( (array!98576 (arr!47572 (Array (_ BitVec 32) (_ BitVec 64))) (size!48123 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98575)

(declare-datatypes ((List!34060 0))(
  ( (Nil!34057) (Cons!34056 (h!35417 (_ BitVec 64)) (t!48746 List!34060)) )
))
(declare-fun arrayNoDuplicates!0 (array!98575 (_ BitVec 32) List!34060) Bool)

(assert (=> b!1455433 (= res!985516 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34057))))

(declare-fun b!1455434 () Bool)

(declare-fun res!985518 () Bool)

(declare-fun e!819214 () Bool)

(assert (=> b!1455434 (=> res!985518 e!819214)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11721 0))(
  ( (MissingZero!11721 (index!49276 (_ BitVec 32))) (Found!11721 (index!49277 (_ BitVec 32))) (Intermediate!11721 (undefined!12533 Bool) (index!49278 (_ BitVec 32)) (x!131090 (_ BitVec 32))) (Undefined!11721) (MissingVacant!11721 (index!49279 (_ BitVec 32))) )
))
(declare-fun lt!637944 () SeekEntryResult!11721)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637950 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98575 (_ BitVec 32)) SeekEntryResult!11721)

(assert (=> b!1455434 (= res!985518 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637950 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!637944)))))

(declare-fun b!1455435 () Bool)

(declare-fun res!985526 () Bool)

(declare-fun e!819213 () Bool)

(assert (=> b!1455435 (=> (not res!985526) (not e!819213))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98575 (_ BitVec 32)) SeekEntryResult!11721)

(assert (=> b!1455435 (= res!985526 (= (seekEntryOrOpen!0 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) (Found!11721 j!93)))))

(declare-fun b!1455436 () Bool)

(declare-fun res!985522 () Bool)

(assert (=> b!1455436 (=> (not res!985522) (not e!819211))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455436 (= res!985522 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48123 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48123 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48123 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun b!1455437 () Bool)

(assert (=> b!1455437 (= e!819213 (and (or (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) (select (arr!47572 a!2862) j!93))) (let ((bdg!53036 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47572 a!2862) index!646) bdg!53036) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53036 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455438 () Bool)

(declare-fun res!985521 () Bool)

(declare-fun e!819216 () Bool)

(assert (=> b!1455438 (=> (not res!985521) (not e!819216))))

(declare-fun e!819212 () Bool)

(assert (=> b!1455438 (= res!985521 e!819212)))

(declare-fun c!134479 () Bool)

(assert (=> b!1455438 (= c!134479 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455439 () Bool)

(declare-fun res!985523 () Bool)

(assert (=> b!1455439 (=> (not res!985523) (not e!819211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98575 (_ BitVec 32)) Bool)

(assert (=> b!1455439 (= res!985523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!637947 () SeekEntryResult!11721)

(declare-fun lt!637945 () array!98575)

(declare-fun b!1455440 () Bool)

(declare-fun lt!637951 () (_ BitVec 64))

(declare-fun e!819210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98575 (_ BitVec 32)) SeekEntryResult!11721)

(assert (=> b!1455440 (= e!819210 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637950 intermediateAfterIndex!19 lt!637951 lt!637945 mask!2687) lt!637947)))))

(declare-fun b!1455441 () Bool)

(declare-fun res!985529 () Bool)

(assert (=> b!1455441 (=> (not res!985529) (not e!819216))))

(assert (=> b!1455441 (= res!985529 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!637948 () SeekEntryResult!11721)

(declare-fun b!1455442 () Bool)

(assert (=> b!1455442 (= e!819212 (= lt!637948 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637951 lt!637945 mask!2687)))))

(declare-fun b!1455443 () Bool)

(assert (=> b!1455443 (= e!819212 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637951 lt!637945 mask!2687) (seekEntryOrOpen!0 lt!637951 lt!637945 mask!2687)))))

(declare-fun b!1455444 () Bool)

(declare-fun res!985527 () Bool)

(declare-fun e!819218 () Bool)

(assert (=> b!1455444 (=> (not res!985527) (not e!819218))))

(assert (=> b!1455444 (= res!985527 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!637944))))

(declare-fun b!1455445 () Bool)

(declare-fun res!985515 () Bool)

(assert (=> b!1455445 (=> (not res!985515) (not e!819211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455445 (= res!985515 (validKeyInArray!0 (select (arr!47572 a!2862) i!1006)))))

(declare-fun b!1455446 () Bool)

(declare-fun e!819215 () Bool)

(assert (=> b!1455446 (= e!819215 e!819214)))

(declare-fun res!985532 () Bool)

(assert (=> b!1455446 (=> res!985532 e!819214)))

(assert (=> b!1455446 (= res!985532 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637950 #b00000000000000000000000000000000) (bvsge lt!637950 (size!48123 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455446 (= lt!637950 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1455446 (= lt!637947 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637951 lt!637945 mask!2687))))

(assert (=> b!1455446 (= lt!637947 (seekEntryOrOpen!0 lt!637951 lt!637945 mask!2687))))

(declare-fun b!1455447 () Bool)

(declare-fun res!985519 () Bool)

(assert (=> b!1455447 (=> (not res!985519) (not e!819211))))

(assert (=> b!1455447 (= res!985519 (and (= (size!48123 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48123 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48123 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455448 () Bool)

(assert (=> b!1455448 (= e!819216 (not e!819215))))

(declare-fun res!985531 () Bool)

(assert (=> b!1455448 (=> res!985531 e!819215)))

(assert (=> b!1455448 (= res!985531 (or (and (= (select (arr!47572 a!2862) index!646) (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455448 e!819213))

(declare-fun res!985524 () Bool)

(assert (=> b!1455448 (=> (not res!985524) (not e!819213))))

(assert (=> b!1455448 (= res!985524 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48971 0))(
  ( (Unit!48972) )
))
(declare-fun lt!637946 () Unit!48971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48971)

(assert (=> b!1455448 (= lt!637946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!985520 () Bool)

(assert (=> start!125232 (=> (not res!985520) (not e!819211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125232 (= res!985520 (validMask!0 mask!2687))))

(assert (=> start!125232 e!819211))

(assert (=> start!125232 true))

(declare-fun array_inv!36853 (array!98575) Bool)

(assert (=> start!125232 (array_inv!36853 a!2862)))

(declare-fun b!1455449 () Bool)

(declare-fun e!819219 () Bool)

(assert (=> b!1455449 (= e!819211 e!819219)))

(declare-fun res!985517 () Bool)

(assert (=> b!1455449 (=> (not res!985517) (not e!819219))))

(assert (=> b!1455449 (= res!985517 (= (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455449 (= lt!637945 (array!98576 (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48123 a!2862)))))

(declare-fun b!1455450 () Bool)

(assert (=> b!1455450 (= e!819214 true)))

(declare-fun lt!637949 () Bool)

(assert (=> b!1455450 (= lt!637949 e!819210)))

(declare-fun c!134478 () Bool)

(assert (=> b!1455450 (= c!134478 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455451 () Bool)

(assert (=> b!1455451 (= e!819210 (not (= lt!637948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637950 lt!637951 lt!637945 mask!2687))))))

(declare-fun b!1455452 () Bool)

(declare-fun res!985528 () Bool)

(assert (=> b!1455452 (=> (not res!985528) (not e!819211))))

(assert (=> b!1455452 (= res!985528 (validKeyInArray!0 (select (arr!47572 a!2862) j!93)))))

(declare-fun b!1455453 () Bool)

(assert (=> b!1455453 (= e!819219 e!819218)))

(declare-fun res!985530 () Bool)

(assert (=> b!1455453 (=> (not res!985530) (not e!819218))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455453 (= res!985530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47572 a!2862) j!93) mask!2687) (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!637944))))

(assert (=> b!1455453 (= lt!637944 (Intermediate!11721 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455454 () Bool)

(assert (=> b!1455454 (= e!819218 e!819216)))

(declare-fun res!985525 () Bool)

(assert (=> b!1455454 (=> (not res!985525) (not e!819216))))

(assert (=> b!1455454 (= res!985525 (= lt!637948 (Intermediate!11721 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455454 (= lt!637948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637951 mask!2687) lt!637951 lt!637945 mask!2687))))

(assert (=> b!1455454 (= lt!637951 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125232 res!985520) b!1455447))

(assert (= (and b!1455447 res!985519) b!1455445))

(assert (= (and b!1455445 res!985515) b!1455452))

(assert (= (and b!1455452 res!985528) b!1455439))

(assert (= (and b!1455439 res!985523) b!1455433))

(assert (= (and b!1455433 res!985516) b!1455436))

(assert (= (and b!1455436 res!985522) b!1455449))

(assert (= (and b!1455449 res!985517) b!1455453))

(assert (= (and b!1455453 res!985530) b!1455444))

(assert (= (and b!1455444 res!985527) b!1455454))

(assert (= (and b!1455454 res!985525) b!1455438))

(assert (= (and b!1455438 c!134479) b!1455442))

(assert (= (and b!1455438 (not c!134479)) b!1455443))

(assert (= (and b!1455438 res!985521) b!1455441))

(assert (= (and b!1455441 res!985529) b!1455448))

(assert (= (and b!1455448 res!985524) b!1455435))

(assert (= (and b!1455435 res!985526) b!1455437))

(assert (= (and b!1455448 (not res!985531)) b!1455446))

(assert (= (and b!1455446 (not res!985532)) b!1455434))

(assert (= (and b!1455434 (not res!985518)) b!1455450))

(assert (= (and b!1455450 c!134478) b!1455451))

(assert (= (and b!1455450 (not c!134478)) b!1455440))

(declare-fun m!1343929 () Bool)

(assert (=> b!1455445 m!1343929))

(assert (=> b!1455445 m!1343929))

(declare-fun m!1343931 () Bool)

(assert (=> b!1455445 m!1343931))

(declare-fun m!1343933 () Bool)

(assert (=> b!1455434 m!1343933))

(assert (=> b!1455434 m!1343933))

(declare-fun m!1343935 () Bool)

(assert (=> b!1455434 m!1343935))

(declare-fun m!1343937 () Bool)

(assert (=> b!1455454 m!1343937))

(assert (=> b!1455454 m!1343937))

(declare-fun m!1343939 () Bool)

(assert (=> b!1455454 m!1343939))

(declare-fun m!1343941 () Bool)

(assert (=> b!1455454 m!1343941))

(declare-fun m!1343943 () Bool)

(assert (=> b!1455454 m!1343943))

(assert (=> b!1455449 m!1343941))

(declare-fun m!1343945 () Bool)

(assert (=> b!1455449 m!1343945))

(assert (=> b!1455444 m!1343933))

(assert (=> b!1455444 m!1343933))

(declare-fun m!1343947 () Bool)

(assert (=> b!1455444 m!1343947))

(declare-fun m!1343949 () Bool)

(assert (=> b!1455443 m!1343949))

(declare-fun m!1343951 () Bool)

(assert (=> b!1455443 m!1343951))

(declare-fun m!1343953 () Bool)

(assert (=> b!1455439 m!1343953))

(declare-fun m!1343955 () Bool)

(assert (=> b!1455433 m!1343955))

(declare-fun m!1343957 () Bool)

(assert (=> b!1455440 m!1343957))

(assert (=> b!1455435 m!1343933))

(assert (=> b!1455435 m!1343933))

(declare-fun m!1343959 () Bool)

(assert (=> b!1455435 m!1343959))

(assert (=> b!1455452 m!1343933))

(assert (=> b!1455452 m!1343933))

(declare-fun m!1343961 () Bool)

(assert (=> b!1455452 m!1343961))

(declare-fun m!1343963 () Bool)

(assert (=> b!1455442 m!1343963))

(declare-fun m!1343965 () Bool)

(assert (=> b!1455446 m!1343965))

(assert (=> b!1455446 m!1343949))

(assert (=> b!1455446 m!1343951))

(declare-fun m!1343967 () Bool)

(assert (=> b!1455451 m!1343967))

(declare-fun m!1343969 () Bool)

(assert (=> b!1455448 m!1343969))

(assert (=> b!1455448 m!1343941))

(declare-fun m!1343971 () Bool)

(assert (=> b!1455448 m!1343971))

(declare-fun m!1343973 () Bool)

(assert (=> b!1455448 m!1343973))

(declare-fun m!1343975 () Bool)

(assert (=> b!1455448 m!1343975))

(assert (=> b!1455448 m!1343933))

(assert (=> b!1455453 m!1343933))

(assert (=> b!1455453 m!1343933))

(declare-fun m!1343977 () Bool)

(assert (=> b!1455453 m!1343977))

(assert (=> b!1455453 m!1343977))

(assert (=> b!1455453 m!1343933))

(declare-fun m!1343979 () Bool)

(assert (=> b!1455453 m!1343979))

(declare-fun m!1343981 () Bool)

(assert (=> start!125232 m!1343981))

(declare-fun m!1343983 () Bool)

(assert (=> start!125232 m!1343983))

(assert (=> b!1455437 m!1343941))

(declare-fun m!1343985 () Bool)

(assert (=> b!1455437 m!1343985))

(assert (=> b!1455437 m!1343971))

(assert (=> b!1455437 m!1343973))

(assert (=> b!1455437 m!1343933))

(check-sat (not b!1455448) (not b!1455454) (not start!125232) (not b!1455443) (not b!1455445) (not b!1455444) (not b!1455440) (not b!1455453) (not b!1455439) (not b!1455451) (not b!1455433) (not b!1455452) (not b!1455435) (not b!1455446) (not b!1455434) (not b!1455442))
(check-sat)
