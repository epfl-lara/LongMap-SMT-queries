; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26108 () Bool)

(assert start!26108)

(declare-fun b!269369 () Bool)

(declare-fun res!133584 () Bool)

(declare-fun e!173818 () Bool)

(assert (=> b!269369 (=> (not res!133584) (not e!173818))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269369 (= res!133584 (validKeyInArray!0 k0!2581))))

(declare-fun b!269370 () Bool)

(declare-datatypes ((Unit!8335 0))(
  ( (Unit!8336) )
))
(declare-fun e!173817 () Unit!8335)

(declare-fun Unit!8337 () Unit!8335)

(assert (=> b!269370 (= e!173817 Unit!8337)))

(declare-fun b!269371 () Bool)

(declare-fun e!173816 () Bool)

(assert (=> b!269371 (= e!173818 e!173816)))

(declare-fun res!133587 () Bool)

(assert (=> b!269371 (=> (not res!133587) (not e!173816))))

(declare-datatypes ((SeekEntryResult!1410 0))(
  ( (MissingZero!1410 (index!7810 (_ BitVec 32))) (Found!1410 (index!7811 (_ BitVec 32))) (Intermediate!1410 (undefined!2222 Bool) (index!7812 (_ BitVec 32)) (x!26159 (_ BitVec 32))) (Undefined!1410) (MissingVacant!1410 (index!7813 (_ BitVec 32))) )
))
(declare-fun lt!135178 () SeekEntryResult!1410)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269371 (= res!133587 (or (= lt!135178 (MissingZero!1410 i!1267)) (= lt!135178 (MissingVacant!1410 i!1267))))))

(declare-datatypes ((array!13205 0))(
  ( (array!13206 (arr!6252 (Array (_ BitVec 32) (_ BitVec 64))) (size!6604 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13205)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13205 (_ BitVec 32)) SeekEntryResult!1410)

(assert (=> b!269371 (= lt!135178 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269372 () Bool)

(declare-fun res!133589 () Bool)

(assert (=> b!269372 (=> (not res!133589) (not e!173816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13205 (_ BitVec 32)) Bool)

(assert (=> b!269372 (= res!133589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269373 () Bool)

(declare-fun res!133586 () Bool)

(assert (=> b!269373 (=> (not res!133586) (not e!173818))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269373 (= res!133586 (and (= (size!6604 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6604 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6604 a!3325))))))

(declare-fun b!269374 () Bool)

(declare-fun lt!135176 () Unit!8335)

(assert (=> b!269374 (= e!173817 lt!135176)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8335)

(assert (=> b!269374 (= lt!135176 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13206 (store (arr!6252 a!3325) i!1267 k0!2581) (size!6604 a!3325)) mask!3868)))

(declare-fun b!269376 () Bool)

(declare-fun res!133585 () Bool)

(assert (=> b!269376 (=> (not res!133585) (not e!173818))))

(declare-datatypes ((List!4060 0))(
  ( (Nil!4057) (Cons!4056 (h!4723 (_ BitVec 64)) (t!9142 List!4060)) )
))
(declare-fun arrayNoDuplicates!0 (array!13205 (_ BitVec 32) List!4060) Bool)

(assert (=> b!269376 (= res!133585 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4057))))

(declare-fun res!133590 () Bool)

(assert (=> start!26108 (=> (not res!133590) (not e!173818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26108 (= res!133590 (validMask!0 mask!3868))))

(assert (=> start!26108 e!173818))

(declare-fun array_inv!4215 (array!13205) Bool)

(assert (=> start!26108 (array_inv!4215 a!3325)))

(assert (=> start!26108 true))

(declare-fun b!269375 () Bool)

(declare-fun res!133583 () Bool)

(assert (=> b!269375 (=> (not res!133583) (not e!173816))))

(assert (=> b!269375 (= res!133583 (= startIndex!26 i!1267))))

(declare-fun b!269377 () Bool)

(declare-fun res!133588 () Bool)

(assert (=> b!269377 (=> (not res!133588) (not e!173818))))

(declare-fun arrayContainsKey!0 (array!13205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269377 (= res!133588 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269378 () Bool)

(assert (=> b!269378 (= e!173816 false)))

(declare-fun lt!135177 () Unit!8335)

(assert (=> b!269378 (= lt!135177 e!173817)))

(declare-fun c!45444 () Bool)

(assert (=> b!269378 (= c!45444 (bvslt startIndex!26 (bvsub (size!6604 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26108 res!133590) b!269373))

(assert (= (and b!269373 res!133586) b!269369))

(assert (= (and b!269369 res!133584) b!269376))

(assert (= (and b!269376 res!133585) b!269377))

(assert (= (and b!269377 res!133588) b!269371))

(assert (= (and b!269371 res!133587) b!269372))

(assert (= (and b!269372 res!133589) b!269375))

(assert (= (and b!269375 res!133583) b!269378))

(assert (= (and b!269378 c!45444) b!269374))

(assert (= (and b!269378 (not c!45444)) b!269370))

(declare-fun m!285251 () Bool)

(assert (=> b!269376 m!285251))

(declare-fun m!285253 () Bool)

(assert (=> start!26108 m!285253))

(declare-fun m!285255 () Bool)

(assert (=> start!26108 m!285255))

(declare-fun m!285257 () Bool)

(assert (=> b!269369 m!285257))

(declare-fun m!285259 () Bool)

(assert (=> b!269372 m!285259))

(declare-fun m!285261 () Bool)

(assert (=> b!269374 m!285261))

(declare-fun m!285263 () Bool)

(assert (=> b!269374 m!285263))

(declare-fun m!285265 () Bool)

(assert (=> b!269374 m!285265))

(declare-fun m!285267 () Bool)

(assert (=> b!269377 m!285267))

(declare-fun m!285269 () Bool)

(assert (=> b!269371 m!285269))

(check-sat (not b!269371) (not b!269376) (not b!269377) (not start!26108) (not b!269374) (not b!269372) (not b!269369))
(check-sat)
