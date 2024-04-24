; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131712 () Bool)

(assert start!131712)

(declare-fun b!1542093 () Bool)

(declare-fun res!1057317 () Bool)

(declare-fun e!857896 () Bool)

(assert (=> b!1542093 (=> (not res!1057317) (not e!857896))))

(declare-datatypes ((array!102406 0))(
  ( (array!102407 (arr!49407 (Array (_ BitVec 32) (_ BitVec 64))) (size!49958 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102406)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13428 0))(
  ( (MissingZero!13428 (index!56107 (_ BitVec 32))) (Found!13428 (index!56108 (_ BitVec 32))) (Intermediate!13428 (undefined!14240 Bool) (index!56109 (_ BitVec 32)) (x!138046 (_ BitVec 32))) (Undefined!13428) (MissingVacant!13428 (index!56110 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102406 (_ BitVec 32)) SeekEntryResult!13428)

(assert (=> b!1542093 (= res!1057317 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49407 a!2792) j!64) a!2792 mask!2480) (Found!13428 j!64)))))

(declare-fun b!1542094 () Bool)

(declare-fun res!1057321 () Bool)

(assert (=> b!1542094 (=> (not res!1057321) (not e!857896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542094 (= res!1057321 (validKeyInArray!0 (select (arr!49407 a!2792) j!64)))))

(declare-fun res!1057323 () Bool)

(assert (=> start!131712 (=> (not res!1057323) (not e!857896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131712 (= res!1057323 (validMask!0 mask!2480))))

(assert (=> start!131712 e!857896))

(assert (=> start!131712 true))

(declare-fun array_inv!38688 (array!102406) Bool)

(assert (=> start!131712 (array_inv!38688 a!2792)))

(declare-fun b!1542095 () Bool)

(assert (=> b!1542095 (= e!857896 false)))

(declare-fun lt!666021 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542095 (= lt!666021 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542096 () Bool)

(declare-fun res!1057322 () Bool)

(assert (=> b!1542096 (=> (not res!1057322) (not e!857896))))

(assert (=> b!1542096 (= res!1057322 (not (= (select (arr!49407 a!2792) index!463) (select (arr!49407 a!2792) j!64))))))

(declare-fun b!1542097 () Bool)

(declare-fun res!1057320 () Bool)

(assert (=> b!1542097 (=> (not res!1057320) (not e!857896))))

(declare-datatypes ((List!35868 0))(
  ( (Nil!35865) (Cons!35864 (h!37327 (_ BitVec 64)) (t!50554 List!35868)) )
))
(declare-fun arrayNoDuplicates!0 (array!102406 (_ BitVec 32) List!35868) Bool)

(assert (=> b!1542097 (= res!1057320 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35865))))

(declare-fun b!1542098 () Bool)

(declare-fun res!1057315 () Bool)

(assert (=> b!1542098 (=> (not res!1057315) (not e!857896))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542098 (= res!1057315 (validKeyInArray!0 (select (arr!49407 a!2792) i!951)))))

(declare-fun b!1542099 () Bool)

(declare-fun res!1057319 () Bool)

(assert (=> b!1542099 (=> (not res!1057319) (not e!857896))))

(assert (=> b!1542099 (= res!1057319 (and (= (size!49958 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49958 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49958 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542100 () Bool)

(declare-fun res!1057318 () Bool)

(assert (=> b!1542100 (=> (not res!1057318) (not e!857896))))

(assert (=> b!1542100 (= res!1057318 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49958 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49958 a!2792)) (= (select (arr!49407 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542101 () Bool)

(declare-fun res!1057316 () Bool)

(assert (=> b!1542101 (=> (not res!1057316) (not e!857896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102406 (_ BitVec 32)) Bool)

(assert (=> b!1542101 (= res!1057316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131712 res!1057323) b!1542099))

(assert (= (and b!1542099 res!1057319) b!1542098))

(assert (= (and b!1542098 res!1057315) b!1542094))

(assert (= (and b!1542094 res!1057321) b!1542101))

(assert (= (and b!1542101 res!1057316) b!1542097))

(assert (= (and b!1542097 res!1057320) b!1542100))

(assert (= (and b!1542100 res!1057318) b!1542093))

(assert (= (and b!1542093 res!1057317) b!1542096))

(assert (= (and b!1542096 res!1057322) b!1542095))

(declare-fun m!1424105 () Bool)

(assert (=> b!1542095 m!1424105))

(declare-fun m!1424107 () Bool)

(assert (=> b!1542096 m!1424107))

(declare-fun m!1424109 () Bool)

(assert (=> b!1542096 m!1424109))

(declare-fun m!1424111 () Bool)

(assert (=> b!1542100 m!1424111))

(declare-fun m!1424113 () Bool)

(assert (=> b!1542101 m!1424113))

(declare-fun m!1424115 () Bool)

(assert (=> b!1542098 m!1424115))

(assert (=> b!1542098 m!1424115))

(declare-fun m!1424117 () Bool)

(assert (=> b!1542098 m!1424117))

(declare-fun m!1424119 () Bool)

(assert (=> b!1542097 m!1424119))

(declare-fun m!1424121 () Bool)

(assert (=> start!131712 m!1424121))

(declare-fun m!1424123 () Bool)

(assert (=> start!131712 m!1424123))

(assert (=> b!1542093 m!1424109))

(assert (=> b!1542093 m!1424109))

(declare-fun m!1424125 () Bool)

(assert (=> b!1542093 m!1424125))

(assert (=> b!1542094 m!1424109))

(assert (=> b!1542094 m!1424109))

(declare-fun m!1424127 () Bool)

(assert (=> b!1542094 m!1424127))

(push 1)

(assert (not b!1542098))

(assert (not b!1542097))

(assert (not b!1542101))

(assert (not start!131712))

(assert (not b!1542093))

(assert (not b!1542094))

(assert (not b!1542095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

