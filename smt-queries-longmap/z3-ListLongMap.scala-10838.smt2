; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126824 () Bool)

(assert start!126824)

(declare-fun b!1490041 () Bool)

(declare-fun e!834940 () Bool)

(declare-fun e!834947 () Bool)

(assert (=> b!1490041 (= e!834940 e!834947)))

(declare-fun res!1013554 () Bool)

(assert (=> b!1490041 (=> (not res!1013554) (not e!834947))))

(declare-datatypes ((array!99595 0))(
  ( (array!99596 (arr!48070 (Array (_ BitVec 32) (_ BitVec 64))) (size!48622 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99595)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12335 0))(
  ( (MissingZero!12335 (index!51732 (_ BitVec 32))) (Found!12335 (index!51733 (_ BitVec 32))) (Intermediate!12335 (undefined!13147 Bool) (index!51734 (_ BitVec 32)) (x!133320 (_ BitVec 32))) (Undefined!12335) (MissingVacant!12335 (index!51735 (_ BitVec 32))) )
))
(declare-fun lt!649634 () SeekEntryResult!12335)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12335)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490041 (= res!1013554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48070 a!2862) j!93) mask!2687) (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!649634))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490041 (= lt!649634 (Intermediate!12335 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490042 () Bool)

(declare-fun e!834946 () Bool)

(assert (=> b!1490042 (= e!834947 e!834946)))

(declare-fun res!1013549 () Bool)

(assert (=> b!1490042 (=> (not res!1013549) (not e!834946))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!649629 () SeekEntryResult!12335)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490042 (= res!1013549 (= lt!649629 (Intermediate!12335 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649631 () array!99595)

(declare-fun lt!649630 () (_ BitVec 64))

(assert (=> b!1490042 (= lt!649629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649630 mask!2687) lt!649630 lt!649631 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490042 (= lt!649630 (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490043 () Bool)

(declare-fun res!1013553 () Bool)

(declare-fun e!834942 () Bool)

(assert (=> b!1490043 (=> (not res!1013553) (not e!834942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99595 (_ BitVec 32)) Bool)

(assert (=> b!1490043 (= res!1013553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1013555 () Bool)

(assert (=> start!126824 (=> (not res!1013555) (not e!834942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126824 (= res!1013555 (validMask!0 mask!2687))))

(assert (=> start!126824 e!834942))

(assert (=> start!126824 true))

(declare-fun array_inv!37303 (array!99595) Bool)

(assert (=> start!126824 (array_inv!37303 a!2862)))

(declare-fun b!1490044 () Bool)

(declare-fun e!834945 () Bool)

(assert (=> b!1490044 (= e!834945 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649632 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490044 (= lt!649632 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490045 () Bool)

(declare-fun res!1013557 () Bool)

(assert (=> b!1490045 (=> (not res!1013557) (not e!834942))))

(declare-datatypes ((List!34649 0))(
  ( (Nil!34646) (Cons!34645 (h!36028 (_ BitVec 64)) (t!49335 List!34649)) )
))
(declare-fun arrayNoDuplicates!0 (array!99595 (_ BitVec 32) List!34649) Bool)

(assert (=> b!1490045 (= res!1013557 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34646))))

(declare-fun b!1490046 () Bool)

(assert (=> b!1490046 (= e!834946 (not e!834945))))

(declare-fun res!1013561 () Bool)

(assert (=> b!1490046 (=> res!1013561 e!834945)))

(assert (=> b!1490046 (= res!1013561 (or (and (= (select (arr!48070 a!2862) index!646) (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48070 a!2862) index!646) (select (arr!48070 a!2862) j!93))) (= (select (arr!48070 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!834941 () Bool)

(assert (=> b!1490046 e!834941))

(declare-fun res!1013552 () Bool)

(assert (=> b!1490046 (=> (not res!1013552) (not e!834941))))

(assert (=> b!1490046 (= res!1013552 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49851 0))(
  ( (Unit!49852) )
))
(declare-fun lt!649633 () Unit!49851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49851)

(assert (=> b!1490046 (= lt!649633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490047 () Bool)

(declare-fun res!1013560 () Bool)

(assert (=> b!1490047 (=> (not res!1013560) (not e!834947))))

(assert (=> b!1490047 (= res!1013560 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) lt!649634))))

(declare-fun b!1490048 () Bool)

(assert (=> b!1490048 (= e!834941 (or (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48070 a!2862) intermediateBeforeIndex!19) (select (arr!48070 a!2862) j!93))))))

(declare-fun b!1490049 () Bool)

(assert (=> b!1490049 (= e!834942 e!834940)))

(declare-fun res!1013562 () Bool)

(assert (=> b!1490049 (=> (not res!1013562) (not e!834940))))

(assert (=> b!1490049 (= res!1013562 (= (select (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490049 (= lt!649631 (array!99596 (store (arr!48070 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48622 a!2862)))))

(declare-fun b!1490050 () Bool)

(declare-fun res!1013548 () Bool)

(assert (=> b!1490050 (=> (not res!1013548) (not e!834942))))

(assert (=> b!1490050 (= res!1013548 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48622 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48622 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48622 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490051 () Bool)

(declare-fun res!1013558 () Bool)

(assert (=> b!1490051 (=> (not res!1013558) (not e!834946))))

(declare-fun e!834943 () Bool)

(assert (=> b!1490051 (= res!1013558 e!834943)))

(declare-fun c!137776 () Bool)

(assert (=> b!1490051 (= c!137776 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490052 () Bool)

(declare-fun res!1013556 () Bool)

(assert (=> b!1490052 (=> (not res!1013556) (not e!834946))))

(assert (=> b!1490052 (= res!1013556 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490053 () Bool)

(assert (=> b!1490053 (= e!834943 (= lt!649629 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649630 lt!649631 mask!2687)))))

(declare-fun b!1490054 () Bool)

(declare-fun res!1013551 () Bool)

(assert (=> b!1490054 (=> (not res!1013551) (not e!834941))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12335)

(assert (=> b!1490054 (= res!1013551 (= (seekEntryOrOpen!0 (select (arr!48070 a!2862) j!93) a!2862 mask!2687) (Found!12335 j!93)))))

(declare-fun b!1490055 () Bool)

(declare-fun res!1013559 () Bool)

(assert (=> b!1490055 (=> (not res!1013559) (not e!834942))))

(assert (=> b!1490055 (= res!1013559 (and (= (size!48622 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48622 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48622 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490056 () Bool)

(declare-fun res!1013563 () Bool)

(assert (=> b!1490056 (=> (not res!1013563) (not e!834942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490056 (= res!1013563 (validKeyInArray!0 (select (arr!48070 a!2862) i!1006)))))

(declare-fun b!1490057 () Bool)

(declare-fun res!1013550 () Bool)

(assert (=> b!1490057 (=> (not res!1013550) (not e!834942))))

(assert (=> b!1490057 (= res!1013550 (validKeyInArray!0 (select (arr!48070 a!2862) j!93)))))

(declare-fun b!1490058 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99595 (_ BitVec 32)) SeekEntryResult!12335)

(assert (=> b!1490058 (= e!834943 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649630 lt!649631 mask!2687) (seekEntryOrOpen!0 lt!649630 lt!649631 mask!2687)))))

(assert (= (and start!126824 res!1013555) b!1490055))

(assert (= (and b!1490055 res!1013559) b!1490056))

(assert (= (and b!1490056 res!1013563) b!1490057))

(assert (= (and b!1490057 res!1013550) b!1490043))

(assert (= (and b!1490043 res!1013553) b!1490045))

(assert (= (and b!1490045 res!1013557) b!1490050))

(assert (= (and b!1490050 res!1013548) b!1490049))

(assert (= (and b!1490049 res!1013562) b!1490041))

(assert (= (and b!1490041 res!1013554) b!1490047))

(assert (= (and b!1490047 res!1013560) b!1490042))

(assert (= (and b!1490042 res!1013549) b!1490051))

(assert (= (and b!1490051 c!137776) b!1490053))

(assert (= (and b!1490051 (not c!137776)) b!1490058))

(assert (= (and b!1490051 res!1013558) b!1490052))

(assert (= (and b!1490052 res!1013556) b!1490046))

(assert (= (and b!1490046 res!1013552) b!1490054))

(assert (= (and b!1490054 res!1013551) b!1490048))

(assert (= (and b!1490046 (not res!1013561)) b!1490044))

(declare-fun m!1373667 () Bool)

(assert (=> b!1490057 m!1373667))

(assert (=> b!1490057 m!1373667))

(declare-fun m!1373669 () Bool)

(assert (=> b!1490057 m!1373669))

(declare-fun m!1373671 () Bool)

(assert (=> b!1490043 m!1373671))

(declare-fun m!1373673 () Bool)

(assert (=> b!1490045 m!1373673))

(declare-fun m!1373675 () Bool)

(assert (=> b!1490042 m!1373675))

(assert (=> b!1490042 m!1373675))

(declare-fun m!1373677 () Bool)

(assert (=> b!1490042 m!1373677))

(declare-fun m!1373679 () Bool)

(assert (=> b!1490042 m!1373679))

(declare-fun m!1373681 () Bool)

(assert (=> b!1490042 m!1373681))

(assert (=> b!1490047 m!1373667))

(assert (=> b!1490047 m!1373667))

(declare-fun m!1373683 () Bool)

(assert (=> b!1490047 m!1373683))

(declare-fun m!1373685 () Bool)

(assert (=> b!1490048 m!1373685))

(assert (=> b!1490048 m!1373667))

(assert (=> b!1490049 m!1373679))

(declare-fun m!1373687 () Bool)

(assert (=> b!1490049 m!1373687))

(declare-fun m!1373689 () Bool)

(assert (=> b!1490053 m!1373689))

(declare-fun m!1373691 () Bool)

(assert (=> b!1490056 m!1373691))

(assert (=> b!1490056 m!1373691))

(declare-fun m!1373693 () Bool)

(assert (=> b!1490056 m!1373693))

(assert (=> b!1490054 m!1373667))

(assert (=> b!1490054 m!1373667))

(declare-fun m!1373695 () Bool)

(assert (=> b!1490054 m!1373695))

(assert (=> b!1490041 m!1373667))

(assert (=> b!1490041 m!1373667))

(declare-fun m!1373697 () Bool)

(assert (=> b!1490041 m!1373697))

(assert (=> b!1490041 m!1373697))

(assert (=> b!1490041 m!1373667))

(declare-fun m!1373699 () Bool)

(assert (=> b!1490041 m!1373699))

(declare-fun m!1373701 () Bool)

(assert (=> start!126824 m!1373701))

(declare-fun m!1373703 () Bool)

(assert (=> start!126824 m!1373703))

(declare-fun m!1373705 () Bool)

(assert (=> b!1490046 m!1373705))

(assert (=> b!1490046 m!1373679))

(declare-fun m!1373707 () Bool)

(assert (=> b!1490046 m!1373707))

(declare-fun m!1373709 () Bool)

(assert (=> b!1490046 m!1373709))

(declare-fun m!1373711 () Bool)

(assert (=> b!1490046 m!1373711))

(assert (=> b!1490046 m!1373667))

(declare-fun m!1373713 () Bool)

(assert (=> b!1490058 m!1373713))

(declare-fun m!1373715 () Bool)

(assert (=> b!1490058 m!1373715))

(declare-fun m!1373717 () Bool)

(assert (=> b!1490044 m!1373717))

(check-sat (not b!1490053) (not b!1490058) (not b!1490057) (not b!1490044) (not b!1490041) (not b!1490046) (not b!1490047) (not start!126824) (not b!1490042) (not b!1490054) (not b!1490043) (not b!1490045) (not b!1490056))
(check-sat)
