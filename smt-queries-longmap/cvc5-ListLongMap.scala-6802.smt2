; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85554 () Bool)

(assert start!85554)

(declare-fun res!664447 () Bool)

(declare-fun e!560850 () Bool)

(assert (=> start!85554 (=> (not res!664447) (not e!560850))))

(declare-datatypes ((array!62833 0))(
  ( (array!62834 (arr!30259 (Array (_ BitVec 32) (_ BitVec 64))) (size!30756 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62833)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85554 (= res!664447 (and (= (size!30756 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62834 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30756 a!4424))))))

(assert (=> start!85554 e!560850))

(declare-fun array_inv!23383 (array!62833) Bool)

(assert (=> start!85554 (array_inv!23383 a!4424)))

(assert (=> start!85554 true))

(declare-fun b!993884 () Bool)

(declare-fun res!664448 () Bool)

(assert (=> b!993884 (=> (not res!664448) (not e!560850))))

(declare-datatypes ((List!20974 0))(
  ( (Nil!20971) (Cons!20970 (h!22132 (_ BitVec 64)) (t!29975 List!20974)) )
))
(declare-fun acc!919 () List!20974)

(declare-fun contains!5835 (List!20974 (_ BitVec 64)) Bool)

(assert (=> b!993884 (= res!664448 (not (contains!5835 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993885 () Bool)

(declare-fun res!664449 () Bool)

(assert (=> b!993885 (=> (not res!664449) (not e!560850))))

(assert (=> b!993885 (= res!664449 (not (contains!5835 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993886 () Bool)

(assert (=> b!993886 (= e!560850 false)))

(declare-fun lt!440638 () Bool)

(declare-fun noDuplicate!1433 (List!20974) Bool)

(assert (=> b!993886 (= lt!440638 (noDuplicate!1433 acc!919))))

(assert (= (and start!85554 res!664447) b!993884))

(assert (= (and b!993884 res!664448) b!993885))

(assert (= (and b!993885 res!664449) b!993886))

(declare-fun m!921529 () Bool)

(assert (=> start!85554 m!921529))

(declare-fun m!921531 () Bool)

(assert (=> b!993884 m!921531))

(declare-fun m!921533 () Bool)

(assert (=> b!993885 m!921533))

(declare-fun m!921535 () Bool)

(assert (=> b!993886 m!921535))

(push 1)

(assert (not start!85554))

(assert (not b!993886))

(assert (not b!993884))

(assert (not b!993885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

