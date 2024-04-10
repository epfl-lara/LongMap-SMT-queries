; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85542 () Bool)

(assert start!85542)

(declare-fun res!664393 () Bool)

(declare-fun e!560814 () Bool)

(assert (=> start!85542 (=> (not res!664393) (not e!560814))))

(declare-datatypes ((array!62821 0))(
  ( (array!62822 (arr!30253 (Array (_ BitVec 32) (_ BitVec 64))) (size!30750 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62821)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85542 (= res!664393 (and (= (size!30750 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62822 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30750 a!4424))))))

(assert (=> start!85542 e!560814))

(declare-fun array_inv!23377 (array!62821) Bool)

(assert (=> start!85542 (array_inv!23377 a!4424)))

(assert (=> start!85542 true))

(declare-fun b!993830 () Bool)

(declare-fun res!664394 () Bool)

(assert (=> b!993830 (=> (not res!664394) (not e!560814))))

(declare-datatypes ((List!20968 0))(
  ( (Nil!20965) (Cons!20964 (h!22126 (_ BitVec 64)) (t!29969 List!20968)) )
))
(declare-fun acc!919 () List!20968)

(declare-fun contains!5829 (List!20968 (_ BitVec 64)) Bool)

(assert (=> b!993830 (= res!664394 (not (contains!5829 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993831 () Bool)

(declare-fun res!664395 () Bool)

(assert (=> b!993831 (=> (not res!664395) (not e!560814))))

(assert (=> b!993831 (= res!664395 (not (contains!5829 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993832 () Bool)

(assert (=> b!993832 (= e!560814 false)))

(declare-fun lt!440620 () Bool)

(declare-fun noDuplicate!1427 (List!20968) Bool)

(assert (=> b!993832 (= lt!440620 (noDuplicate!1427 acc!919))))

(assert (= (and start!85542 res!664393) b!993830))

(assert (= (and b!993830 res!664394) b!993831))

(assert (= (and b!993831 res!664395) b!993832))

(declare-fun m!921481 () Bool)

(assert (=> start!85542 m!921481))

(declare-fun m!921483 () Bool)

(assert (=> b!993830 m!921483))

(declare-fun m!921485 () Bool)

(assert (=> b!993831 m!921485))

(declare-fun m!921487 () Bool)

(assert (=> b!993832 m!921487))

(push 1)

(assert (not b!993830))

(assert (not b!993831))

(assert (not b!993832))

(assert (not start!85542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

