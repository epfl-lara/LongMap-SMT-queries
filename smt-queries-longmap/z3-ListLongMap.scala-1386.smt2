; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27168 () Bool)

(assert start!27168)

(declare-fun res!144189 () Bool)

(declare-fun e!178782 () Bool)

(assert (=> start!27168 (=> (not res!144189) (not e!178782))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27168 (= res!144189 (validMask!0 mask!3868))))

(assert (=> start!27168 e!178782))

(declare-datatypes ((array!13985 0))(
  ( (array!13986 (arr!6634 (Array (_ BitVec 32) (_ BitVec 64))) (size!6986 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13985)

(declare-fun array_inv!4584 (array!13985) Bool)

(assert (=> start!27168 (array_inv!4584 a!3325)))

(assert (=> start!27168 true))

(declare-fun b!281141 () Bool)

(declare-fun res!144190 () Bool)

(assert (=> b!281141 (=> (not res!144190) (not e!178782))))

(declare-datatypes ((List!4355 0))(
  ( (Nil!4352) (Cons!4351 (h!5021 (_ BitVec 64)) (t!9429 List!4355)) )
))
(declare-fun arrayNoDuplicates!0 (array!13985 (_ BitVec 32) List!4355) Bool)

(assert (=> b!281141 (= res!144190 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4352))))

(declare-fun b!281142 () Bool)

(declare-fun res!144192 () Bool)

(declare-fun e!178783 () Bool)

(assert (=> b!281142 (=> (not res!144192) (not e!178783))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281142 (= res!144192 (not (= startIndex!26 i!1267)))))

(declare-fun b!281143 () Bool)

(declare-fun res!144185 () Bool)

(assert (=> b!281143 (=> (not res!144185) (not e!178782))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281143 (= res!144185 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281144 () Bool)

(declare-fun res!144187 () Bool)

(assert (=> b!281144 (=> (not res!144187) (not e!178783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13985 (_ BitVec 32)) Bool)

(assert (=> b!281144 (= res!144187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281145 () Bool)

(assert (=> b!281145 (= e!178782 e!178783)))

(declare-fun res!144186 () Bool)

(assert (=> b!281145 (=> (not res!144186) (not e!178783))))

(declare-datatypes ((SeekEntryResult!1757 0))(
  ( (MissingZero!1757 (index!9198 (_ BitVec 32))) (Found!1757 (index!9199 (_ BitVec 32))) (Intermediate!1757 (undefined!2569 Bool) (index!9200 (_ BitVec 32)) (x!27539 (_ BitVec 32))) (Undefined!1757) (MissingVacant!1757 (index!9201 (_ BitVec 32))) )
))
(declare-fun lt!139032 () SeekEntryResult!1757)

(assert (=> b!281145 (= res!144186 (or (= lt!139032 (MissingZero!1757 i!1267)) (= lt!139032 (MissingVacant!1757 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13985 (_ BitVec 32)) SeekEntryResult!1757)

(assert (=> b!281145 (= lt!139032 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281146 () Bool)

(declare-fun res!144184 () Bool)

(assert (=> b!281146 (=> (not res!144184) (not e!178782))))

(assert (=> b!281146 (= res!144184 (and (= (size!6986 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6986 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6986 a!3325))))))

(declare-fun b!281147 () Bool)

(declare-fun res!144191 () Bool)

(assert (=> b!281147 (=> (not res!144191) (not e!178783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281147 (= res!144191 (validKeyInArray!0 (select (arr!6634 a!3325) startIndex!26)))))

(declare-fun b!281148 () Bool)

(declare-fun res!144188 () Bool)

(assert (=> b!281148 (=> (not res!144188) (not e!178782))))

(assert (=> b!281148 (= res!144188 (validKeyInArray!0 k0!2581))))

(declare-fun b!281149 () Bool)

(assert (=> b!281149 (= e!178783 (not true))))

(assert (=> b!281149 (arrayNoDuplicates!0 (array!13986 (store (arr!6634 a!3325) i!1267 k0!2581) (size!6986 a!3325)) #b00000000000000000000000000000000 Nil!4352)))

(declare-datatypes ((Unit!8844 0))(
  ( (Unit!8845) )
))
(declare-fun lt!139031 () Unit!8844)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13985 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4355) Unit!8844)

(assert (=> b!281149 (= lt!139031 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4352))))

(assert (= (and start!27168 res!144189) b!281146))

(assert (= (and b!281146 res!144184) b!281148))

(assert (= (and b!281148 res!144188) b!281141))

(assert (= (and b!281141 res!144190) b!281143))

(assert (= (and b!281143 res!144185) b!281145))

(assert (= (and b!281145 res!144186) b!281144))

(assert (= (and b!281144 res!144187) b!281142))

(assert (= (and b!281142 res!144192) b!281147))

(assert (= (and b!281147 res!144191) b!281149))

(declare-fun m!295661 () Bool)

(assert (=> b!281148 m!295661))

(declare-fun m!295663 () Bool)

(assert (=> b!281149 m!295663))

(declare-fun m!295665 () Bool)

(assert (=> b!281149 m!295665))

(declare-fun m!295667 () Bool)

(assert (=> b!281149 m!295667))

(declare-fun m!295669 () Bool)

(assert (=> b!281143 m!295669))

(declare-fun m!295671 () Bool)

(assert (=> b!281145 m!295671))

(declare-fun m!295673 () Bool)

(assert (=> b!281144 m!295673))

(declare-fun m!295675 () Bool)

(assert (=> start!27168 m!295675))

(declare-fun m!295677 () Bool)

(assert (=> start!27168 m!295677))

(declare-fun m!295679 () Bool)

(assert (=> b!281141 m!295679))

(declare-fun m!295681 () Bool)

(assert (=> b!281147 m!295681))

(assert (=> b!281147 m!295681))

(declare-fun m!295683 () Bool)

(assert (=> b!281147 m!295683))

(check-sat (not b!281143) (not b!281141) (not b!281144) (not b!281148) (not b!281145) (not b!281147) (not b!281149) (not start!27168))
(check-sat)
