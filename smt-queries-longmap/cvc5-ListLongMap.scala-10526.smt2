; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124100 () Bool)

(assert start!124100)

(declare-fun b!1436787 () Bool)

(declare-fun res!969791 () Bool)

(declare-fun e!810692 () Bool)

(assert (=> b!1436787 (=> (not res!969791) (not e!810692))))

(declare-datatypes ((array!97682 0))(
  ( (array!97683 (arr!47136 (Array (_ BitVec 32) (_ BitVec 64))) (size!47688 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97682)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436787 (= res!969791 (validKeyInArray!0 (select (arr!47136 a!2862) i!1006)))))

(declare-fun b!1436788 () Bool)

(declare-fun res!969787 () Bool)

(assert (=> b!1436788 (=> (not res!969787) (not e!810692))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436788 (= res!969787 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47688 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47688 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47688 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47136 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436789 () Bool)

(declare-fun res!969790 () Bool)

(assert (=> b!1436789 (=> (not res!969790) (not e!810692))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97682 (_ BitVec 32)) Bool)

(assert (=> b!1436789 (= res!969790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436790 () Bool)

(assert (=> b!1436790 (= e!810692 false)))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11413 0))(
  ( (MissingZero!11413 (index!48044 (_ BitVec 32))) (Found!11413 (index!48045 (_ BitVec 32))) (Intermediate!11413 (undefined!12225 Bool) (index!48046 (_ BitVec 32)) (x!129769 (_ BitVec 32))) (Undefined!11413) (MissingVacant!11413 (index!48047 (_ BitVec 32))) )
))
(declare-fun lt!631995 () SeekEntryResult!11413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97682 (_ BitVec 32)) SeekEntryResult!11413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436790 (= lt!631995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47136 a!2862) j!93) mask!2687) (select (arr!47136 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436791 () Bool)

(declare-fun res!969789 () Bool)

(assert (=> b!1436791 (=> (not res!969789) (not e!810692))))

(declare-datatypes ((List!33715 0))(
  ( (Nil!33712) (Cons!33711 (h!35049 (_ BitVec 64)) (t!48401 List!33715)) )
))
(declare-fun arrayNoDuplicates!0 (array!97682 (_ BitVec 32) List!33715) Bool)

(assert (=> b!1436791 (= res!969789 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33712))))

(declare-fun b!1436792 () Bool)

(declare-fun res!969792 () Bool)

(assert (=> b!1436792 (=> (not res!969792) (not e!810692))))

(assert (=> b!1436792 (= res!969792 (validKeyInArray!0 (select (arr!47136 a!2862) j!93)))))

(declare-fun b!1436793 () Bool)

(declare-fun res!969788 () Bool)

(assert (=> b!1436793 (=> (not res!969788) (not e!810692))))

(assert (=> b!1436793 (= res!969788 (and (= (size!47688 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47688 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47688 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!969793 () Bool)

(assert (=> start!124100 (=> (not res!969793) (not e!810692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124100 (= res!969793 (validMask!0 mask!2687))))

(assert (=> start!124100 e!810692))

(assert (=> start!124100 true))

(declare-fun array_inv!36369 (array!97682) Bool)

(assert (=> start!124100 (array_inv!36369 a!2862)))

(assert (= (and start!124100 res!969793) b!1436793))

(assert (= (and b!1436793 res!969788) b!1436787))

(assert (= (and b!1436787 res!969791) b!1436792))

(assert (= (and b!1436792 res!969792) b!1436789))

(assert (= (and b!1436789 res!969790) b!1436791))

(assert (= (and b!1436791 res!969789) b!1436788))

(assert (= (and b!1436788 res!969787) b!1436790))

(declare-fun m!1325613 () Bool)

(assert (=> b!1436790 m!1325613))

(assert (=> b!1436790 m!1325613))

(declare-fun m!1325615 () Bool)

(assert (=> b!1436790 m!1325615))

(assert (=> b!1436790 m!1325615))

(assert (=> b!1436790 m!1325613))

(declare-fun m!1325617 () Bool)

(assert (=> b!1436790 m!1325617))

(declare-fun m!1325619 () Bool)

(assert (=> b!1436787 m!1325619))

(assert (=> b!1436787 m!1325619))

(declare-fun m!1325621 () Bool)

(assert (=> b!1436787 m!1325621))

(declare-fun m!1325623 () Bool)

(assert (=> start!124100 m!1325623))

(declare-fun m!1325625 () Bool)

(assert (=> start!124100 m!1325625))

(assert (=> b!1436792 m!1325613))

(assert (=> b!1436792 m!1325613))

(declare-fun m!1325627 () Bool)

(assert (=> b!1436792 m!1325627))

(declare-fun m!1325629 () Bool)

(assert (=> b!1436789 m!1325629))

(declare-fun m!1325631 () Bool)

(assert (=> b!1436788 m!1325631))

(declare-fun m!1325633 () Bool)

(assert (=> b!1436788 m!1325633))

(declare-fun m!1325635 () Bool)

(assert (=> b!1436791 m!1325635))

(push 1)

(assert (not b!1436791))

(assert (not b!1436792))

(assert (not b!1436790))

(assert (not b!1436787))

(assert (not start!124100))

(assert (not b!1436789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

