; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27132 () Bool)

(assert start!27132)

(declare-fun b!280608 () Bool)

(declare-fun res!143685 () Bool)

(declare-fun e!178597 () Bool)

(assert (=> b!280608 (=> (not res!143685) (not e!178597))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280608 (= res!143685 (validKeyInArray!0 k!2581))))

(declare-fun b!280609 () Bool)

(declare-fun res!143680 () Bool)

(assert (=> b!280609 (=> (not res!143680) (not e!178597))))

(declare-datatypes ((array!13950 0))(
  ( (array!13951 (arr!6617 (Array (_ BitVec 32) (_ BitVec 64))) (size!6969 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13950)

(declare-fun arrayContainsKey!0 (array!13950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280609 (= res!143680 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280610 () Bool)

(declare-fun res!143678 () Bool)

(assert (=> b!280610 (=> (not res!143678) (not e!178597))))

(declare-datatypes ((List!4425 0))(
  ( (Nil!4422) (Cons!4421 (h!5091 (_ BitVec 64)) (t!9507 List!4425)) )
))
(declare-fun arrayNoDuplicates!0 (array!13950 (_ BitVec 32) List!4425) Bool)

(assert (=> b!280610 (= res!143678 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4422))))

(declare-fun b!280611 () Bool)

(declare-fun res!143679 () Bool)

(declare-fun e!178596 () Bool)

(assert (=> b!280611 (=> (not res!143679) (not e!178596))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280611 (= res!143679 (not (= startIndex!26 i!1267)))))

(declare-fun res!143681 () Bool)

(assert (=> start!27132 (=> (not res!143681) (not e!178597))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27132 (= res!143681 (validMask!0 mask!3868))))

(assert (=> start!27132 e!178597))

(declare-fun array_inv!4580 (array!13950) Bool)

(assert (=> start!27132 (array_inv!4580 a!3325)))

(assert (=> start!27132 true))

(declare-fun b!280612 () Bool)

(assert (=> b!280612 (= e!178596 (not true))))

(assert (=> b!280612 (arrayNoDuplicates!0 (array!13951 (store (arr!6617 a!3325) i!1267 k!2581) (size!6969 a!3325)) #b00000000000000000000000000000000 Nil!4422)))

(declare-datatypes ((Unit!8834 0))(
  ( (Unit!8835) )
))
(declare-fun lt!138864 () Unit!8834)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13950 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4425) Unit!8834)

(assert (=> b!280612 (= lt!138864 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4422))))

(declare-fun b!280613 () Bool)

(assert (=> b!280613 (= e!178597 e!178596)))

(declare-fun res!143683 () Bool)

(assert (=> b!280613 (=> (not res!143683) (not e!178596))))

(declare-datatypes ((SeekEntryResult!1775 0))(
  ( (MissingZero!1775 (index!9270 (_ BitVec 32))) (Found!1775 (index!9271 (_ BitVec 32))) (Intermediate!1775 (undefined!2587 Bool) (index!9272 (_ BitVec 32)) (x!27509 (_ BitVec 32))) (Undefined!1775) (MissingVacant!1775 (index!9273 (_ BitVec 32))) )
))
(declare-fun lt!138865 () SeekEntryResult!1775)

(assert (=> b!280613 (= res!143683 (or (= lt!138865 (MissingZero!1775 i!1267)) (= lt!138865 (MissingVacant!1775 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13950 (_ BitVec 32)) SeekEntryResult!1775)

(assert (=> b!280613 (= lt!138865 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280614 () Bool)

(declare-fun res!143682 () Bool)

(assert (=> b!280614 (=> (not res!143682) (not e!178596))))

(assert (=> b!280614 (= res!143682 (validKeyInArray!0 (select (arr!6617 a!3325) startIndex!26)))))

(declare-fun b!280615 () Bool)

(declare-fun res!143677 () Bool)

(assert (=> b!280615 (=> (not res!143677) (not e!178597))))

(assert (=> b!280615 (= res!143677 (and (= (size!6969 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6969 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6969 a!3325))))))

(declare-fun b!280616 () Bool)

(declare-fun res!143684 () Bool)

(assert (=> b!280616 (=> (not res!143684) (not e!178596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13950 (_ BitVec 32)) Bool)

(assert (=> b!280616 (= res!143684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27132 res!143681) b!280615))

(assert (= (and b!280615 res!143677) b!280608))

(assert (= (and b!280608 res!143685) b!280610))

(assert (= (and b!280610 res!143678) b!280609))

(assert (= (and b!280609 res!143680) b!280613))

(assert (= (and b!280613 res!143683) b!280616))

(assert (= (and b!280616 res!143684) b!280611))

(assert (= (and b!280611 res!143679) b!280614))

(assert (= (and b!280614 res!143682) b!280612))

(declare-fun m!295023 () Bool)

(assert (=> b!280608 m!295023))

(declare-fun m!295025 () Bool)

(assert (=> b!280613 m!295025))

(declare-fun m!295027 () Bool)

(assert (=> b!280610 m!295027))

(declare-fun m!295029 () Bool)

(assert (=> b!280612 m!295029))

(declare-fun m!295031 () Bool)

(assert (=> b!280612 m!295031))

(declare-fun m!295033 () Bool)

(assert (=> b!280612 m!295033))

(declare-fun m!295035 () Bool)

(assert (=> b!280616 m!295035))

(declare-fun m!295037 () Bool)

(assert (=> start!27132 m!295037))

(declare-fun m!295039 () Bool)

(assert (=> start!27132 m!295039))

(declare-fun m!295041 () Bool)

(assert (=> b!280614 m!295041))

(assert (=> b!280614 m!295041))

(declare-fun m!295043 () Bool)

(assert (=> b!280614 m!295043))

(declare-fun m!295045 () Bool)

(assert (=> b!280609 m!295045))

(push 1)

