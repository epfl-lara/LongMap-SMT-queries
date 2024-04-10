; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26134 () Bool)

(assert start!26134)

(declare-fun b!269759 () Bool)

(declare-fun res!133900 () Bool)

(declare-fun e!173973 () Bool)

(assert (=> b!269759 (=> (not res!133900) (not e!173973))))

(declare-datatypes ((array!13231 0))(
  ( (array!13232 (arr!6265 (Array (_ BitVec 32) (_ BitVec 64))) (size!6617 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13231)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13231 (_ BitVec 32)) Bool)

(assert (=> b!269759 (= res!133900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269760 () Bool)

(declare-fun res!133898 () Bool)

(declare-fun e!173972 () Bool)

(assert (=> b!269760 (=> (not res!133898) (not e!173972))))

(declare-datatypes ((List!4073 0))(
  ( (Nil!4070) (Cons!4069 (h!4736 (_ BitVec 64)) (t!9155 List!4073)) )
))
(declare-fun arrayNoDuplicates!0 (array!13231 (_ BitVec 32) List!4073) Bool)

(assert (=> b!269760 (= res!133898 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4070))))

(declare-fun b!269761 () Bool)

(declare-fun res!133896 () Bool)

(assert (=> b!269761 (=> (not res!133896) (not e!173972))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269761 (= res!133896 (and (= (size!6617 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6617 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6617 a!3325))))))

(declare-fun b!269762 () Bool)

(declare-fun res!133901 () Bool)

(assert (=> b!269762 (=> (not res!133901) (not e!173972))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269762 (= res!133901 (validKeyInArray!0 k!2581))))

(declare-fun res!133899 () Bool)

(assert (=> start!26134 (=> (not res!133899) (not e!173972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26134 (= res!133899 (validMask!0 mask!3868))))

(assert (=> start!26134 e!173972))

(declare-fun array_inv!4228 (array!13231) Bool)

(assert (=> start!26134 (array_inv!4228 a!3325)))

(assert (=> start!26134 true))

(declare-fun b!269763 () Bool)

(declare-fun res!133897 () Bool)

(assert (=> b!269763 (=> (not res!133897) (not e!173972))))

(declare-fun arrayContainsKey!0 (array!13231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269763 (= res!133897 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269764 () Bool)

(declare-fun res!133895 () Bool)

(assert (=> b!269764 (=> (not res!133895) (not e!173973))))

(assert (=> b!269764 (= res!133895 (= startIndex!26 i!1267))))

(declare-fun b!269765 () Bool)

(assert (=> b!269765 (= e!173973 false)))

(declare-datatypes ((Unit!8374 0))(
  ( (Unit!8375) )
))
(declare-fun lt!135294 () Unit!8374)

(declare-fun e!173975 () Unit!8374)

(assert (=> b!269765 (= lt!135294 e!173975)))

(declare-fun c!45483 () Bool)

(assert (=> b!269765 (= c!45483 (bvslt startIndex!26 (bvsub (size!6617 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269766 () Bool)

(declare-fun lt!135295 () Unit!8374)

(assert (=> b!269766 (= e!173975 lt!135295)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8374)

(assert (=> b!269766 (= lt!135295 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269766 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13232 (store (arr!6265 a!3325) i!1267 k!2581) (size!6617 a!3325)) mask!3868)))

(declare-fun b!269767 () Bool)

(assert (=> b!269767 (= e!173972 e!173973)))

(declare-fun res!133902 () Bool)

(assert (=> b!269767 (=> (not res!133902) (not e!173973))))

(declare-datatypes ((SeekEntryResult!1423 0))(
  ( (MissingZero!1423 (index!7862 (_ BitVec 32))) (Found!1423 (index!7863 (_ BitVec 32))) (Intermediate!1423 (undefined!2235 Bool) (index!7864 (_ BitVec 32)) (x!26204 (_ BitVec 32))) (Undefined!1423) (MissingVacant!1423 (index!7865 (_ BitVec 32))) )
))
(declare-fun lt!135293 () SeekEntryResult!1423)

(assert (=> b!269767 (= res!133902 (or (= lt!135293 (MissingZero!1423 i!1267)) (= lt!135293 (MissingVacant!1423 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13231 (_ BitVec 32)) SeekEntryResult!1423)

(assert (=> b!269767 (= lt!135293 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269768 () Bool)

(declare-fun Unit!8376 () Unit!8374)

(assert (=> b!269768 (= e!173975 Unit!8376)))

(assert (= (and start!26134 res!133899) b!269761))

(assert (= (and b!269761 res!133896) b!269762))

(assert (= (and b!269762 res!133901) b!269760))

(assert (= (and b!269760 res!133898) b!269763))

(assert (= (and b!269763 res!133897) b!269767))

(assert (= (and b!269767 res!133902) b!269759))

(assert (= (and b!269759 res!133900) b!269764))

(assert (= (and b!269764 res!133895) b!269765))

(assert (= (and b!269765 c!45483) b!269766))

(assert (= (and b!269765 (not c!45483)) b!269768))

(declare-fun m!285511 () Bool)

(assert (=> b!269762 m!285511))

(declare-fun m!285513 () Bool)

(assert (=> b!269766 m!285513))

(declare-fun m!285515 () Bool)

(assert (=> b!269766 m!285515))

(declare-fun m!285517 () Bool)

(assert (=> b!269766 m!285517))

(declare-fun m!285519 () Bool)

(assert (=> start!26134 m!285519))

(declare-fun m!285521 () Bool)

(assert (=> start!26134 m!285521))

(declare-fun m!285523 () Bool)

(assert (=> b!269760 m!285523))

(declare-fun m!285525 () Bool)

(assert (=> b!269759 m!285525))

(declare-fun m!285527 () Bool)

(assert (=> b!269767 m!285527))

(declare-fun m!285529 () Bool)

(assert (=> b!269763 m!285529))

(push 1)

(assert (not b!269766))

(assert (not b!269762))

(assert (not b!269760))

(assert (not start!26134))

(assert (not b!269767))

(assert (not b!269759))

