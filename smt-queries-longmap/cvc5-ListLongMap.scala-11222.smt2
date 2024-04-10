; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130964 () Bool)

(assert start!130964)

(declare-fun b!1536331 () Bool)

(declare-fun e!855129 () Bool)

(assert (=> b!1536331 (= e!855129 (not true))))

(declare-fun lt!664308 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102062 0))(
  ( (array!102063 (arr!49247 (Array (_ BitVec 32) (_ BitVec 64))) (size!49797 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102062)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13379 0))(
  ( (MissingZero!13379 (index!55911 (_ BitVec 32))) (Found!13379 (index!55912 (_ BitVec 32))) (Intermediate!13379 (undefined!14191 Bool) (index!55913 (_ BitVec 32)) (x!137653 (_ BitVec 32))) (Undefined!13379) (MissingVacant!13379 (index!55914 (_ BitVec 32))) )
))
(declare-fun lt!664307 () SeekEntryResult!13379)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102062 (_ BitVec 32)) SeekEntryResult!13379)

(assert (=> b!1536331 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664308 vacantIndex!5 (select (store (arr!49247 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102063 (store (arr!49247 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49797 a!2792)) mask!2480) lt!664307)))

(declare-datatypes ((Unit!51330 0))(
  ( (Unit!51331) )
))
(declare-fun lt!664306 () Unit!51330)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51330)

(assert (=> b!1536331 (= lt!664306 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664308 vacantIndex!5 mask!2480))))

(declare-fun b!1536332 () Bool)

(declare-fun res!1053418 () Bool)

(declare-fun e!855132 () Bool)

