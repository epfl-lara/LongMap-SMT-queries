; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130734 () Bool)

(assert start!130734)

(declare-fun b!1533241 () Bool)

(declare-fun res!1050330 () Bool)

(declare-fun e!854182 () Bool)

(assert (=> b!1533241 (=> (not res!1050330) (not e!854182))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101832 0))(
  ( (array!101833 (arr!49132 (Array (_ BitVec 32) (_ BitVec 64))) (size!49682 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101832)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533241 (= res!1050330 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49682 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49682 a!2792)) (= (select (arr!49132 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533242 () Bool)

(declare-fun res!1050331 () Bool)

(assert (=> b!1533242 (=> (not res!1050331) (not e!854182))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101832 (_ BitVec 32)) Bool)

(assert (=> b!1533242 (= res!1050331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533243 () Bool)

(declare-fun res!1050334 () Bool)

(assert (=> b!1533243 (=> (not res!1050334) (not e!854182))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533243 (= res!1050334 (validKeyInArray!0 (select (arr!49132 a!2792) j!64)))))

(declare-fun b!1533244 () Bool)

(declare-fun res!1050329 () Bool)

(assert (=> b!1533244 (=> (not res!1050329) (not e!854182))))

(declare-datatypes ((SeekEntryResult!13264 0))(
  ( (MissingZero!13264 (index!55451 (_ BitVec 32))) (Found!13264 (index!55452 (_ BitVec 32))) (Intermediate!13264 (undefined!14076 Bool) (index!55453 (_ BitVec 32)) (x!137226 (_ BitVec 32))) (Undefined!13264) (MissingVacant!13264 (index!55454 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101832 (_ BitVec 32)) SeekEntryResult!13264)

(assert (=> b!1533244 (= res!1050329 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49132 a!2792) j!64) a!2792 mask!2480) (Found!13264 j!64)))))

(declare-fun b!1533245 () Bool)

(declare-fun res!1050332 () Bool)

(assert (=> b!1533245 (=> (not res!1050332) (not e!854182))))

(declare-datatypes ((List!35606 0))(
  ( (Nil!35603) (Cons!35602 (h!37047 (_ BitVec 64)) (t!50300 List!35606)) )
))
(declare-fun arrayNoDuplicates!0 (array!101832 (_ BitVec 32) List!35606) Bool)

(assert (=> b!1533245 (= res!1050332 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35603))))

(declare-fun b!1533246 () Bool)

(declare-fun res!1050327 () Bool)

(assert (=> b!1533246 (=> (not res!1050327) (not e!854182))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533246 (= res!1050327 (and (= (size!49682 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49682 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49682 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050333 () Bool)

(assert (=> start!130734 (=> (not res!1050333) (not e!854182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130734 (= res!1050333 (validMask!0 mask!2480))))

(assert (=> start!130734 e!854182))

(assert (=> start!130734 true))

(declare-fun array_inv!38160 (array!101832) Bool)

(assert (=> start!130734 (array_inv!38160 a!2792)))

(declare-fun b!1533247 () Bool)

(assert (=> b!1533247 (= e!854182 (and (= (select (arr!49132 a!2792) index!463) (select (arr!49132 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533248 () Bool)

(declare-fun res!1050328 () Bool)

(assert (=> b!1533248 (=> (not res!1050328) (not e!854182))))

(assert (=> b!1533248 (= res!1050328 (validKeyInArray!0 (select (arr!49132 a!2792) i!951)))))

(assert (= (and start!130734 res!1050333) b!1533246))

(assert (= (and b!1533246 res!1050327) b!1533248))

(assert (= (and b!1533248 res!1050328) b!1533243))

(assert (= (and b!1533243 res!1050334) b!1533242))

(assert (= (and b!1533242 res!1050331) b!1533245))

(assert (= (and b!1533245 res!1050332) b!1533241))

(assert (= (and b!1533241 res!1050330) b!1533244))

(assert (= (and b!1533244 res!1050329) b!1533247))

(declare-fun m!1415945 () Bool)

(assert (=> b!1533248 m!1415945))

(assert (=> b!1533248 m!1415945))

(declare-fun m!1415947 () Bool)

(assert (=> b!1533248 m!1415947))

(declare-fun m!1415949 () Bool)

(assert (=> b!1533247 m!1415949))

(declare-fun m!1415951 () Bool)

(assert (=> b!1533247 m!1415951))

(assert (=> b!1533243 m!1415951))

(assert (=> b!1533243 m!1415951))

(declare-fun m!1415953 () Bool)

(assert (=> b!1533243 m!1415953))

(declare-fun m!1415955 () Bool)

(assert (=> start!130734 m!1415955))

(declare-fun m!1415957 () Bool)

(assert (=> start!130734 m!1415957))

(declare-fun m!1415959 () Bool)

(assert (=> b!1533242 m!1415959))

(declare-fun m!1415961 () Bool)

(assert (=> b!1533241 m!1415961))

(assert (=> b!1533244 m!1415951))

(assert (=> b!1533244 m!1415951))

(declare-fun m!1415963 () Bool)

(assert (=> b!1533244 m!1415963))

(declare-fun m!1415965 () Bool)

(assert (=> b!1533245 m!1415965))

(push 1)

(assert (not start!130734))

(assert (not b!1533243))

(assert (not b!1533248))

(assert (not b!1533242))

(assert (not b!1533245))

(assert (not b!1533244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

