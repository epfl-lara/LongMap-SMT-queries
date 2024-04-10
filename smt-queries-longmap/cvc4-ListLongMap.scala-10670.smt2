; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125162 () Bool)

(assert start!125162)

(declare-fun lt!639260 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98610 0))(
  ( (array!98611 (arr!47593 (Array (_ BitVec 32) (_ BitVec 64))) (size!48143 (_ BitVec 32))) )
))
(declare-fun lt!639267 () array!98610)

(declare-fun e!820577 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1458990 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11845 0))(
  ( (MissingZero!11845 (index!49772 (_ BitVec 32))) (Found!11845 (index!49773 (_ BitVec 32))) (Intermediate!11845 (undefined!12657 Bool) (index!49774 (_ BitVec 32)) (x!131382 (_ BitVec 32))) (Undefined!11845) (MissingVacant!11845 (index!49775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98610 (_ BitVec 32)) SeekEntryResult!11845)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98610 (_ BitVec 32)) SeekEntryResult!11845)

(assert (=> b!1458990 (= e!820577 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639260 lt!639267 mask!2687) (seekEntryOrOpen!0 lt!639260 lt!639267 mask!2687)))))

(declare-fun b!1458991 () Bool)

(declare-fun res!989026 () Bool)

(declare-fun e!820576 () Bool)

