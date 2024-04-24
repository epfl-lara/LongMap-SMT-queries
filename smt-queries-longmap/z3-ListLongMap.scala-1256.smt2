; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26094 () Bool)

(assert start!26094)

(declare-fun b!269206 () Bool)

(declare-fun res!133436 () Bool)

(declare-fun e!173757 () Bool)

(assert (=> b!269206 (=> (not res!133436) (not e!173757))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269206 (= res!133436 (validKeyInArray!0 k0!2581))))

(declare-fun b!269207 () Bool)

(declare-fun res!133441 () Bool)

(assert (=> b!269207 (=> (not res!133441) (not e!173757))))

(declare-datatypes ((array!13190 0))(
  ( (array!13191 (arr!6244 (Array (_ BitVec 32) (_ BitVec 64))) (size!6596 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13190)

(declare-fun arrayContainsKey!0 (array!13190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269207 (= res!133441 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269208 () Bool)

(declare-fun res!133442 () Bool)

(assert (=> b!269208 (=> (not res!133442) (not e!173757))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269208 (= res!133442 (and (= (size!6596 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6596 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6596 a!3325))))))

(declare-fun b!269209 () Bool)

(declare-fun res!133439 () Bool)

(declare-fun e!173756 () Bool)

(assert (=> b!269209 (=> (not res!133439) (not e!173756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13190 (_ BitVec 32)) Bool)

(assert (=> b!269209 (= res!133439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133440 () Bool)

(assert (=> start!26094 (=> (not res!133440) (not e!173757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26094 (= res!133440 (validMask!0 mask!3868))))

(assert (=> start!26094 e!173757))

(declare-fun array_inv!4194 (array!13190) Bool)

(assert (=> start!26094 (array_inv!4194 a!3325)))

(assert (=> start!26094 true))

(declare-fun b!269210 () Bool)

(assert (=> b!269210 (= e!173756 false)))

(declare-datatypes ((Unit!8294 0))(
  ( (Unit!8295) )
))
(declare-fun lt!135173 () Unit!8294)

(declare-fun e!173758 () Unit!8294)

(assert (=> b!269210 (= lt!135173 e!173758)))

(declare-fun c!45436 () Bool)

(assert (=> b!269210 (= c!45436 (bvslt startIndex!26 (bvsub (size!6596 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269211 () Bool)

(declare-fun res!133438 () Bool)

(assert (=> b!269211 (=> (not res!133438) (not e!173757))))

(declare-datatypes ((List!3965 0))(
  ( (Nil!3962) (Cons!3961 (h!4628 (_ BitVec 64)) (t!9039 List!3965)) )
))
(declare-fun arrayNoDuplicates!0 (array!13190 (_ BitVec 32) List!3965) Bool)

(assert (=> b!269211 (= res!133438 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3962))))

(declare-fun b!269212 () Bool)

(declare-fun Unit!8296 () Unit!8294)

(assert (=> b!269212 (= e!173758 Unit!8296)))

(declare-fun b!269213 () Bool)

(declare-fun lt!135172 () Unit!8294)

(assert (=> b!269213 (= e!173758 lt!135172)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13190 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8294)

(assert (=> b!269213 (= lt!135172 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13191 (store (arr!6244 a!3325) i!1267 k0!2581) (size!6596 a!3325)) mask!3868)))

(declare-fun b!269214 () Bool)

(assert (=> b!269214 (= e!173757 e!173756)))

(declare-fun res!133437 () Bool)

(assert (=> b!269214 (=> (not res!133437) (not e!173756))))

(declare-datatypes ((SeekEntryResult!1367 0))(
  ( (MissingZero!1367 (index!7638 (_ BitVec 32))) (Found!1367 (index!7639 (_ BitVec 32))) (Intermediate!1367 (undefined!2179 Bool) (index!7640 (_ BitVec 32)) (x!26100 (_ BitVec 32))) (Undefined!1367) (MissingVacant!1367 (index!7641 (_ BitVec 32))) )
))
(declare-fun lt!135174 () SeekEntryResult!1367)

(assert (=> b!269214 (= res!133437 (or (= lt!135174 (MissingZero!1367 i!1267)) (= lt!135174 (MissingVacant!1367 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13190 (_ BitVec 32)) SeekEntryResult!1367)

(assert (=> b!269214 (= lt!135174 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269215 () Bool)

(declare-fun res!133443 () Bool)

(assert (=> b!269215 (=> (not res!133443) (not e!173756))))

(assert (=> b!269215 (= res!133443 (= startIndex!26 i!1267))))

(assert (= (and start!26094 res!133440) b!269208))

(assert (= (and b!269208 res!133442) b!269206))

(assert (= (and b!269206 res!133436) b!269211))

(assert (= (and b!269211 res!133438) b!269207))

(assert (= (and b!269207 res!133441) b!269214))

(assert (= (and b!269214 res!133437) b!269209))

(assert (= (and b!269209 res!133439) b!269215))

(assert (= (and b!269215 res!133443) b!269210))

(assert (= (and b!269210 c!45436) b!269213))

(assert (= (and b!269210 (not c!45436)) b!269212))

(declare-fun m!285317 () Bool)

(assert (=> b!269214 m!285317))

(declare-fun m!285319 () Bool)

(assert (=> b!269211 m!285319))

(declare-fun m!285321 () Bool)

(assert (=> b!269206 m!285321))

(declare-fun m!285323 () Bool)

(assert (=> b!269213 m!285323))

(declare-fun m!285325 () Bool)

(assert (=> b!269213 m!285325))

(declare-fun m!285327 () Bool)

(assert (=> b!269213 m!285327))

(declare-fun m!285329 () Bool)

(assert (=> start!26094 m!285329))

(declare-fun m!285331 () Bool)

(assert (=> start!26094 m!285331))

(declare-fun m!285333 () Bool)

(assert (=> b!269207 m!285333))

(declare-fun m!285335 () Bool)

(assert (=> b!269209 m!285335))

(check-sat (not b!269213) (not b!269214) (not b!269206) (not start!26094) (not b!269209) (not b!269207) (not b!269211))
(check-sat)
