; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27122 () Bool)

(assert start!27122)

(declare-fun res!143420 () Bool)

(declare-fun e!178441 () Bool)

(assert (=> start!27122 (=> (not res!143420) (not e!178441))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27122 (= res!143420 (validMask!0 mask!3868))))

(assert (=> start!27122 e!178441))

(declare-datatypes ((array!13929 0))(
  ( (array!13930 (arr!6606 (Array (_ BitVec 32) (_ BitVec 64))) (size!6959 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13929)

(declare-fun array_inv!4578 (array!13929) Bool)

(assert (=> start!27122 (array_inv!4578 a!3325)))

(assert (=> start!27122 true))

(declare-fun b!280299 () Bool)

(declare-fun res!143422 () Bool)

(assert (=> b!280299 (=> (not res!143422) (not e!178441))))

(declare-datatypes ((List!4387 0))(
  ( (Nil!4384) (Cons!4383 (h!5053 (_ BitVec 64)) (t!9460 List!4387)) )
))
(declare-fun arrayNoDuplicates!0 (array!13929 (_ BitVec 32) List!4387) Bool)

(assert (=> b!280299 (= res!143422 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4384))))

(declare-fun b!280300 () Bool)

(declare-fun res!143428 () Bool)

(declare-fun e!178442 () Bool)

(assert (=> b!280300 (=> (not res!143428) (not e!178442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13929 (_ BitVec 32)) Bool)

(assert (=> b!280300 (= res!143428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280301 () Bool)

(declare-fun res!143423 () Bool)

(assert (=> b!280301 (=> (not res!143423) (not e!178441))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280301 (= res!143423 (validKeyInArray!0 k0!2581))))

(declare-fun b!280302 () Bool)

(declare-fun res!143427 () Bool)

(assert (=> b!280302 (=> (not res!143427) (not e!178441))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280302 (= res!143427 (and (= (size!6959 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6959 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6959 a!3325))))))

(declare-fun b!280303 () Bool)

(assert (=> b!280303 (= e!178442 (not true))))

(assert (=> b!280303 (arrayNoDuplicates!0 (array!13930 (store (arr!6606 a!3325) i!1267 k0!2581) (size!6959 a!3325)) #b00000000000000000000000000000000 Nil!4384)))

(declare-datatypes ((Unit!8772 0))(
  ( (Unit!8773) )
))
(declare-fun lt!138648 () Unit!8772)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4387) Unit!8772)

(assert (=> b!280303 (= lt!138648 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4384))))

(declare-fun b!280304 () Bool)

(declare-fun res!143425 () Bool)

(assert (=> b!280304 (=> (not res!143425) (not e!178442))))

(assert (=> b!280304 (= res!143425 (validKeyInArray!0 (select (arr!6606 a!3325) startIndex!26)))))

(declare-fun b!280305 () Bool)

(assert (=> b!280305 (= e!178441 e!178442)))

(declare-fun res!143426 () Bool)

(assert (=> b!280305 (=> (not res!143426) (not e!178442))))

(declare-datatypes ((SeekEntryResult!1763 0))(
  ( (MissingZero!1763 (index!9222 (_ BitVec 32))) (Found!1763 (index!9223 (_ BitVec 32))) (Intermediate!1763 (undefined!2575 Bool) (index!9224 (_ BitVec 32)) (x!27480 (_ BitVec 32))) (Undefined!1763) (MissingVacant!1763 (index!9225 (_ BitVec 32))) )
))
(declare-fun lt!138647 () SeekEntryResult!1763)

(assert (=> b!280305 (= res!143426 (or (= lt!138647 (MissingZero!1763 i!1267)) (= lt!138647 (MissingVacant!1763 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13929 (_ BitVec 32)) SeekEntryResult!1763)

(assert (=> b!280305 (= lt!138647 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280306 () Bool)

(declare-fun res!143424 () Bool)

(assert (=> b!280306 (=> (not res!143424) (not e!178441))))

(declare-fun arrayContainsKey!0 (array!13929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280306 (= res!143424 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280307 () Bool)

(declare-fun res!143421 () Bool)

(assert (=> b!280307 (=> (not res!143421) (not e!178442))))

(assert (=> b!280307 (= res!143421 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27122 res!143420) b!280302))

(assert (= (and b!280302 res!143427) b!280301))

(assert (= (and b!280301 res!143423) b!280299))

(assert (= (and b!280299 res!143422) b!280306))

(assert (= (and b!280306 res!143424) b!280305))

(assert (= (and b!280305 res!143426) b!280300))

(assert (= (and b!280300 res!143428) b!280307))

(assert (= (and b!280307 res!143421) b!280304))

(assert (= (and b!280304 res!143425) b!280303))

(declare-fun m!294287 () Bool)

(assert (=> start!27122 m!294287))

(declare-fun m!294289 () Bool)

(assert (=> start!27122 m!294289))

(declare-fun m!294291 () Bool)

(assert (=> b!280304 m!294291))

(assert (=> b!280304 m!294291))

(declare-fun m!294293 () Bool)

(assert (=> b!280304 m!294293))

(declare-fun m!294295 () Bool)

(assert (=> b!280303 m!294295))

(declare-fun m!294297 () Bool)

(assert (=> b!280303 m!294297))

(declare-fun m!294299 () Bool)

(assert (=> b!280303 m!294299))

(declare-fun m!294301 () Bool)

(assert (=> b!280305 m!294301))

(declare-fun m!294303 () Bool)

(assert (=> b!280300 m!294303))

(declare-fun m!294305 () Bool)

(assert (=> b!280299 m!294305))

(declare-fun m!294307 () Bool)

(assert (=> b!280306 m!294307))

(declare-fun m!294309 () Bool)

(assert (=> b!280301 m!294309))

(check-sat (not b!280306) (not b!280304) (not b!280301) (not start!27122) (not b!280303) (not b!280300) (not b!280299) (not b!280305))
(check-sat)
