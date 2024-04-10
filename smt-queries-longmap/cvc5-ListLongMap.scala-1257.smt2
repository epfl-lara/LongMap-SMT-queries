; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26100 () Bool)

(assert start!26100)

(declare-fun b!269249 () Bool)

(declare-fun e!173768 () Bool)

(assert (=> b!269249 (= e!173768 false)))

(declare-datatypes ((Unit!8323 0))(
  ( (Unit!8324) )
))
(declare-fun lt!135141 () Unit!8323)

(declare-fun e!173770 () Unit!8323)

(assert (=> b!269249 (= lt!135141 e!173770)))

(declare-fun c!45432 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13197 0))(
  ( (array!13198 (arr!6248 (Array (_ BitVec 32) (_ BitVec 64))) (size!6600 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13197)

(assert (=> b!269249 (= c!45432 (bvslt startIndex!26 (bvsub (size!6600 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269250 () Bool)

(declare-fun res!133490 () Bool)

(declare-fun e!173771 () Bool)

(assert (=> b!269250 (=> (not res!133490) (not e!173771))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269250 (= res!133490 (and (= (size!6600 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6600 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6600 a!3325))))))

(declare-fun b!269251 () Bool)

(declare-fun lt!135140 () Unit!8323)

(assert (=> b!269251 (= e!173770 lt!135140)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8323)

(assert (=> b!269251 (= lt!135140 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13197 (_ BitVec 32)) Bool)

(assert (=> b!269251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13198 (store (arr!6248 a!3325) i!1267 k!2581) (size!6600 a!3325)) mask!3868)))

(declare-fun b!269252 () Bool)

(declare-fun res!133494 () Bool)

(assert (=> b!269252 (=> (not res!133494) (not e!173768))))

(assert (=> b!269252 (= res!133494 (= startIndex!26 i!1267))))

(declare-fun b!269253 () Bool)

(declare-fun res!133493 () Bool)

(assert (=> b!269253 (=> (not res!133493) (not e!173771))))

(declare-fun arrayContainsKey!0 (array!13197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269253 (= res!133493 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269254 () Bool)

(declare-fun Unit!8325 () Unit!8323)

(assert (=> b!269254 (= e!173770 Unit!8325)))

(declare-fun res!133489 () Bool)

(assert (=> start!26100 (=> (not res!133489) (not e!173771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26100 (= res!133489 (validMask!0 mask!3868))))

(assert (=> start!26100 e!173771))

(declare-fun array_inv!4211 (array!13197) Bool)

(assert (=> start!26100 (array_inv!4211 a!3325)))

(assert (=> start!26100 true))

(declare-fun b!269255 () Bool)

(declare-fun res!133488 () Bool)

(assert (=> b!269255 (=> (not res!133488) (not e!173768))))

(assert (=> b!269255 (= res!133488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269256 () Bool)

(declare-fun res!133491 () Bool)

(assert (=> b!269256 (=> (not res!133491) (not e!173771))))

(declare-datatypes ((List!4056 0))(
  ( (Nil!4053) (Cons!4052 (h!4719 (_ BitVec 64)) (t!9138 List!4056)) )
))
(declare-fun arrayNoDuplicates!0 (array!13197 (_ BitVec 32) List!4056) Bool)

(assert (=> b!269256 (= res!133491 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4053))))

(declare-fun b!269257 () Bool)

(assert (=> b!269257 (= e!173771 e!173768)))

(declare-fun res!133487 () Bool)

(assert (=> b!269257 (=> (not res!133487) (not e!173768))))

(declare-datatypes ((SeekEntryResult!1406 0))(
  ( (MissingZero!1406 (index!7794 (_ BitVec 32))) (Found!1406 (index!7795 (_ BitVec 32))) (Intermediate!1406 (undefined!2218 Bool) (index!7796 (_ BitVec 32)) (x!26147 (_ BitVec 32))) (Undefined!1406) (MissingVacant!1406 (index!7797 (_ BitVec 32))) )
))
(declare-fun lt!135142 () SeekEntryResult!1406)

(assert (=> b!269257 (= res!133487 (or (= lt!135142 (MissingZero!1406 i!1267)) (= lt!135142 (MissingVacant!1406 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13197 (_ BitVec 32)) SeekEntryResult!1406)

(assert (=> b!269257 (= lt!135142 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269258 () Bool)

(declare-fun res!133492 () Bool)

(assert (=> b!269258 (=> (not res!133492) (not e!173771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269258 (= res!133492 (validKeyInArray!0 k!2581))))

(assert (= (and start!26100 res!133489) b!269250))

(assert (= (and b!269250 res!133490) b!269258))

(assert (= (and b!269258 res!133492) b!269256))

(assert (= (and b!269256 res!133491) b!269253))

(assert (= (and b!269253 res!133493) b!269257))

(assert (= (and b!269257 res!133487) b!269255))

(assert (= (and b!269255 res!133488) b!269252))

(assert (= (and b!269252 res!133494) b!269249))

(assert (= (and b!269249 c!45432) b!269251))

(assert (= (and b!269249 (not c!45432)) b!269254))

(declare-fun m!285171 () Bool)

(assert (=> start!26100 m!285171))

(declare-fun m!285173 () Bool)

(assert (=> start!26100 m!285173))

(declare-fun m!285175 () Bool)

(assert (=> b!269251 m!285175))

(declare-fun m!285177 () Bool)

(assert (=> b!269251 m!285177))

(declare-fun m!285179 () Bool)

(assert (=> b!269251 m!285179))

(declare-fun m!285181 () Bool)

(assert (=> b!269256 m!285181))

(declare-fun m!285183 () Bool)

(assert (=> b!269258 m!285183))

(declare-fun m!285185 () Bool)

(assert (=> b!269253 m!285185))

(declare-fun m!285187 () Bool)

(assert (=> b!269257 m!285187))

(declare-fun m!285189 () Bool)

(assert (=> b!269255 m!285189))

(push 1)

