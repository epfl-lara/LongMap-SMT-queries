; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125292 () Bool)

(assert start!125292)

(declare-fun b!1457413 () Bool)

(declare-fun res!987142 () Bool)

(declare-fun e!820119 () Bool)

(assert (=> b!1457413 (=> (not res!987142) (not e!820119))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1457413 (= res!987142 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457414 () Bool)

(declare-fun res!987140 () Bool)

(declare-fun e!820114 () Bool)

(assert (=> b!1457414 (=> (not res!987140) (not e!820114))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98635 0))(
  ( (array!98636 (arr!47602 (Array (_ BitVec 32) (_ BitVec 64))) (size!48153 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98635)

(assert (=> b!1457414 (= res!987140 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48153 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48153 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48153 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!638664 () array!98635)

(declare-fun e!820111 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638669 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11751 0))(
  ( (MissingZero!11751 (index!49396 (_ BitVec 32))) (Found!11751 (index!49397 (_ BitVec 32))) (Intermediate!11751 (undefined!12563 Bool) (index!49398 (_ BitVec 32)) (x!131200 (_ BitVec 32))) (Undefined!11751) (MissingVacant!11751 (index!49399 (_ BitVec 32))) )
))
(declare-fun lt!638666 () SeekEntryResult!11751)

(declare-fun b!1457415 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98635 (_ BitVec 32)) SeekEntryResult!11751)

(assert (=> b!1457415 (= e!820111 (= lt!638666 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638669 lt!638664 mask!2687)))))

(declare-fun b!1457416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98635 (_ BitVec 32)) SeekEntryResult!11751)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98635 (_ BitVec 32)) SeekEntryResult!11751)

(assert (=> b!1457416 (= e!820111 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638669 lt!638664 mask!2687) (seekEntryOrOpen!0 lt!638669 lt!638664 mask!2687)))))

(declare-fun b!1457417 () Bool)

(declare-fun res!987141 () Bool)

(assert (=> b!1457417 (=> (not res!987141) (not e!820114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98635 (_ BitVec 32)) Bool)

(assert (=> b!1457417 (= res!987141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457418 () Bool)

(declare-fun res!987147 () Bool)

(declare-fun e!820112 () Bool)

(assert (=> b!1457418 (=> res!987147 e!820112)))

(declare-fun lt!638671 () SeekEntryResult!11751)

(declare-fun lt!638665 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1457418 (= res!987147 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638665 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!638671)))))

(declare-fun b!1457419 () Bool)

(declare-fun res!987138 () Bool)

(declare-fun e!820116 () Bool)

(assert (=> b!1457419 (=> (not res!987138) (not e!820116))))

(assert (=> b!1457419 (= res!987138 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!638671))))

(declare-fun b!1457420 () Bool)

(declare-fun e!820117 () Bool)

(assert (=> b!1457420 (= e!820119 (not e!820117))))

(declare-fun res!987144 () Bool)

(assert (=> b!1457420 (=> res!987144 e!820117)))

