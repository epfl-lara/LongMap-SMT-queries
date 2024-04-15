; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27518 () Bool)

(assert start!27518)

(declare-fun res!146747 () Bool)

(declare-fun e!180290 () Bool)

(assert (=> start!27518 (=> (not res!146747) (not e!180290))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27518 (= res!146747 (validMask!0 mask!3868))))

(assert (=> start!27518 e!180290))

(declare-datatypes ((array!14157 0))(
  ( (array!14158 (arr!6717 (Array (_ BitVec 32) (_ BitVec 64))) (size!7070 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14157)

(declare-fun array_inv!4689 (array!14157) Bool)

(assert (=> start!27518 (array_inv!4689 a!3325)))

(assert (=> start!27518 true))

(declare-fun b!284184 () Bool)

(declare-fun e!180291 () Bool)

(assert (=> b!284184 (= e!180291 false)))

(declare-fun lt!140303 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14157 (_ BitVec 32)) Bool)

(assert (=> b!284184 (= lt!140303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284185 () Bool)

(declare-fun res!146744 () Bool)

(assert (=> b!284185 (=> (not res!146744) (not e!180290))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284185 (= res!146744 (and (= (size!7070 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7070 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7070 a!3325))))))

(declare-fun b!284186 () Bool)

(declare-fun res!146749 () Bool)

(assert (=> b!284186 (=> (not res!146749) (not e!180290))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284186 (= res!146749 (validKeyInArray!0 k0!2581))))

(declare-fun b!284187 () Bool)

(assert (=> b!284187 (= e!180290 e!180291)))

(declare-fun res!146746 () Bool)

(assert (=> b!284187 (=> (not res!146746) (not e!180291))))

(declare-datatypes ((SeekEntryResult!1874 0))(
  ( (MissingZero!1874 (index!9666 (_ BitVec 32))) (Found!1874 (index!9667 (_ BitVec 32))) (Intermediate!1874 (undefined!2686 Bool) (index!9668 (_ BitVec 32)) (x!27896 (_ BitVec 32))) (Undefined!1874) (MissingVacant!1874 (index!9669 (_ BitVec 32))) )
))
(declare-fun lt!140304 () SeekEntryResult!1874)

(assert (=> b!284187 (= res!146746 (or (= lt!140304 (MissingZero!1874 i!1267)) (= lt!140304 (MissingVacant!1874 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14157 (_ BitVec 32)) SeekEntryResult!1874)

(assert (=> b!284187 (= lt!140304 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284188 () Bool)

(declare-fun res!146745 () Bool)

(assert (=> b!284188 (=> (not res!146745) (not e!180290))))

(declare-datatypes ((List!4498 0))(
  ( (Nil!4495) (Cons!4494 (h!5167 (_ BitVec 64)) (t!9571 List!4498)) )
))
(declare-fun arrayNoDuplicates!0 (array!14157 (_ BitVec 32) List!4498) Bool)

(assert (=> b!284188 (= res!146745 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4495))))

(declare-fun b!284189 () Bool)

(declare-fun res!146748 () Bool)

(assert (=> b!284189 (=> (not res!146748) (not e!180290))))

(declare-fun arrayContainsKey!0 (array!14157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284189 (= res!146748 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27518 res!146747) b!284185))

(assert (= (and b!284185 res!146744) b!284186))

(assert (= (and b!284186 res!146749) b!284188))

(assert (= (and b!284188 res!146745) b!284189))

(assert (= (and b!284189 res!146748) b!284187))

(assert (= (and b!284187 res!146746) b!284184))

(declare-fun m!298787 () Bool)

(assert (=> b!284188 m!298787))

(declare-fun m!298789 () Bool)

(assert (=> b!284187 m!298789))

(declare-fun m!298791 () Bool)

(assert (=> start!27518 m!298791))

(declare-fun m!298793 () Bool)

(assert (=> start!27518 m!298793))

(declare-fun m!298795 () Bool)

(assert (=> b!284186 m!298795))

(declare-fun m!298797 () Bool)

(assert (=> b!284184 m!298797))

(declare-fun m!298799 () Bool)

(assert (=> b!284189 m!298799))

(check-sat (not b!284189) (not b!284188) (not b!284184) (not b!284186) (not b!284187) (not start!27518))
(check-sat)
