; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26300 () Bool)

(assert start!26300)

(declare-fun b!272295 () Bool)

(declare-fun res!136345 () Bool)

(declare-fun e!174755 () Bool)

(assert (=> b!272295 (=> (not res!136345) (not e!174755))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272295 (= res!136345 (validKeyInArray!0 k0!2581))))

(declare-fun res!136343 () Bool)

(assert (=> start!26300 (=> (not res!136343) (not e!174755))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26300 (= res!136343 (validMask!0 mask!3868))))

(assert (=> start!26300 e!174755))

(declare-datatypes ((array!13386 0))(
  ( (array!13387 (arr!6342 (Array (_ BitVec 32) (_ BitVec 64))) (size!6695 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13386)

(declare-fun array_inv!4314 (array!13386) Bool)

(assert (=> start!26300 (array_inv!4314 a!3325)))

(assert (=> start!26300 true))

(declare-fun b!272296 () Bool)

(declare-fun res!136339 () Bool)

(assert (=> b!272296 (=> (not res!136339) (not e!174755))))

(declare-fun arrayContainsKey!0 (array!13386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272296 (= res!136339 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272297 () Bool)

(declare-fun e!174756 () Bool)

(assert (=> b!272297 (= e!174755 e!174756)))

(declare-fun res!136341 () Bool)

(assert (=> b!272297 (=> (not res!136341) (not e!174756))))

(declare-datatypes ((SeekEntryResult!1499 0))(
  ( (MissingZero!1499 (index!8166 (_ BitVec 32))) (Found!1499 (index!8167 (_ BitVec 32))) (Intermediate!1499 (undefined!2311 Bool) (index!8168 (_ BitVec 32)) (x!26503 (_ BitVec 32))) (Undefined!1499) (MissingVacant!1499 (index!8169 (_ BitVec 32))) )
))
(declare-fun lt!135822 () SeekEntryResult!1499)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272297 (= res!136341 (or (= lt!135822 (MissingZero!1499 i!1267)) (= lt!135822 (MissingVacant!1499 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13386 (_ BitVec 32)) SeekEntryResult!1499)

(assert (=> b!272297 (= lt!135822 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272298 () Bool)

(declare-fun res!136342 () Bool)

(assert (=> b!272298 (=> (not res!136342) (not e!174756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13386 (_ BitVec 32)) Bool)

(assert (=> b!272298 (= res!136342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272299 () Bool)

(declare-fun res!136338 () Bool)

(assert (=> b!272299 (=> (not res!136338) (not e!174756))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272299 (= res!136338 (not (= startIndex!26 i!1267)))))

(declare-fun b!272300 () Bool)

(declare-fun res!136340 () Bool)

(assert (=> b!272300 (=> (not res!136340) (not e!174755))))

(declare-datatypes ((List!4123 0))(
  ( (Nil!4120) (Cons!4119 (h!4786 (_ BitVec 64)) (t!9196 List!4123)) )
))
(declare-fun arrayNoDuplicates!0 (array!13386 (_ BitVec 32) List!4123) Bool)

(assert (=> b!272300 (= res!136340 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4120))))

(declare-fun b!272301 () Bool)

(declare-fun res!136344 () Bool)

(assert (=> b!272301 (=> (not res!136344) (not e!174755))))

(assert (=> b!272301 (= res!136344 (and (= (size!6695 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6695 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6695 a!3325))))))

(declare-fun b!272302 () Bool)

(declare-fun res!136337 () Bool)

(assert (=> b!272302 (=> (not res!136337) (not e!174756))))

(assert (=> b!272302 (= res!136337 (validKeyInArray!0 (select (arr!6342 a!3325) startIndex!26)))))

(declare-fun b!272303 () Bool)

(assert (=> b!272303 (= e!174756 (not true))))

(assert (=> b!272303 (arrayNoDuplicates!0 (array!13387 (store (arr!6342 a!3325) i!1267 k0!2581) (size!6695 a!3325)) #b00000000000000000000000000000000 Nil!4120)))

(declare-datatypes ((Unit!8451 0))(
  ( (Unit!8452) )
))
(declare-fun lt!135821 () Unit!8451)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4123) Unit!8451)

(assert (=> b!272303 (= lt!135821 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4120))))

(assert (= (and start!26300 res!136343) b!272301))

(assert (= (and b!272301 res!136344) b!272295))

(assert (= (and b!272295 res!136345) b!272300))

(assert (= (and b!272300 res!136340) b!272296))

(assert (= (and b!272296 res!136339) b!272297))

(assert (= (and b!272297 res!136341) b!272298))

(assert (= (and b!272298 res!136342) b!272299))

(assert (= (and b!272299 res!136338) b!272302))

(assert (= (and b!272302 res!136337) b!272303))

(declare-fun m!286949 () Bool)

(assert (=> b!272302 m!286949))

(assert (=> b!272302 m!286949))

(declare-fun m!286951 () Bool)

(assert (=> b!272302 m!286951))

(declare-fun m!286953 () Bool)

(assert (=> b!272300 m!286953))

(declare-fun m!286955 () Bool)

(assert (=> b!272295 m!286955))

(declare-fun m!286957 () Bool)

(assert (=> start!26300 m!286957))

(declare-fun m!286959 () Bool)

(assert (=> start!26300 m!286959))

(declare-fun m!286961 () Bool)

(assert (=> b!272296 m!286961))

(declare-fun m!286963 () Bool)

(assert (=> b!272297 m!286963))

(declare-fun m!286965 () Bool)

(assert (=> b!272298 m!286965))

(declare-fun m!286967 () Bool)

(assert (=> b!272303 m!286967))

(declare-fun m!286969 () Bool)

(assert (=> b!272303 m!286969))

(declare-fun m!286971 () Bool)

(assert (=> b!272303 m!286971))

(check-sat (not b!272298) (not b!272303) (not b!272302) (not b!272297) (not b!272295) (not b!272296) (not start!26300) (not b!272300))
(check-sat)
