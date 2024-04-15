; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27572 () Bool)

(assert start!27572)

(declare-fun b!284697 () Bool)

(declare-fun res!147259 () Bool)

(declare-fun e!180532 () Bool)

(assert (=> b!284697 (=> (not res!147259) (not e!180532))))

(declare-datatypes ((array!14211 0))(
  ( (array!14212 (arr!6744 (Array (_ BitVec 32) (_ BitVec 64))) (size!7097 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14211)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284697 (= res!147259 (and (= (size!7097 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7097 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7097 a!3325))))))

(declare-fun b!284698 () Bool)

(declare-fun e!180533 () Bool)

(assert (=> b!284698 (= e!180532 e!180533)))

(declare-fun res!147262 () Bool)

(assert (=> b!284698 (=> (not res!147262) (not e!180533))))

(declare-datatypes ((SeekEntryResult!1901 0))(
  ( (MissingZero!1901 (index!9774 (_ BitVec 32))) (Found!1901 (index!9775 (_ BitVec 32))) (Intermediate!1901 (undefined!2713 Bool) (index!9776 (_ BitVec 32)) (x!27995 (_ BitVec 32))) (Undefined!1901) (MissingVacant!1901 (index!9777 (_ BitVec 32))) )
))
(declare-fun lt!140456 () SeekEntryResult!1901)

(assert (=> b!284698 (= res!147262 (or (= lt!140456 (MissingZero!1901 i!1267)) (= lt!140456 (MissingVacant!1901 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14211 (_ BitVec 32)) SeekEntryResult!1901)

(assert (=> b!284698 (= lt!140456 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284699 () Bool)

(declare-fun res!147257 () Bool)

(assert (=> b!284699 (=> (not res!147257) (not e!180532))))

(declare-fun arrayContainsKey!0 (array!14211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284699 (= res!147257 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!147258 () Bool)

(assert (=> start!27572 (=> (not res!147258) (not e!180532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27572 (= res!147258 (validMask!0 mask!3868))))

(assert (=> start!27572 e!180532))

(declare-fun array_inv!4716 (array!14211) Bool)

(assert (=> start!27572 (array_inv!4716 a!3325)))

(assert (=> start!27572 true))

(declare-fun b!284700 () Bool)

(declare-fun res!147261 () Bool)

(assert (=> b!284700 (=> (not res!147261) (not e!180532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284700 (= res!147261 (validKeyInArray!0 k0!2581))))

(declare-fun b!284701 () Bool)

(assert (=> b!284701 (= e!180533 false)))

(declare-fun lt!140457 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14211 (_ BitVec 32)) Bool)

(assert (=> b!284701 (= lt!140457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284702 () Bool)

(declare-fun res!147260 () Bool)

(assert (=> b!284702 (=> (not res!147260) (not e!180532))))

(declare-datatypes ((List!4525 0))(
  ( (Nil!4522) (Cons!4521 (h!5194 (_ BitVec 64)) (t!9598 List!4525)) )
))
(declare-fun arrayNoDuplicates!0 (array!14211 (_ BitVec 32) List!4525) Bool)

(assert (=> b!284702 (= res!147260 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4522))))

(assert (= (and start!27572 res!147258) b!284697))

(assert (= (and b!284697 res!147259) b!284700))

(assert (= (and b!284700 res!147261) b!284702))

(assert (= (and b!284702 res!147260) b!284699))

(assert (= (and b!284699 res!147257) b!284698))

(assert (= (and b!284698 res!147262) b!284701))

(declare-fun m!299177 () Bool)

(assert (=> b!284699 m!299177))

(declare-fun m!299179 () Bool)

(assert (=> b!284700 m!299179))

(declare-fun m!299181 () Bool)

(assert (=> b!284701 m!299181))

(declare-fun m!299183 () Bool)

(assert (=> b!284698 m!299183))

(declare-fun m!299185 () Bool)

(assert (=> start!27572 m!299185))

(declare-fun m!299187 () Bool)

(assert (=> start!27572 m!299187))

(declare-fun m!299189 () Bool)

(assert (=> b!284702 m!299189))

(check-sat (not b!284699) (not b!284698) (not start!27572) (not b!284701) (not b!284700) (not b!284702))
(check-sat)
