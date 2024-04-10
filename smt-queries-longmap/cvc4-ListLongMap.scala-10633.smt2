; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124940 () Bool)

(assert start!124940)

(declare-fun b!1452002 () Bool)

(declare-fun res!983184 () Bool)

(declare-fun e!817455 () Bool)

(assert (=> b!1452002 (=> (not res!983184) (not e!817455))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11734 0))(
  ( (MissingZero!11734 (index!49328 (_ BitVec 32))) (Found!11734 (index!49329 (_ BitVec 32))) (Intermediate!11734 (undefined!12546 Bool) (index!49330 (_ BitVec 32)) (x!130975 (_ BitVec 32))) (Undefined!11734) (MissingVacant!11734 (index!49331 (_ BitVec 32))) )
))
(declare-fun lt!636817 () SeekEntryResult!11734)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98388 0))(
  ( (array!98389 (arr!47482 (Array (_ BitVec 32) (_ BitVec 64))) (size!48032 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98388)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98388 (_ BitVec 32)) SeekEntryResult!11734)

(assert (=> b!1452002 (= res!983184 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636817))))

(declare-fun b!1452003 () Bool)

(declare-fun res!983185 () Bool)

(declare-fun e!817457 () Bool)

(assert (=> b!1452003 (=> (not res!983185) (not e!817457))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452003 (= res!983185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452004 () Bool)

(declare-fun res!983171 () Bool)

(declare-fun e!817459 () Bool)

(assert (=> b!1452004 (=> (not res!983171) (not e!817459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452004 (= res!983171 (validKeyInArray!0 (select (arr!47482 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!817456 () Bool)

(declare-fun b!1452005 () Bool)

(assert (=> b!1452005 (= e!817456 (and (or (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) (select (arr!47482 a!2862) j!93))) (or (and (= (select (arr!47482 a!2862) index!646) (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452006 () Bool)

(assert (=> b!1452006 (= e!817457 (not (or (and (= (select (arr!47482 a!2862) index!646) (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1452006 e!817456))

(declare-fun res!983181 () Bool)

(assert (=> b!1452006 (=> (not res!983181) (not e!817456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98388 (_ BitVec 32)) Bool)

(assert (=> b!1452006 (= res!983181 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48964 0))(
  ( (Unit!48965) )
))
(declare-fun lt!636815 () Unit!48964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48964)

(assert (=> b!1452006 (= lt!636815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452007 () Bool)

(declare-fun e!817460 () Bool)

(declare-fun lt!636818 () array!98388)

(declare-fun lt!636816 () (_ BitVec 64))

(declare-fun lt!636819 () SeekEntryResult!11734)

(assert (=> b!1452007 (= e!817460 (= lt!636819 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636816 lt!636818 mask!2687)))))

(declare-fun b!1452008 () Bool)

(declare-fun res!983177 () Bool)

(assert (=> b!1452008 (=> (not res!983177) (not e!817459))))

(declare-datatypes ((List!33983 0))(
  ( (Nil!33980) (Cons!33979 (h!35329 (_ BitVec 64)) (t!48677 List!33983)) )
))
(declare-fun arrayNoDuplicates!0 (array!98388 (_ BitVec 32) List!33983) Bool)

(assert (=> b!1452008 (= res!983177 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33980))))

(declare-fun b!1452009 () Bool)

(declare-fun e!817458 () Bool)

(assert (=> b!1452009 (= e!817459 e!817458)))

(declare-fun res!983175 () Bool)

(assert (=> b!1452009 (=> (not res!983175) (not e!817458))))

(assert (=> b!1452009 (= res!983175 (= (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452009 (= lt!636818 (array!98389 (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48032 a!2862)))))

(declare-fun b!1452010 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98388 (_ BitVec 32)) SeekEntryResult!11734)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98388 (_ BitVec 32)) SeekEntryResult!11734)

(assert (=> b!1452010 (= e!817460 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636816 lt!636818 mask!2687) (seekEntryOrOpen!0 lt!636816 lt!636818 mask!2687)))))

(declare-fun b!1452011 () Bool)

(assert (=> b!1452011 (= e!817455 e!817457)))

(declare-fun res!983172 () Bool)

(assert (=> b!1452011 (=> (not res!983172) (not e!817457))))

(assert (=> b!1452011 (= res!983172 (= lt!636819 (Intermediate!11734 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452011 (= lt!636819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636816 mask!2687) lt!636816 lt!636818 mask!2687))))

(assert (=> b!1452011 (= lt!636816 (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452012 () Bool)

(declare-fun res!983179 () Bool)

(assert (=> b!1452012 (=> (not res!983179) (not e!817457))))

(assert (=> b!1452012 (= res!983179 e!817460)))

(declare-fun c!133926 () Bool)

(assert (=> b!1452012 (= c!133926 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983180 () Bool)

(assert (=> start!124940 (=> (not res!983180) (not e!817459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124940 (= res!983180 (validMask!0 mask!2687))))

(assert (=> start!124940 e!817459))

(assert (=> start!124940 true))

(declare-fun array_inv!36510 (array!98388) Bool)

(assert (=> start!124940 (array_inv!36510 a!2862)))

(declare-fun b!1452013 () Bool)

(assert (=> b!1452013 (= e!817458 e!817455)))

(declare-fun res!983178 () Bool)

(assert (=> b!1452013 (=> (not res!983178) (not e!817455))))

(assert (=> b!1452013 (= res!983178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47482 a!2862) j!93) mask!2687) (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636817))))

(assert (=> b!1452013 (= lt!636817 (Intermediate!11734 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452014 () Bool)

(declare-fun res!983182 () Bool)

(assert (=> b!1452014 (=> (not res!983182) (not e!817459))))

(assert (=> b!1452014 (= res!983182 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48032 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48032 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48032 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452015 () Bool)

(declare-fun res!983183 () Bool)

(assert (=> b!1452015 (=> (not res!983183) (not e!817459))))

(assert (=> b!1452015 (= res!983183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452016 () Bool)

(declare-fun res!983173 () Bool)

(assert (=> b!1452016 (=> (not res!983173) (not e!817456))))

(assert (=> b!1452016 (= res!983173 (= (seekEntryOrOpen!0 (select (arr!47482 a!2862) j!93) a!2862 mask!2687) (Found!11734 j!93)))))

(declare-fun b!1452017 () Bool)

(declare-fun res!983174 () Bool)

(assert (=> b!1452017 (=> (not res!983174) (not e!817459))))

(assert (=> b!1452017 (= res!983174 (validKeyInArray!0 (select (arr!47482 a!2862) i!1006)))))

(declare-fun b!1452018 () Bool)

(declare-fun res!983176 () Bool)

(assert (=> b!1452018 (=> (not res!983176) (not e!817459))))

(assert (=> b!1452018 (= res!983176 (and (= (size!48032 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48032 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48032 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124940 res!983180) b!1452018))

(assert (= (and b!1452018 res!983176) b!1452017))

(assert (= (and b!1452017 res!983174) b!1452004))

(assert (= (and b!1452004 res!983171) b!1452015))

(assert (= (and b!1452015 res!983183) b!1452008))

(assert (= (and b!1452008 res!983177) b!1452014))

(assert (= (and b!1452014 res!983182) b!1452009))

(assert (= (and b!1452009 res!983175) b!1452013))

(assert (= (and b!1452013 res!983178) b!1452002))

(assert (= (and b!1452002 res!983184) b!1452011))

(assert (= (and b!1452011 res!983172) b!1452012))

(assert (= (and b!1452012 c!133926) b!1452007))

(assert (= (and b!1452012 (not c!133926)) b!1452010))

(assert (= (and b!1452012 res!983179) b!1452003))

(assert (= (and b!1452003 res!983185) b!1452006))

(assert (= (and b!1452006 res!983181) b!1452016))

(assert (= (and b!1452016 res!983173) b!1452005))

(declare-fun m!1340585 () Bool)

(assert (=> b!1452017 m!1340585))

(assert (=> b!1452017 m!1340585))

(declare-fun m!1340587 () Bool)

(assert (=> b!1452017 m!1340587))

(declare-fun m!1340589 () Bool)

(assert (=> start!124940 m!1340589))

(declare-fun m!1340591 () Bool)

(assert (=> start!124940 m!1340591))

(declare-fun m!1340593 () Bool)

(assert (=> b!1452002 m!1340593))

(assert (=> b!1452002 m!1340593))

(declare-fun m!1340595 () Bool)

(assert (=> b!1452002 m!1340595))

(declare-fun m!1340597 () Bool)

(assert (=> b!1452007 m!1340597))

(declare-fun m!1340599 () Bool)

(assert (=> b!1452005 m!1340599))

(declare-fun m!1340601 () Bool)

(assert (=> b!1452005 m!1340601))

(declare-fun m!1340603 () Bool)

(assert (=> b!1452005 m!1340603))

(declare-fun m!1340605 () Bool)

(assert (=> b!1452005 m!1340605))

(assert (=> b!1452005 m!1340593))

(declare-fun m!1340607 () Bool)

(assert (=> b!1452006 m!1340607))

(assert (=> b!1452006 m!1340599))

(assert (=> b!1452006 m!1340603))

(assert (=> b!1452006 m!1340605))

(declare-fun m!1340609 () Bool)

(assert (=> b!1452006 m!1340609))

(assert (=> b!1452006 m!1340593))

(declare-fun m!1340611 () Bool)

(assert (=> b!1452011 m!1340611))

(assert (=> b!1452011 m!1340611))

(declare-fun m!1340613 () Bool)

(assert (=> b!1452011 m!1340613))

(assert (=> b!1452011 m!1340599))

(declare-fun m!1340615 () Bool)

(assert (=> b!1452011 m!1340615))

(declare-fun m!1340617 () Bool)

(assert (=> b!1452008 m!1340617))

(declare-fun m!1340619 () Bool)

(assert (=> b!1452015 m!1340619))

(assert (=> b!1452013 m!1340593))

(assert (=> b!1452013 m!1340593))

(declare-fun m!1340621 () Bool)

(assert (=> b!1452013 m!1340621))

(assert (=> b!1452013 m!1340621))

(assert (=> b!1452013 m!1340593))

(declare-fun m!1340623 () Bool)

(assert (=> b!1452013 m!1340623))

(assert (=> b!1452009 m!1340599))

(declare-fun m!1340625 () Bool)

(assert (=> b!1452009 m!1340625))

(declare-fun m!1340627 () Bool)

(assert (=> b!1452010 m!1340627))

(declare-fun m!1340629 () Bool)

(assert (=> b!1452010 m!1340629))

(assert (=> b!1452004 m!1340593))

(assert (=> b!1452004 m!1340593))

(declare-fun m!1340631 () Bool)

(assert (=> b!1452004 m!1340631))

(assert (=> b!1452016 m!1340593))

(assert (=> b!1452016 m!1340593))

(declare-fun m!1340633 () Bool)

(assert (=> b!1452016 m!1340633))

(push 1)

(assert (not b!1452010))

(assert (not b!1452015))

(assert (not start!124940))

(assert (not b!1452013))

(assert (not b!1452017))

(assert (not b!1452007))

(assert (not b!1452004))

