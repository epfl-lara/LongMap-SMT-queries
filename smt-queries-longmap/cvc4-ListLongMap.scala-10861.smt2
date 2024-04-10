; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127342 () Bool)

(assert start!127342)

(declare-fun b!1496396 () Bool)

(declare-fun e!838138 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99804 0))(
  ( (array!99805 (arr!48166 (Array (_ BitVec 32) (_ BitVec 64))) (size!48716 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99804)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496396 (= e!838138 (or (= (select (arr!48166 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48166 a!2862) intermediateBeforeIndex!19) (select (arr!48166 a!2862) j!93))))))

(declare-fun b!1496397 () Bool)

(declare-fun res!1017748 () Bool)

(declare-fun e!838137 () Bool)

(assert (=> b!1496397 (=> (not res!1017748) (not e!838137))))

(declare-datatypes ((List!34667 0))(
  ( (Nil!34664) (Cons!34663 (h!36060 (_ BitVec 64)) (t!49361 List!34667)) )
))
(declare-fun arrayNoDuplicates!0 (array!99804 (_ BitVec 32) List!34667) Bool)

(assert (=> b!1496397 (= res!1017748 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34664))))

(declare-fun b!1496398 () Bool)

(declare-fun res!1017755 () Bool)

(declare-fun e!838129 () Bool)

(assert (=> b!1496398 (=> (not res!1017755) (not e!838129))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12406 0))(
  ( (MissingZero!12406 (index!52016 (_ BitVec 32))) (Found!12406 (index!52017 (_ BitVec 32))) (Intermediate!12406 (undefined!13218 Bool) (index!52018 (_ BitVec 32)) (x!133640 (_ BitVec 32))) (Undefined!12406) (MissingVacant!12406 (index!52019 (_ BitVec 32))) )
))
(declare-fun lt!652084 () SeekEntryResult!12406)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99804 (_ BitVec 32)) SeekEntryResult!12406)

(assert (=> b!1496398 (= res!1017755 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48166 a!2862) j!93) a!2862 mask!2687) lt!652084))))

(declare-fun b!1496399 () Bool)

(declare-fun e!838136 () Bool)

(assert (=> b!1496399 (= e!838129 e!838136)))

(declare-fun res!1017762 () Bool)

(assert (=> b!1496399 (=> (not res!1017762) (not e!838136))))

