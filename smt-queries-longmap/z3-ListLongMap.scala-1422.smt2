; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27560 () Bool)

(assert start!27560)

(declare-fun b!284589 () Bool)

(declare-fun res!147152 () Bool)

(declare-fun e!180479 () Bool)

(assert (=> b!284589 (=> (not res!147152) (not e!180479))))

(declare-datatypes ((array!14199 0))(
  ( (array!14200 (arr!6738 (Array (_ BitVec 32) (_ BitVec 64))) (size!7091 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14199)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284589 (= res!147152 (and (= (size!7091 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7091 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7091 a!3325))))))

(declare-fun b!284590 () Bool)

(declare-fun res!147153 () Bool)

(assert (=> b!284590 (=> (not res!147153) (not e!180479))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284590 (= res!147153 (validKeyInArray!0 k0!2581))))

(declare-fun b!284591 () Bool)

(declare-fun e!180480 () Bool)

(assert (=> b!284591 (= e!180480 false)))

(declare-fun lt!140421 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14199 (_ BitVec 32)) Bool)

(assert (=> b!284591 (= lt!140421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284592 () Bool)

(assert (=> b!284592 (= e!180479 e!180480)))

(declare-fun res!147151 () Bool)

(assert (=> b!284592 (=> (not res!147151) (not e!180480))))

(declare-datatypes ((SeekEntryResult!1895 0))(
  ( (MissingZero!1895 (index!9750 (_ BitVec 32))) (Found!1895 (index!9751 (_ BitVec 32))) (Intermediate!1895 (undefined!2707 Bool) (index!9752 (_ BitVec 32)) (x!27973 (_ BitVec 32))) (Undefined!1895) (MissingVacant!1895 (index!9753 (_ BitVec 32))) )
))
(declare-fun lt!140420 () SeekEntryResult!1895)

(assert (=> b!284592 (= res!147151 (or (= lt!140420 (MissingZero!1895 i!1267)) (= lt!140420 (MissingVacant!1895 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14199 (_ BitVec 32)) SeekEntryResult!1895)

(assert (=> b!284592 (= lt!140420 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!147149 () Bool)

(assert (=> start!27560 (=> (not res!147149) (not e!180479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27560 (= res!147149 (validMask!0 mask!3868))))

(assert (=> start!27560 e!180479))

(declare-fun array_inv!4710 (array!14199) Bool)

(assert (=> start!27560 (array_inv!4710 a!3325)))

(assert (=> start!27560 true))

(declare-fun b!284593 () Bool)

(declare-fun res!147150 () Bool)

(assert (=> b!284593 (=> (not res!147150) (not e!180479))))

(declare-datatypes ((List!4519 0))(
  ( (Nil!4516) (Cons!4515 (h!5188 (_ BitVec 64)) (t!9592 List!4519)) )
))
(declare-fun arrayNoDuplicates!0 (array!14199 (_ BitVec 32) List!4519) Bool)

(assert (=> b!284593 (= res!147150 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4516))))

(declare-fun b!284594 () Bool)

(declare-fun res!147154 () Bool)

(assert (=> b!284594 (=> (not res!147154) (not e!180479))))

(declare-fun arrayContainsKey!0 (array!14199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284594 (= res!147154 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27560 res!147149) b!284589))

(assert (= (and b!284589 res!147152) b!284590))

(assert (= (and b!284590 res!147153) b!284593))

(assert (= (and b!284593 res!147150) b!284594))

(assert (= (and b!284594 res!147154) b!284592))

(assert (= (and b!284592 res!147151) b!284591))

(declare-fun m!299093 () Bool)

(assert (=> start!27560 m!299093))

(declare-fun m!299095 () Bool)

(assert (=> start!27560 m!299095))

(declare-fun m!299097 () Bool)

(assert (=> b!284591 m!299097))

(declare-fun m!299099 () Bool)

(assert (=> b!284594 m!299099))

(declare-fun m!299101 () Bool)

(assert (=> b!284593 m!299101))

(declare-fun m!299103 () Bool)

(assert (=> b!284592 m!299103))

(declare-fun m!299105 () Bool)

(assert (=> b!284590 m!299105))

(check-sat (not b!284591) (not b!284593) (not b!284594) (not b!284592) (not start!27560) (not b!284590))
(check-sat)
