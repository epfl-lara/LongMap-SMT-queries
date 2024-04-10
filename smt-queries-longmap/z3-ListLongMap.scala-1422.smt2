; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27560 () Bool)

(assert start!27560)

(declare-fun res!147263 () Bool)

(declare-fun e!180590 () Bool)

(assert (=> start!27560 (=> (not res!147263) (not e!180590))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27560 (= res!147263 (validMask!0 mask!3868))))

(assert (=> start!27560 e!180590))

(declare-datatypes ((array!14210 0))(
  ( (array!14211 (arr!6744 (Array (_ BitVec 32) (_ BitVec 64))) (size!7096 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14210)

(declare-fun array_inv!4707 (array!14210) Bool)

(assert (=> start!27560 (array_inv!4707 a!3325)))

(assert (=> start!27560 true))

(declare-fun b!284754 () Bool)

(declare-fun e!180588 () Bool)

(assert (=> b!284754 (= e!180590 e!180588)))

(declare-fun res!147264 () Bool)

(assert (=> b!284754 (=> (not res!147264) (not e!180588))))

(declare-datatypes ((SeekEntryResult!1902 0))(
  ( (MissingZero!1902 (index!9778 (_ BitVec 32))) (Found!1902 (index!9779 (_ BitVec 32))) (Intermediate!1902 (undefined!2714 Bool) (index!9780 (_ BitVec 32)) (x!27981 (_ BitVec 32))) (Undefined!1902) (MissingVacant!1902 (index!9781 (_ BitVec 32))) )
))
(declare-fun lt!140607 () SeekEntryResult!1902)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284754 (= res!147264 (or (= lt!140607 (MissingZero!1902 i!1267)) (= lt!140607 (MissingVacant!1902 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14210 (_ BitVec 32)) SeekEntryResult!1902)

(assert (=> b!284754 (= lt!140607 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284755 () Bool)

(declare-fun res!147266 () Bool)

(assert (=> b!284755 (=> (not res!147266) (not e!180590))))

(declare-datatypes ((List!4552 0))(
  ( (Nil!4549) (Cons!4548 (h!5221 (_ BitVec 64)) (t!9634 List!4552)) )
))
(declare-fun arrayNoDuplicates!0 (array!14210 (_ BitVec 32) List!4552) Bool)

(assert (=> b!284755 (= res!147266 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4549))))

(declare-fun b!284756 () Bool)

(declare-fun res!147265 () Bool)

(assert (=> b!284756 (=> (not res!147265) (not e!180590))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284756 (= res!147265 (and (= (size!7096 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7096 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7096 a!3325))))))

(declare-fun b!284757 () Bool)

(assert (=> b!284757 (= e!180588 false)))

(declare-fun lt!140608 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14210 (_ BitVec 32)) Bool)

(assert (=> b!284757 (= lt!140608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284758 () Bool)

(declare-fun res!147262 () Bool)

(assert (=> b!284758 (=> (not res!147262) (not e!180590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284758 (= res!147262 (validKeyInArray!0 k0!2581))))

(declare-fun b!284759 () Bool)

(declare-fun res!147267 () Bool)

(assert (=> b!284759 (=> (not res!147267) (not e!180590))))

(declare-fun arrayContainsKey!0 (array!14210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284759 (= res!147267 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27560 res!147263) b!284756))

(assert (= (and b!284756 res!147265) b!284758))

(assert (= (and b!284758 res!147262) b!284755))

(assert (= (and b!284755 res!147266) b!284759))

(assert (= (and b!284759 res!147267) b!284754))

(assert (= (and b!284754 res!147264) b!284757))

(declare-fun m!299699 () Bool)

(assert (=> b!284755 m!299699))

(declare-fun m!299701 () Bool)

(assert (=> b!284758 m!299701))

(declare-fun m!299703 () Bool)

(assert (=> b!284759 m!299703))

(declare-fun m!299705 () Bool)

(assert (=> start!27560 m!299705))

(declare-fun m!299707 () Bool)

(assert (=> start!27560 m!299707))

(declare-fun m!299709 () Bool)

(assert (=> b!284754 m!299709))

(declare-fun m!299711 () Bool)

(assert (=> b!284757 m!299711))

(check-sat (not b!284754) (not start!27560) (not b!284757) (not b!284759) (not b!284755) (not b!284758))
(check-sat)
