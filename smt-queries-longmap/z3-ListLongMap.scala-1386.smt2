; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27170 () Bool)

(assert start!27170)

(declare-fun b!281121 () Bool)

(declare-fun e!178769 () Bool)

(assert (=> b!281121 (= e!178769 (not true))))

(declare-datatypes ((array!13988 0))(
  ( (array!13989 (arr!6636 (Array (_ BitVec 32) (_ BitVec 64))) (size!6988 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13988)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4444 0))(
  ( (Nil!4441) (Cons!4440 (h!5110 (_ BitVec 64)) (t!9526 List!4444)) )
))
(declare-fun arrayNoDuplicates!0 (array!13988 (_ BitVec 32) List!4444) Bool)

(assert (=> b!281121 (arrayNoDuplicates!0 (array!13989 (store (arr!6636 a!3325) i!1267 k0!2581) (size!6988 a!3325)) #b00000000000000000000000000000000 Nil!4441)))

(declare-datatypes ((Unit!8872 0))(
  ( (Unit!8873) )
))
(declare-fun lt!138978 () Unit!8872)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13988 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4444) Unit!8872)

(assert (=> b!281121 (= lt!138978 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4441))))

(declare-fun b!281122 () Bool)

(declare-fun res!144191 () Bool)

(assert (=> b!281122 (=> (not res!144191) (not e!178769))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281122 (= res!144191 (not (= startIndex!26 i!1267)))))

(declare-fun res!144197 () Bool)

(declare-fun e!178767 () Bool)

(assert (=> start!27170 (=> (not res!144197) (not e!178767))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27170 (= res!144197 (validMask!0 mask!3868))))

(assert (=> start!27170 e!178767))

(declare-fun array_inv!4599 (array!13988) Bool)

(assert (=> start!27170 (array_inv!4599 a!3325)))

(assert (=> start!27170 true))

(declare-fun b!281123 () Bool)

(declare-fun res!144194 () Bool)

(assert (=> b!281123 (=> (not res!144194) (not e!178769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13988 (_ BitVec 32)) Bool)

(assert (=> b!281123 (= res!144194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281124 () Bool)

(assert (=> b!281124 (= e!178767 e!178769)))

(declare-fun res!144196 () Bool)

(assert (=> b!281124 (=> (not res!144196) (not e!178769))))

(declare-datatypes ((SeekEntryResult!1794 0))(
  ( (MissingZero!1794 (index!9346 (_ BitVec 32))) (Found!1794 (index!9347 (_ BitVec 32))) (Intermediate!1794 (undefined!2606 Bool) (index!9348 (_ BitVec 32)) (x!27576 (_ BitVec 32))) (Undefined!1794) (MissingVacant!1794 (index!9349 (_ BitVec 32))) )
))
(declare-fun lt!138979 () SeekEntryResult!1794)

(assert (=> b!281124 (= res!144196 (or (= lt!138979 (MissingZero!1794 i!1267)) (= lt!138979 (MissingVacant!1794 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13988 (_ BitVec 32)) SeekEntryResult!1794)

(assert (=> b!281124 (= lt!138979 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281125 () Bool)

(declare-fun res!144190 () Bool)

(assert (=> b!281125 (=> (not res!144190) (not e!178767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281125 (= res!144190 (validKeyInArray!0 k0!2581))))

(declare-fun b!281126 () Bool)

(declare-fun res!144195 () Bool)

(assert (=> b!281126 (=> (not res!144195) (not e!178767))))

(assert (=> b!281126 (= res!144195 (and (= (size!6988 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6988 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6988 a!3325))))))

(declare-fun b!281127 () Bool)

(declare-fun res!144198 () Bool)

(assert (=> b!281127 (=> (not res!144198) (not e!178767))))

(declare-fun arrayContainsKey!0 (array!13988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281127 (= res!144198 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281128 () Bool)

(declare-fun res!144193 () Bool)

(assert (=> b!281128 (=> (not res!144193) (not e!178769))))

(assert (=> b!281128 (= res!144193 (validKeyInArray!0 (select (arr!6636 a!3325) startIndex!26)))))

(declare-fun b!281129 () Bool)

(declare-fun res!144192 () Bool)

(assert (=> b!281129 (=> (not res!144192) (not e!178767))))

(assert (=> b!281129 (= res!144192 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4441))))

(assert (= (and start!27170 res!144197) b!281126))

(assert (= (and b!281126 res!144195) b!281125))

(assert (= (and b!281125 res!144190) b!281129))

(assert (= (and b!281129 res!144192) b!281127))

(assert (= (and b!281127 res!144198) b!281124))

(assert (= (and b!281124 res!144196) b!281123))

(assert (= (and b!281123 res!144194) b!281122))

(assert (= (and b!281122 res!144191) b!281128))

(assert (= (and b!281128 res!144193) b!281121))

(declare-fun m!295479 () Bool)

(assert (=> b!281127 m!295479))

(declare-fun m!295481 () Bool)

(assert (=> b!281121 m!295481))

(declare-fun m!295483 () Bool)

(assert (=> b!281121 m!295483))

(declare-fun m!295485 () Bool)

(assert (=> b!281121 m!295485))

(declare-fun m!295487 () Bool)

(assert (=> b!281128 m!295487))

(assert (=> b!281128 m!295487))

(declare-fun m!295489 () Bool)

(assert (=> b!281128 m!295489))

(declare-fun m!295491 () Bool)

(assert (=> b!281124 m!295491))

(declare-fun m!295493 () Bool)

(assert (=> b!281129 m!295493))

(declare-fun m!295495 () Bool)

(assert (=> b!281125 m!295495))

(declare-fun m!295497 () Bool)

(assert (=> b!281123 m!295497))

(declare-fun m!295499 () Bool)

(assert (=> start!27170 m!295499))

(declare-fun m!295501 () Bool)

(assert (=> start!27170 m!295501))

(check-sat (not start!27170) (not b!281127) (not b!281123) (not b!281125) (not b!281124) (not b!281129) (not b!281121) (not b!281128))
(check-sat)
