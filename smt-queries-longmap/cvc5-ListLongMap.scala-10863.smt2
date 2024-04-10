; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127350 () Bool)

(assert start!127350)

(declare-fun b!1496669 () Bool)

(declare-fun res!1017977 () Bool)

(declare-fun e!838255 () Bool)

(assert (=> b!1496669 (=> (not res!1017977) (not e!838255))))

(declare-datatypes ((array!99812 0))(
  ( (array!99813 (arr!48170 (Array (_ BitVec 32) (_ BitVec 64))) (size!48720 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99812)

(declare-datatypes ((List!34671 0))(
  ( (Nil!34668) (Cons!34667 (h!36064 (_ BitVec 64)) (t!49365 List!34671)) )
))
(declare-fun arrayNoDuplicates!0 (array!99812 (_ BitVec 32) List!34671) Bool)

(assert (=> b!1496669 (= res!1017977 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34668))))

(declare-fun b!1496670 () Bool)

(declare-fun e!838249 () Bool)

(declare-fun e!838254 () Bool)

(assert (=> b!1496670 (= e!838249 e!838254)))

(declare-fun res!1017981 () Bool)

(assert (=> b!1496670 (=> res!1017981 e!838254)))

(declare-fun lt!652163 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1496670 (= res!1017981 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652163 #b00000000000000000000000000000000) (bvsge lt!652163 (size!48720 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496670 (= lt!652163 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496671 () Bool)

(declare-fun res!1017978 () Bool)

(assert (=> b!1496671 (=> res!1017978 e!838254)))

(declare-fun e!838253 () Bool)

(assert (=> b!1496671 (= res!1017978 e!838253)))

(declare-fun c!138883 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496671 (= c!138883 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496673 () Bool)

(assert (=> b!1496673 (= e!838254 true)))

(declare-fun lt!652166 () array!99812)

(declare-datatypes ((SeekEntryResult!12410 0))(
  ( (MissingZero!12410 (index!52032 (_ BitVec 32))) (Found!12410 (index!52033 (_ BitVec 32))) (Intermediate!12410 (undefined!13222 Bool) (index!52034 (_ BitVec 32)) (x!133660 (_ BitVec 32))) (Undefined!12410) (MissingVacant!12410 (index!52035 (_ BitVec 32))) )
))
(declare-fun lt!652167 () SeekEntryResult!12410)

(declare-fun lt!652161 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99812 (_ BitVec 32)) SeekEntryResult!12410)

(assert (=> b!1496673 (= lt!652167 (seekEntryOrOpen!0 lt!652161 lt!652166 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((Unit!50160 0))(
  ( (Unit!50161) )
))
(declare-fun lt!652164 () Unit!50160)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50160)

(assert (=> b!1496673 (= lt!652164 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652163 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496674 () Bool)

(declare-fun res!1017980 () Bool)

(assert (=> b!1496674 (=> (not res!1017980) (not e!838255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496674 (= res!1017980 (validKeyInArray!0 (select (arr!48170 a!2862) i!1006)))))

(declare-fun b!1496675 () Bool)

(declare-fun res!1017976 () Bool)

(declare-fun e!838252 () Bool)

(assert (=> b!1496675 (=> (not res!1017976) (not e!838252))))

(assert (=> b!1496675 (= res!1017976 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496676 () Bool)

(declare-fun e!838247 () Bool)

(declare-fun e!838251 () Bool)

(assert (=> b!1496676 (= e!838247 e!838251)))

(declare-fun res!1017972 () Bool)

(assert (=> b!1496676 (=> (not res!1017972) (not e!838251))))

(declare-fun lt!652162 () SeekEntryResult!12410)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99812 (_ BitVec 32)) SeekEntryResult!12410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496676 (= res!1017972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48170 a!2862) j!93) mask!2687) (select (arr!48170 a!2862) j!93) a!2862 mask!2687) lt!652162))))

(assert (=> b!1496676 (= lt!652162 (Intermediate!12410 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496677 () Bool)

(assert (=> b!1496677 (= e!838255 e!838247)))

(declare-fun res!1017987 () Bool)

(assert (=> b!1496677 (=> (not res!1017987) (not e!838247))))

(assert (=> b!1496677 (= res!1017987 (= (select (store (arr!48170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496677 (= lt!652166 (array!99813 (store (arr!48170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48720 a!2862)))))

(declare-fun b!1496678 () Bool)

(declare-fun res!1017979 () Bool)

(assert (=> b!1496678 (=> (not res!1017979) (not e!838255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99812 (_ BitVec 32)) Bool)

(assert (=> b!1496678 (= res!1017979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496679 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99812 (_ BitVec 32)) SeekEntryResult!12410)

(assert (=> b!1496679 (= e!838253 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652163 intermediateAfterIndex!19 lt!652161 lt!652166 mask!2687) (seekEntryOrOpen!0 lt!652161 lt!652166 mask!2687))))))

(declare-fun b!1496680 () Bool)

(declare-fun res!1017975 () Bool)

(assert (=> b!1496680 (=> (not res!1017975) (not e!838251))))

(assert (=> b!1496680 (= res!1017975 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48170 a!2862) j!93) a!2862 mask!2687) lt!652162))))

(declare-fun b!1496681 () Bool)

(declare-fun res!1017971 () Bool)

(assert (=> b!1496681 (=> (not res!1017971) (not e!838255))))

(assert (=> b!1496681 (= res!1017971 (and (= (size!48720 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48720 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48720 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496672 () Bool)

(declare-fun res!1017988 () Bool)

(assert (=> b!1496672 (=> (not res!1017988) (not e!838255))))

(assert (=> b!1496672 (= res!1017988 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48720 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48720 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48720 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1017983 () Bool)

(assert (=> start!127350 (=> (not res!1017983) (not e!838255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127350 (= res!1017983 (validMask!0 mask!2687))))

(assert (=> start!127350 e!838255))

(assert (=> start!127350 true))

(declare-fun array_inv!37198 (array!99812) Bool)

(assert (=> start!127350 (array_inv!37198 a!2862)))

(declare-fun b!1496682 () Bool)

(declare-fun res!1017984 () Bool)

(assert (=> b!1496682 (=> (not res!1017984) (not e!838252))))

(declare-fun e!838248 () Bool)

(assert (=> b!1496682 (= res!1017984 e!838248)))

(declare-fun c!138884 () Bool)

(assert (=> b!1496682 (= c!138884 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496683 () Bool)

(declare-fun lt!652165 () SeekEntryResult!12410)

(assert (=> b!1496683 (= e!838253 (not (= lt!652165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652163 lt!652161 lt!652166 mask!2687))))))

(declare-fun b!1496684 () Bool)

(assert (=> b!1496684 (= e!838248 (= lt!652165 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652161 lt!652166 mask!2687)))))

(declare-fun b!1496685 () Bool)

(declare-fun res!1017985 () Bool)

(assert (=> b!1496685 (=> res!1017985 e!838254)))

(assert (=> b!1496685 (= res!1017985 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652163 (select (arr!48170 a!2862) j!93) a!2862 mask!2687) lt!652162)))))

(declare-fun b!1496686 () Bool)

(assert (=> b!1496686 (= e!838252 (not e!838249))))

(declare-fun res!1017973 () Bool)

(assert (=> b!1496686 (=> res!1017973 e!838249)))

(assert (=> b!1496686 (= res!1017973 (or (and (= (select (arr!48170 a!2862) index!646) (select (store (arr!48170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48170 a!2862) index!646) (select (arr!48170 a!2862) j!93))) (= (select (arr!48170 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496686 (and (= lt!652167 (Found!12410 j!93)) (or (= (select (arr!48170 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48170 a!2862) intermediateBeforeIndex!19) (select (arr!48170 a!2862) j!93))))))

(assert (=> b!1496686 (= lt!652167 (seekEntryOrOpen!0 (select (arr!48170 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496686 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652168 () Unit!50160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50160)

(assert (=> b!1496686 (= lt!652168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496687 () Bool)

(assert (=> b!1496687 (= e!838251 e!838252)))

(declare-fun res!1017986 () Bool)

(assert (=> b!1496687 (=> (not res!1017986) (not e!838252))))

(assert (=> b!1496687 (= res!1017986 (= lt!652165 (Intermediate!12410 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496687 (= lt!652165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652161 mask!2687) lt!652161 lt!652166 mask!2687))))

(assert (=> b!1496687 (= lt!652161 (select (store (arr!48170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496688 () Bool)

(declare-fun res!1017982 () Bool)

(assert (=> b!1496688 (=> (not res!1017982) (not e!838255))))

(assert (=> b!1496688 (= res!1017982 (validKeyInArray!0 (select (arr!48170 a!2862) j!93)))))

(declare-fun b!1496689 () Bool)

(declare-fun res!1017974 () Bool)

(assert (=> b!1496689 (=> res!1017974 e!838254)))

(assert (=> b!1496689 (= res!1017974 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496690 () Bool)

(assert (=> b!1496690 (= e!838248 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652161 lt!652166 mask!2687) (seekEntryOrOpen!0 lt!652161 lt!652166 mask!2687)))))

(assert (= (and start!127350 res!1017983) b!1496681))

(assert (= (and b!1496681 res!1017971) b!1496674))

(assert (= (and b!1496674 res!1017980) b!1496688))

(assert (= (and b!1496688 res!1017982) b!1496678))

(assert (= (and b!1496678 res!1017979) b!1496669))

(assert (= (and b!1496669 res!1017977) b!1496672))

(assert (= (and b!1496672 res!1017988) b!1496677))

(assert (= (and b!1496677 res!1017987) b!1496676))

(assert (= (and b!1496676 res!1017972) b!1496680))

(assert (= (and b!1496680 res!1017975) b!1496687))

(assert (= (and b!1496687 res!1017986) b!1496682))

(assert (= (and b!1496682 c!138884) b!1496684))

(assert (= (and b!1496682 (not c!138884)) b!1496690))

(assert (= (and b!1496682 res!1017984) b!1496675))

(assert (= (and b!1496675 res!1017976) b!1496686))

(assert (= (and b!1496686 (not res!1017973)) b!1496670))

(assert (= (and b!1496670 (not res!1017981)) b!1496685))

(assert (= (and b!1496685 (not res!1017985)) b!1496671))

(assert (= (and b!1496671 c!138883) b!1496683))

(assert (= (and b!1496671 (not c!138883)) b!1496679))

(assert (= (and b!1496671 (not res!1017978)) b!1496689))

(assert (= (and b!1496689 (not res!1017974)) b!1496673))

(declare-fun m!1379815 () Bool)

(assert (=> b!1496688 m!1379815))

(assert (=> b!1496688 m!1379815))

(declare-fun m!1379817 () Bool)

(assert (=> b!1496688 m!1379817))

(declare-fun m!1379819 () Bool)

(assert (=> b!1496673 m!1379819))

(declare-fun m!1379821 () Bool)

(assert (=> b!1496673 m!1379821))

(declare-fun m!1379823 () Bool)

(assert (=> b!1496690 m!1379823))

(assert (=> b!1496690 m!1379819))

(declare-fun m!1379825 () Bool)

(assert (=> b!1496670 m!1379825))

(declare-fun m!1379827 () Bool)

(assert (=> b!1496687 m!1379827))

(assert (=> b!1496687 m!1379827))

(declare-fun m!1379829 () Bool)

(assert (=> b!1496687 m!1379829))

(declare-fun m!1379831 () Bool)

(assert (=> b!1496687 m!1379831))

(declare-fun m!1379833 () Bool)

(assert (=> b!1496687 m!1379833))

(declare-fun m!1379835 () Bool)

(assert (=> b!1496674 m!1379835))

(assert (=> b!1496674 m!1379835))

(declare-fun m!1379837 () Bool)

(assert (=> b!1496674 m!1379837))

(assert (=> b!1496685 m!1379815))

(assert (=> b!1496685 m!1379815))

(declare-fun m!1379839 () Bool)

(assert (=> b!1496685 m!1379839))

(declare-fun m!1379841 () Bool)

(assert (=> b!1496683 m!1379841))

(declare-fun m!1379843 () Bool)

(assert (=> start!127350 m!1379843))

(declare-fun m!1379845 () Bool)

(assert (=> start!127350 m!1379845))

(declare-fun m!1379847 () Bool)

(assert (=> b!1496678 m!1379847))

(declare-fun m!1379849 () Bool)

(assert (=> b!1496669 m!1379849))

(assert (=> b!1496677 m!1379831))

(declare-fun m!1379851 () Bool)

(assert (=> b!1496677 m!1379851))

(declare-fun m!1379853 () Bool)

(assert (=> b!1496679 m!1379853))

(assert (=> b!1496679 m!1379819))

(assert (=> b!1496680 m!1379815))

(assert (=> b!1496680 m!1379815))

(declare-fun m!1379855 () Bool)

(assert (=> b!1496680 m!1379855))

(declare-fun m!1379857 () Bool)

(assert (=> b!1496686 m!1379857))

(assert (=> b!1496686 m!1379831))

(declare-fun m!1379859 () Bool)

(assert (=> b!1496686 m!1379859))

(declare-fun m!1379861 () Bool)

(assert (=> b!1496686 m!1379861))

(declare-fun m!1379863 () Bool)

(assert (=> b!1496686 m!1379863))

(assert (=> b!1496686 m!1379815))

(declare-fun m!1379865 () Bool)

(assert (=> b!1496686 m!1379865))

(declare-fun m!1379867 () Bool)

(assert (=> b!1496686 m!1379867))

(assert (=> b!1496686 m!1379815))

(assert (=> b!1496676 m!1379815))

(assert (=> b!1496676 m!1379815))

(declare-fun m!1379869 () Bool)

(assert (=> b!1496676 m!1379869))

(assert (=> b!1496676 m!1379869))

(assert (=> b!1496676 m!1379815))

(declare-fun m!1379871 () Bool)

(assert (=> b!1496676 m!1379871))

(declare-fun m!1379873 () Bool)

(assert (=> b!1496684 m!1379873))

(push 1)

