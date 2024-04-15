; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130926 () Bool)

(assert start!130926)

(declare-fun b!1536216 () Bool)

(declare-fun e!855024 () Bool)

(declare-fun e!855022 () Bool)

(assert (=> b!1536216 (= e!855024 e!855022)))

(declare-fun res!1053493 () Bool)

(assert (=> b!1536216 (=> (not res!1053493) (not e!855022))))

(declare-fun lt!664093 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102022 0))(
  ( (array!102023 (arr!49228 (Array (_ BitVec 32) (_ BitVec 64))) (size!49780 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102022)

(assert (=> b!1536216 (= res!1053493 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664093 #b00000000000000000000000000000000) (bvslt lt!664093 (size!49780 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536216 (= lt!664093 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536217 () Bool)

(declare-fun res!1053491 () Bool)

(declare-fun e!855021 () Bool)

(assert (=> b!1536217 (=> (not res!1053491) (not e!855021))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536217 (= res!1053491 (validKeyInArray!0 (select (arr!49228 a!2792) i!951)))))

(declare-fun b!1536218 () Bool)

(declare-fun res!1053495 () Bool)

(assert (=> b!1536218 (=> (not res!1053495) (not e!855021))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536218 (= res!1053495 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49780 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49780 a!2792)) (= (select (arr!49228 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!855025 () Bool)

(declare-fun b!1536219 () Bool)

(assert (=> b!1536219 (= e!855025 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49228 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!13385 0))(
  ( (MissingZero!13385 (index!55935 (_ BitVec 32))) (Found!13385 (index!55936 (_ BitVec 32))) (Intermediate!13385 (undefined!14197 Bool) (index!55937 (_ BitVec 32)) (x!137670 (_ BitVec 32))) (Undefined!13385) (MissingVacant!13385 (index!55938 (_ BitVec 32))) )
))
(declare-fun lt!664092 () SeekEntryResult!13385)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102022 (_ BitVec 32)) SeekEntryResult!13385)

(assert (=> b!1536219 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664093 vacantIndex!5 (select (store (arr!49228 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102023 (store (arr!49228 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49780 a!2792)) mask!2480) lt!664092)))

(declare-datatypes ((Unit!51177 0))(
  ( (Unit!51178) )
))
(declare-fun lt!664094 () Unit!51177)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51177)

(assert (=> b!1536219 (= lt!664094 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664093 vacantIndex!5 mask!2480))))

(declare-fun b!1536220 () Bool)

(declare-fun res!1053494 () Bool)

(assert (=> b!1536220 (=> (not res!1053494) (not e!855021))))

(assert (=> b!1536220 (= res!1053494 (and (= (size!49780 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49780 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49780 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536221 () Bool)

(declare-fun res!1053488 () Bool)

(assert (=> b!1536221 (=> (not res!1053488) (not e!855021))))

(assert (=> b!1536221 (= res!1053488 (validKeyInArray!0 (select (arr!49228 a!2792) j!64)))))

(declare-fun b!1536222 () Bool)

(declare-fun res!1053487 () Bool)

(assert (=> b!1536222 (=> (not res!1053487) (not e!855021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102022 (_ BitVec 32)) Bool)

(assert (=> b!1536222 (= res!1053487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536223 () Bool)

(assert (=> b!1536223 (= e!855022 e!855025)))

(declare-fun res!1053489 () Bool)

(assert (=> b!1536223 (=> (not res!1053489) (not e!855025))))

(declare-fun lt!664095 () SeekEntryResult!13385)

(assert (=> b!1536223 (= res!1053489 (= lt!664092 lt!664095))))

(assert (=> b!1536223 (= lt!664092 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664093 vacantIndex!5 (select (arr!49228 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536225 () Bool)

(declare-fun res!1053492 () Bool)

(assert (=> b!1536225 (=> (not res!1053492) (not e!855021))))

(declare-datatypes ((List!35780 0))(
  ( (Nil!35777) (Cons!35776 (h!37222 (_ BitVec 64)) (t!50466 List!35780)) )
))
(declare-fun arrayNoDuplicates!0 (array!102022 (_ BitVec 32) List!35780) Bool)

(assert (=> b!1536225 (= res!1053492 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35777))))

(declare-fun b!1536226 () Bool)

(declare-fun res!1053496 () Bool)

(assert (=> b!1536226 (=> (not res!1053496) (not e!855024))))

(assert (=> b!1536226 (= res!1053496 (not (= (select (arr!49228 a!2792) index!463) (select (arr!49228 a!2792) j!64))))))

(declare-fun res!1053490 () Bool)

(assert (=> start!130926 (=> (not res!1053490) (not e!855021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130926 (= res!1053490 (validMask!0 mask!2480))))

(assert (=> start!130926 e!855021))

(assert (=> start!130926 true))

(declare-fun array_inv!38461 (array!102022) Bool)

(assert (=> start!130926 (array_inv!38461 a!2792)))

(declare-fun b!1536224 () Bool)

(assert (=> b!1536224 (= e!855021 e!855024)))

(declare-fun res!1053486 () Bool)

(assert (=> b!1536224 (=> (not res!1053486) (not e!855024))))

(assert (=> b!1536224 (= res!1053486 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49228 a!2792) j!64) a!2792 mask!2480) lt!664095))))

(assert (=> b!1536224 (= lt!664095 (Found!13385 j!64))))

(assert (= (and start!130926 res!1053490) b!1536220))

(assert (= (and b!1536220 res!1053494) b!1536217))

(assert (= (and b!1536217 res!1053491) b!1536221))

(assert (= (and b!1536221 res!1053488) b!1536222))

(assert (= (and b!1536222 res!1053487) b!1536225))

(assert (= (and b!1536225 res!1053492) b!1536218))

(assert (= (and b!1536218 res!1053495) b!1536224))

(assert (= (and b!1536224 res!1053486) b!1536226))

(assert (= (and b!1536226 res!1053496) b!1536216))

(assert (= (and b!1536216 res!1053493) b!1536223))

(assert (= (and b!1536223 res!1053489) b!1536219))

(declare-fun m!1418105 () Bool)

(assert (=> b!1536224 m!1418105))

(assert (=> b!1536224 m!1418105))

(declare-fun m!1418107 () Bool)

(assert (=> b!1536224 m!1418107))

(declare-fun m!1418109 () Bool)

(assert (=> b!1536216 m!1418109))

(declare-fun m!1418111 () Bool)

(assert (=> b!1536225 m!1418111))

(declare-fun m!1418113 () Bool)

(assert (=> start!130926 m!1418113))

(declare-fun m!1418115 () Bool)

(assert (=> start!130926 m!1418115))

(declare-fun m!1418117 () Bool)

(assert (=> b!1536218 m!1418117))

(declare-fun m!1418119 () Bool)

(assert (=> b!1536219 m!1418119))

(declare-fun m!1418121 () Bool)

(assert (=> b!1536219 m!1418121))

(declare-fun m!1418123 () Bool)

(assert (=> b!1536219 m!1418123))

(assert (=> b!1536219 m!1418121))

(declare-fun m!1418125 () Bool)

(assert (=> b!1536219 m!1418125))

(declare-fun m!1418127 () Bool)

(assert (=> b!1536219 m!1418127))

(declare-fun m!1418129 () Bool)

(assert (=> b!1536217 m!1418129))

(assert (=> b!1536217 m!1418129))

(declare-fun m!1418131 () Bool)

(assert (=> b!1536217 m!1418131))

(declare-fun m!1418133 () Bool)

(assert (=> b!1536226 m!1418133))

(assert (=> b!1536226 m!1418105))

(assert (=> b!1536221 m!1418105))

(assert (=> b!1536221 m!1418105))

(declare-fun m!1418135 () Bool)

(assert (=> b!1536221 m!1418135))

(declare-fun m!1418137 () Bool)

(assert (=> b!1536222 m!1418137))

(assert (=> b!1536223 m!1418105))

(assert (=> b!1536223 m!1418105))

(declare-fun m!1418139 () Bool)

(assert (=> b!1536223 m!1418139))

(check-sat (not b!1536222) (not b!1536224) (not b!1536223) (not b!1536217) (not b!1536216) (not b!1536221) (not start!130926) (not b!1536225) (not b!1536219))
(check-sat)
