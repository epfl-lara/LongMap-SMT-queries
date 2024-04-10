; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25966 () Bool)

(assert start!25966)

(declare-fun b!267991 () Bool)

(declare-fun res!132270 () Bool)

(declare-fun e!173183 () Bool)

(assert (=> b!267991 (=> (not res!132270) (not e!173183))))

(declare-datatypes ((array!13063 0))(
  ( (array!13064 (arr!6181 (Array (_ BitVec 32) (_ BitVec 64))) (size!6533 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13063)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267991 (= res!132270 (and (= (size!6533 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6533 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6533 a!3325))))))

(declare-fun b!267992 () Bool)

(assert (=> b!267992 (= e!173183 false)))

(declare-datatypes ((SeekEntryResult!1339 0))(
  ( (MissingZero!1339 (index!7526 (_ BitVec 32))) (Found!1339 (index!7527 (_ BitVec 32))) (Intermediate!1339 (undefined!2151 Bool) (index!7528 (_ BitVec 32)) (x!25896 (_ BitVec 32))) (Undefined!1339) (MissingVacant!1339 (index!7529 (_ BitVec 32))) )
))
(declare-fun lt!134764 () SeekEntryResult!1339)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13063 (_ BitVec 32)) SeekEntryResult!1339)

(assert (=> b!267992 (= lt!134764 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267993 () Bool)

(declare-fun res!132269 () Bool)

(assert (=> b!267993 (=> (not res!132269) (not e!173183))))

(declare-fun arrayContainsKey!0 (array!13063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267993 (= res!132269 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267994 () Bool)

(declare-fun res!132271 () Bool)

(assert (=> b!267994 (=> (not res!132271) (not e!173183))))

(declare-datatypes ((List!3989 0))(
  ( (Nil!3986) (Cons!3985 (h!4652 (_ BitVec 64)) (t!9071 List!3989)) )
))
(declare-fun arrayNoDuplicates!0 (array!13063 (_ BitVec 32) List!3989) Bool)

(assert (=> b!267994 (= res!132271 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3986))))

(declare-fun b!267995 () Bool)

(declare-fun res!132273 () Bool)

(assert (=> b!267995 (=> (not res!132273) (not e!173183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267995 (= res!132273 (validKeyInArray!0 k!2581))))

(declare-fun res!132272 () Bool)

(assert (=> start!25966 (=> (not res!132272) (not e!173183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25966 (= res!132272 (validMask!0 mask!3868))))

(assert (=> start!25966 e!173183))

(declare-fun array_inv!4144 (array!13063) Bool)

(assert (=> start!25966 (array_inv!4144 a!3325)))

(assert (=> start!25966 true))

(assert (= (and start!25966 res!132272) b!267991))

(assert (= (and b!267991 res!132270) b!267995))

(assert (= (and b!267995 res!132273) b!267994))

(assert (= (and b!267994 res!132271) b!267993))

(assert (= (and b!267993 res!132269) b!267992))

(declare-fun m!284223 () Bool)

(assert (=> start!25966 m!284223))

(declare-fun m!284225 () Bool)

(assert (=> start!25966 m!284225))

(declare-fun m!284227 () Bool)

(assert (=> b!267993 m!284227))

(declare-fun m!284229 () Bool)

(assert (=> b!267995 m!284229))

(declare-fun m!284231 () Bool)

(assert (=> b!267994 m!284231))

(declare-fun m!284233 () Bool)

(assert (=> b!267992 m!284233))

(push 1)

(assert (not b!267992))

(assert (not b!267994))

(assert (not b!267993))

(assert (not start!25966))

(assert (not b!267995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

