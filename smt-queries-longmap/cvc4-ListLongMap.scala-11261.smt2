; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131364 () Bool)

(assert start!131364)

(declare-fun res!1056873 () Bool)

(declare-fun e!856617 () Bool)

(assert (=> start!131364 (=> (not res!1056873) (not e!856617))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131364 (= res!1056873 (validMask!0 mask!2480))))

(assert (=> start!131364 e!856617))

(assert (=> start!131364 true))

(declare-datatypes ((array!102312 0))(
  ( (array!102313 (arr!49366 (Array (_ BitVec 32) (_ BitVec 64))) (size!49916 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102312)

(declare-fun array_inv!38394 (array!102312) Bool)

(assert (=> start!131364 (array_inv!38394 a!2792)))

(declare-fun b!1540177 () Bool)

(declare-fun res!1056872 () Bool)

(assert (=> b!1540177 (=> (not res!1056872) (not e!856617))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540177 (= res!1056872 (validKeyInArray!0 (select (arr!49366 a!2792) i!951)))))

(declare-fun b!1540178 () Bool)

(declare-fun e!856618 () Bool)

(declare-fun e!856619 () Bool)

(assert (=> b!1540178 (= e!856618 e!856619)))

(declare-fun res!1056877 () Bool)

(assert (=> b!1540178 (=> (not res!1056877) (not e!856619))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665254 () (_ BitVec 32))

(assert (=> b!1540178 (= res!1056877 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665254 #b00000000000000000000000000000000) (bvslt lt!665254 (size!49916 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540178 (= lt!665254 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540179 () Bool)

(declare-fun e!856620 () Bool)

(assert (=> b!1540179 (= e!856620 (not true))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13492 0))(
  ( (MissingZero!13492 (index!56363 (_ BitVec 32))) (Found!13492 (index!56364 (_ BitVec 32))) (Intermediate!13492 (undefined!14304 Bool) (index!56365 (_ BitVec 32)) (x!138099 (_ BitVec 32))) (Undefined!13492) (MissingVacant!13492 (index!56366 (_ BitVec 32))) )
))
(declare-fun lt!665251 () SeekEntryResult!13492)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102312 (_ BitVec 32)) SeekEntryResult!13492)

(assert (=> b!1540179 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665254 vacantIndex!5 (select (store (arr!49366 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102313 (store (arr!49366 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49916 a!2792)) mask!2480) lt!665251)))

(declare-datatypes ((Unit!51424 0))(
  ( (Unit!51425) )
))
(declare-fun lt!665252 () Unit!51424)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51424)

(assert (=> b!1540179 (= lt!665252 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665254 vacantIndex!5 mask!2480))))

(declare-fun b!1540180 () Bool)

(declare-fun res!1056874 () Bool)

(assert (=> b!1540180 (=> (not res!1056874) (not e!856617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102312 (_ BitVec 32)) Bool)

(assert (=> b!1540180 (= res!1056874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540181 () Bool)

(assert (=> b!1540181 (= e!856619 e!856620)))

(declare-fun res!1056868 () Bool)

(assert (=> b!1540181 (=> (not res!1056868) (not e!856620))))

(declare-fun lt!665253 () SeekEntryResult!13492)

(assert (=> b!1540181 (= res!1056868 (= lt!665251 lt!665253))))

(assert (=> b!1540181 (= lt!665251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665254 vacantIndex!5 (select (arr!49366 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540182 () Bool)

(declare-fun res!1056869 () Bool)

(assert (=> b!1540182 (=> (not res!1056869) (not e!856617))))

(declare-datatypes ((List!35840 0))(
  ( (Nil!35837) (Cons!35836 (h!37281 (_ BitVec 64)) (t!50534 List!35840)) )
))
(declare-fun arrayNoDuplicates!0 (array!102312 (_ BitVec 32) List!35840) Bool)

(assert (=> b!1540182 (= res!1056869 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35837))))

(declare-fun b!1540183 () Bool)

(declare-fun res!1056870 () Bool)

(assert (=> b!1540183 (=> (not res!1056870) (not e!856617))))

(assert (=> b!1540183 (= res!1056870 (validKeyInArray!0 (select (arr!49366 a!2792) j!64)))))

(declare-fun b!1540184 () Bool)

(declare-fun res!1056876 () Bool)

(assert (=> b!1540184 (=> (not res!1056876) (not e!856617))))

(assert (=> b!1540184 (= res!1056876 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49916 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49916 a!2792)) (= (select (arr!49366 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540185 () Bool)

(declare-fun res!1056875 () Bool)

(assert (=> b!1540185 (=> (not res!1056875) (not e!856618))))

(assert (=> b!1540185 (= res!1056875 (not (= (select (arr!49366 a!2792) index!463) (select (arr!49366 a!2792) j!64))))))

(declare-fun b!1540186 () Bool)

(assert (=> b!1540186 (= e!856617 e!856618)))

(declare-fun res!1056867 () Bool)

(assert (=> b!1540186 (=> (not res!1056867) (not e!856618))))

(assert (=> b!1540186 (= res!1056867 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49366 a!2792) j!64) a!2792 mask!2480) lt!665253))))

(assert (=> b!1540186 (= lt!665253 (Found!13492 j!64))))

(declare-fun b!1540187 () Bool)

(declare-fun res!1056871 () Bool)

(assert (=> b!1540187 (=> (not res!1056871) (not e!856617))))

(assert (=> b!1540187 (= res!1056871 (and (= (size!49916 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49916 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49916 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131364 res!1056873) b!1540187))

(assert (= (and b!1540187 res!1056871) b!1540177))

(assert (= (and b!1540177 res!1056872) b!1540183))

(assert (= (and b!1540183 res!1056870) b!1540180))

(assert (= (and b!1540180 res!1056874) b!1540182))

(assert (= (and b!1540182 res!1056869) b!1540184))

(assert (= (and b!1540184 res!1056876) b!1540186))

(assert (= (and b!1540186 res!1056867) b!1540185))

(assert (= (and b!1540185 res!1056875) b!1540178))

(assert (= (and b!1540178 res!1056877) b!1540181))

(assert (= (and b!1540181 res!1056868) b!1540179))

(declare-fun m!1422281 () Bool)

(assert (=> b!1540182 m!1422281))

(declare-fun m!1422283 () Bool)

(assert (=> b!1540181 m!1422283))

(assert (=> b!1540181 m!1422283))

(declare-fun m!1422285 () Bool)

(assert (=> b!1540181 m!1422285))

(declare-fun m!1422287 () Bool)

(assert (=> b!1540177 m!1422287))

(assert (=> b!1540177 m!1422287))

(declare-fun m!1422289 () Bool)

(assert (=> b!1540177 m!1422289))

(declare-fun m!1422291 () Bool)

(assert (=> b!1540185 m!1422291))

(assert (=> b!1540185 m!1422283))

(declare-fun m!1422293 () Bool)

(assert (=> b!1540184 m!1422293))

(declare-fun m!1422295 () Bool)

(assert (=> b!1540178 m!1422295))

(assert (=> b!1540186 m!1422283))

(assert (=> b!1540186 m!1422283))

(declare-fun m!1422297 () Bool)

(assert (=> b!1540186 m!1422297))

(declare-fun m!1422299 () Bool)

(assert (=> b!1540180 m!1422299))

(declare-fun m!1422301 () Bool)

(assert (=> b!1540179 m!1422301))

(declare-fun m!1422303 () Bool)

(assert (=> b!1540179 m!1422303))

(assert (=> b!1540179 m!1422303))

(declare-fun m!1422305 () Bool)

(assert (=> b!1540179 m!1422305))

(declare-fun m!1422307 () Bool)

(assert (=> b!1540179 m!1422307))

(assert (=> b!1540183 m!1422283))

(assert (=> b!1540183 m!1422283))

(declare-fun m!1422309 () Bool)

(assert (=> b!1540183 m!1422309))

(declare-fun m!1422311 () Bool)

(assert (=> start!131364 m!1422311))

(declare-fun m!1422313 () Bool)

(assert (=> start!131364 m!1422313))

(push 1)

(assert (not b!1540182))

(assert (not start!131364))

