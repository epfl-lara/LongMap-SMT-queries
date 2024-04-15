; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85536 () Bool)

(assert start!85536)

(declare-fun res!664329 () Bool)

(declare-fun e!560696 () Bool)

(assert (=> start!85536 (=> (not res!664329) (not e!560696))))

(declare-datatypes ((array!62769 0))(
  ( (array!62770 (arr!30227 (Array (_ BitVec 32) (_ BitVec 64))) (size!30725 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62769)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85536 (= res!664329 (and (= (size!30725 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62770 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30725 a!4424))))))

(assert (=> start!85536 e!560696))

(declare-fun array_inv!23370 (array!62769) Bool)

(assert (=> start!85536 (array_inv!23370 a!4424)))

(assert (=> start!85536 true))

(declare-fun b!993636 () Bool)

(declare-fun res!664330 () Bool)

(assert (=> b!993636 (=> (not res!664330) (not e!560696))))

(declare-datatypes ((List!21008 0))(
  ( (Nil!21005) (Cons!21004 (h!22166 (_ BitVec 64)) (t!30000 List!21008)) )
))
(declare-fun acc!919 () List!21008)

(declare-fun contains!5807 (List!21008 (_ BitVec 64)) Bool)

(assert (=> b!993636 (= res!664330 (not (contains!5807 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993637 () Bool)

(declare-fun res!664328 () Bool)

(assert (=> b!993637 (=> (not res!664328) (not e!560696))))

(assert (=> b!993637 (= res!664328 (not (contains!5807 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993638 () Bool)

(assert (=> b!993638 (= e!560696 false)))

(declare-fun lt!440399 () Bool)

(declare-fun noDuplicate!1440 (List!21008) Bool)

(assert (=> b!993638 (= lt!440399 (noDuplicate!1440 acc!919))))

(assert (= (and start!85536 res!664329) b!993636))

(assert (= (and b!993636 res!664330) b!993637))

(assert (= (and b!993637 res!664328) b!993638))

(declare-fun m!920763 () Bool)

(assert (=> start!85536 m!920763))

(declare-fun m!920765 () Bool)

(assert (=> b!993636 m!920765))

(declare-fun m!920767 () Bool)

(assert (=> b!993637 m!920767))

(declare-fun m!920769 () Bool)

(assert (=> b!993638 m!920769))

(push 1)

(assert (not b!993636))

(assert (not start!85536))

(assert (not b!993638))

(assert (not b!993637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