(assert (=> b!1536332 (=> (not res!1053418) (not e!855132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102062 (_ BitVec 32)) Bool)

(assert (=> b!1536332 (= res!1053418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536333 () Bool)

(declare-fun res!1053423 () Bool)

(declare-fun e!855130 () Bool)

(assert (=> b!1536333 (=> (not res!1053423) (not e!855130))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536333 (= res!1053423 (not (= (select (arr!49247 a!2792) index!463) (select (arr!49247 a!2792) j!64))))))

(declare-fun b!1536334 () Bool)

(declare-fun res!1053426 () Bool)

(assert (=> b!1536334 (=> (not res!1053426) (not e!855132))))

(declare-datatypes ((List!35721 0))(
  ( (Nil!35718) (Cons!35717 (h!37162 (_ BitVec 64)) (t!50415 List!35721)) )
))
(declare-fun arrayNoDuplicates!0 (array!102062 (_ BitVec 32) List!35721) Bool)

(assert (=> b!1536334 (= res!1053426 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35718))))

(declare-fun b!1536335 () Bool)

(declare-fun res!1053419 () Bool)

(assert (=> b!1536335 (=> (not res!1053419) (not e!855132))))

(assert (=> b!1536335 (= res!1053419 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49797 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49797 a!2792)) (= (select (arr!49247 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536336 () Bool)

(assert (=> b!1536336 (= e!855132 e!855130)))

(declare-fun res!1053425 () Bool)

(assert (=> b!1536336 (=> (not res!1053425) (not e!855130))))

(declare-fun lt!664309 () SeekEntryResult!13379)

(assert (=> b!1536336 (= res!1053425 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49247 a!2792) j!64) a!2792 mask!2480) lt!664309))))

(assert (=> b!1536336 (= lt!664309 (Found!13379 j!64))))

(declare-fun res!1053427 () Bool)

(assert (=> start!130964 (=> (not res!1053427) (not e!855132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130964 (= res!1053427 (validMask!0 mask!2480))))

(assert (=> start!130964 e!855132))

(assert (=> start!130964 true))

(declare-fun array_inv!38275 (array!102062) Bool)

(assert (=> start!130964 (array_inv!38275 a!2792)))

(declare-fun b!1536337 () Bool)

(declare-fun res!1053417 () Bool)

(assert (=> b!1536337 (=> (not res!1053417) (not e!855132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536337 (= res!1053417 (validKeyInArray!0 (select (arr!49247 a!2792) i!951)))))

(declare-fun b!1536338 () Bool)

(declare-fun res!1053422 () Bool)

(assert (=> b!1536338 (=> (not res!1053422) (not e!855132))))

(assert (=> b!1536338 (= res!1053422 (and (= (size!49797 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49797 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49797 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536339 () Bool)

(declare-fun e!855131 () Bool)

(assert (=> b!1536339 (= e!855131 e!855129)))

(declare-fun res!1053420 () Bool)

(assert (=> b!1536339 (=> (not res!1053420) (not e!855129))))

(assert (=> b!1536339 (= res!1053420 (= lt!664307 lt!664309))))

(assert (=> b!1536339 (= lt!664307 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664308 vacantIndex!5 (select (arr!49247 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536340 () Bool)

(assert (=> b!1536340 (= e!855130 e!855131)))

(declare-fun res!1053424 () Bool)

(assert (=> b!1536340 (=> (not res!1053424) (not e!855131))))

(assert (=> b!1536340 (= res!1053424 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664308 #b00000000000000000000000000000000) (bvslt lt!664308 (size!49797 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536340 (= lt!664308 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536341 () Bool)

(declare-fun res!1053421 () Bool)

(assert (=> b!1536341 (=> (not res!1053421) (not e!855132))))

(assert (=> b!1536341 (= res!1053421 (validKeyInArray!0 (select (arr!49247 a!2792) j!64)))))

(assert (= (and start!130964 res!1053427) b!1536338))

(assert (= (and b!1536338 res!1053422) b!1536337))

(assert (= (and b!1536337 res!1053417) b!1536341))

(assert (= (and b!1536341 res!1053421) b!1536332))

(assert (= (and b!1536332 res!1053418) b!1536334))

(assert (= (and b!1536334 res!1053426) b!1536335))

(assert (= (and b!1536335 res!1053419) b!1536336))

(assert (= (and b!1536336 res!1053425) b!1536333))

(assert (= (and b!1536333 res!1053423) b!1536340))

(assert (= (and b!1536340 res!1053424) b!1536339))

(assert (= (and b!1536339 res!1053420) b!1536331))

(declare-fun m!1418793 () Bool)

(assert (=> b!1536334 m!1418793))

(declare-fun m!1418795 () Bool)

(assert (=> b!1536333 m!1418795))

(declare-fun m!1418797 () Bool)

(assert (=> b!1536333 m!1418797))

(declare-fun m!1418799 () Bool)

(assert (=> b!1536337 m!1418799))

(assert (=> b!1536337 m!1418799))

(declare-fun m!1418801 () Bool)

(assert (=> b!1536337 m!1418801))

(declare-fun m!1418803 () Bool)

(assert (=> b!1536335 m!1418803))

(declare-fun m!1418805 () Bool)

(assert (=> b!1536340 m!1418805))

(assert (=> b!1536339 m!1418797))

(assert (=> b!1536339 m!1418797))

(declare-fun m!1418807 () Bool)

(assert (=> b!1536339 m!1418807))

(assert (=> b!1536336 m!1418797))

(assert (=> b!1536336 m!1418797))

(declare-fun m!1418809 () Bool)

(assert (=> b!1536336 m!1418809))

(declare-fun m!1418811 () Bool)

(assert (=> b!1536331 m!1418811))

(declare-fun m!1418813 () Bool)

(assert (=> b!1536331 m!1418813))

(assert (=> b!1536331 m!1418813))

(declare-fun m!1418815 () Bool)

(assert (=> b!1536331 m!1418815))

(declare-fun m!1418817 () Bool)

(assert (=> b!1536331 m!1418817))

(declare-fun m!1418819 () Bool)

(assert (=> b!1536332 m!1418819))

(assert (=> b!1536341 m!1418797))

(assert (=> b!1536341 m!1418797))

(declare-fun m!1418821 () Bool)

(assert (=> b!1536341 m!1418821))

(declare-fun m!1418823 () Bool)

(assert (=> start!130964 m!1418823))

(declare-fun m!1418825 () Bool)

(assert (=> start!130964 m!1418825))

(push 1)

