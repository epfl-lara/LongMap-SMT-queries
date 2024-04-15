; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27506 () Bool)

(assert start!27506)

(declare-fun b!284076 () Bool)

(declare-fun e!180237 () Bool)

(declare-fun e!180236 () Bool)

(assert (=> b!284076 (= e!180237 e!180236)))

(declare-fun res!146638 () Bool)

(assert (=> b!284076 (=> (not res!146638) (not e!180236))))

(declare-datatypes ((SeekEntryResult!1868 0))(
  ( (MissingZero!1868 (index!9642 (_ BitVec 32))) (Found!1868 (index!9643 (_ BitVec 32))) (Intermediate!1868 (undefined!2680 Bool) (index!9644 (_ BitVec 32)) (x!27874 (_ BitVec 32))) (Undefined!1868) (MissingVacant!1868 (index!9645 (_ BitVec 32))) )
))
(declare-fun lt!140268 () SeekEntryResult!1868)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284076 (= res!146638 (or (= lt!140268 (MissingZero!1868 i!1267)) (= lt!140268 (MissingVacant!1868 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!14145 0))(
  ( (array!14146 (arr!6711 (Array (_ BitVec 32) (_ BitVec 64))) (size!7064 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14145)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14145 (_ BitVec 32)) SeekEntryResult!1868)

(assert (=> b!284076 (= lt!140268 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284077 () Bool)

(declare-fun res!146639 () Bool)

(assert (=> b!284077 (=> (not res!146639) (not e!180237))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284077 (= res!146639 (and (= (size!7064 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7064 a!3325))))))

(declare-fun b!284078 () Bool)

(declare-fun res!146636 () Bool)

(assert (=> b!284078 (=> (not res!146636) (not e!180237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284078 (= res!146636 (validKeyInArray!0 k0!2581))))

(declare-fun b!284079 () Bool)

(declare-fun res!146640 () Bool)

(assert (=> b!284079 (=> (not res!146640) (not e!180237))))

(declare-fun arrayContainsKey!0 (array!14145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284079 (= res!146640 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!146637 () Bool)

(assert (=> start!27506 (=> (not res!146637) (not e!180237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27506 (= res!146637 (validMask!0 mask!3868))))

(assert (=> start!27506 e!180237))

(declare-fun array_inv!4683 (array!14145) Bool)

(assert (=> start!27506 (array_inv!4683 a!3325)))

(assert (=> start!27506 true))

(declare-fun b!284080 () Bool)

(assert (=> b!284080 (= e!180236 false)))

(declare-fun lt!140267 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14145 (_ BitVec 32)) Bool)

(assert (=> b!284080 (= lt!140267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284081 () Bool)

(declare-fun res!146641 () Bool)

(assert (=> b!284081 (=> (not res!146641) (not e!180237))))

(declare-datatypes ((List!4492 0))(
  ( (Nil!4489) (Cons!4488 (h!5161 (_ BitVec 64)) (t!9565 List!4492)) )
))
(declare-fun arrayNoDuplicates!0 (array!14145 (_ BitVec 32) List!4492) Bool)

(assert (=> b!284081 (= res!146641 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4489))))

(assert (= (and start!27506 res!146637) b!284077))

(assert (= (and b!284077 res!146639) b!284078))

(assert (= (and b!284078 res!146636) b!284081))

(assert (= (and b!284081 res!146641) b!284079))

(assert (= (and b!284079 res!146640) b!284076))

(assert (= (and b!284076 res!146638) b!284080))

(declare-fun m!298703 () Bool)

(assert (=> b!284081 m!298703))

(declare-fun m!298705 () Bool)

(assert (=> b!284079 m!298705))

(declare-fun m!298707 () Bool)

(assert (=> start!27506 m!298707))

(declare-fun m!298709 () Bool)

(assert (=> start!27506 m!298709))

(declare-fun m!298711 () Bool)

(assert (=> b!284076 m!298711))

(declare-fun m!298713 () Bool)

(assert (=> b!284078 m!298713))

(declare-fun m!298715 () Bool)

(assert (=> b!284080 m!298715))

(check-sat (not b!284080) (not b!284079) (not b!284081) (not b!284078) (not start!27506) (not b!284076))
(check-sat)
