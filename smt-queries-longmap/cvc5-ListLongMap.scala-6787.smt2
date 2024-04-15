; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85446 () Bool)

(assert start!85446)

(declare-fun res!663887 () Bool)

(declare-fun e!560453 () Bool)

(assert (=> start!85446 (=> (not res!663887) (not e!560453))))

(declare-datatypes ((array!62682 0))(
  ( (array!62683 (arr!30185 (Array (_ BitVec 32) (_ BitVec 64))) (size!30683 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62682)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> start!85446 (= res!663887 (and (= (size!30683 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62683 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30683 a!4424))))))

(assert (=> start!85446 e!560453))

(declare-fun array_inv!23328 (array!62682) Bool)

(assert (=> start!85446 (array_inv!23328 a!4424)))

(assert (=> start!85446 true))

(declare-fun b!993195 () Bool)

(declare-fun res!663888 () Bool)

(assert (=> b!993195 (=> (not res!663888) (not e!560453))))

(declare-datatypes ((List!20969 0))(
  ( (Nil!20966) (Cons!20965 (h!22127 (_ BitVec 64)) (t!29961 List!20969)) )
))
(declare-fun acc!919 () List!20969)

(declare-fun contains!5768 (List!20969 (_ BitVec 64)) Bool)

(assert (=> b!993195 (= res!663888 (not (contains!5768 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993196 () Bool)

(declare-fun res!663889 () Bool)

(assert (=> b!993196 (=> (not res!663889) (not e!560453))))

(assert (=> b!993196 (= res!663889 (not (contains!5768 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993197 () Bool)

(assert (=> b!993197 (= e!560453 false)))

(declare-fun lt!440300 () Bool)

(declare-fun noDuplicate!1401 (List!20969) Bool)

(assert (=> b!993197 (= lt!440300 (noDuplicate!1401 acc!919))))

(assert (= (and start!85446 res!663887) b!993195))

(assert (= (and b!993195 res!663888) b!993196))

(assert (= (and b!993196 res!663889) b!993197))

(declare-fun m!920397 () Bool)

(assert (=> start!85446 m!920397))

(declare-fun m!920399 () Bool)

(assert (=> b!993195 m!920399))

(declare-fun m!920401 () Bool)

(assert (=> b!993196 m!920401))

(declare-fun m!920403 () Bool)

(assert (=> b!993197 m!920403))

(push 1)

(assert (not start!85446))

(assert (not b!993197))

(assert (not b!993196))

(assert (not b!993195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

