; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131018 () Bool)

(assert start!131018)

(declare-fun b!1537231 () Bool)

(declare-fun res!1054320 () Bool)

(declare-fun e!855547 () Bool)

(assert (=> b!1537231 (=> (not res!1054320) (not e!855547))))

(declare-datatypes ((array!102116 0))(
  ( (array!102117 (arr!49274 (Array (_ BitVec 32) (_ BitVec 64))) (size!49824 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102116)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102116 (_ BitVec 32)) Bool)

(assert (=> b!1537231 (= res!1054320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054326 () Bool)

(assert (=> start!131018 (=> (not res!1054326) (not e!855547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131018 (= res!1054326 (validMask!0 mask!2480))))

(assert (=> start!131018 e!855547))

(assert (=> start!131018 true))

(declare-fun array_inv!38302 (array!102116) Bool)

(assert (=> start!131018 (array_inv!38302 a!2792)))

(declare-fun b!1537232 () Bool)

(declare-fun e!855543 () Bool)

(assert (=> b!1537232 (= e!855547 e!855543)))

(declare-fun res!1054325 () Bool)

(assert (=> b!1537232 (=> (not res!1054325) (not e!855543))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13406 0))(
  ( (MissingZero!13406 (index!56019 (_ BitVec 32))) (Found!13406 (index!56020 (_ BitVec 32))) (Intermediate!13406 (undefined!14218 Bool) (index!56021 (_ BitVec 32)) (x!137752 (_ BitVec 32))) (Undefined!13406) (MissingVacant!13406 (index!56022 (_ BitVec 32))) )
))
(declare-fun lt!664642 () SeekEntryResult!13406)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102116 (_ BitVec 32)) SeekEntryResult!13406)

(assert (=> b!1537232 (= res!1054325 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49274 a!2792) j!64) a!2792 mask!2480) lt!664642))))

(assert (=> b!1537232 (= lt!664642 (Found!13406 j!64))))

(declare-fun b!1537233 () Bool)

(declare-fun res!1054324 () Bool)

(assert (=> b!1537233 (=> (not res!1054324) (not e!855547))))

(declare-datatypes ((List!35748 0))(
  ( (Nil!35745) (Cons!35744 (h!37189 (_ BitVec 64)) (t!50442 List!35748)) )
))
(declare-fun arrayNoDuplicates!0 (array!102116 (_ BitVec 32) List!35748) Bool)

(assert (=> b!1537233 (= res!1054324 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35745))))

(declare-fun b!1537234 () Bool)

(declare-fun res!1054327 () Bool)

