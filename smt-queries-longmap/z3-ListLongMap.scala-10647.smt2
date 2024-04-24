; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125238 () Bool)

(assert start!125238)

(declare-fun b!1455631 () Bool)

(declare-fun res!985690 () Bool)

(declare-fun e!819304 () Bool)

(assert (=> b!1455631 (=> res!985690 e!819304)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638021 () (_ BitVec 32))

(declare-datatypes ((array!98581 0))(
  ( (array!98582 (arr!47575 (Array (_ BitVec 32) (_ BitVec 64))) (size!48126 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98581)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11724 0))(
  ( (MissingZero!11724 (index!49288 (_ BitVec 32))) (Found!11724 (index!49289 (_ BitVec 32))) (Intermediate!11724 (undefined!12536 Bool) (index!49290 (_ BitVec 32)) (x!131101 (_ BitVec 32))) (Undefined!11724) (MissingVacant!11724 (index!49291 (_ BitVec 32))) )
))
(declare-fun lt!638020 () SeekEntryResult!11724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98581 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1455631 (= res!985690 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638021 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638020)))))

(declare-fun b!1455632 () Bool)

(declare-fun res!985680 () Bool)

(declare-fun e!819305 () Bool)

(assert (=> b!1455632 (=> (not res!985680) (not e!819305))))

(declare-fun e!819302 () Bool)

(assert (=> b!1455632 (= res!985680 e!819302)))

(declare-fun c!134497 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455632 (= c!134497 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!638023 () (_ BitVec 64))

(declare-fun lt!638017 () SeekEntryResult!11724)

(declare-fun lt!638018 () array!98581)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1455633 () Bool)

(assert (=> b!1455633 (= e!819302 (= lt!638017 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638023 lt!638018 mask!2687)))))

(declare-fun b!1455634 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!819306 () Bool)

(declare-fun lt!638019 () SeekEntryResult!11724)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98581 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1455634 (= e!819306 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638021 intermediateAfterIndex!19 lt!638023 lt!638018 mask!2687) lt!638019)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455635 () Bool)

(declare-fun e!819308 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455635 (= e!819308 (and (or (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) (select (arr!47575 a!2862) j!93))) (let ((bdg!53054 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47575 a!2862) index!646) bdg!53054) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53054 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455636 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98581 (_ BitVec 32)) SeekEntryResult!11724)

(assert (=> b!1455636 (= e!819302 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638023 lt!638018 mask!2687) (seekEntryOrOpen!0 lt!638023 lt!638018 mask!2687)))))

(declare-fun b!1455637 () Bool)

(assert (=> b!1455637 (= e!819306 (not (= lt!638017 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638021 lt!638023 lt!638018 mask!2687))))))

(declare-fun b!1455638 () Bool)

(declare-fun res!985681 () Bool)

(declare-fun e!819303 () Bool)

(assert (=> b!1455638 (=> (not res!985681) (not e!819303))))

