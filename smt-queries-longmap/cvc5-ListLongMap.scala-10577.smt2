; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124600 () Bool)

(assert start!124600)

(declare-fun b!1442693 () Bool)

(declare-fun res!974891 () Bool)

(declare-fun e!813085 () Bool)

(assert (=> b!1442693 (=> (not res!974891) (not e!813085))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98048 0))(
  ( (array!98049 (arr!47312 (Array (_ BitVec 32) (_ BitVec 64))) (size!47862 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98048)

(assert (=> b!1442693 (= res!974891 (and (= (size!47862 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47862 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47862 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442694 () Bool)

(declare-fun res!974883 () Bool)

(assert (=> b!1442694 (=> (not res!974883) (not e!813085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442694 (= res!974883 (validKeyInArray!0 (select (arr!47312 a!2862) j!93)))))

(declare-fun b!1442695 () Bool)

(declare-fun res!974885 () Bool)

(declare-fun e!813087 () Bool)

(assert (=> b!1442695 (=> (not res!974885) (not e!813087))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442695 (= res!974885 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!813088 () Bool)

(declare-datatypes ((SeekEntryResult!11564 0))(
  ( (MissingZero!11564 (index!48648 (_ BitVec 32))) (Found!11564 (index!48649 (_ BitVec 32))) (Intermediate!11564 (undefined!12376 Bool) (index!48650 (_ BitVec 32)) (x!130357 (_ BitVec 32))) (Undefined!11564) (MissingVacant!11564 (index!48651 (_ BitVec 32))) )
))
(declare-fun lt!633636 () SeekEntryResult!11564)

(declare-fun b!1442696 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!633638 () array!98048)

(declare-fun lt!633639 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98048 (_ BitVec 32)) SeekEntryResult!11564)

(assert (=> b!1442696 (= e!813088 (= lt!633636 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633639 lt!633638 mask!2687)))))

(declare-fun b!1442697 () Bool)

(assert (=> b!1442697 (= e!813087 (not true))))

(declare-fun e!813084 () Bool)

(assert (=> b!1442697 e!813084))

(declare-fun res!974894 () Bool)

(assert (=> b!1442697 (=> (not res!974894) (not e!813084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98048 (_ BitVec 32)) Bool)

(assert (=> b!1442697 (= res!974894 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48624 0))(
  ( (Unit!48625) )
))
(declare-fun lt!633637 () Unit!48624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48624)

(assert (=> b!1442697 (= lt!633637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442698 () Bool)

(declare-fun res!974886 () Bool)

(assert (=> b!1442698 (=> (not res!974886) (not e!813085))))

(declare-datatypes ((List!33813 0))(
  ( (Nil!33810) (Cons!33809 (h!35159 (_ BitVec 64)) (t!48507 List!33813)) )
))
(declare-fun arrayNoDuplicates!0 (array!98048 (_ BitVec 32) List!33813) Bool)

(assert (=> b!1442698 (= res!974886 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33810))))

(declare-fun b!1442699 () Bool)

(declare-fun e!813083 () Bool)

(assert (=> b!1442699 (= e!813083 e!813087)))

(declare-fun res!974889 () Bool)

(assert (=> b!1442699 (=> (not res!974889) (not e!813087))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442699 (= res!974889 (= lt!633636 (Intermediate!11564 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442699 (= lt!633636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633639 mask!2687) lt!633639 lt!633638 mask!2687))))

(assert (=> b!1442699 (= lt!633639 (select (store (arr!47312 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442700 () Bool)

(declare-fun res!974888 () Bool)

(assert (=> b!1442700 (=> (not res!974888) (not e!813085))))

(assert (=> b!1442700 (= res!974888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442702 () Bool)

(declare-fun res!974884 () Bool)

(assert (=> b!1442702 (=> (not res!974884) (not e!813083))))

(declare-fun lt!633635 () SeekEntryResult!11564)

(assert (=> b!1442702 (= res!974884 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47312 a!2862) j!93) a!2862 mask!2687) lt!633635))))

(declare-fun b!1442703 () Bool)

(declare-fun res!974882 () Bool)

(assert (=> b!1442703 (=> (not res!974882) (not e!813085))))

(assert (=> b!1442703 (= res!974882 (validKeyInArray!0 (select (arr!47312 a!2862) i!1006)))))

(declare-fun b!1442704 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98048 (_ BitVec 32)) SeekEntryResult!11564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98048 (_ BitVec 32)) SeekEntryResult!11564)

(assert (=> b!1442704 (= e!813088 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633639 lt!633638 mask!2687) (seekEntryOrOpen!0 lt!633639 lt!633638 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1442705 () Bool)

(assert (=> b!1442705 (= e!813084 (or (= (select (arr!47312 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47312 a!2862) intermediateBeforeIndex!19) (select (arr!47312 a!2862) j!93))))))

(declare-fun b!1442706 () Bool)

(declare-fun res!974890 () Bool)

(assert (=> b!1442706 (=> (not res!974890) (not e!813087))))

(assert (=> b!1442706 (= res!974890 e!813088)))

(declare-fun c!133416 () Bool)

(assert (=> b!1442706 (= c!133416 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442707 () Bool)

(declare-fun e!813089 () Bool)

(assert (=> b!1442707 (= e!813089 e!813083)))

(declare-fun res!974892 () Bool)

(assert (=> b!1442707 (=> (not res!974892) (not e!813083))))

(assert (=> b!1442707 (= res!974892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47312 a!2862) j!93) mask!2687) (select (arr!47312 a!2862) j!93) a!2862 mask!2687) lt!633635))))

(assert (=> b!1442707 (= lt!633635 (Intermediate!11564 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442708 () Bool)

(declare-fun res!974893 () Bool)

(assert (=> b!1442708 (=> (not res!974893) (not e!813084))))

(assert (=> b!1442708 (= res!974893 (= (seekEntryOrOpen!0 (select (arr!47312 a!2862) j!93) a!2862 mask!2687) (Found!11564 j!93)))))

(declare-fun b!1442709 () Bool)

(declare-fun res!974895 () Bool)

(assert (=> b!1442709 (=> (not res!974895) (not e!813085))))

(assert (=> b!1442709 (= res!974895 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47862 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47862 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47862 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442701 () Bool)

(assert (=> b!1442701 (= e!813085 e!813089)))

(declare-fun res!974896 () Bool)

(assert (=> b!1442701 (=> (not res!974896) (not e!813089))))

(assert (=> b!1442701 (= res!974896 (= (select (store (arr!47312 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442701 (= lt!633638 (array!98049 (store (arr!47312 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47862 a!2862)))))

(declare-fun res!974887 () Bool)

(assert (=> start!124600 (=> (not res!974887) (not e!813085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124600 (= res!974887 (validMask!0 mask!2687))))

(assert (=> start!124600 e!813085))

(assert (=> start!124600 true))

(declare-fun array_inv!36340 (array!98048) Bool)

(assert (=> start!124600 (array_inv!36340 a!2862)))

(assert (= (and start!124600 res!974887) b!1442693))

(assert (= (and b!1442693 res!974891) b!1442703))

(assert (= (and b!1442703 res!974882) b!1442694))

(assert (= (and b!1442694 res!974883) b!1442700))

(assert (= (and b!1442700 res!974888) b!1442698))

(assert (= (and b!1442698 res!974886) b!1442709))

(assert (= (and b!1442709 res!974895) b!1442701))

(assert (= (and b!1442701 res!974896) b!1442707))

(assert (= (and b!1442707 res!974892) b!1442702))

(assert (= (and b!1442702 res!974884) b!1442699))

(assert (= (and b!1442699 res!974889) b!1442706))

(assert (= (and b!1442706 c!133416) b!1442696))

(assert (= (and b!1442706 (not c!133416)) b!1442704))

(assert (= (and b!1442706 res!974890) b!1442695))

(assert (= (and b!1442695 res!974885) b!1442697))

(assert (= (and b!1442697 res!974894) b!1442708))

(assert (= (and b!1442708 res!974893) b!1442705))

(declare-fun m!1331821 () Bool)

(assert (=> b!1442708 m!1331821))

(assert (=> b!1442708 m!1331821))

(declare-fun m!1331823 () Bool)

(assert (=> b!1442708 m!1331823))

(declare-fun m!1331825 () Bool)

(assert (=> start!124600 m!1331825))

(declare-fun m!1331827 () Bool)

(assert (=> start!124600 m!1331827))

(declare-fun m!1331829 () Bool)

(assert (=> b!1442703 m!1331829))

(assert (=> b!1442703 m!1331829))

(declare-fun m!1331831 () Bool)

(assert (=> b!1442703 m!1331831))

(assert (=> b!1442707 m!1331821))

(assert (=> b!1442707 m!1331821))

(declare-fun m!1331833 () Bool)

(assert (=> b!1442707 m!1331833))

(assert (=> b!1442707 m!1331833))

(assert (=> b!1442707 m!1331821))

(declare-fun m!1331835 () Bool)

(assert (=> b!1442707 m!1331835))

(declare-fun m!1331837 () Bool)

(assert (=> b!1442704 m!1331837))

(declare-fun m!1331839 () Bool)

(assert (=> b!1442704 m!1331839))

(declare-fun m!1331841 () Bool)

(assert (=> b!1442698 m!1331841))

(declare-fun m!1331843 () Bool)

(assert (=> b!1442705 m!1331843))

(assert (=> b!1442705 m!1331821))

(declare-fun m!1331845 () Bool)

(assert (=> b!1442700 m!1331845))

(declare-fun m!1331847 () Bool)

(assert (=> b!1442696 m!1331847))

(assert (=> b!1442702 m!1331821))

(assert (=> b!1442702 m!1331821))

(declare-fun m!1331849 () Bool)

(assert (=> b!1442702 m!1331849))

(declare-fun m!1331851 () Bool)

(assert (=> b!1442697 m!1331851))

(declare-fun m!1331853 () Bool)

(assert (=> b!1442697 m!1331853))

(declare-fun m!1331855 () Bool)

(assert (=> b!1442699 m!1331855))

(assert (=> b!1442699 m!1331855))

(declare-fun m!1331857 () Bool)

(assert (=> b!1442699 m!1331857))

(declare-fun m!1331859 () Bool)

(assert (=> b!1442699 m!1331859))

(declare-fun m!1331861 () Bool)

(assert (=> b!1442699 m!1331861))

(assert (=> b!1442701 m!1331859))

(declare-fun m!1331863 () Bool)

(assert (=> b!1442701 m!1331863))

(assert (=> b!1442694 m!1331821))

(assert (=> b!1442694 m!1331821))

(declare-fun m!1331865 () Bool)

(assert (=> b!1442694 m!1331865))

(push 1)

