; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130956 () Bool)

(assert start!130956)

(declare-fun b!1536199 () Bool)

(declare-fun res!1053287 () Bool)

(declare-fun e!855071 () Bool)

(assert (=> b!1536199 (=> (not res!1053287) (not e!855071))))

(declare-datatypes ((array!102054 0))(
  ( (array!102055 (arr!49243 (Array (_ BitVec 32) (_ BitVec 64))) (size!49793 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102054)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102054 (_ BitVec 32)) Bool)

(assert (=> b!1536199 (= res!1053287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536200 () Bool)

(declare-fun res!1053286 () Bool)

(assert (=> b!1536200 (=> (not res!1053286) (not e!855071))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536200 (= res!1053286 (and (= (size!49793 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49793 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49793 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1053285 () Bool)

(assert (=> start!130956 (=> (not res!1053285) (not e!855071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130956 (= res!1053285 (validMask!0 mask!2480))))

(assert (=> start!130956 e!855071))

(assert (=> start!130956 true))

(declare-fun array_inv!38271 (array!102054) Bool)

(assert (=> start!130956 (array_inv!38271 a!2792)))

(declare-fun b!1536201 () Bool)

(declare-fun res!1053291 () Bool)

(assert (=> b!1536201 (=> (not res!1053291) (not e!855071))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536201 (= res!1053291 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49793 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49793 a!2792)) (= (select (arr!49243 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536202 () Bool)

(declare-fun e!855069 () Bool)

(assert (=> b!1536202 (= e!855071 e!855069)))

(declare-fun res!1053292 () Bool)

(assert (=> b!1536202 (=> (not res!1053292) (not e!855069))))

(declare-datatypes ((SeekEntryResult!13375 0))(
  ( (MissingZero!13375 (index!55895 (_ BitVec 32))) (Found!13375 (index!55896 (_ BitVec 32))) (Intermediate!13375 (undefined!14187 Bool) (index!55897 (_ BitVec 32)) (x!137633 (_ BitVec 32))) (Undefined!13375) (MissingVacant!13375 (index!55898 (_ BitVec 32))) )
))
(declare-fun lt!664260 () SeekEntryResult!13375)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102054 (_ BitVec 32)) SeekEntryResult!13375)

(assert (=> b!1536202 (= res!1053292 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480) lt!664260))))

(assert (=> b!1536202 (= lt!664260 (Found!13375 j!64))))

(declare-fun b!1536203 () Bool)

(declare-fun res!1053288 () Bool)

(assert (=> b!1536203 (=> (not res!1053288) (not e!855069))))

(assert (=> b!1536203 (= res!1053288 (not (= (select (arr!49243 a!2792) index!463) (select (arr!49243 a!2792) j!64))))))

(declare-fun b!1536204 () Bool)

(declare-fun res!1053295 () Bool)

(assert (=> b!1536204 (=> (not res!1053295) (not e!855071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536204 (= res!1053295 (validKeyInArray!0 (select (arr!49243 a!2792) i!951)))))

(declare-fun b!1536205 () Bool)

(declare-fun e!855073 () Bool)

(assert (=> b!1536205 (= e!855073 (not true))))

(declare-fun lt!664261 () (_ BitVec 32))

(declare-fun lt!664258 () SeekEntryResult!13375)

(assert (=> b!1536205 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664261 vacantIndex!5 (select (store (arr!49243 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102055 (store (arr!49243 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49793 a!2792)) mask!2480) lt!664258)))

(declare-datatypes ((Unit!51322 0))(
  ( (Unit!51323) )
))
(declare-fun lt!664259 () Unit!51322)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51322)

(assert (=> b!1536205 (= lt!664259 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664261 vacantIndex!5 mask!2480))))

(declare-fun b!1536206 () Bool)

(declare-fun e!855072 () Bool)

(assert (=> b!1536206 (= e!855069 e!855072)))

(declare-fun res!1053294 () Bool)

(assert (=> b!1536206 (=> (not res!1053294) (not e!855072))))

(assert (=> b!1536206 (= res!1053294 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664261 #b00000000000000000000000000000000) (bvslt lt!664261 (size!49793 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536206 (= lt!664261 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536207 () Bool)

(declare-fun res!1053289 () Bool)

(assert (=> b!1536207 (=> (not res!1053289) (not e!855071))))

(declare-datatypes ((List!35717 0))(
  ( (Nil!35714) (Cons!35713 (h!37158 (_ BitVec 64)) (t!50411 List!35717)) )
))
(declare-fun arrayNoDuplicates!0 (array!102054 (_ BitVec 32) List!35717) Bool)

(assert (=> b!1536207 (= res!1053289 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35714))))

(declare-fun b!1536208 () Bool)

(assert (=> b!1536208 (= e!855072 e!855073)))

(declare-fun res!1053290 () Bool)

(assert (=> b!1536208 (=> (not res!1053290) (not e!855073))))

(assert (=> b!1536208 (= res!1053290 (= lt!664258 lt!664260))))

(assert (=> b!1536208 (= lt!664258 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664261 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536209 () Bool)

(declare-fun res!1053293 () Bool)

(assert (=> b!1536209 (=> (not res!1053293) (not e!855071))))

(assert (=> b!1536209 (= res!1053293 (validKeyInArray!0 (select (arr!49243 a!2792) j!64)))))

(assert (= (and start!130956 res!1053285) b!1536200))

(assert (= (and b!1536200 res!1053286) b!1536204))

(assert (= (and b!1536204 res!1053295) b!1536209))

(assert (= (and b!1536209 res!1053293) b!1536199))

(assert (= (and b!1536199 res!1053287) b!1536207))

(assert (= (and b!1536207 res!1053289) b!1536201))

(assert (= (and b!1536201 res!1053291) b!1536202))

(assert (= (and b!1536202 res!1053292) b!1536203))

(assert (= (and b!1536203 res!1053288) b!1536206))

(assert (= (and b!1536206 res!1053294) b!1536208))

(assert (= (and b!1536208 res!1053290) b!1536205))

(declare-fun m!1418657 () Bool)

(assert (=> b!1536201 m!1418657))

(declare-fun m!1418659 () Bool)

(assert (=> b!1536202 m!1418659))

(assert (=> b!1536202 m!1418659))

(declare-fun m!1418661 () Bool)

(assert (=> b!1536202 m!1418661))

(declare-fun m!1418663 () Bool)

(assert (=> b!1536199 m!1418663))

(declare-fun m!1418665 () Bool)

(assert (=> start!130956 m!1418665))

(declare-fun m!1418667 () Bool)

(assert (=> start!130956 m!1418667))

(declare-fun m!1418669 () Bool)

(assert (=> b!1536203 m!1418669))

(assert (=> b!1536203 m!1418659))

(declare-fun m!1418671 () Bool)

(assert (=> b!1536204 m!1418671))

(assert (=> b!1536204 m!1418671))

(declare-fun m!1418673 () Bool)

(assert (=> b!1536204 m!1418673))

(declare-fun m!1418675 () Bool)

(assert (=> b!1536206 m!1418675))

(assert (=> b!1536209 m!1418659))

(assert (=> b!1536209 m!1418659))

(declare-fun m!1418677 () Bool)

(assert (=> b!1536209 m!1418677))

(declare-fun m!1418679 () Bool)

(assert (=> b!1536207 m!1418679))

(assert (=> b!1536208 m!1418659))

(assert (=> b!1536208 m!1418659))

(declare-fun m!1418681 () Bool)

(assert (=> b!1536208 m!1418681))

(declare-fun m!1418683 () Bool)

(assert (=> b!1536205 m!1418683))

(declare-fun m!1418685 () Bool)

(assert (=> b!1536205 m!1418685))

(assert (=> b!1536205 m!1418685))

(declare-fun m!1418687 () Bool)

(assert (=> b!1536205 m!1418687))

(declare-fun m!1418689 () Bool)

(assert (=> b!1536205 m!1418689))

(push 1)

(assert (not start!130956))

(assert (not b!1536207))

(assert (not b!1536209))

