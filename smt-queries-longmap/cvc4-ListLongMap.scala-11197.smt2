; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130766 () Bool)

(assert start!130766)

(declare-fun b!1533862 () Bool)

(declare-fun res!1051134 () Bool)

(declare-fun e!854230 () Bool)

(assert (=> b!1533862 (=> (not res!1051134) (not e!854230))))

(declare-datatypes ((array!101862 0))(
  ( (array!101863 (arr!49148 (Array (_ BitVec 32) (_ BitVec 64))) (size!49700 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101862)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533862 (= res!1051134 (validKeyInArray!0 (select (arr!49148 a!2792) i!951)))))

(declare-fun b!1533863 () Bool)

(declare-fun res!1051137 () Bool)

(assert (=> b!1533863 (=> (not res!1051137) (not e!854230))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533863 (= res!1051137 (validKeyInArray!0 (select (arr!49148 a!2792) j!64)))))

(declare-fun b!1533864 () Bool)

(declare-fun res!1051135 () Bool)

(assert (=> b!1533864 (=> (not res!1051135) (not e!854230))))

(declare-datatypes ((List!35700 0))(
  ( (Nil!35697) (Cons!35696 (h!37142 (_ BitVec 64)) (t!50386 List!35700)) )
))
(declare-fun arrayNoDuplicates!0 (array!101862 (_ BitVec 32) List!35700) Bool)

(assert (=> b!1533864 (= res!1051135 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35697))))

(declare-fun b!1533865 () Bool)

(declare-fun res!1051138 () Bool)

(assert (=> b!1533865 (=> (not res!1051138) (not e!854230))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533865 (= res!1051138 (and (= (size!49700 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49700 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49700 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533867 () Bool)

(declare-fun res!1051136 () Bool)

(assert (=> b!1533867 (=> (not res!1051136) (not e!854230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101862 (_ BitVec 32)) Bool)

(assert (=> b!1533867 (= res!1051136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533868 () Bool)

(declare-fun res!1051133 () Bool)

(assert (=> b!1533868 (=> (not res!1051133) (not e!854230))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533868 (= res!1051133 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49700 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49700 a!2792)) (= (select (arr!49148 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051132 () Bool)

(assert (=> start!130766 (=> (not res!1051132) (not e!854230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130766 (= res!1051132 (validMask!0 mask!2480))))

(assert (=> start!130766 e!854230))

(assert (=> start!130766 true))

(declare-fun array_inv!38381 (array!101862) Bool)

(assert (=> start!130766 (array_inv!38381 a!2792)))

(declare-fun b!1533866 () Bool)

(assert (=> b!1533866 (= e!854230 false)))

(declare-datatypes ((SeekEntryResult!13305 0))(
  ( (MissingZero!13305 (index!55615 (_ BitVec 32))) (Found!13305 (index!55616 (_ BitVec 32))) (Intermediate!13305 (undefined!14117 Bool) (index!55617 (_ BitVec 32)) (x!137374 (_ BitVec 32))) (Undefined!13305) (MissingVacant!13305 (index!55618 (_ BitVec 32))) )
))
(declare-fun lt!663558 () SeekEntryResult!13305)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101862 (_ BitVec 32)) SeekEntryResult!13305)

(assert (=> b!1533866 (= lt!663558 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49148 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130766 res!1051132) b!1533865))

(assert (= (and b!1533865 res!1051138) b!1533862))

(assert (= (and b!1533862 res!1051134) b!1533863))

(assert (= (and b!1533863 res!1051137) b!1533867))

(assert (= (and b!1533867 res!1051136) b!1533864))

(assert (= (and b!1533864 res!1051135) b!1533868))

(assert (= (and b!1533868 res!1051133) b!1533866))

(declare-fun m!1415953 () Bool)

(assert (=> b!1533868 m!1415953))

(declare-fun m!1415955 () Bool)

(assert (=> start!130766 m!1415955))

(declare-fun m!1415957 () Bool)

(assert (=> start!130766 m!1415957))

(declare-fun m!1415959 () Bool)

(assert (=> b!1533863 m!1415959))

(assert (=> b!1533863 m!1415959))

(declare-fun m!1415961 () Bool)

(assert (=> b!1533863 m!1415961))

(assert (=> b!1533866 m!1415959))

(assert (=> b!1533866 m!1415959))

(declare-fun m!1415963 () Bool)

(assert (=> b!1533866 m!1415963))

(declare-fun m!1415965 () Bool)

(assert (=> b!1533862 m!1415965))

(assert (=> b!1533862 m!1415965))

(declare-fun m!1415967 () Bool)

(assert (=> b!1533862 m!1415967))

(declare-fun m!1415969 () Bool)

(assert (=> b!1533867 m!1415969))

(declare-fun m!1415971 () Bool)

(assert (=> b!1533864 m!1415971))

(push 1)

(assert (not b!1533867))

(assert (not b!1533862))

(assert (not b!1533866))

(assert (not b!1533864))

(assert (not b!1533863))

(assert (not start!130766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

