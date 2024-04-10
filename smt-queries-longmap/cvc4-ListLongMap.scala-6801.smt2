; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85552 () Bool)

(assert start!85552)

(declare-fun res!664438 () Bool)

(declare-fun e!560843 () Bool)

(assert (=> start!85552 (=> (not res!664438) (not e!560843))))

(declare-datatypes ((array!62831 0))(
  ( (array!62832 (arr!30258 (Array (_ BitVec 32) (_ BitVec 64))) (size!30755 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62831)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85552 (= res!664438 (and (= (size!30755 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62832 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30755 a!4424))))))

(assert (=> start!85552 e!560843))

(declare-fun array_inv!23382 (array!62831) Bool)

(assert (=> start!85552 (array_inv!23382 a!4424)))

(assert (=> start!85552 true))

(declare-fun b!993875 () Bool)

(declare-fun res!664439 () Bool)

(assert (=> b!993875 (=> (not res!664439) (not e!560843))))

(declare-datatypes ((List!20973 0))(
  ( (Nil!20970) (Cons!20969 (h!22131 (_ BitVec 64)) (t!29974 List!20973)) )
))
(declare-fun acc!919 () List!20973)

(declare-fun contains!5834 (List!20973 (_ BitVec 64)) Bool)

(assert (=> b!993875 (= res!664439 (not (contains!5834 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993876 () Bool)

(declare-fun res!664440 () Bool)

(assert (=> b!993876 (=> (not res!664440) (not e!560843))))

(assert (=> b!993876 (= res!664440 (not (contains!5834 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993877 () Bool)

(assert (=> b!993877 (= e!560843 false)))

(declare-fun lt!440635 () Bool)

(declare-fun noDuplicate!1432 (List!20973) Bool)

(assert (=> b!993877 (= lt!440635 (noDuplicate!1432 acc!919))))

(assert (= (and start!85552 res!664438) b!993875))

(assert (= (and b!993875 res!664439) b!993876))

(assert (= (and b!993876 res!664440) b!993877))

(declare-fun m!921521 () Bool)

(assert (=> start!85552 m!921521))

(declare-fun m!921523 () Bool)

(assert (=> b!993875 m!921523))

(declare-fun m!921525 () Bool)

(assert (=> b!993876 m!921525))

(declare-fun m!921527 () Bool)

(assert (=> b!993877 m!921527))

(push 1)

(assert (not b!993875))

(assert (not b!993876))

(assert (not start!85552))

(assert (not b!993877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

