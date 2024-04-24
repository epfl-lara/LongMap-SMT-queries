; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25950 () Bool)

(assert start!25950)

(declare-fun res!132167 () Bool)

(declare-fun e!173159 () Bool)

(assert (=> start!25950 (=> (not res!132167) (not e!173159))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25950 (= res!132167 (validMask!0 mask!3868))))

(assert (=> start!25950 e!173159))

(declare-datatypes ((array!13046 0))(
  ( (array!13047 (arr!6172 (Array (_ BitVec 32) (_ BitVec 64))) (size!6524 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13046)

(declare-fun array_inv!4122 (array!13046) Bool)

(assert (=> start!25950 (array_inv!4122 a!3325)))

(assert (=> start!25950 true))

(declare-fun b!267911 () Bool)

(declare-fun res!132168 () Bool)

(assert (=> b!267911 (=> (not res!132168) (not e!173159))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267911 (= res!132168 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267912 () Bool)

(assert (=> b!267912 (= e!173159 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun b!267913 () Bool)

(declare-fun res!132165 () Bool)

(assert (=> b!267913 (=> (not res!132165) (not e!173159))))

(declare-datatypes ((List!3893 0))(
  ( (Nil!3890) (Cons!3889 (h!4556 (_ BitVec 64)) (t!8967 List!3893)) )
))
(declare-fun arrayNoDuplicates!0 (array!13046 (_ BitVec 32) List!3893) Bool)

(assert (=> b!267913 (= res!132165 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3890))))

(declare-fun b!267914 () Bool)

(declare-fun res!132166 () Bool)

(assert (=> b!267914 (=> (not res!132166) (not e!173159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267914 (= res!132166 (validKeyInArray!0 k0!2581))))

(declare-fun b!267915 () Bool)

(declare-fun res!132164 () Bool)

(assert (=> b!267915 (=> (not res!132164) (not e!173159))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1295 0))(
  ( (MissingZero!1295 (index!7350 (_ BitVec 32))) (Found!1295 (index!7351 (_ BitVec 32))) (Intermediate!1295 (undefined!2107 Bool) (index!7352 (_ BitVec 32)) (x!25836 (_ BitVec 32))) (Undefined!1295) (MissingVacant!1295 (index!7353 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13046 (_ BitVec 32)) SeekEntryResult!1295)

(assert (=> b!267915 (= res!132164 (not (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) (MissingZero!1295 i!1267))))))

(declare-fun b!267916 () Bool)

(declare-fun res!132163 () Bool)

(assert (=> b!267916 (=> (not res!132163) (not e!173159))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267916 (= res!132163 (and (= (size!6524 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6524 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6524 a!3325))))))

(assert (= (and start!25950 res!132167) b!267916))

(assert (= (and b!267916 res!132163) b!267914))

(assert (= (and b!267914 res!132166) b!267913))

(assert (= (and b!267913 res!132165) b!267911))

(assert (= (and b!267911 res!132168) b!267915))

(assert (= (and b!267915 res!132164) b!267912))

(declare-fun m!284333 () Bool)

(assert (=> start!25950 m!284333))

(declare-fun m!284335 () Bool)

(assert (=> start!25950 m!284335))

(declare-fun m!284337 () Bool)

(assert (=> b!267915 m!284337))

(declare-fun m!284339 () Bool)

(assert (=> b!267914 m!284339))

(declare-fun m!284341 () Bool)

(assert (=> b!267913 m!284341))

(declare-fun m!284343 () Bool)

(assert (=> b!267911 m!284343))

(check-sat (not b!267914) (not b!267915) (not b!267913) (not b!267911) (not start!25950))
(check-sat)
