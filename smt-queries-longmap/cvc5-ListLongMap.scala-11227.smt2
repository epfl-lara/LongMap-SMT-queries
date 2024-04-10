; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130994 () Bool)

(assert start!130994)

(declare-fun b!1536835 () Bool)

(declare-fun res!1053923 () Bool)

(declare-fun e!855363 () Bool)

(assert (=> b!1536835 (=> (not res!1053923) (not e!855363))))

(declare-datatypes ((array!102092 0))(
  ( (array!102093 (arr!49262 (Array (_ BitVec 32) (_ BitVec 64))) (size!49812 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102092)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536835 (= res!1053923 (validKeyInArray!0 (select (arr!49262 a!2792) i!951)))))

(declare-fun b!1536836 () Bool)

(declare-fun res!1053925 () Bool)

(assert (=> b!1536836 (=> (not res!1053925) (not e!855363))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102092 (_ BitVec 32)) Bool)

(assert (=> b!1536836 (= res!1053925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536837 () Bool)

(declare-fun res!1053929 () Bool)

(assert (=> b!1536837 (=> (not res!1053929) (not e!855363))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536837 (= res!1053929 (validKeyInArray!0 (select (arr!49262 a!2792) j!64)))))

(declare-fun b!1536838 () Bool)

(declare-fun e!855367 () Bool)

(assert (=> b!1536838 (= e!855363 e!855367)))

(declare-fun res!1053927 () Bool)

(assert (=> b!1536838 (=> (not res!1053927) (not e!855367))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13394 0))(
  ( (MissingZero!13394 (index!55971 (_ BitVec 32))) (Found!13394 (index!55972 (_ BitVec 32))) (Intermediate!13394 (undefined!14206 Bool) (index!55973 (_ BitVec 32)) (x!137708 (_ BitVec 32))) (Undefined!13394) (MissingVacant!13394 (index!55974 (_ BitVec 32))) )
))
(declare-fun lt!664495 () SeekEntryResult!13394)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102092 (_ BitVec 32)) SeekEntryResult!13394)

(assert (=> b!1536838 (= res!1053927 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49262 a!2792) j!64) a!2792 mask!2480) lt!664495))))

(assert (=> b!1536838 (= lt!664495 (Found!13394 j!64))))

(declare-fun res!1053922 () Bool)

