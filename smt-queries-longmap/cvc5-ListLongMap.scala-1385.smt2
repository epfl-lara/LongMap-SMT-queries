; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27162 () Bool)

(assert start!27162)

(declare-fun b!281013 () Bool)

(declare-fun e!178733 () Bool)

(declare-fun e!178731 () Bool)

(assert (=> b!281013 (= e!178733 e!178731)))

(declare-fun res!144090 () Bool)

(assert (=> b!281013 (=> (not res!144090) (not e!178731))))

(declare-datatypes ((SeekEntryResult!1790 0))(
  ( (MissingZero!1790 (index!9330 (_ BitVec 32))) (Found!1790 (index!9331 (_ BitVec 32))) (Intermediate!1790 (undefined!2602 Bool) (index!9332 (_ BitVec 32)) (x!27564 (_ BitVec 32))) (Undefined!1790) (MissingVacant!1790 (index!9333 (_ BitVec 32))) )
))
(declare-fun lt!138955 () SeekEntryResult!1790)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281013 (= res!144090 (or (= lt!138955 (MissingZero!1790 i!1267)) (= lt!138955 (MissingVacant!1790 i!1267))))))

(declare-datatypes ((array!13980 0))(
  ( (array!13981 (arr!6632 (Array (_ BitVec 32) (_ BitVec 64))) (size!6984 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13980)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13980 (_ BitVec 32)) SeekEntryResult!1790)

(assert (=> b!281013 (= lt!138955 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281014 () Bool)

(declare-fun res!144082 () Bool)

(assert (=> b!281014 (=> (not res!144082) (not e!178733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281014 (= res!144082 (validKeyInArray!0 k!2581))))

(declare-fun b!281015 () Bool)

(declare-fun res!144087 () Bool)

(assert (=> b!281015 (=> (not res!144087) (not e!178731))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281015 (= res!144087 (not (= startIndex!26 i!1267)))))

(declare-fun b!281016 () Bool)

(declare-fun res!144085 () Bool)

(assert (=> b!281016 (=> (not res!144085) (not e!178731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13980 (_ BitVec 32)) Bool)

(assert (=> b!281016 (= res!144085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281017 () Bool)

(declare-fun res!144088 () Bool)

(assert (=> b!281017 (=> (not res!144088) (not e!178733))))

(declare-fun arrayContainsKey!0 (array!13980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281017 (= res!144088 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281018 () Bool)

(declare-fun res!144083 () Bool)

(assert (=> b!281018 (=> (not res!144083) (not e!178733))))

(declare-datatypes ((List!4440 0))(
  ( (Nil!4437) (Cons!4436 (h!5106 (_ BitVec 64)) (t!9522 List!4440)) )
))
(declare-fun arrayNoDuplicates!0 (array!13980 (_ BitVec 32) List!4440) Bool)

(assert (=> b!281018 (= res!144083 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4437))))

(declare-fun b!281019 () Bool)

(declare-fun res!144089 () Bool)

(assert (=> b!281019 (=> (not res!144089) (not e!178731))))

(assert (=> b!281019 (= res!144089 (validKeyInArray!0 (select (arr!6632 a!3325) startIndex!26)))))

(declare-fun b!281020 () Bool)

(assert (=> b!281020 (= e!178731 (not true))))

(assert (=> b!281020 (arrayNoDuplicates!0 (array!13981 (store (arr!6632 a!3325) i!1267 k!2581) (size!6984 a!3325)) #b00000000000000000000000000000000 Nil!4437)))

(declare-datatypes ((Unit!8864 0))(
  ( (Unit!8865) )
))
(declare-fun lt!138954 () Unit!8864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13980 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4440) Unit!8864)

(assert (=> b!281020 (= lt!138954 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4437))))

(declare-fun b!281021 () Bool)

(declare-fun res!144084 () Bool)

(assert (=> b!281021 (=> (not res!144084) (not e!178733))))

(assert (=> b!281021 (= res!144084 (and (= (size!6984 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6984 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6984 a!3325))))))

(declare-fun res!144086 () Bool)

(assert (=> start!27162 (=> (not res!144086) (not e!178733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27162 (= res!144086 (validMask!0 mask!3868))))

(assert (=> start!27162 e!178733))

(declare-fun array_inv!4595 (array!13980) Bool)

(assert (=> start!27162 (array_inv!4595 a!3325)))

(assert (=> start!27162 true))

(assert (= (and start!27162 res!144086) b!281021))

(assert (= (and b!281021 res!144084) b!281014))

(assert (= (and b!281014 res!144082) b!281018))

(assert (= (and b!281018 res!144083) b!281017))

(assert (= (and b!281017 res!144088) b!281013))

(assert (= (and b!281013 res!144090) b!281016))

(assert (= (and b!281016 res!144085) b!281015))

(assert (= (and b!281015 res!144087) b!281019))

(assert (= (and b!281019 res!144089) b!281020))

(declare-fun m!295383 () Bool)

(assert (=> b!281019 m!295383))

(assert (=> b!281019 m!295383))

(declare-fun m!295385 () Bool)

(assert (=> b!281019 m!295385))

(declare-fun m!295387 () Bool)

(assert (=> b!281016 m!295387))

(declare-fun m!295389 () Bool)

(assert (=> b!281018 m!295389))

(declare-fun m!295391 () Bool)

(assert (=> start!27162 m!295391))

(declare-fun m!295393 () Bool)

(assert (=> start!27162 m!295393))

(declare-fun m!295395 () Bool)

(assert (=> b!281014 m!295395))

(declare-fun m!295397 () Bool)

(assert (=> b!281013 m!295397))

(declare-fun m!295399 () Bool)

(assert (=> b!281017 m!295399))

(declare-fun m!295401 () Bool)

(assert (=> b!281020 m!295401))

(declare-fun m!295403 () Bool)

(assert (=> b!281020 m!295403))

(declare-fun m!295405 () Bool)

(assert (=> b!281020 m!295405))

(push 1)

