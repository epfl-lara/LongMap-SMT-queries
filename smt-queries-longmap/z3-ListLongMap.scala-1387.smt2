; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27176 () Bool)

(assert start!27176)

(declare-fun b!281202 () Bool)

(declare-fun res!144271 () Bool)

(declare-fun e!178796 () Bool)

(assert (=> b!281202 (=> (not res!144271) (not e!178796))))

(declare-datatypes ((array!13994 0))(
  ( (array!13995 (arr!6639 (Array (_ BitVec 32) (_ BitVec 64))) (size!6991 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13994)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13994 (_ BitVec 32)) Bool)

(assert (=> b!281202 (= res!144271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281203 () Bool)

(assert (=> b!281203 (= e!178796 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4447 0))(
  ( (Nil!4444) (Cons!4443 (h!5113 (_ BitVec 64)) (t!9529 List!4447)) )
))
(declare-fun arrayNoDuplicates!0 (array!13994 (_ BitVec 32) List!4447) Bool)

(assert (=> b!281203 (arrayNoDuplicates!0 (array!13995 (store (arr!6639 a!3325) i!1267 k0!2581) (size!6991 a!3325)) #b00000000000000000000000000000000 Nil!4444)))

(declare-datatypes ((Unit!8878 0))(
  ( (Unit!8879) )
))
(declare-fun lt!138996 () Unit!8878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13994 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4447) Unit!8878)

(assert (=> b!281203 (= lt!138996 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4444))))

(declare-fun b!281204 () Bool)

(declare-fun res!144279 () Bool)

(declare-fun e!178794 () Bool)

(assert (=> b!281204 (=> (not res!144279) (not e!178794))))

(declare-fun arrayContainsKey!0 (array!13994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281204 (= res!144279 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281205 () Bool)

(declare-fun res!144274 () Bool)

(assert (=> b!281205 (=> (not res!144274) (not e!178794))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281205 (= res!144274 (and (= (size!6991 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6991 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6991 a!3325))))))

(declare-fun b!281206 () Bool)

(declare-fun res!144275 () Bool)

(assert (=> b!281206 (=> (not res!144275) (not e!178794))))

(assert (=> b!281206 (= res!144275 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4444))))

(declare-fun res!144273 () Bool)

(assert (=> start!27176 (=> (not res!144273) (not e!178794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27176 (= res!144273 (validMask!0 mask!3868))))

(assert (=> start!27176 e!178794))

(declare-fun array_inv!4602 (array!13994) Bool)

(assert (=> start!27176 (array_inv!4602 a!3325)))

(assert (=> start!27176 true))

(declare-fun b!281207 () Bool)

(assert (=> b!281207 (= e!178794 e!178796)))

(declare-fun res!144276 () Bool)

(assert (=> b!281207 (=> (not res!144276) (not e!178796))))

(declare-datatypes ((SeekEntryResult!1797 0))(
  ( (MissingZero!1797 (index!9358 (_ BitVec 32))) (Found!1797 (index!9359 (_ BitVec 32))) (Intermediate!1797 (undefined!2609 Bool) (index!9360 (_ BitVec 32)) (x!27587 (_ BitVec 32))) (Undefined!1797) (MissingVacant!1797 (index!9361 (_ BitVec 32))) )
))
(declare-fun lt!138997 () SeekEntryResult!1797)

(assert (=> b!281207 (= res!144276 (or (= lt!138997 (MissingZero!1797 i!1267)) (= lt!138997 (MissingVacant!1797 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13994 (_ BitVec 32)) SeekEntryResult!1797)

(assert (=> b!281207 (= lt!138997 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281208 () Bool)

(declare-fun res!144272 () Bool)

(assert (=> b!281208 (=> (not res!144272) (not e!178794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281208 (= res!144272 (validKeyInArray!0 k0!2581))))

(declare-fun b!281209 () Bool)

(declare-fun res!144277 () Bool)

(assert (=> b!281209 (=> (not res!144277) (not e!178796))))

(assert (=> b!281209 (= res!144277 (not (= startIndex!26 i!1267)))))

(declare-fun b!281210 () Bool)

(declare-fun res!144278 () Bool)

(assert (=> b!281210 (=> (not res!144278) (not e!178796))))

(assert (=> b!281210 (= res!144278 (validKeyInArray!0 (select (arr!6639 a!3325) startIndex!26)))))

(assert (= (and start!27176 res!144273) b!281205))

(assert (= (and b!281205 res!144274) b!281208))

(assert (= (and b!281208 res!144272) b!281206))

(assert (= (and b!281206 res!144275) b!281204))

(assert (= (and b!281204 res!144279) b!281207))

(assert (= (and b!281207 res!144276) b!281202))

(assert (= (and b!281202 res!144271) b!281209))

(assert (= (and b!281209 res!144277) b!281210))

(assert (= (and b!281210 res!144278) b!281203))

(declare-fun m!295551 () Bool)

(assert (=> b!281206 m!295551))

(declare-fun m!295553 () Bool)

(assert (=> b!281208 m!295553))

(declare-fun m!295555 () Bool)

(assert (=> start!27176 m!295555))

(declare-fun m!295557 () Bool)

(assert (=> start!27176 m!295557))

(declare-fun m!295559 () Bool)

(assert (=> b!281202 m!295559))

(declare-fun m!295561 () Bool)

(assert (=> b!281203 m!295561))

(declare-fun m!295563 () Bool)

(assert (=> b!281203 m!295563))

(declare-fun m!295565 () Bool)

(assert (=> b!281203 m!295565))

(declare-fun m!295567 () Bool)

(assert (=> b!281204 m!295567))

(declare-fun m!295569 () Bool)

(assert (=> b!281207 m!295569))

(declare-fun m!295571 () Bool)

(assert (=> b!281210 m!295571))

(assert (=> b!281210 m!295571))

(declare-fun m!295573 () Bool)

(assert (=> b!281210 m!295573))

(check-sat (not b!281203) (not start!27176) (not b!281208) (not b!281204) (not b!281202) (not b!281206) (not b!281210) (not b!281207))
(check-sat)
