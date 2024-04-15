; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130812 () Bool)

(assert start!130812)

(declare-fun b!1534450 () Bool)

(declare-fun e!854396 () Bool)

(declare-fun e!854397 () Bool)

(assert (=> b!1534450 (= e!854396 e!854397)))

(declare-fun res!1051720 () Bool)

(assert (=> b!1534450 (=> (not res!1051720) (not e!854397))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101908 0))(
  ( (array!101909 (arr!49171 (Array (_ BitVec 32) (_ BitVec 64))) (size!49723 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101908)

(declare-fun lt!663638 () (_ BitVec 32))

(assert (=> b!1534450 (= res!1051720 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663638 #b00000000000000000000000000000000) (bvslt lt!663638 (size!49723 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534450 (= lt!663638 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534451 () Bool)

(declare-fun res!1051728 () Bool)

(assert (=> b!1534451 (=> (not res!1051728) (not e!854396))))

(declare-datatypes ((List!35723 0))(
  ( (Nil!35720) (Cons!35719 (h!37165 (_ BitVec 64)) (t!50409 List!35723)) )
))
(declare-fun arrayNoDuplicates!0 (array!101908 (_ BitVec 32) List!35723) Bool)

(assert (=> b!1534451 (= res!1051728 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35720))))

(declare-fun b!1534452 () Bool)

(declare-fun res!1051725 () Bool)

(assert (=> b!1534452 (=> (not res!1051725) (not e!854396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101908 (_ BitVec 32)) Bool)

(assert (=> b!1534452 (= res!1051725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534453 () Bool)

(declare-fun res!1051724 () Bool)

(assert (=> b!1534453 (=> (not res!1051724) (not e!854396))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534453 (= res!1051724 (and (= (size!49723 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49723 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49723 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534454 () Bool)

(declare-fun res!1051723 () Bool)

(assert (=> b!1534454 (=> (not res!1051723) (not e!854396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534454 (= res!1051723 (validKeyInArray!0 (select (arr!49171 a!2792) j!64)))))

(declare-fun b!1534455 () Bool)

(declare-fun res!1051729 () Bool)

(assert (=> b!1534455 (=> (not res!1051729) (not e!854396))))

(assert (=> b!1534455 (= res!1051729 (validKeyInArray!0 (select (arr!49171 a!2792) i!951)))))

(declare-fun b!1534456 () Bool)

(assert (=> b!1534456 (= e!854397 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13328 0))(
  ( (MissingZero!13328 (index!55707 (_ BitVec 32))) (Found!13328 (index!55708 (_ BitVec 32))) (Intermediate!13328 (undefined!14140 Bool) (index!55709 (_ BitVec 32)) (x!137461 (_ BitVec 32))) (Undefined!13328) (MissingVacant!13328 (index!55710 (_ BitVec 32))) )
))
(declare-fun lt!663639 () SeekEntryResult!13328)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101908 (_ BitVec 32)) SeekEntryResult!13328)

(assert (=> b!1534456 (= lt!663639 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663638 vacantIndex!5 (select (arr!49171 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1051727 () Bool)

(assert (=> start!130812 (=> (not res!1051727) (not e!854396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130812 (= res!1051727 (validMask!0 mask!2480))))

(assert (=> start!130812 e!854396))

(assert (=> start!130812 true))

(declare-fun array_inv!38404 (array!101908) Bool)

(assert (=> start!130812 (array_inv!38404 a!2792)))

(declare-fun b!1534457 () Bool)

(declare-fun res!1051722 () Bool)

(assert (=> b!1534457 (=> (not res!1051722) (not e!854396))))

(assert (=> b!1534457 (= res!1051722 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49723 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49723 a!2792)) (= (select (arr!49171 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534458 () Bool)

(declare-fun res!1051721 () Bool)

(assert (=> b!1534458 (=> (not res!1051721) (not e!854396))))

(assert (=> b!1534458 (= res!1051721 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49171 a!2792) j!64) a!2792 mask!2480) (Found!13328 j!64)))))

(declare-fun b!1534459 () Bool)

(declare-fun res!1051726 () Bool)

(assert (=> b!1534459 (=> (not res!1051726) (not e!854396))))

(assert (=> b!1534459 (= res!1051726 (not (= (select (arr!49171 a!2792) index!463) (select (arr!49171 a!2792) j!64))))))

(assert (= (and start!130812 res!1051727) b!1534453))

(assert (= (and b!1534453 res!1051724) b!1534455))

(assert (= (and b!1534455 res!1051729) b!1534454))

(assert (= (and b!1534454 res!1051723) b!1534452))

(assert (= (and b!1534452 res!1051725) b!1534451))

(assert (= (and b!1534451 res!1051728) b!1534457))

(assert (= (and b!1534457 res!1051722) b!1534458))

(assert (= (and b!1534458 res!1051721) b!1534459))

(assert (= (and b!1534459 res!1051726) b!1534450))

(assert (= (and b!1534450 res!1051720) b!1534456))

(declare-fun m!1416479 () Bool)

(assert (=> b!1534450 m!1416479))

(declare-fun m!1416481 () Bool)

(assert (=> b!1534455 m!1416481))

(assert (=> b!1534455 m!1416481))

(declare-fun m!1416483 () Bool)

(assert (=> b!1534455 m!1416483))

(declare-fun m!1416485 () Bool)

(assert (=> b!1534451 m!1416485))

(declare-fun m!1416487 () Bool)

(assert (=> b!1534452 m!1416487))

(declare-fun m!1416489 () Bool)

(assert (=> b!1534457 m!1416489))

(declare-fun m!1416491 () Bool)

(assert (=> b!1534459 m!1416491))

(declare-fun m!1416493 () Bool)

(assert (=> b!1534459 m!1416493))

(assert (=> b!1534456 m!1416493))

(assert (=> b!1534456 m!1416493))

(declare-fun m!1416495 () Bool)

(assert (=> b!1534456 m!1416495))

(assert (=> b!1534454 m!1416493))

(assert (=> b!1534454 m!1416493))

(declare-fun m!1416497 () Bool)

(assert (=> b!1534454 m!1416497))

(assert (=> b!1534458 m!1416493))

(assert (=> b!1534458 m!1416493))

(declare-fun m!1416499 () Bool)

(assert (=> b!1534458 m!1416499))

(declare-fun m!1416501 () Bool)

(assert (=> start!130812 m!1416501))

(declare-fun m!1416503 () Bool)

(assert (=> start!130812 m!1416503))

(check-sat (not b!1534458) (not start!130812) (not b!1534455) (not b!1534450) (not b!1534452) (not b!1534454) (not b!1534451) (not b!1534456))
(check-sat)
