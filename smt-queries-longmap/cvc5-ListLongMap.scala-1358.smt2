; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26706 () Bool)

(assert start!26706)

(declare-fun b!277268 () Bool)

(declare-fun res!141202 () Bool)

(declare-fun e!176981 () Bool)

(assert (=> b!277268 (=> (not res!141202) (not e!176981))))

(declare-datatypes ((array!13803 0))(
  ( (array!13804 (arr!6551 (Array (_ BitVec 32) (_ BitVec 64))) (size!6903 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13803)

(declare-datatypes ((List!4359 0))(
  ( (Nil!4356) (Cons!4355 (h!5022 (_ BitVec 64)) (t!9441 List!4359)) )
))
(declare-fun arrayNoDuplicates!0 (array!13803 (_ BitVec 32) List!4359) Bool)

(assert (=> b!277268 (= res!141202 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4356))))

(declare-fun b!277269 () Bool)

(declare-datatypes ((Unit!8728 0))(
  ( (Unit!8729) )
))
(declare-fun e!176984 () Unit!8728)

(declare-fun lt!137887 () Unit!8728)

(assert (=> b!277269 (= e!176984 lt!137887)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8728)

(assert (=> b!277269 (= lt!137887 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13803 (_ BitVec 32)) Bool)

(assert (=> b!277269 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13804 (store (arr!6551 a!3325) i!1267 k!2581) (size!6903 a!3325)) mask!3868)))

(declare-fun b!277270 () Bool)

(declare-fun res!141201 () Bool)

(assert (=> b!277270 (=> (not res!141201) (not e!176981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277270 (= res!141201 (validKeyInArray!0 k!2581))))

(declare-fun b!277271 () Bool)

(declare-fun res!141207 () Bool)

(assert (=> b!277271 (=> (not res!141207) (not e!176981))))

(declare-fun arrayContainsKey!0 (array!13803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277271 (= res!141207 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277272 () Bool)

(declare-fun Unit!8730 () Unit!8728)

(assert (=> b!277272 (= e!176984 Unit!8730)))

(declare-fun res!141203 () Bool)

(assert (=> start!26706 (=> (not res!141203) (not e!176981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26706 (= res!141203 (validMask!0 mask!3868))))

(assert (=> start!26706 e!176981))

(declare-fun array_inv!4514 (array!13803) Bool)

(assert (=> start!26706 (array_inv!4514 a!3325)))

(assert (=> start!26706 true))

(declare-fun b!277273 () Bool)

(declare-fun res!141206 () Bool)

(declare-fun e!176983 () Bool)

(assert (=> b!277273 (=> (not res!141206) (not e!176983))))

(assert (=> b!277273 (= res!141206 (= startIndex!26 i!1267))))

(declare-fun b!277274 () Bool)

(assert (=> b!277274 (= e!176983 false)))

(declare-fun lt!137886 () Unit!8728)

(assert (=> b!277274 (= lt!137886 e!176984)))

(declare-fun c!45585 () Bool)

(assert (=> b!277274 (= c!45585 (bvslt startIndex!26 (bvsub (size!6903 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277275 () Bool)

(declare-fun res!141200 () Bool)

(assert (=> b!277275 (=> (not res!141200) (not e!176983))))

(assert (=> b!277275 (= res!141200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277276 () Bool)

(declare-fun res!141204 () Bool)

(assert (=> b!277276 (=> (not res!141204) (not e!176981))))

(assert (=> b!277276 (= res!141204 (and (= (size!6903 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6903 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6903 a!3325))))))

(declare-fun b!277277 () Bool)

(assert (=> b!277277 (= e!176981 e!176983)))

(declare-fun res!141205 () Bool)

(assert (=> b!277277 (=> (not res!141205) (not e!176983))))

(declare-datatypes ((SeekEntryResult!1709 0))(
  ( (MissingZero!1709 (index!9006 (_ BitVec 32))) (Found!1709 (index!9007 (_ BitVec 32))) (Intermediate!1709 (undefined!2521 Bool) (index!9008 (_ BitVec 32)) (x!27258 (_ BitVec 32))) (Undefined!1709) (MissingVacant!1709 (index!9009 (_ BitVec 32))) )
))
(declare-fun lt!137885 () SeekEntryResult!1709)

(assert (=> b!277277 (= res!141205 (or (= lt!137885 (MissingZero!1709 i!1267)) (= lt!137885 (MissingVacant!1709 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13803 (_ BitVec 32)) SeekEntryResult!1709)

(assert (=> b!277277 (= lt!137885 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26706 res!141203) b!277276))

(assert (= (and b!277276 res!141204) b!277270))

(assert (= (and b!277270 res!141201) b!277268))

(assert (= (and b!277268 res!141202) b!277271))

(assert (= (and b!277271 res!141207) b!277277))

(assert (= (and b!277277 res!141205) b!277275))

(assert (= (and b!277275 res!141200) b!277273))

(assert (= (and b!277273 res!141206) b!277274))

(assert (= (and b!277274 c!45585) b!277269))

(assert (= (and b!277274 (not c!45585)) b!277272))

(declare-fun m!292371 () Bool)

(assert (=> start!26706 m!292371))

(declare-fun m!292373 () Bool)

(assert (=> start!26706 m!292373))

(declare-fun m!292375 () Bool)

(assert (=> b!277271 m!292375))

(declare-fun m!292377 () Bool)

(assert (=> b!277268 m!292377))

(declare-fun m!292379 () Bool)

(assert (=> b!277269 m!292379))

(declare-fun m!292381 () Bool)

(assert (=> b!277269 m!292381))

(declare-fun m!292383 () Bool)

(assert (=> b!277269 m!292383))

(declare-fun m!292385 () Bool)

(assert (=> b!277275 m!292385))

(declare-fun m!292387 () Bool)

(assert (=> b!277277 m!292387))

(declare-fun m!292389 () Bool)

(assert (=> b!277270 m!292389))

(push 1)

