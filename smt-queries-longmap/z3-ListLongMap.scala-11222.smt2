; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130914 () Bool)

(assert start!130914)

(declare-fun b!1536018 () Bool)

(declare-fun e!854931 () Bool)

(assert (=> b!1536018 (= e!854931 (not true))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102010 0))(
  ( (array!102011 (arr!49222 (Array (_ BitVec 32) (_ BitVec 64))) (size!49774 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102010)

(declare-datatypes ((SeekEntryResult!13379 0))(
  ( (MissingZero!13379 (index!55911 (_ BitVec 32))) (Found!13379 (index!55912 (_ BitVec 32))) (Intermediate!13379 (undefined!14191 Bool) (index!55913 (_ BitVec 32)) (x!137648 (_ BitVec 32))) (Undefined!13379) (MissingVacant!13379 (index!55914 (_ BitVec 32))) )
))
(declare-fun lt!664022 () SeekEntryResult!13379)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664020 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102010 (_ BitVec 32)) SeekEntryResult!13379)

(assert (=> b!1536018 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664020 vacantIndex!5 (select (store (arr!49222 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102011 (store (arr!49222 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49774 a!2792)) mask!2480) lt!664022)))

(declare-datatypes ((Unit!51165 0))(
  ( (Unit!51166) )
))
(declare-fun lt!664023 () Unit!51165)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51165)

(assert (=> b!1536018 (= lt!664023 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664020 vacantIndex!5 mask!2480))))

(declare-fun b!1536019 () Bool)

(declare-fun res!1053297 () Bool)

(declare-fun e!854933 () Bool)

