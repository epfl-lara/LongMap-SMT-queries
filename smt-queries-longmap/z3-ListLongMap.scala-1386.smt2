; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27170 () Bool)

(assert start!27170)

(declare-fun b!280947 () Bool)

(declare-fun res!144075 () Bool)

(declare-fun e!178659 () Bool)

(assert (=> b!280947 (=> (not res!144075) (not e!178659))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280947 (= res!144075 (not (= startIndex!26 i!1267)))))

(declare-fun b!280948 () Bool)

(declare-fun res!144068 () Bool)

(declare-fun e!178658 () Bool)

(assert (=> b!280948 (=> (not res!144068) (not e!178658))))

(declare-datatypes ((array!13977 0))(
  ( (array!13978 (arr!6630 (Array (_ BitVec 32) (_ BitVec 64))) (size!6983 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13977)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280948 (= res!144068 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144073 () Bool)

(assert (=> start!27170 (=> (not res!144073) (not e!178658))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27170 (= res!144073 (validMask!0 mask!3868))))

(assert (=> start!27170 e!178658))

(declare-fun array_inv!4602 (array!13977) Bool)

(assert (=> start!27170 (array_inv!4602 a!3325)))

(assert (=> start!27170 true))

(declare-fun b!280949 () Bool)

(declare-fun res!144071 () Bool)

(assert (=> b!280949 (=> (not res!144071) (not e!178658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280949 (= res!144071 (validKeyInArray!0 k0!2581))))

(declare-fun b!280950 () Bool)

(declare-fun res!144072 () Bool)

(assert (=> b!280950 (=> (not res!144072) (not e!178658))))

(assert (=> b!280950 (= res!144072 (and (= (size!6983 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6983 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6983 a!3325))))))

(declare-fun b!280951 () Bool)

(declare-fun res!144070 () Bool)

(assert (=> b!280951 (=> (not res!144070) (not e!178659))))

(assert (=> b!280951 (= res!144070 (validKeyInArray!0 (select (arr!6630 a!3325) startIndex!26)))))

(declare-fun b!280952 () Bool)

(declare-fun res!144069 () Bool)

(assert (=> b!280952 (=> (not res!144069) (not e!178658))))

(declare-datatypes ((List!4411 0))(
  ( (Nil!4408) (Cons!4407 (h!5077 (_ BitVec 64)) (t!9484 List!4411)) )
))
(declare-fun arrayNoDuplicates!0 (array!13977 (_ BitVec 32) List!4411) Bool)

(assert (=> b!280952 (= res!144069 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4408))))

(declare-fun b!280953 () Bool)

(declare-fun res!144074 () Bool)

(assert (=> b!280953 (=> (not res!144074) (not e!178659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13977 (_ BitVec 32)) Bool)

(assert (=> b!280953 (= res!144074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280954 () Bool)

(assert (=> b!280954 (= e!178659 (not true))))

(assert (=> b!280954 (arrayNoDuplicates!0 (array!13978 (store (arr!6630 a!3325) i!1267 k0!2581) (size!6983 a!3325)) #b00000000000000000000000000000000 Nil!4408)))

(declare-datatypes ((Unit!8820 0))(
  ( (Unit!8821) )
))
(declare-fun lt!138791 () Unit!8820)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13977 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4411) Unit!8820)

(assert (=> b!280954 (= lt!138791 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4408))))

(declare-fun b!280955 () Bool)

(assert (=> b!280955 (= e!178658 e!178659)))

(declare-fun res!144076 () Bool)

(assert (=> b!280955 (=> (not res!144076) (not e!178659))))

(declare-datatypes ((SeekEntryResult!1787 0))(
  ( (MissingZero!1787 (index!9318 (_ BitVec 32))) (Found!1787 (index!9319 (_ BitVec 32))) (Intermediate!1787 (undefined!2599 Bool) (index!9320 (_ BitVec 32)) (x!27568 (_ BitVec 32))) (Undefined!1787) (MissingVacant!1787 (index!9321 (_ BitVec 32))) )
))
(declare-fun lt!138792 () SeekEntryResult!1787)

(assert (=> b!280955 (= res!144076 (or (= lt!138792 (MissingZero!1787 i!1267)) (= lt!138792 (MissingVacant!1787 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13977 (_ BitVec 32)) SeekEntryResult!1787)

(assert (=> b!280955 (= lt!138792 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27170 res!144073) b!280950))

(assert (= (and b!280950 res!144072) b!280949))

(assert (= (and b!280949 res!144071) b!280952))

(assert (= (and b!280952 res!144069) b!280948))

(assert (= (and b!280948 res!144068) b!280955))

(assert (= (and b!280955 res!144076) b!280953))

(assert (= (and b!280953 res!144074) b!280947))

(assert (= (and b!280947 res!144075) b!280951))

(assert (= (and b!280951 res!144070) b!280954))

(declare-fun m!294863 () Bool)

(assert (=> b!280951 m!294863))

(assert (=> b!280951 m!294863))

(declare-fun m!294865 () Bool)

(assert (=> b!280951 m!294865))

(declare-fun m!294867 () Bool)

(assert (=> b!280954 m!294867))

(declare-fun m!294869 () Bool)

(assert (=> b!280954 m!294869))

(declare-fun m!294871 () Bool)

(assert (=> b!280954 m!294871))

(declare-fun m!294873 () Bool)

(assert (=> b!280949 m!294873))

(declare-fun m!294875 () Bool)

(assert (=> start!27170 m!294875))

(declare-fun m!294877 () Bool)

(assert (=> start!27170 m!294877))

(declare-fun m!294879 () Bool)

(assert (=> b!280953 m!294879))

(declare-fun m!294881 () Bool)

(assert (=> b!280952 m!294881))

(declare-fun m!294883 () Bool)

(assert (=> b!280955 m!294883))

(declare-fun m!294885 () Bool)

(assert (=> b!280948 m!294885))

(check-sat (not b!280949) (not b!280953) (not start!27170) (not b!280948) (not b!280951) (not b!280955) (not b!280954) (not b!280952))
(check-sat)
