; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125034 () Bool)

(assert start!125034)

(declare-fun b!1449811 () Bool)

(declare-fun res!980534 () Bool)

(declare-fun e!816580 () Bool)

(assert (=> b!1449811 (=> (not res!980534) (not e!816580))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449811 (= res!980534 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((SeekEntryResult!11622 0))(
  ( (MissingZero!11622 (index!48880 (_ BitVec 32))) (Found!11622 (index!48881 (_ BitVec 32))) (Intermediate!11622 (undefined!12434 Bool) (index!48882 (_ BitVec 32)) (x!130727 (_ BitVec 32))) (Undefined!11622) (MissingVacant!11622 (index!48883 (_ BitVec 32))) )
))
(declare-fun lt!636025 () SeekEntryResult!11622)

(declare-fun lt!636028 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!816578 () Bool)

(declare-datatypes ((array!98377 0))(
  ( (array!98378 (arr!47473 (Array (_ BitVec 32) (_ BitVec 64))) (size!48024 (_ BitVec 32))) )
))
(declare-fun lt!636031 () array!98377)

(declare-fun b!1449812 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98377 (_ BitVec 32)) SeekEntryResult!11622)

(assert (=> b!1449812 (= e!816578 (= lt!636025 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636028 lt!636031 mask!2687)))))

(declare-fun b!1449814 () Bool)

(declare-fun res!980537 () Bool)

(assert (=> b!1449814 (=> (not res!980537) (not e!816580))))

(assert (=> b!1449814 (= res!980537 e!816578)))

(declare-fun c!134161 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449814 (= c!134161 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449815 () Bool)

(declare-fun e!816581 () Bool)

(declare-fun e!816579 () Bool)

(assert (=> b!1449815 (= e!816581 e!816579)))

(declare-fun res!980539 () Bool)

(assert (=> b!1449815 (=> (not res!980539) (not e!816579))))

(declare-fun lt!636030 () SeekEntryResult!11622)

(declare-fun a!2862 () array!98377)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98377 (_ BitVec 32)) SeekEntryResult!11622)

