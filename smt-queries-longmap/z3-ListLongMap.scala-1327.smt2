; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26520 () Bool)

(assert start!26520)

(declare-fun b!275327 () Bool)

(declare-fun res!139295 () Bool)

(declare-fun e!176139 () Bool)

(assert (=> b!275327 (=> (not res!139295) (not e!176139))))

(declare-datatypes ((array!13616 0))(
  ( (array!13617 (arr!6457 (Array (_ BitVec 32) (_ BitVec 64))) (size!6809 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13616)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275327 (= res!139295 (and (= (size!6809 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6809 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6809 a!3325))))))

(declare-fun b!275328 () Bool)

(declare-fun e!176141 () Bool)

(assert (=> b!275328 (= e!176141 false)))

(declare-fun lt!137394 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13616 (_ BitVec 32)) Bool)

(assert (=> b!275328 (= lt!137394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275329 () Bool)

(declare-fun res!139294 () Bool)

(assert (=> b!275329 (=> (not res!139294) (not e!176139))))

(declare-datatypes ((List!4178 0))(
  ( (Nil!4175) (Cons!4174 (h!4841 (_ BitVec 64)) (t!9252 List!4178)) )
))
(declare-fun arrayNoDuplicates!0 (array!13616 (_ BitVec 32) List!4178) Bool)

(assert (=> b!275329 (= res!139294 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4175))))

(declare-fun b!275330 () Bool)

(declare-fun res!139296 () Bool)

(assert (=> b!275330 (=> (not res!139296) (not e!176139))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275330 (= res!139296 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139292 () Bool)

(assert (=> start!26520 (=> (not res!139292) (not e!176139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26520 (= res!139292 (validMask!0 mask!3868))))

(assert (=> start!26520 e!176139))

(declare-fun array_inv!4407 (array!13616) Bool)

(assert (=> start!26520 (array_inv!4407 a!3325)))

(assert (=> start!26520 true))

(declare-fun b!275331 () Bool)

(assert (=> b!275331 (= e!176139 e!176141)))

(declare-fun res!139291 () Bool)

(assert (=> b!275331 (=> (not res!139291) (not e!176141))))

(declare-datatypes ((SeekEntryResult!1580 0))(
  ( (MissingZero!1580 (index!8490 (_ BitVec 32))) (Found!1580 (index!8491 (_ BitVec 32))) (Intermediate!1580 (undefined!2392 Bool) (index!8492 (_ BitVec 32)) (x!26881 (_ BitVec 32))) (Undefined!1580) (MissingVacant!1580 (index!8493 (_ BitVec 32))) )
))
(declare-fun lt!137393 () SeekEntryResult!1580)

(assert (=> b!275331 (= res!139291 (or (= lt!137393 (MissingZero!1580 i!1267)) (= lt!137393 (MissingVacant!1580 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13616 (_ BitVec 32)) SeekEntryResult!1580)

(assert (=> b!275331 (= lt!137393 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275332 () Bool)

(declare-fun res!139293 () Bool)

(assert (=> b!275332 (=> (not res!139293) (not e!176139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275332 (= res!139293 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26520 res!139292) b!275327))

(assert (= (and b!275327 res!139295) b!275332))

(assert (= (and b!275332 res!139293) b!275329))

(assert (= (and b!275329 res!139294) b!275330))

(assert (= (and b!275330 res!139296) b!275331))

(assert (= (and b!275331 res!139291) b!275328))

(declare-fun m!291089 () Bool)

(assert (=> b!275331 m!291089))

(declare-fun m!291091 () Bool)

(assert (=> b!275330 m!291091))

(declare-fun m!291093 () Bool)

(assert (=> b!275328 m!291093))

(declare-fun m!291095 () Bool)

(assert (=> start!26520 m!291095))

(declare-fun m!291097 () Bool)

(assert (=> start!26520 m!291097))

(declare-fun m!291099 () Bool)

(assert (=> b!275332 m!291099))

(declare-fun m!291101 () Bool)

(assert (=> b!275329 m!291101))

(check-sat (not b!275329) (not b!275331) (not b!275330) (not b!275328) (not b!275332) (not start!26520))
(check-sat)
