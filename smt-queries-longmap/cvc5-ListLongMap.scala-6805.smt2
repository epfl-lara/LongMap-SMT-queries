; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85560 () Bool)

(assert start!85560)

(declare-fun res!664447 () Bool)

(declare-fun e!560767 () Bool)

(assert (=> start!85560 (=> (not res!664447) (not e!560767))))

(declare-datatypes ((array!62793 0))(
  ( (array!62794 (arr!30239 (Array (_ BitVec 32) (_ BitVec 64))) (size!30737 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62793)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85560 (= res!664447 (and (= (size!30737 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62794 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30737 a!4424))))))

(assert (=> start!85560 e!560767))

(declare-fun array_inv!23382 (array!62793) Bool)

(assert (=> start!85560 (array_inv!23382 a!4424)))

(assert (=> start!85560 true))

(declare-fun b!993753 () Bool)

(declare-fun res!664445 () Bool)

(assert (=> b!993753 (=> (not res!664445) (not e!560767))))

(declare-datatypes ((List!21020 0))(
  ( (Nil!21017) (Cons!21016 (h!22178 (_ BitVec 64)) (t!30012 List!21020)) )
))
(declare-fun acc!919 () List!21020)

(declare-fun contains!5819 (List!21020 (_ BitVec 64)) Bool)

(assert (=> b!993753 (= res!664445 (not (contains!5819 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993754 () Bool)

(declare-fun res!664446 () Bool)

(assert (=> b!993754 (=> (not res!664446) (not e!560767))))

(assert (=> b!993754 (= res!664446 (not (contains!5819 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993755 () Bool)

(assert (=> b!993755 (= e!560767 false)))

(declare-fun lt!440426 () Bool)

(declare-fun noDuplicate!1452 (List!21020) Bool)

(assert (=> b!993755 (= lt!440426 (noDuplicate!1452 acc!919))))

(assert (= (and start!85560 res!664447) b!993753))

(assert (= (and b!993753 res!664445) b!993754))

(assert (= (and b!993754 res!664446) b!993755))

(declare-fun m!920859 () Bool)

(assert (=> start!85560 m!920859))

(declare-fun m!920861 () Bool)

(assert (=> b!993753 m!920861))

(declare-fun m!920863 () Bool)

(assert (=> b!993754 m!920863))

(declare-fun m!920865 () Bool)

(assert (=> b!993755 m!920865))

(push 1)

(assert (not b!993753))

(assert (not b!993754))

(assert (not b!993755))

(assert (not start!85560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

