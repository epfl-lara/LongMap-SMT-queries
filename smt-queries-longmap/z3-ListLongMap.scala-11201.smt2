; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130840 () Bool)

(assert start!130840)

(declare-fun b!1534445 () Bool)

(declare-fun res!1051534 () Bool)

(declare-fun e!854500 () Bool)

(assert (=> b!1534445 (=> (not res!1051534) (not e!854500))))

(declare-datatypes ((array!101938 0))(
  ( (array!101939 (arr!49185 (Array (_ BitVec 32) (_ BitVec 64))) (size!49735 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101938)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534445 (= res!1051534 (validKeyInArray!0 (select (arr!49185 a!2792) i!951)))))

(declare-fun b!1534446 () Bool)

(declare-fun res!1051535 () Bool)

(assert (=> b!1534446 (=> (not res!1051535) (not e!854500))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101938 (_ BitVec 32)) Bool)

(assert (=> b!1534446 (= res!1051535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534447 () Bool)

(declare-fun res!1051532 () Bool)

(assert (=> b!1534447 (=> (not res!1051532) (not e!854500))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534447 (= res!1051532 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49735 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49735 a!2792)) (= (select (arr!49185 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534448 () Bool)

(assert (=> b!1534448 (= e!854500 false)))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13317 0))(
  ( (MissingZero!13317 (index!55663 (_ BitVec 32))) (Found!13317 (index!55664 (_ BitVec 32))) (Intermediate!13317 (undefined!14129 Bool) (index!55665 (_ BitVec 32)) (x!137423 (_ BitVec 32))) (Undefined!13317) (MissingVacant!13317 (index!55666 (_ BitVec 32))) )
))
(declare-fun lt!663862 () SeekEntryResult!13317)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101938 (_ BitVec 32)) SeekEntryResult!13317)

(assert (=> b!1534448 (= lt!663862 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49185 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534449 () Bool)

(declare-fun res!1051531 () Bool)

(assert (=> b!1534449 (=> (not res!1051531) (not e!854500))))

(declare-datatypes ((List!35659 0))(
  ( (Nil!35656) (Cons!35655 (h!37100 (_ BitVec 64)) (t!50353 List!35659)) )
))
(declare-fun arrayNoDuplicates!0 (array!101938 (_ BitVec 32) List!35659) Bool)

(assert (=> b!1534449 (= res!1051531 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35656))))

(declare-fun b!1534450 () Bool)

(declare-fun res!1051536 () Bool)

(assert (=> b!1534450 (=> (not res!1051536) (not e!854500))))

(assert (=> b!1534450 (= res!1051536 (and (= (size!49735 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49735 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49735 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1051533 () Bool)

(assert (=> start!130840 (=> (not res!1051533) (not e!854500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130840 (= res!1051533 (validMask!0 mask!2480))))

(assert (=> start!130840 e!854500))

(assert (=> start!130840 true))

(declare-fun array_inv!38213 (array!101938) Bool)

(assert (=> start!130840 (array_inv!38213 a!2792)))

(declare-fun b!1534451 () Bool)

(declare-fun res!1051537 () Bool)

(assert (=> b!1534451 (=> (not res!1051537) (not e!854500))))

(assert (=> b!1534451 (= res!1051537 (validKeyInArray!0 (select (arr!49185 a!2792) j!64)))))

(assert (= (and start!130840 res!1051533) b!1534450))

(assert (= (and b!1534450 res!1051536) b!1534445))

(assert (= (and b!1534445 res!1051534) b!1534451))

(assert (= (and b!1534451 res!1051537) b!1534446))

(assert (= (and b!1534446 res!1051535) b!1534449))

(assert (= (and b!1534449 res!1051531) b!1534447))

(assert (= (and b!1534447 res!1051532) b!1534448))

(declare-fun m!1417097 () Bool)

(assert (=> b!1534447 m!1417097))

(declare-fun m!1417099 () Bool)

(assert (=> b!1534449 m!1417099))

(declare-fun m!1417101 () Bool)

(assert (=> start!130840 m!1417101))

(declare-fun m!1417103 () Bool)

(assert (=> start!130840 m!1417103))

(declare-fun m!1417105 () Bool)

(assert (=> b!1534448 m!1417105))

(assert (=> b!1534448 m!1417105))

(declare-fun m!1417107 () Bool)

(assert (=> b!1534448 m!1417107))

(declare-fun m!1417109 () Bool)

(assert (=> b!1534446 m!1417109))

(declare-fun m!1417111 () Bool)

(assert (=> b!1534445 m!1417111))

(assert (=> b!1534445 m!1417111))

(declare-fun m!1417113 () Bool)

(assert (=> b!1534445 m!1417113))

(assert (=> b!1534451 m!1417105))

(assert (=> b!1534451 m!1417105))

(declare-fun m!1417115 () Bool)

(assert (=> b!1534451 m!1417115))

(check-sat (not b!1534449) (not b!1534445) (not b!1534446) (not b!1534448) (not b!1534451) (not start!130840))
