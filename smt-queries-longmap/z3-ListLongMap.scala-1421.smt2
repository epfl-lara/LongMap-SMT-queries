; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27554 () Bool)

(assert start!27554)

(declare-fun b!284700 () Bool)

(declare-fun res!147209 () Bool)

(declare-fun e!180563 () Bool)

(assert (=> b!284700 (=> (not res!147209) (not e!180563))))

(declare-datatypes ((array!14204 0))(
  ( (array!14205 (arr!6741 (Array (_ BitVec 32) (_ BitVec 64))) (size!7093 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14204)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284700 (= res!147209 (and (= (size!7093 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7093 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7093 a!3325))))))

(declare-fun b!284701 () Bool)

(declare-fun res!147212 () Bool)

(assert (=> b!284701 (=> (not res!147212) (not e!180563))))

(declare-datatypes ((List!4549 0))(
  ( (Nil!4546) (Cons!4545 (h!5218 (_ BitVec 64)) (t!9631 List!4549)) )
))
(declare-fun arrayNoDuplicates!0 (array!14204 (_ BitVec 32) List!4549) Bool)

(assert (=> b!284701 (= res!147212 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4546))))

(declare-fun res!147211 () Bool)

(assert (=> start!27554 (=> (not res!147211) (not e!180563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27554 (= res!147211 (validMask!0 mask!3868))))

(assert (=> start!27554 e!180563))

(declare-fun array_inv!4704 (array!14204) Bool)

(assert (=> start!27554 (array_inv!4704 a!3325)))

(assert (=> start!27554 true))

(declare-fun b!284702 () Bool)

(declare-fun e!180561 () Bool)

(assert (=> b!284702 (= e!180563 e!180561)))

(declare-fun res!147210 () Bool)

(assert (=> b!284702 (=> (not res!147210) (not e!180561))))

(declare-datatypes ((SeekEntryResult!1899 0))(
  ( (MissingZero!1899 (index!9766 (_ BitVec 32))) (Found!1899 (index!9767 (_ BitVec 32))) (Intermediate!1899 (undefined!2711 Bool) (index!9768 (_ BitVec 32)) (x!27970 (_ BitVec 32))) (Undefined!1899) (MissingVacant!1899 (index!9769 (_ BitVec 32))) )
))
(declare-fun lt!140589 () SeekEntryResult!1899)

(assert (=> b!284702 (= res!147210 (or (= lt!140589 (MissingZero!1899 i!1267)) (= lt!140589 (MissingVacant!1899 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14204 (_ BitVec 32)) SeekEntryResult!1899)

(assert (=> b!284702 (= lt!140589 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284703 () Bool)

(declare-fun res!147208 () Bool)

(assert (=> b!284703 (=> (not res!147208) (not e!180563))))

(declare-fun arrayContainsKey!0 (array!14204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284703 (= res!147208 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284704 () Bool)

(declare-fun res!147213 () Bool)

(assert (=> b!284704 (=> (not res!147213) (not e!180563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284704 (= res!147213 (validKeyInArray!0 k0!2581))))

(declare-fun b!284705 () Bool)

(assert (=> b!284705 (= e!180561 false)))

(declare-fun lt!140590 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14204 (_ BitVec 32)) Bool)

(assert (=> b!284705 (= lt!140590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27554 res!147211) b!284700))

(assert (= (and b!284700 res!147209) b!284704))

(assert (= (and b!284704 res!147213) b!284701))

(assert (= (and b!284701 res!147212) b!284703))

(assert (= (and b!284703 res!147208) b!284702))

(assert (= (and b!284702 res!147210) b!284705))

(declare-fun m!299657 () Bool)

(assert (=> b!284702 m!299657))

(declare-fun m!299659 () Bool)

(assert (=> b!284703 m!299659))

(declare-fun m!299661 () Bool)

(assert (=> start!27554 m!299661))

(declare-fun m!299663 () Bool)

(assert (=> start!27554 m!299663))

(declare-fun m!299665 () Bool)

(assert (=> b!284705 m!299665))

(declare-fun m!299667 () Bool)

(assert (=> b!284704 m!299667))

(declare-fun m!299669 () Bool)

(assert (=> b!284701 m!299669))

(check-sat (not b!284703) (not b!284704) (not b!284705) (not start!27554) (not b!284701) (not b!284702))
(check-sat)
