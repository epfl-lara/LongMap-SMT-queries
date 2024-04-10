; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85474 () Bool)

(assert start!85474)

(declare-fun res!664043 () Bool)

(declare-fun e!560630 () Bool)

(assert (=> start!85474 (=> (not res!664043) (not e!560630))))

(declare-datatypes ((array!62755 0))(
  ( (array!62756 (arr!30221 (Array (_ BitVec 32) (_ BitVec 64))) (size!30718 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62755)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85474 (= res!664043 (and (= (size!30718 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62756 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30718 a!4424))))))

(assert (=> start!85474 e!560630))

(declare-fun array_inv!23345 (array!62755) Bool)

(assert (=> start!85474 (array_inv!23345 a!4424)))

(assert (=> start!85474 true))

(declare-fun b!993479 () Bool)

(declare-fun res!664044 () Bool)

(assert (=> b!993479 (=> (not res!664044) (not e!560630))))

(declare-datatypes ((List!20939 0))(
  ( (Nil!20936) (Cons!20935 (h!22097 (_ BitVec 64)) (t!29940 List!20939)) )
))
(declare-fun acc!919 () List!20939)

(declare-fun contains!5800 (List!20939 (_ BitVec 64)) Bool)

(assert (=> b!993479 (= res!664044 (not (contains!5800 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993480 () Bool)

(declare-fun res!664042 () Bool)

(assert (=> b!993480 (=> (not res!664042) (not e!560630))))

(assert (=> b!993480 (= res!664042 (not (contains!5800 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993481 () Bool)

(assert (=> b!993481 (= e!560630 false)))

(declare-fun lt!440551 () Bool)

(declare-fun noDuplicate!1398 (List!20939) Bool)

(assert (=> b!993481 (= lt!440551 (noDuplicate!1398 acc!919))))

(assert (= (and start!85474 res!664043) b!993479))

(assert (= (and b!993479 res!664044) b!993480))

(assert (= (and b!993480 res!664042) b!993481))

(declare-fun m!921195 () Bool)

(assert (=> start!85474 m!921195))

(declare-fun m!921197 () Bool)

(assert (=> b!993479 m!921197))

(declare-fun m!921199 () Bool)

(assert (=> b!993480 m!921199))

(declare-fun m!921201 () Bool)

(assert (=> b!993481 m!921201))

(check-sat (not b!993480) (not start!85474) (not b!993481) (not b!993479))
(check-sat)
