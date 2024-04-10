; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130726 () Bool)

(assert start!130726)

(declare-fun b!1533149 () Bool)

(declare-fun res!1050240 () Bool)

(declare-fun e!854157 () Bool)

(assert (=> b!1533149 (=> (not res!1050240) (not e!854157))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101824 0))(
  ( (array!101825 (arr!49128 (Array (_ BitVec 32) (_ BitVec 64))) (size!49678 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101824)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533149 (= res!1050240 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49678 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49678 a!2792)) (= (select (arr!49128 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533150 () Bool)

(declare-fun res!1050237 () Bool)

(assert (=> b!1533150 (=> (not res!1050237) (not e!854157))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533150 (= res!1050237 (and (= (size!49678 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49678 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49678 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533151 () Bool)

(declare-fun res!1050236 () Bool)

(assert (=> b!1533151 (=> (not res!1050236) (not e!854157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101824 (_ BitVec 32)) Bool)

(assert (=> b!1533151 (= res!1050236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533152 () Bool)

(declare-fun res!1050239 () Bool)

(assert (=> b!1533152 (=> (not res!1050239) (not e!854157))))

(declare-datatypes ((List!35602 0))(
  ( (Nil!35599) (Cons!35598 (h!37043 (_ BitVec 64)) (t!50296 List!35602)) )
))
(declare-fun arrayNoDuplicates!0 (array!101824 (_ BitVec 32) List!35602) Bool)

(assert (=> b!1533152 (= res!1050239 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35599))))

(declare-fun b!1533153 () Bool)

(assert (=> b!1533153 (= e!854157 false)))

(declare-datatypes ((SeekEntryResult!13260 0))(
  ( (MissingZero!13260 (index!55435 (_ BitVec 32))) (Found!13260 (index!55436 (_ BitVec 32))) (Intermediate!13260 (undefined!14072 Bool) (index!55437 (_ BitVec 32)) (x!137214 (_ BitVec 32))) (Undefined!13260) (MissingVacant!13260 (index!55438 (_ BitVec 32))) )
))
(declare-fun lt!663781 () SeekEntryResult!13260)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101824 (_ BitVec 32)) SeekEntryResult!13260)

(assert (=> b!1533153 (= lt!663781 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49128 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533154 () Bool)

(declare-fun res!1050241 () Bool)

(assert (=> b!1533154 (=> (not res!1050241) (not e!854157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533154 (= res!1050241 (validKeyInArray!0 (select (arr!49128 a!2792) i!951)))))

(declare-fun res!1050238 () Bool)

(assert (=> start!130726 (=> (not res!1050238) (not e!854157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130726 (= res!1050238 (validMask!0 mask!2480))))

(assert (=> start!130726 e!854157))

(assert (=> start!130726 true))

(declare-fun array_inv!38156 (array!101824) Bool)

(assert (=> start!130726 (array_inv!38156 a!2792)))

(declare-fun b!1533155 () Bool)

(declare-fun res!1050235 () Bool)

(assert (=> b!1533155 (=> (not res!1050235) (not e!854157))))

(assert (=> b!1533155 (= res!1050235 (validKeyInArray!0 (select (arr!49128 a!2792) j!64)))))

(assert (= (and start!130726 res!1050238) b!1533150))

(assert (= (and b!1533150 res!1050237) b!1533154))

(assert (= (and b!1533154 res!1050241) b!1533155))

(assert (= (and b!1533155 res!1050235) b!1533151))

(assert (= (and b!1533151 res!1050236) b!1533152))

(assert (= (and b!1533152 res!1050239) b!1533149))

(assert (= (and b!1533149 res!1050240) b!1533153))

(declare-fun m!1415861 () Bool)

(assert (=> b!1533155 m!1415861))

(assert (=> b!1533155 m!1415861))

(declare-fun m!1415863 () Bool)

(assert (=> b!1533155 m!1415863))

(declare-fun m!1415865 () Bool)

(assert (=> start!130726 m!1415865))

(declare-fun m!1415867 () Bool)

(assert (=> start!130726 m!1415867))

(declare-fun m!1415869 () Bool)

(assert (=> b!1533151 m!1415869))

(declare-fun m!1415871 () Bool)

(assert (=> b!1533149 m!1415871))

(declare-fun m!1415873 () Bool)

(assert (=> b!1533152 m!1415873))

(assert (=> b!1533153 m!1415861))

(assert (=> b!1533153 m!1415861))

(declare-fun m!1415875 () Bool)

(assert (=> b!1533153 m!1415875))

(declare-fun m!1415877 () Bool)

(assert (=> b!1533154 m!1415877))

(assert (=> b!1533154 m!1415877))

(declare-fun m!1415879 () Bool)

(assert (=> b!1533154 m!1415879))

(check-sat (not b!1533154) (not b!1533151) (not b!1533153) (not b!1533155) (not start!130726) (not b!1533152))
