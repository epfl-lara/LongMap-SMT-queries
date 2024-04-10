; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131380 () Bool)

(assert start!131380)

(declare-fun b!1540441 () Bool)

(declare-fun res!1057134 () Bool)

(declare-fun e!856738 () Bool)

(assert (=> b!1540441 (=> (not res!1057134) (not e!856738))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((array!102328 0))(
  ( (array!102329 (arr!49374 (Array (_ BitVec 32) (_ BitVec 64))) (size!49924 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102328)

(assert (=> b!1540441 (= res!1057134 (not (= (select (arr!49374 a!2792) index!463) (select (arr!49374 a!2792) j!64))))))

(declare-fun b!1540442 () Bool)

(declare-fun res!1057132 () Bool)

(declare-fun e!856737 () Bool)

(assert (=> b!1540442 (=> (not res!1057132) (not e!856737))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540442 (= res!1057132 (validKeyInArray!0 (select (arr!49374 a!2792) i!951)))))

(declare-fun b!1540443 () Bool)

(declare-fun e!856739 () Bool)

(assert (=> b!1540443 (= e!856738 e!856739)))

(declare-fun res!1057133 () Bool)

(assert (=> b!1540443 (=> (not res!1057133) (not e!856739))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665348 () (_ BitVec 32))

(assert (=> b!1540443 (= res!1057133 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665348 #b00000000000000000000000000000000) (bvslt lt!665348 (size!49924 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540443 (= lt!665348 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540444 () Bool)

(declare-fun res!1057141 () Bool)

(assert (=> b!1540444 (=> (not res!1057141) (not e!856737))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1540444 (= res!1057141 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49924 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49924 a!2792)) (= (select (arr!49374 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540445 () Bool)

(declare-fun e!856741 () Bool)

(assert (=> b!1540445 (= e!856739 e!856741)))

(declare-fun res!1057140 () Bool)

(assert (=> b!1540445 (=> (not res!1057140) (not e!856741))))

(declare-datatypes ((SeekEntryResult!13500 0))(
  ( (MissingZero!13500 (index!56395 (_ BitVec 32))) (Found!13500 (index!56396 (_ BitVec 32))) (Intermediate!13500 (undefined!14312 Bool) (index!56397 (_ BitVec 32)) (x!138131 (_ BitVec 32))) (Undefined!13500) (MissingVacant!13500 (index!56398 (_ BitVec 32))) )
))
(declare-fun lt!665349 () SeekEntryResult!13500)

(declare-fun lt!665347 () SeekEntryResult!13500)

(assert (=> b!1540445 (= res!1057140 (= lt!665349 lt!665347))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102328 (_ BitVec 32)) SeekEntryResult!13500)

(assert (=> b!1540445 (= lt!665349 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665348 vacantIndex!5 (select (arr!49374 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540446 () Bool)

(declare-fun res!1057136 () Bool)

(assert (=> b!1540446 (=> (not res!1057136) (not e!856737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102328 (_ BitVec 32)) Bool)

(assert (=> b!1540446 (= res!1057136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1057138 () Bool)

(assert (=> start!131380 (=> (not res!1057138) (not e!856737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131380 (= res!1057138 (validMask!0 mask!2480))))

(assert (=> start!131380 e!856737))

(assert (=> start!131380 true))

(declare-fun array_inv!38402 (array!102328) Bool)

(assert (=> start!131380 (array_inv!38402 a!2792)))

(declare-fun b!1540447 () Bool)

(assert (=> b!1540447 (= e!856741 (not true))))

(assert (=> b!1540447 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665348 vacantIndex!5 (select (store (arr!49374 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102329 (store (arr!49374 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49924 a!2792)) mask!2480) lt!665349)))

(declare-datatypes ((Unit!51440 0))(
  ( (Unit!51441) )
))
(declare-fun lt!665350 () Unit!51440)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51440)

(assert (=> b!1540447 (= lt!665350 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665348 vacantIndex!5 mask!2480))))

(declare-fun b!1540448 () Bool)

(declare-fun res!1057137 () Bool)

(assert (=> b!1540448 (=> (not res!1057137) (not e!856737))))

(assert (=> b!1540448 (= res!1057137 (validKeyInArray!0 (select (arr!49374 a!2792) j!64)))))

(declare-fun b!1540449 () Bool)

(declare-fun res!1057135 () Bool)

(assert (=> b!1540449 (=> (not res!1057135) (not e!856737))))

(declare-datatypes ((List!35848 0))(
  ( (Nil!35845) (Cons!35844 (h!37289 (_ BitVec 64)) (t!50542 List!35848)) )
))
(declare-fun arrayNoDuplicates!0 (array!102328 (_ BitVec 32) List!35848) Bool)

(assert (=> b!1540449 (= res!1057135 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35845))))

(declare-fun b!1540450 () Bool)

(declare-fun res!1057131 () Bool)

(assert (=> b!1540450 (=> (not res!1057131) (not e!856737))))

(assert (=> b!1540450 (= res!1057131 (and (= (size!49924 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49924 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49924 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540451 () Bool)

(assert (=> b!1540451 (= e!856737 e!856738)))

(declare-fun res!1057139 () Bool)

(assert (=> b!1540451 (=> (not res!1057139) (not e!856738))))

(assert (=> b!1540451 (= res!1057139 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49374 a!2792) j!64) a!2792 mask!2480) lt!665347))))

(assert (=> b!1540451 (= lt!665347 (Found!13500 j!64))))

(assert (= (and start!131380 res!1057138) b!1540450))

(assert (= (and b!1540450 res!1057131) b!1540442))

(assert (= (and b!1540442 res!1057132) b!1540448))

(assert (= (and b!1540448 res!1057137) b!1540446))

(assert (= (and b!1540446 res!1057136) b!1540449))

(assert (= (and b!1540449 res!1057135) b!1540444))

(assert (= (and b!1540444 res!1057141) b!1540451))

(assert (= (and b!1540451 res!1057139) b!1540441))

(assert (= (and b!1540441 res!1057134) b!1540443))

(assert (= (and b!1540443 res!1057133) b!1540445))

(assert (= (and b!1540445 res!1057140) b!1540447))

(declare-fun m!1422553 () Bool)

(assert (=> b!1540448 m!1422553))

(assert (=> b!1540448 m!1422553))

(declare-fun m!1422555 () Bool)

(assert (=> b!1540448 m!1422555))

(declare-fun m!1422557 () Bool)

(assert (=> b!1540446 m!1422557))

(declare-fun m!1422559 () Bool)

(assert (=> b!1540442 m!1422559))

(assert (=> b!1540442 m!1422559))

(declare-fun m!1422561 () Bool)

(assert (=> b!1540442 m!1422561))

(declare-fun m!1422563 () Bool)

(assert (=> b!1540447 m!1422563))

(declare-fun m!1422565 () Bool)

(assert (=> b!1540447 m!1422565))

(assert (=> b!1540447 m!1422565))

(declare-fun m!1422567 () Bool)

(assert (=> b!1540447 m!1422567))

(declare-fun m!1422569 () Bool)

(assert (=> b!1540447 m!1422569))

(assert (=> b!1540445 m!1422553))

(assert (=> b!1540445 m!1422553))

(declare-fun m!1422571 () Bool)

(assert (=> b!1540445 m!1422571))

(declare-fun m!1422573 () Bool)

(assert (=> b!1540449 m!1422573))

(declare-fun m!1422575 () Bool)

(assert (=> b!1540444 m!1422575))

(declare-fun m!1422577 () Bool)

(assert (=> b!1540443 m!1422577))

(assert (=> b!1540451 m!1422553))

(assert (=> b!1540451 m!1422553))

(declare-fun m!1422579 () Bool)

(assert (=> b!1540451 m!1422579))

(declare-fun m!1422581 () Bool)

(assert (=> b!1540441 m!1422581))

(assert (=> b!1540441 m!1422553))

(declare-fun m!1422583 () Bool)

(assert (=> start!131380 m!1422583))

(declare-fun m!1422585 () Bool)

(assert (=> start!131380 m!1422585))

(check-sat (not start!131380) (not b!1540445) (not b!1540443) (not b!1540448) (not b!1540446) (not b!1540451) (not b!1540447) (not b!1540442) (not b!1540449))
(check-sat)
