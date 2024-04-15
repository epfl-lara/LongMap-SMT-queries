; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26084 () Bool)

(assert start!26084)

(declare-fun res!133195 () Bool)

(declare-fun e!173568 () Bool)

(assert (=> start!26084 (=> (not res!133195) (not e!173568))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26084 (= res!133195 (validMask!0 mask!3868))))

(assert (=> start!26084 e!173568))

(declare-datatypes ((array!13170 0))(
  ( (array!13171 (arr!6234 (Array (_ BitVec 32) (_ BitVec 64))) (size!6587 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13170)

(declare-fun array_inv!4206 (array!13170) Bool)

(assert (=> start!26084 (array_inv!4206 a!3325)))

(assert (=> start!26084 true))

(declare-fun b!268860 () Bool)

(declare-fun res!133191 () Bool)

(assert (=> b!268860 (=> (not res!133191) (not e!173568))))

(declare-datatypes ((List!4015 0))(
  ( (Nil!4012) (Cons!4011 (h!4678 (_ BitVec 64)) (t!9088 List!4015)) )
))
(declare-fun arrayNoDuplicates!0 (array!13170 (_ BitVec 32) List!4015) Bool)

(assert (=> b!268860 (= res!133191 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4012))))

(declare-fun b!268861 () Bool)

(declare-fun res!133193 () Bool)

(assert (=> b!268861 (=> (not res!133193) (not e!173568))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268861 (= res!133193 (validKeyInArray!0 k0!2581))))

(declare-fun b!268862 () Bool)

(declare-fun res!133190 () Bool)

(assert (=> b!268862 (=> (not res!133190) (not e!173568))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268862 (= res!133190 (and (= (size!6587 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6587 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6587 a!3325))))))

(declare-fun b!268863 () Bool)

(declare-fun res!133192 () Bool)

(assert (=> b!268863 (=> (not res!133192) (not e!173568))))

(declare-fun arrayContainsKey!0 (array!13170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268863 (= res!133192 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268864 () Bool)

(declare-fun e!173567 () Bool)

(assert (=> b!268864 (= e!173568 e!173567)))

(declare-fun res!133194 () Bool)

(assert (=> b!268864 (=> (not res!133194) (not e!173567))))

(declare-datatypes ((SeekEntryResult!1391 0))(
  ( (MissingZero!1391 (index!7734 (_ BitVec 32))) (Found!1391 (index!7735 (_ BitVec 32))) (Intermediate!1391 (undefined!2203 Bool) (index!7736 (_ BitVec 32)) (x!26107 (_ BitVec 32))) (Undefined!1391) (MissingVacant!1391 (index!7737 (_ BitVec 32))) )
))
(declare-fun lt!134885 () SeekEntryResult!1391)

(assert (=> b!268864 (= res!133194 (or (= lt!134885 (MissingZero!1391 i!1267)) (= lt!134885 (MissingVacant!1391 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13170 (_ BitVec 32)) SeekEntryResult!1391)

(assert (=> b!268864 (= lt!134885 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268865 () Bool)

(assert (=> b!268865 (= e!173567 false)))

(declare-fun lt!134886 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13170 (_ BitVec 32)) Bool)

(assert (=> b!268865 (= lt!134886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26084 res!133195) b!268862))

(assert (= (and b!268862 res!133190) b!268861))

(assert (= (and b!268861 res!133193) b!268860))

(assert (= (and b!268860 res!133191) b!268863))

(assert (= (and b!268863 res!133192) b!268864))

(assert (= (and b!268864 res!133194) b!268865))

(declare-fun m!284417 () Bool)

(assert (=> b!268861 m!284417))

(declare-fun m!284419 () Bool)

(assert (=> b!268865 m!284419))

(declare-fun m!284421 () Bool)

(assert (=> b!268863 m!284421))

(declare-fun m!284423 () Bool)

(assert (=> b!268860 m!284423))

(declare-fun m!284425 () Bool)

(assert (=> b!268864 m!284425))

(declare-fun m!284427 () Bool)

(assert (=> start!26084 m!284427))

(declare-fun m!284429 () Bool)

(assert (=> start!26084 m!284429))

(check-sat (not start!26084) (not b!268864) (not b!268865) (not b!268861) (not b!268863) (not b!268860))
(check-sat)
