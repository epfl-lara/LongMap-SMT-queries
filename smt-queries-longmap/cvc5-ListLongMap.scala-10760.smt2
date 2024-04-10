; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125878 () Bool)

(assert start!125878)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!826822 () Bool)

(declare-fun b!1473403 () Bool)

(declare-fun lt!643920 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99155 0))(
  ( (array!99156 (arr!47861 (Array (_ BitVec 32) (_ BitVec 64))) (size!48411 (_ BitVec 32))) )
))
(declare-fun lt!643918 () array!99155)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12101 0))(
  ( (MissingZero!12101 (index!50796 (_ BitVec 32))) (Found!12101 (index!50797 (_ BitVec 32))) (Intermediate!12101 (undefined!12913 Bool) (index!50798 (_ BitVec 32)) (x!132385 (_ BitVec 32))) (Undefined!12101) (MissingVacant!12101 (index!50799 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99155 (_ BitVec 32)) SeekEntryResult!12101)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99155 (_ BitVec 32)) SeekEntryResult!12101)

(assert (=> b!1473403 (= e!826822 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643920 lt!643918 mask!2687) (seekEntryOrOpen!0 lt!643920 lt!643918 mask!2687)))))

(declare-fun b!1473404 () Bool)

(declare-fun res!1000737 () Bool)

(declare-fun e!826824 () Bool)

(assert (=> b!1473404 (=> (not res!1000737) (not e!826824))))

(declare-fun a!2862 () array!99155)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473404 (= res!1000737 (validKeyInArray!0 (select (arr!47861 a!2862) j!93)))))

(declare-fun b!1473405 () Bool)

(declare-fun e!826826 () Bool)

(declare-fun e!826819 () Bool)

(assert (=> b!1473405 (= e!826826 e!826819)))

(declare-fun res!1000732 () Bool)

