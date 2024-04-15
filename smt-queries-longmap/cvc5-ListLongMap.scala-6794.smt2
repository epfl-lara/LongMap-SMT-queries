; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85488 () Bool)

(assert start!85488)

(declare-fun res!664148 () Bool)

(declare-fun e!560578 () Bool)

(assert (=> start!85488 (=> (not res!664148) (not e!560578))))

(declare-datatypes ((array!62724 0))(
  ( (array!62725 (arr!30206 (Array (_ BitVec 32) (_ BitVec 64))) (size!30704 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62724)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85488 (= res!664148 (and (= (size!30704 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62725 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30704 a!4424))))))

(assert (=> start!85488 e!560578))

(declare-fun array_inv!23349 (array!62724) Bool)

(assert (=> start!85488 (array_inv!23349 a!4424)))

(assert (=> start!85488 true))

(declare-fun b!993456 () Bool)

(declare-fun res!664150 () Bool)

(assert (=> b!993456 (=> (not res!664150) (not e!560578))))

(declare-datatypes ((List!20990 0))(
  ( (Nil!20987) (Cons!20986 (h!22148 (_ BitVec 64)) (t!29982 List!20990)) )
))
(declare-fun acc!919 () List!20990)

(declare-fun contains!5789 (List!20990 (_ BitVec 64)) Bool)

(assert (=> b!993456 (= res!664150 (not (contains!5789 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993457 () Bool)

(declare-fun res!664149 () Bool)

(assert (=> b!993457 (=> (not res!664149) (not e!560578))))

(assert (=> b!993457 (= res!664149 (not (contains!5789 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993458 () Bool)

(assert (=> b!993458 (= e!560578 false)))

(declare-fun lt!440363 () Bool)

(declare-fun noDuplicate!1422 (List!20990) Bool)

(assert (=> b!993458 (= lt!440363 (noDuplicate!1422 acc!919))))

(assert (= (and start!85488 res!664148) b!993456))

(assert (= (and b!993456 res!664150) b!993457))

(assert (= (and b!993457 res!664149) b!993458))

(declare-fun m!920613 () Bool)

(assert (=> start!85488 m!920613))

(declare-fun m!920615 () Bool)

(assert (=> b!993456 m!920615))

(declare-fun m!920617 () Bool)

(assert (=> b!993457 m!920617))

(declare-fun m!920619 () Bool)

(assert (=> b!993458 m!920619))

(push 1)

(assert (not b!993457))

(assert (not start!85488))

(assert (not b!993458))

(assert (not b!993456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

