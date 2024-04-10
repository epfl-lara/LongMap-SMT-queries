; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130810 () Bool)

(assert start!130810)

(declare-fun res!1051200 () Bool)

(declare-fun e!854409 () Bool)

(assert (=> start!130810 (=> (not res!1051200) (not e!854409))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130810 (= res!1051200 (validMask!0 mask!2480))))

(assert (=> start!130810 e!854409))

(assert (=> start!130810 true))

(declare-datatypes ((array!101908 0))(
  ( (array!101909 (arr!49170 (Array (_ BitVec 32) (_ BitVec 64))) (size!49720 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101908)

(declare-fun array_inv!38198 (array!101908) Bool)

(assert (=> start!130810 (array_inv!38198 a!2792)))

(declare-fun b!1534112 () Bool)

(declare-fun res!1051203 () Bool)

(assert (=> b!1534112 (=> (not res!1051203) (not e!854409))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534112 (= res!1051203 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49720 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49720 a!2792)) (= (select (arr!49170 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534113 () Bool)

(declare-fun res!1051202 () Bool)

(assert (=> b!1534113 (=> (not res!1051202) (not e!854409))))

(declare-datatypes ((List!35644 0))(
  ( (Nil!35641) (Cons!35640 (h!37085 (_ BitVec 64)) (t!50338 List!35644)) )
))
(declare-fun arrayNoDuplicates!0 (array!101908 (_ BitVec 32) List!35644) Bool)

(assert (=> b!1534113 (= res!1051202 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35641))))

(declare-fun b!1534114 () Bool)

(declare-fun res!1051198 () Bool)

(assert (=> b!1534114 (=> (not res!1051198) (not e!854409))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534114 (= res!1051198 (and (= (size!49720 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49720 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49720 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534115 () Bool)

(declare-fun res!1051199 () Bool)

(assert (=> b!1534115 (=> (not res!1051199) (not e!854409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101908 (_ BitVec 32)) Bool)

(assert (=> b!1534115 (= res!1051199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534116 () Bool)

(assert (=> b!1534116 (= e!854409 false)))

(declare-datatypes ((SeekEntryResult!13302 0))(
  ( (MissingZero!13302 (index!55603 (_ BitVec 32))) (Found!13302 (index!55604 (_ BitVec 32))) (Intermediate!13302 (undefined!14114 Bool) (index!55605 (_ BitVec 32)) (x!137368 (_ BitVec 32))) (Undefined!13302) (MissingVacant!13302 (index!55606 (_ BitVec 32))) )
))
(declare-fun lt!663835 () SeekEntryResult!13302)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101908 (_ BitVec 32)) SeekEntryResult!13302)

(assert (=> b!1534116 (= lt!663835 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49170 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534117 () Bool)

(declare-fun res!1051201 () Bool)

(assert (=> b!1534117 (=> (not res!1051201) (not e!854409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534117 (= res!1051201 (validKeyInArray!0 (select (arr!49170 a!2792) i!951)))))

(declare-fun b!1534118 () Bool)

(declare-fun res!1051204 () Bool)

(assert (=> b!1534118 (=> (not res!1051204) (not e!854409))))

(assert (=> b!1534118 (= res!1051204 (validKeyInArray!0 (select (arr!49170 a!2792) j!64)))))

(assert (= (and start!130810 res!1051200) b!1534114))

(assert (= (and b!1534114 res!1051198) b!1534117))

(assert (= (and b!1534117 res!1051201) b!1534118))

(assert (= (and b!1534118 res!1051204) b!1534115))

(assert (= (and b!1534115 res!1051199) b!1534113))

(assert (= (and b!1534113 res!1051202) b!1534112))

(assert (= (and b!1534112 res!1051203) b!1534116))

(declare-fun m!1416785 () Bool)

(assert (=> b!1534113 m!1416785))

(declare-fun m!1416787 () Bool)

(assert (=> b!1534117 m!1416787))

(assert (=> b!1534117 m!1416787))

(declare-fun m!1416789 () Bool)

(assert (=> b!1534117 m!1416789))

(declare-fun m!1416791 () Bool)

(assert (=> start!130810 m!1416791))

(declare-fun m!1416793 () Bool)

(assert (=> start!130810 m!1416793))

(declare-fun m!1416795 () Bool)

(assert (=> b!1534118 m!1416795))

(assert (=> b!1534118 m!1416795))

(declare-fun m!1416797 () Bool)

(assert (=> b!1534118 m!1416797))

(declare-fun m!1416799 () Bool)

(assert (=> b!1534115 m!1416799))

(declare-fun m!1416801 () Bool)

(assert (=> b!1534112 m!1416801))

(assert (=> b!1534116 m!1416795))

(assert (=> b!1534116 m!1416795))

(declare-fun m!1416803 () Bool)

(assert (=> b!1534116 m!1416803))

(check-sat (not b!1534117) (not start!130810) (not b!1534115) (not b!1534118) (not b!1534116) (not b!1534113))
