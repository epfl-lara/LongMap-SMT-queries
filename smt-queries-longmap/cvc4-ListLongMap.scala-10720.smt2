; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125738 () Bool)

(assert start!125738)

(declare-fun b!1469445 () Bool)

(declare-fun res!996887 () Bool)

(declare-fun e!825420 () Bool)

(assert (=> b!1469445 (=> (not res!996887) (not e!825420))))

(declare-datatypes ((array!99024 0))(
  ( (array!99025 (arr!47795 (Array (_ BitVec 32) (_ BitVec 64))) (size!48346 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99024)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469445 (= res!996887 (validKeyInArray!0 (select (arr!47795 a!2862) i!1006)))))

(declare-fun b!1469446 () Bool)

(declare-fun res!996892 () Bool)

(assert (=> b!1469446 (=> (not res!996892) (not e!825420))))

(declare-datatypes ((List!34283 0))(
  ( (Nil!34280) (Cons!34279 (h!35643 (_ BitVec 64)) (t!48969 List!34283)) )
))
(declare-fun arrayNoDuplicates!0 (array!99024 (_ BitVec 32) List!34283) Bool)

(assert (=> b!1469446 (= res!996892 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34280))))

(declare-fun b!1469448 () Bool)

(declare-fun res!996888 () Bool)

(assert (=> b!1469448 (=> (not res!996888) (not e!825420))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469448 (= res!996888 (validKeyInArray!0 (select (arr!47795 a!2862) j!93)))))

(declare-fun b!1469449 () Bool)

(declare-fun res!996891 () Bool)

(assert (=> b!1469449 (=> (not res!996891) (not e!825420))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11932 0))(
  ( (MissingZero!11932 (index!50120 (_ BitVec 32))) (Found!11932 (index!50121 (_ BitVec 32))) (Intermediate!11932 (undefined!12744 Bool) (index!50122 (_ BitVec 32)) (x!131902 (_ BitVec 32))) (Undefined!11932) (MissingVacant!11932 (index!50123 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99024 (_ BitVec 32)) SeekEntryResult!11932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469449 (= res!996891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47795 a!2862) j!93) mask!2687) (select (arr!47795 a!2862) j!93) a!2862 mask!2687) (Intermediate!11932 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1469450 () Bool)

(assert (=> b!1469450 (= e!825420 false)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642781 () SeekEntryResult!11932)

(assert (=> b!1469450 (= lt!642781 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47795 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1469451 () Bool)

(declare-fun res!996889 () Bool)

(assert (=> b!1469451 (=> (not res!996889) (not e!825420))))

(assert (=> b!1469451 (= res!996889 (and (= (size!48346 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48346 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48346 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469452 () Bool)

(declare-fun res!996893 () Bool)

(assert (=> b!1469452 (=> (not res!996893) (not e!825420))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469452 (= res!996893 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48346 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48346 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48346 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47795 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996890 () Bool)

(assert (=> start!125738 (=> (not res!996890) (not e!825420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125738 (= res!996890 (validMask!0 mask!2687))))

(assert (=> start!125738 e!825420))

(assert (=> start!125738 true))

(declare-fun array_inv!37076 (array!99024) Bool)

(assert (=> start!125738 (array_inv!37076 a!2862)))

(declare-fun b!1469447 () Bool)

(declare-fun res!996886 () Bool)

(assert (=> b!1469447 (=> (not res!996886) (not e!825420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99024 (_ BitVec 32)) Bool)

(assert (=> b!1469447 (= res!996886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125738 res!996890) b!1469451))

(assert (= (and b!1469451 res!996889) b!1469445))

(assert (= (and b!1469445 res!996887) b!1469448))

(assert (= (and b!1469448 res!996888) b!1469447))

(assert (= (and b!1469447 res!996886) b!1469446))

(assert (= (and b!1469446 res!996892) b!1469452))

(assert (= (and b!1469452 res!996893) b!1469449))

(assert (= (and b!1469449 res!996891) b!1469450))

(declare-fun m!1356381 () Bool)

(assert (=> b!1469448 m!1356381))

(assert (=> b!1469448 m!1356381))

(declare-fun m!1356383 () Bool)

(assert (=> b!1469448 m!1356383))

(declare-fun m!1356385 () Bool)

(assert (=> b!1469445 m!1356385))

(assert (=> b!1469445 m!1356385))

(declare-fun m!1356387 () Bool)

(assert (=> b!1469445 m!1356387))

(assert (=> b!1469450 m!1356381))

(assert (=> b!1469450 m!1356381))

(declare-fun m!1356389 () Bool)

(assert (=> b!1469450 m!1356389))

(declare-fun m!1356391 () Bool)

(assert (=> b!1469446 m!1356391))

(declare-fun m!1356393 () Bool)

(assert (=> b!1469447 m!1356393))

(assert (=> b!1469449 m!1356381))

(assert (=> b!1469449 m!1356381))

(declare-fun m!1356395 () Bool)

(assert (=> b!1469449 m!1356395))

(assert (=> b!1469449 m!1356395))

(assert (=> b!1469449 m!1356381))

(declare-fun m!1356397 () Bool)

(assert (=> b!1469449 m!1356397))

(declare-fun m!1356399 () Bool)

(assert (=> start!125738 m!1356399))

(declare-fun m!1356401 () Bool)

(assert (=> start!125738 m!1356401))

(declare-fun m!1356403 () Bool)

(assert (=> b!1469452 m!1356403))

(declare-fun m!1356405 () Bool)

(assert (=> b!1469452 m!1356405))

(push 1)

(assert (not b!1469447))

(assert (not start!125738))

(assert (not b!1469450))

(assert (not b!1469449))

(assert (not b!1469446))

(assert (not b!1469448))

(assert (not b!1469445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

