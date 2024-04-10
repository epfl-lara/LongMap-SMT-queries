; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25650 () Bool)

(assert start!25650)

(declare-fun b!266004 () Bool)

(declare-fun res!130300 () Bool)

(declare-fun e!172203 () Bool)

(assert (=> b!266004 (=> (not res!130300) (not e!172203))))

(declare-datatypes ((array!12829 0))(
  ( (array!12830 (arr!6069 (Array (_ BitVec 32) (_ BitVec 64))) (size!6421 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12829)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266004 (= res!130300 (and (= (size!6421 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6421 a!3436))))))

(declare-fun b!266005 () Bool)

(declare-fun res!130303 () Bool)

(declare-fun e!172204 () Bool)

(assert (=> b!266005 (=> (not res!130303) (not e!172204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12829 (_ BitVec 32)) Bool)

(assert (=> b!266005 (= res!130303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266006 () Bool)

(assert (=> b!266006 (= e!172204 false)))

(declare-fun lt!134295 () Bool)

(declare-datatypes ((List!3883 0))(
  ( (Nil!3880) (Cons!3879 (h!4546 (_ BitVec 64)) (t!8965 List!3883)) )
))
(declare-fun arrayNoDuplicates!0 (array!12829 (_ BitVec 32) List!3883) Bool)

(assert (=> b!266006 (= lt!134295 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3880))))

(declare-fun res!130301 () Bool)

(assert (=> start!25650 (=> (not res!130301) (not e!172203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25650 (= res!130301 (validMask!0 mask!4002))))

(assert (=> start!25650 e!172203))

(assert (=> start!25650 true))

(declare-fun array_inv!4032 (array!12829) Bool)

(assert (=> start!25650 (array_inv!4032 a!3436)))

(declare-fun b!266007 () Bool)

(declare-fun res!130305 () Bool)

(assert (=> b!266007 (=> (not res!130305) (not e!172203))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266007 (= res!130305 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266008 () Bool)

(declare-fun res!130304 () Bool)

(assert (=> b!266008 (=> (not res!130304) (not e!172203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266008 (= res!130304 (validKeyInArray!0 k0!2698))))

(declare-fun b!266009 () Bool)

(assert (=> b!266009 (= e!172203 e!172204)))

(declare-fun res!130302 () Bool)

(assert (=> b!266009 (=> (not res!130302) (not e!172204))))

(declare-datatypes ((SeekEntryResult!1260 0))(
  ( (MissingZero!1260 (index!7210 (_ BitVec 32))) (Found!1260 (index!7211 (_ BitVec 32))) (Intermediate!1260 (undefined!2072 Bool) (index!7212 (_ BitVec 32)) (x!25521 (_ BitVec 32))) (Undefined!1260) (MissingVacant!1260 (index!7213 (_ BitVec 32))) )
))
(declare-fun lt!134296 () SeekEntryResult!1260)

(assert (=> b!266009 (= res!130302 (or (= lt!134296 (MissingZero!1260 i!1355)) (= lt!134296 (MissingVacant!1260 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12829 (_ BitVec 32)) SeekEntryResult!1260)

(assert (=> b!266009 (= lt!134296 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25650 res!130301) b!266004))

(assert (= (and b!266004 res!130300) b!266008))

(assert (= (and b!266008 res!130304) b!266007))

(assert (= (and b!266007 res!130305) b!266009))

(assert (= (and b!266009 res!130302) b!266005))

(assert (= (and b!266005 res!130303) b!266006))

(declare-fun m!282683 () Bool)

(assert (=> b!266005 m!282683))

(declare-fun m!282685 () Bool)

(assert (=> b!266009 m!282685))

(declare-fun m!282687 () Bool)

(assert (=> start!25650 m!282687))

(declare-fun m!282689 () Bool)

(assert (=> start!25650 m!282689))

(declare-fun m!282691 () Bool)

(assert (=> b!266006 m!282691))

(declare-fun m!282693 () Bool)

(assert (=> b!266007 m!282693))

(declare-fun m!282695 () Bool)

(assert (=> b!266008 m!282695))

(check-sat (not b!266008) (not b!266005) (not b!266006) (not b!266007) (not start!25650) (not b!266009))
(check-sat)
