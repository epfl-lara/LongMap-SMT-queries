; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25406 () Bool)

(assert start!25406)

(declare-fun b!264491 () Bool)

(declare-fun e!171347 () Bool)

(declare-fun mask!4002 () (_ BitVec 32))

(assert (=> b!264491 (= e!171347 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264490 () Bool)

(declare-fun res!129053 () Bool)

(assert (=> b!264490 (=> (not res!129053) (not e!171347))))

(declare-datatypes ((array!12690 0))(
  ( (array!12691 (arr!6003 (Array (_ BitVec 32) (_ BitVec 64))) (size!6356 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12690)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264490 (= res!129053 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264488 () Bool)

(declare-fun res!129052 () Bool)

(assert (=> b!264488 (=> (not res!129052) (not e!171347))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264488 (= res!129052 (and (= (size!6356 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6356 a!3436))))))

(declare-fun b!264489 () Bool)

(declare-fun res!129055 () Bool)

(assert (=> b!264489 (=> (not res!129055) (not e!171347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264489 (= res!129055 (validKeyInArray!0 k0!2698))))

(declare-fun res!129054 () Bool)

(assert (=> start!25406 (=> (not res!129054) (not e!171347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25406 (= res!129054 (validMask!0 mask!4002))))

(assert (=> start!25406 e!171347))

(assert (=> start!25406 true))

(declare-fun array_inv!3975 (array!12690) Bool)

(assert (=> start!25406 (array_inv!3975 a!3436)))

(assert (= (and start!25406 res!129054) b!264488))

(assert (= (and b!264488 res!129052) b!264489))

(assert (= (and b!264489 res!129055) b!264490))

(assert (= (and b!264490 res!129053) b!264491))

(declare-fun m!281045 () Bool)

(assert (=> b!264490 m!281045))

(declare-fun m!281047 () Bool)

(assert (=> b!264489 m!281047))

(declare-fun m!281049 () Bool)

(assert (=> start!25406 m!281049))

(declare-fun m!281051 () Bool)

(assert (=> start!25406 m!281051))

(check-sat (not start!25406) (not b!264489) (not b!264490))
(check-sat)
