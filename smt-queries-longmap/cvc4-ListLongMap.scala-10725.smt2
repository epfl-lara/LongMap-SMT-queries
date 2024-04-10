; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125492 () Bool)

(assert start!125492)

(declare-fun b!1468156 () Bool)

(declare-fun res!996697 () Bool)

(declare-fun e!824487 () Bool)

(assert (=> b!1468156 (=> (not res!996697) (not e!824487))))

(declare-datatypes ((array!98940 0))(
  ( (array!98941 (arr!47758 (Array (_ BitVec 32) (_ BitVec 64))) (size!48308 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98940)

(declare-datatypes ((List!34259 0))(
  ( (Nil!34256) (Cons!34255 (h!35605 (_ BitVec 64)) (t!48953 List!34259)) )
))
(declare-fun arrayNoDuplicates!0 (array!98940 (_ BitVec 32) List!34259) Bool)

(assert (=> b!1468156 (= res!996697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34256))))

(declare-fun b!1468157 () Bool)

(declare-fun res!996696 () Bool)

(declare-fun e!824488 () Bool)

(assert (=> b!1468157 (=> (not res!996696) (not e!824488))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11998 0))(
  ( (MissingZero!11998 (index!50384 (_ BitVec 32))) (Found!11998 (index!50385 (_ BitVec 32))) (Intermediate!11998 (undefined!12810 Bool) (index!50386 (_ BitVec 32)) (x!131975 (_ BitVec 32))) (Undefined!11998) (MissingVacant!11998 (index!50387 (_ BitVec 32))) )
))
(declare-fun lt!642227 () SeekEntryResult!11998)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98940 (_ BitVec 32)) SeekEntryResult!11998)

(assert (=> b!1468157 (= res!996696 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642227))))

(declare-fun b!1468158 () Bool)

(declare-fun res!996695 () Bool)

(assert (=> b!1468158 (=> (not res!996695) (not e!824487))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468158 (= res!996695 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48308 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48308 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48308 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468159 () Bool)

(declare-fun res!996700 () Bool)

(assert (=> b!1468159 (=> (not res!996700) (not e!824487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98940 (_ BitVec 32)) Bool)

(assert (=> b!1468159 (= res!996700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996698 () Bool)

(assert (=> start!125492 (=> (not res!996698) (not e!824487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125492 (= res!996698 (validMask!0 mask!2687))))

(assert (=> start!125492 e!824487))

(assert (=> start!125492 true))

(declare-fun array_inv!36786 (array!98940) Bool)

(assert (=> start!125492 (array_inv!36786 a!2862)))

(declare-fun b!1468160 () Bool)

(declare-fun res!996702 () Bool)

(assert (=> b!1468160 (=> (not res!996702) (not e!824487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468160 (= res!996702 (validKeyInArray!0 (select (arr!47758 a!2862) i!1006)))))

(declare-fun b!1468161 () Bool)

(assert (=> b!1468161 (= e!824487 e!824488)))

(declare-fun res!996703 () Bool)

(assert (=> b!1468161 (=> (not res!996703) (not e!824488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468161 (= res!996703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47758 a!2862) j!93) mask!2687) (select (arr!47758 a!2862) j!93) a!2862 mask!2687) lt!642227))))

(assert (=> b!1468161 (= lt!642227 (Intermediate!11998 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468162 () Bool)

(declare-fun res!996701 () Bool)

(assert (=> b!1468162 (=> (not res!996701) (not e!824487))))

(assert (=> b!1468162 (= res!996701 (validKeyInArray!0 (select (arr!47758 a!2862) j!93)))))

(declare-fun b!1468163 () Bool)

(declare-fun res!996699 () Bool)

(assert (=> b!1468163 (=> (not res!996699) (not e!824487))))

(assert (=> b!1468163 (= res!996699 (and (= (size!48308 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48308 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48308 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468164 () Bool)

(assert (=> b!1468164 (= e!824488 false)))

(declare-fun lt!642228 () SeekEntryResult!11998)

(assert (=> b!1468164 (= lt!642228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98941 (store (arr!47758 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48308 a!2862)) mask!2687))))

(assert (= (and start!125492 res!996698) b!1468163))

(assert (= (and b!1468163 res!996699) b!1468160))

(assert (= (and b!1468160 res!996702) b!1468162))

(assert (= (and b!1468162 res!996701) b!1468159))

(assert (= (and b!1468159 res!996700) b!1468156))

(assert (= (and b!1468156 res!996697) b!1468158))

(assert (= (and b!1468158 res!996695) b!1468161))

(assert (= (and b!1468161 res!996703) b!1468157))

(assert (= (and b!1468157 res!996696) b!1468164))

(declare-fun m!1355165 () Bool)

(assert (=> b!1468158 m!1355165))

(declare-fun m!1355167 () Bool)

(assert (=> b!1468158 m!1355167))

(declare-fun m!1355169 () Bool)

(assert (=> b!1468156 m!1355169))

(declare-fun m!1355171 () Bool)

(assert (=> start!125492 m!1355171))

(declare-fun m!1355173 () Bool)

(assert (=> start!125492 m!1355173))

(declare-fun m!1355175 () Bool)

(assert (=> b!1468159 m!1355175))

(declare-fun m!1355177 () Bool)

(assert (=> b!1468160 m!1355177))

(assert (=> b!1468160 m!1355177))

(declare-fun m!1355179 () Bool)

(assert (=> b!1468160 m!1355179))

(assert (=> b!1468164 m!1355165))

(declare-fun m!1355181 () Bool)

(assert (=> b!1468164 m!1355181))

(assert (=> b!1468164 m!1355181))

(declare-fun m!1355183 () Bool)

(assert (=> b!1468164 m!1355183))

(assert (=> b!1468164 m!1355183))

(assert (=> b!1468164 m!1355181))

(declare-fun m!1355185 () Bool)

(assert (=> b!1468164 m!1355185))

(declare-fun m!1355187 () Bool)

(assert (=> b!1468162 m!1355187))

(assert (=> b!1468162 m!1355187))

(declare-fun m!1355189 () Bool)

(assert (=> b!1468162 m!1355189))

(assert (=> b!1468157 m!1355187))

(assert (=> b!1468157 m!1355187))

(declare-fun m!1355191 () Bool)

(assert (=> b!1468157 m!1355191))

(assert (=> b!1468161 m!1355187))

(assert (=> b!1468161 m!1355187))

(declare-fun m!1355193 () Bool)

(assert (=> b!1468161 m!1355193))

(assert (=> b!1468161 m!1355193))

(assert (=> b!1468161 m!1355187))

(declare-fun m!1355195 () Bool)

(assert (=> b!1468161 m!1355195))

(push 1)

