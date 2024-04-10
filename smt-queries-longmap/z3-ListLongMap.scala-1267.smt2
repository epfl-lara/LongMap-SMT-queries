; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26162 () Bool)

(assert start!26162)

(declare-fun b!270179 () Bool)

(declare-fun res!134235 () Bool)

(declare-fun e!174185 () Bool)

(assert (=> b!270179 (=> (not res!134235) (not e!174185))))

(declare-datatypes ((array!13259 0))(
  ( (array!13260 (arr!6279 (Array (_ BitVec 32) (_ BitVec 64))) (size!6631 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13259)

(declare-datatypes ((List!4087 0))(
  ( (Nil!4084) (Cons!4083 (h!4750 (_ BitVec 64)) (t!9169 List!4087)) )
))
(declare-fun arrayNoDuplicates!0 (array!13259 (_ BitVec 32) List!4087) Bool)

(assert (=> b!270179 (= res!134235 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4084))))

(declare-fun b!270180 () Bool)

(declare-datatypes ((Unit!8416 0))(
  ( (Unit!8417) )
))
(declare-fun e!174184 () Unit!8416)

(declare-fun Unit!8418 () Unit!8416)

(assert (=> b!270180 (= e!174184 Unit!8418)))

(declare-fun b!270181 () Bool)

(declare-fun res!134236 () Bool)

(declare-fun e!174183 () Bool)

(assert (=> b!270181 (=> (not res!134236) (not e!174183))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13259 (_ BitVec 32)) Bool)

(assert (=> b!270181 (= res!134236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270182 () Bool)

(declare-fun res!134233 () Bool)

(assert (=> b!270182 (=> (not res!134233) (not e!174185))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270182 (= res!134233 (validKeyInArray!0 k0!2581))))

(declare-fun b!270183 () Bool)

(declare-fun e!174181 () Bool)

(assert (=> b!270183 (= e!174181 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!135505 () array!13259)

(declare-datatypes ((SeekEntryResult!1437 0))(
  ( (MissingZero!1437 (index!7918 (_ BitVec 32))) (Found!1437 (index!7919 (_ BitVec 32))) (Intermediate!1437 (undefined!2249 Bool) (index!7920 (_ BitVec 32)) (x!26258 (_ BitVec 32))) (Undefined!1437) (MissingVacant!1437 (index!7921 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13259 (_ BitVec 32)) SeekEntryResult!1437)

(assert (=> b!270183 (= (seekEntryOrOpen!0 k0!2581 lt!135505 mask!3868) (Found!1437 i!1267))))

(declare-fun lt!135501 () Unit!8416)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8416)

(assert (=> b!270183 (= lt!135501 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135503 () Unit!8416)

(assert (=> b!270183 (= lt!135503 e!174184)))

(declare-fun c!45525 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270183 (= c!45525 (bvslt startIndex!26 (bvsub (size!6631 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270184 () Bool)

(declare-fun res!134234 () Bool)

(assert (=> b!270184 (=> (not res!134234) (not e!174185))))

(declare-fun arrayContainsKey!0 (array!13259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270184 (= res!134234 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270185 () Bool)

(declare-fun res!134238 () Bool)

(assert (=> b!270185 (=> (not res!134238) (not e!174185))))

(assert (=> b!270185 (= res!134238 (and (= (size!6631 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6631 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6631 a!3325))))))

(declare-fun res!134232 () Bool)

(assert (=> start!26162 (=> (not res!134232) (not e!174185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26162 (= res!134232 (validMask!0 mask!3868))))

(assert (=> start!26162 e!174185))

(declare-fun array_inv!4242 (array!13259) Bool)

(assert (=> start!26162 (array_inv!4242 a!3325)))

(assert (=> start!26162 true))

(declare-fun b!270186 () Bool)

(declare-fun lt!135504 () Unit!8416)

(assert (=> b!270186 (= e!174184 lt!135504)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8416)

(assert (=> b!270186 (= lt!135504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135505 mask!3868)))

(declare-fun b!270187 () Bool)

(assert (=> b!270187 (= e!174183 e!174181)))

(declare-fun res!134237 () Bool)

(assert (=> b!270187 (=> (not res!134237) (not e!174181))))

(assert (=> b!270187 (= res!134237 (= startIndex!26 i!1267))))

(assert (=> b!270187 (= lt!135505 (array!13260 (store (arr!6279 a!3325) i!1267 k0!2581) (size!6631 a!3325)))))

(declare-fun b!270188 () Bool)

(assert (=> b!270188 (= e!174185 e!174183)))

(declare-fun res!134231 () Bool)

(assert (=> b!270188 (=> (not res!134231) (not e!174183))))

(declare-fun lt!135502 () SeekEntryResult!1437)

(assert (=> b!270188 (= res!134231 (or (= lt!135502 (MissingZero!1437 i!1267)) (= lt!135502 (MissingVacant!1437 i!1267))))))

(assert (=> b!270188 (= lt!135502 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26162 res!134232) b!270185))

(assert (= (and b!270185 res!134238) b!270182))

(assert (= (and b!270182 res!134233) b!270179))

(assert (= (and b!270179 res!134235) b!270184))

(assert (= (and b!270184 res!134234) b!270188))

(assert (= (and b!270188 res!134231) b!270181))

(assert (= (and b!270181 res!134236) b!270187))

(assert (= (and b!270187 res!134237) b!270183))

(assert (= (and b!270183 c!45525) b!270186))

(assert (= (and b!270183 (not c!45525)) b!270180))

(declare-fun m!285843 () Bool)

(assert (=> b!270182 m!285843))

(declare-fun m!285845 () Bool)

(assert (=> start!26162 m!285845))

(declare-fun m!285847 () Bool)

(assert (=> start!26162 m!285847))

(declare-fun m!285849 () Bool)

(assert (=> b!270179 m!285849))

(declare-fun m!285851 () Bool)

(assert (=> b!270181 m!285851))

(declare-fun m!285853 () Bool)

(assert (=> b!270183 m!285853))

(declare-fun m!285855 () Bool)

(assert (=> b!270183 m!285855))

(declare-fun m!285857 () Bool)

(assert (=> b!270187 m!285857))

(declare-fun m!285859 () Bool)

(assert (=> b!270188 m!285859))

(declare-fun m!285861 () Bool)

(assert (=> b!270186 m!285861))

(declare-fun m!285863 () Bool)

(assert (=> b!270186 m!285863))

(declare-fun m!285865 () Bool)

(assert (=> b!270184 m!285865))

(check-sat (not b!270182) (not b!270179) (not b!270181) (not start!26162) (not b!270188) (not b!270183) (not b!270184) (not b!270186))
(check-sat)
