; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85546 () Bool)

(assert start!85546)

(declare-fun res!664411 () Bool)

(declare-fun e!560826 () Bool)

(assert (=> start!85546 (=> (not res!664411) (not e!560826))))

(declare-datatypes ((array!62825 0))(
  ( (array!62826 (arr!30255 (Array (_ BitVec 32) (_ BitVec 64))) (size!30752 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62825)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85546 (= res!664411 (and (= (size!30752 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62826 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30752 a!4424))))))

(assert (=> start!85546 e!560826))

(declare-fun array_inv!23379 (array!62825) Bool)

(assert (=> start!85546 (array_inv!23379 a!4424)))

(assert (=> start!85546 true))

(declare-fun b!993848 () Bool)

(declare-fun res!664413 () Bool)

(assert (=> b!993848 (=> (not res!664413) (not e!560826))))

(declare-datatypes ((List!20970 0))(
  ( (Nil!20967) (Cons!20966 (h!22128 (_ BitVec 64)) (t!29971 List!20970)) )
))
(declare-fun acc!919 () List!20970)

(declare-fun contains!5831 (List!20970 (_ BitVec 64)) Bool)

(assert (=> b!993848 (= res!664413 (not (contains!5831 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993849 () Bool)

(declare-fun res!664412 () Bool)

(assert (=> b!993849 (=> (not res!664412) (not e!560826))))

(assert (=> b!993849 (= res!664412 (not (contains!5831 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993850 () Bool)

(assert (=> b!993850 (= e!560826 false)))

(declare-fun lt!440626 () Bool)

(declare-fun noDuplicate!1429 (List!20970) Bool)

(assert (=> b!993850 (= lt!440626 (noDuplicate!1429 acc!919))))

(assert (= (and start!85546 res!664411) b!993848))

(assert (= (and b!993848 res!664413) b!993849))

(assert (= (and b!993849 res!664412) b!993850))

(declare-fun m!921497 () Bool)

(assert (=> start!85546 m!921497))

(declare-fun m!921499 () Bool)

(assert (=> b!993848 m!921499))

(declare-fun m!921501 () Bool)

(assert (=> b!993849 m!921501))

(declare-fun m!921503 () Bool)

(assert (=> b!993850 m!921503))

(push 1)

(assert (not b!993849))

(assert (not b!993850))

(assert (not start!85546))

(assert (not b!993848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