(assert (=> b!1536019 (=> (not res!1053297) (not e!854933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102010 (_ BitVec 32)) Bool)

(assert (=> b!1536019 (= res!1053297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536020 () Bool)

(declare-fun res!1053294 () Bool)

(assert (=> b!1536020 (=> (not res!1053294) (not e!854933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536020 (= res!1053294 (validKeyInArray!0 (select (arr!49222 a!2792) i!951)))))

(declare-fun b!1536021 () Bool)

(declare-fun res!1053291 () Bool)

(declare-fun e!854935 () Bool)

(assert (=> b!1536021 (=> (not res!1053291) (not e!854935))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536021 (= res!1053291 (not (= (select (arr!49222 a!2792) index!463) (select (arr!49222 a!2792) j!64))))))

(declare-fun b!1536022 () Bool)

(declare-fun res!1053298 () Bool)

(assert (=> b!1536022 (=> (not res!1053298) (not e!854933))))

(assert (=> b!1536022 (= res!1053298 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49774 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49774 a!2792)) (= (select (arr!49222 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536023 () Bool)

(declare-fun res!1053289 () Bool)

(assert (=> b!1536023 (=> (not res!1053289) (not e!854933))))

(assert (=> b!1536023 (= res!1053289 (and (= (size!49774 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49774 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49774 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536024 () Bool)

(declare-fun res!1053292 () Bool)

(assert (=> b!1536024 (=> (not res!1053292) (not e!854933))))

(declare-datatypes ((List!35774 0))(
  ( (Nil!35771) (Cons!35770 (h!37216 (_ BitVec 64)) (t!50460 List!35774)) )
))
(declare-fun arrayNoDuplicates!0 (array!102010 (_ BitVec 32) List!35774) Bool)

(assert (=> b!1536024 (= res!1053292 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35771))))

(declare-fun b!1536025 () Bool)

(assert (=> b!1536025 (= e!854933 e!854935)))

(declare-fun res!1053295 () Bool)

(assert (=> b!1536025 (=> (not res!1053295) (not e!854935))))

(declare-fun lt!664021 () SeekEntryResult!13379)

(assert (=> b!1536025 (= res!1053295 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49222 a!2792) j!64) a!2792 mask!2480) lt!664021))))

(assert (=> b!1536025 (= lt!664021 (Found!13379 j!64))))

(declare-fun res!1053290 () Bool)

(assert (=> start!130914 (=> (not res!1053290) (not e!854933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130914 (= res!1053290 (validMask!0 mask!2480))))

(assert (=> start!130914 e!854933))

(assert (=> start!130914 true))

(declare-fun array_inv!38455 (array!102010) Bool)

(assert (=> start!130914 (array_inv!38455 a!2792)))

(declare-fun b!1536026 () Bool)

(declare-fun e!854932 () Bool)

(assert (=> b!1536026 (= e!854932 e!854931)))

(declare-fun res!1053288 () Bool)

(assert (=> b!1536026 (=> (not res!1053288) (not e!854931))))

(assert (=> b!1536026 (= res!1053288 (= lt!664022 lt!664021))))

(assert (=> b!1536026 (= lt!664022 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664020 vacantIndex!5 (select (arr!49222 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536027 () Bool)

(declare-fun res!1053296 () Bool)

(assert (=> b!1536027 (=> (not res!1053296) (not e!854933))))

(assert (=> b!1536027 (= res!1053296 (validKeyInArray!0 (select (arr!49222 a!2792) j!64)))))

(declare-fun b!1536028 () Bool)

(assert (=> b!1536028 (= e!854935 e!854932)))

(declare-fun res!1053293 () Bool)

(assert (=> b!1536028 (=> (not res!1053293) (not e!854932))))

(assert (=> b!1536028 (= res!1053293 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664020 #b00000000000000000000000000000000) (bvslt lt!664020 (size!49774 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536028 (= lt!664020 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130914 res!1053290) b!1536023))

(assert (= (and b!1536023 res!1053289) b!1536020))

(assert (= (and b!1536020 res!1053294) b!1536027))

(assert (= (and b!1536027 res!1053296) b!1536019))

(assert (= (and b!1536019 res!1053297) b!1536024))

(assert (= (and b!1536024 res!1053292) b!1536022))

(assert (= (and b!1536022 res!1053298) b!1536025))

(assert (= (and b!1536025 res!1053295) b!1536021))

(assert (= (and b!1536021 res!1053291) b!1536028))

(assert (= (and b!1536028 res!1053293) b!1536026))

(assert (= (and b!1536026 res!1053288) b!1536018))

(declare-fun m!1417901 () Bool)

(assert (=> b!1536027 m!1417901))

(assert (=> b!1536027 m!1417901))

(declare-fun m!1417903 () Bool)

(assert (=> b!1536027 m!1417903))

(declare-fun m!1417905 () Bool)

(assert (=> b!1536021 m!1417905))

(assert (=> b!1536021 m!1417901))

(assert (=> b!1536026 m!1417901))

(assert (=> b!1536026 m!1417901))

(declare-fun m!1417907 () Bool)

(assert (=> b!1536026 m!1417907))

(declare-fun m!1417909 () Bool)

(assert (=> start!130914 m!1417909))

(declare-fun m!1417911 () Bool)

(assert (=> start!130914 m!1417911))

(declare-fun m!1417913 () Bool)

(assert (=> b!1536020 m!1417913))

(assert (=> b!1536020 m!1417913))

(declare-fun m!1417915 () Bool)

(assert (=> b!1536020 m!1417915))

(assert (=> b!1536025 m!1417901))

(assert (=> b!1536025 m!1417901))

(declare-fun m!1417917 () Bool)

(assert (=> b!1536025 m!1417917))

(declare-fun m!1417919 () Bool)

(assert (=> b!1536018 m!1417919))

(declare-fun m!1417921 () Bool)

(assert (=> b!1536018 m!1417921))

(assert (=> b!1536018 m!1417921))

(declare-fun m!1417923 () Bool)

(assert (=> b!1536018 m!1417923))

(declare-fun m!1417925 () Bool)

(assert (=> b!1536018 m!1417925))

(declare-fun m!1417927 () Bool)

(assert (=> b!1536024 m!1417927))

(declare-fun m!1417929 () Bool)

(assert (=> b!1536019 m!1417929))

(declare-fun m!1417931 () Bool)

(assert (=> b!1536022 m!1417931))

(declare-fun m!1417933 () Bool)

(assert (=> b!1536028 m!1417933))

(check-sat (not b!1536019) (not b!1536020) (not b!1536018) (not b!1536026) (not b!1536025) (not start!130914) (not b!1536024) (not b!1536028) (not b!1536027))
(check-sat)
