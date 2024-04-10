; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131032 () Bool)

(assert start!131032)

(declare-fun b!1537462 () Bool)

(declare-fun res!1054553 () Bool)

(declare-fun e!855650 () Bool)

(assert (=> b!1537462 (=> (not res!1054553) (not e!855650))))

(declare-datatypes ((array!102130 0))(
  ( (array!102131 (arr!49281 (Array (_ BitVec 32) (_ BitVec 64))) (size!49831 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102130)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102130 (_ BitVec 32)) Bool)

(assert (=> b!1537462 (= res!1054553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537463 () Bool)

(declare-fun res!1054550 () Bool)

(assert (=> b!1537463 (=> (not res!1054550) (not e!855650))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537463 (= res!1054550 (and (= (size!49831 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49831 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49831 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537465 () Bool)

(declare-fun res!1054552 () Bool)

(declare-fun e!855648 () Bool)

(assert (=> b!1537465 (=> (not res!1054552) (not e!855648))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537465 (= res!1054552 (not (= (select (arr!49281 a!2792) index!463) (select (arr!49281 a!2792) j!64))))))

(declare-fun b!1537466 () Bool)

(declare-fun res!1054548 () Bool)

(assert (=> b!1537466 (=> (not res!1054548) (not e!855650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537466 (= res!1054548 (validKeyInArray!0 (select (arr!49281 a!2792) j!64)))))

(declare-fun b!1537467 () Bool)

(declare-fun e!855652 () Bool)

(declare-fun e!855651 () Bool)

(assert (=> b!1537467 (= e!855652 e!855651)))

(declare-fun res!1054555 () Bool)

(assert (=> b!1537467 (=> (not res!1054555) (not e!855651))))

(declare-datatypes ((SeekEntryResult!13413 0))(
  ( (MissingZero!13413 (index!56047 (_ BitVec 32))) (Found!13413 (index!56048 (_ BitVec 32))) (Intermediate!13413 (undefined!14225 Bool) (index!56049 (_ BitVec 32)) (x!137775 (_ BitVec 32))) (Undefined!13413) (MissingVacant!13413 (index!56050 (_ BitVec 32))) )
))
(declare-fun lt!664724 () SeekEntryResult!13413)

(declare-fun lt!664725 () SeekEntryResult!13413)

(assert (=> b!1537467 (= res!1054555 (= lt!664724 lt!664725))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664723 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102130 (_ BitVec 32)) SeekEntryResult!13413)

(assert (=> b!1537467 (= lt!664724 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664723 vacantIndex!5 (select (arr!49281 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537468 () Bool)

(declare-fun res!1054557 () Bool)

(assert (=> b!1537468 (=> (not res!1054557) (not e!855650))))

(declare-datatypes ((List!35755 0))(
  ( (Nil!35752) (Cons!35751 (h!37196 (_ BitVec 64)) (t!50449 List!35755)) )
))
(declare-fun arrayNoDuplicates!0 (array!102130 (_ BitVec 32) List!35755) Bool)

(assert (=> b!1537468 (= res!1054557 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35752))))

(declare-fun b!1537469 () Bool)

(assert (=> b!1537469 (= e!855651 (not true))))

(assert (=> b!1537469 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664723 vacantIndex!5 (select (store (arr!49281 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102131 (store (arr!49281 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49831 a!2792)) mask!2480) lt!664724)))

(declare-datatypes ((Unit!51398 0))(
  ( (Unit!51399) )
))
(declare-fun lt!664726 () Unit!51398)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51398)

(assert (=> b!1537469 (= lt!664726 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664723 vacantIndex!5 mask!2480))))

(declare-fun b!1537470 () Bool)

(declare-fun res!1054551 () Bool)

(assert (=> b!1537470 (=> (not res!1054551) (not e!855650))))

(assert (=> b!1537470 (= res!1054551 (validKeyInArray!0 (select (arr!49281 a!2792) i!951)))))

(declare-fun b!1537471 () Bool)

(assert (=> b!1537471 (= e!855650 e!855648)))

(declare-fun res!1054554 () Bool)

(assert (=> b!1537471 (=> (not res!1054554) (not e!855648))))

(assert (=> b!1537471 (= res!1054554 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49281 a!2792) j!64) a!2792 mask!2480) lt!664725))))

(assert (=> b!1537471 (= lt!664725 (Found!13413 j!64))))

(declare-fun b!1537472 () Bool)

(declare-fun res!1054549 () Bool)

(assert (=> b!1537472 (=> (not res!1054549) (not e!855650))))

(assert (=> b!1537472 (= res!1054549 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49831 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49831 a!2792)) (= (select (arr!49281 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537464 () Bool)

(assert (=> b!1537464 (= e!855648 e!855652)))

(declare-fun res!1054558 () Bool)

(assert (=> b!1537464 (=> (not res!1054558) (not e!855652))))

(assert (=> b!1537464 (= res!1054558 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664723 #b00000000000000000000000000000000) (bvslt lt!664723 (size!49831 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537464 (= lt!664723 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1054556 () Bool)

(assert (=> start!131032 (=> (not res!1054556) (not e!855650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131032 (= res!1054556 (validMask!0 mask!2480))))

(assert (=> start!131032 e!855650))

(assert (=> start!131032 true))

(declare-fun array_inv!38309 (array!102130) Bool)

(assert (=> start!131032 (array_inv!38309 a!2792)))

(assert (= (and start!131032 res!1054556) b!1537463))

(assert (= (and b!1537463 res!1054550) b!1537470))

(assert (= (and b!1537470 res!1054551) b!1537466))

(assert (= (and b!1537466 res!1054548) b!1537462))

(assert (= (and b!1537462 res!1054553) b!1537468))

(assert (= (and b!1537468 res!1054557) b!1537472))

(assert (= (and b!1537472 res!1054549) b!1537471))

(assert (= (and b!1537471 res!1054554) b!1537465))

(assert (= (and b!1537465 res!1054552) b!1537464))

(assert (= (and b!1537464 res!1054558) b!1537467))

(assert (= (and b!1537467 res!1054555) b!1537469))

(declare-fun m!1419967 () Bool)

(assert (=> start!131032 m!1419967))

(declare-fun m!1419969 () Bool)

(assert (=> start!131032 m!1419969))

(declare-fun m!1419971 () Bool)

(assert (=> b!1537466 m!1419971))

(assert (=> b!1537466 m!1419971))

(declare-fun m!1419973 () Bool)

(assert (=> b!1537466 m!1419973))

(assert (=> b!1537471 m!1419971))

(assert (=> b!1537471 m!1419971))

(declare-fun m!1419975 () Bool)

(assert (=> b!1537471 m!1419975))

(declare-fun m!1419977 () Bool)

(assert (=> b!1537468 m!1419977))

(declare-fun m!1419979 () Bool)

(assert (=> b!1537465 m!1419979))

(assert (=> b!1537465 m!1419971))

(declare-fun m!1419981 () Bool)

(assert (=> b!1537462 m!1419981))

(declare-fun m!1419983 () Bool)

(assert (=> b!1537464 m!1419983))

(declare-fun m!1419985 () Bool)

(assert (=> b!1537472 m!1419985))

(assert (=> b!1537467 m!1419971))

(assert (=> b!1537467 m!1419971))

(declare-fun m!1419987 () Bool)

(assert (=> b!1537467 m!1419987))

(declare-fun m!1419989 () Bool)

(assert (=> b!1537469 m!1419989))

(declare-fun m!1419991 () Bool)

(assert (=> b!1537469 m!1419991))

(assert (=> b!1537469 m!1419991))

(declare-fun m!1419993 () Bool)

(assert (=> b!1537469 m!1419993))

(declare-fun m!1419995 () Bool)

(assert (=> b!1537469 m!1419995))

(declare-fun m!1419997 () Bool)

(assert (=> b!1537470 m!1419997))

(assert (=> b!1537470 m!1419997))

(declare-fun m!1419999 () Bool)

(assert (=> b!1537470 m!1419999))

(check-sat (not start!131032) (not b!1537469) (not b!1537464) (not b!1537466) (not b!1537470) (not b!1537467) (not b!1537468) (not b!1537471) (not b!1537462))
(check-sat)
