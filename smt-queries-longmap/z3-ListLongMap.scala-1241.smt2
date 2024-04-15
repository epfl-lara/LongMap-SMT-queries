; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26006 () Bool)

(assert start!26006)

(declare-fun res!132483 () Bool)

(declare-fun e!173216 () Bool)

(assert (=> start!26006 (=> (not res!132483) (not e!173216))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26006 (= res!132483 (validMask!0 mask!3868))))

(assert (=> start!26006 e!173216))

(declare-datatypes ((array!13092 0))(
  ( (array!13093 (arr!6195 (Array (_ BitVec 32) (_ BitVec 64))) (size!6548 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13092)

(declare-fun array_inv!4167 (array!13092) Bool)

(assert (=> start!26006 (array_inv!4167 a!3325)))

(assert (=> start!26006 true))

(declare-fun b!268149 () Bool)

(declare-fun res!132479 () Bool)

(assert (=> b!268149 (=> (not res!132479) (not e!173216))))

(declare-datatypes ((List!3976 0))(
  ( (Nil!3973) (Cons!3972 (h!4639 (_ BitVec 64)) (t!9049 List!3976)) )
))
(declare-fun arrayNoDuplicates!0 (array!13092 (_ BitVec 32) List!3976) Bool)

(assert (=> b!268149 (= res!132479 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3973))))

(declare-fun b!268150 () Bool)

(declare-fun res!132480 () Bool)

(assert (=> b!268150 (=> (not res!132480) (not e!173216))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268150 (= res!132480 (validKeyInArray!0 k0!2581))))

(declare-fun b!268151 () Bool)

(declare-fun e!173217 () Bool)

(assert (=> b!268151 (= e!173217 false)))

(declare-fun lt!134661 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13092 (_ BitVec 32)) Bool)

(assert (=> b!268151 (= lt!134661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268152 () Bool)

(assert (=> b!268152 (= e!173216 e!173217)))

(declare-fun res!132482 () Bool)

(assert (=> b!268152 (=> (not res!132482) (not e!173217))))

(declare-datatypes ((SeekEntryResult!1352 0))(
  ( (MissingZero!1352 (index!7578 (_ BitVec 32))) (Found!1352 (index!7579 (_ BitVec 32))) (Intermediate!1352 (undefined!2164 Bool) (index!7580 (_ BitVec 32)) (x!25964 (_ BitVec 32))) (Undefined!1352) (MissingVacant!1352 (index!7581 (_ BitVec 32))) )
))
(declare-fun lt!134660 () SeekEntryResult!1352)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268152 (= res!132482 (or (= lt!134660 (MissingZero!1352 i!1267)) (= lt!134660 (MissingVacant!1352 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13092 (_ BitVec 32)) SeekEntryResult!1352)

(assert (=> b!268152 (= lt!134660 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268153 () Bool)

(declare-fun res!132481 () Bool)

(assert (=> b!268153 (=> (not res!132481) (not e!173216))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268153 (= res!132481 (and (= (size!6548 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6548 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6548 a!3325))))))

(declare-fun b!268154 () Bool)

(declare-fun res!132484 () Bool)

(assert (=> b!268154 (=> (not res!132484) (not e!173216))))

(declare-fun arrayContainsKey!0 (array!13092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268154 (= res!132484 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26006 res!132483) b!268153))

(assert (= (and b!268153 res!132481) b!268150))

(assert (= (and b!268150 res!132480) b!268149))

(assert (= (and b!268149 res!132479) b!268154))

(assert (= (and b!268154 res!132484) b!268152))

(assert (= (and b!268152 res!132482) b!268151))

(declare-fun m!283871 () Bool)

(assert (=> b!268151 m!283871))

(declare-fun m!283873 () Bool)

(assert (=> b!268149 m!283873))

(declare-fun m!283875 () Bool)

(assert (=> b!268150 m!283875))

(declare-fun m!283877 () Bool)

(assert (=> b!268154 m!283877))

(declare-fun m!283879 () Bool)

(assert (=> start!26006 m!283879))

(declare-fun m!283881 () Bool)

(assert (=> start!26006 m!283881))

(declare-fun m!283883 () Bool)

(assert (=> b!268152 m!283883))

(check-sat (not start!26006) (not b!268154) (not b!268149) (not b!268150) (not b!268152) (not b!268151))
(check-sat)
