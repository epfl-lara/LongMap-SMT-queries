; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27566 () Bool)

(assert start!27566)

(declare-fun b!284808 () Bool)

(declare-fun res!147316 () Bool)

(declare-fun e!180617 () Bool)

(assert (=> b!284808 (=> (not res!147316) (not e!180617))))

(declare-datatypes ((array!14216 0))(
  ( (array!14217 (arr!6747 (Array (_ BitVec 32) (_ BitVec 64))) (size!7099 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14216)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284808 (= res!147316 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284809 () Bool)

(declare-fun res!147319 () Bool)

(assert (=> b!284809 (=> (not res!147319) (not e!180617))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284809 (= res!147319 (and (= (size!7099 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7099 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7099 a!3325))))))

(declare-fun b!284810 () Bool)

(declare-fun res!147321 () Bool)

(assert (=> b!284810 (=> (not res!147321) (not e!180617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284810 (= res!147321 (validKeyInArray!0 k0!2581))))

(declare-fun res!147318 () Bool)

(assert (=> start!27566 (=> (not res!147318) (not e!180617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27566 (= res!147318 (validMask!0 mask!3868))))

(assert (=> start!27566 e!180617))

(declare-fun array_inv!4710 (array!14216) Bool)

(assert (=> start!27566 (array_inv!4710 a!3325)))

(assert (=> start!27566 true))

(declare-fun b!284811 () Bool)

(declare-fun res!147320 () Bool)

(assert (=> b!284811 (=> (not res!147320) (not e!180617))))

(declare-datatypes ((List!4555 0))(
  ( (Nil!4552) (Cons!4551 (h!5224 (_ BitVec 64)) (t!9637 List!4555)) )
))
(declare-fun arrayNoDuplicates!0 (array!14216 (_ BitVec 32) List!4555) Bool)

(assert (=> b!284811 (= res!147320 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4552))))

(declare-fun b!284812 () Bool)

(declare-fun e!180616 () Bool)

(assert (=> b!284812 (= e!180617 e!180616)))

(declare-fun res!147317 () Bool)

(assert (=> b!284812 (=> (not res!147317) (not e!180616))))

(declare-datatypes ((SeekEntryResult!1905 0))(
  ( (MissingZero!1905 (index!9790 (_ BitVec 32))) (Found!1905 (index!9791 (_ BitVec 32))) (Intermediate!1905 (undefined!2717 Bool) (index!9792 (_ BitVec 32)) (x!27992 (_ BitVec 32))) (Undefined!1905) (MissingVacant!1905 (index!9793 (_ BitVec 32))) )
))
(declare-fun lt!140626 () SeekEntryResult!1905)

(assert (=> b!284812 (= res!147317 (or (= lt!140626 (MissingZero!1905 i!1267)) (= lt!140626 (MissingVacant!1905 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14216 (_ BitVec 32)) SeekEntryResult!1905)

(assert (=> b!284812 (= lt!140626 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284813 () Bool)

(assert (=> b!284813 (= e!180616 false)))

(declare-fun lt!140625 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14216 (_ BitVec 32)) Bool)

(assert (=> b!284813 (= lt!140625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27566 res!147318) b!284809))

(assert (= (and b!284809 res!147319) b!284810))

(assert (= (and b!284810 res!147321) b!284811))

(assert (= (and b!284811 res!147320) b!284808))

(assert (= (and b!284808 res!147316) b!284812))

(assert (= (and b!284812 res!147317) b!284813))

(declare-fun m!299741 () Bool)

(assert (=> b!284812 m!299741))

(declare-fun m!299743 () Bool)

(assert (=> b!284808 m!299743))

(declare-fun m!299745 () Bool)

(assert (=> b!284813 m!299745))

(declare-fun m!299747 () Bool)

(assert (=> start!27566 m!299747))

(declare-fun m!299749 () Bool)

(assert (=> start!27566 m!299749))

(declare-fun m!299751 () Bool)

(assert (=> b!284810 m!299751))

(declare-fun m!299753 () Bool)

(assert (=> b!284811 m!299753))

(check-sat (not b!284813) (not b!284811) (not start!27566) (not b!284808) (not b!284812) (not b!284810))
(check-sat)
