; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125812 () Bool)

(assert start!125812)

(declare-fun b!1472874 () Bool)

(declare-fun res!1000489 () Bool)

(declare-fun e!826531 () Bool)

(assert (=> b!1472874 (=> (not res!1000489) (not e!826531))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472874 (= res!1000489 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472875 () Bool)

(declare-fun res!1000493 () Bool)

(declare-fun e!826533 () Bool)

(assert (=> b!1472875 (=> (not res!1000493) (not e!826533))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((array!99146 0))(
  ( (array!99147 (arr!47858 (Array (_ BitVec 32) (_ BitVec 64))) (size!48408 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99146)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472875 (= res!1000493 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48408 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48408 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48408 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472876 () Bool)

(declare-fun e!826532 () Bool)

(declare-fun e!826535 () Bool)

(assert (=> b!1472876 (= e!826532 e!826535)))

(declare-fun res!1000487 () Bool)

(assert (=> b!1472876 (=> (not res!1000487) (not e!826535))))

(declare-datatypes ((SeekEntryResult!12098 0))(
  ( (MissingZero!12098 (index!50784 (_ BitVec 32))) (Found!12098 (index!50785 (_ BitVec 32))) (Intermediate!12098 (undefined!12910 Bool) (index!50786 (_ BitVec 32)) (x!132365 (_ BitVec 32))) (Undefined!12098) (MissingVacant!12098 (index!50787 (_ BitVec 32))) )
))
(declare-fun lt!643703 () SeekEntryResult!12098)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99146 (_ BitVec 32)) SeekEntryResult!12098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472876 (= res!1000487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) (select (arr!47858 a!2862) j!93) a!2862 mask!2687) lt!643703))))

(assert (=> b!1472876 (= lt!643703 (Intermediate!12098 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472877 () Bool)

(assert (=> b!1472877 (= e!826535 e!826531)))

(declare-fun res!1000492 () Bool)

(assert (=> b!1472877 (=> (not res!1000492) (not e!826531))))

(declare-fun lt!643705 () SeekEntryResult!12098)

(assert (=> b!1472877 (= res!1000492 (= lt!643705 (Intermediate!12098 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643702 () array!99146)

(declare-fun lt!643707 () (_ BitVec 64))

(assert (=> b!1472877 (= lt!643705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643707 mask!2687) lt!643707 lt!643702 mask!2687))))

(assert (=> b!1472877 (= lt!643707 (select (store (arr!47858 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472878 () Bool)

(declare-fun res!1000490 () Bool)

(assert (=> b!1472878 (=> (not res!1000490) (not e!826531))))

(declare-fun e!826534 () Bool)

(assert (=> b!1472878 (= res!1000490 e!826534)))

(declare-fun c!135708 () Bool)

(assert (=> b!1472878 (= c!135708 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!643704 () SeekEntryResult!12098)

(declare-fun e!826530 () Bool)

(declare-fun b!1472879 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99146 (_ BitVec 32)) SeekEntryResult!12098)

(assert (=> b!1472879 (= e!826530 (= lt!643704 (seekEntryOrOpen!0 lt!643707 lt!643702 mask!2687)))))

(declare-fun b!1472880 () Bool)

(declare-fun res!1000485 () Bool)

(assert (=> b!1472880 (=> (not res!1000485) (not e!826533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472880 (= res!1000485 (validKeyInArray!0 (select (arr!47858 a!2862) i!1006)))))

(declare-fun b!1472881 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99146 (_ BitVec 32)) SeekEntryResult!12098)

(assert (=> b!1472881 (= e!826534 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643707 lt!643702 mask!2687) (seekEntryOrOpen!0 lt!643707 lt!643702 mask!2687)))))

(declare-fun res!1000496 () Bool)

(assert (=> start!125812 (=> (not res!1000496) (not e!826533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125812 (= res!1000496 (validMask!0 mask!2687))))

(assert (=> start!125812 e!826533))

(assert (=> start!125812 true))

(declare-fun array_inv!36886 (array!99146) Bool)

(assert (=> start!125812 (array_inv!36886 a!2862)))

(declare-fun b!1472882 () Bool)

(declare-fun res!1000495 () Bool)

(assert (=> b!1472882 (=> (not res!1000495) (not e!826535))))

(assert (=> b!1472882 (= res!1000495 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47858 a!2862) j!93) a!2862 mask!2687) lt!643703))))

(declare-fun b!1472883 () Bool)

(declare-fun res!1000498 () Bool)

(assert (=> b!1472883 (=> (not res!1000498) (not e!826533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99146 (_ BitVec 32)) Bool)

(assert (=> b!1472883 (= res!1000498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472884 () Bool)

(declare-fun res!1000491 () Bool)

(assert (=> b!1472884 (=> (not res!1000491) (not e!826533))))

(assert (=> b!1472884 (= res!1000491 (validKeyInArray!0 (select (arr!47858 a!2862) j!93)))))

(declare-fun b!1472885 () Bool)

(declare-fun res!1000488 () Bool)

(assert (=> b!1472885 (=> (not res!1000488) (not e!826533))))

(assert (=> b!1472885 (= res!1000488 (and (= (size!48408 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48408 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48408 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472886 () Bool)

(assert (=> b!1472886 (= e!826534 (= lt!643705 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643707 lt!643702 mask!2687)))))

(declare-fun b!1472887 () Bool)

(assert (=> b!1472887 (= e!826533 e!826532)))

(declare-fun res!1000494 () Bool)

(assert (=> b!1472887 (=> (not res!1000494) (not e!826532))))

(assert (=> b!1472887 (= res!1000494 (= (select (store (arr!47858 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472887 (= lt!643702 (array!99147 (store (arr!47858 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48408 a!2862)))))

(declare-fun b!1472888 () Bool)

(declare-fun res!1000486 () Bool)

(assert (=> b!1472888 (=> (not res!1000486) (not e!826533))))

(declare-datatypes ((List!34359 0))(
  ( (Nil!34356) (Cons!34355 (h!35711 (_ BitVec 64)) (t!49053 List!34359)) )
))
(declare-fun arrayNoDuplicates!0 (array!99146 (_ BitVec 32) List!34359) Bool)

(assert (=> b!1472888 (= res!1000486 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34356))))

(declare-fun b!1472889 () Bool)

(assert (=> b!1472889 (= e!826531 (not e!826530))))

(declare-fun res!1000497 () Bool)

(assert (=> b!1472889 (=> res!1000497 e!826530)))

(assert (=> b!1472889 (= res!1000497 (or (not (= (select (arr!47858 a!2862) index!646) (select (store (arr!47858 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47858 a!2862) index!646) (select (arr!47858 a!2862) j!93)))))))

(assert (=> b!1472889 (and (= lt!643704 (Found!12098 j!93)) (or (= (select (arr!47858 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47858 a!2862) intermediateBeforeIndex!19) (select (arr!47858 a!2862) j!93))))))

(assert (=> b!1472889 (= lt!643704 (seekEntryOrOpen!0 (select (arr!47858 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1472889 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49536 0))(
  ( (Unit!49537) )
))
(declare-fun lt!643706 () Unit!49536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49536)

(assert (=> b!1472889 (= lt!643706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125812 res!1000496) b!1472885))

(assert (= (and b!1472885 res!1000488) b!1472880))

(assert (= (and b!1472880 res!1000485) b!1472884))

(assert (= (and b!1472884 res!1000491) b!1472883))

(assert (= (and b!1472883 res!1000498) b!1472888))

(assert (= (and b!1472888 res!1000486) b!1472875))

(assert (= (and b!1472875 res!1000493) b!1472887))

(assert (= (and b!1472887 res!1000494) b!1472876))

(assert (= (and b!1472876 res!1000487) b!1472882))

(assert (= (and b!1472882 res!1000495) b!1472877))

(assert (= (and b!1472877 res!1000492) b!1472878))

(assert (= (and b!1472878 c!135708) b!1472886))

(assert (= (and b!1472878 (not c!135708)) b!1472881))

(assert (= (and b!1472878 res!1000490) b!1472874))

(assert (= (and b!1472874 res!1000489) b!1472889))

(assert (= (and b!1472889 (not res!1000497)) b!1472879))

(declare-fun m!1359547 () Bool)

(assert (=> b!1472879 m!1359547))

(declare-fun m!1359549 () Bool)

(assert (=> b!1472881 m!1359549))

(assert (=> b!1472881 m!1359547))

(declare-fun m!1359551 () Bool)

(assert (=> b!1472889 m!1359551))

(declare-fun m!1359553 () Bool)

(assert (=> b!1472889 m!1359553))

(declare-fun m!1359555 () Bool)

(assert (=> b!1472889 m!1359555))

(declare-fun m!1359557 () Bool)

(assert (=> b!1472889 m!1359557))

(declare-fun m!1359559 () Bool)

(assert (=> b!1472889 m!1359559))

(declare-fun m!1359561 () Bool)

(assert (=> b!1472889 m!1359561))

(declare-fun m!1359563 () Bool)

(assert (=> b!1472889 m!1359563))

(declare-fun m!1359565 () Bool)

(assert (=> b!1472889 m!1359565))

(assert (=> b!1472889 m!1359561))

(declare-fun m!1359567 () Bool)

(assert (=> b!1472888 m!1359567))

(assert (=> b!1472887 m!1359553))

(declare-fun m!1359569 () Bool)

(assert (=> b!1472887 m!1359569))

(declare-fun m!1359571 () Bool)

(assert (=> b!1472880 m!1359571))

(assert (=> b!1472880 m!1359571))

(declare-fun m!1359573 () Bool)

(assert (=> b!1472880 m!1359573))

(assert (=> b!1472882 m!1359561))

(assert (=> b!1472882 m!1359561))

(declare-fun m!1359575 () Bool)

(assert (=> b!1472882 m!1359575))

(assert (=> b!1472876 m!1359561))

(assert (=> b!1472876 m!1359561))

(declare-fun m!1359577 () Bool)

(assert (=> b!1472876 m!1359577))

(assert (=> b!1472876 m!1359577))

(assert (=> b!1472876 m!1359561))

(declare-fun m!1359579 () Bool)

(assert (=> b!1472876 m!1359579))

(declare-fun m!1359581 () Bool)

(assert (=> b!1472877 m!1359581))

(assert (=> b!1472877 m!1359581))

(declare-fun m!1359583 () Bool)

(assert (=> b!1472877 m!1359583))

(assert (=> b!1472877 m!1359553))

(declare-fun m!1359585 () Bool)

(assert (=> b!1472877 m!1359585))

(assert (=> b!1472884 m!1359561))

(assert (=> b!1472884 m!1359561))

(declare-fun m!1359587 () Bool)

(assert (=> b!1472884 m!1359587))

(declare-fun m!1359589 () Bool)

(assert (=> b!1472883 m!1359589))

(declare-fun m!1359591 () Bool)

(assert (=> start!125812 m!1359591))

(declare-fun m!1359593 () Bool)

(assert (=> start!125812 m!1359593))

(declare-fun m!1359595 () Bool)

(assert (=> b!1472886 m!1359595))

(push 1)

(assert (not b!1472876))

(assert (not b!1472877))

(assert (not start!125812))

(assert (not b!1472882))

(assert (not b!1472889))

(assert (not b!1472879))

(assert (not b!1472884))

(assert (not b!1472880))

(assert (not b!1472883))

(assert (not b!1472888))

(assert (not b!1472881))

(assert (not b!1472886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1473099 () Bool)

(declare-fun e!826652 () Bool)

(declare-fun lt!643786 () SeekEntryResult!12098)

(assert (=> b!1473099 (= e!826652 (bvsge (x!132365 lt!643786) #b01111111111111111111111111111110))))

(declare-fun d!155555 () Bool)

(assert (=> d!155555 e!826652))

(declare-fun c!135752 () Bool)

(assert (=> d!155555 (= c!135752 (and (is-Intermediate!12098 lt!643786) (undefined!12910 lt!643786)))))

(declare-fun e!826651 () SeekEntryResult!12098)

(assert (=> d!155555 (= lt!643786 e!826651)))

(declare-fun c!135753 () Bool)

(assert (=> d!155555 (= c!135753 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643785 () (_ BitVec 64))

(assert (=> d!155555 (= lt!643785 (select (arr!47858 lt!643702) index!646))))

(assert (=> d!155555 (validMask!0 mask!2687)))

(assert (=> d!155555 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643707 lt!643702 mask!2687) lt!643786)))

(declare-fun b!1473100 () Bool)

(assert (=> b!1473100 (and (bvsge (index!50786 lt!643786) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643786) (size!48408 lt!643702)))))

(declare-fun res!1000625 () Bool)

(assert (=> b!1473100 (= res!1000625 (= (select (arr!47858 lt!643702) (index!50786 lt!643786)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826650 () Bool)

(assert (=> b!1473100 (=> res!1000625 e!826650)))

(declare-fun b!1473101 () Bool)

(declare-fun e!826653 () SeekEntryResult!12098)

(assert (=> b!1473101 (= e!826653 (Intermediate!12098 false index!646 x!665))))

(declare-fun b!1473102 () Bool)

(assert (=> b!1473102 (and (bvsge (index!50786 lt!643786) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643786) (size!48408 lt!643702)))))

(declare-fun res!1000624 () Bool)

(assert (=> b!1473102 (= res!1000624 (= (select (arr!47858 lt!643702) (index!50786 lt!643786)) lt!643707))))

(assert (=> b!1473102 (=> res!1000624 e!826650)))

(declare-fun e!826649 () Bool)

(assert (=> b!1473102 (= e!826649 e!826650)))

(declare-fun b!1473103 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473103 (= e!826653 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643707 lt!643702 mask!2687))))

(declare-fun b!1473104 () Bool)

(assert (=> b!1473104 (= e!826652 e!826649)))

(declare-fun res!1000623 () Bool)

(assert (=> b!1473104 (= res!1000623 (and (is-Intermediate!12098 lt!643786) (not (undefined!12910 lt!643786)) (bvslt (x!132365 lt!643786) #b01111111111111111111111111111110) (bvsge (x!132365 lt!643786) #b00000000000000000000000000000000) (bvsge (x!132365 lt!643786) x!665)))))

(assert (=> b!1473104 (=> (not res!1000623) (not e!826649))))

(declare-fun b!1473105 () Bool)

(assert (=> b!1473105 (and (bvsge (index!50786 lt!643786) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643786) (size!48408 lt!643702)))))

(assert (=> b!1473105 (= e!826650 (= (select (arr!47858 lt!643702) (index!50786 lt!643786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473106 () Bool)

(assert (=> b!1473106 (= e!826651 e!826653)))

(declare-fun c!135754 () Bool)

(assert (=> b!1473106 (= c!135754 (or (= lt!643785 lt!643707) (= (bvadd lt!643785 lt!643785) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473107 () Bool)

(assert (=> b!1473107 (= e!826651 (Intermediate!12098 true index!646 x!665))))

(assert (= (and d!155555 c!135753) b!1473107))

(assert (= (and d!155555 (not c!135753)) b!1473106))

(assert (= (and b!1473106 c!135754) b!1473101))

(assert (= (and b!1473106 (not c!135754)) b!1473103))

(assert (= (and d!155555 c!135752) b!1473099))

(assert (= (and d!155555 (not c!135752)) b!1473104))

(assert (= (and b!1473104 res!1000623) b!1473102))

(assert (= (and b!1473102 (not res!1000624)) b!1473100))

(assert (= (and b!1473100 (not res!1000625)) b!1473105))

(declare-fun m!1359739 () Bool)

(assert (=> b!1473105 m!1359739))

(assert (=> b!1473102 m!1359739))

(declare-fun m!1359741 () Bool)

(assert (=> b!1473103 m!1359741))

(assert (=> b!1473103 m!1359741))

(declare-fun m!1359743 () Bool)

(assert (=> b!1473103 m!1359743))

(assert (=> b!1473100 m!1359739))

(declare-fun m!1359745 () Bool)

(assert (=> d!155555 m!1359745))

(assert (=> d!155555 m!1359591))

(assert (=> b!1472886 d!155555))

(declare-fun b!1473118 () Bool)

(declare-fun e!826663 () Bool)

(declare-fun lt!643788 () SeekEntryResult!12098)

(assert (=> b!1473118 (= e!826663 (bvsge (x!132365 lt!643788) #b01111111111111111111111111111110))))

(declare-fun d!155567 () Bool)

(assert (=> d!155567 e!826663))

(declare-fun c!135757 () Bool)

(assert (=> d!155567 (= c!135757 (and (is-Intermediate!12098 lt!643788) (undefined!12910 lt!643788)))))

(declare-fun e!826662 () SeekEntryResult!12098)

(assert (=> d!155567 (= lt!643788 e!826662)))

(declare-fun c!135758 () Bool)

(assert (=> d!155567 (= c!135758 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643787 () (_ BitVec 64))

(assert (=> d!155567 (= lt!643787 (select (arr!47858 a!2862) (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687)))))

(assert (=> d!155567 (validMask!0 mask!2687)))

(assert (=> d!155567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) (select (arr!47858 a!2862) j!93) a!2862 mask!2687) lt!643788)))

(declare-fun b!1473119 () Bool)

(assert (=> b!1473119 (and (bvsge (index!50786 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643788) (size!48408 a!2862)))))

(declare-fun res!1000634 () Bool)

(assert (=> b!1473119 (= res!1000634 (= (select (arr!47858 a!2862) (index!50786 lt!643788)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826661 () Bool)

(assert (=> b!1473119 (=> res!1000634 e!826661)))

(declare-fun e!826664 () SeekEntryResult!12098)

(declare-fun b!1473120 () Bool)

(assert (=> b!1473120 (= e!826664 (Intermediate!12098 false (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473121 () Bool)

(assert (=> b!1473121 (and (bvsge (index!50786 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643788) (size!48408 a!2862)))))

(declare-fun res!1000633 () Bool)

(assert (=> b!1473121 (= res!1000633 (= (select (arr!47858 a!2862) (index!50786 lt!643788)) (select (arr!47858 a!2862) j!93)))))

(assert (=> b!1473121 (=> res!1000633 e!826661)))

(declare-fun e!826660 () Bool)

(assert (=> b!1473121 (= e!826660 e!826661)))

(declare-fun b!1473122 () Bool)

(assert (=> b!1473122 (= e!826664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47858 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473123 () Bool)

(assert (=> b!1473123 (= e!826663 e!826660)))

(declare-fun res!1000632 () Bool)

(assert (=> b!1473123 (= res!1000632 (and (is-Intermediate!12098 lt!643788) (not (undefined!12910 lt!643788)) (bvslt (x!132365 lt!643788) #b01111111111111111111111111111110) (bvsge (x!132365 lt!643788) #b00000000000000000000000000000000) (bvsge (x!132365 lt!643788) #b00000000000000000000000000000000)))))

(assert (=> b!1473123 (=> (not res!1000632) (not e!826660))))

(declare-fun b!1473124 () Bool)

(assert (=> b!1473124 (and (bvsge (index!50786 lt!643788) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643788) (size!48408 a!2862)))))

(assert (=> b!1473124 (= e!826661 (= (select (arr!47858 a!2862) (index!50786 lt!643788)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473125 () Bool)

(assert (=> b!1473125 (= e!826662 e!826664)))

(declare-fun c!135759 () Bool)

(assert (=> b!1473125 (= c!135759 (or (= lt!643787 (select (arr!47858 a!2862) j!93)) (= (bvadd lt!643787 lt!643787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473126 () Bool)

(assert (=> b!1473126 (= e!826662 (Intermediate!12098 true (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155567 c!135758) b!1473126))

(assert (= (and d!155567 (not c!135758)) b!1473125))

(assert (= (and b!1473125 c!135759) b!1473120))

(assert (= (and b!1473125 (not c!135759)) b!1473122))

(assert (= (and d!155567 c!135757) b!1473118))

(assert (= (and d!155567 (not c!135757)) b!1473123))

(assert (= (and b!1473123 res!1000632) b!1473121))

(assert (= (and b!1473121 (not res!1000633)) b!1473119))

(assert (= (and b!1473119 (not res!1000634)) b!1473124))

(declare-fun m!1359747 () Bool)

(assert (=> b!1473124 m!1359747))

(assert (=> b!1473121 m!1359747))

(assert (=> b!1473122 m!1359577))

(declare-fun m!1359749 () Bool)

(assert (=> b!1473122 m!1359749))

(assert (=> b!1473122 m!1359749))

(assert (=> b!1473122 m!1359561))

(declare-fun m!1359751 () Bool)

(assert (=> b!1473122 m!1359751))

(assert (=> b!1473119 m!1359747))

(assert (=> d!155567 m!1359577))

(declare-fun m!1359753 () Bool)

(assert (=> d!155567 m!1359753))

(assert (=> d!155567 m!1359591))

(assert (=> b!1472876 d!155567))

(declare-fun d!155569 () Bool)

(declare-fun lt!643804 () (_ BitVec 32))

(declare-fun lt!643803 () (_ BitVec 32))

(assert (=> d!155569 (= lt!643804 (bvmul (bvxor lt!643803 (bvlshr lt!643803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155569 (= lt!643803 ((_ extract 31 0) (bvand (bvxor (select (arr!47858 a!2862) j!93) (bvlshr (select (arr!47858 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155569 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000635 (let ((h!35715 ((_ extract 31 0) (bvand (bvxor (select (arr!47858 a!2862) j!93) (bvlshr (select (arr!47858 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132372 (bvmul (bvxor h!35715 (bvlshr h!35715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132372 (bvlshr x!132372 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000635 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000635 #b00000000000000000000000000000000))))))

(assert (=> d!155569 (= (toIndex!0 (select (arr!47858 a!2862) j!93) mask!2687) (bvand (bvxor lt!643804 (bvlshr lt!643804 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472876 d!155569))

(declare-fun b!1473163 () Bool)

(declare-fun e!826687 () Bool)

(declare-fun lt!643806 () SeekEntryResult!12098)

(assert (=> b!1473163 (= e!826687 (bvsge (x!132365 lt!643806) #b01111111111111111111111111111110))))

(declare-fun d!155575 () Bool)

(assert (=> d!155575 e!826687))

(declare-fun c!135775 () Bool)

(assert (=> d!155575 (= c!135775 (and (is-Intermediate!12098 lt!643806) (undefined!12910 lt!643806)))))

(declare-fun e!826686 () SeekEntryResult!12098)

(assert (=> d!155575 (= lt!643806 e!826686)))

(declare-fun c!135776 () Bool)

(assert (=> d!155575 (= c!135776 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643805 () (_ BitVec 64))

(assert (=> d!155575 (= lt!643805 (select (arr!47858 lt!643702) (toIndex!0 lt!643707 mask!2687)))))

(assert (=> d!155575 (validMask!0 mask!2687)))

(assert (=> d!155575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643707 mask!2687) lt!643707 lt!643702 mask!2687) lt!643806)))

(declare-fun b!1473164 () Bool)

(assert (=> b!1473164 (and (bvsge (index!50786 lt!643806) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643806) (size!48408 lt!643702)))))

(declare-fun res!1000645 () Bool)

(assert (=> b!1473164 (= res!1000645 (= (select (arr!47858 lt!643702) (index!50786 lt!643806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826685 () Bool)

(assert (=> b!1473164 (=> res!1000645 e!826685)))

(declare-fun b!1473165 () Bool)

(declare-fun e!826688 () SeekEntryResult!12098)

(assert (=> b!1473165 (= e!826688 (Intermediate!12098 false (toIndex!0 lt!643707 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1473166 () Bool)

(assert (=> b!1473166 (and (bvsge (index!50786 lt!643806) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643806) (size!48408 lt!643702)))))

(declare-fun res!1000644 () Bool)

(assert (=> b!1473166 (= res!1000644 (= (select (arr!47858 lt!643702) (index!50786 lt!643806)) lt!643707))))

(assert (=> b!1473166 (=> res!1000644 e!826685)))

(declare-fun e!826684 () Bool)

(assert (=> b!1473166 (= e!826684 e!826685)))

(declare-fun b!1473167 () Bool)

(assert (=> b!1473167 (= e!826688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643707 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643707 lt!643702 mask!2687))))

(declare-fun b!1473168 () Bool)

(assert (=> b!1473168 (= e!826687 e!826684)))

(declare-fun res!1000643 () Bool)

(assert (=> b!1473168 (= res!1000643 (and (is-Intermediate!12098 lt!643806) (not (undefined!12910 lt!643806)) (bvslt (x!132365 lt!643806) #b01111111111111111111111111111110) (bvsge (x!132365 lt!643806) #b00000000000000000000000000000000) (bvsge (x!132365 lt!643806) #b00000000000000000000000000000000)))))

(assert (=> b!1473168 (=> (not res!1000643) (not e!826684))))

(declare-fun b!1473169 () Bool)

(assert (=> b!1473169 (and (bvsge (index!50786 lt!643806) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643806) (size!48408 lt!643702)))))

(assert (=> b!1473169 (= e!826685 (= (select (arr!47858 lt!643702) (index!50786 lt!643806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473170 () Bool)

(assert (=> b!1473170 (= e!826686 e!826688)))

(declare-fun c!135777 () Bool)

(assert (=> b!1473170 (= c!135777 (or (= lt!643805 lt!643707) (= (bvadd lt!643805 lt!643805) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473171 () Bool)

(assert (=> b!1473171 (= e!826686 (Intermediate!12098 true (toIndex!0 lt!643707 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155575 c!135776) b!1473171))

(assert (= (and d!155575 (not c!135776)) b!1473170))

(assert (= (and b!1473170 c!135777) b!1473165))

(assert (= (and b!1473170 (not c!135777)) b!1473167))

(assert (= (and d!155575 c!135775) b!1473163))

(assert (= (and d!155575 (not c!135775)) b!1473168))

(assert (= (and b!1473168 res!1000643) b!1473166))

(assert (= (and b!1473166 (not res!1000644)) b!1473164))

(assert (= (and b!1473164 (not res!1000645)) b!1473169))

(declare-fun m!1359779 () Bool)

(assert (=> b!1473169 m!1359779))

(assert (=> b!1473166 m!1359779))

(assert (=> b!1473167 m!1359581))

(declare-fun m!1359781 () Bool)

(assert (=> b!1473167 m!1359781))

(assert (=> b!1473167 m!1359781))

(declare-fun m!1359783 () Bool)

(assert (=> b!1473167 m!1359783))

(assert (=> b!1473164 m!1359779))

(assert (=> d!155575 m!1359581))

(declare-fun m!1359785 () Bool)

(assert (=> d!155575 m!1359785))

(assert (=> d!155575 m!1359591))

(assert (=> b!1472877 d!155575))

(declare-fun d!155579 () Bool)

(declare-fun lt!643811 () (_ BitVec 32))

(declare-fun lt!643810 () (_ BitVec 32))

(assert (=> d!155579 (= lt!643811 (bvmul (bvxor lt!643810 (bvlshr lt!643810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155579 (= lt!643810 ((_ extract 31 0) (bvand (bvxor lt!643707 (bvlshr lt!643707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155579 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1000635 (let ((h!35715 ((_ extract 31 0) (bvand (bvxor lt!643707 (bvlshr lt!643707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132372 (bvmul (bvxor h!35715 (bvlshr h!35715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132372 (bvlshr x!132372 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1000635 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1000635 #b00000000000000000000000000000000))))))

(assert (=> d!155579 (= (toIndex!0 lt!643707 mask!2687) (bvand (bvxor lt!643811 (bvlshr lt!643811 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1472877 d!155579))

(declare-fun b!1473219 () Bool)

(declare-fun e!826721 () Bool)

(declare-fun e!826719 () Bool)

(assert (=> b!1473219 (= e!826721 e!826719)))

(declare-fun c!135793 () Bool)

(assert (=> b!1473219 (= c!135793 (validKeyInArray!0 (select (arr!47858 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67748 () Bool)

(declare-fun call!67751 () Bool)

(assert (=> bm!67748 (= call!67751 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135793 (Cons!34355 (select (arr!47858 a!2862) #b00000000000000000000000000000000) Nil!34356) Nil!34356)))))

(declare-fun b!1473221 () Bool)

(declare-fun e!826720 () Bool)

(declare-fun contains!9904 (List!34359 (_ BitVec 64)) Bool)

(assert (=> b!1473221 (= e!826720 (contains!9904 Nil!34356 (select (arr!47858 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1473222 () Bool)

(assert (=> b!1473222 (= e!826719 call!67751)))

(declare-fun b!1473223 () Bool)

(declare-fun e!826718 () Bool)

(assert (=> b!1473223 (= e!826718 e!826721)))

(declare-fun res!1000664 () Bool)

(assert (=> b!1473223 (=> (not res!1000664) (not e!826721))))

(assert (=> b!1473223 (= res!1000664 (not e!826720))))

(declare-fun res!1000665 () Bool)

(assert (=> b!1473223 (=> (not res!1000665) (not e!826720))))

(assert (=> b!1473223 (= res!1000665 (validKeyInArray!0 (select (arr!47858 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155581 () Bool)

(declare-fun res!1000663 () Bool)

(assert (=> d!155581 (=> res!1000663 e!826718)))

(assert (=> d!155581 (= res!1000663 (bvsge #b00000000000000000000000000000000 (size!48408 a!2862)))))

(assert (=> d!155581 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34356) e!826718)))

(declare-fun b!1473220 () Bool)

(assert (=> b!1473220 (= e!826719 call!67751)))

(assert (= (and d!155581 (not res!1000663)) b!1473223))

(assert (= (and b!1473223 res!1000665) b!1473221))

(assert (= (and b!1473223 res!1000664) b!1473219))

(assert (= (and b!1473219 c!135793) b!1473222))

(assert (= (and b!1473219 (not c!135793)) b!1473220))

(assert (= (or b!1473222 b!1473220) bm!67748))

(declare-fun m!1359825 () Bool)

(assert (=> b!1473219 m!1359825))

(assert (=> b!1473219 m!1359825))

(declare-fun m!1359827 () Bool)

(assert (=> b!1473219 m!1359827))

(assert (=> bm!67748 m!1359825))

(declare-fun m!1359829 () Bool)

(assert (=> bm!67748 m!1359829))

(assert (=> b!1473221 m!1359825))

(assert (=> b!1473221 m!1359825))

(declare-fun m!1359831 () Bool)

(assert (=> b!1473221 m!1359831))

(assert (=> b!1473223 m!1359825))

(assert (=> b!1473223 m!1359825))

(assert (=> b!1473223 m!1359827))

(assert (=> b!1472888 d!155581))

(declare-fun b!1473241 () Bool)

(declare-fun e!826735 () Bool)

(declare-fun call!67754 () Bool)

(assert (=> b!1473241 (= e!826735 call!67754)))

(declare-fun b!1473242 () Bool)

(declare-fun e!826734 () Bool)

(declare-fun e!826733 () Bool)

(assert (=> b!1473242 (= e!826734 e!826733)))

(declare-fun c!135799 () Bool)

(assert (=> b!1473242 (= c!135799 (validKeyInArray!0 (select (arr!47858 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1473243 () Bool)

(assert (=> b!1473243 (= e!826733 e!826735)))

(declare-fun lt!643840 () (_ BitVec 64))

(assert (=> b!1473243 (= lt!643840 (select (arr!47858 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643839 () Unit!49536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99146 (_ BitVec 64) (_ BitVec 32)) Unit!49536)

(assert (=> b!1473243 (= lt!643839 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643840 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1473243 (arrayContainsKey!0 a!2862 lt!643840 #b00000000000000000000000000000000)))

(declare-fun lt!643841 () Unit!49536)

(assert (=> b!1473243 (= lt!643841 lt!643839)))

(declare-fun res!1000673 () Bool)

(assert (=> b!1473243 (= res!1000673 (= (seekEntryOrOpen!0 (select (arr!47858 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12098 #b00000000000000000000000000000000)))))

(assert (=> b!1473243 (=> (not res!1000673) (not e!826735))))

(declare-fun bm!67751 () Bool)

(assert (=> bm!67751 (= call!67754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1473244 () Bool)

(assert (=> b!1473244 (= e!826733 call!67754)))

(declare-fun d!155603 () Bool)

(declare-fun res!1000674 () Bool)

(assert (=> d!155603 (=> res!1000674 e!826734)))

(assert (=> d!155603 (= res!1000674 (bvsge #b00000000000000000000000000000000 (size!48408 a!2862)))))

(assert (=> d!155603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!826734)))

(assert (= (and d!155603 (not res!1000674)) b!1473242))

(assert (= (and b!1473242 c!135799) b!1473243))

(assert (= (and b!1473242 (not c!135799)) b!1473244))

(assert (= (and b!1473243 res!1000673) b!1473241))

(assert (= (or b!1473241 b!1473244) bm!67751))

(assert (=> b!1473242 m!1359825))

(assert (=> b!1473242 m!1359825))

(assert (=> b!1473242 m!1359827))

(assert (=> b!1473243 m!1359825))

(declare-fun m!1359837 () Bool)

(assert (=> b!1473243 m!1359837))

(declare-fun m!1359839 () Bool)

(assert (=> b!1473243 m!1359839))

(assert (=> b!1473243 m!1359825))

(declare-fun m!1359841 () Bool)

(assert (=> b!1473243 m!1359841))

(declare-fun m!1359843 () Bool)

(assert (=> bm!67751 m!1359843))

(assert (=> b!1472883 d!155603))

(declare-fun d!155613 () Bool)

(assert (=> d!155613 (= (validKeyInArray!0 (select (arr!47858 a!2862) j!93)) (and (not (= (select (arr!47858 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47858 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1472884 d!155613))

(declare-fun d!155615 () Bool)

(assert (=> d!155615 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125812 d!155615))

(declare-fun d!155617 () Bool)

(assert (=> d!155617 (= (array_inv!36886 a!2862) (bvsge (size!48408 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125812 d!155617))

(declare-fun b!1473283 () Bool)

(declare-fun c!135819 () Bool)

(declare-fun lt!643862 () (_ BitVec 64))

(assert (=> b!1473283 (= c!135819 (= lt!643862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826759 () SeekEntryResult!12098)

(declare-fun e!826757 () SeekEntryResult!12098)

(assert (=> b!1473283 (= e!826759 e!826757)))

(declare-fun b!1473284 () Bool)

(declare-fun e!826758 () SeekEntryResult!12098)

(assert (=> b!1473284 (= e!826758 e!826759)))

(declare-fun c!135817 () Bool)

(assert (=> b!1473284 (= c!135817 (= lt!643862 lt!643707))))

(declare-fun b!1473285 () Bool)

(assert (=> b!1473285 (= e!826757 (MissingVacant!12098 intermediateAfterIndex!19))))

(declare-fun d!155619 () Bool)

(declare-fun lt!643861 () SeekEntryResult!12098)

(assert (=> d!155619 (and (or (is-Undefined!12098 lt!643861) (not (is-Found!12098 lt!643861)) (and (bvsge (index!50785 lt!643861) #b00000000000000000000000000000000) (bvslt (index!50785 lt!643861) (size!48408 lt!643702)))) (or (is-Undefined!12098 lt!643861) (is-Found!12098 lt!643861) (not (is-MissingVacant!12098 lt!643861)) (not (= (index!50787 lt!643861) intermediateAfterIndex!19)) (and (bvsge (index!50787 lt!643861) #b00000000000000000000000000000000) (bvslt (index!50787 lt!643861) (size!48408 lt!643702)))) (or (is-Undefined!12098 lt!643861) (ite (is-Found!12098 lt!643861) (= (select (arr!47858 lt!643702) (index!50785 lt!643861)) lt!643707) (and (is-MissingVacant!12098 lt!643861) (= (index!50787 lt!643861) intermediateAfterIndex!19) (= (select (arr!47858 lt!643702) (index!50787 lt!643861)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155619 (= lt!643861 e!826758)))

(declare-fun c!135818 () Bool)

(assert (=> d!155619 (= c!135818 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155619 (= lt!643862 (select (arr!47858 lt!643702) index!646))))

(assert (=> d!155619 (validMask!0 mask!2687)))

(assert (=> d!155619 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643707 lt!643702 mask!2687) lt!643861)))

(declare-fun b!1473286 () Bool)

(assert (=> b!1473286 (= e!826759 (Found!12098 index!646))))

(declare-fun b!1473287 () Bool)

(assert (=> b!1473287 (= e!826757 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643707 lt!643702 mask!2687))))

(declare-fun b!1473288 () Bool)

(assert (=> b!1473288 (= e!826758 Undefined!12098)))

(assert (= (and d!155619 c!135818) b!1473288))

(assert (= (and d!155619 (not c!135818)) b!1473284))

(assert (= (and b!1473284 c!135817) b!1473286))

(assert (= (and b!1473284 (not c!135817)) b!1473283))

(assert (= (and b!1473283 c!135819) b!1473285))

(assert (= (and b!1473283 (not c!135819)) b!1473287))

(declare-fun m!1359855 () Bool)

(assert (=> d!155619 m!1359855))

(declare-fun m!1359857 () Bool)

(assert (=> d!155619 m!1359857))

(assert (=> d!155619 m!1359745))

(assert (=> d!155619 m!1359591))

(assert (=> b!1473287 m!1359741))

(assert (=> b!1473287 m!1359741))

(declare-fun m!1359859 () Bool)

(assert (=> b!1473287 m!1359859))

(assert (=> b!1472881 d!155619))

(declare-fun b!1473317 () Bool)

(declare-fun e!826777 () SeekEntryResult!12098)

(declare-fun e!826775 () SeekEntryResult!12098)

(assert (=> b!1473317 (= e!826777 e!826775)))

(declare-fun lt!643881 () (_ BitVec 64))

(declare-fun lt!643880 () SeekEntryResult!12098)

(assert (=> b!1473317 (= lt!643881 (select (arr!47858 lt!643702) (index!50786 lt!643880)))))

(declare-fun c!135834 () Bool)

(assert (=> b!1473317 (= c!135834 (= lt!643881 lt!643707))))

(declare-fun b!1473318 () Bool)

(assert (=> b!1473318 (= e!826777 Undefined!12098)))

(declare-fun b!1473319 () Bool)

(declare-fun e!826776 () SeekEntryResult!12098)

(assert (=> b!1473319 (= e!826776 (MissingZero!12098 (index!50786 lt!643880)))))

(declare-fun b!1473321 () Bool)

(declare-fun c!135833 () Bool)

(assert (=> b!1473321 (= c!135833 (= lt!643881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473321 (= e!826775 e!826776)))

(declare-fun b!1473322 () Bool)

(assert (=> b!1473322 (= e!826775 (Found!12098 (index!50786 lt!643880)))))

(declare-fun b!1473320 () Bool)

(assert (=> b!1473320 (= e!826776 (seekKeyOrZeroReturnVacant!0 (x!132365 lt!643880) (index!50786 lt!643880) (index!50786 lt!643880) lt!643707 lt!643702 mask!2687))))

(declare-fun d!155623 () Bool)

(declare-fun lt!643879 () SeekEntryResult!12098)

(assert (=> d!155623 (and (or (is-Undefined!12098 lt!643879) (not (is-Found!12098 lt!643879)) (and (bvsge (index!50785 lt!643879) #b00000000000000000000000000000000) (bvslt (index!50785 lt!643879) (size!48408 lt!643702)))) (or (is-Undefined!12098 lt!643879) (is-Found!12098 lt!643879) (not (is-MissingZero!12098 lt!643879)) (and (bvsge (index!50784 lt!643879) #b00000000000000000000000000000000) (bvslt (index!50784 lt!643879) (size!48408 lt!643702)))) (or (is-Undefined!12098 lt!643879) (is-Found!12098 lt!643879) (is-MissingZero!12098 lt!643879) (not (is-MissingVacant!12098 lt!643879)) (and (bvsge (index!50787 lt!643879) #b00000000000000000000000000000000) (bvslt (index!50787 lt!643879) (size!48408 lt!643702)))) (or (is-Undefined!12098 lt!643879) (ite (is-Found!12098 lt!643879) (= (select (arr!47858 lt!643702) (index!50785 lt!643879)) lt!643707) (ite (is-MissingZero!12098 lt!643879) (= (select (arr!47858 lt!643702) (index!50784 lt!643879)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12098 lt!643879) (= (select (arr!47858 lt!643702) (index!50787 lt!643879)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155623 (= lt!643879 e!826777)))

(declare-fun c!135835 () Bool)

(assert (=> d!155623 (= c!135835 (and (is-Intermediate!12098 lt!643880) (undefined!12910 lt!643880)))))

(assert (=> d!155623 (= lt!643880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643707 mask!2687) lt!643707 lt!643702 mask!2687))))

(assert (=> d!155623 (validMask!0 mask!2687)))

(assert (=> d!155623 (= (seekEntryOrOpen!0 lt!643707 lt!643702 mask!2687) lt!643879)))

(assert (= (and d!155623 c!135835) b!1473318))

(assert (= (and d!155623 (not c!135835)) b!1473317))

(assert (= (and b!1473317 c!135834) b!1473322))

(assert (= (and b!1473317 (not c!135834)) b!1473321))

(assert (= (and b!1473321 c!135833) b!1473319))

(assert (= (and b!1473321 (not c!135833)) b!1473320))

(declare-fun m!1359869 () Bool)

(assert (=> b!1473317 m!1359869))

(declare-fun m!1359871 () Bool)

(assert (=> b!1473320 m!1359871))

(declare-fun m!1359873 () Bool)

(assert (=> d!155623 m!1359873))

(assert (=> d!155623 m!1359581))

(assert (=> d!155623 m!1359591))

(declare-fun m!1359875 () Bool)

(assert (=> d!155623 m!1359875))

(assert (=> d!155623 m!1359581))

(assert (=> d!155623 m!1359583))

(declare-fun m!1359877 () Bool)

(assert (=> d!155623 m!1359877))

(assert (=> b!1472881 d!155623))

(declare-fun b!1473329 () Bool)

(declare-fun e!826784 () Bool)

(declare-fun lt!643885 () SeekEntryResult!12098)

(assert (=> b!1473329 (= e!826784 (bvsge (x!132365 lt!643885) #b01111111111111111111111111111110))))

(declare-fun d!155629 () Bool)

(assert (=> d!155629 e!826784))

(declare-fun c!135839 () Bool)

(assert (=> d!155629 (= c!135839 (and (is-Intermediate!12098 lt!643885) (undefined!12910 lt!643885)))))

(declare-fun e!826783 () SeekEntryResult!12098)

(assert (=> d!155629 (= lt!643885 e!826783)))

(declare-fun c!135840 () Bool)

(assert (=> d!155629 (= c!135840 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643884 () (_ BitVec 64))

(assert (=> d!155629 (= lt!643884 (select (arr!47858 a!2862) index!646))))

(assert (=> d!155629 (validMask!0 mask!2687)))

(assert (=> d!155629 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47858 a!2862) j!93) a!2862 mask!2687) lt!643885)))

(declare-fun b!1473330 () Bool)

(assert (=> b!1473330 (and (bvsge (index!50786 lt!643885) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643885) (size!48408 a!2862)))))

(declare-fun res!1000683 () Bool)

(assert (=> b!1473330 (= res!1000683 (= (select (arr!47858 a!2862) (index!50786 lt!643885)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!826782 () Bool)

(assert (=> b!1473330 (=> res!1000683 e!826782)))

(declare-fun b!1473331 () Bool)

(declare-fun e!826785 () SeekEntryResult!12098)

(assert (=> b!1473331 (= e!826785 (Intermediate!12098 false index!646 x!665))))

(declare-fun b!1473332 () Bool)

(assert (=> b!1473332 (and (bvsge (index!50786 lt!643885) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643885) (size!48408 a!2862)))))

(declare-fun res!1000682 () Bool)

(assert (=> b!1473332 (= res!1000682 (= (select (arr!47858 a!2862) (index!50786 lt!643885)) (select (arr!47858 a!2862) j!93)))))

(assert (=> b!1473332 (=> res!1000682 e!826782)))

(declare-fun e!826781 () Bool)

(assert (=> b!1473332 (= e!826781 e!826782)))

(declare-fun b!1473333 () Bool)

(assert (=> b!1473333 (= e!826785 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47858 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1473334 () Bool)

(assert (=> b!1473334 (= e!826784 e!826781)))

(declare-fun res!1000681 () Bool)

(assert (=> b!1473334 (= res!1000681 (and (is-Intermediate!12098 lt!643885) (not (undefined!12910 lt!643885)) (bvslt (x!132365 lt!643885) #b01111111111111111111111111111110) (bvsge (x!132365 lt!643885) #b00000000000000000000000000000000) (bvsge (x!132365 lt!643885) x!665)))))

(assert (=> b!1473334 (=> (not res!1000681) (not e!826781))))

(declare-fun b!1473335 () Bool)

(assert (=> b!1473335 (and (bvsge (index!50786 lt!643885) #b00000000000000000000000000000000) (bvslt (index!50786 lt!643885) (size!48408 a!2862)))))

(assert (=> b!1473335 (= e!826782 (= (select (arr!47858 a!2862) (index!50786 lt!643885)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1473336 () Bool)

(assert (=> b!1473336 (= e!826783 e!826785)))

(declare-fun c!135841 () Bool)

(assert (=> b!1473336 (= c!135841 (or (= lt!643884 (select (arr!47858 a!2862) j!93)) (= (bvadd lt!643884 lt!643884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1473337 () Bool)

(assert (=> b!1473337 (= e!826783 (Intermediate!12098 true index!646 x!665))))

(assert (= (and d!155629 c!135840) b!1473337))

(assert (= (and d!155629 (not c!135840)) b!1473336))

(assert (= (and b!1473336 c!135841) b!1473331))

(assert (= (and b!1473336 (not c!135841)) b!1473333))

(assert (= (and d!155629 c!135839) b!1473329))

(assert (= (and d!155629 (not c!135839)) b!1473334))

(assert (= (and b!1473334 res!1000681) b!1473332))

(assert (= (and b!1473332 (not res!1000682)) b!1473330))

(assert (= (and b!1473330 (not res!1000683)) b!1473335))

(declare-fun m!1359887 () Bool)

(assert (=> b!1473335 m!1359887))

(assert (=> b!1473332 m!1359887))

(assert (=> b!1473333 m!1359741))

(assert (=> b!1473333 m!1359741))

(assert (=> b!1473333 m!1359561))

(declare-fun m!1359889 () Bool)

(assert (=> b!1473333 m!1359889))

(assert (=> b!1473330 m!1359887))