(assert (=> b!1457420 (= res!987144 (or (and (= (select (arr!47602 a!2862) index!646) (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47602 a!2862) index!646) (select (arr!47602 a!2862) j!93))) (= (select (arr!47602 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820118 () Bool)

(assert (=> b!1457420 e!820118))

(declare-fun res!987146 () Bool)

(assert (=> b!1457420 (=> (not res!987146) (not e!820118))))

(assert (=> b!1457420 (= res!987146 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49031 0))(
  ( (Unit!49032) )
))
(declare-fun lt!638670 () Unit!49031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49031)

(assert (=> b!1457420 (= lt!638670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457421 () Bool)

(declare-fun e!820113 () Bool)

(assert (=> b!1457421 (= e!820113 (not (= lt!638666 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638665 lt!638669 lt!638664 mask!2687))))))

(declare-fun b!1457422 () Bool)

(declare-fun res!987139 () Bool)

(assert (=> b!1457422 (=> (not res!987139) (not e!820114))))

(assert (=> b!1457422 (= res!987139 (and (= (size!48153 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48153 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48153 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457423 () Bool)

(assert (=> b!1457423 (= e!820118 (and (or (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) (select (arr!47602 a!2862) j!93))) (let ((bdg!53216 (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47602 a!2862) index!646) bdg!53216) (= (select (arr!47602 a!2862) index!646) (select (arr!47602 a!2862) j!93))) (= (select (arr!47602 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53216 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!987149 () Bool)

(assert (=> start!125292 (=> (not res!987149) (not e!820114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125292 (= res!987149 (validMask!0 mask!2687))))

(assert (=> start!125292 e!820114))

(assert (=> start!125292 true))

(declare-fun array_inv!36883 (array!98635) Bool)

(assert (=> start!125292 (array_inv!36883 a!2862)))

(declare-fun b!1457424 () Bool)

(declare-fun lt!638667 () SeekEntryResult!11751)

(assert (=> b!1457424 (= e!820113 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638665 intermediateAfterIndex!19 lt!638669 lt!638664 mask!2687) lt!638667)))))

(declare-fun b!1457425 () Bool)

(declare-fun res!987151 () Bool)

(assert (=> b!1457425 (=> (not res!987151) (not e!820114))))

(declare-datatypes ((List!34090 0))(
  ( (Nil!34087) (Cons!34086 (h!35447 (_ BitVec 64)) (t!48776 List!34090)) )
))
(declare-fun arrayNoDuplicates!0 (array!98635 (_ BitVec 32) List!34090) Bool)

(assert (=> b!1457425 (= res!987151 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34087))))

(declare-fun b!1457426 () Bool)

(assert (=> b!1457426 (= e!820117 e!820112)))

(declare-fun res!987135 () Bool)

(assert (=> b!1457426 (=> res!987135 e!820112)))

(assert (=> b!1457426 (= res!987135 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638665 #b00000000000000000000000000000000) (bvsge lt!638665 (size!48153 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457426 (= lt!638665 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1457426 (= lt!638667 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638669 lt!638664 mask!2687))))

(assert (=> b!1457426 (= lt!638667 (seekEntryOrOpen!0 lt!638669 lt!638664 mask!2687))))

(declare-fun b!1457427 () Bool)

(declare-fun res!987137 () Bool)

(assert (=> b!1457427 (=> (not res!987137) (not e!820114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457427 (= res!987137 (validKeyInArray!0 (select (arr!47602 a!2862) i!1006)))))

(declare-fun b!1457428 () Bool)

(declare-fun res!987152 () Bool)

(assert (=> b!1457428 (=> (not res!987152) (not e!820114))))

(assert (=> b!1457428 (= res!987152 (validKeyInArray!0 (select (arr!47602 a!2862) j!93)))))

(declare-fun b!1457429 () Bool)

(assert (=> b!1457429 (= e!820116 e!820119)))

(declare-fun res!987143 () Bool)

(assert (=> b!1457429 (=> (not res!987143) (not e!820119))))

(assert (=> b!1457429 (= res!987143 (= lt!638666 (Intermediate!11751 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457429 (= lt!638666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638669 mask!2687) lt!638669 lt!638664 mask!2687))))

(assert (=> b!1457429 (= lt!638669 (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457430 () Bool)

(assert (=> b!1457430 (= e!820112 true)))

(declare-fun lt!638668 () Bool)

(assert (=> b!1457430 (= lt!638668 e!820113)))

(declare-fun c!134659 () Bool)

(assert (=> b!1457430 (= c!134659 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457431 () Bool)

(declare-fun e!820115 () Bool)

(assert (=> b!1457431 (= e!820115 e!820116)))

(declare-fun res!987150 () Bool)

(assert (=> b!1457431 (=> (not res!987150) (not e!820116))))

(assert (=> b!1457431 (= res!987150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47602 a!2862) j!93) mask!2687) (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!638671))))

(assert (=> b!1457431 (= lt!638671 (Intermediate!11751 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457432 () Bool)

(declare-fun res!987148 () Bool)

(assert (=> b!1457432 (=> (not res!987148) (not e!820119))))

(assert (=> b!1457432 (= res!987148 e!820111)))

(declare-fun c!134658 () Bool)

(assert (=> b!1457432 (= c!134658 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457433 () Bool)

(assert (=> b!1457433 (= e!820114 e!820115)))

(declare-fun res!987145 () Bool)

(assert (=> b!1457433 (=> (not res!987145) (not e!820115))))

(assert (=> b!1457433 (= res!987145 (= (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457433 (= lt!638664 (array!98636 (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48153 a!2862)))))

(declare-fun b!1457434 () Bool)

(declare-fun res!987136 () Bool)

(assert (=> b!1457434 (=> (not res!987136) (not e!820118))))

(assert (=> b!1457434 (= res!987136 (= (seekEntryOrOpen!0 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) (Found!11751 j!93)))))

(assert (= (and start!125292 res!987149) b!1457422))

(assert (= (and b!1457422 res!987139) b!1457427))

(assert (= (and b!1457427 res!987137) b!1457428))

(assert (= (and b!1457428 res!987152) b!1457417))

(assert (= (and b!1457417 res!987141) b!1457425))

(assert (= (and b!1457425 res!987151) b!1457414))

(assert (= (and b!1457414 res!987140) b!1457433))

(assert (= (and b!1457433 res!987145) b!1457431))

(assert (= (and b!1457431 res!987150) b!1457419))

(assert (= (and b!1457419 res!987138) b!1457429))

(assert (= (and b!1457429 res!987143) b!1457432))

(assert (= (and b!1457432 c!134658) b!1457415))

(assert (= (and b!1457432 (not c!134658)) b!1457416))

(assert (= (and b!1457432 res!987148) b!1457413))

(assert (= (and b!1457413 res!987142) b!1457420))

(assert (= (and b!1457420 res!987146) b!1457434))

(assert (= (and b!1457434 res!987136) b!1457423))

(assert (= (and b!1457420 (not res!987144)) b!1457426))

(assert (= (and b!1457426 (not res!987135)) b!1457418))

(assert (= (and b!1457418 (not res!987147)) b!1457430))

(assert (= (and b!1457430 c!134659) b!1457421))

(assert (= (and b!1457430 (not c!134659)) b!1457424))

(declare-fun m!1345669 () Bool)

(assert (=> b!1457427 m!1345669))

(assert (=> b!1457427 m!1345669))

(declare-fun m!1345671 () Bool)

(assert (=> b!1457427 m!1345671))

(declare-fun m!1345673 () Bool)

(assert (=> b!1457428 m!1345673))

(assert (=> b!1457428 m!1345673))

(declare-fun m!1345675 () Bool)

(assert (=> b!1457428 m!1345675))

(declare-fun m!1345677 () Bool)

(assert (=> b!1457415 m!1345677))

(declare-fun m!1345679 () Bool)

(assert (=> b!1457416 m!1345679))

(declare-fun m!1345681 () Bool)

(assert (=> b!1457416 m!1345681))

(assert (=> b!1457418 m!1345673))

(assert (=> b!1457418 m!1345673))

(declare-fun m!1345683 () Bool)

(assert (=> b!1457418 m!1345683))

(declare-fun m!1345685 () Bool)

(assert (=> start!125292 m!1345685))

(declare-fun m!1345687 () Bool)

(assert (=> start!125292 m!1345687))

(declare-fun m!1345689 () Bool)

(assert (=> b!1457424 m!1345689))

(declare-fun m!1345691 () Bool)

(assert (=> b!1457421 m!1345691))

(declare-fun m!1345693 () Bool)

(assert (=> b!1457429 m!1345693))

(assert (=> b!1457429 m!1345693))

(declare-fun m!1345695 () Bool)

(assert (=> b!1457429 m!1345695))

(declare-fun m!1345697 () Bool)

(assert (=> b!1457429 m!1345697))

(declare-fun m!1345699 () Bool)

(assert (=> b!1457429 m!1345699))

(declare-fun m!1345701 () Bool)

(assert (=> b!1457425 m!1345701))

(declare-fun m!1345703 () Bool)

(assert (=> b!1457420 m!1345703))

(assert (=> b!1457420 m!1345697))

(declare-fun m!1345705 () Bool)

(assert (=> b!1457420 m!1345705))

(declare-fun m!1345707 () Bool)

(assert (=> b!1457420 m!1345707))

(declare-fun m!1345709 () Bool)

(assert (=> b!1457420 m!1345709))

(assert (=> b!1457420 m!1345673))

(assert (=> b!1457433 m!1345697))

(declare-fun m!1345711 () Bool)

(assert (=> b!1457433 m!1345711))

(assert (=> b!1457423 m!1345697))

(declare-fun m!1345713 () Bool)

(assert (=> b!1457423 m!1345713))

(assert (=> b!1457423 m!1345705))

(assert (=> b!1457423 m!1345707))

(assert (=> b!1457423 m!1345673))

(assert (=> b!1457419 m!1345673))

(assert (=> b!1457419 m!1345673))

(declare-fun m!1345715 () Bool)

(assert (=> b!1457419 m!1345715))

(declare-fun m!1345717 () Bool)

(assert (=> b!1457426 m!1345717))

(assert (=> b!1457426 m!1345679))

(assert (=> b!1457426 m!1345681))

(declare-fun m!1345719 () Bool)

(assert (=> b!1457417 m!1345719))

(assert (=> b!1457434 m!1345673))

(assert (=> b!1457434 m!1345673))

(declare-fun m!1345721 () Bool)

(assert (=> b!1457434 m!1345721))

(assert (=> b!1457431 m!1345673))

(assert (=> b!1457431 m!1345673))

(declare-fun m!1345723 () Bool)

(assert (=> b!1457431 m!1345723))

(assert (=> b!1457431 m!1345723))

(assert (=> b!1457431 m!1345673))

(declare-fun m!1345725 () Bool)

(assert (=> b!1457431 m!1345725))

(check-sat (not b!1457434) (not b!1457431) (not b!1457419) (not b!1457421) (not b!1457418) (not b!1457428) (not b!1457426) (not b!1457420) (not b!1457416) (not b!1457415) (not b!1457425) (not b!1457417) (not b!1457429) (not start!125292) (not b!1457427) (not b!1457424))
(check-sat)
