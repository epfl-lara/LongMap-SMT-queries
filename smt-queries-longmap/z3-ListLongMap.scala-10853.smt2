; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127098 () Bool)

(assert start!127098)

(declare-fun b!1493656 () Bool)

(declare-fun res!1016116 () Bool)

(declare-fun e!836729 () Bool)

(assert (=> b!1493656 (=> (not res!1016116) (not e!836729))))

(declare-datatypes ((array!99745 0))(
  ( (array!99746 (arr!48141 (Array (_ BitVec 32) (_ BitVec 64))) (size!48691 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99745)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99745 (_ BitVec 32)) Bool)

(assert (=> b!1493656 (= res!1016116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493657 () Bool)

(declare-fun res!1016117 () Bool)

(assert (=> b!1493657 (=> (not res!1016117) (not e!836729))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493657 (= res!1016117 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48691 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48691 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48691 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1016126 () Bool)

(assert (=> start!127098 (=> (not res!1016126) (not e!836729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127098 (= res!1016126 (validMask!0 mask!2687))))

(assert (=> start!127098 e!836729))

(assert (=> start!127098 true))

(declare-fun array_inv!37169 (array!99745) Bool)

(assert (=> start!127098 (array_inv!37169 a!2862)))

(declare-fun b!1493658 () Bool)

(declare-fun res!1016129 () Bool)

(assert (=> b!1493658 (=> (not res!1016129) (not e!836729))))

(declare-datatypes ((List!34642 0))(
  ( (Nil!34639) (Cons!34638 (h!36027 (_ BitVec 64)) (t!49336 List!34642)) )
))
(declare-fun arrayNoDuplicates!0 (array!99745 (_ BitVec 32) List!34642) Bool)

(assert (=> b!1493658 (= res!1016129 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34639))))

(declare-fun b!1493659 () Bool)

(declare-fun res!1016131 () Bool)

(declare-fun e!836722 () Bool)

(assert (=> b!1493659 (=> (not res!1016131) (not e!836722))))

(declare-datatypes ((SeekEntryResult!12381 0))(
  ( (MissingZero!12381 (index!51916 (_ BitVec 32))) (Found!12381 (index!51917 (_ BitVec 32))) (Intermediate!12381 (undefined!13193 Bool) (index!51918 (_ BitVec 32)) (x!133517 (_ BitVec 32))) (Undefined!12381) (MissingVacant!12381 (index!51919 (_ BitVec 32))) )
))
(declare-fun lt!651100 () SeekEntryResult!12381)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12381)

(assert (=> b!1493659 (= res!1016131 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48141 a!2862) j!93) a!2862 mask!2687) lt!651100))))

(declare-fun b!1493660 () Bool)

(declare-fun e!836724 () Bool)

(assert (=> b!1493660 (= e!836729 e!836724)))

(declare-fun res!1016130 () Bool)

(assert (=> b!1493660 (=> (not res!1016130) (not e!836724))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493660 (= res!1016130 (= (select (store (arr!48141 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651099 () array!99745)

(assert (=> b!1493660 (= lt!651099 (array!99746 (store (arr!48141 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48691 a!2862)))))

(declare-fun b!1493661 () Bool)

(declare-fun res!1016120 () Bool)

(assert (=> b!1493661 (=> (not res!1016120) (not e!836729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493661 (= res!1016120 (validKeyInArray!0 (select (arr!48141 a!2862) i!1006)))))

(declare-fun lt!651098 () (_ BitVec 64))

(declare-fun e!836728 () Bool)

(declare-fun b!1493662 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12381)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99745 (_ BitVec 32)) SeekEntryResult!12381)

(assert (=> b!1493662 (= e!836728 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651098 lt!651099 mask!2687) (seekEntryOrOpen!0 lt!651098 lt!651099 mask!2687)))))

(declare-fun b!1493663 () Bool)

(declare-fun res!1016124 () Bool)

(declare-fun e!836727 () Bool)

(assert (=> b!1493663 (=> (not res!1016124) (not e!836727))))

(assert (=> b!1493663 (= res!1016124 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493664 () Bool)

(declare-fun e!836723 () Bool)

(assert (=> b!1493664 (= e!836723 (or (= (select (arr!48141 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48141 a!2862) intermediateBeforeIndex!19) (select (arr!48141 a!2862) j!93))))))

(declare-fun b!1493665 () Bool)

(declare-fun lt!651101 () SeekEntryResult!12381)

(assert (=> b!1493665 (= e!836728 (= lt!651101 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651098 lt!651099 mask!2687)))))

(declare-fun b!1493666 () Bool)

(declare-fun e!836726 () Bool)

(assert (=> b!1493666 (= e!836727 (not e!836726))))

(declare-fun res!1016128 () Bool)

(assert (=> b!1493666 (=> res!1016128 e!836726)))

(assert (=> b!1493666 (= res!1016128 (or (and (= (select (arr!48141 a!2862) index!646) (select (store (arr!48141 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48141 a!2862) index!646) (select (arr!48141 a!2862) j!93))) (= (select (arr!48141 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493666 e!836723))

(declare-fun res!1016122 () Bool)

(assert (=> b!1493666 (=> (not res!1016122) (not e!836723))))

(assert (=> b!1493666 (= res!1016122 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50102 0))(
  ( (Unit!50103) )
))
(declare-fun lt!651102 () Unit!50102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50102)

(assert (=> b!1493666 (= lt!651102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493667 () Bool)

(declare-fun res!1016121 () Bool)

(assert (=> b!1493667 (=> (not res!1016121) (not e!836729))))

(assert (=> b!1493667 (= res!1016121 (and (= (size!48691 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48691 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48691 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493668 () Bool)

(assert (=> b!1493668 (= e!836726 true)))

(declare-fun lt!651097 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493668 (= lt!651097 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493669 () Bool)

(declare-fun res!1016125 () Bool)

(assert (=> b!1493669 (=> (not res!1016125) (not e!836723))))

(assert (=> b!1493669 (= res!1016125 (= (seekEntryOrOpen!0 (select (arr!48141 a!2862) j!93) a!2862 mask!2687) (Found!12381 j!93)))))

(declare-fun b!1493670 () Bool)

(assert (=> b!1493670 (= e!836722 e!836727)))

(declare-fun res!1016118 () Bool)

(assert (=> b!1493670 (=> (not res!1016118) (not e!836727))))

(assert (=> b!1493670 (= res!1016118 (= lt!651101 (Intermediate!12381 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493670 (= lt!651101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651098 mask!2687) lt!651098 lt!651099 mask!2687))))

(assert (=> b!1493670 (= lt!651098 (select (store (arr!48141 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493671 () Bool)

(assert (=> b!1493671 (= e!836724 e!836722)))

(declare-fun res!1016123 () Bool)

(assert (=> b!1493671 (=> (not res!1016123) (not e!836722))))

(assert (=> b!1493671 (= res!1016123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48141 a!2862) j!93) mask!2687) (select (arr!48141 a!2862) j!93) a!2862 mask!2687) lt!651100))))

(assert (=> b!1493671 (= lt!651100 (Intermediate!12381 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493672 () Bool)

(declare-fun res!1016119 () Bool)

(assert (=> b!1493672 (=> (not res!1016119) (not e!836729))))

(assert (=> b!1493672 (= res!1016119 (validKeyInArray!0 (select (arr!48141 a!2862) j!93)))))

(declare-fun b!1493673 () Bool)

(declare-fun res!1016127 () Bool)

(assert (=> b!1493673 (=> (not res!1016127) (not e!836727))))

(assert (=> b!1493673 (= res!1016127 e!836728)))

(declare-fun c!138300 () Bool)

(assert (=> b!1493673 (= c!138300 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!127098 res!1016126) b!1493667))

(assert (= (and b!1493667 res!1016121) b!1493661))

(assert (= (and b!1493661 res!1016120) b!1493672))

(assert (= (and b!1493672 res!1016119) b!1493656))

(assert (= (and b!1493656 res!1016116) b!1493658))

(assert (= (and b!1493658 res!1016129) b!1493657))

(assert (= (and b!1493657 res!1016117) b!1493660))

(assert (= (and b!1493660 res!1016130) b!1493671))

(assert (= (and b!1493671 res!1016123) b!1493659))

(assert (= (and b!1493659 res!1016131) b!1493670))

(assert (= (and b!1493670 res!1016118) b!1493673))

(assert (= (and b!1493673 c!138300) b!1493665))

(assert (= (and b!1493673 (not c!138300)) b!1493662))

(assert (= (and b!1493673 res!1016127) b!1493663))

(assert (= (and b!1493663 res!1016124) b!1493666))

(assert (= (and b!1493666 res!1016122) b!1493669))

(assert (= (and b!1493669 res!1016125) b!1493664))

(assert (= (and b!1493666 (not res!1016128)) b!1493668))

(declare-fun m!1377431 () Bool)

(assert (=> b!1493672 m!1377431))

(assert (=> b!1493672 m!1377431))

(declare-fun m!1377433 () Bool)

(assert (=> b!1493672 m!1377433))

(declare-fun m!1377435 () Bool)

(assert (=> start!127098 m!1377435))

(declare-fun m!1377437 () Bool)

(assert (=> start!127098 m!1377437))

(declare-fun m!1377439 () Bool)

(assert (=> b!1493660 m!1377439))

(declare-fun m!1377441 () Bool)

(assert (=> b!1493660 m!1377441))

(declare-fun m!1377443 () Bool)

(assert (=> b!1493665 m!1377443))

(assert (=> b!1493659 m!1377431))

(assert (=> b!1493659 m!1377431))

(declare-fun m!1377445 () Bool)

(assert (=> b!1493659 m!1377445))

(assert (=> b!1493669 m!1377431))

(assert (=> b!1493669 m!1377431))

(declare-fun m!1377447 () Bool)

(assert (=> b!1493669 m!1377447))

(declare-fun m!1377449 () Bool)

(assert (=> b!1493670 m!1377449))

(assert (=> b!1493670 m!1377449))

(declare-fun m!1377451 () Bool)

(assert (=> b!1493670 m!1377451))

(assert (=> b!1493670 m!1377439))

(declare-fun m!1377453 () Bool)

(assert (=> b!1493670 m!1377453))

(declare-fun m!1377455 () Bool)

(assert (=> b!1493662 m!1377455))

(declare-fun m!1377457 () Bool)

(assert (=> b!1493662 m!1377457))

(declare-fun m!1377459 () Bool)

(assert (=> b!1493661 m!1377459))

(assert (=> b!1493661 m!1377459))

(declare-fun m!1377461 () Bool)

(assert (=> b!1493661 m!1377461))

(declare-fun m!1377463 () Bool)

(assert (=> b!1493668 m!1377463))

(declare-fun m!1377465 () Bool)

(assert (=> b!1493656 m!1377465))

(declare-fun m!1377467 () Bool)

(assert (=> b!1493658 m!1377467))

(declare-fun m!1377469 () Bool)

(assert (=> b!1493664 m!1377469))

(assert (=> b!1493664 m!1377431))

(assert (=> b!1493671 m!1377431))

(assert (=> b!1493671 m!1377431))

(declare-fun m!1377471 () Bool)

(assert (=> b!1493671 m!1377471))

(assert (=> b!1493671 m!1377471))

(assert (=> b!1493671 m!1377431))

(declare-fun m!1377473 () Bool)

(assert (=> b!1493671 m!1377473))

(declare-fun m!1377475 () Bool)

(assert (=> b!1493666 m!1377475))

(assert (=> b!1493666 m!1377439))

(declare-fun m!1377477 () Bool)

(assert (=> b!1493666 m!1377477))

(declare-fun m!1377479 () Bool)

(assert (=> b!1493666 m!1377479))

(declare-fun m!1377481 () Bool)

(assert (=> b!1493666 m!1377481))

(assert (=> b!1493666 m!1377431))

(check-sat (not b!1493670) (not b!1493671) (not b!1493656) (not b!1493672) (not b!1493665) (not b!1493662) (not b!1493659) (not start!127098) (not b!1493666) (not b!1493661) (not b!1493668) (not b!1493658) (not b!1493669))
(check-sat)
