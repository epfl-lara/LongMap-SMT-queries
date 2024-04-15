; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130854 () Bool)

(assert start!130854)

(declare-fun b!1535081 () Bool)

(declare-fun e!854587 () Bool)

(assert (=> b!1535081 (= e!854587 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101950 0))(
  ( (array!101951 (arr!49192 (Array (_ BitVec 32) (_ BitVec 64))) (size!49744 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101950)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13349 0))(
  ( (MissingZero!13349 (index!55791 (_ BitVec 32))) (Found!13349 (index!55792 (_ BitVec 32))) (Intermediate!13349 (undefined!14161 Bool) (index!55793 (_ BitVec 32)) (x!137538 (_ BitVec 32))) (Undefined!13349) (MissingVacant!13349 (index!55794 (_ BitVec 32))) )
))
(declare-fun lt!663764 () SeekEntryResult!13349)

(declare-fun lt!663765 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101950 (_ BitVec 32)) SeekEntryResult!13349)

(assert (=> b!1535081 (= lt!663764 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663765 vacantIndex!5 (select (arr!49192 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535082 () Bool)

(declare-fun e!854585 () Bool)

(assert (=> b!1535082 (= e!854585 e!854587)))

(declare-fun res!1052351 () Bool)

(assert (=> b!1535082 (=> (not res!1052351) (not e!854587))))

(assert (=> b!1535082 (= res!1052351 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663765 #b00000000000000000000000000000000) (bvslt lt!663765 (size!49744 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535082 (= lt!663765 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535083 () Bool)

(declare-fun res!1052355 () Bool)

(assert (=> b!1535083 (=> (not res!1052355) (not e!854585))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535083 (= res!1052355 (and (= (size!49744 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49744 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49744 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535084 () Bool)

(declare-fun res!1052350 () Bool)

(assert (=> b!1535084 (=> (not res!1052350) (not e!854585))))

(assert (=> b!1535084 (= res!1052350 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49744 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49744 a!2792)) (= (select (arr!49192 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535085 () Bool)

(declare-fun res!1052357 () Bool)

(assert (=> b!1535085 (=> (not res!1052357) (not e!854585))))

(assert (=> b!1535085 (= res!1052357 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49192 a!2792) j!64) a!2792 mask!2480) (Found!13349 j!64)))))

(declare-fun b!1535086 () Bool)

(declare-fun res!1052354 () Bool)

(assert (=> b!1535086 (=> (not res!1052354) (not e!854585))))

(declare-datatypes ((List!35744 0))(
  ( (Nil!35741) (Cons!35740 (h!37186 (_ BitVec 64)) (t!50430 List!35744)) )
))
(declare-fun arrayNoDuplicates!0 (array!101950 (_ BitVec 32) List!35744) Bool)

(assert (=> b!1535086 (= res!1052354 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35741))))

(declare-fun b!1535087 () Bool)

(declare-fun res!1052356 () Bool)

(assert (=> b!1535087 (=> (not res!1052356) (not e!854585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535087 (= res!1052356 (validKeyInArray!0 (select (arr!49192 a!2792) j!64)))))

(declare-fun b!1535088 () Bool)

(declare-fun res!1052352 () Bool)

(assert (=> b!1535088 (=> (not res!1052352) (not e!854585))))

(assert (=> b!1535088 (= res!1052352 (validKeyInArray!0 (select (arr!49192 a!2792) i!951)))))

(declare-fun b!1535089 () Bool)

(declare-fun res!1052359 () Bool)

(assert (=> b!1535089 (=> (not res!1052359) (not e!854585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101950 (_ BitVec 32)) Bool)

(assert (=> b!1535089 (= res!1052359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535080 () Bool)

(declare-fun res!1052353 () Bool)

(assert (=> b!1535080 (=> (not res!1052353) (not e!854585))))

(assert (=> b!1535080 (= res!1052353 (not (= (select (arr!49192 a!2792) index!463) (select (arr!49192 a!2792) j!64))))))

(declare-fun res!1052358 () Bool)

(assert (=> start!130854 (=> (not res!1052358) (not e!854585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130854 (= res!1052358 (validMask!0 mask!2480))))

(assert (=> start!130854 e!854585))

(assert (=> start!130854 true))

(declare-fun array_inv!38425 (array!101950) Bool)

(assert (=> start!130854 (array_inv!38425 a!2792)))

(assert (= (and start!130854 res!1052358) b!1535083))

(assert (= (and b!1535083 res!1052355) b!1535088))

(assert (= (and b!1535088 res!1052352) b!1535087))

(assert (= (and b!1535087 res!1052356) b!1535089))

(assert (= (and b!1535089 res!1052359) b!1535086))

(assert (= (and b!1535086 res!1052354) b!1535084))

(assert (= (and b!1535084 res!1052350) b!1535085))

(assert (= (and b!1535085 res!1052357) b!1535080))

(assert (= (and b!1535080 res!1052353) b!1535082))

(assert (= (and b!1535082 res!1052351) b!1535081))

(declare-fun m!1417025 () Bool)

(assert (=> b!1535085 m!1417025))

(assert (=> b!1535085 m!1417025))

(declare-fun m!1417027 () Bool)

(assert (=> b!1535085 m!1417027))

(declare-fun m!1417029 () Bool)

(assert (=> b!1535086 m!1417029))

(declare-fun m!1417031 () Bool)

(assert (=> b!1535082 m!1417031))

(declare-fun m!1417033 () Bool)

(assert (=> b!1535084 m!1417033))

(declare-fun m!1417035 () Bool)

(assert (=> b!1535089 m!1417035))

(declare-fun m!1417037 () Bool)

(assert (=> b!1535088 m!1417037))

(assert (=> b!1535088 m!1417037))

(declare-fun m!1417039 () Bool)

(assert (=> b!1535088 m!1417039))

(assert (=> b!1535081 m!1417025))

(assert (=> b!1535081 m!1417025))

(declare-fun m!1417041 () Bool)

(assert (=> b!1535081 m!1417041))

(declare-fun m!1417043 () Bool)

(assert (=> b!1535080 m!1417043))

(assert (=> b!1535080 m!1417025))

(assert (=> b!1535087 m!1417025))

(assert (=> b!1535087 m!1417025))

(declare-fun m!1417045 () Bool)

(assert (=> b!1535087 m!1417045))

(declare-fun m!1417047 () Bool)

(assert (=> start!130854 m!1417047))

(declare-fun m!1417049 () Bool)

(assert (=> start!130854 m!1417049))

(check-sat (not b!1535086) (not b!1535081) (not b!1535085) (not start!130854) (not b!1535089) (not b!1535087) (not b!1535088) (not b!1535082))
(check-sat)
