; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27278 () Bool)

(assert start!27278)

(declare-fun res!145533 () Bool)

(declare-fun e!179264 () Bool)

(assert (=> start!27278 (=> (not res!145533) (not e!179264))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27278 (= res!145533 (validMask!0 mask!3868))))

(assert (=> start!27278 e!179264))

(declare-datatypes ((array!14085 0))(
  ( (array!14086 (arr!6684 (Array (_ BitVec 32) (_ BitVec 64))) (size!7037 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14085)

(declare-fun array_inv!4656 (array!14085) Bool)

(assert (=> start!27278 (array_inv!4656 a!3325)))

(assert (=> start!27278 true))

(declare-fun b!282405 () Bool)

(declare-fun res!145532 () Bool)

(declare-fun e!179265 () Bool)

(assert (=> b!282405 (=> (not res!145532) (not e!179265))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282405 (= res!145532 (validKeyInArray!0 (select (arr!6684 a!3325) startIndex!26)))))

(declare-fun b!282406 () Bool)

(declare-fun res!145528 () Bool)

(assert (=> b!282406 (=> (not res!145528) (not e!179264))))

(declare-datatypes ((List!4465 0))(
  ( (Nil!4462) (Cons!4461 (h!5131 (_ BitVec 64)) (t!9538 List!4465)) )
))
(declare-fun arrayNoDuplicates!0 (array!14085 (_ BitVec 32) List!4465) Bool)

(assert (=> b!282406 (= res!145528 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4462))))

(declare-fun b!282407 () Bool)

(declare-fun e!179263 () Bool)

(assert (=> b!282407 (= e!179263 e!179265)))

(declare-fun res!145530 () Bool)

(assert (=> b!282407 (=> (not res!145530) (not e!179265))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282407 (= res!145530 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139431 () array!14085)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282407 (= lt!139431 (array!14086 (store (arr!6684 a!3325) i!1267 k0!2581) (size!7037 a!3325)))))

(declare-fun b!282408 () Bool)

(declare-fun res!145526 () Bool)

(assert (=> b!282408 (=> (not res!145526) (not e!179263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14085 (_ BitVec 32)) Bool)

(assert (=> b!282408 (= res!145526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282409 () Bool)

(declare-fun res!145534 () Bool)

(assert (=> b!282409 (=> (not res!145534) (not e!179264))))

(declare-fun arrayContainsKey!0 (array!14085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282409 (= res!145534 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282410 () Bool)

(assert (=> b!282410 (= e!179264 e!179263)))

(declare-fun res!145527 () Bool)

(assert (=> b!282410 (=> (not res!145527) (not e!179263))))

(declare-datatypes ((SeekEntryResult!1841 0))(
  ( (MissingZero!1841 (index!9534 (_ BitVec 32))) (Found!1841 (index!9535 (_ BitVec 32))) (Intermediate!1841 (undefined!2653 Bool) (index!9536 (_ BitVec 32)) (x!27766 (_ BitVec 32))) (Undefined!1841) (MissingVacant!1841 (index!9537 (_ BitVec 32))) )
))
(declare-fun lt!139428 () SeekEntryResult!1841)

(assert (=> b!282410 (= res!145527 (or (= lt!139428 (MissingZero!1841 i!1267)) (= lt!139428 (MissingVacant!1841 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14085 (_ BitVec 32)) SeekEntryResult!1841)

(assert (=> b!282410 (= lt!139428 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282411 () Bool)

(declare-fun res!145531 () Bool)

(assert (=> b!282411 (=> (not res!145531) (not e!179264))))

(assert (=> b!282411 (= res!145531 (and (= (size!7037 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7037 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7037 a!3325))))))

(declare-fun b!282412 () Bool)

(assert (=> b!282412 (= e!179265 (not true))))

(assert (=> b!282412 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8928 0))(
  ( (Unit!8929) )
))
(declare-fun lt!139430 () Unit!8928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8928)

(assert (=> b!282412 (= lt!139430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282412 (= (seekEntryOrOpen!0 (select (arr!6684 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6684 a!3325) i!1267 k0!2581) startIndex!26) lt!139431 mask!3868))))

(declare-fun lt!139427 () Unit!8928)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14085 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8928)

(assert (=> b!282412 (= lt!139427 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282412 (arrayNoDuplicates!0 lt!139431 #b00000000000000000000000000000000 Nil!4462)))

(declare-fun lt!139429 () Unit!8928)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14085 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4465) Unit!8928)

(assert (=> b!282412 (= lt!139429 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4462))))

(declare-fun b!282413 () Bool)

(declare-fun res!145529 () Bool)

(assert (=> b!282413 (=> (not res!145529) (not e!179264))))

(assert (=> b!282413 (= res!145529 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27278 res!145533) b!282411))

(assert (= (and b!282411 res!145531) b!282413))

(assert (= (and b!282413 res!145529) b!282406))

(assert (= (and b!282406 res!145528) b!282409))

(assert (= (and b!282409 res!145534) b!282410))

(assert (= (and b!282410 res!145527) b!282408))

(assert (= (and b!282408 res!145526) b!282407))

(assert (= (and b!282407 res!145530) b!282405))

(assert (= (and b!282405 res!145532) b!282412))

(declare-fun m!296567 () Bool)

(assert (=> b!282412 m!296567))

(declare-fun m!296569 () Bool)

(assert (=> b!282412 m!296569))

(declare-fun m!296571 () Bool)

(assert (=> b!282412 m!296571))

(assert (=> b!282412 m!296569))

(declare-fun m!296573 () Bool)

(assert (=> b!282412 m!296573))

(declare-fun m!296575 () Bool)

(assert (=> b!282412 m!296575))

(declare-fun m!296577 () Bool)

(assert (=> b!282412 m!296577))

(declare-fun m!296579 () Bool)

(assert (=> b!282412 m!296579))

(declare-fun m!296581 () Bool)

(assert (=> b!282412 m!296581))

(assert (=> b!282412 m!296577))

(declare-fun m!296583 () Bool)

(assert (=> b!282412 m!296583))

(declare-fun m!296585 () Bool)

(assert (=> b!282412 m!296585))

(declare-fun m!296587 () Bool)

(assert (=> b!282413 m!296587))

(declare-fun m!296589 () Bool)

(assert (=> b!282408 m!296589))

(declare-fun m!296591 () Bool)

(assert (=> b!282406 m!296591))

(declare-fun m!296593 () Bool)

(assert (=> b!282410 m!296593))

(assert (=> b!282407 m!296571))

(declare-fun m!296595 () Bool)

(assert (=> b!282409 m!296595))

(assert (=> b!282405 m!296577))

(assert (=> b!282405 m!296577))

(declare-fun m!296597 () Bool)

(assert (=> b!282405 m!296597))

(declare-fun m!296599 () Bool)

(assert (=> start!27278 m!296599))

(declare-fun m!296601 () Bool)

(assert (=> start!27278 m!296601))

(check-sat (not b!282405) (not b!282406) (not start!27278) (not b!282413) (not b!282410) (not b!282409) (not b!282408) (not b!282412))
(check-sat)
