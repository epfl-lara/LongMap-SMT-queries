; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118542 () Bool)

(assert start!118542)

(declare-fun b!1385287 () Bool)

(declare-datatypes ((Unit!46058 0))(
  ( (Unit!46059) )
))
(declare-fun e!785143 () Unit!46058)

(declare-fun lt!609218 () Unit!46058)

(assert (=> b!1385287 (= e!785143 lt!609218)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94743 0))(
  ( (array!94744 (arr!45747 (Array (_ BitVec 32) (_ BitVec 64))) (size!46298 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94743)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609219 () Unit!46058)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46058)

(assert (=> b!1385287 (= lt!609219 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10043 0))(
  ( (MissingZero!10043 (index!42543 (_ BitVec 32))) (Found!10043 (index!42544 (_ BitVec 32))) (Intermediate!10043 (undefined!10855 Bool) (index!42545 (_ BitVec 32)) (x!124202 (_ BitVec 32))) (Undefined!10043) (MissingVacant!10043 (index!42546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94743 (_ BitVec 32)) SeekEntryResult!10043)

(assert (=> b!1385287 (= (seekEntryOrOpen!0 (select (arr!45747 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45747 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94744 (store (arr!45747 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46298 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46058)

(assert (=> b!1385287 (= lt!609218 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94743 (_ BitVec 32)) Bool)

(assert (=> b!1385287 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385288 () Bool)

(declare-fun res!926039 () Bool)

(declare-fun e!785142 () Bool)

(assert (=> b!1385288 (=> (not res!926039) (not e!785142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385288 (= res!926039 (validKeyInArray!0 (select (arr!45747 a!2938) i!1065)))))

(declare-fun b!1385289 () Bool)

(declare-fun res!926044 () Bool)

(assert (=> b!1385289 (=> (not res!926044) (not e!785142))))

(assert (=> b!1385289 (= res!926044 (and (not (= (select (arr!45747 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45747 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385290 () Bool)

(declare-fun res!926043 () Bool)

(assert (=> b!1385290 (=> (not res!926043) (not e!785142))))

(assert (=> b!1385290 (= res!926043 (and (= (size!46298 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46298 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46298 a!2938))))))

(declare-fun b!1385291 () Bool)

(declare-fun res!926042 () Bool)

(assert (=> b!1385291 (=> (not res!926042) (not e!785142))))

(assert (=> b!1385291 (= res!926042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385292 () Bool)

(declare-fun res!926041 () Bool)

(assert (=> b!1385292 (=> (not res!926041) (not e!785142))))

(declare-datatypes ((List!32262 0))(
  ( (Nil!32259) (Cons!32258 (h!33476 (_ BitVec 64)) (t!46948 List!32262)) )
))
(declare-fun arrayNoDuplicates!0 (array!94743 (_ BitVec 32) List!32262) Bool)

(assert (=> b!1385292 (= res!926041 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32259))))

(declare-fun res!926038 () Bool)

(assert (=> start!118542 (=> (not res!926038) (not e!785142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118542 (= res!926038 (validMask!0 mask!2987))))

(assert (=> start!118542 e!785142))

(assert (=> start!118542 true))

(declare-fun array_inv!35028 (array!94743) Bool)

(assert (=> start!118542 (array_inv!35028 a!2938)))

(declare-fun b!1385293 () Bool)

(declare-fun Unit!46060 () Unit!46058)

(assert (=> b!1385293 (= e!785143 Unit!46060)))

(declare-fun b!1385294 () Bool)

(declare-fun e!785141 () Bool)

(assert (=> b!1385294 (= e!785141 (validKeyInArray!0 (select (arr!45747 a!2938) startIndex!16)))))

(declare-fun b!1385295 () Bool)

(assert (=> b!1385295 (= e!785142 false)))

(declare-fun lt!609217 () Unit!46058)

(assert (=> b!1385295 (= lt!609217 e!785143)))

(declare-fun c!129072 () Bool)

(assert (=> b!1385295 (= c!129072 e!785141)))

(declare-fun res!926040 () Bool)

(assert (=> b!1385295 (=> (not res!926040) (not e!785141))))

(assert (=> b!1385295 (= res!926040 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118542 res!926038) b!1385290))

(assert (= (and b!1385290 res!926043) b!1385288))

(assert (= (and b!1385288 res!926039) b!1385292))

(assert (= (and b!1385292 res!926041) b!1385291))

(assert (= (and b!1385291 res!926042) b!1385289))

(assert (= (and b!1385289 res!926044) b!1385295))

(assert (= (and b!1385295 res!926040) b!1385294))

(assert (= (and b!1385295 c!129072) b!1385287))

(assert (= (and b!1385295 (not c!129072)) b!1385293))

(declare-fun m!1270803 () Bool)

(assert (=> b!1385288 m!1270803))

(assert (=> b!1385288 m!1270803))

(declare-fun m!1270805 () Bool)

(assert (=> b!1385288 m!1270805))

(declare-fun m!1270807 () Bool)

(assert (=> b!1385287 m!1270807))

(declare-fun m!1270809 () Bool)

(assert (=> b!1385287 m!1270809))

(assert (=> b!1385287 m!1270809))

(declare-fun m!1270811 () Bool)

(assert (=> b!1385287 m!1270811))

(declare-fun m!1270813 () Bool)

(assert (=> b!1385287 m!1270813))

(declare-fun m!1270815 () Bool)

(assert (=> b!1385287 m!1270815))

(declare-fun m!1270817 () Bool)

(assert (=> b!1385287 m!1270817))

(declare-fun m!1270819 () Bool)

(assert (=> b!1385287 m!1270819))

(assert (=> b!1385287 m!1270817))

(declare-fun m!1270821 () Bool)

(assert (=> b!1385287 m!1270821))

(assert (=> b!1385294 m!1270817))

(assert (=> b!1385294 m!1270817))

(declare-fun m!1270823 () Bool)

(assert (=> b!1385294 m!1270823))

(declare-fun m!1270825 () Bool)

(assert (=> start!118542 m!1270825))

(declare-fun m!1270827 () Bool)

(assert (=> start!118542 m!1270827))

(declare-fun m!1270829 () Bool)

(assert (=> b!1385291 m!1270829))

(assert (=> b!1385289 m!1270803))

(declare-fun m!1270831 () Bool)

(assert (=> b!1385292 m!1270831))

(push 1)

(assert (not start!118542))

(assert (not b!1385291))

(assert (not b!1385292))

(assert (not b!1385294))

(assert (not b!1385288))

(assert (not b!1385287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

