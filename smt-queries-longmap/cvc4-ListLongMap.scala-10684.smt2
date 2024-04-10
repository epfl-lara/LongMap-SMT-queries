; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125246 () Bool)

(assert start!125246)

(declare-fun b!1461591 () Bool)

(declare-fun res!991188 () Bool)

(declare-fun e!821684 () Bool)

(assert (=> b!1461591 (=> (not res!991188) (not e!821684))))

(declare-datatypes ((array!98694 0))(
  ( (array!98695 (arr!47635 (Array (_ BitVec 32) (_ BitVec 64))) (size!48185 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98694)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98694 (_ BitVec 32)) Bool)

(assert (=> b!1461591 (= res!991188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461592 () Bool)

(declare-fun e!821683 () Bool)

(assert (=> b!1461592 (= e!821683 true)))

(declare-fun lt!640181 () Bool)

(declare-fun e!821681 () Bool)

(assert (=> b!1461592 (= lt!640181 e!821681)))

(declare-fun c!134718 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461592 (= c!134718 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461593 () Bool)

(declare-fun res!991192 () Bool)

(declare-fun e!821689 () Bool)

(assert (=> b!1461593 (=> (not res!991192) (not e!821689))))

(declare-fun e!821687 () Bool)

(assert (=> b!1461593 (= res!991192 e!821687)))

(declare-fun c!134717 () Bool)

(assert (=> b!1461593 (= c!134717 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461594 () Bool)

(declare-fun res!991181 () Bool)

(declare-fun e!821682 () Bool)

(assert (=> b!1461594 (=> (not res!991181) (not e!821682))))

(declare-datatypes ((SeekEntryResult!11887 0))(
  ( (MissingZero!11887 (index!49940 (_ BitVec 32))) (Found!11887 (index!49941 (_ BitVec 32))) (Intermediate!11887 (undefined!12699 Bool) (index!49942 (_ BitVec 32)) (x!131536 (_ BitVec 32))) (Undefined!11887) (MissingVacant!11887 (index!49943 (_ BitVec 32))) )
))
(declare-fun lt!640179 () SeekEntryResult!11887)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98694 (_ BitVec 32)) SeekEntryResult!11887)

(assert (=> b!1461594 (= res!991181 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640179))))

(declare-fun b!1461595 () Bool)

(declare-fun lt!640182 () (_ BitVec 64))

(declare-fun lt!640185 () array!98694)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98694 (_ BitVec 32)) SeekEntryResult!11887)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98694 (_ BitVec 32)) SeekEntryResult!11887)

(assert (=> b!1461595 (= e!821687 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640182 lt!640185 mask!2687) (seekEntryOrOpen!0 lt!640182 lt!640185 mask!2687)))))

(declare-fun b!1461596 () Bool)

(declare-fun res!991190 () Bool)

(declare-fun e!821690 () Bool)

(assert (=> b!1461596 (=> (not res!991190) (not e!821690))))

(assert (=> b!1461596 (= res!991190 (= (seekEntryOrOpen!0 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) (Found!11887 j!93)))))

(declare-fun b!1461597 () Bool)

(declare-fun lt!640180 () (_ BitVec 32))

(assert (=> b!1461597 (= e!821681 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640180 intermediateAfterIndex!19 lt!640182 lt!640185 mask!2687) (seekEntryOrOpen!0 lt!640182 lt!640185 mask!2687))))))

(declare-fun b!1461598 () Bool)

(declare-fun res!991183 () Bool)

(assert (=> b!1461598 (=> res!991183 e!821683)))

(assert (=> b!1461598 (= res!991183 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640180 (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640179)))))

(declare-fun b!1461599 () Bool)

(declare-fun res!991187 () Bool)

(assert (=> b!1461599 (=> (not res!991187) (not e!821684))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461599 (= res!991187 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48185 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48185 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48185 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461600 () Bool)

(declare-fun lt!640184 () SeekEntryResult!11887)

(assert (=> b!1461600 (= e!821687 (= lt!640184 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640182 lt!640185 mask!2687)))))

(declare-fun b!1461601 () Bool)

(declare-fun res!991186 () Bool)

(assert (=> b!1461601 (=> (not res!991186) (not e!821684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461601 (= res!991186 (validKeyInArray!0 (select (arr!47635 a!2862) j!93)))))

(declare-fun b!1461602 () Bool)

(declare-fun e!821685 () Bool)

(assert (=> b!1461602 (= e!821685 e!821682)))

(declare-fun res!991193 () Bool)

(assert (=> b!1461602 (=> (not res!991193) (not e!821682))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461602 (= res!991193 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47635 a!2862) j!93) mask!2687) (select (arr!47635 a!2862) j!93) a!2862 mask!2687) lt!640179))))

