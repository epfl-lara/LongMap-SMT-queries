; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27154 () Bool)

(assert start!27154)

(declare-fun b!280905 () Bool)

(declare-fun e!178695 () Bool)

(declare-fun e!178696 () Bool)

(assert (=> b!280905 (= e!178695 e!178696)))

(declare-fun res!143978 () Bool)

(assert (=> b!280905 (=> (not res!143978) (not e!178696))))

(declare-datatypes ((SeekEntryResult!1786 0))(
  ( (MissingZero!1786 (index!9314 (_ BitVec 32))) (Found!1786 (index!9315 (_ BitVec 32))) (Intermediate!1786 (undefined!2598 Bool) (index!9316 (_ BitVec 32)) (x!27544 (_ BitVec 32))) (Undefined!1786) (MissingVacant!1786 (index!9317 (_ BitVec 32))) )
))
(declare-fun lt!138930 () SeekEntryResult!1786)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280905 (= res!143978 (or (= lt!138930 (MissingZero!1786 i!1267)) (= lt!138930 (MissingVacant!1786 i!1267))))))

(declare-datatypes ((array!13972 0))(
  ( (array!13973 (arr!6628 (Array (_ BitVec 32) (_ BitVec 64))) (size!6980 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13972)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13972 (_ BitVec 32)) SeekEntryResult!1786)

(assert (=> b!280905 (= lt!138930 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280906 () Bool)

(declare-fun res!143977 () Bool)

(assert (=> b!280906 (=> (not res!143977) (not e!178696))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280906 (= res!143977 (not (= startIndex!26 i!1267)))))

(declare-fun b!280907 () Bool)

(declare-fun res!143982 () Bool)

(assert (=> b!280907 (=> (not res!143982) (not e!178695))))

(declare-fun arrayContainsKey!0 (array!13972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280907 (= res!143982 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280908 () Bool)

(declare-fun res!143976 () Bool)

(assert (=> b!280908 (=> (not res!143976) (not e!178695))))

(assert (=> b!280908 (= res!143976 (and (= (size!6980 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6980 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6980 a!3325))))))

(declare-fun b!280909 () Bool)

(declare-fun res!143974 () Bool)

(assert (=> b!280909 (=> (not res!143974) (not e!178696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280909 (= res!143974 (validKeyInArray!0 (select (arr!6628 a!3325) startIndex!26)))))

(declare-fun res!143979 () Bool)

(assert (=> start!27154 (=> (not res!143979) (not e!178695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27154 (= res!143979 (validMask!0 mask!3868))))

(assert (=> start!27154 e!178695))

(declare-fun array_inv!4591 (array!13972) Bool)

(assert (=> start!27154 (array_inv!4591 a!3325)))

(assert (=> start!27154 true))

(declare-fun b!280910 () Bool)

(declare-fun res!143981 () Bool)

(assert (=> b!280910 (=> (not res!143981) (not e!178696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13972 (_ BitVec 32)) Bool)

(assert (=> b!280910 (= res!143981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280911 () Bool)

(assert (=> b!280911 (= e!178696 (not true))))

(declare-datatypes ((List!4436 0))(
  ( (Nil!4433) (Cons!4432 (h!5102 (_ BitVec 64)) (t!9518 List!4436)) )
))
(declare-fun arrayNoDuplicates!0 (array!13972 (_ BitVec 32) List!4436) Bool)

(assert (=> b!280911 (arrayNoDuplicates!0 (array!13973 (store (arr!6628 a!3325) i!1267 k!2581) (size!6980 a!3325)) #b00000000000000000000000000000000 Nil!4433)))

(declare-datatypes ((Unit!8856 0))(
  ( (Unit!8857) )
))
(declare-fun lt!138931 () Unit!8856)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13972 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4436) Unit!8856)

(assert (=> b!280911 (= lt!138931 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4433))))

(declare-fun b!280912 () Bool)

(declare-fun res!143980 () Bool)

(assert (=> b!280912 (=> (not res!143980) (not e!178695))))

(assert (=> b!280912 (= res!143980 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4433))))

(declare-fun b!280913 () Bool)

(declare-fun res!143975 () Bool)

(assert (=> b!280913 (=> (not res!143975) (not e!178695))))

(assert (=> b!280913 (= res!143975 (validKeyInArray!0 k!2581))))

(assert (= (and start!27154 res!143979) b!280908))

(assert (= (and b!280908 res!143976) b!280913))

(assert (= (and b!280913 res!143975) b!280912))

(assert (= (and b!280912 res!143980) b!280907))

(assert (= (and b!280907 res!143982) b!280905))

(assert (= (and b!280905 res!143978) b!280910))

(assert (= (and b!280910 res!143981) b!280906))

(assert (= (and b!280906 res!143977) b!280909))

(assert (= (and b!280909 res!143974) b!280911))

(declare-fun m!295287 () Bool)

(assert (=> b!280905 m!295287))

(declare-fun m!295289 () Bool)

(assert (=> b!280910 m!295289))

(declare-fun m!295291 () Bool)

(assert (=> b!280909 m!295291))

(assert (=> b!280909 m!295291))

(declare-fun m!295293 () Bool)

(assert (=> b!280909 m!295293))

(declare-fun m!295295 () Bool)

(assert (=> b!280912 m!295295))

(declare-fun m!295297 () Bool)

(assert (=> b!280907 m!295297))

(declare-fun m!295299 () Bool)

(assert (=> start!27154 m!295299))

(declare-fun m!295301 () Bool)

(assert (=> start!27154 m!295301))

(declare-fun m!295303 () Bool)

(assert (=> b!280913 m!295303))

(declare-fun m!295305 () Bool)

(assert (=> b!280911 m!295305))

(declare-fun m!295307 () Bool)

(assert (=> b!280911 m!295307))

(declare-fun m!295309 () Bool)

(assert (=> b!280911 m!295309))

(push 1)

(assert (not b!280913))

(assert (not b!280912))

(assert (not start!27154))

(assert (not b!280905))

