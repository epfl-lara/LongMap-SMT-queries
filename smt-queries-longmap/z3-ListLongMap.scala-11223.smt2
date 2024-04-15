; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130920 () Bool)

(assert start!130920)

(declare-fun b!1536117 () Bool)

(declare-fun res!1053397 () Bool)

(declare-fun e!854978 () Bool)

(assert (=> b!1536117 (=> (not res!1053397) (not e!854978))))

(declare-datatypes ((array!102016 0))(
  ( (array!102017 (arr!49225 (Array (_ BitVec 32) (_ BitVec 64))) (size!49777 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102016)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536117 (= res!1053397 (validKeyInArray!0 (select (arr!49225 a!2792) j!64)))))

(declare-fun b!1536118 () Bool)

(declare-fun e!854979 () Bool)

(assert (=> b!1536118 (= e!854978 e!854979)))

(declare-fun res!1053388 () Bool)

(assert (=> b!1536118 (=> (not res!1053388) (not e!854979))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13382 0))(
  ( (MissingZero!13382 (index!55923 (_ BitVec 32))) (Found!13382 (index!55924 (_ BitVec 32))) (Intermediate!13382 (undefined!14194 Bool) (index!55925 (_ BitVec 32)) (x!137659 (_ BitVec 32))) (Undefined!13382) (MissingVacant!13382 (index!55926 (_ BitVec 32))) )
))
(declare-fun lt!664058 () SeekEntryResult!13382)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102016 (_ BitVec 32)) SeekEntryResult!13382)

(assert (=> b!1536118 (= res!1053388 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49225 a!2792) j!64) a!2792 mask!2480) lt!664058))))

(assert (=> b!1536118 (= lt!664058 (Found!13382 j!64))))

(declare-fun b!1536119 () Bool)

(declare-fun e!854976 () Bool)

(declare-fun e!854977 () Bool)

(assert (=> b!1536119 (= e!854976 e!854977)))

(declare-fun res!1053389 () Bool)

(assert (=> b!1536119 (=> (not res!1053389) (not e!854977))))

(declare-fun lt!664059 () SeekEntryResult!13382)

(assert (=> b!1536119 (= res!1053389 (= lt!664059 lt!664058))))

(declare-fun lt!664057 () (_ BitVec 32))

