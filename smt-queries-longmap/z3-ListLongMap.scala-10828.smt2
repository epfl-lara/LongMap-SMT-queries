; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127026 () Bool)

(assert start!127026)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649669 () (_ BitVec 64))

(declare-fun e!835141 () Bool)

(declare-datatypes ((array!99700 0))(
  ( (array!99701 (arr!48118 (Array (_ BitVec 32) (_ BitVec 64))) (size!48669 (_ BitVec 32))) )
))
(declare-fun lt!649667 () array!99700)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12255 0))(
  ( (MissingZero!12255 (index!51412 (_ BitVec 32))) (Found!12255 (index!51413 (_ BitVec 32))) (Intermediate!12255 (undefined!13067 Bool) (index!51414 (_ BitVec 32)) (x!133188 (_ BitVec 32))) (Undefined!12255) (MissingVacant!12255 (index!51415 (_ BitVec 32))) )
))
(declare-fun lt!649670 () SeekEntryResult!12255)

(declare-fun b!1489711 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99700 (_ BitVec 32)) SeekEntryResult!12255)

(assert (=> b!1489711 (= e!835141 (= lt!649670 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649669 lt!649667 mask!2687)))))

(declare-fun lt!649666 () SeekEntryResult!12255)

(declare-fun b!1489712 () Bool)

(declare-fun e!835134 () Bool)

(declare-fun lt!649671 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99700 (_ BitVec 32)) SeekEntryResult!12255)

(assert (=> b!1489712 (= e!835134 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687) lt!649666))))

(declare-fun b!1489713 () Bool)

(declare-fun res!1012562 () Bool)

(declare-fun e!835136 () Bool)

(assert (=> b!1489713 (=> (not res!1012562) (not e!835136))))

(declare-fun a!2862 () array!99700)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99700 (_ BitVec 32)) SeekEntryResult!12255)

(assert (=> b!1489713 (= res!1012562 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) (Found!12255 j!93)))))

(declare-fun b!1489714 () Bool)

(declare-fun e!835143 () Bool)

(declare-fun e!835138 () Bool)

(assert (=> b!1489714 (= e!835143 e!835138)))

(declare-fun res!1012571 () Bool)

(assert (=> b!1489714 (=> res!1012571 e!835138)))

