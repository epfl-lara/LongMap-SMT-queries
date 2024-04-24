; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25972 () Bool)

(assert start!25972)

(declare-fun b!268083 () Bool)

(declare-fun e!173225 () Bool)

(assert (=> b!268083 (= e!173225 false)))

(declare-datatypes ((SeekEntryResult!1306 0))(
  ( (MissingZero!1306 (index!7394 (_ BitVec 32))) (Found!1306 (index!7395 (_ BitVec 32))) (Intermediate!1306 (undefined!2118 Bool) (index!7396 (_ BitVec 32)) (x!25871 (_ BitVec 32))) (Undefined!1306) (MissingVacant!1306 (index!7397 (_ BitVec 32))) )
))
(declare-fun lt!134832 () SeekEntryResult!1306)

(declare-datatypes ((array!13068 0))(
  ( (array!13069 (arr!6183 (Array (_ BitVec 32) (_ BitVec 64))) (size!6535 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13068)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13068 (_ BitVec 32)) SeekEntryResult!1306)

(assert (=> b!268083 (= lt!134832 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268084 () Bool)

(declare-fun res!132338 () Bool)

(assert (=> b!268084 (=> (not res!132338) (not e!173225))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268084 (= res!132338 (and (= (size!6535 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6535 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6535 a!3325))))))

(declare-fun b!268085 () Bool)

(declare-fun res!132339 () Bool)

(assert (=> b!268085 (=> (not res!132339) (not e!173225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268085 (= res!132339 (validKeyInArray!0 k!2581))))

(declare-fun b!268086 () Bool)

(declare-fun res!132337 () Bool)

(assert (=> b!268086 (=> (not res!132337) (not e!173225))))

(declare-fun arrayContainsKey!0 (array!13068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268086 (= res!132337 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132335 () Bool)

(assert (=> start!25972 (=> (not res!132335) (not e!173225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25972 (= res!132335 (validMask!0 mask!3868))))

(assert (=> start!25972 e!173225))

(declare-fun array_inv!4133 (array!13068) Bool)

(assert (=> start!25972 (array_inv!4133 a!3325)))

(assert (=> start!25972 true))

(declare-fun b!268087 () Bool)

(declare-fun res!132336 () Bool)

(assert (=> b!268087 (=> (not res!132336) (not e!173225))))

(declare-datatypes ((List!3904 0))(
  ( (Nil!3901) (Cons!3900 (h!4567 (_ BitVec 64)) (t!8978 List!3904)) )
))
(declare-fun arrayNoDuplicates!0 (array!13068 (_ BitVec 32) List!3904) Bool)

(assert (=> b!268087 (= res!132336 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3901))))

(assert (= (and start!25972 res!132335) b!268084))

(assert (= (and b!268084 res!132338) b!268085))

(assert (= (and b!268085 res!132339) b!268087))

(assert (= (and b!268087 res!132336) b!268086))

(assert (= (and b!268086 res!132337) b!268083))

(declare-fun m!284465 () Bool)

(assert (=> start!25972 m!284465))

(declare-fun m!284467 () Bool)

(assert (=> start!25972 m!284467))

(declare-fun m!284469 () Bool)

(assert (=> b!268086 m!284469))

(declare-fun m!284471 () Bool)

(assert (=> b!268083 m!284471))

(declare-fun m!284473 () Bool)

(assert (=> b!268087 m!284473))

(declare-fun m!284475 () Bool)

(assert (=> b!268085 m!284475))

(push 1)

(assert (not b!268083))

(assert (not b!268087))

(assert (not start!25972))

(assert (not b!268086))

(assert (not b!268085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

