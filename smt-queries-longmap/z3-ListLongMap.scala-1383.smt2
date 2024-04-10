; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27152 () Bool)

(assert start!27152)

(declare-fun b!280878 () Bool)

(declare-fun res!143954 () Bool)

(declare-fun e!178688 () Bool)

(assert (=> b!280878 (=> (not res!143954) (not e!178688))))

(declare-datatypes ((array!13970 0))(
  ( (array!13971 (arr!6627 (Array (_ BitVec 32) (_ BitVec 64))) (size!6979 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13970)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280878 (= res!143954 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280879 () Bool)

(declare-fun res!143948 () Bool)

(declare-fun e!178687 () Bool)

(assert (=> b!280879 (=> (not res!143948) (not e!178687))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280879 (= res!143948 (not (= startIndex!26 i!1267)))))

(declare-fun b!280880 () Bool)

(declare-fun res!143952 () Bool)

(assert (=> b!280880 (=> (not res!143952) (not e!178688))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280880 (= res!143952 (and (= (size!6979 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6979 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6979 a!3325))))))

(declare-fun b!280881 () Bool)

(assert (=> b!280881 (= e!178687 (not true))))

(declare-datatypes ((List!4435 0))(
  ( (Nil!4432) (Cons!4431 (h!5101 (_ BitVec 64)) (t!9517 List!4435)) )
))
(declare-fun arrayNoDuplicates!0 (array!13970 (_ BitVec 32) List!4435) Bool)

(assert (=> b!280881 (arrayNoDuplicates!0 (array!13971 (store (arr!6627 a!3325) i!1267 k0!2581) (size!6979 a!3325)) #b00000000000000000000000000000000 Nil!4432)))

(declare-datatypes ((Unit!8854 0))(
  ( (Unit!8855) )
))
(declare-fun lt!138925 () Unit!8854)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13970 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4435) Unit!8854)

(assert (=> b!280881 (= lt!138925 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4432))))

(declare-fun b!280882 () Bool)

(declare-fun res!143947 () Bool)

(assert (=> b!280882 (=> (not res!143947) (not e!178687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13970 (_ BitVec 32)) Bool)

(assert (=> b!280882 (= res!143947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280883 () Bool)

(assert (=> b!280883 (= e!178688 e!178687)))

(declare-fun res!143951 () Bool)

(assert (=> b!280883 (=> (not res!143951) (not e!178687))))

(declare-datatypes ((SeekEntryResult!1785 0))(
  ( (MissingZero!1785 (index!9310 (_ BitVec 32))) (Found!1785 (index!9311 (_ BitVec 32))) (Intermediate!1785 (undefined!2597 Bool) (index!9312 (_ BitVec 32)) (x!27543 (_ BitVec 32))) (Undefined!1785) (MissingVacant!1785 (index!9313 (_ BitVec 32))) )
))
(declare-fun lt!138924 () SeekEntryResult!1785)

(assert (=> b!280883 (= res!143951 (or (= lt!138924 (MissingZero!1785 i!1267)) (= lt!138924 (MissingVacant!1785 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13970 (_ BitVec 32)) SeekEntryResult!1785)

(assert (=> b!280883 (= lt!138924 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!143950 () Bool)

(assert (=> start!27152 (=> (not res!143950) (not e!178688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27152 (= res!143950 (validMask!0 mask!3868))))

(assert (=> start!27152 e!178688))

(declare-fun array_inv!4590 (array!13970) Bool)

(assert (=> start!27152 (array_inv!4590 a!3325)))

(assert (=> start!27152 true))

(declare-fun b!280884 () Bool)

(declare-fun res!143953 () Bool)

(assert (=> b!280884 (=> (not res!143953) (not e!178688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280884 (= res!143953 (validKeyInArray!0 k0!2581))))

(declare-fun b!280885 () Bool)

(declare-fun res!143949 () Bool)

(assert (=> b!280885 (=> (not res!143949) (not e!178688))))

(assert (=> b!280885 (= res!143949 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4432))))

(declare-fun b!280886 () Bool)

(declare-fun res!143955 () Bool)

(assert (=> b!280886 (=> (not res!143955) (not e!178687))))

(assert (=> b!280886 (= res!143955 (validKeyInArray!0 (select (arr!6627 a!3325) startIndex!26)))))

(assert (= (and start!27152 res!143950) b!280880))

(assert (= (and b!280880 res!143952) b!280884))

(assert (= (and b!280884 res!143953) b!280885))

(assert (= (and b!280885 res!143949) b!280878))

(assert (= (and b!280878 res!143954) b!280883))

(assert (= (and b!280883 res!143951) b!280882))

(assert (= (and b!280882 res!143947) b!280879))

(assert (= (and b!280879 res!143948) b!280886))

(assert (= (and b!280886 res!143955) b!280881))

(declare-fun m!295263 () Bool)

(assert (=> b!280883 m!295263))

(declare-fun m!295265 () Bool)

(assert (=> b!280885 m!295265))

(declare-fun m!295267 () Bool)

(assert (=> b!280884 m!295267))

(declare-fun m!295269 () Bool)

(assert (=> b!280886 m!295269))

(assert (=> b!280886 m!295269))

(declare-fun m!295271 () Bool)

(assert (=> b!280886 m!295271))

(declare-fun m!295273 () Bool)

(assert (=> b!280882 m!295273))

(declare-fun m!295275 () Bool)

(assert (=> start!27152 m!295275))

(declare-fun m!295277 () Bool)

(assert (=> start!27152 m!295277))

(declare-fun m!295279 () Bool)

(assert (=> b!280878 m!295279))

(declare-fun m!295281 () Bool)

(assert (=> b!280881 m!295281))

(declare-fun m!295283 () Bool)

(assert (=> b!280881 m!295283))

(declare-fun m!295285 () Bool)

(assert (=> b!280881 m!295285))

(check-sat (not b!280886) (not b!280881) (not b!280882) (not b!280884) (not b!280878) (not b!280883) (not start!27152) (not b!280885))
(check-sat)
