; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131378 () Bool)

(assert start!131378)

(declare-fun b!1540408 () Bool)

(declare-fun res!1057103 () Bool)

(declare-fun e!856724 () Bool)

(assert (=> b!1540408 (=> (not res!1057103) (not e!856724))))

(declare-datatypes ((array!102326 0))(
  ( (array!102327 (arr!49373 (Array (_ BitVec 32) (_ BitVec 64))) (size!49923 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102326)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540408 (= res!1057103 (and (= (size!49923 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49923 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49923 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540409 () Bool)

(declare-fun e!856722 () Bool)

(assert (=> b!1540409 (= e!856722 (not true))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13499 0))(
  ( (MissingZero!13499 (index!56391 (_ BitVec 32))) (Found!13499 (index!56392 (_ BitVec 32))) (Intermediate!13499 (undefined!14311 Bool) (index!56393 (_ BitVec 32)) (x!138130 (_ BitVec 32))) (Undefined!13499) (MissingVacant!13499 (index!56394 (_ BitVec 32))) )
))
(declare-fun lt!665335 () SeekEntryResult!13499)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102326 (_ BitVec 32)) SeekEntryResult!13499)

(assert (=> b!1540409 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665336 vacantIndex!5 (select (store (arr!49373 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102327 (store (arr!49373 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49923 a!2792)) mask!2480) lt!665335)))

(declare-datatypes ((Unit!51438 0))(
  ( (Unit!51439) )
))
(declare-fun lt!665338 () Unit!51438)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51438)

(assert (=> b!1540409 (= lt!665338 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665336 vacantIndex!5 mask!2480))))

(declare-fun b!1540410 () Bool)

(declare-fun e!856725 () Bool)

(assert (=> b!1540410 (= e!856724 e!856725)))

(declare-fun res!1057105 () Bool)

(assert (=> b!1540410 (=> (not res!1057105) (not e!856725))))

(declare-fun lt!665337 () SeekEntryResult!13499)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540410 (= res!1057105 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49373 a!2792) j!64) a!2792 mask!2480) lt!665337))))

(assert (=> b!1540410 (= lt!665337 (Found!13499 j!64))))

(declare-fun b!1540411 () Bool)

(declare-fun res!1057101 () Bool)

(assert (=> b!1540411 (=> (not res!1057101) (not e!856724))))

