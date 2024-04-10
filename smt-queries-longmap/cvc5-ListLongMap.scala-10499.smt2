; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123570 () Bool)

(assert start!123570)

(declare-datatypes ((array!97542 0))(
  ( (array!97543 (arr!47078 (Array (_ BitVec 32) (_ BitVec 64))) (size!47628 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97542)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun e!808764 () Bool)

(declare-fun b!1432823 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11357 0))(
  ( (MissingZero!11357 (index!47820 (_ BitVec 32))) (Found!11357 (index!47821 (_ BitVec 32))) (Intermediate!11357 (undefined!12169 Bool) (index!47822 (_ BitVec 32)) (x!129463 (_ BitVec 32))) (Undefined!11357) (MissingVacant!11357 (index!47823 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97542 (_ BitVec 32)) SeekEntryResult!11357)

(assert (=> b!1432823 (= e!808764 (= (seekEntryOrOpen!0 (select (arr!47078 a!2831) j!81) a!2831 mask!2608) (Found!11357 j!81)))))

(declare-fun b!1432824 () Bool)

(declare-fun res!966689 () Bool)

(declare-fun e!808767 () Bool)

(assert (=> b!1432824 (=> (not res!966689) (not e!808767))))

(declare-datatypes ((List!33588 0))(
  ( (Nil!33585) (Cons!33584 (h!34907 (_ BitVec 64)) (t!48282 List!33588)) )
))
(declare-fun arrayNoDuplicates!0 (array!97542 (_ BitVec 32) List!33588) Bool)

(assert (=> b!1432824 (= res!966689 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33585))))

(declare-fun b!1432825 () Bool)

(declare-fun res!966693 () Bool)

(assert (=> b!1432825 (=> (not res!966693) (not e!808767))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432825 (= res!966693 (validKeyInArray!0 (select (arr!47078 a!2831) i!982)))))

(declare-fun b!1432826 () Bool)

(declare-fun res!966699 () Bool)

(assert (=> b!1432826 (=> (not res!966699) (not e!808767))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432826 (= res!966699 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47628 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47628 a!2831))))))

(declare-fun b!1432827 () Bool)

(declare-fun e!808768 () Bool)

(assert (=> b!1432827 (= e!808767 e!808768)))

(declare-fun res!966698 () Bool)

(assert (=> b!1432827 (=> (not res!966698) (not e!808768))))

(declare-fun lt!630762 () SeekEntryResult!11357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97542 (_ BitVec 32)) SeekEntryResult!11357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432827 (= res!966698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47078 a!2831) j!81) mask!2608) (select (arr!47078 a!2831) j!81) a!2831 mask!2608) lt!630762))))

