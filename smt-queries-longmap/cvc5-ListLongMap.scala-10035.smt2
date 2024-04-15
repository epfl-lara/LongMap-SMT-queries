; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118314 () Bool)

(assert start!118314)

(declare-fun b!1383748 () Bool)

(declare-fun e!784189 () Bool)

(assert (=> b!1383748 (= e!784189 false)))

(declare-datatypes ((Unit!45942 0))(
  ( (Unit!45943) )
))
(declare-fun lt!608501 () Unit!45942)

(declare-fun e!784192 () Unit!45942)

(assert (=> b!1383748 (= lt!608501 e!784192)))

(declare-fun c!128633 () Bool)

(declare-fun e!784191 () Bool)

(assert (=> b!1383748 (= c!128633 e!784191)))

(declare-fun res!925371 () Bool)

(assert (=> b!1383748 (=> (not res!925371) (not e!784191))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383748 (= res!925371 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383749 () Bool)

(declare-datatypes ((array!94570 0))(
  ( (array!94571 (arr!45663 (Array (_ BitVec 32) (_ BitVec 64))) (size!46215 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94570)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383749 (= e!784191 (validKeyInArray!0 (select (arr!45663 a!2938) startIndex!16)))))

(declare-fun res!925367 () Bool)

(assert (=> start!118314 (=> (not res!925367) (not e!784189))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118314 (= res!925367 (validMask!0 mask!2987))))

(assert (=> start!118314 e!784189))

(assert (=> start!118314 true))

(declare-fun array_inv!34896 (array!94570) Bool)

(assert (=> start!118314 (array_inv!34896 a!2938)))

(declare-fun b!1383750 () Bool)

(declare-fun res!925370 () Bool)

(assert (=> b!1383750 (=> (not res!925370) (not e!784189))))

(assert (=> b!1383750 (= res!925370 (and (not (= (select (arr!45663 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45663 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383751 () Bool)

(declare-fun res!925369 () Bool)

(assert (=> b!1383751 (=> (not res!925369) (not e!784189))))

(assert (=> b!1383751 (= res!925369 (and (= (size!46215 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46215 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46215 a!2938))))))

(declare-fun b!1383752 () Bool)

(declare-fun res!925368 () Bool)

(assert (=> b!1383752 (=> (not res!925368) (not e!784189))))

(assert (=> b!1383752 (= res!925368 (validKeyInArray!0 (select (arr!45663 a!2938) i!1065)))))

(declare-fun b!1383753 () Bool)

(declare-fun Unit!45944 () Unit!45942)

(assert (=> b!1383753 (= e!784192 Unit!45944)))

(declare-fun b!1383754 () Bool)

(declare-fun lt!608499 () Unit!45942)

(assert (=> b!1383754 (= e!784192 lt!608499)))

(declare-fun lt!608500 () Unit!45942)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45942)

(assert (=> b!1383754 (= lt!608500 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10080 0))(
  ( (MissingZero!10080 (index!42691 (_ BitVec 32))) (Found!10080 (index!42692 (_ BitVec 32))) (Intermediate!10080 (undefined!10892 Bool) (index!42693 (_ BitVec 32)) (x!124198 (_ BitVec 32))) (Undefined!10080) (MissingVacant!10080 (index!42694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94570 (_ BitVec 32)) SeekEntryResult!10080)

(assert (=> b!1383754 (= (seekEntryOrOpen!0 (select (arr!45663 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45663 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94571 (store (arr!45663 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46215 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45942)

(assert (=> b!1383754 (= lt!608499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94570 (_ BitVec 32)) Bool)

(assert (=> b!1383754 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383755 () Bool)

(declare-fun res!925372 () Bool)

(assert (=> b!1383755 (=> (not res!925372) (not e!784189))))

(declare-datatypes ((List!32269 0))(
  ( (Nil!32266) (Cons!32265 (h!33474 (_ BitVec 64)) (t!46955 List!32269)) )
))
(declare-fun arrayNoDuplicates!0 (array!94570 (_ BitVec 32) List!32269) Bool)

(assert (=> b!1383755 (= res!925372 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32266))))

(declare-fun b!1383756 () Bool)

(declare-fun res!925373 () Bool)

(assert (=> b!1383756 (=> (not res!925373) (not e!784189))))

(assert (=> b!1383756 (= res!925373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118314 res!925367) b!1383751))

(assert (= (and b!1383751 res!925369) b!1383752))

(assert (= (and b!1383752 res!925368) b!1383755))

(assert (= (and b!1383755 res!925372) b!1383756))

(assert (= (and b!1383756 res!925373) b!1383750))

(assert (= (and b!1383750 res!925370) b!1383748))

(assert (= (and b!1383748 res!925371) b!1383749))

(assert (= (and b!1383748 c!128633) b!1383754))

(assert (= (and b!1383748 (not c!128633)) b!1383753))

(declare-fun m!1268487 () Bool)

(assert (=> b!1383756 m!1268487))

(declare-fun m!1268489 () Bool)

(assert (=> b!1383750 m!1268489))

(declare-fun m!1268491 () Bool)

(assert (=> b!1383755 m!1268491))

(assert (=> b!1383752 m!1268489))

(assert (=> b!1383752 m!1268489))

(declare-fun m!1268493 () Bool)

(assert (=> b!1383752 m!1268493))

(declare-fun m!1268495 () Bool)

(assert (=> b!1383754 m!1268495))

(declare-fun m!1268497 () Bool)

(assert (=> b!1383754 m!1268497))

(assert (=> b!1383754 m!1268497))

(declare-fun m!1268499 () Bool)

(assert (=> b!1383754 m!1268499))

(declare-fun m!1268501 () Bool)

(assert (=> b!1383754 m!1268501))

(declare-fun m!1268503 () Bool)

(assert (=> b!1383754 m!1268503))

(declare-fun m!1268505 () Bool)

(assert (=> b!1383754 m!1268505))

(declare-fun m!1268507 () Bool)

(assert (=> b!1383754 m!1268507))

(assert (=> b!1383754 m!1268505))

(declare-fun m!1268509 () Bool)

(assert (=> b!1383754 m!1268509))

(assert (=> b!1383749 m!1268505))

(assert (=> b!1383749 m!1268505))

(declare-fun m!1268511 () Bool)

(assert (=> b!1383749 m!1268511))

(declare-fun m!1268513 () Bool)

(assert (=> start!118314 m!1268513))

(declare-fun m!1268515 () Bool)

(assert (=> start!118314 m!1268515))

(push 1)

(assert (not b!1383752))

(assert (not b!1383754))

(assert (not b!1383755))

(assert (not b!1383756))

(assert (not start!118314))

(assert (not b!1383749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

