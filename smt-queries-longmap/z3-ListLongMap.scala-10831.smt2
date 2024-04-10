; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126834 () Bool)

(assert start!126834)

(declare-fun b!1489130 () Bool)

(declare-fun e!834642 () Bool)

(declare-fun e!834638 () Bool)

(assert (=> b!1489130 (= e!834642 e!834638)))

(declare-fun res!1012648 () Bool)

(assert (=> b!1489130 (=> (not res!1012648) (not e!834638))))

(declare-datatypes ((SeekEntryResult!12315 0))(
  ( (MissingZero!12315 (index!51652 (_ BitVec 32))) (Found!12315 (index!51653 (_ BitVec 32))) (Intermediate!12315 (undefined!13127 Bool) (index!51654 (_ BitVec 32)) (x!133251 (_ BitVec 32))) (Undefined!12315) (MissingVacant!12315 (index!51655 (_ BitVec 32))) )
))
(declare-fun lt!649434 () SeekEntryResult!12315)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489130 (= res!1012648 (= lt!649434 (Intermediate!12315 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649436 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99607 0))(
  ( (array!99608 (arr!48075 (Array (_ BitVec 32) (_ BitVec 64))) (size!48625 (_ BitVec 32))) )
))
(declare-fun lt!649438 () array!99607)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489130 (= lt!649434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649436 mask!2687) lt!649436 lt!649438 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99607)

