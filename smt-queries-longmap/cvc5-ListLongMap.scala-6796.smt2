; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85514 () Bool)

(assert start!85514)

(declare-fun res!664304 () Bool)

(declare-fun e!560751 () Bool)

(assert (=> start!85514 (=> (not res!664304) (not e!560751))))

(declare-datatypes ((array!62795 0))(
  ( (array!62796 (arr!30241 (Array (_ BitVec 32) (_ BitVec 64))) (size!30738 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62795)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85514 (= res!664304 (and (= (size!30738 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62796 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30738 a!4424))))))

(assert (=> start!85514 e!560751))

(declare-fun array_inv!23365 (array!62795) Bool)

(assert (=> start!85514 (array_inv!23365 a!4424)))

(assert (=> start!85514 true))

(declare-fun b!993740 () Bool)

(declare-fun res!664305 () Bool)

(assert (=> b!993740 (=> (not res!664305) (not e!560751))))

(declare-datatypes ((List!20959 0))(
  ( (Nil!20956) (Cons!20955 (h!22117 (_ BitVec 64)) (t!29960 List!20959)) )
))
(declare-fun acc!919 () List!20959)

(declare-fun contains!5820 (List!20959 (_ BitVec 64)) Bool)

(assert (=> b!993740 (= res!664305 (not (contains!5820 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993741 () Bool)

(declare-fun res!664303 () Bool)

(assert (=> b!993741 (=> (not res!664303) (not e!560751))))

(assert (=> b!993741 (= res!664303 (not (contains!5820 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993742 () Bool)

(assert (=> b!993742 (= e!560751 false)))

(declare-fun lt!440602 () Bool)

(declare-fun noDuplicate!1418 (List!20959) Bool)

(assert (=> b!993742 (= lt!440602 (noDuplicate!1418 acc!919))))

(assert (= (and start!85514 res!664304) b!993740))

(assert (= (and b!993740 res!664305) b!993741))

(assert (= (and b!993741 res!664303) b!993742))

(declare-fun m!921403 () Bool)

(assert (=> start!85514 m!921403))

(declare-fun m!921405 () Bool)

(assert (=> b!993740 m!921405))

(declare-fun m!921407 () Bool)

(assert (=> b!993741 m!921407))

(declare-fun m!921409 () Bool)

(assert (=> b!993742 m!921409))

(push 1)

(assert (not b!993741))

(assert (not b!993740))

(assert (not b!993742))

(assert (not start!85514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

