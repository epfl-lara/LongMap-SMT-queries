; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125450 () Bool)

(assert start!125450)

(declare-fun b!1467618 () Bool)

(declare-fun res!996161 () Bool)

(declare-fun e!824327 () Bool)

(assert (=> b!1467618 (=> (not res!996161) (not e!824327))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98898 0))(
  ( (array!98899 (arr!47737 (Array (_ BitVec 32) (_ BitVec 64))) (size!48287 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98898)

(assert (=> b!1467618 (= res!996161 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48287 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48287 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48287 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467619 () Bool)

(declare-fun res!996163 () Bool)

(assert (=> b!1467619 (=> (not res!996163) (not e!824327))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467619 (= res!996163 (and (= (size!48287 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48287 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48287 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467620 () Bool)

(declare-fun res!996160 () Bool)

(assert (=> b!1467620 (=> (not res!996160) (not e!824327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98898 (_ BitVec 32)) Bool)

(assert (=> b!1467620 (= res!996160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467621 () Bool)

(declare-fun res!996162 () Bool)

(assert (=> b!1467621 (=> (not res!996162) (not e!824327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467621 (= res!996162 (validKeyInArray!0 (select (arr!47737 a!2862) i!1006)))))

(declare-fun b!1467622 () Bool)

(declare-fun res!996158 () Bool)

(assert (=> b!1467622 (=> (not res!996158) (not e!824327))))

(assert (=> b!1467622 (= res!996158 (validKeyInArray!0 (select (arr!47737 a!2862) j!93)))))

(declare-fun res!996159 () Bool)

(assert (=> start!125450 (=> (not res!996159) (not e!824327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125450 (= res!996159 (validMask!0 mask!2687))))

(assert (=> start!125450 e!824327))

(assert (=> start!125450 true))

(declare-fun array_inv!36765 (array!98898) Bool)

(assert (=> start!125450 (array_inv!36765 a!2862)))

(declare-fun b!1467623 () Bool)

(declare-fun res!996157 () Bool)

(assert (=> b!1467623 (=> (not res!996157) (not e!824327))))

(declare-datatypes ((List!34238 0))(
  ( (Nil!34235) (Cons!34234 (h!35584 (_ BitVec 64)) (t!48932 List!34238)) )
))
(declare-fun arrayNoDuplicates!0 (array!98898 (_ BitVec 32) List!34238) Bool)

(assert (=> b!1467623 (= res!996157 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34235))))

(declare-fun b!1467624 () Bool)

(assert (=> b!1467624 (= e!824327 false)))

(declare-datatypes ((SeekEntryResult!11977 0))(
  ( (MissingZero!11977 (index!50300 (_ BitVec 32))) (Found!11977 (index!50301 (_ BitVec 32))) (Intermediate!11977 (undefined!12789 Bool) (index!50302 (_ BitVec 32)) (x!131898 (_ BitVec 32))) (Undefined!11977) (MissingVacant!11977 (index!50303 (_ BitVec 32))) )
))
(declare-fun lt!642129 () SeekEntryResult!11977)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98898 (_ BitVec 32)) SeekEntryResult!11977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467624 (= lt!642129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47737 a!2862) j!93) mask!2687) (select (arr!47737 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!125450 res!996159) b!1467619))

(assert (= (and b!1467619 res!996163) b!1467621))

(assert (= (and b!1467621 res!996162) b!1467622))

(assert (= (and b!1467622 res!996158) b!1467620))

(assert (= (and b!1467620 res!996160) b!1467623))

(assert (= (and b!1467623 res!996157) b!1467618))

(assert (= (and b!1467618 res!996161) b!1467624))

(declare-fun m!1354567 () Bool)

(assert (=> b!1467618 m!1354567))

(declare-fun m!1354569 () Bool)

(assert (=> b!1467618 m!1354569))

(declare-fun m!1354571 () Bool)

(assert (=> b!1467622 m!1354571))

(assert (=> b!1467622 m!1354571))

(declare-fun m!1354573 () Bool)

(assert (=> b!1467622 m!1354573))

(declare-fun m!1354575 () Bool)

(assert (=> start!125450 m!1354575))

(declare-fun m!1354577 () Bool)

(assert (=> start!125450 m!1354577))

(assert (=> b!1467624 m!1354571))

(assert (=> b!1467624 m!1354571))

(declare-fun m!1354579 () Bool)

(assert (=> b!1467624 m!1354579))

(assert (=> b!1467624 m!1354579))

(assert (=> b!1467624 m!1354571))

(declare-fun m!1354581 () Bool)

(assert (=> b!1467624 m!1354581))

(declare-fun m!1354583 () Bool)

(assert (=> b!1467621 m!1354583))

(assert (=> b!1467621 m!1354583))

(declare-fun m!1354585 () Bool)

(assert (=> b!1467621 m!1354585))

(declare-fun m!1354587 () Bool)

(assert (=> b!1467620 m!1354587))

(declare-fun m!1354589 () Bool)

(assert (=> b!1467623 m!1354589))

(push 1)

(assert (not b!1467622))

(assert (not b!1467621))

(assert (not b!1467623))

(assert (not start!125450))

(assert (not b!1467624))

(assert (not b!1467620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

