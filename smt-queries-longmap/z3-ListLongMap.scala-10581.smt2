; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124594 () Bool)

(assert start!124594)

(declare-fun b!1443121 () Bool)

(declare-fun res!975361 () Bool)

(declare-fun e!813236 () Bool)

(assert (=> b!1443121 (=> (not res!975361) (not e!813236))))

(declare-fun e!813233 () Bool)

(assert (=> b!1443121 (= res!975361 e!813233)))

(declare-fun c!133396 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443121 (= c!133396 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443122 () Bool)

(declare-fun res!975368 () Bool)

(declare-fun e!813232 () Bool)

(assert (=> b!1443122 (=> (not res!975368) (not e!813232))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98020 0))(
  ( (array!98021 (arr!47299 (Array (_ BitVec 32) (_ BitVec 64))) (size!47851 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98020)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11576 0))(
  ( (MissingZero!11576 (index!48696 (_ BitVec 32))) (Found!11576 (index!48697 (_ BitVec 32))) (Intermediate!11576 (undefined!12388 Bool) (index!48698 (_ BitVec 32)) (x!130396 (_ BitVec 32))) (Undefined!11576) (MissingVacant!11576 (index!48699 (_ BitVec 32))) )
))
(declare-fun lt!633583 () SeekEntryResult!11576)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11576)

(assert (=> b!1443122 (= res!975368 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633583))))

(declare-fun b!1443123 () Bool)

(declare-fun e!813235 () Bool)

(declare-fun e!813237 () Bool)

(assert (=> b!1443123 (= e!813235 e!813237)))

(declare-fun res!975370 () Bool)