(assert (=> b!1455638 (= res!985681 (and (= (size!48126 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48126 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48126 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455639 () Bool)

(declare-fun e!819307 () Bool)

(declare-fun e!819309 () Bool)

(assert (=> b!1455639 (= e!819307 e!819309)))

(declare-fun res!985691 () Bool)

(assert (=> b!1455639 (=> (not res!985691) (not e!819309))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455639 (= res!985691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47575 a!2862) j!93) mask!2687) (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638020))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455639 (= lt!638020 (Intermediate!11724 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455640 () Bool)

(declare-fun e!819301 () Bool)

(assert (=> b!1455640 (= e!819301 e!819304)))

(declare-fun res!985679 () Bool)

(assert (=> b!1455640 (=> res!985679 e!819304)))

(assert (=> b!1455640 (= res!985679 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638021 #b00000000000000000000000000000000) (bvsge lt!638021 (size!48126 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455640 (= lt!638021 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1455640 (= lt!638019 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638023 lt!638018 mask!2687))))

(assert (=> b!1455640 (= lt!638019 (seekEntryOrOpen!0 lt!638023 lt!638018 mask!2687))))

(declare-fun b!1455641 () Bool)

(declare-fun res!985678 () Bool)

(assert (=> b!1455641 (=> (not res!985678) (not e!819308))))

(assert (=> b!1455641 (= res!985678 (= (seekEntryOrOpen!0 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) (Found!11724 j!93)))))

(declare-fun b!1455642 () Bool)

(assert (=> b!1455642 (= e!819309 e!819305)))

(declare-fun res!985688 () Bool)

(assert (=> b!1455642 (=> (not res!985688) (not e!819305))))

(assert (=> b!1455642 (= res!985688 (= lt!638017 (Intermediate!11724 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455642 (= lt!638017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638023 mask!2687) lt!638023 lt!638018 mask!2687))))

(assert (=> b!1455642 (= lt!638023 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455643 () Bool)

(declare-fun res!985686 () Bool)

(assert (=> b!1455643 (=> (not res!985686) (not e!819303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98581 (_ BitVec 32)) Bool)

(assert (=> b!1455643 (= res!985686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455645 () Bool)

(declare-fun res!985683 () Bool)

(assert (=> b!1455645 (=> (not res!985683) (not e!819309))))

(assert (=> b!1455645 (= res!985683 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638020))))

(declare-fun b!1455646 () Bool)

(assert (=> b!1455646 (= e!819303 e!819307)))

(declare-fun res!985684 () Bool)

(assert (=> b!1455646 (=> (not res!985684) (not e!819307))))

(assert (=> b!1455646 (= res!985684 (= (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455646 (= lt!638018 (array!98582 (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48126 a!2862)))))

(declare-fun b!1455647 () Bool)

(declare-fun res!985694 () Bool)

(assert (=> b!1455647 (=> (not res!985694) (not e!819303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455647 (= res!985694 (validKeyInArray!0 (select (arr!47575 a!2862) i!1006)))))

(declare-fun b!1455648 () Bool)

(assert (=> b!1455648 (= e!819305 (not e!819301))))

(declare-fun res!985687 () Bool)

(assert (=> b!1455648 (=> res!985687 e!819301)))

(assert (=> b!1455648 (= res!985687 (or (and (= (select (arr!47575 a!2862) index!646) (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455648 e!819308))

(declare-fun res!985692 () Bool)

(assert (=> b!1455648 (=> (not res!985692) (not e!819308))))

(assert (=> b!1455648 (= res!985692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48977 0))(
  ( (Unit!48978) )
))
(declare-fun lt!638022 () Unit!48977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48977)

(assert (=> b!1455648 (= lt!638022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455649 () Bool)

(assert (=> b!1455649 (= e!819304 true)))

(declare-fun lt!638016 () Bool)

(assert (=> b!1455649 (= lt!638016 e!819306)))

(declare-fun c!134496 () Bool)

(assert (=> b!1455649 (= c!134496 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455650 () Bool)

(declare-fun res!985685 () Bool)

(assert (=> b!1455650 (=> (not res!985685) (not e!819303))))

(assert (=> b!1455650 (= res!985685 (validKeyInArray!0 (select (arr!47575 a!2862) j!93)))))

(declare-fun b!1455651 () Bool)

(declare-fun res!985677 () Bool)

(assert (=> b!1455651 (=> (not res!985677) (not e!819303))))

(assert (=> b!1455651 (= res!985677 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48126 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48126 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48126 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455652 () Bool)

(declare-fun res!985689 () Bool)

(assert (=> b!1455652 (=> (not res!985689) (not e!819305))))

(assert (=> b!1455652 (= res!985689 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!985682 () Bool)

(assert (=> start!125238 (=> (not res!985682) (not e!819303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125238 (= res!985682 (validMask!0 mask!2687))))

(assert (=> start!125238 e!819303))

(assert (=> start!125238 true))

(declare-fun array_inv!36856 (array!98581) Bool)

(assert (=> start!125238 (array_inv!36856 a!2862)))

(declare-fun b!1455644 () Bool)

(declare-fun res!985693 () Bool)

(assert (=> b!1455644 (=> (not res!985693) (not e!819303))))

(declare-datatypes ((List!34063 0))(
  ( (Nil!34060) (Cons!34059 (h!35420 (_ BitVec 64)) (t!48749 List!34063)) )
))
(declare-fun arrayNoDuplicates!0 (array!98581 (_ BitVec 32) List!34063) Bool)

(assert (=> b!1455644 (= res!985693 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34060))))

(assert (= (and start!125238 res!985682) b!1455638))

(assert (= (and b!1455638 res!985681) b!1455647))

(assert (= (and b!1455647 res!985694) b!1455650))

(assert (= (and b!1455650 res!985685) b!1455643))

(assert (= (and b!1455643 res!985686) b!1455644))

(assert (= (and b!1455644 res!985693) b!1455651))

(assert (= (and b!1455651 res!985677) b!1455646))

(assert (= (and b!1455646 res!985684) b!1455639))

(assert (= (and b!1455639 res!985691) b!1455645))

(assert (= (and b!1455645 res!985683) b!1455642))

(assert (= (and b!1455642 res!985688) b!1455632))

(assert (= (and b!1455632 c!134497) b!1455633))

(assert (= (and b!1455632 (not c!134497)) b!1455636))

(assert (= (and b!1455632 res!985680) b!1455652))

(assert (= (and b!1455652 res!985689) b!1455648))

(assert (= (and b!1455648 res!985692) b!1455641))

(assert (= (and b!1455641 res!985678) b!1455635))

(assert (= (and b!1455648 (not res!985687)) b!1455640))

(assert (= (and b!1455640 (not res!985679)) b!1455631))

(assert (= (and b!1455631 (not res!985690)) b!1455649))

(assert (= (and b!1455649 c!134496) b!1455637))

(assert (= (and b!1455649 (not c!134496)) b!1455634))

(declare-fun m!1344103 () Bool)

(assert (=> b!1455636 m!1344103))

(declare-fun m!1344105 () Bool)

(assert (=> b!1455636 m!1344105))

(declare-fun m!1344107 () Bool)

(assert (=> b!1455631 m!1344107))

(assert (=> b!1455631 m!1344107))

(declare-fun m!1344109 () Bool)

(assert (=> b!1455631 m!1344109))

(declare-fun m!1344111 () Bool)

(assert (=> b!1455637 m!1344111))

(declare-fun m!1344113 () Bool)

(assert (=> b!1455647 m!1344113))

(assert (=> b!1455647 m!1344113))

(declare-fun m!1344115 () Bool)

(assert (=> b!1455647 m!1344115))

(declare-fun m!1344117 () Bool)

(assert (=> b!1455640 m!1344117))

(assert (=> b!1455640 m!1344103))

(assert (=> b!1455640 m!1344105))

(declare-fun m!1344119 () Bool)

(assert (=> b!1455644 m!1344119))

(assert (=> b!1455639 m!1344107))

(assert (=> b!1455639 m!1344107))

(declare-fun m!1344121 () Bool)

(assert (=> b!1455639 m!1344121))

(assert (=> b!1455639 m!1344121))

(assert (=> b!1455639 m!1344107))

(declare-fun m!1344123 () Bool)

(assert (=> b!1455639 m!1344123))

(assert (=> b!1455641 m!1344107))

(assert (=> b!1455641 m!1344107))

(declare-fun m!1344125 () Bool)

(assert (=> b!1455641 m!1344125))

(assert (=> b!1455645 m!1344107))

(assert (=> b!1455645 m!1344107))

(declare-fun m!1344127 () Bool)

(assert (=> b!1455645 m!1344127))

(declare-fun m!1344129 () Bool)

(assert (=> start!125238 m!1344129))

(declare-fun m!1344131 () Bool)

(assert (=> start!125238 m!1344131))

(declare-fun m!1344133 () Bool)

(assert (=> b!1455634 m!1344133))

(declare-fun m!1344135 () Bool)

(assert (=> b!1455646 m!1344135))

(declare-fun m!1344137 () Bool)

(assert (=> b!1455646 m!1344137))

(assert (=> b!1455650 m!1344107))

(assert (=> b!1455650 m!1344107))

(declare-fun m!1344139 () Bool)

(assert (=> b!1455650 m!1344139))

(declare-fun m!1344141 () Bool)

(assert (=> b!1455642 m!1344141))

(assert (=> b!1455642 m!1344141))

(declare-fun m!1344143 () Bool)

(assert (=> b!1455642 m!1344143))

(assert (=> b!1455642 m!1344135))

(declare-fun m!1344145 () Bool)

(assert (=> b!1455642 m!1344145))

(declare-fun m!1344147 () Bool)

(assert (=> b!1455648 m!1344147))

(assert (=> b!1455648 m!1344135))

(declare-fun m!1344149 () Bool)

(assert (=> b!1455648 m!1344149))

(declare-fun m!1344151 () Bool)

(assert (=> b!1455648 m!1344151))

(declare-fun m!1344153 () Bool)

(assert (=> b!1455648 m!1344153))

(assert (=> b!1455648 m!1344107))

(assert (=> b!1455635 m!1344135))

(declare-fun m!1344155 () Bool)

(assert (=> b!1455635 m!1344155))

(assert (=> b!1455635 m!1344149))

(assert (=> b!1455635 m!1344151))

(assert (=> b!1455635 m!1344107))

(declare-fun m!1344157 () Bool)

(assert (=> b!1455633 m!1344157))

(declare-fun m!1344159 () Bool)

(assert (=> b!1455643 m!1344159))

(check-sat (not b!1455645) (not b!1455639) (not b!1455633) (not b!1455641) (not b!1455642) (not start!125238) (not b!1455634) (not b!1455650) (not b!1455637) (not b!1455648) (not b!1455640) (not b!1455631) (not b!1455647) (not b!1455643) (not b!1455636) (not b!1455644))
(check-sat)
