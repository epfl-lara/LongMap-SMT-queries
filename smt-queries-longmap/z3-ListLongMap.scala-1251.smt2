; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26064 () Bool)

(assert start!26064)

(declare-fun b!268892 () Bool)

(declare-fun res!133146 () Bool)

(declare-fun e!173612 () Bool)

(assert (=> b!268892 (=> (not res!133146) (not e!173612))))

(declare-datatypes ((array!13160 0))(
  ( (array!13161 (arr!6229 (Array (_ BitVec 32) (_ BitVec 64))) (size!6581 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13160)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268892 (= res!133146 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268893 () Bool)

(declare-fun e!173611 () Bool)

(assert (=> b!268893 (= e!173611 false)))

(declare-fun lt!135071 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13160 (_ BitVec 32)) Bool)

(assert (=> b!268893 (= lt!135071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133144 () Bool)

(assert (=> start!26064 (=> (not res!133144) (not e!173612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26064 (= res!133144 (validMask!0 mask!3868))))

(assert (=> start!26064 e!173612))

(declare-fun array_inv!4179 (array!13160) Bool)

(assert (=> start!26064 (array_inv!4179 a!3325)))

(assert (=> start!26064 true))

(declare-fun b!268894 () Bool)

(assert (=> b!268894 (= e!173612 e!173611)))

(declare-fun res!133147 () Bool)

(assert (=> b!268894 (=> (not res!133147) (not e!173611))))

(declare-datatypes ((SeekEntryResult!1352 0))(
  ( (MissingZero!1352 (index!7578 (_ BitVec 32))) (Found!1352 (index!7579 (_ BitVec 32))) (Intermediate!1352 (undefined!2164 Bool) (index!7580 (_ BitVec 32)) (x!26045 (_ BitVec 32))) (Undefined!1352) (MissingVacant!1352 (index!7581 (_ BitVec 32))) )
))
(declare-fun lt!135072 () SeekEntryResult!1352)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268894 (= res!133147 (or (= lt!135072 (MissingZero!1352 i!1267)) (= lt!135072 (MissingVacant!1352 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13160 (_ BitVec 32)) SeekEntryResult!1352)

(assert (=> b!268894 (= lt!135072 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268895 () Bool)

(declare-fun res!133145 () Bool)

(assert (=> b!268895 (=> (not res!133145) (not e!173612))))

(declare-datatypes ((List!3950 0))(
  ( (Nil!3947) (Cons!3946 (h!4613 (_ BitVec 64)) (t!9024 List!3950)) )
))
(declare-fun arrayNoDuplicates!0 (array!13160 (_ BitVec 32) List!3950) Bool)

(assert (=> b!268895 (= res!133145 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3947))))

(declare-fun b!268896 () Bool)

(declare-fun res!133148 () Bool)

(assert (=> b!268896 (=> (not res!133148) (not e!173612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268896 (= res!133148 (validKeyInArray!0 k0!2581))))

(declare-fun b!268897 () Bool)

(declare-fun res!133149 () Bool)

(assert (=> b!268897 (=> (not res!133149) (not e!173612))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268897 (= res!133149 (and (= (size!6581 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6581 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6581 a!3325))))))

(assert (= (and start!26064 res!133144) b!268897))

(assert (= (and b!268897 res!133149) b!268896))

(assert (= (and b!268896 res!133148) b!268895))

(assert (= (and b!268895 res!133145) b!268892))

(assert (= (and b!268892 res!133146) b!268894))

(assert (= (and b!268894 res!133147) b!268893))

(declare-fun m!285089 () Bool)

(assert (=> b!268894 m!285089))

(declare-fun m!285091 () Bool)

(assert (=> b!268893 m!285091))

(declare-fun m!285093 () Bool)

(assert (=> b!268895 m!285093))

(declare-fun m!285095 () Bool)

(assert (=> start!26064 m!285095))

(declare-fun m!285097 () Bool)

(assert (=> start!26064 m!285097))

(declare-fun m!285099 () Bool)

(assert (=> b!268896 m!285099))

(declare-fun m!285101 () Bool)

(assert (=> b!268892 m!285101))

(check-sat (not start!26064) (not b!268893) (not b!268894) (not b!268892) (not b!268896) (not b!268895))
(check-sat)
