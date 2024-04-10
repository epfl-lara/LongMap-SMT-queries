; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126488 () Bool)

(assert start!126488)

(declare-fun b!1483162 () Bool)

(declare-fun res!1008061 () Bool)

(declare-fun e!831669 () Bool)

(assert (=> b!1483162 (=> (not res!1008061) (not e!831669))))

(declare-datatypes ((array!99450 0))(
  ( (array!99451 (arr!48001 (Array (_ BitVec 32) (_ BitVec 64))) (size!48551 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99450)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12241 0))(
  ( (MissingZero!12241 (index!51356 (_ BitVec 32))) (Found!12241 (index!51357 (_ BitVec 32))) (Intermediate!12241 (undefined!13053 Bool) (index!51358 (_ BitVec 32)) (x!132941 (_ BitVec 32))) (Undefined!12241) (MissingVacant!12241 (index!51359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99450 (_ BitVec 32)) SeekEntryResult!12241)

(assert (=> b!1483162 (= res!1008061 (= (seekEntryOrOpen!0 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) (Found!12241 j!93)))))

(declare-fun b!1483163 () Bool)

(declare-fun res!1008078 () Bool)

(declare-fun e!831674 () Bool)

(assert (=> b!1483163 (=> (not res!1008078) (not e!831674))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483163 (= res!1008078 (validKeyInArray!0 (select (arr!48001 a!2862) i!1006)))))

(declare-fun b!1483164 () Bool)

(declare-fun res!1008070 () Bool)

(assert (=> b!1483164 (=> (not res!1008070) (not e!831674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99450 (_ BitVec 32)) Bool)

(assert (=> b!1483164 (= res!1008070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483165 () Bool)

(declare-fun e!831672 () Bool)

(declare-fun e!831668 () Bool)

(assert (=> b!1483165 (= e!831672 e!831668)))

(declare-fun res!1008074 () Bool)

(assert (=> b!1483165 (=> (not res!1008074) (not e!831668))))

(declare-fun lt!647335 () SeekEntryResult!12241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99450 (_ BitVec 32)) SeekEntryResult!12241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483165 (= res!1008074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48001 a!2862) j!93) mask!2687) (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!647335))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483165 (= lt!647335 (Intermediate!12241 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483166 () Bool)

(declare-fun e!831677 () Bool)

(assert (=> b!1483166 (= e!831669 e!831677)))

(declare-fun res!1008066 () Bool)

(assert (=> b!1483166 (=> res!1008066 e!831677)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647340 () (_ BitVec 64))

(assert (=> b!1483166 (= res!1008066 (or (and (= (select (arr!48001 a!2862) index!646) lt!647340) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483166 (= lt!647340 (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun res!1008076 () Bool)

(assert (=> start!126488 (=> (not res!1008076) (not e!831674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126488 (= res!1008076 (validMask!0 mask!2687))))

(assert (=> start!126488 e!831674))

(assert (=> start!126488 true))

(declare-fun array_inv!37029 (array!99450) Bool)

(assert (=> start!126488 (array_inv!37029 a!2862)))

(declare-fun b!1483167 () Bool)

(declare-fun res!1008063 () Bool)

(assert (=> b!1483167 (=> (not res!1008063) (not e!831669))))

(assert (=> b!1483167 (= res!1008063 (or (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48001 a!2862) intermediateBeforeIndex!19) (select (arr!48001 a!2862) j!93))))))

(declare-fun lt!647337 () (_ BitVec 64))

(declare-fun e!831670 () Bool)

(declare-fun lt!647338 () SeekEntryResult!12241)

(declare-fun b!1483168 () Bool)

(declare-fun lt!647334 () array!99450)

(assert (=> b!1483168 (= e!831670 (= lt!647338 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647337 lt!647334 mask!2687)))))

(declare-fun b!1483169 () Bool)

(declare-fun e!831675 () Bool)

(assert (=> b!1483169 (= e!831668 e!831675)))

(declare-fun res!1008073 () Bool)

(assert (=> b!1483169 (=> (not res!1008073) (not e!831675))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483169 (= res!1008073 (= lt!647338 (Intermediate!12241 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483169 (= lt!647338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647337 mask!2687) lt!647337 lt!647334 mask!2687))))

(assert (=> b!1483169 (= lt!647337 (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!831671 () Bool)

(declare-fun b!1483170 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99450 (_ BitVec 32)) SeekEntryResult!12241)

(assert (=> b!1483170 (= e!831671 (= (seekEntryOrOpen!0 lt!647337 lt!647334 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647337 lt!647334 mask!2687)))))

(declare-fun b!1483171 () Bool)

(assert (=> b!1483171 (= e!831670 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647337 lt!647334 mask!2687) (seekEntryOrOpen!0 lt!647337 lt!647334 mask!2687)))))

(declare-fun b!1483172 () Bool)

(declare-fun res!1008075 () Bool)

(assert (=> b!1483172 (=> (not res!1008075) (not e!831674))))

(assert (=> b!1483172 (= res!1008075 (validKeyInArray!0 (select (arr!48001 a!2862) j!93)))))

(declare-fun b!1483173 () Bool)

(declare-fun res!1008067 () Bool)

(assert (=> b!1483173 (=> (not res!1008067) (not e!831674))))

(declare-datatypes ((List!34502 0))(
  ( (Nil!34499) (Cons!34498 (h!35872 (_ BitVec 64)) (t!49196 List!34502)) )
))
(declare-fun arrayNoDuplicates!0 (array!99450 (_ BitVec 32) List!34502) Bool)

(assert (=> b!1483173 (= res!1008067 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34499))))

(declare-fun b!1483174 () Bool)

(assert (=> b!1483174 (= e!831674 e!831672)))

(declare-fun res!1008068 () Bool)

(assert (=> b!1483174 (=> (not res!1008068) (not e!831672))))

(assert (=> b!1483174 (= res!1008068 (= (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483174 (= lt!647334 (array!99451 (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48551 a!2862)))))

(declare-fun b!1483175 () Bool)

(declare-fun res!1008079 () Bool)

(assert (=> b!1483175 (=> (not res!1008079) (not e!831674))))

(assert (=> b!1483175 (= res!1008079 (and (= (size!48551 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48551 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48551 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483176 () Bool)

(declare-fun e!831676 () Bool)

(assert (=> b!1483176 (= e!831676 true)))

(declare-fun lt!647336 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483176 (= lt!647336 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483177 () Bool)

(declare-fun res!1008077 () Bool)

(assert (=> b!1483177 (=> (not res!1008077) (not e!831668))))

(assert (=> b!1483177 (= res!1008077 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48001 a!2862) j!93) a!2862 mask!2687) lt!647335))))

(declare-fun b!1483178 () Bool)

(assert (=> b!1483178 (= e!831677 e!831671)))

(declare-fun res!1008069 () Bool)

(assert (=> b!1483178 (=> (not res!1008069) (not e!831671))))

(assert (=> b!1483178 (= res!1008069 (and (= index!646 intermediateAfterIndex!19) (= lt!647340 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483179 () Bool)

(assert (=> b!1483179 (= e!831675 (not e!831676))))

(declare-fun res!1008064 () Bool)

(assert (=> b!1483179 (=> res!1008064 e!831676)))

(assert (=> b!1483179 (= res!1008064 (or (and (= (select (arr!48001 a!2862) index!646) (select (store (arr!48001 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48001 a!2862) index!646) (select (arr!48001 a!2862) j!93))) (= (select (arr!48001 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483179 e!831669))

(declare-fun res!1008065 () Bool)

(assert (=> b!1483179 (=> (not res!1008065) (not e!831669))))

(assert (=> b!1483179 (= res!1008065 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49822 0))(
  ( (Unit!49823) )
))
(declare-fun lt!647339 () Unit!49822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49822)

(assert (=> b!1483179 (= lt!647339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483180 () Bool)

(declare-fun res!1008062 () Bool)

(assert (=> b!1483180 (=> (not res!1008062) (not e!831675))))

(assert (=> b!1483180 (= res!1008062 e!831670)))

(declare-fun c!137073 () Bool)

(assert (=> b!1483180 (= c!137073 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483181 () Bool)

(declare-fun res!1008071 () Bool)

(assert (=> b!1483181 (=> (not res!1008071) (not e!831674))))

(assert (=> b!1483181 (= res!1008071 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48551 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48551 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48551 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483182 () Bool)

(declare-fun res!1008072 () Bool)

(assert (=> b!1483182 (=> (not res!1008072) (not e!831675))))

(assert (=> b!1483182 (= res!1008072 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126488 res!1008076) b!1483175))

(assert (= (and b!1483175 res!1008079) b!1483163))

(assert (= (and b!1483163 res!1008078) b!1483172))

(assert (= (and b!1483172 res!1008075) b!1483164))

(assert (= (and b!1483164 res!1008070) b!1483173))

(assert (= (and b!1483173 res!1008067) b!1483181))

(assert (= (and b!1483181 res!1008071) b!1483174))

(assert (= (and b!1483174 res!1008068) b!1483165))

(assert (= (and b!1483165 res!1008074) b!1483177))

(assert (= (and b!1483177 res!1008077) b!1483169))

(assert (= (and b!1483169 res!1008073) b!1483180))

(assert (= (and b!1483180 c!137073) b!1483168))

(assert (= (and b!1483180 (not c!137073)) b!1483171))

(assert (= (and b!1483180 res!1008062) b!1483182))

(assert (= (and b!1483182 res!1008072) b!1483179))

(assert (= (and b!1483179 res!1008065) b!1483162))

(assert (= (and b!1483162 res!1008061) b!1483167))

(assert (= (and b!1483167 res!1008063) b!1483166))

(assert (= (and b!1483166 (not res!1008066)) b!1483178))

(assert (= (and b!1483178 res!1008069) b!1483170))

(assert (= (and b!1483179 (not res!1008064)) b!1483176))

(declare-fun m!1368693 () Bool)

(assert (=> b!1483174 m!1368693))

(declare-fun m!1368695 () Bool)

(assert (=> b!1483174 m!1368695))

(declare-fun m!1368697 () Bool)

(assert (=> b!1483171 m!1368697))

(declare-fun m!1368699 () Bool)

(assert (=> b!1483171 m!1368699))

(declare-fun m!1368701 () Bool)

(assert (=> b!1483164 m!1368701))

(declare-fun m!1368703 () Bool)

(assert (=> b!1483172 m!1368703))

(assert (=> b!1483172 m!1368703))

(declare-fun m!1368705 () Bool)

(assert (=> b!1483172 m!1368705))

(assert (=> b!1483170 m!1368699))

(assert (=> b!1483170 m!1368697))

(declare-fun m!1368707 () Bool)

(assert (=> start!126488 m!1368707))

(declare-fun m!1368709 () Bool)

(assert (=> start!126488 m!1368709))

(declare-fun m!1368711 () Bool)

(assert (=> b!1483173 m!1368711))

(assert (=> b!1483162 m!1368703))

(assert (=> b!1483162 m!1368703))

(declare-fun m!1368713 () Bool)

(assert (=> b!1483162 m!1368713))

(assert (=> b!1483165 m!1368703))

(assert (=> b!1483165 m!1368703))

(declare-fun m!1368715 () Bool)

(assert (=> b!1483165 m!1368715))

(assert (=> b!1483165 m!1368715))

(assert (=> b!1483165 m!1368703))

(declare-fun m!1368717 () Bool)

(assert (=> b!1483165 m!1368717))

(declare-fun m!1368719 () Bool)

(assert (=> b!1483176 m!1368719))

(declare-fun m!1368721 () Bool)

(assert (=> b!1483166 m!1368721))

(assert (=> b!1483166 m!1368703))

(assert (=> b!1483166 m!1368693))

(declare-fun m!1368723 () Bool)

(assert (=> b!1483166 m!1368723))

(declare-fun m!1368725 () Bool)

(assert (=> b!1483163 m!1368725))

(assert (=> b!1483163 m!1368725))

(declare-fun m!1368727 () Bool)

(assert (=> b!1483163 m!1368727))

(declare-fun m!1368729 () Bool)

(assert (=> b!1483167 m!1368729))

(assert (=> b!1483167 m!1368703))

(declare-fun m!1368731 () Bool)

(assert (=> b!1483168 m!1368731))

(assert (=> b!1483177 m!1368703))

(assert (=> b!1483177 m!1368703))

(declare-fun m!1368733 () Bool)

(assert (=> b!1483177 m!1368733))

(declare-fun m!1368735 () Bool)

(assert (=> b!1483179 m!1368735))

(assert (=> b!1483179 m!1368693))

(assert (=> b!1483179 m!1368723))

(assert (=> b!1483179 m!1368721))

(declare-fun m!1368737 () Bool)

(assert (=> b!1483179 m!1368737))

(assert (=> b!1483179 m!1368703))

(declare-fun m!1368739 () Bool)

(assert (=> b!1483169 m!1368739))

(assert (=> b!1483169 m!1368739))

(declare-fun m!1368741 () Bool)

(assert (=> b!1483169 m!1368741))

(assert (=> b!1483169 m!1368693))

(declare-fun m!1368743 () Bool)

(assert (=> b!1483169 m!1368743))

(push 1)

