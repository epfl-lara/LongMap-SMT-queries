; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130928 () Bool)

(assert start!130928)

(declare-fun b!1535754 () Bool)

(declare-fun e!854893 () Bool)

(declare-fun e!854891 () Bool)

(assert (=> b!1535754 (= e!854893 e!854891)))

(declare-fun res!1052848 () Bool)

(assert (=> b!1535754 (=> (not res!1052848) (not e!854891))))

(declare-datatypes ((array!102026 0))(
  ( (array!102027 (arr!49229 (Array (_ BitVec 32) (_ BitVec 64))) (size!49779 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102026)

(declare-fun lt!664122 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1535754 (= res!1052848 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664122 #b00000000000000000000000000000000) (bvslt lt!664122 (size!49779 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535754 (= lt!664122 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535755 () Bool)

(declare-fun res!1052843 () Bool)

(assert (=> b!1535755 (=> (not res!1052843) (not e!854893))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535755 (= res!1052843 (validKeyInArray!0 (select (arr!49229 a!2792) j!64)))))

(declare-fun b!1535756 () Bool)

(declare-fun res!1052844 () Bool)

(assert (=> b!1535756 (=> (not res!1052844) (not e!854893))))

(declare-datatypes ((List!35703 0))(
  ( (Nil!35700) (Cons!35699 (h!37144 (_ BitVec 64)) (t!50397 List!35703)) )
))
(declare-fun arrayNoDuplicates!0 (array!102026 (_ BitVec 32) List!35703) Bool)

(assert (=> b!1535756 (= res!1052844 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35700))))

(declare-fun b!1535757 () Bool)

(declare-fun res!1052839 () Bool)

(assert (=> b!1535757 (=> (not res!1052839) (not e!854893))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535757 (= res!1052839 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49779 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49779 a!2792)) (= (select (arr!49229 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535758 () Bool)

(declare-fun res!1052840 () Bool)

(assert (=> b!1535758 (=> (not res!1052840) (not e!854893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102026 (_ BitVec 32)) Bool)

(assert (=> b!1535758 (= res!1052840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535759 () Bool)

(declare-fun res!1052847 () Bool)

(assert (=> b!1535759 (=> (not res!1052847) (not e!854893))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535759 (= res!1052847 (validKeyInArray!0 (select (arr!49229 a!2792) i!951)))))

(declare-fun b!1535760 () Bool)

(declare-fun res!1052841 () Bool)

(assert (=> b!1535760 (=> (not res!1052841) (not e!854893))))

(assert (=> b!1535760 (= res!1052841 (and (= (size!49779 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49779 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49779 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535753 () Bool)

(declare-fun res!1052842 () Bool)

(assert (=> b!1535753 (=> (not res!1052842) (not e!854893))))

(assert (=> b!1535753 (= res!1052842 (not (= (select (arr!49229 a!2792) index!463) (select (arr!49229 a!2792) j!64))))))

(declare-fun res!1052845 () Bool)

(assert (=> start!130928 (=> (not res!1052845) (not e!854893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130928 (= res!1052845 (validMask!0 mask!2480))))

(assert (=> start!130928 e!854893))

(assert (=> start!130928 true))

(declare-fun array_inv!38257 (array!102026) Bool)

(assert (=> start!130928 (array_inv!38257 a!2792)))

(declare-fun b!1535761 () Bool)

(declare-fun res!1052846 () Bool)

(assert (=> b!1535761 (=> (not res!1052846) (not e!854893))))

(declare-datatypes ((SeekEntryResult!13361 0))(
  ( (MissingZero!13361 (index!55839 (_ BitVec 32))) (Found!13361 (index!55840 (_ BitVec 32))) (Intermediate!13361 (undefined!14173 Bool) (index!55841 (_ BitVec 32)) (x!137587 (_ BitVec 32))) (Undefined!13361) (MissingVacant!13361 (index!55842 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102026 (_ BitVec 32)) SeekEntryResult!13361)

(assert (=> b!1535761 (= res!1052846 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49229 a!2792) j!64) a!2792 mask!2480) (Found!13361 j!64)))))

(declare-fun b!1535762 () Bool)

(assert (=> b!1535762 (= e!854891 false)))

(declare-fun lt!664123 () SeekEntryResult!13361)

(assert (=> b!1535762 (= lt!664123 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664122 vacantIndex!5 (select (arr!49229 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130928 res!1052845) b!1535760))

(assert (= (and b!1535760 res!1052841) b!1535759))

(assert (= (and b!1535759 res!1052847) b!1535755))

(assert (= (and b!1535755 res!1052843) b!1535758))

(assert (= (and b!1535758 res!1052840) b!1535756))

(assert (= (and b!1535756 res!1052844) b!1535757))

(assert (= (and b!1535757 res!1052839) b!1535761))

(assert (= (and b!1535761 res!1052846) b!1535753))

(assert (= (and b!1535753 res!1052842) b!1535754))

(assert (= (and b!1535754 res!1052848) b!1535762))

(declare-fun m!1418229 () Bool)

(assert (=> b!1535761 m!1418229))

(assert (=> b!1535761 m!1418229))

(declare-fun m!1418231 () Bool)

(assert (=> b!1535761 m!1418231))

(assert (=> b!1535755 m!1418229))

(assert (=> b!1535755 m!1418229))

(declare-fun m!1418233 () Bool)

(assert (=> b!1535755 m!1418233))

(declare-fun m!1418235 () Bool)

(assert (=> b!1535759 m!1418235))

(assert (=> b!1535759 m!1418235))

(declare-fun m!1418237 () Bool)

(assert (=> b!1535759 m!1418237))

(declare-fun m!1418239 () Bool)

(assert (=> b!1535753 m!1418239))

(assert (=> b!1535753 m!1418229))

(declare-fun m!1418241 () Bool)

(assert (=> b!1535756 m!1418241))

(declare-fun m!1418243 () Bool)

(assert (=> b!1535757 m!1418243))

(declare-fun m!1418245 () Bool)

(assert (=> b!1535754 m!1418245))

(assert (=> b!1535762 m!1418229))

(assert (=> b!1535762 m!1418229))

(declare-fun m!1418247 () Bool)

(assert (=> b!1535762 m!1418247))

(declare-fun m!1418249 () Bool)

(assert (=> b!1535758 m!1418249))

(declare-fun m!1418251 () Bool)

(assert (=> start!130928 m!1418251))

(declare-fun m!1418253 () Bool)

(assert (=> start!130928 m!1418253))

(push 1)

