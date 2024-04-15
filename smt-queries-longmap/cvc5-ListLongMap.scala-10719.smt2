; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125426 () Bool)

(assert start!125426)

(declare-fun b!1467494 () Bool)

(declare-fun res!996154 () Bool)

(declare-fun e!824229 () Bool)

(assert (=> b!1467494 (=> (not res!996154) (not e!824229))))

(declare-datatypes ((array!98852 0))(
  ( (array!98853 (arr!47715 (Array (_ BitVec 32) (_ BitVec 64))) (size!48267 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98852)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467494 (= res!996154 (validKeyInArray!0 (select (arr!47715 a!2862) j!93)))))

(declare-fun res!996152 () Bool)

(assert (=> start!125426 (=> (not res!996152) (not e!824229))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125426 (= res!996152 (validMask!0 mask!2687))))

(assert (=> start!125426 e!824229))

(assert (=> start!125426 true))

(declare-fun array_inv!36948 (array!98852) Bool)

(assert (=> start!125426 (array_inv!36948 a!2862)))

(declare-fun b!1467495 () Bool)

(declare-fun res!996156 () Bool)

(assert (=> b!1467495 (=> (not res!996156) (not e!824229))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467495 (= res!996156 (validKeyInArray!0 (select (arr!47715 a!2862) i!1006)))))

(declare-fun b!1467496 () Bool)

(declare-fun res!996155 () Bool)

(assert (=> b!1467496 (=> (not res!996155) (not e!824229))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467496 (= res!996155 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48267 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48267 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48267 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47715 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467497 () Bool)

(declare-fun res!996153 () Bool)

(assert (=> b!1467497 (=> (not res!996153) (not e!824229))))

(declare-datatypes ((List!34294 0))(
  ( (Nil!34291) (Cons!34290 (h!35640 (_ BitVec 64)) (t!48980 List!34294)) )
))
(declare-fun arrayNoDuplicates!0 (array!98852 (_ BitVec 32) List!34294) Bool)

(assert (=> b!1467497 (= res!996153 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34291))))

(declare-fun b!1467498 () Bool)

(declare-fun res!996150 () Bool)

(assert (=> b!1467498 (=> (not res!996150) (not e!824229))))

(declare-datatypes ((SeekEntryResult!11980 0))(
  ( (MissingZero!11980 (index!50312 (_ BitVec 32))) (Found!11980 (index!50313 (_ BitVec 32))) (Intermediate!11980 (undefined!12792 Bool) (index!50314 (_ BitVec 32)) (x!131904 (_ BitVec 32))) (Undefined!11980) (MissingVacant!11980 (index!50315 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98852 (_ BitVec 32)) SeekEntryResult!11980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467498 (= res!996150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47715 a!2862) j!93) mask!2687) (select (arr!47715 a!2862) j!93) a!2862 mask!2687) (Intermediate!11980 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467499 () Bool)

(declare-fun res!996151 () Bool)

(assert (=> b!1467499 (=> (not res!996151) (not e!824229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98852 (_ BitVec 32)) Bool)

(assert (=> b!1467499 (= res!996151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467500 () Bool)

(declare-fun res!996157 () Bool)

(assert (=> b!1467500 (=> (not res!996157) (not e!824229))))

(assert (=> b!1467500 (= res!996157 (and (= (size!48267 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48267 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48267 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467501 () Bool)

(assert (=> b!1467501 (= e!824229 false)))

(declare-fun lt!641904 () SeekEntryResult!11980)

(assert (=> b!1467501 (= lt!641904 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47715 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!125426 res!996152) b!1467500))

(assert (= (and b!1467500 res!996157) b!1467495))

(assert (= (and b!1467495 res!996156) b!1467494))

(assert (= (and b!1467494 res!996154) b!1467499))

(assert (= (and b!1467499 res!996151) b!1467497))

(assert (= (and b!1467497 res!996153) b!1467496))

(assert (= (and b!1467496 res!996155) b!1467498))

(assert (= (and b!1467498 res!996150) b!1467501))

(declare-fun m!1353967 () Bool)

(assert (=> start!125426 m!1353967))

(declare-fun m!1353969 () Bool)

(assert (=> start!125426 m!1353969))

(declare-fun m!1353971 () Bool)

(assert (=> b!1467496 m!1353971))

(declare-fun m!1353973 () Bool)

(assert (=> b!1467496 m!1353973))

(declare-fun m!1353975 () Bool)

(assert (=> b!1467497 m!1353975))

(declare-fun m!1353977 () Bool)

(assert (=> b!1467495 m!1353977))

(assert (=> b!1467495 m!1353977))

(declare-fun m!1353979 () Bool)

(assert (=> b!1467495 m!1353979))

(declare-fun m!1353981 () Bool)

(assert (=> b!1467494 m!1353981))

(assert (=> b!1467494 m!1353981))

(declare-fun m!1353983 () Bool)

(assert (=> b!1467494 m!1353983))

(declare-fun m!1353985 () Bool)

(assert (=> b!1467499 m!1353985))

(assert (=> b!1467498 m!1353981))

(assert (=> b!1467498 m!1353981))

(declare-fun m!1353987 () Bool)

(assert (=> b!1467498 m!1353987))

(assert (=> b!1467498 m!1353987))

(assert (=> b!1467498 m!1353981))

(declare-fun m!1353989 () Bool)

(assert (=> b!1467498 m!1353989))

(assert (=> b!1467501 m!1353981))

(assert (=> b!1467501 m!1353981))

(declare-fun m!1353991 () Bool)

(assert (=> b!1467501 m!1353991))

(push 1)

(assert (not b!1467495))

(assert (not b!1467499))

(assert (not b!1467501))

(assert (not start!125426))

(assert (not b!1467494))

(assert (not b!1467497))

(assert (not b!1467498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

