; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125120 () Bool)

(assert start!125120)

(declare-fun b!1457604 () Bool)

(declare-fun res!987882 () Bool)

(declare-fun e!819971 () Bool)

(assert (=> b!1457604 (=> (not res!987882) (not e!819971))))

(declare-datatypes ((array!98568 0))(
  ( (array!98569 (arr!47572 (Array (_ BitVec 32) (_ BitVec 64))) (size!48122 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98568)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11824 0))(
  ( (MissingZero!11824 (index!49688 (_ BitVec 32))) (Found!11824 (index!49689 (_ BitVec 32))) (Intermediate!11824 (undefined!12636 Bool) (index!49690 (_ BitVec 32)) (x!131305 (_ BitVec 32))) (Undefined!11824) (MissingVacant!11824 (index!49691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98568 (_ BitVec 32)) SeekEntryResult!11824)

(assert (=> b!1457604 (= res!987882 (= (seekEntryOrOpen!0 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) (Found!11824 j!93)))))

(declare-fun b!1457605 () Bool)

(declare-fun res!987887 () Bool)

(declare-fun e!819964 () Bool)

(assert (=> b!1457605 (=> (not res!987887) (not e!819964))))

(declare-fun e!819968 () Bool)

(assert (=> b!1457605 (= res!987887 e!819968)))

(declare-fun c!134376 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457605 (= c!134376 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457606 () Bool)

(declare-fun e!819970 () Bool)

(declare-fun e!819969 () Bool)

(assert (=> b!1457606 (= e!819970 e!819969)))

(declare-fun res!987881 () Bool)

(assert (=> b!1457606 (=> (not res!987881) (not e!819969))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457606 (= res!987881 (= (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638741 () array!98568)

(assert (=> b!1457606 (= lt!638741 (array!98569 (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48122 a!2862)))))

(declare-fun b!1457607 () Bool)

(declare-fun e!819962 () Bool)

(assert (=> b!1457607 (= e!819962 e!819964)))

(declare-fun res!987884 () Bool)

(assert (=> b!1457607 (=> (not res!987884) (not e!819964))))

(declare-fun lt!638742 () SeekEntryResult!11824)

(assert (=> b!1457607 (= res!987884 (= lt!638742 (Intermediate!11824 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638740 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98568 (_ BitVec 32)) SeekEntryResult!11824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457607 (= lt!638742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638740 mask!2687) lt!638740 lt!638741 mask!2687))))

(assert (=> b!1457607 (= lt!638740 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457608 () Bool)

(assert (=> b!1457608 (= e!819969 e!819962)))

(declare-fun res!987892 () Bool)

(assert (=> b!1457608 (=> (not res!987892) (not e!819962))))

(declare-fun lt!638738 () SeekEntryResult!11824)

(assert (=> b!1457608 (= res!987892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47572 a!2862) j!93) mask!2687) (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!638738))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457608 (= lt!638738 (Intermediate!11824 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457609 () Bool)

(declare-fun e!819965 () Bool)

(assert (=> b!1457609 (= e!819964 (not e!819965))))

(declare-fun res!987891 () Bool)

(assert (=> b!1457609 (=> res!987891 e!819965)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457609 (= res!987891 (or (and (= (select (arr!47572 a!2862) index!646) (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457609 e!819971))

(declare-fun res!987886 () Bool)

(assert (=> b!1457609 (=> (not res!987886) (not e!819971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98568 (_ BitVec 32)) Bool)

(assert (=> b!1457609 (= res!987886 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49144 0))(
  ( (Unit!49145) )
))
(declare-fun lt!638745 () Unit!49144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49144)

(assert (=> b!1457609 (= lt!638745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457610 () Bool)

(declare-fun res!987879 () Bool)

(assert (=> b!1457610 (=> (not res!987879) (not e!819970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457610 (= res!987879 (validKeyInArray!0 (select (arr!47572 a!2862) j!93)))))

(declare-fun b!1457611 () Bool)

(declare-fun res!987888 () Bool)

(assert (=> b!1457611 (=> (not res!987888) (not e!819962))))

(assert (=> b!1457611 (= res!987888 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!638738))))

(declare-fun b!1457612 () Bool)

(declare-fun res!987878 () Bool)

(declare-fun e!819966 () Bool)

(assert (=> b!1457612 (=> res!987878 e!819966)))

(declare-fun lt!638739 () (_ BitVec 32))

(assert (=> b!1457612 (= res!987878 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638739 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!638738)))))

(declare-fun b!1457613 () Bool)

(declare-fun res!987889 () Bool)

(assert (=> b!1457613 (=> (not res!987889) (not e!819970))))

(declare-datatypes ((List!34073 0))(
  ( (Nil!34070) (Cons!34069 (h!35419 (_ BitVec 64)) (t!48767 List!34073)) )
))
(declare-fun arrayNoDuplicates!0 (array!98568 (_ BitVec 32) List!34073) Bool)

(assert (=> b!1457613 (= res!987889 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34070))))

(declare-fun e!819967 () Bool)

(declare-fun b!1457614 () Bool)

(assert (=> b!1457614 (= e!819967 (not (= lt!638742 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638739 lt!638740 lt!638741 mask!2687))))))

(declare-fun b!1457615 () Bool)

(assert (=> b!1457615 (= e!819971 (and (or (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) (select (arr!47572 a!2862) j!93))) (let ((bdg!53347 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47572 a!2862) index!646) bdg!53347) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53347 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457616 () Bool)

(declare-fun res!987875 () Bool)

(assert (=> b!1457616 (=> (not res!987875) (not e!819970))))

(assert (=> b!1457616 (= res!987875 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48122 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48122 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48122 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457617 () Bool)

(declare-fun res!987883 () Bool)

(assert (=> b!1457617 (=> (not res!987883) (not e!819964))))

(assert (=> b!1457617 (= res!987883 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!638744 () SeekEntryResult!11824)

(declare-fun b!1457618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98568 (_ BitVec 32)) SeekEntryResult!11824)

(assert (=> b!1457618 (= e!819967 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638739 intermediateAfterIndex!19 lt!638740 lt!638741 mask!2687) lt!638744)))))

(declare-fun b!1457619 () Bool)

(assert (=> b!1457619 (= e!819968 (= lt!638742 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638740 lt!638741 mask!2687)))))

(declare-fun b!1457620 () Bool)

(declare-fun res!987876 () Bool)

(assert (=> b!1457620 (=> (not res!987876) (not e!819970))))

(assert (=> b!1457620 (= res!987876 (validKeyInArray!0 (select (arr!47572 a!2862) i!1006)))))

(declare-fun b!1457621 () Bool)

(assert (=> b!1457621 (= e!819968 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638740 lt!638741 mask!2687) (seekEntryOrOpen!0 lt!638740 lt!638741 mask!2687)))))

(declare-fun res!987880 () Bool)

(assert (=> start!125120 (=> (not res!987880) (not e!819970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125120 (= res!987880 (validMask!0 mask!2687))))

(assert (=> start!125120 e!819970))

(assert (=> start!125120 true))

(declare-fun array_inv!36600 (array!98568) Bool)

(assert (=> start!125120 (array_inv!36600 a!2862)))

(declare-fun b!1457622 () Bool)

(assert (=> b!1457622 (= e!819965 e!819966)))

(declare-fun res!987890 () Bool)

(assert (=> b!1457622 (=> res!987890 e!819966)))

(assert (=> b!1457622 (= res!987890 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638739 #b00000000000000000000000000000000) (bvsge lt!638739 (size!48122 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457622 (= lt!638739 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457622 (= lt!638744 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638740 lt!638741 mask!2687))))

(assert (=> b!1457622 (= lt!638744 (seekEntryOrOpen!0 lt!638740 lt!638741 mask!2687))))

(declare-fun b!1457623 () Bool)

(declare-fun res!987877 () Bool)

(assert (=> b!1457623 (=> (not res!987877) (not e!819970))))

(assert (=> b!1457623 (= res!987877 (and (= (size!48122 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48122 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48122 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457624 () Bool)

(assert (=> b!1457624 (= e!819966 true)))

(declare-fun lt!638743 () Bool)

(assert (=> b!1457624 (= lt!638743 e!819967)))

(declare-fun c!134375 () Bool)

(assert (=> b!1457624 (= c!134375 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457625 () Bool)

(declare-fun res!987885 () Bool)

(assert (=> b!1457625 (=> (not res!987885) (not e!819970))))

(assert (=> b!1457625 (= res!987885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125120 res!987880) b!1457623))

(assert (= (and b!1457623 res!987877) b!1457620))

(assert (= (and b!1457620 res!987876) b!1457610))

(assert (= (and b!1457610 res!987879) b!1457625))

(assert (= (and b!1457625 res!987885) b!1457613))

(assert (= (and b!1457613 res!987889) b!1457616))

(assert (= (and b!1457616 res!987875) b!1457606))

(assert (= (and b!1457606 res!987881) b!1457608))

(assert (= (and b!1457608 res!987892) b!1457611))

(assert (= (and b!1457611 res!987888) b!1457607))

(assert (= (and b!1457607 res!987884) b!1457605))

(assert (= (and b!1457605 c!134376) b!1457619))

(assert (= (and b!1457605 (not c!134376)) b!1457621))

(assert (= (and b!1457605 res!987887) b!1457617))

(assert (= (and b!1457617 res!987883) b!1457609))

(assert (= (and b!1457609 res!987886) b!1457604))

(assert (= (and b!1457604 res!987882) b!1457615))

(assert (= (and b!1457609 (not res!987891)) b!1457622))

(assert (= (and b!1457622 (not res!987890)) b!1457612))

(assert (= (and b!1457612 (not res!987878)) b!1457624))

(assert (= (and b!1457624 c!134375) b!1457614))

(assert (= (and b!1457624 (not c!134375)) b!1457618))

(declare-fun m!1345563 () Bool)

(assert (=> b!1457618 m!1345563))

(declare-fun m!1345565 () Bool)

(assert (=> b!1457613 m!1345565))

(declare-fun m!1345567 () Bool)

(assert (=> b!1457607 m!1345567))

(assert (=> b!1457607 m!1345567))

(declare-fun m!1345569 () Bool)

(assert (=> b!1457607 m!1345569))

(declare-fun m!1345571 () Bool)

(assert (=> b!1457607 m!1345571))

(declare-fun m!1345573 () Bool)

(assert (=> b!1457607 m!1345573))

(declare-fun m!1345575 () Bool)

(assert (=> b!1457621 m!1345575))

(declare-fun m!1345577 () Bool)

(assert (=> b!1457621 m!1345577))

(declare-fun m!1345579 () Bool)

(assert (=> b!1457612 m!1345579))

(assert (=> b!1457612 m!1345579))

(declare-fun m!1345581 () Bool)

(assert (=> b!1457612 m!1345581))

(assert (=> b!1457608 m!1345579))

(assert (=> b!1457608 m!1345579))

(declare-fun m!1345583 () Bool)

(assert (=> b!1457608 m!1345583))

(assert (=> b!1457608 m!1345583))

(assert (=> b!1457608 m!1345579))

(declare-fun m!1345585 () Bool)

(assert (=> b!1457608 m!1345585))

(assert (=> b!1457604 m!1345579))

(assert (=> b!1457604 m!1345579))

(declare-fun m!1345587 () Bool)

(assert (=> b!1457604 m!1345587))

(declare-fun m!1345589 () Bool)

(assert (=> b!1457622 m!1345589))

(assert (=> b!1457622 m!1345575))

(assert (=> b!1457622 m!1345577))

(assert (=> b!1457615 m!1345571))

(declare-fun m!1345591 () Bool)

(assert (=> b!1457615 m!1345591))

(declare-fun m!1345593 () Bool)

(assert (=> b!1457615 m!1345593))

(declare-fun m!1345595 () Bool)

(assert (=> b!1457615 m!1345595))

(assert (=> b!1457615 m!1345579))

(declare-fun m!1345597 () Bool)

(assert (=> b!1457619 m!1345597))

(declare-fun m!1345599 () Bool)

(assert (=> b!1457620 m!1345599))

(assert (=> b!1457620 m!1345599))

(declare-fun m!1345601 () Bool)

(assert (=> b!1457620 m!1345601))

(declare-fun m!1345603 () Bool)

(assert (=> b!1457614 m!1345603))

(declare-fun m!1345605 () Bool)

(assert (=> b!1457625 m!1345605))

(assert (=> b!1457606 m!1345571))

(declare-fun m!1345607 () Bool)

(assert (=> b!1457606 m!1345607))

(declare-fun m!1345609 () Bool)

(assert (=> b!1457609 m!1345609))

(assert (=> b!1457609 m!1345571))

(assert (=> b!1457609 m!1345593))

(assert (=> b!1457609 m!1345595))

(declare-fun m!1345611 () Bool)

(assert (=> b!1457609 m!1345611))

(assert (=> b!1457609 m!1345579))

(assert (=> b!1457611 m!1345579))

(assert (=> b!1457611 m!1345579))

(declare-fun m!1345613 () Bool)

(assert (=> b!1457611 m!1345613))

(assert (=> b!1457610 m!1345579))

(assert (=> b!1457610 m!1345579))

(declare-fun m!1345615 () Bool)

(assert (=> b!1457610 m!1345615))

(declare-fun m!1345617 () Bool)

(assert (=> start!125120 m!1345617))

(declare-fun m!1345619 () Bool)

(assert (=> start!125120 m!1345619))

(push 1)

