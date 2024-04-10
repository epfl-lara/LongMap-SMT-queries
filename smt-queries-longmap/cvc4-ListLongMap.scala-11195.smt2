; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130806 () Bool)

(assert start!130806)

(declare-fun b!1534069 () Bool)

(declare-fun res!1051155 () Bool)

(declare-fun e!854398 () Bool)

(assert (=> b!1534069 (=> (not res!1051155) (not e!854398))))

(declare-datatypes ((array!101904 0))(
  ( (array!101905 (arr!49168 (Array (_ BitVec 32) (_ BitVec 64))) (size!49718 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101904)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1534069 (= res!1051155 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49718 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49718 a!2792)) (= (select (arr!49168 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1534070 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1534070 (= e!854398 (and (= (select (arr!49168 a!2792) index!463) (select (arr!49168 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534071 () Bool)

(declare-fun res!1051156 () Bool)

(assert (=> b!1534071 (=> (not res!1051156) (not e!854398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101904 (_ BitVec 32)) Bool)

(assert (=> b!1534071 (= res!1051156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534072 () Bool)

(declare-fun res!1051162 () Bool)

(assert (=> b!1534072 (=> (not res!1051162) (not e!854398))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534072 (= res!1051162 (and (= (size!49718 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49718 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49718 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534073 () Bool)

(declare-fun res!1051161 () Bool)

(assert (=> b!1534073 (=> (not res!1051161) (not e!854398))))

(declare-datatypes ((List!35642 0))(
  ( (Nil!35639) (Cons!35638 (h!37083 (_ BitVec 64)) (t!50336 List!35642)) )
))
(declare-fun arrayNoDuplicates!0 (array!101904 (_ BitVec 32) List!35642) Bool)

(assert (=> b!1534073 (= res!1051161 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35639))))

(declare-fun res!1051158 () Bool)

(assert (=> start!130806 (=> (not res!1051158) (not e!854398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130806 (= res!1051158 (validMask!0 mask!2480))))

(assert (=> start!130806 e!854398))

(assert (=> start!130806 true))

(declare-fun array_inv!38196 (array!101904) Bool)

(assert (=> start!130806 (array_inv!38196 a!2792)))

(declare-fun b!1534074 () Bool)

(declare-fun res!1051157 () Bool)

(assert (=> b!1534074 (=> (not res!1051157) (not e!854398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534074 (= res!1051157 (validKeyInArray!0 (select (arr!49168 a!2792) j!64)))))

(declare-fun b!1534075 () Bool)

(declare-fun res!1051160 () Bool)

(assert (=> b!1534075 (=> (not res!1051160) (not e!854398))))

(assert (=> b!1534075 (= res!1051160 (validKeyInArray!0 (select (arr!49168 a!2792) i!951)))))

(declare-fun b!1534076 () Bool)

(declare-fun res!1051159 () Bool)

(assert (=> b!1534076 (=> (not res!1051159) (not e!854398))))

(declare-datatypes ((SeekEntryResult!13300 0))(
  ( (MissingZero!13300 (index!55595 (_ BitVec 32))) (Found!13300 (index!55596 (_ BitVec 32))) (Intermediate!13300 (undefined!14112 Bool) (index!55597 (_ BitVec 32)) (x!137358 (_ BitVec 32))) (Undefined!13300) (MissingVacant!13300 (index!55598 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101904 (_ BitVec 32)) SeekEntryResult!13300)

(assert (=> b!1534076 (= res!1051159 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49168 a!2792) j!64) a!2792 mask!2480) (Found!13300 j!64)))))

(assert (= (and start!130806 res!1051158) b!1534072))

(assert (= (and b!1534072 res!1051162) b!1534075))

(assert (= (and b!1534075 res!1051160) b!1534074))

(assert (= (and b!1534074 res!1051157) b!1534071))

(assert (= (and b!1534071 res!1051156) b!1534073))

(assert (= (and b!1534073 res!1051161) b!1534069))

(assert (= (and b!1534069 res!1051155) b!1534076))

(assert (= (and b!1534076 res!1051159) b!1534070))

(declare-fun m!1416743 () Bool)

(assert (=> b!1534070 m!1416743))

(declare-fun m!1416745 () Bool)

(assert (=> b!1534070 m!1416745))

(declare-fun m!1416747 () Bool)

(assert (=> b!1534073 m!1416747))

(declare-fun m!1416749 () Bool)

(assert (=> b!1534071 m!1416749))

(declare-fun m!1416751 () Bool)

(assert (=> b!1534075 m!1416751))

(assert (=> b!1534075 m!1416751))

(declare-fun m!1416753 () Bool)

(assert (=> b!1534075 m!1416753))

(assert (=> b!1534074 m!1416745))

(assert (=> b!1534074 m!1416745))

(declare-fun m!1416755 () Bool)

(assert (=> b!1534074 m!1416755))

(declare-fun m!1416757 () Bool)

(assert (=> start!130806 m!1416757))

(declare-fun m!1416759 () Bool)

(assert (=> start!130806 m!1416759))

(assert (=> b!1534076 m!1416745))

(assert (=> b!1534076 m!1416745))

(declare-fun m!1416761 () Bool)

(assert (=> b!1534076 m!1416761))

(declare-fun m!1416763 () Bool)

(assert (=> b!1534069 m!1416763))

(push 1)

(assert (not start!130806))

(assert (not b!1534074))

(assert (not b!1534075))

(assert (not b!1534073))

(assert (not b!1534071))

(assert (not b!1534076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

