; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125292 () Bool)

(assert start!125292)

(declare-fun b!1463109 () Bool)

(declare-fun res!992436 () Bool)

(declare-fun e!822371 () Bool)

(assert (=> b!1463109 (=> (not res!992436) (not e!822371))))

(declare-fun e!822379 () Bool)

(assert (=> b!1463109 (= res!992436 e!822379)))

(declare-fun c!134855 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463109 (= c!134855 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463110 () Bool)

(declare-fun e!822380 () Bool)

(assert (=> b!1463110 (= e!822380 true)))

(declare-fun lt!640665 () Bool)

(declare-fun e!822376 () Bool)

(assert (=> b!1463110 (= lt!640665 e!822376)))

(declare-fun c!134856 () Bool)

(assert (=> b!1463110 (= c!134856 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463111 () Bool)

(declare-fun e!822377 () Bool)

(assert (=> b!1463111 (= e!822377 e!822371)))

(declare-fun res!992433 () Bool)

(assert (=> b!1463111 (=> (not res!992433) (not e!822371))))

(declare-datatypes ((SeekEntryResult!11910 0))(
  ( (MissingZero!11910 (index!50032 (_ BitVec 32))) (Found!11910 (index!50033 (_ BitVec 32))) (Intermediate!11910 (undefined!12722 Bool) (index!50034 (_ BitVec 32)) (x!131623 (_ BitVec 32))) (Undefined!11910) (MissingVacant!11910 (index!50035 (_ BitVec 32))) )
))
(declare-fun lt!640664 () SeekEntryResult!11910)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463111 (= res!992433 (= lt!640664 (Intermediate!11910 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98740 0))(
  ( (array!98741 (arr!47658 (Array (_ BitVec 32) (_ BitVec 64))) (size!48208 (_ BitVec 32))) )
))
(declare-fun lt!640662 () array!98740)

(declare-fun lt!640667 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463111 (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640667 mask!2687) lt!640667 lt!640662 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98740)

(assert (=> b!1463111 (= lt!640667 (select (store (arr!47658 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463112 () Bool)

(declare-fun res!992426 () Bool)

(assert (=> b!1463112 (=> (not res!992426) (not e!822377))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!640666 () SeekEntryResult!11910)

(assert (=> b!1463112 (= res!992426 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47658 a!2862) j!93) a!2862 mask!2687) lt!640666))))

(declare-fun b!1463113 () Bool)

(declare-fun e!822373 () Bool)

(declare-fun e!822375 () Bool)

(assert (=> b!1463113 (= e!822373 e!822375)))

(declare-fun res!992429 () Bool)

(assert (=> b!1463113 (=> (not res!992429) (not e!822375))))

(assert (=> b!1463113 (= res!992429 (= (select (store (arr!47658 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463113 (= lt!640662 (array!98741 (store (arr!47658 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48208 a!2862)))))

(declare-fun lt!640668 () (_ BitVec 32))

(declare-fun b!1463114 () Bool)

(assert (=> b!1463114 (= e!822376 (not (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640668 lt!640667 lt!640662 mask!2687))))))

(declare-fun b!1463115 () Bool)

(declare-fun e!822374 () Bool)

(assert (=> b!1463115 (= e!822374 e!822380)))

(declare-fun res!992434 () Bool)

(assert (=> b!1463115 (=> res!992434 e!822380)))

(assert (=> b!1463115 (= res!992434 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640668 #b00000000000000000000000000000000) (bvsge lt!640668 (size!48208 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463115 (= lt!640668 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463116 () Bool)

(assert (=> b!1463116 (= e!822379 (= lt!640664 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640667 lt!640662 mask!2687)))))

(declare-fun b!1463117 () Bool)

(declare-fun res!992420 () Bool)

(assert (=> b!1463117 (=> (not res!992420) (not e!822373))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463117 (= res!992420 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48208 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48208 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48208 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463118 () Bool)

(declare-fun res!992424 () Bool)

(assert (=> b!1463118 (=> res!992424 e!822380)))

(assert (=> b!1463118 (= res!992424 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640668 (select (arr!47658 a!2862) j!93) a!2862 mask!2687) lt!640666)))))

(declare-fun b!1463119 () Bool)

(declare-fun res!992431 () Bool)

(assert (=> b!1463119 (=> (not res!992431) (not e!822373))))

(declare-datatypes ((List!34159 0))(
  ( (Nil!34156) (Cons!34155 (h!35505 (_ BitVec 64)) (t!48853 List!34159)) )
))
(declare-fun arrayNoDuplicates!0 (array!98740 (_ BitVec 32) List!34159) Bool)

(assert (=> b!1463119 (= res!992431 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34156))))

(declare-fun b!1463120 () Bool)

(declare-fun e!822378 () Bool)

(assert (=> b!1463120 (= e!822378 (or (= (select (arr!47658 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47658 a!2862) intermediateBeforeIndex!19) (select (arr!47658 a!2862) j!93))))))

(declare-fun b!1463121 () Bool)

(declare-fun res!992427 () Bool)

(assert (=> b!1463121 (=> (not res!992427) (not e!822373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463121 (= res!992427 (validKeyInArray!0 (select (arr!47658 a!2862) i!1006)))))

(declare-fun res!992428 () Bool)

(assert (=> start!125292 (=> (not res!992428) (not e!822373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125292 (= res!992428 (validMask!0 mask!2687))))

(assert (=> start!125292 e!822373))

(assert (=> start!125292 true))

(declare-fun array_inv!36686 (array!98740) Bool)

(assert (=> start!125292 (array_inv!36686 a!2862)))

(declare-fun b!1463122 () Bool)

(declare-fun res!992423 () Bool)

(assert (=> b!1463122 (=> (not res!992423) (not e!822373))))

(assert (=> b!1463122 (= res!992423 (validKeyInArray!0 (select (arr!47658 a!2862) j!93)))))

(declare-fun b!1463123 () Bool)

(declare-fun res!992435 () Bool)

(assert (=> b!1463123 (=> (not res!992435) (not e!822373))))

(assert (=> b!1463123 (= res!992435 (and (= (size!48208 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48208 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48208 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463124 () Bool)

(declare-fun res!992437 () Bool)

(assert (=> b!1463124 (=> (not res!992437) (not e!822378))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11910)

(assert (=> b!1463124 (= res!992437 (= (seekEntryOrOpen!0 (select (arr!47658 a!2862) j!93) a!2862 mask!2687) (Found!11910 j!93)))))

(declare-fun b!1463125 () Bool)

(declare-fun res!992421 () Bool)

(assert (=> b!1463125 (=> (not res!992421) (not e!822371))))

(assert (=> b!1463125 (= res!992421 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463126 () Bool)

(assert (=> b!1463126 (= e!822371 (not e!822374))))

(declare-fun res!992430 () Bool)

(assert (=> b!1463126 (=> res!992430 e!822374)))

(assert (=> b!1463126 (= res!992430 (or (and (= (select (arr!47658 a!2862) index!646) (select (store (arr!47658 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47658 a!2862) index!646) (select (arr!47658 a!2862) j!93))) (= (select (arr!47658 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463126 e!822378))

(declare-fun res!992425 () Bool)

(assert (=> b!1463126 (=> (not res!992425) (not e!822378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98740 (_ BitVec 32)) Bool)

(assert (=> b!1463126 (= res!992425 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49316 0))(
  ( (Unit!49317) )
))
(declare-fun lt!640663 () Unit!49316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49316)

(assert (=> b!1463126 (= lt!640663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463127 () Bool)

(declare-fun res!992422 () Bool)

(assert (=> b!1463127 (=> (not res!992422) (not e!822373))))

(assert (=> b!1463127 (= res!992422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463128 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98740 (_ BitVec 32)) SeekEntryResult!11910)

(assert (=> b!1463128 (= e!822379 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640667 lt!640662 mask!2687) (seekEntryOrOpen!0 lt!640667 lt!640662 mask!2687)))))

(declare-fun b!1463129 () Bool)

(assert (=> b!1463129 (= e!822375 e!822377)))

(declare-fun res!992432 () Bool)

(assert (=> b!1463129 (=> (not res!992432) (not e!822377))))

(assert (=> b!1463129 (= res!992432 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47658 a!2862) j!93) mask!2687) (select (arr!47658 a!2862) j!93) a!2862 mask!2687) lt!640666))))

(assert (=> b!1463129 (= lt!640666 (Intermediate!11910 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463130 () Bool)

(assert (=> b!1463130 (= e!822376 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640668 intermediateAfterIndex!19 lt!640667 lt!640662 mask!2687) (seekEntryOrOpen!0 lt!640667 lt!640662 mask!2687))))))

(assert (= (and start!125292 res!992428) b!1463123))

(assert (= (and b!1463123 res!992435) b!1463121))

(assert (= (and b!1463121 res!992427) b!1463122))

(assert (= (and b!1463122 res!992423) b!1463127))

(assert (= (and b!1463127 res!992422) b!1463119))

(assert (= (and b!1463119 res!992431) b!1463117))

(assert (= (and b!1463117 res!992420) b!1463113))

(assert (= (and b!1463113 res!992429) b!1463129))

(assert (= (and b!1463129 res!992432) b!1463112))

(assert (= (and b!1463112 res!992426) b!1463111))

(assert (= (and b!1463111 res!992433) b!1463109))

(assert (= (and b!1463109 c!134855) b!1463116))

(assert (= (and b!1463109 (not c!134855)) b!1463128))

(assert (= (and b!1463109 res!992436) b!1463125))

(assert (= (and b!1463125 res!992421) b!1463126))

(assert (= (and b!1463126 res!992425) b!1463124))

(assert (= (and b!1463124 res!992437) b!1463120))

(assert (= (and b!1463126 (not res!992430)) b!1463115))

(assert (= (and b!1463115 (not res!992434)) b!1463118))

(assert (= (and b!1463118 (not res!992424)) b!1463110))

(assert (= (and b!1463110 c!134856) b!1463114))

(assert (= (and b!1463110 (not c!134856)) b!1463130))

(declare-fun m!1350485 () Bool)

(assert (=> b!1463113 m!1350485))

(declare-fun m!1350487 () Bool)

(assert (=> b!1463113 m!1350487))

(declare-fun m!1350489 () Bool)

(assert (=> b!1463115 m!1350489))

(declare-fun m!1350491 () Bool)

(assert (=> b!1463124 m!1350491))

(assert (=> b!1463124 m!1350491))

(declare-fun m!1350493 () Bool)

(assert (=> b!1463124 m!1350493))

(assert (=> b!1463112 m!1350491))

(assert (=> b!1463112 m!1350491))

(declare-fun m!1350495 () Bool)

(assert (=> b!1463112 m!1350495))

(declare-fun m!1350497 () Bool)

(assert (=> b!1463130 m!1350497))

(declare-fun m!1350499 () Bool)

(assert (=> b!1463130 m!1350499))

(declare-fun m!1350501 () Bool)

(assert (=> b!1463119 m!1350501))

(assert (=> b!1463118 m!1350491))

(assert (=> b!1463118 m!1350491))

(declare-fun m!1350503 () Bool)

(assert (=> b!1463118 m!1350503))

(declare-fun m!1350505 () Bool)

(assert (=> start!125292 m!1350505))

(declare-fun m!1350507 () Bool)

(assert (=> start!125292 m!1350507))

(declare-fun m!1350509 () Bool)

(assert (=> b!1463120 m!1350509))

(assert (=> b!1463120 m!1350491))

(declare-fun m!1350511 () Bool)

(assert (=> b!1463116 m!1350511))

(declare-fun m!1350513 () Bool)

(assert (=> b!1463121 m!1350513))

(assert (=> b!1463121 m!1350513))

(declare-fun m!1350515 () Bool)

(assert (=> b!1463121 m!1350515))

(declare-fun m!1350517 () Bool)

(assert (=> b!1463114 m!1350517))

(declare-fun m!1350519 () Bool)

(assert (=> b!1463126 m!1350519))

(assert (=> b!1463126 m!1350485))

(declare-fun m!1350521 () Bool)

(assert (=> b!1463126 m!1350521))

(declare-fun m!1350523 () Bool)

(assert (=> b!1463126 m!1350523))

(declare-fun m!1350525 () Bool)

(assert (=> b!1463126 m!1350525))

(assert (=> b!1463126 m!1350491))

(assert (=> b!1463122 m!1350491))

(assert (=> b!1463122 m!1350491))

(declare-fun m!1350527 () Bool)

(assert (=> b!1463122 m!1350527))

(declare-fun m!1350529 () Bool)

(assert (=> b!1463128 m!1350529))

(assert (=> b!1463128 m!1350499))

(declare-fun m!1350531 () Bool)

(assert (=> b!1463127 m!1350531))

(declare-fun m!1350533 () Bool)

(assert (=> b!1463111 m!1350533))

(assert (=> b!1463111 m!1350533))

(declare-fun m!1350535 () Bool)

(assert (=> b!1463111 m!1350535))

(assert (=> b!1463111 m!1350485))

(declare-fun m!1350537 () Bool)

(assert (=> b!1463111 m!1350537))

(assert (=> b!1463129 m!1350491))

(assert (=> b!1463129 m!1350491))

(declare-fun m!1350539 () Bool)

(assert (=> b!1463129 m!1350539))

(assert (=> b!1463129 m!1350539))

(assert (=> b!1463129 m!1350491))

(declare-fun m!1350541 () Bool)

(assert (=> b!1463129 m!1350541))

(check-sat (not b!1463128) (not b!1463114) (not b!1463112) (not b!1463127) (not b!1463118) (not b!1463129) (not b!1463111) (not b!1463121) (not b!1463130) (not b!1463116) (not b!1463122) (not start!125292) (not b!1463119) (not b!1463115) (not b!1463126) (not b!1463124))
(check-sat)
