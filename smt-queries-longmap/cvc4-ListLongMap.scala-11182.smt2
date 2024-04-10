; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130728 () Bool)

(assert start!130728)

(declare-fun b!1533170 () Bool)

(declare-fun res!1050257 () Bool)

(declare-fun e!854163 () Bool)

(assert (=> b!1533170 (=> (not res!1050257) (not e!854163))))

(declare-datatypes ((array!101826 0))(
  ( (array!101827 (arr!49129 (Array (_ BitVec 32) (_ BitVec 64))) (size!49679 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101826)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101826 (_ BitVec 32)) Bool)

(assert (=> b!1533170 (= res!1050257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1050261 () Bool)

(assert (=> start!130728 (=> (not res!1050261) (not e!854163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130728 (= res!1050261 (validMask!0 mask!2480))))

(assert (=> start!130728 e!854163))

(assert (=> start!130728 true))

(declare-fun array_inv!38157 (array!101826) Bool)

(assert (=> start!130728 (array_inv!38157 a!2792)))

(declare-fun b!1533171 () Bool)

(declare-fun res!1050258 () Bool)

(assert (=> b!1533171 (=> (not res!1050258) (not e!854163))))

(declare-datatypes ((List!35603 0))(
  ( (Nil!35600) (Cons!35599 (h!37044 (_ BitVec 64)) (t!50297 List!35603)) )
))
(declare-fun arrayNoDuplicates!0 (array!101826 (_ BitVec 32) List!35603) Bool)

(assert (=> b!1533171 (= res!1050258 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35600))))

(declare-fun b!1533172 () Bool)

(assert (=> b!1533172 (= e!854163 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13261 0))(
  ( (MissingZero!13261 (index!55439 (_ BitVec 32))) (Found!13261 (index!55440 (_ BitVec 32))) (Intermediate!13261 (undefined!14073 Bool) (index!55441 (_ BitVec 32)) (x!137215 (_ BitVec 32))) (Undefined!13261) (MissingVacant!13261 (index!55442 (_ BitVec 32))) )
))
(declare-fun lt!663784 () SeekEntryResult!13261)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101826 (_ BitVec 32)) SeekEntryResult!13261)

(assert (=> b!1533172 (= lt!663784 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49129 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533173 () Bool)

(declare-fun res!1050262 () Bool)

(assert (=> b!1533173 (=> (not res!1050262) (not e!854163))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533173 (= res!1050262 (validKeyInArray!0 (select (arr!49129 a!2792) i!951)))))

(declare-fun b!1533174 () Bool)

(declare-fun res!1050256 () Bool)

(assert (=> b!1533174 (=> (not res!1050256) (not e!854163))))

(assert (=> b!1533174 (= res!1050256 (validKeyInArray!0 (select (arr!49129 a!2792) j!64)))))

(declare-fun b!1533175 () Bool)

(declare-fun res!1050260 () Bool)

(assert (=> b!1533175 (=> (not res!1050260) (not e!854163))))

(assert (=> b!1533175 (= res!1050260 (and (= (size!49679 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49679 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49679 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533176 () Bool)

(declare-fun res!1050259 () Bool)

(assert (=> b!1533176 (=> (not res!1050259) (not e!854163))))

(assert (=> b!1533176 (= res!1050259 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49679 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49679 a!2792)) (= (select (arr!49129 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130728 res!1050261) b!1533175))

(assert (= (and b!1533175 res!1050260) b!1533173))

(assert (= (and b!1533173 res!1050262) b!1533174))

(assert (= (and b!1533174 res!1050256) b!1533170))

(assert (= (and b!1533170 res!1050257) b!1533171))

(assert (= (and b!1533171 res!1050258) b!1533176))

(assert (= (and b!1533176 res!1050259) b!1533172))

(declare-fun m!1415881 () Bool)

(assert (=> b!1533173 m!1415881))

(assert (=> b!1533173 m!1415881))

(declare-fun m!1415883 () Bool)

(assert (=> b!1533173 m!1415883))

(declare-fun m!1415885 () Bool)

(assert (=> b!1533171 m!1415885))

(declare-fun m!1415887 () Bool)

(assert (=> b!1533170 m!1415887))

(declare-fun m!1415889 () Bool)

(assert (=> b!1533174 m!1415889))

(assert (=> b!1533174 m!1415889))

(declare-fun m!1415891 () Bool)

(assert (=> b!1533174 m!1415891))

(assert (=> b!1533172 m!1415889))

(assert (=> b!1533172 m!1415889))

(declare-fun m!1415893 () Bool)

(assert (=> b!1533172 m!1415893))

(declare-fun m!1415895 () Bool)

(assert (=> b!1533176 m!1415895))

(declare-fun m!1415897 () Bool)

(assert (=> start!130728 m!1415897))

(declare-fun m!1415899 () Bool)

(assert (=> start!130728 m!1415899))

(push 1)

(assert (not start!130728))

(assert (not b!1533174))

(assert (not b!1533171))

(assert (not b!1533173))

(assert (not b!1533170))

(assert (not b!1533172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

