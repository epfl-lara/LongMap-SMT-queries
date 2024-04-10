; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124726 () Bool)

(assert start!124726)

(declare-fun b!1445969 () Bool)

(declare-fun e!814461 () Bool)

(assert (=> b!1445969 (= e!814461 (not true))))

(declare-fun e!814460 () Bool)

(assert (=> b!1445969 e!814460))

(declare-fun res!977794 () Bool)

(assert (=> b!1445969 (=> (not res!977794) (not e!814460))))

(declare-datatypes ((array!98174 0))(
  ( (array!98175 (arr!47375 (Array (_ BitVec 32) (_ BitVec 64))) (size!47925 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98174)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98174 (_ BitVec 32)) Bool)

(assert (=> b!1445969 (= res!977794 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48750 0))(
  ( (Unit!48751) )
))
(declare-fun lt!634655 () Unit!48750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48750)

(assert (=> b!1445969 (= lt!634655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445970 () Bool)

(declare-fun res!977789 () Bool)

(declare-fun e!814462 () Bool)

(assert (=> b!1445970 (=> (not res!977789) (not e!814462))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445970 (= res!977789 (validKeyInArray!0 (select (arr!47375 a!2862) i!1006)))))

(declare-fun b!1445971 () Bool)

(declare-fun res!977780 () Bool)

(assert (=> b!1445971 (=> (not res!977780) (not e!814460))))

(declare-datatypes ((SeekEntryResult!11627 0))(
  ( (MissingZero!11627 (index!48900 (_ BitVec 32))) (Found!11627 (index!48901 (_ BitVec 32))) (Intermediate!11627 (undefined!12439 Bool) (index!48902 (_ BitVec 32)) (x!130588 (_ BitVec 32))) (Undefined!11627) (MissingVacant!11627 (index!48903 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98174 (_ BitVec 32)) SeekEntryResult!11627)

(assert (=> b!1445971 (= res!977780 (= (seekEntryOrOpen!0 (select (arr!47375 a!2862) j!93) a!2862 mask!2687) (Found!11627 j!93)))))

(declare-fun lt!634652 () array!98174)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634656 () (_ BitVec 64))

(declare-fun e!814465 () Bool)

(declare-fun b!1445972 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98174 (_ BitVec 32)) SeekEntryResult!11627)

(assert (=> b!1445972 (= e!814465 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634656 lt!634652 mask!2687) (seekEntryOrOpen!0 lt!634656 lt!634652 mask!2687)))))

(declare-fun b!1445973 () Bool)

(declare-fun e!814466 () Bool)

(assert (=> b!1445973 (= e!814466 e!814461)))

(declare-fun res!977787 () Bool)

(assert (=> b!1445973 (=> (not res!977787) (not e!814461))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!634653 () SeekEntryResult!11627)

(assert (=> b!1445973 (= res!977787 (= lt!634653 (Intermediate!11627 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98174 (_ BitVec 32)) SeekEntryResult!11627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445973 (= lt!634653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634656 mask!2687) lt!634656 lt!634652 mask!2687))))

(assert (=> b!1445973 (= lt!634656 (select (store (arr!47375 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445974 () Bool)

(declare-fun res!977793 () Bool)

(assert (=> b!1445974 (=> (not res!977793) (not e!814461))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445974 (= res!977793 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!977785 () Bool)

(assert (=> start!124726 (=> (not res!977785) (not e!814462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124726 (= res!977785 (validMask!0 mask!2687))))

(assert (=> start!124726 e!814462))

(assert (=> start!124726 true))

(declare-fun array_inv!36403 (array!98174) Bool)

(assert (=> start!124726 (array_inv!36403 a!2862)))

(declare-fun b!1445975 () Bool)

(declare-fun res!977782 () Bool)

(assert (=> b!1445975 (=> (not res!977782) (not e!814462))))

(assert (=> b!1445975 (= res!977782 (and (= (size!47925 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47925 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47925 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445976 () Bool)

(declare-fun res!977786 () Bool)

(assert (=> b!1445976 (=> (not res!977786) (not e!814462))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445976 (= res!977786 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47925 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47925 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47925 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445977 () Bool)

(assert (=> b!1445977 (= e!814465 (= lt!634653 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634656 lt!634652 mask!2687)))))

(declare-fun b!1445978 () Bool)

(declare-fun e!814463 () Bool)

(assert (=> b!1445978 (= e!814463 e!814466)))

(declare-fun res!977790 () Bool)

(assert (=> b!1445978 (=> (not res!977790) (not e!814466))))

(declare-fun lt!634654 () SeekEntryResult!11627)

(assert (=> b!1445978 (= res!977790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47375 a!2862) j!93) mask!2687) (select (arr!47375 a!2862) j!93) a!2862 mask!2687) lt!634654))))

(assert (=> b!1445978 (= lt!634654 (Intermediate!11627 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445979 () Bool)

(declare-fun res!977791 () Bool)

(assert (=> b!1445979 (=> (not res!977791) (not e!814462))))

(declare-datatypes ((List!33876 0))(
  ( (Nil!33873) (Cons!33872 (h!35222 (_ BitVec 64)) (t!48570 List!33876)) )
))
(declare-fun arrayNoDuplicates!0 (array!98174 (_ BitVec 32) List!33876) Bool)

(assert (=> b!1445979 (= res!977791 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33873))))

(declare-fun b!1445980 () Bool)

(assert (=> b!1445980 (= e!814460 (or (= (select (arr!47375 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47375 a!2862) intermediateBeforeIndex!19) (select (arr!47375 a!2862) j!93))))))

(declare-fun b!1445981 () Bool)

(assert (=> b!1445981 (= e!814462 e!814463)))

(declare-fun res!977788 () Bool)

(assert (=> b!1445981 (=> (not res!977788) (not e!814463))))

(assert (=> b!1445981 (= res!977788 (= (select (store (arr!47375 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445981 (= lt!634652 (array!98175 (store (arr!47375 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47925 a!2862)))))

(declare-fun b!1445982 () Bool)

(declare-fun res!977783 () Bool)

(assert (=> b!1445982 (=> (not res!977783) (not e!814462))))

(assert (=> b!1445982 (= res!977783 (validKeyInArray!0 (select (arr!47375 a!2862) j!93)))))

(declare-fun b!1445983 () Bool)

(declare-fun res!977784 () Bool)

(assert (=> b!1445983 (=> (not res!977784) (not e!814461))))

(assert (=> b!1445983 (= res!977784 e!814465)))

(declare-fun c!133605 () Bool)

(assert (=> b!1445983 (= c!133605 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445984 () Bool)

(declare-fun res!977792 () Bool)

(assert (=> b!1445984 (=> (not res!977792) (not e!814466))))

(assert (=> b!1445984 (= res!977792 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47375 a!2862) j!93) a!2862 mask!2687) lt!634654))))

(declare-fun b!1445985 () Bool)

(declare-fun res!977781 () Bool)

(assert (=> b!1445985 (=> (not res!977781) (not e!814462))))

(assert (=> b!1445985 (= res!977781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124726 res!977785) b!1445975))

(assert (= (and b!1445975 res!977782) b!1445970))

(assert (= (and b!1445970 res!977789) b!1445982))

(assert (= (and b!1445982 res!977783) b!1445985))

(assert (= (and b!1445985 res!977781) b!1445979))

(assert (= (and b!1445979 res!977791) b!1445976))

(assert (= (and b!1445976 res!977786) b!1445981))

(assert (= (and b!1445981 res!977788) b!1445978))

(assert (= (and b!1445978 res!977790) b!1445984))

(assert (= (and b!1445984 res!977792) b!1445973))

(assert (= (and b!1445973 res!977787) b!1445983))

(assert (= (and b!1445983 c!133605) b!1445977))

(assert (= (and b!1445983 (not c!133605)) b!1445972))

(assert (= (and b!1445983 res!977784) b!1445974))

(assert (= (and b!1445974 res!977793) b!1445969))

(assert (= (and b!1445969 res!977794) b!1445971))

(assert (= (and b!1445971 res!977780) b!1445980))

(declare-fun m!1334887 () Bool)

(assert (=> b!1445980 m!1334887))

(declare-fun m!1334889 () Bool)

(assert (=> b!1445980 m!1334889))

(declare-fun m!1334891 () Bool)

(assert (=> b!1445972 m!1334891))

(declare-fun m!1334893 () Bool)

(assert (=> b!1445972 m!1334893))

(declare-fun m!1334895 () Bool)

(assert (=> b!1445979 m!1334895))

(assert (=> b!1445982 m!1334889))

(assert (=> b!1445982 m!1334889))

(declare-fun m!1334897 () Bool)

(assert (=> b!1445982 m!1334897))

(assert (=> b!1445984 m!1334889))

(assert (=> b!1445984 m!1334889))

(declare-fun m!1334899 () Bool)

(assert (=> b!1445984 m!1334899))

(declare-fun m!1334901 () Bool)

(assert (=> b!1445969 m!1334901))

(declare-fun m!1334903 () Bool)

(assert (=> b!1445969 m!1334903))

(declare-fun m!1334905 () Bool)

(assert (=> start!124726 m!1334905))

(declare-fun m!1334907 () Bool)

(assert (=> start!124726 m!1334907))

(declare-fun m!1334909 () Bool)

(assert (=> b!1445970 m!1334909))

(assert (=> b!1445970 m!1334909))

(declare-fun m!1334911 () Bool)

(assert (=> b!1445970 m!1334911))

(declare-fun m!1334913 () Bool)

(assert (=> b!1445981 m!1334913))

(declare-fun m!1334915 () Bool)

(assert (=> b!1445981 m!1334915))

(declare-fun m!1334917 () Bool)

(assert (=> b!1445985 m!1334917))

(declare-fun m!1334919 () Bool)

(assert (=> b!1445973 m!1334919))

(assert (=> b!1445973 m!1334919))

(declare-fun m!1334921 () Bool)

(assert (=> b!1445973 m!1334921))

(assert (=> b!1445973 m!1334913))

(declare-fun m!1334923 () Bool)

(assert (=> b!1445973 m!1334923))

(assert (=> b!1445971 m!1334889))

(assert (=> b!1445971 m!1334889))

(declare-fun m!1334925 () Bool)

(assert (=> b!1445971 m!1334925))

(declare-fun m!1334927 () Bool)

(assert (=> b!1445977 m!1334927))

(assert (=> b!1445978 m!1334889))

(assert (=> b!1445978 m!1334889))

(declare-fun m!1334929 () Bool)

(assert (=> b!1445978 m!1334929))

(assert (=> b!1445978 m!1334929))

(assert (=> b!1445978 m!1334889))

(declare-fun m!1334931 () Bool)

(assert (=> b!1445978 m!1334931))

(push 1)

