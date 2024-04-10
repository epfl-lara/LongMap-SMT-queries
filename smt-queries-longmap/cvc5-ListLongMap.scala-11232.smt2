; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131024 () Bool)

(assert start!131024)

(declare-fun b!1537330 () Bool)

(declare-fun e!855591 () Bool)

(declare-fun e!855590 () Bool)

(assert (=> b!1537330 (= e!855591 e!855590)))

(declare-fun res!1054423 () Bool)

(assert (=> b!1537330 (=> (not res!1054423) (not e!855590))))

(declare-datatypes ((SeekEntryResult!13409 0))(
  ( (MissingZero!13409 (index!56031 (_ BitVec 32))) (Found!13409 (index!56032 (_ BitVec 32))) (Intermediate!13409 (undefined!14221 Bool) (index!56033 (_ BitVec 32)) (x!137763 (_ BitVec 32))) (Undefined!13409) (MissingVacant!13409 (index!56034 (_ BitVec 32))) )
))
(declare-fun lt!664675 () SeekEntryResult!13409)

(declare-fun lt!664677 () SeekEntryResult!13409)

(assert (=> b!1537330 (= res!1054423 (= lt!664675 lt!664677))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102122 0))(
  ( (array!102123 (arr!49277 (Array (_ BitVec 32) (_ BitVec 64))) (size!49827 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102122)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!664678 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102122 (_ BitVec 32)) SeekEntryResult!13409)

(assert (=> b!1537330 (= lt!664675 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664678 vacantIndex!5 (select (arr!49277 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537331 () Bool)

(declare-fun e!855589 () Bool)

(declare-fun e!855592 () Bool)

(assert (=> b!1537331 (= e!855589 e!855592)))

(declare-fun res!1054422 () Bool)

(assert (=> b!1537331 (=> (not res!1054422) (not e!855592))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537331 (= res!1054422 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49277 a!2792) j!64) a!2792 mask!2480) lt!664677))))

(assert (=> b!1537331 (= lt!664677 (Found!13409 j!64))))

(declare-fun b!1537332 () Bool)

(declare-fun res!1054425 () Bool)

(assert (=> b!1537332 (=> (not res!1054425) (not e!855589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537332 (= res!1054425 (validKeyInArray!0 (select (arr!49277 a!2792) j!64)))))

(declare-fun b!1537333 () Bool)

(declare-fun res!1054419 () Bool)

(assert (=> b!1537333 (=> (not res!1054419) (not e!855589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102122 (_ BitVec 32)) Bool)

(assert (=> b!1537333 (= res!1054419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537334 () Bool)

(assert (=> b!1537334 (= e!855590 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537334 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664678 vacantIndex!5 (select (store (arr!49277 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102123 (store (arr!49277 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49827 a!2792)) mask!2480) lt!664675)))

(declare-datatypes ((Unit!51390 0))(
  ( (Unit!51391) )
))
(declare-fun lt!664676 () Unit!51390)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51390)

(assert (=> b!1537334 (= lt!664676 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664678 vacantIndex!5 mask!2480))))

(declare-fun b!1537335 () Bool)

(declare-fun res!1054417 () Bool)

(assert (=> b!1537335 (=> (not res!1054417) (not e!855589))))

(assert (=> b!1537335 (= res!1054417 (validKeyInArray!0 (select (arr!49277 a!2792) i!951)))))

(declare-fun b!1537336 () Bool)

(declare-fun res!1054421 () Bool)

(assert (=> b!1537336 (=> (not res!1054421) (not e!855589))))

(declare-datatypes ((List!35751 0))(
  ( (Nil!35748) (Cons!35747 (h!37192 (_ BitVec 64)) (t!50445 List!35751)) )
))
(declare-fun arrayNoDuplicates!0 (array!102122 (_ BitVec 32) List!35751) Bool)

(assert (=> b!1537336 (= res!1054421 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35748))))

(declare-fun b!1537337 () Bool)

(assert (=> b!1537337 (= e!855592 e!855591)))

(declare-fun res!1054426 () Bool)

(assert (=> b!1537337 (=> (not res!1054426) (not e!855591))))

(assert (=> b!1537337 (= res!1054426 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664678 #b00000000000000000000000000000000) (bvslt lt!664678 (size!49827 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537337 (= lt!664678 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537338 () Bool)

(declare-fun res!1054416 () Bool)

(assert (=> b!1537338 (=> (not res!1054416) (not e!855589))))

(assert (=> b!1537338 (= res!1054416 (and (= (size!49827 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49827 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49827 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054420 () Bool)

(assert (=> start!131024 (=> (not res!1054420) (not e!855589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131024 (= res!1054420 (validMask!0 mask!2480))))

(assert (=> start!131024 e!855589))

(assert (=> start!131024 true))

(declare-fun array_inv!38305 (array!102122) Bool)

(assert (=> start!131024 (array_inv!38305 a!2792)))

(declare-fun b!1537339 () Bool)

(declare-fun res!1054424 () Bool)

(assert (=> b!1537339 (=> (not res!1054424) (not e!855592))))

(assert (=> b!1537339 (= res!1054424 (not (= (select (arr!49277 a!2792) index!463) (select (arr!49277 a!2792) j!64))))))

(declare-fun b!1537340 () Bool)

(declare-fun res!1054418 () Bool)

(assert (=> b!1537340 (=> (not res!1054418) (not e!855589))))

(assert (=> b!1537340 (= res!1054418 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49827 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49827 a!2792)) (= (select (arr!49277 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131024 res!1054420) b!1537338))

(assert (= (and b!1537338 res!1054416) b!1537335))

(assert (= (and b!1537335 res!1054417) b!1537332))

(assert (= (and b!1537332 res!1054425) b!1537333))

(assert (= (and b!1537333 res!1054419) b!1537336))

(assert (= (and b!1537336 res!1054421) b!1537340))

(assert (= (and b!1537340 res!1054418) b!1537331))

(assert (= (and b!1537331 res!1054422) b!1537339))

(assert (= (and b!1537339 res!1054424) b!1537337))

(assert (= (and b!1537337 res!1054426) b!1537330))

(assert (= (and b!1537330 res!1054423) b!1537334))

(declare-fun m!1419831 () Bool)

(assert (=> b!1537332 m!1419831))

(assert (=> b!1537332 m!1419831))

(declare-fun m!1419833 () Bool)

(assert (=> b!1537332 m!1419833))

(declare-fun m!1419835 () Bool)

(assert (=> start!131024 m!1419835))

(declare-fun m!1419837 () Bool)

(assert (=> start!131024 m!1419837))

(declare-fun m!1419839 () Bool)

(assert (=> b!1537340 m!1419839))

(declare-fun m!1419841 () Bool)

(assert (=> b!1537334 m!1419841))

(declare-fun m!1419843 () Bool)

(assert (=> b!1537334 m!1419843))

(assert (=> b!1537334 m!1419843))

(declare-fun m!1419845 () Bool)

(assert (=> b!1537334 m!1419845))

(declare-fun m!1419847 () Bool)

(assert (=> b!1537334 m!1419847))

(declare-fun m!1419849 () Bool)

(assert (=> b!1537339 m!1419849))

(assert (=> b!1537339 m!1419831))

(declare-fun m!1419851 () Bool)

(assert (=> b!1537337 m!1419851))

(declare-fun m!1419853 () Bool)

(assert (=> b!1537333 m!1419853))

(declare-fun m!1419855 () Bool)

(assert (=> b!1537336 m!1419855))

(assert (=> b!1537331 m!1419831))

(assert (=> b!1537331 m!1419831))

(declare-fun m!1419857 () Bool)

(assert (=> b!1537331 m!1419857))

(declare-fun m!1419859 () Bool)

(assert (=> b!1537335 m!1419859))

(assert (=> b!1537335 m!1419859))

(declare-fun m!1419861 () Bool)

(assert (=> b!1537335 m!1419861))

(assert (=> b!1537330 m!1419831))

(assert (=> b!1537330 m!1419831))

(declare-fun m!1419863 () Bool)

(assert (=> b!1537330 m!1419863))

(push 1)

