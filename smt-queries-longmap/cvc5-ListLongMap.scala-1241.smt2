; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26004 () Bool)

(assert start!26004)

(declare-fun b!268296 () Bool)

(declare-fun e!173316 () Bool)

(assert (=> b!268296 (= e!173316 false)))

(declare-fun lt!134841 () Bool)

(declare-datatypes ((array!13101 0))(
  ( (array!13102 (arr!6200 (Array (_ BitVec 32) (_ BitVec 64))) (size!6552 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13101)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13101 (_ BitVec 32)) Bool)

(assert (=> b!268296 (= lt!134841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268297 () Bool)

(declare-fun res!132574 () Bool)

(declare-fun e!173318 () Bool)

(assert (=> b!268297 (=> (not res!132574) (not e!173318))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268297 (= res!132574 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268298 () Bool)

(declare-fun res!132579 () Bool)

(assert (=> b!268298 (=> (not res!132579) (not e!173318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268298 (= res!132579 (validKeyInArray!0 k!2581))))

(declare-fun res!132575 () Bool)

(assert (=> start!26004 (=> (not res!132575) (not e!173318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26004 (= res!132575 (validMask!0 mask!3868))))

(assert (=> start!26004 e!173318))

(declare-fun array_inv!4163 (array!13101) Bool)

(assert (=> start!26004 (array_inv!4163 a!3325)))

(assert (=> start!26004 true))

(declare-fun b!268299 () Bool)

(declare-fun res!132578 () Bool)

(assert (=> b!268299 (=> (not res!132578) (not e!173318))))

(declare-datatypes ((List!4008 0))(
  ( (Nil!4005) (Cons!4004 (h!4671 (_ BitVec 64)) (t!9090 List!4008)) )
))
(declare-fun arrayNoDuplicates!0 (array!13101 (_ BitVec 32) List!4008) Bool)

(assert (=> b!268299 (= res!132578 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4005))))

(declare-fun b!268300 () Bool)

(assert (=> b!268300 (= e!173318 e!173316)))

(declare-fun res!132576 () Bool)

(assert (=> b!268300 (=> (not res!132576) (not e!173316))))

(declare-datatypes ((SeekEntryResult!1358 0))(
  ( (MissingZero!1358 (index!7602 (_ BitVec 32))) (Found!1358 (index!7603 (_ BitVec 32))) (Intermediate!1358 (undefined!2170 Bool) (index!7604 (_ BitVec 32)) (x!25971 (_ BitVec 32))) (Undefined!1358) (MissingVacant!1358 (index!7605 (_ BitVec 32))) )
))
(declare-fun lt!134842 () SeekEntryResult!1358)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268300 (= res!132576 (or (= lt!134842 (MissingZero!1358 i!1267)) (= lt!134842 (MissingVacant!1358 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13101 (_ BitVec 32)) SeekEntryResult!1358)

(assert (=> b!268300 (= lt!134842 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268301 () Bool)

(declare-fun res!132577 () Bool)

(assert (=> b!268301 (=> (not res!132577) (not e!173318))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268301 (= res!132577 (and (= (size!6552 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6552 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6552 a!3325))))))

(assert (= (and start!26004 res!132575) b!268301))

(assert (= (and b!268301 res!132577) b!268298))

(assert (= (and b!268298 res!132579) b!268299))

(assert (= (and b!268299 res!132578) b!268297))

(assert (= (and b!268297 res!132574) b!268300))

(assert (= (and b!268300 res!132576) b!268296))

(declare-fun m!284463 () Bool)

(assert (=> b!268296 m!284463))

(declare-fun m!284465 () Bool)

(assert (=> b!268299 m!284465))

(declare-fun m!284467 () Bool)

(assert (=> b!268300 m!284467))

(declare-fun m!284469 () Bool)

(assert (=> b!268298 m!284469))

(declare-fun m!284471 () Bool)

(assert (=> start!26004 m!284471))

(declare-fun m!284473 () Bool)

(assert (=> start!26004 m!284473))

(declare-fun m!284475 () Bool)

(assert (=> b!268297 m!284475))

(push 1)

