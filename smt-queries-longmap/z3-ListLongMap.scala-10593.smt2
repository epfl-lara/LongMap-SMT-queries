; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124666 () Bool)

(assert start!124666)

(declare-fun b!1445009 () Bool)

(declare-fun res!977029 () Bool)

(declare-fun e!814029 () Bool)

(assert (=> b!1445009 (=> (not res!977029) (not e!814029))))

(declare-datatypes ((array!98092 0))(
  ( (array!98093 (arr!47335 (Array (_ BitVec 32) (_ BitVec 64))) (size!47887 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98092)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445009 (= res!977029 (validKeyInArray!0 (select (arr!47335 a!2862) i!1006)))))

(declare-fun res!977038 () Bool)

(assert (=> start!124666 (=> (not res!977038) (not e!814029))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124666 (= res!977038 (validMask!0 mask!2687))))

(assert (=> start!124666 e!814029))

(assert (=> start!124666 true))

(declare-fun array_inv!36568 (array!98092) Bool)

(assert (=> start!124666 (array_inv!36568 a!2862)))

(declare-fun b!1445010 () Bool)

(declare-fun e!814035 () Bool)

(assert (=> b!1445010 (= e!814029 e!814035)))

(declare-fun res!977037 () Bool)

(assert (=> b!1445010 (=> (not res!977037) (not e!814035))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445010 (= res!977037 (= (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634195 () array!98092)

(assert (=> b!1445010 (= lt!634195 (array!98093 (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47887 a!2862)))))

(declare-fun b!1445011 () Bool)

(declare-fun res!977033 () Bool)

(assert (=> b!1445011 (=> (not res!977033) (not e!814029))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445011 (= res!977033 (and (= (size!47887 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47887 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47887 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445012 () Bool)

(declare-fun res!977036 () Bool)

(declare-fun e!814030 () Bool)

(assert (=> b!1445012 (=> (not res!977036) (not e!814030))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445012 (= res!977036 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445013 () Bool)

(declare-fun res!977040 () Bool)

(declare-fun e!814033 () Bool)

(assert (=> b!1445013 (=> (not res!977040) (not e!814033))))

(declare-datatypes ((SeekEntryResult!11612 0))(
  ( (MissingZero!11612 (index!48840 (_ BitVec 32))) (Found!11612 (index!48841 (_ BitVec 32))) (Intermediate!11612 (undefined!12424 Bool) (index!48842 (_ BitVec 32)) (x!130528 (_ BitVec 32))) (Undefined!11612) (MissingVacant!11612 (index!48843 (_ BitVec 32))) )
))
(declare-fun lt!634193 () SeekEntryResult!11612)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11612)

(assert (=> b!1445013 (= res!977040 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!634193))))

(declare-fun b!1445014 () Bool)

(declare-fun res!977039 () Bool)

(assert (=> b!1445014 (=> (not res!977039) (not e!814029))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445014 (= res!977039 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47887 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47887 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47887 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445015 () Bool)

(declare-fun lt!634194 () (_ BitVec 64))

(declare-fun lt!634196 () SeekEntryResult!11612)

(declare-fun e!814031 () Bool)

(assert (=> b!1445015 (= e!814031 (= lt!634196 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634194 lt!634195 mask!2687)))))

(declare-fun b!1445016 () Bool)

(assert (=> b!1445016 (= e!814030 (not true))))

(declare-fun e!814032 () Bool)

(assert (=> b!1445016 e!814032))

(declare-fun res!977031 () Bool)

(assert (=> b!1445016 (=> (not res!977031) (not e!814032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98092 (_ BitVec 32)) Bool)

(assert (=> b!1445016 (= res!977031 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48561 0))(
  ( (Unit!48562) )
))
(declare-fun lt!634197 () Unit!48561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48561)

(assert (=> b!1445016 (= lt!634197 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445017 () Bool)

(assert (=> b!1445017 (= e!814035 e!814033)))

(declare-fun res!977034 () Bool)

(assert (=> b!1445017 (=> (not res!977034) (not e!814033))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445017 (= res!977034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47335 a!2862) j!93) mask!2687) (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!634193))))

(assert (=> b!1445017 (= lt!634193 (Intermediate!11612 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445018 () Bool)

(assert (=> b!1445018 (= e!814032 (or (= (select (arr!47335 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47335 a!2862) intermediateBeforeIndex!19) (select (arr!47335 a!2862) j!93))))))

(declare-fun b!1445019 () Bool)

(declare-fun res!977027 () Bool)

(assert (=> b!1445019 (=> (not res!977027) (not e!814029))))

(assert (=> b!1445019 (= res!977027 (validKeyInArray!0 (select (arr!47335 a!2862) j!93)))))

(declare-fun b!1445020 () Bool)

(declare-fun res!977028 () Bool)

(assert (=> b!1445020 (=> (not res!977028) (not e!814032))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11612)

(assert (=> b!1445020 (= res!977028 (= (seekEntryOrOpen!0 (select (arr!47335 a!2862) j!93) a!2862 mask!2687) (Found!11612 j!93)))))

(declare-fun b!1445021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11612)

(assert (=> b!1445021 (= e!814031 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634194 lt!634195 mask!2687) (seekEntryOrOpen!0 lt!634194 lt!634195 mask!2687)))))

(declare-fun b!1445022 () Bool)

(declare-fun res!977032 () Bool)

(assert (=> b!1445022 (=> (not res!977032) (not e!814029))))

(declare-datatypes ((List!33914 0))(
  ( (Nil!33911) (Cons!33910 (h!35260 (_ BitVec 64)) (t!48600 List!33914)) )
))
(declare-fun arrayNoDuplicates!0 (array!98092 (_ BitVec 32) List!33914) Bool)

(assert (=> b!1445022 (= res!977032 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33911))))

(declare-fun b!1445023 () Bool)

(assert (=> b!1445023 (= e!814033 e!814030)))

(declare-fun res!977035 () Bool)

(assert (=> b!1445023 (=> (not res!977035) (not e!814030))))

(assert (=> b!1445023 (= res!977035 (= lt!634196 (Intermediate!11612 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445023 (= lt!634196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634194 mask!2687) lt!634194 lt!634195 mask!2687))))

(assert (=> b!1445023 (= lt!634194 (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445024 () Bool)

(declare-fun res!977030 () Bool)

(assert (=> b!1445024 (=> (not res!977030) (not e!814030))))

(assert (=> b!1445024 (= res!977030 e!814031)))

(declare-fun c!133504 () Bool)

(assert (=> b!1445024 (= c!133504 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445025 () Bool)

(declare-fun res!977041 () Bool)

(assert (=> b!1445025 (=> (not res!977041) (not e!814029))))

(assert (=> b!1445025 (= res!977041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124666 res!977038) b!1445011))

(assert (= (and b!1445011 res!977033) b!1445009))

(assert (= (and b!1445009 res!977029) b!1445019))

(assert (= (and b!1445019 res!977027) b!1445025))

(assert (= (and b!1445025 res!977041) b!1445022))

(assert (= (and b!1445022 res!977032) b!1445014))

(assert (= (and b!1445014 res!977039) b!1445010))

(assert (= (and b!1445010 res!977037) b!1445017))

(assert (= (and b!1445017 res!977034) b!1445013))

(assert (= (and b!1445013 res!977040) b!1445023))

(assert (= (and b!1445023 res!977035) b!1445024))

(assert (= (and b!1445024 c!133504) b!1445015))

(assert (= (and b!1445024 (not c!133504)) b!1445021))

(assert (= (and b!1445024 res!977030) b!1445012))

(assert (= (and b!1445012 res!977036) b!1445016))

(assert (= (and b!1445016 res!977031) b!1445020))

(assert (= (and b!1445020 res!977028) b!1445018))

(declare-fun m!1333497 () Bool)

(assert (=> b!1445022 m!1333497))

(declare-fun m!1333499 () Bool)

(assert (=> b!1445021 m!1333499))

(declare-fun m!1333501 () Bool)

(assert (=> b!1445021 m!1333501))

(declare-fun m!1333503 () Bool)

(assert (=> b!1445023 m!1333503))

(assert (=> b!1445023 m!1333503))

(declare-fun m!1333505 () Bool)

(assert (=> b!1445023 m!1333505))

(declare-fun m!1333507 () Bool)

(assert (=> b!1445023 m!1333507))

(declare-fun m!1333509 () Bool)

(assert (=> b!1445023 m!1333509))

(assert (=> b!1445010 m!1333507))

(declare-fun m!1333511 () Bool)

(assert (=> b!1445010 m!1333511))

(declare-fun m!1333513 () Bool)

(assert (=> b!1445016 m!1333513))

(declare-fun m!1333515 () Bool)

(assert (=> b!1445016 m!1333515))

(declare-fun m!1333517 () Bool)

(assert (=> b!1445025 m!1333517))

(declare-fun m!1333519 () Bool)

(assert (=> b!1445013 m!1333519))

(assert (=> b!1445013 m!1333519))

(declare-fun m!1333521 () Bool)

(assert (=> b!1445013 m!1333521))

(declare-fun m!1333523 () Bool)

(assert (=> b!1445015 m!1333523))

(assert (=> b!1445020 m!1333519))

(assert (=> b!1445020 m!1333519))

(declare-fun m!1333525 () Bool)

(assert (=> b!1445020 m!1333525))

(declare-fun m!1333527 () Bool)

(assert (=> start!124666 m!1333527))

(declare-fun m!1333529 () Bool)

(assert (=> start!124666 m!1333529))

(assert (=> b!1445019 m!1333519))

(assert (=> b!1445019 m!1333519))

(declare-fun m!1333531 () Bool)

(assert (=> b!1445019 m!1333531))

(assert (=> b!1445017 m!1333519))

(assert (=> b!1445017 m!1333519))

(declare-fun m!1333533 () Bool)

(assert (=> b!1445017 m!1333533))

(assert (=> b!1445017 m!1333533))

(assert (=> b!1445017 m!1333519))

(declare-fun m!1333535 () Bool)

(assert (=> b!1445017 m!1333535))

(declare-fun m!1333537 () Bool)

(assert (=> b!1445009 m!1333537))

(assert (=> b!1445009 m!1333537))

(declare-fun m!1333539 () Bool)

(assert (=> b!1445009 m!1333539))

(declare-fun m!1333541 () Bool)

(assert (=> b!1445018 m!1333541))

(assert (=> b!1445018 m!1333519))

(check-sat (not b!1445016) (not b!1445015) (not b!1445021) (not b!1445013) (not b!1445023) (not start!124666) (not b!1445019) (not b!1445009) (not b!1445025) (not b!1445020) (not b!1445017) (not b!1445022))
(check-sat)
