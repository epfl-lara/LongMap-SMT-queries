; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26730 () Bool)

(assert start!26730)

(declare-fun b!277628 () Bool)

(declare-fun res!141493 () Bool)

(declare-fun e!177125 () Bool)

(assert (=> b!277628 (=> (not res!141493) (not e!177125))))

(declare-datatypes ((array!13827 0))(
  ( (array!13828 (arr!6563 (Array (_ BitVec 32) (_ BitVec 64))) (size!6915 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13827)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13827 (_ BitVec 32)) Bool)

(assert (=> b!277628 (= res!141493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277629 () Bool)

(declare-datatypes ((Unit!8764 0))(
  ( (Unit!8765) )
))
(declare-fun e!177128 () Unit!8764)

(declare-fun lt!137994 () Unit!8764)

(assert (=> b!277629 (= e!177128 lt!137994)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8764)

(assert (=> b!277629 (= lt!137994 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277629 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13828 (store (arr!6563 a!3325) i!1267 k!2581) (size!6915 a!3325)) mask!3868)))

(declare-fun b!277630 () Bool)

(declare-fun res!141488 () Bool)

(declare-fun e!177127 () Bool)

(assert (=> b!277630 (=> (not res!141488) (not e!177127))))

(declare-datatypes ((List!4371 0))(
  ( (Nil!4368) (Cons!4367 (h!5034 (_ BitVec 64)) (t!9453 List!4371)) )
))
(declare-fun arrayNoDuplicates!0 (array!13827 (_ BitVec 32) List!4371) Bool)

(assert (=> b!277630 (= res!141488 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4368))))

(declare-fun b!277631 () Bool)

(declare-fun Unit!8766 () Unit!8764)

(assert (=> b!277631 (= e!177128 Unit!8766)))

(declare-fun b!277632 () Bool)

(declare-fun res!141492 () Bool)

(assert (=> b!277632 (=> (not res!141492) (not e!177127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277632 (= res!141492 (validKeyInArray!0 k!2581))))

(declare-fun b!277633 () Bool)

(declare-fun res!141491 () Bool)

(assert (=> b!277633 (=> (not res!141491) (not e!177127))))

(assert (=> b!277633 (= res!141491 (and (= (size!6915 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6915 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6915 a!3325))))))

(declare-fun b!277634 () Bool)

(declare-fun res!141495 () Bool)

(assert (=> b!277634 (=> (not res!141495) (not e!177125))))

(assert (=> b!277634 (= res!141495 (= startIndex!26 i!1267))))

(declare-fun res!141489 () Bool)

(assert (=> start!26730 (=> (not res!141489) (not e!177127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26730 (= res!141489 (validMask!0 mask!3868))))

(assert (=> start!26730 e!177127))

(declare-fun array_inv!4526 (array!13827) Bool)

(assert (=> start!26730 (array_inv!4526 a!3325)))

(assert (=> start!26730 true))

(declare-fun b!277635 () Bool)

(assert (=> b!277635 (= e!177125 false)))

(declare-fun lt!137995 () Unit!8764)

(assert (=> b!277635 (= lt!137995 e!177128)))

(declare-fun c!45621 () Bool)

(assert (=> b!277635 (= c!45621 (bvslt startIndex!26 (bvsub (size!6915 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277636 () Bool)

(assert (=> b!277636 (= e!177127 e!177125)))

(declare-fun res!141490 () Bool)

(assert (=> b!277636 (=> (not res!141490) (not e!177125))))

(declare-datatypes ((SeekEntryResult!1721 0))(
  ( (MissingZero!1721 (index!9054 (_ BitVec 32))) (Found!1721 (index!9055 (_ BitVec 32))) (Intermediate!1721 (undefined!2533 Bool) (index!9056 (_ BitVec 32)) (x!27302 (_ BitVec 32))) (Undefined!1721) (MissingVacant!1721 (index!9057 (_ BitVec 32))) )
))
(declare-fun lt!137993 () SeekEntryResult!1721)

(assert (=> b!277636 (= res!141490 (or (= lt!137993 (MissingZero!1721 i!1267)) (= lt!137993 (MissingVacant!1721 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13827 (_ BitVec 32)) SeekEntryResult!1721)

(assert (=> b!277636 (= lt!137993 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277637 () Bool)

(declare-fun res!141494 () Bool)

(assert (=> b!277637 (=> (not res!141494) (not e!177127))))

(declare-fun arrayContainsKey!0 (array!13827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277637 (= res!141494 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26730 res!141489) b!277633))

(assert (= (and b!277633 res!141491) b!277632))

(assert (= (and b!277632 res!141492) b!277630))

(assert (= (and b!277630 res!141488) b!277637))

(assert (= (and b!277637 res!141494) b!277636))

(assert (= (and b!277636 res!141490) b!277628))

(assert (= (and b!277628 res!141493) b!277634))

(assert (= (and b!277634 res!141495) b!277635))

(assert (= (and b!277635 c!45621) b!277629))

(assert (= (and b!277635 (not c!45621)) b!277631))

(declare-fun m!292611 () Bool)

(assert (=> b!277629 m!292611))

(declare-fun m!292613 () Bool)

(assert (=> b!277629 m!292613))

(declare-fun m!292615 () Bool)

(assert (=> b!277629 m!292615))

(declare-fun m!292617 () Bool)

(assert (=> b!277628 m!292617))

(declare-fun m!292619 () Bool)

(assert (=> b!277632 m!292619))

(declare-fun m!292621 () Bool)

(assert (=> b!277630 m!292621))

(declare-fun m!292623 () Bool)

(assert (=> start!26730 m!292623))

(declare-fun m!292625 () Bool)

(assert (=> start!26730 m!292625))

(declare-fun m!292627 () Bool)

(assert (=> b!277636 m!292627))

(declare-fun m!292629 () Bool)

(assert (=> b!277637 m!292629))

(push 1)

