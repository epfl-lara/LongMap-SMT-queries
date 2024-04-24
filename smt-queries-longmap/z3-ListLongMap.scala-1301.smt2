; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26364 () Bool)

(assert start!26364)

(declare-fun b!273380 () Bool)

(declare-fun res!137351 () Bool)

(declare-fun e!175233 () Bool)

(assert (=> b!273380 (=> (not res!137351) (not e!175233))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13460 0))(
  ( (array!13461 (arr!6379 (Array (_ BitVec 32) (_ BitVec 64))) (size!6731 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13460)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273380 (= res!137351 (and (= (size!6731 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6731 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6731 a!3325))))))

(declare-fun b!273381 () Bool)

(declare-fun e!175235 () Bool)

(assert (=> b!273381 (= e!175235 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13460 (_ BitVec 32)) Bool)

(assert (=> b!273381 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8543 0))(
  ( (Unit!8544) )
))
(declare-fun lt!136384 () Unit!8543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8543)

(assert (=> b!273381 (= lt!136384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136386 () array!13460)

(declare-datatypes ((SeekEntryResult!1502 0))(
  ( (MissingZero!1502 (index!8178 (_ BitVec 32))) (Found!1502 (index!8179 (_ BitVec 32))) (Intermediate!1502 (undefined!2314 Bool) (index!8180 (_ BitVec 32)) (x!26595 (_ BitVec 32))) (Undefined!1502) (MissingVacant!1502 (index!8181 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13460 (_ BitVec 32)) SeekEntryResult!1502)

(assert (=> b!273381 (= (seekEntryOrOpen!0 (select (arr!6379 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6379 a!3325) i!1267 k0!2581) startIndex!26) lt!136386 mask!3868))))

(declare-fun lt!136385 () Unit!8543)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8543)

(assert (=> b!273381 (= lt!136385 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4100 0))(
  ( (Nil!4097) (Cons!4096 (h!4763 (_ BitVec 64)) (t!9174 List!4100)) )
))
(declare-fun arrayNoDuplicates!0 (array!13460 (_ BitVec 32) List!4100) Bool)

(assert (=> b!273381 (arrayNoDuplicates!0 lt!136386 #b00000000000000000000000000000000 Nil!4097)))

(declare-fun lt!136383 () Unit!8543)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4100) Unit!8543)

(assert (=> b!273381 (= lt!136383 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4097))))

(declare-fun b!273382 () Bool)

(declare-fun res!137346 () Bool)

(assert (=> b!273382 (=> (not res!137346) (not e!175233))))

(declare-fun arrayContainsKey!0 (array!13460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273382 (= res!137346 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273383 () Bool)

(declare-fun res!137347 () Bool)

(assert (=> b!273383 (=> (not res!137347) (not e!175235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273383 (= res!137347 (validKeyInArray!0 (select (arr!6379 a!3325) startIndex!26)))))

(declare-fun b!273384 () Bool)

(declare-fun res!137348 () Bool)

(declare-fun e!175234 () Bool)

(assert (=> b!273384 (=> (not res!137348) (not e!175234))))

(assert (=> b!273384 (= res!137348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137349 () Bool)

(assert (=> start!26364 (=> (not res!137349) (not e!175233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26364 (= res!137349 (validMask!0 mask!3868))))

(assert (=> start!26364 e!175233))

(declare-fun array_inv!4329 (array!13460) Bool)

(assert (=> start!26364 (array_inv!4329 a!3325)))

(assert (=> start!26364 true))

(declare-fun b!273385 () Bool)

(declare-fun res!137344 () Bool)

(assert (=> b!273385 (=> (not res!137344) (not e!175233))))

(assert (=> b!273385 (= res!137344 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4097))))

(declare-fun b!273386 () Bool)

(declare-fun res!137350 () Bool)

(assert (=> b!273386 (=> (not res!137350) (not e!175233))))

(assert (=> b!273386 (= res!137350 (validKeyInArray!0 k0!2581))))

(declare-fun b!273387 () Bool)

(assert (=> b!273387 (= e!175234 e!175235)))

(declare-fun res!137352 () Bool)

(assert (=> b!273387 (=> (not res!137352) (not e!175235))))

(assert (=> b!273387 (= res!137352 (not (= startIndex!26 i!1267)))))

(assert (=> b!273387 (= lt!136386 (array!13461 (store (arr!6379 a!3325) i!1267 k0!2581) (size!6731 a!3325)))))

(declare-fun b!273388 () Bool)

(assert (=> b!273388 (= e!175233 e!175234)))

(declare-fun res!137345 () Bool)

(assert (=> b!273388 (=> (not res!137345) (not e!175234))))

(declare-fun lt!136382 () SeekEntryResult!1502)

(assert (=> b!273388 (= res!137345 (or (= lt!136382 (MissingZero!1502 i!1267)) (= lt!136382 (MissingVacant!1502 i!1267))))))

(assert (=> b!273388 (= lt!136382 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26364 res!137349) b!273380))

(assert (= (and b!273380 res!137351) b!273386))

(assert (= (and b!273386 res!137350) b!273385))

(assert (= (and b!273385 res!137344) b!273382))

(assert (= (and b!273382 res!137346) b!273388))

(assert (= (and b!273388 res!137345) b!273384))

(assert (= (and b!273384 res!137348) b!273387))

(assert (= (and b!273387 res!137352) b!273383))

(assert (= (and b!273383 res!137347) b!273381))

(declare-fun m!288695 () Bool)

(assert (=> b!273385 m!288695))

(declare-fun m!288697 () Bool)

(assert (=> b!273384 m!288697))

(declare-fun m!288699 () Bool)

(assert (=> b!273383 m!288699))

(assert (=> b!273383 m!288699))

(declare-fun m!288701 () Bool)

(assert (=> b!273383 m!288701))

(declare-fun m!288703 () Bool)

(assert (=> b!273381 m!288703))

(declare-fun m!288705 () Bool)

(assert (=> b!273381 m!288705))

(declare-fun m!288707 () Bool)

(assert (=> b!273381 m!288707))

(declare-fun m!288709 () Bool)

(assert (=> b!273381 m!288709))

(declare-fun m!288711 () Bool)

(assert (=> b!273381 m!288711))

(assert (=> b!273381 m!288699))

(declare-fun m!288713 () Bool)

(assert (=> b!273381 m!288713))

(assert (=> b!273381 m!288707))

(declare-fun m!288715 () Bool)

(assert (=> b!273381 m!288715))

(declare-fun m!288717 () Bool)

(assert (=> b!273381 m!288717))

(assert (=> b!273381 m!288699))

(declare-fun m!288719 () Bool)

(assert (=> b!273381 m!288719))

(declare-fun m!288721 () Bool)

(assert (=> b!273388 m!288721))

(declare-fun m!288723 () Bool)

(assert (=> start!26364 m!288723))

(declare-fun m!288725 () Bool)

(assert (=> start!26364 m!288725))

(declare-fun m!288727 () Bool)

(assert (=> b!273386 m!288727))

(declare-fun m!288729 () Bool)

(assert (=> b!273382 m!288729))

(assert (=> b!273387 m!288709))

(check-sat (not b!273383) (not b!273386) (not start!26364) (not b!273382) (not b!273388) (not b!273381) (not b!273384) (not b!273385))
(check-sat)