(assert (=> b!1443123 (=> (not res!975370) (not e!813237))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443123 (= res!975370 (= (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633585 () array!98020)

(assert (=> b!1443123 (= lt!633585 (array!98021 (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47851 a!2862)))))

(declare-fun b!1443124 () Bool)

(declare-fun res!975366 () Bool)

(declare-fun e!813230 () Bool)

(assert (=> b!1443124 (=> (not res!975366) (not e!813230))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11576)

(assert (=> b!1443124 (= res!975366 (= (seekEntryOrOpen!0 (select (arr!47299 a!2862) j!93) a!2862 mask!2687) (Found!11576 j!93)))))

(declare-fun b!1443125 () Bool)

(declare-fun e!813231 () Bool)

(assert (=> b!1443125 (= e!813236 (not e!813231))))

(declare-fun res!975369 () Bool)

(assert (=> b!1443125 (=> res!975369 e!813231)))

(assert (=> b!1443125 (= res!975369 (or (not (= (select (arr!47299 a!2862) index!646) (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47299 a!2862) index!646) (select (arr!47299 a!2862) j!93)))))))

(assert (=> b!1443125 e!813230))

(declare-fun res!975360 () Bool)

(assert (=> b!1443125 (=> (not res!975360) (not e!813230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98020 (_ BitVec 32)) Bool)

(assert (=> b!1443125 (= res!975360 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48489 0))(
  ( (Unit!48490) )
))
(declare-fun lt!633586 () Unit!48489)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48489)

(assert (=> b!1443125 (= lt!633586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443126 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1443126 (= e!813230 (or (= (select (arr!47299 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47299 a!2862) intermediateBeforeIndex!19) (select (arr!47299 a!2862) j!93))))))

(declare-fun b!1443127 () Bool)

(declare-fun res!975356 () Bool)

(assert (=> b!1443127 (=> (not res!975356) (not e!813235))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443127 (= res!975356 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47851 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47851 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47851 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443128 () Bool)

(declare-fun res!975365 () Bool)

(assert (=> b!1443128 (=> (not res!975365) (not e!813235))))

(assert (=> b!1443128 (= res!975365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443130 () Bool)

(declare-fun res!975357 () Bool)

(assert (=> b!1443130 (=> (not res!975357) (not e!813236))))

(assert (=> b!1443130 (= res!975357 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443131 () Bool)

(assert (=> b!1443131 (= e!813231 true)))

(declare-fun lt!633584 () (_ BitVec 64))

(declare-fun lt!633588 () SeekEntryResult!11576)

(assert (=> b!1443131 (= lt!633588 (seekEntryOrOpen!0 lt!633584 lt!633585 mask!2687))))

(declare-fun b!1443132 () Bool)

(assert (=> b!1443132 (= e!813232 e!813236)))

(declare-fun res!975367 () Bool)

(assert (=> b!1443132 (=> (not res!975367) (not e!813236))))

(declare-fun lt!633587 () SeekEntryResult!11576)

(assert (=> b!1443132 (= res!975367 (= lt!633587 (Intermediate!11576 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443132 (= lt!633587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633584 mask!2687) lt!633584 lt!633585 mask!2687))))

(assert (=> b!1443132 (= lt!633584 (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443133 () Bool)

(declare-fun res!975355 () Bool)

(assert (=> b!1443133 (=> (not res!975355) (not e!813235))))

(assert (=> b!1443133 (= res!975355 (and (= (size!47851 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47851 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47851 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443134 () Bool)

(declare-fun res!975362 () Bool)

(assert (=> b!1443134 (=> (not res!975362) (not e!813235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443134 (= res!975362 (validKeyInArray!0 (select (arr!47299 a!2862) j!93)))))

(declare-fun b!1443135 () Bool)

(assert (=> b!1443135 (= e!813237 e!813232)))

(declare-fun res!975358 () Bool)

(assert (=> b!1443135 (=> (not res!975358) (not e!813232))))

(assert (=> b!1443135 (= res!975358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47299 a!2862) j!93) mask!2687) (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633583))))

(assert (=> b!1443135 (= lt!633583 (Intermediate!11576 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443136 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98020 (_ BitVec 32)) SeekEntryResult!11576)

(assert (=> b!1443136 (= e!813233 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633584 lt!633585 mask!2687) (seekEntryOrOpen!0 lt!633584 lt!633585 mask!2687)))))

(declare-fun b!1443137 () Bool)

(assert (=> b!1443137 (= e!813233 (= lt!633587 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633584 lt!633585 mask!2687)))))

(declare-fun b!1443138 () Bool)

(declare-fun res!975359 () Bool)

(assert (=> b!1443138 (=> (not res!975359) (not e!813235))))

(assert (=> b!1443138 (= res!975359 (validKeyInArray!0 (select (arr!47299 a!2862) i!1006)))))

(declare-fun res!975363 () Bool)

(assert (=> start!124594 (=> (not res!975363) (not e!813235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124594 (= res!975363 (validMask!0 mask!2687))))

(assert (=> start!124594 e!813235))

(assert (=> start!124594 true))

(declare-fun array_inv!36532 (array!98020) Bool)

(assert (=> start!124594 (array_inv!36532 a!2862)))

(declare-fun b!1443129 () Bool)

(declare-fun res!975364 () Bool)

(assert (=> b!1443129 (=> (not res!975364) (not e!813235))))

(declare-datatypes ((List!33878 0))(
  ( (Nil!33875) (Cons!33874 (h!35224 (_ BitVec 64)) (t!48564 List!33878)) )
))
(declare-fun arrayNoDuplicates!0 (array!98020 (_ BitVec 32) List!33878) Bool)

(assert (=> b!1443129 (= res!975364 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33875))))

(assert (= (and start!124594 res!975363) b!1443133))

(assert (= (and b!1443133 res!975355) b!1443138))

(assert (= (and b!1443138 res!975359) b!1443134))

(assert (= (and b!1443134 res!975362) b!1443128))

(assert (= (and b!1443128 res!975365) b!1443129))

(assert (= (and b!1443129 res!975364) b!1443127))

(assert (= (and b!1443127 res!975356) b!1443123))

(assert (= (and b!1443123 res!975370) b!1443135))

(assert (= (and b!1443135 res!975358) b!1443122))

(assert (= (and b!1443122 res!975368) b!1443132))

(assert (= (and b!1443132 res!975367) b!1443121))

(assert (= (and b!1443121 c!133396) b!1443137))

(assert (= (and b!1443121 (not c!133396)) b!1443136))

(assert (= (and b!1443121 res!975361) b!1443130))

(assert (= (and b!1443130 res!975357) b!1443125))

(assert (= (and b!1443125 res!975360) b!1443124))

(assert (= (and b!1443124 res!975366) b!1443126))

(assert (= (and b!1443125 (not res!975369)) b!1443131))

(declare-fun m!1331727 () Bool)

(assert (=> b!1443125 m!1331727))

(declare-fun m!1331729 () Bool)

(assert (=> b!1443125 m!1331729))

(declare-fun m!1331731 () Bool)

(assert (=> b!1443125 m!1331731))

(declare-fun m!1331733 () Bool)

(assert (=> b!1443125 m!1331733))

(declare-fun m!1331735 () Bool)

(assert (=> b!1443125 m!1331735))

(declare-fun m!1331737 () Bool)

(assert (=> b!1443125 m!1331737))

(declare-fun m!1331739 () Bool)

(assert (=> b!1443126 m!1331739))

(assert (=> b!1443126 m!1331737))

(declare-fun m!1331741 () Bool)

(assert (=> b!1443136 m!1331741))

(declare-fun m!1331743 () Bool)

(assert (=> b!1443136 m!1331743))

(declare-fun m!1331745 () Bool)

(assert (=> b!1443137 m!1331745))

(assert (=> b!1443131 m!1331743))

(declare-fun m!1331747 () Bool)

(assert (=> start!124594 m!1331747))

(declare-fun m!1331749 () Bool)

(assert (=> start!124594 m!1331749))

(assert (=> b!1443123 m!1331729))

(declare-fun m!1331751 () Bool)

(assert (=> b!1443123 m!1331751))

(assert (=> b!1443124 m!1331737))

(assert (=> b!1443124 m!1331737))

(declare-fun m!1331753 () Bool)

(assert (=> b!1443124 m!1331753))

(declare-fun m!1331755 () Bool)

(assert (=> b!1443129 m!1331755))

(assert (=> b!1443122 m!1331737))

(assert (=> b!1443122 m!1331737))

(declare-fun m!1331757 () Bool)

(assert (=> b!1443122 m!1331757))

(assert (=> b!1443135 m!1331737))

(assert (=> b!1443135 m!1331737))

(declare-fun m!1331759 () Bool)

(assert (=> b!1443135 m!1331759))

(assert (=> b!1443135 m!1331759))

(assert (=> b!1443135 m!1331737))

(declare-fun m!1331761 () Bool)

(assert (=> b!1443135 m!1331761))

(declare-fun m!1331763 () Bool)

(assert (=> b!1443138 m!1331763))

(assert (=> b!1443138 m!1331763))

(declare-fun m!1331765 () Bool)

(assert (=> b!1443138 m!1331765))

(declare-fun m!1331767 () Bool)

(assert (=> b!1443128 m!1331767))

(assert (=> b!1443134 m!1331737))

(assert (=> b!1443134 m!1331737))

(declare-fun m!1331769 () Bool)

(assert (=> b!1443134 m!1331769))

(declare-fun m!1331771 () Bool)

(assert (=> b!1443132 m!1331771))

(assert (=> b!1443132 m!1331771))

(declare-fun m!1331773 () Bool)

(assert (=> b!1443132 m!1331773))

(assert (=> b!1443132 m!1331729))

(declare-fun m!1331775 () Bool)

(assert (=> b!1443132 m!1331775))

(check-sat (not b!1443132) (not b!1443136) (not b!1443125) (not b!1443134) (not b!1443124) (not b!1443138) (not b!1443131) (not b!1443122) (not b!1443137) (not b!1443128) (not start!124594) (not b!1443129) (not b!1443135))
(check-sat)
