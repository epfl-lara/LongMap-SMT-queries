; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85614 () Bool)

(assert start!85614)

(declare-fun res!664261 () Bool)

(declare-fun e!561129 () Bool)

(assert (=> start!85614 (=> (not res!664261) (not e!561129))))

(declare-datatypes ((array!62772 0))(
  ( (array!62773 (arr!30225 (Array (_ BitVec 32) (_ BitVec 64))) (size!30722 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62772)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85614 (= res!664261 (and (= (size!30722 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62773 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30722 a!4424))))))

(assert (=> start!85614 e!561129))

(declare-fun array_inv!23361 (array!62772) Bool)

(assert (=> start!85614 (array_inv!23361 a!4424)))

(assert (=> start!85614 true))

(declare-fun b!994256 () Bool)

(declare-fun res!664260 () Bool)

(assert (=> b!994256 (=> (not res!664260) (not e!561129))))

(declare-datatypes ((List!20914 0))(
  ( (Nil!20911) (Cons!20910 (h!22078 (_ BitVec 64)) (t!29907 List!20914)) )
))
(declare-fun acc!919 () List!20914)

(declare-fun contains!5808 (List!20914 (_ BitVec 64)) Bool)

(assert (=> b!994256 (= res!664260 (not (contains!5808 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994257 () Bool)

(declare-fun res!664262 () Bool)

(assert (=> b!994257 (=> (not res!664262) (not e!561129))))

(assert (=> b!994257 (= res!664262 (not (contains!5808 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994258 () Bool)

(assert (=> b!994258 (= e!561129 false)))

(declare-fun lt!440870 () Bool)

(declare-fun noDuplicate!1393 (List!20914) Bool)

(assert (=> b!994258 (= lt!440870 (noDuplicate!1393 acc!919))))

(assert (= (and start!85614 res!664261) b!994256))

(assert (= (and b!994256 res!664260) b!994257))

(assert (= (and b!994257 res!664262) b!994258))

(declare-fun m!922377 () Bool)

(assert (=> start!85614 m!922377))

(declare-fun m!922379 () Bool)

(assert (=> b!994256 m!922379))

(declare-fun m!922381 () Bool)

(assert (=> b!994257 m!922381))

(declare-fun m!922383 () Bool)

(assert (=> b!994258 m!922383))

(push 1)

(assert (not b!994256))

(assert (not b!994257))

(assert (not b!994258))

(assert (not start!85614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