(declare-fun lt!652088 () SeekEntryResult!12406)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496399 (= res!1017762 (= lt!652088 (Intermediate!12406 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!652086 () (_ BitVec 64))

(declare-fun lt!652089 () array!99804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496399 (= lt!652088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652086 mask!2687) lt!652086 lt!652089 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496399 (= lt!652086 (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!838131 () Bool)

(declare-fun b!1496400 () Bool)

(assert (=> b!1496400 (= e!838131 (= lt!652088 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652086 lt!652089 mask!2687)))))

(declare-fun b!1496401 () Bool)

(declare-fun res!1017763 () Bool)

(assert (=> b!1496401 (=> (not res!1017763) (not e!838137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496401 (= res!1017763 (validKeyInArray!0 (select (arr!48166 a!2862) i!1006)))))

(declare-fun res!1017753 () Bool)

(assert (=> start!127342 (=> (not res!1017753) (not e!838137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127342 (= res!1017753 (validMask!0 mask!2687))))

(assert (=> start!127342 e!838137))

(assert (=> start!127342 true))

(declare-fun array_inv!37194 (array!99804) Bool)

(assert (=> start!127342 (array_inv!37194 a!2862)))

(declare-fun b!1496402 () Bool)

(declare-fun res!1017747 () Bool)

(assert (=> b!1496402 (=> (not res!1017747) (not e!838137))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496402 (= res!1017747 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48716 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48716 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48716 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496403 () Bool)

(declare-fun e!838134 () Bool)

(assert (=> b!1496403 (= e!838134 true)))

(declare-fun lt!652085 () Bool)

(declare-fun e!838135 () Bool)

(assert (=> b!1496403 (= lt!652085 e!838135)))

(declare-fun c!138859 () Bool)

(assert (=> b!1496403 (= c!138859 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496404 () Bool)

(declare-fun res!1017757 () Bool)

(assert (=> b!1496404 (=> (not res!1017757) (not e!838137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99804 (_ BitVec 32)) Bool)

(assert (=> b!1496404 (= res!1017757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496405 () Bool)

(declare-fun e!838132 () Bool)

(assert (=> b!1496405 (= e!838132 e!838134)))

(declare-fun res!1017761 () Bool)

(assert (=> b!1496405 (=> res!1017761 e!838134)))

(declare-fun lt!652090 () (_ BitVec 32))

(assert (=> b!1496405 (= res!1017761 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652090 #b00000000000000000000000000000000) (bvsge lt!652090 (size!48716 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496405 (= lt!652090 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496406 () Bool)

(declare-fun res!1017758 () Bool)

(assert (=> b!1496406 (=> (not res!1017758) (not e!838138))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99804 (_ BitVec 32)) SeekEntryResult!12406)

(assert (=> b!1496406 (= res!1017758 (= (seekEntryOrOpen!0 (select (arr!48166 a!2862) j!93) a!2862 mask!2687) (Found!12406 j!93)))))

(declare-fun b!1496407 () Bool)

(declare-fun e!838133 () Bool)

(assert (=> b!1496407 (= e!838133 e!838129)))

(declare-fun res!1017754 () Bool)

(assert (=> b!1496407 (=> (not res!1017754) (not e!838129))))

(assert (=> b!1496407 (= res!1017754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48166 a!2862) j!93) mask!2687) (select (arr!48166 a!2862) j!93) a!2862 mask!2687) lt!652084))))

(assert (=> b!1496407 (= lt!652084 (Intermediate!12406 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496408 () Bool)

(declare-fun res!1017760 () Bool)

(assert (=> b!1496408 (=> (not res!1017760) (not e!838136))))

(assert (=> b!1496408 (= res!1017760 e!838131)))

(declare-fun c!138860 () Bool)

(assert (=> b!1496408 (= c!138860 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496409 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99804 (_ BitVec 32)) SeekEntryResult!12406)

(assert (=> b!1496409 (= e!838131 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652086 lt!652089 mask!2687) (seekEntryOrOpen!0 lt!652086 lt!652089 mask!2687)))))

(declare-fun b!1496410 () Bool)

(declare-fun res!1017756 () Bool)

(assert (=> b!1496410 (=> (not res!1017756) (not e!838136))))

(assert (=> b!1496410 (= res!1017756 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496411 () Bool)

(assert (=> b!1496411 (= e!838135 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652090 intermediateAfterIndex!19 lt!652086 lt!652089 mask!2687) (seekEntryOrOpen!0 lt!652086 lt!652089 mask!2687))))))

(declare-fun b!1496412 () Bool)

(declare-fun res!1017752 () Bool)

(assert (=> b!1496412 (=> (not res!1017752) (not e!838137))))

(assert (=> b!1496412 (= res!1017752 (and (= (size!48716 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48716 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48716 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496413 () Bool)

(assert (=> b!1496413 (= e!838135 (not (= lt!652088 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652090 lt!652086 lt!652089 mask!2687))))))

(declare-fun b!1496414 () Bool)

(assert (=> b!1496414 (= e!838136 (not e!838132))))

(declare-fun res!1017750 () Bool)

(assert (=> b!1496414 (=> res!1017750 e!838132)))

(assert (=> b!1496414 (= res!1017750 (or (and (= (select (arr!48166 a!2862) index!646) (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48166 a!2862) index!646) (select (arr!48166 a!2862) j!93))) (= (select (arr!48166 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496414 e!838138))

(declare-fun res!1017751 () Bool)

(assert (=> b!1496414 (=> (not res!1017751) (not e!838138))))

(assert (=> b!1496414 (= res!1017751 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50152 0))(
  ( (Unit!50153) )
))
(declare-fun lt!652087 () Unit!50152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50152)

(assert (=> b!1496414 (= lt!652087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496415 () Bool)

(declare-fun res!1017749 () Bool)

(assert (=> b!1496415 (=> (not res!1017749) (not e!838137))))

(assert (=> b!1496415 (= res!1017749 (validKeyInArray!0 (select (arr!48166 a!2862) j!93)))))

(declare-fun b!1496416 () Bool)

(declare-fun res!1017746 () Bool)

(assert (=> b!1496416 (=> res!1017746 e!838134)))

(assert (=> b!1496416 (= res!1017746 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652090 (select (arr!48166 a!2862) j!93) a!2862 mask!2687) lt!652084)))))

(declare-fun b!1496417 () Bool)

(assert (=> b!1496417 (= e!838137 e!838133)))

(declare-fun res!1017759 () Bool)

(assert (=> b!1496417 (=> (not res!1017759) (not e!838133))))

(assert (=> b!1496417 (= res!1017759 (= (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496417 (= lt!652089 (array!99805 (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48716 a!2862)))))

(assert (= (and start!127342 res!1017753) b!1496412))

(assert (= (and b!1496412 res!1017752) b!1496401))

(assert (= (and b!1496401 res!1017763) b!1496415))

(assert (= (and b!1496415 res!1017749) b!1496404))

(assert (= (and b!1496404 res!1017757) b!1496397))

(assert (= (and b!1496397 res!1017748) b!1496402))

(assert (= (and b!1496402 res!1017747) b!1496417))

(assert (= (and b!1496417 res!1017759) b!1496407))

(assert (= (and b!1496407 res!1017754) b!1496398))

(assert (= (and b!1496398 res!1017755) b!1496399))

(assert (= (and b!1496399 res!1017762) b!1496408))

(assert (= (and b!1496408 c!138860) b!1496400))

(assert (= (and b!1496408 (not c!138860)) b!1496409))

(assert (= (and b!1496408 res!1017760) b!1496410))

(assert (= (and b!1496410 res!1017756) b!1496414))

(assert (= (and b!1496414 res!1017751) b!1496406))

(assert (= (and b!1496406 res!1017758) b!1496396))

(assert (= (and b!1496414 (not res!1017750)) b!1496405))

(assert (= (and b!1496405 (not res!1017761)) b!1496416))

(assert (= (and b!1496416 (not res!1017746)) b!1496403))

(assert (= (and b!1496403 c!138859) b!1496413))

(assert (= (and b!1496403 (not c!138859)) b!1496411))

(declare-fun m!1379583 () Bool)

(assert (=> b!1496415 m!1379583))

(assert (=> b!1496415 m!1379583))

(declare-fun m!1379585 () Bool)

(assert (=> b!1496415 m!1379585))

(assert (=> b!1496407 m!1379583))

(assert (=> b!1496407 m!1379583))

(declare-fun m!1379587 () Bool)

(assert (=> b!1496407 m!1379587))

(assert (=> b!1496407 m!1379587))

(assert (=> b!1496407 m!1379583))

(declare-fun m!1379589 () Bool)

(assert (=> b!1496407 m!1379589))

(declare-fun m!1379591 () Bool)

(assert (=> b!1496405 m!1379591))

(declare-fun m!1379593 () Bool)

(assert (=> b!1496417 m!1379593))

(declare-fun m!1379595 () Bool)

(assert (=> b!1496417 m!1379595))

(assert (=> b!1496406 m!1379583))

(assert (=> b!1496406 m!1379583))

(declare-fun m!1379597 () Bool)

(assert (=> b!1496406 m!1379597))

(declare-fun m!1379599 () Bool)

(assert (=> b!1496414 m!1379599))

(assert (=> b!1496414 m!1379593))

(declare-fun m!1379601 () Bool)

(assert (=> b!1496414 m!1379601))

(declare-fun m!1379603 () Bool)

(assert (=> b!1496414 m!1379603))

(declare-fun m!1379605 () Bool)

(assert (=> b!1496414 m!1379605))

(assert (=> b!1496414 m!1379583))

(declare-fun m!1379607 () Bool)

(assert (=> b!1496399 m!1379607))

(assert (=> b!1496399 m!1379607))

(declare-fun m!1379609 () Bool)

(assert (=> b!1496399 m!1379609))

(assert (=> b!1496399 m!1379593))

(declare-fun m!1379611 () Bool)

(assert (=> b!1496399 m!1379611))

(assert (=> b!1496416 m!1379583))

(assert (=> b!1496416 m!1379583))

(declare-fun m!1379613 () Bool)

(assert (=> b!1496416 m!1379613))

(declare-fun m!1379615 () Bool)

(assert (=> b!1496396 m!1379615))

(assert (=> b!1496396 m!1379583))

(declare-fun m!1379617 () Bool)

(assert (=> b!1496411 m!1379617))

(declare-fun m!1379619 () Bool)

(assert (=> b!1496411 m!1379619))

(declare-fun m!1379621 () Bool)

(assert (=> b!1496413 m!1379621))

(declare-fun m!1379623 () Bool)

(assert (=> b!1496401 m!1379623))

(assert (=> b!1496401 m!1379623))

(declare-fun m!1379625 () Bool)

(assert (=> b!1496401 m!1379625))

(declare-fun m!1379627 () Bool)

(assert (=> b!1496404 m!1379627))

(declare-fun m!1379629 () Bool)

(assert (=> b!1496409 m!1379629))

(assert (=> b!1496409 m!1379619))

(declare-fun m!1379631 () Bool)

(assert (=> b!1496400 m!1379631))

(declare-fun m!1379633 () Bool)

(assert (=> start!127342 m!1379633))

(declare-fun m!1379635 () Bool)

(assert (=> start!127342 m!1379635))

(declare-fun m!1379637 () Bool)

(assert (=> b!1496397 m!1379637))

(assert (=> b!1496398 m!1379583))

(assert (=> b!1496398 m!1379583))

(declare-fun m!1379639 () Bool)

(assert (=> b!1496398 m!1379639))

(push 1)

