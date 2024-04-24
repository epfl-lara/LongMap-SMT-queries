; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126048 () Bool)

(assert start!126048)

(declare-fun b!1473513 () Bool)

(declare-fun res!1000159 () Bool)

(declare-fun e!827155 () Bool)

(assert (=> b!1473513 (=> (not res!1000159) (not e!827155))))

(declare-datatypes ((array!99220 0))(
  ( (array!99221 (arr!47890 (Array (_ BitVec 32) (_ BitVec 64))) (size!48441 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99220)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12027 0))(
  ( (MissingZero!12027 (index!50500 (_ BitVec 32))) (Found!12027 (index!50501 (_ BitVec 32))) (Intermediate!12027 (undefined!12839 Bool) (index!50502 (_ BitVec 32)) (x!132271 (_ BitVec 32))) (Undefined!12027) (MissingVacant!12027 (index!50503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12027)

(assert (=> b!1473513 (= res!1000159 (= (seekEntryOrOpen!0 (select (arr!47890 a!2862) j!93) a!2862 mask!2687) (Found!12027 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473514 () Bool)

(assert (=> b!1473514 (= e!827155 (or (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) (select (arr!47890 a!2862) j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1473515 () Bool)

(declare-fun e!827154 () Bool)

(declare-fun lt!644026 () array!99220)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644025 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12027)

(assert (=> b!1473515 (= e!827154 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644025 lt!644026 mask!2687) (seekEntryOrOpen!0 lt!644025 lt!644026 mask!2687)))))

(declare-fun b!1473516 () Bool)

(declare-fun e!827151 () Bool)

(declare-fun e!827156 () Bool)

(assert (=> b!1473516 (= e!827151 e!827156)))

(declare-fun res!1000153 () Bool)

(assert (=> b!1473516 (=> (not res!1000153) (not e!827156))))

(declare-fun lt!644022 () SeekEntryResult!12027)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473516 (= res!1000153 (= lt!644022 (Intermediate!12027 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99220 (_ BitVec 32)) SeekEntryResult!12027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473516 (= lt!644022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644025 mask!2687) lt!644025 lt!644026 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473516 (= lt!644025 (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473517 () Bool)

(declare-fun res!1000155 () Bool)

(assert (=> b!1473517 (=> (not res!1000155) (not e!827156))))

(assert (=> b!1473517 (= res!1000155 e!827154)))

(declare-fun c!136204 () Bool)

(assert (=> b!1473517 (= c!136204 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473518 () Bool)

(assert (=> b!1473518 (= e!827156 (not true))))

(assert (=> b!1473518 e!827155))

(declare-fun res!1000164 () Bool)

(assert (=> b!1473518 (=> (not res!1000164) (not e!827155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99220 (_ BitVec 32)) Bool)

(assert (=> b!1473518 (= res!1000164 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49427 0))(
  ( (Unit!49428) )
))
(declare-fun lt!644024 () Unit!49427)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49427)

(assert (=> b!1473518 (= lt!644024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473519 () Bool)

(assert (=> b!1473519 (= e!827154 (= lt!644022 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644025 lt!644026 mask!2687)))))

(declare-fun b!1473520 () Bool)

(declare-fun res!1000156 () Bool)

(declare-fun e!827153 () Bool)

(assert (=> b!1473520 (=> (not res!1000156) (not e!827153))))

(assert (=> b!1473520 (= res!1000156 (and (= (size!48441 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48441 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48441 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473521 () Bool)

(declare-fun res!1000152 () Bool)

(assert (=> b!1473521 (=> (not res!1000152) (not e!827153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473521 (= res!1000152 (validKeyInArray!0 (select (arr!47890 a!2862) i!1006)))))

(declare-fun b!1473522 () Bool)

(declare-fun res!1000162 () Bool)

(assert (=> b!1473522 (=> (not res!1000162) (not e!827156))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473522 (= res!1000162 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473523 () Bool)

(declare-fun res!1000165 () Bool)

(assert (=> b!1473523 (=> (not res!1000165) (not e!827153))))

(declare-datatypes ((List!34378 0))(
  ( (Nil!34375) (Cons!34374 (h!35744 (_ BitVec 64)) (t!49064 List!34378)) )
))
(declare-fun arrayNoDuplicates!0 (array!99220 (_ BitVec 32) List!34378) Bool)

(assert (=> b!1473523 (= res!1000165 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34375))))

(declare-fun b!1473524 () Bool)

(declare-fun res!1000157 () Bool)

(assert (=> b!1473524 (=> (not res!1000157) (not e!827153))))

(assert (=> b!1473524 (= res!1000157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473525 () Bool)

(declare-fun res!1000161 () Bool)

(assert (=> b!1473525 (=> (not res!1000161) (not e!827153))))

(assert (=> b!1473525 (= res!1000161 (validKeyInArray!0 (select (arr!47890 a!2862) j!93)))))

(declare-fun b!1473527 () Bool)

(declare-fun res!1000154 () Bool)

(assert (=> b!1473527 (=> (not res!1000154) (not e!827153))))

(assert (=> b!1473527 (= res!1000154 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48441 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48441 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48441 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473528 () Bool)

(declare-fun e!827157 () Bool)

(assert (=> b!1473528 (= e!827157 e!827151)))

(declare-fun res!1000166 () Bool)

(assert (=> b!1473528 (=> (not res!1000166) (not e!827151))))

(declare-fun lt!644023 () SeekEntryResult!12027)

(assert (=> b!1473528 (= res!1000166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644023))))

(assert (=> b!1473528 (= lt!644023 (Intermediate!12027 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473529 () Bool)

(assert (=> b!1473529 (= e!827153 e!827157)))

(declare-fun res!1000163 () Bool)

(assert (=> b!1473529 (=> (not res!1000163) (not e!827157))))

(assert (=> b!1473529 (= res!1000163 (= (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473529 (= lt!644026 (array!99221 (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48441 a!2862)))))

(declare-fun res!1000158 () Bool)

(assert (=> start!126048 (=> (not res!1000158) (not e!827153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126048 (= res!1000158 (validMask!0 mask!2687))))

(assert (=> start!126048 e!827153))

(assert (=> start!126048 true))

(declare-fun array_inv!37171 (array!99220) Bool)

(assert (=> start!126048 (array_inv!37171 a!2862)))

(declare-fun b!1473526 () Bool)

(declare-fun res!1000160 () Bool)

(assert (=> b!1473526 (=> (not res!1000160) (not e!827151))))

(assert (=> b!1473526 (= res!1000160 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644023))))

(assert (= (and start!126048 res!1000158) b!1473520))

(assert (= (and b!1473520 res!1000156) b!1473521))

(assert (= (and b!1473521 res!1000152) b!1473525))

(assert (= (and b!1473525 res!1000161) b!1473524))

(assert (= (and b!1473524 res!1000157) b!1473523))

(assert (= (and b!1473523 res!1000165) b!1473527))

(assert (= (and b!1473527 res!1000154) b!1473529))

(assert (= (and b!1473529 res!1000163) b!1473528))

(assert (= (and b!1473528 res!1000166) b!1473526))

(assert (= (and b!1473526 res!1000160) b!1473516))

(assert (= (and b!1473516 res!1000153) b!1473517))

(assert (= (and b!1473517 c!136204) b!1473519))

(assert (= (and b!1473517 (not c!136204)) b!1473515))

(assert (= (and b!1473517 res!1000155) b!1473522))

(assert (= (and b!1473522 res!1000162) b!1473518))

(assert (= (and b!1473518 res!1000164) b!1473513))

(assert (= (and b!1473513 res!1000159) b!1473514))

(declare-fun m!1360267 () Bool)

(assert (=> b!1473513 m!1360267))

(assert (=> b!1473513 m!1360267))

(declare-fun m!1360269 () Bool)

(assert (=> b!1473513 m!1360269))

(declare-fun m!1360271 () Bool)

(assert (=> start!126048 m!1360271))

(declare-fun m!1360273 () Bool)

(assert (=> start!126048 m!1360273))

(declare-fun m!1360275 () Bool)

(assert (=> b!1473516 m!1360275))

(assert (=> b!1473516 m!1360275))

(declare-fun m!1360277 () Bool)

(assert (=> b!1473516 m!1360277))

(declare-fun m!1360279 () Bool)

(assert (=> b!1473516 m!1360279))

(declare-fun m!1360281 () Bool)

(assert (=> b!1473516 m!1360281))

(assert (=> b!1473528 m!1360267))

(assert (=> b!1473528 m!1360267))

(declare-fun m!1360283 () Bool)

(assert (=> b!1473528 m!1360283))

(assert (=> b!1473528 m!1360283))

(assert (=> b!1473528 m!1360267))

(declare-fun m!1360285 () Bool)

(assert (=> b!1473528 m!1360285))

(assert (=> b!1473529 m!1360279))

(declare-fun m!1360287 () Bool)

(assert (=> b!1473529 m!1360287))

(declare-fun m!1360289 () Bool)

(assert (=> b!1473521 m!1360289))

(assert (=> b!1473521 m!1360289))

(declare-fun m!1360291 () Bool)

(assert (=> b!1473521 m!1360291))

(declare-fun m!1360293 () Bool)

(assert (=> b!1473524 m!1360293))

(assert (=> b!1473525 m!1360267))

(assert (=> b!1473525 m!1360267))

(declare-fun m!1360295 () Bool)

(assert (=> b!1473525 m!1360295))

(assert (=> b!1473526 m!1360267))

(assert (=> b!1473526 m!1360267))

(declare-fun m!1360297 () Bool)

(assert (=> b!1473526 m!1360297))

(declare-fun m!1360299 () Bool)

(assert (=> b!1473523 m!1360299))

(declare-fun m!1360301 () Bool)

(assert (=> b!1473515 m!1360301))

(declare-fun m!1360303 () Bool)

(assert (=> b!1473515 m!1360303))

(declare-fun m!1360305 () Bool)

(assert (=> b!1473518 m!1360305))

(declare-fun m!1360307 () Bool)

(assert (=> b!1473518 m!1360307))

(declare-fun m!1360309 () Bool)

(assert (=> b!1473519 m!1360309))

(declare-fun m!1360311 () Bool)

(assert (=> b!1473514 m!1360311))

(assert (=> b!1473514 m!1360267))

(check-sat (not b!1473526) (not b!1473516) (not b!1473519) (not b!1473518) (not b!1473515) (not b!1473521) (not start!126048) (not b!1473524) (not b!1473528) (not b!1473513) (not b!1473525) (not b!1473523))
(check-sat)