(assert (=> start!130994 (=> (not res!1053922) (not e!855363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130994 (= res!1053922 (validMask!0 mask!2480))))

(assert (=> start!130994 e!855363))

(assert (=> start!130994 true))

(declare-fun array_inv!38290 (array!102092) Bool)

(assert (=> start!130994 (array_inv!38290 a!2792)))

(declare-fun b!1536839 () Bool)

(declare-fun res!1053928 () Bool)

(assert (=> b!1536839 (=> (not res!1053928) (not e!855363))))

(assert (=> b!1536839 (= res!1053928 (and (= (size!49812 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49812 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49812 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536840 () Bool)

(declare-fun res!1053921 () Bool)

(assert (=> b!1536840 (=> (not res!1053921) (not e!855363))))

(assert (=> b!1536840 (= res!1053921 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49812 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49812 a!2792)) (= (select (arr!49262 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536841 () Bool)

(declare-fun e!855366 () Bool)

(assert (=> b!1536841 (= e!855366 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(declare-fun lt!664497 () (_ BitVec 32))

(declare-fun lt!664496 () SeekEntryResult!13394)

(assert (=> b!1536841 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664497 vacantIndex!5 (select (store (arr!49262 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102093 (store (arr!49262 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49812 a!2792)) mask!2480) lt!664496)))

(declare-datatypes ((Unit!51360 0))(
  ( (Unit!51361) )
))
(declare-fun lt!664498 () Unit!51360)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51360)

(assert (=> b!1536841 (= lt!664498 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664497 vacantIndex!5 mask!2480))))

(declare-fun b!1536842 () Bool)

(declare-fun res!1053931 () Bool)

(assert (=> b!1536842 (=> (not res!1053931) (not e!855363))))

(declare-datatypes ((List!35736 0))(
  ( (Nil!35733) (Cons!35732 (h!37177 (_ BitVec 64)) (t!50430 List!35736)) )
))
(declare-fun arrayNoDuplicates!0 (array!102092 (_ BitVec 32) List!35736) Bool)

(assert (=> b!1536842 (= res!1053931 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35733))))

(declare-fun b!1536843 () Bool)

(declare-fun e!855365 () Bool)

(assert (=> b!1536843 (= e!855365 e!855366)))

(declare-fun res!1053930 () Bool)

(assert (=> b!1536843 (=> (not res!1053930) (not e!855366))))

(assert (=> b!1536843 (= res!1053930 (= lt!664496 lt!664495))))

(assert (=> b!1536843 (= lt!664496 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664497 vacantIndex!5 (select (arr!49262 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536844 () Bool)

(declare-fun res!1053926 () Bool)

(assert (=> b!1536844 (=> (not res!1053926) (not e!855367))))

(assert (=> b!1536844 (= res!1053926 (not (= (select (arr!49262 a!2792) index!463) (select (arr!49262 a!2792) j!64))))))

(declare-fun b!1536845 () Bool)

(assert (=> b!1536845 (= e!855367 e!855365)))

(declare-fun res!1053924 () Bool)

(assert (=> b!1536845 (=> (not res!1053924) (not e!855365))))

(assert (=> b!1536845 (= res!1053924 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664497 #b00000000000000000000000000000000) (bvslt lt!664497 (size!49812 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536845 (= lt!664497 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130994 res!1053922) b!1536839))

(assert (= (and b!1536839 res!1053928) b!1536835))

(assert (= (and b!1536835 res!1053923) b!1536837))

(assert (= (and b!1536837 res!1053929) b!1536836))

(assert (= (and b!1536836 res!1053925) b!1536842))

(assert (= (and b!1536842 res!1053931) b!1536840))

(assert (= (and b!1536840 res!1053921) b!1536838))

(assert (= (and b!1536838 res!1053927) b!1536844))

(assert (= (and b!1536844 res!1053926) b!1536845))

(assert (= (and b!1536845 res!1053924) b!1536843))

(assert (= (and b!1536843 res!1053930) b!1536841))

(declare-fun m!1419321 () Bool)

(assert (=> b!1536843 m!1419321))

(assert (=> b!1536843 m!1419321))

(declare-fun m!1419323 () Bool)

(assert (=> b!1536843 m!1419323))

(declare-fun m!1419325 () Bool)

(assert (=> start!130994 m!1419325))

(declare-fun m!1419327 () Bool)

(assert (=> start!130994 m!1419327))

(declare-fun m!1419329 () Bool)

(assert (=> b!1536842 m!1419329))

(declare-fun m!1419331 () Bool)

(assert (=> b!1536836 m!1419331))

(assert (=> b!1536837 m!1419321))

(assert (=> b!1536837 m!1419321))

(declare-fun m!1419333 () Bool)

(assert (=> b!1536837 m!1419333))

(assert (=> b!1536838 m!1419321))

(assert (=> b!1536838 m!1419321))

(declare-fun m!1419335 () Bool)

(assert (=> b!1536838 m!1419335))

(declare-fun m!1419337 () Bool)

(assert (=> b!1536840 m!1419337))

(declare-fun m!1419339 () Bool)

(assert (=> b!1536845 m!1419339))

(declare-fun m!1419341 () Bool)

(assert (=> b!1536844 m!1419341))

(assert (=> b!1536844 m!1419321))

(declare-fun m!1419343 () Bool)

(assert (=> b!1536835 m!1419343))

(assert (=> b!1536835 m!1419343))

(declare-fun m!1419345 () Bool)

(assert (=> b!1536835 m!1419345))

(declare-fun m!1419347 () Bool)

(assert (=> b!1536841 m!1419347))

(declare-fun m!1419349 () Bool)

(assert (=> b!1536841 m!1419349))

(assert (=> b!1536841 m!1419349))

(declare-fun m!1419351 () Bool)

(assert (=> b!1536841 m!1419351))

(declare-fun m!1419353 () Bool)

(assert (=> b!1536841 m!1419353))

(push 1)

