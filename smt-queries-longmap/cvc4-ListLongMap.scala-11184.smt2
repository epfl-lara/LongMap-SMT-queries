; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130740 () Bool)

(assert start!130740)

(declare-fun b!1533305 () Bool)

(declare-fun e!854199 () Bool)

(assert (=> b!1533305 (= e!854199 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101838 0))(
  ( (array!101839 (arr!49135 (Array (_ BitVec 32) (_ BitVec 64))) (size!49685 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101838)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13267 0))(
  ( (MissingZero!13267 (index!55463 (_ BitVec 32))) (Found!13267 (index!55464 (_ BitVec 32))) (Intermediate!13267 (undefined!14079 Bool) (index!55465 (_ BitVec 32)) (x!137237 (_ BitVec 32))) (Undefined!13267) (MissingVacant!13267 (index!55466 (_ BitVec 32))) )
))
(declare-fun lt!663793 () SeekEntryResult!13267)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101838 (_ BitVec 32)) SeekEntryResult!13267)

(assert (=> b!1533305 (= lt!663793 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49135 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1050395 () Bool)

(assert (=> start!130740 (=> (not res!1050395) (not e!854199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130740 (= res!1050395 (validMask!0 mask!2480))))

(assert (=> start!130740 e!854199))

(assert (=> start!130740 true))

(declare-fun array_inv!38163 (array!101838) Bool)

(assert (=> start!130740 (array_inv!38163 a!2792)))

(declare-fun b!1533306 () Bool)

(declare-fun res!1050392 () Bool)

(assert (=> b!1533306 (=> (not res!1050392) (not e!854199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101838 (_ BitVec 32)) Bool)

(assert (=> b!1533306 (= res!1050392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533307 () Bool)

(declare-fun res!1050394 () Bool)

(assert (=> b!1533307 (=> (not res!1050394) (not e!854199))))

(assert (=> b!1533307 (= res!1050394 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49685 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49685 a!2792)) (= (select (arr!49135 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533308 () Bool)

(declare-fun res!1050391 () Bool)

(assert (=> b!1533308 (=> (not res!1050391) (not e!854199))))

(declare-datatypes ((List!35609 0))(
  ( (Nil!35606) (Cons!35605 (h!37050 (_ BitVec 64)) (t!50303 List!35609)) )
))
(declare-fun arrayNoDuplicates!0 (array!101838 (_ BitVec 32) List!35609) Bool)

(assert (=> b!1533308 (= res!1050391 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35606))))

(declare-fun b!1533309 () Bool)

(declare-fun res!1050397 () Bool)

(assert (=> b!1533309 (=> (not res!1050397) (not e!854199))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533309 (= res!1050397 (validKeyInArray!0 (select (arr!49135 a!2792) i!951)))))

(declare-fun b!1533310 () Bool)

(declare-fun res!1050393 () Bool)

(assert (=> b!1533310 (=> (not res!1050393) (not e!854199))))

(assert (=> b!1533310 (= res!1050393 (and (= (size!49685 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49685 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49685 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533311 () Bool)

(declare-fun res!1050396 () Bool)

(assert (=> b!1533311 (=> (not res!1050396) (not e!854199))))

(assert (=> b!1533311 (= res!1050396 (validKeyInArray!0 (select (arr!49135 a!2792) j!64)))))

(assert (= (and start!130740 res!1050395) b!1533310))

(assert (= (and b!1533310 res!1050393) b!1533309))

(assert (= (and b!1533309 res!1050397) b!1533311))

(assert (= (and b!1533311 res!1050396) b!1533306))

(assert (= (and b!1533306 res!1050392) b!1533308))

(assert (= (and b!1533308 res!1050391) b!1533307))

(assert (= (and b!1533307 res!1050394) b!1533305))

(declare-fun m!1416007 () Bool)

(assert (=> b!1533307 m!1416007))

(declare-fun m!1416009 () Bool)

(assert (=> b!1533308 m!1416009))

(declare-fun m!1416011 () Bool)

(assert (=> b!1533305 m!1416011))

(assert (=> b!1533305 m!1416011))

(declare-fun m!1416013 () Bool)

(assert (=> b!1533305 m!1416013))

(declare-fun m!1416015 () Bool)

(assert (=> b!1533306 m!1416015))

(declare-fun m!1416017 () Bool)

(assert (=> b!1533309 m!1416017))

(assert (=> b!1533309 m!1416017))

(declare-fun m!1416019 () Bool)

(assert (=> b!1533309 m!1416019))

(declare-fun m!1416021 () Bool)

(assert (=> start!130740 m!1416021))

(declare-fun m!1416023 () Bool)

(assert (=> start!130740 m!1416023))

(assert (=> b!1533311 m!1416011))

(assert (=> b!1533311 m!1416011))

(declare-fun m!1416025 () Bool)

(assert (=> b!1533311 m!1416025))

(push 1)

(assert (not b!1533305))

(assert (not b!1533311))

(assert (not b!1533308))

(assert (not start!130740))

(assert (not b!1533309))

(assert (not b!1533306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

