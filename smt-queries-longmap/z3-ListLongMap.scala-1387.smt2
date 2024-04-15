; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27176 () Bool)

(assert start!27176)

(declare-fun b!281028 () Bool)

(declare-fun res!144151 () Bool)

(declare-fun e!178684 () Bool)

(assert (=> b!281028 (=> (not res!144151) (not e!178684))))

(declare-datatypes ((array!13983 0))(
  ( (array!13984 (arr!6633 (Array (_ BitVec 32) (_ BitVec 64))) (size!6986 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13983)

(declare-datatypes ((List!4414 0))(
  ( (Nil!4411) (Cons!4410 (h!5080 (_ BitVec 64)) (t!9487 List!4414)) )
))
(declare-fun arrayNoDuplicates!0 (array!13983 (_ BitVec 32) List!4414) Bool)

(assert (=> b!281028 (= res!144151 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4411))))

(declare-fun b!281029 () Bool)

(declare-fun res!144157 () Bool)

(declare-fun e!178686 () Bool)

(assert (=> b!281029 (=> (not res!144157) (not e!178686))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281029 (= res!144157 (not (= startIndex!26 i!1267)))))

(declare-fun b!281030 () Bool)

(declare-fun res!144153 () Bool)

(assert (=> b!281030 (=> (not res!144153) (not e!178684))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281030 (= res!144153 (validKeyInArray!0 k0!2581))))

(declare-fun b!281031 () Bool)

(declare-fun res!144156 () Bool)

(assert (=> b!281031 (=> (not res!144156) (not e!178686))))

(assert (=> b!281031 (= res!144156 (validKeyInArray!0 (select (arr!6633 a!3325) startIndex!26)))))

(declare-fun res!144152 () Bool)

(assert (=> start!27176 (=> (not res!144152) (not e!178684))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27176 (= res!144152 (validMask!0 mask!3868))))

(assert (=> start!27176 e!178684))

(declare-fun array_inv!4605 (array!13983) Bool)

(assert (=> start!27176 (array_inv!4605 a!3325)))

(assert (=> start!27176 true))

(declare-fun b!281032 () Bool)

(assert (=> b!281032 (= e!178686 (not true))))

(assert (=> b!281032 (arrayNoDuplicates!0 (array!13984 (store (arr!6633 a!3325) i!1267 k0!2581) (size!6986 a!3325)) #b00000000000000000000000000000000 Nil!4411)))

(declare-datatypes ((Unit!8826 0))(
  ( (Unit!8827) )
))
(declare-fun lt!138809 () Unit!8826)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13983 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4414) Unit!8826)

(assert (=> b!281032 (= lt!138809 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4411))))

(declare-fun b!281033 () Bool)

(declare-fun res!144149 () Bool)

(assert (=> b!281033 (=> (not res!144149) (not e!178686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13983 (_ BitVec 32)) Bool)

(assert (=> b!281033 (= res!144149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281034 () Bool)

(assert (=> b!281034 (= e!178684 e!178686)))

(declare-fun res!144150 () Bool)

(assert (=> b!281034 (=> (not res!144150) (not e!178686))))

(declare-datatypes ((SeekEntryResult!1790 0))(
  ( (MissingZero!1790 (index!9330 (_ BitVec 32))) (Found!1790 (index!9331 (_ BitVec 32))) (Intermediate!1790 (undefined!2602 Bool) (index!9332 (_ BitVec 32)) (x!27579 (_ BitVec 32))) (Undefined!1790) (MissingVacant!1790 (index!9333 (_ BitVec 32))) )
))
(declare-fun lt!138810 () SeekEntryResult!1790)

(assert (=> b!281034 (= res!144150 (or (= lt!138810 (MissingZero!1790 i!1267)) (= lt!138810 (MissingVacant!1790 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13983 (_ BitVec 32)) SeekEntryResult!1790)

(assert (=> b!281034 (= lt!138810 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281035 () Bool)

(declare-fun res!144155 () Bool)

(assert (=> b!281035 (=> (not res!144155) (not e!178684))))

(assert (=> b!281035 (= res!144155 (and (= (size!6986 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6986 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6986 a!3325))))))

(declare-fun b!281036 () Bool)

(declare-fun res!144154 () Bool)

(assert (=> b!281036 (=> (not res!144154) (not e!178684))))

(declare-fun arrayContainsKey!0 (array!13983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281036 (= res!144154 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27176 res!144152) b!281035))

(assert (= (and b!281035 res!144155) b!281030))

(assert (= (and b!281030 res!144153) b!281028))

(assert (= (and b!281028 res!144151) b!281036))

(assert (= (and b!281036 res!144154) b!281034))

(assert (= (and b!281034 res!144150) b!281033))

(assert (= (and b!281033 res!144149) b!281029))

(assert (= (and b!281029 res!144157) b!281031))

(assert (= (and b!281031 res!144156) b!281032))

(declare-fun m!294935 () Bool)

(assert (=> b!281036 m!294935))

(declare-fun m!294937 () Bool)

(assert (=> b!281030 m!294937))

(declare-fun m!294939 () Bool)

(assert (=> start!27176 m!294939))

(declare-fun m!294941 () Bool)

(assert (=> start!27176 m!294941))

(declare-fun m!294943 () Bool)

(assert (=> b!281033 m!294943))

(declare-fun m!294945 () Bool)

(assert (=> b!281034 m!294945))

(declare-fun m!294947 () Bool)

(assert (=> b!281028 m!294947))

(declare-fun m!294949 () Bool)

(assert (=> b!281031 m!294949))

(assert (=> b!281031 m!294949))

(declare-fun m!294951 () Bool)

(assert (=> b!281031 m!294951))

(declare-fun m!294953 () Bool)

(assert (=> b!281032 m!294953))

(declare-fun m!294955 () Bool)

(assert (=> b!281032 m!294955))

(declare-fun m!294957 () Bool)

(assert (=> b!281032 m!294957))

(check-sat (not b!281028) (not b!281032) (not b!281036) (not start!27176) (not b!281034) (not b!281031) (not b!281033) (not b!281030))
(check-sat)
