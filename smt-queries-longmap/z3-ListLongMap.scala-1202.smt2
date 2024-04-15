; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25682 () Bool)

(assert start!25682)

(declare-fun b!266113 () Bool)

(declare-fun res!130468 () Bool)

(declare-fun e!172228 () Bool)

(assert (=> b!266113 (=> (not res!130468) (not e!172228))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266113 (= res!130468 (validKeyInArray!0 k0!2698))))

(declare-fun b!266114 () Bool)

(declare-fun e!172230 () Bool)

(assert (=> b!266114 (= e!172230 (not true))))

(declare-datatypes ((array!12849 0))(
  ( (array!12850 (arr!6078 (Array (_ BitVec 32) (_ BitVec 64))) (size!6431 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12849)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12849 (_ BitVec 32)) Bool)

(assert (=> b!266114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12850 (store (arr!6078 a!3436) i!1355 k0!2698) (size!6431 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8223 0))(
  ( (Unit!8224) )
))
(declare-fun lt!134199 () Unit!8223)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8223)

(assert (=> b!266114 (= lt!134199 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266115 () Bool)

(declare-fun res!130467 () Bool)

(assert (=> b!266115 (=> (not res!130467) (not e!172228))))

(declare-fun arrayContainsKey!0 (array!12849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266115 (= res!130467 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266116 () Bool)

(declare-fun res!130463 () Bool)

(assert (=> b!266116 (=> (not res!130463) (not e!172230))))

(assert (=> b!266116 (= res!130463 (bvslt #b00000000000000000000000000000000 (size!6431 a!3436)))))

(declare-fun b!266117 () Bool)

(declare-fun res!130461 () Bool)

(assert (=> b!266117 (=> (not res!130461) (not e!172228))))

(assert (=> b!266117 (= res!130461 (and (= (size!6431 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6431 a!3436))))))

(declare-fun b!266118 () Bool)

(declare-fun res!130464 () Bool)

(assert (=> b!266118 (=> (not res!130464) (not e!172230))))

(assert (=> b!266118 (= res!130464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266119 () Bool)

(assert (=> b!266119 (= e!172228 e!172230)))

(declare-fun res!130462 () Bool)

(assert (=> b!266119 (=> (not res!130462) (not e!172230))))

(declare-datatypes ((SeekEntryResult!1268 0))(
  ( (MissingZero!1268 (index!7242 (_ BitVec 32))) (Found!1268 (index!7243 (_ BitVec 32))) (Intermediate!1268 (undefined!2080 Bool) (index!7244 (_ BitVec 32)) (x!25568 (_ BitVec 32))) (Undefined!1268) (MissingVacant!1268 (index!7245 (_ BitVec 32))) )
))
(declare-fun lt!134198 () SeekEntryResult!1268)

(assert (=> b!266119 (= res!130462 (or (= lt!134198 (MissingZero!1268 i!1355)) (= lt!134198 (MissingVacant!1268 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12849 (_ BitVec 32)) SeekEntryResult!1268)

(assert (=> b!266119 (= lt!134198 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266120 () Bool)

(declare-fun res!130466 () Bool)

(assert (=> b!266120 (=> (not res!130466) (not e!172230))))

(declare-datatypes ((List!3865 0))(
  ( (Nil!3862) (Cons!3861 (h!4528 (_ BitVec 64)) (t!8938 List!3865)) )
))
(declare-fun arrayNoDuplicates!0 (array!12849 (_ BitVec 32) List!3865) Bool)

(assert (=> b!266120 (= res!130466 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3862))))

(declare-fun res!130465 () Bool)

(assert (=> start!25682 (=> (not res!130465) (not e!172228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25682 (= res!130465 (validMask!0 mask!4002))))

(assert (=> start!25682 e!172228))

(assert (=> start!25682 true))

(declare-fun array_inv!4050 (array!12849) Bool)

(assert (=> start!25682 (array_inv!4050 a!3436)))

(assert (= (and start!25682 res!130465) b!266117))

(assert (= (and b!266117 res!130461) b!266113))

(assert (= (and b!266113 res!130468) b!266115))

(assert (= (and b!266115 res!130467) b!266119))

(assert (= (and b!266119 res!130462) b!266118))

(assert (= (and b!266118 res!130464) b!266120))

(assert (= (and b!266120 res!130466) b!266116))

(assert (= (and b!266116 res!130463) b!266114))

(declare-fun m!282287 () Bool)

(assert (=> b!266113 m!282287))

(declare-fun m!282289 () Bool)

(assert (=> b!266114 m!282289))

(declare-fun m!282291 () Bool)

(assert (=> b!266114 m!282291))

(declare-fun m!282293 () Bool)

(assert (=> b!266114 m!282293))

(declare-fun m!282295 () Bool)

(assert (=> b!266119 m!282295))

(declare-fun m!282297 () Bool)

(assert (=> b!266115 m!282297))

(declare-fun m!282299 () Bool)

(assert (=> b!266120 m!282299))

(declare-fun m!282301 () Bool)

(assert (=> b!266118 m!282301))

(declare-fun m!282303 () Bool)

(assert (=> start!25682 m!282303))

(declare-fun m!282305 () Bool)

(assert (=> start!25682 m!282305))

(check-sat (not start!25682) (not b!266120) (not b!266118) (not b!266114) (not b!266113) (not b!266119) (not b!266115))
(check-sat)