(assert (=> b!1473405 (=> (not res!1000732) (not e!826819))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643917 () SeekEntryResult!12101)

(assert (=> b!1473405 (= res!1000732 (= lt!643917 (Intermediate!12101 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99155 (_ BitVec 32)) SeekEntryResult!12101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473405 (= lt!643917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643920 mask!2687) lt!643920 lt!643918 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473405 (= lt!643920 (select (store (arr!47861 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473406 () Bool)

(declare-fun e!826820 () Bool)

(assert (=> b!1473406 (= e!826819 (not e!826820))))

(declare-fun res!1000736 () Bool)

(assert (=> b!1473406 (=> res!1000736 e!826820)))

(assert (=> b!1473406 (= res!1000736 (or (not (= (select (arr!47861 a!2862) index!646) (select (store (arr!47861 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47861 a!2862) index!646) (select (arr!47861 a!2862) j!93)))))))

(declare-fun e!826821 () Bool)

(assert (=> b!1473406 e!826821))

(declare-fun res!1000734 () Bool)

(assert (=> b!1473406 (=> (not res!1000734) (not e!826821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99155 (_ BitVec 32)) Bool)

(assert (=> b!1473406 (= res!1000734 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49542 0))(
  ( (Unit!49543) )
))
(declare-fun lt!643915 () Unit!49542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49542)

(assert (=> b!1473406 (= lt!643915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473407 () Bool)

(declare-fun e!826823 () Bool)

(assert (=> b!1473407 (= e!826823 e!826826)))

(declare-fun res!1000725 () Bool)

(assert (=> b!1473407 (=> (not res!1000725) (not e!826826))))

(declare-fun lt!643919 () SeekEntryResult!12101)

(assert (=> b!1473407 (= res!1000725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47861 a!2862) j!93) mask!2687) (select (arr!47861 a!2862) j!93) a!2862 mask!2687) lt!643919))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473407 (= lt!643919 (Intermediate!12101 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473408 () Bool)

(declare-fun res!1000735 () Bool)

(assert (=> b!1473408 (=> (not res!1000735) (not e!826824))))

(assert (=> b!1473408 (= res!1000735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473409 () Bool)

(declare-fun res!1000727 () Bool)

(assert (=> b!1473409 (=> (not res!1000727) (not e!826821))))

(assert (=> b!1473409 (= res!1000727 (= (seekEntryOrOpen!0 (select (arr!47861 a!2862) j!93) a!2862 mask!2687) (Found!12101 j!93)))))

(declare-fun b!1473410 () Bool)

(assert (=> b!1473410 (= e!826820 true)))

(declare-fun lt!643916 () SeekEntryResult!12101)

(assert (=> b!1473410 (= lt!643916 (seekEntryOrOpen!0 lt!643920 lt!643918 mask!2687))))

(declare-fun b!1473411 () Bool)

(assert (=> b!1473411 (= e!826822 (= lt!643917 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643920 lt!643918 mask!2687)))))

(declare-fun b!1473412 () Bool)

(assert (=> b!1473412 (= e!826821 (or (= (select (arr!47861 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47861 a!2862) intermediateBeforeIndex!19) (select (arr!47861 a!2862) j!93))))))

(declare-fun b!1473413 () Bool)

(declare-fun res!1000728 () Bool)

(assert (=> b!1473413 (=> (not res!1000728) (not e!826826))))

(assert (=> b!1473413 (= res!1000728 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47861 a!2862) j!93) a!2862 mask!2687) lt!643919))))

(declare-fun b!1473414 () Bool)

(declare-fun res!1000723 () Bool)

(assert (=> b!1473414 (=> (not res!1000723) (not e!826824))))

(assert (=> b!1473414 (= res!1000723 (validKeyInArray!0 (select (arr!47861 a!2862) i!1006)))))

(declare-fun res!1000731 () Bool)

(assert (=> start!125878 (=> (not res!1000731) (not e!826824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125878 (= res!1000731 (validMask!0 mask!2687))))

(assert (=> start!125878 e!826824))

(assert (=> start!125878 true))

(declare-fun array_inv!36889 (array!99155) Bool)

(assert (=> start!125878 (array_inv!36889 a!2862)))

(declare-fun b!1473415 () Bool)

(assert (=> b!1473415 (= e!826824 e!826823)))

(declare-fun res!1000730 () Bool)

(assert (=> b!1473415 (=> (not res!1000730) (not e!826823))))

(assert (=> b!1473415 (= res!1000730 (= (select (store (arr!47861 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473415 (= lt!643918 (array!99156 (store (arr!47861 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48411 a!2862)))))

(declare-fun b!1473416 () Bool)

(declare-fun res!1000724 () Bool)

(assert (=> b!1473416 (=> (not res!1000724) (not e!826819))))

(assert (=> b!1473416 (= res!1000724 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473417 () Bool)

(declare-fun res!1000729 () Bool)

(assert (=> b!1473417 (=> (not res!1000729) (not e!826824))))

(declare-datatypes ((List!34362 0))(
  ( (Nil!34359) (Cons!34358 (h!35717 (_ BitVec 64)) (t!49056 List!34362)) )
))
(declare-fun arrayNoDuplicates!0 (array!99155 (_ BitVec 32) List!34362) Bool)

(assert (=> b!1473417 (= res!1000729 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34359))))

(declare-fun b!1473418 () Bool)

(declare-fun res!1000726 () Bool)

(assert (=> b!1473418 (=> (not res!1000726) (not e!826824))))

(assert (=> b!1473418 (= res!1000726 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48411 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48411 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48411 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473419 () Bool)

(declare-fun res!1000738 () Bool)

(assert (=> b!1473419 (=> (not res!1000738) (not e!826819))))

(assert (=> b!1473419 (= res!1000738 e!826822)))

(declare-fun c!135855 () Bool)

(assert (=> b!1473419 (= c!135855 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473420 () Bool)

(declare-fun res!1000733 () Bool)

(assert (=> b!1473420 (=> (not res!1000733) (not e!826824))))

(assert (=> b!1473420 (= res!1000733 (and (= (size!48411 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48411 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48411 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125878 res!1000731) b!1473420))

(assert (= (and b!1473420 res!1000733) b!1473414))

(assert (= (and b!1473414 res!1000723) b!1473404))

(assert (= (and b!1473404 res!1000737) b!1473408))

(assert (= (and b!1473408 res!1000735) b!1473417))

(assert (= (and b!1473417 res!1000729) b!1473418))

(assert (= (and b!1473418 res!1000726) b!1473415))

(assert (= (and b!1473415 res!1000730) b!1473407))

(assert (= (and b!1473407 res!1000725) b!1473413))

(assert (= (and b!1473413 res!1000728) b!1473405))

(assert (= (and b!1473405 res!1000732) b!1473419))

(assert (= (and b!1473419 c!135855) b!1473411))

(assert (= (and b!1473419 (not c!135855)) b!1473403))

(assert (= (and b!1473419 res!1000738) b!1473416))

(assert (= (and b!1473416 res!1000724) b!1473406))

(assert (= (and b!1473406 res!1000734) b!1473409))

(assert (= (and b!1473409 res!1000727) b!1473412))

(assert (= (and b!1473406 (not res!1000736)) b!1473410))

(declare-fun m!1359931 () Bool)

(assert (=> b!1473405 m!1359931))

(assert (=> b!1473405 m!1359931))

(declare-fun m!1359933 () Bool)

(assert (=> b!1473405 m!1359933))

(declare-fun m!1359935 () Bool)

(assert (=> b!1473405 m!1359935))

(declare-fun m!1359937 () Bool)

(assert (=> b!1473405 m!1359937))

(declare-fun m!1359939 () Bool)

(assert (=> b!1473411 m!1359939))

(declare-fun m!1359941 () Bool)

(assert (=> b!1473403 m!1359941))

(declare-fun m!1359943 () Bool)

(assert (=> b!1473403 m!1359943))

(declare-fun m!1359945 () Bool)

(assert (=> b!1473409 m!1359945))

(assert (=> b!1473409 m!1359945))

(declare-fun m!1359947 () Bool)

(assert (=> b!1473409 m!1359947))

(declare-fun m!1359949 () Bool)

(assert (=> b!1473412 m!1359949))

(assert (=> b!1473412 m!1359945))

(declare-fun m!1359951 () Bool)

(assert (=> b!1473406 m!1359951))

(assert (=> b!1473406 m!1359935))

(declare-fun m!1359953 () Bool)

(assert (=> b!1473406 m!1359953))

(declare-fun m!1359955 () Bool)

(assert (=> b!1473406 m!1359955))

(declare-fun m!1359957 () Bool)

(assert (=> b!1473406 m!1359957))

(assert (=> b!1473406 m!1359945))

(assert (=> b!1473415 m!1359935))

(declare-fun m!1359959 () Bool)

(assert (=> b!1473415 m!1359959))

(declare-fun m!1359961 () Bool)

(assert (=> b!1473417 m!1359961))

(assert (=> b!1473404 m!1359945))

(assert (=> b!1473404 m!1359945))

(declare-fun m!1359963 () Bool)

(assert (=> b!1473404 m!1359963))

(assert (=> b!1473407 m!1359945))

(assert (=> b!1473407 m!1359945))

(declare-fun m!1359965 () Bool)

(assert (=> b!1473407 m!1359965))

(assert (=> b!1473407 m!1359965))

(assert (=> b!1473407 m!1359945))

(declare-fun m!1359967 () Bool)

(assert (=> b!1473407 m!1359967))

(declare-fun m!1359969 () Bool)

(assert (=> b!1473408 m!1359969))

(assert (=> b!1473413 m!1359945))

(assert (=> b!1473413 m!1359945))

(declare-fun m!1359971 () Bool)

(assert (=> b!1473413 m!1359971))

(assert (=> b!1473410 m!1359943))

(declare-fun m!1359973 () Bool)

(assert (=> start!125878 m!1359973))

(declare-fun m!1359975 () Bool)

(assert (=> start!125878 m!1359975))

(declare-fun m!1359977 () Bool)

(assert (=> b!1473414 m!1359977))

(assert (=> b!1473414 m!1359977))

(declare-fun m!1359979 () Bool)

(assert (=> b!1473414 m!1359979))

(push 1)

