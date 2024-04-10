; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124764 () Bool)

(assert start!124764)

(declare-fun b!1447002 () Bool)

(declare-fun e!814958 () Bool)

(declare-fun e!814955 () Bool)

(assert (=> b!1447002 (= e!814958 e!814955)))

(declare-fun res!978705 () Bool)

(assert (=> b!1447002 (=> (not res!978705) (not e!814955))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98212 0))(
  ( (array!98213 (arr!47394 (Array (_ BitVec 32) (_ BitVec 64))) (size!47944 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98212)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11646 0))(
  ( (MissingZero!11646 (index!48976 (_ BitVec 32))) (Found!11646 (index!48977 (_ BitVec 32))) (Intermediate!11646 (undefined!12458 Bool) (index!48978 (_ BitVec 32)) (x!130655 (_ BitVec 32))) (Undefined!11646) (MissingVacant!11646 (index!48979 (_ BitVec 32))) )
))
(declare-fun lt!635005 () SeekEntryResult!11646)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11646)

(assert (=> b!1447002 (= res!978705 (= lt!635005 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47394 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447003 () Bool)

(declare-fun res!978700 () Bool)

(declare-fun e!814964 () Bool)

(assert (=> b!1447003 (=> (not res!978700) (not e!814964))))

(declare-datatypes ((List!33895 0))(
  ( (Nil!33892) (Cons!33891 (h!35241 (_ BitVec 64)) (t!48589 List!33895)) )
))
(declare-fun arrayNoDuplicates!0 (array!98212 (_ BitVec 32) List!33895) Bool)

(assert (=> b!1447003 (= res!978700 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33892))))

(declare-fun b!1447004 () Bool)

(declare-fun res!978713 () Bool)

(declare-fun e!814963 () Bool)

(assert (=> b!1447004 (=> (not res!978713) (not e!814963))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447004 (= res!978713 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447005 () Bool)

(declare-fun e!814957 () Bool)

(assert (=> b!1447005 (= e!814957 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635001 () SeekEntryResult!11646)

(assert (=> b!1447005 (= lt!635001 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47394 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!978702 () Bool)

(assert (=> start!124764 (=> (not res!978702) (not e!814964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124764 (= res!978702 (validMask!0 mask!2687))))

(assert (=> start!124764 e!814964))

(assert (=> start!124764 true))

(declare-fun array_inv!36422 (array!98212) Bool)

(assert (=> start!124764 (array_inv!36422 a!2862)))

(declare-fun b!1447006 () Bool)

(declare-fun lt!635007 () (_ BitVec 64))

(declare-fun lt!635004 () SeekEntryResult!11646)

(declare-fun lt!635003 () array!98212)

(declare-fun e!814956 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11646)

(assert (=> b!1447006 (= e!814956 (= lt!635004 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635007 lt!635003 mask!2687)))))

(declare-fun b!1447007 () Bool)

(declare-fun res!978707 () Bool)

(assert (=> b!1447007 (=> (not res!978707) (not e!814964))))

(assert (=> b!1447007 (= res!978707 (and (= (size!47944 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47944 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47944 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447008 () Bool)

(declare-fun res!978711 () Bool)

(assert (=> b!1447008 (=> (not res!978711) (not e!814964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98212 (_ BitVec 32)) Bool)

(assert (=> b!1447008 (= res!978711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447009 () Bool)

(declare-fun res!978710 () Bool)

(assert (=> b!1447009 (=> (not res!978710) (not e!814964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447009 (= res!978710 (validKeyInArray!0 (select (arr!47394 a!2862) j!93)))))

(declare-fun b!1447010 () Bool)

(declare-fun e!814960 () Bool)

(assert (=> b!1447010 (= e!814960 e!814963)))

(declare-fun res!978708 () Bool)

(assert (=> b!1447010 (=> (not res!978708) (not e!814963))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447010 (= res!978708 (= lt!635004 (Intermediate!11646 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447010 (= lt!635004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635007 mask!2687) lt!635007 lt!635003 mask!2687))))

(assert (=> b!1447010 (= lt!635007 (select (store (arr!47394 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447011 () Bool)

(declare-fun res!978704 () Bool)

(assert (=> b!1447011 (=> (not res!978704) (not e!814964))))

(assert (=> b!1447011 (= res!978704 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47944 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47944 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47944 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447012 () Bool)

(declare-fun e!814959 () Bool)

(assert (=> b!1447012 (= e!814959 e!814960)))

(declare-fun res!978701 () Bool)

(assert (=> b!1447012 (=> (not res!978701) (not e!814960))))

(declare-fun lt!635006 () SeekEntryResult!11646)

(assert (=> b!1447012 (= res!978701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47394 a!2862) j!93) mask!2687) (select (arr!47394 a!2862) j!93) a!2862 mask!2687) lt!635006))))

(assert (=> b!1447012 (= lt!635006 (Intermediate!11646 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447013 () Bool)

(assert (=> b!1447013 (= e!814955 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447014 () Bool)

(declare-fun res!978712 () Bool)

(assert (=> b!1447014 (=> (not res!978712) (not e!814963))))

(assert (=> b!1447014 (= res!978712 e!814956)))

(declare-fun c!133662 () Bool)

(assert (=> b!1447014 (= c!133662 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447015 () Bool)

(declare-fun res!978703 () Bool)

(assert (=> b!1447015 (=> (not res!978703) (not e!814964))))

(assert (=> b!1447015 (= res!978703 (validKeyInArray!0 (select (arr!47394 a!2862) i!1006)))))

(declare-fun b!1447016 () Bool)

(declare-fun e!814962 () Bool)

(assert (=> b!1447016 (= e!814962 e!814958)))

(declare-fun res!978709 () Bool)

(assert (=> b!1447016 (=> res!978709 e!814958)))

(assert (=> b!1447016 (= res!978709 (or (and (= (select (arr!47394 a!2862) index!646) (select (store (arr!47394 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47394 a!2862) index!646) (select (arr!47394 a!2862) j!93))) (not (= (select (arr!47394 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447017 () Bool)

(assert (=> b!1447017 (= e!814963 (not e!814957))))

(declare-fun res!978715 () Bool)

(assert (=> b!1447017 (=> res!978715 e!814957)))

(assert (=> b!1447017 (= res!978715 (or (and (= (select (arr!47394 a!2862) index!646) (select (store (arr!47394 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47394 a!2862) index!646) (select (arr!47394 a!2862) j!93))) (not (= (select (arr!47394 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47394 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447017 e!814962))

(declare-fun res!978706 () Bool)

(assert (=> b!1447017 (=> (not res!978706) (not e!814962))))

(assert (=> b!1447017 (= res!978706 (and (= lt!635005 (Found!11646 j!93)) (or (= (select (arr!47394 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47394 a!2862) intermediateBeforeIndex!19) (select (arr!47394 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98212 (_ BitVec 32)) SeekEntryResult!11646)

(assert (=> b!1447017 (= lt!635005 (seekEntryOrOpen!0 (select (arr!47394 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447017 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48788 0))(
  ( (Unit!48789) )
))
(declare-fun lt!635002 () Unit!48788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48788)

(assert (=> b!1447017 (= lt!635002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447018 () Bool)

(assert (=> b!1447018 (= e!814956 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635007 lt!635003 mask!2687) (seekEntryOrOpen!0 lt!635007 lt!635003 mask!2687)))))

(declare-fun b!1447019 () Bool)

(assert (=> b!1447019 (= e!814964 e!814959)))

(declare-fun res!978714 () Bool)

(assert (=> b!1447019 (=> (not res!978714) (not e!814959))))

(assert (=> b!1447019 (= res!978714 (= (select (store (arr!47394 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447019 (= lt!635003 (array!98213 (store (arr!47394 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47944 a!2862)))))

(declare-fun b!1447020 () Bool)

(declare-fun res!978699 () Bool)

(assert (=> b!1447020 (=> (not res!978699) (not e!814960))))

(assert (=> b!1447020 (= res!978699 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47394 a!2862) j!93) a!2862 mask!2687) lt!635006))))

(assert (= (and start!124764 res!978702) b!1447007))

(assert (= (and b!1447007 res!978707) b!1447015))

(assert (= (and b!1447015 res!978703) b!1447009))

(assert (= (and b!1447009 res!978710) b!1447008))

(assert (= (and b!1447008 res!978711) b!1447003))

(assert (= (and b!1447003 res!978700) b!1447011))

(assert (= (and b!1447011 res!978704) b!1447019))

(assert (= (and b!1447019 res!978714) b!1447012))

(assert (= (and b!1447012 res!978701) b!1447020))

(assert (= (and b!1447020 res!978699) b!1447010))

(assert (= (and b!1447010 res!978708) b!1447014))

(assert (= (and b!1447014 c!133662) b!1447006))

(assert (= (and b!1447014 (not c!133662)) b!1447018))

(assert (= (and b!1447014 res!978712) b!1447004))

(assert (= (and b!1447004 res!978713) b!1447017))

(assert (= (and b!1447017 res!978706) b!1447016))

(assert (= (and b!1447016 (not res!978709)) b!1447002))

(assert (= (and b!1447002 res!978705) b!1447013))

(assert (= (and b!1447017 (not res!978715)) b!1447005))

(declare-fun m!1335841 () Bool)

(assert (=> b!1447019 m!1335841))

(declare-fun m!1335843 () Bool)

(assert (=> b!1447019 m!1335843))

(declare-fun m!1335845 () Bool)

(assert (=> b!1447003 m!1335845))

(declare-fun m!1335847 () Bool)

(assert (=> b!1447018 m!1335847))

(declare-fun m!1335849 () Bool)

(assert (=> b!1447018 m!1335849))

(declare-fun m!1335851 () Bool)

(assert (=> b!1447015 m!1335851))

(assert (=> b!1447015 m!1335851))

(declare-fun m!1335853 () Bool)

(assert (=> b!1447015 m!1335853))

(declare-fun m!1335855 () Bool)

(assert (=> b!1447008 m!1335855))

(declare-fun m!1335857 () Bool)

(assert (=> b!1447012 m!1335857))

(assert (=> b!1447012 m!1335857))

(declare-fun m!1335859 () Bool)

(assert (=> b!1447012 m!1335859))

(assert (=> b!1447012 m!1335859))

(assert (=> b!1447012 m!1335857))

(declare-fun m!1335861 () Bool)

(assert (=> b!1447012 m!1335861))

(assert (=> b!1447020 m!1335857))

(assert (=> b!1447020 m!1335857))

(declare-fun m!1335863 () Bool)

(assert (=> b!1447020 m!1335863))

(assert (=> b!1447002 m!1335857))

(assert (=> b!1447002 m!1335857))

(declare-fun m!1335865 () Bool)

(assert (=> b!1447002 m!1335865))

(declare-fun m!1335867 () Bool)

(assert (=> b!1447010 m!1335867))

(assert (=> b!1447010 m!1335867))

(declare-fun m!1335869 () Bool)

(assert (=> b!1447010 m!1335869))

(assert (=> b!1447010 m!1335841))

(declare-fun m!1335871 () Bool)

(assert (=> b!1447010 m!1335871))

(assert (=> b!1447009 m!1335857))

(assert (=> b!1447009 m!1335857))

(declare-fun m!1335873 () Bool)

(assert (=> b!1447009 m!1335873))

(assert (=> b!1447005 m!1335857))

(assert (=> b!1447005 m!1335857))

(declare-fun m!1335875 () Bool)

(assert (=> b!1447005 m!1335875))

(declare-fun m!1335877 () Bool)

(assert (=> b!1447006 m!1335877))

(declare-fun m!1335879 () Bool)

(assert (=> b!1447017 m!1335879))

(assert (=> b!1447017 m!1335841))

(declare-fun m!1335881 () Bool)

(assert (=> b!1447017 m!1335881))

(declare-fun m!1335883 () Bool)

(assert (=> b!1447017 m!1335883))

(declare-fun m!1335885 () Bool)

(assert (=> b!1447017 m!1335885))

(assert (=> b!1447017 m!1335857))

(declare-fun m!1335887 () Bool)

(assert (=> b!1447017 m!1335887))

(declare-fun m!1335889 () Bool)

(assert (=> b!1447017 m!1335889))

(assert (=> b!1447017 m!1335857))

(declare-fun m!1335891 () Bool)

(assert (=> start!124764 m!1335891))

(declare-fun m!1335893 () Bool)

(assert (=> start!124764 m!1335893))

(assert (=> b!1447016 m!1335885))

(assert (=> b!1447016 m!1335841))

(assert (=> b!1447016 m!1335883))

(assert (=> b!1447016 m!1335857))

(check-sat (not b!1447012) (not b!1447008) (not b!1447002) (not b!1447010) (not b!1447020) (not b!1447018) (not b!1447006) (not b!1447015) (not b!1447005) (not start!124764) (not b!1447003) (not b!1447009) (not b!1447017))
(check-sat)
