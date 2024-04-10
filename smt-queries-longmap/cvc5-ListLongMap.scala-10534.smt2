; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124216 () Bool)

(assert start!124216)

(declare-fun b!1437718 () Bool)

(declare-fun res!970498 () Bool)

(declare-fun e!811101 () Bool)

(assert (=> b!1437718 (=> (not res!970498) (not e!811101))))

(declare-datatypes ((array!97781 0))(
  ( (array!97782 (arr!47183 (Array (_ BitVec 32) (_ BitVec 64))) (size!47733 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97781)

(declare-datatypes ((List!33684 0))(
  ( (Nil!33681) (Cons!33680 (h!35021 (_ BitVec 64)) (t!48378 List!33684)) )
))
(declare-fun arrayNoDuplicates!0 (array!97781 (_ BitVec 32) List!33684) Bool)

(assert (=> b!1437718 (= res!970498 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33681))))

(declare-fun b!1437720 () Bool)

(declare-fun res!970504 () Bool)

(assert (=> b!1437720 (=> (not res!970504) (not e!811101))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437720 (= res!970504 (and (= (size!47733 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47733 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47733 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437721 () Bool)

(declare-fun res!970501 () Bool)

(assert (=> b!1437721 (=> (not res!970501) (not e!811101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437721 (= res!970501 (validKeyInArray!0 (select (arr!47183 a!2862) j!93)))))

(declare-fun b!1437722 () Bool)

(declare-fun e!811102 () Bool)

(assert (=> b!1437722 (= e!811102 false)))

(declare-fun lt!632375 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437722 (= lt!632375 (toIndex!0 (select (store (arr!47183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437723 () Bool)

(declare-fun res!970496 () Bool)

(assert (=> b!1437723 (=> (not res!970496) (not e!811101))))

(assert (=> b!1437723 (= res!970496 (validKeyInArray!0 (select (arr!47183 a!2862) i!1006)))))

(declare-fun b!1437724 () Bool)

(assert (=> b!1437724 (= e!811101 e!811102)))

(declare-fun res!970499 () Bool)

(assert (=> b!1437724 (=> (not res!970499) (not e!811102))))

(declare-datatypes ((SeekEntryResult!11435 0))(
  ( (MissingZero!11435 (index!48132 (_ BitVec 32))) (Found!11435 (index!48133 (_ BitVec 32))) (Intermediate!11435 (undefined!12247 Bool) (index!48134 (_ BitVec 32)) (x!129866 (_ BitVec 32))) (Undefined!11435) (MissingVacant!11435 (index!48135 (_ BitVec 32))) )
))
(declare-fun lt!632376 () SeekEntryResult!11435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97781 (_ BitVec 32)) SeekEntryResult!11435)

(assert (=> b!1437724 (= res!970499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47183 a!2862) j!93) mask!2687) (select (arr!47183 a!2862) j!93) a!2862 mask!2687) lt!632376))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437724 (= lt!632376 (Intermediate!11435 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!970500 () Bool)

(assert (=> start!124216 (=> (not res!970500) (not e!811101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124216 (= res!970500 (validMask!0 mask!2687))))

(assert (=> start!124216 e!811101))

(assert (=> start!124216 true))

(declare-fun array_inv!36211 (array!97781) Bool)

(assert (=> start!124216 (array_inv!36211 a!2862)))

(declare-fun b!1437719 () Bool)

(declare-fun res!970497 () Bool)

(assert (=> b!1437719 (=> (not res!970497) (not e!811102))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437719 (= res!970497 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47183 a!2862) j!93) a!2862 mask!2687) lt!632376))))

(declare-fun b!1437725 () Bool)

(declare-fun res!970503 () Bool)

(assert (=> b!1437725 (=> (not res!970503) (not e!811101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97781 (_ BitVec 32)) Bool)

(assert (=> b!1437725 (= res!970503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437726 () Bool)

(declare-fun res!970502 () Bool)

(assert (=> b!1437726 (=> (not res!970502) (not e!811101))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437726 (= res!970502 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47733 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47733 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47733 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124216 res!970500) b!1437720))

(assert (= (and b!1437720 res!970504) b!1437723))

(assert (= (and b!1437723 res!970496) b!1437721))

(assert (= (and b!1437721 res!970501) b!1437725))

(assert (= (and b!1437725 res!970503) b!1437718))

(assert (= (and b!1437718 res!970498) b!1437726))

(assert (= (and b!1437726 res!970502) b!1437724))

(assert (= (and b!1437724 res!970499) b!1437719))

(assert (= (and b!1437719 res!970497) b!1437722))

(declare-fun m!1326961 () Bool)

(assert (=> start!124216 m!1326961))

(declare-fun m!1326963 () Bool)

(assert (=> start!124216 m!1326963))

(declare-fun m!1326965 () Bool)

(assert (=> b!1437719 m!1326965))

(assert (=> b!1437719 m!1326965))

(declare-fun m!1326967 () Bool)

(assert (=> b!1437719 m!1326967))

(declare-fun m!1326969 () Bool)

(assert (=> b!1437723 m!1326969))

(assert (=> b!1437723 m!1326969))

(declare-fun m!1326971 () Bool)

(assert (=> b!1437723 m!1326971))

(assert (=> b!1437721 m!1326965))

(assert (=> b!1437721 m!1326965))

(declare-fun m!1326973 () Bool)

(assert (=> b!1437721 m!1326973))

(declare-fun m!1326975 () Bool)

(assert (=> b!1437725 m!1326975))

(declare-fun m!1326977 () Bool)

(assert (=> b!1437722 m!1326977))

(declare-fun m!1326979 () Bool)

(assert (=> b!1437722 m!1326979))

(assert (=> b!1437722 m!1326979))

(declare-fun m!1326981 () Bool)

(assert (=> b!1437722 m!1326981))

(assert (=> b!1437726 m!1326977))

(declare-fun m!1326983 () Bool)

(assert (=> b!1437726 m!1326983))

(assert (=> b!1437724 m!1326965))

(assert (=> b!1437724 m!1326965))

(declare-fun m!1326985 () Bool)

(assert (=> b!1437724 m!1326985))

(assert (=> b!1437724 m!1326985))

(assert (=> b!1437724 m!1326965))

(declare-fun m!1326987 () Bool)

(assert (=> b!1437724 m!1326987))

(declare-fun m!1326989 () Bool)

(assert (=> b!1437718 m!1326989))

(push 1)

