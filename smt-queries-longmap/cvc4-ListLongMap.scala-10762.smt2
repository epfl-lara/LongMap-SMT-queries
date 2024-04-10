; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125894 () Bool)

(assert start!125894)

(declare-fun b!1473835 () Bool)

(declare-fun res!1001119 () Bool)

(declare-fun e!827016 () Bool)

(assert (=> b!1473835 (=> (not res!1001119) (not e!827016))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99171 0))(
  ( (array!99172 (arr!47869 (Array (_ BitVec 32) (_ BitVec 64))) (size!48419 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99171)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473835 (= res!1001119 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48419 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48419 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48419 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1001122 () Bool)

(assert (=> start!125894 (=> (not res!1001122) (not e!827016))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125894 (= res!1001122 (validMask!0 mask!2687))))

(assert (=> start!125894 e!827016))

(assert (=> start!125894 true))

(declare-fun array_inv!36897 (array!99171) Bool)

(assert (=> start!125894 (array_inv!36897 a!2862)))

(declare-fun b!1473836 () Bool)

(declare-fun e!827015 () Bool)

(assert (=> b!1473836 (= e!827015 true)))

(declare-fun lt!644060 () array!99171)

(declare-datatypes ((SeekEntryResult!12109 0))(
  ( (MissingZero!12109 (index!50828 (_ BitVec 32))) (Found!12109 (index!50829 (_ BitVec 32))) (Intermediate!12109 (undefined!12921 Bool) (index!50830 (_ BitVec 32)) (x!132409 (_ BitVec 32))) (Undefined!12109) (MissingVacant!12109 (index!50831 (_ BitVec 32))) )
))
(declare-fun lt!644059 () SeekEntryResult!12109)

(declare-fun lt!644061 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99171 (_ BitVec 32)) SeekEntryResult!12109)

(assert (=> b!1473836 (= lt!644059 (seekEntryOrOpen!0 lt!644061 lt!644060 mask!2687))))

(declare-fun b!1473837 () Bool)

(declare-fun res!1001109 () Bool)

(assert (=> b!1473837 (=> (not res!1001109) (not e!827016))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473837 (= res!1001109 (validKeyInArray!0 (select (arr!47869 a!2862) i!1006)))))

(declare-fun b!1473838 () Bool)

(declare-fun res!1001121 () Bool)

(declare-fun e!827012 () Bool)

(assert (=> b!1473838 (=> (not res!1001121) (not e!827012))))

(declare-fun e!827018 () Bool)

(assert (=> b!1473838 (= res!1001121 e!827018)))

(declare-fun c!135879 () Bool)

(assert (=> b!1473838 (= c!135879 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473839 () Bool)

(declare-fun res!1001116 () Bool)

(assert (=> b!1473839 (=> (not res!1001116) (not e!827016))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1473839 (= res!1001116 (and (= (size!48419 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48419 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48419 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473840 () Bool)

(declare-fun e!827011 () Bool)

(assert (=> b!1473840 (= e!827016 e!827011)))

(declare-fun res!1001113 () Bool)

(assert (=> b!1473840 (=> (not res!1001113) (not e!827011))))

(assert (=> b!1473840 (= res!1001113 (= (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473840 (= lt!644060 (array!99172 (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48419 a!2862)))))

(declare-fun b!1473841 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99171 (_ BitVec 32)) SeekEntryResult!12109)

(assert (=> b!1473841 (= e!827018 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644061 lt!644060 mask!2687) (seekEntryOrOpen!0 lt!644061 lt!644060 mask!2687)))))

(declare-fun b!1473842 () Bool)

(declare-fun res!1001111 () Bool)

(declare-fun e!827017 () Bool)

(assert (=> b!1473842 (=> (not res!1001111) (not e!827017))))

(assert (=> b!1473842 (= res!1001111 (= (seekEntryOrOpen!0 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) (Found!12109 j!93)))))

(declare-fun b!1473843 () Bool)

(declare-fun res!1001112 () Bool)

(assert (=> b!1473843 (=> (not res!1001112) (not e!827012))))

(assert (=> b!1473843 (= res!1001112 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473844 () Bool)

(declare-fun res!1001110 () Bool)

(assert (=> b!1473844 (=> (not res!1001110) (not e!827016))))

(assert (=> b!1473844 (= res!1001110 (validKeyInArray!0 (select (arr!47869 a!2862) j!93)))))

(declare-fun b!1473845 () Bool)

(declare-fun res!1001120 () Bool)

(declare-fun e!827013 () Bool)

(assert (=> b!1473845 (=> (not res!1001120) (not e!827013))))

(declare-fun lt!644063 () SeekEntryResult!12109)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99171 (_ BitVec 32)) SeekEntryResult!12109)

(assert (=> b!1473845 (= res!1001120 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!644063))))

(declare-fun b!1473846 () Bool)

(assert (=> b!1473846 (= e!827012 (not e!827015))))

(declare-fun res!1001118 () Bool)

(assert (=> b!1473846 (=> res!1001118 e!827015)))

(assert (=> b!1473846 (= res!1001118 (or (not (= (select (arr!47869 a!2862) index!646) (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47869 a!2862) index!646) (select (arr!47869 a!2862) j!93)))))))

(assert (=> b!1473846 e!827017))

(declare-fun res!1001115 () Bool)

(assert (=> b!1473846 (=> (not res!1001115) (not e!827017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99171 (_ BitVec 32)) Bool)

(assert (=> b!1473846 (= res!1001115 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49558 0))(
  ( (Unit!49559) )
))
(declare-fun lt!644062 () Unit!49558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49558)

(assert (=> b!1473846 (= lt!644062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473847 () Bool)

(assert (=> b!1473847 (= e!827011 e!827013)))

(declare-fun res!1001107 () Bool)

(assert (=> b!1473847 (=> (not res!1001107) (not e!827013))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473847 (= res!1001107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47869 a!2862) j!93) mask!2687) (select (arr!47869 a!2862) j!93) a!2862 mask!2687) lt!644063))))

(assert (=> b!1473847 (= lt!644063 (Intermediate!12109 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473848 () Bool)

(declare-fun res!1001117 () Bool)

(assert (=> b!1473848 (=> (not res!1001117) (not e!827016))))

(assert (=> b!1473848 (= res!1001117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473849 () Bool)

(assert (=> b!1473849 (= e!827017 (or (= (select (arr!47869 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47869 a!2862) intermediateBeforeIndex!19) (select (arr!47869 a!2862) j!93))))))

(declare-fun lt!644064 () SeekEntryResult!12109)

(declare-fun b!1473850 () Bool)

(assert (=> b!1473850 (= e!827018 (= lt!644064 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644061 lt!644060 mask!2687)))))

(declare-fun b!1473851 () Bool)

(declare-fun res!1001108 () Bool)

(assert (=> b!1473851 (=> (not res!1001108) (not e!827016))))

(declare-datatypes ((List!34370 0))(
  ( (Nil!34367) (Cons!34366 (h!35725 (_ BitVec 64)) (t!49064 List!34370)) )
))
(declare-fun arrayNoDuplicates!0 (array!99171 (_ BitVec 32) List!34370) Bool)

(assert (=> b!1473851 (= res!1001108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34367))))

(declare-fun b!1473852 () Bool)

(assert (=> b!1473852 (= e!827013 e!827012)))

(declare-fun res!1001114 () Bool)

(assert (=> b!1473852 (=> (not res!1001114) (not e!827012))))

(assert (=> b!1473852 (= res!1001114 (= lt!644064 (Intermediate!12109 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473852 (= lt!644064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644061 mask!2687) lt!644061 lt!644060 mask!2687))))

(assert (=> b!1473852 (= lt!644061 (select (store (arr!47869 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125894 res!1001122) b!1473839))

(assert (= (and b!1473839 res!1001116) b!1473837))

(assert (= (and b!1473837 res!1001109) b!1473844))

(assert (= (and b!1473844 res!1001110) b!1473848))

(assert (= (and b!1473848 res!1001117) b!1473851))

(assert (= (and b!1473851 res!1001108) b!1473835))

(assert (= (and b!1473835 res!1001119) b!1473840))

(assert (= (and b!1473840 res!1001113) b!1473847))

(assert (= (and b!1473847 res!1001107) b!1473845))

(assert (= (and b!1473845 res!1001120) b!1473852))

(assert (= (and b!1473852 res!1001114) b!1473838))

(assert (= (and b!1473838 c!135879) b!1473850))

(assert (= (and b!1473838 (not c!135879)) b!1473841))

(assert (= (and b!1473838 res!1001121) b!1473843))

(assert (= (and b!1473843 res!1001112) b!1473846))

(assert (= (and b!1473846 res!1001115) b!1473842))

(assert (= (and b!1473842 res!1001111) b!1473849))

(assert (= (and b!1473846 (not res!1001118)) b!1473836))

(declare-fun m!1360331 () Bool)

(assert (=> start!125894 m!1360331))

(declare-fun m!1360333 () Bool)

(assert (=> start!125894 m!1360333))

(declare-fun m!1360335 () Bool)

(assert (=> b!1473847 m!1360335))

(assert (=> b!1473847 m!1360335))

(declare-fun m!1360337 () Bool)

(assert (=> b!1473847 m!1360337))

(assert (=> b!1473847 m!1360337))

(assert (=> b!1473847 m!1360335))

(declare-fun m!1360339 () Bool)

(assert (=> b!1473847 m!1360339))

(assert (=> b!1473845 m!1360335))

(assert (=> b!1473845 m!1360335))

(declare-fun m!1360341 () Bool)

(assert (=> b!1473845 m!1360341))

(declare-fun m!1360343 () Bool)

(assert (=> b!1473849 m!1360343))

(assert (=> b!1473849 m!1360335))

(declare-fun m!1360345 () Bool)

(assert (=> b!1473841 m!1360345))

(declare-fun m!1360347 () Bool)

(assert (=> b!1473841 m!1360347))

(declare-fun m!1360349 () Bool)

(assert (=> b!1473850 m!1360349))

(declare-fun m!1360351 () Bool)

(assert (=> b!1473851 m!1360351))

(assert (=> b!1473842 m!1360335))

(assert (=> b!1473842 m!1360335))

(declare-fun m!1360353 () Bool)

(assert (=> b!1473842 m!1360353))

(assert (=> b!1473836 m!1360347))

(declare-fun m!1360355 () Bool)

(assert (=> b!1473846 m!1360355))

(declare-fun m!1360357 () Bool)

(assert (=> b!1473846 m!1360357))

(declare-fun m!1360359 () Bool)

(assert (=> b!1473846 m!1360359))

(declare-fun m!1360361 () Bool)

(assert (=> b!1473846 m!1360361))

(declare-fun m!1360363 () Bool)

(assert (=> b!1473846 m!1360363))

(assert (=> b!1473846 m!1360335))

(declare-fun m!1360365 () Bool)

(assert (=> b!1473837 m!1360365))

(assert (=> b!1473837 m!1360365))

(declare-fun m!1360367 () Bool)

(assert (=> b!1473837 m!1360367))

(declare-fun m!1360369 () Bool)

(assert (=> b!1473848 m!1360369))

(declare-fun m!1360371 () Bool)

(assert (=> b!1473852 m!1360371))

(assert (=> b!1473852 m!1360371))

(declare-fun m!1360373 () Bool)

(assert (=> b!1473852 m!1360373))

(assert (=> b!1473852 m!1360357))

(declare-fun m!1360375 () Bool)

(assert (=> b!1473852 m!1360375))

(assert (=> b!1473840 m!1360357))

(declare-fun m!1360377 () Bool)

(assert (=> b!1473840 m!1360377))

(assert (=> b!1473844 m!1360335))

(assert (=> b!1473844 m!1360335))

(declare-fun m!1360379 () Bool)

(assert (=> b!1473844 m!1360379))

(push 1)

