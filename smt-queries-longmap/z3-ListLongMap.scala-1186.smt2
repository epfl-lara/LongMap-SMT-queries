; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25460 () Bool)

(assert start!25460)

(declare-fun b!264825 () Bool)

(declare-fun res!129389 () Bool)

(declare-fun e!171512 () Bool)

(assert (=> b!264825 (=> (not res!129389) (not e!171512))))

(declare-datatypes ((array!12744 0))(
  ( (array!12745 (arr!6030 (Array (_ BitVec 32) (_ BitVec 64))) (size!6383 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12744)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12744 (_ BitVec 32)) Bool)

(assert (=> b!264825 (= res!129389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!264826 () Bool)

(declare-fun res!129394 () Bool)

(declare-fun e!171513 () Bool)

(assert (=> b!264826 (=> (not res!129394) (not e!171513))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264826 (= res!129394 (validKeyInArray!0 k0!2698))))

(declare-fun res!129391 () Bool)

(assert (=> start!25460 (=> (not res!129391) (not e!171513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25460 (= res!129391 (validMask!0 mask!4002))))

(assert (=> start!25460 e!171513))

(assert (=> start!25460 true))

(declare-fun array_inv!4002 (array!12744) Bool)

(assert (=> start!25460 (array_inv!4002 a!3436)))

(declare-fun b!264827 () Bool)

(assert (=> b!264827 (= e!171512 (bvsgt #b00000000000000000000000000000000 (size!6383 a!3436)))))

(declare-fun b!264828 () Bool)

(assert (=> b!264828 (= e!171513 e!171512)))

(declare-fun res!129393 () Bool)

(assert (=> b!264828 (=> (not res!129393) (not e!171512))))

(declare-datatypes ((SeekEntryResult!1220 0))(
  ( (MissingZero!1220 (index!7050 (_ BitVec 32))) (Found!1220 (index!7051 (_ BitVec 32))) (Intermediate!1220 (undefined!2032 Bool) (index!7052 (_ BitVec 32)) (x!25392 (_ BitVec 32))) (Undefined!1220) (MissingVacant!1220 (index!7053 (_ BitVec 32))) )
))
(declare-fun lt!133770 () SeekEntryResult!1220)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264828 (= res!129393 (or (= lt!133770 (MissingZero!1220 i!1355)) (= lt!133770 (MissingVacant!1220 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12744 (_ BitVec 32)) SeekEntryResult!1220)

(assert (=> b!264828 (= lt!133770 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264829 () Bool)

(declare-fun res!129392 () Bool)

(assert (=> b!264829 (=> (not res!129392) (not e!171513))))

(declare-fun arrayContainsKey!0 (array!12744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264829 (= res!129392 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264830 () Bool)

(declare-fun res!129390 () Bool)

(assert (=> b!264830 (=> (not res!129390) (not e!171513))))

(assert (=> b!264830 (= res!129390 (and (= (size!6383 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6383 a!3436))))))

(assert (= (and start!25460 res!129391) b!264830))

(assert (= (and b!264830 res!129390) b!264826))

(assert (= (and b!264826 res!129394) b!264829))

(assert (= (and b!264829 res!129392) b!264828))

(assert (= (and b!264828 res!129393) b!264825))

(assert (= (and b!264825 res!129389) b!264827))

(declare-fun m!281309 () Bool)

(assert (=> b!264825 m!281309))

(declare-fun m!281311 () Bool)

(assert (=> start!25460 m!281311))

(declare-fun m!281313 () Bool)

(assert (=> start!25460 m!281313))

(declare-fun m!281315 () Bool)

(assert (=> b!264828 m!281315))

(declare-fun m!281317 () Bool)

(assert (=> b!264826 m!281317))

(declare-fun m!281319 () Bool)

(assert (=> b!264829 m!281319))

(check-sat (not b!264828) (not b!264829) (not b!264825) (not start!25460) (not b!264826))
(check-sat)
