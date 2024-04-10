; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25710 () Bool)

(assert start!25710)

(declare-fun res!130915 () Bool)

(declare-fun e!172475 () Bool)

(assert (=> start!25710 (=> (not res!130915) (not e!172475))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25710 (= res!130915 (validMask!0 mask!4002))))

(assert (=> start!25710 e!172475))

(assert (=> start!25710 true))

(declare-datatypes ((array!12889 0))(
  ( (array!12890 (arr!6099 (Array (_ BitVec 32) (_ BitVec 64))) (size!6451 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12889)

(declare-fun array_inv!4062 (array!12889) Bool)

(assert (=> start!25710 (array_inv!4062 a!3436)))

(declare-fun b!266616 () Bool)

(declare-fun res!130914 () Bool)

(declare-fun e!172474 () Bool)

(assert (=> b!266616 (=> (not res!130914) (not e!172474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12889 (_ BitVec 32)) Bool)

(assert (=> b!266616 (= res!130914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266617 () Bool)

(declare-fun res!130913 () Bool)

(assert (=> b!266617 (=> (not res!130913) (not e!172475))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266617 (= res!130913 (and (= (size!6451 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6451 a!3436))))))

(declare-fun b!266618 () Bool)

(assert (=> b!266618 (= e!172475 e!172474)))

(declare-fun res!130917 () Bool)

(assert (=> b!266618 (=> (not res!130917) (not e!172474))))

(declare-datatypes ((SeekEntryResult!1290 0))(
  ( (MissingZero!1290 (index!7330 (_ BitVec 32))) (Found!1290 (index!7331 (_ BitVec 32))) (Intermediate!1290 (undefined!2102 Bool) (index!7332 (_ BitVec 32)) (x!25631 (_ BitVec 32))) (Undefined!1290) (MissingVacant!1290 (index!7333 (_ BitVec 32))) )
))
(declare-fun lt!134476 () SeekEntryResult!1290)

(assert (=> b!266618 (= res!130917 (or (= lt!134476 (MissingZero!1290 i!1355)) (= lt!134476 (MissingVacant!1290 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12889 (_ BitVec 32)) SeekEntryResult!1290)

(assert (=> b!266618 (= lt!134476 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266619 () Bool)

(assert (=> b!266619 (= e!172474 false)))

(declare-fun lt!134475 () Bool)

(declare-datatypes ((List!3913 0))(
  ( (Nil!3910) (Cons!3909 (h!4576 (_ BitVec 64)) (t!8995 List!3913)) )
))
(declare-fun arrayNoDuplicates!0 (array!12889 (_ BitVec 32) List!3913) Bool)

(assert (=> b!266619 (= lt!134475 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3910))))

(declare-fun b!266620 () Bool)

(declare-fun res!130912 () Bool)

(assert (=> b!266620 (=> (not res!130912) (not e!172475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266620 (= res!130912 (validKeyInArray!0 k0!2698))))

(declare-fun b!266621 () Bool)

(declare-fun res!130916 () Bool)

(assert (=> b!266621 (=> (not res!130916) (not e!172475))))

(declare-fun arrayContainsKey!0 (array!12889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266621 (= res!130916 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25710 res!130915) b!266617))

(assert (= (and b!266617 res!130913) b!266620))

(assert (= (and b!266620 res!130912) b!266621))

(assert (= (and b!266621 res!130916) b!266618))

(assert (= (and b!266618 res!130917) b!266616))

(assert (= (and b!266616 res!130914) b!266619))

(declare-fun m!283175 () Bool)

(assert (=> b!266618 m!283175))

(declare-fun m!283177 () Bool)

(assert (=> b!266621 m!283177))

(declare-fun m!283179 () Bool)

(assert (=> b!266619 m!283179))

(declare-fun m!283181 () Bool)

(assert (=> b!266620 m!283181))

(declare-fun m!283183 () Bool)

(assert (=> b!266616 m!283183))

(declare-fun m!283185 () Bool)

(assert (=> start!25710 m!283185))

(declare-fun m!283187 () Bool)

(assert (=> start!25710 m!283187))

(check-sat (not start!25710) (not b!266616) (not b!266621) (not b!266619) (not b!266620) (not b!266618))
(check-sat)