(assert (=> b!1540411 (= res!1057101 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49923 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49923 a!2792)) (= (select (arr!49373 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540412 () Bool)

(declare-fun e!856726 () Bool)

(assert (=> b!1540412 (= e!856726 e!856722)))

(declare-fun res!1057102 () Bool)

(assert (=> b!1540412 (=> (not res!1057102) (not e!856722))))

(assert (=> b!1540412 (= res!1057102 (= lt!665335 lt!665337))))

(assert (=> b!1540412 (= lt!665335 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665336 vacantIndex!5 (select (arr!49373 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540414 () Bool)

(assert (=> b!1540414 (= e!856725 e!856726)))

(declare-fun res!1057098 () Bool)

(assert (=> b!1540414 (=> (not res!1057098) (not e!856726))))

(assert (=> b!1540414 (= res!1057098 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665336 #b00000000000000000000000000000000) (bvslt lt!665336 (size!49923 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540414 (= lt!665336 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540415 () Bool)

(declare-fun res!1057107 () Bool)

(assert (=> b!1540415 (=> (not res!1057107) (not e!856724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102326 (_ BitVec 32)) Bool)

(assert (=> b!1540415 (= res!1057107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540416 () Bool)

(declare-fun res!1057100 () Bool)

(assert (=> b!1540416 (=> (not res!1057100) (not e!856724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540416 (= res!1057100 (validKeyInArray!0 (select (arr!49373 a!2792) i!951)))))

(declare-fun b!1540417 () Bool)

(declare-fun res!1057108 () Bool)

(assert (=> b!1540417 (=> (not res!1057108) (not e!856725))))

(assert (=> b!1540417 (= res!1057108 (not (= (select (arr!49373 a!2792) index!463) (select (arr!49373 a!2792) j!64))))))

(declare-fun b!1540418 () Bool)

(declare-fun res!1057106 () Bool)

(assert (=> b!1540418 (=> (not res!1057106) (not e!856724))))

(declare-datatypes ((List!35847 0))(
  ( (Nil!35844) (Cons!35843 (h!37288 (_ BitVec 64)) (t!50541 List!35847)) )
))
(declare-fun arrayNoDuplicates!0 (array!102326 (_ BitVec 32) List!35847) Bool)

(assert (=> b!1540418 (= res!1057106 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35844))))

(declare-fun b!1540413 () Bool)

(declare-fun res!1057104 () Bool)

(assert (=> b!1540413 (=> (not res!1057104) (not e!856724))))

(assert (=> b!1540413 (= res!1057104 (validKeyInArray!0 (select (arr!49373 a!2792) j!64)))))

(declare-fun res!1057099 () Bool)

(assert (=> start!131378 (=> (not res!1057099) (not e!856724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131378 (= res!1057099 (validMask!0 mask!2480))))

(assert (=> start!131378 e!856724))

(assert (=> start!131378 true))

(declare-fun array_inv!38401 (array!102326) Bool)

(assert (=> start!131378 (array_inv!38401 a!2792)))

(assert (= (and start!131378 res!1057099) b!1540408))

(assert (= (and b!1540408 res!1057103) b!1540416))

(assert (= (and b!1540416 res!1057100) b!1540413))

(assert (= (and b!1540413 res!1057104) b!1540415))

(assert (= (and b!1540415 res!1057107) b!1540418))

(assert (= (and b!1540418 res!1057106) b!1540411))

(assert (= (and b!1540411 res!1057101) b!1540410))

(assert (= (and b!1540410 res!1057105) b!1540417))

(assert (= (and b!1540417 res!1057108) b!1540414))

(assert (= (and b!1540414 res!1057098) b!1540412))

(assert (= (and b!1540412 res!1057102) b!1540409))

(declare-fun m!1422519 () Bool)

(assert (=> b!1540416 m!1422519))

(assert (=> b!1540416 m!1422519))

(declare-fun m!1422521 () Bool)

(assert (=> b!1540416 m!1422521))

(declare-fun m!1422523 () Bool)

(assert (=> b!1540417 m!1422523))

(declare-fun m!1422525 () Bool)

(assert (=> b!1540417 m!1422525))

(assert (=> b!1540413 m!1422525))

(assert (=> b!1540413 m!1422525))

(declare-fun m!1422527 () Bool)

(assert (=> b!1540413 m!1422527))

(declare-fun m!1422529 () Bool)

(assert (=> b!1540409 m!1422529))

(declare-fun m!1422531 () Bool)

(assert (=> b!1540409 m!1422531))

(assert (=> b!1540409 m!1422531))

(declare-fun m!1422533 () Bool)

(assert (=> b!1540409 m!1422533))

(declare-fun m!1422535 () Bool)

(assert (=> b!1540409 m!1422535))

(assert (=> b!1540410 m!1422525))

(assert (=> b!1540410 m!1422525))

(declare-fun m!1422537 () Bool)

(assert (=> b!1540410 m!1422537))

(declare-fun m!1422539 () Bool)

(assert (=> b!1540411 m!1422539))

(declare-fun m!1422541 () Bool)

(assert (=> b!1540418 m!1422541))

(declare-fun m!1422543 () Bool)

(assert (=> start!131378 m!1422543))

(declare-fun m!1422545 () Bool)

(assert (=> start!131378 m!1422545))

(declare-fun m!1422547 () Bool)

(assert (=> b!1540415 m!1422547))

(assert (=> b!1540412 m!1422525))

(assert (=> b!1540412 m!1422525))

(declare-fun m!1422549 () Bool)

(assert (=> b!1540412 m!1422549))

(declare-fun m!1422551 () Bool)

(assert (=> b!1540414 m!1422551))

(push 1)

