; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125244 () Bool)

(assert start!125244)

(declare-fun b!1461525 () Bool)

(declare-fun res!991140 () Bool)

(declare-fun e!821656 () Bool)

(assert (=> b!1461525 (=> (not res!991140) (not e!821656))))

(declare-datatypes ((array!98692 0))(
  ( (array!98693 (arr!47634 (Array (_ BitVec 32) (_ BitVec 64))) (size!48184 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98692)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461525 (= res!991140 (validKeyInArray!0 (select (arr!47634 a!2862) j!93)))))

(declare-fun b!1461526 () Bool)

(declare-fun res!991127 () Bool)

(assert (=> b!1461526 (=> (not res!991127) (not e!821656))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98692 (_ BitVec 32)) Bool)

(assert (=> b!1461526 (= res!991127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461527 () Bool)

(declare-fun res!991136 () Bool)

(declare-fun e!821655 () Bool)

(assert (=> b!1461527 (=> (not res!991136) (not e!821655))))

(declare-datatypes ((SeekEntryResult!11886 0))(
  ( (MissingZero!11886 (index!49936 (_ BitVec 32))) (Found!11886 (index!49937 (_ BitVec 32))) (Intermediate!11886 (undefined!12698 Bool) (index!49938 (_ BitVec 32)) (x!131535 (_ BitVec 32))) (Undefined!11886) (MissingVacant!11886 (index!49939 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11886)

(assert (=> b!1461527 (= res!991136 (= (seekEntryOrOpen!0 (select (arr!47634 a!2862) j!93) a!2862 mask!2687) (Found!11886 j!93)))))

(declare-fun lt!640161 () SeekEntryResult!11886)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!821652 () Bool)

(declare-fun lt!640163 () (_ BitVec 32))

(declare-fun b!1461528 () Bool)

(declare-fun lt!640162 () array!98692)

(declare-fun lt!640164 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11886)

(assert (=> b!1461528 (= e!821652 (not (= lt!640161 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640163 lt!640164 lt!640162 mask!2687))))))

(declare-fun b!1461529 () Bool)

(declare-fun e!821659 () Bool)

(assert (=> b!1461529 (= e!821659 true)))

(declare-fun lt!640160 () Bool)

(assert (=> b!1461529 (= lt!640160 e!821652)))

(declare-fun c!134711 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461529 (= c!134711 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461530 () Bool)

(declare-fun e!821660 () Bool)

(declare-fun e!821653 () Bool)

(assert (=> b!1461530 (= e!821660 (not e!821653))))

(declare-fun res!991134 () Bool)

(assert (=> b!1461530 (=> res!991134 e!821653)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461530 (= res!991134 (or (and (= (select (arr!47634 a!2862) index!646) (select (store (arr!47634 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47634 a!2862) index!646) (select (arr!47634 a!2862) j!93))) (= (select (arr!47634 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461530 e!821655))

(declare-fun res!991141 () Bool)

(assert (=> b!1461530 (=> (not res!991141) (not e!821655))))

(assert (=> b!1461530 (= res!991141 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49268 0))(
  ( (Unit!49269) )
))
(declare-fun lt!640159 () Unit!49268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49268)

(assert (=> b!1461530 (= lt!640159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461531 () Bool)

(declare-fun res!991135 () Bool)

(assert (=> b!1461531 (=> (not res!991135) (not e!821656))))

(assert (=> b!1461531 (= res!991135 (and (= (size!48184 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48184 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48184 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461532 () Bool)

(declare-fun res!991125 () Bool)

(assert (=> b!1461532 (=> (not res!991125) (not e!821656))))

(assert (=> b!1461532 (= res!991125 (validKeyInArray!0 (select (arr!47634 a!2862) i!1006)))))

(declare-fun b!1461533 () Bool)

(declare-fun res!991137 () Bool)

(assert (=> b!1461533 (=> (not res!991137) (not e!821660))))

(declare-fun e!821658 () Bool)

(assert (=> b!1461533 (= res!991137 e!821658)))

(declare-fun c!134712 () Bool)

(assert (=> b!1461533 (= c!134712 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!991139 () Bool)

(assert (=> start!125244 (=> (not res!991139) (not e!821656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125244 (= res!991139 (validMask!0 mask!2687))))

(assert (=> start!125244 e!821656))

(assert (=> start!125244 true))

(declare-fun array_inv!36662 (array!98692) Bool)

(assert (=> start!125244 (array_inv!36662 a!2862)))

(declare-fun b!1461534 () Bool)

(declare-fun res!991126 () Bool)

(assert (=> b!1461534 (=> (not res!991126) (not e!821656))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461534 (= res!991126 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48184 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48184 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48184 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461535 () Bool)

(assert (=> b!1461535 (= e!821658 (= lt!640161 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640164 lt!640162 mask!2687)))))

(declare-fun b!1461536 () Bool)

(assert (=> b!1461536 (= e!821655 (or (= (select (arr!47634 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47634 a!2862) intermediateBeforeIndex!19) (select (arr!47634 a!2862) j!93))))))

(declare-fun b!1461537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98692 (_ BitVec 32)) SeekEntryResult!11886)

(assert (=> b!1461537 (= e!821658 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640164 lt!640162 mask!2687) (seekEntryOrOpen!0 lt!640164 lt!640162 mask!2687)))))

(declare-fun b!1461538 () Bool)

(assert (=> b!1461538 (= e!821653 e!821659)))

(declare-fun res!991128 () Bool)

(assert (=> b!1461538 (=> res!991128 e!821659)))

(assert (=> b!1461538 (= res!991128 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640163 #b00000000000000000000000000000000) (bvsge lt!640163 (size!48184 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461538 (= lt!640163 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461539 () Bool)

(declare-fun e!821651 () Bool)

(declare-fun e!821657 () Bool)

(assert (=> b!1461539 (= e!821651 e!821657)))

(declare-fun res!991138 () Bool)

(assert (=> b!1461539 (=> (not res!991138) (not e!821657))))

(declare-fun lt!640158 () SeekEntryResult!11886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461539 (= res!991138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47634 a!2862) j!93) mask!2687) (select (arr!47634 a!2862) j!93) a!2862 mask!2687) lt!640158))))

(assert (=> b!1461539 (= lt!640158 (Intermediate!11886 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461540 () Bool)

(assert (=> b!1461540 (= e!821652 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640163 intermediateAfterIndex!19 lt!640164 lt!640162 mask!2687) (seekEntryOrOpen!0 lt!640164 lt!640162 mask!2687))))))

(declare-fun b!1461541 () Bool)

(declare-fun res!991129 () Bool)

(assert (=> b!1461541 (=> (not res!991129) (not e!821657))))

(assert (=> b!1461541 (= res!991129 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47634 a!2862) j!93) a!2862 mask!2687) lt!640158))))

(declare-fun b!1461542 () Bool)

(declare-fun res!991132 () Bool)

(assert (=> b!1461542 (=> (not res!991132) (not e!821656))))

(declare-datatypes ((List!34135 0))(
  ( (Nil!34132) (Cons!34131 (h!35481 (_ BitVec 64)) (t!48829 List!34135)) )
))
(declare-fun arrayNoDuplicates!0 (array!98692 (_ BitVec 32) List!34135) Bool)

(assert (=> b!1461542 (= res!991132 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34132))))

(declare-fun b!1461543 () Bool)

(assert (=> b!1461543 (= e!821657 e!821660)))

(declare-fun res!991124 () Bool)

(assert (=> b!1461543 (=> (not res!991124) (not e!821660))))

(assert (=> b!1461543 (= res!991124 (= lt!640161 (Intermediate!11886 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461543 (= lt!640161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640164 mask!2687) lt!640164 lt!640162 mask!2687))))

(assert (=> b!1461543 (= lt!640164 (select (store (arr!47634 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461544 () Bool)

(assert (=> b!1461544 (= e!821656 e!821651)))

(declare-fun res!991130 () Bool)

(assert (=> b!1461544 (=> (not res!991130) (not e!821651))))

(assert (=> b!1461544 (= res!991130 (= (select (store (arr!47634 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461544 (= lt!640162 (array!98693 (store (arr!47634 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48184 a!2862)))))

(declare-fun b!1461545 () Bool)

(declare-fun res!991131 () Bool)

(assert (=> b!1461545 (=> res!991131 e!821659)))

(assert (=> b!1461545 (= res!991131 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640163 (select (arr!47634 a!2862) j!93) a!2862 mask!2687) lt!640158)))))

(declare-fun b!1461546 () Bool)

(declare-fun res!991133 () Bool)

(assert (=> b!1461546 (=> (not res!991133) (not e!821660))))

(assert (=> b!1461546 (= res!991133 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125244 res!991139) b!1461531))

(assert (= (and b!1461531 res!991135) b!1461532))

(assert (= (and b!1461532 res!991125) b!1461525))

(assert (= (and b!1461525 res!991140) b!1461526))

(assert (= (and b!1461526 res!991127) b!1461542))

(assert (= (and b!1461542 res!991132) b!1461534))

(assert (= (and b!1461534 res!991126) b!1461544))

(assert (= (and b!1461544 res!991130) b!1461539))

(assert (= (and b!1461539 res!991138) b!1461541))

(assert (= (and b!1461541 res!991129) b!1461543))

(assert (= (and b!1461543 res!991124) b!1461533))

(assert (= (and b!1461533 c!134712) b!1461535))

(assert (= (and b!1461533 (not c!134712)) b!1461537))

(assert (= (and b!1461533 res!991137) b!1461546))

(assert (= (and b!1461546 res!991133) b!1461530))

(assert (= (and b!1461530 res!991141) b!1461527))

(assert (= (and b!1461527 res!991136) b!1461536))

(assert (= (and b!1461530 (not res!991134)) b!1461538))

(assert (= (and b!1461538 (not res!991128)) b!1461545))

(assert (= (and b!1461545 (not res!991131)) b!1461529))

(assert (= (and b!1461529 c!134711) b!1461528))

(assert (= (and b!1461529 (not c!134711)) b!1461540))

(declare-fun m!1349093 () Bool)

(assert (=> b!1461526 m!1349093))

(declare-fun m!1349095 () Bool)

(assert (=> b!1461528 m!1349095))

(declare-fun m!1349097 () Bool)

(assert (=> b!1461541 m!1349097))

(assert (=> b!1461541 m!1349097))

(declare-fun m!1349099 () Bool)

(assert (=> b!1461541 m!1349099))

(declare-fun m!1349101 () Bool)

(assert (=> b!1461544 m!1349101))

(declare-fun m!1349103 () Bool)

(assert (=> b!1461544 m!1349103))

(declare-fun m!1349105 () Bool)

(assert (=> b!1461532 m!1349105))

(assert (=> b!1461532 m!1349105))

(declare-fun m!1349107 () Bool)

(assert (=> b!1461532 m!1349107))

(declare-fun m!1349109 () Bool)

(assert (=> b!1461540 m!1349109))

(declare-fun m!1349111 () Bool)

(assert (=> b!1461540 m!1349111))

(declare-fun m!1349113 () Bool)

(assert (=> b!1461542 m!1349113))

(declare-fun m!1349115 () Bool)

(assert (=> b!1461536 m!1349115))

(assert (=> b!1461536 m!1349097))

(declare-fun m!1349117 () Bool)

(assert (=> b!1461543 m!1349117))

(assert (=> b!1461543 m!1349117))

(declare-fun m!1349119 () Bool)

(assert (=> b!1461543 m!1349119))

(assert (=> b!1461543 m!1349101))

(declare-fun m!1349121 () Bool)

(assert (=> b!1461543 m!1349121))

(assert (=> b!1461539 m!1349097))

(assert (=> b!1461539 m!1349097))

(declare-fun m!1349123 () Bool)

(assert (=> b!1461539 m!1349123))

(assert (=> b!1461539 m!1349123))

(assert (=> b!1461539 m!1349097))

(declare-fun m!1349125 () Bool)

(assert (=> b!1461539 m!1349125))

(declare-fun m!1349127 () Bool)

(assert (=> start!125244 m!1349127))

(declare-fun m!1349129 () Bool)

(assert (=> start!125244 m!1349129))

(declare-fun m!1349131 () Bool)

(assert (=> b!1461535 m!1349131))

(assert (=> b!1461545 m!1349097))

(assert (=> b!1461545 m!1349097))

(declare-fun m!1349133 () Bool)

(assert (=> b!1461545 m!1349133))

(assert (=> b!1461525 m!1349097))

(assert (=> b!1461525 m!1349097))

(declare-fun m!1349135 () Bool)

(assert (=> b!1461525 m!1349135))

(declare-fun m!1349137 () Bool)

(assert (=> b!1461538 m!1349137))

(declare-fun m!1349139 () Bool)

(assert (=> b!1461530 m!1349139))

(assert (=> b!1461530 m!1349101))

(declare-fun m!1349141 () Bool)

(assert (=> b!1461530 m!1349141))

(declare-fun m!1349143 () Bool)

(assert (=> b!1461530 m!1349143))

(declare-fun m!1349145 () Bool)

(assert (=> b!1461530 m!1349145))

(assert (=> b!1461530 m!1349097))

(declare-fun m!1349147 () Bool)

(assert (=> b!1461537 m!1349147))

(assert (=> b!1461537 m!1349111))

(assert (=> b!1461527 m!1349097))

(assert (=> b!1461527 m!1349097))

(declare-fun m!1349149 () Bool)

(assert (=> b!1461527 m!1349149))

(check-sat (not b!1461545) (not b!1461532) (not b!1461541) (not b!1461526) (not b!1461543) (not b!1461527) (not b!1461538) (not b!1461528) (not b!1461530) (not b!1461540) (not b!1461525) (not b!1461539) (not b!1461535) (not b!1461537) (not b!1461542) (not start!125244))
(check-sat)
