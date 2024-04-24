; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27504 () Bool)

(assert start!27504)

(declare-fun b!284270 () Bool)

(declare-fun res!146752 () Bool)

(declare-fun e!180362 () Bool)

(assert (=> b!284270 (=> (not res!146752) (not e!180362))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284270 (= res!146752 (validKeyInArray!0 k0!2581))))

(declare-fun b!284271 () Bool)

(declare-fun res!146753 () Bool)

(assert (=> b!284271 (=> (not res!146753) (not e!180362))))

(declare-datatypes ((array!14153 0))(
  ( (array!14154 (arr!6715 (Array (_ BitVec 32) (_ BitVec 64))) (size!7067 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14153)

(declare-fun arrayContainsKey!0 (array!14153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284271 (= res!146753 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284273 () Bool)

(declare-fun res!146755 () Bool)

(assert (=> b!284273 (=> (not res!146755) (not e!180362))))

(declare-datatypes ((List!4436 0))(
  ( (Nil!4433) (Cons!4432 (h!5105 (_ BitVec 64)) (t!9510 List!4436)) )
))
(declare-fun arrayNoDuplicates!0 (array!14153 (_ BitVec 32) List!4436) Bool)

(assert (=> b!284273 (= res!146755 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4433))))

(declare-fun b!284274 () Bool)

(declare-fun e!180360 () Bool)

(assert (=> b!284274 (= e!180360 false)))

(declare-fun lt!140508 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14153 (_ BitVec 32)) Bool)

(assert (=> b!284274 (= lt!140508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284275 () Bool)

(assert (=> b!284275 (= e!180362 e!180360)))

(declare-fun res!146757 () Bool)

(assert (=> b!284275 (=> (not res!146757) (not e!180360))))

(declare-datatypes ((SeekEntryResult!1838 0))(
  ( (MissingZero!1838 (index!9522 (_ BitVec 32))) (Found!1838 (index!9523 (_ BitVec 32))) (Intermediate!1838 (undefined!2650 Bool) (index!9524 (_ BitVec 32)) (x!27845 (_ BitVec 32))) (Undefined!1838) (MissingVacant!1838 (index!9525 (_ BitVec 32))) )
))
(declare-fun lt!140507 () SeekEntryResult!1838)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284275 (= res!146757 (or (= lt!140507 (MissingZero!1838 i!1267)) (= lt!140507 (MissingVacant!1838 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14153 (_ BitVec 32)) SeekEntryResult!1838)

(assert (=> b!284275 (= lt!140507 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284272 () Bool)

(declare-fun res!146756 () Bool)

(assert (=> b!284272 (=> (not res!146756) (not e!180362))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284272 (= res!146756 (and (= (size!7067 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7067 a!3325))))))

(declare-fun res!146754 () Bool)

(assert (=> start!27504 (=> (not res!146754) (not e!180362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27504 (= res!146754 (validMask!0 mask!3868))))

(assert (=> start!27504 e!180362))

(declare-fun array_inv!4665 (array!14153) Bool)

(assert (=> start!27504 (array_inv!4665 a!3325)))

(assert (=> start!27504 true))

(assert (= (and start!27504 res!146754) b!284272))

(assert (= (and b!284272 res!146756) b!284270))

(assert (= (and b!284270 res!146752) b!284273))

(assert (= (and b!284273 res!146755) b!284271))

(assert (= (and b!284271 res!146753) b!284275))

(assert (= (and b!284275 res!146757) b!284274))

(declare-fun m!299501 () Bool)

(assert (=> b!284270 m!299501))

(declare-fun m!299503 () Bool)

(assert (=> start!27504 m!299503))

(declare-fun m!299505 () Bool)

(assert (=> start!27504 m!299505))

(declare-fun m!299507 () Bool)

(assert (=> b!284271 m!299507))

(declare-fun m!299509 () Bool)

(assert (=> b!284275 m!299509))

(declare-fun m!299511 () Bool)

(assert (=> b!284273 m!299511))

(declare-fun m!299513 () Bool)

(assert (=> b!284274 m!299513))

(check-sat (not start!27504) (not b!284270) (not b!284275) (not b!284274) (not b!284273) (not b!284271))
(check-sat)
