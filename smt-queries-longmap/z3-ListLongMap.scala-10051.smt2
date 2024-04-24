; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118622 () Bool)

(assert start!118622)

(declare-fun res!926914 () Bool)

(declare-fun e!785656 () Bool)

(assert (=> start!118622 (=> (not res!926914) (not e!785656))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118622 (= res!926914 (validMask!0 mask!2987))))

(assert (=> start!118622 e!785656))

(assert (=> start!118622 true))

(declare-datatypes ((array!94823 0))(
  ( (array!94824 (arr!45787 (Array (_ BitVec 32) (_ BitVec 64))) (size!46338 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94823)

(declare-fun array_inv!35068 (array!94823) Bool)

(assert (=> start!118622 (array_inv!35068 a!2938)))

(declare-fun b!1386403 () Bool)

(declare-fun res!926919 () Bool)

(assert (=> b!1386403 (=> (not res!926919) (not e!785656))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386403 (= res!926919 (and (= (size!46338 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46338 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46338 a!2938))))))

(declare-fun b!1386404 () Bool)

(declare-fun res!926917 () Bool)

(assert (=> b!1386404 (=> (not res!926917) (not e!785656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386404 (= res!926917 (validKeyInArray!0 (select (arr!45787 a!2938) i!1065)))))

(declare-fun b!1386405 () Bool)

(declare-fun res!926918 () Bool)

(assert (=> b!1386405 (=> (not res!926918) (not e!785656))))

(declare-datatypes ((List!32302 0))(
  ( (Nil!32299) (Cons!32298 (h!33516 (_ BitVec 64)) (t!46988 List!32302)) )
))
(declare-fun arrayNoDuplicates!0 (array!94823 (_ BitVec 32) List!32302) Bool)

(assert (=> b!1386405 (= res!926918 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32299))))

(declare-fun b!1386406 () Bool)

(declare-fun res!926920 () Bool)

(assert (=> b!1386406 (=> (not res!926920) (not e!785656))))

(assert (=> b!1386406 (= res!926920 (and (not (= (select (arr!45787 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45787 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386407 () Bool)

(declare-datatypes ((Unit!46178 0))(
  ( (Unit!46179) )
))
(declare-fun e!785657 () Unit!46178)

(declare-fun lt!609651 () Unit!46178)

(assert (=> b!1386407 (= e!785657 lt!609651)))

(declare-fun lt!609649 () Unit!46178)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46178)

(assert (=> b!1386407 (= lt!609649 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10083 0))(
  ( (MissingZero!10083 (index!42703 (_ BitVec 32))) (Found!10083 (index!42704 (_ BitVec 32))) (Intermediate!10083 (undefined!10895 Bool) (index!42705 (_ BitVec 32)) (x!124354 (_ BitVec 32))) (Undefined!10083) (MissingVacant!10083 (index!42706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94823 (_ BitVec 32)) SeekEntryResult!10083)

(assert (=> b!1386407 (= (seekEntryOrOpen!0 (select (arr!45787 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45787 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94824 (store (arr!45787 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46338 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46178)

(assert (=> b!1386407 (= lt!609651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94823 (_ BitVec 32)) Bool)

(assert (=> b!1386407 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386408 () Bool)

(declare-fun res!926916 () Bool)

(assert (=> b!1386408 (=> (not res!926916) (not e!785656))))

(assert (=> b!1386408 (= res!926916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386409 () Bool)

(declare-fun e!785658 () Bool)

(assert (=> b!1386409 (= e!785658 (validKeyInArray!0 (select (arr!45787 a!2938) startIndex!16)))))

(declare-fun b!1386410 () Bool)

(assert (=> b!1386410 (= e!785656 (and (bvsge startIndex!16 (bvsub (size!46338 a!2938) #b00000000000000000000000000000001)) (bvsgt startIndex!16 (size!46338 a!2938))))))

(declare-fun lt!609650 () Unit!46178)

(assert (=> b!1386410 (= lt!609650 e!785657)))

(declare-fun c!129192 () Bool)

(assert (=> b!1386410 (= c!129192 e!785658)))

(declare-fun res!926915 () Bool)

(assert (=> b!1386410 (=> (not res!926915) (not e!785658))))

(assert (=> b!1386410 (= res!926915 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386411 () Bool)

(declare-fun Unit!46180 () Unit!46178)

(assert (=> b!1386411 (= e!785657 Unit!46180)))

(assert (= (and start!118622 res!926914) b!1386403))

(assert (= (and b!1386403 res!926919) b!1386404))

(assert (= (and b!1386404 res!926917) b!1386405))

(assert (= (and b!1386405 res!926918) b!1386408))

(assert (= (and b!1386408 res!926916) b!1386406))

(assert (= (and b!1386406 res!926920) b!1386410))

(assert (= (and b!1386410 res!926915) b!1386409))

(assert (= (and b!1386410 c!129192) b!1386407))

(assert (= (and b!1386410 (not c!129192)) b!1386411))

(declare-fun m!1272051 () Bool)

(assert (=> b!1386409 m!1272051))

(assert (=> b!1386409 m!1272051))

(declare-fun m!1272053 () Bool)

(assert (=> b!1386409 m!1272053))

(declare-fun m!1272055 () Bool)

(assert (=> b!1386406 m!1272055))

(declare-fun m!1272057 () Bool)

(assert (=> b!1386405 m!1272057))

(assert (=> b!1386404 m!1272055))

(assert (=> b!1386404 m!1272055))

(declare-fun m!1272059 () Bool)

(assert (=> b!1386404 m!1272059))

(declare-fun m!1272061 () Bool)

(assert (=> b!1386408 m!1272061))

(declare-fun m!1272063 () Bool)

(assert (=> b!1386407 m!1272063))

(declare-fun m!1272065 () Bool)

(assert (=> b!1386407 m!1272065))

(assert (=> b!1386407 m!1272065))

(declare-fun m!1272067 () Bool)

(assert (=> b!1386407 m!1272067))

(declare-fun m!1272069 () Bool)

(assert (=> b!1386407 m!1272069))

(declare-fun m!1272071 () Bool)

(assert (=> b!1386407 m!1272071))

(assert (=> b!1386407 m!1272051))

(declare-fun m!1272073 () Bool)

(assert (=> b!1386407 m!1272073))

(assert (=> b!1386407 m!1272051))

(declare-fun m!1272075 () Bool)

(assert (=> b!1386407 m!1272075))

(declare-fun m!1272077 () Bool)

(assert (=> start!118622 m!1272077))

(declare-fun m!1272079 () Bool)

(assert (=> start!118622 m!1272079))

(check-sat (not b!1386407) (not b!1386405) (not b!1386409) (not start!118622) (not b!1386404) (not b!1386408))
(check-sat)