(assert (=> b!1458991 (=> (not res!989026) (not e!820576))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458991 (= res!989026 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458992 () Bool)

(declare-fun e!820582 () Bool)

(assert (=> b!1458992 (= e!820582 e!820576)))

(declare-fun res!989009 () Bool)

(assert (=> b!1458992 (=> (not res!989009) (not e!820576))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639262 () SeekEntryResult!11845)

(assert (=> b!1458992 (= res!989009 (= lt!639262 (Intermediate!11845 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98610 (_ BitVec 32)) SeekEntryResult!11845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458992 (= lt!639262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639260 mask!2687) lt!639260 lt!639267 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!98610)

(assert (=> b!1458992 (= lt!639260 (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458993 () Bool)

(declare-fun res!989010 () Bool)

(declare-fun e!820580 () Bool)

(assert (=> b!1458993 (=> (not res!989010) (not e!820580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98610 (_ BitVec 32)) Bool)

(assert (=> b!1458993 (= res!989010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458994 () Bool)

(declare-fun e!820575 () Bool)

(assert (=> b!1458994 (= e!820575 e!820582)))

(declare-fun res!989019 () Bool)

(assert (=> b!1458994 (=> (not res!989019) (not e!820582))))

(declare-fun lt!639263 () SeekEntryResult!11845)

(assert (=> b!1458994 (= res!989019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47593 a!2862) j!93) mask!2687) (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!639263))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458994 (= lt!639263 (Intermediate!11845 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458995 () Bool)

(declare-fun e!820581 () Bool)

(assert (=> b!1458995 (= e!820581 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!639264 () SeekEntryResult!11845)

(declare-fun lt!639266 () SeekEntryResult!11845)

(assert (=> b!1458995 (= lt!639264 lt!639266)))

(declare-fun lt!639259 () (_ BitVec 32))

(declare-datatypes ((Unit!49186 0))(
  ( (Unit!49187) )
))
(declare-fun lt!639261 () Unit!49186)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49186)

(assert (=> b!1458995 (= lt!639261 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639259 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458996 () Bool)

(declare-fun res!989015 () Bool)

(assert (=> b!1458996 (=> (not res!989015) (not e!820580))))

(declare-datatypes ((List!34094 0))(
  ( (Nil!34091) (Cons!34090 (h!35440 (_ BitVec 64)) (t!48788 List!34094)) )
))
(declare-fun arrayNoDuplicates!0 (array!98610 (_ BitVec 32) List!34094) Bool)

(assert (=> b!1458996 (= res!989015 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34091))))

(declare-fun b!1458997 () Bool)

(declare-fun res!989018 () Bool)

(assert (=> b!1458997 (=> (not res!989018) (not e!820580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458997 (= res!989018 (validKeyInArray!0 (select (arr!47593 a!2862) i!1006)))))

(declare-fun e!820579 () Bool)

(declare-fun b!1458998 () Bool)

(assert (=> b!1458998 (= e!820579 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639259 intermediateAfterIndex!19 lt!639260 lt!639267 mask!2687) lt!639266)))))

(declare-fun b!1458999 () Bool)

(declare-fun res!989022 () Bool)

(assert (=> b!1458999 (=> (not res!989022) (not e!820580))))

(assert (=> b!1458999 (= res!989022 (validKeyInArray!0 (select (arr!47593 a!2862) j!93)))))

(declare-fun b!1459000 () Bool)

(declare-fun res!989025 () Bool)

(assert (=> b!1459000 (=> res!989025 e!820581)))

(assert (=> b!1459000 (= res!989025 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639259 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!639263)))))

(declare-fun b!1459001 () Bool)

(declare-fun res!989014 () Bool)

(assert (=> b!1459001 (=> (not res!989014) (not e!820576))))

(assert (=> b!1459001 (= res!989014 e!820577)))

(declare-fun c!134502 () Bool)

(assert (=> b!1459001 (= c!134502 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459002 () Bool)

(declare-fun res!989011 () Bool)

(assert (=> b!1459002 (=> res!989011 e!820581)))

(assert (=> b!1459002 (= res!989011 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459003 () Bool)

(declare-fun res!989016 () Bool)

(assert (=> b!1459003 (=> res!989016 e!820581)))

(assert (=> b!1459003 (= res!989016 e!820579)))

(declare-fun c!134501 () Bool)

(assert (=> b!1459003 (= c!134501 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!989017 () Bool)

(assert (=> start!125162 (=> (not res!989017) (not e!820580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125162 (= res!989017 (validMask!0 mask!2687))))

(assert (=> start!125162 e!820580))

(assert (=> start!125162 true))

(declare-fun array_inv!36621 (array!98610) Bool)

(assert (=> start!125162 (array_inv!36621 a!2862)))

(declare-fun b!1459004 () Bool)

(declare-fun res!989012 () Bool)

(assert (=> b!1459004 (=> (not res!989012) (not e!820582))))

(assert (=> b!1459004 (= res!989012 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!639263))))

(declare-fun b!1459005 () Bool)

(declare-fun e!820578 () Bool)

(assert (=> b!1459005 (= e!820576 (not e!820578))))

(declare-fun res!989024 () Bool)

(assert (=> b!1459005 (=> res!989024 e!820578)))

(assert (=> b!1459005 (= res!989024 (or (and (= (select (arr!47593 a!2862) index!646) (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47593 a!2862) index!646) (select (arr!47593 a!2862) j!93))) (= (select (arr!47593 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459005 (and (= lt!639264 (Found!11845 j!93)) (or (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) (select (arr!47593 a!2862) j!93))) (let ((bdg!53469 (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47593 a!2862) index!646) bdg!53469) (= (select (arr!47593 a!2862) index!646) (select (arr!47593 a!2862) j!93))) (= (select (arr!47593 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53469 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459005 (= lt!639264 (seekEntryOrOpen!0 (select (arr!47593 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459005 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639265 () Unit!49186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49186)

(assert (=> b!1459005 (= lt!639265 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459006 () Bool)

(assert (=> b!1459006 (= e!820580 e!820575)))

(declare-fun res!989021 () Bool)

(assert (=> b!1459006 (=> (not res!989021) (not e!820575))))

(assert (=> b!1459006 (= res!989021 (= (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459006 (= lt!639267 (array!98611 (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48143 a!2862)))))

(declare-fun b!1459007 () Bool)

(assert (=> b!1459007 (= e!820577 (= lt!639262 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639260 lt!639267 mask!2687)))))

(declare-fun b!1459008 () Bool)

(assert (=> b!1459008 (= e!820579 (not (= lt!639262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639259 lt!639260 lt!639267 mask!2687))))))

(declare-fun b!1459009 () Bool)

(declare-fun res!989023 () Bool)

(assert (=> b!1459009 (=> (not res!989023) (not e!820580))))

(assert (=> b!1459009 (= res!989023 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48143 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48143 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48143 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459010 () Bool)

(assert (=> b!1459010 (= e!820578 e!820581)))

(declare-fun res!989013 () Bool)

(assert (=> b!1459010 (=> res!989013 e!820581)))

(assert (=> b!1459010 (= res!989013 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639259 #b00000000000000000000000000000000) (bvsge lt!639259 (size!48143 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459010 (= lt!639259 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459010 (= lt!639266 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639260 lt!639267 mask!2687))))

(assert (=> b!1459010 (= lt!639266 (seekEntryOrOpen!0 lt!639260 lt!639267 mask!2687))))

(declare-fun b!1459011 () Bool)

(declare-fun res!989020 () Bool)

(assert (=> b!1459011 (=> (not res!989020) (not e!820580))))

(assert (=> b!1459011 (= res!989020 (and (= (size!48143 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48143 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48143 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125162 res!989017) b!1459011))

(assert (= (and b!1459011 res!989020) b!1458997))

(assert (= (and b!1458997 res!989018) b!1458999))

(assert (= (and b!1458999 res!989022) b!1458993))

(assert (= (and b!1458993 res!989010) b!1458996))

(assert (= (and b!1458996 res!989015) b!1459009))

(assert (= (and b!1459009 res!989023) b!1459006))

(assert (= (and b!1459006 res!989021) b!1458994))

(assert (= (and b!1458994 res!989019) b!1459004))

(assert (= (and b!1459004 res!989012) b!1458992))

(assert (= (and b!1458992 res!989009) b!1459001))

(assert (= (and b!1459001 c!134502) b!1459007))

(assert (= (and b!1459001 (not c!134502)) b!1458990))

(assert (= (and b!1459001 res!989014) b!1458991))

(assert (= (and b!1458991 res!989026) b!1459005))

(assert (= (and b!1459005 (not res!989024)) b!1459010))

(assert (= (and b!1459010 (not res!989013)) b!1459000))

(assert (= (and b!1459000 (not res!989025)) b!1459003))

(assert (= (and b!1459003 c!134501) b!1459008))

(assert (= (and b!1459003 (not c!134501)) b!1458998))

(assert (= (and b!1459003 (not res!989016)) b!1459002))

(assert (= (and b!1459002 (not res!989011)) b!1458995))

(declare-fun m!1346791 () Bool)

(assert (=> b!1458995 m!1346791))

(declare-fun m!1346793 () Bool)

(assert (=> b!1458996 m!1346793))

(declare-fun m!1346795 () Bool)

(assert (=> b!1458990 m!1346795))

(declare-fun m!1346797 () Bool)

(assert (=> b!1458990 m!1346797))

(declare-fun m!1346799 () Bool)

(assert (=> start!125162 m!1346799))

(declare-fun m!1346801 () Bool)

(assert (=> start!125162 m!1346801))

(declare-fun m!1346803 () Bool)

(assert (=> b!1458997 m!1346803))

(assert (=> b!1458997 m!1346803))

(declare-fun m!1346805 () Bool)

(assert (=> b!1458997 m!1346805))

(declare-fun m!1346807 () Bool)

(assert (=> b!1459004 m!1346807))

(assert (=> b!1459004 m!1346807))

(declare-fun m!1346809 () Bool)

(assert (=> b!1459004 m!1346809))

(declare-fun m!1346811 () Bool)

(assert (=> b!1458993 m!1346811))

(assert (=> b!1458994 m!1346807))

(assert (=> b!1458994 m!1346807))

(declare-fun m!1346813 () Bool)

(assert (=> b!1458994 m!1346813))

(assert (=> b!1458994 m!1346813))

(assert (=> b!1458994 m!1346807))

(declare-fun m!1346815 () Bool)

(assert (=> b!1458994 m!1346815))

(assert (=> b!1459000 m!1346807))

(assert (=> b!1459000 m!1346807))

(declare-fun m!1346817 () Bool)

(assert (=> b!1459000 m!1346817))

(assert (=> b!1458999 m!1346807))

(assert (=> b!1458999 m!1346807))

(declare-fun m!1346819 () Bool)

(assert (=> b!1458999 m!1346819))

(declare-fun m!1346821 () Bool)

(assert (=> b!1458998 m!1346821))

(declare-fun m!1346823 () Bool)

(assert (=> b!1459006 m!1346823))

(declare-fun m!1346825 () Bool)

(assert (=> b!1459006 m!1346825))

(declare-fun m!1346827 () Bool)

(assert (=> b!1459007 m!1346827))

(declare-fun m!1346829 () Bool)

(assert (=> b!1459005 m!1346829))

(assert (=> b!1459005 m!1346823))

(declare-fun m!1346831 () Bool)

(assert (=> b!1459005 m!1346831))

(declare-fun m!1346833 () Bool)

(assert (=> b!1459005 m!1346833))

(declare-fun m!1346835 () Bool)

(assert (=> b!1459005 m!1346835))

(assert (=> b!1459005 m!1346807))

(declare-fun m!1346837 () Bool)

(assert (=> b!1459005 m!1346837))

(declare-fun m!1346839 () Bool)

(assert (=> b!1459005 m!1346839))

(assert (=> b!1459005 m!1346807))

(declare-fun m!1346841 () Bool)

(assert (=> b!1459010 m!1346841))

(assert (=> b!1459010 m!1346795))

(assert (=> b!1459010 m!1346797))

(declare-fun m!1346843 () Bool)

(assert (=> b!1458992 m!1346843))

(assert (=> b!1458992 m!1346843))

(declare-fun m!1346845 () Bool)

(assert (=> b!1458992 m!1346845))

(assert (=> b!1458992 m!1346823))

(declare-fun m!1346847 () Bool)

(assert (=> b!1458992 m!1346847))

(declare-fun m!1346849 () Bool)

(assert (=> b!1459008 m!1346849))

(push 1)

(assert (not b!1458999))

(assert (not b!1459000))

(assert (not b!1459004))

(assert (not b!1458996))

(assert (not b!1458993))

