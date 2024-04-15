; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124018 () Bool)

(assert start!124018)

(declare-fun b!1436214 () Bool)

(declare-fun res!969253 () Bool)

(declare-fun e!810491 () Bool)

(assert (=> b!1436214 (=> (not res!969253) (not e!810491))))

(declare-datatypes ((array!97633 0))(
  ( (array!97634 (arr!47113 (Array (_ BitVec 32) (_ BitVec 64))) (size!47665 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97633)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436214 (= res!969253 (validKeyInArray!0 (select (arr!47113 a!2862) i!1006)))))

(declare-fun b!1436215 () Bool)

(declare-fun res!969250 () Bool)

(assert (=> b!1436215 (=> (not res!969250) (not e!810491))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97633 (_ BitVec 32)) Bool)

(assert (=> b!1436215 (= res!969250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436216 () Bool)

(declare-fun res!969248 () Bool)

(assert (=> b!1436216 (=> (not res!969248) (not e!810491))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436216 (= res!969248 (and (= (size!47665 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47665 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47665 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436217 () Bool)

(assert (=> b!1436217 (= e!810491 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!631890 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436217 (= lt!631890 (toIndex!0 (select (arr!47113 a!2862) j!93) mask!2687))))

(declare-fun b!1436218 () Bool)

(declare-fun res!969249 () Bool)

(assert (=> b!1436218 (=> (not res!969249) (not e!810491))))

(assert (=> b!1436218 (= res!969249 (validKeyInArray!0 (select (arr!47113 a!2862) j!93)))))

(declare-fun res!969252 () Bool)

(assert (=> start!124018 (=> (not res!969252) (not e!810491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124018 (= res!969252 (validMask!0 mask!2687))))

(assert (=> start!124018 e!810491))

(assert (=> start!124018 true))

(declare-fun array_inv!36346 (array!97633) Bool)

(assert (=> start!124018 (array_inv!36346 a!2862)))

(declare-fun b!1436219 () Bool)

(declare-fun res!969251 () Bool)

(assert (=> b!1436219 (=> (not res!969251) (not e!810491))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1436219 (= res!969251 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47665 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47665 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47665 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47113 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436220 () Bool)

(declare-fun res!969247 () Bool)

(assert (=> b!1436220 (=> (not res!969247) (not e!810491))))

(declare-datatypes ((List!33692 0))(
  ( (Nil!33689) (Cons!33688 (h!35023 (_ BitVec 64)) (t!48378 List!33692)) )
))
(declare-fun arrayNoDuplicates!0 (array!97633 (_ BitVec 32) List!33692) Bool)

(assert (=> b!1436220 (= res!969247 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33689))))

(assert (= (and start!124018 res!969252) b!1436216))

(assert (= (and b!1436216 res!969248) b!1436214))

(assert (= (and b!1436214 res!969253) b!1436218))

(assert (= (and b!1436218 res!969249) b!1436215))

(assert (= (and b!1436215 res!969250) b!1436220))

(assert (= (and b!1436220 res!969247) b!1436219))

(assert (= (and b!1436219 res!969251) b!1436217))

(declare-fun m!1325043 () Bool)

(assert (=> b!1436217 m!1325043))

(assert (=> b!1436217 m!1325043))

(declare-fun m!1325045 () Bool)

(assert (=> b!1436217 m!1325045))

(declare-fun m!1325047 () Bool)

(assert (=> b!1436215 m!1325047))

(assert (=> b!1436218 m!1325043))

(assert (=> b!1436218 m!1325043))

(declare-fun m!1325049 () Bool)

(assert (=> b!1436218 m!1325049))

(declare-fun m!1325051 () Bool)

(assert (=> b!1436214 m!1325051))

(assert (=> b!1436214 m!1325051))

(declare-fun m!1325053 () Bool)

(assert (=> b!1436214 m!1325053))

(declare-fun m!1325055 () Bool)

(assert (=> b!1436219 m!1325055))

(declare-fun m!1325057 () Bool)

(assert (=> b!1436219 m!1325057))

(declare-fun m!1325059 () Bool)

(assert (=> start!124018 m!1325059))

(declare-fun m!1325061 () Bool)

(assert (=> start!124018 m!1325061))

(declare-fun m!1325063 () Bool)

(assert (=> b!1436220 m!1325063))

(check-sat (not start!124018) (not b!1436215) (not b!1436217) (not b!1436218) (not b!1436214) (not b!1436220))
(check-sat)
