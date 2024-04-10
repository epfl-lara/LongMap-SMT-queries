; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124118 () Bool)

(assert start!124118)

(declare-fun b!1436847 () Bool)

(declare-fun res!969733 () Bool)

(declare-fun e!810772 () Bool)

(assert (=> b!1436847 (=> (not res!969733) (not e!810772))))

(declare-datatypes ((array!97722 0))(
  ( (array!97723 (arr!47155 (Array (_ BitVec 32) (_ BitVec 64))) (size!47705 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97722)

(declare-datatypes ((List!33656 0))(
  ( (Nil!33653) (Cons!33652 (h!34990 (_ BitVec 64)) (t!48350 List!33656)) )
))
(declare-fun arrayNoDuplicates!0 (array!97722 (_ BitVec 32) List!33656) Bool)

(assert (=> b!1436847 (= res!969733 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33653))))

(declare-fun b!1436848 () Bool)

(declare-fun res!969730 () Bool)

(assert (=> b!1436848 (=> (not res!969730) (not e!810772))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436848 (= res!969730 (validKeyInArray!0 (select (arr!47155 a!2862) j!93)))))

(declare-fun res!969732 () Bool)

(assert (=> start!124118 (=> (not res!969732) (not e!810772))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124118 (= res!969732 (validMask!0 mask!2687))))

(assert (=> start!124118 e!810772))

(assert (=> start!124118 true))

(declare-fun array_inv!36183 (array!97722) Bool)

(assert (=> start!124118 (array_inv!36183 a!2862)))

(declare-fun b!1436849 () Bool)

(declare-fun res!969736 () Bool)

(assert (=> b!1436849 (=> (not res!969736) (not e!810772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97722 (_ BitVec 32)) Bool)

(assert (=> b!1436849 (= res!969736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436850 () Bool)

(declare-fun res!969735 () Bool)

(assert (=> b!1436850 (=> (not res!969735) (not e!810772))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436850 (= res!969735 (and (= (size!47705 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47705 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47705 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436851 () Bool)

(assert (=> b!1436851 (= e!810772 false)))

(declare-datatypes ((SeekEntryResult!11407 0))(
  ( (MissingZero!11407 (index!48020 (_ BitVec 32))) (Found!11407 (index!48021 (_ BitVec 32))) (Intermediate!11407 (undefined!12219 Bool) (index!48022 (_ BitVec 32)) (x!129752 (_ BitVec 32))) (Undefined!11407) (MissingVacant!11407 (index!48023 (_ BitVec 32))) )
))
(declare-fun lt!632220 () SeekEntryResult!11407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97722 (_ BitVec 32)) SeekEntryResult!11407)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436851 (= lt!632220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47155 a!2862) j!93) mask!2687) (select (arr!47155 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436852 () Bool)

(declare-fun res!969734 () Bool)

(assert (=> b!1436852 (=> (not res!969734) (not e!810772))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436852 (= res!969734 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47705 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47705 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47705 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436853 () Bool)

(declare-fun res!969731 () Bool)

(assert (=> b!1436853 (=> (not res!969731) (not e!810772))))

(assert (=> b!1436853 (= res!969731 (validKeyInArray!0 (select (arr!47155 a!2862) i!1006)))))

(assert (= (and start!124118 res!969732) b!1436850))

(assert (= (and b!1436850 res!969735) b!1436853))

(assert (= (and b!1436853 res!969731) b!1436848))

(assert (= (and b!1436848 res!969730) b!1436849))

(assert (= (and b!1436849 res!969736) b!1436847))

(assert (= (and b!1436847 res!969733) b!1436852))

(assert (= (and b!1436852 res!969734) b!1436851))

(declare-fun m!1326145 () Bool)

(assert (=> b!1436851 m!1326145))

(assert (=> b!1436851 m!1326145))

(declare-fun m!1326147 () Bool)

(assert (=> b!1436851 m!1326147))

(assert (=> b!1436851 m!1326147))

(assert (=> b!1436851 m!1326145))

(declare-fun m!1326149 () Bool)

(assert (=> b!1436851 m!1326149))

(declare-fun m!1326151 () Bool)

(assert (=> start!124118 m!1326151))

(declare-fun m!1326153 () Bool)

(assert (=> start!124118 m!1326153))

(declare-fun m!1326155 () Bool)

(assert (=> b!1436849 m!1326155))

(declare-fun m!1326157 () Bool)

(assert (=> b!1436852 m!1326157))

(declare-fun m!1326159 () Bool)

(assert (=> b!1436852 m!1326159))

(assert (=> b!1436848 m!1326145))

(assert (=> b!1436848 m!1326145))

(declare-fun m!1326161 () Bool)

(assert (=> b!1436848 m!1326161))

(declare-fun m!1326163 () Bool)

(assert (=> b!1436853 m!1326163))

(assert (=> b!1436853 m!1326163))

(declare-fun m!1326165 () Bool)

(assert (=> b!1436853 m!1326165))

(declare-fun m!1326167 () Bool)

(assert (=> b!1436847 m!1326167))

(push 1)

(assert (not start!124118))

(assert (not b!1436853))

(assert (not b!1436847))

(assert (not b!1436851))

(assert (not b!1436848))

(assert (not b!1436849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

