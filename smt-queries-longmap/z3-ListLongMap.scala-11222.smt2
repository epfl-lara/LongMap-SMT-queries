; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130966 () Bool)

(assert start!130966)

(declare-fun b!1536364 () Bool)

(declare-fun e!855144 () Bool)

(declare-fun e!855147 () Bool)

(assert (=> b!1536364 (= e!855144 e!855147)))

(declare-fun res!1053455 () Bool)

(assert (=> b!1536364 (=> (not res!1053455) (not e!855147))))

(declare-datatypes ((SeekEntryResult!13380 0))(
  ( (MissingZero!13380 (index!55915 (_ BitVec 32))) (Found!13380 (index!55916 (_ BitVec 32))) (Intermediate!13380 (undefined!14192 Bool) (index!55917 (_ BitVec 32)) (x!137654 (_ BitVec 32))) (Undefined!13380) (MissingVacant!13380 (index!55918 (_ BitVec 32))) )
))
(declare-fun lt!664321 () SeekEntryResult!13380)

(declare-fun lt!664319 () SeekEntryResult!13380)

(assert (=> b!1536364 (= res!1053455 (= lt!664321 lt!664319))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102064 0))(
  ( (array!102065 (arr!49248 (Array (_ BitVec 32) (_ BitVec 64))) (size!49798 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102064)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664318 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102064 (_ BitVec 32)) SeekEntryResult!13380)

(assert (=> b!1536364 (= lt!664321 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664318 vacantIndex!5 (select (arr!49248 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536365 () Bool)

(assert (=> b!1536365 (= e!855147 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536365 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664318 vacantIndex!5 (select (store (arr!49248 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102065 (store (arr!49248 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49798 a!2792)) mask!2480) lt!664321)))

(declare-datatypes ((Unit!51332 0))(
  ( (Unit!51333) )
))
(declare-fun lt!664320 () Unit!51332)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51332)

(assert (=> b!1536365 (= lt!664320 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664318 vacantIndex!5 mask!2480))))

(declare-fun b!1536366 () Bool)

(declare-fun res!1053452 () Bool)

(declare-fun e!855148 () Bool)

(assert (=> b!1536366 (=> (not res!1053452) (not e!855148))))

(declare-datatypes ((List!35722 0))(
  ( (Nil!35719) (Cons!35718 (h!37163 (_ BitVec 64)) (t!50416 List!35722)) )
))
(declare-fun arrayNoDuplicates!0 (array!102064 (_ BitVec 32) List!35722) Bool)

(assert (=> b!1536366 (= res!1053452 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35719))))

(declare-fun b!1536367 () Bool)

(declare-fun res!1053460 () Bool)

(assert (=> b!1536367 (=> (not res!1053460) (not e!855148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102064 (_ BitVec 32)) Bool)

(assert (=> b!1536367 (= res!1053460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1053453 () Bool)

(assert (=> start!130966 (=> (not res!1053453) (not e!855148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130966 (= res!1053453 (validMask!0 mask!2480))))

(assert (=> start!130966 e!855148))

(assert (=> start!130966 true))

(declare-fun array_inv!38276 (array!102064) Bool)

(assert (=> start!130966 (array_inv!38276 a!2792)))

(declare-fun b!1536368 () Bool)

(declare-fun res!1053454 () Bool)

(assert (=> b!1536368 (=> (not res!1053454) (not e!855148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536368 (= res!1053454 (validKeyInArray!0 (select (arr!49248 a!2792) i!951)))))

(declare-fun b!1536369 () Bool)

(declare-fun res!1053451 () Bool)

(assert (=> b!1536369 (=> (not res!1053451) (not e!855148))))

(assert (=> b!1536369 (= res!1053451 (and (= (size!49798 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49798 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49798 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536370 () Bool)

(declare-fun e!855145 () Bool)

(assert (=> b!1536370 (= e!855145 e!855144)))

(declare-fun res!1053456 () Bool)

(assert (=> b!1536370 (=> (not res!1053456) (not e!855144))))

(assert (=> b!1536370 (= res!1053456 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664318 #b00000000000000000000000000000000) (bvslt lt!664318 (size!49798 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536370 (= lt!664318 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536371 () Bool)

(declare-fun res!1053457 () Bool)

(assert (=> b!1536371 (=> (not res!1053457) (not e!855148))))

(assert (=> b!1536371 (= res!1053457 (validKeyInArray!0 (select (arr!49248 a!2792) j!64)))))

(declare-fun b!1536372 () Bool)

(declare-fun res!1053459 () Bool)

(assert (=> b!1536372 (=> (not res!1053459) (not e!855145))))

(assert (=> b!1536372 (= res!1053459 (not (= (select (arr!49248 a!2792) index!463) (select (arr!49248 a!2792) j!64))))))

(declare-fun b!1536373 () Bool)

(declare-fun res!1053458 () Bool)

(assert (=> b!1536373 (=> (not res!1053458) (not e!855148))))

(assert (=> b!1536373 (= res!1053458 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49798 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49798 a!2792)) (= (select (arr!49248 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536374 () Bool)

(assert (=> b!1536374 (= e!855148 e!855145)))

(declare-fun res!1053450 () Bool)

(assert (=> b!1536374 (=> (not res!1053450) (not e!855145))))

(assert (=> b!1536374 (= res!1053450 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49248 a!2792) j!64) a!2792 mask!2480) lt!664319))))

(assert (=> b!1536374 (= lt!664319 (Found!13380 j!64))))

(assert (= (and start!130966 res!1053453) b!1536369))

(assert (= (and b!1536369 res!1053451) b!1536368))

(assert (= (and b!1536368 res!1053454) b!1536371))

(assert (= (and b!1536371 res!1053457) b!1536367))

(assert (= (and b!1536367 res!1053460) b!1536366))

(assert (= (and b!1536366 res!1053452) b!1536373))

(assert (= (and b!1536373 res!1053458) b!1536374))

(assert (= (and b!1536374 res!1053450) b!1536372))

(assert (= (and b!1536372 res!1053459) b!1536370))

(assert (= (and b!1536370 res!1053456) b!1536364))

(assert (= (and b!1536364 res!1053455) b!1536365))

(declare-fun m!1418827 () Bool)

(assert (=> b!1536367 m!1418827))

(declare-fun m!1418829 () Bool)

(assert (=> b!1536371 m!1418829))

(assert (=> b!1536371 m!1418829))

(declare-fun m!1418831 () Bool)

(assert (=> b!1536371 m!1418831))

(assert (=> b!1536374 m!1418829))

(assert (=> b!1536374 m!1418829))

(declare-fun m!1418833 () Bool)

(assert (=> b!1536374 m!1418833))

(declare-fun m!1418835 () Bool)

(assert (=> b!1536368 m!1418835))

(assert (=> b!1536368 m!1418835))

(declare-fun m!1418837 () Bool)

(assert (=> b!1536368 m!1418837))

(declare-fun m!1418839 () Bool)

(assert (=> b!1536372 m!1418839))

(assert (=> b!1536372 m!1418829))

(declare-fun m!1418841 () Bool)

(assert (=> b!1536366 m!1418841))

(assert (=> b!1536364 m!1418829))

(assert (=> b!1536364 m!1418829))

(declare-fun m!1418843 () Bool)

(assert (=> b!1536364 m!1418843))

(declare-fun m!1418845 () Bool)

(assert (=> start!130966 m!1418845))

(declare-fun m!1418847 () Bool)

(assert (=> start!130966 m!1418847))

(declare-fun m!1418849 () Bool)

(assert (=> b!1536373 m!1418849))

(declare-fun m!1418851 () Bool)

(assert (=> b!1536370 m!1418851))

(declare-fun m!1418853 () Bool)

(assert (=> b!1536365 m!1418853))

(declare-fun m!1418855 () Bool)

(assert (=> b!1536365 m!1418855))

(assert (=> b!1536365 m!1418855))

(declare-fun m!1418857 () Bool)

(assert (=> b!1536365 m!1418857))

(declare-fun m!1418859 () Bool)

(assert (=> b!1536365 m!1418859))

(check-sat (not b!1536365) (not b!1536366) (not b!1536364) (not b!1536374) (not start!130966) (not b!1536368) (not b!1536367) (not b!1536371) (not b!1536370))
(check-sat)
