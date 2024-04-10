; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85472 () Bool)

(assert start!85472)

(declare-fun res!664033 () Bool)

(declare-fun e!560624 () Bool)

(assert (=> start!85472 (=> (not res!664033) (not e!560624))))

(declare-datatypes ((array!62753 0))(
  ( (array!62754 (arr!30220 (Array (_ BitVec 32) (_ BitVec 64))) (size!30717 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62753)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85472 (= res!664033 (and (= (size!30717 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62754 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30717 a!4424))))))

(assert (=> start!85472 e!560624))

(declare-fun array_inv!23344 (array!62753) Bool)

(assert (=> start!85472 (array_inv!23344 a!4424)))

(assert (=> start!85472 true))

(declare-fun b!993470 () Bool)

(declare-fun res!664035 () Bool)

(assert (=> b!993470 (=> (not res!664035) (not e!560624))))

(declare-datatypes ((List!20938 0))(
  ( (Nil!20935) (Cons!20934 (h!22096 (_ BitVec 64)) (t!29939 List!20938)) )
))
(declare-fun acc!919 () List!20938)

(declare-fun contains!5799 (List!20938 (_ BitVec 64)) Bool)

(assert (=> b!993470 (= res!664035 (not (contains!5799 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993471 () Bool)

(declare-fun res!664034 () Bool)

(assert (=> b!993471 (=> (not res!664034) (not e!560624))))

(assert (=> b!993471 (= res!664034 (not (contains!5799 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993472 () Bool)

(assert (=> b!993472 (= e!560624 false)))

(declare-fun lt!440548 () Bool)

(declare-fun noDuplicate!1397 (List!20938) Bool)

(assert (=> b!993472 (= lt!440548 (noDuplicate!1397 acc!919))))

(assert (= (and start!85472 res!664033) b!993470))

(assert (= (and b!993470 res!664035) b!993471))

(assert (= (and b!993471 res!664034) b!993472))

(declare-fun m!921187 () Bool)

(assert (=> start!85472 m!921187))

(declare-fun m!921189 () Bool)

(assert (=> b!993470 m!921189))

(declare-fun m!921191 () Bool)

(assert (=> b!993471 m!921191))

(declare-fun m!921193 () Bool)

(assert (=> b!993472 m!921193))

(push 1)

(assert (not b!993472))

(assert (not b!993471))

(assert (not start!85472))

(assert (not b!993470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

