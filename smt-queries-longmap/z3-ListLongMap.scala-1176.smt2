; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25384 () Bool)

(assert start!25384)

(declare-fun res!129129 () Bool)

(declare-fun e!171436 () Bool)

(assert (=> start!25384 (=> (not res!129129) (not e!171436))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25384 (= res!129129 (validMask!0 mask!4002))))

(assert (=> start!25384 e!171436))

(assert (=> start!25384 true))

(declare-datatypes ((array!12693 0))(
  ( (array!12694 (arr!6006 (Array (_ BitVec 32) (_ BitVec 64))) (size!6358 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12693)

(declare-fun array_inv!3969 (array!12693) Bool)

(assert (=> start!25384 (array_inv!3969 a!3436)))

(declare-fun b!264615 () Bool)

(declare-fun res!129128 () Bool)

(assert (=> b!264615 (=> (not res!129128) (not e!171436))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264615 (= res!129128 (and (= (size!6358 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6358 a!3436))))))

(declare-fun b!264616 () Bool)

(declare-fun res!129127 () Bool)

(assert (=> b!264616 (=> (not res!129127) (not e!171436))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264616 (= res!129127 (validKeyInArray!0 k0!2698))))

(declare-fun b!264617 () Bool)

(assert (=> b!264617 (= e!171436 (and (bvslt #b00000000000000000000000000000000 (size!6358 a!3436)) (bvsge (size!6358 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25384 res!129129) b!264615))

(assert (= (and b!264615 res!129128) b!264616))

(assert (= (and b!264616 res!129127) b!264617))

(declare-fun m!281649 () Bool)

(assert (=> start!25384 m!281649))

(declare-fun m!281651 () Bool)

(assert (=> start!25384 m!281651))

(declare-fun m!281653 () Bool)

(assert (=> b!264616 m!281653))

(check-sat (not b!264616) (not start!25384))
(check-sat)
(get-model)

(declare-fun d!64069 () Bool)

(assert (=> d!64069 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!264616 d!64069))

(declare-fun d!64071 () Bool)

(assert (=> d!64071 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25384 d!64071))

(declare-fun d!64081 () Bool)

(assert (=> d!64081 (= (array_inv!3969 a!3436) (bvsge (size!6358 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25384 d!64081))

(check-sat)