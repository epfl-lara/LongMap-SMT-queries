; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85466 () Bool)

(assert start!85466)

(declare-fun res!664008 () Bool)

(declare-fun e!560606 () Bool)

(assert (=> start!85466 (=> (not res!664008) (not e!560606))))

(declare-datatypes ((array!62747 0))(
  ( (array!62748 (arr!30217 (Array (_ BitVec 32) (_ BitVec 64))) (size!30714 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62747)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85466 (= res!664008 (and (= (size!30714 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62748 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30714 a!4424))))))

(assert (=> start!85466 e!560606))

(declare-fun array_inv!23341 (array!62747) Bool)

(assert (=> start!85466 (array_inv!23341 a!4424)))

(assert (=> start!85466 true))

(declare-fun b!993443 () Bool)

(declare-fun res!664006 () Bool)

(assert (=> b!993443 (=> (not res!664006) (not e!560606))))

(declare-datatypes ((List!20935 0))(
  ( (Nil!20932) (Cons!20931 (h!22093 (_ BitVec 64)) (t!29936 List!20935)) )
))
(declare-fun acc!919 () List!20935)

(declare-fun contains!5796 (List!20935 (_ BitVec 64)) Bool)

(assert (=> b!993443 (= res!664006 (not (contains!5796 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993444 () Bool)

(declare-fun res!664007 () Bool)

(assert (=> b!993444 (=> (not res!664007) (not e!560606))))

(assert (=> b!993444 (= res!664007 (not (contains!5796 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993445 () Bool)

(assert (=> b!993445 (= e!560606 false)))

(declare-fun lt!440539 () Bool)

(declare-fun noDuplicate!1394 (List!20935) Bool)

(assert (=> b!993445 (= lt!440539 (noDuplicate!1394 acc!919))))

(assert (= (and start!85466 res!664008) b!993443))

(assert (= (and b!993443 res!664006) b!993444))

(assert (= (and b!993444 res!664007) b!993445))

(declare-fun m!921163 () Bool)

(assert (=> start!85466 m!921163))

(declare-fun m!921165 () Bool)

(assert (=> b!993443 m!921165))

(declare-fun m!921167 () Bool)

(assert (=> b!993444 m!921167))

(declare-fun m!921169 () Bool)

(assert (=> b!993445 m!921169))

(push 1)

(assert (not start!85466))

(assert (not b!993445))

(assert (not b!993443))

(assert (not b!993444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

