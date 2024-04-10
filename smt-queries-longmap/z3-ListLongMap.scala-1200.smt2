; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25668 () Bool)

(assert start!25668)

(declare-fun b!266166 () Bool)

(declare-fun res!130467 () Bool)

(declare-fun e!172286 () Bool)

(assert (=> b!266166 (=> (not res!130467) (not e!172286))))

(declare-datatypes ((array!12847 0))(
  ( (array!12848 (arr!6078 (Array (_ BitVec 32) (_ BitVec 64))) (size!6430 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12847)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12847 (_ BitVec 32)) Bool)

(assert (=> b!266166 (= res!130467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266167 () Bool)

(declare-fun res!130462 () Bool)

(declare-fun e!172285 () Bool)

(assert (=> b!266167 (=> (not res!130462) (not e!172285))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266167 (= res!130462 (validKeyInArray!0 k0!2698))))

(declare-fun res!130466 () Bool)

(assert (=> start!25668 (=> (not res!130466) (not e!172285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25668 (= res!130466 (validMask!0 mask!4002))))

(assert (=> start!25668 e!172285))

(assert (=> start!25668 true))

(declare-fun array_inv!4041 (array!12847) Bool)

(assert (=> start!25668 (array_inv!4041 a!3436)))

(declare-fun b!266168 () Bool)

(declare-fun res!130465 () Bool)

(assert (=> b!266168 (=> (not res!130465) (not e!172285))))

(declare-fun arrayContainsKey!0 (array!12847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266168 (= res!130465 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266169 () Bool)

(assert (=> b!266169 (= e!172286 false)))

(declare-fun lt!134349 () Bool)

(declare-datatypes ((List!3892 0))(
  ( (Nil!3889) (Cons!3888 (h!4555 (_ BitVec 64)) (t!8974 List!3892)) )
))
(declare-fun arrayNoDuplicates!0 (array!12847 (_ BitVec 32) List!3892) Bool)

(assert (=> b!266169 (= lt!134349 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3889))))

(declare-fun b!266170 () Bool)

(declare-fun res!130463 () Bool)

(assert (=> b!266170 (=> (not res!130463) (not e!172285))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266170 (= res!130463 (and (= (size!6430 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6430 a!3436))))))

(declare-fun b!266171 () Bool)

(assert (=> b!266171 (= e!172285 e!172286)))

(declare-fun res!130464 () Bool)

(assert (=> b!266171 (=> (not res!130464) (not e!172286))))

(declare-datatypes ((SeekEntryResult!1269 0))(
  ( (MissingZero!1269 (index!7246 (_ BitVec 32))) (Found!1269 (index!7247 (_ BitVec 32))) (Intermediate!1269 (undefined!2081 Bool) (index!7248 (_ BitVec 32)) (x!25554 (_ BitVec 32))) (Undefined!1269) (MissingVacant!1269 (index!7249 (_ BitVec 32))) )
))
(declare-fun lt!134350 () SeekEntryResult!1269)

(assert (=> b!266171 (= res!130464 (or (= lt!134350 (MissingZero!1269 i!1355)) (= lt!134350 (MissingVacant!1269 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12847 (_ BitVec 32)) SeekEntryResult!1269)

(assert (=> b!266171 (= lt!134350 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(assert (= (and start!25668 res!130466) b!266170))

(assert (= (and b!266170 res!130463) b!266167))

(assert (= (and b!266167 res!130462) b!266168))

(assert (= (and b!266168 res!130465) b!266171))

(assert (= (and b!266171 res!130464) b!266166))

(assert (= (and b!266166 res!130467) b!266169))

(declare-fun m!282809 () Bool)

(assert (=> start!25668 m!282809))

(declare-fun m!282811 () Bool)

(assert (=> start!25668 m!282811))

(declare-fun m!282813 () Bool)

(assert (=> b!266166 m!282813))

(declare-fun m!282815 () Bool)

(assert (=> b!266167 m!282815))

(declare-fun m!282817 () Bool)

(assert (=> b!266168 m!282817))

(declare-fun m!282819 () Bool)

(assert (=> b!266169 m!282819))

(declare-fun m!282821 () Bool)

(assert (=> b!266171 m!282821))

(check-sat (not start!25668) (not b!266168) (not b!266169) (not b!266166) (not b!266167) (not b!266171))
