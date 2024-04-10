; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125402 () Bool)

(assert start!125402)

(declare-fun b!1466739 () Bool)

(declare-fun e!823983 () Bool)

(declare-fun e!823981 () Bool)

(assert (=> b!1466739 (= e!823983 (not e!823981))))

(declare-fun res!995394 () Bool)

(assert (=> b!1466739 (=> res!995394 e!823981)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98850 0))(
  ( (array!98851 (arr!47713 (Array (_ BitVec 32) (_ BitVec 64))) (size!48263 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98850)

(assert (=> b!1466739 (= res!995394 (or (and (= (select (arr!47713 a!2862) index!646) (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47713 a!2862) index!646) (select (arr!47713 a!2862) j!93))) (= (select (arr!47713 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-datatypes ((SeekEntryResult!11965 0))(
  ( (MissingZero!11965 (index!50252 (_ BitVec 32))) (Found!11965 (index!50253 (_ BitVec 32))) (Intermediate!11965 (undefined!12777 Bool) (index!50254 (_ BitVec 32)) (x!131822 (_ BitVec 32))) (Undefined!11965) (MissingVacant!11965 (index!50255 (_ BitVec 32))) )
))
(declare-fun lt!641865 () SeekEntryResult!11965)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1466739 (and (= lt!641865 (Found!11965 j!93)) (or (= (select (arr!47713 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47713 a!2862) intermediateBeforeIndex!19) (select (arr!47713 a!2862) j!93))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98850 (_ BitVec 32)) SeekEntryResult!11965)

(assert (=> b!1466739 (= lt!641865 (seekEntryOrOpen!0 (select (arr!47713 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98850 (_ BitVec 32)) Bool)

(assert (=> b!1466739 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49426 0))(
  ( (Unit!49427) )
))
(declare-fun lt!641861 () Unit!49426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49426)

(assert (=> b!1466739 (= lt!641861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466740 () Bool)

(declare-fun e!823982 () Bool)

(assert (=> b!1466740 (= e!823981 e!823982)))

(declare-fun res!995402 () Bool)

(assert (=> b!1466740 (=> res!995402 e!823982)))

(declare-fun lt!641867 () (_ BitVec 32))

(assert (=> b!1466740 (= res!995402 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641867 #b00000000000000000000000000000000) (bvsge lt!641867 (size!48263 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466740 (= lt!641867 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466741 () Bool)

(assert (=> b!1466741 (= e!823982 true)))

(declare-fun lt!641868 () array!98850)

(declare-fun lt!641866 () (_ BitVec 64))

(assert (=> b!1466741 (= lt!641865 (seekEntryOrOpen!0 lt!641866 lt!641868 mask!2687))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lt!641864 () Unit!49426)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49426)

(assert (=> b!1466741 (= lt!641864 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641867 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466742 () Bool)

(declare-fun res!995390 () Bool)

(assert (=> b!1466742 (=> res!995390 e!823982)))

(declare-fun e!823978 () Bool)

(assert (=> b!1466742 (= res!995390 e!823978)))

(declare-fun c!135185 () Bool)

(assert (=> b!1466742 (= c!135185 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466743 () Bool)

(declare-fun res!995396 () Bool)

(declare-fun e!823980 () Bool)

(assert (=> b!1466743 (=> (not res!995396) (not e!823980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466743 (= res!995396 (validKeyInArray!0 (select (arr!47713 a!2862) j!93)))))

(declare-fun b!1466744 () Bool)

(declare-fun res!995395 () Bool)

(assert (=> b!1466744 (=> (not res!995395) (not e!823983))))

(declare-fun e!823977 () Bool)

(assert (=> b!1466744 (= res!995395 e!823977)))

(declare-fun c!135186 () Bool)

(assert (=> b!1466744 (= c!135186 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466745 () Bool)

(declare-fun res!995393 () Bool)

(assert (=> b!1466745 (=> (not res!995393) (not e!823980))))

(assert (=> b!1466745 (= res!995393 (and (= (size!48263 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48263 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48263 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466746 () Bool)

(declare-fun lt!641863 () SeekEntryResult!11965)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98850 (_ BitVec 32)) SeekEntryResult!11965)

(assert (=> b!1466746 (= e!823977 (= lt!641863 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641866 lt!641868 mask!2687)))))

(declare-fun res!995406 () Bool)

(assert (=> start!125402 (=> (not res!995406) (not e!823980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125402 (= res!995406 (validMask!0 mask!2687))))

(assert (=> start!125402 e!823980))

(assert (=> start!125402 true))

(declare-fun array_inv!36741 (array!98850) Bool)

(assert (=> start!125402 (array_inv!36741 a!2862)))

(declare-fun b!1466747 () Bool)

(declare-fun res!995401 () Bool)

(declare-fun e!823979 () Bool)

(assert (=> b!1466747 (=> (not res!995401) (not e!823979))))

(declare-fun lt!641862 () SeekEntryResult!11965)

(assert (=> b!1466747 (= res!995401 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641862))))

(declare-fun b!1466748 () Bool)

(declare-fun res!995405 () Bool)

(assert (=> b!1466748 (=> res!995405 e!823982)))

(assert (=> b!1466748 (= res!995405 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641867 (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641862)))))

(declare-fun b!1466749 () Bool)

(assert (=> b!1466749 (= e!823978 (not (= lt!641863 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641867 lt!641866 lt!641868 mask!2687))))))

(declare-fun b!1466750 () Bool)

(declare-fun res!995400 () Bool)

(assert (=> b!1466750 (=> (not res!995400) (not e!823980))))

(assert (=> b!1466750 (= res!995400 (validKeyInArray!0 (select (arr!47713 a!2862) i!1006)))))

(declare-fun b!1466751 () Bool)

(declare-fun res!995397 () Bool)

(assert (=> b!1466751 (=> (not res!995397) (not e!823980))))

(assert (=> b!1466751 (= res!995397 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48263 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48263 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48263 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466752 () Bool)

(declare-fun res!995398 () Bool)

(assert (=> b!1466752 (=> res!995398 e!823982)))

(assert (=> b!1466752 (= res!995398 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466753 () Bool)

(declare-fun res!995403 () Bool)

(assert (=> b!1466753 (=> (not res!995403) (not e!823980))))

(assert (=> b!1466753 (= res!995403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98850 (_ BitVec 32)) SeekEntryResult!11965)

(assert (=> b!1466754 (= e!823977 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641866 lt!641868 mask!2687) (seekEntryOrOpen!0 lt!641866 lt!641868 mask!2687)))))

(declare-fun b!1466755 () Bool)

(assert (=> b!1466755 (= e!823979 e!823983)))

(declare-fun res!995391 () Bool)

(assert (=> b!1466755 (=> (not res!995391) (not e!823983))))

(assert (=> b!1466755 (= res!995391 (= lt!641863 (Intermediate!11965 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466755 (= lt!641863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641866 mask!2687) lt!641866 lt!641868 mask!2687))))

(assert (=> b!1466755 (= lt!641866 (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466756 () Bool)

(declare-fun e!823985 () Bool)

(assert (=> b!1466756 (= e!823985 e!823979)))

(declare-fun res!995404 () Bool)

(assert (=> b!1466756 (=> (not res!995404) (not e!823979))))

(assert (=> b!1466756 (= res!995404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47713 a!2862) j!93) mask!2687) (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641862))))

(assert (=> b!1466756 (= lt!641862 (Intermediate!11965 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466757 () Bool)

(declare-fun res!995399 () Bool)

(assert (=> b!1466757 (=> (not res!995399) (not e!823983))))

(assert (=> b!1466757 (= res!995399 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466758 () Bool)

(assert (=> b!1466758 (= e!823980 e!823985)))

(declare-fun res!995392 () Bool)

(assert (=> b!1466758 (=> (not res!995392) (not e!823985))))

(assert (=> b!1466758 (= res!995392 (= (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466758 (= lt!641868 (array!98851 (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48263 a!2862)))))

(declare-fun b!1466759 () Bool)

(assert (=> b!1466759 (= e!823978 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641867 intermediateAfterIndex!19 lt!641866 lt!641868 mask!2687) (seekEntryOrOpen!0 lt!641866 lt!641868 mask!2687))))))

(declare-fun b!1466760 () Bool)

(declare-fun res!995407 () Bool)

(assert (=> b!1466760 (=> (not res!995407) (not e!823980))))

(declare-datatypes ((List!34214 0))(
  ( (Nil!34211) (Cons!34210 (h!35560 (_ BitVec 64)) (t!48908 List!34214)) )
))
(declare-fun arrayNoDuplicates!0 (array!98850 (_ BitVec 32) List!34214) Bool)

(assert (=> b!1466760 (= res!995407 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34211))))

(assert (= (and start!125402 res!995406) b!1466745))

(assert (= (and b!1466745 res!995393) b!1466750))

(assert (= (and b!1466750 res!995400) b!1466743))

(assert (= (and b!1466743 res!995396) b!1466753))

(assert (= (and b!1466753 res!995403) b!1466760))

(assert (= (and b!1466760 res!995407) b!1466751))

(assert (= (and b!1466751 res!995397) b!1466758))

(assert (= (and b!1466758 res!995392) b!1466756))

(assert (= (and b!1466756 res!995404) b!1466747))

(assert (= (and b!1466747 res!995401) b!1466755))

(assert (= (and b!1466755 res!995391) b!1466744))

(assert (= (and b!1466744 c!135186) b!1466746))

(assert (= (and b!1466744 (not c!135186)) b!1466754))

(assert (= (and b!1466744 res!995395) b!1466757))

(assert (= (and b!1466757 res!995399) b!1466739))

(assert (= (and b!1466739 (not res!995394)) b!1466740))

(assert (= (and b!1466740 (not res!995402)) b!1466748))

(assert (= (and b!1466748 (not res!995405)) b!1466742))

(assert (= (and b!1466742 c!135185) b!1466749))

(assert (= (and b!1466742 (not c!135185)) b!1466759))

(assert (= (and b!1466742 (not res!995390)) b!1466752))

(assert (= (and b!1466752 (not res!995398)) b!1466741))

(declare-fun m!1353703 () Bool)

(assert (=> b!1466747 m!1353703))

(assert (=> b!1466747 m!1353703))

(declare-fun m!1353705 () Bool)

(assert (=> b!1466747 m!1353705))

(declare-fun m!1353707 () Bool)

(assert (=> b!1466755 m!1353707))

(assert (=> b!1466755 m!1353707))

(declare-fun m!1353709 () Bool)

(assert (=> b!1466755 m!1353709))

(declare-fun m!1353711 () Bool)

(assert (=> b!1466755 m!1353711))

(declare-fun m!1353713 () Bool)

(assert (=> b!1466755 m!1353713))

(assert (=> b!1466758 m!1353711))

(declare-fun m!1353715 () Bool)

(assert (=> b!1466758 m!1353715))

(assert (=> b!1466743 m!1353703))

(assert (=> b!1466743 m!1353703))

(declare-fun m!1353717 () Bool)

(assert (=> b!1466743 m!1353717))

(declare-fun m!1353719 () Bool)

(assert (=> b!1466750 m!1353719))

(assert (=> b!1466750 m!1353719))

(declare-fun m!1353721 () Bool)

(assert (=> b!1466750 m!1353721))

(declare-fun m!1353723 () Bool)

(assert (=> b!1466739 m!1353723))

(assert (=> b!1466739 m!1353711))

(declare-fun m!1353725 () Bool)

(assert (=> b!1466739 m!1353725))

(declare-fun m!1353727 () Bool)

(assert (=> b!1466739 m!1353727))

(declare-fun m!1353729 () Bool)

(assert (=> b!1466739 m!1353729))

(assert (=> b!1466739 m!1353703))

(declare-fun m!1353731 () Bool)

(assert (=> b!1466739 m!1353731))

(declare-fun m!1353733 () Bool)

(assert (=> b!1466739 m!1353733))

(assert (=> b!1466739 m!1353703))

(declare-fun m!1353735 () Bool)

(assert (=> b!1466746 m!1353735))

(declare-fun m!1353737 () Bool)

(assert (=> b!1466754 m!1353737))

(declare-fun m!1353739 () Bool)

(assert (=> b!1466754 m!1353739))

(assert (=> b!1466748 m!1353703))

(assert (=> b!1466748 m!1353703))

(declare-fun m!1353741 () Bool)

(assert (=> b!1466748 m!1353741))

(declare-fun m!1353743 () Bool)

(assert (=> b!1466753 m!1353743))

(assert (=> b!1466741 m!1353739))

(declare-fun m!1353745 () Bool)

(assert (=> b!1466741 m!1353745))

(declare-fun m!1353747 () Bool)

(assert (=> b!1466759 m!1353747))

(assert (=> b!1466759 m!1353739))

(declare-fun m!1353749 () Bool)

(assert (=> start!125402 m!1353749))

(declare-fun m!1353751 () Bool)

(assert (=> start!125402 m!1353751))

(declare-fun m!1353753 () Bool)

(assert (=> b!1466740 m!1353753))

(declare-fun m!1353755 () Bool)

(assert (=> b!1466760 m!1353755))

(declare-fun m!1353757 () Bool)

(assert (=> b!1466749 m!1353757))

(assert (=> b!1466756 m!1353703))

(assert (=> b!1466756 m!1353703))

(declare-fun m!1353759 () Bool)

(assert (=> b!1466756 m!1353759))

(assert (=> b!1466756 m!1353759))

(assert (=> b!1466756 m!1353703))

(declare-fun m!1353761 () Bool)

(assert (=> b!1466756 m!1353761))

(push 1)

(assert (not b!1466754))

