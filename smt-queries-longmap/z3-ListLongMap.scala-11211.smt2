; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130900 () Bool)

(assert start!130900)

(declare-fun b!1535333 () Bool)

(declare-fun res!1052422 () Bool)

(declare-fun e!854766 () Bool)

(assert (=> b!1535333 (=> (not res!1052422) (not e!854766))))

(declare-datatypes ((array!101998 0))(
  ( (array!101999 (arr!49215 (Array (_ BitVec 32) (_ BitVec 64))) (size!49765 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101998)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101998 (_ BitVec 32)) Bool)

(assert (=> b!1535333 (= res!1052422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535334 () Bool)

(declare-fun e!854765 () Bool)

(assert (=> b!1535334 (= e!854766 e!854765)))

(declare-fun res!1052419 () Bool)

(assert (=> b!1535334 (=> (not res!1052419) (not e!854765))))

(declare-fun lt!664038 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1535334 (= res!1052419 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664038 #b00000000000000000000000000000000) (bvslt lt!664038 (size!49765 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535334 (= lt!664038 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535336 () Bool)

(declare-fun res!1052421 () Bool)

(assert (=> b!1535336 (=> (not res!1052421) (not e!854766))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535336 (= res!1052421 (not (= (select (arr!49215 a!2792) index!463) (select (arr!49215 a!2792) j!64))))))

(declare-fun b!1535337 () Bool)

(declare-fun res!1052426 () Bool)

(assert (=> b!1535337 (=> (not res!1052426) (not e!854766))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535337 (= res!1052426 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49765 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49765 a!2792)) (= (select (arr!49215 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535338 () Bool)

(declare-fun res!1052424 () Bool)

(assert (=> b!1535338 (=> (not res!1052424) (not e!854766))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535338 (= res!1052424 (and (= (size!49765 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49765 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49765 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535339 () Bool)

(declare-fun res!1052428 () Bool)

(assert (=> b!1535339 (=> (not res!1052428) (not e!854766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535339 (= res!1052428 (validKeyInArray!0 (select (arr!49215 a!2792) i!951)))))

(declare-fun b!1535340 () Bool)

(declare-fun res!1052425 () Bool)

(assert (=> b!1535340 (=> (not res!1052425) (not e!854766))))

(declare-datatypes ((SeekEntryResult!13347 0))(
  ( (MissingZero!13347 (index!55783 (_ BitVec 32))) (Found!13347 (index!55784 (_ BitVec 32))) (Intermediate!13347 (undefined!14159 Bool) (index!55785 (_ BitVec 32)) (x!137533 (_ BitVec 32))) (Undefined!13347) (MissingVacant!13347 (index!55786 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101998 (_ BitVec 32)) SeekEntryResult!13347)

(assert (=> b!1535340 (= res!1052425 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49215 a!2792) j!64) a!2792 mask!2480) (Found!13347 j!64)))))

(declare-fun res!1052420 () Bool)

(assert (=> start!130900 (=> (not res!1052420) (not e!854766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130900 (= res!1052420 (validMask!0 mask!2480))))

(assert (=> start!130900 e!854766))

(assert (=> start!130900 true))

(declare-fun array_inv!38243 (array!101998) Bool)

(assert (=> start!130900 (array_inv!38243 a!2792)))

(declare-fun b!1535335 () Bool)

(assert (=> b!1535335 (= e!854765 false)))

(declare-fun lt!664039 () SeekEntryResult!13347)

(assert (=> b!1535335 (= lt!664039 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664038 vacantIndex!5 (select (arr!49215 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535341 () Bool)

(declare-fun res!1052427 () Bool)

(assert (=> b!1535341 (=> (not res!1052427) (not e!854766))))

(declare-datatypes ((List!35689 0))(
  ( (Nil!35686) (Cons!35685 (h!37130 (_ BitVec 64)) (t!50383 List!35689)) )
))
(declare-fun arrayNoDuplicates!0 (array!101998 (_ BitVec 32) List!35689) Bool)

(assert (=> b!1535341 (= res!1052427 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35686))))

(declare-fun b!1535342 () Bool)

(declare-fun res!1052423 () Bool)

(assert (=> b!1535342 (=> (not res!1052423) (not e!854766))))

(assert (=> b!1535342 (= res!1052423 (validKeyInArray!0 (select (arr!49215 a!2792) j!64)))))

(assert (= (and start!130900 res!1052420) b!1535338))

(assert (= (and b!1535338 res!1052424) b!1535339))

(assert (= (and b!1535339 res!1052428) b!1535342))

(assert (= (and b!1535342 res!1052423) b!1535333))

(assert (= (and b!1535333 res!1052422) b!1535341))

(assert (= (and b!1535341 res!1052427) b!1535337))

(assert (= (and b!1535337 res!1052426) b!1535340))

(assert (= (and b!1535340 res!1052425) b!1535336))

(assert (= (and b!1535336 res!1052421) b!1535334))

(assert (= (and b!1535334 res!1052419) b!1535335))

(declare-fun m!1417865 () Bool)

(assert (=> b!1535341 m!1417865))

(declare-fun m!1417867 () Bool)

(assert (=> b!1535342 m!1417867))

(assert (=> b!1535342 m!1417867))

(declare-fun m!1417869 () Bool)

(assert (=> b!1535342 m!1417869))

(declare-fun m!1417871 () Bool)

(assert (=> start!130900 m!1417871))

(declare-fun m!1417873 () Bool)

(assert (=> start!130900 m!1417873))

(declare-fun m!1417875 () Bool)

(assert (=> b!1535339 m!1417875))

(assert (=> b!1535339 m!1417875))

(declare-fun m!1417877 () Bool)

(assert (=> b!1535339 m!1417877))

(declare-fun m!1417879 () Bool)

(assert (=> b!1535336 m!1417879))

(assert (=> b!1535336 m!1417867))

(declare-fun m!1417881 () Bool)

(assert (=> b!1535337 m!1417881))

(assert (=> b!1535340 m!1417867))

(assert (=> b!1535340 m!1417867))

(declare-fun m!1417883 () Bool)

(assert (=> b!1535340 m!1417883))

(declare-fun m!1417885 () Bool)

(assert (=> b!1535334 m!1417885))

(declare-fun m!1417887 () Bool)

(assert (=> b!1535333 m!1417887))

(assert (=> b!1535335 m!1417867))

(assert (=> b!1535335 m!1417867))

(declare-fun m!1417889 () Bool)

(assert (=> b!1535335 m!1417889))

(check-sat (not b!1535340) (not b!1535342) (not b!1535334) (not b!1535341) (not b!1535335) (not start!130900) (not b!1535333) (not b!1535339))
(check-sat)
