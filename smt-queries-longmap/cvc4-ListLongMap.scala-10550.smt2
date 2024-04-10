; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124442 () Bool)

(assert start!124442)

(declare-fun res!972199 () Bool)

(declare-fun e!811977 () Bool)

(assert (=> start!124442 (=> (not res!972199) (not e!811977))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124442 (= res!972199 (validMask!0 mask!2687))))

(assert (=> start!124442 e!811977))

(assert (=> start!124442 true))

(declare-datatypes ((array!97890 0))(
  ( (array!97891 (arr!47233 (Array (_ BitVec 32) (_ BitVec 64))) (size!47783 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97890)

(declare-fun array_inv!36261 (array!97890) Bool)

(assert (=> start!124442 (array_inv!36261 a!2862)))

(declare-fun b!1439770 () Bool)

(declare-fun res!972201 () Bool)

(assert (=> b!1439770 (=> (not res!972201) (not e!811977))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439770 (= res!972201 (and (= (size!47783 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47783 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47783 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439771 () Bool)

(declare-fun e!811979 () Bool)

(assert (=> b!1439771 (= e!811977 e!811979)))

(declare-fun res!972204 () Bool)

(assert (=> b!1439771 (=> (not res!972204) (not e!811979))))

(declare-datatypes ((SeekEntryResult!11485 0))(
  ( (MissingZero!11485 (index!48332 (_ BitVec 32))) (Found!11485 (index!48333 (_ BitVec 32))) (Intermediate!11485 (undefined!12297 Bool) (index!48334 (_ BitVec 32)) (x!130062 (_ BitVec 32))) (Undefined!11485) (MissingVacant!11485 (index!48335 (_ BitVec 32))) )
))
(declare-fun lt!632867 () SeekEntryResult!11485)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97890 (_ BitVec 32)) SeekEntryResult!11485)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439771 (= res!972204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47233 a!2862) j!93) mask!2687) (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632867))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439771 (= lt!632867 (Intermediate!11485 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439772 () Bool)

(declare-fun res!972202 () Bool)

(assert (=> b!1439772 (=> (not res!972202) (not e!811977))))

(declare-datatypes ((List!33734 0))(
  ( (Nil!33731) (Cons!33730 (h!35080 (_ BitVec 64)) (t!48428 List!33734)) )
))
(declare-fun arrayNoDuplicates!0 (array!97890 (_ BitVec 32) List!33734) Bool)

(assert (=> b!1439772 (= res!972202 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33731))))

(declare-fun b!1439773 () Bool)

(declare-fun res!972203 () Bool)

(assert (=> b!1439773 (=> (not res!972203) (not e!811977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439773 (= res!972203 (validKeyInArray!0 (select (arr!47233 a!2862) i!1006)))))

(declare-fun b!1439774 () Bool)

(assert (=> b!1439774 (= e!811979 false)))

(declare-fun lt!632868 () SeekEntryResult!11485)

(assert (=> b!1439774 (= lt!632868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97891 (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47783 a!2862)) mask!2687))))

(declare-fun b!1439775 () Bool)

(declare-fun res!972198 () Bool)

(assert (=> b!1439775 (=> (not res!972198) (not e!811977))))

(assert (=> b!1439775 (= res!972198 (validKeyInArray!0 (select (arr!47233 a!2862) j!93)))))

(declare-fun b!1439776 () Bool)

(declare-fun res!972200 () Bool)

(assert (=> b!1439776 (=> (not res!972200) (not e!811977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97890 (_ BitVec 32)) Bool)

(assert (=> b!1439776 (= res!972200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439777 () Bool)

(declare-fun res!972205 () Bool)

(assert (=> b!1439777 (=> (not res!972205) (not e!811979))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439777 (= res!972205 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632867))))

(declare-fun b!1439778 () Bool)

(declare-fun res!972197 () Bool)

(assert (=> b!1439778 (=> (not res!972197) (not e!811977))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439778 (= res!972197 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47783 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47783 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47783 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124442 res!972199) b!1439770))

(assert (= (and b!1439770 res!972201) b!1439773))

(assert (= (and b!1439773 res!972203) b!1439775))

(assert (= (and b!1439775 res!972198) b!1439776))

(assert (= (and b!1439776 res!972200) b!1439772))

(assert (= (and b!1439772 res!972202) b!1439778))

(assert (= (and b!1439778 res!972197) b!1439771))

(assert (= (and b!1439771 res!972204) b!1439777))

(assert (= (and b!1439777 res!972205) b!1439774))

(declare-fun m!1328885 () Bool)

(assert (=> start!124442 m!1328885))

(declare-fun m!1328887 () Bool)

(assert (=> start!124442 m!1328887))

(declare-fun m!1328889 () Bool)

(assert (=> b!1439773 m!1328889))

(assert (=> b!1439773 m!1328889))

(declare-fun m!1328891 () Bool)

(assert (=> b!1439773 m!1328891))

(declare-fun m!1328893 () Bool)

(assert (=> b!1439774 m!1328893))

(declare-fun m!1328895 () Bool)

(assert (=> b!1439774 m!1328895))

(assert (=> b!1439774 m!1328895))

(declare-fun m!1328897 () Bool)

(assert (=> b!1439774 m!1328897))

(assert (=> b!1439774 m!1328897))

(assert (=> b!1439774 m!1328895))

(declare-fun m!1328899 () Bool)

(assert (=> b!1439774 m!1328899))

(declare-fun m!1328901 () Bool)

(assert (=> b!1439775 m!1328901))

(assert (=> b!1439775 m!1328901))

(declare-fun m!1328903 () Bool)

(assert (=> b!1439775 m!1328903))

(assert (=> b!1439771 m!1328901))

(assert (=> b!1439771 m!1328901))

(declare-fun m!1328905 () Bool)

(assert (=> b!1439771 m!1328905))

(assert (=> b!1439771 m!1328905))

(assert (=> b!1439771 m!1328901))

(declare-fun m!1328907 () Bool)

(assert (=> b!1439771 m!1328907))

(assert (=> b!1439777 m!1328901))

(assert (=> b!1439777 m!1328901))

(declare-fun m!1328909 () Bool)

(assert (=> b!1439777 m!1328909))

(declare-fun m!1328911 () Bool)

(assert (=> b!1439772 m!1328911))

(assert (=> b!1439778 m!1328893))

(declare-fun m!1328913 () Bool)

(assert (=> b!1439778 m!1328913))

(declare-fun m!1328915 () Bool)

(assert (=> b!1439776 m!1328915))

(push 1)

(assert (not b!1439776))

(assert (not start!124442))

(assert (not b!1439774))

(assert (not b!1439777))

(assert (not b!1439772))

(assert (not b!1439773))

(assert (not b!1439771))

