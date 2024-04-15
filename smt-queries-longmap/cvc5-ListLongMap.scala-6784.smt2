; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85428 () Bool)

(assert start!85428)

(declare-fun res!663806 () Bool)

(declare-fun e!560399 () Bool)

(assert (=> start!85428 (=> (not res!663806) (not e!560399))))

(declare-datatypes ((array!62664 0))(
  ( (array!62665 (arr!30176 (Array (_ BitVec 32) (_ BitVec 64))) (size!30674 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62664)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85428 (= res!663806 (and (= (size!30674 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62665 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30674 a!4424))))))

(assert (=> start!85428 e!560399))

(declare-fun array_inv!23319 (array!62664) Bool)

(assert (=> start!85428 (array_inv!23319 a!4424)))

(assert (=> start!85428 true))

(declare-fun b!993114 () Bool)

(declare-fun res!663808 () Bool)

(assert (=> b!993114 (=> (not res!663808) (not e!560399))))

(declare-datatypes ((List!20960 0))(
  ( (Nil!20957) (Cons!20956 (h!22118 (_ BitVec 64)) (t!29952 List!20960)) )
))
(declare-fun acc!919 () List!20960)

(declare-fun contains!5759 (List!20960 (_ BitVec 64)) Bool)

(assert (=> b!993114 (= res!663808 (not (contains!5759 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993115 () Bool)

(declare-fun res!663807 () Bool)

(assert (=> b!993115 (=> (not res!663807) (not e!560399))))

(assert (=> b!993115 (= res!663807 (not (contains!5759 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993116 () Bool)

(assert (=> b!993116 (= e!560399 false)))

(declare-fun lt!440273 () Bool)

(declare-fun noDuplicate!1392 (List!20960) Bool)

(assert (=> b!993116 (= lt!440273 (noDuplicate!1392 acc!919))))

(assert (= (and start!85428 res!663806) b!993114))

(assert (= (and b!993114 res!663808) b!993115))

(assert (= (and b!993115 res!663807) b!993116))

(declare-fun m!920325 () Bool)

(assert (=> start!85428 m!920325))

(declare-fun m!920327 () Bool)

(assert (=> b!993114 m!920327))

(declare-fun m!920329 () Bool)

(assert (=> b!993115 m!920329))

(declare-fun m!920331 () Bool)

(assert (=> b!993116 m!920331))

(push 1)

(assert (not b!993116))

(assert (not start!85428))

(assert (not b!993115))

(assert (not b!993114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

