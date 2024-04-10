; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26704 () Bool)

(assert start!26704)

(declare-fun b!277238 () Bool)

(declare-datatypes ((Unit!8725 0))(
  ( (Unit!8726) )
))
(declare-fun e!176971 () Unit!8725)

(declare-fun lt!137876 () Unit!8725)

(assert (=> b!277238 (= e!176971 lt!137876)))

(declare-datatypes ((array!13801 0))(
  ( (array!13802 (arr!6550 (Array (_ BitVec 32) (_ BitVec 64))) (size!6902 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13801)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8725)

(assert (=> b!277238 (= lt!137876 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13801 (_ BitVec 32)) Bool)

(assert (=> b!277238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13802 (store (arr!6550 a!3325) i!1267 k!2581) (size!6902 a!3325)) mask!3868)))

(declare-fun b!277239 () Bool)

(declare-fun res!141182 () Bool)

(declare-fun e!176970 () Bool)

(assert (=> b!277239 (=> (not res!141182) (not e!176970))))

(assert (=> b!277239 (= res!141182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277240 () Bool)

(declare-fun e!176972 () Bool)

(assert (=> b!277240 (= e!176972 e!176970)))

(declare-fun res!141180 () Bool)

(assert (=> b!277240 (=> (not res!141180) (not e!176970))))

(declare-datatypes ((SeekEntryResult!1708 0))(
  ( (MissingZero!1708 (index!9002 (_ BitVec 32))) (Found!1708 (index!9003 (_ BitVec 32))) (Intermediate!1708 (undefined!2520 Bool) (index!9004 (_ BitVec 32)) (x!27249 (_ BitVec 32))) (Undefined!1708) (MissingVacant!1708 (index!9005 (_ BitVec 32))) )
))
(declare-fun lt!137877 () SeekEntryResult!1708)

(assert (=> b!277240 (= res!141180 (or (= lt!137877 (MissingZero!1708 i!1267)) (= lt!137877 (MissingVacant!1708 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13801 (_ BitVec 32)) SeekEntryResult!1708)

(assert (=> b!277240 (= lt!137877 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277241 () Bool)

(declare-fun res!141177 () Bool)

(assert (=> b!277241 (=> (not res!141177) (not e!176970))))

(assert (=> b!277241 (= res!141177 (= startIndex!26 i!1267))))

(declare-fun b!277242 () Bool)

(assert (=> b!277242 (= e!176970 false)))

(declare-fun lt!137878 () Unit!8725)

(assert (=> b!277242 (= lt!137878 e!176971)))

(declare-fun c!45582 () Bool)

(assert (=> b!277242 (= c!45582 (bvslt startIndex!26 (bvsub (size!6902 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141176 () Bool)

(assert (=> start!26704 (=> (not res!141176) (not e!176972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26704 (= res!141176 (validMask!0 mask!3868))))

(assert (=> start!26704 e!176972))

(declare-fun array_inv!4513 (array!13801) Bool)

(assert (=> start!26704 (array_inv!4513 a!3325)))

(assert (=> start!26704 true))

(declare-fun b!277243 () Bool)

(declare-fun res!141179 () Bool)

(assert (=> b!277243 (=> (not res!141179) (not e!176972))))

(assert (=> b!277243 (= res!141179 (and (= (size!6902 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6902 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6902 a!3325))))))

(declare-fun b!277244 () Bool)

(declare-fun Unit!8727 () Unit!8725)

(assert (=> b!277244 (= e!176971 Unit!8727)))

(declare-fun b!277245 () Bool)

(declare-fun res!141178 () Bool)

(assert (=> b!277245 (=> (not res!141178) (not e!176972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277245 (= res!141178 (validKeyInArray!0 k!2581))))

(declare-fun b!277246 () Bool)

(declare-fun res!141183 () Bool)

(assert (=> b!277246 (=> (not res!141183) (not e!176972))))

(declare-fun arrayContainsKey!0 (array!13801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277246 (= res!141183 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277247 () Bool)

(declare-fun res!141181 () Bool)

(assert (=> b!277247 (=> (not res!141181) (not e!176972))))

(declare-datatypes ((List!4358 0))(
  ( (Nil!4355) (Cons!4354 (h!5021 (_ BitVec 64)) (t!9440 List!4358)) )
))
(declare-fun arrayNoDuplicates!0 (array!13801 (_ BitVec 32) List!4358) Bool)

(assert (=> b!277247 (= res!141181 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4355))))

(assert (= (and start!26704 res!141176) b!277243))

(assert (= (and b!277243 res!141179) b!277245))

(assert (= (and b!277245 res!141178) b!277247))

(assert (= (and b!277247 res!141181) b!277246))

(assert (= (and b!277246 res!141183) b!277240))

(assert (= (and b!277240 res!141180) b!277239))

(assert (= (and b!277239 res!141182) b!277241))

(assert (= (and b!277241 res!141177) b!277242))

(assert (= (and b!277242 c!45582) b!277238))

(assert (= (and b!277242 (not c!45582)) b!277244))

(declare-fun m!292351 () Bool)

(assert (=> start!26704 m!292351))

(declare-fun m!292353 () Bool)

(assert (=> start!26704 m!292353))

(declare-fun m!292355 () Bool)

(assert (=> b!277247 m!292355))

(declare-fun m!292357 () Bool)

(assert (=> b!277245 m!292357))

(declare-fun m!292359 () Bool)

(assert (=> b!277246 m!292359))

(declare-fun m!292361 () Bool)

(assert (=> b!277240 m!292361))

(declare-fun m!292363 () Bool)

(assert (=> b!277239 m!292363))

(declare-fun m!292365 () Bool)

(assert (=> b!277238 m!292365))

(declare-fun m!292367 () Bool)

(assert (=> b!277238 m!292367))

(declare-fun m!292369 () Bool)

(assert (=> b!277238 m!292369))

(push 1)

(assert (not b!277239))

(assert (not b!277247))

(assert (not b!277246))

(assert (not b!277238))

(assert (not b!277240))

(assert (not b!277245))

(assert (not start!26704))

(check-sat)

