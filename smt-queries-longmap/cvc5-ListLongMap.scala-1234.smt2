; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25966 () Bool)

(assert start!25966)

(declare-fun b!268038 () Bool)

(declare-fun res!132290 () Bool)

(declare-fun e!173207 () Bool)

(assert (=> b!268038 (=> (not res!132290) (not e!173207))))

(declare-datatypes ((array!13062 0))(
  ( (array!13063 (arr!6180 (Array (_ BitVec 32) (_ BitVec 64))) (size!6532 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13062)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268038 (= res!132290 (and (= (size!6532 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6532 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6532 a!3325))))))

(declare-fun b!268039 () Bool)

(declare-fun res!132293 () Bool)

(assert (=> b!268039 (=> (not res!132293) (not e!173207))))

(declare-datatypes ((List!3901 0))(
  ( (Nil!3898) (Cons!3897 (h!4564 (_ BitVec 64)) (t!8975 List!3901)) )
))
(declare-fun arrayNoDuplicates!0 (array!13062 (_ BitVec 32) List!3901) Bool)

(assert (=> b!268039 (= res!132293 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3898))))

(declare-fun b!268040 () Bool)

(assert (=> b!268040 (= e!173207 false)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1303 0))(
  ( (MissingZero!1303 (index!7382 (_ BitVec 32))) (Found!1303 (index!7383 (_ BitVec 32))) (Intermediate!1303 (undefined!2115 Bool) (index!7384 (_ BitVec 32)) (x!25860 (_ BitVec 32))) (Undefined!1303) (MissingVacant!1303 (index!7385 (_ BitVec 32))) )
))
(declare-fun lt!134823 () SeekEntryResult!1303)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13062 (_ BitVec 32)) SeekEntryResult!1303)

(assert (=> b!268040 (= lt!134823 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268041 () Bool)

(declare-fun res!132292 () Bool)

(assert (=> b!268041 (=> (not res!132292) (not e!173207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268041 (= res!132292 (validKeyInArray!0 k!2581))))

(declare-fun b!268042 () Bool)

(declare-fun res!132294 () Bool)

(assert (=> b!268042 (=> (not res!132294) (not e!173207))))

(declare-fun arrayContainsKey!0 (array!13062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268042 (= res!132294 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132291 () Bool)

(assert (=> start!25966 (=> (not res!132291) (not e!173207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25966 (= res!132291 (validMask!0 mask!3868))))

(assert (=> start!25966 e!173207))

(declare-fun array_inv!4130 (array!13062) Bool)

(assert (=> start!25966 (array_inv!4130 a!3325)))

(assert (=> start!25966 true))

(assert (= (and start!25966 res!132291) b!268038))

(assert (= (and b!268038 res!132290) b!268041))

(assert (= (and b!268041 res!132292) b!268039))

(assert (= (and b!268039 res!132293) b!268042))

(assert (= (and b!268042 res!132294) b!268040))

(declare-fun m!284429 () Bool)

(assert (=> b!268042 m!284429))

(declare-fun m!284431 () Bool)

(assert (=> b!268041 m!284431))

(declare-fun m!284433 () Bool)

(assert (=> b!268039 m!284433))

(declare-fun m!284435 () Bool)

(assert (=> b!268040 m!284435))

(declare-fun m!284437 () Bool)

(assert (=> start!25966 m!284437))

(declare-fun m!284439 () Bool)

(assert (=> start!25966 m!284439))

(push 1)

(assert (not start!25966))

(assert (not b!268039))

(assert (not b!268040))

(assert (not b!268042))

(assert (not b!268041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