(assert (=> b!1432827 (= lt!630762 (Intermediate!11357 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432828 () Bool)

(declare-fun res!966697 () Bool)

(declare-fun e!808766 () Bool)

(assert (=> b!1432828 (=> (not res!966697) (not e!808766))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432828 (= res!966697 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432829 () Bool)

(declare-fun res!966692 () Bool)

(assert (=> b!1432829 (=> (not res!966692) (not e!808767))))

(assert (=> b!1432829 (= res!966692 (and (= (size!47628 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47628 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47628 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!966700 () Bool)

(assert (=> start!123570 (=> (not res!966700) (not e!808767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123570 (= res!966700 (validMask!0 mask!2608))))

(assert (=> start!123570 e!808767))

(assert (=> start!123570 true))

(declare-fun array_inv!36106 (array!97542) Bool)

(assert (=> start!123570 (array_inv!36106 a!2831)))

(declare-fun b!1432830 () Bool)

(declare-fun res!966691 () Bool)

(assert (=> b!1432830 (=> (not res!966691) (not e!808767))))

(assert (=> b!1432830 (= res!966691 (validKeyInArray!0 (select (arr!47078 a!2831) j!81)))))

(declare-fun b!1432831 () Bool)

(declare-fun res!966695 () Bool)

(assert (=> b!1432831 (=> (not res!966695) (not e!808767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97542 (_ BitVec 32)) Bool)

(assert (=> b!1432831 (= res!966695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432832 () Bool)

(declare-fun e!808765 () Bool)

(assert (=> b!1432832 (= e!808765 true)))

(declare-fun lt!630759 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432832 (= lt!630759 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432833 () Bool)

(declare-fun res!966696 () Bool)

(assert (=> b!1432833 (=> (not res!966696) (not e!808766))))

(assert (=> b!1432833 (= res!966696 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47078 a!2831) j!81) a!2831 mask!2608) lt!630762))))

(declare-fun b!1432834 () Bool)

(assert (=> b!1432834 (= e!808768 e!808766)))

(declare-fun res!966690 () Bool)

(assert (=> b!1432834 (=> (not res!966690) (not e!808766))))

(declare-fun lt!630757 () array!97542)

(declare-fun lt!630760 () (_ BitVec 64))

(declare-fun lt!630758 () SeekEntryResult!11357)

(assert (=> b!1432834 (= res!966690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630760 mask!2608) lt!630760 lt!630757 mask!2608) lt!630758))))

(assert (=> b!1432834 (= lt!630758 (Intermediate!11357 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432834 (= lt!630760 (select (store (arr!47078 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432834 (= lt!630757 (array!97543 (store (arr!47078 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47628 a!2831)))))

(declare-fun b!1432835 () Bool)

(assert (=> b!1432835 (= e!808766 (not e!808765))))

(declare-fun res!966688 () Bool)

(assert (=> b!1432835 (=> res!966688 e!808765)))

(assert (=> b!1432835 (= res!966688 (or (= (select (arr!47078 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47078 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47078 a!2831) index!585) (select (arr!47078 a!2831) j!81)) (= (select (store (arr!47078 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432835 e!808764))

(declare-fun res!966694 () Bool)

(assert (=> b!1432835 (=> (not res!966694) (not e!808764))))

(assert (=> b!1432835 (= res!966694 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48460 0))(
  ( (Unit!48461) )
))
(declare-fun lt!630761 () Unit!48460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48460)

(assert (=> b!1432835 (= lt!630761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432836 () Bool)

(declare-fun res!966687 () Bool)

(assert (=> b!1432836 (=> (not res!966687) (not e!808766))))

(assert (=> b!1432836 (= res!966687 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630760 lt!630757 mask!2608) lt!630758))))

(assert (= (and start!123570 res!966700) b!1432829))

(assert (= (and b!1432829 res!966692) b!1432825))

(assert (= (and b!1432825 res!966693) b!1432830))

(assert (= (and b!1432830 res!966691) b!1432831))

(assert (= (and b!1432831 res!966695) b!1432824))

(assert (= (and b!1432824 res!966689) b!1432826))

(assert (= (and b!1432826 res!966699) b!1432827))

(assert (= (and b!1432827 res!966698) b!1432834))

(assert (= (and b!1432834 res!966690) b!1432833))

(assert (= (and b!1432833 res!966696) b!1432836))

(assert (= (and b!1432836 res!966687) b!1432828))

(assert (= (and b!1432828 res!966697) b!1432835))

(assert (= (and b!1432835 res!966694) b!1432823))

(assert (= (and b!1432835 (not res!966688)) b!1432832))

(declare-fun m!1322649 () Bool)

(assert (=> b!1432835 m!1322649))

(declare-fun m!1322651 () Bool)

(assert (=> b!1432835 m!1322651))

(declare-fun m!1322653 () Bool)

(assert (=> b!1432835 m!1322653))

(declare-fun m!1322655 () Bool)

(assert (=> b!1432835 m!1322655))

(declare-fun m!1322657 () Bool)

(assert (=> b!1432835 m!1322657))

(declare-fun m!1322659 () Bool)

(assert (=> b!1432835 m!1322659))

(declare-fun m!1322661 () Bool)

(assert (=> b!1432836 m!1322661))

(declare-fun m!1322663 () Bool)

(assert (=> b!1432834 m!1322663))

(assert (=> b!1432834 m!1322663))

(declare-fun m!1322665 () Bool)

(assert (=> b!1432834 m!1322665))

(assert (=> b!1432834 m!1322649))

(declare-fun m!1322667 () Bool)

(assert (=> b!1432834 m!1322667))

(assert (=> b!1432827 m!1322657))

(assert (=> b!1432827 m!1322657))

(declare-fun m!1322669 () Bool)

(assert (=> b!1432827 m!1322669))

(assert (=> b!1432827 m!1322669))

(assert (=> b!1432827 m!1322657))

(declare-fun m!1322671 () Bool)

(assert (=> b!1432827 m!1322671))

(declare-fun m!1322673 () Bool)

(assert (=> b!1432832 m!1322673))

(declare-fun m!1322675 () Bool)

(assert (=> start!123570 m!1322675))

(declare-fun m!1322677 () Bool)

(assert (=> start!123570 m!1322677))

(assert (=> b!1432833 m!1322657))

(assert (=> b!1432833 m!1322657))

(declare-fun m!1322679 () Bool)

(assert (=> b!1432833 m!1322679))

(declare-fun m!1322681 () Bool)

(assert (=> b!1432831 m!1322681))

(declare-fun m!1322683 () Bool)

(assert (=> b!1432824 m!1322683))

(assert (=> b!1432823 m!1322657))

(assert (=> b!1432823 m!1322657))

(declare-fun m!1322685 () Bool)

(assert (=> b!1432823 m!1322685))

(declare-fun m!1322687 () Bool)

(assert (=> b!1432825 m!1322687))

(assert (=> b!1432825 m!1322687))

(declare-fun m!1322689 () Bool)

(assert (=> b!1432825 m!1322689))

(assert (=> b!1432830 m!1322657))

(assert (=> b!1432830 m!1322657))

(declare-fun m!1322691 () Bool)

(assert (=> b!1432830 m!1322691))

(push 1)

