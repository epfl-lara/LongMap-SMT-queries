; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130724 () Bool)

(assert start!130724)

(declare-fun res!1050220 () Bool)

(declare-fun e!854151 () Bool)

(assert (=> start!130724 (=> (not res!1050220) (not e!854151))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130724 (= res!1050220 (validMask!0 mask!2480))))

(assert (=> start!130724 e!854151))

(assert (=> start!130724 true))

(declare-datatypes ((array!101822 0))(
  ( (array!101823 (arr!49127 (Array (_ BitVec 32) (_ BitVec 64))) (size!49677 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101822)

(declare-fun array_inv!38155 (array!101822) Bool)

(assert (=> start!130724 (array_inv!38155 a!2792)))

(declare-fun b!1533128 () Bool)

(declare-fun res!1050218 () Bool)

(assert (=> b!1533128 (=> (not res!1050218) (not e!854151))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533128 (= res!1050218 (validKeyInArray!0 (select (arr!49127 a!2792) j!64)))))

(declare-fun b!1533129 () Bool)

(declare-fun res!1050219 () Bool)

(assert (=> b!1533129 (=> (not res!1050219) (not e!854151))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533129 (= res!1050219 (and (= (size!49677 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49677 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49677 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533130 () Bool)

(declare-fun res!1050214 () Bool)

(assert (=> b!1533130 (=> (not res!1050214) (not e!854151))))

(declare-datatypes ((List!35601 0))(
  ( (Nil!35598) (Cons!35597 (h!37042 (_ BitVec 64)) (t!50295 List!35601)) )
))
(declare-fun arrayNoDuplicates!0 (array!101822 (_ BitVec 32) List!35601) Bool)

(assert (=> b!1533130 (= res!1050214 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35598))))

(declare-fun b!1533131 () Bool)

(declare-fun res!1050216 () Bool)

(assert (=> b!1533131 (=> (not res!1050216) (not e!854151))))

(assert (=> b!1533131 (= res!1050216 (validKeyInArray!0 (select (arr!49127 a!2792) i!951)))))

(declare-fun b!1533132 () Bool)

(assert (=> b!1533132 (= e!854151 false)))

(declare-datatypes ((SeekEntryResult!13259 0))(
  ( (MissingZero!13259 (index!55431 (_ BitVec 32))) (Found!13259 (index!55432 (_ BitVec 32))) (Intermediate!13259 (undefined!14071 Bool) (index!55433 (_ BitVec 32)) (x!137213 (_ BitVec 32))) (Undefined!13259) (MissingVacant!13259 (index!55434 (_ BitVec 32))) )
))
(declare-fun lt!663778 () SeekEntryResult!13259)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101822 (_ BitVec 32)) SeekEntryResult!13259)

(assert (=> b!1533132 (= lt!663778 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49127 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533133 () Bool)

(declare-fun res!1050217 () Bool)

(assert (=> b!1533133 (=> (not res!1050217) (not e!854151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101822 (_ BitVec 32)) Bool)

(assert (=> b!1533133 (= res!1050217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533134 () Bool)

(declare-fun res!1050215 () Bool)

(assert (=> b!1533134 (=> (not res!1050215) (not e!854151))))

(assert (=> b!1533134 (= res!1050215 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49677 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49677 a!2792)) (= (select (arr!49127 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130724 res!1050220) b!1533129))

(assert (= (and b!1533129 res!1050219) b!1533131))

(assert (= (and b!1533131 res!1050216) b!1533128))

(assert (= (and b!1533128 res!1050218) b!1533133))

(assert (= (and b!1533133 res!1050217) b!1533130))

(assert (= (and b!1533130 res!1050214) b!1533134))

(assert (= (and b!1533134 res!1050215) b!1533132))

(declare-fun m!1415841 () Bool)

(assert (=> start!130724 m!1415841))

(declare-fun m!1415843 () Bool)

(assert (=> start!130724 m!1415843))

(declare-fun m!1415845 () Bool)

(assert (=> b!1533131 m!1415845))

(assert (=> b!1533131 m!1415845))

(declare-fun m!1415847 () Bool)

(assert (=> b!1533131 m!1415847))

(declare-fun m!1415849 () Bool)

(assert (=> b!1533128 m!1415849))

(assert (=> b!1533128 m!1415849))

(declare-fun m!1415851 () Bool)

(assert (=> b!1533128 m!1415851))

(assert (=> b!1533132 m!1415849))

(assert (=> b!1533132 m!1415849))

(declare-fun m!1415853 () Bool)

(assert (=> b!1533132 m!1415853))

(declare-fun m!1415855 () Bool)

(assert (=> b!1533133 m!1415855))

(declare-fun m!1415857 () Bool)

(assert (=> b!1533134 m!1415857))

(declare-fun m!1415859 () Bool)

(assert (=> b!1533130 m!1415859))

(push 1)

(assert (not b!1533128))

(assert (not b!1533132))

(assert (not b!1533130))

(assert (not b!1533133))

(assert (not b!1533131))

(assert (not start!130724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

