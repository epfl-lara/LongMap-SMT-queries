; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118358 () Bool)

(assert start!118358)

(declare-fun b!1384357 () Bool)

(declare-datatypes ((Unit!46161 0))(
  ( (Unit!46162) )
))
(declare-fun e!784463 () Unit!46161)

(declare-fun Unit!46163 () Unit!46161)

(assert (=> b!1384357 (= e!784463 Unit!46163)))

(declare-fun b!1384358 () Bool)

(declare-fun res!925818 () Bool)

(declare-fun e!784460 () Bool)

(assert (=> b!1384358 (=> (not res!925818) (not e!784460))))

(declare-datatypes ((array!94661 0))(
  ( (array!94662 (arr!45708 (Array (_ BitVec 32) (_ BitVec 64))) (size!46258 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94661)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384358 (= res!925818 (validKeyInArray!0 (select (arr!45708 a!2938) i!1065)))))

(declare-fun b!1384359 () Bool)

(assert (=> b!1384359 (= e!784460 false)))

(declare-fun lt!608864 () Unit!46161)

(assert (=> b!1384359 (= lt!608864 e!784463)))

(declare-fun c!128712 () Bool)

(declare-fun e!784461 () Bool)

(assert (=> b!1384359 (= c!128712 e!784461)))

(declare-fun res!925815 () Bool)

(assert (=> b!1384359 (=> (not res!925815) (not e!784461))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384359 (= res!925815 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384360 () Bool)

(declare-fun res!925819 () Bool)

(assert (=> b!1384360 (=> (not res!925819) (not e!784460))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94661 (_ BitVec 32)) Bool)

(assert (=> b!1384360 (= res!925819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384361 () Bool)

(declare-fun lt!608863 () Unit!46161)

(assert (=> b!1384361 (= e!784463 lt!608863)))

(declare-fun lt!608865 () Unit!46161)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46161)

(assert (=> b!1384361 (= lt!608865 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10101 0))(
  ( (MissingZero!10101 (index!42775 (_ BitVec 32))) (Found!10101 (index!42776 (_ BitVec 32))) (Intermediate!10101 (undefined!10913 Bool) (index!42777 (_ BitVec 32)) (x!124278 (_ BitVec 32))) (Undefined!10101) (MissingVacant!10101 (index!42778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94661 (_ BitVec 32)) SeekEntryResult!10101)

(assert (=> b!1384361 (= (seekEntryOrOpen!0 (select (arr!45708 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45708 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94662 (store (arr!45708 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46258 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46161)

(assert (=> b!1384361 (= lt!608863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384361 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384363 () Bool)

(declare-fun res!925813 () Bool)

(assert (=> b!1384363 (=> (not res!925813) (not e!784460))))

(declare-datatypes ((List!32236 0))(
  ( (Nil!32233) (Cons!32232 (h!33441 (_ BitVec 64)) (t!46930 List!32236)) )
))
(declare-fun arrayNoDuplicates!0 (array!94661 (_ BitVec 32) List!32236) Bool)

(assert (=> b!1384363 (= res!925813 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32233))))

(declare-fun b!1384364 () Bool)

(declare-fun res!925816 () Bool)

(assert (=> b!1384364 (=> (not res!925816) (not e!784460))))

(assert (=> b!1384364 (= res!925816 (and (= (size!46258 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46258 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46258 a!2938))))))

(declare-fun b!1384365 () Bool)

(assert (=> b!1384365 (= e!784461 (validKeyInArray!0 (select (arr!45708 a!2938) startIndex!16)))))

(declare-fun res!925814 () Bool)

(assert (=> start!118358 (=> (not res!925814) (not e!784460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118358 (= res!925814 (validMask!0 mask!2987))))

(assert (=> start!118358 e!784460))

(assert (=> start!118358 true))

(declare-fun array_inv!34736 (array!94661) Bool)

(assert (=> start!118358 (array_inv!34736 a!2938)))

(declare-fun b!1384362 () Bool)

(declare-fun res!925817 () Bool)

(assert (=> b!1384362 (=> (not res!925817) (not e!784460))))

(assert (=> b!1384362 (= res!925817 (and (not (= (select (arr!45708 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45708 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118358 res!925814) b!1384364))

(assert (= (and b!1384364 res!925816) b!1384358))

(assert (= (and b!1384358 res!925818) b!1384363))

(assert (= (and b!1384363 res!925813) b!1384360))

(assert (= (and b!1384360 res!925819) b!1384362))

(assert (= (and b!1384362 res!925817) b!1384359))

(assert (= (and b!1384359 res!925815) b!1384365))

(assert (= (and b!1384359 c!128712) b!1384361))

(assert (= (and b!1384359 (not c!128712)) b!1384357))

(declare-fun m!1269591 () Bool)

(assert (=> b!1384358 m!1269591))

(assert (=> b!1384358 m!1269591))

(declare-fun m!1269593 () Bool)

(assert (=> b!1384358 m!1269593))

(declare-fun m!1269595 () Bool)

(assert (=> b!1384360 m!1269595))

(declare-fun m!1269597 () Bool)

(assert (=> start!118358 m!1269597))

(declare-fun m!1269599 () Bool)

(assert (=> start!118358 m!1269599))

(assert (=> b!1384362 m!1269591))

(declare-fun m!1269601 () Bool)

(assert (=> b!1384363 m!1269601))

(declare-fun m!1269603 () Bool)

(assert (=> b!1384365 m!1269603))

(assert (=> b!1384365 m!1269603))

(declare-fun m!1269605 () Bool)

(assert (=> b!1384365 m!1269605))

(declare-fun m!1269607 () Bool)

(assert (=> b!1384361 m!1269607))

(declare-fun m!1269609 () Bool)

(assert (=> b!1384361 m!1269609))

(assert (=> b!1384361 m!1269609))

(declare-fun m!1269611 () Bool)

(assert (=> b!1384361 m!1269611))

(declare-fun m!1269613 () Bool)

(assert (=> b!1384361 m!1269613))

(declare-fun m!1269615 () Bool)

(assert (=> b!1384361 m!1269615))

(assert (=> b!1384361 m!1269603))

(declare-fun m!1269617 () Bool)

(assert (=> b!1384361 m!1269617))

(assert (=> b!1384361 m!1269603))

(declare-fun m!1269619 () Bool)

(assert (=> b!1384361 m!1269619))

(check-sat (not b!1384363) (not b!1384360) (not b!1384358) (not start!118358) (not b!1384361) (not b!1384365))
