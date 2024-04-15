; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130794 () Bool)

(assert start!130794)

(declare-fun b!1534180 () Bool)

(declare-fun res!1051457 () Bool)

(declare-fun e!854315 () Bool)

(assert (=> b!1534180 (=> (not res!1051457) (not e!854315))))

(declare-datatypes ((array!101890 0))(
  ( (array!101891 (arr!49162 (Array (_ BitVec 32) (_ BitVec 64))) (size!49714 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101890)

(declare-datatypes ((List!35714 0))(
  ( (Nil!35711) (Cons!35710 (h!37156 (_ BitVec 64)) (t!50400 List!35714)) )
))
(declare-fun arrayNoDuplicates!0 (array!101890 (_ BitVec 32) List!35714) Bool)

(assert (=> b!1534180 (= res!1051457 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35711))))

(declare-fun b!1534181 () Bool)

(declare-fun res!1051451 () Bool)

(assert (=> b!1534181 (=> (not res!1051451) (not e!854315))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101890 (_ BitVec 32)) Bool)

(assert (=> b!1534181 (= res!1051451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534182 () Bool)

(declare-fun res!1051453 () Bool)

(assert (=> b!1534182 (=> (not res!1051453) (not e!854315))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534182 (= res!1051453 (validKeyInArray!0 (select (arr!49162 a!2792) j!64)))))

(declare-fun b!1534183 () Bool)

(declare-fun res!1051454 () Bool)

(assert (=> b!1534183 (=> (not res!1051454) (not e!854315))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534183 (= res!1051454 (not (= (select (arr!49162 a!2792) index!463) (select (arr!49162 a!2792) j!64))))))

(declare-fun b!1534184 () Bool)

(declare-fun e!854317 () Bool)

(assert (=> b!1534184 (= e!854317 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!663584 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13319 0))(
  ( (MissingZero!13319 (index!55671 (_ BitVec 32))) (Found!13319 (index!55672 (_ BitVec 32))) (Intermediate!13319 (undefined!14131 Bool) (index!55673 (_ BitVec 32)) (x!137428 (_ BitVec 32))) (Undefined!13319) (MissingVacant!13319 (index!55674 (_ BitVec 32))) )
))
(declare-fun lt!663585 () SeekEntryResult!13319)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101890 (_ BitVec 32)) SeekEntryResult!13319)

(assert (=> b!1534184 (= lt!663585 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663584 vacantIndex!5 (select (arr!49162 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534185 () Bool)

(declare-fun res!1051456 () Bool)

(assert (=> b!1534185 (=> (not res!1051456) (not e!854315))))

(assert (=> b!1534185 (= res!1051456 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49714 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49714 a!2792)) (= (select (arr!49162 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534186 () Bool)

(declare-fun res!1051450 () Bool)

(assert (=> b!1534186 (=> (not res!1051450) (not e!854315))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534186 (= res!1051450 (validKeyInArray!0 (select (arr!49162 a!2792) i!951)))))

(declare-fun b!1534187 () Bool)

(declare-fun res!1051455 () Bool)

(assert (=> b!1534187 (=> (not res!1051455) (not e!854315))))

(assert (=> b!1534187 (= res!1051455 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49162 a!2792) j!64) a!2792 mask!2480) (Found!13319 j!64)))))

(declare-fun b!1534188 () Bool)

(assert (=> b!1534188 (= e!854315 e!854317)))

(declare-fun res!1051452 () Bool)

(assert (=> b!1534188 (=> (not res!1051452) (not e!854317))))

(assert (=> b!1534188 (= res!1051452 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663584 #b00000000000000000000000000000000) (bvslt lt!663584 (size!49714 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534188 (= lt!663584 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534189 () Bool)

(declare-fun res!1051459 () Bool)

(assert (=> b!1534189 (=> (not res!1051459) (not e!854315))))

(assert (=> b!1534189 (= res!1051459 (and (= (size!49714 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49714 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49714 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051458 () Bool)

(assert (=> start!130794 (=> (not res!1051458) (not e!854315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130794 (= res!1051458 (validMask!0 mask!2480))))

(assert (=> start!130794 e!854315))

(assert (=> start!130794 true))

(declare-fun array_inv!38395 (array!101890) Bool)

(assert (=> start!130794 (array_inv!38395 a!2792)))

(assert (= (and start!130794 res!1051458) b!1534189))

(assert (= (and b!1534189 res!1051459) b!1534186))

(assert (= (and b!1534186 res!1051450) b!1534182))

(assert (= (and b!1534182 res!1051453) b!1534181))

(assert (= (and b!1534181 res!1051451) b!1534180))

(assert (= (and b!1534180 res!1051457) b!1534185))

(assert (= (and b!1534185 res!1051456) b!1534187))

(assert (= (and b!1534187 res!1051455) b!1534183))

(assert (= (and b!1534183 res!1051454) b!1534188))

(assert (= (and b!1534188 res!1051452) b!1534184))

(declare-fun m!1416245 () Bool)

(assert (=> b!1534180 m!1416245))

(declare-fun m!1416247 () Bool)

(assert (=> b!1534188 m!1416247))

(declare-fun m!1416249 () Bool)

(assert (=> b!1534184 m!1416249))

(assert (=> b!1534184 m!1416249))

(declare-fun m!1416251 () Bool)

(assert (=> b!1534184 m!1416251))

(declare-fun m!1416253 () Bool)

(assert (=> b!1534181 m!1416253))

(declare-fun m!1416255 () Bool)

(assert (=> start!130794 m!1416255))

(declare-fun m!1416257 () Bool)

(assert (=> start!130794 m!1416257))

(assert (=> b!1534187 m!1416249))

(assert (=> b!1534187 m!1416249))

(declare-fun m!1416259 () Bool)

(assert (=> b!1534187 m!1416259))

(declare-fun m!1416261 () Bool)

(assert (=> b!1534185 m!1416261))

(declare-fun m!1416263 () Bool)

(assert (=> b!1534183 m!1416263))

(assert (=> b!1534183 m!1416249))

(assert (=> b!1534182 m!1416249))

(assert (=> b!1534182 m!1416249))

(declare-fun m!1416265 () Bool)

(assert (=> b!1534182 m!1416265))

(declare-fun m!1416267 () Bool)

(assert (=> b!1534186 m!1416267))

(assert (=> b!1534186 m!1416267))

(declare-fun m!1416269 () Bool)

(assert (=> b!1534186 m!1416269))

(check-sat (not b!1534181) (not b!1534188) (not b!1534180) (not b!1534184) (not b!1534186) (not b!1534182) (not start!130794) (not b!1534187))
(check-sat)
