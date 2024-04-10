; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130898 () Bool)

(assert start!130898)

(declare-fun b!1535303 () Bool)

(declare-fun e!854757 () Bool)

(declare-fun e!854756 () Bool)

(assert (=> b!1535303 (= e!854757 e!854756)))

(declare-fun res!1052396 () Bool)

(assert (=> b!1535303 (=> (not res!1052396) (not e!854756))))

(declare-fun lt!664033 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101996 0))(
  ( (array!101997 (arr!49214 (Array (_ BitVec 32) (_ BitVec 64))) (size!49764 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101996)

(assert (=> b!1535303 (= res!1052396 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664033 #b00000000000000000000000000000000) (bvslt lt!664033 (size!49764 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535303 (= lt!664033 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535304 () Bool)

(declare-fun res!1052394 () Bool)

(assert (=> b!1535304 (=> (not res!1052394) (not e!854757))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535304 (= res!1052394 (validKeyInArray!0 (select (arr!49214 a!2792) i!951)))))

(declare-fun b!1535305 () Bool)

(declare-fun res!1052398 () Bool)

(assert (=> b!1535305 (=> (not res!1052398) (not e!854757))))

(declare-datatypes ((List!35688 0))(
  ( (Nil!35685) (Cons!35684 (h!37129 (_ BitVec 64)) (t!50382 List!35688)) )
))
(declare-fun arrayNoDuplicates!0 (array!101996 (_ BitVec 32) List!35688) Bool)

(assert (=> b!1535305 (= res!1052398 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35685))))

(declare-fun b!1535306 () Bool)

(declare-fun res!1052391 () Bool)

(assert (=> b!1535306 (=> (not res!1052391) (not e!854757))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535306 (= res!1052391 (not (= (select (arr!49214 a!2792) index!463) (select (arr!49214 a!2792) j!64))))))

(declare-fun b!1535307 () Bool)

(declare-fun res!1052390 () Bool)

(assert (=> b!1535307 (=> (not res!1052390) (not e!854757))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535307 (= res!1052390 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49764 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49764 a!2792)) (= (select (arr!49214 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535308 () Bool)

(declare-fun res!1052389 () Bool)

(assert (=> b!1535308 (=> (not res!1052389) (not e!854757))))

(assert (=> b!1535308 (= res!1052389 (validKeyInArray!0 (select (arr!49214 a!2792) j!64)))))

(declare-fun res!1052397 () Bool)

(assert (=> start!130898 (=> (not res!1052397) (not e!854757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130898 (= res!1052397 (validMask!0 mask!2480))))

(assert (=> start!130898 e!854757))

(assert (=> start!130898 true))

(declare-fun array_inv!38242 (array!101996) Bool)

(assert (=> start!130898 (array_inv!38242 a!2792)))

(declare-fun b!1535309 () Bool)

(declare-fun res!1052392 () Bool)

(assert (=> b!1535309 (=> (not res!1052392) (not e!854757))))

(declare-datatypes ((SeekEntryResult!13346 0))(
  ( (MissingZero!13346 (index!55779 (_ BitVec 32))) (Found!13346 (index!55780 (_ BitVec 32))) (Intermediate!13346 (undefined!14158 Bool) (index!55781 (_ BitVec 32)) (x!137532 (_ BitVec 32))) (Undefined!13346) (MissingVacant!13346 (index!55782 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101996 (_ BitVec 32)) SeekEntryResult!13346)

(assert (=> b!1535309 (= res!1052392 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49214 a!2792) j!64) a!2792 mask!2480) (Found!13346 j!64)))))

(declare-fun b!1535310 () Bool)

(declare-fun res!1052395 () Bool)

(assert (=> b!1535310 (=> (not res!1052395) (not e!854757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101996 (_ BitVec 32)) Bool)

(assert (=> b!1535310 (= res!1052395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535311 () Bool)

(declare-fun res!1052393 () Bool)

(assert (=> b!1535311 (=> (not res!1052393) (not e!854757))))

(assert (=> b!1535311 (= res!1052393 (and (= (size!49764 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49764 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49764 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535312 () Bool)

(assert (=> b!1535312 (= e!854756 false)))

(declare-fun lt!664032 () SeekEntryResult!13346)

(assert (=> b!1535312 (= lt!664032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664033 vacantIndex!5 (select (arr!49214 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130898 res!1052397) b!1535311))

(assert (= (and b!1535311 res!1052393) b!1535304))

(assert (= (and b!1535304 res!1052394) b!1535308))

(assert (= (and b!1535308 res!1052389) b!1535310))

(assert (= (and b!1535310 res!1052395) b!1535305))

(assert (= (and b!1535305 res!1052398) b!1535307))

(assert (= (and b!1535307 res!1052390) b!1535309))

(assert (= (and b!1535309 res!1052392) b!1535306))

(assert (= (and b!1535306 res!1052391) b!1535303))

(assert (= (and b!1535303 res!1052396) b!1535312))

(declare-fun m!1417839 () Bool)

(assert (=> start!130898 m!1417839))

(declare-fun m!1417841 () Bool)

(assert (=> start!130898 m!1417841))

(declare-fun m!1417843 () Bool)

(assert (=> b!1535306 m!1417843))

(declare-fun m!1417845 () Bool)

(assert (=> b!1535306 m!1417845))

(declare-fun m!1417847 () Bool)

(assert (=> b!1535303 m!1417847))

(assert (=> b!1535309 m!1417845))

(assert (=> b!1535309 m!1417845))

(declare-fun m!1417849 () Bool)

(assert (=> b!1535309 m!1417849))

(assert (=> b!1535308 m!1417845))

(assert (=> b!1535308 m!1417845))

(declare-fun m!1417851 () Bool)

(assert (=> b!1535308 m!1417851))

(declare-fun m!1417853 () Bool)

(assert (=> b!1535305 m!1417853))

(assert (=> b!1535312 m!1417845))

(assert (=> b!1535312 m!1417845))

(declare-fun m!1417855 () Bool)

(assert (=> b!1535312 m!1417855))

(declare-fun m!1417857 () Bool)

(assert (=> b!1535310 m!1417857))

(declare-fun m!1417859 () Bool)

(assert (=> b!1535304 m!1417859))

(assert (=> b!1535304 m!1417859))

(declare-fun m!1417861 () Bool)

(assert (=> b!1535304 m!1417861))

(declare-fun m!1417863 () Bool)

(assert (=> b!1535307 m!1417863))

(push 1)

