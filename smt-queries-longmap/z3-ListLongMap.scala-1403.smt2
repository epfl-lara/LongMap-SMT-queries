; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27270 () Bool)

(assert start!27270)

(declare-fun b!282518 () Bool)

(declare-fun e!179354 () Bool)

(declare-fun e!179351 () Bool)

(assert (=> b!282518 (= e!179354 e!179351)))

(declare-fun res!145569 () Bool)

(assert (=> b!282518 (=> (not res!145569) (not e!179351))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282518 (= res!145569 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14087 0))(
  ( (array!14088 (arr!6685 (Array (_ BitVec 32) (_ BitVec 64))) (size!7037 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14087)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139622 () array!14087)

(assert (=> b!282518 (= lt!139622 (array!14088 (store (arr!6685 a!3325) i!1267 k0!2581) (size!7037 a!3325)))))

(declare-fun b!282519 () Bool)

(declare-fun e!179352 () Bool)

(assert (=> b!282519 (= e!179352 e!179354)))

(declare-fun res!145567 () Bool)

(assert (=> b!282519 (=> (not res!145567) (not e!179354))))

(declare-datatypes ((SeekEntryResult!1808 0))(
  ( (MissingZero!1808 (index!9402 (_ BitVec 32))) (Found!1808 (index!9403 (_ BitVec 32))) (Intermediate!1808 (undefined!2620 Bool) (index!9404 (_ BitVec 32)) (x!27726 (_ BitVec 32))) (Undefined!1808) (MissingVacant!1808 (index!9405 (_ BitVec 32))) )
))
(declare-fun lt!139626 () SeekEntryResult!1808)

(assert (=> b!282519 (= res!145567 (or (= lt!139626 (MissingZero!1808 i!1267)) (= lt!139626 (MissingVacant!1808 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14087 (_ BitVec 32)) SeekEntryResult!1808)

(assert (=> b!282519 (= lt!139626 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282520 () Bool)

(declare-fun res!145566 () Bool)

(assert (=> b!282520 (=> (not res!145566) (not e!179354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14087 (_ BitVec 32)) Bool)

(assert (=> b!282520 (= res!145566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282521 () Bool)

(declare-fun res!145563 () Bool)

(assert (=> b!282521 (=> (not res!145563) (not e!179351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282521 (= res!145563 (validKeyInArray!0 (select (arr!6685 a!3325) startIndex!26)))))

(declare-fun b!282522 () Bool)

(declare-fun res!145565 () Bool)

(assert (=> b!282522 (=> (not res!145565) (not e!179352))))

(declare-datatypes ((List!4406 0))(
  ( (Nil!4403) (Cons!4402 (h!5072 (_ BitVec 64)) (t!9480 List!4406)) )
))
(declare-fun arrayNoDuplicates!0 (array!14087 (_ BitVec 32) List!4406) Bool)

(assert (=> b!282522 (= res!145565 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4403))))

(declare-fun res!145568 () Bool)

(assert (=> start!27270 (=> (not res!145568) (not e!179352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27270 (= res!145568 (validMask!0 mask!3868))))

(assert (=> start!27270 e!179352))

(declare-fun array_inv!4635 (array!14087) Bool)

(assert (=> start!27270 (array_inv!4635 a!3325)))

(assert (=> start!27270 true))

(declare-fun b!282523 () Bool)

(declare-fun res!145562 () Bool)

(assert (=> b!282523 (=> (not res!145562) (not e!179352))))

(assert (=> b!282523 (= res!145562 (validKeyInArray!0 k0!2581))))

(declare-fun b!282524 () Bool)

(declare-fun res!145561 () Bool)

(assert (=> b!282524 (=> (not res!145561) (not e!179352))))

(assert (=> b!282524 (= res!145561 (and (= (size!7037 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7037 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7037 a!3325))))))

(declare-fun b!282525 () Bool)

(declare-fun res!145564 () Bool)

(assert (=> b!282525 (=> (not res!145564) (not e!179352))))

(declare-fun arrayContainsKey!0 (array!14087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282525 (= res!145564 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282526 () Bool)

(assert (=> b!282526 (= e!179351 (not true))))

(assert (=> b!282526 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8946 0))(
  ( (Unit!8947) )
))
(declare-fun lt!139625 () Unit!8946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282526 (= lt!139625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282526 (= (seekEntryOrOpen!0 (select (arr!6685 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6685 a!3325) i!1267 k0!2581) startIndex!26) lt!139622 mask!3868))))

(declare-fun lt!139624 () Unit!8946)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14087 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282526 (= lt!139624 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282526 (arrayNoDuplicates!0 lt!139622 #b00000000000000000000000000000000 Nil!4403)))

(declare-fun lt!139623 () Unit!8946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14087 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4406) Unit!8946)

(assert (=> b!282526 (= lt!139623 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4403))))

(assert (= (and start!27270 res!145568) b!282524))

(assert (= (and b!282524 res!145561) b!282523))

(assert (= (and b!282523 res!145562) b!282522))

(assert (= (and b!282522 res!145565) b!282525))

(assert (= (and b!282525 res!145564) b!282519))

(assert (= (and b!282519 res!145567) b!282520))

(assert (= (and b!282520 res!145566) b!282518))

(assert (= (and b!282518 res!145569) b!282521))

(assert (= (and b!282521 res!145563) b!282526))

(declare-fun m!297257 () Bool)

(assert (=> b!282526 m!297257))

(declare-fun m!297259 () Bool)

(assert (=> b!282526 m!297259))

(declare-fun m!297261 () Bool)

(assert (=> b!282526 m!297261))

(assert (=> b!282526 m!297261))

(declare-fun m!297263 () Bool)

(assert (=> b!282526 m!297263))

(declare-fun m!297265 () Bool)

(assert (=> b!282526 m!297265))

(declare-fun m!297267 () Bool)

(assert (=> b!282526 m!297267))

(declare-fun m!297269 () Bool)

(assert (=> b!282526 m!297269))

(declare-fun m!297271 () Bool)

(assert (=> b!282526 m!297271))

(declare-fun m!297273 () Bool)

(assert (=> b!282526 m!297273))

(assert (=> b!282526 m!297269))

(declare-fun m!297275 () Bool)

(assert (=> b!282526 m!297275))

(assert (=> b!282518 m!297265))

(assert (=> b!282521 m!297269))

(assert (=> b!282521 m!297269))

(declare-fun m!297277 () Bool)

(assert (=> b!282521 m!297277))

(declare-fun m!297279 () Bool)

(assert (=> b!282520 m!297279))

(declare-fun m!297281 () Bool)

(assert (=> b!282522 m!297281))

(declare-fun m!297283 () Bool)

(assert (=> b!282525 m!297283))

(declare-fun m!297285 () Bool)

(assert (=> b!282523 m!297285))

(declare-fun m!297287 () Bool)

(assert (=> start!27270 m!297287))

(declare-fun m!297289 () Bool)

(assert (=> start!27270 m!297289))

(declare-fun m!297291 () Bool)

(assert (=> b!282519 m!297291))

(check-sat (not b!282522) (not b!282520) (not b!282523) (not b!282526) (not b!282521) (not b!282519) (not start!27270) (not b!282525))
(check-sat)
