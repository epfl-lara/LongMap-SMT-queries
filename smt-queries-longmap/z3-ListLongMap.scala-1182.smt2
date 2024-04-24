; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25436 () Bool)

(assert start!25436)

(declare-fun res!129360 () Bool)

(declare-fun e!171562 () Bool)

(assert (=> start!25436 (=> (not res!129360) (not e!171562))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25436 (= res!129360 (validMask!0 mask!4002))))

(assert (=> start!25436 e!171562))

(assert (=> start!25436 true))

(declare-datatypes ((array!12727 0))(
  ( (array!12728 (arr!6022 (Array (_ BitVec 32) (_ BitVec 64))) (size!6374 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12727)

(declare-fun array_inv!3972 (array!12727) Bool)

(assert (=> start!25436 (array_inv!3972 a!3436)))

(declare-fun b!264874 () Bool)

(assert (=> b!264874 (= e!171562 false)))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1178 0))(
  ( (MissingZero!1178 (index!6882 (_ BitVec 32))) (Found!1178 (index!6883 (_ BitVec 32))) (Intermediate!1178 (undefined!1990 Bool) (index!6884 (_ BitVec 32)) (x!25319 (_ BitVec 32))) (Undefined!1178) (MissingVacant!1178 (index!6885 (_ BitVec 32))) )
))
(declare-fun lt!133974 () SeekEntryResult!1178)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12727 (_ BitVec 32)) SeekEntryResult!1178)

(assert (=> b!264874 (= lt!133974 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264873 () Bool)

(declare-fun res!129358 () Bool)

(assert (=> b!264873 (=> (not res!129358) (not e!171562))))

(declare-fun arrayContainsKey!0 (array!12727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264873 (= res!129358 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264872 () Bool)

(declare-fun res!129357 () Bool)

(assert (=> b!264872 (=> (not res!129357) (not e!171562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264872 (= res!129357 (validKeyInArray!0 k0!2698))))

(declare-fun b!264871 () Bool)

(declare-fun res!129359 () Bool)

(assert (=> b!264871 (=> (not res!129359) (not e!171562))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264871 (= res!129359 (and (= (size!6374 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6374 a!3436))))))

(assert (= (and start!25436 res!129360) b!264871))

(assert (= (and b!264871 res!129359) b!264872))

(assert (= (and b!264872 res!129357) b!264873))

(assert (= (and b!264873 res!129358) b!264874))

(declare-fun m!281987 () Bool)

(assert (=> start!25436 m!281987))

(declare-fun m!281989 () Bool)

(assert (=> start!25436 m!281989))

(declare-fun m!281991 () Bool)

(assert (=> b!264874 m!281991))

(declare-fun m!281993 () Bool)

(assert (=> b!264873 m!281993))

(declare-fun m!281995 () Bool)

(assert (=> b!264872 m!281995))

(check-sat (not b!264874) (not start!25436) (not b!264873) (not b!264872))
(check-sat)
