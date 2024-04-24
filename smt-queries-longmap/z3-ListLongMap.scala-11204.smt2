; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131274 () Bool)

(assert start!131274)

(declare-fun b!1537109 () Bool)

(declare-fun res!1052624 () Bool)

(declare-fun e!856078 () Bool)

(assert (=> b!1537109 (=> (not res!1052624) (not e!856078))))

(declare-datatypes ((array!102076 0))(
  ( (array!102077 (arr!49246 (Array (_ BitVec 32) (_ BitVec 64))) (size!49797 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102076)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102076 (_ BitVec 32)) Bool)

(assert (=> b!1537109 (= res!1052624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537110 () Bool)

(declare-fun e!856076 () Bool)

(assert (=> b!1537110 (= e!856076 false)))

(declare-fun lt!664817 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13273 0))(
  ( (MissingZero!13273 (index!55487 (_ BitVec 32))) (Found!13273 (index!55488 (_ BitVec 32))) (Intermediate!13273 (undefined!14085 Bool) (index!55489 (_ BitVec 32)) (x!137453 (_ BitVec 32))) (Undefined!13273) (MissingVacant!13273 (index!55490 (_ BitVec 32))) )
))
(declare-fun lt!664818 () SeekEntryResult!13273)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102076 (_ BitVec 32)) SeekEntryResult!13273)

(assert (=> b!1537110 (= lt!664818 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664817 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537111 () Bool)

(declare-fun res!1052627 () Bool)

(assert (=> b!1537111 (=> (not res!1052627) (not e!856078))))

(declare-datatypes ((List!35707 0))(
  ( (Nil!35704) (Cons!35703 (h!37166 (_ BitVec 64)) (t!50393 List!35707)) )
))
(declare-fun arrayNoDuplicates!0 (array!102076 (_ BitVec 32) List!35707) Bool)

(assert (=> b!1537111 (= res!1052627 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35704))))

(declare-fun b!1537112 () Bool)

(declare-fun res!1052620 () Bool)

(assert (=> b!1537112 (=> (not res!1052620) (not e!856078))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537112 (= res!1052620 (validKeyInArray!0 (select (arr!49246 a!2792) i!951)))))

(declare-fun b!1537113 () Bool)

(declare-fun res!1052625 () Bool)

(assert (=> b!1537113 (=> (not res!1052625) (not e!856078))))

(assert (=> b!1537113 (= res!1052625 (validKeyInArray!0 (select (arr!49246 a!2792) j!64)))))

(declare-fun b!1537114 () Bool)

(declare-fun res!1052623 () Bool)

(assert (=> b!1537114 (=> (not res!1052623) (not e!856078))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537114 (= res!1052623 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480) (Found!13273 j!64)))))

(declare-fun b!1537116 () Bool)

(assert (=> b!1537116 (= e!856078 e!856076)))

(declare-fun res!1052628 () Bool)

(assert (=> b!1537116 (=> (not res!1052628) (not e!856076))))

(assert (=> b!1537116 (= res!1052628 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664817 #b00000000000000000000000000000000) (bvslt lt!664817 (size!49797 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537116 (= lt!664817 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537117 () Bool)

(declare-fun res!1052622 () Bool)

(assert (=> b!1537117 (=> (not res!1052622) (not e!856078))))

(assert (=> b!1537117 (= res!1052622 (and (= (size!49797 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49797 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49797 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537118 () Bool)

(declare-fun res!1052621 () Bool)

(assert (=> b!1537118 (=> (not res!1052621) (not e!856078))))

(assert (=> b!1537118 (= res!1052621 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49797 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49797 a!2792)) (= (select (arr!49246 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537115 () Bool)

(declare-fun res!1052626 () Bool)

(assert (=> b!1537115 (=> (not res!1052626) (not e!856078))))

(assert (=> b!1537115 (= res!1052626 (not (= (select (arr!49246 a!2792) index!463) (select (arr!49246 a!2792) j!64))))))

(declare-fun res!1052619 () Bool)

(assert (=> start!131274 (=> (not res!1052619) (not e!856078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131274 (= res!1052619 (validMask!0 mask!2480))))

(assert (=> start!131274 e!856078))

(assert (=> start!131274 true))

(declare-fun array_inv!38527 (array!102076) Bool)

(assert (=> start!131274 (array_inv!38527 a!2792)))

(assert (= (and start!131274 res!1052619) b!1537117))

(assert (= (and b!1537117 res!1052622) b!1537112))

(assert (= (and b!1537112 res!1052620) b!1537113))

(assert (= (and b!1537113 res!1052625) b!1537109))

(assert (= (and b!1537109 res!1052624) b!1537111))

(assert (= (and b!1537111 res!1052627) b!1537118))

(assert (= (and b!1537118 res!1052621) b!1537114))

(assert (= (and b!1537114 res!1052623) b!1537115))

(assert (= (and b!1537115 res!1052626) b!1537116))

(assert (= (and b!1537116 res!1052628) b!1537110))

(declare-fun m!1419529 () Bool)

(assert (=> b!1537110 m!1419529))

(assert (=> b!1537110 m!1419529))

(declare-fun m!1419531 () Bool)

(assert (=> b!1537110 m!1419531))

(declare-fun m!1419533 () Bool)

(assert (=> start!131274 m!1419533))

(declare-fun m!1419535 () Bool)

(assert (=> start!131274 m!1419535))

(declare-fun m!1419537 () Bool)

(assert (=> b!1537115 m!1419537))

(assert (=> b!1537115 m!1419529))

(declare-fun m!1419539 () Bool)

(assert (=> b!1537111 m!1419539))

(assert (=> b!1537113 m!1419529))

(assert (=> b!1537113 m!1419529))

(declare-fun m!1419541 () Bool)

(assert (=> b!1537113 m!1419541))

(declare-fun m!1419543 () Bool)

(assert (=> b!1537116 m!1419543))

(declare-fun m!1419545 () Bool)

(assert (=> b!1537112 m!1419545))

(assert (=> b!1537112 m!1419545))

(declare-fun m!1419547 () Bool)

(assert (=> b!1537112 m!1419547))

(declare-fun m!1419549 () Bool)

(assert (=> b!1537118 m!1419549))

(declare-fun m!1419551 () Bool)

(assert (=> b!1537109 m!1419551))

(assert (=> b!1537114 m!1419529))

(assert (=> b!1537114 m!1419529))

(declare-fun m!1419553 () Bool)

(assert (=> b!1537114 m!1419553))

(check-sat (not b!1537113) (not b!1537114) (not b!1537116) (not b!1537111) (not b!1537112) (not b!1537110) (not start!131274) (not b!1537109))
(check-sat)
