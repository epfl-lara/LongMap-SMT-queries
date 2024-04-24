; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124698 () Bool)

(assert start!124698)

(declare-fun b!1441648 () Bool)

(declare-fun res!973251 () Bool)

(declare-fun e!812988 () Bool)

(assert (=> b!1441648 (=> (not res!973251) (not e!812988))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98041 0))(
  ( (array!98042 (arr!47305 (Array (_ BitVec 32) (_ BitVec 64))) (size!47856 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98041)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11454 0))(
  ( (MissingZero!11454 (index!48208 (_ BitVec 32))) (Found!11454 (index!48209 (_ BitVec 32))) (Intermediate!11454 (undefined!12266 Bool) (index!48210 (_ BitVec 32)) (x!130111 (_ BitVec 32))) (Undefined!11454) (MissingVacant!11454 (index!48211 (_ BitVec 32))) )
))
(declare-fun lt!633430 () SeekEntryResult!11454)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98041 (_ BitVec 32)) SeekEntryResult!11454)

(assert (=> b!1441648 (= res!973251 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633430))))

(declare-fun b!1441649 () Bool)

(declare-fun res!973255 () Bool)

(declare-fun e!812987 () Bool)

(assert (=> b!1441649 (=> (not res!973255) (not e!812987))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441649 (= res!973255 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47856 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47856 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47856 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441650 () Bool)

(declare-fun res!973252 () Bool)

(assert (=> b!1441650 (=> (not res!973252) (not e!812987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441650 (= res!973252 (validKeyInArray!0 (select (arr!47305 a!2862) i!1006)))))

(declare-fun b!1441651 () Bool)

(declare-fun res!973257 () Bool)

(assert (=> b!1441651 (=> (not res!973257) (not e!812987))))

(assert (=> b!1441651 (= res!973257 (and (= (size!47856 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47856 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47856 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441652 () Bool)

(declare-fun res!973250 () Bool)

(assert (=> b!1441652 (=> (not res!973250) (not e!812987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98041 (_ BitVec 32)) Bool)

(assert (=> b!1441652 (= res!973250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441653 () Bool)

(declare-fun res!973254 () Bool)

(assert (=> b!1441653 (=> (not res!973254) (not e!812988))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441653 (= res!973254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98042 (store (arr!47305 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47856 a!2862)) mask!2687) (Intermediate!11454 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1441654 () Bool)

(assert (=> b!1441654 (= e!812987 e!812988)))

(declare-fun res!973256 () Bool)

(assert (=> b!1441654 (=> (not res!973256) (not e!812988))))

(assert (=> b!1441654 (= res!973256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47305 a!2862) j!93) mask!2687) (select (arr!47305 a!2862) j!93) a!2862 mask!2687) lt!633430))))

(assert (=> b!1441654 (= lt!633430 (Intermediate!11454 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441655 () Bool)

(declare-fun res!973253 () Bool)

(assert (=> b!1441655 (=> (not res!973253) (not e!812987))))

(assert (=> b!1441655 (= res!973253 (validKeyInArray!0 (select (arr!47305 a!2862) j!93)))))

(declare-fun res!973258 () Bool)

(assert (=> start!124698 (=> (not res!973258) (not e!812987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124698 (= res!973258 (validMask!0 mask!2687))))

(assert (=> start!124698 e!812987))

(assert (=> start!124698 true))

(declare-fun array_inv!36586 (array!98041) Bool)

(assert (=> start!124698 (array_inv!36586 a!2862)))

(declare-fun b!1441656 () Bool)

(declare-fun res!973259 () Bool)

(assert (=> b!1441656 (=> (not res!973259) (not e!812987))))

(declare-datatypes ((List!33793 0))(
  ( (Nil!33790) (Cons!33789 (h!35150 (_ BitVec 64)) (t!48479 List!33793)) )
))
(declare-fun arrayNoDuplicates!0 (array!98041 (_ BitVec 32) List!33793) Bool)

(assert (=> b!1441656 (= res!973259 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33790))))

(declare-fun b!1441657 () Bool)

(assert (=> b!1441657 (= e!812988 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (= (and start!124698 res!973258) b!1441651))

(assert (= (and b!1441651 res!973257) b!1441650))

(assert (= (and b!1441650 res!973252) b!1441655))

(assert (= (and b!1441655 res!973253) b!1441652))

(assert (= (and b!1441652 res!973250) b!1441656))

(assert (= (and b!1441656 res!973259) b!1441649))

(assert (= (and b!1441649 res!973255) b!1441654))

(assert (= (and b!1441654 res!973256) b!1441648))

(assert (= (and b!1441648 res!973251) b!1441653))

(assert (= (and b!1441653 res!973254) b!1441657))

(declare-fun m!1330939 () Bool)

(assert (=> b!1441650 m!1330939))

(assert (=> b!1441650 m!1330939))

(declare-fun m!1330941 () Bool)

(assert (=> b!1441650 m!1330941))

(declare-fun m!1330943 () Bool)

(assert (=> start!124698 m!1330943))

(declare-fun m!1330945 () Bool)

(assert (=> start!124698 m!1330945))

(declare-fun m!1330947 () Bool)

(assert (=> b!1441652 m!1330947))

(declare-fun m!1330949 () Bool)

(assert (=> b!1441648 m!1330949))

(assert (=> b!1441648 m!1330949))

(declare-fun m!1330951 () Bool)

(assert (=> b!1441648 m!1330951))

(declare-fun m!1330953 () Bool)

(assert (=> b!1441653 m!1330953))

(declare-fun m!1330955 () Bool)

(assert (=> b!1441653 m!1330955))

(assert (=> b!1441653 m!1330955))

(declare-fun m!1330957 () Bool)

(assert (=> b!1441653 m!1330957))

(assert (=> b!1441653 m!1330957))

(assert (=> b!1441653 m!1330955))

(declare-fun m!1330959 () Bool)

(assert (=> b!1441653 m!1330959))

(declare-fun m!1330961 () Bool)

(assert (=> b!1441656 m!1330961))

(assert (=> b!1441654 m!1330949))

(assert (=> b!1441654 m!1330949))

(declare-fun m!1330963 () Bool)

(assert (=> b!1441654 m!1330963))

(assert (=> b!1441654 m!1330963))

(assert (=> b!1441654 m!1330949))

(declare-fun m!1330965 () Bool)

(assert (=> b!1441654 m!1330965))

(assert (=> b!1441649 m!1330953))

(declare-fun m!1330967 () Bool)

(assert (=> b!1441649 m!1330967))

(assert (=> b!1441655 m!1330949))

(assert (=> b!1441655 m!1330949))

(declare-fun m!1330969 () Bool)

(assert (=> b!1441655 m!1330969))

(check-sat (not b!1441656) (not b!1441654) (not b!1441652) (not b!1441653) (not b!1441655) (not start!124698) (not b!1441650) (not b!1441648))
(check-sat)
