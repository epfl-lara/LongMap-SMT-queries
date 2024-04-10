; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130758 () Bool)

(assert start!130758)

(declare-fun b!1533511 () Bool)

(declare-fun res!1050601 () Bool)

(declare-fun e!854254 () Bool)

(assert (=> b!1533511 (=> (not res!1050601) (not e!854254))))

(declare-datatypes ((array!101856 0))(
  ( (array!101857 (arr!49144 (Array (_ BitVec 32) (_ BitVec 64))) (size!49694 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101856)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533511 (= res!1050601 (validKeyInArray!0 (select (arr!49144 a!2792) j!64)))))

(declare-fun b!1533513 () Bool)

(declare-fun res!1050603 () Bool)

(assert (=> b!1533513 (=> (not res!1050603) (not e!854254))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533513 (= res!1050603 (and (= (size!49694 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49694 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49694 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533514 () Bool)

(declare-fun res!1050599 () Bool)

(assert (=> b!1533514 (=> (not res!1050599) (not e!854254))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13276 0))(
  ( (MissingZero!13276 (index!55499 (_ BitVec 32))) (Found!13276 (index!55500 (_ BitVec 32))) (Intermediate!13276 (undefined!14088 Bool) (index!55501 (_ BitVec 32)) (x!137270 (_ BitVec 32))) (Undefined!13276) (MissingVacant!13276 (index!55502 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101856 (_ BitVec 32)) SeekEntryResult!13276)

(assert (=> b!1533514 (= res!1050599 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49144 a!2792) j!64) a!2792 mask!2480) (Found!13276 j!64)))))

(declare-fun b!1533515 () Bool)

(declare-fun res!1050602 () Bool)

(assert (=> b!1533515 (=> (not res!1050602) (not e!854254))))

(declare-datatypes ((List!35618 0))(
  ( (Nil!35615) (Cons!35614 (h!37059 (_ BitVec 64)) (t!50312 List!35618)) )
))
(declare-fun arrayNoDuplicates!0 (array!101856 (_ BitVec 32) List!35618) Bool)

(assert (=> b!1533515 (= res!1050602 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35615))))

(declare-fun b!1533516 () Bool)

(declare-fun res!1050600 () Bool)

(assert (=> b!1533516 (=> (not res!1050600) (not e!854254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101856 (_ BitVec 32)) Bool)

(assert (=> b!1533516 (= res!1050600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533517 () Bool)

(declare-fun res!1050604 () Bool)

(assert (=> b!1533517 (=> (not res!1050604) (not e!854254))))

(assert (=> b!1533517 (= res!1050604 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49694 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49694 a!2792)) (= (select (arr!49144 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533518 () Bool)

(declare-fun res!1050597 () Bool)

(assert (=> b!1533518 (=> (not res!1050597) (not e!854254))))

(assert (=> b!1533518 (= res!1050597 (validKeyInArray!0 (select (arr!49144 a!2792) i!951)))))

(declare-fun b!1533512 () Bool)

(assert (=> b!1533512 (= e!854254 (and (= (select (arr!49144 a!2792) index!463) (select (arr!49144 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050598 () Bool)

(assert (=> start!130758 (=> (not res!1050598) (not e!854254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130758 (= res!1050598 (validMask!0 mask!2480))))

(assert (=> start!130758 e!854254))

(assert (=> start!130758 true))

(declare-fun array_inv!38172 (array!101856) Bool)

(assert (=> start!130758 (array_inv!38172 a!2792)))

(assert (= (and start!130758 res!1050598) b!1533513))

(assert (= (and b!1533513 res!1050603) b!1533518))

(assert (= (and b!1533518 res!1050597) b!1533511))

(assert (= (and b!1533511 res!1050601) b!1533516))

(assert (= (and b!1533516 res!1050600) b!1533515))

(assert (= (and b!1533515 res!1050602) b!1533517))

(assert (= (and b!1533517 res!1050604) b!1533514))

(assert (= (and b!1533514 res!1050599) b!1533512))

(declare-fun m!1416197 () Bool)

(assert (=> b!1533511 m!1416197))

(assert (=> b!1533511 m!1416197))

(declare-fun m!1416199 () Bool)

(assert (=> b!1533511 m!1416199))

(declare-fun m!1416201 () Bool)

(assert (=> b!1533515 m!1416201))

(declare-fun m!1416203 () Bool)

(assert (=> b!1533517 m!1416203))

(declare-fun m!1416205 () Bool)

(assert (=> b!1533518 m!1416205))

(assert (=> b!1533518 m!1416205))

(declare-fun m!1416207 () Bool)

(assert (=> b!1533518 m!1416207))

(assert (=> b!1533514 m!1416197))

(assert (=> b!1533514 m!1416197))

(declare-fun m!1416209 () Bool)

(assert (=> b!1533514 m!1416209))

(declare-fun m!1416211 () Bool)

(assert (=> b!1533516 m!1416211))

(declare-fun m!1416213 () Bool)

(assert (=> start!130758 m!1416213))

(declare-fun m!1416215 () Bool)

(assert (=> start!130758 m!1416215))

(declare-fun m!1416217 () Bool)

(assert (=> b!1533512 m!1416217))

(assert (=> b!1533512 m!1416197))

(push 1)

(assert (not b!1533516))

(assert (not start!130758))

(assert (not b!1533514))

(assert (not b!1533515))

(assert (not b!1533511))

(assert (not b!1533518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

