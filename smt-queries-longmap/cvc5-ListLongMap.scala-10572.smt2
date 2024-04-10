; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124570 () Bool)

(assert start!124570)

(declare-fun e!812779 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633413 () (_ BitVec 64))

(declare-fun b!1441942 () Bool)

(declare-datatypes ((array!98018 0))(
  ( (array!98019 (arr!47297 (Array (_ BitVec 32) (_ BitVec 64))) (size!47847 (_ BitVec 32))) )
))
(declare-fun lt!633412 () array!98018)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11549 0))(
  ( (MissingZero!11549 (index!48588 (_ BitVec 32))) (Found!11549 (index!48589 (_ BitVec 32))) (Intermediate!11549 (undefined!12361 Bool) (index!48590 (_ BitVec 32)) (x!130302 (_ BitVec 32))) (Undefined!11549) (MissingVacant!11549 (index!48591 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98018 (_ BitVec 32)) SeekEntryResult!11549)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98018 (_ BitVec 32)) SeekEntryResult!11549)

(assert (=> b!1441942 (= e!812779 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633413 lt!633412 mask!2687) (seekEntryOrOpen!0 lt!633413 lt!633412 mask!2687)))))

(declare-fun b!1441943 () Bool)

(declare-fun res!974226 () Bool)

(declare-fun e!812780 () Bool)

(assert (=> b!1441943 (=> (not res!974226) (not e!812780))))

(declare-fun a!2862 () array!98018)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441943 (= res!974226 (validKeyInArray!0 (select (arr!47297 a!2862) i!1006)))))

(declare-fun b!1441944 () Bool)

(declare-fun e!812775 () Bool)

(declare-fun e!812776 () Bool)

(assert (=> b!1441944 (= e!812775 e!812776)))

(declare-fun res!974223 () Bool)

