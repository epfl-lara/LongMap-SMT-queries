; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130992 () Bool)

(assert start!130992)

(declare-fun b!1536802 () Bool)

(declare-fun res!1053889 () Bool)

(declare-fun e!855350 () Bool)

(assert (=> b!1536802 (=> (not res!1053889) (not e!855350))))

(declare-datatypes ((array!102090 0))(
  ( (array!102091 (arr!49261 (Array (_ BitVec 32) (_ BitVec 64))) (size!49811 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102090)

(declare-datatypes ((List!35735 0))(
  ( (Nil!35732) (Cons!35731 (h!37176 (_ BitVec 64)) (t!50429 List!35735)) )
))
(declare-fun arrayNoDuplicates!0 (array!102090 (_ BitVec 32) List!35735) Bool)

(assert (=> b!1536802 (= res!1053889 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35732))))

(declare-fun b!1536803 () Bool)

(declare-fun res!1053895 () Bool)

(assert (=> b!1536803 (=> (not res!1053895) (not e!855350))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536803 (= res!1053895 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49811 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49811 a!2792)) (= (select (arr!49261 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1053898 () Bool)

(assert (=> start!130992 (=> (not res!1053898) (not e!855350))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130992 (= res!1053898 (validMask!0 mask!2480))))

(assert (=> start!130992 e!855350))

(assert (=> start!130992 true))

(declare-fun array_inv!38289 (array!102090) Bool)

(assert (=> start!130992 (array_inv!38289 a!2792)))

(declare-fun b!1536804 () Bool)

(declare-fun res!1053890 () Bool)

(declare-fun e!855349 () Bool)

(assert (=> b!1536804 (=> (not res!1053890) (not e!855349))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536804 (= res!1053890 (not (= (select (arr!49261 a!2792) index!463) (select (arr!49261 a!2792) j!64))))))

(declare-fun b!1536805 () Bool)

(declare-fun res!1053888 () Bool)

(assert (=> b!1536805 (=> (not res!1053888) (not e!855350))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536805 (= res!1053888 (and (= (size!49811 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49811 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49811 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536806 () Bool)

(declare-fun e!855351 () Bool)

(assert (=> b!1536806 (= e!855351 (not true))))

(declare-fun lt!664486 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13393 0))(
  ( (MissingZero!13393 (index!55967 (_ BitVec 32))) (Found!13393 (index!55968 (_ BitVec 32))) (Intermediate!13393 (undefined!14205 Bool) (index!55969 (_ BitVec 32)) (x!137699 (_ BitVec 32))) (Undefined!13393) (MissingVacant!13393 (index!55970 (_ BitVec 32))) )
))
(declare-fun lt!664484 () SeekEntryResult!13393)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102090 (_ BitVec 32)) SeekEntryResult!13393)

(assert (=> b!1536806 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664486 vacantIndex!5 (select (store (arr!49261 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102091 (store (arr!49261 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49811 a!2792)) mask!2480) lt!664484)))

(declare-datatypes ((Unit!51358 0))(
  ( (Unit!51359) )
))
(declare-fun lt!664483 () Unit!51358)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51358)

(assert (=> b!1536806 (= lt!664483 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664486 vacantIndex!5 mask!2480))))

(declare-fun b!1536807 () Bool)

(declare-fun res!1053897 () Bool)

(assert (=> b!1536807 (=> (not res!1053897) (not e!855350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536807 (= res!1053897 (validKeyInArray!0 (select (arr!49261 a!2792) i!951)))))

(declare-fun b!1536808 () Bool)

(declare-fun res!1053891 () Bool)

(assert (=> b!1536808 (=> (not res!1053891) (not e!855350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102090 (_ BitVec 32)) Bool)

(assert (=> b!1536808 (= res!1053891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536809 () Bool)

(declare-fun e!855348 () Bool)

(assert (=> b!1536809 (= e!855348 e!855351)))

(declare-fun res!1053892 () Bool)

(assert (=> b!1536809 (=> (not res!1053892) (not e!855351))))

(declare-fun lt!664485 () SeekEntryResult!13393)

(assert (=> b!1536809 (= res!1053892 (= lt!664484 lt!664485))))

(assert (=> b!1536809 (= lt!664484 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664486 vacantIndex!5 (select (arr!49261 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536810 () Bool)

(assert (=> b!1536810 (= e!855350 e!855349)))

(declare-fun res!1053893 () Bool)

(assert (=> b!1536810 (=> (not res!1053893) (not e!855349))))

(assert (=> b!1536810 (= res!1053893 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49261 a!2792) j!64) a!2792 mask!2480) lt!664485))))

(assert (=> b!1536810 (= lt!664485 (Found!13393 j!64))))

(declare-fun b!1536811 () Bool)

(assert (=> b!1536811 (= e!855349 e!855348)))

(declare-fun res!1053894 () Bool)

(assert (=> b!1536811 (=> (not res!1053894) (not e!855348))))

(assert (=> b!1536811 (= res!1053894 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664486 #b00000000000000000000000000000000) (bvslt lt!664486 (size!49811 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536811 (= lt!664486 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536812 () Bool)

(declare-fun res!1053896 () Bool)

(assert (=> b!1536812 (=> (not res!1053896) (not e!855350))))

(assert (=> b!1536812 (= res!1053896 (validKeyInArray!0 (select (arr!49261 a!2792) j!64)))))

(assert (= (and start!130992 res!1053898) b!1536805))

(assert (= (and b!1536805 res!1053888) b!1536807))

(assert (= (and b!1536807 res!1053897) b!1536812))

(assert (= (and b!1536812 res!1053896) b!1536808))

(assert (= (and b!1536808 res!1053891) b!1536802))

(assert (= (and b!1536802 res!1053889) b!1536803))

(assert (= (and b!1536803 res!1053895) b!1536810))

(assert (= (and b!1536810 res!1053893) b!1536804))

(assert (= (and b!1536804 res!1053890) b!1536811))

(assert (= (and b!1536811 res!1053894) b!1536809))

(assert (= (and b!1536809 res!1053892) b!1536806))

(declare-fun m!1419287 () Bool)

(assert (=> b!1536809 m!1419287))

(assert (=> b!1536809 m!1419287))

(declare-fun m!1419289 () Bool)

(assert (=> b!1536809 m!1419289))

(assert (=> b!1536810 m!1419287))

(assert (=> b!1536810 m!1419287))

(declare-fun m!1419291 () Bool)

(assert (=> b!1536810 m!1419291))

(assert (=> b!1536812 m!1419287))

(assert (=> b!1536812 m!1419287))

(declare-fun m!1419293 () Bool)

(assert (=> b!1536812 m!1419293))

(declare-fun m!1419295 () Bool)

(assert (=> b!1536811 m!1419295))

(declare-fun m!1419297 () Bool)

(assert (=> start!130992 m!1419297))

(declare-fun m!1419299 () Bool)

(assert (=> start!130992 m!1419299))

(declare-fun m!1419301 () Bool)

(assert (=> b!1536802 m!1419301))

(declare-fun m!1419303 () Bool)

(assert (=> b!1536808 m!1419303))

(declare-fun m!1419305 () Bool)

(assert (=> b!1536803 m!1419305))

(declare-fun m!1419307 () Bool)

(assert (=> b!1536804 m!1419307))

(assert (=> b!1536804 m!1419287))

(declare-fun m!1419309 () Bool)

(assert (=> b!1536806 m!1419309))

(declare-fun m!1419311 () Bool)

(assert (=> b!1536806 m!1419311))

(assert (=> b!1536806 m!1419311))

(declare-fun m!1419313 () Bool)

(assert (=> b!1536806 m!1419313))

(declare-fun m!1419315 () Bool)

(assert (=> b!1536806 m!1419315))

(declare-fun m!1419317 () Bool)

(assert (=> b!1536807 m!1419317))

(assert (=> b!1536807 m!1419317))

(declare-fun m!1419319 () Bool)

(assert (=> b!1536807 m!1419319))

(push 1)

