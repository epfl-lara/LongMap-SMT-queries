; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125046 () Bool)

(assert start!125046)

(declare-fun b!1455162 () Bool)

(declare-fun e!818853 () Bool)

(declare-fun e!818861 () Bool)

(assert (=> b!1455162 (= e!818853 (not e!818861))))

(declare-fun res!985879 () Bool)

(assert (=> b!1455162 (=> res!985879 e!818861)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98494 0))(
  ( (array!98495 (arr!47535 (Array (_ BitVec 32) (_ BitVec 64))) (size!48085 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98494)

(assert (=> b!1455162 (= res!985879 (or (and (= (select (arr!47535 a!2862) index!646) (select (store (arr!47535 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47535 a!2862) index!646) (select (arr!47535 a!2862) j!93))) (= (select (arr!47535 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818855 () Bool)

(assert (=> b!1455162 e!818855))

(declare-fun res!985889 () Bool)

(assert (=> b!1455162 (=> (not res!985889) (not e!818855))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98494 (_ BitVec 32)) Bool)

(assert (=> b!1455162 (= res!985889 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49070 0))(
  ( (Unit!49071) )
))
(declare-fun lt!637855 () Unit!49070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49070)

(assert (=> b!1455162 (= lt!637855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455163 () Bool)

(declare-fun res!985880 () Bool)

(declare-fun e!818854 () Bool)

(assert (=> b!1455163 (=> (not res!985880) (not e!818854))))

(declare-datatypes ((List!34036 0))(
  ( (Nil!34033) (Cons!34032 (h!35382 (_ BitVec 64)) (t!48730 List!34036)) )
))
(declare-fun arrayNoDuplicates!0 (array!98494 (_ BitVec 32) List!34036) Bool)

(assert (=> b!1455163 (= res!985880 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34033))))

(declare-fun b!1455165 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455165 (= e!818855 (and (or (= (select (arr!47535 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47535 a!2862) intermediateBeforeIndex!19) (select (arr!47535 a!2862) j!93))) (let ((bdg!53128 (select (store (arr!47535 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47535 a!2862) index!646) bdg!53128) (= (select (arr!47535 a!2862) index!646) (select (arr!47535 a!2862) j!93))) (= (select (arr!47535 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53128 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!637856 () (_ BitVec 64))

(declare-fun lt!637852 () array!98494)

(declare-fun b!1455166 () Bool)

(declare-fun e!818852 () Bool)

(declare-datatypes ((SeekEntryResult!11787 0))(
  ( (MissingZero!11787 (index!49540 (_ BitVec 32))) (Found!11787 (index!49541 (_ BitVec 32))) (Intermediate!11787 (undefined!12599 Bool) (index!49542 (_ BitVec 32)) (x!131172 (_ BitVec 32))) (Undefined!11787) (MissingVacant!11787 (index!49543 (_ BitVec 32))) )
))
(declare-fun lt!637850 () SeekEntryResult!11787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11787)

(assert (=> b!1455166 (= e!818852 (= lt!637850 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637856 lt!637852 mask!2687)))))

(declare-fun b!1455167 () Bool)

(declare-fun e!818858 () Bool)

(assert (=> b!1455167 (= e!818858 true)))

(declare-fun lt!637853 () Bool)

(declare-fun e!818860 () Bool)

(assert (=> b!1455167 (= lt!637853 e!818860)))

(declare-fun c!134154 () Bool)

(assert (=> b!1455167 (= c!134154 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455168 () Bool)

(declare-fun res!985883 () Bool)

(assert (=> b!1455168 (=> (not res!985883) (not e!818854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455168 (= res!985883 (validKeyInArray!0 (select (arr!47535 a!2862) i!1006)))))

(declare-fun b!1455169 () Bool)

(declare-fun res!985888 () Bool)

(declare-fun e!818857 () Bool)

(assert (=> b!1455169 (=> (not res!985888) (not e!818857))))

(declare-fun lt!637857 () SeekEntryResult!11787)

(assert (=> b!1455169 (= res!985888 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47535 a!2862) j!93) a!2862 mask!2687) lt!637857))))

(declare-fun b!1455170 () Bool)

(declare-fun res!985893 () Bool)

(assert (=> b!1455170 (=> (not res!985893) (not e!818854))))

(assert (=> b!1455170 (= res!985893 (validKeyInArray!0 (select (arr!47535 a!2862) j!93)))))

(declare-fun b!1455171 () Bool)

(declare-fun res!985884 () Bool)

(assert (=> b!1455171 (=> (not res!985884) (not e!818855))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11787)

(assert (=> b!1455171 (= res!985884 (= (seekEntryOrOpen!0 (select (arr!47535 a!2862) j!93) a!2862 mask!2687) (Found!11787 j!93)))))

(declare-fun lt!637854 () (_ BitVec 32))

(declare-fun b!1455172 () Bool)

(assert (=> b!1455172 (= e!818860 (not (= lt!637850 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637854 lt!637856 lt!637852 mask!2687))))))

(declare-fun b!1455173 () Bool)

(declare-fun e!818856 () Bool)

(assert (=> b!1455173 (= e!818854 e!818856)))

(declare-fun res!985885 () Bool)

(assert (=> b!1455173 (=> (not res!985885) (not e!818856))))

(assert (=> b!1455173 (= res!985885 (= (select (store (arr!47535 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455173 (= lt!637852 (array!98495 (store (arr!47535 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48085 a!2862)))))

(declare-fun b!1455174 () Bool)

(declare-fun res!985881 () Bool)

(assert (=> b!1455174 (=> (not res!985881) (not e!818854))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455174 (= res!985881 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48085 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48085 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48085 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!985882 () Bool)

(assert (=> start!125046 (=> (not res!985882) (not e!818854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125046 (= res!985882 (validMask!0 mask!2687))))

(assert (=> start!125046 e!818854))

(assert (=> start!125046 true))

(declare-fun array_inv!36563 (array!98494) Bool)

(assert (=> start!125046 (array_inv!36563 a!2862)))

(declare-fun b!1455164 () Bool)

(assert (=> b!1455164 (= e!818861 e!818858)))

(declare-fun res!985886 () Bool)

(assert (=> b!1455164 (=> res!985886 e!818858)))

(assert (=> b!1455164 (= res!985886 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637854 #b00000000000000000000000000000000) (bvsge lt!637854 (size!48085 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455164 (= lt!637854 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637851 () SeekEntryResult!11787)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11787)

(assert (=> b!1455164 (= lt!637851 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637856 lt!637852 mask!2687))))

(assert (=> b!1455164 (= lt!637851 (seekEntryOrOpen!0 lt!637856 lt!637852 mask!2687))))

(declare-fun b!1455175 () Bool)

(declare-fun res!985877 () Bool)

(assert (=> b!1455175 (=> (not res!985877) (not e!818853))))

(assert (=> b!1455175 (= res!985877 e!818852)))

(declare-fun c!134153 () Bool)

(assert (=> b!1455175 (= c!134153 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455176 () Bool)

(assert (=> b!1455176 (= e!818856 e!818857)))

(declare-fun res!985887 () Bool)

(assert (=> b!1455176 (=> (not res!985887) (not e!818857))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455176 (= res!985887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47535 a!2862) j!93) mask!2687) (select (arr!47535 a!2862) j!93) a!2862 mask!2687) lt!637857))))

(assert (=> b!1455176 (= lt!637857 (Intermediate!11787 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455177 () Bool)

(declare-fun res!985878 () Bool)

(assert (=> b!1455177 (=> (not res!985878) (not e!818854))))

(assert (=> b!1455177 (= res!985878 (and (= (size!48085 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48085 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48085 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455178 () Bool)

(assert (=> b!1455178 (= e!818860 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637854 intermediateAfterIndex!19 lt!637856 lt!637852 mask!2687) lt!637851)))))

(declare-fun b!1455179 () Bool)

(declare-fun res!985890 () Bool)

(assert (=> b!1455179 (=> (not res!985890) (not e!818854))))

(assert (=> b!1455179 (= res!985890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455180 () Bool)

(assert (=> b!1455180 (= e!818857 e!818853)))

(declare-fun res!985894 () Bool)

(assert (=> b!1455180 (=> (not res!985894) (not e!818853))))

(assert (=> b!1455180 (= res!985894 (= lt!637850 (Intermediate!11787 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455180 (= lt!637850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637856 mask!2687) lt!637856 lt!637852 mask!2687))))

(assert (=> b!1455180 (= lt!637856 (select (store (arr!47535 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455181 () Bool)

(declare-fun res!985891 () Bool)

(assert (=> b!1455181 (=> res!985891 e!818858)))

(assert (=> b!1455181 (= res!985891 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637854 (select (arr!47535 a!2862) j!93) a!2862 mask!2687) lt!637857)))))

(declare-fun b!1455182 () Bool)

(declare-fun res!985892 () Bool)

(assert (=> b!1455182 (=> (not res!985892) (not e!818853))))

(assert (=> b!1455182 (= res!985892 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455183 () Bool)

(assert (=> b!1455183 (= e!818852 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637856 lt!637852 mask!2687) (seekEntryOrOpen!0 lt!637856 lt!637852 mask!2687)))))

(assert (= (and start!125046 res!985882) b!1455177))

(assert (= (and b!1455177 res!985878) b!1455168))

(assert (= (and b!1455168 res!985883) b!1455170))

(assert (= (and b!1455170 res!985893) b!1455179))

(assert (= (and b!1455179 res!985890) b!1455163))

(assert (= (and b!1455163 res!985880) b!1455174))

(assert (= (and b!1455174 res!985881) b!1455173))

(assert (= (and b!1455173 res!985885) b!1455176))

(assert (= (and b!1455176 res!985887) b!1455169))

(assert (= (and b!1455169 res!985888) b!1455180))

(assert (= (and b!1455180 res!985894) b!1455175))

(assert (= (and b!1455175 c!134153) b!1455166))

(assert (= (and b!1455175 (not c!134153)) b!1455183))

(assert (= (and b!1455175 res!985877) b!1455182))

(assert (= (and b!1455182 res!985892) b!1455162))

(assert (= (and b!1455162 res!985889) b!1455171))

(assert (= (and b!1455171 res!985884) b!1455165))

(assert (= (and b!1455162 (not res!985879)) b!1455164))

(assert (= (and b!1455164 (not res!985886)) b!1455181))

(assert (= (and b!1455181 (not res!985891)) b!1455167))

(assert (= (and b!1455167 c!134154) b!1455172))

(assert (= (and b!1455167 (not c!134154)) b!1455178))

(declare-fun m!1343417 () Bool)

(assert (=> b!1455178 m!1343417))

(declare-fun m!1343419 () Bool)

(assert (=> b!1455176 m!1343419))

(assert (=> b!1455176 m!1343419))

(declare-fun m!1343421 () Bool)

(assert (=> b!1455176 m!1343421))

(assert (=> b!1455176 m!1343421))

(assert (=> b!1455176 m!1343419))

(declare-fun m!1343423 () Bool)

(assert (=> b!1455176 m!1343423))

(declare-fun m!1343425 () Bool)

(assert (=> b!1455165 m!1343425))

(declare-fun m!1343427 () Bool)

(assert (=> b!1455165 m!1343427))

(declare-fun m!1343429 () Bool)

(assert (=> b!1455165 m!1343429))

(declare-fun m!1343431 () Bool)

(assert (=> b!1455165 m!1343431))

(assert (=> b!1455165 m!1343419))

(declare-fun m!1343433 () Bool)

(assert (=> b!1455166 m!1343433))

(declare-fun m!1343435 () Bool)

(assert (=> b!1455162 m!1343435))

(assert (=> b!1455162 m!1343425))

(assert (=> b!1455162 m!1343429))

(assert (=> b!1455162 m!1343431))

(declare-fun m!1343437 () Bool)

(assert (=> b!1455162 m!1343437))

(assert (=> b!1455162 m!1343419))

(assert (=> b!1455173 m!1343425))

(declare-fun m!1343439 () Bool)

(assert (=> b!1455173 m!1343439))

(declare-fun m!1343441 () Bool)

(assert (=> b!1455164 m!1343441))

(declare-fun m!1343443 () Bool)

(assert (=> b!1455164 m!1343443))

(declare-fun m!1343445 () Bool)

(assert (=> b!1455164 m!1343445))

(assert (=> b!1455170 m!1343419))

(assert (=> b!1455170 m!1343419))

(declare-fun m!1343447 () Bool)

(assert (=> b!1455170 m!1343447))

(assert (=> b!1455181 m!1343419))

(assert (=> b!1455181 m!1343419))

(declare-fun m!1343449 () Bool)

(assert (=> b!1455181 m!1343449))

(declare-fun m!1343451 () Bool)

(assert (=> b!1455180 m!1343451))

(assert (=> b!1455180 m!1343451))

(declare-fun m!1343453 () Bool)

(assert (=> b!1455180 m!1343453))

(assert (=> b!1455180 m!1343425))

(declare-fun m!1343455 () Bool)

(assert (=> b!1455180 m!1343455))

(declare-fun m!1343457 () Bool)

(assert (=> b!1455163 m!1343457))

(declare-fun m!1343459 () Bool)

(assert (=> b!1455172 m!1343459))

(declare-fun m!1343461 () Bool)

(assert (=> start!125046 m!1343461))

(declare-fun m!1343463 () Bool)

(assert (=> start!125046 m!1343463))

(declare-fun m!1343465 () Bool)

(assert (=> b!1455179 m!1343465))

(assert (=> b!1455171 m!1343419))

(assert (=> b!1455171 m!1343419))

(declare-fun m!1343467 () Bool)

(assert (=> b!1455171 m!1343467))

(assert (=> b!1455169 m!1343419))

(assert (=> b!1455169 m!1343419))

(declare-fun m!1343469 () Bool)

(assert (=> b!1455169 m!1343469))

(assert (=> b!1455183 m!1343443))

(assert (=> b!1455183 m!1343445))

(declare-fun m!1343471 () Bool)

(assert (=> b!1455168 m!1343471))

(assert (=> b!1455168 m!1343471))

(declare-fun m!1343473 () Bool)

(assert (=> b!1455168 m!1343473))

(check-sat (not b!1455172) (not b!1455170) (not b!1455168) (not b!1455171) (not b!1455181) (not b!1455166) (not b!1455164) (not b!1455179) (not b!1455180) (not b!1455176) (not b!1455183) (not b!1455178) (not b!1455163) (not start!125046) (not b!1455169) (not b!1455162))
(check-sat)
