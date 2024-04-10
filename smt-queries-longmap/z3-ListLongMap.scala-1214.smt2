; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25752 () Bool)

(assert start!25752)

(declare-fun b!267003 () Bool)

(declare-fun res!131303 () Bool)

(declare-fun e!172662 () Bool)

(assert (=> b!267003 (=> (not res!131303) (not e!172662))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267003 (= res!131303 (validKeyInArray!0 k0!2698))))

(declare-fun b!267004 () Bool)

(declare-fun res!131300 () Bool)

(assert (=> b!267004 (=> (not res!131300) (not e!172662))))

(declare-datatypes ((array!12931 0))(
  ( (array!12932 (arr!6120 (Array (_ BitVec 32) (_ BitVec 64))) (size!6472 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12931)

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!267004 (= res!131300 (and (= (size!6472 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6472 a!3436))))))

(declare-fun b!267005 () Bool)

(declare-fun res!131302 () Bool)

(declare-fun e!172664 () Bool)

(assert (=> b!267005 (=> (not res!131302) (not e!172664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12931 (_ BitVec 32)) Bool)

(assert (=> b!267005 (= res!131302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131301 () Bool)

(assert (=> start!25752 (=> (not res!131301) (not e!172662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25752 (= res!131301 (validMask!0 mask!4002))))

(assert (=> start!25752 e!172662))

(assert (=> start!25752 true))

(declare-fun array_inv!4083 (array!12931) Bool)

(assert (=> start!25752 (array_inv!4083 a!3436)))

(declare-fun b!267006 () Bool)

(declare-fun res!131304 () Bool)

(assert (=> b!267006 (=> (not res!131304) (not e!172662))))

(declare-fun arrayContainsKey!0 (array!12931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267006 (= res!131304 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267007 () Bool)

(assert (=> b!267007 (= e!172662 e!172664)))

(declare-fun res!131299 () Bool)

(assert (=> b!267007 (=> (not res!131299) (not e!172664))))

(declare-datatypes ((SeekEntryResult!1311 0))(
  ( (MissingZero!1311 (index!7414 (_ BitVec 32))) (Found!1311 (index!7415 (_ BitVec 32))) (Intermediate!1311 (undefined!2123 Bool) (index!7416 (_ BitVec 32)) (x!25708 (_ BitVec 32))) (Undefined!1311) (MissingVacant!1311 (index!7417 (_ BitVec 32))) )
))
(declare-fun lt!134593 () SeekEntryResult!1311)

(assert (=> b!267007 (= res!131299 (or (= lt!134593 (MissingZero!1311 i!1355)) (= lt!134593 (MissingVacant!1311 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12931 (_ BitVec 32)) SeekEntryResult!1311)

(assert (=> b!267007 (= lt!134593 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267008 () Bool)

(assert (=> b!267008 (= e!172664 false)))

(declare-fun lt!134592 () Bool)

(declare-datatypes ((List!3934 0))(
  ( (Nil!3931) (Cons!3930 (h!4597 (_ BitVec 64)) (t!9016 List!3934)) )
))
(declare-fun arrayNoDuplicates!0 (array!12931 (_ BitVec 32) List!3934) Bool)

(assert (=> b!267008 (= lt!134592 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3931))))

(assert (= (and start!25752 res!131301) b!267004))

(assert (= (and b!267004 res!131300) b!267003))

(assert (= (and b!267003 res!131303) b!267006))

(assert (= (and b!267006 res!131304) b!267007))

(assert (= (and b!267007 res!131299) b!267005))

(assert (= (and b!267005 res!131302) b!267008))

(declare-fun m!283469 () Bool)

(assert (=> b!267008 m!283469))

(declare-fun m!283471 () Bool)

(assert (=> start!25752 m!283471))

(declare-fun m!283473 () Bool)

(assert (=> start!25752 m!283473))

(declare-fun m!283475 () Bool)

(assert (=> b!267007 m!283475))

(declare-fun m!283477 () Bool)

(assert (=> b!267003 m!283477))

(declare-fun m!283479 () Bool)

(assert (=> b!267005 m!283479))

(declare-fun m!283481 () Bool)

(assert (=> b!267006 m!283481))

(check-sat (not b!267006) (not b!267003) (not b!267007) (not start!25752) (not b!267008) (not b!267005))
(check-sat)
