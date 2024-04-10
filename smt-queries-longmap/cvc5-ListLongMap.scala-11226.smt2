; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130988 () Bool)

(assert start!130988)

(declare-fun b!1536736 () Bool)

(declare-fun res!1053825 () Bool)

(declare-fun e!855322 () Bool)

(assert (=> b!1536736 (=> (not res!1053825) (not e!855322))))

(declare-datatypes ((array!102086 0))(
  ( (array!102087 (arr!49259 (Array (_ BitVec 32) (_ BitVec 64))) (size!49809 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102086)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536736 (= res!1053825 (validKeyInArray!0 (select (arr!49259 a!2792) j!64)))))

(declare-fun b!1536737 () Bool)

(declare-fun e!855320 () Bool)

(assert (=> b!1536737 (= e!855322 e!855320)))

(declare-fun res!1053824 () Bool)

(assert (=> b!1536737 (=> (not res!1053824) (not e!855320))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13391 0))(
  ( (MissingZero!13391 (index!55959 (_ BitVec 32))) (Found!13391 (index!55960 (_ BitVec 32))) (Intermediate!13391 (undefined!14203 Bool) (index!55961 (_ BitVec 32)) (x!137697 (_ BitVec 32))) (Undefined!13391) (MissingVacant!13391 (index!55962 (_ BitVec 32))) )
))
(declare-fun lt!664460 () SeekEntryResult!13391)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102086 (_ BitVec 32)) SeekEntryResult!13391)

(assert (=> b!1536737 (= res!1053824 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49259 a!2792) j!64) a!2792 mask!2480) lt!664460))))

(assert (=> b!1536737 (= lt!664460 (Found!13391 j!64))))

(declare-fun b!1536738 () Bool)

(declare-fun e!855321 () Bool)

(declare-fun e!855318 () Bool)

(assert (=> b!1536738 (= e!855321 e!855318)))

(declare-fun res!1053832 () Bool)

(assert (=> b!1536738 (=> (not res!1053832) (not e!855318))))

(declare-fun lt!664459 () SeekEntryResult!13391)

(assert (=> b!1536738 (= res!1053832 (= lt!664459 lt!664460))))

(declare-fun lt!664461 () (_ BitVec 32))

