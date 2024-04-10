; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122734 () Bool)

(assert start!122734)

(declare-fun res!957691 () Bool)

(declare-fun e!804065 () Bool)

(assert (=> start!122734 (=> (not res!957691) (not e!804065))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122734 (= res!957691 (validMask!0 mask!2608))))

(assert (=> start!122734 e!804065))

(assert (=> start!122734 true))

(declare-datatypes ((array!97099 0))(
  ( (array!97100 (arr!46867 (Array (_ BitVec 32) (_ BitVec 64))) (size!47417 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97099)

(declare-fun array_inv!35895 (array!97099) Bool)

(assert (=> start!122734 (array_inv!35895 a!2831)))

(declare-fun b!1422255 () Bool)

(declare-fun res!957688 () Bool)

(declare-fun e!804060 () Bool)

(assert (=> b!1422255 (=> res!957688 e!804060)))

(declare-fun lt!626601 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11152 0))(
  ( (MissingZero!11152 (index!47000 (_ BitVec 32))) (Found!11152 (index!47001 (_ BitVec 32))) (Intermediate!11152 (undefined!11964 Bool) (index!47002 (_ BitVec 32)) (x!128642 (_ BitVec 32))) (Undefined!11152) (MissingVacant!11152 (index!47003 (_ BitVec 32))) )
))
(declare-fun lt!626599 () SeekEntryResult!11152)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97099 (_ BitVec 32)) SeekEntryResult!11152)

(assert (=> b!1422255 (= res!957688 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626601 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626599)))))

(declare-fun b!1422256 () Bool)

(declare-fun res!957702 () Bool)

