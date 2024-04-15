; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26616 () Bool)

(assert start!26616)

(declare-fun b!276159 () Bool)

(declare-fun e!176439 () Bool)

(declare-fun e!176438 () Bool)

(assert (=> b!276159 (= e!176439 e!176438)))

(declare-fun res!140202 () Bool)

(assert (=> b!276159 (=> (not res!140202) (not e!176438))))

(declare-datatypes ((SeekEntryResult!1657 0))(
  ( (MissingZero!1657 (index!8798 (_ BitVec 32))) (Found!1657 (index!8799 (_ BitVec 32))) (Intermediate!1657 (undefined!2469 Bool) (index!8800 (_ BitVec 32)) (x!27077 (_ BitVec 32))) (Undefined!1657) (MissingVacant!1657 (index!8801 (_ BitVec 32))) )
))
(declare-fun lt!137418 () SeekEntryResult!1657)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276159 (= res!140202 (or (= lt!137418 (MissingZero!1657 i!1267)) (= lt!137418 (MissingVacant!1657 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13702 0))(
  ( (array!13703 (arr!6500 (Array (_ BitVec 32) (_ BitVec 64))) (size!6853 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13702)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13702 (_ BitVec 32)) SeekEntryResult!1657)

(assert (=> b!276159 (= lt!137418 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276160 () Bool)

(declare-fun res!140201 () Bool)

(assert (=> b!276160 (=> (not res!140201) (not e!176439))))

(declare-fun arrayContainsKey!0 (array!13702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276160 (= res!140201 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276161 () Bool)

(declare-fun res!140204 () Bool)

(assert (=> b!276161 (=> (not res!140204) (not e!176439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276161 (= res!140204 (validKeyInArray!0 k!2581))))

(declare-fun res!140206 () Bool)

(assert (=> start!26616 (=> (not res!140206) (not e!176439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26616 (= res!140206 (validMask!0 mask!3868))))

(assert (=> start!26616 e!176439))

(declare-fun array_inv!4472 (array!13702) Bool)

(assert (=> start!26616 (array_inv!4472 a!3325)))

(assert (=> start!26616 true))

(declare-fun b!276162 () Bool)

(declare-fun res!140205 () Bool)

(assert (=> b!276162 (=> (not res!140205) (not e!176439))))

(declare-datatypes ((List!4281 0))(
  ( (Nil!4278) (Cons!4277 (h!4944 (_ BitVec 64)) (t!9354 List!4281)) )
))
(declare-fun arrayNoDuplicates!0 (array!13702 (_ BitVec 32) List!4281) Bool)

(assert (=> b!276162 (= res!140205 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4278))))

(declare-fun b!276163 () Bool)

(declare-fun res!140203 () Bool)

(assert (=> b!276163 (=> (not res!140203) (not e!176439))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276163 (= res!140203 (and (= (size!6853 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6853 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6853 a!3325))))))

(declare-fun b!276164 () Bool)

(assert (=> b!276164 (= e!176438 false)))

(declare-fun lt!137417 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13702 (_ BitVec 32)) Bool)

(assert (=> b!276164 (= lt!137417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26616 res!140206) b!276163))

(assert (= (and b!276163 res!140203) b!276161))

(assert (= (and b!276161 res!140204) b!276162))

(assert (= (and b!276162 res!140205) b!276160))

(assert (= (and b!276160 res!140201) b!276159))

(assert (= (and b!276159 res!140202) b!276164))

(declare-fun m!291081 () Bool)

(assert (=> b!276160 m!291081))

(declare-fun m!291083 () Bool)

(assert (=> b!276159 m!291083))

(declare-fun m!291085 () Bool)

(assert (=> start!26616 m!291085))

(declare-fun m!291087 () Bool)

(assert (=> start!26616 m!291087))

(declare-fun m!291089 () Bool)

(assert (=> b!276162 m!291089))

(declare-fun m!291091 () Bool)

(assert (=> b!276161 m!291091))

(declare-fun m!291093 () Bool)

(assert (=> b!276164 m!291093))

(push 1)

(assert (not b!276161))

(assert (not b!276162))

(assert (not b!276159))

(assert (not b!276164))

(assert (not b!276160))

(assert (not start!26616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

