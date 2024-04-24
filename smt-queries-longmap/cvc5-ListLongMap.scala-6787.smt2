; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85632 () Bool)

(assert start!85632)

(declare-fun res!664343 () Bool)

(declare-fun e!561182 () Bool)

(assert (=> start!85632 (=> (not res!664343) (not e!561182))))

(declare-datatypes ((array!62790 0))(
  ( (array!62791 (arr!30234 (Array (_ BitVec 32) (_ BitVec 64))) (size!30731 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62790)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85632 (= res!664343 (and (= (size!30731 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62791 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30731 a!4424))))))

(assert (=> start!85632 e!561182))

(declare-fun array_inv!23370 (array!62790) Bool)

(assert (=> start!85632 (array_inv!23370 a!4424)))

(assert (=> start!85632 true))

(declare-fun b!994337 () Bool)

(declare-fun res!664341 () Bool)

(assert (=> b!994337 (=> (not res!664341) (not e!561182))))

(declare-datatypes ((List!20923 0))(
  ( (Nil!20920) (Cons!20919 (h!22087 (_ BitVec 64)) (t!29916 List!20923)) )
))
(declare-fun acc!919 () List!20923)

(declare-fun contains!5817 (List!20923 (_ BitVec 64)) Bool)

(assert (=> b!994337 (= res!664341 (not (contains!5817 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994338 () Bool)

(declare-fun res!664342 () Bool)

(assert (=> b!994338 (=> (not res!664342) (not e!561182))))

(assert (=> b!994338 (= res!664342 (not (contains!5817 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994339 () Bool)

(assert (=> b!994339 (= e!561182 false)))

(declare-fun lt!440897 () Bool)

(declare-fun noDuplicate!1402 (List!20923) Bool)

(assert (=> b!994339 (= lt!440897 (noDuplicate!1402 acc!919))))

(assert (= (and start!85632 res!664343) b!994337))

(assert (= (and b!994337 res!664341) b!994338))

(assert (= (and b!994338 res!664342) b!994339))

(declare-fun m!922449 () Bool)

(assert (=> start!85632 m!922449))

(declare-fun m!922451 () Bool)

(assert (=> b!994337 m!922451))

(declare-fun m!922453 () Bool)

(assert (=> b!994338 m!922453))

(declare-fun m!922455 () Bool)

(assert (=> b!994339 m!922455))

(push 1)

(assert (not b!994337))

(assert (not b!994338))

(assert (not start!85632))

(assert (not b!994339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

