; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25760 () Bool)

(assert start!25760)

(declare-fun b!266892 () Bool)

(declare-fun res!131245 () Bool)

(declare-fun e!172580 () Bool)

(assert (=> b!266892 (=> (not res!131245) (not e!172580))))

(declare-datatypes ((array!12927 0))(
  ( (array!12928 (arr!6117 (Array (_ BitVec 32) (_ BitVec 64))) (size!6470 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12927)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266892 (= res!131245 (and (= (size!6470 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6470 a!3436))))))

(declare-fun b!266893 () Bool)

(declare-fun res!131243 () Bool)

(assert (=> b!266893 (=> (not res!131243) (not e!172580))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266893 (= res!131243 (validKeyInArray!0 k0!2698))))

(declare-fun b!266894 () Bool)

(declare-fun e!172581 () Bool)

(assert (=> b!266894 (= e!172581 false)))

(declare-fun lt!134424 () Bool)

(declare-datatypes ((List!3904 0))(
  ( (Nil!3901) (Cons!3900 (h!4567 (_ BitVec 64)) (t!8977 List!3904)) )
))
(declare-fun arrayNoDuplicates!0 (array!12927 (_ BitVec 32) List!3904) Bool)

(assert (=> b!266894 (= lt!134424 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3901))))

(declare-fun b!266895 () Bool)

(assert (=> b!266895 (= e!172580 e!172581)))

(declare-fun res!131242 () Bool)

(assert (=> b!266895 (=> (not res!131242) (not e!172581))))

(declare-datatypes ((SeekEntryResult!1307 0))(
  ( (MissingZero!1307 (index!7398 (_ BitVec 32))) (Found!1307 (index!7399 (_ BitVec 32))) (Intermediate!1307 (undefined!2119 Bool) (index!7400 (_ BitVec 32)) (x!25711 (_ BitVec 32))) (Undefined!1307) (MissingVacant!1307 (index!7401 (_ BitVec 32))) )
))
(declare-fun lt!134423 () SeekEntryResult!1307)

(assert (=> b!266895 (= res!131242 (or (= lt!134423 (MissingZero!1307 i!1355)) (= lt!134423 (MissingVacant!1307 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12927 (_ BitVec 32)) SeekEntryResult!1307)

(assert (=> b!266895 (= lt!134423 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131241 () Bool)

(assert (=> start!25760 (=> (not res!131241) (not e!172580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25760 (= res!131241 (validMask!0 mask!4002))))

(assert (=> start!25760 e!172580))

(assert (=> start!25760 true))

(declare-fun array_inv!4089 (array!12927) Bool)

(assert (=> start!25760 (array_inv!4089 a!3436)))

(declare-fun b!266896 () Bool)

(declare-fun res!131244 () Bool)

(assert (=> b!266896 (=> (not res!131244) (not e!172581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12927 (_ BitVec 32)) Bool)

(assert (=> b!266896 (= res!131244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266897 () Bool)

(declare-fun res!131240 () Bool)

(assert (=> b!266897 (=> (not res!131240) (not e!172580))))

(declare-fun arrayContainsKey!0 (array!12927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266897 (= res!131240 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25760 res!131241) b!266892))

(assert (= (and b!266892 res!131245) b!266893))

(assert (= (and b!266893 res!131243) b!266897))

(assert (= (and b!266897 res!131240) b!266895))

(assert (= (and b!266895 res!131242) b!266896))

(assert (= (and b!266896 res!131244) b!266894))

(declare-fun m!282905 () Bool)

(assert (=> b!266894 m!282905))

(declare-fun m!282907 () Bool)

(assert (=> b!266897 m!282907))

(declare-fun m!282909 () Bool)

(assert (=> start!25760 m!282909))

(declare-fun m!282911 () Bool)

(assert (=> start!25760 m!282911))

(declare-fun m!282913 () Bool)

(assert (=> b!266893 m!282913))

(declare-fun m!282915 () Bool)

(assert (=> b!266895 m!282915))

(declare-fun m!282917 () Bool)

(assert (=> b!266896 m!282917))

(check-sat (not b!266896) (not b!266895) (not b!266893) (not b!266894) (not b!266897) (not start!25760))
(check-sat)
