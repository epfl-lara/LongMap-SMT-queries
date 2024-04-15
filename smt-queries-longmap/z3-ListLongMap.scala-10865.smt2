; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127316 () Bool)

(assert start!127316)

(declare-fun b!1496751 () Bool)

(declare-fun e!838218 () Bool)

(declare-fun e!838219 () Bool)

(assert (=> b!1496751 (= e!838218 e!838219)))

(declare-fun res!1018179 () Bool)

(assert (=> b!1496751 (=> (not res!1018179) (not e!838219))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99772 0))(
  ( (array!99773 (arr!48151 (Array (_ BitVec 32) (_ BitVec 64))) (size!48703 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99772)

(assert (=> b!1496751 (= res!1018179 (= (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!652034 () array!99772)

(assert (=> b!1496751 (= lt!652034 (array!99773 (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48703 a!2862)))))

(declare-fun b!1496752 () Bool)

(declare-fun e!838212 () Bool)

(declare-fun e!838214 () Bool)

(assert (=> b!1496752 (= e!838212 (not e!838214))))

(declare-fun res!1018175 () Bool)

(assert (=> b!1496752 (=> res!1018175 e!838214)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496752 (= res!1018175 (or (and (= (select (arr!48151 a!2862) index!646) (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48151 a!2862) index!646) (select (arr!48151 a!2862) j!93))) (= (select (arr!48151 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12416 0))(
  ( (MissingZero!12416 (index!52056 (_ BitVec 32))) (Found!12416 (index!52057 (_ BitVec 32))) (Intermediate!12416 (undefined!13228 Bool) (index!52058 (_ BitVec 32)) (x!133677 (_ BitVec 32))) (Undefined!12416) (MissingVacant!12416 (index!52059 (_ BitVec 32))) )
))
(declare-fun lt!652032 () SeekEntryResult!12416)

(assert (=> b!1496752 (and (= lt!652032 (Found!12416 j!93)) (or (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) (select (arr!48151 a!2862) j!93))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99772 (_ BitVec 32)) SeekEntryResult!12416)

(assert (=> b!1496752 (= lt!652032 (seekEntryOrOpen!0 (select (arr!48151 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99772 (_ BitVec 32)) Bool)

(assert (=> b!1496752 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50013 0))(
  ( (Unit!50014) )
))
(declare-fun lt!652027 () Unit!50013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50013)

(assert (=> b!1496752 (= lt!652027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496753 () Bool)

(declare-fun res!1018185 () Bool)

(declare-fun e!838220 () Bool)

(assert (=> b!1496753 (=> res!1018185 e!838220)))

(declare-fun e!838215 () Bool)

(assert (=> b!1496753 (= res!1018185 e!838215)))

(declare-fun c!138829 () Bool)

(assert (=> b!1496753 (= c!138829 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496754 () Bool)

(assert (=> b!1496754 (= e!838220 true)))

(declare-fun lt!652030 () (_ BitVec 64))

(assert (=> b!1496754 (= lt!652032 (seekEntryOrOpen!0 lt!652030 lt!652034 mask!2687))))

(declare-fun lt!652028 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lt!652029 () Unit!50013)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50013)

(assert (=> b!1496754 (= lt!652029 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652028 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496755 () Bool)

(declare-fun res!1018181 () Bool)

(assert (=> b!1496755 (=> (not res!1018181) (not e!838218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496755 (= res!1018181 (validKeyInArray!0 (select (arr!48151 a!2862) i!1006)))))

(declare-fun b!1496756 () Bool)

(declare-fun e!838216 () Bool)

(assert (=> b!1496756 (= e!838219 e!838216)))

(declare-fun res!1018186 () Bool)

(assert (=> b!1496756 (=> (not res!1018186) (not e!838216))))

(declare-fun lt!652031 () SeekEntryResult!12416)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99772 (_ BitVec 32)) SeekEntryResult!12416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496756 (= res!1018186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48151 a!2862) j!93) mask!2687) (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!652031))))

(assert (=> b!1496756 (= lt!652031 (Intermediate!12416 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496757 () Bool)

(declare-fun res!1018184 () Bool)

(assert (=> b!1496757 (=> (not res!1018184) (not e!838216))))

(assert (=> b!1496757 (= res!1018184 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!652031))))

(declare-fun b!1496758 () Bool)

(assert (=> b!1496758 (= e!838216 e!838212)))

(declare-fun res!1018178 () Bool)

(assert (=> b!1496758 (=> (not res!1018178) (not e!838212))))

(declare-fun lt!652033 () SeekEntryResult!12416)

(assert (=> b!1496758 (= res!1018178 (= lt!652033 (Intermediate!12416 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496758 (= lt!652033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652030 mask!2687) lt!652030 lt!652034 mask!2687))))

(assert (=> b!1496758 (= lt!652030 (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1018176 () Bool)

(assert (=> start!127316 (=> (not res!1018176) (not e!838218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127316 (= res!1018176 (validMask!0 mask!2687))))

(assert (=> start!127316 e!838218))

(assert (=> start!127316 true))

(declare-fun array_inv!37384 (array!99772) Bool)

(assert (=> start!127316 (array_inv!37384 a!2862)))

(declare-fun b!1496759 () Bool)

(declare-fun res!1018180 () Bool)

(assert (=> b!1496759 (=> (not res!1018180) (not e!838218))))

(assert (=> b!1496759 (= res!1018180 (and (= (size!48703 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48703 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48703 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496760 () Bool)

(declare-fun res!1018174 () Bool)

(assert (=> b!1496760 (=> (not res!1018174) (not e!838212))))

(declare-fun e!838217 () Bool)

(assert (=> b!1496760 (= res!1018174 e!838217)))

(declare-fun c!138828 () Bool)

(assert (=> b!1496760 (= c!138828 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496761 () Bool)

(declare-fun res!1018173 () Bool)

(assert (=> b!1496761 (=> res!1018173 e!838220)))

(assert (=> b!1496761 (= res!1018173 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496762 () Bool)

(declare-fun res!1018183 () Bool)

(assert (=> b!1496762 (=> (not res!1018183) (not e!838218))))

(declare-datatypes ((List!34730 0))(
  ( (Nil!34727) (Cons!34726 (h!36124 (_ BitVec 64)) (t!49416 List!34730)) )
))
(declare-fun arrayNoDuplicates!0 (array!99772 (_ BitVec 32) List!34730) Bool)

(assert (=> b!1496762 (= res!1018183 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34727))))

(declare-fun b!1496763 () Bool)

(assert (=> b!1496763 (= e!838214 e!838220)))

(declare-fun res!1018172 () Bool)

(assert (=> b!1496763 (=> res!1018172 e!838220)))

(assert (=> b!1496763 (= res!1018172 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652028 #b00000000000000000000000000000000) (bvsge lt!652028 (size!48703 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496763 (= lt!652028 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496764 () Bool)

(declare-fun res!1018182 () Bool)

(assert (=> b!1496764 (=> (not res!1018182) (not e!838212))))

(assert (=> b!1496764 (= res!1018182 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496765 () Bool)

(declare-fun res!1018177 () Bool)

(assert (=> b!1496765 (=> res!1018177 e!838220)))

(assert (=> b!1496765 (= res!1018177 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652028 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!652031)))))

(declare-fun b!1496766 () Bool)

(assert (=> b!1496766 (= e!838215 (not (= lt!652033 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652028 lt!652030 lt!652034 mask!2687))))))

(declare-fun b!1496767 () Bool)

(declare-fun res!1018170 () Bool)

(assert (=> b!1496767 (=> (not res!1018170) (not e!838218))))

(assert (=> b!1496767 (= res!1018170 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48703 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48703 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48703 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496768 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99772 (_ BitVec 32)) SeekEntryResult!12416)

(assert (=> b!1496768 (= e!838215 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652028 intermediateAfterIndex!19 lt!652030 lt!652034 mask!2687) (seekEntryOrOpen!0 lt!652030 lt!652034 mask!2687))))))

(declare-fun b!1496769 () Bool)

(declare-fun res!1018171 () Bool)

(assert (=> b!1496769 (=> (not res!1018171) (not e!838218))))

(assert (=> b!1496769 (= res!1018171 (validKeyInArray!0 (select (arr!48151 a!2862) j!93)))))

(declare-fun b!1496770 () Bool)

(assert (=> b!1496770 (= e!838217 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652030 lt!652034 mask!2687) (seekEntryOrOpen!0 lt!652030 lt!652034 mask!2687)))))

(declare-fun b!1496771 () Bool)

(assert (=> b!1496771 (= e!838217 (= lt!652033 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652030 lt!652034 mask!2687)))))

(declare-fun b!1496772 () Bool)

(declare-fun res!1018169 () Bool)

(assert (=> b!1496772 (=> (not res!1018169) (not e!838218))))

(assert (=> b!1496772 (= res!1018169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127316 res!1018176) b!1496759))

(assert (= (and b!1496759 res!1018180) b!1496755))

(assert (= (and b!1496755 res!1018181) b!1496769))

(assert (= (and b!1496769 res!1018171) b!1496772))

(assert (= (and b!1496772 res!1018169) b!1496762))

(assert (= (and b!1496762 res!1018183) b!1496767))

(assert (= (and b!1496767 res!1018170) b!1496751))

(assert (= (and b!1496751 res!1018179) b!1496756))

(assert (= (and b!1496756 res!1018186) b!1496757))

(assert (= (and b!1496757 res!1018184) b!1496758))

(assert (= (and b!1496758 res!1018178) b!1496760))

(assert (= (and b!1496760 c!138828) b!1496771))

(assert (= (and b!1496760 (not c!138828)) b!1496770))

(assert (= (and b!1496760 res!1018174) b!1496764))

(assert (= (and b!1496764 res!1018182) b!1496752))

(assert (= (and b!1496752 (not res!1018175)) b!1496763))

(assert (= (and b!1496763 (not res!1018172)) b!1496765))

(assert (= (and b!1496765 (not res!1018177)) b!1496753))

(assert (= (and b!1496753 c!138829) b!1496766))

(assert (= (and b!1496753 (not c!138829)) b!1496768))

(assert (= (and b!1496753 (not res!1018185)) b!1496761))

(assert (= (and b!1496761 (not res!1018173)) b!1496754))

(declare-fun m!1379325 () Bool)

(assert (=> b!1496756 m!1379325))

(assert (=> b!1496756 m!1379325))

(declare-fun m!1379327 () Bool)

(assert (=> b!1496756 m!1379327))

(assert (=> b!1496756 m!1379327))

(assert (=> b!1496756 m!1379325))

(declare-fun m!1379329 () Bool)

(assert (=> b!1496756 m!1379329))

(declare-fun m!1379331 () Bool)

(assert (=> b!1496754 m!1379331))

(declare-fun m!1379333 () Bool)

(assert (=> b!1496754 m!1379333))

(declare-fun m!1379335 () Bool)

(assert (=> b!1496752 m!1379335))

(declare-fun m!1379337 () Bool)

(assert (=> b!1496752 m!1379337))

(declare-fun m!1379339 () Bool)

(assert (=> b!1496752 m!1379339))

(declare-fun m!1379341 () Bool)

(assert (=> b!1496752 m!1379341))

(declare-fun m!1379343 () Bool)

(assert (=> b!1496752 m!1379343))

(assert (=> b!1496752 m!1379325))

(declare-fun m!1379345 () Bool)

(assert (=> b!1496752 m!1379345))

(declare-fun m!1379347 () Bool)

(assert (=> b!1496752 m!1379347))

(assert (=> b!1496752 m!1379325))

(declare-fun m!1379349 () Bool)

(assert (=> b!1496762 m!1379349))

(declare-fun m!1379351 () Bool)

(assert (=> start!127316 m!1379351))

(declare-fun m!1379353 () Bool)

(assert (=> start!127316 m!1379353))

(assert (=> b!1496765 m!1379325))

(assert (=> b!1496765 m!1379325))

(declare-fun m!1379355 () Bool)

(assert (=> b!1496765 m!1379355))

(declare-fun m!1379357 () Bool)

(assert (=> b!1496770 m!1379357))

(assert (=> b!1496770 m!1379331))

(declare-fun m!1379359 () Bool)

(assert (=> b!1496771 m!1379359))

(assert (=> b!1496757 m!1379325))

(assert (=> b!1496757 m!1379325))

(declare-fun m!1379361 () Bool)

(assert (=> b!1496757 m!1379361))

(declare-fun m!1379363 () Bool)

(assert (=> b!1496768 m!1379363))

(assert (=> b!1496768 m!1379331))

(declare-fun m!1379365 () Bool)

(assert (=> b!1496755 m!1379365))

(assert (=> b!1496755 m!1379365))

(declare-fun m!1379367 () Bool)

(assert (=> b!1496755 m!1379367))

(declare-fun m!1379369 () Bool)

(assert (=> b!1496758 m!1379369))

(assert (=> b!1496758 m!1379369))

(declare-fun m!1379371 () Bool)

(assert (=> b!1496758 m!1379371))

(assert (=> b!1496758 m!1379337))

(declare-fun m!1379373 () Bool)

(assert (=> b!1496758 m!1379373))

(declare-fun m!1379375 () Bool)

(assert (=> b!1496763 m!1379375))

(assert (=> b!1496751 m!1379337))

(declare-fun m!1379377 () Bool)

(assert (=> b!1496751 m!1379377))

(declare-fun m!1379379 () Bool)

(assert (=> b!1496772 m!1379379))

(declare-fun m!1379381 () Bool)

(assert (=> b!1496766 m!1379381))

(assert (=> b!1496769 m!1379325))

(assert (=> b!1496769 m!1379325))

(declare-fun m!1379383 () Bool)

(assert (=> b!1496769 m!1379383))

(check-sat (not start!127316) (not b!1496772) (not b!1496763) (not b!1496756) (not b!1496770) (not b!1496765) (not b!1496766) (not b!1496771) (not b!1496762) (not b!1496768) (not b!1496752) (not b!1496758) (not b!1496755) (not b!1496769) (not b!1496757) (not b!1496754))
(check-sat)
