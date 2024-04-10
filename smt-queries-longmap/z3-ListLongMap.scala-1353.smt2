; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26678 () Bool)

(assert start!26678)

(declare-fun b!276891 () Bool)

(declare-fun res!140885 () Bool)

(declare-fun e!176826 () Bool)

(assert (=> b!276891 (=> (not res!140885) (not e!176826))))

(declare-datatypes ((array!13775 0))(
  ( (array!13776 (arr!6537 (Array (_ BitVec 32) (_ BitVec 64))) (size!6889 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13775)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276891 (= res!140885 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140883 () Bool)

(assert (=> start!26678 (=> (not res!140883) (not e!176826))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26678 (= res!140883 (validMask!0 mask!3868))))

(assert (=> start!26678 e!176826))

(declare-fun array_inv!4500 (array!13775) Bool)

(assert (=> start!26678 (array_inv!4500 a!3325)))

(assert (=> start!26678 true))

(declare-fun b!276892 () Bool)

(declare-fun res!140886 () Bool)

(assert (=> b!276892 (=> (not res!140886) (not e!176826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276892 (= res!140886 (validKeyInArray!0 k0!2581))))

(declare-fun b!276893 () Bool)

(declare-fun res!140881 () Bool)

(assert (=> b!276893 (=> (not res!140881) (not e!176826))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276893 (= res!140881 (and (= (size!6889 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6889 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6889 a!3325))))))

(declare-fun b!276894 () Bool)

(declare-fun res!140884 () Bool)

(assert (=> b!276894 (=> (not res!140884) (not e!176826))))

(declare-datatypes ((List!4345 0))(
  ( (Nil!4342) (Cons!4341 (h!5008 (_ BitVec 64)) (t!9427 List!4345)) )
))
(declare-fun arrayNoDuplicates!0 (array!13775 (_ BitVec 32) List!4345) Bool)

(assert (=> b!276894 (= res!140884 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4342))))

(declare-fun b!276895 () Bool)

(declare-fun e!176828 () Bool)

(assert (=> b!276895 (= e!176826 e!176828)))

(declare-fun res!140882 () Bool)

(assert (=> b!276895 (=> (not res!140882) (not e!176828))))

(declare-datatypes ((SeekEntryResult!1695 0))(
  ( (MissingZero!1695 (index!8950 (_ BitVec 32))) (Found!1695 (index!8951 (_ BitVec 32))) (Intermediate!1695 (undefined!2507 Bool) (index!8952 (_ BitVec 32)) (x!27204 (_ BitVec 32))) (Undefined!1695) (MissingVacant!1695 (index!8953 (_ BitVec 32))) )
))
(declare-fun lt!137782 () SeekEntryResult!1695)

(assert (=> b!276895 (= res!140882 (or (= lt!137782 (MissingZero!1695 i!1267)) (= lt!137782 (MissingVacant!1695 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13775 (_ BitVec 32)) SeekEntryResult!1695)

(assert (=> b!276895 (= lt!137782 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276896 () Bool)

(assert (=> b!276896 (= e!176828 false)))

(declare-fun lt!137781 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13775 (_ BitVec 32)) Bool)

(assert (=> b!276896 (= lt!137781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26678 res!140883) b!276893))

(assert (= (and b!276893 res!140881) b!276892))

(assert (= (and b!276892 res!140886) b!276894))

(assert (= (and b!276894 res!140884) b!276891))

(assert (= (and b!276891 res!140885) b!276895))

(assert (= (and b!276895 res!140882) b!276896))

(declare-fun m!292121 () Bool)

(assert (=> b!276895 m!292121))

(declare-fun m!292123 () Bool)

(assert (=> b!276894 m!292123))

(declare-fun m!292125 () Bool)

(assert (=> b!276892 m!292125))

(declare-fun m!292127 () Bool)

(assert (=> b!276891 m!292127))

(declare-fun m!292129 () Bool)

(assert (=> start!26678 m!292129))

(declare-fun m!292131 () Bool)

(assert (=> start!26678 m!292131))

(declare-fun m!292133 () Bool)

(assert (=> b!276896 m!292133))

(check-sat (not b!276891) (not b!276896) (not b!276892) (not start!26678) (not b!276895) (not b!276894))
(check-sat)
