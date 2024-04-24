; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131358 () Bool)

(assert start!131358)

(declare-fun b!1538371 () Bool)

(declare-fun e!856462 () Bool)

(declare-fun e!856458 () Bool)

(assert (=> b!1538371 (= e!856462 e!856458)))

(declare-fun res!1053884 () Bool)

(assert (=> b!1538371 (=> (not res!1053884) (not e!856458))))

(declare-datatypes ((SeekEntryResult!13315 0))(
  ( (MissingZero!13315 (index!55655 (_ BitVec 32))) (Found!13315 (index!55656 (_ BitVec 32))) (Intermediate!13315 (undefined!14127 Bool) (index!55657 (_ BitVec 32)) (x!137607 (_ BitVec 32))) (Undefined!13315) (MissingVacant!13315 (index!55658 (_ BitVec 32))) )
))
(declare-fun lt!665074 () SeekEntryResult!13315)

(declare-fun lt!665076 () SeekEntryResult!13315)

(assert (=> b!1538371 (= res!1053884 (= lt!665074 lt!665076))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102160 0))(
  ( (array!102161 (arr!49288 (Array (_ BitVec 32) (_ BitVec 64))) (size!49839 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102160)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665073 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102160 (_ BitVec 32)) SeekEntryResult!13315)

(assert (=> b!1538371 (= lt!665074 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665073 vacantIndex!5 (select (arr!49288 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538372 () Bool)

(declare-fun res!1053886 () Bool)

(declare-fun e!856461 () Bool)

(assert (=> b!1538372 (=> (not res!1053886) (not e!856461))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538372 (= res!1053886 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49839 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49839 a!2792)) (= (select (arr!49288 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538373 () Bool)

(assert (=> b!1538373 (= e!856458 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538373 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665073 vacantIndex!5 (select (store (arr!49288 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102161 (store (arr!49288 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49839 a!2792)) mask!2480) lt!665074)))

(declare-datatypes ((Unit!51239 0))(
  ( (Unit!51240) )
))
(declare-fun lt!665075 () Unit!51239)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51239)

(assert (=> b!1538373 (= lt!665075 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665073 vacantIndex!5 mask!2480))))

(declare-fun b!1538374 () Bool)

(declare-fun res!1053891 () Bool)

(assert (=> b!1538374 (=> (not res!1053891) (not e!856461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102160 (_ BitVec 32)) Bool)

(assert (=> b!1538374 (= res!1053891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538375 () Bool)

(declare-fun e!856459 () Bool)

(assert (=> b!1538375 (= e!856459 e!856462)))

(declare-fun res!1053883 () Bool)

(assert (=> b!1538375 (=> (not res!1053883) (not e!856462))))

(assert (=> b!1538375 (= res!1053883 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665073 #b00000000000000000000000000000000) (bvslt lt!665073 (size!49839 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538375 (= lt!665073 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538376 () Bool)

(declare-fun res!1053890 () Bool)

(assert (=> b!1538376 (=> (not res!1053890) (not e!856461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538376 (= res!1053890 (validKeyInArray!0 (select (arr!49288 a!2792) i!951)))))

(declare-fun b!1538377 () Bool)

(declare-fun res!1053885 () Bool)

(assert (=> b!1538377 (=> (not res!1053885) (not e!856461))))

(declare-datatypes ((List!35749 0))(
  ( (Nil!35746) (Cons!35745 (h!37208 (_ BitVec 64)) (t!50435 List!35749)) )
))
(declare-fun arrayNoDuplicates!0 (array!102160 (_ BitVec 32) List!35749) Bool)

(assert (=> b!1538377 (= res!1053885 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35746))))

(declare-fun res!1053881 () Bool)

(assert (=> start!131358 (=> (not res!1053881) (not e!856461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131358 (= res!1053881 (validMask!0 mask!2480))))

(assert (=> start!131358 e!856461))

(assert (=> start!131358 true))

(declare-fun array_inv!38569 (array!102160) Bool)

(assert (=> start!131358 (array_inv!38569 a!2792)))

(declare-fun b!1538378 () Bool)

(assert (=> b!1538378 (= e!856461 e!856459)))

(declare-fun res!1053882 () Bool)

(assert (=> b!1538378 (=> (not res!1053882) (not e!856459))))

(assert (=> b!1538378 (= res!1053882 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49288 a!2792) j!64) a!2792 mask!2480) lt!665076))))

(assert (=> b!1538378 (= lt!665076 (Found!13315 j!64))))

(declare-fun b!1538379 () Bool)

(declare-fun res!1053888 () Bool)

(assert (=> b!1538379 (=> (not res!1053888) (not e!856459))))

(assert (=> b!1538379 (= res!1053888 (not (= (select (arr!49288 a!2792) index!463) (select (arr!49288 a!2792) j!64))))))

(declare-fun b!1538380 () Bool)

(declare-fun res!1053887 () Bool)

(assert (=> b!1538380 (=> (not res!1053887) (not e!856461))))

(assert (=> b!1538380 (= res!1053887 (validKeyInArray!0 (select (arr!49288 a!2792) j!64)))))

(declare-fun b!1538381 () Bool)

(declare-fun res!1053889 () Bool)

(assert (=> b!1538381 (=> (not res!1053889) (not e!856461))))

(assert (=> b!1538381 (= res!1053889 (and (= (size!49839 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49839 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49839 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131358 res!1053881) b!1538381))

(assert (= (and b!1538381 res!1053889) b!1538376))

(assert (= (and b!1538376 res!1053890) b!1538380))

(assert (= (and b!1538380 res!1053887) b!1538374))

(assert (= (and b!1538374 res!1053891) b!1538377))

(assert (= (and b!1538377 res!1053885) b!1538372))

(assert (= (and b!1538372 res!1053886) b!1538378))

(assert (= (and b!1538378 res!1053882) b!1538379))

(assert (= (and b!1538379 res!1053888) b!1538375))

(assert (= (and b!1538375 res!1053883) b!1538371))

(assert (= (and b!1538371 res!1053884) b!1538373))

(declare-fun m!1420621 () Bool)

(assert (=> b!1538379 m!1420621))

(declare-fun m!1420623 () Bool)

(assert (=> b!1538379 m!1420623))

(assert (=> b!1538371 m!1420623))

(assert (=> b!1538371 m!1420623))

(declare-fun m!1420625 () Bool)

(assert (=> b!1538371 m!1420625))

(declare-fun m!1420627 () Bool)

(assert (=> b!1538372 m!1420627))

(declare-fun m!1420629 () Bool)

(assert (=> b!1538373 m!1420629))

(declare-fun m!1420631 () Bool)

(assert (=> b!1538373 m!1420631))

(assert (=> b!1538373 m!1420631))

(declare-fun m!1420633 () Bool)

(assert (=> b!1538373 m!1420633))

(declare-fun m!1420635 () Bool)

(assert (=> b!1538373 m!1420635))

(declare-fun m!1420637 () Bool)

(assert (=> b!1538374 m!1420637))

(declare-fun m!1420639 () Bool)

(assert (=> b!1538376 m!1420639))

(assert (=> b!1538376 m!1420639))

(declare-fun m!1420641 () Bool)

(assert (=> b!1538376 m!1420641))

(declare-fun m!1420643 () Bool)

(assert (=> b!1538375 m!1420643))

(assert (=> b!1538380 m!1420623))

(assert (=> b!1538380 m!1420623))

(declare-fun m!1420645 () Bool)

(assert (=> b!1538380 m!1420645))

(assert (=> b!1538378 m!1420623))

(assert (=> b!1538378 m!1420623))

(declare-fun m!1420647 () Bool)

(assert (=> b!1538378 m!1420647))

(declare-fun m!1420649 () Bool)

(assert (=> start!131358 m!1420649))

(declare-fun m!1420651 () Bool)

(assert (=> start!131358 m!1420651))

(declare-fun m!1420653 () Bool)

(assert (=> b!1538377 m!1420653))

(check-sat (not b!1538380) (not b!1538371) (not b!1538378) (not b!1538376) (not start!131358) (not b!1538375) (not b!1538377) (not b!1538373) (not b!1538374))
(check-sat)
