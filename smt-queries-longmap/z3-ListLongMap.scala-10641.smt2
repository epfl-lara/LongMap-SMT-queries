; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125202 () Bool)

(assert start!125202)

(declare-fun b!1454493 () Bool)

(declare-fun res!984714 () Bool)

(declare-fun e!818793 () Bool)

(assert (=> b!1454493 (=> (not res!984714) (not e!818793))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98545 0))(
  ( (array!98546 (arr!47557 (Array (_ BitVec 32) (_ BitVec 64))) (size!48108 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98545)

(assert (=> b!1454493 (= res!984714 (and (= (size!48108 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48108 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48108 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454494 () Bool)

(declare-fun e!818788 () Bool)

(assert (=> b!1454494 (= e!818793 e!818788)))

(declare-fun res!984719 () Bool)

(assert (=> b!1454494 (=> (not res!984719) (not e!818788))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454494 (= res!984719 (= (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637635 () array!98545)

(assert (=> b!1454494 (= lt!637635 (array!98546 (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48108 a!2862)))))

(declare-fun b!1454495 () Bool)

(declare-fun res!984710 () Bool)

(assert (=> b!1454495 (=> (not res!984710) (not e!818793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454495 (= res!984710 (validKeyInArray!0 (select (arr!47557 a!2862) j!93)))))

(declare-fun b!1454496 () Bool)

(declare-fun res!984718 () Bool)

(assert (=> b!1454496 (=> (not res!984718) (not e!818793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98545 (_ BitVec 32)) Bool)

(assert (=> b!1454496 (= res!984718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1454497 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11706 0))(
  ( (MissingZero!11706 (index!49216 (_ BitVec 32))) (Found!11706 (index!49217 (_ BitVec 32))) (Intermediate!11706 (undefined!12518 Bool) (index!49218 (_ BitVec 32)) (x!131035 (_ BitVec 32))) (Undefined!11706) (MissingVacant!11706 (index!49219 (_ BitVec 32))) )
))
(declare-fun lt!637637 () SeekEntryResult!11706)

(declare-fun e!818792 () Bool)

(declare-fun lt!637638 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98545 (_ BitVec 32)) SeekEntryResult!11706)

(assert (=> b!1454497 (= e!818792 (= lt!637637 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637638 lt!637635 mask!2687)))))

(declare-fun b!1454498 () Bool)

(declare-fun res!984717 () Bool)

(assert (=> b!1454498 (=> (not res!984717) (not e!818793))))

(assert (=> b!1454498 (= res!984717 (validKeyInArray!0 (select (arr!47557 a!2862) i!1006)))))

(declare-fun res!984713 () Bool)

(assert (=> start!125202 (=> (not res!984713) (not e!818793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125202 (= res!984713 (validMask!0 mask!2687))))

(assert (=> start!125202 e!818793))

(assert (=> start!125202 true))

(declare-fun array_inv!36838 (array!98545) Bool)

(assert (=> start!125202 (array_inv!36838 a!2862)))

(declare-fun b!1454499 () Bool)

(declare-fun e!818787 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98545 (_ BitVec 32)) SeekEntryResult!11706)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98545 (_ BitVec 32)) SeekEntryResult!11706)

(assert (=> b!1454499 (= e!818787 (= (seekEntryOrOpen!0 lt!637638 lt!637635 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637638 lt!637635 mask!2687)))))

(declare-fun b!1454500 () Bool)

(declare-fun res!984712 () Bool)

(assert (=> b!1454500 (=> (not res!984712) (not e!818793))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454500 (= res!984712 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48108 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48108 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48108 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454501 () Bool)

(assert (=> b!1454501 (= e!818792 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637638 lt!637635 mask!2687) (seekEntryOrOpen!0 lt!637638 lt!637635 mask!2687)))))

(declare-fun b!1454502 () Bool)

(declare-fun e!818791 () Bool)

(assert (=> b!1454502 (= e!818791 (not (or (and (= (select (arr!47557 a!2862) index!646) (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!818785 () Bool)

(assert (=> b!1454502 e!818785))

(declare-fun res!984711 () Bool)

(assert (=> b!1454502 (=> (not res!984711) (not e!818785))))

(assert (=> b!1454502 (= res!984711 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48941 0))(
  ( (Unit!48942) )
))
(declare-fun lt!637639 () Unit!48941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48941)

(assert (=> b!1454502 (= lt!637639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454503 () Bool)

(declare-fun res!984721 () Bool)

(assert (=> b!1454503 (=> (not res!984721) (not e!818785))))

(assert (=> b!1454503 (= res!984721 (= (seekEntryOrOpen!0 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) (Found!11706 j!93)))))

(declare-fun b!1454504 () Bool)

(declare-fun res!984706 () Bool)

(declare-fun e!818789 () Bool)

(assert (=> b!1454504 (=> (not res!984706) (not e!818789))))

(declare-fun lt!637636 () SeekEntryResult!11706)

(assert (=> b!1454504 (= res!984706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!637636))))

(declare-fun b!1454505 () Bool)

(declare-fun res!984720 () Bool)

(assert (=> b!1454505 (=> (not res!984720) (not e!818791))))

(assert (=> b!1454505 (= res!984720 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454506 () Bool)

(assert (=> b!1454506 (= e!818788 e!818789)))

(declare-fun res!984722 () Bool)

(assert (=> b!1454506 (=> (not res!984722) (not e!818789))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454506 (= res!984722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47557 a!2862) j!93) mask!2687) (select (arr!47557 a!2862) j!93) a!2862 mask!2687) lt!637636))))

(assert (=> b!1454506 (= lt!637636 (Intermediate!11706 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454507 () Bool)

(declare-fun e!818790 () Bool)

(assert (=> b!1454507 (= e!818790 e!818787)))

(declare-fun res!984716 () Bool)

(assert (=> b!1454507 (=> (not res!984716) (not e!818787))))

(declare-fun lt!637634 () (_ BitVec 64))

(assert (=> b!1454507 (= res!984716 (and (= index!646 intermediateAfterIndex!19) (= lt!637634 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1454508 () Bool)

(declare-fun res!984708 () Bool)

(assert (=> b!1454508 (=> (not res!984708) (not e!818785))))

(assert (=> b!1454508 (= res!984708 (or (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47557 a!2862) intermediateBeforeIndex!19) (select (arr!47557 a!2862) j!93))))))

(declare-fun b!1454509 () Bool)

(declare-fun res!984709 () Bool)

(assert (=> b!1454509 (=> (not res!984709) (not e!818793))))

(declare-datatypes ((List!34045 0))(
  ( (Nil!34042) (Cons!34041 (h!35402 (_ BitVec 64)) (t!48731 List!34045)) )
))
(declare-fun arrayNoDuplicates!0 (array!98545 (_ BitVec 32) List!34045) Bool)

(assert (=> b!1454509 (= res!984709 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34042))))

(declare-fun b!1454510 () Bool)

(assert (=> b!1454510 (= e!818789 e!818791)))

(declare-fun res!984715 () Bool)

(assert (=> b!1454510 (=> (not res!984715) (not e!818791))))

(assert (=> b!1454510 (= res!984715 (= lt!637637 (Intermediate!11706 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454510 (= lt!637637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637638 mask!2687) lt!637638 lt!637635 mask!2687))))

(assert (=> b!1454510 (= lt!637638 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454511 () Bool)

(assert (=> b!1454511 (= e!818785 e!818790)))

(declare-fun res!984705 () Bool)

(assert (=> b!1454511 (=> res!984705 e!818790)))

(assert (=> b!1454511 (= res!984705 (or (and (= (select (arr!47557 a!2862) index!646) lt!637634) (= (select (arr!47557 a!2862) index!646) (select (arr!47557 a!2862) j!93))) (= (select (arr!47557 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454511 (= lt!637634 (select (store (arr!47557 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1454512 () Bool)

(declare-fun res!984707 () Bool)

(assert (=> b!1454512 (=> (not res!984707) (not e!818791))))

(assert (=> b!1454512 (= res!984707 e!818792)))

(declare-fun c!134413 () Bool)

(assert (=> b!1454512 (= c!134413 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125202 res!984713) b!1454493))

(assert (= (and b!1454493 res!984714) b!1454498))

(assert (= (and b!1454498 res!984717) b!1454495))

(assert (= (and b!1454495 res!984710) b!1454496))

(assert (= (and b!1454496 res!984718) b!1454509))

(assert (= (and b!1454509 res!984709) b!1454500))

(assert (= (and b!1454500 res!984712) b!1454494))

(assert (= (and b!1454494 res!984719) b!1454506))

(assert (= (and b!1454506 res!984722) b!1454504))

(assert (= (and b!1454504 res!984706) b!1454510))

(assert (= (and b!1454510 res!984715) b!1454512))

(assert (= (and b!1454512 c!134413) b!1454497))

(assert (= (and b!1454512 (not c!134413)) b!1454501))

(assert (= (and b!1454512 res!984707) b!1454505))

(assert (= (and b!1454505 res!984720) b!1454502))

(assert (= (and b!1454502 res!984711) b!1454503))

(assert (= (and b!1454503 res!984721) b!1454508))

(assert (= (and b!1454508 res!984708) b!1454511))

(assert (= (and b!1454511 (not res!984705)) b!1454507))

(assert (= (and b!1454507 res!984716) b!1454499))

(declare-fun m!1343131 () Bool)

(assert (=> b!1454508 m!1343131))

(declare-fun m!1343133 () Bool)

(assert (=> b!1454508 m!1343133))

(declare-fun m!1343135 () Bool)

(assert (=> b!1454498 m!1343135))

(assert (=> b!1454498 m!1343135))

(declare-fun m!1343137 () Bool)

(assert (=> b!1454498 m!1343137))

(assert (=> b!1454506 m!1343133))

(assert (=> b!1454506 m!1343133))

(declare-fun m!1343139 () Bool)

(assert (=> b!1454506 m!1343139))

(assert (=> b!1454506 m!1343139))

(assert (=> b!1454506 m!1343133))

(declare-fun m!1343141 () Bool)

(assert (=> b!1454506 m!1343141))

(assert (=> b!1454504 m!1343133))

(assert (=> b!1454504 m!1343133))

(declare-fun m!1343143 () Bool)

(assert (=> b!1454504 m!1343143))

(declare-fun m!1343145 () Bool)

(assert (=> b!1454496 m!1343145))

(assert (=> b!1454503 m!1343133))

(assert (=> b!1454503 m!1343133))

(declare-fun m!1343147 () Bool)

(assert (=> b!1454503 m!1343147))

(declare-fun m!1343149 () Bool)

(assert (=> b!1454511 m!1343149))

(assert (=> b!1454511 m!1343133))

(declare-fun m!1343151 () Bool)

(assert (=> b!1454511 m!1343151))

(declare-fun m!1343153 () Bool)

(assert (=> b!1454511 m!1343153))

(assert (=> b!1454494 m!1343151))

(declare-fun m!1343155 () Bool)

(assert (=> b!1454494 m!1343155))

(declare-fun m!1343157 () Bool)

(assert (=> b!1454501 m!1343157))

(declare-fun m!1343159 () Bool)

(assert (=> b!1454501 m!1343159))

(declare-fun m!1343161 () Bool)

(assert (=> start!125202 m!1343161))

(declare-fun m!1343163 () Bool)

(assert (=> start!125202 m!1343163))

(declare-fun m!1343165 () Bool)

(assert (=> b!1454497 m!1343165))

(declare-fun m!1343167 () Bool)

(assert (=> b!1454509 m!1343167))

(declare-fun m!1343169 () Bool)

(assert (=> b!1454502 m!1343169))

(assert (=> b!1454502 m!1343151))

(assert (=> b!1454502 m!1343153))

(assert (=> b!1454502 m!1343149))

(declare-fun m!1343171 () Bool)

(assert (=> b!1454502 m!1343171))

(assert (=> b!1454502 m!1343133))

(assert (=> b!1454499 m!1343159))

(assert (=> b!1454499 m!1343157))

(declare-fun m!1343173 () Bool)

(assert (=> b!1454510 m!1343173))

(assert (=> b!1454510 m!1343173))

(declare-fun m!1343175 () Bool)

(assert (=> b!1454510 m!1343175))

(assert (=> b!1454510 m!1343151))

(declare-fun m!1343177 () Bool)

(assert (=> b!1454510 m!1343177))

(assert (=> b!1454495 m!1343133))

(assert (=> b!1454495 m!1343133))

(declare-fun m!1343179 () Bool)

(assert (=> b!1454495 m!1343179))

(check-sat (not b!1454509) (not b!1454497) (not b!1454495) (not b!1454498) (not b!1454499) (not start!125202) (not b!1454502) (not b!1454504) (not b!1454506) (not b!1454496) (not b!1454503) (not b!1454501) (not b!1454510))
(check-sat)
