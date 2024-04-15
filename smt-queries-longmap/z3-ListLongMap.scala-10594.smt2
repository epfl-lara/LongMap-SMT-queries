; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124672 () Bool)

(assert start!124672)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1445162 () Bool)

(declare-fun e!814096 () Bool)

(declare-datatypes ((array!98098 0))(
  ( (array!98099 (arr!47338 (Array (_ BitVec 32) (_ BitVec 64))) (size!47890 (_ BitVec 32))) )
))
(declare-fun lt!634241 () array!98098)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634242 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11615 0))(
  ( (MissingZero!11615 (index!48852 (_ BitVec 32))) (Found!11615 (index!48853 (_ BitVec 32))) (Intermediate!11615 (undefined!12427 Bool) (index!48854 (_ BitVec 32)) (x!130539 (_ BitVec 32))) (Undefined!11615) (MissingVacant!11615 (index!48855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11615)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11615)

(assert (=> b!1445162 (= e!814096 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634242 lt!634241 mask!2687) (seekEntryOrOpen!0 lt!634242 lt!634241 mask!2687)))))

(declare-fun b!1445163 () Bool)

(declare-fun e!814092 () Bool)

(declare-fun e!814098 () Bool)

(assert (=> b!1445163 (= e!814092 e!814098)))

(declare-fun res!977170 () Bool)

(assert (=> b!1445163 (=> (not res!977170) (not e!814098))))

