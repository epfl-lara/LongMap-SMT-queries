; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118584 () Bool)

(assert start!118584)

(declare-fun b!1386311 () Bool)

(declare-fun res!927543 () Bool)

(declare-fun e!785341 () Bool)

(assert (=> b!1386311 (=> (not res!927543) (not e!785341))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94860 0))(
  ( (array!94861 (arr!45806 (Array (_ BitVec 32) (_ BitVec 64))) (size!46356 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94860)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386311 (= res!927543 (and (= (size!46356 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46356 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46356 a!2938))))))

(declare-fun b!1386312 () Bool)

(declare-fun res!927539 () Bool)

(assert (=> b!1386312 (=> (not res!927539) (not e!785341))))

(declare-datatypes ((List!32334 0))(
  ( (Nil!32331) (Cons!32330 (h!33539 (_ BitVec 64)) (t!47028 List!32334)) )
))
(declare-fun arrayNoDuplicates!0 (array!94860 (_ BitVec 32) List!32334) Bool)

(assert (=> b!1386312 (= res!927539 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32331))))

(declare-fun b!1386313 () Bool)

(declare-fun res!927541 () Bool)

(assert (=> b!1386313 (=> (not res!927541) (not e!785341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94860 (_ BitVec 32)) Bool)

(assert (=> b!1386313 (= res!927541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386314 () Bool)

(declare-fun e!785342 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386314 (= e!785342 (validKeyInArray!0 (select (arr!45806 a!2938) startIndex!16)))))

(declare-fun b!1386315 () Bool)

(assert (=> b!1386315 (= e!785341 false)))

(declare-datatypes ((Unit!46289 0))(
  ( (Unit!46290) )
))
(declare-fun lt!609421 () Unit!46289)

(declare-fun e!785340 () Unit!46289)

(assert (=> b!1386315 (= lt!609421 e!785340)))

(declare-fun c!128826 () Bool)

(assert (=> b!1386315 (= c!128826 e!785342)))

(declare-fun res!927542 () Bool)

(assert (=> b!1386315 (=> (not res!927542) (not e!785342))))

(assert (=> b!1386315 (= res!927542 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386316 () Bool)

(declare-fun lt!609422 () Unit!46289)

(assert (=> b!1386316 (= e!785340 lt!609422)))

(declare-fun lt!609423 () Unit!46289)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46289)

(assert (=> b!1386316 (= lt!609423 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10149 0))(
  ( (MissingZero!10149 (index!42967 (_ BitVec 32))) (Found!10149 (index!42968 (_ BitVec 32))) (Intermediate!10149 (undefined!10961 Bool) (index!42969 (_ BitVec 32)) (x!124590 (_ BitVec 32))) (Undefined!10149) (MissingVacant!10149 (index!42970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94860 (_ BitVec 32)) SeekEntryResult!10149)

(assert (=> b!1386316 (= (seekEntryOrOpen!0 (select (arr!45806 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45806 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94861 (store (arr!45806 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46356 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46289)

(assert (=> b!1386316 (= lt!609422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386316 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386317 () Bool)

(declare-fun res!927540 () Bool)

(assert (=> b!1386317 (=> (not res!927540) (not e!785341))))

(assert (=> b!1386317 (= res!927540 (and (not (= (select (arr!45806 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45806 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386318 () Bool)

(declare-fun Unit!46291 () Unit!46289)

(assert (=> b!1386318 (= e!785340 Unit!46291)))

(declare-fun b!1386310 () Bool)

(declare-fun res!927544 () Bool)

(assert (=> b!1386310 (=> (not res!927544) (not e!785341))))

(assert (=> b!1386310 (= res!927544 (validKeyInArray!0 (select (arr!45806 a!2938) i!1065)))))

(declare-fun res!927538 () Bool)

(assert (=> start!118584 (=> (not res!927538) (not e!785341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118584 (= res!927538 (validMask!0 mask!2987))))

(assert (=> start!118584 e!785341))

(assert (=> start!118584 true))

(declare-fun array_inv!34834 (array!94860) Bool)

(assert (=> start!118584 (array_inv!34834 a!2938)))

(assert (= (and start!118584 res!927538) b!1386311))

(assert (= (and b!1386311 res!927543) b!1386310))

(assert (= (and b!1386310 res!927544) b!1386312))

(assert (= (and b!1386312 res!927539) b!1386313))

(assert (= (and b!1386313 res!927541) b!1386317))

(assert (= (and b!1386317 res!927540) b!1386315))

(assert (= (and b!1386315 res!927542) b!1386314))

(assert (= (and b!1386315 c!128826) b!1386316))

(assert (= (and b!1386315 (not c!128826)) b!1386318))

(declare-fun m!1271661 () Bool)

(assert (=> start!118584 m!1271661))

(declare-fun m!1271663 () Bool)

(assert (=> start!118584 m!1271663))

(declare-fun m!1271665 () Bool)

(assert (=> b!1386317 m!1271665))

(declare-fun m!1271667 () Bool)

(assert (=> b!1386313 m!1271667))

(declare-fun m!1271669 () Bool)

(assert (=> b!1386316 m!1271669))

(declare-fun m!1271671 () Bool)

(assert (=> b!1386316 m!1271671))

(assert (=> b!1386316 m!1271671))

(declare-fun m!1271673 () Bool)

(assert (=> b!1386316 m!1271673))

(declare-fun m!1271675 () Bool)

(assert (=> b!1386316 m!1271675))

(declare-fun m!1271677 () Bool)

(assert (=> b!1386316 m!1271677))

(declare-fun m!1271679 () Bool)

(assert (=> b!1386316 m!1271679))

(declare-fun m!1271681 () Bool)

(assert (=> b!1386316 m!1271681))

(assert (=> b!1386316 m!1271679))

(declare-fun m!1271683 () Bool)

(assert (=> b!1386316 m!1271683))

(declare-fun m!1271685 () Bool)

(assert (=> b!1386312 m!1271685))

(assert (=> b!1386314 m!1271679))

(assert (=> b!1386314 m!1271679))

(declare-fun m!1271687 () Bool)

(assert (=> b!1386314 m!1271687))

(assert (=> b!1386310 m!1271665))

(assert (=> b!1386310 m!1271665))

(declare-fun m!1271689 () Bool)

(assert (=> b!1386310 m!1271689))

(push 1)

(assert (not b!1386313))

(assert (not b!1386310))

(assert (not b!1386316))

(assert (not b!1386314))

(assert (not start!118584))

(assert (not b!1386312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

