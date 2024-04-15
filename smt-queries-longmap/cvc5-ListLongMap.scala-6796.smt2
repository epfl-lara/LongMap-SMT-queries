; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85500 () Bool)

(assert start!85500)

(declare-fun res!664212 () Bool)

(declare-fun e!560615 () Bool)

(assert (=> start!85500 (=> (not res!664212) (not e!560615))))

(declare-datatypes ((array!62736 0))(
  ( (array!62737 (arr!30212 (Array (_ BitVec 32) (_ BitVec 64))) (size!30710 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62736)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85500 (= res!664212 (and (= (size!30710 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62737 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30710 a!4424))))))

(assert (=> start!85500 e!560615))

(declare-fun array_inv!23355 (array!62736) Bool)

(assert (=> start!85500 (array_inv!23355 a!4424)))

(assert (=> start!85500 true))

(declare-fun b!993519 () Bool)

(declare-fun res!664213 () Bool)

(assert (=> b!993519 (=> (not res!664213) (not e!560615))))

(declare-datatypes ((List!20996 0))(
  ( (Nil!20993) (Cons!20992 (h!22154 (_ BitVec 64)) (t!29988 List!20996)) )
))
(declare-fun acc!919 () List!20996)

(declare-fun contains!5795 (List!20996 (_ BitVec 64)) Bool)

(assert (=> b!993519 (= res!664213 (not (contains!5795 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993520 () Bool)

(declare-fun res!664211 () Bool)

(assert (=> b!993520 (=> (not res!664211) (not e!560615))))

(assert (=> b!993520 (= res!664211 (not (contains!5795 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993521 () Bool)

(assert (=> b!993521 (= e!560615 false)))

(declare-fun lt!440372 () Bool)

(declare-fun noDuplicate!1428 (List!20996) Bool)

(assert (=> b!993521 (= lt!440372 (noDuplicate!1428 acc!919))))

(assert (= (and start!85500 res!664212) b!993519))

(assert (= (and b!993519 res!664213) b!993520))

(assert (= (and b!993520 res!664211) b!993521))

(declare-fun m!920661 () Bool)

(assert (=> start!85500 m!920661))

(declare-fun m!920663 () Bool)

(assert (=> b!993519 m!920663))

(declare-fun m!920665 () Bool)

(assert (=> b!993520 m!920665))

(declare-fun m!920667 () Bool)

(assert (=> b!993521 m!920667))

(push 1)

(assert (not b!993519))

(assert (not b!993521))

(assert (not start!85500))

(assert (not b!993520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

