; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26168 () Bool)

(assert start!26168)

(declare-fun b!270269 () Bool)

(declare-fun res!134304 () Bool)

(declare-fun e!174230 () Bool)

(assert (=> b!270269 (=> (not res!134304) (not e!174230))))

(declare-datatypes ((array!13265 0))(
  ( (array!13266 (arr!6282 (Array (_ BitVec 32) (_ BitVec 64))) (size!6634 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13265)

(declare-datatypes ((List!4090 0))(
  ( (Nil!4087) (Cons!4086 (h!4753 (_ BitVec 64)) (t!9172 List!4090)) )
))
(declare-fun arrayNoDuplicates!0 (array!13265 (_ BitVec 32) List!4090) Bool)

(assert (=> b!270269 (= res!134304 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4087))))

(declare-fun b!270270 () Bool)

(declare-datatypes ((Unit!8425 0))(
  ( (Unit!8426) )
))
(declare-fun e!174227 () Unit!8425)

(declare-fun lt!135550 () Unit!8425)

(assert (=> b!270270 (= e!174227 lt!135550)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8425)

(assert (=> b!270270 (= lt!135550 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135548 () array!13265)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13265 (_ BitVec 32)) Bool)

(assert (=> b!270270 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135548 mask!3868)))

(declare-fun b!270271 () Bool)

(declare-fun res!134306 () Bool)

(assert (=> b!270271 (=> (not res!134306) (not e!174230))))

(declare-fun arrayContainsKey!0 (array!13265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270271 (= res!134306 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270272 () Bool)

(declare-fun e!174229 () Bool)

(declare-fun e!174226 () Bool)

(assert (=> b!270272 (= e!174229 e!174226)))

(declare-fun res!134303 () Bool)

(assert (=> b!270272 (=> (not res!134303) (not e!174226))))

(assert (=> b!270272 (= res!134303 (= startIndex!26 i!1267))))

(assert (=> b!270272 (= lt!135548 (array!13266 (store (arr!6282 a!3325) i!1267 k0!2581) (size!6634 a!3325)))))

(declare-fun b!270273 () Bool)

(declare-fun Unit!8427 () Unit!8425)

(assert (=> b!270273 (= e!174227 Unit!8427)))

(declare-fun res!134308 () Bool)

(assert (=> start!26168 (=> (not res!134308) (not e!174230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26168 (= res!134308 (validMask!0 mask!3868))))

(assert (=> start!26168 e!174230))

(declare-fun array_inv!4245 (array!13265) Bool)

(assert (=> start!26168 (array_inv!4245 a!3325)))

(assert (=> start!26168 true))

(declare-fun b!270274 () Bool)

(declare-fun res!134309 () Bool)

(assert (=> b!270274 (=> (not res!134309) (not e!174230))))

(assert (=> b!270274 (= res!134309 (and (= (size!6634 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6634 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6634 a!3325))))))

(declare-fun b!270275 () Bool)

(assert (=> b!270275 (= e!174226 (not true))))

(declare-datatypes ((SeekEntryResult!1440 0))(
  ( (MissingZero!1440 (index!7930 (_ BitVec 32))) (Found!1440 (index!7931 (_ BitVec 32))) (Intermediate!1440 (undefined!2252 Bool) (index!7932 (_ BitVec 32)) (x!26269 (_ BitVec 32))) (Undefined!1440) (MissingVacant!1440 (index!7933 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13265 (_ BitVec 32)) SeekEntryResult!1440)

(assert (=> b!270275 (= (seekEntryOrOpen!0 k0!2581 lt!135548 mask!3868) (Found!1440 i!1267))))

(declare-fun lt!135546 () Unit!8425)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8425)

(assert (=> b!270275 (= lt!135546 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135547 () Unit!8425)

(assert (=> b!270275 (= lt!135547 e!174227)))

(declare-fun c!45534 () Bool)

(assert (=> b!270275 (= c!45534 (bvslt startIndex!26 (bvsub (size!6634 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270276 () Bool)

(assert (=> b!270276 (= e!174230 e!174229)))

(declare-fun res!134305 () Bool)

(assert (=> b!270276 (=> (not res!134305) (not e!174229))))

(declare-fun lt!135549 () SeekEntryResult!1440)

(assert (=> b!270276 (= res!134305 (or (= lt!135549 (MissingZero!1440 i!1267)) (= lt!135549 (MissingVacant!1440 i!1267))))))

(assert (=> b!270276 (= lt!135549 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270277 () Bool)

(declare-fun res!134310 () Bool)

(assert (=> b!270277 (=> (not res!134310) (not e!174230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270277 (= res!134310 (validKeyInArray!0 k0!2581))))

(declare-fun b!270278 () Bool)

(declare-fun res!134307 () Bool)

(assert (=> b!270278 (=> (not res!134307) (not e!174229))))

(assert (=> b!270278 (= res!134307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26168 res!134308) b!270274))

(assert (= (and b!270274 res!134309) b!270277))

(assert (= (and b!270277 res!134310) b!270269))

(assert (= (and b!270269 res!134304) b!270271))

(assert (= (and b!270271 res!134306) b!270276))

(assert (= (and b!270276 res!134305) b!270278))

(assert (= (and b!270278 res!134307) b!270272))

(assert (= (and b!270272 res!134303) b!270275))

(assert (= (and b!270275 c!45534) b!270270))

(assert (= (and b!270275 (not c!45534)) b!270273))

(declare-fun m!285915 () Bool)

(assert (=> start!26168 m!285915))

(declare-fun m!285917 () Bool)

(assert (=> start!26168 m!285917))

(declare-fun m!285919 () Bool)

(assert (=> b!270269 m!285919))

(declare-fun m!285921 () Bool)

(assert (=> b!270277 m!285921))

(declare-fun m!285923 () Bool)

(assert (=> b!270275 m!285923))

(declare-fun m!285925 () Bool)

(assert (=> b!270275 m!285925))

(declare-fun m!285927 () Bool)

(assert (=> b!270271 m!285927))

(declare-fun m!285929 () Bool)

(assert (=> b!270276 m!285929))

(declare-fun m!285931 () Bool)

(assert (=> b!270278 m!285931))

(declare-fun m!285933 () Bool)

(assert (=> b!270272 m!285933))

(declare-fun m!285935 () Bool)

(assert (=> b!270270 m!285935))

(declare-fun m!285937 () Bool)

(assert (=> b!270270 m!285937))

(check-sat (not b!270269) (not b!270275) (not b!270278) (not b!270271) (not b!270270) (not b!270277) (not b!270276) (not start!26168))
(check-sat)
