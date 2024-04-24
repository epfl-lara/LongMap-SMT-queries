; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131370 () Bool)

(assert start!131370)

(declare-fun b!1538569 () Bool)

(declare-fun res!1054088 () Bool)

(declare-fun e!856552 () Bool)

(assert (=> b!1538569 (=> (not res!1054088) (not e!856552))))

(declare-datatypes ((array!102172 0))(
  ( (array!102173 (arr!49294 (Array (_ BitVec 32) (_ BitVec 64))) (size!49845 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102172)

(declare-datatypes ((List!35755 0))(
  ( (Nil!35752) (Cons!35751 (h!37214 (_ BitVec 64)) (t!50441 List!35755)) )
))
(declare-fun arrayNoDuplicates!0 (array!102172 (_ BitVec 32) List!35755) Bool)

(assert (=> b!1538569 (= res!1054088 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35752))))

(declare-fun b!1538570 () Bool)

(declare-fun res!1054080 () Bool)

(declare-fun e!856550 () Bool)

(assert (=> b!1538570 (=> (not res!1054080) (not e!856550))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538570 (= res!1054080 (not (= (select (arr!49294 a!2792) index!463) (select (arr!49294 a!2792) j!64))))))

(declare-fun b!1538571 () Bool)

(declare-fun res!1054084 () Bool)

(assert (=> b!1538571 (=> (not res!1054084) (not e!856552))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538571 (= res!1054084 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49845 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49845 a!2792)) (= (select (arr!49294 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538572 () Bool)

(declare-fun e!856551 () Bool)

(declare-fun e!856549 () Bool)

(assert (=> b!1538572 (= e!856551 e!856549)))

(declare-fun res!1054089 () Bool)

(assert (=> b!1538572 (=> (not res!1054089) (not e!856549))))

(declare-datatypes ((SeekEntryResult!13321 0))(
  ( (MissingZero!13321 (index!55679 (_ BitVec 32))) (Found!13321 (index!55680 (_ BitVec 32))) (Intermediate!13321 (undefined!14133 Bool) (index!55681 (_ BitVec 32)) (x!137629 (_ BitVec 32))) (Undefined!13321) (MissingVacant!13321 (index!55682 (_ BitVec 32))) )
))
(declare-fun lt!665145 () SeekEntryResult!13321)

(declare-fun lt!665147 () SeekEntryResult!13321)

(assert (=> b!1538572 (= res!1054089 (= lt!665145 lt!665147))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!665148 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102172 (_ BitVec 32)) SeekEntryResult!13321)

(assert (=> b!1538572 (= lt!665145 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665148 vacantIndex!5 (select (arr!49294 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538573 () Bool)

(assert (=> b!1538573 (= e!856549 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538573 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665148 vacantIndex!5 (select (store (arr!49294 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102173 (store (arr!49294 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49845 a!2792)) mask!2480) lt!665145)))

(declare-datatypes ((Unit!51251 0))(
  ( (Unit!51252) )
))
(declare-fun lt!665146 () Unit!51251)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51251)

(assert (=> b!1538573 (= lt!665146 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665148 vacantIndex!5 mask!2480))))

(declare-fun res!1054087 () Bool)

(assert (=> start!131370 (=> (not res!1054087) (not e!856552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131370 (= res!1054087 (validMask!0 mask!2480))))

(assert (=> start!131370 e!856552))

(assert (=> start!131370 true))

(declare-fun array_inv!38575 (array!102172) Bool)

(assert (=> start!131370 (array_inv!38575 a!2792)))

(declare-fun b!1538574 () Bool)

(declare-fun res!1054086 () Bool)

(assert (=> b!1538574 (=> (not res!1054086) (not e!856552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538574 (= res!1054086 (validKeyInArray!0 (select (arr!49294 a!2792) i!951)))))

(declare-fun b!1538575 () Bool)

(declare-fun res!1054081 () Bool)

(assert (=> b!1538575 (=> (not res!1054081) (not e!856552))))

(assert (=> b!1538575 (= res!1054081 (and (= (size!49845 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49845 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49845 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538576 () Bool)

(assert (=> b!1538576 (= e!856552 e!856550)))

(declare-fun res!1054082 () Bool)

(assert (=> b!1538576 (=> (not res!1054082) (not e!856550))))

(assert (=> b!1538576 (= res!1054082 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49294 a!2792) j!64) a!2792 mask!2480) lt!665147))))

(assert (=> b!1538576 (= lt!665147 (Found!13321 j!64))))

(declare-fun b!1538577 () Bool)

(declare-fun res!1054079 () Bool)

(assert (=> b!1538577 (=> (not res!1054079) (not e!856552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102172 (_ BitVec 32)) Bool)

(assert (=> b!1538577 (= res!1054079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538578 () Bool)

(declare-fun res!1054083 () Bool)

(assert (=> b!1538578 (=> (not res!1054083) (not e!856552))))

(assert (=> b!1538578 (= res!1054083 (validKeyInArray!0 (select (arr!49294 a!2792) j!64)))))

(declare-fun b!1538579 () Bool)

(assert (=> b!1538579 (= e!856550 e!856551)))

(declare-fun res!1054085 () Bool)

(assert (=> b!1538579 (=> (not res!1054085) (not e!856551))))

(assert (=> b!1538579 (= res!1054085 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665148 #b00000000000000000000000000000000) (bvslt lt!665148 (size!49845 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538579 (= lt!665148 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (= (and start!131370 res!1054087) b!1538575))

(assert (= (and b!1538575 res!1054081) b!1538574))

(assert (= (and b!1538574 res!1054086) b!1538578))

(assert (= (and b!1538578 res!1054083) b!1538577))

(assert (= (and b!1538577 res!1054079) b!1538569))

(assert (= (and b!1538569 res!1054088) b!1538571))

(assert (= (and b!1538571 res!1054084) b!1538576))

(assert (= (and b!1538576 res!1054082) b!1538570))

(assert (= (and b!1538570 res!1054080) b!1538579))

(assert (= (and b!1538579 res!1054085) b!1538572))

(assert (= (and b!1538572 res!1054089) b!1538573))

(declare-fun m!1420825 () Bool)

(assert (=> b!1538573 m!1420825))

(declare-fun m!1420827 () Bool)

(assert (=> b!1538573 m!1420827))

(assert (=> b!1538573 m!1420827))

(declare-fun m!1420829 () Bool)

(assert (=> b!1538573 m!1420829))

(declare-fun m!1420831 () Bool)

(assert (=> b!1538573 m!1420831))

(declare-fun m!1420833 () Bool)

(assert (=> b!1538571 m!1420833))

(declare-fun m!1420835 () Bool)

(assert (=> b!1538574 m!1420835))

(assert (=> b!1538574 m!1420835))

(declare-fun m!1420837 () Bool)

(assert (=> b!1538574 m!1420837))

(declare-fun m!1420839 () Bool)

(assert (=> b!1538577 m!1420839))

(declare-fun m!1420841 () Bool)

(assert (=> b!1538578 m!1420841))

(assert (=> b!1538578 m!1420841))

(declare-fun m!1420843 () Bool)

(assert (=> b!1538578 m!1420843))

(declare-fun m!1420845 () Bool)

(assert (=> b!1538569 m!1420845))

(assert (=> b!1538572 m!1420841))

(assert (=> b!1538572 m!1420841))

(declare-fun m!1420847 () Bool)

(assert (=> b!1538572 m!1420847))

(declare-fun m!1420849 () Bool)

(assert (=> b!1538570 m!1420849))

(assert (=> b!1538570 m!1420841))

(declare-fun m!1420851 () Bool)

(assert (=> b!1538579 m!1420851))

(assert (=> b!1538576 m!1420841))

(assert (=> b!1538576 m!1420841))

(declare-fun m!1420853 () Bool)

(assert (=> b!1538576 m!1420853))

(declare-fun m!1420855 () Bool)

(assert (=> start!131370 m!1420855))

(declare-fun m!1420857 () Bool)

(assert (=> start!131370 m!1420857))

(check-sat (not b!1538574) (not b!1538577) (not b!1538569) (not start!131370) (not b!1538578) (not b!1538576) (not b!1538579) (not b!1538573) (not b!1538572))
(check-sat)
