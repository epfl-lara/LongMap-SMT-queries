; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126550 () Bool)

(assert start!126550)

(declare-fun b!1485115 () Bool)

(declare-fun e!832598 () Bool)

(declare-fun e!832603 () Bool)

(assert (=> b!1485115 (= e!832598 (not e!832603))))

(declare-fun res!1009842 () Bool)

(assert (=> b!1485115 (=> res!1009842 e!832603)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99512 0))(
  ( (array!99513 (arr!48032 (Array (_ BitVec 32) (_ BitVec 64))) (size!48582 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99512)

(assert (=> b!1485115 (= res!1009842 (or (and (= (select (arr!48032 a!2862) index!646) (select (store (arr!48032 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48032 a!2862) index!646) (select (arr!48032 a!2862) j!93))) (= (select (arr!48032 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832606 () Bool)

(assert (=> b!1485115 e!832606))

(declare-fun res!1009830 () Bool)

(assert (=> b!1485115 (=> (not res!1009830) (not e!832606))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99512 (_ BitVec 32)) Bool)

(assert (=> b!1485115 (= res!1009830 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49884 0))(
  ( (Unit!49885) )
))
(declare-fun lt!647991 () Unit!49884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49884)

(assert (=> b!1485115 (= lt!647991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485116 () Bool)

(declare-fun e!832599 () Bool)

(declare-fun e!832605 () Bool)

(assert (=> b!1485116 (= e!832599 e!832605)))

(declare-fun res!1009829 () Bool)

(assert (=> b!1485116 (=> (not res!1009829) (not e!832605))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485116 (= res!1009829 (= (select (store (arr!48032 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647987 () array!99512)

(assert (=> b!1485116 (= lt!647987 (array!99513 (store (arr!48032 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48582 a!2862)))))

(declare-fun b!1485117 () Bool)

(assert (=> b!1485117 (= e!832603 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!647988 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485117 (= lt!647988 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485118 () Bool)

(declare-fun res!1009837 () Bool)

(assert (=> b!1485118 (=> (not res!1009837) (not e!832598))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485118 (= res!1009837 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485119 () Bool)

(declare-fun res!1009833 () Bool)

(assert (=> b!1485119 (=> (not res!1009833) (not e!832599))))

(declare-datatypes ((List!34533 0))(
  ( (Nil!34530) (Cons!34529 (h!35903 (_ BitVec 64)) (t!49227 List!34533)) )
))
(declare-fun arrayNoDuplicates!0 (array!99512 (_ BitVec 32) List!34533) Bool)

(assert (=> b!1485119 (= res!1009833 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34530))))

(declare-fun lt!647985 () (_ BitVec 64))

(declare-fun b!1485120 () Bool)

(declare-datatypes ((SeekEntryResult!12272 0))(
  ( (MissingZero!12272 (index!51480 (_ BitVec 32))) (Found!12272 (index!51481 (_ BitVec 32))) (Intermediate!12272 (undefined!13084 Bool) (index!51482 (_ BitVec 32)) (x!133060 (_ BitVec 32))) (Undefined!12272) (MissingVacant!12272 (index!51483 (_ BitVec 32))) )
))
(declare-fun lt!647990 () SeekEntryResult!12272)

(declare-fun e!832602 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99512 (_ BitVec 32)) SeekEntryResult!12272)

(assert (=> b!1485120 (= e!832602 (= lt!647990 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647985 lt!647987 mask!2687)))))

(declare-fun b!1485121 () Bool)

(declare-fun e!832604 () Bool)

(assert (=> b!1485121 (= e!832604 e!832598)))

(declare-fun res!1009844 () Bool)

(assert (=> b!1485121 (=> (not res!1009844) (not e!832598))))

(assert (=> b!1485121 (= res!1009844 (= lt!647990 (Intermediate!12272 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485121 (= lt!647990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647985 mask!2687) lt!647985 lt!647987 mask!2687))))

(assert (=> b!1485121 (= lt!647985 (select (store (arr!48032 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485122 () Bool)

(declare-fun res!1009843 () Bool)

(assert (=> b!1485122 (=> (not res!1009843) (not e!832599))))

(assert (=> b!1485122 (= res!1009843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485123 () Bool)

(declare-fun e!832600 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99512 (_ BitVec 32)) SeekEntryResult!12272)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99512 (_ BitVec 32)) SeekEntryResult!12272)

(assert (=> b!1485123 (= e!832600 (= (seekEntryOrOpen!0 lt!647985 lt!647987 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647985 lt!647987 mask!2687)))))

(declare-fun b!1485125 () Bool)

(assert (=> b!1485125 (= e!832605 e!832604)))

(declare-fun res!1009836 () Bool)

(assert (=> b!1485125 (=> (not res!1009836) (not e!832604))))

(declare-fun lt!647989 () SeekEntryResult!12272)

(assert (=> b!1485125 (= res!1009836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48032 a!2862) j!93) mask!2687) (select (arr!48032 a!2862) j!93) a!2862 mask!2687) lt!647989))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485125 (= lt!647989 (Intermediate!12272 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485126 () Bool)

(declare-fun res!1009835 () Bool)

(assert (=> b!1485126 (=> (not res!1009835) (not e!832604))))

(assert (=> b!1485126 (= res!1009835 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48032 a!2862) j!93) a!2862 mask!2687) lt!647989))))

(declare-fun b!1485127 () Bool)

(declare-fun res!1009840 () Bool)

(assert (=> b!1485127 (=> (not res!1009840) (not e!832599))))

(assert (=> b!1485127 (= res!1009840 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48582 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48582 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48582 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485128 () Bool)

(declare-fun res!1009831 () Bool)

(assert (=> b!1485128 (=> (not res!1009831) (not e!832599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485128 (= res!1009831 (validKeyInArray!0 (select (arr!48032 a!2862) j!93)))))

(declare-fun b!1485129 () Bool)

(declare-fun res!1009841 () Bool)

(assert (=> b!1485129 (=> (not res!1009841) (not e!832606))))

(assert (=> b!1485129 (= res!1009841 (or (= (select (arr!48032 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48032 a!2862) intermediateBeforeIndex!19) (select (arr!48032 a!2862) j!93))))))

(declare-fun b!1485130 () Bool)

(declare-fun e!832601 () Bool)

(assert (=> b!1485130 (= e!832601 e!832600)))

(declare-fun res!1009828 () Bool)

(assert (=> b!1485130 (=> (not res!1009828) (not e!832600))))

(declare-fun lt!647986 () (_ BitVec 64))

(assert (=> b!1485130 (= res!1009828 (and (= index!646 intermediateAfterIndex!19) (= lt!647986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485131 () Bool)

(declare-fun res!1009838 () Bool)

(assert (=> b!1485131 (=> (not res!1009838) (not e!832599))))

(assert (=> b!1485131 (= res!1009838 (validKeyInArray!0 (select (arr!48032 a!2862) i!1006)))))

(declare-fun b!1485132 () Bool)

(assert (=> b!1485132 (= e!832606 e!832601)))

(declare-fun res!1009846 () Bool)

(assert (=> b!1485132 (=> res!1009846 e!832601)))

(assert (=> b!1485132 (= res!1009846 (or (and (= (select (arr!48032 a!2862) index!646) lt!647986) (= (select (arr!48032 a!2862) index!646) (select (arr!48032 a!2862) j!93))) (= (select (arr!48032 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485132 (= lt!647986 (select (store (arr!48032 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485133 () Bool)

(declare-fun res!1009832 () Bool)

(assert (=> b!1485133 (=> (not res!1009832) (not e!832606))))

(assert (=> b!1485133 (= res!1009832 (= (seekEntryOrOpen!0 (select (arr!48032 a!2862) j!93) a!2862 mask!2687) (Found!12272 j!93)))))

(declare-fun b!1485134 () Bool)

(declare-fun res!1009845 () Bool)

(assert (=> b!1485134 (=> (not res!1009845) (not e!832599))))

(assert (=> b!1485134 (= res!1009845 (and (= (size!48582 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48582 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48582 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485135 () Bool)

(declare-fun res!1009834 () Bool)

(assert (=> b!1485135 (=> (not res!1009834) (not e!832598))))

(assert (=> b!1485135 (= res!1009834 e!832602)))

(declare-fun c!137166 () Bool)

(assert (=> b!1485135 (= c!137166 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1009839 () Bool)

(assert (=> start!126550 (=> (not res!1009839) (not e!832599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126550 (= res!1009839 (validMask!0 mask!2687))))

(assert (=> start!126550 e!832599))

(assert (=> start!126550 true))

(declare-fun array_inv!37060 (array!99512) Bool)

(assert (=> start!126550 (array_inv!37060 a!2862)))

(declare-fun b!1485124 () Bool)

(assert (=> b!1485124 (= e!832602 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647985 lt!647987 mask!2687) (seekEntryOrOpen!0 lt!647985 lt!647987 mask!2687)))))

(assert (= (and start!126550 res!1009839) b!1485134))

(assert (= (and b!1485134 res!1009845) b!1485131))

(assert (= (and b!1485131 res!1009838) b!1485128))

(assert (= (and b!1485128 res!1009831) b!1485122))

(assert (= (and b!1485122 res!1009843) b!1485119))

(assert (= (and b!1485119 res!1009833) b!1485127))

(assert (= (and b!1485127 res!1009840) b!1485116))

(assert (= (and b!1485116 res!1009829) b!1485125))

(assert (= (and b!1485125 res!1009836) b!1485126))

(assert (= (and b!1485126 res!1009835) b!1485121))

(assert (= (and b!1485121 res!1009844) b!1485135))

(assert (= (and b!1485135 c!137166) b!1485120))

(assert (= (and b!1485135 (not c!137166)) b!1485124))

(assert (= (and b!1485135 res!1009834) b!1485118))

(assert (= (and b!1485118 res!1009837) b!1485115))

(assert (= (and b!1485115 res!1009830) b!1485133))

(assert (= (and b!1485133 res!1009832) b!1485129))

(assert (= (and b!1485129 res!1009841) b!1485132))

(assert (= (and b!1485132 (not res!1009846)) b!1485130))

(assert (= (and b!1485130 res!1009828) b!1485123))

(assert (= (and b!1485115 (not res!1009842)) b!1485117))

(declare-fun m!1370305 () Bool)

(assert (=> b!1485116 m!1370305))

(declare-fun m!1370307 () Bool)

(assert (=> b!1485116 m!1370307))

(declare-fun m!1370309 () Bool)

(assert (=> b!1485117 m!1370309))

(declare-fun m!1370311 () Bool)

(assert (=> b!1485122 m!1370311))

(declare-fun m!1370313 () Bool)

(assert (=> b!1485120 m!1370313))

(declare-fun m!1370315 () Bool)

(assert (=> b!1485124 m!1370315))

(declare-fun m!1370317 () Bool)

(assert (=> b!1485124 m!1370317))

(declare-fun m!1370319 () Bool)

(assert (=> b!1485126 m!1370319))

(assert (=> b!1485126 m!1370319))

(declare-fun m!1370321 () Bool)

(assert (=> b!1485126 m!1370321))

(declare-fun m!1370323 () Bool)

(assert (=> start!126550 m!1370323))

(declare-fun m!1370325 () Bool)

(assert (=> start!126550 m!1370325))

(assert (=> b!1485128 m!1370319))

(assert (=> b!1485128 m!1370319))

(declare-fun m!1370327 () Bool)

(assert (=> b!1485128 m!1370327))

(declare-fun m!1370329 () Bool)

(assert (=> b!1485121 m!1370329))

(assert (=> b!1485121 m!1370329))

(declare-fun m!1370331 () Bool)

(assert (=> b!1485121 m!1370331))

(assert (=> b!1485121 m!1370305))

(declare-fun m!1370333 () Bool)

(assert (=> b!1485121 m!1370333))

(declare-fun m!1370335 () Bool)

(assert (=> b!1485129 m!1370335))

(assert (=> b!1485129 m!1370319))

(assert (=> b!1485125 m!1370319))

(assert (=> b!1485125 m!1370319))

(declare-fun m!1370337 () Bool)

(assert (=> b!1485125 m!1370337))

(assert (=> b!1485125 m!1370337))

(assert (=> b!1485125 m!1370319))

(declare-fun m!1370339 () Bool)

(assert (=> b!1485125 m!1370339))

(assert (=> b!1485123 m!1370317))

(assert (=> b!1485123 m!1370315))

(declare-fun m!1370341 () Bool)

(assert (=> b!1485132 m!1370341))

(assert (=> b!1485132 m!1370319))

(assert (=> b!1485132 m!1370305))

(declare-fun m!1370343 () Bool)

(assert (=> b!1485132 m!1370343))

(declare-fun m!1370345 () Bool)

(assert (=> b!1485119 m!1370345))

(assert (=> b!1485133 m!1370319))

(assert (=> b!1485133 m!1370319))

(declare-fun m!1370347 () Bool)

(assert (=> b!1485133 m!1370347))

(declare-fun m!1370349 () Bool)

(assert (=> b!1485115 m!1370349))

(assert (=> b!1485115 m!1370305))

(assert (=> b!1485115 m!1370343))

(assert (=> b!1485115 m!1370341))

(declare-fun m!1370351 () Bool)

(assert (=> b!1485115 m!1370351))

(assert (=> b!1485115 m!1370319))

(declare-fun m!1370353 () Bool)

(assert (=> b!1485131 m!1370353))

(assert (=> b!1485131 m!1370353))

(declare-fun m!1370355 () Bool)

(assert (=> b!1485131 m!1370355))

(push 1)