(assert (=> b!1422256 (=> (not res!957702) (not e!804065))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422256 (= res!957702 (and (= (size!47417 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47417 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47417 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422257 () Bool)

(declare-fun e!804064 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97099 (_ BitVec 32)) SeekEntryResult!11152)

(assert (=> b!1422257 (= e!804064 (= (seekEntryOrOpen!0 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) (Found!11152 j!81)))))

(declare-fun b!1422258 () Bool)

(declare-fun e!804059 () Bool)

(assert (=> b!1422258 (= e!804059 e!804060)))

(declare-fun res!957694 () Bool)

(assert (=> b!1422258 (=> res!957694 e!804060)))

(assert (=> b!1422258 (= res!957694 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626601 #b00000000000000000000000000000000) (bvsge lt!626601 (size!47417 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422258 (= lt!626601 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422259 () Bool)

(declare-fun e!804062 () Bool)

(assert (=> b!1422259 (= e!804062 (not e!804059))))

(declare-fun res!957690 () Bool)

(assert (=> b!1422259 (=> res!957690 e!804059)))

(assert (=> b!1422259 (= res!957690 (or (= (select (arr!46867 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46867 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46867 a!2831) index!585) (select (arr!46867 a!2831) j!81)) (= (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422259 e!804064))

(declare-fun res!957701 () Bool)

(assert (=> b!1422259 (=> (not res!957701) (not e!804064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97099 (_ BitVec 32)) Bool)

(assert (=> b!1422259 (= res!957701 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48140 0))(
  ( (Unit!48141) )
))
(declare-fun lt!626600 () Unit!48140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48140)

(assert (=> b!1422259 (= lt!626600 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422260 () Bool)

(declare-fun res!957696 () Bool)

(assert (=> b!1422260 (=> (not res!957696) (not e!804065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422260 (= res!957696 (validKeyInArray!0 (select (arr!46867 a!2831) j!81)))))

(declare-fun b!1422261 () Bool)

(declare-fun res!957697 () Bool)

(assert (=> b!1422261 (=> (not res!957697) (not e!804062))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422261 (= res!957697 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422262 () Bool)

(declare-fun res!957703 () Bool)

(assert (=> b!1422262 (=> (not res!957703) (not e!804065))))

(assert (=> b!1422262 (= res!957703 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47417 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47417 a!2831))))))

(declare-fun b!1422263 () Bool)

(declare-fun res!957693 () Bool)

(assert (=> b!1422263 (=> (not res!957693) (not e!804065))))

(assert (=> b!1422263 (= res!957693 (validKeyInArray!0 (select (arr!46867 a!2831) i!982)))))

(declare-fun b!1422264 () Bool)

(assert (=> b!1422264 (= e!804060 true)))

(declare-fun lt!626597 () (_ BitVec 64))

(declare-fun lt!626596 () SeekEntryResult!11152)

(declare-fun lt!626595 () array!97099)

(assert (=> b!1422264 (= lt!626596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626601 lt!626597 lt!626595 mask!2608))))

(declare-fun b!1422265 () Bool)

(declare-fun res!957700 () Bool)

(assert (=> b!1422265 (=> (not res!957700) (not e!804065))))

(declare-datatypes ((List!33377 0))(
  ( (Nil!33374) (Cons!33373 (h!34675 (_ BitVec 64)) (t!48071 List!33377)) )
))
(declare-fun arrayNoDuplicates!0 (array!97099 (_ BitVec 32) List!33377) Bool)

(assert (=> b!1422265 (= res!957700 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33374))))

(declare-fun b!1422266 () Bool)

(declare-fun res!957695 () Bool)

(assert (=> b!1422266 (=> (not res!957695) (not e!804062))))

(declare-fun lt!626598 () SeekEntryResult!11152)

(assert (=> b!1422266 (= res!957695 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626597 lt!626595 mask!2608) lt!626598))))

(declare-fun b!1422267 () Bool)

(declare-fun res!957698 () Bool)

(assert (=> b!1422267 (=> (not res!957698) (not e!804065))))

(assert (=> b!1422267 (= res!957698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422268 () Bool)

(declare-fun e!804063 () Bool)

(assert (=> b!1422268 (= e!804063 e!804062)))

(declare-fun res!957689 () Bool)

(assert (=> b!1422268 (=> (not res!957689) (not e!804062))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422268 (= res!957689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626597 mask!2608) lt!626597 lt!626595 mask!2608) lt!626598))))

(assert (=> b!1422268 (= lt!626598 (Intermediate!11152 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422268 (= lt!626597 (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422268 (= lt!626595 (array!97100 (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47417 a!2831)))))

(declare-fun b!1422269 () Bool)

(declare-fun res!957699 () Bool)

(assert (=> b!1422269 (=> (not res!957699) (not e!804062))))

(assert (=> b!1422269 (= res!957699 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626599))))

(declare-fun b!1422270 () Bool)

(assert (=> b!1422270 (= e!804065 e!804063)))

(declare-fun res!957692 () Bool)

(assert (=> b!1422270 (=> (not res!957692) (not e!804063))))

(assert (=> b!1422270 (= res!957692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46867 a!2831) j!81) mask!2608) (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626599))))

(assert (=> b!1422270 (= lt!626599 (Intermediate!11152 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122734 res!957691) b!1422256))

(assert (= (and b!1422256 res!957702) b!1422263))

(assert (= (and b!1422263 res!957693) b!1422260))

(assert (= (and b!1422260 res!957696) b!1422267))

(assert (= (and b!1422267 res!957698) b!1422265))

(assert (= (and b!1422265 res!957700) b!1422262))

(assert (= (and b!1422262 res!957703) b!1422270))

(assert (= (and b!1422270 res!957692) b!1422268))

(assert (= (and b!1422268 res!957689) b!1422269))

(assert (= (and b!1422269 res!957699) b!1422266))

(assert (= (and b!1422266 res!957695) b!1422261))

(assert (= (and b!1422261 res!957697) b!1422259))

(assert (= (and b!1422259 res!957701) b!1422257))

(assert (= (and b!1422259 (not res!957690)) b!1422258))

(assert (= (and b!1422258 (not res!957694)) b!1422255))

(assert (= (and b!1422255 (not res!957688)) b!1422264))

(declare-fun m!1312803 () Bool)

(assert (=> b!1422267 m!1312803))

(declare-fun m!1312805 () Bool)

(assert (=> b!1422266 m!1312805))

(declare-fun m!1312807 () Bool)

(assert (=> b!1422255 m!1312807))

(assert (=> b!1422255 m!1312807))

(declare-fun m!1312809 () Bool)

(assert (=> b!1422255 m!1312809))

(declare-fun m!1312811 () Bool)

(assert (=> start!122734 m!1312811))

(declare-fun m!1312813 () Bool)

(assert (=> start!122734 m!1312813))

(declare-fun m!1312815 () Bool)

(assert (=> b!1422268 m!1312815))

(assert (=> b!1422268 m!1312815))

(declare-fun m!1312817 () Bool)

(assert (=> b!1422268 m!1312817))

(declare-fun m!1312819 () Bool)

(assert (=> b!1422268 m!1312819))

(declare-fun m!1312821 () Bool)

(assert (=> b!1422268 m!1312821))

(declare-fun m!1312823 () Bool)

(assert (=> b!1422265 m!1312823))

(assert (=> b!1422259 m!1312819))

(declare-fun m!1312825 () Bool)

(assert (=> b!1422259 m!1312825))

(declare-fun m!1312827 () Bool)

(assert (=> b!1422259 m!1312827))

(declare-fun m!1312829 () Bool)

(assert (=> b!1422259 m!1312829))

(assert (=> b!1422259 m!1312807))

(declare-fun m!1312831 () Bool)

(assert (=> b!1422259 m!1312831))

(assert (=> b!1422269 m!1312807))

(assert (=> b!1422269 m!1312807))

(declare-fun m!1312833 () Bool)

(assert (=> b!1422269 m!1312833))

(assert (=> b!1422270 m!1312807))

(assert (=> b!1422270 m!1312807))

(declare-fun m!1312835 () Bool)

(assert (=> b!1422270 m!1312835))

(assert (=> b!1422270 m!1312835))

(assert (=> b!1422270 m!1312807))

(declare-fun m!1312837 () Bool)

(assert (=> b!1422270 m!1312837))

(declare-fun m!1312839 () Bool)

(assert (=> b!1422258 m!1312839))

(assert (=> b!1422260 m!1312807))

(assert (=> b!1422260 m!1312807))

(declare-fun m!1312841 () Bool)

(assert (=> b!1422260 m!1312841))

(assert (=> b!1422257 m!1312807))

(assert (=> b!1422257 m!1312807))

(declare-fun m!1312843 () Bool)

(assert (=> b!1422257 m!1312843))

(declare-fun m!1312845 () Bool)

(assert (=> b!1422264 m!1312845))

(declare-fun m!1312847 () Bool)

(assert (=> b!1422263 m!1312847))

(assert (=> b!1422263 m!1312847))

(declare-fun m!1312849 () Bool)

(assert (=> b!1422263 m!1312849))

(push 1)

