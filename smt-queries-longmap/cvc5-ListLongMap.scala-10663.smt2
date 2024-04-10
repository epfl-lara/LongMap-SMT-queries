; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125116 () Bool)

(assert start!125116)

(declare-fun b!1457473 () Bool)

(declare-fun e!819906 () Bool)

(declare-fun e!819903 () Bool)

(assert (=> b!1457473 (= e!819906 e!819903)))

(declare-fun res!987782 () Bool)

(assert (=> b!1457473 (=> (not res!987782) (not e!819903))))

(declare-datatypes ((SeekEntryResult!11822 0))(
  ( (MissingZero!11822 (index!49680 (_ BitVec 32))) (Found!11822 (index!49681 (_ BitVec 32))) (Intermediate!11822 (undefined!12634 Bool) (index!49682 (_ BitVec 32)) (x!131303 (_ BitVec 32))) (Undefined!11822) (MissingVacant!11822 (index!49683 (_ BitVec 32))) )
))
(declare-fun lt!638693 () SeekEntryResult!11822)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457473 (= res!987782 (= lt!638693 (Intermediate!11822 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638696 () (_ BitVec 64))

(declare-datatypes ((array!98564 0))(
  ( (array!98565 (arr!47570 (Array (_ BitVec 32) (_ BitVec 64))) (size!48120 (_ BitVec 32))) )
))
(declare-fun lt!638695 () array!98564)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98564 (_ BitVec 32)) SeekEntryResult!11822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457473 (= lt!638693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638696 mask!2687) lt!638696 lt!638695 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98564)

