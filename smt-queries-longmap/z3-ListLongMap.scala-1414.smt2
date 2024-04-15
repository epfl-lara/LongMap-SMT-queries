; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27512 () Bool)

(assert start!27512)

(declare-fun b!284130 () Bool)

(declare-fun e!180263 () Bool)

(declare-fun e!180262 () Bool)

(assert (=> b!284130 (= e!180263 e!180262)))

(declare-fun res!146690 () Bool)

(assert (=> b!284130 (=> (not res!146690) (not e!180262))))

(declare-datatypes ((SeekEntryResult!1871 0))(
  ( (MissingZero!1871 (index!9654 (_ BitVec 32))) (Found!1871 (index!9655 (_ BitVec 32))) (Intermediate!1871 (undefined!2683 Bool) (index!9656 (_ BitVec 32)) (x!27885 (_ BitVec 32))) (Undefined!1871) (MissingVacant!1871 (index!9657 (_ BitVec 32))) )
))
(declare-fun lt!140285 () SeekEntryResult!1871)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284130 (= res!146690 (or (= lt!140285 (MissingZero!1871 i!1267)) (= lt!140285 (MissingVacant!1871 i!1267))))))

(declare-datatypes ((array!14151 0))(
  ( (array!14152 (arr!6714 (Array (_ BitVec 32) (_ BitVec 64))) (size!7067 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14151)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14151 (_ BitVec 32)) SeekEntryResult!1871)

(assert (=> b!284130 (= lt!140285 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284131 () Bool)

(declare-fun res!146695 () Bool)

(assert (=> b!284131 (=> (not res!146695) (not e!180263))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284131 (= res!146695 (and (= (size!7067 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7067 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7067 a!3325))))))

(declare-fun res!146692 () Bool)

(assert (=> start!27512 (=> (not res!146692) (not e!180263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27512 (= res!146692 (validMask!0 mask!3868))))

(assert (=> start!27512 e!180263))

(declare-fun array_inv!4686 (array!14151) Bool)

(assert (=> start!27512 (array_inv!4686 a!3325)))

(assert (=> start!27512 true))

(declare-fun b!284132 () Bool)

(declare-fun res!146694 () Bool)

(assert (=> b!284132 (=> (not res!146694) (not e!180263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284132 (= res!146694 (validKeyInArray!0 k0!2581))))

(declare-fun b!284133 () Bool)

(declare-fun res!146693 () Bool)

(assert (=> b!284133 (=> (not res!146693) (not e!180263))))

(declare-fun arrayContainsKey!0 (array!14151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284133 (= res!146693 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284134 () Bool)

(assert (=> b!284134 (= e!180262 false)))

(declare-fun lt!140286 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14151 (_ BitVec 32)) Bool)

(assert (=> b!284134 (= lt!140286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284135 () Bool)

(declare-fun res!146691 () Bool)

(assert (=> b!284135 (=> (not res!146691) (not e!180263))))

(declare-datatypes ((List!4495 0))(
  ( (Nil!4492) (Cons!4491 (h!5164 (_ BitVec 64)) (t!9568 List!4495)) )
))
(declare-fun arrayNoDuplicates!0 (array!14151 (_ BitVec 32) List!4495) Bool)

(assert (=> b!284135 (= res!146691 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4492))))

(assert (= (and start!27512 res!146692) b!284131))

(assert (= (and b!284131 res!146695) b!284132))

(assert (= (and b!284132 res!146694) b!284135))

(assert (= (and b!284135 res!146691) b!284133))

(assert (= (and b!284133 res!146693) b!284130))

(assert (= (and b!284130 res!146690) b!284134))

(declare-fun m!298745 () Bool)

(assert (=> b!284133 m!298745))

(declare-fun m!298747 () Bool)

(assert (=> start!27512 m!298747))

(declare-fun m!298749 () Bool)

(assert (=> start!27512 m!298749))

(declare-fun m!298751 () Bool)

(assert (=> b!284135 m!298751))

(declare-fun m!298753 () Bool)

(assert (=> b!284130 m!298753))

(declare-fun m!298755 () Bool)

(assert (=> b!284134 m!298755))

(declare-fun m!298757 () Bool)

(assert (=> b!284132 m!298757))

(check-sat (not b!284135) (not b!284134) (not start!27512) (not b!284133) (not b!284130) (not b!284132))
(check-sat)
