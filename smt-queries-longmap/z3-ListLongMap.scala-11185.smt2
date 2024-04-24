; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131124 () Bool)

(assert start!131124)

(declare-fun res!1051220 () Bool)

(declare-fun e!855624 () Bool)

(assert (=> start!131124 (=> (not res!1051220) (not e!855624))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131124 (= res!1051220 (validMask!0 mask!2480))))

(assert (=> start!131124 e!855624))

(assert (=> start!131124 true))

(declare-datatypes ((array!101959 0))(
  ( (array!101960 (arr!49189 (Array (_ BitVec 32) (_ BitVec 64))) (size!49740 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101959)

(declare-fun array_inv!38470 (array!101959) Bool)

(assert (=> start!131124 (array_inv!38470 a!2792)))

(declare-fun b!1535620 () Bool)

(declare-fun res!1051225 () Bool)

(assert (=> b!1535620 (=> (not res!1051225) (not e!855624))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535620 (= res!1051225 (and (= (size!49740 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49740 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49740 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535621 () Bool)

(declare-fun res!1051226 () Bool)

(assert (=> b!1535621 (=> (not res!1051226) (not e!855624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535621 (= res!1051226 (validKeyInArray!0 (select (arr!49189 a!2792) j!64)))))

(declare-fun b!1535622 () Bool)

(declare-fun res!1051222 () Bool)

(assert (=> b!1535622 (=> (not res!1051222) (not e!855624))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13216 0))(
  ( (MissingZero!13216 (index!55259 (_ BitVec 32))) (Found!13216 (index!55260 (_ BitVec 32))) (Intermediate!13216 (undefined!14028 Bool) (index!55261 (_ BitVec 32)) (x!137241 (_ BitVec 32))) (Undefined!13216) (MissingVacant!13216 (index!55262 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101959 (_ BitVec 32)) SeekEntryResult!13216)

(assert (=> b!1535622 (= res!1051222 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49189 a!2792) j!64) a!2792 mask!2480) (Found!13216 j!64)))))

(declare-fun b!1535623 () Bool)

(declare-fun res!1051223 () Bool)

(assert (=> b!1535623 (=> (not res!1051223) (not e!855624))))

(declare-datatypes ((List!35650 0))(
  ( (Nil!35647) (Cons!35646 (h!37109 (_ BitVec 64)) (t!50336 List!35650)) )
))
(declare-fun arrayNoDuplicates!0 (array!101959 (_ BitVec 32) List!35650) Bool)

(assert (=> b!1535623 (= res!1051223 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35647))))

(declare-fun b!1535624 () Bool)

(declare-fun res!1051224 () Bool)

(assert (=> b!1535624 (=> (not res!1051224) (not e!855624))))

(assert (=> b!1535624 (= res!1051224 (validKeyInArray!0 (select (arr!49189 a!2792) i!951)))))

(declare-fun b!1535625 () Bool)

(declare-fun res!1051221 () Bool)

(assert (=> b!1535625 (=> (not res!1051221) (not e!855624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101959 (_ BitVec 32)) Bool)

(assert (=> b!1535625 (= res!1051221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535626 () Bool)

(declare-fun res!1051227 () Bool)

(assert (=> b!1535626 (=> (not res!1051227) (not e!855624))))

(assert (=> b!1535626 (= res!1051227 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49740 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49740 a!2792)) (= (select (arr!49189 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535627 () Bool)

(assert (=> b!1535627 (= e!855624 (and (= (select (arr!49189 a!2792) index!463) (select (arr!49189 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!131124 res!1051220) b!1535620))

(assert (= (and b!1535620 res!1051225) b!1535624))

(assert (= (and b!1535624 res!1051224) b!1535621))

(assert (= (and b!1535621 res!1051226) b!1535625))

(assert (= (and b!1535625 res!1051221) b!1535623))

(assert (= (and b!1535623 res!1051223) b!1535626))

(assert (= (and b!1535626 res!1051227) b!1535622))

(assert (= (and b!1535622 res!1051222) b!1535627))

(declare-fun m!1418185 () Bool)

(assert (=> b!1535622 m!1418185))

(assert (=> b!1535622 m!1418185))

(declare-fun m!1418187 () Bool)

(assert (=> b!1535622 m!1418187))

(declare-fun m!1418189 () Bool)

(assert (=> b!1535625 m!1418189))

(declare-fun m!1418191 () Bool)

(assert (=> b!1535627 m!1418191))

(assert (=> b!1535627 m!1418185))

(declare-fun m!1418193 () Bool)

(assert (=> b!1535623 m!1418193))

(declare-fun m!1418195 () Bool)

(assert (=> start!131124 m!1418195))

(declare-fun m!1418197 () Bool)

(assert (=> start!131124 m!1418197))

(declare-fun m!1418199 () Bool)

(assert (=> b!1535626 m!1418199))

(assert (=> b!1535621 m!1418185))

(assert (=> b!1535621 m!1418185))

(declare-fun m!1418201 () Bool)

(assert (=> b!1535621 m!1418201))

(declare-fun m!1418203 () Bool)

(assert (=> b!1535624 m!1418203))

(assert (=> b!1535624 m!1418203))

(declare-fun m!1418205 () Bool)

(assert (=> b!1535624 m!1418205))

(check-sat (not b!1535624) (not b!1535622) (not b!1535623) (not b!1535621) (not start!131124) (not b!1535625))
(check-sat)
