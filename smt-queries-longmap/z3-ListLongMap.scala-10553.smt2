; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124674 () Bool)

(assert start!124674)

(declare-fun b!1441307 () Bool)

(declare-fun res!972913 () Bool)

(declare-fun e!812878 () Bool)

(assert (=> b!1441307 (=> (not res!972913) (not e!812878))))

(declare-datatypes ((array!98017 0))(
  ( (array!98018 (arr!47293 (Array (_ BitVec 32) (_ BitVec 64))) (size!47844 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98017)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98017 (_ BitVec 32)) Bool)

(assert (=> b!1441307 (= res!972913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441308 () Bool)

(declare-fun res!972908 () Bool)

(declare-fun e!812880 () Bool)

(assert (=> b!1441308 (=> (not res!972908) (not e!812880))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11442 0))(
  ( (MissingZero!11442 (index!48160 (_ BitVec 32))) (Found!11442 (index!48161 (_ BitVec 32))) (Intermediate!11442 (undefined!12254 Bool) (index!48162 (_ BitVec 32)) (x!130067 (_ BitVec 32))) (Undefined!11442) (MissingVacant!11442 (index!48163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98017 (_ BitVec 32)) SeekEntryResult!11442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441308 (= res!972908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98018 (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47844 a!2862)) mask!2687) (Intermediate!11442 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1441309 () Bool)

(declare-fun res!972909 () Bool)

(assert (=> b!1441309 (=> (not res!972909) (not e!812878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441309 (= res!972909 (validKeyInArray!0 (select (arr!47293 a!2862) j!93)))))

(declare-fun b!1441310 () Bool)

(declare-fun res!972910 () Bool)

(assert (=> b!1441310 (=> (not res!972910) (not e!812878))))

(assert (=> b!1441310 (= res!972910 (validKeyInArray!0 (select (arr!47293 a!2862) i!1006)))))

(declare-fun b!1441311 () Bool)

(assert (=> b!1441311 (= e!812878 e!812880)))

(declare-fun res!972912 () Bool)

(assert (=> b!1441311 (=> (not res!972912) (not e!812880))))

(declare-fun lt!633376 () SeekEntryResult!11442)

(assert (=> b!1441311 (= res!972912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47293 a!2862) j!93) mask!2687) (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633376))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441311 (= lt!633376 (Intermediate!11442 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441312 () Bool)

(declare-fun res!972916 () Bool)

(assert (=> b!1441312 (=> (not res!972916) (not e!812878))))

(declare-datatypes ((List!33781 0))(
  ( (Nil!33778) (Cons!33777 (h!35138 (_ BitVec 64)) (t!48467 List!33781)) )
))
(declare-fun arrayNoDuplicates!0 (array!98017 (_ BitVec 32) List!33781) Bool)

(assert (=> b!1441312 (= res!972916 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33778))))

(declare-fun b!1441313 () Bool)

(declare-fun res!972915 () Bool)

(assert (=> b!1441313 (=> (not res!972915) (not e!812878))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441313 (= res!972915 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47844 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47844 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47844 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441314 () Bool)

(declare-fun res!972911 () Bool)

(assert (=> b!1441314 (=> (not res!972911) (not e!812878))))

(assert (=> b!1441314 (= res!972911 (and (= (size!47844 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47844 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47844 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441315 () Bool)

(declare-fun res!972914 () Bool)

(assert (=> b!1441315 (=> (not res!972914) (not e!812880))))

(assert (=> b!1441315 (= res!972914 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633376))))

(declare-fun res!972917 () Bool)

(assert (=> start!124674 (=> (not res!972917) (not e!812878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124674 (= res!972917 (validMask!0 mask!2687))))

(assert (=> start!124674 e!812878))

(assert (=> start!124674 true))

(declare-fun array_inv!36574 (array!98017) Bool)

(assert (=> start!124674 (array_inv!36574 a!2862)))

(declare-fun b!1441306 () Bool)

(assert (=> b!1441306 (= e!812880 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (= (and start!124674 res!972917) b!1441314))

(assert (= (and b!1441314 res!972911) b!1441310))

(assert (= (and b!1441310 res!972910) b!1441309))

(assert (= (and b!1441309 res!972909) b!1441307))

(assert (= (and b!1441307 res!972913) b!1441312))

(assert (= (and b!1441312 res!972916) b!1441313))

(assert (= (and b!1441313 res!972915) b!1441311))

(assert (= (and b!1441311 res!972912) b!1441315))

(assert (= (and b!1441315 res!972914) b!1441308))

(assert (= (and b!1441308 res!972908) b!1441306))

(declare-fun m!1330555 () Bool)

(assert (=> b!1441310 m!1330555))

(assert (=> b!1441310 m!1330555))

(declare-fun m!1330557 () Bool)

(assert (=> b!1441310 m!1330557))

(declare-fun m!1330559 () Bool)

(assert (=> b!1441313 m!1330559))

(declare-fun m!1330561 () Bool)

(assert (=> b!1441313 m!1330561))

(declare-fun m!1330563 () Bool)

(assert (=> b!1441309 m!1330563))

(assert (=> b!1441309 m!1330563))

(declare-fun m!1330565 () Bool)

(assert (=> b!1441309 m!1330565))

(declare-fun m!1330567 () Bool)

(assert (=> b!1441312 m!1330567))

(assert (=> b!1441315 m!1330563))

(assert (=> b!1441315 m!1330563))

(declare-fun m!1330569 () Bool)

(assert (=> b!1441315 m!1330569))

(declare-fun m!1330571 () Bool)

(assert (=> b!1441307 m!1330571))

(assert (=> b!1441308 m!1330559))

(declare-fun m!1330573 () Bool)

(assert (=> b!1441308 m!1330573))

(assert (=> b!1441308 m!1330573))

(declare-fun m!1330575 () Bool)

(assert (=> b!1441308 m!1330575))

(assert (=> b!1441308 m!1330575))

(assert (=> b!1441308 m!1330573))

(declare-fun m!1330577 () Bool)

(assert (=> b!1441308 m!1330577))

(assert (=> b!1441311 m!1330563))

(assert (=> b!1441311 m!1330563))

(declare-fun m!1330579 () Bool)

(assert (=> b!1441311 m!1330579))

(assert (=> b!1441311 m!1330579))

(assert (=> b!1441311 m!1330563))

(declare-fun m!1330581 () Bool)

(assert (=> b!1441311 m!1330581))

(declare-fun m!1330583 () Bool)

(assert (=> start!124674 m!1330583))

(declare-fun m!1330585 () Bool)

(assert (=> start!124674 m!1330585))

(check-sat (not b!1441311) (not start!124674) (not b!1441310) (not b!1441312) (not b!1441308) (not b!1441315) (not b!1441307) (not b!1441309))
(check-sat)
