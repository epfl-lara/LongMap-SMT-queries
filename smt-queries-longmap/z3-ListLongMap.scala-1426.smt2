; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27584 () Bool)

(assert start!27584)

(declare-fun res!147405 () Bool)

(declare-fun e!180588 () Bool)

(assert (=> start!27584 (=> (not res!147405) (not e!180588))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27584 (= res!147405 (validMask!0 mask!3868))))

(assert (=> start!27584 e!180588))

(declare-datatypes ((array!14223 0))(
  ( (array!14224 (arr!6750 (Array (_ BitVec 32) (_ BitVec 64))) (size!7103 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14223)

(declare-fun array_inv!4722 (array!14223) Bool)

(assert (=> start!27584 (array_inv!4722 a!3325)))

(assert (=> start!27584 true))

(declare-fun b!284840 () Bool)

(declare-fun res!147400 () Bool)

(declare-fun e!180586 () Bool)

(assert (=> b!284840 (=> (not res!147400) (not e!180586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14223 (_ BitVec 32)) Bool)

(assert (=> b!284840 (= res!147400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284841 () Bool)

(declare-fun res!147407 () Bool)

(assert (=> b!284841 (=> (not res!147407) (not e!180588))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284841 (= res!147407 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284842 () Bool)

(assert (=> b!284842 (= e!180586 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14224 (store (arr!6750 a!3325) i!1267 k0!2581) (size!7103 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8982 0))(
  ( (Unit!8983) )
))
(declare-fun lt!140483 () Unit!8982)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14223 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!284842 (= lt!140483 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!284843 () Bool)

(declare-fun res!147402 () Bool)

(assert (=> b!284843 (=> (not res!147402) (not e!180588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284843 (= res!147402 (validKeyInArray!0 k0!2581))))

(declare-fun b!284844 () Bool)

(declare-fun res!147401 () Bool)

(assert (=> b!284844 (=> (not res!147401) (not e!180586))))

(assert (=> b!284844 (= res!147401 (and (bvslt startIndex!26 (bvsub (size!7103 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284845 () Bool)

(assert (=> b!284845 (= e!180588 e!180586)))

(declare-fun res!147406 () Bool)

(assert (=> b!284845 (=> (not res!147406) (not e!180586))))

(declare-datatypes ((SeekEntryResult!1907 0))(
  ( (MissingZero!1907 (index!9798 (_ BitVec 32))) (Found!1907 (index!9799 (_ BitVec 32))) (Intermediate!1907 (undefined!2719 Bool) (index!9800 (_ BitVec 32)) (x!28017 (_ BitVec 32))) (Undefined!1907) (MissingVacant!1907 (index!9801 (_ BitVec 32))) )
))
(declare-fun lt!140484 () SeekEntryResult!1907)

(assert (=> b!284845 (= res!147406 (or (= lt!140484 (MissingZero!1907 i!1267)) (= lt!140484 (MissingVacant!1907 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14223 (_ BitVec 32)) SeekEntryResult!1907)

(assert (=> b!284845 (= lt!140484 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284846 () Bool)

(declare-fun res!147403 () Bool)

(assert (=> b!284846 (=> (not res!147403) (not e!180586))))

(assert (=> b!284846 (= res!147403 (not (= startIndex!26 i!1267)))))

(declare-fun b!284847 () Bool)

(declare-fun res!147409 () Bool)

(assert (=> b!284847 (=> (not res!147409) (not e!180586))))

(assert (=> b!284847 (= res!147409 (not (validKeyInArray!0 (select (arr!6750 a!3325) startIndex!26))))))

(declare-fun b!284848 () Bool)

(declare-fun res!147404 () Bool)

(assert (=> b!284848 (=> (not res!147404) (not e!180588))))

(declare-datatypes ((List!4531 0))(
  ( (Nil!4528) (Cons!4527 (h!5200 (_ BitVec 64)) (t!9604 List!4531)) )
))
(declare-fun arrayNoDuplicates!0 (array!14223 (_ BitVec 32) List!4531) Bool)

(assert (=> b!284848 (= res!147404 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4528))))

(declare-fun b!284849 () Bool)

(declare-fun res!147408 () Bool)

(assert (=> b!284849 (=> (not res!147408) (not e!180588))))

(assert (=> b!284849 (= res!147408 (and (= (size!7103 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7103 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7103 a!3325))))))

(assert (= (and start!27584 res!147405) b!284849))

(assert (= (and b!284849 res!147408) b!284843))

(assert (= (and b!284843 res!147402) b!284848))

(assert (= (and b!284848 res!147404) b!284841))

(assert (= (and b!284841 res!147407) b!284845))

(assert (= (and b!284845 res!147406) b!284840))

(assert (= (and b!284840 res!147400) b!284846))

(assert (= (and b!284846 res!147403) b!284847))

(assert (= (and b!284847 res!147409) b!284844))

(assert (= (and b!284844 res!147401) b!284842))

(declare-fun m!299273 () Bool)

(assert (=> start!27584 m!299273))

(declare-fun m!299275 () Bool)

(assert (=> start!27584 m!299275))

(declare-fun m!299277 () Bool)

(assert (=> b!284843 m!299277))

(declare-fun m!299279 () Bool)

(assert (=> b!284847 m!299279))

(assert (=> b!284847 m!299279))

(declare-fun m!299281 () Bool)

(assert (=> b!284847 m!299281))

(declare-fun m!299283 () Bool)

(assert (=> b!284848 m!299283))

(declare-fun m!299285 () Bool)

(assert (=> b!284845 m!299285))

(declare-fun m!299287 () Bool)

(assert (=> b!284841 m!299287))

(declare-fun m!299289 () Bool)

(assert (=> b!284842 m!299289))

(declare-fun m!299291 () Bool)

(assert (=> b!284842 m!299291))

(declare-fun m!299293 () Bool)

(assert (=> b!284842 m!299293))

(declare-fun m!299295 () Bool)

(assert (=> b!284840 m!299295))

(check-sat (not b!284847) (not b!284845) (not start!27584) (not b!284841) (not b!284840) (not b!284843) (not b!284848) (not b!284842))
(check-sat)
