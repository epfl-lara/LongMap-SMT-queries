; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85516 () Bool)

(assert start!85516)

(declare-fun res!664314 () Bool)

(declare-fun e!560757 () Bool)

(assert (=> start!85516 (=> (not res!664314) (not e!560757))))

(declare-datatypes ((array!62797 0))(
  ( (array!62798 (arr!30242 (Array (_ BitVec 32) (_ BitVec 64))) (size!30739 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62797)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85516 (= res!664314 (and (= (size!30739 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62798 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30739 a!4424))))))

(assert (=> start!85516 e!560757))

(declare-fun array_inv!23366 (array!62797) Bool)

(assert (=> start!85516 (array_inv!23366 a!4424)))

(assert (=> start!85516 true))

(declare-fun b!993749 () Bool)

(declare-fun res!664312 () Bool)

(assert (=> b!993749 (=> (not res!664312) (not e!560757))))

(declare-datatypes ((List!20960 0))(
  ( (Nil!20957) (Cons!20956 (h!22118 (_ BitVec 64)) (t!29961 List!20960)) )
))
(declare-fun acc!919 () List!20960)

(declare-fun contains!5821 (List!20960 (_ BitVec 64)) Bool)

(assert (=> b!993749 (= res!664312 (not (contains!5821 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993750 () Bool)

(declare-fun res!664313 () Bool)

(assert (=> b!993750 (=> (not res!664313) (not e!560757))))

(assert (=> b!993750 (= res!664313 (not (contains!5821 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993751 () Bool)

(assert (=> b!993751 (= e!560757 false)))

(declare-fun lt!440605 () Bool)

(declare-fun noDuplicate!1419 (List!20960) Bool)

(assert (=> b!993751 (= lt!440605 (noDuplicate!1419 acc!919))))

(assert (= (and start!85516 res!664314) b!993749))

(assert (= (and b!993749 res!664312) b!993750))

(assert (= (and b!993750 res!664313) b!993751))

(declare-fun m!921411 () Bool)

(assert (=> start!85516 m!921411))

(declare-fun m!921413 () Bool)

(assert (=> b!993749 m!921413))

(declare-fun m!921415 () Bool)

(assert (=> b!993750 m!921415))

(declare-fun m!921417 () Bool)

(assert (=> b!993751 m!921417))

(check-sat (not b!993749) (not b!993750) (not start!85516) (not b!993751))
(check-sat)