(assert (=> b!1441944 (=> (not res!974223) (not e!812776))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!633410 () SeekEntryResult!11549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98018 (_ BitVec 32)) SeekEntryResult!11549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441944 (= res!974223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47297 a!2862) j!93) mask!2687) (select (arr!47297 a!2862) j!93) a!2862 mask!2687) lt!633410))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441944 (= lt!633410 (Intermediate!11549 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441945 () Bool)

(declare-fun res!974229 () Bool)

(assert (=> b!1441945 (=> (not res!974229) (not e!812780))))

(assert (=> b!1441945 (= res!974229 (and (= (size!47847 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47847 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47847 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!974225 () Bool)

(assert (=> start!124570 (=> (not res!974225) (not e!812780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124570 (= res!974225 (validMask!0 mask!2687))))

(assert (=> start!124570 e!812780))

(assert (=> start!124570 true))

(declare-fun array_inv!36325 (array!98018) Bool)

(assert (=> start!124570 (array_inv!36325 a!2862)))

(declare-fun b!1441946 () Bool)

(declare-fun res!974230 () Bool)

(assert (=> b!1441946 (=> (not res!974230) (not e!812776))))

(assert (=> b!1441946 (= res!974230 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47297 a!2862) j!93) a!2862 mask!2687) lt!633410))))

(declare-fun b!1441947 () Bool)

(declare-fun res!974224 () Bool)

(declare-fun e!812778 () Bool)

(assert (=> b!1441947 (=> (not res!974224) (not e!812778))))

(assert (=> b!1441947 (= res!974224 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441948 () Bool)

(declare-fun res!974221 () Bool)

(assert (=> b!1441948 (=> (not res!974221) (not e!812780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98018 (_ BitVec 32)) Bool)

(assert (=> b!1441948 (= res!974221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441949 () Bool)

(declare-fun res!974233 () Bool)

(assert (=> b!1441949 (=> (not res!974233) (not e!812780))))

(declare-datatypes ((List!33798 0))(
  ( (Nil!33795) (Cons!33794 (h!35144 (_ BitVec 64)) (t!48492 List!33798)) )
))
(declare-fun arrayNoDuplicates!0 (array!98018 (_ BitVec 32) List!33798) Bool)

(assert (=> b!1441949 (= res!974233 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33795))))

(declare-fun b!1441950 () Bool)

(assert (=> b!1441950 (= e!812778 (not true))))

(assert (=> b!1441950 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48594 0))(
  ( (Unit!48595) )
))
(declare-fun lt!633411 () Unit!48594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48594)

(assert (=> b!1441950 (= lt!633411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441951 () Bool)

(declare-fun lt!633414 () SeekEntryResult!11549)

(assert (=> b!1441951 (= e!812779 (= lt!633414 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633413 lt!633412 mask!2687)))))

(declare-fun b!1441952 () Bool)

(assert (=> b!1441952 (= e!812780 e!812775)))

(declare-fun res!974231 () Bool)

(assert (=> b!1441952 (=> (not res!974231) (not e!812775))))

(assert (=> b!1441952 (= res!974231 (= (select (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441952 (= lt!633412 (array!98019 (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47847 a!2862)))))

(declare-fun b!1441953 () Bool)

(assert (=> b!1441953 (= e!812776 e!812778)))

(declare-fun res!974227 () Bool)

(assert (=> b!1441953 (=> (not res!974227) (not e!812778))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441953 (= res!974227 (= lt!633414 (Intermediate!11549 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441953 (= lt!633414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633413 mask!2687) lt!633413 lt!633412 mask!2687))))

(assert (=> b!1441953 (= lt!633413 (select (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441954 () Bool)

(declare-fun res!974232 () Bool)

(assert (=> b!1441954 (=> (not res!974232) (not e!812778))))

(assert (=> b!1441954 (= res!974232 e!812779)))

(declare-fun c!133371 () Bool)

(assert (=> b!1441954 (= c!133371 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441955 () Bool)

(declare-fun res!974222 () Bool)

(assert (=> b!1441955 (=> (not res!974222) (not e!812780))))

(assert (=> b!1441955 (= res!974222 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47847 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47847 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47847 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441956 () Bool)

(declare-fun res!974228 () Bool)

(assert (=> b!1441956 (=> (not res!974228) (not e!812780))))

(assert (=> b!1441956 (= res!974228 (validKeyInArray!0 (select (arr!47297 a!2862) j!93)))))

(assert (= (and start!124570 res!974225) b!1441945))

(assert (= (and b!1441945 res!974229) b!1441943))

(assert (= (and b!1441943 res!974226) b!1441956))

(assert (= (and b!1441956 res!974228) b!1441948))

(assert (= (and b!1441948 res!974221) b!1441949))

(assert (= (and b!1441949 res!974233) b!1441955))

(assert (= (and b!1441955 res!974222) b!1441952))

(assert (= (and b!1441952 res!974231) b!1441944))

(assert (= (and b!1441944 res!974223) b!1441946))

(assert (= (and b!1441946 res!974230) b!1441953))

(assert (= (and b!1441953 res!974227) b!1441954))

(assert (= (and b!1441954 c!133371) b!1441951))

(assert (= (and b!1441954 (not c!133371)) b!1441942))

(assert (= (and b!1441954 res!974232) b!1441947))

(assert (= (and b!1441947 res!974224) b!1441950))

(declare-fun m!1331131 () Bool)

(assert (=> b!1441953 m!1331131))

(assert (=> b!1441953 m!1331131))

(declare-fun m!1331133 () Bool)

(assert (=> b!1441953 m!1331133))

(declare-fun m!1331135 () Bool)

(assert (=> b!1441953 m!1331135))

(declare-fun m!1331137 () Bool)

(assert (=> b!1441953 m!1331137))

(declare-fun m!1331139 () Bool)

(assert (=> b!1441956 m!1331139))

(assert (=> b!1441956 m!1331139))

(declare-fun m!1331141 () Bool)

(assert (=> b!1441956 m!1331141))

(declare-fun m!1331143 () Bool)

(assert (=> b!1441949 m!1331143))

(assert (=> b!1441944 m!1331139))

(assert (=> b!1441944 m!1331139))

(declare-fun m!1331145 () Bool)

(assert (=> b!1441944 m!1331145))

(assert (=> b!1441944 m!1331145))

(assert (=> b!1441944 m!1331139))

(declare-fun m!1331147 () Bool)

(assert (=> b!1441944 m!1331147))

(declare-fun m!1331149 () Bool)

(assert (=> start!124570 m!1331149))

(declare-fun m!1331151 () Bool)

(assert (=> start!124570 m!1331151))

(declare-fun m!1331153 () Bool)

(assert (=> b!1441950 m!1331153))

(declare-fun m!1331155 () Bool)

(assert (=> b!1441950 m!1331155))

(declare-fun m!1331157 () Bool)

(assert (=> b!1441948 m!1331157))

(declare-fun m!1331159 () Bool)

(assert (=> b!1441942 m!1331159))

(declare-fun m!1331161 () Bool)

(assert (=> b!1441942 m!1331161))

(declare-fun m!1331163 () Bool)

(assert (=> b!1441951 m!1331163))

(assert (=> b!1441946 m!1331139))

(assert (=> b!1441946 m!1331139))

(declare-fun m!1331165 () Bool)

(assert (=> b!1441946 m!1331165))

(declare-fun m!1331167 () Bool)

(assert (=> b!1441943 m!1331167))

(assert (=> b!1441943 m!1331167))

(declare-fun m!1331169 () Bool)

(assert (=> b!1441943 m!1331169))

(assert (=> b!1441952 m!1331135))

(declare-fun m!1331171 () Bool)

(assert (=> b!1441952 m!1331171))

(push 1)