(declare-fun lt!634239 () SeekEntryResult!11615)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445163 (= res!977170 (= lt!634239 (Intermediate!11615 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98098 (_ BitVec 32)) SeekEntryResult!11615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445163 (= lt!634239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634242 mask!2687) lt!634242 lt!634241 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98098)

(assert (=> b!1445163 (= lt!634242 (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!977171 () Bool)

(declare-fun e!814095 () Bool)

(assert (=> start!124672 (=> (not res!977171) (not e!814095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124672 (= res!977171 (validMask!0 mask!2687))))

(assert (=> start!124672 e!814095))

(assert (=> start!124672 true))

(declare-fun array_inv!36571 (array!98098) Bool)

(assert (=> start!124672 (array_inv!36571 a!2862)))

(declare-fun b!1445164 () Bool)

(assert (=> b!1445164 (= e!814098 (not (or (and (= (select (arr!47338 a!2862) index!646) (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47338 a!2862) index!646) (select (arr!47338 a!2862) j!93))) (not (= (select (arr!47338 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!814097 () Bool)

(assert (=> b!1445164 e!814097))

(declare-fun res!977162 () Bool)

(assert (=> b!1445164 (=> (not res!977162) (not e!814097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98098 (_ BitVec 32)) Bool)

(assert (=> b!1445164 (= res!977162 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48567 0))(
  ( (Unit!48568) )
))
(declare-fun lt!634238 () Unit!48567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48567)

(assert (=> b!1445164 (= lt!634238 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445165 () Bool)

(declare-fun e!814094 () Bool)

(assert (=> b!1445165 (= e!814095 e!814094)))

(declare-fun res!977173 () Bool)

(assert (=> b!1445165 (=> (not res!977173) (not e!814094))))

(assert (=> b!1445165 (= res!977173 (= (select (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445165 (= lt!634241 (array!98099 (store (arr!47338 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47890 a!2862)))))

(declare-fun b!1445166 () Bool)

(declare-fun res!977164 () Bool)

(assert (=> b!1445166 (=> (not res!977164) (not e!814098))))

(assert (=> b!1445166 (= res!977164 e!814096)))

(declare-fun c!133513 () Bool)

(assert (=> b!1445166 (= c!133513 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445167 () Bool)

(assert (=> b!1445167 (= e!814094 e!814092)))

(declare-fun res!977163 () Bool)

(assert (=> b!1445167 (=> (not res!977163) (not e!814092))))

(declare-fun lt!634240 () SeekEntryResult!11615)

(assert (=> b!1445167 (= res!977163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47338 a!2862) j!93) mask!2687) (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!634240))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445167 (= lt!634240 (Intermediate!11615 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445168 () Bool)

(declare-fun res!977172 () Bool)

(assert (=> b!1445168 (=> (not res!977172) (not e!814095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445168 (= res!977172 (validKeyInArray!0 (select (arr!47338 a!2862) i!1006)))))

(declare-fun b!1445169 () Bool)

(assert (=> b!1445169 (= e!814096 (= lt!634239 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634242 lt!634241 mask!2687)))))

(declare-fun b!1445170 () Bool)

(declare-fun res!977168 () Bool)

(assert (=> b!1445170 (=> (not res!977168) (not e!814095))))

(assert (=> b!1445170 (= res!977168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445171 () Bool)

(declare-fun res!977165 () Bool)

(assert (=> b!1445171 (=> (not res!977165) (not e!814098))))

(assert (=> b!1445171 (= res!977165 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445172 () Bool)

(declare-fun res!977175 () Bool)

(assert (=> b!1445172 (=> (not res!977175) (not e!814092))))

(assert (=> b!1445172 (= res!977175 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47338 a!2862) j!93) a!2862 mask!2687) lt!634240))))

(declare-fun b!1445173 () Bool)

(declare-fun res!977166 () Bool)

(assert (=> b!1445173 (=> (not res!977166) (not e!814095))))

(assert (=> b!1445173 (= res!977166 (validKeyInArray!0 (select (arr!47338 a!2862) j!93)))))

(declare-fun b!1445174 () Bool)

(declare-fun res!977174 () Bool)

(assert (=> b!1445174 (=> (not res!977174) (not e!814097))))

(assert (=> b!1445174 (= res!977174 (= (seekEntryOrOpen!0 (select (arr!47338 a!2862) j!93) a!2862 mask!2687) (Found!11615 j!93)))))

(declare-fun b!1445175 () Bool)

(declare-fun res!977176 () Bool)

(assert (=> b!1445175 (=> (not res!977176) (not e!814095))))

(declare-datatypes ((List!33917 0))(
  ( (Nil!33914) (Cons!33913 (h!35263 (_ BitVec 64)) (t!48603 List!33917)) )
))
(declare-fun arrayNoDuplicates!0 (array!98098 (_ BitVec 32) List!33917) Bool)

(assert (=> b!1445175 (= res!977176 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33914))))

(declare-fun b!1445176 () Bool)

(assert (=> b!1445176 (= e!814097 (or (= (select (arr!47338 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47338 a!2862) intermediateBeforeIndex!19) (select (arr!47338 a!2862) j!93))))))

(declare-fun b!1445177 () Bool)

(declare-fun res!977167 () Bool)

(assert (=> b!1445177 (=> (not res!977167) (not e!814095))))

(assert (=> b!1445177 (= res!977167 (and (= (size!47890 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47890 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47890 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445178 () Bool)

(declare-fun res!977169 () Bool)

(assert (=> b!1445178 (=> (not res!977169) (not e!814095))))

(assert (=> b!1445178 (= res!977169 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47890 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47890 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47890 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124672 res!977171) b!1445177))

(assert (= (and b!1445177 res!977167) b!1445168))

(assert (= (and b!1445168 res!977172) b!1445173))

(assert (= (and b!1445173 res!977166) b!1445170))

(assert (= (and b!1445170 res!977168) b!1445175))

(assert (= (and b!1445175 res!977176) b!1445178))

(assert (= (and b!1445178 res!977169) b!1445165))

(assert (= (and b!1445165 res!977173) b!1445167))

(assert (= (and b!1445167 res!977163) b!1445172))

(assert (= (and b!1445172 res!977175) b!1445163))

(assert (= (and b!1445163 res!977170) b!1445166))

(assert (= (and b!1445166 c!133513) b!1445169))

(assert (= (and b!1445166 (not c!133513)) b!1445162))

(assert (= (and b!1445166 res!977164) b!1445171))

(assert (= (and b!1445171 res!977165) b!1445164))

(assert (= (and b!1445164 res!977162) b!1445174))

(assert (= (and b!1445174 res!977174) b!1445176))

(declare-fun m!1333635 () Bool)

(assert (=> start!124672 m!1333635))

(declare-fun m!1333637 () Bool)

(assert (=> start!124672 m!1333637))

(declare-fun m!1333639 () Bool)

(assert (=> b!1445164 m!1333639))

(declare-fun m!1333641 () Bool)

(assert (=> b!1445164 m!1333641))

(declare-fun m!1333643 () Bool)

(assert (=> b!1445164 m!1333643))

(declare-fun m!1333645 () Bool)

(assert (=> b!1445164 m!1333645))

(declare-fun m!1333647 () Bool)

(assert (=> b!1445164 m!1333647))

(declare-fun m!1333649 () Bool)

(assert (=> b!1445164 m!1333649))

(declare-fun m!1333651 () Bool)

(assert (=> b!1445170 m!1333651))

(assert (=> b!1445167 m!1333649))

(assert (=> b!1445167 m!1333649))

(declare-fun m!1333653 () Bool)

(assert (=> b!1445167 m!1333653))

(assert (=> b!1445167 m!1333653))

(assert (=> b!1445167 m!1333649))

(declare-fun m!1333655 () Bool)

(assert (=> b!1445167 m!1333655))

(assert (=> b!1445173 m!1333649))

(assert (=> b!1445173 m!1333649))

(declare-fun m!1333657 () Bool)

(assert (=> b!1445173 m!1333657))

(assert (=> b!1445172 m!1333649))

(assert (=> b!1445172 m!1333649))

(declare-fun m!1333659 () Bool)

(assert (=> b!1445172 m!1333659))

(assert (=> b!1445165 m!1333641))

(declare-fun m!1333661 () Bool)

(assert (=> b!1445165 m!1333661))

(declare-fun m!1333663 () Bool)

(assert (=> b!1445175 m!1333663))

(declare-fun m!1333665 () Bool)

(assert (=> b!1445176 m!1333665))

(assert (=> b!1445176 m!1333649))

(declare-fun m!1333667 () Bool)

(assert (=> b!1445163 m!1333667))

(assert (=> b!1445163 m!1333667))

(declare-fun m!1333669 () Bool)

(assert (=> b!1445163 m!1333669))

(assert (=> b!1445163 m!1333641))

(declare-fun m!1333671 () Bool)

(assert (=> b!1445163 m!1333671))

(declare-fun m!1333673 () Bool)

(assert (=> b!1445169 m!1333673))

(declare-fun m!1333675 () Bool)

(assert (=> b!1445168 m!1333675))

(assert (=> b!1445168 m!1333675))

(declare-fun m!1333677 () Bool)

(assert (=> b!1445168 m!1333677))

(assert (=> b!1445174 m!1333649))

(assert (=> b!1445174 m!1333649))

(declare-fun m!1333679 () Bool)

(assert (=> b!1445174 m!1333679))

(declare-fun m!1333681 () Bool)

(assert (=> b!1445162 m!1333681))

(declare-fun m!1333683 () Bool)

(assert (=> b!1445162 m!1333683))

(check-sat (not start!124672) (not b!1445175) (not b!1445163) (not b!1445169) (not b!1445172) (not b!1445167) (not b!1445162) (not b!1445174) (not b!1445168) (not b!1445173) (not b!1445170) (not b!1445164))
(check-sat)
