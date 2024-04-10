; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124518 () Bool)

(assert start!124518)

(declare-fun b!1440878 () Bool)

(declare-fun res!973313 () Bool)

(declare-fun e!812321 () Bool)

(assert (=> b!1440878 (=> (not res!973313) (not e!812321))))

(declare-datatypes ((array!97966 0))(
  ( (array!97967 (arr!47271 (Array (_ BitVec 32) (_ BitVec 64))) (size!47821 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97966)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97966 (_ BitVec 32)) Bool)

(assert (=> b!1440878 (= res!973313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440879 () Bool)

(declare-fun res!973315 () Bool)

(declare-fun e!812319 () Bool)

(assert (=> b!1440879 (=> (not res!973315) (not e!812319))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11523 0))(
  ( (MissingZero!11523 (index!48484 (_ BitVec 32))) (Found!11523 (index!48485 (_ BitVec 32))) (Intermediate!11523 (undefined!12335 Bool) (index!48486 (_ BitVec 32)) (x!130204 (_ BitVec 32))) (Undefined!11523) (MissingVacant!11523 (index!48487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97966 (_ BitVec 32)) SeekEntryResult!11523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440879 (= res!973315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47271 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47271 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97967 (store (arr!47271 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47821 a!2862)) mask!2687) (Intermediate!11523 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440880 () Bool)

(declare-fun res!973312 () Bool)

(assert (=> b!1440880 (=> (not res!973312) (not e!812321))))

(declare-datatypes ((List!33772 0))(
  ( (Nil!33769) (Cons!33768 (h!35118 (_ BitVec 64)) (t!48466 List!33772)) )
))
(declare-fun arrayNoDuplicates!0 (array!97966 (_ BitVec 32) List!33772) Bool)

(assert (=> b!1440880 (= res!973312 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33769))))

(declare-fun b!1440881 () Bool)

(declare-fun res!973314 () Bool)

(assert (=> b!1440881 (=> (not res!973314) (not e!812321))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440881 (= res!973314 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47821 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47821 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47821 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47271 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440882 () Bool)

(declare-fun res!973309 () Bool)

(assert (=> b!1440882 (=> (not res!973309) (not e!812321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440882 (= res!973309 (validKeyInArray!0 (select (arr!47271 a!2862) i!1006)))))

(declare-fun res!973305 () Bool)

(assert (=> start!124518 (=> (not res!973305) (not e!812321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124518 (= res!973305 (validMask!0 mask!2687))))

(assert (=> start!124518 e!812321))

(assert (=> start!124518 true))

(declare-fun array_inv!36299 (array!97966) Bool)

(assert (=> start!124518 (array_inv!36299 a!2862)))

(declare-fun b!1440883 () Bool)

(assert (=> b!1440883 (= e!812319 (not (validKeyInArray!0 (select (store (arr!47271 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440884 () Bool)

(assert (=> b!1440884 (= e!812321 e!812319)))

(declare-fun res!973307 () Bool)

(assert (=> b!1440884 (=> (not res!973307) (not e!812319))))

(declare-fun lt!633036 () SeekEntryResult!11523)

(assert (=> b!1440884 (= res!973307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47271 a!2862) j!93) mask!2687) (select (arr!47271 a!2862) j!93) a!2862 mask!2687) lt!633036))))

(assert (=> b!1440884 (= lt!633036 (Intermediate!11523 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440885 () Bool)

(declare-fun res!973306 () Bool)

(assert (=> b!1440885 (=> (not res!973306) (not e!812321))))

(assert (=> b!1440885 (= res!973306 (and (= (size!47821 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47821 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47821 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440886 () Bool)

(declare-fun res!973311 () Bool)

(assert (=> b!1440886 (=> (not res!973311) (not e!812319))))

(assert (=> b!1440886 (= res!973311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47271 a!2862) j!93) a!2862 mask!2687) lt!633036))))

(declare-fun b!1440887 () Bool)

(declare-fun res!973308 () Bool)

(assert (=> b!1440887 (=> (not res!973308) (not e!812319))))

(assert (=> b!1440887 (= res!973308 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440888 () Bool)

(declare-fun res!973310 () Bool)

(assert (=> b!1440888 (=> (not res!973310) (not e!812321))))

(assert (=> b!1440888 (= res!973310 (validKeyInArray!0 (select (arr!47271 a!2862) j!93)))))

(assert (= (and start!124518 res!973305) b!1440885))

(assert (= (and b!1440885 res!973306) b!1440882))

(assert (= (and b!1440882 res!973309) b!1440888))

(assert (= (and b!1440888 res!973310) b!1440878))

(assert (= (and b!1440878 res!973313) b!1440880))

(assert (= (and b!1440880 res!973312) b!1440881))

(assert (= (and b!1440881 res!973314) b!1440884))

(assert (= (and b!1440884 res!973307) b!1440886))

(assert (= (and b!1440886 res!973311) b!1440879))

(assert (= (and b!1440879 res!973315) b!1440887))

(assert (= (and b!1440887 res!973308) b!1440883))

(declare-fun m!1330115 () Bool)

(assert (=> start!124518 m!1330115))

(declare-fun m!1330117 () Bool)

(assert (=> start!124518 m!1330117))

(declare-fun m!1330119 () Bool)

(assert (=> b!1440882 m!1330119))

(assert (=> b!1440882 m!1330119))

(declare-fun m!1330121 () Bool)

(assert (=> b!1440882 m!1330121))

(declare-fun m!1330123 () Bool)

(assert (=> b!1440883 m!1330123))

(declare-fun m!1330125 () Bool)

(assert (=> b!1440883 m!1330125))

(assert (=> b!1440883 m!1330125))

(declare-fun m!1330127 () Bool)

(assert (=> b!1440883 m!1330127))

(assert (=> b!1440881 m!1330123))

(declare-fun m!1330129 () Bool)

(assert (=> b!1440881 m!1330129))

(declare-fun m!1330131 () Bool)

(assert (=> b!1440888 m!1330131))

(assert (=> b!1440888 m!1330131))

(declare-fun m!1330133 () Bool)

(assert (=> b!1440888 m!1330133))

(declare-fun m!1330135 () Bool)

(assert (=> b!1440878 m!1330135))

(declare-fun m!1330137 () Bool)

(assert (=> b!1440880 m!1330137))

(assert (=> b!1440879 m!1330123))

(assert (=> b!1440879 m!1330125))

(assert (=> b!1440879 m!1330125))

(declare-fun m!1330139 () Bool)

(assert (=> b!1440879 m!1330139))

(assert (=> b!1440879 m!1330139))

(assert (=> b!1440879 m!1330125))

(declare-fun m!1330141 () Bool)

(assert (=> b!1440879 m!1330141))

(assert (=> b!1440886 m!1330131))

(assert (=> b!1440886 m!1330131))

(declare-fun m!1330143 () Bool)

(assert (=> b!1440886 m!1330143))

(assert (=> b!1440884 m!1330131))

(assert (=> b!1440884 m!1330131))

(declare-fun m!1330145 () Bool)

(assert (=> b!1440884 m!1330145))

(assert (=> b!1440884 m!1330145))

(assert (=> b!1440884 m!1330131))

(declare-fun m!1330147 () Bool)

(assert (=> b!1440884 m!1330147))

(check-sat (not b!1440879) (not b!1440878) (not b!1440888) (not b!1440883) (not b!1440882) (not start!124518) (not b!1440886) (not b!1440880) (not b!1440884))
(check-sat)