(assert (=> b!1449815 (= res!980539 (= lt!636030 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47473 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449816 () Bool)

(declare-fun e!816575 () Bool)

(declare-fun e!816576 () Bool)

(assert (=> b!1449816 (= e!816575 e!816576)))

(declare-fun res!980533 () Bool)

(assert (=> b!1449816 (=> (not res!980533) (not e!816576))))

(assert (=> b!1449816 (= res!980533 (= (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449816 (= lt!636031 (array!98378 (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48024 a!2862)))))

(declare-fun b!1449817 () Bool)

(declare-fun e!816574 () Bool)

(assert (=> b!1449817 (= e!816580 (not e!816574))))

(declare-fun res!980528 () Bool)

(assert (=> b!1449817 (=> res!980528 e!816574)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449817 (= res!980528 (or (and (= (select (arr!47473 a!2862) index!646) (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47473 a!2862) index!646) (select (arr!47473 a!2862) j!93))) (not (= (select (arr!47473 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816577 () Bool)

(assert (=> b!1449817 e!816577))

(declare-fun res!980538 () Bool)

(assert (=> b!1449817 (=> (not res!980538) (not e!816577))))

(assert (=> b!1449817 (= res!980538 (and (= lt!636030 (Found!11622 j!93)) (or (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) (select (arr!47473 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98377 (_ BitVec 32)) SeekEntryResult!11622)

(assert (=> b!1449817 (= lt!636030 (seekEntryOrOpen!0 (select (arr!47473 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98377 (_ BitVec 32)) Bool)

(assert (=> b!1449817 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48773 0))(
  ( (Unit!48774) )
))
(declare-fun lt!636026 () Unit!48773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48773)

(assert (=> b!1449817 (= lt!636026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449818 () Bool)

(declare-fun res!980542 () Bool)

(assert (=> b!1449818 (=> (not res!980542) (not e!816575))))

(assert (=> b!1449818 (= res!980542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449819 () Bool)

(declare-fun res!980543 () Bool)

(assert (=> b!1449819 (=> (not res!980543) (not e!816575))))

(assert (=> b!1449819 (= res!980543 (and (= (size!48024 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48024 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48024 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!980531 () Bool)

(assert (=> start!125034 (=> (not res!980531) (not e!816575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125034 (= res!980531 (validMask!0 mask!2687))))

(assert (=> start!125034 e!816575))

(assert (=> start!125034 true))

(declare-fun array_inv!36754 (array!98377) Bool)

(assert (=> start!125034 (array_inv!36754 a!2862)))

(declare-fun b!1449813 () Bool)

(declare-fun e!816582 () Bool)

(assert (=> b!1449813 (= e!816576 e!816582)))

(declare-fun res!980541 () Bool)

(assert (=> b!1449813 (=> (not res!980541) (not e!816582))))

(declare-fun lt!636029 () SeekEntryResult!11622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449813 (= res!980541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47473 a!2862) j!93) mask!2687) (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636029))))

(assert (=> b!1449813 (= lt!636029 (Intermediate!11622 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449820 () Bool)

(declare-fun res!980530 () Bool)

(assert (=> b!1449820 (=> (not res!980530) (not e!816575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449820 (= res!980530 (validKeyInArray!0 (select (arr!47473 a!2862) j!93)))))

(declare-fun b!1449821 () Bool)

(assert (=> b!1449821 (= e!816574 true)))

(declare-fun lt!636027 () SeekEntryResult!11622)

(assert (=> b!1449821 (= lt!636027 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47473 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449822 () Bool)

(declare-fun res!980532 () Bool)

(assert (=> b!1449822 (=> (not res!980532) (not e!816575))))

(assert (=> b!1449822 (= res!980532 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48024 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48024 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48024 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449823 () Bool)

(assert (=> b!1449823 (= e!816577 e!816581)))

(declare-fun res!980535 () Bool)

(assert (=> b!1449823 (=> res!980535 e!816581)))

(assert (=> b!1449823 (= res!980535 (or (and (= (select (arr!47473 a!2862) index!646) (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47473 a!2862) index!646) (select (arr!47473 a!2862) j!93))) (not (= (select (arr!47473 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449824 () Bool)

(assert (=> b!1449824 (= e!816579 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449825 () Bool)

(declare-fun res!980527 () Bool)

(assert (=> b!1449825 (=> (not res!980527) (not e!816575))))

(assert (=> b!1449825 (= res!980527 (validKeyInArray!0 (select (arr!47473 a!2862) i!1006)))))

(declare-fun b!1449826 () Bool)

(assert (=> b!1449826 (= e!816582 e!816580)))

(declare-fun res!980536 () Bool)

(assert (=> b!1449826 (=> (not res!980536) (not e!816580))))

(assert (=> b!1449826 (= res!980536 (= lt!636025 (Intermediate!11622 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449826 (= lt!636025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636028 mask!2687) lt!636028 lt!636031 mask!2687))))

(assert (=> b!1449826 (= lt!636028 (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449827 () Bool)

(declare-fun res!980540 () Bool)

(assert (=> b!1449827 (=> (not res!980540) (not e!816575))))

(declare-datatypes ((List!33961 0))(
  ( (Nil!33958) (Cons!33957 (h!35318 (_ BitVec 64)) (t!48647 List!33961)) )
))
(declare-fun arrayNoDuplicates!0 (array!98377 (_ BitVec 32) List!33961) Bool)

(assert (=> b!1449827 (= res!980540 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33958))))

(declare-fun b!1449828 () Bool)

(assert (=> b!1449828 (= e!816578 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636028 lt!636031 mask!2687) (seekEntryOrOpen!0 lt!636028 lt!636031 mask!2687)))))

(declare-fun b!1449829 () Bool)

(declare-fun res!980529 () Bool)

(assert (=> b!1449829 (=> (not res!980529) (not e!816582))))

(assert (=> b!1449829 (= res!980529 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636029))))

(assert (= (and start!125034 res!980531) b!1449819))

(assert (= (and b!1449819 res!980543) b!1449825))

(assert (= (and b!1449825 res!980527) b!1449820))

(assert (= (and b!1449820 res!980530) b!1449818))

(assert (= (and b!1449818 res!980542) b!1449827))

(assert (= (and b!1449827 res!980540) b!1449822))

(assert (= (and b!1449822 res!980532) b!1449816))

(assert (= (and b!1449816 res!980533) b!1449813))

(assert (= (and b!1449813 res!980541) b!1449829))

(assert (= (and b!1449829 res!980529) b!1449826))

(assert (= (and b!1449826 res!980536) b!1449814))

(assert (= (and b!1449814 c!134161) b!1449812))

(assert (= (and b!1449814 (not c!134161)) b!1449828))

(assert (= (and b!1449814 res!980537) b!1449811))

(assert (= (and b!1449811 res!980534) b!1449817))

(assert (= (and b!1449817 res!980538) b!1449823))

(assert (= (and b!1449823 (not res!980535)) b!1449815))

(assert (= (and b!1449815 res!980539) b!1449824))

(assert (= (and b!1449817 (not res!980528)) b!1449821))

(declare-fun m!1338685 () Bool)

(assert (=> b!1449821 m!1338685))

(assert (=> b!1449821 m!1338685))

(declare-fun m!1338687 () Bool)

(assert (=> b!1449821 m!1338687))

(declare-fun m!1338689 () Bool)

(assert (=> b!1449827 m!1338689))

(declare-fun m!1338691 () Bool)

(assert (=> b!1449825 m!1338691))

(assert (=> b!1449825 m!1338691))

(declare-fun m!1338693 () Bool)

(assert (=> b!1449825 m!1338693))

(declare-fun m!1338695 () Bool)

(assert (=> b!1449818 m!1338695))

(declare-fun m!1338697 () Bool)

(assert (=> b!1449816 m!1338697))

(declare-fun m!1338699 () Bool)

(assert (=> b!1449816 m!1338699))

(assert (=> b!1449829 m!1338685))

(assert (=> b!1449829 m!1338685))

(declare-fun m!1338701 () Bool)

(assert (=> b!1449829 m!1338701))

(declare-fun m!1338703 () Bool)

(assert (=> b!1449826 m!1338703))

(assert (=> b!1449826 m!1338703))

(declare-fun m!1338705 () Bool)

(assert (=> b!1449826 m!1338705))

(assert (=> b!1449826 m!1338697))

(declare-fun m!1338707 () Bool)

(assert (=> b!1449826 m!1338707))

(assert (=> b!1449813 m!1338685))

(assert (=> b!1449813 m!1338685))

(declare-fun m!1338709 () Bool)

(assert (=> b!1449813 m!1338709))

(assert (=> b!1449813 m!1338709))

(assert (=> b!1449813 m!1338685))

(declare-fun m!1338711 () Bool)

(assert (=> b!1449813 m!1338711))

(assert (=> b!1449815 m!1338685))

(assert (=> b!1449815 m!1338685))

(declare-fun m!1338713 () Bool)

(assert (=> b!1449815 m!1338713))

(declare-fun m!1338715 () Bool)

(assert (=> b!1449828 m!1338715))

(declare-fun m!1338717 () Bool)

(assert (=> b!1449828 m!1338717))

(assert (=> b!1449820 m!1338685))

(assert (=> b!1449820 m!1338685))

(declare-fun m!1338719 () Bool)

(assert (=> b!1449820 m!1338719))

(declare-fun m!1338721 () Bool)

(assert (=> b!1449817 m!1338721))

(assert (=> b!1449817 m!1338697))

(declare-fun m!1338723 () Bool)

(assert (=> b!1449817 m!1338723))

(declare-fun m!1338725 () Bool)

(assert (=> b!1449817 m!1338725))

(declare-fun m!1338727 () Bool)

(assert (=> b!1449817 m!1338727))

(assert (=> b!1449817 m!1338685))

(declare-fun m!1338729 () Bool)

(assert (=> b!1449817 m!1338729))

(declare-fun m!1338731 () Bool)

(assert (=> b!1449817 m!1338731))

(assert (=> b!1449817 m!1338685))

(declare-fun m!1338733 () Bool)

(assert (=> start!125034 m!1338733))

(declare-fun m!1338735 () Bool)

(assert (=> start!125034 m!1338735))

(declare-fun m!1338737 () Bool)

(assert (=> b!1449812 m!1338737))

(assert (=> b!1449823 m!1338727))

(assert (=> b!1449823 m!1338697))

(assert (=> b!1449823 m!1338725))

(assert (=> b!1449823 m!1338685))

(check-sat (not b!1449829) (not b!1449818) (not b!1449827) (not b!1449826) (not b!1449828) (not b!1449815) (not b!1449812) (not b!1449821) (not b!1449813) (not start!125034) (not b!1449817) (not b!1449820) (not b!1449825))
(check-sat)
