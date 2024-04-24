; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125400 () Bool)

(assert start!125400)

(declare-fun b!1460977 () Bool)

(declare-fun e!821691 () Bool)

(declare-fun e!821689 () Bool)

(assert (=> b!1460977 (= e!821691 e!821689)))

(declare-fun res!990068 () Bool)

(assert (=> b!1460977 (=> (not res!990068) (not e!821689))))

(declare-datatypes ((SeekEntryResult!11805 0))(
  ( (MissingZero!11805 (index!49612 (_ BitVec 32))) (Found!11805 (index!49613 (_ BitVec 32))) (Intermediate!11805 (undefined!12617 Bool) (index!49614 (_ BitVec 32)) (x!131398 (_ BitVec 32))) (Undefined!11805) (MissingVacant!11805 (index!49615 (_ BitVec 32))) )
))
(declare-fun lt!640011 () SeekEntryResult!11805)

(declare-datatypes ((array!98743 0))(
  ( (array!98744 (arr!47656 (Array (_ BitVec 32) (_ BitVec 64))) (size!48207 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98743)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98743 (_ BitVec 32)) SeekEntryResult!11805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460977 (= res!990068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47656 a!2862) j!93) mask!2687) (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640011))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460977 (= lt!640011 (Intermediate!11805 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460978 () Bool)

(declare-fun res!990060 () Bool)

(declare-fun e!821685 () Bool)

(assert (=> b!1460978 (=> (not res!990060) (not e!821685))))

(declare-datatypes ((List!34144 0))(
  ( (Nil!34141) (Cons!34140 (h!35501 (_ BitVec 64)) (t!48830 List!34144)) )
))
(declare-fun arrayNoDuplicates!0 (array!98743 (_ BitVec 32) List!34144) Bool)

(assert (=> b!1460978 (= res!990060 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34141))))

(declare-fun b!1460979 () Bool)

(declare-fun res!990058 () Bool)

(declare-fun e!821687 () Bool)

(assert (=> b!1460979 (=> (not res!990058) (not e!821687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460979 (= res!990058 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460980 () Bool)

(declare-fun res!990064 () Bool)

(assert (=> b!1460980 (=> (not res!990064) (not e!821685))))

(assert (=> b!1460980 (= res!990064 (and (= (size!48207 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48207 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48207 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460981 () Bool)

(declare-fun res!990065 () Bool)

(assert (=> b!1460981 (=> (not res!990065) (not e!821689))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460981 (= res!990065 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640011))))

(declare-fun e!821688 () Bool)

(declare-fun lt!640014 () array!98743)

(declare-fun b!1460982 () Bool)

(declare-fun lt!640015 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98743 (_ BitVec 32)) SeekEntryResult!11805)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98743 (_ BitVec 32)) SeekEntryResult!11805)

(assert (=> b!1460982 (= e!821688 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640015 lt!640014 mask!2687) (seekEntryOrOpen!0 lt!640015 lt!640014 mask!2687)))))

(declare-fun lt!640009 () (_ BitVec 32))

(declare-fun e!821690 () Bool)

(declare-fun lt!640007 () SeekEntryResult!11805)

(declare-fun b!1460983 () Bool)

(assert (=> b!1460983 (= e!821690 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640009 intermediateAfterIndex!19 lt!640015 lt!640014 mask!2687) lt!640007)))))

(declare-fun b!1460984 () Bool)

(declare-fun res!990062 () Bool)

(declare-fun e!821686 () Bool)

(assert (=> b!1460984 (=> res!990062 e!821686)))

