; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27188 () Bool)

(assert start!27188)

(declare-fun b!281364 () Bool)

(declare-fun res!144439 () Bool)

(declare-fun e!178849 () Bool)

(assert (=> b!281364 (=> (not res!144439) (not e!178849))))

(declare-datatypes ((array!14006 0))(
  ( (array!14007 (arr!6645 (Array (_ BitVec 32) (_ BitVec 64))) (size!6997 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14006)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281364 (= res!144439 (validKeyInArray!0 (select (arr!6645 a!3325) startIndex!26)))))

(declare-fun b!281365 () Bool)

(declare-fun res!144441 () Bool)

(assert (=> b!281365 (=> (not res!144441) (not e!178849))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14006 (_ BitVec 32)) Bool)

(assert (=> b!281365 (= res!144441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281366 () Bool)

(declare-fun res!144435 () Bool)

(assert (=> b!281366 (=> (not res!144435) (not e!178849))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281366 (= res!144435 (not (= startIndex!26 i!1267)))))

(declare-fun res!144440 () Bool)

(declare-fun e!178850 () Bool)

(assert (=> start!27188 (=> (not res!144440) (not e!178850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27188 (= res!144440 (validMask!0 mask!3868))))

(assert (=> start!27188 e!178850))

(declare-fun array_inv!4608 (array!14006) Bool)

(assert (=> start!27188 (array_inv!4608 a!3325)))

(assert (=> start!27188 true))

(declare-fun b!281367 () Bool)

(declare-fun res!144437 () Bool)

(assert (=> b!281367 (=> (not res!144437) (not e!178850))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!281367 (= res!144437 (validKeyInArray!0 k0!2581))))

(declare-fun b!281368 () Bool)

(assert (=> b!281368 (= e!178850 e!178849)))

(declare-fun res!144438 () Bool)

(assert (=> b!281368 (=> (not res!144438) (not e!178849))))

(declare-datatypes ((SeekEntryResult!1803 0))(
  ( (MissingZero!1803 (index!9382 (_ BitVec 32))) (Found!1803 (index!9383 (_ BitVec 32))) (Intermediate!1803 (undefined!2615 Bool) (index!9384 (_ BitVec 32)) (x!27609 (_ BitVec 32))) (Undefined!1803) (MissingVacant!1803 (index!9385 (_ BitVec 32))) )
))
(declare-fun lt!139033 () SeekEntryResult!1803)

(assert (=> b!281368 (= res!144438 (or (= lt!139033 (MissingZero!1803 i!1267)) (= lt!139033 (MissingVacant!1803 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14006 (_ BitVec 32)) SeekEntryResult!1803)

(assert (=> b!281368 (= lt!139033 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281369 () Bool)

(declare-fun res!144434 () Bool)

(assert (=> b!281369 (=> (not res!144434) (not e!178850))))

(declare-fun arrayContainsKey!0 (array!14006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281369 (= res!144434 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281370 () Bool)

(declare-fun res!144436 () Bool)

(assert (=> b!281370 (=> (not res!144436) (not e!178850))))

(assert (=> b!281370 (= res!144436 (and (= (size!6997 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6997 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6997 a!3325))))))

(declare-fun b!281371 () Bool)

(declare-fun res!144433 () Bool)

(assert (=> b!281371 (=> (not res!144433) (not e!178850))))

(declare-datatypes ((List!4453 0))(
  ( (Nil!4450) (Cons!4449 (h!5119 (_ BitVec 64)) (t!9535 List!4453)) )
))
(declare-fun arrayNoDuplicates!0 (array!14006 (_ BitVec 32) List!4453) Bool)

(assert (=> b!281371 (= res!144433 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4450))))

(declare-fun b!281372 () Bool)

(assert (=> b!281372 (= e!178849 (not true))))

(assert (=> b!281372 (arrayNoDuplicates!0 (array!14007 (store (arr!6645 a!3325) i!1267 k0!2581) (size!6997 a!3325)) #b00000000000000000000000000000000 Nil!4450)))

(declare-datatypes ((Unit!8890 0))(
  ( (Unit!8891) )
))
(declare-fun lt!139032 () Unit!8890)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14006 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4453) Unit!8890)

(assert (=> b!281372 (= lt!139032 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4450))))

(assert (= (and start!27188 res!144440) b!281370))

(assert (= (and b!281370 res!144436) b!281367))

(assert (= (and b!281367 res!144437) b!281371))

(assert (= (and b!281371 res!144433) b!281369))

(assert (= (and b!281369 res!144434) b!281368))

(assert (= (and b!281368 res!144438) b!281365))

(assert (= (and b!281365 res!144441) b!281366))

(assert (= (and b!281366 res!144435) b!281364))

(assert (= (and b!281364 res!144439) b!281372))

(declare-fun m!295695 () Bool)

(assert (=> b!281368 m!295695))

(declare-fun m!295697 () Bool)

(assert (=> b!281364 m!295697))

(assert (=> b!281364 m!295697))

(declare-fun m!295699 () Bool)

(assert (=> b!281364 m!295699))

(declare-fun m!295701 () Bool)

(assert (=> start!27188 m!295701))

(declare-fun m!295703 () Bool)

(assert (=> start!27188 m!295703))

(declare-fun m!295705 () Bool)

(assert (=> b!281372 m!295705))

(declare-fun m!295707 () Bool)

(assert (=> b!281372 m!295707))

(declare-fun m!295709 () Bool)

(assert (=> b!281372 m!295709))

(declare-fun m!295711 () Bool)

(assert (=> b!281371 m!295711))

(declare-fun m!295713 () Bool)

(assert (=> b!281365 m!295713))

(declare-fun m!295715 () Bool)

(assert (=> b!281369 m!295715))

(declare-fun m!295717 () Bool)

(assert (=> b!281367 m!295717))

(check-sat (not b!281367) (not b!281368) (not b!281369) (not b!281371) (not b!281365) (not start!27188) (not b!281372) (not b!281364))
(check-sat)
