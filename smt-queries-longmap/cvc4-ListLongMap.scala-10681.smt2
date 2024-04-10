; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125228 () Bool)

(assert start!125228)

(declare-fun b!1460997 () Bool)

(declare-fun res!990706 () Bool)

(declare-fun e!821416 () Bool)

(assert (=> b!1460997 (=> (not res!990706) (not e!821416))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11878 0))(
  ( (MissingZero!11878 (index!49904 (_ BitVec 32))) (Found!11878 (index!49905 (_ BitVec 32))) (Intermediate!11878 (undefined!12690 Bool) (index!49906 (_ BitVec 32)) (x!131503 (_ BitVec 32))) (Undefined!11878) (MissingVacant!11878 (index!49907 (_ BitVec 32))) )
))
(declare-fun lt!639991 () SeekEntryResult!11878)

(declare-datatypes ((array!98676 0))(
  ( (array!98677 (arr!47626 (Array (_ BitVec 32) (_ BitVec 64))) (size!48176 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98676)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98676 (_ BitVec 32)) SeekEntryResult!11878)

(assert (=> b!1460997 (= res!990706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639991))))

(declare-fun b!1460998 () Bool)

(declare-fun e!821414 () Bool)

(declare-fun e!821415 () Bool)

(assert (=> b!1460998 (= e!821414 (not e!821415))))

(declare-fun res!990701 () Bool)

(assert (=> b!1460998 (=> res!990701 e!821415)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460998 (= res!990701 (or (and (= (select (arr!47626 a!2862) index!646) (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47626 a!2862) index!646) (select (arr!47626 a!2862) j!93))) (= (select (arr!47626 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821412 () Bool)

(assert (=> b!1460998 e!821412))

(declare-fun res!990700 () Bool)

(assert (=> b!1460998 (=> (not res!990700) (not e!821412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98676 (_ BitVec 32)) Bool)

(assert (=> b!1460998 (= res!990700 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49252 0))(
  ( (Unit!49253) )
))
(declare-fun lt!639995 () Unit!49252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49252)

(assert (=> b!1460998 (= lt!639995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1460999 () Bool)

(assert (=> b!1460999 (= e!821412 (or (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47626 a!2862) intermediateBeforeIndex!19) (select (arr!47626 a!2862) j!93))))))

(declare-fun lt!639994 () (_ BitVec 32))

(declare-fun b!1461000 () Bool)

(declare-fun lt!639990 () SeekEntryResult!11878)

(declare-fun e!821411 () Bool)

(declare-fun lt!639992 () (_ BitVec 64))

(declare-fun lt!639993 () array!98676)

(assert (=> b!1461000 (= e!821411 (not (= lt!639990 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639994 lt!639992 lt!639993 mask!2687))))))

(declare-fun b!1461001 () Bool)

(declare-fun res!990704 () Bool)

(declare-fun e!821420 () Bool)

(assert (=> b!1461001 (=> (not res!990704) (not e!821420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461001 (= res!990704 (validKeyInArray!0 (select (arr!47626 a!2862) j!93)))))

(declare-fun b!1461003 () Bool)

(declare-fun res!990694 () Bool)

(assert (=> b!1461003 (=> (not res!990694) (not e!821412))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98676 (_ BitVec 32)) SeekEntryResult!11878)

(assert (=> b!1461003 (= res!990694 (= (seekEntryOrOpen!0 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) (Found!11878 j!93)))))

(declare-fun b!1461004 () Bool)

(declare-fun e!821419 () Bool)

(assert (=> b!1461004 (= e!821420 e!821419)))

(declare-fun res!990697 () Bool)

(assert (=> b!1461004 (=> (not res!990697) (not e!821419))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461004 (= res!990697 (= (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461004 (= lt!639993 (array!98677 (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48176 a!2862)))))

(declare-fun b!1461005 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98676 (_ BitVec 32)) SeekEntryResult!11878)

(assert (=> b!1461005 (= e!821411 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639994 intermediateAfterIndex!19 lt!639992 lt!639993 mask!2687) (seekEntryOrOpen!0 lt!639992 lt!639993 mask!2687))))))

(declare-fun b!1461006 () Bool)

(declare-fun res!990699 () Bool)

(assert (=> b!1461006 (=> (not res!990699) (not e!821420))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461006 (= res!990699 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48176 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48176 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48176 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461007 () Bool)

(declare-fun res!990692 () Bool)

(assert (=> b!1461007 (=> (not res!990692) (not e!821414))))

(assert (=> b!1461007 (= res!990692 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461008 () Bool)

(declare-fun res!990698 () Bool)

(assert (=> b!1461008 (=> (not res!990698) (not e!821420))))

(declare-datatypes ((List!34127 0))(
  ( (Nil!34124) (Cons!34123 (h!35473 (_ BitVec 64)) (t!48821 List!34127)) )
))
(declare-fun arrayNoDuplicates!0 (array!98676 (_ BitVec 32) List!34127) Bool)

(assert (=> b!1461008 (= res!990698 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34124))))

(declare-fun b!1461009 () Bool)

(declare-fun res!990707 () Bool)

(declare-fun e!821413 () Bool)

(assert (=> b!1461009 (=> res!990707 e!821413)))

(assert (=> b!1461009 (= res!990707 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639994 (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639991)))))

(declare-fun b!1461010 () Bool)

(assert (=> b!1461010 (= e!821419 e!821416)))

(declare-fun res!990696 () Bool)

(assert (=> b!1461010 (=> (not res!990696) (not e!821416))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461010 (= res!990696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47626 a!2862) j!93) mask!2687) (select (arr!47626 a!2862) j!93) a!2862 mask!2687) lt!639991))))

(assert (=> b!1461010 (= lt!639991 (Intermediate!11878 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461011 () Bool)

(assert (=> b!1461011 (= e!821415 e!821413)))

(declare-fun res!990708 () Bool)

(assert (=> b!1461011 (=> res!990708 e!821413)))

(assert (=> b!1461011 (= res!990708 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639994 #b00000000000000000000000000000000) (bvsge lt!639994 (size!48176 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461011 (= lt!639994 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461012 () Bool)

(declare-fun res!990702 () Bool)

(assert (=> b!1461012 (=> (not res!990702) (not e!821420))))

(assert (=> b!1461012 (= res!990702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461013 () Bool)

(declare-fun res!990705 () Bool)

(assert (=> b!1461013 (=> (not res!990705) (not e!821420))))

(assert (=> b!1461013 (= res!990705 (and (= (size!48176 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48176 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48176 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!821418 () Bool)

(declare-fun b!1461014 () Bool)

(assert (=> b!1461014 (= e!821418 (= lt!639990 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639992 lt!639993 mask!2687)))))

(declare-fun b!1461015 () Bool)

(declare-fun res!990695 () Bool)

(assert (=> b!1461015 (=> (not res!990695) (not e!821414))))

(assert (=> b!1461015 (= res!990695 e!821418)))

(declare-fun c!134663 () Bool)

(assert (=> b!1461015 (= c!134663 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461016 () Bool)

(assert (=> b!1461016 (= e!821418 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639992 lt!639993 mask!2687) (seekEntryOrOpen!0 lt!639992 lt!639993 mask!2687)))))

(declare-fun b!1461002 () Bool)

(assert (=> b!1461002 (= e!821413 true)))

(declare-fun lt!639996 () Bool)

(assert (=> b!1461002 (= lt!639996 e!821411)))

(declare-fun c!134664 () Bool)

(assert (=> b!1461002 (= c!134664 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!990709 () Bool)

(assert (=> start!125228 (=> (not res!990709) (not e!821420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125228 (= res!990709 (validMask!0 mask!2687))))

(assert (=> start!125228 e!821420))

(assert (=> start!125228 true))

(declare-fun array_inv!36654 (array!98676) Bool)

(assert (=> start!125228 (array_inv!36654 a!2862)))

(declare-fun b!1461017 () Bool)

(assert (=> b!1461017 (= e!821416 e!821414)))

(declare-fun res!990703 () Bool)

(assert (=> b!1461017 (=> (not res!990703) (not e!821414))))

(assert (=> b!1461017 (= res!990703 (= lt!639990 (Intermediate!11878 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1461017 (= lt!639990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639992 mask!2687) lt!639992 lt!639993 mask!2687))))

(assert (=> b!1461017 (= lt!639992 (select (store (arr!47626 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461018 () Bool)

(declare-fun res!990693 () Bool)

(assert (=> b!1461018 (=> (not res!990693) (not e!821420))))

(assert (=> b!1461018 (= res!990693 (validKeyInArray!0 (select (arr!47626 a!2862) i!1006)))))

(assert (= (and start!125228 res!990709) b!1461013))

(assert (= (and b!1461013 res!990705) b!1461018))

(assert (= (and b!1461018 res!990693) b!1461001))

(assert (= (and b!1461001 res!990704) b!1461012))

(assert (= (and b!1461012 res!990702) b!1461008))

(assert (= (and b!1461008 res!990698) b!1461006))

(assert (= (and b!1461006 res!990699) b!1461004))

(assert (= (and b!1461004 res!990697) b!1461010))

(assert (= (and b!1461010 res!990696) b!1460997))

(assert (= (and b!1460997 res!990706) b!1461017))

(assert (= (and b!1461017 res!990703) b!1461015))

(assert (= (and b!1461015 c!134663) b!1461014))

(assert (= (and b!1461015 (not c!134663)) b!1461016))

(assert (= (and b!1461015 res!990695) b!1461007))

(assert (= (and b!1461007 res!990692) b!1460998))

(assert (= (and b!1460998 res!990700) b!1461003))

(assert (= (and b!1461003 res!990694) b!1460999))

(assert (= (and b!1460998 (not res!990701)) b!1461011))

(assert (= (and b!1461011 (not res!990708)) b!1461009))

(assert (= (and b!1461009 (not res!990707)) b!1461002))

(assert (= (and b!1461002 c!134664) b!1461000))

(assert (= (and b!1461002 (not c!134664)) b!1461005))

(declare-fun m!1348629 () Bool)

(assert (=> b!1461003 m!1348629))

(assert (=> b!1461003 m!1348629))

(declare-fun m!1348631 () Bool)

(assert (=> b!1461003 m!1348631))

(declare-fun m!1348633 () Bool)

(assert (=> b!1461011 m!1348633))

(declare-fun m!1348635 () Bool)

(assert (=> b!1461014 m!1348635))

(assert (=> b!1461010 m!1348629))

(assert (=> b!1461010 m!1348629))

(declare-fun m!1348637 () Bool)

(assert (=> b!1461010 m!1348637))

(assert (=> b!1461010 m!1348637))

(assert (=> b!1461010 m!1348629))

(declare-fun m!1348639 () Bool)

(assert (=> b!1461010 m!1348639))

(assert (=> b!1461001 m!1348629))

(assert (=> b!1461001 m!1348629))

(declare-fun m!1348641 () Bool)

(assert (=> b!1461001 m!1348641))

(declare-fun m!1348643 () Bool)

(assert (=> b!1461008 m!1348643))

(declare-fun m!1348645 () Bool)

(assert (=> b!1461018 m!1348645))

(assert (=> b!1461018 m!1348645))

(declare-fun m!1348647 () Bool)

(assert (=> b!1461018 m!1348647))

(declare-fun m!1348649 () Bool)

(assert (=> b!1461017 m!1348649))

(assert (=> b!1461017 m!1348649))

(declare-fun m!1348651 () Bool)

(assert (=> b!1461017 m!1348651))

(declare-fun m!1348653 () Bool)

(assert (=> b!1461017 m!1348653))

(declare-fun m!1348655 () Bool)

(assert (=> b!1461017 m!1348655))

(declare-fun m!1348657 () Bool)

(assert (=> b!1460999 m!1348657))

(assert (=> b!1460999 m!1348629))

(assert (=> b!1461004 m!1348653))

(declare-fun m!1348659 () Bool)

(assert (=> b!1461004 m!1348659))

(declare-fun m!1348661 () Bool)

(assert (=> b!1461012 m!1348661))

(declare-fun m!1348663 () Bool)

(assert (=> b!1461016 m!1348663))

(declare-fun m!1348665 () Bool)

(assert (=> b!1461016 m!1348665))

(assert (=> b!1461009 m!1348629))

(assert (=> b!1461009 m!1348629))

(declare-fun m!1348667 () Bool)

(assert (=> b!1461009 m!1348667))

(declare-fun m!1348669 () Bool)

(assert (=> b!1461005 m!1348669))

(assert (=> b!1461005 m!1348665))

(assert (=> b!1460997 m!1348629))

(assert (=> b!1460997 m!1348629))

(declare-fun m!1348671 () Bool)

(assert (=> b!1460997 m!1348671))

(declare-fun m!1348673 () Bool)

(assert (=> start!125228 m!1348673))

(declare-fun m!1348675 () Bool)

(assert (=> start!125228 m!1348675))

(declare-fun m!1348677 () Bool)

(assert (=> b!1461000 m!1348677))

(declare-fun m!1348679 () Bool)

(assert (=> b!1460998 m!1348679))

(assert (=> b!1460998 m!1348653))

(declare-fun m!1348681 () Bool)

(assert (=> b!1460998 m!1348681))

(declare-fun m!1348683 () Bool)

(assert (=> b!1460998 m!1348683))

(declare-fun m!1348685 () Bool)

(assert (=> b!1460998 m!1348685))

(assert (=> b!1460998 m!1348629))

(push 1)