(assert (=> b!1461602 (= lt!640179 (Intermediate!11887 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461603 () Bool)

(declare-fun e!821688 () Bool)

(assert (=> b!1461603 (= e!821689 (not e!821688))))

(declare-fun res!991189 () Bool)

(assert (=> b!1461603 (=> res!991189 e!821688)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461603 (= res!991189 (or (and (= (select (arr!47635 a!2862) index!646) (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47635 a!2862) index!646) (select (arr!47635 a!2862) j!93))) (= (select (arr!47635 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461603 e!821690))

(declare-fun res!991184 () Bool)

(assert (=> b!1461603 (=> (not res!991184) (not e!821690))))

(assert (=> b!1461603 (= res!991184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49270 0))(
  ( (Unit!49271) )
))
(declare-fun lt!640183 () Unit!49270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49270)

(assert (=> b!1461603 (= lt!640183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!991179 () Bool)

(assert (=> start!125246 (=> (not res!991179) (not e!821684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125246 (= res!991179 (validMask!0 mask!2687))))

(assert (=> start!125246 e!821684))

(assert (=> start!125246 true))

(declare-fun array_inv!36663 (array!98694) Bool)

(assert (=> start!125246 (array_inv!36663 a!2862)))

(declare-fun b!1461604 () Bool)

(assert (=> b!1461604 (= e!821682 e!821689)))

(declare-fun res!991191 () Bool)

(assert (=> b!1461604 (=> (not res!991191) (not e!821689))))

(assert (=> b!1461604 (= res!991191 (= lt!640184 (Intermediate!11887 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461604 (= lt!640184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640182 mask!2687) lt!640182 lt!640185 mask!2687))))

(assert (=> b!1461604 (= lt!640182 (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461605 () Bool)

(assert (=> b!1461605 (= e!821681 (not (= lt!640184 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640180 lt!640182 lt!640185 mask!2687))))))

(declare-fun b!1461606 () Bool)

(assert (=> b!1461606 (= e!821684 e!821685)))

(declare-fun res!991195 () Bool)

(assert (=> b!1461606 (=> (not res!991195) (not e!821685))))

(assert (=> b!1461606 (= res!991195 (= (select (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461606 (= lt!640185 (array!98695 (store (arr!47635 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48185 a!2862)))))

(declare-fun b!1461607 () Bool)

(assert (=> b!1461607 (= e!821688 e!821683)))

(declare-fun res!991194 () Bool)

(assert (=> b!1461607 (=> res!991194 e!821683)))

(assert (=> b!1461607 (= res!991194 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640180 #b00000000000000000000000000000000) (bvsge lt!640180 (size!48185 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461607 (= lt!640180 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461608 () Bool)

(declare-fun res!991178 () Bool)

(assert (=> b!1461608 (=> (not res!991178) (not e!821684))))

(declare-datatypes ((List!34136 0))(
  ( (Nil!34133) (Cons!34132 (h!35482 (_ BitVec 64)) (t!48830 List!34136)) )
))
(declare-fun arrayNoDuplicates!0 (array!98694 (_ BitVec 32) List!34136) Bool)

(assert (=> b!1461608 (= res!991178 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34133))))

(declare-fun b!1461609 () Bool)

(assert (=> b!1461609 (= e!821690 (or (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47635 a!2862) intermediateBeforeIndex!19) (select (arr!47635 a!2862) j!93))))))

(declare-fun b!1461610 () Bool)

(declare-fun res!991182 () Bool)

(assert (=> b!1461610 (=> (not res!991182) (not e!821684))))

(assert (=> b!1461610 (= res!991182 (validKeyInArray!0 (select (arr!47635 a!2862) i!1006)))))

(declare-fun b!1461611 () Bool)

(declare-fun res!991180 () Bool)

(assert (=> b!1461611 (=> (not res!991180) (not e!821684))))

(assert (=> b!1461611 (= res!991180 (and (= (size!48185 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48185 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48185 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461612 () Bool)

(declare-fun res!991185 () Bool)

(assert (=> b!1461612 (=> (not res!991185) (not e!821689))))

(assert (=> b!1461612 (= res!991185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125246 res!991179) b!1461611))

(assert (= (and b!1461611 res!991180) b!1461610))

(assert (= (and b!1461610 res!991182) b!1461601))

(assert (= (and b!1461601 res!991186) b!1461591))

(assert (= (and b!1461591 res!991188) b!1461608))

(assert (= (and b!1461608 res!991178) b!1461599))

(assert (= (and b!1461599 res!991187) b!1461606))

(assert (= (and b!1461606 res!991195) b!1461602))

(assert (= (and b!1461602 res!991193) b!1461594))

(assert (= (and b!1461594 res!991181) b!1461604))

(assert (= (and b!1461604 res!991191) b!1461593))

(assert (= (and b!1461593 c!134717) b!1461600))

(assert (= (and b!1461593 (not c!134717)) b!1461595))

(assert (= (and b!1461593 res!991192) b!1461612))

(assert (= (and b!1461612 res!991185) b!1461603))

(assert (= (and b!1461603 res!991184) b!1461596))

(assert (= (and b!1461596 res!991190) b!1461609))

(assert (= (and b!1461603 (not res!991189)) b!1461607))

(assert (= (and b!1461607 (not res!991194)) b!1461598))

(assert (= (and b!1461598 (not res!991183)) b!1461592))

(assert (= (and b!1461592 c!134718) b!1461605))

(assert (= (and b!1461592 (not c!134718)) b!1461597))

(declare-fun m!1349151 () Bool)

(assert (=> b!1461594 m!1349151))

(assert (=> b!1461594 m!1349151))

(declare-fun m!1349153 () Bool)

(assert (=> b!1461594 m!1349153))

(declare-fun m!1349155 () Bool)

(assert (=> b!1461609 m!1349155))

(assert (=> b!1461609 m!1349151))

(declare-fun m!1349157 () Bool)

(assert (=> b!1461595 m!1349157))

(declare-fun m!1349159 () Bool)

(assert (=> b!1461595 m!1349159))

(declare-fun m!1349161 () Bool)

(assert (=> b!1461603 m!1349161))

(declare-fun m!1349163 () Bool)

(assert (=> b!1461603 m!1349163))

(declare-fun m!1349165 () Bool)

(assert (=> b!1461603 m!1349165))

(declare-fun m!1349167 () Bool)

(assert (=> b!1461603 m!1349167))

(declare-fun m!1349169 () Bool)

(assert (=> b!1461603 m!1349169))

(assert (=> b!1461603 m!1349151))

(declare-fun m!1349171 () Bool)

(assert (=> b!1461607 m!1349171))

(declare-fun m!1349173 () Bool)

(assert (=> b!1461610 m!1349173))

(assert (=> b!1461610 m!1349173))

(declare-fun m!1349175 () Bool)

(assert (=> b!1461610 m!1349175))

(declare-fun m!1349177 () Bool)

(assert (=> b!1461605 m!1349177))

(assert (=> b!1461596 m!1349151))

(assert (=> b!1461596 m!1349151))

(declare-fun m!1349179 () Bool)

(assert (=> b!1461596 m!1349179))

(declare-fun m!1349181 () Bool)

(assert (=> start!125246 m!1349181))

(declare-fun m!1349183 () Bool)

(assert (=> start!125246 m!1349183))

(assert (=> b!1461602 m!1349151))

(assert (=> b!1461602 m!1349151))

(declare-fun m!1349185 () Bool)

(assert (=> b!1461602 m!1349185))

(assert (=> b!1461602 m!1349185))

(assert (=> b!1461602 m!1349151))

(declare-fun m!1349187 () Bool)

(assert (=> b!1461602 m!1349187))

(declare-fun m!1349189 () Bool)

(assert (=> b!1461591 m!1349189))

(declare-fun m!1349191 () Bool)

(assert (=> b!1461597 m!1349191))

(assert (=> b!1461597 m!1349159))

(declare-fun m!1349193 () Bool)

(assert (=> b!1461600 m!1349193))

(assert (=> b!1461601 m!1349151))

(assert (=> b!1461601 m!1349151))

(declare-fun m!1349195 () Bool)

(assert (=> b!1461601 m!1349195))

(assert (=> b!1461606 m!1349163))

(declare-fun m!1349197 () Bool)

(assert (=> b!1461606 m!1349197))

(assert (=> b!1461598 m!1349151))

(assert (=> b!1461598 m!1349151))

(declare-fun m!1349199 () Bool)

(assert (=> b!1461598 m!1349199))

(declare-fun m!1349201 () Bool)

(assert (=> b!1461608 m!1349201))

(declare-fun m!1349203 () Bool)

(assert (=> b!1461604 m!1349203))

(assert (=> b!1461604 m!1349203))

(declare-fun m!1349205 () Bool)

(assert (=> b!1461604 m!1349205))

(assert (=> b!1461604 m!1349163))

(declare-fun m!1349207 () Bool)

(assert (=> b!1461604 m!1349207))

(push 1)

