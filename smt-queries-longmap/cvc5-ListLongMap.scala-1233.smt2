; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25960 () Bool)

(assert start!25960)

(declare-fun b!267993 () Bool)

(declare-fun res!132246 () Bool)

(declare-fun e!173188 () Bool)

(assert (=> b!267993 (=> (not res!132246) (not e!173188))))

(declare-datatypes ((array!13056 0))(
  ( (array!13057 (arr!6177 (Array (_ BitVec 32) (_ BitVec 64))) (size!6529 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13056)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267993 (= res!132246 (and (= (size!6529 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6529 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6529 a!3325))))))

(declare-fun b!267994 () Bool)

(declare-fun res!132249 () Bool)

(assert (=> b!267994 (=> (not res!132249) (not e!173188))))

(declare-datatypes ((List!3898 0))(
  ( (Nil!3895) (Cons!3894 (h!4561 (_ BitVec 64)) (t!8972 List!3898)) )
))
(declare-fun arrayNoDuplicates!0 (array!13056 (_ BitVec 32) List!3898) Bool)

(assert (=> b!267994 (= res!132249 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3895))))

(declare-fun b!267995 () Bool)

(declare-fun res!132245 () Bool)

(assert (=> b!267995 (=> (not res!132245) (not e!173188))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267995 (= res!132245 (validKeyInArray!0 k!2581))))

(declare-fun b!267996 () Bool)

(assert (=> b!267996 (= e!173188 false)))

(declare-datatypes ((SeekEntryResult!1300 0))(
  ( (MissingZero!1300 (index!7370 (_ BitVec 32))) (Found!1300 (index!7371 (_ BitVec 32))) (Intermediate!1300 (undefined!2112 Bool) (index!7372 (_ BitVec 32)) (x!25849 (_ BitVec 32))) (Undefined!1300) (MissingVacant!1300 (index!7373 (_ BitVec 32))) )
))
(declare-fun lt!134814 () SeekEntryResult!1300)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13056 (_ BitVec 32)) SeekEntryResult!1300)

(assert (=> b!267996 (= lt!134814 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267997 () Bool)

(declare-fun res!132247 () Bool)

(assert (=> b!267997 (=> (not res!132247) (not e!173188))))

(declare-fun arrayContainsKey!0 (array!13056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267997 (= res!132247 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132248 () Bool)

(assert (=> start!25960 (=> (not res!132248) (not e!173188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25960 (= res!132248 (validMask!0 mask!3868))))

(assert (=> start!25960 e!173188))

(declare-fun array_inv!4127 (array!13056) Bool)

(assert (=> start!25960 (array_inv!4127 a!3325)))

(assert (=> start!25960 true))

(assert (= (and start!25960 res!132248) b!267993))

(assert (= (and b!267993 res!132246) b!267995))

(assert (= (and b!267995 res!132245) b!267994))

(assert (= (and b!267994 res!132249) b!267997))

(assert (= (and b!267997 res!132247) b!267996))

(declare-fun m!284393 () Bool)

(assert (=> b!267995 m!284393))

(declare-fun m!284395 () Bool)

(assert (=> b!267997 m!284395))

(declare-fun m!284397 () Bool)

(assert (=> b!267996 m!284397))

(declare-fun m!284399 () Bool)

(assert (=> start!25960 m!284399))

(declare-fun m!284401 () Bool)

(assert (=> start!25960 m!284401))

(declare-fun m!284403 () Bool)

(assert (=> b!267994 m!284403))

(push 1)

(assert (not b!267996))

(assert (not b!267995))

(assert (not b!267994))

(assert (not start!25960))

(assert (not b!267997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