(assert (=> b!1537234 (=> (not res!1054327) (not e!855547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537234 (= res!1054327 (validKeyInArray!0 (select (arr!49274 a!2792) j!64)))))

(declare-fun b!1537235 () Bool)

(declare-fun e!855544 () Bool)

(assert (=> b!1537235 (= e!855544 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!664640 () (_ BitVec 32))

(declare-fun lt!664641 () SeekEntryResult!13406)

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537235 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664640 vacantIndex!5 (select (store (arr!49274 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102117 (store (arr!49274 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49824 a!2792)) mask!2480) lt!664641)))

(declare-datatypes ((Unit!51384 0))(
  ( (Unit!51385) )
))
(declare-fun lt!664639 () Unit!51384)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51384)

(assert (=> b!1537235 (= lt!664639 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664640 vacantIndex!5 mask!2480))))

(declare-fun b!1537236 () Bool)

(declare-fun res!1054322 () Bool)

(assert (=> b!1537236 (=> (not res!1054322) (not e!855547))))

(assert (=> b!1537236 (= res!1054322 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49824 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49824 a!2792)) (= (select (arr!49274 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537237 () Bool)

(declare-fun res!1054321 () Bool)

(assert (=> b!1537237 (=> (not res!1054321) (not e!855547))))

(assert (=> b!1537237 (= res!1054321 (validKeyInArray!0 (select (arr!49274 a!2792) i!951)))))

(declare-fun b!1537238 () Bool)

(declare-fun e!855545 () Bool)

(assert (=> b!1537238 (= e!855543 e!855545)))

(declare-fun res!1054323 () Bool)

(assert (=> b!1537238 (=> (not res!1054323) (not e!855545))))

(assert (=> b!1537238 (= res!1054323 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664640 #b00000000000000000000000000000000) (bvslt lt!664640 (size!49824 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537238 (= lt!664640 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537239 () Bool)

(declare-fun res!1054319 () Bool)

(assert (=> b!1537239 (=> (not res!1054319) (not e!855547))))

(assert (=> b!1537239 (= res!1054319 (and (= (size!49824 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49824 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49824 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537240 () Bool)

(assert (=> b!1537240 (= e!855545 e!855544)))

(declare-fun res!1054318 () Bool)

(assert (=> b!1537240 (=> (not res!1054318) (not e!855544))))

(assert (=> b!1537240 (= res!1054318 (= lt!664641 lt!664642))))

(assert (=> b!1537240 (= lt!664641 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664640 vacantIndex!5 (select (arr!49274 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537241 () Bool)

(declare-fun res!1054317 () Bool)

(assert (=> b!1537241 (=> (not res!1054317) (not e!855543))))

(assert (=> b!1537241 (= res!1054317 (not (= (select (arr!49274 a!2792) index!463) (select (arr!49274 a!2792) j!64))))))

(assert (= (and start!131018 res!1054326) b!1537239))

(assert (= (and b!1537239 res!1054319) b!1537237))

(assert (= (and b!1537237 res!1054321) b!1537234))

(assert (= (and b!1537234 res!1054327) b!1537231))

(assert (= (and b!1537231 res!1054320) b!1537233))

(assert (= (and b!1537233 res!1054324) b!1537236))

(assert (= (and b!1537236 res!1054322) b!1537232))

(assert (= (and b!1537232 res!1054325) b!1537241))

(assert (= (and b!1537241 res!1054317) b!1537238))

(assert (= (and b!1537238 res!1054323) b!1537240))

(assert (= (and b!1537240 res!1054318) b!1537235))

(declare-fun m!1419729 () Bool)

(assert (=> b!1537238 m!1419729))

(declare-fun m!1419731 () Bool)

(assert (=> b!1537233 m!1419731))

(declare-fun m!1419733 () Bool)

(assert (=> b!1537240 m!1419733))

(assert (=> b!1537240 m!1419733))

(declare-fun m!1419735 () Bool)

(assert (=> b!1537240 m!1419735))

(assert (=> b!1537234 m!1419733))

(assert (=> b!1537234 m!1419733))

(declare-fun m!1419737 () Bool)

(assert (=> b!1537234 m!1419737))

(declare-fun m!1419739 () Bool)

(assert (=> b!1537235 m!1419739))

(declare-fun m!1419741 () Bool)

(assert (=> b!1537235 m!1419741))

(assert (=> b!1537235 m!1419741))

(declare-fun m!1419743 () Bool)

(assert (=> b!1537235 m!1419743))

(declare-fun m!1419745 () Bool)

(assert (=> b!1537235 m!1419745))

(declare-fun m!1419747 () Bool)

(assert (=> b!1537241 m!1419747))

(assert (=> b!1537241 m!1419733))

(declare-fun m!1419749 () Bool)

(assert (=> b!1537236 m!1419749))

(declare-fun m!1419751 () Bool)

(assert (=> start!131018 m!1419751))

(declare-fun m!1419753 () Bool)

(assert (=> start!131018 m!1419753))

(declare-fun m!1419755 () Bool)

(assert (=> b!1537237 m!1419755))

(assert (=> b!1537237 m!1419755))

(declare-fun m!1419757 () Bool)

(assert (=> b!1537237 m!1419757))

(declare-fun m!1419759 () Bool)

(assert (=> b!1537231 m!1419759))

(assert (=> b!1537232 m!1419733))

(assert (=> b!1537232 m!1419733))

(declare-fun m!1419761 () Bool)

(assert (=> b!1537232 m!1419761))

(push 1)

(assert (not b!1537231))

(assert (not b!1537234))

(assert (not b!1537232))

(assert (not b!1537238))

(assert (not b!1537233))

(assert (not b!1537240))

(assert (not start!131018))

(assert (not b!1537235))

(assert (not b!1537237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

