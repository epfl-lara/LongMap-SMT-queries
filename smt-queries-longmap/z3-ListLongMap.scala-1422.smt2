; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27558 () Bool)

(assert start!27558)

(declare-fun b!284783 () Bool)

(declare-fun res!147269 () Bool)

(declare-fun e!180605 () Bool)

(assert (=> b!284783 (=> (not res!147269) (not e!180605))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284783 (= res!147269 (validKeyInArray!0 k0!2581))))

(declare-fun b!284784 () Bool)

(declare-fun res!147270 () Bool)

(assert (=> b!284784 (=> (not res!147270) (not e!180605))))

(declare-datatypes ((array!14207 0))(
  ( (array!14208 (arr!6742 (Array (_ BitVec 32) (_ BitVec 64))) (size!7094 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14207)

(declare-datatypes ((List!4463 0))(
  ( (Nil!4460) (Cons!4459 (h!5132 (_ BitVec 64)) (t!9537 List!4463)) )
))
(declare-fun arrayNoDuplicates!0 (array!14207 (_ BitVec 32) List!4463) Bool)

(assert (=> b!284784 (= res!147270 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4460))))

(declare-fun res!147266 () Bool)

(assert (=> start!27558 (=> (not res!147266) (not e!180605))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27558 (= res!147266 (validMask!0 mask!3868))))

(assert (=> start!27558 e!180605))

(declare-fun array_inv!4692 (array!14207) Bool)

(assert (=> start!27558 (array_inv!4692 a!3325)))

(assert (=> start!27558 true))

(declare-fun b!284785 () Bool)

(declare-fun e!180603 () Bool)

(assert (=> b!284785 (= e!180605 e!180603)))

(declare-fun res!147268 () Bool)

(assert (=> b!284785 (=> (not res!147268) (not e!180603))))

(declare-datatypes ((SeekEntryResult!1865 0))(
  ( (MissingZero!1865 (index!9630 (_ BitVec 32))) (Found!1865 (index!9631 (_ BitVec 32))) (Intermediate!1865 (undefined!2677 Bool) (index!9632 (_ BitVec 32)) (x!27944 (_ BitVec 32))) (Undefined!1865) (MissingVacant!1865 (index!9633 (_ BitVec 32))) )
))
(declare-fun lt!140660 () SeekEntryResult!1865)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284785 (= res!147268 (or (= lt!140660 (MissingZero!1865 i!1267)) (= lt!140660 (MissingVacant!1865 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14207 (_ BitVec 32)) SeekEntryResult!1865)

(assert (=> b!284785 (= lt!140660 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284786 () Bool)

(declare-fun res!147267 () Bool)

(assert (=> b!284786 (=> (not res!147267) (not e!180605))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284786 (= res!147267 (and (= (size!7094 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7094 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7094 a!3325))))))

(declare-fun b!284787 () Bool)

(declare-fun res!147265 () Bool)

(assert (=> b!284787 (=> (not res!147265) (not e!180605))))

(declare-fun arrayContainsKey!0 (array!14207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284787 (= res!147265 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284788 () Bool)

(assert (=> b!284788 (= e!180603 false)))

(declare-fun lt!140661 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14207 (_ BitVec 32)) Bool)

(assert (=> b!284788 (= lt!140661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27558 res!147266) b!284786))

(assert (= (and b!284786 res!147267) b!284783))

(assert (= (and b!284783 res!147269) b!284784))

(assert (= (and b!284784 res!147270) b!284787))

(assert (= (and b!284787 res!147265) b!284785))

(assert (= (and b!284785 res!147268) b!284788))

(declare-fun m!299891 () Bool)

(assert (=> b!284788 m!299891))

(declare-fun m!299893 () Bool)

(assert (=> b!284783 m!299893))

(declare-fun m!299895 () Bool)

(assert (=> start!27558 m!299895))

(declare-fun m!299897 () Bool)

(assert (=> start!27558 m!299897))

(declare-fun m!299899 () Bool)

(assert (=> b!284784 m!299899))

(declare-fun m!299901 () Bool)

(assert (=> b!284785 m!299901))

(declare-fun m!299903 () Bool)

(assert (=> b!284787 m!299903))

(check-sat (not b!284788) (not b!284787) (not b!284783) (not b!284785) (not b!284784) (not start!27558))
(check-sat)
