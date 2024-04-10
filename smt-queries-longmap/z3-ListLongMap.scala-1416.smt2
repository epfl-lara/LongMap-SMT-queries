; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27524 () Bool)

(assert start!27524)

(declare-fun res!146912 () Bool)

(declare-fun e!180427 () Bool)

(assert (=> start!27524 (=> (not res!146912) (not e!180427))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27524 (= res!146912 (validMask!0 mask!3868))))

(assert (=> start!27524 e!180427))

(declare-datatypes ((array!14174 0))(
  ( (array!14175 (arr!6726 (Array (_ BitVec 32) (_ BitVec 64))) (size!7078 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14174)

(declare-fun array_inv!4689 (array!14174) Bool)

(assert (=> start!27524 (array_inv!4689 a!3325)))

(assert (=> start!27524 true))

(declare-fun b!284403 () Bool)

(declare-fun res!146913 () Bool)

(assert (=> b!284403 (=> (not res!146913) (not e!180427))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284403 (= res!146913 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284404 () Bool)

(declare-fun res!146911 () Bool)

(assert (=> b!284404 (=> (not res!146911) (not e!180427))))

(declare-datatypes ((List!4534 0))(
  ( (Nil!4531) (Cons!4530 (h!5203 (_ BitVec 64)) (t!9616 List!4534)) )
))
(declare-fun arrayNoDuplicates!0 (array!14174 (_ BitVec 32) List!4534) Bool)

(assert (=> b!284404 (= res!146911 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4531))))

(declare-fun b!284405 () Bool)

(declare-fun res!146914 () Bool)

(assert (=> b!284405 (=> (not res!146914) (not e!180427))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284405 (= res!146914 (and (= (size!7078 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7078 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7078 a!3325))))))

(declare-fun b!284406 () Bool)

(declare-fun e!180428 () Bool)

(assert (=> b!284406 (= e!180427 e!180428)))

(declare-fun res!146916 () Bool)

(assert (=> b!284406 (=> (not res!146916) (not e!180428))))

(declare-datatypes ((SeekEntryResult!1884 0))(
  ( (MissingZero!1884 (index!9706 (_ BitVec 32))) (Found!1884 (index!9707 (_ BitVec 32))) (Intermediate!1884 (undefined!2696 Bool) (index!9708 (_ BitVec 32)) (x!27915 (_ BitVec 32))) (Undefined!1884) (MissingVacant!1884 (index!9709 (_ BitVec 32))) )
))
(declare-fun lt!140509 () SeekEntryResult!1884)

(assert (=> b!284406 (= res!146916 (or (= lt!140509 (MissingZero!1884 i!1267)) (= lt!140509 (MissingVacant!1884 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14174 (_ BitVec 32)) SeekEntryResult!1884)

(assert (=> b!284406 (= lt!140509 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284407 () Bool)

(declare-fun res!146915 () Bool)

(assert (=> b!284407 (=> (not res!146915) (not e!180427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284407 (= res!146915 (validKeyInArray!0 k0!2581))))

(declare-fun b!284408 () Bool)

(assert (=> b!284408 (= e!180428 false)))

(declare-fun lt!140508 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14174 (_ BitVec 32)) Bool)

(assert (=> b!284408 (= lt!140508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27524 res!146912) b!284405))

(assert (= (and b!284405 res!146914) b!284407))

(assert (= (and b!284407 res!146915) b!284404))

(assert (= (and b!284404 res!146911) b!284403))

(assert (= (and b!284403 res!146913) b!284406))

(assert (= (and b!284406 res!146916) b!284408))

(declare-fun m!299435 () Bool)

(assert (=> b!284403 m!299435))

(declare-fun m!299437 () Bool)

(assert (=> b!284406 m!299437))

(declare-fun m!299439 () Bool)

(assert (=> start!27524 m!299439))

(declare-fun m!299441 () Bool)

(assert (=> start!27524 m!299441))

(declare-fun m!299443 () Bool)

(assert (=> b!284404 m!299443))

(declare-fun m!299445 () Bool)

(assert (=> b!284407 m!299445))

(declare-fun m!299447 () Bool)

(assert (=> b!284408 m!299447))

(check-sat (not b!284407) (not b!284403) (not start!27524) (not b!284406) (not b!284408) (not b!284404))
(check-sat)
