; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130818 () Bool)

(assert start!130818)

(declare-fun res!1051285 () Bool)

(declare-fun e!854433 () Bool)

(assert (=> start!130818 (=> (not res!1051285) (not e!854433))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130818 (= res!1051285 (validMask!0 mask!2480))))

(assert (=> start!130818 e!854433))

(assert (=> start!130818 true))

(declare-datatypes ((array!101916 0))(
  ( (array!101917 (arr!49174 (Array (_ BitVec 32) (_ BitVec 64))) (size!49724 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101916)

(declare-fun array_inv!38202 (array!101916) Bool)

(assert (=> start!130818 (array_inv!38202 a!2792)))

(declare-fun b!1534196 () Bool)

(declare-fun res!1051283 () Bool)

(assert (=> b!1534196 (=> (not res!1051283) (not e!854433))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534196 (= res!1051283 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49724 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49724 a!2792)) (= (select (arr!49174 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534197 () Bool)

(declare-fun res!1051284 () Bool)

(assert (=> b!1534197 (=> (not res!1051284) (not e!854433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101916 (_ BitVec 32)) Bool)

(assert (=> b!1534197 (= res!1051284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534198 () Bool)

(declare-fun res!1051286 () Bool)

(assert (=> b!1534198 (=> (not res!1051286) (not e!854433))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534198 (= res!1051286 (validKeyInArray!0 (select (arr!49174 a!2792) j!64)))))

(declare-fun b!1534199 () Bool)

(declare-fun res!1051288 () Bool)

(assert (=> b!1534199 (=> (not res!1051288) (not e!854433))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534199 (= res!1051288 (validKeyInArray!0 (select (arr!49174 a!2792) i!951)))))

(declare-fun b!1534200 () Bool)

(declare-fun res!1051282 () Bool)

(assert (=> b!1534200 (=> (not res!1051282) (not e!854433))))

(assert (=> b!1534200 (= res!1051282 (and (= (size!49724 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49724 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49724 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534201 () Bool)

(assert (=> b!1534201 (= e!854433 false)))

(declare-datatypes ((SeekEntryResult!13306 0))(
  ( (MissingZero!13306 (index!55619 (_ BitVec 32))) (Found!13306 (index!55620 (_ BitVec 32))) (Intermediate!13306 (undefined!14118 Bool) (index!55621 (_ BitVec 32)) (x!137380 (_ BitVec 32))) (Undefined!13306) (MissingVacant!13306 (index!55622 (_ BitVec 32))) )
))
(declare-fun lt!663847 () SeekEntryResult!13306)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101916 (_ BitVec 32)) SeekEntryResult!13306)

(assert (=> b!1534201 (= lt!663847 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49174 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534202 () Bool)

(declare-fun res!1051287 () Bool)

(assert (=> b!1534202 (=> (not res!1051287) (not e!854433))))

(declare-datatypes ((List!35648 0))(
  ( (Nil!35645) (Cons!35644 (h!37089 (_ BitVec 64)) (t!50342 List!35648)) )
))
(declare-fun arrayNoDuplicates!0 (array!101916 (_ BitVec 32) List!35648) Bool)

(assert (=> b!1534202 (= res!1051287 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35645))))

(assert (= (and start!130818 res!1051285) b!1534200))

(assert (= (and b!1534200 res!1051282) b!1534199))

(assert (= (and b!1534199 res!1051288) b!1534198))

(assert (= (and b!1534198 res!1051286) b!1534197))

(assert (= (and b!1534197 res!1051284) b!1534202))

(assert (= (and b!1534202 res!1051287) b!1534196))

(assert (= (and b!1534196 res!1051283) b!1534201))

(declare-fun m!1416865 () Bool)

(assert (=> b!1534198 m!1416865))

(assert (=> b!1534198 m!1416865))

(declare-fun m!1416867 () Bool)

(assert (=> b!1534198 m!1416867))

(declare-fun m!1416869 () Bool)

(assert (=> b!1534202 m!1416869))

(assert (=> b!1534201 m!1416865))

(assert (=> b!1534201 m!1416865))

(declare-fun m!1416871 () Bool)

(assert (=> b!1534201 m!1416871))

(declare-fun m!1416873 () Bool)

(assert (=> b!1534196 m!1416873))

(declare-fun m!1416875 () Bool)

(assert (=> start!130818 m!1416875))

(declare-fun m!1416877 () Bool)

(assert (=> start!130818 m!1416877))

(declare-fun m!1416879 () Bool)

(assert (=> b!1534199 m!1416879))

(assert (=> b!1534199 m!1416879))

(declare-fun m!1416881 () Bool)

(assert (=> b!1534199 m!1416881))

(declare-fun m!1416883 () Bool)

(assert (=> b!1534197 m!1416883))

(push 1)

(assert (not b!1534199))

(assert (not b!1534201))

(assert (not b!1534197))

(assert (not b!1534202))

(assert (not start!130818))

(assert (not b!1534198))

(check-sat)

(pop 1)

(push 1)