(assert (=> b!1536119 (= lt!664059 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664057 vacantIndex!5 (select (arr!49225 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536120 () Bool)

(declare-fun res!1053396 () Bool)

(assert (=> b!1536120 (=> (not res!1053396) (not e!854978))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536120 (= res!1053396 (and (= (size!49777 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49777 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49777 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536121 () Bool)

(declare-fun res!1053392 () Bool)

(assert (=> b!1536121 (=> (not res!1053392) (not e!854978))))

(assert (=> b!1536121 (= res!1053392 (validKeyInArray!0 (select (arr!49225 a!2792) i!951)))))

(declare-fun b!1536122 () Bool)

(declare-fun res!1053395 () Bool)

(assert (=> b!1536122 (=> (not res!1053395) (not e!854979))))

(assert (=> b!1536122 (= res!1053395 (not (= (select (arr!49225 a!2792) index!463) (select (arr!49225 a!2792) j!64))))))

(declare-fun b!1536123 () Bool)

(declare-fun res!1053393 () Bool)

(assert (=> b!1536123 (=> (not res!1053393) (not e!854978))))

(assert (=> b!1536123 (= res!1053393 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49777 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49777 a!2792)) (= (select (arr!49225 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1053391 () Bool)

(assert (=> start!130920 (=> (not res!1053391) (not e!854978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130920 (= res!1053391 (validMask!0 mask!2480))))

(assert (=> start!130920 e!854978))

(assert (=> start!130920 true))

(declare-fun array_inv!38458 (array!102016) Bool)

(assert (=> start!130920 (array_inv!38458 a!2792)))

(declare-fun b!1536124 () Bool)

(assert (=> b!1536124 (= e!854979 e!854976)))

(declare-fun res!1053390 () Bool)

(assert (=> b!1536124 (=> (not res!1053390) (not e!854976))))

(assert (=> b!1536124 (= res!1053390 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664057 #b00000000000000000000000000000000) (bvslt lt!664057 (size!49777 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536124 (= lt!664057 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536125 () Bool)

(assert (=> b!1536125 (= e!854977 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1536125 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664057 vacantIndex!5 (select (store (arr!49225 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102017 (store (arr!49225 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49777 a!2792)) mask!2480) lt!664059)))

(declare-datatypes ((Unit!51171 0))(
  ( (Unit!51172) )
))
(declare-fun lt!664056 () Unit!51171)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51171)

(assert (=> b!1536125 (= lt!664056 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664057 vacantIndex!5 mask!2480))))

(declare-fun b!1536126 () Bool)

(declare-fun res!1053387 () Bool)

(assert (=> b!1536126 (=> (not res!1053387) (not e!854978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102016 (_ BitVec 32)) Bool)

(assert (=> b!1536126 (= res!1053387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536127 () Bool)

(declare-fun res!1053394 () Bool)

(assert (=> b!1536127 (=> (not res!1053394) (not e!854978))))

(declare-datatypes ((List!35777 0))(
  ( (Nil!35774) (Cons!35773 (h!37219 (_ BitVec 64)) (t!50463 List!35777)) )
))
(declare-fun arrayNoDuplicates!0 (array!102016 (_ BitVec 32) List!35777) Bool)

(assert (=> b!1536127 (= res!1053394 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35774))))

(assert (= (and start!130920 res!1053391) b!1536120))

(assert (= (and b!1536120 res!1053396) b!1536121))

(assert (= (and b!1536121 res!1053392) b!1536117))

(assert (= (and b!1536117 res!1053397) b!1536126))

(assert (= (and b!1536126 res!1053387) b!1536127))

(assert (= (and b!1536127 res!1053394) b!1536123))

(assert (= (and b!1536123 res!1053393) b!1536118))

(assert (= (and b!1536118 res!1053388) b!1536122))

(assert (= (and b!1536122 res!1053395) b!1536124))

(assert (= (and b!1536124 res!1053390) b!1536119))

(assert (= (and b!1536119 res!1053389) b!1536125))

(declare-fun m!1418003 () Bool)

(assert (=> b!1536122 m!1418003))

(declare-fun m!1418005 () Bool)

(assert (=> b!1536122 m!1418005))

(assert (=> b!1536117 m!1418005))

(assert (=> b!1536117 m!1418005))

(declare-fun m!1418007 () Bool)

(assert (=> b!1536117 m!1418007))

(declare-fun m!1418009 () Bool)

(assert (=> b!1536123 m!1418009))

(declare-fun m!1418011 () Bool)

(assert (=> b!1536125 m!1418011))

(declare-fun m!1418013 () Bool)

(assert (=> b!1536125 m!1418013))

(assert (=> b!1536125 m!1418013))

(declare-fun m!1418015 () Bool)

(assert (=> b!1536125 m!1418015))

(declare-fun m!1418017 () Bool)

(assert (=> b!1536125 m!1418017))

(assert (=> b!1536119 m!1418005))

(assert (=> b!1536119 m!1418005))

(declare-fun m!1418019 () Bool)

(assert (=> b!1536119 m!1418019))

(declare-fun m!1418021 () Bool)

(assert (=> b!1536127 m!1418021))

(assert (=> b!1536118 m!1418005))

(assert (=> b!1536118 m!1418005))

(declare-fun m!1418023 () Bool)

(assert (=> b!1536118 m!1418023))

(declare-fun m!1418025 () Bool)

(assert (=> b!1536124 m!1418025))

(declare-fun m!1418027 () Bool)

(assert (=> b!1536121 m!1418027))

(assert (=> b!1536121 m!1418027))

(declare-fun m!1418029 () Bool)

(assert (=> b!1536121 m!1418029))

(declare-fun m!1418031 () Bool)

(assert (=> b!1536126 m!1418031))

(declare-fun m!1418033 () Bool)

(assert (=> start!130920 m!1418033))

(declare-fun m!1418035 () Bool)

(assert (=> start!130920 m!1418035))

(check-sat (not b!1536125) (not b!1536126) (not b!1536127) (not b!1536117) (not b!1536119) (not b!1536124) (not b!1536118) (not b!1536121) (not start!130920))
(check-sat)
