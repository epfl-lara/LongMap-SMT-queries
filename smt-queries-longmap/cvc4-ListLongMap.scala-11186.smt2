; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130700 () Bool)

(assert start!130700)

(declare-fun b!1533106 () Bool)

(declare-fun res!1050377 () Bool)

(declare-fun e!854031 () Bool)

(assert (=> b!1533106 (=> (not res!1050377) (not e!854031))))

(declare-datatypes ((array!101796 0))(
  ( (array!101797 (arr!49115 (Array (_ BitVec 32) (_ BitVec 64))) (size!49667 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101796)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101796 (_ BitVec 32)) Bool)

(assert (=> b!1533106 (= res!1050377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533107 () Bool)

(declare-fun res!1050380 () Bool)

(assert (=> b!1533107 (=> (not res!1050380) (not e!854031))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533107 (= res!1050380 (and (= (size!49667 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49667 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49667 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533108 () Bool)

(declare-fun res!1050378 () Bool)

(assert (=> b!1533108 (=> (not res!1050378) (not e!854031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533108 (= res!1050378 (validKeyInArray!0 (select (arr!49115 a!2792) i!951)))))

(declare-fun res!1050379 () Bool)

(assert (=> start!130700 (=> (not res!1050379) (not e!854031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130700 (= res!1050379 (validMask!0 mask!2480))))

(assert (=> start!130700 e!854031))

(assert (=> start!130700 true))

(declare-fun array_inv!38348 (array!101796) Bool)

(assert (=> start!130700 (array_inv!38348 a!2792)))

(declare-fun b!1533109 () Bool)

(assert (=> b!1533109 (= e!854031 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13272 0))(
  ( (MissingZero!13272 (index!55483 (_ BitVec 32))) (Found!13272 (index!55484 (_ BitVec 32))) (Intermediate!13272 (undefined!14084 Bool) (index!55485 (_ BitVec 32)) (x!137253 (_ BitVec 32))) (Undefined!13272) (MissingVacant!13272 (index!55486 (_ BitVec 32))) )
))
(declare-fun lt!663513 () SeekEntryResult!13272)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101796 (_ BitVec 32)) SeekEntryResult!13272)

(assert (=> b!1533109 (= lt!663513 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49115 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533110 () Bool)

(declare-fun res!1050382 () Bool)

(assert (=> b!1533110 (=> (not res!1050382) (not e!854031))))

(assert (=> b!1533110 (= res!1050382 (validKeyInArray!0 (select (arr!49115 a!2792) j!64)))))

(declare-fun b!1533111 () Bool)

(declare-fun res!1050381 () Bool)

(assert (=> b!1533111 (=> (not res!1050381) (not e!854031))))

(declare-datatypes ((List!35667 0))(
  ( (Nil!35664) (Cons!35663 (h!37109 (_ BitVec 64)) (t!50353 List!35667)) )
))
(declare-fun arrayNoDuplicates!0 (array!101796 (_ BitVec 32) List!35667) Bool)

(assert (=> b!1533111 (= res!1050381 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35664))))

(declare-fun b!1533112 () Bool)

(declare-fun res!1050376 () Bool)

(assert (=> b!1533112 (=> (not res!1050376) (not e!854031))))

(assert (=> b!1533112 (= res!1050376 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49667 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49667 a!2792)) (= (select (arr!49115 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130700 res!1050379) b!1533107))

(assert (= (and b!1533107 res!1050380) b!1533108))

(assert (= (and b!1533108 res!1050378) b!1533110))

(assert (= (and b!1533110 res!1050382) b!1533106))

(assert (= (and b!1533106 res!1050377) b!1533111))

(assert (= (and b!1533111 res!1050381) b!1533112))

(assert (= (and b!1533112 res!1050376) b!1533109))

(declare-fun m!1415221 () Bool)

(assert (=> b!1533108 m!1415221))

(assert (=> b!1533108 m!1415221))

(declare-fun m!1415223 () Bool)

(assert (=> b!1533108 m!1415223))

(declare-fun m!1415225 () Bool)

(assert (=> start!130700 m!1415225))

(declare-fun m!1415227 () Bool)

(assert (=> start!130700 m!1415227))

(declare-fun m!1415229 () Bool)

(assert (=> b!1533109 m!1415229))

(assert (=> b!1533109 m!1415229))

(declare-fun m!1415231 () Bool)

(assert (=> b!1533109 m!1415231))

(declare-fun m!1415233 () Bool)

(assert (=> b!1533112 m!1415233))

(declare-fun m!1415235 () Bool)

(assert (=> b!1533111 m!1415235))

(assert (=> b!1533110 m!1415229))

(assert (=> b!1533110 m!1415229))

(declare-fun m!1415237 () Bool)

(assert (=> b!1533110 m!1415237))

(declare-fun m!1415239 () Bool)

(assert (=> b!1533106 m!1415239))

(push 1)

(assert (not start!130700))

(assert (not b!1533109))

(assert (not b!1533110))

(assert (not b!1533111))

(assert (not b!1533108))

(assert (not b!1533106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

