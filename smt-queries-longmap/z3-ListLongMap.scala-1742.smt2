; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31974 () Bool)

(assert start!31974)

(declare-fun b!319375 () Bool)

(declare-fun res!173760 () Bool)

(declare-fun e!198370 () Bool)

(assert (=> b!319375 (=> (not res!173760) (not e!198370))))

(declare-datatypes ((array!16281 0))(
  ( (array!16282 (arr!7704 (Array (_ BitVec 32) (_ BitVec 64))) (size!8056 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16281)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319375 (= res!173760 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173759 () Bool)

(assert (=> start!31974 (=> (not res!173759) (not e!198370))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31974 (= res!173759 (validMask!0 mask!3777))))

(assert (=> start!31974 e!198370))

(assert (=> start!31974 true))

(declare-fun array_inv!5667 (array!16281) Bool)

(assert (=> start!31974 (array_inv!5667 a!3305)))

(declare-fun b!319376 () Bool)

(assert (=> b!319376 (= e!198370 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319373 () Bool)

(declare-fun res!173758 () Bool)

(assert (=> b!319373 (=> (not res!173758) (not e!198370))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319373 (= res!173758 (and (= (size!8056 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8056 a!3305))))))

(declare-fun b!319374 () Bool)

(declare-fun res!173757 () Bool)

(assert (=> b!319374 (=> (not res!173757) (not e!198370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319374 (= res!173757 (validKeyInArray!0 k0!2497))))

(assert (= (and start!31974 res!173759) b!319373))

(assert (= (and b!319373 res!173758) b!319374))

(assert (= (and b!319374 res!173757) b!319375))

(assert (= (and b!319375 res!173760) b!319376))

(declare-fun m!327991 () Bool)

(assert (=> b!319375 m!327991))

(declare-fun m!327993 () Bool)

(assert (=> start!31974 m!327993))

(declare-fun m!327995 () Bool)

(assert (=> start!31974 m!327995))

(declare-fun m!327997 () Bool)

(assert (=> b!319374 m!327997))

(check-sat (not b!319375) (not b!319374) (not start!31974))
(check-sat)