(assert (=> b!1460984 (= res!990062 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460985 () Bool)

(declare-fun e!821684 () Bool)

(assert (=> b!1460985 (= e!821684 e!821686)))

(declare-fun res!990053 () Bool)

(assert (=> b!1460985 (=> res!990053 e!821686)))

(assert (=> b!1460985 (= res!990053 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640009 #b00000000000000000000000000000000) (bvsge lt!640009 (size!48207 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460985 (= lt!640009 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1460985 (= lt!640007 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640015 lt!640014 mask!2687))))

(assert (=> b!1460985 (= lt!640007 (seekEntryOrOpen!0 lt!640015 lt!640014 mask!2687))))

(declare-fun res!990066 () Bool)

(assert (=> start!125400 (=> (not res!990066) (not e!821685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125400 (= res!990066 (validMask!0 mask!2687))))

(assert (=> start!125400 e!821685))

(assert (=> start!125400 true))

(declare-fun array_inv!36937 (array!98743) Bool)

(assert (=> start!125400 (array_inv!36937 a!2862)))

(declare-fun b!1460986 () Bool)

(declare-fun res!990052 () Bool)

(assert (=> b!1460986 (=> res!990052 e!821686)))

(assert (=> b!1460986 (= res!990052 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640009 (select (arr!47656 a!2862) j!93) a!2862 mask!2687) lt!640011)))))

(declare-fun b!1460987 () Bool)

(declare-fun res!990059 () Bool)

(assert (=> b!1460987 (=> res!990059 e!821686)))

(assert (=> b!1460987 (= res!990059 e!821690)))

(declare-fun c!134983 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460987 (= c!134983 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460988 () Bool)

(assert (=> b!1460988 (= e!821685 e!821691)))

(declare-fun res!990063 () Bool)

(assert (=> b!1460988 (=> (not res!990063) (not e!821691))))

(assert (=> b!1460988 (= res!990063 (= (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460988 (= lt!640014 (array!98744 (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48207 a!2862)))))

(declare-fun b!1460989 () Bool)

(declare-fun res!990055 () Bool)

(assert (=> b!1460989 (=> (not res!990055) (not e!821685))))

(assert (=> b!1460989 (= res!990055 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48207 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48207 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48207 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460990 () Bool)

(declare-fun res!990054 () Bool)

(assert (=> b!1460990 (=> (not res!990054) (not e!821685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98743 (_ BitVec 32)) Bool)

(assert (=> b!1460990 (= res!990054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460991 () Bool)

(assert (=> b!1460991 (= e!821686 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!640010 () SeekEntryResult!11805)

(assert (=> b!1460991 (= lt!640010 lt!640007)))

(declare-datatypes ((Unit!49139 0))(
  ( (Unit!49140) )
))
(declare-fun lt!640008 () Unit!49139)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49139)

(assert (=> b!1460991 (= lt!640008 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!640009 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460992 () Bool)

(declare-fun res!990067 () Bool)

(assert (=> b!1460992 (=> (not res!990067) (not e!821685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460992 (= res!990067 (validKeyInArray!0 (select (arr!47656 a!2862) i!1006)))))

(declare-fun b!1460993 () Bool)

(assert (=> b!1460993 (= e!821687 (not e!821684))))

(declare-fun res!990057 () Bool)

(assert (=> b!1460993 (=> res!990057 e!821684)))

(assert (=> b!1460993 (= res!990057 (or (and (= (select (arr!47656 a!2862) index!646) (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47656 a!2862) index!646) (select (arr!47656 a!2862) j!93))) (= (select (arr!47656 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460993 (and (= lt!640010 (Found!11805 j!93)) (or (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47656 a!2862) intermediateBeforeIndex!19) (select (arr!47656 a!2862) j!93))) (let ((bdg!53530 (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47656 a!2862) index!646) bdg!53530) (= (select (arr!47656 a!2862) index!646) (select (arr!47656 a!2862) j!93))) (= (select (arr!47656 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53530 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460993 (= lt!640010 (seekEntryOrOpen!0 (select (arr!47656 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1460993 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!640012 () Unit!49139)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49139)

(assert (=> b!1460993 (= lt!640012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460994 () Bool)

(declare-fun res!990051 () Bool)

(assert (=> b!1460994 (=> (not res!990051) (not e!821687))))

(assert (=> b!1460994 (= res!990051 e!821688)))

(declare-fun c!134982 () Bool)

(assert (=> b!1460994 (= c!134982 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!640013 () SeekEntryResult!11805)

(declare-fun b!1460995 () Bool)

(assert (=> b!1460995 (= e!821688 (= lt!640013 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640015 lt!640014 mask!2687)))))

(declare-fun b!1460996 () Bool)

(assert (=> b!1460996 (= e!821690 (not (= lt!640013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640009 lt!640015 lt!640014 mask!2687))))))

(declare-fun b!1460997 () Bool)

(assert (=> b!1460997 (= e!821689 e!821687)))

(declare-fun res!990061 () Bool)

(assert (=> b!1460997 (=> (not res!990061) (not e!821687))))

(assert (=> b!1460997 (= res!990061 (= lt!640013 (Intermediate!11805 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460997 (= lt!640013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640015 mask!2687) lt!640015 lt!640014 mask!2687))))

(assert (=> b!1460997 (= lt!640015 (select (store (arr!47656 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460998 () Bool)

(declare-fun res!990056 () Bool)

(assert (=> b!1460998 (=> (not res!990056) (not e!821685))))

(assert (=> b!1460998 (= res!990056 (validKeyInArray!0 (select (arr!47656 a!2862) j!93)))))

(assert (= (and start!125400 res!990066) b!1460980))

(assert (= (and b!1460980 res!990064) b!1460992))

(assert (= (and b!1460992 res!990067) b!1460998))

(assert (= (and b!1460998 res!990056) b!1460990))

(assert (= (and b!1460990 res!990054) b!1460978))

(assert (= (and b!1460978 res!990060) b!1460989))

(assert (= (and b!1460989 res!990055) b!1460988))

(assert (= (and b!1460988 res!990063) b!1460977))

(assert (= (and b!1460977 res!990068) b!1460981))

(assert (= (and b!1460981 res!990065) b!1460997))

(assert (= (and b!1460997 res!990061) b!1460994))

(assert (= (and b!1460994 c!134982) b!1460995))

(assert (= (and b!1460994 (not c!134982)) b!1460982))

(assert (= (and b!1460994 res!990051) b!1460979))

(assert (= (and b!1460979 res!990058) b!1460993))

(assert (= (and b!1460993 (not res!990057)) b!1460985))

(assert (= (and b!1460985 (not res!990053)) b!1460986))

(assert (= (and b!1460986 (not res!990052)) b!1460987))

(assert (= (and b!1460987 c!134983) b!1460996))

(assert (= (and b!1460987 (not c!134983)) b!1460983))

(assert (= (and b!1460987 (not res!990059)) b!1460984))

(assert (= (and b!1460984 (not res!990062)) b!1460991))

(declare-fun m!1348831 () Bool)

(assert (=> b!1460992 m!1348831))

(assert (=> b!1460992 m!1348831))

(declare-fun m!1348833 () Bool)

(assert (=> b!1460992 m!1348833))

(declare-fun m!1348835 () Bool)

(assert (=> b!1460977 m!1348835))

(assert (=> b!1460977 m!1348835))

(declare-fun m!1348837 () Bool)

(assert (=> b!1460977 m!1348837))

(assert (=> b!1460977 m!1348837))

(assert (=> b!1460977 m!1348835))

(declare-fun m!1348839 () Bool)

(assert (=> b!1460977 m!1348839))

(assert (=> b!1460998 m!1348835))

(assert (=> b!1460998 m!1348835))

(declare-fun m!1348841 () Bool)

(assert (=> b!1460998 m!1348841))

(declare-fun m!1348843 () Bool)

(assert (=> b!1460983 m!1348843))

(declare-fun m!1348845 () Bool)

(assert (=> b!1460985 m!1348845))

(declare-fun m!1348847 () Bool)

(assert (=> b!1460985 m!1348847))

(declare-fun m!1348849 () Bool)

(assert (=> b!1460985 m!1348849))

(declare-fun m!1348851 () Bool)

(assert (=> b!1460995 m!1348851))

(declare-fun m!1348853 () Bool)

(assert (=> b!1460988 m!1348853))

(declare-fun m!1348855 () Bool)

(assert (=> b!1460988 m!1348855))

(declare-fun m!1348857 () Bool)

(assert (=> b!1460990 m!1348857))

(declare-fun m!1348859 () Bool)

(assert (=> b!1460991 m!1348859))

(declare-fun m!1348861 () Bool)

(assert (=> start!125400 m!1348861))

(declare-fun m!1348863 () Bool)

(assert (=> start!125400 m!1348863))

(declare-fun m!1348865 () Bool)

(assert (=> b!1460996 m!1348865))

(assert (=> b!1460981 m!1348835))

(assert (=> b!1460981 m!1348835))

(declare-fun m!1348867 () Bool)

(assert (=> b!1460981 m!1348867))

(assert (=> b!1460982 m!1348847))

(assert (=> b!1460982 m!1348849))

(declare-fun m!1348869 () Bool)

(assert (=> b!1460997 m!1348869))

(assert (=> b!1460997 m!1348869))

(declare-fun m!1348871 () Bool)

(assert (=> b!1460997 m!1348871))

(assert (=> b!1460997 m!1348853))

(declare-fun m!1348873 () Bool)

(assert (=> b!1460997 m!1348873))

(declare-fun m!1348875 () Bool)

(assert (=> b!1460993 m!1348875))

(assert (=> b!1460993 m!1348853))

(declare-fun m!1348877 () Bool)

(assert (=> b!1460993 m!1348877))

(declare-fun m!1348879 () Bool)

(assert (=> b!1460993 m!1348879))

(declare-fun m!1348881 () Bool)

(assert (=> b!1460993 m!1348881))

(assert (=> b!1460993 m!1348835))

(declare-fun m!1348883 () Bool)

(assert (=> b!1460993 m!1348883))

(declare-fun m!1348885 () Bool)

(assert (=> b!1460993 m!1348885))

(assert (=> b!1460993 m!1348835))

(assert (=> b!1460986 m!1348835))

(assert (=> b!1460986 m!1348835))

(declare-fun m!1348887 () Bool)

(assert (=> b!1460986 m!1348887))

(declare-fun m!1348889 () Bool)

(assert (=> b!1460978 m!1348889))

(check-sat (not b!1460997) (not b!1460990) (not b!1460998) (not b!1460983) (not start!125400) (not b!1460996) (not b!1460993) (not b!1460991) (not b!1460992) (not b!1460982) (not b!1460995) (not b!1460981) (not b!1460977) (not b!1460978) (not b!1460985) (not b!1460986))
(check-sat)
