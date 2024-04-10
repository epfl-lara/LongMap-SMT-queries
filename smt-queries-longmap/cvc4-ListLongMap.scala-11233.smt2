; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131034 () Bool)

(assert start!131034)

(declare-fun b!1537495 () Bool)

(declare-fun res!1054582 () Bool)

(declare-fun e!855664 () Bool)

(assert (=> b!1537495 (=> (not res!1054582) (not e!855664))))

(declare-datatypes ((array!102132 0))(
  ( (array!102133 (arr!49282 (Array (_ BitVec 32) (_ BitVec 64))) (size!49832 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102132)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537495 (= res!1054582 (validKeyInArray!0 (select (arr!49282 a!2792) i!951)))))

(declare-fun b!1537496 () Bool)

(declare-fun res!1054586 () Bool)

(assert (=> b!1537496 (=> (not res!1054586) (not e!855664))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102132 (_ BitVec 32)) Bool)

(assert (=> b!1537496 (= res!1054586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537497 () Bool)

(declare-fun res!1054585 () Bool)

(declare-fun e!855665 () Bool)

(assert (=> b!1537497 (=> (not res!1054585) (not e!855665))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537497 (= res!1054585 (not (= (select (arr!49282 a!2792) index!463) (select (arr!49282 a!2792) j!64))))))

(declare-fun b!1537498 () Bool)

(declare-fun e!855667 () Bool)

(assert (=> b!1537498 (= e!855667 (not true))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13414 0))(
  ( (MissingZero!13414 (index!56051 (_ BitVec 32))) (Found!13414 (index!56052 (_ BitVec 32))) (Intermediate!13414 (undefined!14226 Bool) (index!56053 (_ BitVec 32)) (x!137776 (_ BitVec 32))) (Undefined!13414) (MissingVacant!13414 (index!56054 (_ BitVec 32))) )
))
(declare-fun lt!664736 () SeekEntryResult!13414)

(declare-fun lt!664735 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102132 (_ BitVec 32)) SeekEntryResult!13414)

(assert (=> b!1537498 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664735 vacantIndex!5 (select (store (arr!49282 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102133 (store (arr!49282 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49832 a!2792)) mask!2480) lt!664736)))

(declare-datatypes ((Unit!51400 0))(
  ( (Unit!51401) )
))
(declare-fun lt!664738 () Unit!51400)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51400)

(assert (=> b!1537498 (= lt!664738 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664735 vacantIndex!5 mask!2480))))

(declare-fun b!1537499 () Bool)

(declare-fun e!855663 () Bool)

(assert (=> b!1537499 (= e!855663 e!855667)))

(declare-fun res!1054589 () Bool)

(assert (=> b!1537499 (=> (not res!1054589) (not e!855667))))

(declare-fun lt!664737 () SeekEntryResult!13414)

(assert (=> b!1537499 (= res!1054589 (= lt!664736 lt!664737))))

(assert (=> b!1537499 (= lt!664736 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664735 vacantIndex!5 (select (arr!49282 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1054591 () Bool)

(assert (=> start!131034 (=> (not res!1054591) (not e!855664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131034 (= res!1054591 (validMask!0 mask!2480))))

(assert (=> start!131034 e!855664))

(assert (=> start!131034 true))

(declare-fun array_inv!38310 (array!102132) Bool)

(assert (=> start!131034 (array_inv!38310 a!2792)))

(declare-fun b!1537500 () Bool)

(declare-fun res!1054584 () Bool)

(assert (=> b!1537500 (=> (not res!1054584) (not e!855664))))

(declare-datatypes ((List!35756 0))(
  ( (Nil!35753) (Cons!35752 (h!37197 (_ BitVec 64)) (t!50450 List!35756)) )
))
(declare-fun arrayNoDuplicates!0 (array!102132 (_ BitVec 32) List!35756) Bool)

(assert (=> b!1537500 (= res!1054584 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35753))))

(declare-fun b!1537501 () Bool)

(declare-fun res!1054581 () Bool)

(assert (=> b!1537501 (=> (not res!1054581) (not e!855664))))

(assert (=> b!1537501 (= res!1054581 (validKeyInArray!0 (select (arr!49282 a!2792) j!64)))))

(declare-fun b!1537502 () Bool)

(assert (=> b!1537502 (= e!855664 e!855665)))

(declare-fun res!1054590 () Bool)

(assert (=> b!1537502 (=> (not res!1054590) (not e!855665))))

(assert (=> b!1537502 (= res!1054590 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49282 a!2792) j!64) a!2792 mask!2480) lt!664737))))

(assert (=> b!1537502 (= lt!664737 (Found!13414 j!64))))

(declare-fun b!1537503 () Bool)

(declare-fun res!1054587 () Bool)

(assert (=> b!1537503 (=> (not res!1054587) (not e!855664))))

(assert (=> b!1537503 (= res!1054587 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49832 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49832 a!2792)) (= (select (arr!49282 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537504 () Bool)

(declare-fun res!1054583 () Bool)

(assert (=> b!1537504 (=> (not res!1054583) (not e!855664))))

(assert (=> b!1537504 (= res!1054583 (and (= (size!49832 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49832 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49832 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537505 () Bool)

(assert (=> b!1537505 (= e!855665 e!855663)))

(declare-fun res!1054588 () Bool)

(assert (=> b!1537505 (=> (not res!1054588) (not e!855663))))

(assert (=> b!1537505 (= res!1054588 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664735 #b00000000000000000000000000000000) (bvslt lt!664735 (size!49832 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537505 (= lt!664735 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131034 res!1054591) b!1537504))

(assert (= (and b!1537504 res!1054583) b!1537495))

(assert (= (and b!1537495 res!1054582) b!1537501))

(assert (= (and b!1537501 res!1054581) b!1537496))

(assert (= (and b!1537496 res!1054586) b!1537500))

(assert (= (and b!1537500 res!1054584) b!1537503))

(assert (= (and b!1537503 res!1054587) b!1537502))

(assert (= (and b!1537502 res!1054590) b!1537497))

(assert (= (and b!1537497 res!1054585) b!1537505))

(assert (= (and b!1537505 res!1054588) b!1537499))

(assert (= (and b!1537499 res!1054589) b!1537498))

(declare-fun m!1420001 () Bool)

(assert (=> b!1537500 m!1420001))

(declare-fun m!1420003 () Bool)

(assert (=> b!1537495 m!1420003))

(assert (=> b!1537495 m!1420003))

(declare-fun m!1420005 () Bool)

(assert (=> b!1537495 m!1420005))

(declare-fun m!1420007 () Bool)

(assert (=> b!1537501 m!1420007))

(assert (=> b!1537501 m!1420007))

(declare-fun m!1420009 () Bool)

(assert (=> b!1537501 m!1420009))

(declare-fun m!1420011 () Bool)

(assert (=> b!1537497 m!1420011))

(assert (=> b!1537497 m!1420007))

(declare-fun m!1420013 () Bool)

(assert (=> b!1537496 m!1420013))

(declare-fun m!1420015 () Bool)

(assert (=> b!1537503 m!1420015))

(declare-fun m!1420017 () Bool)

(assert (=> b!1537505 m!1420017))

(assert (=> b!1537499 m!1420007))

(assert (=> b!1537499 m!1420007))

(declare-fun m!1420019 () Bool)

(assert (=> b!1537499 m!1420019))

(declare-fun m!1420021 () Bool)

(assert (=> start!131034 m!1420021))

(declare-fun m!1420023 () Bool)

(assert (=> start!131034 m!1420023))

(assert (=> b!1537502 m!1420007))

(assert (=> b!1537502 m!1420007))

(declare-fun m!1420025 () Bool)

(assert (=> b!1537502 m!1420025))

(declare-fun m!1420027 () Bool)

(assert (=> b!1537498 m!1420027))

(declare-fun m!1420029 () Bool)

(assert (=> b!1537498 m!1420029))

(assert (=> b!1537498 m!1420029))

(declare-fun m!1420031 () Bool)

(assert (=> b!1537498 m!1420031))

(declare-fun m!1420033 () Bool)

(assert (=> b!1537498 m!1420033))

(push 1)

(assert (not start!131034))

(assert (not b!1537498))

(assert (not b!1537500))

