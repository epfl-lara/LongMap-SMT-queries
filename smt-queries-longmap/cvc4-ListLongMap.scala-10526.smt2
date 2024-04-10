; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124130 () Bool)

(assert start!124130)

(declare-fun b!1436982 () Bool)

(declare-fun res!969870 () Bool)

(declare-fun e!810808 () Bool)

(assert (=> b!1436982 (=> (not res!969870) (not e!810808))))

(declare-datatypes ((array!97734 0))(
  ( (array!97735 (arr!47161 (Array (_ BitVec 32) (_ BitVec 64))) (size!47711 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97734)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436982 (= res!969870 (validKeyInArray!0 (select (arr!47161 a!2862) i!1006)))))

(declare-fun b!1436983 () Bool)

(declare-fun res!969869 () Bool)

(assert (=> b!1436983 (=> (not res!969869) (not e!810808))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436983 (= res!969869 (and (= (size!47711 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47711 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47711 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436984 () Bool)

(declare-fun res!969868 () Bool)

(assert (=> b!1436984 (=> (not res!969868) (not e!810808))))

(assert (=> b!1436984 (= res!969868 (validKeyInArray!0 (select (arr!47161 a!2862) j!93)))))

(declare-fun b!1436985 () Bool)

(assert (=> b!1436985 (= e!810808 false)))

(declare-datatypes ((SeekEntryResult!11413 0))(
  ( (MissingZero!11413 (index!48044 (_ BitVec 32))) (Found!11413 (index!48045 (_ BitVec 32))) (Intermediate!11413 (undefined!12225 Bool) (index!48046 (_ BitVec 32)) (x!129774 (_ BitVec 32))) (Undefined!11413) (MissingVacant!11413 (index!48047 (_ BitVec 32))) )
))
(declare-fun lt!632229 () SeekEntryResult!11413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97734 (_ BitVec 32)) SeekEntryResult!11413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436985 (= lt!632229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) (select (arr!47161 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436986 () Bool)

(declare-fun res!969865 () Bool)

(assert (=> b!1436986 (=> (not res!969865) (not e!810808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97734 (_ BitVec 32)) Bool)

(assert (=> b!1436986 (= res!969865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436987 () Bool)

(declare-fun res!969871 () Bool)

(assert (=> b!1436987 (=> (not res!969871) (not e!810808))))

(declare-datatypes ((List!33662 0))(
  ( (Nil!33659) (Cons!33658 (h!34996 (_ BitVec 64)) (t!48356 List!33662)) )
))
(declare-fun arrayNoDuplicates!0 (array!97734 (_ BitVec 32) List!33662) Bool)

(assert (=> b!1436987 (= res!969871 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33659))))

(declare-fun res!969866 () Bool)

(assert (=> start!124130 (=> (not res!969866) (not e!810808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124130 (= res!969866 (validMask!0 mask!2687))))

(assert (=> start!124130 e!810808))

(assert (=> start!124130 true))

(declare-fun array_inv!36189 (array!97734) Bool)

(assert (=> start!124130 (array_inv!36189 a!2862)))

(declare-fun b!1436988 () Bool)

(declare-fun res!969867 () Bool)

(assert (=> b!1436988 (=> (not res!969867) (not e!810808))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436988 (= res!969867 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47711 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47711 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47711 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124130 res!969866) b!1436983))

(assert (= (and b!1436983 res!969869) b!1436982))

(assert (= (and b!1436982 res!969870) b!1436984))

(assert (= (and b!1436984 res!969868) b!1436986))

(assert (= (and b!1436986 res!969865) b!1436987))

(assert (= (and b!1436987 res!969871) b!1436988))

(assert (= (and b!1436988 res!969867) b!1436985))

(declare-fun m!1326289 () Bool)

(assert (=> b!1436986 m!1326289))

(declare-fun m!1326291 () Bool)

(assert (=> b!1436982 m!1326291))

(assert (=> b!1436982 m!1326291))

(declare-fun m!1326293 () Bool)

(assert (=> b!1436982 m!1326293))

(declare-fun m!1326295 () Bool)

(assert (=> b!1436987 m!1326295))

(declare-fun m!1326297 () Bool)

(assert (=> b!1436988 m!1326297))

(declare-fun m!1326299 () Bool)

(assert (=> b!1436988 m!1326299))

(declare-fun m!1326301 () Bool)

(assert (=> start!124130 m!1326301))

(declare-fun m!1326303 () Bool)

(assert (=> start!124130 m!1326303))

(declare-fun m!1326305 () Bool)

(assert (=> b!1436984 m!1326305))

(assert (=> b!1436984 m!1326305))

(declare-fun m!1326307 () Bool)

(assert (=> b!1436984 m!1326307))

(assert (=> b!1436985 m!1326305))

(assert (=> b!1436985 m!1326305))

(declare-fun m!1326309 () Bool)

(assert (=> b!1436985 m!1326309))

(assert (=> b!1436985 m!1326309))

(assert (=> b!1436985 m!1326305))

(declare-fun m!1326311 () Bool)

(assert (=> b!1436985 m!1326311))

(push 1)

(assert (not b!1436985))

(assert (not b!1436987))

(assert (not b!1436982))

(assert (not start!124130))

(assert (not b!1436986))

(assert (not b!1436984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

