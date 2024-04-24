; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125394 () Bool)

(assert start!125394)

(declare-fun b!1460779 () Bool)

(declare-fun e!821608 () Bool)

(declare-fun e!821606 () Bool)

(assert (=> b!1460779 (= e!821608 e!821606)))

(declare-fun res!989897 () Bool)

(assert (=> b!1460779 (=> (not res!989897) (not e!821606))))

(declare-datatypes ((SeekEntryResult!11802 0))(
  ( (MissingZero!11802 (index!49600 (_ BitVec 32))) (Found!11802 (index!49601 (_ BitVec 32))) (Intermediate!11802 (undefined!12614 Bool) (index!49602 (_ BitVec 32)) (x!131387 (_ BitVec 32))) (Undefined!11802) (MissingVacant!11802 (index!49603 (_ BitVec 32))) )
))
(declare-fun lt!639932 () SeekEntryResult!11802)

(declare-datatypes ((array!98737 0))(
  ( (array!98738 (arr!47653 (Array (_ BitVec 32) (_ BitVec 64))) (size!48204 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98737)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98737 (_ BitVec 32)) SeekEntryResult!11802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460779 (= res!989897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47653 a!2862) j!93) mask!2687) (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!639932))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460779 (= lt!639932 (Intermediate!11802 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460780 () Bool)

(declare-fun res!989903 () Bool)

(declare-fun e!821602 () Bool)

(assert (=> b!1460780 (=> (not res!989903) (not e!821602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98737 (_ BitVec 32)) Bool)

(assert (=> b!1460780 (= res!989903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460781 () Bool)

(declare-fun res!989900 () Bool)

(assert (=> b!1460781 (=> (not res!989900) (not e!821602))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460781 (= res!989900 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48204 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48204 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48204 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460782 () Bool)

(declare-fun res!989895 () Bool)

(assert (=> b!1460782 (=> (not res!989895) (not e!821602))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460782 (= res!989895 (validKeyInArray!0 (select (arr!47653 a!2862) i!1006)))))

(declare-fun lt!639929 () SeekEntryResult!11802)

(declare-fun lt!639928 () array!98737)

(declare-fun lt!639926 () (_ BitVec 64))

(declare-fun b!1460783 () Bool)

(declare-fun e!821604 () Bool)

(assert (=> b!1460783 (= e!821604 (= lt!639929 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639926 lt!639928 mask!2687)))))

(declare-fun b!1460784 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98737 (_ BitVec 32)) SeekEntryResult!11802)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98737 (_ BitVec 32)) SeekEntryResult!11802)

(assert (=> b!1460784 (= e!821604 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639926 lt!639928 mask!2687) (seekEntryOrOpen!0 lt!639926 lt!639928 mask!2687)))))

(declare-fun lt!639931 () (_ BitVec 32))

(declare-fun b!1460786 () Bool)

(declare-fun e!821609 () Bool)

(assert (=> b!1460786 (= e!821609 (not (= lt!639929 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639931 lt!639926 lt!639928 mask!2687))))))

(declare-fun b!1460787 () Bool)

(declare-fun res!989894 () Bool)

(declare-fun e!821607 () Bool)

(assert (=> b!1460787 (=> (not res!989894) (not e!821607))))

(assert (=> b!1460787 (= res!989894 e!821604)))

(declare-fun c!134964 () Bool)

