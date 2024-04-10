; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25998 () Bool)

(assert start!25998)

(declare-fun b!268242 () Bool)

(declare-fun res!132522 () Bool)

(declare-fun e!173289 () Bool)

(assert (=> b!268242 (=> (not res!132522) (not e!173289))))

(declare-datatypes ((array!13095 0))(
  ( (array!13096 (arr!6197 (Array (_ BitVec 32) (_ BitVec 64))) (size!6549 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13095)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268242 (= res!132522 (and (= (size!6549 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6549 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6549 a!3325))))))

(declare-fun b!268243 () Bool)

(declare-fun res!132521 () Bool)

(assert (=> b!268243 (=> (not res!132521) (not e!173289))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268243 (= res!132521 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132524 () Bool)

(assert (=> start!25998 (=> (not res!132524) (not e!173289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25998 (= res!132524 (validMask!0 mask!3868))))

(assert (=> start!25998 e!173289))

(declare-fun array_inv!4160 (array!13095) Bool)

(assert (=> start!25998 (array_inv!4160 a!3325)))

(assert (=> start!25998 true))

(declare-fun b!268244 () Bool)

(declare-fun e!173290 () Bool)

(assert (=> b!268244 (= e!173289 e!173290)))

(declare-fun res!132520 () Bool)

(assert (=> b!268244 (=> (not res!132520) (not e!173290))))

(declare-datatypes ((SeekEntryResult!1355 0))(
  ( (MissingZero!1355 (index!7590 (_ BitVec 32))) (Found!1355 (index!7591 (_ BitVec 32))) (Intermediate!1355 (undefined!2167 Bool) (index!7592 (_ BitVec 32)) (x!25960 (_ BitVec 32))) (Undefined!1355) (MissingVacant!1355 (index!7593 (_ BitVec 32))) )
))
(declare-fun lt!134823 () SeekEntryResult!1355)

(assert (=> b!268244 (= res!132520 (or (= lt!134823 (MissingZero!1355 i!1267)) (= lt!134823 (MissingVacant!1355 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13095 (_ BitVec 32)) SeekEntryResult!1355)

(assert (=> b!268244 (= lt!134823 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268245 () Bool)

(assert (=> b!268245 (= e!173290 false)))

(declare-fun lt!134824 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13095 (_ BitVec 32)) Bool)

(assert (=> b!268245 (= lt!134824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268246 () Bool)

(declare-fun res!132523 () Bool)

(assert (=> b!268246 (=> (not res!132523) (not e!173289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268246 (= res!132523 (validKeyInArray!0 k!2581))))

(declare-fun b!268247 () Bool)

(declare-fun res!132525 () Bool)

(assert (=> b!268247 (=> (not res!132525) (not e!173289))))

(declare-datatypes ((List!4005 0))(
  ( (Nil!4002) (Cons!4001 (h!4668 (_ BitVec 64)) (t!9087 List!4005)) )
))
(declare-fun arrayNoDuplicates!0 (array!13095 (_ BitVec 32) List!4005) Bool)

(assert (=> b!268247 (= res!132525 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4002))))

(assert (= (and start!25998 res!132524) b!268242))

(assert (= (and b!268242 res!132522) b!268246))

(assert (= (and b!268246 res!132523) b!268247))

(assert (= (and b!268247 res!132525) b!268243))

(assert (= (and b!268243 res!132521) b!268244))

(assert (= (and b!268244 res!132520) b!268245))

(declare-fun m!284421 () Bool)

(assert (=> b!268247 m!284421))

(declare-fun m!284423 () Bool)

(assert (=> b!268244 m!284423))

(declare-fun m!284425 () Bool)

(assert (=> b!268243 m!284425))

(declare-fun m!284427 () Bool)

(assert (=> b!268246 m!284427))

(declare-fun m!284429 () Bool)

(assert (=> start!25998 m!284429))

(declare-fun m!284431 () Bool)

(assert (=> start!25998 m!284431))

(declare-fun m!284433 () Bool)

(assert (=> b!268245 m!284433))

(push 1)

