; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130976 () Bool)

(assert start!130976)

(declare-fun b!1536529 () Bool)

(declare-fun res!1053616 () Bool)

(declare-fun e!855220 () Bool)

(assert (=> b!1536529 (=> (not res!1053616) (not e!855220))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-datatypes ((array!102074 0))(
  ( (array!102075 (arr!49253 (Array (_ BitVec 32) (_ BitVec 64))) (size!49803 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102074)

(assert (=> b!1536529 (= res!1053616 (and (= (size!49803 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49803 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49803 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536530 () Bool)

(declare-fun res!1053621 () Bool)

(assert (=> b!1536530 (=> (not res!1053621) (not e!855220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102074 (_ BitVec 32)) Bool)

(assert (=> b!1536530 (= res!1053621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536531 () Bool)

(declare-fun e!855223 () Bool)

(assert (=> b!1536531 (= e!855220 e!855223)))

(declare-fun res!1053625 () Bool)

(assert (=> b!1536531 (=> (not res!1053625) (not e!855223))))

(declare-datatypes ((SeekEntryResult!13385 0))(
  ( (MissingZero!13385 (index!55935 (_ BitVec 32))) (Found!13385 (index!55936 (_ BitVec 32))) (Intermediate!13385 (undefined!14197 Bool) (index!55937 (_ BitVec 32)) (x!137675 (_ BitVec 32))) (Undefined!13385) (MissingVacant!13385 (index!55938 (_ BitVec 32))) )
))
(declare-fun lt!664378 () SeekEntryResult!13385)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102074 (_ BitVec 32)) SeekEntryResult!13385)

(assert (=> b!1536531 (= res!1053625 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49253 a!2792) j!64) a!2792 mask!2480) lt!664378))))

(assert (=> b!1536531 (= lt!664378 (Found!13385 j!64))))

(declare-fun b!1536532 () Bool)

(declare-fun res!1053623 () Bool)

(assert (=> b!1536532 (=> (not res!1053623) (not e!855223))))

(assert (=> b!1536532 (= res!1053623 (not (= (select (arr!49253 a!2792) index!463) (select (arr!49253 a!2792) j!64))))))

(declare-fun b!1536533 () Bool)

(declare-fun e!855219 () Bool)

(assert (=> b!1536533 (= e!855223 e!855219)))

(declare-fun res!1053620 () Bool)

(assert (=> b!1536533 (=> (not res!1053620) (not e!855219))))

(declare-fun lt!664380 () (_ BitVec 32))

(assert (=> b!1536533 (= res!1053620 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664380 #b00000000000000000000000000000000) (bvslt lt!664380 (size!49803 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536533 (= lt!664380 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536534 () Bool)

(declare-fun res!1053615 () Bool)

(assert (=> b!1536534 (=> (not res!1053615) (not e!855220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536534 (= res!1053615 (validKeyInArray!0 (select (arr!49253 a!2792) i!951)))))

(declare-fun b!1536535 () Bool)

(declare-fun res!1053619 () Bool)

(assert (=> b!1536535 (=> (not res!1053619) (not e!855220))))

(declare-datatypes ((List!35727 0))(
  ( (Nil!35724) (Cons!35723 (h!37168 (_ BitVec 64)) (t!50421 List!35727)) )
))
(declare-fun arrayNoDuplicates!0 (array!102074 (_ BitVec 32) List!35727) Bool)

(assert (=> b!1536535 (= res!1053619 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35724))))

(declare-fun b!1536536 () Bool)

(declare-fun e!855222 () Bool)

(assert (=> b!1536536 (= e!855222 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49253 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!664379 () SeekEntryResult!13385)

(assert (=> b!1536536 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664380 vacantIndex!5 (select (store (arr!49253 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102075 (store (arr!49253 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49803 a!2792)) mask!2480) lt!664379)))

(declare-datatypes ((Unit!51342 0))(
  ( (Unit!51343) )
))
(declare-fun lt!664381 () Unit!51342)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51342)

(assert (=> b!1536536 (= lt!664381 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664380 vacantIndex!5 mask!2480))))

(declare-fun res!1053618 () Bool)

(assert (=> start!130976 (=> (not res!1053618) (not e!855220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130976 (= res!1053618 (validMask!0 mask!2480))))

(assert (=> start!130976 e!855220))

(assert (=> start!130976 true))

(declare-fun array_inv!38281 (array!102074) Bool)

(assert (=> start!130976 (array_inv!38281 a!2792)))

(declare-fun b!1536537 () Bool)

(assert (=> b!1536537 (= e!855219 e!855222)))

(declare-fun res!1053617 () Bool)

(assert (=> b!1536537 (=> (not res!1053617) (not e!855222))))

(assert (=> b!1536537 (= res!1053617 (= lt!664379 lt!664378))))

(assert (=> b!1536537 (= lt!664379 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664380 vacantIndex!5 (select (arr!49253 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536538 () Bool)

(declare-fun res!1053622 () Bool)

(assert (=> b!1536538 (=> (not res!1053622) (not e!855220))))

(assert (=> b!1536538 (= res!1053622 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49803 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49803 a!2792)) (= (select (arr!49253 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536539 () Bool)

(declare-fun res!1053624 () Bool)

(assert (=> b!1536539 (=> (not res!1053624) (not e!855220))))

(assert (=> b!1536539 (= res!1053624 (validKeyInArray!0 (select (arr!49253 a!2792) j!64)))))

(assert (= (and start!130976 res!1053618) b!1536529))

(assert (= (and b!1536529 res!1053616) b!1536534))

(assert (= (and b!1536534 res!1053615) b!1536539))

(assert (= (and b!1536539 res!1053624) b!1536530))

(assert (= (and b!1536530 res!1053621) b!1536535))

(assert (= (and b!1536535 res!1053619) b!1536538))

(assert (= (and b!1536538 res!1053622) b!1536531))

(assert (= (and b!1536531 res!1053625) b!1536532))

(assert (= (and b!1536532 res!1053623) b!1536533))

(assert (= (and b!1536533 res!1053620) b!1536537))

(assert (= (and b!1536537 res!1053617) b!1536536))

(declare-fun m!1418997 () Bool)

(assert (=> b!1536538 m!1418997))

(declare-fun m!1418999 () Bool)

(assert (=> b!1536530 m!1418999))

(declare-fun m!1419001 () Bool)

(assert (=> b!1536539 m!1419001))

(assert (=> b!1536539 m!1419001))

(declare-fun m!1419003 () Bool)

(assert (=> b!1536539 m!1419003))

(declare-fun m!1419005 () Bool)

(assert (=> b!1536532 m!1419005))

(assert (=> b!1536532 m!1419001))

(assert (=> b!1536531 m!1419001))

(assert (=> b!1536531 m!1419001))

(declare-fun m!1419007 () Bool)

(assert (=> b!1536531 m!1419007))

(declare-fun m!1419009 () Bool)

(assert (=> start!130976 m!1419009))

(declare-fun m!1419011 () Bool)

(assert (=> start!130976 m!1419011))

(declare-fun m!1419013 () Bool)

(assert (=> b!1536535 m!1419013))

(assert (=> b!1536537 m!1419001))

(assert (=> b!1536537 m!1419001))

(declare-fun m!1419015 () Bool)

(assert (=> b!1536537 m!1419015))

(declare-fun m!1419017 () Bool)

(assert (=> b!1536536 m!1419017))

(declare-fun m!1419019 () Bool)

(assert (=> b!1536536 m!1419019))

(assert (=> b!1536536 m!1419017))

(declare-fun m!1419021 () Bool)

(assert (=> b!1536536 m!1419021))

(declare-fun m!1419023 () Bool)

(assert (=> b!1536536 m!1419023))

(declare-fun m!1419025 () Bool)

(assert (=> b!1536536 m!1419025))

(declare-fun m!1419027 () Bool)

(assert (=> b!1536534 m!1419027))

(assert (=> b!1536534 m!1419027))

(declare-fun m!1419029 () Bool)

(assert (=> b!1536534 m!1419029))

(declare-fun m!1419031 () Bool)

(assert (=> b!1536533 m!1419031))

(push 1)

