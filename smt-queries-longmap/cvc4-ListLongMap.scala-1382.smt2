; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27148 () Bool)

(assert start!27148)

(declare-fun b!280824 () Bool)

(declare-fun res!143898 () Bool)

(declare-fun e!178670 () Bool)

(assert (=> b!280824 (=> (not res!143898) (not e!178670))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280824 (= res!143898 (validKeyInArray!0 k!2581))))

(declare-fun b!280825 () Bool)

(declare-fun e!178668 () Bool)

(assert (=> b!280825 (= e!178668 (not true))))

(declare-datatypes ((array!13966 0))(
  ( (array!13967 (arr!6625 (Array (_ BitVec 32) (_ BitVec 64))) (size!6977 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13966)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4433 0))(
  ( (Nil!4430) (Cons!4429 (h!5099 (_ BitVec 64)) (t!9515 List!4433)) )
))
(declare-fun arrayNoDuplicates!0 (array!13966 (_ BitVec 32) List!4433) Bool)

(assert (=> b!280825 (arrayNoDuplicates!0 (array!13967 (store (arr!6625 a!3325) i!1267 k!2581) (size!6977 a!3325)) #b00000000000000000000000000000000 Nil!4430)))

(declare-datatypes ((Unit!8850 0))(
  ( (Unit!8851) )
))
(declare-fun lt!138912 () Unit!8850)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13966 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4433) Unit!8850)

(assert (=> b!280825 (= lt!138912 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4430))))

(declare-fun b!280826 () Bool)

(declare-fun res!143899 () Bool)

(assert (=> b!280826 (=> (not res!143899) (not e!178668))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280826 (= res!143899 (not (= startIndex!26 i!1267)))))

(declare-fun res!143896 () Bool)

(assert (=> start!27148 (=> (not res!143896) (not e!178670))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27148 (= res!143896 (validMask!0 mask!3868))))

(assert (=> start!27148 e!178670))

(declare-fun array_inv!4588 (array!13966) Bool)

(assert (=> start!27148 (array_inv!4588 a!3325)))

(assert (=> start!27148 true))

(declare-fun b!280827 () Bool)

(declare-fun res!143893 () Bool)

(assert (=> b!280827 (=> (not res!143893) (not e!178670))))

(assert (=> b!280827 (= res!143893 (and (= (size!6977 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6977 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6977 a!3325))))))

(declare-fun b!280828 () Bool)

(declare-fun res!143895 () Bool)

(assert (=> b!280828 (=> (not res!143895) (not e!178670))))

(declare-fun arrayContainsKey!0 (array!13966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280828 (= res!143895 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280829 () Bool)

(declare-fun res!143901 () Bool)

(assert (=> b!280829 (=> (not res!143901) (not e!178670))))

(assert (=> b!280829 (= res!143901 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4430))))

(declare-fun b!280830 () Bool)

(declare-fun res!143894 () Bool)

(assert (=> b!280830 (=> (not res!143894) (not e!178668))))

(assert (=> b!280830 (= res!143894 (validKeyInArray!0 (select (arr!6625 a!3325) startIndex!26)))))

(declare-fun b!280831 () Bool)

(declare-fun res!143897 () Bool)

(assert (=> b!280831 (=> (not res!143897) (not e!178668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13966 (_ BitVec 32)) Bool)

(assert (=> b!280831 (= res!143897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280832 () Bool)

(assert (=> b!280832 (= e!178670 e!178668)))

(declare-fun res!143900 () Bool)

(assert (=> b!280832 (=> (not res!143900) (not e!178668))))

(declare-datatypes ((SeekEntryResult!1783 0))(
  ( (MissingZero!1783 (index!9302 (_ BitVec 32))) (Found!1783 (index!9303 (_ BitVec 32))) (Intermediate!1783 (undefined!2595 Bool) (index!9304 (_ BitVec 32)) (x!27533 (_ BitVec 32))) (Undefined!1783) (MissingVacant!1783 (index!9305 (_ BitVec 32))) )
))
(declare-fun lt!138913 () SeekEntryResult!1783)

(assert (=> b!280832 (= res!143900 (or (= lt!138913 (MissingZero!1783 i!1267)) (= lt!138913 (MissingVacant!1783 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13966 (_ BitVec 32)) SeekEntryResult!1783)

(assert (=> b!280832 (= lt!138913 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27148 res!143896) b!280827))

(assert (= (and b!280827 res!143893) b!280824))

(assert (= (and b!280824 res!143898) b!280829))

(assert (= (and b!280829 res!143901) b!280828))

(assert (= (and b!280828 res!143895) b!280832))

(assert (= (and b!280832 res!143900) b!280831))

(assert (= (and b!280831 res!143897) b!280826))

(assert (= (and b!280826 res!143899) b!280830))

(assert (= (and b!280830 res!143894) b!280825))

(declare-fun m!295215 () Bool)

(assert (=> b!280825 m!295215))

(declare-fun m!295217 () Bool)

(assert (=> b!280825 m!295217))

(declare-fun m!295219 () Bool)

(assert (=> b!280825 m!295219))

(declare-fun m!295221 () Bool)

(assert (=> b!280828 m!295221))

(declare-fun m!295223 () Bool)

(assert (=> b!280831 m!295223))

(declare-fun m!295225 () Bool)

(assert (=> b!280832 m!295225))

(declare-fun m!295227 () Bool)

(assert (=> b!280830 m!295227))

(assert (=> b!280830 m!295227))

(declare-fun m!295229 () Bool)

(assert (=> b!280830 m!295229))

(declare-fun m!295231 () Bool)

(assert (=> start!27148 m!295231))

(declare-fun m!295233 () Bool)

(assert (=> start!27148 m!295233))

(declare-fun m!295235 () Bool)

(assert (=> b!280829 m!295235))

(declare-fun m!295237 () Bool)

(assert (=> b!280824 m!295237))

(push 1)

(assert (not b!280831))

(assert (not b!280825))

(assert (not start!27148))

(assert (not b!280828))

(assert (not b!280832))

(assert (not b!280824))

(assert (not b!280830))

