; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25418 () Bool)

(assert start!25418)

(declare-fun b!264562 () Bool)

(declare-fun res!129128 () Bool)

(declare-fun e!171383 () Bool)

(assert (=> b!264562 (=> (not res!129128) (not e!171383))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12702 0))(
  ( (array!12703 (arr!6009 (Array (_ BitVec 32) (_ BitVec 64))) (size!6362 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12702)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1199 0))(
  ( (MissingZero!1199 (index!6966 (_ BitVec 32))) (Found!1199 (index!6967 (_ BitVec 32))) (Intermediate!1199 (undefined!2011 Bool) (index!6968 (_ BitVec 32)) (x!25315 (_ BitVec 32))) (Undefined!1199) (MissingVacant!1199 (index!6969 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12702 (_ BitVec 32)) SeekEntryResult!1199)

(assert (=> b!264562 (= res!129128 (not (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) (MissingZero!1199 i!1355))))))

(declare-fun b!264563 () Bool)

(assert (=> b!264563 (= e!171383 (bvslt mask!4002 #b00000000000000000000000000000000))))

(declare-fun b!264564 () Bool)

(declare-fun res!129126 () Bool)

(assert (=> b!264564 (=> (not res!129126) (not e!171383))))

(assert (=> b!264564 (= res!129126 (and (= (size!6362 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6362 a!3436))))))

(declare-fun res!129130 () Bool)

(assert (=> start!25418 (=> (not res!129130) (not e!171383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25418 (= res!129130 (validMask!0 mask!4002))))

(assert (=> start!25418 e!171383))

(assert (=> start!25418 true))

(declare-fun array_inv!3981 (array!12702) Bool)

(assert (=> start!25418 (array_inv!3981 a!3436)))

(declare-fun b!264565 () Bool)

(declare-fun res!129127 () Bool)

(assert (=> b!264565 (=> (not res!129127) (not e!171383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264565 (= res!129127 (validKeyInArray!0 k0!2698))))

(declare-fun b!264566 () Bool)

(declare-fun res!129129 () Bool)

(assert (=> b!264566 (=> (not res!129129) (not e!171383))))

(declare-fun arrayContainsKey!0 (array!12702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264566 (= res!129129 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25418 res!129130) b!264564))

(assert (= (and b!264564 res!129126) b!264565))

(assert (= (and b!264565 res!129127) b!264566))

(assert (= (and b!264566 res!129129) b!264562))

(assert (= (and b!264562 res!129128) b!264563))

(declare-fun m!281099 () Bool)

(assert (=> b!264562 m!281099))

(declare-fun m!281101 () Bool)

(assert (=> start!25418 m!281101))

(declare-fun m!281103 () Bool)

(assert (=> start!25418 m!281103))

(declare-fun m!281105 () Bool)

(assert (=> b!264565 m!281105))

(declare-fun m!281107 () Bool)

(assert (=> b!264566 m!281107))

(check-sat (not b!264566) (not b!264562) (not start!25418) (not b!264565))
(check-sat)
