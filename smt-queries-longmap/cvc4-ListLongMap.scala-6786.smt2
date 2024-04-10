; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85458 () Bool)

(assert start!85458)

(declare-fun res!663972 () Bool)

(declare-fun e!560582 () Bool)

(assert (=> start!85458 (=> (not res!663972) (not e!560582))))

(declare-datatypes ((array!62739 0))(
  ( (array!62740 (arr!30213 (Array (_ BitVec 32) (_ BitVec 64))) (size!30710 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62739)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> start!85458 (= res!663972 (and (= (size!30710 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62740 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30710 a!4424))))))

(assert (=> start!85458 e!560582))

(declare-fun array_inv!23337 (array!62739) Bool)

(assert (=> start!85458 (array_inv!23337 a!4424)))

(assert (=> start!85458 true))

(declare-fun b!993407 () Bool)

(declare-fun res!663970 () Bool)

(assert (=> b!993407 (=> (not res!663970) (not e!560582))))

(declare-datatypes ((List!20931 0))(
  ( (Nil!20928) (Cons!20927 (h!22089 (_ BitVec 64)) (t!29932 List!20931)) )
))
(declare-fun acc!919 () List!20931)

(declare-fun contains!5792 (List!20931 (_ BitVec 64)) Bool)

(assert (=> b!993407 (= res!663970 (not (contains!5792 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993408 () Bool)

(declare-fun res!663971 () Bool)

(assert (=> b!993408 (=> (not res!663971) (not e!560582))))

(assert (=> b!993408 (= res!663971 (not (contains!5792 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993409 () Bool)

(assert (=> b!993409 (= e!560582 false)))

(declare-fun lt!440527 () Bool)

(declare-fun noDuplicate!1390 (List!20931) Bool)

(assert (=> b!993409 (= lt!440527 (noDuplicate!1390 acc!919))))

(assert (= (and start!85458 res!663972) b!993407))

(assert (= (and b!993407 res!663970) b!993408))

(assert (= (and b!993408 res!663971) b!993409))

(declare-fun m!921131 () Bool)

(assert (=> start!85458 m!921131))

(declare-fun m!921133 () Bool)

(assert (=> b!993407 m!921133))

(declare-fun m!921135 () Bool)

(assert (=> b!993408 m!921135))

(declare-fun m!921137 () Bool)

(assert (=> b!993409 m!921137))

(push 1)

(assert (not b!993408))

(assert (not start!85458))

(assert (not b!993407))

(assert (not b!993409))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

