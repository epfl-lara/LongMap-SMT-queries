; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26724 () Bool)

(assert start!26724)

(declare-fun b!277538 () Bool)

(declare-datatypes ((Unit!8755 0))(
  ( (Unit!8756) )
))
(declare-fun e!177089 () Unit!8755)

(declare-fun lt!137967 () Unit!8755)

(assert (=> b!277538 (= e!177089 lt!137967)))

(declare-datatypes ((array!13821 0))(
  ( (array!13822 (arr!6560 (Array (_ BitVec 32) (_ BitVec 64))) (size!6912 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13821)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13821 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8755)

(assert (=> b!277538 (= lt!137967 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13821 (_ BitVec 32)) Bool)

(assert (=> b!277538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13822 (store (arr!6560 a!3325) i!1267 k!2581) (size!6912 a!3325)) mask!3868)))

(declare-fun b!277539 () Bool)

(declare-fun res!141422 () Bool)

(declare-fun e!177090 () Bool)

(assert (=> b!277539 (=> (not res!141422) (not e!177090))))

(assert (=> b!277539 (= res!141422 (= startIndex!26 i!1267))))

(declare-fun res!141423 () Bool)

(declare-fun e!177092 () Bool)

(assert (=> start!26724 (=> (not res!141423) (not e!177092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26724 (= res!141423 (validMask!0 mask!3868))))

(assert (=> start!26724 e!177092))

(declare-fun array_inv!4523 (array!13821) Bool)

(assert (=> start!26724 (array_inv!4523 a!3325)))

(assert (=> start!26724 true))

(declare-fun b!277540 () Bool)

(declare-fun res!141419 () Bool)

(assert (=> b!277540 (=> (not res!141419) (not e!177090))))

(assert (=> b!277540 (= res!141419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277541 () Bool)

(assert (=> b!277541 (= e!177090 false)))

(declare-fun lt!137968 () Unit!8755)

(assert (=> b!277541 (= lt!137968 e!177089)))

(declare-fun c!45612 () Bool)

(assert (=> b!277541 (= c!45612 (bvslt startIndex!26 (bvsub (size!6912 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277542 () Bool)

(declare-fun Unit!8757 () Unit!8755)

(assert (=> b!277542 (= e!177089 Unit!8757)))

(declare-fun b!277543 () Bool)

(declare-fun res!141417 () Bool)

(assert (=> b!277543 (=> (not res!141417) (not e!177092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277543 (= res!141417 (validKeyInArray!0 k!2581))))

(declare-fun b!277544 () Bool)

(declare-fun res!141416 () Bool)

(assert (=> b!277544 (=> (not res!141416) (not e!177092))))

(assert (=> b!277544 (= res!141416 (and (= (size!6912 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6912 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6912 a!3325))))))

(declare-fun b!277545 () Bool)

(assert (=> b!277545 (= e!177092 e!177090)))

(declare-fun res!141418 () Bool)

(assert (=> b!277545 (=> (not res!141418) (not e!177090))))

(declare-datatypes ((SeekEntryResult!1718 0))(
  ( (MissingZero!1718 (index!9042 (_ BitVec 32))) (Found!1718 (index!9043 (_ BitVec 32))) (Intermediate!1718 (undefined!2530 Bool) (index!9044 (_ BitVec 32)) (x!27291 (_ BitVec 32))) (Undefined!1718) (MissingVacant!1718 (index!9045 (_ BitVec 32))) )
))
(declare-fun lt!137966 () SeekEntryResult!1718)

(assert (=> b!277545 (= res!141418 (or (= lt!137966 (MissingZero!1718 i!1267)) (= lt!137966 (MissingVacant!1718 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13821 (_ BitVec 32)) SeekEntryResult!1718)

(assert (=> b!277545 (= lt!137966 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277546 () Bool)

(declare-fun res!141421 () Bool)

(assert (=> b!277546 (=> (not res!141421) (not e!177092))))

(declare-datatypes ((List!4368 0))(
  ( (Nil!4365) (Cons!4364 (h!5031 (_ BitVec 64)) (t!9450 List!4368)) )
))
(declare-fun arrayNoDuplicates!0 (array!13821 (_ BitVec 32) List!4368) Bool)

(assert (=> b!277546 (= res!141421 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4365))))

(declare-fun b!277547 () Bool)

(declare-fun res!141420 () Bool)

(assert (=> b!277547 (=> (not res!141420) (not e!177092))))

(declare-fun arrayContainsKey!0 (array!13821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277547 (= res!141420 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26724 res!141423) b!277544))

(assert (= (and b!277544 res!141416) b!277543))

(assert (= (and b!277543 res!141417) b!277546))

(assert (= (and b!277546 res!141421) b!277547))

(assert (= (and b!277547 res!141420) b!277545))

(assert (= (and b!277545 res!141418) b!277540))

(assert (= (and b!277540 res!141419) b!277539))

(assert (= (and b!277539 res!141422) b!277541))

(assert (= (and b!277541 c!45612) b!277538))

(assert (= (and b!277541 (not c!45612)) b!277542))

(declare-fun m!292551 () Bool)

(assert (=> b!277540 m!292551))

(declare-fun m!292553 () Bool)

(assert (=> b!277546 m!292553))

(declare-fun m!292555 () Bool)

(assert (=> start!26724 m!292555))

(declare-fun m!292557 () Bool)

(assert (=> start!26724 m!292557))

(declare-fun m!292559 () Bool)

(assert (=> b!277543 m!292559))

(declare-fun m!292561 () Bool)

(assert (=> b!277538 m!292561))

(declare-fun m!292563 () Bool)

(assert (=> b!277538 m!292563))

(declare-fun m!292565 () Bool)

(assert (=> b!277538 m!292565))

(declare-fun m!292567 () Bool)

(assert (=> b!277545 m!292567))

(declare-fun m!292569 () Bool)

(assert (=> b!277547 m!292569))

(push 1)

(assert (not b!277546))

(assert (not start!26724))

(assert (not b!277540))

(assert (not b!277543))

(assert (not b!277545))

(assert (not b!277538))

(assert (not b!277547))

(check-sat)

