; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25736 () Bool)

(assert start!25736)

(declare-fun b!266863 () Bool)

(declare-fun res!131137 () Bool)

(declare-fun e!172598 () Bool)

(assert (=> b!266863 (=> (not res!131137) (not e!172598))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266863 (= res!131137 (validKeyInArray!0 k0!2698))))

(declare-fun b!266864 () Bool)

(declare-fun e!172596 () Bool)

(assert (=> b!266864 (= e!172598 e!172596)))

(declare-fun res!131139 () Bool)

(assert (=> b!266864 (=> (not res!131139) (not e!172596))))

(declare-datatypes ((SeekEntryResult!1265 0))(
  ( (MissingZero!1265 (index!7230 (_ BitVec 32))) (Found!1265 (index!7231 (_ BitVec 32))) (Intermediate!1265 (undefined!2077 Bool) (index!7232 (_ BitVec 32)) (x!25638 (_ BitVec 32))) (Undefined!1265) (MissingVacant!1265 (index!7233 (_ BitVec 32))) )
))
(declare-fun lt!134598 () SeekEntryResult!1265)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266864 (= res!131139 (or (= lt!134598 (MissingZero!1265 i!1355)) (= lt!134598 (MissingVacant!1265 i!1355))))))

(declare-datatypes ((array!12910 0))(
  ( (array!12911 (arr!6109 (Array (_ BitVec 32) (_ BitVec 64))) (size!6461 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12910)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12910 (_ BitVec 32)) SeekEntryResult!1265)

(assert (=> b!266864 (= lt!134598 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266865 () Bool)

(assert (=> b!266865 (= e!172596 (bvsge #b00000000000000000000000000000000 (size!6461 a!3436)))))

(declare-fun b!266866 () Bool)

(declare-fun res!131135 () Bool)

(assert (=> b!266866 (=> (not res!131135) (not e!172596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12910 (_ BitVec 32)) Bool)

(assert (=> b!266866 (= res!131135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131133 () Bool)

(assert (=> start!25736 (=> (not res!131133) (not e!172598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25736 (= res!131133 (validMask!0 mask!4002))))

(assert (=> start!25736 e!172598))

(assert (=> start!25736 true))

(declare-fun array_inv!4059 (array!12910) Bool)

(assert (=> start!25736 (array_inv!4059 a!3436)))

(declare-fun b!266867 () Bool)

(declare-fun res!131136 () Bool)

(assert (=> b!266867 (=> (not res!131136) (not e!172598))))

(declare-fun arrayContainsKey!0 (array!12910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266867 (= res!131136 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266868 () Bool)

(declare-fun res!131134 () Bool)

(assert (=> b!266868 (=> (not res!131134) (not e!172598))))

(assert (=> b!266868 (= res!131134 (and (= (size!6461 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6461 a!3436))))))

(declare-fun b!266869 () Bool)

(declare-fun res!131138 () Bool)

(assert (=> b!266869 (=> (not res!131138) (not e!172596))))

(declare-datatypes ((List!3836 0))(
  ( (Nil!3833) (Cons!3832 (h!4499 (_ BitVec 64)) (t!8910 List!3836)) )
))
(declare-fun arrayNoDuplicates!0 (array!12910 (_ BitVec 32) List!3836) Bool)

(assert (=> b!266869 (= res!131138 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3833))))

(assert (= (and start!25736 res!131133) b!266868))

(assert (= (and b!266868 res!131134) b!266863))

(assert (= (and b!266863 res!131137) b!266867))

(assert (= (and b!266867 res!131136) b!266864))

(assert (= (and b!266864 res!131139) b!266866))

(assert (= (and b!266866 res!131135) b!266869))

(assert (= (and b!266869 res!131138) b!266865))

(declare-fun m!283535 () Bool)

(assert (=> b!266864 m!283535))

(declare-fun m!283537 () Bool)

(assert (=> start!25736 m!283537))

(declare-fun m!283539 () Bool)

(assert (=> start!25736 m!283539))

(declare-fun m!283541 () Bool)

(assert (=> b!266869 m!283541))

(declare-fun m!283543 () Bool)

(assert (=> b!266866 m!283543))

(declare-fun m!283545 () Bool)

(assert (=> b!266867 m!283545))

(declare-fun m!283547 () Bool)

(assert (=> b!266863 m!283547))

(check-sat (not start!25736) (not b!266864) (not b!266869) (not b!266867) (not b!266863) (not b!266866))
(check-sat)
