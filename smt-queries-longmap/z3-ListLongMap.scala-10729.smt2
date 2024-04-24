; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125790 () Bool)

(assert start!125790)

(declare-fun b!1470134 () Bool)

(declare-fun res!997576 () Bool)

(declare-fun e!825642 () Bool)

(assert (=> b!1470134 (=> (not res!997576) (not e!825642))))

(declare-datatypes ((array!99076 0))(
  ( (array!99077 (arr!47821 (Array (_ BitVec 32) (_ BitVec 64))) (size!48372 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99076)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470134 (= res!997576 (validKeyInArray!0 (select (arr!47821 a!2862) j!93)))))

(declare-fun b!1470135 () Bool)

(declare-fun e!825641 () Bool)

(assert (=> b!1470135 (= e!825642 e!825641)))

(declare-fun res!997582 () Bool)

(assert (=> b!1470135 (=> (not res!997582) (not e!825641))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11958 0))(
  ( (MissingZero!11958 (index!50224 (_ BitVec 32))) (Found!11958 (index!50225 (_ BitVec 32))) (Intermediate!11958 (undefined!12770 Bool) (index!50226 (_ BitVec 32)) (x!132000 (_ BitVec 32))) (Undefined!11958) (MissingVacant!11958 (index!50227 (_ BitVec 32))) )
))
(declare-fun lt!642925 () SeekEntryResult!11958)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99076 (_ BitVec 32)) SeekEntryResult!11958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470135 (= res!997582 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47821 a!2862) j!93) mask!2687) (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!642925))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470135 (= lt!642925 (Intermediate!11958 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470136 () Bool)

(declare-fun res!997579 () Bool)

(assert (=> b!1470136 (=> (not res!997579) (not e!825642))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470136 (= res!997579 (validKeyInArray!0 (select (arr!47821 a!2862) i!1006)))))

(declare-fun b!1470138 () Bool)

(assert (=> b!1470138 (= e!825641 false)))

(declare-fun lt!642924 () SeekEntryResult!11958)

(assert (=> b!1470138 (= lt!642924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99077 (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48372 a!2862)) mask!2687))))

(declare-fun b!1470139 () Bool)

(declare-fun res!997578 () Bool)

(assert (=> b!1470139 (=> (not res!997578) (not e!825642))))

(assert (=> b!1470139 (= res!997578 (and (= (size!48372 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48372 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48372 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470137 () Bool)

(declare-fun res!997580 () Bool)

(assert (=> b!1470137 (=> (not res!997580) (not e!825642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99076 (_ BitVec 32)) Bool)

(assert (=> b!1470137 (= res!997580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997575 () Bool)

(assert (=> start!125790 (=> (not res!997575) (not e!825642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125790 (= res!997575 (validMask!0 mask!2687))))

(assert (=> start!125790 e!825642))

(assert (=> start!125790 true))

(declare-fun array_inv!37102 (array!99076) Bool)

(assert (=> start!125790 (array_inv!37102 a!2862)))

(declare-fun b!1470140 () Bool)

(declare-fun res!997581 () Bool)

(assert (=> b!1470140 (=> (not res!997581) (not e!825642))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470140 (= res!997581 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48372 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48372 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48372 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470141 () Bool)

(declare-fun res!997577 () Bool)

(assert (=> b!1470141 (=> (not res!997577) (not e!825642))))

(declare-datatypes ((List!34309 0))(
  ( (Nil!34306) (Cons!34305 (h!35669 (_ BitVec 64)) (t!48995 List!34309)) )
))
(declare-fun arrayNoDuplicates!0 (array!99076 (_ BitVec 32) List!34309) Bool)

(assert (=> b!1470141 (= res!997577 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34306))))

(declare-fun b!1470142 () Bool)

(declare-fun res!997583 () Bool)

(assert (=> b!1470142 (=> (not res!997583) (not e!825641))))

(assert (=> b!1470142 (= res!997583 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!642925))))

(assert (= (and start!125790 res!997575) b!1470139))

(assert (= (and b!1470139 res!997578) b!1470136))

(assert (= (and b!1470136 res!997579) b!1470134))

(assert (= (and b!1470134 res!997576) b!1470137))

(assert (= (and b!1470137 res!997580) b!1470141))

(assert (= (and b!1470141 res!997577) b!1470140))

(assert (= (and b!1470140 res!997581) b!1470135))

(assert (= (and b!1470135 res!997582) b!1470142))

(assert (= (and b!1470142 res!997583) b!1470138))

(declare-fun m!1357171 () Bool)

(assert (=> b!1470141 m!1357171))

(declare-fun m!1357173 () Bool)

(assert (=> b!1470138 m!1357173))

(declare-fun m!1357175 () Bool)

(assert (=> b!1470138 m!1357175))

(assert (=> b!1470138 m!1357175))

(declare-fun m!1357177 () Bool)

(assert (=> b!1470138 m!1357177))

(assert (=> b!1470138 m!1357177))

(assert (=> b!1470138 m!1357175))

(declare-fun m!1357179 () Bool)

(assert (=> b!1470138 m!1357179))

(declare-fun m!1357181 () Bool)

(assert (=> start!125790 m!1357181))

(declare-fun m!1357183 () Bool)

(assert (=> start!125790 m!1357183))

(declare-fun m!1357185 () Bool)

(assert (=> b!1470142 m!1357185))

(assert (=> b!1470142 m!1357185))

(declare-fun m!1357187 () Bool)

(assert (=> b!1470142 m!1357187))

(declare-fun m!1357189 () Bool)

(assert (=> b!1470136 m!1357189))

(assert (=> b!1470136 m!1357189))

(declare-fun m!1357191 () Bool)

(assert (=> b!1470136 m!1357191))

(assert (=> b!1470135 m!1357185))

(assert (=> b!1470135 m!1357185))

(declare-fun m!1357193 () Bool)

(assert (=> b!1470135 m!1357193))

(assert (=> b!1470135 m!1357193))

(assert (=> b!1470135 m!1357185))

(declare-fun m!1357195 () Bool)

(assert (=> b!1470135 m!1357195))

(assert (=> b!1470134 m!1357185))

(assert (=> b!1470134 m!1357185))

(declare-fun m!1357197 () Bool)

(assert (=> b!1470134 m!1357197))

(assert (=> b!1470140 m!1357173))

(declare-fun m!1357199 () Bool)

(assert (=> b!1470140 m!1357199))

(declare-fun m!1357201 () Bool)

(assert (=> b!1470137 m!1357201))

(check-sat (not start!125790) (not b!1470138) (not b!1470141) (not b!1470134) (not b!1470137) (not b!1470142) (not b!1470136) (not b!1470135))
(check-sat)
