; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85458 () Bool)

(assert start!85458)

(declare-fun res!663943 () Bool)

(declare-fun e!560489 () Bool)

(assert (=> start!85458 (=> (not res!663943) (not e!560489))))

(declare-datatypes ((array!62694 0))(
  ( (array!62695 (arr!30191 (Array (_ BitVec 32) (_ BitVec 64))) (size!30689 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62694)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85458 (= res!663943 (and (= (size!30689 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62695 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30689 a!4424))))))

(assert (=> start!85458 e!560489))

(declare-fun array_inv!23334 (array!62694) Bool)

(assert (=> start!85458 (array_inv!23334 a!4424)))

(assert (=> start!85458 true))

(declare-fun b!993249 () Bool)

(declare-fun res!663942 () Bool)

(assert (=> b!993249 (=> (not res!663942) (not e!560489))))

(declare-datatypes ((List!20975 0))(
  ( (Nil!20972) (Cons!20971 (h!22133 (_ BitVec 64)) (t!29967 List!20975)) )
))
(declare-fun acc!919 () List!20975)

(declare-fun contains!5774 (List!20975 (_ BitVec 64)) Bool)

(assert (=> b!993249 (= res!663942 (not (contains!5774 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993250 () Bool)

(declare-fun res!663941 () Bool)

(assert (=> b!993250 (=> (not res!663941) (not e!560489))))

(assert (=> b!993250 (= res!663941 (not (contains!5774 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993251 () Bool)

(assert (=> b!993251 (= e!560489 false)))

(declare-fun lt!440318 () Bool)

(declare-fun noDuplicate!1407 (List!20975) Bool)

(assert (=> b!993251 (= lt!440318 (noDuplicate!1407 acc!919))))

(assert (= (and start!85458 res!663943) b!993249))

(assert (= (and b!993249 res!663942) b!993250))

(assert (= (and b!993250 res!663941) b!993251))

(declare-fun m!920445 () Bool)

(assert (=> start!85458 m!920445))

(declare-fun m!920447 () Bool)

(assert (=> b!993249 m!920447))

(declare-fun m!920449 () Bool)

(assert (=> b!993250 m!920449))

(declare-fun m!920451 () Bool)

(assert (=> b!993251 m!920451))

(push 1)

(assert (not b!993250))

(assert (not b!993249))

(assert (not b!993251))

(assert (not start!85458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

