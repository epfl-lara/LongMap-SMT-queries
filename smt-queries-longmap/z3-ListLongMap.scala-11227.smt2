; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130944 () Bool)

(assert start!130944)

(declare-fun b!1536522 () Bool)

(declare-fun res!1053796 () Bool)

(declare-fun e!855169 () Bool)

(assert (=> b!1536522 (=> (not res!1053796) (not e!855169))))

(declare-datatypes ((array!102040 0))(
  ( (array!102041 (arr!49237 (Array (_ BitVec 32) (_ BitVec 64))) (size!49789 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102040)

(declare-datatypes ((List!35789 0))(
  ( (Nil!35786) (Cons!35785 (h!37231 (_ BitVec 64)) (t!50475 List!35789)) )
))
(declare-fun arrayNoDuplicates!0 (array!102040 (_ BitVec 32) List!35789) Bool)

(assert (=> b!1536522 (= res!1053796 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35786))))

(declare-fun res!1053801 () Bool)

(assert (=> start!130944 (=> (not res!1053801) (not e!855169))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130944 (= res!1053801 (validMask!0 mask!2480))))

(assert (=> start!130944 e!855169))

(assert (=> start!130944 true))

(declare-fun array_inv!38470 (array!102040) Bool)

(assert (=> start!130944 (array_inv!38470 a!2792)))

(declare-fun b!1536523 () Bool)

(declare-fun res!1053792 () Bool)

(assert (=> b!1536523 (=> (not res!1053792) (not e!855169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102040 (_ BitVec 32)) Bool)

(assert (=> b!1536523 (= res!1053792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536524 () Bool)

(declare-fun e!855166 () Bool)

(declare-fun e!855168 () Bool)

(assert (=> b!1536524 (= e!855166 e!855168)))

(declare-fun res!1053797 () Bool)

(assert (=> b!1536524 (=> (not res!1053797) (not e!855168))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664210 () (_ BitVec 32))

(assert (=> b!1536524 (= res!1053797 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664210 #b00000000000000000000000000000000) (bvslt lt!664210 (size!49789 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536524 (= lt!664210 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536525 () Bool)

(declare-fun res!1053793 () Bool)

(assert (=> b!1536525 (=> (not res!1053793) (not e!855166))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536525 (= res!1053793 (not (= (select (arr!49237 a!2792) index!463) (select (arr!49237 a!2792) j!64))))))

(declare-fun b!1536526 () Bool)

(declare-fun res!1053799 () Bool)

(assert (=> b!1536526 (=> (not res!1053799) (not e!855169))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536526 (= res!1053799 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49789 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49789 a!2792)) (= (select (arr!49237 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536527 () Bool)

(declare-fun res!1053800 () Bool)

(assert (=> b!1536527 (=> (not res!1053800) (not e!855169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536527 (= res!1053800 (validKeyInArray!0 (select (arr!49237 a!2792) j!64)))))

(declare-fun b!1536528 () Bool)

(declare-fun res!1053795 () Bool)

(assert (=> b!1536528 (=> (not res!1053795) (not e!855169))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536528 (= res!1053795 (and (= (size!49789 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49789 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49789 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536529 () Bool)

(declare-fun e!855167 () Bool)

(assert (=> b!1536529 (= e!855168 e!855167)))

(declare-fun res!1053802 () Bool)

(assert (=> b!1536529 (=> (not res!1053802) (not e!855167))))

(declare-datatypes ((SeekEntryResult!13394 0))(
  ( (MissingZero!13394 (index!55971 (_ BitVec 32))) (Found!13394 (index!55972 (_ BitVec 32))) (Intermediate!13394 (undefined!14206 Bool) (index!55973 (_ BitVec 32)) (x!137703 (_ BitVec 32))) (Undefined!13394) (MissingVacant!13394 (index!55974 (_ BitVec 32))) )
))
(declare-fun lt!664209 () SeekEntryResult!13394)

(declare-fun lt!664212 () SeekEntryResult!13394)

(assert (=> b!1536529 (= res!1053802 (= lt!664209 lt!664212))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102040 (_ BitVec 32)) SeekEntryResult!13394)

(assert (=> b!1536529 (= lt!664209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664210 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536530 () Bool)

(assert (=> b!1536530 (= e!855169 e!855166)))

(declare-fun res!1053798 () Bool)

(assert (=> b!1536530 (=> (not res!1053798) (not e!855166))))

(assert (=> b!1536530 (= res!1053798 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49237 a!2792) j!64) a!2792 mask!2480) lt!664212))))

(assert (=> b!1536530 (= lt!664212 (Found!13394 j!64))))

(declare-fun b!1536531 () Bool)

(assert (=> b!1536531 (= e!855167 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1536531 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664210 vacantIndex!5 (select (store (arr!49237 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102041 (store (arr!49237 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49789 a!2792)) mask!2480) lt!664209)))

(declare-datatypes ((Unit!51195 0))(
  ( (Unit!51196) )
))
(declare-fun lt!664211 () Unit!51195)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51195)

(assert (=> b!1536531 (= lt!664211 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664210 vacantIndex!5 mask!2480))))

(declare-fun b!1536532 () Bool)

(declare-fun res!1053794 () Bool)

(assert (=> b!1536532 (=> (not res!1053794) (not e!855169))))

(assert (=> b!1536532 (= res!1053794 (validKeyInArray!0 (select (arr!49237 a!2792) i!951)))))

(assert (= (and start!130944 res!1053801) b!1536528))

(assert (= (and b!1536528 res!1053795) b!1536532))

(assert (= (and b!1536532 res!1053794) b!1536527))

(assert (= (and b!1536527 res!1053800) b!1536523))

(assert (= (and b!1536523 res!1053792) b!1536522))

(assert (= (and b!1536522 res!1053796) b!1536526))

(assert (= (and b!1536526 res!1053799) b!1536530))

(assert (= (and b!1536530 res!1053798) b!1536525))

(assert (= (and b!1536525 res!1053793) b!1536524))

(assert (= (and b!1536524 res!1053797) b!1536529))

(assert (= (and b!1536529 res!1053802) b!1536531))

(declare-fun m!1418429 () Bool)

(assert (=> b!1536527 m!1418429))

(assert (=> b!1536527 m!1418429))

(declare-fun m!1418431 () Bool)

(assert (=> b!1536527 m!1418431))

(assert (=> b!1536530 m!1418429))

(assert (=> b!1536530 m!1418429))

(declare-fun m!1418433 () Bool)

(assert (=> b!1536530 m!1418433))

(declare-fun m!1418435 () Bool)

(assert (=> b!1536532 m!1418435))

(assert (=> b!1536532 m!1418435))

(declare-fun m!1418437 () Bool)

(assert (=> b!1536532 m!1418437))

(declare-fun m!1418439 () Bool)

(assert (=> b!1536526 m!1418439))

(declare-fun m!1418441 () Bool)

(assert (=> b!1536522 m!1418441))

(declare-fun m!1418443 () Bool)

(assert (=> b!1536523 m!1418443))

(declare-fun m!1418445 () Bool)

(assert (=> start!130944 m!1418445))

(declare-fun m!1418447 () Bool)

(assert (=> start!130944 m!1418447))

(declare-fun m!1418449 () Bool)

(assert (=> b!1536524 m!1418449))

(declare-fun m!1418451 () Bool)

(assert (=> b!1536525 m!1418451))

(assert (=> b!1536525 m!1418429))

(declare-fun m!1418453 () Bool)

(assert (=> b!1536531 m!1418453))

(declare-fun m!1418455 () Bool)

(assert (=> b!1536531 m!1418455))

(assert (=> b!1536531 m!1418455))

(declare-fun m!1418457 () Bool)

(assert (=> b!1536531 m!1418457))

(declare-fun m!1418459 () Bool)

(assert (=> b!1536531 m!1418459))

(assert (=> b!1536529 m!1418429))

(assert (=> b!1536529 m!1418429))

(declare-fun m!1418461 () Bool)

(assert (=> b!1536529 m!1418461))

(check-sat (not b!1536524) (not start!130944) (not b!1536527) (not b!1536529) (not b!1536531) (not b!1536530) (not b!1536523) (not b!1536522) (not b!1536532))
(check-sat)