(assert (=> b!1489130 (= lt!649436 (select (store (arr!48075 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489131 () Bool)

(declare-fun res!1012643 () Bool)

(declare-fun e!834639 () Bool)

(assert (=> b!1489131 (=> res!1012643 e!834639)))

(declare-fun e!834640 () Bool)

(assert (=> b!1489131 (= res!1012643 e!834640)))

(declare-fun c!137778 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1489131 (= c!137778 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489132 () Bool)

(declare-fun e!834637 () Bool)

(declare-fun e!834643 () Bool)

(assert (=> b!1489132 (= e!834637 e!834643)))

(declare-fun res!1012632 () Bool)

(assert (=> b!1489132 (=> (not res!1012632) (not e!834643))))

(assert (=> b!1489132 (= res!1012632 (= (select (store (arr!48075 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489132 (= lt!649438 (array!99608 (store (arr!48075 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48625 a!2862)))))

(declare-fun b!1489133 () Bool)

(declare-fun res!1012642 () Bool)

(assert (=> b!1489133 (=> res!1012642 e!834639)))

(declare-fun lt!649437 () (_ BitVec 32))

(declare-fun lt!649440 () SeekEntryResult!12315)

(assert (=> b!1489133 (= res!1012642 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649437 (select (arr!48075 a!2862) j!93) a!2862 mask!2687) lt!649440)))))

(declare-fun b!1489134 () Bool)

(assert (=> b!1489134 (= e!834643 e!834642)))

(declare-fun res!1012638 () Bool)

(assert (=> b!1489134 (=> (not res!1012638) (not e!834642))))

(assert (=> b!1489134 (= res!1012638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48075 a!2862) j!93) mask!2687) (select (arr!48075 a!2862) j!93) a!2862 mask!2687) lt!649440))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489134 (= lt!649440 (Intermediate!12315 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1012634 () Bool)

(assert (=> start!126834 (=> (not res!1012634) (not e!834637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126834 (= res!1012634 (validMask!0 mask!2687))))

(assert (=> start!126834 e!834637))

(assert (=> start!126834 true))

(declare-fun array_inv!37103 (array!99607) Bool)

(assert (=> start!126834 (array_inv!37103 a!2862)))

(declare-fun b!1489135 () Bool)

(declare-fun res!1012631 () Bool)

(assert (=> b!1489135 (=> (not res!1012631) (not e!834638))))

(declare-fun e!834641 () Bool)

(assert (=> b!1489135 (= res!1012631 e!834641)))

(declare-fun c!137777 () Bool)

(assert (=> b!1489135 (= c!137777 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489136 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12315)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12315)

(assert (=> b!1489136 (= e!834641 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649436 lt!649438 mask!2687) (seekEntryOrOpen!0 lt!649436 lt!649438 mask!2687)))))

(declare-fun b!1489137 () Bool)

(declare-fun res!1012645 () Bool)

(declare-fun e!834635 () Bool)

(assert (=> b!1489137 (=> (not res!1012645) (not e!834635))))

(assert (=> b!1489137 (= res!1012645 (= (seekEntryOrOpen!0 (select (arr!48075 a!2862) j!93) a!2862 mask!2687) (Found!12315 j!93)))))

(declare-fun b!1489138 () Bool)

(declare-fun res!1012637 () Bool)

(assert (=> b!1489138 (=> (not res!1012637) (not e!834638))))

(assert (=> b!1489138 (= res!1012637 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489139 () Bool)

(declare-fun res!1012646 () Bool)

(assert (=> b!1489139 (=> (not res!1012646) (not e!834637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489139 (= res!1012646 (validKeyInArray!0 (select (arr!48075 a!2862) j!93)))))

(declare-fun b!1489140 () Bool)

(declare-fun e!834644 () Bool)

(assert (=> b!1489140 (= e!834638 (not e!834644))))

(declare-fun res!1012633 () Bool)

(assert (=> b!1489140 (=> res!1012633 e!834644)))

(assert (=> b!1489140 (= res!1012633 (or (and (= (select (arr!48075 a!2862) index!646) (select (store (arr!48075 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48075 a!2862) index!646) (select (arr!48075 a!2862) j!93))) (= (select (arr!48075 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489140 e!834635))

(declare-fun res!1012636 () Bool)

(assert (=> b!1489140 (=> (not res!1012636) (not e!834635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99607 (_ BitVec 32)) Bool)

(assert (=> b!1489140 (= res!1012636 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49970 0))(
  ( (Unit!49971) )
))
(declare-fun lt!649439 () Unit!49970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49970)

(assert (=> b!1489140 (= lt!649439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489141 () Bool)

(assert (=> b!1489141 (= e!834641 (= lt!649434 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649436 lt!649438 mask!2687)))))

(declare-fun b!1489142 () Bool)

(assert (=> b!1489142 (= e!834640 (not (= lt!649434 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649437 lt!649436 lt!649438 mask!2687))))))

(declare-fun b!1489143 () Bool)

(declare-fun res!1012647 () Bool)

(assert (=> b!1489143 (=> (not res!1012647) (not e!834637))))

(assert (=> b!1489143 (= res!1012647 (validKeyInArray!0 (select (arr!48075 a!2862) i!1006)))))

(declare-fun b!1489144 () Bool)

(assert (=> b!1489144 (= e!834639 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1489145 () Bool)

(declare-fun res!1012635 () Bool)

(assert (=> b!1489145 (=> (not res!1012635) (not e!834637))))

(assert (=> b!1489145 (= res!1012635 (and (= (size!48625 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48625 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48625 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489146 () Bool)

(declare-fun res!1012630 () Bool)

(assert (=> b!1489146 (=> (not res!1012630) (not e!834642))))

(assert (=> b!1489146 (= res!1012630 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48075 a!2862) j!93) a!2862 mask!2687) lt!649440))))

(declare-fun b!1489147 () Bool)

(assert (=> b!1489147 (= e!834644 e!834639)))

(declare-fun res!1012644 () Bool)

(assert (=> b!1489147 (=> res!1012644 e!834639)))

(assert (=> b!1489147 (= res!1012644 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649437 #b00000000000000000000000000000000) (bvsge lt!649437 (size!48625 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489147 (= lt!649437 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649435 () SeekEntryResult!12315)

(assert (=> b!1489147 (= lt!649435 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649436 lt!649438 mask!2687))))

(assert (=> b!1489147 (= lt!649435 (seekEntryOrOpen!0 lt!649436 lt!649438 mask!2687))))

(declare-fun b!1489148 () Bool)

(assert (=> b!1489148 (= e!834640 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649437 intermediateAfterIndex!19 lt!649436 lt!649438 mask!2687) lt!649435)))))

(declare-fun b!1489149 () Bool)

(declare-fun res!1012639 () Bool)

(assert (=> b!1489149 (=> (not res!1012639) (not e!834637))))

(declare-datatypes ((List!34576 0))(
  ( (Nil!34573) (Cons!34572 (h!35955 (_ BitVec 64)) (t!49270 List!34576)) )
))
(declare-fun arrayNoDuplicates!0 (array!99607 (_ BitVec 32) List!34576) Bool)

(assert (=> b!1489149 (= res!1012639 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34573))))

(declare-fun b!1489150 () Bool)

(declare-fun res!1012641 () Bool)

(assert (=> b!1489150 (=> (not res!1012641) (not e!834637))))

(assert (=> b!1489150 (= res!1012641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489151 () Bool)

(assert (=> b!1489151 (= e!834635 (and (or (= (select (arr!48075 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48075 a!2862) intermediateBeforeIndex!19) (select (arr!48075 a!2862) j!93))) (let ((bdg!54691 (select (store (arr!48075 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48075 a!2862) index!646) bdg!54691) (= (select (arr!48075 a!2862) index!646) (select (arr!48075 a!2862) j!93))) (= (select (arr!48075 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54691 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1489152 () Bool)

(declare-fun res!1012640 () Bool)

(assert (=> b!1489152 (=> (not res!1012640) (not e!834637))))

(assert (=> b!1489152 (= res!1012640 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48625 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48625 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48625 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126834 res!1012634) b!1489145))

(assert (= (and b!1489145 res!1012635) b!1489143))

(assert (= (and b!1489143 res!1012647) b!1489139))

(assert (= (and b!1489139 res!1012646) b!1489150))

(assert (= (and b!1489150 res!1012641) b!1489149))

(assert (= (and b!1489149 res!1012639) b!1489152))

(assert (= (and b!1489152 res!1012640) b!1489132))

(assert (= (and b!1489132 res!1012632) b!1489134))

(assert (= (and b!1489134 res!1012638) b!1489146))

(assert (= (and b!1489146 res!1012630) b!1489130))

(assert (= (and b!1489130 res!1012648) b!1489135))

(assert (= (and b!1489135 c!137777) b!1489141))

(assert (= (and b!1489135 (not c!137777)) b!1489136))

(assert (= (and b!1489135 res!1012631) b!1489138))

(assert (= (and b!1489138 res!1012637) b!1489140))

(assert (= (and b!1489140 res!1012636) b!1489137))

(assert (= (and b!1489137 res!1012645) b!1489151))

(assert (= (and b!1489140 (not res!1012633)) b!1489147))

(assert (= (and b!1489147 (not res!1012644)) b!1489133))

(assert (= (and b!1489133 (not res!1012642)) b!1489131))

(assert (= (and b!1489131 c!137778) b!1489142))

(assert (= (and b!1489131 (not c!137778)) b!1489148))

(assert (= (and b!1489131 (not res!1012643)) b!1489144))

(declare-fun m!1373399 () Bool)

(assert (=> b!1489136 m!1373399))

(declare-fun m!1373401 () Bool)

(assert (=> b!1489136 m!1373401))

(declare-fun m!1373403 () Bool)

(assert (=> b!1489150 m!1373403))

(declare-fun m!1373405 () Bool)

(assert (=> b!1489147 m!1373405))

(assert (=> b!1489147 m!1373399))

(assert (=> b!1489147 m!1373401))

(declare-fun m!1373407 () Bool)

(assert (=> b!1489151 m!1373407))

(declare-fun m!1373409 () Bool)

(assert (=> b!1489151 m!1373409))

(declare-fun m!1373411 () Bool)

(assert (=> b!1489151 m!1373411))

(declare-fun m!1373413 () Bool)

(assert (=> b!1489151 m!1373413))

(declare-fun m!1373415 () Bool)

(assert (=> b!1489151 m!1373415))

(assert (=> b!1489139 m!1373415))

(assert (=> b!1489139 m!1373415))

(declare-fun m!1373417 () Bool)

(assert (=> b!1489139 m!1373417))

(assert (=> b!1489132 m!1373407))

(declare-fun m!1373419 () Bool)

(assert (=> b!1489132 m!1373419))

(declare-fun m!1373421 () Bool)

(assert (=> start!126834 m!1373421))

(declare-fun m!1373423 () Bool)

(assert (=> start!126834 m!1373423))

(assert (=> b!1489137 m!1373415))

(assert (=> b!1489137 m!1373415))

(declare-fun m!1373425 () Bool)

(assert (=> b!1489137 m!1373425))

(declare-fun m!1373427 () Bool)

(assert (=> b!1489141 m!1373427))

(assert (=> b!1489146 m!1373415))

(assert (=> b!1489146 m!1373415))

(declare-fun m!1373429 () Bool)

(assert (=> b!1489146 m!1373429))

(assert (=> b!1489134 m!1373415))

(assert (=> b!1489134 m!1373415))

(declare-fun m!1373431 () Bool)

(assert (=> b!1489134 m!1373431))

(assert (=> b!1489134 m!1373431))

(assert (=> b!1489134 m!1373415))

(declare-fun m!1373433 () Bool)

(assert (=> b!1489134 m!1373433))

(declare-fun m!1373435 () Bool)

(assert (=> b!1489149 m!1373435))

(assert (=> b!1489133 m!1373415))

(assert (=> b!1489133 m!1373415))

(declare-fun m!1373437 () Bool)

(assert (=> b!1489133 m!1373437))

(declare-fun m!1373439 () Bool)

(assert (=> b!1489130 m!1373439))

(assert (=> b!1489130 m!1373439))

(declare-fun m!1373441 () Bool)

(assert (=> b!1489130 m!1373441))

(assert (=> b!1489130 m!1373407))

(declare-fun m!1373443 () Bool)

(assert (=> b!1489130 m!1373443))

(declare-fun m!1373445 () Bool)

(assert (=> b!1489142 m!1373445))

(declare-fun m!1373447 () Bool)

(assert (=> b!1489148 m!1373447))

(declare-fun m!1373449 () Bool)

(assert (=> b!1489140 m!1373449))

(assert (=> b!1489140 m!1373407))

(assert (=> b!1489140 m!1373411))

(assert (=> b!1489140 m!1373413))

(declare-fun m!1373451 () Bool)

(assert (=> b!1489140 m!1373451))

(assert (=> b!1489140 m!1373415))

(declare-fun m!1373453 () Bool)

(assert (=> b!1489143 m!1373453))

(assert (=> b!1489143 m!1373453))

(declare-fun m!1373455 () Bool)

(assert (=> b!1489143 m!1373455))

(check-sat (not b!1489149) (not b!1489137) (not b!1489150) (not b!1489136) (not b!1489130) (not b!1489141) (not start!126834) (not b!1489133) (not b!1489139) (not b!1489134) (not b!1489147) (not b!1489148) (not b!1489142) (not b!1489140) (not b!1489146) (not b!1489143))
(check-sat)