(assert (=> b!1460787 (= c!134964 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460788 () Bool)

(declare-fun res!989892 () Bool)

(assert (=> b!1460788 (=> (not res!989892) (not e!821602))))

(assert (=> b!1460788 (= res!989892 (and (= (size!48204 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48204 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48204 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460789 () Bool)

(declare-fun e!821603 () Bool)

(assert (=> b!1460789 (= e!821603 true)))

(declare-fun lt!639933 () SeekEntryResult!11802)

(declare-fun lt!639927 () SeekEntryResult!11802)

(assert (=> b!1460789 (= lt!639933 lt!639927)))

(declare-datatypes ((Unit!49133 0))(
  ( (Unit!49134) )
))
(declare-fun lt!639934 () Unit!49133)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49133)

(assert (=> b!1460789 (= lt!639934 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639931 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460790 () Bool)

(declare-fun res!989902 () Bool)

(assert (=> b!1460790 (=> res!989902 e!821603)))

(assert (=> b!1460790 (= res!989902 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639931 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!639932)))))

(declare-fun b!1460791 () Bool)

(assert (=> b!1460791 (= e!821609 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639931 intermediateAfterIndex!19 lt!639926 lt!639928 mask!2687) lt!639927)))))

(declare-fun b!1460792 () Bool)

(declare-fun res!989889 () Bool)

(assert (=> b!1460792 (=> (not res!989889) (not e!821607))))

(assert (=> b!1460792 (= res!989889 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460793 () Bool)

(assert (=> b!1460793 (= e!821606 e!821607)))

(declare-fun res!989896 () Bool)

(assert (=> b!1460793 (=> (not res!989896) (not e!821607))))

(assert (=> b!1460793 (= res!989896 (= lt!639929 (Intermediate!11802 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460793 (= lt!639929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639926 mask!2687) lt!639926 lt!639928 mask!2687))))

(assert (=> b!1460793 (= lt!639926 (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460794 () Bool)

(declare-fun res!989906 () Bool)

(assert (=> b!1460794 (=> res!989906 e!821603)))

(assert (=> b!1460794 (= res!989906 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460795 () Bool)

(declare-fun e!821610 () Bool)

(assert (=> b!1460795 (= e!821607 (not e!821610))))

(declare-fun res!989899 () Bool)

(assert (=> b!1460795 (=> res!989899 e!821610)))

(assert (=> b!1460795 (= res!989899 (or (and (= (select (arr!47653 a!2862) index!646) (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47653 a!2862) index!646) (select (arr!47653 a!2862) j!93))) (= (select (arr!47653 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460795 (and (= lt!639933 (Found!11802 j!93)) (or (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) (select (arr!47653 a!2862) j!93))) (let ((bdg!53514 (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47653 a!2862) index!646) bdg!53514) (= (select (arr!47653 a!2862) index!646) (select (arr!47653 a!2862) j!93))) (= (select (arr!47653 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53514 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460795 (= lt!639933 (seekEntryOrOpen!0 (select (arr!47653 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1460795 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639930 () Unit!49133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49133)

(assert (=> b!1460795 (= lt!639930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460796 () Bool)

(declare-fun res!989891 () Bool)

(assert (=> b!1460796 (=> (not res!989891) (not e!821602))))

(declare-datatypes ((List!34141 0))(
  ( (Nil!34138) (Cons!34137 (h!35498 (_ BitVec 64)) (t!48827 List!34141)) )
))
(declare-fun arrayNoDuplicates!0 (array!98737 (_ BitVec 32) List!34141) Bool)

(assert (=> b!1460796 (= res!989891 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34138))))

(declare-fun b!1460797 () Bool)

(declare-fun res!989901 () Bool)

(assert (=> b!1460797 (=> res!989901 e!821603)))

(assert (=> b!1460797 (= res!989901 e!821609)))

(declare-fun c!134965 () Bool)

(assert (=> b!1460797 (= c!134965 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460785 () Bool)

(declare-fun res!989890 () Bool)

(assert (=> b!1460785 (=> (not res!989890) (not e!821606))))

(assert (=> b!1460785 (= res!989890 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!639932))))

(declare-fun res!989893 () Bool)

(assert (=> start!125394 (=> (not res!989893) (not e!821602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125394 (= res!989893 (validMask!0 mask!2687))))

(assert (=> start!125394 e!821602))

(assert (=> start!125394 true))

(declare-fun array_inv!36934 (array!98737) Bool)

(assert (=> start!125394 (array_inv!36934 a!2862)))

(declare-fun b!1460798 () Bool)

(declare-fun res!989898 () Bool)

(assert (=> b!1460798 (=> (not res!989898) (not e!821602))))

(assert (=> b!1460798 (= res!989898 (validKeyInArray!0 (select (arr!47653 a!2862) j!93)))))

(declare-fun b!1460799 () Bool)

(assert (=> b!1460799 (= e!821602 e!821608)))

(declare-fun res!989905 () Bool)

(assert (=> b!1460799 (=> (not res!989905) (not e!821608))))

(assert (=> b!1460799 (= res!989905 (= (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460799 (= lt!639928 (array!98738 (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48204 a!2862)))))

(declare-fun b!1460800 () Bool)

(assert (=> b!1460800 (= e!821610 e!821603)))

(declare-fun res!989904 () Bool)

(assert (=> b!1460800 (=> res!989904 e!821603)))

(assert (=> b!1460800 (= res!989904 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639931 #b00000000000000000000000000000000) (bvsge lt!639931 (size!48204 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460800 (= lt!639931 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1460800 (= lt!639927 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639926 lt!639928 mask!2687))))

(assert (=> b!1460800 (= lt!639927 (seekEntryOrOpen!0 lt!639926 lt!639928 mask!2687))))

(assert (= (and start!125394 res!989893) b!1460788))

(assert (= (and b!1460788 res!989892) b!1460782))

(assert (= (and b!1460782 res!989895) b!1460798))

(assert (= (and b!1460798 res!989898) b!1460780))

(assert (= (and b!1460780 res!989903) b!1460796))

(assert (= (and b!1460796 res!989891) b!1460781))

(assert (= (and b!1460781 res!989900) b!1460799))

(assert (= (and b!1460799 res!989905) b!1460779))

(assert (= (and b!1460779 res!989897) b!1460785))

(assert (= (and b!1460785 res!989890) b!1460793))

(assert (= (and b!1460793 res!989896) b!1460787))

(assert (= (and b!1460787 c!134964) b!1460783))

(assert (= (and b!1460787 (not c!134964)) b!1460784))

(assert (= (and b!1460787 res!989894) b!1460792))

(assert (= (and b!1460792 res!989889) b!1460795))

(assert (= (and b!1460795 (not res!989899)) b!1460800))

(assert (= (and b!1460800 (not res!989904)) b!1460790))

(assert (= (and b!1460790 (not res!989902)) b!1460797))

(assert (= (and b!1460797 c!134965) b!1460786))

(assert (= (and b!1460797 (not c!134965)) b!1460791))

(assert (= (and b!1460797 (not res!989901)) b!1460794))

(assert (= (and b!1460794 (not res!989906)) b!1460789))

(declare-fun m!1348651 () Bool)

(assert (=> b!1460780 m!1348651))

(declare-fun m!1348653 () Bool)

(assert (=> b!1460799 m!1348653))

(declare-fun m!1348655 () Bool)

(assert (=> b!1460799 m!1348655))

(declare-fun m!1348657 () Bool)

(assert (=> b!1460786 m!1348657))

(declare-fun m!1348659 () Bool)

(assert (=> b!1460798 m!1348659))

(assert (=> b!1460798 m!1348659))

(declare-fun m!1348661 () Bool)

(assert (=> b!1460798 m!1348661))

(declare-fun m!1348663 () Bool)

(assert (=> b!1460784 m!1348663))

(declare-fun m!1348665 () Bool)

(assert (=> b!1460784 m!1348665))

(assert (=> b!1460790 m!1348659))

(assert (=> b!1460790 m!1348659))

(declare-fun m!1348667 () Bool)

(assert (=> b!1460790 m!1348667))

(assert (=> b!1460779 m!1348659))

(assert (=> b!1460779 m!1348659))

(declare-fun m!1348669 () Bool)

(assert (=> b!1460779 m!1348669))

(assert (=> b!1460779 m!1348669))

(assert (=> b!1460779 m!1348659))

(declare-fun m!1348671 () Bool)

(assert (=> b!1460779 m!1348671))

(declare-fun m!1348673 () Bool)

(assert (=> b!1460783 m!1348673))

(declare-fun m!1348675 () Bool)

(assert (=> b!1460800 m!1348675))

(assert (=> b!1460800 m!1348663))

(assert (=> b!1460800 m!1348665))

(declare-fun m!1348677 () Bool)

(assert (=> b!1460789 m!1348677))

(declare-fun m!1348679 () Bool)

(assert (=> b!1460795 m!1348679))

(assert (=> b!1460795 m!1348653))

(declare-fun m!1348681 () Bool)

(assert (=> b!1460795 m!1348681))

(declare-fun m!1348683 () Bool)

(assert (=> b!1460795 m!1348683))

(declare-fun m!1348685 () Bool)

(assert (=> b!1460795 m!1348685))

(assert (=> b!1460795 m!1348659))

(declare-fun m!1348687 () Bool)

(assert (=> b!1460795 m!1348687))

(declare-fun m!1348689 () Bool)

(assert (=> b!1460795 m!1348689))

(assert (=> b!1460795 m!1348659))

(declare-fun m!1348691 () Bool)

(assert (=> b!1460793 m!1348691))

(assert (=> b!1460793 m!1348691))

(declare-fun m!1348693 () Bool)

(assert (=> b!1460793 m!1348693))

(assert (=> b!1460793 m!1348653))

(declare-fun m!1348695 () Bool)

(assert (=> b!1460793 m!1348695))

(declare-fun m!1348697 () Bool)

(assert (=> b!1460782 m!1348697))

(assert (=> b!1460782 m!1348697))

(declare-fun m!1348699 () Bool)

(assert (=> b!1460782 m!1348699))

(declare-fun m!1348701 () Bool)

(assert (=> b!1460791 m!1348701))

(declare-fun m!1348703 () Bool)

(assert (=> start!125394 m!1348703))

(declare-fun m!1348705 () Bool)

(assert (=> start!125394 m!1348705))

(declare-fun m!1348707 () Bool)

(assert (=> b!1460796 m!1348707))

(assert (=> b!1460785 m!1348659))

(assert (=> b!1460785 m!1348659))

(declare-fun m!1348709 () Bool)

(assert (=> b!1460785 m!1348709))

(check-sat (not b!1460784) (not start!125394) (not b!1460790) (not b!1460786) (not b!1460779) (not b!1460785) (not b!1460791) (not b!1460789) (not b!1460782) (not b!1460795) (not b!1460798) (not b!1460793) (not b!1460783) (not b!1460796) (not b!1460780) (not b!1460800))
(check-sat)