(assert (=> b!1457473 (= lt!638696 (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457474 () Bool)

(declare-fun e!819910 () Bool)

(declare-fun e!819909 () Bool)

(assert (=> b!1457474 (= e!819910 e!819909)))

(declare-fun res!987772 () Bool)

(assert (=> b!1457474 (=> (not res!987772) (not e!819909))))

(assert (=> b!1457474 (= res!987772 (= (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457474 (= lt!638695 (array!98565 (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48120 a!2862)))))

(declare-fun b!1457475 () Bool)

(declare-fun res!987770 () Bool)

(assert (=> b!1457475 (=> (not res!987770) (not e!819910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98564 (_ BitVec 32)) Bool)

(assert (=> b!1457475 (= res!987770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457476 () Bool)

(declare-fun res!987777 () Bool)

(assert (=> b!1457476 (=> (not res!987777) (not e!819910))))

(assert (=> b!1457476 (= res!987777 (and (= (size!48120 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48120 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48120 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1457477 () Bool)

(declare-fun e!819904 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98564 (_ BitVec 32)) SeekEntryResult!11822)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98564 (_ BitVec 32)) SeekEntryResult!11822)

(assert (=> b!1457477 (= e!819904 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638696 lt!638695 mask!2687) (seekEntryOrOpen!0 lt!638696 lt!638695 mask!2687)))))

(declare-fun b!1457478 () Bool)

(declare-fun e!819907 () Bool)

(assert (=> b!1457478 (= e!819903 (not e!819907))))

(declare-fun res!987776 () Bool)

(assert (=> b!1457478 (=> res!987776 e!819907)))

(assert (=> b!1457478 (= res!987776 (or (and (= (select (arr!47570 a!2862) index!646) (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47570 a!2862) index!646) (select (arr!47570 a!2862) j!93))) (= (select (arr!47570 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819902 () Bool)

(assert (=> b!1457478 e!819902))

(declare-fun res!987768 () Bool)

(assert (=> b!1457478 (=> (not res!987768) (not e!819902))))

(assert (=> b!1457478 (= res!987768 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49140 0))(
  ( (Unit!49141) )
))
(declare-fun lt!638690 () Unit!49140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49140)

(assert (=> b!1457478 (= lt!638690 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457479 () Bool)

(declare-fun res!987771 () Bool)

(assert (=> b!1457479 (=> (not res!987771) (not e!819910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457479 (= res!987771 (validKeyInArray!0 (select (arr!47570 a!2862) i!1006)))))

(declare-fun b!1457480 () Bool)

(declare-fun res!987773 () Bool)

(assert (=> b!1457480 (=> (not res!987773) (not e!819906))))

(declare-fun lt!638694 () SeekEntryResult!11822)

(assert (=> b!1457480 (= res!987773 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!638694))))

(declare-fun b!1457481 () Bool)

(assert (=> b!1457481 (= e!819904 (= lt!638693 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638696 lt!638695 mask!2687)))))

(declare-fun b!1457482 () Bool)

(declare-fun res!987781 () Bool)

(declare-fun e!819908 () Bool)

(assert (=> b!1457482 (=> res!987781 e!819908)))

(declare-fun lt!638692 () (_ BitVec 32))

(assert (=> b!1457482 (= res!987781 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638692 (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!638694)))))

(declare-fun b!1457483 () Bool)

(declare-fun e!819905 () Bool)

(assert (=> b!1457483 (= e!819905 (not (= lt!638693 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638692 lt!638696 lt!638695 mask!2687))))))

(declare-fun b!1457472 () Bool)

(declare-fun res!987767 () Bool)

(assert (=> b!1457472 (=> (not res!987767) (not e!819903))))

(assert (=> b!1457472 (= res!987767 e!819904)))

(declare-fun c!134363 () Bool)

(assert (=> b!1457472 (= c!134363 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!987775 () Bool)

(assert (=> start!125116 (=> (not res!987775) (not e!819910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125116 (= res!987775 (validMask!0 mask!2687))))

(assert (=> start!125116 e!819910))

(assert (=> start!125116 true))

(declare-fun array_inv!36598 (array!98564) Bool)

(assert (=> start!125116 (array_inv!36598 a!2862)))

(declare-fun b!1457484 () Bool)

(assert (=> b!1457484 (= e!819909 e!819906)))

(declare-fun res!987769 () Bool)

(assert (=> b!1457484 (=> (not res!987769) (not e!819906))))

(assert (=> b!1457484 (= res!987769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47570 a!2862) j!93) mask!2687) (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!638694))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457484 (= lt!638694 (Intermediate!11822 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457485 () Bool)

(declare-fun res!987784 () Bool)

(assert (=> b!1457485 (=> (not res!987784) (not e!819910))))

(assert (=> b!1457485 (= res!987784 (validKeyInArray!0 (select (arr!47570 a!2862) j!93)))))

(declare-fun b!1457486 () Bool)

(declare-fun res!987783 () Bool)

(assert (=> b!1457486 (=> (not res!987783) (not e!819902))))

(assert (=> b!1457486 (= res!987783 (= (seekEntryOrOpen!0 (select (arr!47570 a!2862) j!93) a!2862 mask!2687) (Found!11822 j!93)))))

(declare-fun b!1457487 () Bool)

(assert (=> b!1457487 (= e!819908 true)))

(declare-fun lt!638691 () Bool)

(assert (=> b!1457487 (= lt!638691 e!819905)))

(declare-fun c!134364 () Bool)

(assert (=> b!1457487 (= c!134364 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457488 () Bool)

(declare-fun lt!638697 () SeekEntryResult!11822)

(assert (=> b!1457488 (= e!819905 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638692 intermediateAfterIndex!19 lt!638696 lt!638695 mask!2687) lt!638697)))))

(declare-fun b!1457489 () Bool)

(declare-fun res!987778 () Bool)

(assert (=> b!1457489 (=> (not res!987778) (not e!819903))))

(assert (=> b!1457489 (= res!987778 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457490 () Bool)

(assert (=> b!1457490 (= e!819902 (and (or (= (select (arr!47570 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47570 a!2862) intermediateBeforeIndex!19) (select (arr!47570 a!2862) j!93))) (let ((bdg!53341 (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47570 a!2862) index!646) bdg!53341) (= (select (arr!47570 a!2862) index!646) (select (arr!47570 a!2862) j!93))) (= (select (arr!47570 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53341 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457491 () Bool)

(declare-fun res!987780 () Bool)

(assert (=> b!1457491 (=> (not res!987780) (not e!819910))))

(declare-datatypes ((List!34071 0))(
  ( (Nil!34068) (Cons!34067 (h!35417 (_ BitVec 64)) (t!48765 List!34071)) )
))
(declare-fun arrayNoDuplicates!0 (array!98564 (_ BitVec 32) List!34071) Bool)

(assert (=> b!1457491 (= res!987780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34068))))

(declare-fun b!1457492 () Bool)

(declare-fun res!987779 () Bool)

(assert (=> b!1457492 (=> (not res!987779) (not e!819910))))

(assert (=> b!1457492 (= res!987779 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48120 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48120 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48120 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457493 () Bool)

(assert (=> b!1457493 (= e!819907 e!819908)))

(declare-fun res!987774 () Bool)

(assert (=> b!1457493 (=> res!987774 e!819908)))

(assert (=> b!1457493 (= res!987774 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638692 #b00000000000000000000000000000000) (bvsge lt!638692 (size!48120 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457493 (= lt!638692 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457493 (= lt!638697 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638696 lt!638695 mask!2687))))

(assert (=> b!1457493 (= lt!638697 (seekEntryOrOpen!0 lt!638696 lt!638695 mask!2687))))

(assert (= (and start!125116 res!987775) b!1457476))

(assert (= (and b!1457476 res!987777) b!1457479))

(assert (= (and b!1457479 res!987771) b!1457485))

(assert (= (and b!1457485 res!987784) b!1457475))

(assert (= (and b!1457475 res!987770) b!1457491))

(assert (= (and b!1457491 res!987780) b!1457492))

(assert (= (and b!1457492 res!987779) b!1457474))

(assert (= (and b!1457474 res!987772) b!1457484))

(assert (= (and b!1457484 res!987769) b!1457480))

(assert (= (and b!1457480 res!987773) b!1457473))

(assert (= (and b!1457473 res!987782) b!1457472))

(assert (= (and b!1457472 c!134363) b!1457481))

(assert (= (and b!1457472 (not c!134363)) b!1457477))

(assert (= (and b!1457472 res!987767) b!1457489))

(assert (= (and b!1457489 res!987778) b!1457478))

(assert (= (and b!1457478 res!987768) b!1457486))

(assert (= (and b!1457486 res!987783) b!1457490))

(assert (= (and b!1457478 (not res!987776)) b!1457493))

(assert (= (and b!1457493 (not res!987774)) b!1457482))

(assert (= (and b!1457482 (not res!987781)) b!1457487))

(assert (= (and b!1457487 c!134364) b!1457483))

(assert (= (and b!1457487 (not c!134364)) b!1457488))

(declare-fun m!1345447 () Bool)

(assert (=> b!1457484 m!1345447))

(assert (=> b!1457484 m!1345447))

(declare-fun m!1345449 () Bool)

(assert (=> b!1457484 m!1345449))

(assert (=> b!1457484 m!1345449))

(assert (=> b!1457484 m!1345447))

(declare-fun m!1345451 () Bool)

(assert (=> b!1457484 m!1345451))

(declare-fun m!1345453 () Bool)

(assert (=> b!1457488 m!1345453))

(declare-fun m!1345455 () Bool)

(assert (=> b!1457475 m!1345455))

(declare-fun m!1345457 () Bool)

(assert (=> start!125116 m!1345457))

(declare-fun m!1345459 () Bool)

(assert (=> start!125116 m!1345459))

(assert (=> b!1457485 m!1345447))

(assert (=> b!1457485 m!1345447))

(declare-fun m!1345461 () Bool)

(assert (=> b!1457485 m!1345461))

(assert (=> b!1457486 m!1345447))

(assert (=> b!1457486 m!1345447))

(declare-fun m!1345463 () Bool)

(assert (=> b!1457486 m!1345463))

(declare-fun m!1345465 () Bool)

(assert (=> b!1457477 m!1345465))

(declare-fun m!1345467 () Bool)

(assert (=> b!1457477 m!1345467))

(declare-fun m!1345469 () Bool)

(assert (=> b!1457490 m!1345469))

(declare-fun m!1345471 () Bool)

(assert (=> b!1457490 m!1345471))

(declare-fun m!1345473 () Bool)

(assert (=> b!1457490 m!1345473))

(declare-fun m!1345475 () Bool)

(assert (=> b!1457490 m!1345475))

(assert (=> b!1457490 m!1345447))

(declare-fun m!1345477 () Bool)

(assert (=> b!1457481 m!1345477))

(declare-fun m!1345479 () Bool)

(assert (=> b!1457478 m!1345479))

(assert (=> b!1457478 m!1345469))

(assert (=> b!1457478 m!1345473))

(assert (=> b!1457478 m!1345475))

(declare-fun m!1345481 () Bool)

(assert (=> b!1457478 m!1345481))

(assert (=> b!1457478 m!1345447))

(assert (=> b!1457474 m!1345469))

(declare-fun m!1345483 () Bool)

(assert (=> b!1457474 m!1345483))

(declare-fun m!1345485 () Bool)

(assert (=> b!1457479 m!1345485))

(assert (=> b!1457479 m!1345485))

(declare-fun m!1345487 () Bool)

(assert (=> b!1457479 m!1345487))

(declare-fun m!1345489 () Bool)

(assert (=> b!1457483 m!1345489))

(assert (=> b!1457482 m!1345447))

(assert (=> b!1457482 m!1345447))

(declare-fun m!1345491 () Bool)

(assert (=> b!1457482 m!1345491))

(declare-fun m!1345493 () Bool)

(assert (=> b!1457493 m!1345493))

(assert (=> b!1457493 m!1345465))

(assert (=> b!1457493 m!1345467))

(declare-fun m!1345495 () Bool)

(assert (=> b!1457473 m!1345495))

(assert (=> b!1457473 m!1345495))

(declare-fun m!1345497 () Bool)

(assert (=> b!1457473 m!1345497))

(assert (=> b!1457473 m!1345469))

(declare-fun m!1345499 () Bool)

(assert (=> b!1457473 m!1345499))

(assert (=> b!1457480 m!1345447))

(assert (=> b!1457480 m!1345447))

(declare-fun m!1345501 () Bool)

(assert (=> b!1457480 m!1345501))

(declare-fun m!1345503 () Bool)

(assert (=> b!1457491 m!1345503))

(push 1)

