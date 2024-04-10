; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26222 () Bool)

(assert start!26222)

(declare-fun b!271256 () Bool)

(declare-fun res!135255 () Bool)

(declare-fun e!174513 () Bool)

(assert (=> b!271256 (=> (not res!135255) (not e!174513))))

(declare-datatypes ((array!13319 0))(
  ( (array!13320 (arr!6309 (Array (_ BitVec 32) (_ BitVec 64))) (size!6661 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13319)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271256 (= res!135255 (validKeyInArray!0 (select (arr!6309 a!3325) startIndex!26)))))

(declare-fun b!271257 () Bool)

(declare-fun res!135250 () Bool)

(declare-fun e!174515 () Bool)

(assert (=> b!271257 (=> (not res!135250) (not e!174515))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271257 (= res!135250 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271258 () Bool)

(declare-fun res!135247 () Bool)

(assert (=> b!271258 (=> (not res!135247) (not e!174513))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271258 (= res!135247 (not (= startIndex!26 i!1267)))))

(declare-fun b!271259 () Bool)

(declare-fun res!135249 () Bool)

(assert (=> b!271259 (=> (not res!135249) (not e!174513))))

(declare-datatypes ((List!4117 0))(
  ( (Nil!4114) (Cons!4113 (h!4780 (_ BitVec 64)) (t!9199 List!4117)) )
))
(declare-fun contains!1947 (List!4117 (_ BitVec 64)) Bool)

(assert (=> b!271259 (= res!135249 (not (contains!1947 Nil!4114 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271260 () Bool)

(assert (=> b!271260 (= e!174515 e!174513)))

(declare-fun res!135252 () Bool)

(assert (=> b!271260 (=> (not res!135252) (not e!174513))))

(declare-datatypes ((SeekEntryResult!1467 0))(
  ( (MissingZero!1467 (index!8038 (_ BitVec 32))) (Found!1467 (index!8039 (_ BitVec 32))) (Intermediate!1467 (undefined!2279 Bool) (index!8040 (_ BitVec 32)) (x!26368 (_ BitVec 32))) (Undefined!1467) (MissingVacant!1467 (index!8041 (_ BitVec 32))) )
))
(declare-fun lt!135774 () SeekEntryResult!1467)

(assert (=> b!271260 (= res!135252 (or (= lt!135774 (MissingZero!1467 i!1267)) (= lt!135774 (MissingVacant!1467 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13319 (_ BitVec 32)) SeekEntryResult!1467)

(assert (=> b!271260 (= lt!135774 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271261 () Bool)

(declare-fun res!135258 () Bool)

(assert (=> b!271261 (=> (not res!135258) (not e!174515))))

(assert (=> b!271261 (= res!135258 (and (= (size!6661 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6661 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6661 a!3325))))))

(declare-fun b!271262 () Bool)

(declare-fun res!135248 () Bool)

(assert (=> b!271262 (=> (not res!135248) (not e!174513))))

(assert (=> b!271262 (= res!135248 (and (bvslt (size!6661 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6661 a!3325))))))

(declare-fun b!271263 () Bool)

(declare-fun res!135251 () Bool)

(assert (=> b!271263 (=> (not res!135251) (not e!174515))))

(assert (=> b!271263 (= res!135251 (validKeyInArray!0 k0!2581))))

(declare-fun b!271264 () Bool)

(declare-fun res!135256 () Bool)

(assert (=> b!271264 (=> (not res!135256) (not e!174515))))

(declare-fun arrayNoDuplicates!0 (array!13319 (_ BitVec 32) List!4117) Bool)

(assert (=> b!271264 (= res!135256 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4114))))

(declare-fun b!271265 () Bool)

(declare-fun res!135246 () Bool)

(assert (=> b!271265 (=> (not res!135246) (not e!174513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13319 (_ BitVec 32)) Bool)

(assert (=> b!271265 (= res!135246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271266 () Bool)

(assert (=> b!271266 (= e!174513 false)))

(declare-fun lt!135775 () Bool)

(assert (=> b!271266 (= lt!135775 (contains!1947 Nil!4114 k0!2581))))

(declare-fun res!135257 () Bool)

(assert (=> start!26222 (=> (not res!135257) (not e!174515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26222 (= res!135257 (validMask!0 mask!3868))))

(assert (=> start!26222 e!174515))

(declare-fun array_inv!4272 (array!13319) Bool)

(assert (=> start!26222 (array_inv!4272 a!3325)))

(assert (=> start!26222 true))

(declare-fun b!271267 () Bool)

(declare-fun res!135254 () Bool)

(assert (=> b!271267 (=> (not res!135254) (not e!174513))))

(declare-fun noDuplicate!135 (List!4117) Bool)

(assert (=> b!271267 (= res!135254 (noDuplicate!135 Nil!4114))))

(declare-fun b!271268 () Bool)

(declare-fun res!135253 () Bool)

(assert (=> b!271268 (=> (not res!135253) (not e!174513))))

(assert (=> b!271268 (= res!135253 (not (contains!1947 Nil!4114 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26222 res!135257) b!271261))

(assert (= (and b!271261 res!135258) b!271263))

(assert (= (and b!271263 res!135251) b!271264))

(assert (= (and b!271264 res!135256) b!271257))

(assert (= (and b!271257 res!135250) b!271260))

(assert (= (and b!271260 res!135252) b!271265))

(assert (= (and b!271265 res!135246) b!271258))

(assert (= (and b!271258 res!135247) b!271256))

(assert (= (and b!271256 res!135255) b!271262))

(assert (= (and b!271262 res!135248) b!271267))

(assert (= (and b!271267 res!135254) b!271259))

(assert (= (and b!271259 res!135249) b!271268))

(assert (= (and b!271268 res!135253) b!271266))

(declare-fun m!286601 () Bool)

(assert (=> b!271259 m!286601))

(declare-fun m!286603 () Bool)

(assert (=> b!271260 m!286603))

(declare-fun m!286605 () Bool)

(assert (=> b!271256 m!286605))

(assert (=> b!271256 m!286605))

(declare-fun m!286607 () Bool)

(assert (=> b!271256 m!286607))

(declare-fun m!286609 () Bool)

(assert (=> b!271265 m!286609))

(declare-fun m!286611 () Bool)

(assert (=> b!271267 m!286611))

(declare-fun m!286613 () Bool)

(assert (=> b!271257 m!286613))

(declare-fun m!286615 () Bool)

(assert (=> start!26222 m!286615))

(declare-fun m!286617 () Bool)

(assert (=> start!26222 m!286617))

(declare-fun m!286619 () Bool)

(assert (=> b!271268 m!286619))

(declare-fun m!286621 () Bool)

(assert (=> b!271263 m!286621))

(declare-fun m!286623 () Bool)

(assert (=> b!271266 m!286623))

(declare-fun m!286625 () Bool)

(assert (=> b!271264 m!286625))

(check-sat (not start!26222) (not b!271263) (not b!271260) (not b!271259) (not b!271265) (not b!271267) (not b!271266) (not b!271257) (not b!271256) (not b!271268) (not b!271264))
(check-sat)
