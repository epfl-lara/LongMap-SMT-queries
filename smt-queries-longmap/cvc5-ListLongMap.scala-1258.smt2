; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26106 () Bool)

(assert start!26106)

(declare-fun b!269339 () Bool)

(declare-fun res!133562 () Bool)

(declare-fun e!173805 () Bool)

(assert (=> b!269339 (=> (not res!133562) (not e!173805))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269339 (= res!133562 (validKeyInArray!0 k!2581))))

(declare-fun b!269340 () Bool)

(declare-datatypes ((Unit!8332 0))(
  ( (Unit!8333) )
))
(declare-fun e!173806 () Unit!8332)

(declare-fun Unit!8334 () Unit!8332)

(assert (=> b!269340 (= e!173806 Unit!8334)))

(declare-fun b!269341 () Bool)

(declare-fun e!173807 () Bool)

(assert (=> b!269341 (= e!173807 false)))

(declare-fun lt!135168 () Unit!8332)

(assert (=> b!269341 (= lt!135168 e!173806)))

(declare-fun c!45441 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13203 0))(
  ( (array!13204 (arr!6251 (Array (_ BitVec 32) (_ BitVec 64))) (size!6603 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13203)

(assert (=> b!269341 (= c!45441 (bvslt startIndex!26 (bvsub (size!6603 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269342 () Bool)

(assert (=> b!269342 (= e!173805 e!173807)))

(declare-fun res!133565 () Bool)

(assert (=> b!269342 (=> (not res!133565) (not e!173807))))

(declare-datatypes ((SeekEntryResult!1409 0))(
  ( (MissingZero!1409 (index!7806 (_ BitVec 32))) (Found!1409 (index!7807 (_ BitVec 32))) (Intermediate!1409 (undefined!2221 Bool) (index!7808 (_ BitVec 32)) (x!26158 (_ BitVec 32))) (Undefined!1409) (MissingVacant!1409 (index!7809 (_ BitVec 32))) )
))
(declare-fun lt!135167 () SeekEntryResult!1409)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269342 (= res!133565 (or (= lt!135167 (MissingZero!1409 i!1267)) (= lt!135167 (MissingVacant!1409 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13203 (_ BitVec 32)) SeekEntryResult!1409)

(assert (=> b!269342 (= lt!135167 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269343 () Bool)

(declare-fun res!133559 () Bool)

(assert (=> b!269343 (=> (not res!133559) (not e!173807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13203 (_ BitVec 32)) Bool)

(assert (=> b!269343 (= res!133559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133563 () Bool)

(assert (=> start!26106 (=> (not res!133563) (not e!173805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26106 (= res!133563 (validMask!0 mask!3868))))

(assert (=> start!26106 e!173805))

(declare-fun array_inv!4214 (array!13203) Bool)

(assert (=> start!26106 (array_inv!4214 a!3325)))

(assert (=> start!26106 true))

(declare-fun b!269344 () Bool)

(declare-fun res!133566 () Bool)

(assert (=> b!269344 (=> (not res!133566) (not e!173805))))

(declare-datatypes ((List!4059 0))(
  ( (Nil!4056) (Cons!4055 (h!4722 (_ BitVec 64)) (t!9141 List!4059)) )
))
(declare-fun arrayNoDuplicates!0 (array!13203 (_ BitVec 32) List!4059) Bool)

(assert (=> b!269344 (= res!133566 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4056))))

(declare-fun b!269345 () Bool)

(declare-fun lt!135169 () Unit!8332)

(assert (=> b!269345 (= e!173806 lt!135169)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8332)

(assert (=> b!269345 (= lt!135169 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269345 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13204 (store (arr!6251 a!3325) i!1267 k!2581) (size!6603 a!3325)) mask!3868)))

(declare-fun b!269346 () Bool)

(declare-fun res!133560 () Bool)

(assert (=> b!269346 (=> (not res!133560) (not e!173807))))

(assert (=> b!269346 (= res!133560 (= startIndex!26 i!1267))))

(declare-fun b!269347 () Bool)

(declare-fun res!133561 () Bool)

(assert (=> b!269347 (=> (not res!133561) (not e!173805))))

(assert (=> b!269347 (= res!133561 (and (= (size!6603 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6603 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6603 a!3325))))))

(declare-fun b!269348 () Bool)

(declare-fun res!133564 () Bool)

(assert (=> b!269348 (=> (not res!133564) (not e!173805))))

(declare-fun arrayContainsKey!0 (array!13203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269348 (= res!133564 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26106 res!133563) b!269347))

(assert (= (and b!269347 res!133561) b!269339))

(assert (= (and b!269339 res!133562) b!269344))

(assert (= (and b!269344 res!133566) b!269348))

(assert (= (and b!269348 res!133564) b!269342))

(assert (= (and b!269342 res!133565) b!269343))

(assert (= (and b!269343 res!133559) b!269346))

(assert (= (and b!269346 res!133560) b!269341))

(assert (= (and b!269341 c!45441) b!269345))

(assert (= (and b!269341 (not c!45441)) b!269340))

(declare-fun m!285231 () Bool)

(assert (=> b!269339 m!285231))

(declare-fun m!285233 () Bool)

(assert (=> b!269343 m!285233))

(declare-fun m!285235 () Bool)

(assert (=> start!26106 m!285235))

(declare-fun m!285237 () Bool)

(assert (=> start!26106 m!285237))

(declare-fun m!285239 () Bool)

(assert (=> b!269348 m!285239))

(declare-fun m!285241 () Bool)

(assert (=> b!269344 m!285241))

(declare-fun m!285243 () Bool)

(assert (=> b!269345 m!285243))

(declare-fun m!285245 () Bool)

(assert (=> b!269345 m!285245))

(declare-fun m!285247 () Bool)

(assert (=> b!269345 m!285247))

(declare-fun m!285249 () Bool)

(assert (=> b!269342 m!285249))

(push 1)

