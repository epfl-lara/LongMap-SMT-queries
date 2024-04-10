; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85576 () Bool)

(assert start!85576)

(declare-fun res!664557 () Bool)

(declare-fun e!560915 () Bool)

(assert (=> start!85576 (=> (not res!664557) (not e!560915))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((array!62855 0))(
  ( (array!62856 (arr!30270 (Array (_ BitVec 32) (_ BitVec 64))) (size!30767 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62855)

(assert (=> start!85576 (= res!664557 (and (= (size!30767 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62856 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30767 a!4424))))))

(assert (=> start!85576 e!560915))

(declare-fun array_inv!23394 (array!62855) Bool)

(assert (=> start!85576 (array_inv!23394 a!4424)))

(assert (=> start!85576 true))

(declare-fun b!993992 () Bool)

(declare-fun res!664556 () Bool)

(assert (=> b!993992 (=> (not res!664556) (not e!560915))))

(declare-datatypes ((List!20985 0))(
  ( (Nil!20982) (Cons!20981 (h!22143 (_ BitVec 64)) (t!29986 List!20985)) )
))
(declare-fun acc!919 () List!20985)

(declare-fun contains!5846 (List!20985 (_ BitVec 64)) Bool)

(assert (=> b!993992 (= res!664556 (not (contains!5846 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993993 () Bool)

(declare-fun res!664555 () Bool)

(assert (=> b!993993 (=> (not res!664555) (not e!560915))))

(assert (=> b!993993 (= res!664555 (not (contains!5846 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993994 () Bool)

(assert (=> b!993994 (= e!560915 false)))

(declare-fun lt!440662 () Bool)

(declare-fun noDuplicate!1444 (List!20985) Bool)

(assert (=> b!993994 (= lt!440662 (noDuplicate!1444 acc!919))))

(assert (= (and start!85576 res!664557) b!993992))

(assert (= (and b!993992 res!664556) b!993993))

(assert (= (and b!993993 res!664555) b!993994))

(declare-fun m!921617 () Bool)

(assert (=> start!85576 m!921617))

(declare-fun m!921619 () Bool)

(assert (=> b!993992 m!921619))

(declare-fun m!921621 () Bool)

(assert (=> b!993993 m!921621))

(declare-fun m!921623 () Bool)

(assert (=> b!993994 m!921623))

(push 1)

(assert (not b!993994))

(assert (not start!85576))

(assert (not b!993993))

(assert (not b!993992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

