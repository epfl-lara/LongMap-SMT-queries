; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25990 () Bool)

(assert start!25990)

(declare-datatypes ((array!13087 0))(
  ( (array!13088 (arr!6193 (Array (_ BitVec 32) (_ BitVec 64))) (size!6545 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13087)

(declare-fun b!268171 () Bool)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun e!173254 () Bool)

(declare-datatypes ((SeekEntryResult!1351 0))(
  ( (MissingZero!1351 (index!7574 (_ BitVec 32))) (Found!1351 (index!7575 (_ BitVec 32))) (Intermediate!1351 (undefined!2163 Bool) (index!7576 (_ BitVec 32)) (x!25940 (_ BitVec 32))) (Undefined!1351) (MissingVacant!1351 (index!7577 (_ BitVec 32))) )
))
(declare-fun lt!134800 () SeekEntryResult!1351)

(assert (=> b!268171 (= e!173254 (and (or (= lt!134800 (MissingZero!1351 i!1267)) (= lt!134800 (MissingVacant!1351 i!1267))) (bvsgt #b00000000000000000000000000000000 (size!6545 a!3325))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13087 (_ BitVec 32)) SeekEntryResult!1351)

(assert (=> b!268171 (= lt!134800 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268172 () Bool)

(declare-fun res!132451 () Bool)

(assert (=> b!268172 (=> (not res!132451) (not e!173254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268172 (= res!132451 (validKeyInArray!0 k!2581))))

(declare-fun res!132452 () Bool)

(assert (=> start!25990 (=> (not res!132452) (not e!173254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25990 (= res!132452 (validMask!0 mask!3868))))

(assert (=> start!25990 e!173254))

(declare-fun array_inv!4156 (array!13087) Bool)

(assert (=> start!25990 (array_inv!4156 a!3325)))

(assert (=> start!25990 true))

(declare-fun b!268173 () Bool)

(declare-fun res!132449 () Bool)

(assert (=> b!268173 (=> (not res!132449) (not e!173254))))

(declare-datatypes ((List!4001 0))(
  ( (Nil!3998) (Cons!3997 (h!4664 (_ BitVec 64)) (t!9083 List!4001)) )
))
(declare-fun arrayNoDuplicates!0 (array!13087 (_ BitVec 32) List!4001) Bool)

(assert (=> b!268173 (= res!132449 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3998))))

(declare-fun b!268174 () Bool)

(declare-fun res!132450 () Bool)

(assert (=> b!268174 (=> (not res!132450) (not e!173254))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268174 (= res!132450 (and (= (size!6545 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6545 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6545 a!3325))))))

(declare-fun b!268175 () Bool)

(declare-fun res!132453 () Bool)

(assert (=> b!268175 (=> (not res!132453) (not e!173254))))

(declare-fun arrayContainsKey!0 (array!13087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268175 (= res!132453 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25990 res!132452) b!268174))

(assert (= (and b!268174 res!132450) b!268172))

(assert (= (and b!268172 res!132451) b!268173))

(assert (= (and b!268173 res!132449) b!268175))

(assert (= (and b!268175 res!132453) b!268171))

(declare-fun m!284367 () Bool)

(assert (=> b!268171 m!284367))

(declare-fun m!284369 () Bool)

(assert (=> b!268172 m!284369))

(declare-fun m!284371 () Bool)

(assert (=> b!268175 m!284371))

(declare-fun m!284373 () Bool)

(assert (=> b!268173 m!284373))

(declare-fun m!284375 () Bool)

(assert (=> start!25990 m!284375))

(declare-fun m!284377 () Bool)

(assert (=> start!25990 m!284377))

(push 1)

(assert (not start!25990))

(assert (not b!268175))

(assert (not b!268173))

(assert (not b!268172))

(assert (not b!268171))

(check-sat)

(pop 1)

