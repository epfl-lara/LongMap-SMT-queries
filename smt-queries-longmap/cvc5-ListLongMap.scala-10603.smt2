; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124756 () Bool)

(assert start!124756)

(declare-fun b!1446774 () Bool)

(declare-fun res!978506 () Bool)

(declare-fun e!814842 () Bool)

(assert (=> b!1446774 (=> (not res!978506) (not e!814842))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98204 0))(
  ( (array!98205 (arr!47390 (Array (_ BitVec 32) (_ BitVec 64))) (size!47940 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98204)

(assert (=> b!1446774 (= res!978506 (and (= (size!47940 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47940 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47940 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446775 () Bool)

(declare-fun e!814838 () Bool)

(declare-fun e!814839 () Bool)

(assert (=> b!1446775 (= e!814838 e!814839)))

(declare-fun res!978504 () Bool)

(assert (=> b!1446775 (=> (not res!978504) (not e!814839))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11642 0))(
  ( (MissingZero!11642 (index!48960 (_ BitVec 32))) (Found!11642 (index!48961 (_ BitVec 32))) (Intermediate!11642 (undefined!12454 Bool) (index!48962 (_ BitVec 32)) (x!130643 (_ BitVec 32))) (Undefined!11642) (MissingVacant!11642 (index!48963 (_ BitVec 32))) )
))
(declare-fun lt!634919 () SeekEntryResult!11642)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98204 (_ BitVec 32)) SeekEntryResult!11642)

(assert (=> b!1446775 (= res!978504 (= lt!634919 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47390 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446776 () Bool)

(declare-fun e!814840 () Bool)

(declare-fun e!814835 () Bool)

(assert (=> b!1446776 (= e!814840 e!814835)))

(declare-fun res!978508 () Bool)

(assert (=> b!1446776 (=> (not res!978508) (not e!814835))))

(declare-fun lt!634923 () SeekEntryResult!11642)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446776 (= res!978508 (= lt!634923 (Intermediate!11642 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634920 () array!98204)

(declare-fun lt!634917 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98204 (_ BitVec 32)) SeekEntryResult!11642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446776 (= lt!634923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634917 mask!2687) lt!634917 lt!634920 mask!2687))))

(assert (=> b!1446776 (= lt!634917 (select (store (arr!47390 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!978503 () Bool)

(assert (=> start!124756 (=> (not res!978503) (not e!814842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124756 (= res!978503 (validMask!0 mask!2687))))

(assert (=> start!124756 e!814842))

(assert (=> start!124756 true))

(declare-fun array_inv!36418 (array!98204) Bool)

(assert (=> start!124756 (array_inv!36418 a!2862)))

(declare-fun b!1446777 () Bool)

(declare-fun res!978496 () Bool)

(assert (=> b!1446777 (=> (not res!978496) (not e!814842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446777 (= res!978496 (validKeyInArray!0 (select (arr!47390 a!2862) j!93)))))

(declare-fun b!1446778 () Bool)

(declare-fun e!814841 () Bool)

(assert (=> b!1446778 (= e!814841 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!634922 () SeekEntryResult!11642)

(assert (=> b!1446778 (= lt!634922 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47390 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446779 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446779 (= e!814839 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446780 () Bool)

(declare-fun res!978505 () Bool)

(assert (=> b!1446780 (=> (not res!978505) (not e!814835))))

(declare-fun e!814837 () Bool)

(assert (=> b!1446780 (= res!978505 e!814837)))

(declare-fun c!133650 () Bool)

(assert (=> b!1446780 (= c!133650 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446781 () Bool)

(assert (=> b!1446781 (= e!814835 (not e!814841))))

(declare-fun res!978498 () Bool)

(assert (=> b!1446781 (=> res!978498 e!814841)))

(assert (=> b!1446781 (= res!978498 (or (and (= (select (arr!47390 a!2862) index!646) (select (store (arr!47390 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47390 a!2862) index!646) (select (arr!47390 a!2862) j!93))) (not (= (select (arr!47390 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47390 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814844 () Bool)

(assert (=> b!1446781 e!814844))

(declare-fun res!978499 () Bool)

(assert (=> b!1446781 (=> (not res!978499) (not e!814844))))

(assert (=> b!1446781 (= res!978499 (and (= lt!634919 (Found!11642 j!93)) (or (= (select (arr!47390 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47390 a!2862) intermediateBeforeIndex!19) (select (arr!47390 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98204 (_ BitVec 32)) SeekEntryResult!11642)

(assert (=> b!1446781 (= lt!634919 (seekEntryOrOpen!0 (select (arr!47390 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98204 (_ BitVec 32)) Bool)

(assert (=> b!1446781 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48780 0))(
  ( (Unit!48781) )
))
(declare-fun lt!634918 () Unit!48780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48780)

(assert (=> b!1446781 (= lt!634918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446782 () Bool)

(declare-fun res!978501 () Bool)

(assert (=> b!1446782 (=> (not res!978501) (not e!814842))))

(assert (=> b!1446782 (= res!978501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446783 () Bool)

(assert (=> b!1446783 (= e!814837 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634917 lt!634920 mask!2687) (seekEntryOrOpen!0 lt!634917 lt!634920 mask!2687)))))

(declare-fun b!1446784 () Bool)

(declare-fun res!978509 () Bool)

(assert (=> b!1446784 (=> (not res!978509) (not e!814840))))

(declare-fun lt!634921 () SeekEntryResult!11642)

(assert (=> b!1446784 (= res!978509 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47390 a!2862) j!93) a!2862 mask!2687) lt!634921))))

(declare-fun b!1446785 () Bool)

(declare-fun res!978495 () Bool)

(assert (=> b!1446785 (=> (not res!978495) (not e!814842))))

(assert (=> b!1446785 (= res!978495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47940 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47940 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47940 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446786 () Bool)

(assert (=> b!1446786 (= e!814837 (= lt!634923 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634917 lt!634920 mask!2687)))))

(declare-fun b!1446787 () Bool)

(declare-fun e!814836 () Bool)

(assert (=> b!1446787 (= e!814842 e!814836)))

(declare-fun res!978507 () Bool)

(assert (=> b!1446787 (=> (not res!978507) (not e!814836))))

(assert (=> b!1446787 (= res!978507 (= (select (store (arr!47390 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446787 (= lt!634920 (array!98205 (store (arr!47390 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47940 a!2862)))))

(declare-fun b!1446788 () Bool)

(declare-fun res!978511 () Bool)

(assert (=> b!1446788 (=> (not res!978511) (not e!814842))))

(assert (=> b!1446788 (= res!978511 (validKeyInArray!0 (select (arr!47390 a!2862) i!1006)))))

(declare-fun b!1446789 () Bool)

(declare-fun res!978510 () Bool)

(assert (=> b!1446789 (=> (not res!978510) (not e!814835))))

(assert (=> b!1446789 (= res!978510 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446790 () Bool)

(declare-fun res!978497 () Bool)

(assert (=> b!1446790 (=> (not res!978497) (not e!814842))))

(declare-datatypes ((List!33891 0))(
  ( (Nil!33888) (Cons!33887 (h!35237 (_ BitVec 64)) (t!48585 List!33891)) )
))
(declare-fun arrayNoDuplicates!0 (array!98204 (_ BitVec 32) List!33891) Bool)

(assert (=> b!1446790 (= res!978497 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33888))))

(declare-fun b!1446791 () Bool)

(assert (=> b!1446791 (= e!814844 e!814838)))

(declare-fun res!978502 () Bool)

(assert (=> b!1446791 (=> res!978502 e!814838)))

(assert (=> b!1446791 (= res!978502 (or (and (= (select (arr!47390 a!2862) index!646) (select (store (arr!47390 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47390 a!2862) index!646) (select (arr!47390 a!2862) j!93))) (not (= (select (arr!47390 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446792 () Bool)

(assert (=> b!1446792 (= e!814836 e!814840)))

(declare-fun res!978500 () Bool)

(assert (=> b!1446792 (=> (not res!978500) (not e!814840))))

(assert (=> b!1446792 (= res!978500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47390 a!2862) j!93) mask!2687) (select (arr!47390 a!2862) j!93) a!2862 mask!2687) lt!634921))))

(assert (=> b!1446792 (= lt!634921 (Intermediate!11642 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124756 res!978503) b!1446774))

(assert (= (and b!1446774 res!978506) b!1446788))

(assert (= (and b!1446788 res!978511) b!1446777))

(assert (= (and b!1446777 res!978496) b!1446782))

(assert (= (and b!1446782 res!978501) b!1446790))

(assert (= (and b!1446790 res!978497) b!1446785))

(assert (= (and b!1446785 res!978495) b!1446787))

(assert (= (and b!1446787 res!978507) b!1446792))

(assert (= (and b!1446792 res!978500) b!1446784))

(assert (= (and b!1446784 res!978509) b!1446776))

(assert (= (and b!1446776 res!978508) b!1446780))

(assert (= (and b!1446780 c!133650) b!1446786))

(assert (= (and b!1446780 (not c!133650)) b!1446783))

(assert (= (and b!1446780 res!978505) b!1446789))

(assert (= (and b!1446789 res!978510) b!1446781))

(assert (= (and b!1446781 res!978499) b!1446791))

(assert (= (and b!1446791 (not res!978502)) b!1446775))

(assert (= (and b!1446775 res!978504) b!1446779))

(assert (= (and b!1446781 (not res!978498)) b!1446778))

(declare-fun m!1335625 () Bool)

(assert (=> b!1446782 m!1335625))

(declare-fun m!1335627 () Bool)

(assert (=> b!1446788 m!1335627))

(assert (=> b!1446788 m!1335627))

(declare-fun m!1335629 () Bool)

(assert (=> b!1446788 m!1335629))

(declare-fun m!1335631 () Bool)

(assert (=> b!1446781 m!1335631))

(declare-fun m!1335633 () Bool)

(assert (=> b!1446781 m!1335633))

(declare-fun m!1335635 () Bool)

(assert (=> b!1446781 m!1335635))

(declare-fun m!1335637 () Bool)

(assert (=> b!1446781 m!1335637))

(declare-fun m!1335639 () Bool)

(assert (=> b!1446781 m!1335639))

(declare-fun m!1335641 () Bool)

(assert (=> b!1446781 m!1335641))

(declare-fun m!1335643 () Bool)

(assert (=> b!1446781 m!1335643))

(declare-fun m!1335645 () Bool)

(assert (=> b!1446781 m!1335645))

(assert (=> b!1446781 m!1335641))

(declare-fun m!1335647 () Bool)

(assert (=> b!1446790 m!1335647))

(assert (=> b!1446778 m!1335641))

(assert (=> b!1446778 m!1335641))

(declare-fun m!1335649 () Bool)

(assert (=> b!1446778 m!1335649))

(assert (=> b!1446777 m!1335641))

(assert (=> b!1446777 m!1335641))

(declare-fun m!1335651 () Bool)

(assert (=> b!1446777 m!1335651))

(declare-fun m!1335653 () Bool)

(assert (=> b!1446786 m!1335653))

(declare-fun m!1335655 () Bool)

(assert (=> start!124756 m!1335655))

(declare-fun m!1335657 () Bool)

(assert (=> start!124756 m!1335657))

(declare-fun m!1335659 () Bool)

(assert (=> b!1446783 m!1335659))

(declare-fun m!1335661 () Bool)

(assert (=> b!1446783 m!1335661))

(declare-fun m!1335663 () Bool)

(assert (=> b!1446776 m!1335663))

(assert (=> b!1446776 m!1335663))

(declare-fun m!1335665 () Bool)

(assert (=> b!1446776 m!1335665))

(assert (=> b!1446776 m!1335633))

(declare-fun m!1335667 () Bool)

(assert (=> b!1446776 m!1335667))

(assert (=> b!1446775 m!1335641))

(assert (=> b!1446775 m!1335641))

(declare-fun m!1335669 () Bool)

(assert (=> b!1446775 m!1335669))

(assert (=> b!1446787 m!1335633))

(declare-fun m!1335671 () Bool)

(assert (=> b!1446787 m!1335671))

(assert (=> b!1446792 m!1335641))

(assert (=> b!1446792 m!1335641))

(declare-fun m!1335673 () Bool)

(assert (=> b!1446792 m!1335673))

(assert (=> b!1446792 m!1335673))

(assert (=> b!1446792 m!1335641))

(declare-fun m!1335675 () Bool)

(assert (=> b!1446792 m!1335675))

(assert (=> b!1446791 m!1335639))

(assert (=> b!1446791 m!1335633))

(assert (=> b!1446791 m!1335637))

(assert (=> b!1446791 m!1335641))

(assert (=> b!1446784 m!1335641))

(assert (=> b!1446784 m!1335641))

(declare-fun m!1335677 () Bool)

(assert (=> b!1446784 m!1335677))

(push 1)

