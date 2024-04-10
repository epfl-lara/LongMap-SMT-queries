; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131372 () Bool)

(assert start!131372)

(declare-fun b!1540309 () Bool)

(declare-fun res!1057002 () Bool)

(declare-fun e!856680 () Bool)

(assert (=> b!1540309 (=> (not res!1057002) (not e!856680))))

(declare-datatypes ((array!102320 0))(
  ( (array!102321 (arr!49370 (Array (_ BitVec 32) (_ BitVec 64))) (size!49920 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102320)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540309 (= res!1057002 (and (= (size!49920 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49920 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49920 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540310 () Bool)

(declare-fun res!1057005 () Bool)

(assert (=> b!1540310 (=> (not res!1057005) (not e!856680))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540310 (= res!1057005 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49920 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49920 a!2792)) (= (select (arr!49370 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540311 () Bool)

(declare-fun e!856677 () Bool)

(assert (=> b!1540311 (= e!856680 e!856677)))

(declare-fun res!1057003 () Bool)

(assert (=> b!1540311 (=> (not res!1057003) (not e!856677))))

(declare-datatypes ((SeekEntryResult!13496 0))(
  ( (MissingZero!13496 (index!56379 (_ BitVec 32))) (Found!13496 (index!56380 (_ BitVec 32))) (Intermediate!13496 (undefined!14308 Bool) (index!56381 (_ BitVec 32)) (x!138119 (_ BitVec 32))) (Undefined!13496) (MissingVacant!13496 (index!56382 (_ BitVec 32))) )
))
(declare-fun lt!665301 () SeekEntryResult!13496)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102320 (_ BitVec 32)) SeekEntryResult!13496)

(assert (=> b!1540311 (= res!1057003 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49370 a!2792) j!64) a!2792 mask!2480) lt!665301))))

(assert (=> b!1540311 (= lt!665301 (Found!13496 j!64))))

(declare-fun b!1540312 () Bool)

(declare-fun res!1057009 () Bool)

(assert (=> b!1540312 (=> (not res!1057009) (not e!856680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540312 (= res!1057009 (validKeyInArray!0 (select (arr!49370 a!2792) j!64)))))

(declare-fun b!1540313 () Bool)

(declare-fun res!1057004 () Bool)

(assert (=> b!1540313 (=> (not res!1057004) (not e!856680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102320 (_ BitVec 32)) Bool)

(assert (=> b!1540313 (= res!1057004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540314 () Bool)

(declare-fun res!1057007 () Bool)

(assert (=> b!1540314 (=> (not res!1057007) (not e!856677))))

(assert (=> b!1540314 (= res!1057007 (not (= (select (arr!49370 a!2792) index!463) (select (arr!49370 a!2792) j!64))))))

(declare-fun b!1540315 () Bool)

(declare-fun e!856679 () Bool)

(assert (=> b!1540315 (= e!856677 e!856679)))

(declare-fun res!1057008 () Bool)

(assert (=> b!1540315 (=> (not res!1057008) (not e!856679))))

(declare-fun lt!665299 () (_ BitVec 32))

(assert (=> b!1540315 (= res!1057008 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665299 #b00000000000000000000000000000000) (bvslt lt!665299 (size!49920 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540315 (= lt!665299 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540316 () Bool)

(declare-fun e!856678 () Bool)

(assert (=> b!1540316 (= e!856679 e!856678)))

(declare-fun res!1056999 () Bool)

(assert (=> b!1540316 (=> (not res!1056999) (not e!856678))))

(declare-fun lt!665300 () SeekEntryResult!13496)

(assert (=> b!1540316 (= res!1056999 (= lt!665300 lt!665301))))

(assert (=> b!1540316 (= lt!665300 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665299 vacantIndex!5 (select (arr!49370 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540317 () Bool)

(declare-fun res!1057001 () Bool)

(assert (=> b!1540317 (=> (not res!1057001) (not e!856680))))

(assert (=> b!1540317 (= res!1057001 (validKeyInArray!0 (select (arr!49370 a!2792) i!951)))))

(declare-fun b!1540318 () Bool)

(assert (=> b!1540318 (= e!856678 (not true))))

(assert (=> b!1540318 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665299 vacantIndex!5 (select (store (arr!49370 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102321 (store (arr!49370 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49920 a!2792)) mask!2480) lt!665300)))

(declare-datatypes ((Unit!51432 0))(
  ( (Unit!51433) )
))
(declare-fun lt!665302 () Unit!51432)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51432)

(assert (=> b!1540318 (= lt!665302 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665299 vacantIndex!5 mask!2480))))

(declare-fun b!1540319 () Bool)

(declare-fun res!1057000 () Bool)

(assert (=> b!1540319 (=> (not res!1057000) (not e!856680))))

(declare-datatypes ((List!35844 0))(
  ( (Nil!35841) (Cons!35840 (h!37285 (_ BitVec 64)) (t!50538 List!35844)) )
))
(declare-fun arrayNoDuplicates!0 (array!102320 (_ BitVec 32) List!35844) Bool)

(assert (=> b!1540319 (= res!1057000 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35841))))

(declare-fun res!1057006 () Bool)

(assert (=> start!131372 (=> (not res!1057006) (not e!856680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131372 (= res!1057006 (validMask!0 mask!2480))))

(assert (=> start!131372 e!856680))

(assert (=> start!131372 true))

(declare-fun array_inv!38398 (array!102320) Bool)

(assert (=> start!131372 (array_inv!38398 a!2792)))

(assert (= (and start!131372 res!1057006) b!1540309))

(assert (= (and b!1540309 res!1057002) b!1540317))

(assert (= (and b!1540317 res!1057001) b!1540312))

(assert (= (and b!1540312 res!1057009) b!1540313))

(assert (= (and b!1540313 res!1057004) b!1540319))

(assert (= (and b!1540319 res!1057000) b!1540310))

(assert (= (and b!1540310 res!1057005) b!1540311))

(assert (= (and b!1540311 res!1057003) b!1540314))

(assert (= (and b!1540314 res!1057007) b!1540315))

(assert (= (and b!1540315 res!1057008) b!1540316))

(assert (= (and b!1540316 res!1056999) b!1540318))

(declare-fun m!1422417 () Bool)

(assert (=> b!1540316 m!1422417))

(assert (=> b!1540316 m!1422417))

(declare-fun m!1422419 () Bool)

(assert (=> b!1540316 m!1422419))

(assert (=> b!1540312 m!1422417))

(assert (=> b!1540312 m!1422417))

(declare-fun m!1422421 () Bool)

(assert (=> b!1540312 m!1422421))

(declare-fun m!1422423 () Bool)

(assert (=> b!1540317 m!1422423))

(assert (=> b!1540317 m!1422423))

(declare-fun m!1422425 () Bool)

(assert (=> b!1540317 m!1422425))

(declare-fun m!1422427 () Bool)

(assert (=> b!1540310 m!1422427))

(declare-fun m!1422429 () Bool)

(assert (=> b!1540315 m!1422429))

(declare-fun m!1422431 () Bool)

(assert (=> b!1540314 m!1422431))

(assert (=> b!1540314 m!1422417))

(declare-fun m!1422433 () Bool)

(assert (=> b!1540319 m!1422433))

(declare-fun m!1422435 () Bool)

(assert (=> b!1540318 m!1422435))

(declare-fun m!1422437 () Bool)

(assert (=> b!1540318 m!1422437))

(assert (=> b!1540318 m!1422437))

(declare-fun m!1422439 () Bool)

(assert (=> b!1540318 m!1422439))

(declare-fun m!1422441 () Bool)

(assert (=> b!1540318 m!1422441))

(assert (=> b!1540311 m!1422417))

(assert (=> b!1540311 m!1422417))

(declare-fun m!1422443 () Bool)

(assert (=> b!1540311 m!1422443))

(declare-fun m!1422445 () Bool)

(assert (=> b!1540313 m!1422445))

(declare-fun m!1422447 () Bool)

(assert (=> start!131372 m!1422447))

(declare-fun m!1422449 () Bool)

(assert (=> start!131372 m!1422449))

(push 1)

