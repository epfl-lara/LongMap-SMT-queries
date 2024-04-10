; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124420 () Bool)

(assert start!124420)

(declare-fun b!1439457 () Bool)

(declare-fun res!971893 () Bool)

(declare-fun e!811879 () Bool)

(assert (=> b!1439457 (=> (not res!971893) (not e!811879))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97868 0))(
  ( (array!97869 (arr!47222 (Array (_ BitVec 32) (_ BitVec 64))) (size!47772 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97868)

(declare-datatypes ((SeekEntryResult!11474 0))(
  ( (MissingZero!11474 (index!48288 (_ BitVec 32))) (Found!11474 (index!48289 (_ BitVec 32))) (Intermediate!11474 (undefined!12286 Bool) (index!48290 (_ BitVec 32)) (x!130027 (_ BitVec 32))) (Undefined!11474) (MissingVacant!11474 (index!48291 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97868 (_ BitVec 32)) SeekEntryResult!11474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439457 (= res!971893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47222 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47222 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97869 (store (arr!47222 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47772 a!2862)) mask!2687) (Intermediate!11474 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439458 () Bool)

(declare-fun res!971890 () Bool)

(declare-fun e!811878 () Bool)

(assert (=> b!1439458 (=> (not res!971890) (not e!811878))))

(assert (=> b!1439458 (= res!971890 (and (= (size!47772 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47772 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47772 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439459 () Bool)

(declare-fun res!971885 () Bool)

(assert (=> b!1439459 (=> (not res!971885) (not e!811878))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439459 (= res!971885 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47772 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47772 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47772 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47222 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439460 () Bool)

(declare-fun res!971888 () Bool)

(assert (=> b!1439460 (=> (not res!971888) (not e!811878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439460 (= res!971888 (validKeyInArray!0 (select (arr!47222 a!2862) i!1006)))))

(declare-fun b!1439461 () Bool)

(assert (=> b!1439461 (= e!811879 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439462 () Bool)

(declare-fun res!971891 () Bool)

(assert (=> b!1439462 (=> (not res!971891) (not e!811878))))

(declare-datatypes ((List!33723 0))(
  ( (Nil!33720) (Cons!33719 (h!35069 (_ BitVec 64)) (t!48417 List!33723)) )
))
(declare-fun arrayNoDuplicates!0 (array!97868 (_ BitVec 32) List!33723) Bool)

(assert (=> b!1439462 (= res!971891 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33720))))

(declare-fun res!971884 () Bool)

(assert (=> start!124420 (=> (not res!971884) (not e!811878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124420 (= res!971884 (validMask!0 mask!2687))))

(assert (=> start!124420 e!811878))

(assert (=> start!124420 true))

(declare-fun array_inv!36250 (array!97868) Bool)

(assert (=> start!124420 (array_inv!36250 a!2862)))

(declare-fun b!1439463 () Bool)

(declare-fun res!971889 () Bool)

(assert (=> b!1439463 (=> (not res!971889) (not e!811879))))

(declare-fun lt!632817 () SeekEntryResult!11474)

(assert (=> b!1439463 (= res!971889 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47222 a!2862) j!93) a!2862 mask!2687) lt!632817))))

(declare-fun b!1439464 () Bool)

(declare-fun res!971887 () Bool)

(assert (=> b!1439464 (=> (not res!971887) (not e!811878))))

(assert (=> b!1439464 (= res!971887 (validKeyInArray!0 (select (arr!47222 a!2862) j!93)))))

(declare-fun b!1439465 () Bool)

(assert (=> b!1439465 (= e!811878 e!811879)))

(declare-fun res!971886 () Bool)

(assert (=> b!1439465 (=> (not res!971886) (not e!811879))))

(assert (=> b!1439465 (= res!971886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47222 a!2862) j!93) mask!2687) (select (arr!47222 a!2862) j!93) a!2862 mask!2687) lt!632817))))

(assert (=> b!1439465 (= lt!632817 (Intermediate!11474 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439466 () Bool)

(declare-fun res!971892 () Bool)

(assert (=> b!1439466 (=> (not res!971892) (not e!811878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97868 (_ BitVec 32)) Bool)

(assert (=> b!1439466 (= res!971892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124420 res!971884) b!1439458))

(assert (= (and b!1439458 res!971890) b!1439460))

(assert (= (and b!1439460 res!971888) b!1439464))

(assert (= (and b!1439464 res!971887) b!1439466))

(assert (= (and b!1439466 res!971892) b!1439462))

(assert (= (and b!1439462 res!971891) b!1439459))

(assert (= (and b!1439459 res!971885) b!1439465))

(assert (= (and b!1439465 res!971886) b!1439463))

(assert (= (and b!1439463 res!971889) b!1439457))

(assert (= (and b!1439457 res!971893) b!1439461))

(declare-fun m!1328533 () Bool)

(assert (=> b!1439457 m!1328533))

(declare-fun m!1328535 () Bool)

(assert (=> b!1439457 m!1328535))

(assert (=> b!1439457 m!1328535))

(declare-fun m!1328537 () Bool)

(assert (=> b!1439457 m!1328537))

(assert (=> b!1439457 m!1328537))

(assert (=> b!1439457 m!1328535))

(declare-fun m!1328539 () Bool)

(assert (=> b!1439457 m!1328539))

(declare-fun m!1328541 () Bool)

(assert (=> b!1439464 m!1328541))

(assert (=> b!1439464 m!1328541))

(declare-fun m!1328543 () Bool)

(assert (=> b!1439464 m!1328543))

(assert (=> b!1439459 m!1328533))

(declare-fun m!1328545 () Bool)

(assert (=> b!1439459 m!1328545))

(assert (=> b!1439465 m!1328541))

(assert (=> b!1439465 m!1328541))

(declare-fun m!1328547 () Bool)

(assert (=> b!1439465 m!1328547))

(assert (=> b!1439465 m!1328547))

(assert (=> b!1439465 m!1328541))

(declare-fun m!1328549 () Bool)

(assert (=> b!1439465 m!1328549))

(declare-fun m!1328551 () Bool)

(assert (=> b!1439460 m!1328551))

(assert (=> b!1439460 m!1328551))

(declare-fun m!1328553 () Bool)

(assert (=> b!1439460 m!1328553))

(declare-fun m!1328555 () Bool)

(assert (=> start!124420 m!1328555))

(declare-fun m!1328557 () Bool)

(assert (=> start!124420 m!1328557))

(declare-fun m!1328559 () Bool)

(assert (=> b!1439466 m!1328559))

(assert (=> b!1439463 m!1328541))

(assert (=> b!1439463 m!1328541))

(declare-fun m!1328561 () Bool)

(assert (=> b!1439463 m!1328561))

(declare-fun m!1328563 () Bool)

(assert (=> b!1439462 m!1328563))

(push 1)

