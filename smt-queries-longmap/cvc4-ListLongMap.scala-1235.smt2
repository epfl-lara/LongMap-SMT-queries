; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25972 () Bool)

(assert start!25972)

(declare-fun b!268036 () Bool)

(declare-fun res!132315 () Bool)

(declare-fun e!173201 () Bool)

(assert (=> b!268036 (=> (not res!132315) (not e!173201))))

(declare-datatypes ((array!13069 0))(
  ( (array!13070 (arr!6184 (Array (_ BitVec 32) (_ BitVec 64))) (size!6536 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13069)

(declare-datatypes ((List!3992 0))(
  ( (Nil!3989) (Cons!3988 (h!4655 (_ BitVec 64)) (t!9074 List!3992)) )
))
(declare-fun arrayNoDuplicates!0 (array!13069 (_ BitVec 32) List!3992) Bool)

(assert (=> b!268036 (= res!132315 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3989))))

(declare-fun b!268037 () Bool)

(declare-fun res!132316 () Bool)

(assert (=> b!268037 (=> (not res!132316) (not e!173201))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268037 (= res!132316 (validKeyInArray!0 k!2581))))

(declare-fun b!268038 () Bool)

(declare-fun res!132314 () Bool)

(assert (=> b!268038 (=> (not res!132314) (not e!173201))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268038 (= res!132314 (and (= (size!6536 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6536 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6536 a!3325))))))

(declare-fun b!268039 () Bool)

(declare-fun res!132318 () Bool)

(assert (=> b!268039 (=> (not res!132318) (not e!173201))))

(declare-fun arrayContainsKey!0 (array!13069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268039 (= res!132318 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268040 () Bool)

(assert (=> b!268040 (= e!173201 false)))

(declare-datatypes ((SeekEntryResult!1342 0))(
  ( (MissingZero!1342 (index!7538 (_ BitVec 32))) (Found!1342 (index!7539 (_ BitVec 32))) (Intermediate!1342 (undefined!2154 Bool) (index!7540 (_ BitVec 32)) (x!25907 (_ BitVec 32))) (Undefined!1342) (MissingVacant!1342 (index!7541 (_ BitVec 32))) )
))
(declare-fun lt!134773 () SeekEntryResult!1342)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13069 (_ BitVec 32)) SeekEntryResult!1342)

(assert (=> b!268040 (= lt!134773 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132317 () Bool)

(assert (=> start!25972 (=> (not res!132317) (not e!173201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25972 (= res!132317 (validMask!0 mask!3868))))

(assert (=> start!25972 e!173201))

(declare-fun array_inv!4147 (array!13069) Bool)

(assert (=> start!25972 (array_inv!4147 a!3325)))

(assert (=> start!25972 true))

(assert (= (and start!25972 res!132317) b!268038))

(assert (= (and b!268038 res!132314) b!268037))

(assert (= (and b!268037 res!132316) b!268036))

(assert (= (and b!268036 res!132315) b!268039))

(assert (= (and b!268039 res!132318) b!268040))

(declare-fun m!284259 () Bool)

(assert (=> start!25972 m!284259))

(declare-fun m!284261 () Bool)

(assert (=> start!25972 m!284261))

(declare-fun m!284263 () Bool)

(assert (=> b!268039 m!284263))

(declare-fun m!284265 () Bool)

(assert (=> b!268036 m!284265))

(declare-fun m!284267 () Bool)

(assert (=> b!268037 m!284267))

(declare-fun m!284269 () Bool)

(assert (=> b!268040 m!284269))

(push 1)

(assert (not start!25972))

(assert (not b!268037))

(assert (not b!268036))

(assert (not b!268040))

(assert (not b!268039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