(assert (=> b!1489714 (= res!1012571 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649671 #b00000000000000000000000000000000) (bvsge lt!649671 (size!48669 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489714 (= lt!649671 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1489714 (= lt!649666 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687))))

(assert (=> b!1489714 (= lt!649666 (seekEntryOrOpen!0 lt!649669 lt!649667 mask!2687))))

(declare-fun b!1489715 () Bool)

(declare-fun res!1012561 () Bool)

(declare-fun e!835135 () Bool)

(assert (=> b!1489715 (=> (not res!1012561) (not e!835135))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489715 (= res!1012561 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489716 () Bool)

(declare-fun res!1012576 () Bool)

(declare-fun e!835142 () Bool)

(assert (=> b!1489716 (=> (not res!1012576) (not e!835142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489716 (= res!1012576 (validKeyInArray!0 (select (arr!48118 a!2862) j!93)))))

(declare-fun b!1489717 () Bool)

(assert (=> b!1489717 (= e!835134 (= lt!649670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 lt!649669 lt!649667 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1489718 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489718 (= e!835136 (and (or (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) (select (arr!48118 a!2862) j!93))) (let ((bdg!54637 (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48118 a!2862) index!646) bdg!54637) (= (select (arr!48118 a!2862) index!646) (select (arr!48118 a!2862) j!93))) (= (select (arr!48118 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54637 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1489719 () Bool)

(declare-fun res!1012573 () Bool)

(assert (=> b!1489719 (=> (not res!1012573) (not e!835135))))

(assert (=> b!1489719 (= res!1012573 e!835141)))

(declare-fun c!138112 () Bool)

(assert (=> b!1489719 (= c!138112 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489720 () Bool)

(declare-fun e!835139 () Bool)

(assert (=> b!1489720 (= e!835142 e!835139)))

(declare-fun res!1012566 () Bool)

(assert (=> b!1489720 (=> (not res!1012566) (not e!835139))))

(assert (=> b!1489720 (= res!1012566 (= (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489720 (= lt!649667 (array!99701 (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48669 a!2862)))))

(declare-fun b!1489721 () Bool)

(declare-fun res!1012570 () Bool)

(assert (=> b!1489721 (=> (not res!1012570) (not e!835142))))

(declare-datatypes ((List!34606 0))(
  ( (Nil!34603) (Cons!34602 (h!35996 (_ BitVec 64)) (t!49292 List!34606)) )
))
(declare-fun arrayNoDuplicates!0 (array!99700 (_ BitVec 32) List!34606) Bool)

(assert (=> b!1489721 (= res!1012570 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34603))))

(declare-fun b!1489722 () Bool)

(assert (=> b!1489722 (= e!835135 (not e!835143))))

(declare-fun res!1012572 () Bool)

(assert (=> b!1489722 (=> res!1012572 e!835143)))

(assert (=> b!1489722 (= res!1012572 (or (and (= (select (arr!48118 a!2862) index!646) (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48118 a!2862) index!646) (select (arr!48118 a!2862) j!93))) (= (select (arr!48118 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489722 e!835136))

(declare-fun res!1012563 () Bool)

(assert (=> b!1489722 (=> (not res!1012563) (not e!835136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99700 (_ BitVec 32)) Bool)

(assert (=> b!1489722 (= res!1012563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49883 0))(
  ( (Unit!49884) )
))
(declare-fun lt!649668 () Unit!49883)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49883)

(assert (=> b!1489722 (= lt!649668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489723 () Bool)

(declare-fun res!1012568 () Bool)

(declare-fun e!835137 () Bool)

(assert (=> b!1489723 (=> (not res!1012568) (not e!835137))))

(declare-fun lt!649672 () SeekEntryResult!12255)

(assert (=> b!1489723 (= res!1012568 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649672))))

(declare-fun res!1012569 () Bool)

(assert (=> start!127026 (=> (not res!1012569) (not e!835142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127026 (= res!1012569 (validMask!0 mask!2687))))

(assert (=> start!127026 e!835142))

(assert (=> start!127026 true))

(declare-fun array_inv!37399 (array!99700) Bool)

(assert (=> start!127026 (array_inv!37399 a!2862)))

(declare-fun b!1489724 () Bool)

(declare-fun res!1012567 () Bool)

(assert (=> b!1489724 (=> res!1012567 e!835138)))

(assert (=> b!1489724 (= res!1012567 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649672)))))

(declare-fun b!1489725 () Bool)

(assert (=> b!1489725 (= e!835141 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687) (seekEntryOrOpen!0 lt!649669 lt!649667 mask!2687)))))

(declare-fun b!1489726 () Bool)

(declare-fun res!1012575 () Bool)

(assert (=> b!1489726 (=> (not res!1012575) (not e!835142))))

(assert (=> b!1489726 (= res!1012575 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48669 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48669 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48669 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489727 () Bool)

(declare-fun res!1012574 () Bool)

(assert (=> b!1489727 (=> (not res!1012574) (not e!835142))))

(assert (=> b!1489727 (= res!1012574 (and (= (size!48669 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48669 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48669 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489728 () Bool)

(assert (=> b!1489728 (= e!835139 e!835137)))

(declare-fun res!1012565 () Bool)

(assert (=> b!1489728 (=> (not res!1012565) (not e!835137))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489728 (= res!1012565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649672))))

(assert (=> b!1489728 (= lt!649672 (Intermediate!12255 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489729 () Bool)

(assert (=> b!1489729 (= e!835138 e!835134)))

(declare-fun c!138111 () Bool)

(assert (=> b!1489729 (= c!138111 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489730 () Bool)

(declare-fun res!1012564 () Bool)

(assert (=> b!1489730 (=> (not res!1012564) (not e!835142))))

(assert (=> b!1489730 (= res!1012564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489731 () Bool)

(declare-fun res!1012560 () Bool)

(assert (=> b!1489731 (=> (not res!1012560) (not e!835142))))

(assert (=> b!1489731 (= res!1012560 (validKeyInArray!0 (select (arr!48118 a!2862) i!1006)))))

(declare-fun b!1489732 () Bool)

(assert (=> b!1489732 (= e!835137 e!835135)))

(declare-fun res!1012577 () Bool)

(assert (=> b!1489732 (=> (not res!1012577) (not e!835135))))

(assert (=> b!1489732 (= res!1012577 (= lt!649670 (Intermediate!12255 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489732 (= lt!649670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649669 mask!2687) lt!649669 lt!649667 mask!2687))))

(assert (=> b!1489732 (= lt!649669 (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!127026 res!1012569) b!1489727))

(assert (= (and b!1489727 res!1012574) b!1489731))

(assert (= (and b!1489731 res!1012560) b!1489716))

(assert (= (and b!1489716 res!1012576) b!1489730))

(assert (= (and b!1489730 res!1012564) b!1489721))

(assert (= (and b!1489721 res!1012570) b!1489726))

(assert (= (and b!1489726 res!1012575) b!1489720))

(assert (= (and b!1489720 res!1012566) b!1489728))

(assert (= (and b!1489728 res!1012565) b!1489723))

(assert (= (and b!1489723 res!1012568) b!1489732))

(assert (= (and b!1489732 res!1012577) b!1489719))

(assert (= (and b!1489719 c!138112) b!1489711))

(assert (= (and b!1489719 (not c!138112)) b!1489725))

(assert (= (and b!1489719 res!1012573) b!1489715))

(assert (= (and b!1489715 res!1012561) b!1489722))

(assert (= (and b!1489722 res!1012563) b!1489713))

(assert (= (and b!1489713 res!1012562) b!1489718))

(assert (= (and b!1489722 (not res!1012572)) b!1489714))

(assert (= (and b!1489714 (not res!1012571)) b!1489724))

(assert (= (and b!1489724 (not res!1012567)) b!1489729))

(assert (= (and b!1489729 c!138111) b!1489717))

(assert (= (and b!1489729 (not c!138111)) b!1489712))

(declare-fun m!1374223 () Bool)

(assert (=> b!1489720 m!1374223))

(declare-fun m!1374225 () Bool)

(assert (=> b!1489720 m!1374225))

(assert (=> b!1489718 m!1374223))

(declare-fun m!1374227 () Bool)

(assert (=> b!1489718 m!1374227))

(declare-fun m!1374229 () Bool)

(assert (=> b!1489718 m!1374229))

(declare-fun m!1374231 () Bool)

(assert (=> b!1489718 m!1374231))

(declare-fun m!1374233 () Bool)

(assert (=> b!1489718 m!1374233))

(declare-fun m!1374235 () Bool)

(assert (=> b!1489717 m!1374235))

(declare-fun m!1374237 () Bool)

(assert (=> b!1489722 m!1374237))

(assert (=> b!1489722 m!1374223))

(assert (=> b!1489722 m!1374229))

(assert (=> b!1489722 m!1374231))

(declare-fun m!1374239 () Bool)

(assert (=> b!1489722 m!1374239))

(assert (=> b!1489722 m!1374233))

(assert (=> b!1489716 m!1374233))

(assert (=> b!1489716 m!1374233))

(declare-fun m!1374241 () Bool)

(assert (=> b!1489716 m!1374241))

(declare-fun m!1374243 () Bool)

(assert (=> b!1489721 m!1374243))

(declare-fun m!1374245 () Bool)

(assert (=> b!1489725 m!1374245))

(declare-fun m!1374247 () Bool)

(assert (=> b!1489725 m!1374247))

(assert (=> b!1489724 m!1374233))

(assert (=> b!1489724 m!1374233))

(declare-fun m!1374249 () Bool)

(assert (=> b!1489724 m!1374249))

(declare-fun m!1374251 () Bool)

(assert (=> b!1489711 m!1374251))

(assert (=> b!1489723 m!1374233))

(assert (=> b!1489723 m!1374233))

(declare-fun m!1374253 () Bool)

(assert (=> b!1489723 m!1374253))

(declare-fun m!1374255 () Bool)

(assert (=> b!1489732 m!1374255))

(assert (=> b!1489732 m!1374255))

(declare-fun m!1374257 () Bool)

(assert (=> b!1489732 m!1374257))

(assert (=> b!1489732 m!1374223))

(declare-fun m!1374259 () Bool)

(assert (=> b!1489732 m!1374259))

(declare-fun m!1374261 () Bool)

(assert (=> start!127026 m!1374261))

(declare-fun m!1374263 () Bool)

(assert (=> start!127026 m!1374263))

(assert (=> b!1489713 m!1374233))

(assert (=> b!1489713 m!1374233))

(declare-fun m!1374265 () Bool)

(assert (=> b!1489713 m!1374265))

(declare-fun m!1374267 () Bool)

(assert (=> b!1489731 m!1374267))

(assert (=> b!1489731 m!1374267))

(declare-fun m!1374269 () Bool)

(assert (=> b!1489731 m!1374269))

(declare-fun m!1374271 () Bool)

(assert (=> b!1489730 m!1374271))

(declare-fun m!1374273 () Bool)

(assert (=> b!1489714 m!1374273))

(assert (=> b!1489714 m!1374245))

(assert (=> b!1489714 m!1374247))

(declare-fun m!1374275 () Bool)

(assert (=> b!1489712 m!1374275))

(assert (=> b!1489728 m!1374233))

(assert (=> b!1489728 m!1374233))

(declare-fun m!1374277 () Bool)

(assert (=> b!1489728 m!1374277))

(assert (=> b!1489728 m!1374277))

(assert (=> b!1489728 m!1374233))

(declare-fun m!1374279 () Bool)

(assert (=> b!1489728 m!1374279))

(check-sat (not b!1489722) (not b!1489731) (not b!1489732) (not b!1489717) (not b!1489711) (not b!1489714) (not b!1489713) (not start!127026) (not b!1489712) (not b!1489723) (not b!1489728) (not b!1489730) (not b!1489725) (not b!1489716) (not b!1489721) (not b!1489724))
(check-sat)
(get-model)

(declare-fun d!157143 () Bool)

(declare-fun e!835217 () Bool)

(assert (=> d!157143 e!835217))

(declare-fun c!138132 () Bool)

(declare-fun lt!649719 () SeekEntryResult!12255)

(get-info :version)

(assert (=> d!157143 (= c!138132 (and ((_ is Intermediate!12255) lt!649719) (undefined!13067 lt!649719)))))

(declare-fun e!835214 () SeekEntryResult!12255)

(assert (=> d!157143 (= lt!649719 e!835214)))

(declare-fun c!138133 () Bool)

(assert (=> d!157143 (= c!138133 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649720 () (_ BitVec 64))

(assert (=> d!157143 (= lt!649720 (select (arr!48118 a!2862) (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687)))))

(assert (=> d!157143 (validMask!0 mask!2687)))

(assert (=> d!157143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649719)))

(declare-fun b!1489883 () Bool)

(declare-fun e!835215 () SeekEntryResult!12255)

(assert (=> b!1489883 (= e!835214 e!835215)))

(declare-fun c!138131 () Bool)

(assert (=> b!1489883 (= c!138131 (or (= lt!649720 (select (arr!48118 a!2862) j!93)) (= (bvadd lt!649720 lt!649720) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489884 () Bool)

(assert (=> b!1489884 (= e!835215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489885 () Bool)

(assert (=> b!1489885 (and (bvsge (index!51414 lt!649719) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649719) (size!48669 a!2862)))))

(declare-fun e!835216 () Bool)

(assert (=> b!1489885 (= e!835216 (= (select (arr!48118 a!2862) (index!51414 lt!649719)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489886 () Bool)

(assert (=> b!1489886 (and (bvsge (index!51414 lt!649719) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649719) (size!48669 a!2862)))))

(declare-fun res!1012692 () Bool)

(assert (=> b!1489886 (= res!1012692 (= (select (arr!48118 a!2862) (index!51414 lt!649719)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489886 (=> res!1012692 e!835216)))

(declare-fun b!1489887 () Bool)

(assert (=> b!1489887 (= e!835217 (bvsge (x!133188 lt!649719) #b01111111111111111111111111111110))))

(declare-fun b!1489888 () Bool)

(assert (=> b!1489888 (= e!835215 (Intermediate!12255 false (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1489889 () Bool)

(assert (=> b!1489889 (and (bvsge (index!51414 lt!649719) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649719) (size!48669 a!2862)))))

(declare-fun res!1012694 () Bool)

(assert (=> b!1489889 (= res!1012694 (= (select (arr!48118 a!2862) (index!51414 lt!649719)) (select (arr!48118 a!2862) j!93)))))

(assert (=> b!1489889 (=> res!1012694 e!835216)))

(declare-fun e!835218 () Bool)

(assert (=> b!1489889 (= e!835218 e!835216)))

(declare-fun b!1489890 () Bool)

(assert (=> b!1489890 (= e!835217 e!835218)))

(declare-fun res!1012693 () Bool)

(assert (=> b!1489890 (= res!1012693 (and ((_ is Intermediate!12255) lt!649719) (not (undefined!13067 lt!649719)) (bvslt (x!133188 lt!649719) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649719) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649719) #b00000000000000000000000000000000)))))

(assert (=> b!1489890 (=> (not res!1012693) (not e!835218))))

(declare-fun b!1489891 () Bool)

(assert (=> b!1489891 (= e!835214 (Intermediate!12255 true (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157143 c!138133) b!1489891))

(assert (= (and d!157143 (not c!138133)) b!1489883))

(assert (= (and b!1489883 c!138131) b!1489888))

(assert (= (and b!1489883 (not c!138131)) b!1489884))

(assert (= (and d!157143 c!138132) b!1489887))

(assert (= (and d!157143 (not c!138132)) b!1489890))

(assert (= (and b!1489890 res!1012693) b!1489889))

(assert (= (and b!1489889 (not res!1012694)) b!1489886))

(assert (= (and b!1489886 (not res!1012692)) b!1489885))

(declare-fun m!1374397 () Bool)

(assert (=> b!1489889 m!1374397))

(assert (=> b!1489884 m!1374277))

(declare-fun m!1374399 () Bool)

(assert (=> b!1489884 m!1374399))

(assert (=> b!1489884 m!1374399))

(assert (=> b!1489884 m!1374233))

(declare-fun m!1374401 () Bool)

(assert (=> b!1489884 m!1374401))

(assert (=> d!157143 m!1374277))

(declare-fun m!1374403 () Bool)

(assert (=> d!157143 m!1374403))

(assert (=> d!157143 m!1374261))

(assert (=> b!1489885 m!1374397))

(assert (=> b!1489886 m!1374397))

(assert (=> b!1489728 d!157143))

(declare-fun d!157145 () Bool)

(declare-fun lt!649726 () (_ BitVec 32))

(declare-fun lt!649725 () (_ BitVec 32))

(assert (=> d!157145 (= lt!649726 (bvmul (bvxor lt!649725 (bvlshr lt!649725 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157145 (= lt!649725 ((_ extract 31 0) (bvand (bvxor (select (arr!48118 a!2862) j!93) (bvlshr (select (arr!48118 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157145 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012695 (let ((h!35999 ((_ extract 31 0) (bvand (bvxor (select (arr!48118 a!2862) j!93) (bvlshr (select (arr!48118 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133192 (bvmul (bvxor h!35999 (bvlshr h!35999 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133192 (bvlshr x!133192 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012695 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012695 #b00000000000000000000000000000000))))))

(assert (=> d!157145 (= (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (bvand (bvxor lt!649726 (bvlshr lt!649726 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1489728 d!157145))

(declare-fun d!157147 () Bool)

(declare-fun e!835222 () Bool)

(assert (=> d!157147 e!835222))

(declare-fun c!138135 () Bool)

(declare-fun lt!649727 () SeekEntryResult!12255)

(assert (=> d!157147 (= c!138135 (and ((_ is Intermediate!12255) lt!649727) (undefined!13067 lt!649727)))))

(declare-fun e!835219 () SeekEntryResult!12255)

(assert (=> d!157147 (= lt!649727 e!835219)))

(declare-fun c!138136 () Bool)

(assert (=> d!157147 (= c!138136 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649728 () (_ BitVec 64))

(assert (=> d!157147 (= lt!649728 (select (arr!48118 lt!649667) lt!649671))))

(assert (=> d!157147 (validMask!0 mask!2687)))

(assert (=> d!157147 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 lt!649669 lt!649667 mask!2687) lt!649727)))

(declare-fun b!1489892 () Bool)

(declare-fun e!835220 () SeekEntryResult!12255)

(assert (=> b!1489892 (= e!835219 e!835220)))

(declare-fun c!138134 () Bool)

(assert (=> b!1489892 (= c!138134 (or (= lt!649728 lt!649669) (= (bvadd lt!649728 lt!649728) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489893 () Bool)

(assert (=> b!1489893 (= e!835220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649671 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) lt!649669 lt!649667 mask!2687))))

(declare-fun b!1489894 () Bool)

(assert (=> b!1489894 (and (bvsge (index!51414 lt!649727) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649727) (size!48669 lt!649667)))))

(declare-fun e!835221 () Bool)

(assert (=> b!1489894 (= e!835221 (= (select (arr!48118 lt!649667) (index!51414 lt!649727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489895 () Bool)

(assert (=> b!1489895 (and (bvsge (index!51414 lt!649727) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649727) (size!48669 lt!649667)))))

(declare-fun res!1012696 () Bool)

(assert (=> b!1489895 (= res!1012696 (= (select (arr!48118 lt!649667) (index!51414 lt!649727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489895 (=> res!1012696 e!835221)))

(declare-fun b!1489896 () Bool)

(assert (=> b!1489896 (= e!835222 (bvsge (x!133188 lt!649727) #b01111111111111111111111111111110))))

(declare-fun b!1489897 () Bool)

(assert (=> b!1489897 (= e!835220 (Intermediate!12255 false lt!649671 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1489898 () Bool)

(assert (=> b!1489898 (and (bvsge (index!51414 lt!649727) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649727) (size!48669 lt!649667)))))

(declare-fun res!1012698 () Bool)

(assert (=> b!1489898 (= res!1012698 (= (select (arr!48118 lt!649667) (index!51414 lt!649727)) lt!649669))))

(assert (=> b!1489898 (=> res!1012698 e!835221)))

(declare-fun e!835223 () Bool)

(assert (=> b!1489898 (= e!835223 e!835221)))

(declare-fun b!1489899 () Bool)

(assert (=> b!1489899 (= e!835222 e!835223)))

(declare-fun res!1012697 () Bool)

(assert (=> b!1489899 (= res!1012697 (and ((_ is Intermediate!12255) lt!649727) (not (undefined!13067 lt!649727)) (bvslt (x!133188 lt!649727) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649727) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649727) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1489899 (=> (not res!1012697) (not e!835223))))

(declare-fun b!1489900 () Bool)

(assert (=> b!1489900 (= e!835219 (Intermediate!12255 true lt!649671 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157147 c!138136) b!1489900))

(assert (= (and d!157147 (not c!138136)) b!1489892))

(assert (= (and b!1489892 c!138134) b!1489897))

(assert (= (and b!1489892 (not c!138134)) b!1489893))

(assert (= (and d!157147 c!138135) b!1489896))

(assert (= (and d!157147 (not c!138135)) b!1489899))

(assert (= (and b!1489899 res!1012697) b!1489898))

(assert (= (and b!1489898 (not res!1012698)) b!1489895))

(assert (= (and b!1489895 (not res!1012696)) b!1489894))

(declare-fun m!1374405 () Bool)

(assert (=> b!1489898 m!1374405))

(declare-fun m!1374407 () Bool)

(assert (=> b!1489893 m!1374407))

(assert (=> b!1489893 m!1374407))

(declare-fun m!1374409 () Bool)

(assert (=> b!1489893 m!1374409))

(declare-fun m!1374411 () Bool)

(assert (=> d!157147 m!1374411))

(assert (=> d!157147 m!1374261))

(assert (=> b!1489894 m!1374405))

(assert (=> b!1489895 m!1374405))

(assert (=> b!1489717 d!157147))

(declare-fun d!157149 () Bool)

(assert (=> d!157149 (= (validKeyInArray!0 (select (arr!48118 a!2862) j!93)) (and (not (= (select (arr!48118 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48118 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1489716 d!157149))

(declare-fun d!157151 () Bool)

(declare-fun lt!649731 () (_ BitVec 32))

(assert (=> d!157151 (and (bvsge lt!649731 #b00000000000000000000000000000000) (bvslt lt!649731 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157151 (= lt!649731 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157151 (validMask!0 mask!2687)))

(assert (=> d!157151 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!649731)))

(declare-fun bs!42799 () Bool)

(assert (= bs!42799 d!157151))

(declare-fun m!1374413 () Bool)

(assert (=> bs!42799 m!1374413))

(assert (=> bs!42799 m!1374261))

(assert (=> b!1489714 d!157151))

(declare-fun b!1489913 () Bool)

(declare-fun e!835231 () SeekEntryResult!12255)

(assert (=> b!1489913 (= e!835231 (MissingVacant!12255 intermediateAfterIndex!19))))

(declare-fun b!1489914 () Bool)

(declare-fun c!138144 () Bool)

(declare-fun lt!649736 () (_ BitVec 64))

(assert (=> b!1489914 (= c!138144 (= lt!649736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835232 () SeekEntryResult!12255)

(assert (=> b!1489914 (= e!835232 e!835231)))

(declare-fun b!1489915 () Bool)

(declare-fun e!835230 () SeekEntryResult!12255)

(assert (=> b!1489915 (= e!835230 e!835232)))

(declare-fun c!138145 () Bool)

(assert (=> b!1489915 (= c!138145 (= lt!649736 lt!649669))))

(declare-fun b!1489916 () Bool)

(assert (=> b!1489916 (= e!835231 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687))))

(declare-fun b!1489918 () Bool)

(assert (=> b!1489918 (= e!835232 (Found!12255 index!646))))

(declare-fun b!1489917 () Bool)

(assert (=> b!1489917 (= e!835230 Undefined!12255)))

(declare-fun d!157153 () Bool)

(declare-fun lt!649737 () SeekEntryResult!12255)

(assert (=> d!157153 (and (or ((_ is Undefined!12255) lt!649737) (not ((_ is Found!12255) lt!649737)) (and (bvsge (index!51413 lt!649737) #b00000000000000000000000000000000) (bvslt (index!51413 lt!649737) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649737) ((_ is Found!12255) lt!649737) (not ((_ is MissingVacant!12255) lt!649737)) (not (= (index!51415 lt!649737) intermediateAfterIndex!19)) (and (bvsge (index!51415 lt!649737) #b00000000000000000000000000000000) (bvslt (index!51415 lt!649737) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649737) (ite ((_ is Found!12255) lt!649737) (= (select (arr!48118 lt!649667) (index!51413 lt!649737)) lt!649669) (and ((_ is MissingVacant!12255) lt!649737) (= (index!51415 lt!649737) intermediateAfterIndex!19) (= (select (arr!48118 lt!649667) (index!51415 lt!649737)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157153 (= lt!649737 e!835230)))

(declare-fun c!138143 () Bool)

(assert (=> d!157153 (= c!138143 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157153 (= lt!649736 (select (arr!48118 lt!649667) index!646))))

(assert (=> d!157153 (validMask!0 mask!2687)))

(assert (=> d!157153 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687) lt!649737)))

(assert (= (and d!157153 c!138143) b!1489917))

(assert (= (and d!157153 (not c!138143)) b!1489915))

(assert (= (and b!1489915 c!138145) b!1489918))

(assert (= (and b!1489915 (not c!138145)) b!1489914))

(assert (= (and b!1489914 c!138144) b!1489913))

(assert (= (and b!1489914 (not c!138144)) b!1489916))

(declare-fun m!1374415 () Bool)

(assert (=> b!1489916 m!1374415))

(assert (=> b!1489916 m!1374415))

(declare-fun m!1374417 () Bool)

(assert (=> b!1489916 m!1374417))

(declare-fun m!1374419 () Bool)

(assert (=> d!157153 m!1374419))

(declare-fun m!1374421 () Bool)

(assert (=> d!157153 m!1374421))

(declare-fun m!1374423 () Bool)

(assert (=> d!157153 m!1374423))

(assert (=> d!157153 m!1374261))

(assert (=> b!1489714 d!157153))

(declare-fun b!1489931 () Bool)

(declare-fun e!835239 () SeekEntryResult!12255)

(declare-fun e!835240 () SeekEntryResult!12255)

(assert (=> b!1489931 (= e!835239 e!835240)))

(declare-fun lt!649745 () (_ BitVec 64))

(declare-fun lt!649744 () SeekEntryResult!12255)

(assert (=> b!1489931 (= lt!649745 (select (arr!48118 lt!649667) (index!51414 lt!649744)))))

(declare-fun c!138153 () Bool)

(assert (=> b!1489931 (= c!138153 (= lt!649745 lt!649669))))

(declare-fun e!835241 () SeekEntryResult!12255)

(declare-fun b!1489932 () Bool)

(assert (=> b!1489932 (= e!835241 (seekKeyOrZeroReturnVacant!0 (x!133188 lt!649744) (index!51414 lt!649744) (index!51414 lt!649744) lt!649669 lt!649667 mask!2687))))

(declare-fun d!157155 () Bool)

(declare-fun lt!649746 () SeekEntryResult!12255)

(assert (=> d!157155 (and (or ((_ is Undefined!12255) lt!649746) (not ((_ is Found!12255) lt!649746)) (and (bvsge (index!51413 lt!649746) #b00000000000000000000000000000000) (bvslt (index!51413 lt!649746) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649746) ((_ is Found!12255) lt!649746) (not ((_ is MissingZero!12255) lt!649746)) (and (bvsge (index!51412 lt!649746) #b00000000000000000000000000000000) (bvslt (index!51412 lt!649746) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649746) ((_ is Found!12255) lt!649746) ((_ is MissingZero!12255) lt!649746) (not ((_ is MissingVacant!12255) lt!649746)) (and (bvsge (index!51415 lt!649746) #b00000000000000000000000000000000) (bvslt (index!51415 lt!649746) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649746) (ite ((_ is Found!12255) lt!649746) (= (select (arr!48118 lt!649667) (index!51413 lt!649746)) lt!649669) (ite ((_ is MissingZero!12255) lt!649746) (= (select (arr!48118 lt!649667) (index!51412 lt!649746)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12255) lt!649746) (= (select (arr!48118 lt!649667) (index!51415 lt!649746)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157155 (= lt!649746 e!835239)))

(declare-fun c!138152 () Bool)

(assert (=> d!157155 (= c!138152 (and ((_ is Intermediate!12255) lt!649744) (undefined!13067 lt!649744)))))

(assert (=> d!157155 (= lt!649744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649669 mask!2687) lt!649669 lt!649667 mask!2687))))

(assert (=> d!157155 (validMask!0 mask!2687)))

(assert (=> d!157155 (= (seekEntryOrOpen!0 lt!649669 lt!649667 mask!2687) lt!649746)))

(declare-fun b!1489933 () Bool)

(assert (=> b!1489933 (= e!835241 (MissingZero!12255 (index!51414 lt!649744)))))

(declare-fun b!1489934 () Bool)

(declare-fun c!138154 () Bool)

(assert (=> b!1489934 (= c!138154 (= lt!649745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489934 (= e!835240 e!835241)))

(declare-fun b!1489935 () Bool)

(assert (=> b!1489935 (= e!835240 (Found!12255 (index!51414 lt!649744)))))

(declare-fun b!1489936 () Bool)

(assert (=> b!1489936 (= e!835239 Undefined!12255)))

(assert (= (and d!157155 c!138152) b!1489936))

(assert (= (and d!157155 (not c!138152)) b!1489931))

(assert (= (and b!1489931 c!138153) b!1489935))

(assert (= (and b!1489931 (not c!138153)) b!1489934))

(assert (= (and b!1489934 c!138154) b!1489933))

(assert (= (and b!1489934 (not c!138154)) b!1489932))

(declare-fun m!1374425 () Bool)

(assert (=> b!1489931 m!1374425))

(declare-fun m!1374427 () Bool)

(assert (=> b!1489932 m!1374427))

(declare-fun m!1374429 () Bool)

(assert (=> d!157155 m!1374429))

(declare-fun m!1374431 () Bool)

(assert (=> d!157155 m!1374431))

(assert (=> d!157155 m!1374255))

(declare-fun m!1374433 () Bool)

(assert (=> d!157155 m!1374433))

(assert (=> d!157155 m!1374261))

(assert (=> d!157155 m!1374255))

(assert (=> d!157155 m!1374257))

(assert (=> b!1489714 d!157155))

(assert (=> b!1489725 d!157153))

(assert (=> b!1489725 d!157155))

(declare-fun d!157161 () Bool)

(declare-fun e!835245 () Bool)

(assert (=> d!157161 e!835245))

(declare-fun c!138156 () Bool)

(declare-fun lt!649747 () SeekEntryResult!12255)

(assert (=> d!157161 (= c!138156 (and ((_ is Intermediate!12255) lt!649747) (undefined!13067 lt!649747)))))

(declare-fun e!835242 () SeekEntryResult!12255)

(assert (=> d!157161 (= lt!649747 e!835242)))

(declare-fun c!138157 () Bool)

(assert (=> d!157161 (= c!138157 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649748 () (_ BitVec 64))

(assert (=> d!157161 (= lt!649748 (select (arr!48118 a!2862) index!646))))

(assert (=> d!157161 (validMask!0 mask!2687)))

(assert (=> d!157161 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649747)))

(declare-fun b!1489937 () Bool)

(declare-fun e!835243 () SeekEntryResult!12255)

(assert (=> b!1489937 (= e!835242 e!835243)))

(declare-fun c!138155 () Bool)

(assert (=> b!1489937 (= c!138155 (or (= lt!649748 (select (arr!48118 a!2862) j!93)) (= (bvadd lt!649748 lt!649748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489938 () Bool)

(assert (=> b!1489938 (= e!835243 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489939 () Bool)

(assert (=> b!1489939 (and (bvsge (index!51414 lt!649747) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649747) (size!48669 a!2862)))))

(declare-fun e!835244 () Bool)

(assert (=> b!1489939 (= e!835244 (= (select (arr!48118 a!2862) (index!51414 lt!649747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489940 () Bool)

(assert (=> b!1489940 (and (bvsge (index!51414 lt!649747) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649747) (size!48669 a!2862)))))

(declare-fun res!1012699 () Bool)

(assert (=> b!1489940 (= res!1012699 (= (select (arr!48118 a!2862) (index!51414 lt!649747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489940 (=> res!1012699 e!835244)))

(declare-fun b!1489941 () Bool)

(assert (=> b!1489941 (= e!835245 (bvsge (x!133188 lt!649747) #b01111111111111111111111111111110))))

(declare-fun b!1489942 () Bool)

(assert (=> b!1489942 (= e!835243 (Intermediate!12255 false index!646 x!665))))

(declare-fun b!1489943 () Bool)

(assert (=> b!1489943 (and (bvsge (index!51414 lt!649747) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649747) (size!48669 a!2862)))))

(declare-fun res!1012701 () Bool)

(assert (=> b!1489943 (= res!1012701 (= (select (arr!48118 a!2862) (index!51414 lt!649747)) (select (arr!48118 a!2862) j!93)))))

(assert (=> b!1489943 (=> res!1012701 e!835244)))

(declare-fun e!835246 () Bool)

(assert (=> b!1489943 (= e!835246 e!835244)))

(declare-fun b!1489944 () Bool)

(assert (=> b!1489944 (= e!835245 e!835246)))

(declare-fun res!1012700 () Bool)

(assert (=> b!1489944 (= res!1012700 (and ((_ is Intermediate!12255) lt!649747) (not (undefined!13067 lt!649747)) (bvslt (x!133188 lt!649747) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649747) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649747) x!665)))))

(assert (=> b!1489944 (=> (not res!1012700) (not e!835246))))

(declare-fun b!1489945 () Bool)

(assert (=> b!1489945 (= e!835242 (Intermediate!12255 true index!646 x!665))))

(assert (= (and d!157161 c!138157) b!1489945))

(assert (= (and d!157161 (not c!138157)) b!1489937))

(assert (= (and b!1489937 c!138155) b!1489942))

(assert (= (and b!1489937 (not c!138155)) b!1489938))

(assert (= (and d!157161 c!138156) b!1489941))

(assert (= (and d!157161 (not c!138156)) b!1489944))

(assert (= (and b!1489944 res!1012700) b!1489943))

(assert (= (and b!1489943 (not res!1012701)) b!1489940))

(assert (= (and b!1489940 (not res!1012699)) b!1489939))

(declare-fun m!1374435 () Bool)

(assert (=> b!1489943 m!1374435))

(assert (=> b!1489938 m!1374415))

(assert (=> b!1489938 m!1374415))

(assert (=> b!1489938 m!1374233))

(declare-fun m!1374437 () Bool)

(assert (=> b!1489938 m!1374437))

(assert (=> d!157161 m!1374231))

(assert (=> d!157161 m!1374261))

(assert (=> b!1489939 m!1374435))

(assert (=> b!1489940 m!1374435))

(assert (=> b!1489723 d!157161))

(declare-fun d!157163 () Bool)

(declare-fun e!835250 () Bool)

(assert (=> d!157163 e!835250))

(declare-fun c!138159 () Bool)

(declare-fun lt!649749 () SeekEntryResult!12255)

(assert (=> d!157163 (= c!138159 (and ((_ is Intermediate!12255) lt!649749) (undefined!13067 lt!649749)))))

(declare-fun e!835247 () SeekEntryResult!12255)

(assert (=> d!157163 (= lt!649749 e!835247)))

(declare-fun c!138160 () Bool)

(assert (=> d!157163 (= c!138160 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649750 () (_ BitVec 64))

(assert (=> d!157163 (= lt!649750 (select (arr!48118 a!2862) lt!649671))))

(assert (=> d!157163 (validMask!0 mask!2687)))

(assert (=> d!157163 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649749)))

(declare-fun b!1489946 () Bool)

(declare-fun e!835248 () SeekEntryResult!12255)

(assert (=> b!1489946 (= e!835247 e!835248)))

(declare-fun c!138158 () Bool)

(assert (=> b!1489946 (= c!138158 (or (= lt!649750 (select (arr!48118 a!2862) j!93)) (= (bvadd lt!649750 lt!649750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489947 () Bool)

(assert (=> b!1489947 (= e!835248 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649671 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489948 () Bool)

(assert (=> b!1489948 (and (bvsge (index!51414 lt!649749) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649749) (size!48669 a!2862)))))

(declare-fun e!835249 () Bool)

(assert (=> b!1489948 (= e!835249 (= (select (arr!48118 a!2862) (index!51414 lt!649749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489949 () Bool)

(assert (=> b!1489949 (and (bvsge (index!51414 lt!649749) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649749) (size!48669 a!2862)))))

(declare-fun res!1012702 () Bool)

(assert (=> b!1489949 (= res!1012702 (= (select (arr!48118 a!2862) (index!51414 lt!649749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489949 (=> res!1012702 e!835249)))

(declare-fun b!1489950 () Bool)

(assert (=> b!1489950 (= e!835250 (bvsge (x!133188 lt!649749) #b01111111111111111111111111111110))))

(declare-fun b!1489951 () Bool)

(assert (=> b!1489951 (= e!835248 (Intermediate!12255 false lt!649671 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1489952 () Bool)

(assert (=> b!1489952 (and (bvsge (index!51414 lt!649749) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649749) (size!48669 a!2862)))))

(declare-fun res!1012704 () Bool)

(assert (=> b!1489952 (= res!1012704 (= (select (arr!48118 a!2862) (index!51414 lt!649749)) (select (arr!48118 a!2862) j!93)))))

(assert (=> b!1489952 (=> res!1012704 e!835249)))

(declare-fun e!835251 () Bool)

(assert (=> b!1489952 (= e!835251 e!835249)))

(declare-fun b!1489953 () Bool)

(assert (=> b!1489953 (= e!835250 e!835251)))

(declare-fun res!1012703 () Bool)

(assert (=> b!1489953 (= res!1012703 (and ((_ is Intermediate!12255) lt!649749) (not (undefined!13067 lt!649749)) (bvslt (x!133188 lt!649749) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649749) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649749) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1489953 (=> (not res!1012703) (not e!835251))))

(declare-fun b!1489954 () Bool)

(assert (=> b!1489954 (= e!835247 (Intermediate!12255 true lt!649671 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157163 c!138160) b!1489954))

(assert (= (and d!157163 (not c!138160)) b!1489946))

(assert (= (and b!1489946 c!138158) b!1489951))

(assert (= (and b!1489946 (not c!138158)) b!1489947))

(assert (= (and d!157163 c!138159) b!1489950))

(assert (= (and d!157163 (not c!138159)) b!1489953))

(assert (= (and b!1489953 res!1012703) b!1489952))

(assert (= (and b!1489952 (not res!1012704)) b!1489949))

(assert (= (and b!1489949 (not res!1012702)) b!1489948))

(declare-fun m!1374439 () Bool)

(assert (=> b!1489952 m!1374439))

(assert (=> b!1489947 m!1374407))

(assert (=> b!1489947 m!1374407))

(assert (=> b!1489947 m!1374233))

(declare-fun m!1374441 () Bool)

(assert (=> b!1489947 m!1374441))

(declare-fun m!1374443 () Bool)

(assert (=> d!157163 m!1374443))

(assert (=> d!157163 m!1374261))

(assert (=> b!1489948 m!1374439))

(assert (=> b!1489949 m!1374439))

(assert (=> b!1489724 d!157163))

(declare-fun b!1489955 () Bool)

(declare-fun e!835252 () SeekEntryResult!12255)

(declare-fun e!835253 () SeekEntryResult!12255)

(assert (=> b!1489955 (= e!835252 e!835253)))

(declare-fun lt!649752 () (_ BitVec 64))

(declare-fun lt!649751 () SeekEntryResult!12255)

(assert (=> b!1489955 (= lt!649752 (select (arr!48118 a!2862) (index!51414 lt!649751)))))

(declare-fun c!138162 () Bool)

(assert (=> b!1489955 (= c!138162 (= lt!649752 (select (arr!48118 a!2862) j!93)))))

(declare-fun b!1489956 () Bool)

(declare-fun e!835254 () SeekEntryResult!12255)

(assert (=> b!1489956 (= e!835254 (seekKeyOrZeroReturnVacant!0 (x!133188 lt!649751) (index!51414 lt!649751) (index!51414 lt!649751) (select (arr!48118 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157165 () Bool)

(declare-fun lt!649753 () SeekEntryResult!12255)

(assert (=> d!157165 (and (or ((_ is Undefined!12255) lt!649753) (not ((_ is Found!12255) lt!649753)) (and (bvsge (index!51413 lt!649753) #b00000000000000000000000000000000) (bvslt (index!51413 lt!649753) (size!48669 a!2862)))) (or ((_ is Undefined!12255) lt!649753) ((_ is Found!12255) lt!649753) (not ((_ is MissingZero!12255) lt!649753)) (and (bvsge (index!51412 lt!649753) #b00000000000000000000000000000000) (bvslt (index!51412 lt!649753) (size!48669 a!2862)))) (or ((_ is Undefined!12255) lt!649753) ((_ is Found!12255) lt!649753) ((_ is MissingZero!12255) lt!649753) (not ((_ is MissingVacant!12255) lt!649753)) (and (bvsge (index!51415 lt!649753) #b00000000000000000000000000000000) (bvslt (index!51415 lt!649753) (size!48669 a!2862)))) (or ((_ is Undefined!12255) lt!649753) (ite ((_ is Found!12255) lt!649753) (= (select (arr!48118 a!2862) (index!51413 lt!649753)) (select (arr!48118 a!2862) j!93)) (ite ((_ is MissingZero!12255) lt!649753) (= (select (arr!48118 a!2862) (index!51412 lt!649753)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12255) lt!649753) (= (select (arr!48118 a!2862) (index!51415 lt!649753)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157165 (= lt!649753 e!835252)))

(declare-fun c!138161 () Bool)

(assert (=> d!157165 (= c!138161 (and ((_ is Intermediate!12255) lt!649751) (undefined!13067 lt!649751)))))

(assert (=> d!157165 (= lt!649751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157165 (validMask!0 mask!2687)))

(assert (=> d!157165 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!649753)))

(declare-fun b!1489957 () Bool)

(assert (=> b!1489957 (= e!835254 (MissingZero!12255 (index!51414 lt!649751)))))

(declare-fun b!1489958 () Bool)

(declare-fun c!138163 () Bool)

(assert (=> b!1489958 (= c!138163 (= lt!649752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489958 (= e!835253 e!835254)))

(declare-fun b!1489959 () Bool)

(assert (=> b!1489959 (= e!835253 (Found!12255 (index!51414 lt!649751)))))

(declare-fun b!1489960 () Bool)

(assert (=> b!1489960 (= e!835252 Undefined!12255)))

(assert (= (and d!157165 c!138161) b!1489960))

(assert (= (and d!157165 (not c!138161)) b!1489955))

(assert (= (and b!1489955 c!138162) b!1489959))

(assert (= (and b!1489955 (not c!138162)) b!1489958))

(assert (= (and b!1489958 c!138163) b!1489957))

(assert (= (and b!1489958 (not c!138163)) b!1489956))

(declare-fun m!1374445 () Bool)

(assert (=> b!1489955 m!1374445))

(assert (=> b!1489956 m!1374233))

(declare-fun m!1374447 () Bool)

(assert (=> b!1489956 m!1374447))

(declare-fun m!1374449 () Bool)

(assert (=> d!157165 m!1374449))

(declare-fun m!1374451 () Bool)

(assert (=> d!157165 m!1374451))

(assert (=> d!157165 m!1374233))

(assert (=> d!157165 m!1374277))

(declare-fun m!1374453 () Bool)

(assert (=> d!157165 m!1374453))

(assert (=> d!157165 m!1374261))

(assert (=> d!157165 m!1374277))

(assert (=> d!157165 m!1374233))

(assert (=> d!157165 m!1374279))

(assert (=> b!1489713 d!157165))

(declare-fun b!1489999 () Bool)

(declare-fun e!835279 () Bool)

(declare-fun call!68010 () Bool)

(assert (=> b!1489999 (= e!835279 call!68010)))

(declare-fun bm!68007 () Bool)

(assert (=> bm!68007 (= call!68010 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1490000 () Bool)

(declare-fun e!835277 () Bool)

(declare-fun e!835278 () Bool)

(assert (=> b!1490000 (= e!835277 e!835278)))

(declare-fun c!138178 () Bool)

(assert (=> b!1490000 (= c!138178 (validKeyInArray!0 (select (arr!48118 a!2862) j!93)))))

(declare-fun d!157167 () Bool)

(declare-fun res!1012716 () Bool)

(assert (=> d!157167 (=> res!1012716 e!835277)))

(assert (=> d!157167 (= res!1012716 (bvsge j!93 (size!48669 a!2862)))))

(assert (=> d!157167 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!835277)))

(declare-fun b!1490001 () Bool)

(assert (=> b!1490001 (= e!835278 e!835279)))

(declare-fun lt!649768 () (_ BitVec 64))

(assert (=> b!1490001 (= lt!649768 (select (arr!48118 a!2862) j!93))))

(declare-fun lt!649769 () Unit!49883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99700 (_ BitVec 64) (_ BitVec 32)) Unit!49883)

(assert (=> b!1490001 (= lt!649769 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649768 j!93))))

(declare-fun arrayContainsKey!0 (array!99700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1490001 (arrayContainsKey!0 a!2862 lt!649768 #b00000000000000000000000000000000)))

(declare-fun lt!649770 () Unit!49883)

(assert (=> b!1490001 (= lt!649770 lt!649769)))

(declare-fun res!1012715 () Bool)

(assert (=> b!1490001 (= res!1012715 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) (Found!12255 j!93)))))

(assert (=> b!1490001 (=> (not res!1012715) (not e!835279))))

(declare-fun b!1490002 () Bool)

(assert (=> b!1490002 (= e!835278 call!68010)))

(assert (= (and d!157167 (not res!1012716)) b!1490000))

(assert (= (and b!1490000 c!138178) b!1490001))

(assert (= (and b!1490000 (not c!138178)) b!1490002))

(assert (= (and b!1490001 res!1012715) b!1489999))

(assert (= (or b!1489999 b!1490002) bm!68007))

(declare-fun m!1374455 () Bool)

(assert (=> bm!68007 m!1374455))

(assert (=> b!1490000 m!1374233))

(assert (=> b!1490000 m!1374233))

(assert (=> b!1490000 m!1374241))

(assert (=> b!1490001 m!1374233))

(declare-fun m!1374457 () Bool)

(assert (=> b!1490001 m!1374457))

(declare-fun m!1374459 () Bool)

(assert (=> b!1490001 m!1374459))

(assert (=> b!1490001 m!1374233))

(assert (=> b!1490001 m!1374265))

(assert (=> b!1489722 d!157167))

(declare-fun d!157169 () Bool)

(assert (=> d!157169 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649777 () Unit!49883)

(declare-fun choose!38 (array!99700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49883)

(assert (=> d!157169 (= lt!649777 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157169 (validMask!0 mask!2687)))

(assert (=> d!157169 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!649777)))

(declare-fun bs!42800 () Bool)

(assert (= bs!42800 d!157169))

(assert (=> bs!42800 m!1374239))

(declare-fun m!1374479 () Bool)

(assert (=> bs!42800 m!1374479))

(assert (=> bs!42800 m!1374261))

(assert (=> b!1489722 d!157169))

(declare-fun d!157175 () Bool)

(declare-fun e!835291 () Bool)

(assert (=> d!157175 e!835291))

(declare-fun c!138186 () Bool)

(declare-fun lt!649778 () SeekEntryResult!12255)

(assert (=> d!157175 (= c!138186 (and ((_ is Intermediate!12255) lt!649778) (undefined!13067 lt!649778)))))

(declare-fun e!835288 () SeekEntryResult!12255)

(assert (=> d!157175 (= lt!649778 e!835288)))

(declare-fun c!138187 () Bool)

(assert (=> d!157175 (= c!138187 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649779 () (_ BitVec 64))

(assert (=> d!157175 (= lt!649779 (select (arr!48118 lt!649667) index!646))))

(assert (=> d!157175 (validMask!0 mask!2687)))

(assert (=> d!157175 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649669 lt!649667 mask!2687) lt!649778)))

(declare-fun b!1490018 () Bool)

(declare-fun e!835289 () SeekEntryResult!12255)

(assert (=> b!1490018 (= e!835288 e!835289)))

(declare-fun c!138185 () Bool)

(assert (=> b!1490018 (= c!138185 (or (= lt!649779 lt!649669) (= (bvadd lt!649779 lt!649779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1490019 () Bool)

(assert (=> b!1490019 (= e!835289 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!649669 lt!649667 mask!2687))))

(declare-fun b!1490020 () Bool)

(assert (=> b!1490020 (and (bvsge (index!51414 lt!649778) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649778) (size!48669 lt!649667)))))

(declare-fun e!835290 () Bool)

(assert (=> b!1490020 (= e!835290 (= (select (arr!48118 lt!649667) (index!51414 lt!649778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1490021 () Bool)

(assert (=> b!1490021 (and (bvsge (index!51414 lt!649778) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649778) (size!48669 lt!649667)))))

(declare-fun res!1012720 () Bool)

(assert (=> b!1490021 (= res!1012720 (= (select (arr!48118 lt!649667) (index!51414 lt!649778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490021 (=> res!1012720 e!835290)))

(declare-fun b!1490022 () Bool)

(assert (=> b!1490022 (= e!835291 (bvsge (x!133188 lt!649778) #b01111111111111111111111111111110))))

(declare-fun b!1490023 () Bool)

(assert (=> b!1490023 (= e!835289 (Intermediate!12255 false index!646 x!665))))

(declare-fun b!1490024 () Bool)

(assert (=> b!1490024 (and (bvsge (index!51414 lt!649778) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649778) (size!48669 lt!649667)))))

(declare-fun res!1012722 () Bool)

(assert (=> b!1490024 (= res!1012722 (= (select (arr!48118 lt!649667) (index!51414 lt!649778)) lt!649669))))

(assert (=> b!1490024 (=> res!1012722 e!835290)))

(declare-fun e!835292 () Bool)

(assert (=> b!1490024 (= e!835292 e!835290)))

(declare-fun b!1490025 () Bool)

(assert (=> b!1490025 (= e!835291 e!835292)))

(declare-fun res!1012721 () Bool)

(assert (=> b!1490025 (= res!1012721 (and ((_ is Intermediate!12255) lt!649778) (not (undefined!13067 lt!649778)) (bvslt (x!133188 lt!649778) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649778) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649778) x!665)))))

(assert (=> b!1490025 (=> (not res!1012721) (not e!835292))))

(declare-fun b!1490026 () Bool)

(assert (=> b!1490026 (= e!835288 (Intermediate!12255 true index!646 x!665))))

(assert (= (and d!157175 c!138187) b!1490026))

(assert (= (and d!157175 (not c!138187)) b!1490018))

(assert (= (and b!1490018 c!138185) b!1490023))

(assert (= (and b!1490018 (not c!138185)) b!1490019))

(assert (= (and d!157175 c!138186) b!1490022))

(assert (= (and d!157175 (not c!138186)) b!1490025))

(assert (= (and b!1490025 res!1012721) b!1490024))

(assert (= (and b!1490024 (not res!1012722)) b!1490021))

(assert (= (and b!1490021 (not res!1012720)) b!1490020))

(declare-fun m!1374481 () Bool)

(assert (=> b!1490024 m!1374481))

(assert (=> b!1490019 m!1374415))

(assert (=> b!1490019 m!1374415))

(declare-fun m!1374483 () Bool)

(assert (=> b!1490019 m!1374483))

(assert (=> d!157175 m!1374423))

(assert (=> d!157175 m!1374261))

(assert (=> b!1490020 m!1374481))

(assert (=> b!1490021 m!1374481))

(assert (=> b!1489711 d!157175))

(declare-fun d!157177 () Bool)

(assert (=> d!157177 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127026 d!157177))

(declare-fun d!157181 () Bool)

(assert (=> d!157181 (= (array_inv!37399 a!2862) (bvsge (size!48669 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127026 d!157181))

(declare-fun b!1490049 () Bool)

(declare-fun e!835311 () SeekEntryResult!12255)

(assert (=> b!1490049 (= e!835311 (MissingVacant!12255 intermediateAfterIndex!19))))

(declare-fun b!1490050 () Bool)

(declare-fun c!138194 () Bool)

(declare-fun lt!649789 () (_ BitVec 64))

(assert (=> b!1490050 (= c!138194 (= lt!649789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835312 () SeekEntryResult!12255)

(assert (=> b!1490050 (= e!835312 e!835311)))

(declare-fun b!1490051 () Bool)

(declare-fun e!835310 () SeekEntryResult!12255)

(assert (=> b!1490051 (= e!835310 e!835312)))

(declare-fun c!138195 () Bool)

(assert (=> b!1490051 (= c!138195 (= lt!649789 lt!649669))))

(declare-fun b!1490052 () Bool)

(assert (=> b!1490052 (= e!835311 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649671 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687))))

(declare-fun b!1490054 () Bool)

(assert (=> b!1490054 (= e!835312 (Found!12255 lt!649671))))

(declare-fun b!1490053 () Bool)

(assert (=> b!1490053 (= e!835310 Undefined!12255)))

(declare-fun lt!649790 () SeekEntryResult!12255)

(declare-fun d!157183 () Bool)

(assert (=> d!157183 (and (or ((_ is Undefined!12255) lt!649790) (not ((_ is Found!12255) lt!649790)) (and (bvsge (index!51413 lt!649790) #b00000000000000000000000000000000) (bvslt (index!51413 lt!649790) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649790) ((_ is Found!12255) lt!649790) (not ((_ is MissingVacant!12255) lt!649790)) (not (= (index!51415 lt!649790) intermediateAfterIndex!19)) (and (bvsge (index!51415 lt!649790) #b00000000000000000000000000000000) (bvslt (index!51415 lt!649790) (size!48669 lt!649667)))) (or ((_ is Undefined!12255) lt!649790) (ite ((_ is Found!12255) lt!649790) (= (select (arr!48118 lt!649667) (index!51413 lt!649790)) lt!649669) (and ((_ is MissingVacant!12255) lt!649790) (= (index!51415 lt!649790) intermediateAfterIndex!19) (= (select (arr!48118 lt!649667) (index!51415 lt!649790)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157183 (= lt!649790 e!835310)))

(declare-fun c!138193 () Bool)

(assert (=> d!157183 (= c!138193 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157183 (= lt!649789 (select (arr!48118 lt!649667) lt!649671))))

(assert (=> d!157183 (validMask!0 mask!2687)))

(assert (=> d!157183 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649671 intermediateAfterIndex!19 lt!649669 lt!649667 mask!2687) lt!649790)))

(assert (= (and d!157183 c!138193) b!1490053))

(assert (= (and d!157183 (not c!138193)) b!1490051))

(assert (= (and b!1490051 c!138195) b!1490054))

(assert (= (and b!1490051 (not c!138195)) b!1490050))

(assert (= (and b!1490050 c!138194) b!1490049))

(assert (= (and b!1490050 (not c!138194)) b!1490052))

(assert (=> b!1490052 m!1374407))

(assert (=> b!1490052 m!1374407))

(declare-fun m!1374497 () Bool)

(assert (=> b!1490052 m!1374497))

(declare-fun m!1374499 () Bool)

(assert (=> d!157183 m!1374499))

(declare-fun m!1374503 () Bool)

(assert (=> d!157183 m!1374503))

(assert (=> d!157183 m!1374411))

(assert (=> d!157183 m!1374261))

(assert (=> b!1489712 d!157183))

(declare-fun d!157185 () Bool)

(assert (=> d!157185 (= (validKeyInArray!0 (select (arr!48118 a!2862) i!1006)) (and (not (= (select (arr!48118 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48118 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1489731 d!157185))

(declare-fun d!157187 () Bool)

(declare-fun e!835320 () Bool)

(assert (=> d!157187 e!835320))

(declare-fun c!138198 () Bool)

(declare-fun lt!649791 () SeekEntryResult!12255)

(assert (=> d!157187 (= c!138198 (and ((_ is Intermediate!12255) lt!649791) (undefined!13067 lt!649791)))))

(declare-fun e!835317 () SeekEntryResult!12255)

(assert (=> d!157187 (= lt!649791 e!835317)))

(declare-fun c!138199 () Bool)

(assert (=> d!157187 (= c!138199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649792 () (_ BitVec 64))

(assert (=> d!157187 (= lt!649792 (select (arr!48118 lt!649667) (toIndex!0 lt!649669 mask!2687)))))

(assert (=> d!157187 (validMask!0 mask!2687)))

(assert (=> d!157187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649669 mask!2687) lt!649669 lt!649667 mask!2687) lt!649791)))

(declare-fun b!1490060 () Bool)

(declare-fun e!835318 () SeekEntryResult!12255)

(assert (=> b!1490060 (= e!835317 e!835318)))

(declare-fun c!138197 () Bool)

(assert (=> b!1490060 (= c!138197 (or (= lt!649792 lt!649669) (= (bvadd lt!649792 lt!649792) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1490061 () Bool)

(assert (=> b!1490061 (= e!835318 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!649669 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!649669 lt!649667 mask!2687))))

(declare-fun b!1490062 () Bool)

(assert (=> b!1490062 (and (bvsge (index!51414 lt!649791) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649791) (size!48669 lt!649667)))))

(declare-fun e!835319 () Bool)

(assert (=> b!1490062 (= e!835319 (= (select (arr!48118 lt!649667) (index!51414 lt!649791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1490063 () Bool)

(assert (=> b!1490063 (and (bvsge (index!51414 lt!649791) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649791) (size!48669 lt!649667)))))

(declare-fun res!1012738 () Bool)

(assert (=> b!1490063 (= res!1012738 (= (select (arr!48118 lt!649667) (index!51414 lt!649791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490063 (=> res!1012738 e!835319)))

(declare-fun b!1490064 () Bool)

(assert (=> b!1490064 (= e!835320 (bvsge (x!133188 lt!649791) #b01111111111111111111111111111110))))

(declare-fun b!1490065 () Bool)

(assert (=> b!1490065 (= e!835318 (Intermediate!12255 false (toIndex!0 lt!649669 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1490066 () Bool)

(assert (=> b!1490066 (and (bvsge (index!51414 lt!649791) #b00000000000000000000000000000000) (bvslt (index!51414 lt!649791) (size!48669 lt!649667)))))

(declare-fun res!1012740 () Bool)

(assert (=> b!1490066 (= res!1012740 (= (select (arr!48118 lt!649667) (index!51414 lt!649791)) lt!649669))))

(assert (=> b!1490066 (=> res!1012740 e!835319)))

(declare-fun e!835321 () Bool)

(assert (=> b!1490066 (= e!835321 e!835319)))

(declare-fun b!1490067 () Bool)

(assert (=> b!1490067 (= e!835320 e!835321)))

(declare-fun res!1012739 () Bool)

(assert (=> b!1490067 (= res!1012739 (and ((_ is Intermediate!12255) lt!649791) (not (undefined!13067 lt!649791)) (bvslt (x!133188 lt!649791) #b01111111111111111111111111111110) (bvsge (x!133188 lt!649791) #b00000000000000000000000000000000) (bvsge (x!133188 lt!649791) #b00000000000000000000000000000000)))))

(assert (=> b!1490067 (=> (not res!1012739) (not e!835321))))

(declare-fun b!1490068 () Bool)

(assert (=> b!1490068 (= e!835317 (Intermediate!12255 true (toIndex!0 lt!649669 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157187 c!138199) b!1490068))

(assert (= (and d!157187 (not c!138199)) b!1490060))

(assert (= (and b!1490060 c!138197) b!1490065))

(assert (= (and b!1490060 (not c!138197)) b!1490061))

(assert (= (and d!157187 c!138198) b!1490064))

(assert (= (and d!157187 (not c!138198)) b!1490067))

(assert (= (and b!1490067 res!1012739) b!1490066))

(assert (= (and b!1490066 (not res!1012740)) b!1490063))

(assert (= (and b!1490063 (not res!1012738)) b!1490062))

(declare-fun m!1374507 () Bool)

(assert (=> b!1490066 m!1374507))

(assert (=> b!1490061 m!1374255))

(declare-fun m!1374509 () Bool)

(assert (=> b!1490061 m!1374509))

(assert (=> b!1490061 m!1374509))

(declare-fun m!1374511 () Bool)

(assert (=> b!1490061 m!1374511))

(assert (=> d!157187 m!1374255))

(declare-fun m!1374513 () Bool)

(assert (=> d!157187 m!1374513))

(assert (=> d!157187 m!1374261))

(assert (=> b!1490062 m!1374507))

(assert (=> b!1490063 m!1374507))

(assert (=> b!1489732 d!157187))

(declare-fun d!157191 () Bool)

(declare-fun lt!649794 () (_ BitVec 32))

(declare-fun lt!649793 () (_ BitVec 32))

(assert (=> d!157191 (= lt!649794 (bvmul (bvxor lt!649793 (bvlshr lt!649793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157191 (= lt!649793 ((_ extract 31 0) (bvand (bvxor lt!649669 (bvlshr lt!649669 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157191 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012695 (let ((h!35999 ((_ extract 31 0) (bvand (bvxor lt!649669 (bvlshr lt!649669 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133192 (bvmul (bvxor h!35999 (bvlshr h!35999 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133192 (bvlshr x!133192 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012695 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012695 #b00000000000000000000000000000000))))))

(assert (=> d!157191 (= (toIndex!0 lt!649669 mask!2687) (bvand (bvxor lt!649794 (bvlshr lt!649794 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1489732 d!157191))

(declare-fun b!1490097 () Bool)

(declare-fun e!835341 () Bool)

(declare-fun call!68019 () Bool)

(assert (=> b!1490097 (= e!835341 call!68019)))

(declare-fun b!1490098 () Bool)

(assert (=> b!1490098 (= e!835341 call!68019)))

(declare-fun d!157193 () Bool)

(declare-fun res!1012749 () Bool)

(declare-fun e!835340 () Bool)

(assert (=> d!157193 (=> res!1012749 e!835340)))

(assert (=> d!157193 (= res!1012749 (bvsge #b00000000000000000000000000000000 (size!48669 a!2862)))))

(assert (=> d!157193 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34603) e!835340)))

(declare-fun b!1490099 () Bool)

(declare-fun e!835342 () Bool)

(assert (=> b!1490099 (= e!835342 e!835341)))

(declare-fun c!138211 () Bool)

(assert (=> b!1490099 (= c!138211 (validKeyInArray!0 (select (arr!48118 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!68016 () Bool)

(assert (=> bm!68016 (= call!68019 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138211 (Cons!34602 (select (arr!48118 a!2862) #b00000000000000000000000000000000) Nil!34603) Nil!34603)))))

(declare-fun b!1490100 () Bool)

(assert (=> b!1490100 (= e!835340 e!835342)))

(declare-fun res!1012747 () Bool)

(assert (=> b!1490100 (=> (not res!1012747) (not e!835342))))

(declare-fun e!835339 () Bool)

(assert (=> b!1490100 (= res!1012747 (not e!835339))))

(declare-fun res!1012748 () Bool)

(assert (=> b!1490100 (=> (not res!1012748) (not e!835339))))

(assert (=> b!1490100 (= res!1012748 (validKeyInArray!0 (select (arr!48118 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1490101 () Bool)

(declare-fun contains!9970 (List!34606 (_ BitVec 64)) Bool)

(assert (=> b!1490101 (= e!835339 (contains!9970 Nil!34603 (select (arr!48118 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157193 (not res!1012749)) b!1490100))

(assert (= (and b!1490100 res!1012748) b!1490101))

(assert (= (and b!1490100 res!1012747) b!1490099))

(assert (= (and b!1490099 c!138211) b!1490098))

(assert (= (and b!1490099 (not c!138211)) b!1490097))

(assert (= (or b!1490098 b!1490097) bm!68016))

(declare-fun m!1374515 () Bool)

(assert (=> b!1490099 m!1374515))

(assert (=> b!1490099 m!1374515))

(declare-fun m!1374517 () Bool)

(assert (=> b!1490099 m!1374517))

(assert (=> bm!68016 m!1374515))

(declare-fun m!1374525 () Bool)

(assert (=> bm!68016 m!1374525))

(assert (=> b!1490100 m!1374515))

(assert (=> b!1490100 m!1374515))

(assert (=> b!1490100 m!1374517))

(assert (=> b!1490101 m!1374515))

(assert (=> b!1490101 m!1374515))

(declare-fun m!1374531 () Bool)

(assert (=> b!1490101 m!1374531))

(assert (=> b!1489721 d!157193))

(declare-fun b!1490102 () Bool)

(declare-fun e!835345 () Bool)

(declare-fun call!68020 () Bool)

(assert (=> b!1490102 (= e!835345 call!68020)))

(declare-fun bm!68017 () Bool)

(assert (=> bm!68017 (= call!68020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1490103 () Bool)

(declare-fun e!835343 () Bool)

(declare-fun e!835344 () Bool)

(assert (=> b!1490103 (= e!835343 e!835344)))

(declare-fun c!138212 () Bool)

(assert (=> b!1490103 (= c!138212 (validKeyInArray!0 (select (arr!48118 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157197 () Bool)

(declare-fun res!1012751 () Bool)

(assert (=> d!157197 (=> res!1012751 e!835343)))

(assert (=> d!157197 (= res!1012751 (bvsge #b00000000000000000000000000000000 (size!48669 a!2862)))))

(assert (=> d!157197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!835343)))

(declare-fun b!1490104 () Bool)

(assert (=> b!1490104 (= e!835344 e!835345)))

(declare-fun lt!649804 () (_ BitVec 64))

(assert (=> b!1490104 (= lt!649804 (select (arr!48118 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!649805 () Unit!49883)

(assert (=> b!1490104 (= lt!649805 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649804 #b00000000000000000000000000000000))))

(assert (=> b!1490104 (arrayContainsKey!0 a!2862 lt!649804 #b00000000000000000000000000000000)))

(declare-fun lt!649806 () Unit!49883)

(assert (=> b!1490104 (= lt!649806 lt!649805)))

(declare-fun res!1012750 () Bool)

(assert (=> b!1490104 (= res!1012750 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12255 #b00000000000000000000000000000000)))))

(assert (=> b!1490104 (=> (not res!1012750) (not e!835345))))

(declare-fun b!1490105 () Bool)

(assert (=> b!1490105 (= e!835344 call!68020)))

(assert (= (and d!157197 (not res!1012751)) b!1490103))

(assert (= (and b!1490103 c!138212) b!1490104))

(assert (= (and b!1490103 (not c!138212)) b!1490105))

(assert (= (and b!1490104 res!1012750) b!1490102))

(assert (= (or b!1490102 b!1490105) bm!68017))

(declare-fun m!1374533 () Bool)

(assert (=> bm!68017 m!1374533))

(assert (=> b!1490103 m!1374515))

(assert (=> b!1490103 m!1374515))

(assert (=> b!1490103 m!1374517))

(assert (=> b!1490104 m!1374515))

(declare-fun m!1374535 () Bool)

(assert (=> b!1490104 m!1374535))

(declare-fun m!1374537 () Bool)

(assert (=> b!1490104 m!1374537))

(assert (=> b!1490104 m!1374515))

(declare-fun m!1374539 () Bool)

(assert (=> b!1490104 m!1374539))

(assert (=> b!1489730 d!157197))

(check-sat (not b!1490001) (not d!157151) (not b!1490103) (not d!157175) (not b!1490100) (not d!157147) (not b!1489884) (not b!1489893) (not d!157187) (not b!1490104) (not d!157153) (not d!157143) (not d!157155) (not d!157169) (not b!1489932) (not b!1490101) (not d!157165) (not b!1490099) (not b!1489956) (not b!1490019) (not b!1490000) (not b!1490052) (not b!1489938) (not b!1489916) (not bm!68017) (not b!1489947) (not bm!68016) (not d!157161) (not bm!68007) (not d!157163) (not d!157183) (not b!1490061))
(check-sat)
