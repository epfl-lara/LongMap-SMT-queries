; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27572 () Bool)

(assert start!27572)

(declare-fun b!284862 () Bool)

(declare-fun res!147373 () Bool)

(declare-fun e!180643 () Bool)

(assert (=> b!284862 (=> (not res!147373) (not e!180643))))

(declare-datatypes ((array!14222 0))(
  ( (array!14223 (arr!6750 (Array (_ BitVec 32) (_ BitVec 64))) (size!7102 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14222)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284862 (= res!147373 (and (= (size!7102 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7102 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7102 a!3325))))))

(declare-fun b!284863 () Bool)

(declare-fun res!147372 () Bool)

(assert (=> b!284863 (=> (not res!147372) (not e!180643))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284863 (= res!147372 (validKeyInArray!0 k0!2581))))

(declare-fun res!147370 () Bool)

(assert (=> start!27572 (=> (not res!147370) (not e!180643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27572 (= res!147370 (validMask!0 mask!3868))))

(assert (=> start!27572 e!180643))

(declare-fun array_inv!4713 (array!14222) Bool)

(assert (=> start!27572 (array_inv!4713 a!3325)))

(assert (=> start!27572 true))

(declare-fun b!284864 () Bool)

(declare-fun res!147371 () Bool)

(assert (=> b!284864 (=> (not res!147371) (not e!180643))))

(declare-fun arrayContainsKey!0 (array!14222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284864 (= res!147371 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284865 () Bool)

(declare-fun e!180642 () Bool)

(assert (=> b!284865 (= e!180643 e!180642)))

(declare-fun res!147374 () Bool)

(assert (=> b!284865 (=> (not res!147374) (not e!180642))))

(declare-datatypes ((SeekEntryResult!1908 0))(
  ( (MissingZero!1908 (index!9802 (_ BitVec 32))) (Found!1908 (index!9803 (_ BitVec 32))) (Intermediate!1908 (undefined!2720 Bool) (index!9804 (_ BitVec 32)) (x!28003 (_ BitVec 32))) (Undefined!1908) (MissingVacant!1908 (index!9805 (_ BitVec 32))) )
))
(declare-fun lt!140643 () SeekEntryResult!1908)

(assert (=> b!284865 (= res!147374 (or (= lt!140643 (MissingZero!1908 i!1267)) (= lt!140643 (MissingVacant!1908 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14222 (_ BitVec 32)) SeekEntryResult!1908)

(assert (=> b!284865 (= lt!140643 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284866 () Bool)

(declare-fun res!147375 () Bool)

(assert (=> b!284866 (=> (not res!147375) (not e!180643))))

(declare-datatypes ((List!4558 0))(
  ( (Nil!4555) (Cons!4554 (h!5227 (_ BitVec 64)) (t!9640 List!4558)) )
))
(declare-fun arrayNoDuplicates!0 (array!14222 (_ BitVec 32) List!4558) Bool)

(assert (=> b!284866 (= res!147375 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4555))))

(declare-fun b!284867 () Bool)

(assert (=> b!284867 (= e!180642 false)))

(declare-fun lt!140644 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14222 (_ BitVec 32)) Bool)

(assert (=> b!284867 (= lt!140644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27572 res!147370) b!284862))

(assert (= (and b!284862 res!147373) b!284863))

(assert (= (and b!284863 res!147372) b!284866))

(assert (= (and b!284866 res!147375) b!284864))

(assert (= (and b!284864 res!147371) b!284865))

(assert (= (and b!284865 res!147374) b!284867))

(declare-fun m!299783 () Bool)

(assert (=> b!284863 m!299783))

(declare-fun m!299785 () Bool)

(assert (=> start!27572 m!299785))

(declare-fun m!299787 () Bool)

(assert (=> start!27572 m!299787))

(declare-fun m!299789 () Bool)

(assert (=> b!284864 m!299789))

(declare-fun m!299791 () Bool)

(assert (=> b!284867 m!299791))

(declare-fun m!299793 () Bool)

(assert (=> b!284865 m!299793))

(declare-fun m!299795 () Bool)

(assert (=> b!284866 m!299795))

(check-sat (not b!284866) (not b!284863) (not b!284867) (not start!27572) (not b!284864) (not b!284865))
(check-sat)
