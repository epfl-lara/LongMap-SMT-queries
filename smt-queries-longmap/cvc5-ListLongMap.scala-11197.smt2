; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130814 () Bool)

(assert start!130814)

(declare-fun b!1534154 () Bool)

(declare-fun res!1051241 () Bool)

(declare-fun e!854421 () Bool)

(assert (=> b!1534154 (=> (not res!1051241) (not e!854421))))

(declare-datatypes ((array!101912 0))(
  ( (array!101913 (arr!49172 (Array (_ BitVec 32) (_ BitVec 64))) (size!49722 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101912)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101912 (_ BitVec 32)) Bool)

(assert (=> b!1534154 (= res!1051241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534155 () Bool)

(declare-fun res!1051243 () Bool)

(assert (=> b!1534155 (=> (not res!1051243) (not e!854421))))

(declare-datatypes ((List!35646 0))(
  ( (Nil!35643) (Cons!35642 (h!37087 (_ BitVec 64)) (t!50340 List!35646)) )
))
(declare-fun arrayNoDuplicates!0 (array!101912 (_ BitVec 32) List!35646) Bool)

(assert (=> b!1534155 (= res!1051243 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35643))))

(declare-fun b!1534156 () Bool)

(declare-fun res!1051240 () Bool)

(assert (=> b!1534156 (=> (not res!1051240) (not e!854421))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534156 (= res!1051240 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49722 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49722 a!2792)) (= (select (arr!49172 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534157 () Bool)

(declare-fun res!1051246 () Bool)

(assert (=> b!1534157 (=> (not res!1051246) (not e!854421))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534157 (= res!1051246 (validKeyInArray!0 (select (arr!49172 a!2792) j!64)))))

(declare-fun b!1534158 () Bool)

(declare-fun res!1051245 () Bool)

(assert (=> b!1534158 (=> (not res!1051245) (not e!854421))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534158 (= res!1051245 (validKeyInArray!0 (select (arr!49172 a!2792) i!951)))))

(declare-fun b!1534159 () Bool)

(declare-fun res!1051242 () Bool)

(assert (=> b!1534159 (=> (not res!1051242) (not e!854421))))

(assert (=> b!1534159 (= res!1051242 (and (= (size!49722 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49722 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49722 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051244 () Bool)

(assert (=> start!130814 (=> (not res!1051244) (not e!854421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130814 (= res!1051244 (validMask!0 mask!2480))))

(assert (=> start!130814 e!854421))

(assert (=> start!130814 true))

(declare-fun array_inv!38200 (array!101912) Bool)

(assert (=> start!130814 (array_inv!38200 a!2792)))

(declare-fun b!1534160 () Bool)

(assert (=> b!1534160 (= e!854421 false)))

(declare-datatypes ((SeekEntryResult!13304 0))(
  ( (MissingZero!13304 (index!55611 (_ BitVec 32))) (Found!13304 (index!55612 (_ BitVec 32))) (Intermediate!13304 (undefined!14116 Bool) (index!55613 (_ BitVec 32)) (x!137378 (_ BitVec 32))) (Undefined!13304) (MissingVacant!13304 (index!55614 (_ BitVec 32))) )
))
(declare-fun lt!663841 () SeekEntryResult!13304)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101912 (_ BitVec 32)) SeekEntryResult!13304)

(assert (=> b!1534160 (= lt!663841 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49172 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130814 res!1051244) b!1534159))

(assert (= (and b!1534159 res!1051242) b!1534158))

(assert (= (and b!1534158 res!1051245) b!1534157))

(assert (= (and b!1534157 res!1051246) b!1534154))

(assert (= (and b!1534154 res!1051241) b!1534155))

(assert (= (and b!1534155 res!1051243) b!1534156))

(assert (= (and b!1534156 res!1051240) b!1534160))

(declare-fun m!1416825 () Bool)

(assert (=> b!1534155 m!1416825))

(declare-fun m!1416827 () Bool)

(assert (=> b!1534156 m!1416827))

(declare-fun m!1416829 () Bool)

(assert (=> b!1534160 m!1416829))

(assert (=> b!1534160 m!1416829))

(declare-fun m!1416831 () Bool)

(assert (=> b!1534160 m!1416831))

(declare-fun m!1416833 () Bool)

(assert (=> b!1534158 m!1416833))

(assert (=> b!1534158 m!1416833))

(declare-fun m!1416835 () Bool)

(assert (=> b!1534158 m!1416835))

(declare-fun m!1416837 () Bool)

(assert (=> b!1534154 m!1416837))

(declare-fun m!1416839 () Bool)

(assert (=> start!130814 m!1416839))

(declare-fun m!1416841 () Bool)

(assert (=> start!130814 m!1416841))

(assert (=> b!1534157 m!1416829))

(assert (=> b!1534157 m!1416829))

(declare-fun m!1416843 () Bool)

(assert (=> b!1534157 m!1416843))

(push 1)

(assert (not b!1534158))

(assert (not b!1534155))

(assert (not b!1534154))

(assert (not b!1534160))

(assert (not b!1534157))

(assert (not start!130814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

