; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130996 () Bool)

(assert start!130996)

(declare-fun b!1536868 () Bool)

(declare-fun res!1053963 () Bool)

(declare-fun e!855380 () Bool)

(assert (=> b!1536868 (=> (not res!1053963) (not e!855380))))

(declare-datatypes ((array!102094 0))(
  ( (array!102095 (arr!49263 (Array (_ BitVec 32) (_ BitVec 64))) (size!49813 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102094)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102094 (_ BitVec 32)) Bool)

(assert (=> b!1536868 (= res!1053963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536869 () Bool)

(declare-fun res!1053956 () Bool)

(assert (=> b!1536869 (=> (not res!1053956) (not e!855380))))

(declare-datatypes ((List!35737 0))(
  ( (Nil!35734) (Cons!35733 (h!37178 (_ BitVec 64)) (t!50431 List!35737)) )
))
(declare-fun arrayNoDuplicates!0 (array!102094 (_ BitVec 32) List!35737) Bool)

(assert (=> b!1536869 (= res!1053956 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35734))))

(declare-fun res!1053959 () Bool)

(assert (=> start!130996 (=> (not res!1053959) (not e!855380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130996 (= res!1053959 (validMask!0 mask!2480))))

(assert (=> start!130996 e!855380))

(assert (=> start!130996 true))

(declare-fun array_inv!38291 (array!102094) Bool)

(assert (=> start!130996 (array_inv!38291 a!2792)))

(declare-fun b!1536870 () Bool)

(declare-fun e!855382 () Bool)

(declare-fun e!855381 () Bool)

(assert (=> b!1536870 (= e!855382 e!855381)))

(declare-fun res!1053964 () Bool)

(assert (=> b!1536870 (=> (not res!1053964) (not e!855381))))

(declare-datatypes ((SeekEntryResult!13395 0))(
  ( (MissingZero!13395 (index!55975 (_ BitVec 32))) (Found!13395 (index!55976 (_ BitVec 32))) (Intermediate!13395 (undefined!14207 Bool) (index!55977 (_ BitVec 32)) (x!137709 (_ BitVec 32))) (Undefined!13395) (MissingVacant!13395 (index!55978 (_ BitVec 32))) )
))
(declare-fun lt!664508 () SeekEntryResult!13395)

(declare-fun lt!664507 () SeekEntryResult!13395)

(assert (=> b!1536870 (= res!1053964 (= lt!664508 lt!664507))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102094 (_ BitVec 32)) SeekEntryResult!13395)

(assert (=> b!1536870 (= lt!664508 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664510 vacantIndex!5 (select (arr!49263 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536871 () Bool)

(declare-fun res!1053957 () Bool)

(assert (=> b!1536871 (=> (not res!1053957) (not e!855380))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536871 (= res!1053957 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49813 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49813 a!2792)) (= (select (arr!49263 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536872 () Bool)

(declare-fun res!1053958 () Bool)

(declare-fun e!855379 () Bool)

(assert (=> b!1536872 (=> (not res!1053958) (not e!855379))))

(assert (=> b!1536872 (= res!1053958 (not (= (select (arr!49263 a!2792) index!463) (select (arr!49263 a!2792) j!64))))))

(declare-fun b!1536873 () Bool)

(declare-fun res!1053960 () Bool)

(assert (=> b!1536873 (=> (not res!1053960) (not e!855380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536873 (= res!1053960 (validKeyInArray!0 (select (arr!49263 a!2792) j!64)))))

(declare-fun b!1536874 () Bool)

(declare-fun res!1053955 () Bool)

(assert (=> b!1536874 (=> (not res!1053955) (not e!855380))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536874 (= res!1053955 (and (= (size!49813 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49813 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49813 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536875 () Bool)

(assert (=> b!1536875 (= e!855380 e!855379)))

(declare-fun res!1053962 () Bool)

(assert (=> b!1536875 (=> (not res!1053962) (not e!855379))))

(assert (=> b!1536875 (= res!1053962 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49263 a!2792) j!64) a!2792 mask!2480) lt!664507))))

(assert (=> b!1536875 (= lt!664507 (Found!13395 j!64))))

(declare-fun b!1536876 () Bool)

(assert (=> b!1536876 (= e!855381 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1536876 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664510 vacantIndex!5 (select (store (arr!49263 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102095 (store (arr!49263 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49813 a!2792)) mask!2480) lt!664508)))

(declare-datatypes ((Unit!51362 0))(
  ( (Unit!51363) )
))
(declare-fun lt!664509 () Unit!51362)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51362)

(assert (=> b!1536876 (= lt!664509 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664510 vacantIndex!5 mask!2480))))

(declare-fun b!1536877 () Bool)

(declare-fun res!1053954 () Bool)

(assert (=> b!1536877 (=> (not res!1053954) (not e!855380))))

(assert (=> b!1536877 (= res!1053954 (validKeyInArray!0 (select (arr!49263 a!2792) i!951)))))

(declare-fun b!1536878 () Bool)

(assert (=> b!1536878 (= e!855379 e!855382)))

(declare-fun res!1053961 () Bool)

(assert (=> b!1536878 (=> (not res!1053961) (not e!855382))))

(assert (=> b!1536878 (= res!1053961 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664510 #b00000000000000000000000000000000) (bvslt lt!664510 (size!49813 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536878 (= lt!664510 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130996 res!1053959) b!1536874))

(assert (= (and b!1536874 res!1053955) b!1536877))

(assert (= (and b!1536877 res!1053954) b!1536873))

(assert (= (and b!1536873 res!1053960) b!1536868))

(assert (= (and b!1536868 res!1053963) b!1536869))

(assert (= (and b!1536869 res!1053956) b!1536871))

(assert (= (and b!1536871 res!1053957) b!1536875))

(assert (= (and b!1536875 res!1053962) b!1536872))

(assert (= (and b!1536872 res!1053958) b!1536878))

(assert (= (and b!1536878 res!1053961) b!1536870))

(assert (= (and b!1536870 res!1053964) b!1536876))

(declare-fun m!1419355 () Bool)

(assert (=> b!1536869 m!1419355))

(declare-fun m!1419357 () Bool)

(assert (=> b!1536871 m!1419357))

(declare-fun m!1419359 () Bool)

(assert (=> b!1536877 m!1419359))

(assert (=> b!1536877 m!1419359))

(declare-fun m!1419361 () Bool)

(assert (=> b!1536877 m!1419361))

(declare-fun m!1419363 () Bool)

(assert (=> b!1536872 m!1419363))

(declare-fun m!1419365 () Bool)

(assert (=> b!1536872 m!1419365))

(assert (=> b!1536875 m!1419365))

(assert (=> b!1536875 m!1419365))

(declare-fun m!1419367 () Bool)

(assert (=> b!1536875 m!1419367))

(assert (=> b!1536873 m!1419365))

(assert (=> b!1536873 m!1419365))

(declare-fun m!1419369 () Bool)

(assert (=> b!1536873 m!1419369))

(declare-fun m!1419371 () Bool)

(assert (=> start!130996 m!1419371))

(declare-fun m!1419373 () Bool)

(assert (=> start!130996 m!1419373))

(declare-fun m!1419375 () Bool)

(assert (=> b!1536868 m!1419375))

(declare-fun m!1419377 () Bool)

(assert (=> b!1536876 m!1419377))

(declare-fun m!1419379 () Bool)

(assert (=> b!1536876 m!1419379))

(assert (=> b!1536876 m!1419379))

(declare-fun m!1419381 () Bool)

(assert (=> b!1536876 m!1419381))

(declare-fun m!1419383 () Bool)

(assert (=> b!1536876 m!1419383))

(assert (=> b!1536870 m!1419365))

(assert (=> b!1536870 m!1419365))

(declare-fun m!1419385 () Bool)

(assert (=> b!1536870 m!1419385))

(declare-fun m!1419387 () Bool)

(assert (=> b!1536878 m!1419387))

(check-sat (not b!1536870) (not b!1536878) (not b!1536873) (not b!1536875) (not b!1536869) (not start!130996) (not b!1536877) (not b!1536876) (not b!1536868))
(check-sat)
