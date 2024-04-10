; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125108 () Bool)

(assert start!125108)

(declare-datatypes ((array!98556 0))(
  ( (array!98557 (arr!47566 (Array (_ BitVec 32) (_ BitVec 64))) (size!48116 (_ BitVec 32))) )
))
(declare-fun lt!638600 () array!98556)

(declare-fun lt!638598 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!819785 () Bool)

(declare-datatypes ((SeekEntryResult!11818 0))(
  ( (MissingZero!11818 (index!49664 (_ BitVec 32))) (Found!11818 (index!49665 (_ BitVec 32))) (Intermediate!11818 (undefined!12630 Bool) (index!49666 (_ BitVec 32)) (x!131283 (_ BitVec 32))) (Undefined!11818) (MissingVacant!11818 (index!49667 (_ BitVec 32))) )
))
(declare-fun lt!638597 () SeekEntryResult!11818)

(declare-fun b!1457208 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98556 (_ BitVec 32)) SeekEntryResult!11818)

(assert (=> b!1457208 (= e!819785 (= lt!638597 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638598 lt!638600 mask!2687)))))

(declare-fun b!1457209 () Bool)

(declare-fun res!987567 () Bool)

(declare-fun e!819788 () Bool)

(assert (=> b!1457209 (=> (not res!987567) (not e!819788))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98556)

(assert (=> b!1457209 (= res!987567 (and (= (size!48116 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48116 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48116 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457210 () Bool)

(declare-fun res!987557 () Bool)

(declare-fun e!819790 () Bool)

(assert (=> b!1457210 (=> (not res!987557) (not e!819790))))

(assert (=> b!1457210 (= res!987557 e!819785)))

(declare-fun c!134339 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457210 (= c!134339 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!987552 () Bool)

(assert (=> start!125108 (=> (not res!987552) (not e!819788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125108 (= res!987552 (validMask!0 mask!2687))))

(assert (=> start!125108 e!819788))

(assert (=> start!125108 true))

(declare-fun array_inv!36594 (array!98556) Bool)

(assert (=> start!125108 (array_inv!36594 a!2862)))

(declare-fun b!1457211 () Bool)

(declare-fun res!987559 () Bool)

(assert (=> b!1457211 (=> (not res!987559) (not e!819788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457211 (= res!987559 (validKeyInArray!0 (select (arr!47566 a!2862) j!93)))))

(declare-fun b!1457212 () Bool)

(declare-fun e!819783 () Bool)

(assert (=> b!1457212 (= e!819788 e!819783)))

(declare-fun res!987561 () Bool)

(assert (=> b!1457212 (=> (not res!987561) (not e!819783))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457212 (= res!987561 (= (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457212 (= lt!638600 (array!98557 (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48116 a!2862)))))

(declare-fun b!1457213 () Bool)

(declare-fun e!819782 () Bool)

(declare-fun e!819784 () Bool)

(assert (=> b!1457213 (= e!819782 e!819784)))

(declare-fun res!987560 () Bool)

(assert (=> b!1457213 (=> res!987560 e!819784)))

(declare-fun lt!638601 () (_ BitVec 32))

(assert (=> b!1457213 (= res!987560 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638601 #b00000000000000000000000000000000) (bvsge lt!638601 (size!48116 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457213 (= lt!638601 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638594 () SeekEntryResult!11818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98556 (_ BitVec 32)) SeekEntryResult!11818)

(assert (=> b!1457213 (= lt!638594 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638598 lt!638600 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98556 (_ BitVec 32)) SeekEntryResult!11818)

(assert (=> b!1457213 (= lt!638594 (seekEntryOrOpen!0 lt!638598 lt!638600 mask!2687))))

(declare-fun b!1457214 () Bool)

(declare-fun res!987564 () Bool)

(assert (=> b!1457214 (=> res!987564 e!819784)))

(declare-fun lt!638596 () SeekEntryResult!11818)

(assert (=> b!1457214 (= res!987564 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638596)))))

(declare-fun b!1457215 () Bool)

(assert (=> b!1457215 (= e!819784 true)))

(declare-fun lt!638595 () Bool)

(declare-fun e!819789 () Bool)

(assert (=> b!1457215 (= lt!638595 e!819789)))

(declare-fun c!134340 () Bool)

(assert (=> b!1457215 (= c!134340 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457216 () Bool)

(declare-fun res!987562 () Bool)

(declare-fun e!819786 () Bool)

(assert (=> b!1457216 (=> (not res!987562) (not e!819786))))

(assert (=> b!1457216 (= res!987562 (= (seekEntryOrOpen!0 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) (Found!11818 j!93)))))

(declare-fun b!1457217 () Bool)

(declare-fun e!819791 () Bool)

(assert (=> b!1457217 (= e!819783 e!819791)))

(declare-fun res!987553 () Bool)

(assert (=> b!1457217 (=> (not res!987553) (not e!819791))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457217 (= res!987553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47566 a!2862) j!93) mask!2687) (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638596))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457217 (= lt!638596 (Intermediate!11818 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457218 () Bool)

(declare-fun res!987565 () Bool)

(assert (=> b!1457218 (=> (not res!987565) (not e!819788))))

(declare-datatypes ((List!34067 0))(
  ( (Nil!34064) (Cons!34063 (h!35413 (_ BitVec 64)) (t!48761 List!34067)) )
))
(declare-fun arrayNoDuplicates!0 (array!98556 (_ BitVec 32) List!34067) Bool)

(assert (=> b!1457218 (= res!987565 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34064))))

(declare-fun b!1457219 () Bool)

(declare-fun res!987566 () Bool)

(assert (=> b!1457219 (=> (not res!987566) (not e!819788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98556 (_ BitVec 32)) Bool)

(assert (=> b!1457219 (= res!987566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457220 () Bool)

(assert (=> b!1457220 (= e!819790 (not e!819782))))

(declare-fun res!987555 () Bool)

(assert (=> b!1457220 (=> res!987555 e!819782)))

(assert (=> b!1457220 (= res!987555 (or (and (= (select (arr!47566 a!2862) index!646) (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457220 e!819786))

(declare-fun res!987563 () Bool)

(assert (=> b!1457220 (=> (not res!987563) (not e!819786))))

(assert (=> b!1457220 (= res!987563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49132 0))(
  ( (Unit!49133) )
))
(declare-fun lt!638599 () Unit!49132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49132)

(assert (=> b!1457220 (= lt!638599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457221 () Bool)

(assert (=> b!1457221 (= e!819786 (and (or (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47566 a!2862) intermediateBeforeIndex!19) (select (arr!47566 a!2862) j!93))) (let ((bdg!53311 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47566 a!2862) index!646) bdg!53311) (= (select (arr!47566 a!2862) index!646) (select (arr!47566 a!2862) j!93))) (= (select (arr!47566 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53311 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457222 () Bool)

(declare-fun res!987558 () Bool)

(assert (=> b!1457222 (=> (not res!987558) (not e!819790))))

(assert (=> b!1457222 (= res!987558 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457223 () Bool)

(assert (=> b!1457223 (= e!819791 e!819790)))

(declare-fun res!987568 () Bool)

(assert (=> b!1457223 (=> (not res!987568) (not e!819790))))

(assert (=> b!1457223 (= res!987568 (= lt!638597 (Intermediate!11818 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457223 (= lt!638597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638598 mask!2687) lt!638598 lt!638600 mask!2687))))

(assert (=> b!1457223 (= lt!638598 (select (store (arr!47566 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457224 () Bool)

(assert (=> b!1457224 (= e!819789 (not (= lt!638597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 lt!638598 lt!638600 mask!2687))))))

(declare-fun b!1457225 () Bool)

(declare-fun res!987551 () Bool)

(assert (=> b!1457225 (=> (not res!987551) (not e!819791))))

(assert (=> b!1457225 (= res!987551 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47566 a!2862) j!93) a!2862 mask!2687) lt!638596))))

(declare-fun b!1457226 () Bool)

(assert (=> b!1457226 (= e!819785 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638598 lt!638600 mask!2687) (seekEntryOrOpen!0 lt!638598 lt!638600 mask!2687)))))

(declare-fun b!1457227 () Bool)

(declare-fun res!987556 () Bool)

(assert (=> b!1457227 (=> (not res!987556) (not e!819788))))

(assert (=> b!1457227 (= res!987556 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48116 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48116 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48116 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457228 () Bool)

(assert (=> b!1457228 (= e!819789 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638601 intermediateAfterIndex!19 lt!638598 lt!638600 mask!2687) lt!638594)))))

(declare-fun b!1457229 () Bool)

(declare-fun res!987554 () Bool)

(assert (=> b!1457229 (=> (not res!987554) (not e!819788))))

(assert (=> b!1457229 (= res!987554 (validKeyInArray!0 (select (arr!47566 a!2862) i!1006)))))

(assert (= (and start!125108 res!987552) b!1457209))

(assert (= (and b!1457209 res!987567) b!1457229))

(assert (= (and b!1457229 res!987554) b!1457211))

(assert (= (and b!1457211 res!987559) b!1457219))

(assert (= (and b!1457219 res!987566) b!1457218))

(assert (= (and b!1457218 res!987565) b!1457227))

(assert (= (and b!1457227 res!987556) b!1457212))

(assert (= (and b!1457212 res!987561) b!1457217))

(assert (= (and b!1457217 res!987553) b!1457225))

(assert (= (and b!1457225 res!987551) b!1457223))

(assert (= (and b!1457223 res!987568) b!1457210))

(assert (= (and b!1457210 c!134339) b!1457208))

(assert (= (and b!1457210 (not c!134339)) b!1457226))

(assert (= (and b!1457210 res!987557) b!1457222))

(assert (= (and b!1457222 res!987558) b!1457220))

(assert (= (and b!1457220 res!987563) b!1457216))

(assert (= (and b!1457216 res!987562) b!1457221))

(assert (= (and b!1457220 (not res!987555)) b!1457213))

(assert (= (and b!1457213 (not res!987560)) b!1457214))

(assert (= (and b!1457214 (not res!987564)) b!1457215))

(assert (= (and b!1457215 c!134340) b!1457224))

(assert (= (and b!1457215 (not c!134340)) b!1457228))

(declare-fun m!1345215 () Bool)

(assert (=> b!1457217 m!1345215))

(assert (=> b!1457217 m!1345215))

(declare-fun m!1345217 () Bool)

(assert (=> b!1457217 m!1345217))

(assert (=> b!1457217 m!1345217))

(assert (=> b!1457217 m!1345215))

(declare-fun m!1345219 () Bool)

(assert (=> b!1457217 m!1345219))

(assert (=> b!1457216 m!1345215))

(assert (=> b!1457216 m!1345215))

(declare-fun m!1345221 () Bool)

(assert (=> b!1457216 m!1345221))

(declare-fun m!1345223 () Bool)

(assert (=> b!1457220 m!1345223))

(declare-fun m!1345225 () Bool)

(assert (=> b!1457220 m!1345225))

(declare-fun m!1345227 () Bool)

(assert (=> b!1457220 m!1345227))

(declare-fun m!1345229 () Bool)

(assert (=> b!1457220 m!1345229))

(declare-fun m!1345231 () Bool)

(assert (=> b!1457220 m!1345231))

(assert (=> b!1457220 m!1345215))

(declare-fun m!1345233 () Bool)

(assert (=> b!1457223 m!1345233))

(assert (=> b!1457223 m!1345233))

(declare-fun m!1345235 () Bool)

(assert (=> b!1457223 m!1345235))

(assert (=> b!1457223 m!1345225))

(declare-fun m!1345237 () Bool)

(assert (=> b!1457223 m!1345237))

(declare-fun m!1345239 () Bool)

(assert (=> b!1457219 m!1345239))

(assert (=> b!1457211 m!1345215))

(assert (=> b!1457211 m!1345215))

(declare-fun m!1345241 () Bool)

(assert (=> b!1457211 m!1345241))

(assert (=> b!1457225 m!1345215))

(assert (=> b!1457225 m!1345215))

(declare-fun m!1345243 () Bool)

(assert (=> b!1457225 m!1345243))

(declare-fun m!1345245 () Bool)

(assert (=> b!1457226 m!1345245))

(declare-fun m!1345247 () Bool)

(assert (=> b!1457226 m!1345247))

(declare-fun m!1345249 () Bool)

(assert (=> start!125108 m!1345249))

(declare-fun m!1345251 () Bool)

(assert (=> start!125108 m!1345251))

(declare-fun m!1345253 () Bool)

(assert (=> b!1457208 m!1345253))

(assert (=> b!1457221 m!1345225))

(declare-fun m!1345255 () Bool)

(assert (=> b!1457221 m!1345255))

(assert (=> b!1457221 m!1345227))

(assert (=> b!1457221 m!1345229))

(assert (=> b!1457221 m!1345215))

(declare-fun m!1345257 () Bool)

(assert (=> b!1457218 m!1345257))

(declare-fun m!1345259 () Bool)

(assert (=> b!1457224 m!1345259))

(declare-fun m!1345261 () Bool)

(assert (=> b!1457213 m!1345261))

(assert (=> b!1457213 m!1345245))

(assert (=> b!1457213 m!1345247))

(assert (=> b!1457212 m!1345225))

(declare-fun m!1345263 () Bool)

(assert (=> b!1457212 m!1345263))

(assert (=> b!1457214 m!1345215))

(assert (=> b!1457214 m!1345215))

(declare-fun m!1345265 () Bool)

(assert (=> b!1457214 m!1345265))

(declare-fun m!1345267 () Bool)

(assert (=> b!1457229 m!1345267))

(assert (=> b!1457229 m!1345267))

(declare-fun m!1345269 () Bool)

(assert (=> b!1457229 m!1345269))

(declare-fun m!1345271 () Bool)

(assert (=> b!1457228 m!1345271))

(push 1)

