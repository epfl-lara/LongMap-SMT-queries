; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25422 () Bool)

(assert start!25422)

(declare-fun b!264764 () Bool)

(declare-fun res!129276 () Bool)

(declare-fun e!171508 () Bool)

(assert (=> b!264764 (=> (not res!129276) (not e!171508))))

(declare-datatypes ((array!12718 0))(
  ( (array!12719 (arr!6018 (Array (_ BitVec 32) (_ BitVec 64))) (size!6370 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12718)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264764 (= res!129276 (and (= (size!6370 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6370 a!3436))))))

(declare-fun b!264765 () Bool)

(declare-fun res!129278 () Bool)

(assert (=> b!264765 (=> (not res!129278) (not e!171508))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264765 (= res!129278 (validKeyInArray!0 k0!2698))))

(declare-fun b!264767 () Bool)

(assert (=> b!264767 (= e!171508 false)))

(declare-datatypes ((SeekEntryResult!1209 0))(
  ( (MissingZero!1209 (index!7006 (_ BitVec 32))) (Found!1209 (index!7007 (_ BitVec 32))) (Intermediate!1209 (undefined!2021 Bool) (index!7008 (_ BitVec 32)) (x!25334 (_ BitVec 32))) (Undefined!1209) (MissingVacant!1209 (index!7009 (_ BitVec 32))) )
))
(declare-fun lt!133900 () SeekEntryResult!1209)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12718 (_ BitVec 32)) SeekEntryResult!1209)

(assert (=> b!264767 (= lt!133900 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264766 () Bool)

(declare-fun res!129279 () Bool)

(assert (=> b!264766 (=> (not res!129279) (not e!171508))))

(declare-fun arrayContainsKey!0 (array!12718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264766 (= res!129279 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!129277 () Bool)

(assert (=> start!25422 (=> (not res!129277) (not e!171508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25422 (= res!129277 (validMask!0 mask!4002))))

(assert (=> start!25422 e!171508))

(assert (=> start!25422 true))

(declare-fun array_inv!3981 (array!12718) Bool)

(assert (=> start!25422 (array_inv!3981 a!3436)))

(assert (= (and start!25422 res!129277) b!264764))

(assert (= (and b!264764 res!129276) b!264765))

(assert (= (and b!264765 res!129278) b!264766))

(assert (= (and b!264766 res!129279) b!264767))

(declare-fun m!281755 () Bool)

(assert (=> b!264765 m!281755))

(declare-fun m!281757 () Bool)

(assert (=> b!264767 m!281757))

(declare-fun m!281759 () Bool)

(assert (=> b!264766 m!281759))

(declare-fun m!281761 () Bool)

(assert (=> start!25422 m!281761))

(declare-fun m!281763 () Bool)

(assert (=> start!25422 m!281763))

(check-sat (not b!264767) (not b!264766) (not start!25422) (not b!264765))