(assert (=> b!1536738 (= lt!664459 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664461 vacantIndex!5 (select (arr!49259 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536739 () Bool)

(assert (=> b!1536739 (= e!855320 e!855321)))

(declare-fun res!1053829 () Bool)

(assert (=> b!1536739 (=> (not res!1053829) (not e!855321))))

(assert (=> b!1536739 (= res!1053829 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664461 #b00000000000000000000000000000000) (bvslt lt!664461 (size!49809 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536739 (= lt!664461 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536740 () Bool)

(declare-fun res!1053823 () Bool)

(assert (=> b!1536740 (=> (not res!1053823) (not e!855322))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536740 (= res!1053823 (validKeyInArray!0 (select (arr!49259 a!2792) i!951)))))

(declare-fun b!1536741 () Bool)

(declare-fun res!1053828 () Bool)

(assert (=> b!1536741 (=> (not res!1053828) (not e!855320))))

(assert (=> b!1536741 (= res!1053828 (not (= (select (arr!49259 a!2792) index!463) (select (arr!49259 a!2792) j!64))))))

(declare-fun res!1053830 () Bool)

(assert (=> start!130988 (=> (not res!1053830) (not e!855322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130988 (= res!1053830 (validMask!0 mask!2480))))

(assert (=> start!130988 e!855322))

(assert (=> start!130988 true))

(declare-fun array_inv!38287 (array!102086) Bool)

(assert (=> start!130988 (array_inv!38287 a!2792)))

(declare-fun b!1536742 () Bool)

(declare-fun res!1053822 () Bool)

(assert (=> b!1536742 (=> (not res!1053822) (not e!855322))))

(declare-datatypes ((List!35733 0))(
  ( (Nil!35730) (Cons!35729 (h!37174 (_ BitVec 64)) (t!50427 List!35733)) )
))
(declare-fun arrayNoDuplicates!0 (array!102086 (_ BitVec 32) List!35733) Bool)

(assert (=> b!1536742 (= res!1053822 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35730))))

(declare-fun b!1536743 () Bool)

(declare-fun res!1053827 () Bool)

(assert (=> b!1536743 (=> (not res!1053827) (not e!855322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102086 (_ BitVec 32)) Bool)

(assert (=> b!1536743 (= res!1053827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536744 () Bool)

(declare-fun res!1053826 () Bool)

(assert (=> b!1536744 (=> (not res!1053826) (not e!855322))))

(assert (=> b!1536744 (= res!1053826 (and (= (size!49809 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49809 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49809 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536745 () Bool)

(declare-fun res!1053831 () Bool)

(assert (=> b!1536745 (=> (not res!1053831) (not e!855322))))

(assert (=> b!1536745 (= res!1053831 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49809 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49809 a!2792)) (= (select (arr!49259 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536746 () Bool)

(assert (=> b!1536746 (= e!855318 (not true))))

(assert (=> b!1536746 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664461 vacantIndex!5 (select (store (arr!49259 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102087 (store (arr!49259 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49809 a!2792)) mask!2480) lt!664459)))

(declare-datatypes ((Unit!51354 0))(
  ( (Unit!51355) )
))
(declare-fun lt!664462 () Unit!51354)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51354)

(assert (=> b!1536746 (= lt!664462 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664461 vacantIndex!5 mask!2480))))

(assert (= (and start!130988 res!1053830) b!1536744))

(assert (= (and b!1536744 res!1053826) b!1536740))

(assert (= (and b!1536740 res!1053823) b!1536736))

(assert (= (and b!1536736 res!1053825) b!1536743))

(assert (= (and b!1536743 res!1053827) b!1536742))

(assert (= (and b!1536742 res!1053822) b!1536745))

(assert (= (and b!1536745 res!1053831) b!1536737))

(assert (= (and b!1536737 res!1053824) b!1536741))

(assert (= (and b!1536741 res!1053828) b!1536739))

(assert (= (and b!1536739 res!1053829) b!1536738))

(assert (= (and b!1536738 res!1053832) b!1536746))

(declare-fun m!1419219 () Bool)

(assert (=> b!1536745 m!1419219))

(declare-fun m!1419221 () Bool)

(assert (=> start!130988 m!1419221))

(declare-fun m!1419223 () Bool)

(assert (=> start!130988 m!1419223))

(declare-fun m!1419225 () Bool)

(assert (=> b!1536736 m!1419225))

(assert (=> b!1536736 m!1419225))

(declare-fun m!1419227 () Bool)

(assert (=> b!1536736 m!1419227))

(assert (=> b!1536738 m!1419225))

(assert (=> b!1536738 m!1419225))

(declare-fun m!1419229 () Bool)

(assert (=> b!1536738 m!1419229))

(declare-fun m!1419231 () Bool)

(assert (=> b!1536739 m!1419231))

(declare-fun m!1419233 () Bool)

(assert (=> b!1536742 m!1419233))

(declare-fun m!1419235 () Bool)

(assert (=> b!1536746 m!1419235))

(declare-fun m!1419237 () Bool)

(assert (=> b!1536746 m!1419237))

(assert (=> b!1536746 m!1419237))

(declare-fun m!1419239 () Bool)

(assert (=> b!1536746 m!1419239))

(declare-fun m!1419241 () Bool)

(assert (=> b!1536746 m!1419241))

(declare-fun m!1419243 () Bool)

(assert (=> b!1536743 m!1419243))

(declare-fun m!1419245 () Bool)

(assert (=> b!1536741 m!1419245))

(assert (=> b!1536741 m!1419225))

(declare-fun m!1419247 () Bool)

(assert (=> b!1536740 m!1419247))

(assert (=> b!1536740 m!1419247))

(declare-fun m!1419249 () Bool)

(assert (=> b!1536740 m!1419249))

(assert (=> b!1536737 m!1419225))

(assert (=> b!1536737 m!1419225))

(declare-fun m!1419251 () Bool)

(assert (=> b!1536737 m!1419251))

(push 1)

