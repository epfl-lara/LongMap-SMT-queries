; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85502 () Bool)

(assert start!85502)

(declare-fun res!664242 () Bool)

(declare-fun e!560714 () Bool)

(assert (=> start!85502 (=> (not res!664242) (not e!560714))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((array!62783 0))(
  ( (array!62784 (arr!30235 (Array (_ BitVec 32) (_ BitVec 64))) (size!30732 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62783)

(assert (=> start!85502 (= res!664242 (and (= (size!30732 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62784 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30732 a!4424))))))

(assert (=> start!85502 e!560714))

(declare-fun array_inv!23359 (array!62783) Bool)

(assert (=> start!85502 (array_inv!23359 a!4424)))

(assert (=> start!85502 true))

(declare-fun b!993677 () Bool)

(declare-fun res!664241 () Bool)

(assert (=> b!993677 (=> (not res!664241) (not e!560714))))

(declare-datatypes ((List!20953 0))(
  ( (Nil!20950) (Cons!20949 (h!22111 (_ BitVec 64)) (t!29954 List!20953)) )
))
(declare-fun acc!919 () List!20953)

(declare-fun contains!5814 (List!20953 (_ BitVec 64)) Bool)

(assert (=> b!993677 (= res!664241 (not (contains!5814 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993678 () Bool)

(declare-fun res!664240 () Bool)

(assert (=> b!993678 (=> (not res!664240) (not e!560714))))

(assert (=> b!993678 (= res!664240 (not (contains!5814 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993679 () Bool)

(assert (=> b!993679 (= e!560714 false)))

(declare-fun lt!440593 () Bool)

(declare-fun noDuplicate!1412 (List!20953) Bool)

(assert (=> b!993679 (= lt!440593 (noDuplicate!1412 acc!919))))

(assert (= (and start!85502 res!664242) b!993677))

(assert (= (and b!993677 res!664241) b!993678))

(assert (= (and b!993678 res!664240) b!993679))

(declare-fun m!921355 () Bool)

(assert (=> start!85502 m!921355))

(declare-fun m!921357 () Bool)

(assert (=> b!993677 m!921357))

(declare-fun m!921359 () Bool)

(assert (=> b!993678 m!921359))

(declare-fun m!921361 () Bool)

(assert (=> b!993679 m!921361))

(push 1)

(assert (not b!993678))

(assert (not b!993677))

(assert (not b!993679))

(assert (not start!85502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

