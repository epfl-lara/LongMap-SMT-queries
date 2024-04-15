; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118376 () Bool)

(assert start!118376)

(declare-fun b!1384605 () Bool)

(declare-fun e!784583 () Bool)

(declare-fun e!784581 () Bool)

(assert (=> b!1384605 (= e!784583 e!784581)))

(declare-fun res!926043 () Bool)

(assert (=> b!1384605 (=> (not res!926043) (not e!784581))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94632 0))(
  ( (array!94633 (arr!45694 (Array (_ BitVec 32) (_ BitVec 64))) (size!46246 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94632)

(assert (=> b!1384605 (= res!926043 (and (bvslt startIndex!16 (bvsub (size!46246 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!46035 0))(
  ( (Unit!46036) )
))
(declare-fun lt!608822 () Unit!46035)

(declare-fun e!784584 () Unit!46035)

(assert (=> b!1384605 (= lt!608822 e!784584)))

(declare-fun c!128726 () Bool)

(declare-fun e!784582 () Bool)

(assert (=> b!1384605 (= c!128726 e!784582)))

(declare-fun res!926044 () Bool)

(assert (=> b!1384605 (=> (not res!926044) (not e!784582))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384605 (= res!926044 (not (= startIndex!16 i!1065)))))

(declare-fun lt!608821 () array!94632)

(assert (=> b!1384605 (= lt!608821 (array!94633 (store (arr!45694 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46246 a!2938)))))

(declare-fun b!1384606 () Bool)

(assert (=> b!1384606 (= e!784581 (not true))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94632 (_ BitVec 32)) Bool)

(assert (=> b!1384606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608821 mask!2987)))

(declare-fun lt!608820 () Unit!46035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46035)

(assert (=> b!1384606 (= lt!608820 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun res!926041 () Bool)

(assert (=> start!118376 (=> (not res!926041) (not e!784583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118376 (= res!926041 (validMask!0 mask!2987))))

(assert (=> start!118376 e!784583))

(assert (=> start!118376 true))

(declare-fun array_inv!34927 (array!94632) Bool)

(assert (=> start!118376 (array_inv!34927 a!2938)))

(declare-fun b!1384607 () Bool)

(declare-fun lt!608819 () Unit!46035)

(assert (=> b!1384607 (= e!784584 lt!608819)))

(declare-fun lt!608818 () Unit!46035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46035)

(assert (=> b!1384607 (= lt!608818 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10111 0))(
  ( (MissingZero!10111 (index!42815 (_ BitVec 32))) (Found!10111 (index!42816 (_ BitVec 32))) (Intermediate!10111 (undefined!10923 Bool) (index!42817 (_ BitVec 32)) (x!124317 (_ BitVec 32))) (Undefined!10111) (MissingVacant!10111 (index!42818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94632 (_ BitVec 32)) SeekEntryResult!10111)

(assert (=> b!1384607 (= (seekEntryOrOpen!0 (select (arr!45694 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45694 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608821 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46035)

(assert (=> b!1384607 (= lt!608819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384607 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384608 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384608 (= e!784582 (validKeyInArray!0 (select (arr!45694 a!2938) startIndex!16)))))

(declare-fun b!1384609 () Bool)

(declare-fun res!926045 () Bool)

(assert (=> b!1384609 (=> (not res!926045) (not e!784583))))

(assert (=> b!1384609 (= res!926045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384610 () Bool)

(declare-fun Unit!46037 () Unit!46035)

(assert (=> b!1384610 (= e!784584 Unit!46037)))

(declare-fun b!1384611 () Bool)

(declare-fun res!926040 () Bool)

(assert (=> b!1384611 (=> (not res!926040) (not e!784583))))

(assert (=> b!1384611 (= res!926040 (and (= (size!46246 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46246 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46246 a!2938))))))

(declare-fun b!1384612 () Bool)

(declare-fun res!926039 () Bool)

(assert (=> b!1384612 (=> (not res!926039) (not e!784583))))

(assert (=> b!1384612 (= res!926039 (validKeyInArray!0 (select (arr!45694 a!2938) i!1065)))))

(declare-fun b!1384613 () Bool)

(declare-fun res!926038 () Bool)

(assert (=> b!1384613 (=> (not res!926038) (not e!784583))))

(declare-datatypes ((List!32300 0))(
  ( (Nil!32297) (Cons!32296 (h!33505 (_ BitVec 64)) (t!46986 List!32300)) )
))
(declare-fun arrayNoDuplicates!0 (array!94632 (_ BitVec 32) List!32300) Bool)

(assert (=> b!1384613 (= res!926038 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32297))))

(declare-fun b!1384614 () Bool)

(declare-fun res!926042 () Bool)

(assert (=> b!1384614 (=> (not res!926042) (not e!784583))))

(assert (=> b!1384614 (= res!926042 (and (not (= (select (arr!45694 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45694 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118376 res!926041) b!1384611))

(assert (= (and b!1384611 res!926040) b!1384612))

(assert (= (and b!1384612 res!926039) b!1384613))

(assert (= (and b!1384613 res!926038) b!1384609))

(assert (= (and b!1384609 res!926045) b!1384614))

(assert (= (and b!1384614 res!926042) b!1384605))

(assert (= (and b!1384605 res!926044) b!1384608))

(assert (= (and b!1384605 c!128726) b!1384607))

(assert (= (and b!1384605 (not c!128726)) b!1384610))

(assert (= (and b!1384605 res!926043) b!1384606))

(declare-fun m!1269441 () Bool)

(assert (=> b!1384608 m!1269441))

(assert (=> b!1384608 m!1269441))

(declare-fun m!1269443 () Bool)

(assert (=> b!1384608 m!1269443))

(declare-fun m!1269445 () Bool)

(assert (=> b!1384607 m!1269445))

(declare-fun m!1269447 () Bool)

(assert (=> b!1384607 m!1269447))

(declare-fun m!1269449 () Bool)

(assert (=> b!1384607 m!1269449))

(assert (=> b!1384607 m!1269447))

(declare-fun m!1269451 () Bool)

(assert (=> b!1384607 m!1269451))

(declare-fun m!1269453 () Bool)

(assert (=> b!1384607 m!1269453))

(assert (=> b!1384607 m!1269441))

(declare-fun m!1269455 () Bool)

(assert (=> b!1384607 m!1269455))

(assert (=> b!1384607 m!1269441))

(declare-fun m!1269457 () Bool)

(assert (=> b!1384607 m!1269457))

(declare-fun m!1269459 () Bool)

(assert (=> b!1384606 m!1269459))

(declare-fun m!1269461 () Bool)

(assert (=> b!1384606 m!1269461))

(declare-fun m!1269463 () Bool)

(assert (=> start!118376 m!1269463))

(declare-fun m!1269465 () Bool)

(assert (=> start!118376 m!1269465))

(declare-fun m!1269467 () Bool)

(assert (=> b!1384613 m!1269467))

(declare-fun m!1269469 () Bool)

(assert (=> b!1384614 m!1269469))

(assert (=> b!1384612 m!1269469))

(assert (=> b!1384612 m!1269469))

(declare-fun m!1269471 () Bool)

(assert (=> b!1384612 m!1269471))

(assert (=> b!1384605 m!1269449))

(declare-fun m!1269473 () Bool)

(assert (=> b!1384609 m!1269473))

(check-sat (not b!1384612) (not b!1384613) (not start!118376) (not b!1384606) (not b!1384609) (not b!1384607) (not b!1384608))
(check-sat)
