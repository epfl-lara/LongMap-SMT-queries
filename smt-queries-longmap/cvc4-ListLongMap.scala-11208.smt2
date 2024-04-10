; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130884 () Bool)

(assert start!130884)

(declare-fun b!1535093 () Bool)

(declare-fun res!1052186 () Bool)

(declare-fun e!854694 () Bool)

(assert (=> b!1535093 (=> (not res!1052186) (not e!854694))))

(declare-datatypes ((array!101982 0))(
  ( (array!101983 (arr!49207 (Array (_ BitVec 32) (_ BitVec 64))) (size!49757 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101982)

(declare-datatypes ((List!35681 0))(
  ( (Nil!35678) (Cons!35677 (h!37122 (_ BitVec 64)) (t!50375 List!35681)) )
))
(declare-fun arrayNoDuplicates!0 (array!101982 (_ BitVec 32) List!35681) Bool)

(assert (=> b!1535093 (= res!1052186 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35678))))

(declare-fun b!1535094 () Bool)

(declare-fun e!854695 () Bool)

(assert (=> b!1535094 (= e!854694 e!854695)))

(declare-fun res!1052187 () Bool)

(assert (=> b!1535094 (=> (not res!1052187) (not e!854695))))

(declare-fun lt!663991 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1535094 (= res!1052187 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663991 #b00000000000000000000000000000000) (bvslt lt!663991 (size!49757 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535094 (= lt!663991 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535095 () Bool)

(declare-fun res!1052188 () Bool)

(assert (=> b!1535095 (=> (not res!1052188) (not e!854694))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535095 (= res!1052188 (validKeyInArray!0 (select (arr!49207 a!2792) i!951)))))

(declare-fun b!1535096 () Bool)

(declare-fun res!1052179 () Bool)

(assert (=> b!1535096 (=> (not res!1052179) (not e!854694))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535096 (= res!1052179 (and (= (size!49757 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49757 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49757 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1052180 () Bool)

(assert (=> start!130884 (=> (not res!1052180) (not e!854694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130884 (= res!1052180 (validMask!0 mask!2480))))

(assert (=> start!130884 e!854694))

(assert (=> start!130884 true))

(declare-fun array_inv!38235 (array!101982) Bool)

(assert (=> start!130884 (array_inv!38235 a!2792)))

(declare-fun b!1535097 () Bool)

(assert (=> b!1535097 (= e!854695 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13339 0))(
  ( (MissingZero!13339 (index!55751 (_ BitVec 32))) (Found!13339 (index!55752 (_ BitVec 32))) (Intermediate!13339 (undefined!14151 Bool) (index!55753 (_ BitVec 32)) (x!137501 (_ BitVec 32))) (Undefined!13339) (MissingVacant!13339 (index!55754 (_ BitVec 32))) )
))
(declare-fun lt!663990 () SeekEntryResult!13339)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101982 (_ BitVec 32)) SeekEntryResult!13339)

(assert (=> b!1535097 (= lt!663990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663991 vacantIndex!5 (select (arr!49207 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535098 () Bool)

(declare-fun res!1052185 () Bool)

(assert (=> b!1535098 (=> (not res!1052185) (not e!854694))))

(assert (=> b!1535098 (= res!1052185 (not (= (select (arr!49207 a!2792) index!463) (select (arr!49207 a!2792) j!64))))))

(declare-fun b!1535099 () Bool)

(declare-fun res!1052182 () Bool)

(assert (=> b!1535099 (=> (not res!1052182) (not e!854694))))

(assert (=> b!1535099 (= res!1052182 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49207 a!2792) j!64) a!2792 mask!2480) (Found!13339 j!64)))))

(declare-fun b!1535100 () Bool)

(declare-fun res!1052184 () Bool)

(assert (=> b!1535100 (=> (not res!1052184) (not e!854694))))

(assert (=> b!1535100 (= res!1052184 (validKeyInArray!0 (select (arr!49207 a!2792) j!64)))))

(declare-fun b!1535101 () Bool)

(declare-fun res!1052183 () Bool)

(assert (=> b!1535101 (=> (not res!1052183) (not e!854694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101982 (_ BitVec 32)) Bool)

(assert (=> b!1535101 (= res!1052183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535102 () Bool)

(declare-fun res!1052181 () Bool)

(assert (=> b!1535102 (=> (not res!1052181) (not e!854694))))

(assert (=> b!1535102 (= res!1052181 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49757 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49757 a!2792)) (= (select (arr!49207 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130884 res!1052180) b!1535096))

(assert (= (and b!1535096 res!1052179) b!1535095))

(assert (= (and b!1535095 res!1052188) b!1535100))

(assert (= (and b!1535100 res!1052184) b!1535101))

(assert (= (and b!1535101 res!1052183) b!1535093))

(assert (= (and b!1535093 res!1052186) b!1535102))

(assert (= (and b!1535102 res!1052181) b!1535099))

(assert (= (and b!1535099 res!1052182) b!1535098))

(assert (= (and b!1535098 res!1052185) b!1535094))

(assert (= (and b!1535094 res!1052187) b!1535097))

(declare-fun m!1417657 () Bool)

(assert (=> b!1535102 m!1417657))

(declare-fun m!1417659 () Bool)

(assert (=> b!1535093 m!1417659))

(declare-fun m!1417661 () Bool)

(assert (=> b!1535097 m!1417661))

(assert (=> b!1535097 m!1417661))

(declare-fun m!1417663 () Bool)

(assert (=> b!1535097 m!1417663))

(assert (=> b!1535099 m!1417661))

(assert (=> b!1535099 m!1417661))

(declare-fun m!1417665 () Bool)

(assert (=> b!1535099 m!1417665))

(declare-fun m!1417667 () Bool)

(assert (=> start!130884 m!1417667))

(declare-fun m!1417669 () Bool)

(assert (=> start!130884 m!1417669))

(declare-fun m!1417671 () Bool)

(assert (=> b!1535095 m!1417671))

(assert (=> b!1535095 m!1417671))

(declare-fun m!1417673 () Bool)

(assert (=> b!1535095 m!1417673))

(assert (=> b!1535100 m!1417661))

(assert (=> b!1535100 m!1417661))

(declare-fun m!1417675 () Bool)

(assert (=> b!1535100 m!1417675))

(declare-fun m!1417677 () Bool)

(assert (=> b!1535094 m!1417677))

(declare-fun m!1417679 () Bool)

(assert (=> b!1535098 m!1417679))

(assert (=> b!1535098 m!1417661))

(declare-fun m!1417681 () Bool)

(assert (=> b!1535101 m!1417681))

(push 1)

(assert (not b!1535093))

(assert (not b!1535095))

(assert (not b!1535094))

(assert (not start!130884))

(assert (not b!1535097))

(assert (not b!1535100))

(assert (not b!1535101))

(assert (not b!1535099))

(check-sat)

