; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118580 () Bool)

(assert start!118580)

(declare-fun b!1386256 () Bool)

(declare-fun e!785318 () Bool)

(declare-datatypes ((array!94856 0))(
  ( (array!94857 (arr!45804 (Array (_ BitVec 32) (_ BitVec 64))) (size!46354 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94856)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386256 (= e!785318 (validKeyInArray!0 (select (arr!45804 a!2938) startIndex!16)))))

(declare-fun b!1386257 () Bool)

(declare-datatypes ((Unit!46283 0))(
  ( (Unit!46284) )
))
(declare-fun e!785316 () Unit!46283)

(declare-fun lt!609404 () Unit!46283)

(assert (=> b!1386257 (= e!785316 lt!609404)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609405 () Unit!46283)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46283)

(assert (=> b!1386257 (= lt!609405 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10147 0))(
  ( (MissingZero!10147 (index!42959 (_ BitVec 32))) (Found!10147 (index!42960 (_ BitVec 32))) (Intermediate!10147 (undefined!10959 Bool) (index!42961 (_ BitVec 32)) (x!124580 (_ BitVec 32))) (Undefined!10147) (MissingVacant!10147 (index!42962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94856 (_ BitVec 32)) SeekEntryResult!10147)

(assert (=> b!1386257 (= (seekEntryOrOpen!0 (select (arr!45804 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45804 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94857 (store (arr!45804 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46354 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46283)

(assert (=> b!1386257 (= lt!609404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94856 (_ BitVec 32)) Bool)

(assert (=> b!1386257 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386258 () Bool)

(declare-fun res!927500 () Bool)

(declare-fun e!785317 () Bool)

(assert (=> b!1386258 (=> (not res!927500) (not e!785317))))

(assert (=> b!1386258 (= res!927500 (validKeyInArray!0 (select (arr!45804 a!2938) i!1065)))))

(declare-fun b!1386259 () Bool)

(declare-fun res!927496 () Bool)

(assert (=> b!1386259 (=> (not res!927496) (not e!785317))))

(assert (=> b!1386259 (= res!927496 (and (not (= (select (arr!45804 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45804 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386260 () Bool)

(assert (=> b!1386260 (= e!785317 false)))

(declare-fun lt!609403 () Unit!46283)

(assert (=> b!1386260 (= lt!609403 e!785316)))

(declare-fun c!128820 () Bool)

(assert (=> b!1386260 (= c!128820 e!785318)))

(declare-fun res!927502 () Bool)

(assert (=> b!1386260 (=> (not res!927502) (not e!785318))))

(assert (=> b!1386260 (= res!927502 (not (= startIndex!16 i!1065)))))

(declare-fun res!927498 () Bool)

(assert (=> start!118580 (=> (not res!927498) (not e!785317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118580 (= res!927498 (validMask!0 mask!2987))))

(assert (=> start!118580 e!785317))

(assert (=> start!118580 true))

(declare-fun array_inv!34832 (array!94856) Bool)

(assert (=> start!118580 (array_inv!34832 a!2938)))

(declare-fun b!1386261 () Bool)

(declare-fun res!927499 () Bool)

(assert (=> b!1386261 (=> (not res!927499) (not e!785317))))

(assert (=> b!1386261 (= res!927499 (and (= (size!46354 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46354 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46354 a!2938))))))

(declare-fun b!1386262 () Bool)

(declare-fun Unit!46285 () Unit!46283)

(assert (=> b!1386262 (= e!785316 Unit!46285)))

(declare-fun b!1386263 () Bool)

(declare-fun res!927501 () Bool)

(assert (=> b!1386263 (=> (not res!927501) (not e!785317))))

(declare-datatypes ((List!32332 0))(
  ( (Nil!32329) (Cons!32328 (h!33537 (_ BitVec 64)) (t!47026 List!32332)) )
))
(declare-fun arrayNoDuplicates!0 (array!94856 (_ BitVec 32) List!32332) Bool)

(assert (=> b!1386263 (= res!927501 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32329))))

(declare-fun b!1386264 () Bool)

(declare-fun res!927497 () Bool)

(assert (=> b!1386264 (=> (not res!927497) (not e!785317))))

(assert (=> b!1386264 (= res!927497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118580 res!927498) b!1386261))

(assert (= (and b!1386261 res!927499) b!1386258))

(assert (= (and b!1386258 res!927500) b!1386263))

(assert (= (and b!1386263 res!927501) b!1386264))

(assert (= (and b!1386264 res!927497) b!1386259))

(assert (= (and b!1386259 res!927496) b!1386260))

(assert (= (and b!1386260 res!927502) b!1386256))

(assert (= (and b!1386260 c!128820) b!1386257))

(assert (= (and b!1386260 (not c!128820)) b!1386262))

(declare-fun m!1271601 () Bool)

(assert (=> b!1386259 m!1271601))

(assert (=> b!1386258 m!1271601))

(assert (=> b!1386258 m!1271601))

(declare-fun m!1271603 () Bool)

(assert (=> b!1386258 m!1271603))

(declare-fun m!1271605 () Bool)

(assert (=> b!1386256 m!1271605))

(assert (=> b!1386256 m!1271605))

(declare-fun m!1271607 () Bool)

(assert (=> b!1386256 m!1271607))

(declare-fun m!1271609 () Bool)

(assert (=> start!118580 m!1271609))

(declare-fun m!1271611 () Bool)

(assert (=> start!118580 m!1271611))

(declare-fun m!1271613 () Bool)

(assert (=> b!1386263 m!1271613))

(declare-fun m!1271615 () Bool)

(assert (=> b!1386264 m!1271615))

(declare-fun m!1271617 () Bool)

(assert (=> b!1386257 m!1271617))

(declare-fun m!1271619 () Bool)

(assert (=> b!1386257 m!1271619))

(assert (=> b!1386257 m!1271619))

(declare-fun m!1271621 () Bool)

(assert (=> b!1386257 m!1271621))

(declare-fun m!1271623 () Bool)

(assert (=> b!1386257 m!1271623))

(declare-fun m!1271625 () Bool)

(assert (=> b!1386257 m!1271625))

(assert (=> b!1386257 m!1271605))

(declare-fun m!1271627 () Bool)

(assert (=> b!1386257 m!1271627))

(assert (=> b!1386257 m!1271605))

(declare-fun m!1271629 () Bool)

(assert (=> b!1386257 m!1271629))

(check-sat (not b!1386264) (not b!1386256) (not b!1386263) (not b!1386257) (not b!1386258) (not start!118580))
