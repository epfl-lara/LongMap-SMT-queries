; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130812 () Bool)

(assert start!130812)

(declare-fun b!1534133 () Bool)

(declare-fun res!1051221 () Bool)

(declare-fun e!854416 () Bool)

(assert (=> b!1534133 (=> (not res!1051221) (not e!854416))))

(declare-datatypes ((array!101910 0))(
  ( (array!101911 (arr!49171 (Array (_ BitVec 32) (_ BitVec 64))) (size!49721 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101910)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534133 (= res!1051221 (validKeyInArray!0 (select (arr!49171 a!2792) j!64)))))

(declare-fun b!1534134 () Bool)

(declare-fun res!1051225 () Bool)

(assert (=> b!1534134 (=> (not res!1051225) (not e!854416))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534134 (= res!1051225 (validKeyInArray!0 (select (arr!49171 a!2792) i!951)))))

(declare-fun res!1051220 () Bool)

(assert (=> start!130812 (=> (not res!1051220) (not e!854416))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130812 (= res!1051220 (validMask!0 mask!2480))))

(assert (=> start!130812 e!854416))

(assert (=> start!130812 true))

(declare-fun array_inv!38199 (array!101910) Bool)

(assert (=> start!130812 (array_inv!38199 a!2792)))

(declare-fun b!1534135 () Bool)

(declare-fun res!1051224 () Bool)

(assert (=> b!1534135 (=> (not res!1051224) (not e!854416))))

(assert (=> b!1534135 (= res!1051224 (and (= (size!49721 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49721 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49721 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534136 () Bool)

(declare-fun res!1051223 () Bool)

(assert (=> b!1534136 (=> (not res!1051223) (not e!854416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101910 (_ BitVec 32)) Bool)

(assert (=> b!1534136 (= res!1051223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534137 () Bool)

(declare-fun res!1051219 () Bool)

(assert (=> b!1534137 (=> (not res!1051219) (not e!854416))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534137 (= res!1051219 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49721 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49721 a!2792)) (= (select (arr!49171 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534138 () Bool)

(assert (=> b!1534138 (= e!854416 false)))

(declare-datatypes ((SeekEntryResult!13303 0))(
  ( (MissingZero!13303 (index!55607 (_ BitVec 32))) (Found!13303 (index!55608 (_ BitVec 32))) (Intermediate!13303 (undefined!14115 Bool) (index!55609 (_ BitVec 32)) (x!137369 (_ BitVec 32))) (Undefined!13303) (MissingVacant!13303 (index!55610 (_ BitVec 32))) )
))
(declare-fun lt!663838 () SeekEntryResult!13303)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101910 (_ BitVec 32)) SeekEntryResult!13303)

(assert (=> b!1534138 (= lt!663838 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49171 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534139 () Bool)

(declare-fun res!1051222 () Bool)

(assert (=> b!1534139 (=> (not res!1051222) (not e!854416))))

(declare-datatypes ((List!35645 0))(
  ( (Nil!35642) (Cons!35641 (h!37086 (_ BitVec 64)) (t!50339 List!35645)) )
))
(declare-fun arrayNoDuplicates!0 (array!101910 (_ BitVec 32) List!35645) Bool)

(assert (=> b!1534139 (= res!1051222 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35642))))

(assert (= (and start!130812 res!1051220) b!1534135))

(assert (= (and b!1534135 res!1051224) b!1534134))

(assert (= (and b!1534134 res!1051225) b!1534133))

(assert (= (and b!1534133 res!1051221) b!1534136))

(assert (= (and b!1534136 res!1051223) b!1534139))

(assert (= (and b!1534139 res!1051222) b!1534137))

(assert (= (and b!1534137 res!1051219) b!1534138))

(declare-fun m!1416805 () Bool)

(assert (=> b!1534133 m!1416805))

(assert (=> b!1534133 m!1416805))

(declare-fun m!1416807 () Bool)

(assert (=> b!1534133 m!1416807))

(declare-fun m!1416809 () Bool)

(assert (=> b!1534136 m!1416809))

(assert (=> b!1534138 m!1416805))

(assert (=> b!1534138 m!1416805))

(declare-fun m!1416811 () Bool)

(assert (=> b!1534138 m!1416811))

(declare-fun m!1416813 () Bool)

(assert (=> start!130812 m!1416813))

(declare-fun m!1416815 () Bool)

(assert (=> start!130812 m!1416815))

(declare-fun m!1416817 () Bool)

(assert (=> b!1534139 m!1416817))

(declare-fun m!1416819 () Bool)

(assert (=> b!1534134 m!1416819))

(assert (=> b!1534134 m!1416819))

(declare-fun m!1416821 () Bool)

(assert (=> b!1534134 m!1416821))

(declare-fun m!1416823 () Bool)

(assert (=> b!1534137 m!1416823))

(push 1)

(assert (not b!1534136))

(assert (not b!1534138))

(assert (not start!130812))

(assert (not b!1534134))

(assert (not b!1534133))

(assert (not b!1534139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

