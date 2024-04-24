; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25418 () Bool)

(assert start!25418)

(declare-fun b!264756 () Bool)

(declare-fun res!129246 () Bool)

(declare-fun e!171508 () Bool)

(assert (=> b!264756 (=> (not res!129246) (not e!171508))))

(declare-datatypes ((array!12709 0))(
  ( (array!12710 (arr!6013 (Array (_ BitVec 32) (_ BitVec 64))) (size!6365 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12709)

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264756 (= res!129246 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129242 () Bool)

(assert (=> start!25418 (=> (not res!129242) (not e!171508))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25418 (= res!129242 (validMask!0 mask!4002))))

(assert (=> start!25418 e!171508))

(assert (=> start!25418 true))

(declare-fun array_inv!3963 (array!12709) Bool)

(assert (=> start!25418 (array_inv!3963 a!3436)))

(declare-fun b!264757 () Bool)

(declare-fun res!129245 () Bool)

(assert (=> b!264757 (=> (not res!129245) (not e!171508))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264757 (= res!129245 (and (= (size!6365 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6365 a!3436))))))

(declare-fun b!264758 () Bool)

(assert (=> b!264758 (= e!171508 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264759 () Bool)

(declare-fun res!129244 () Bool)

(assert (=> b!264759 (=> (not res!129244) (not e!171508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264759 (= res!129244 (validKeyInArray!0 k0!2698))))

(declare-fun b!264760 () Bool)

(declare-fun res!129243 () Bool)

(assert (=> b!264760 (=> (not res!129243) (not e!171508))))

(declare-datatypes ((SeekEntryResult!1169 0))(
  ( (MissingZero!1169 (index!6846 (_ BitVec 32))) (Found!1169 (index!6847 (_ BitVec 32))) (Intermediate!1169 (undefined!1981 Bool) (index!6848 (_ BitVec 32)) (x!25286 (_ BitVec 32))) (Undefined!1169) (MissingVacant!1169 (index!6849 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12709 (_ BitVec 32)) SeekEntryResult!1169)

(assert (=> b!264760 (= res!129243 (not (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) (MissingZero!1169 i!1355))))))

(assert (= (and start!25418 res!129242) b!264757))

(assert (= (and b!264757 res!129245) b!264759))

(assert (= (and b!264759 res!129244) b!264756))

(assert (= (and b!264756 res!129246) b!264760))

(assert (= (and b!264760 res!129243) b!264758))

(declare-fun m!281897 () Bool)

(assert (=> b!264756 m!281897))

(declare-fun m!281899 () Bool)

(assert (=> start!25418 m!281899))

(declare-fun m!281901 () Bool)

(assert (=> start!25418 m!281901))

(declare-fun m!281903 () Bool)

(assert (=> b!264759 m!281903))

(declare-fun m!281905 () Bool)

(assert (=> b!264760 m!281905))

(check-sat (not b!264759) (not b!264760) (not b!264756) (not start!25418))
(check-sat)
