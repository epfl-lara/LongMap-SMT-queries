; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85568 () Bool)

(assert start!85568)

(declare-fun res!664520 () Bool)

(declare-fun e!560892 () Bool)

(assert (=> start!85568 (=> (not res!664520) (not e!560892))))

(declare-datatypes ((array!62847 0))(
  ( (array!62848 (arr!30266 (Array (_ BitVec 32) (_ BitVec 64))) (size!30763 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62847)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85568 (= res!664520 (and (= (size!30763 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62848 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30763 a!4424))))))

(assert (=> start!85568 e!560892))

(declare-fun array_inv!23390 (array!62847) Bool)

(assert (=> start!85568 (array_inv!23390 a!4424)))

(assert (=> start!85568 true))

(declare-fun b!993956 () Bool)

(declare-fun res!664521 () Bool)

(assert (=> b!993956 (=> (not res!664521) (not e!560892))))

(declare-datatypes ((List!20981 0))(
  ( (Nil!20978) (Cons!20977 (h!22139 (_ BitVec 64)) (t!29982 List!20981)) )
))
(declare-fun acc!919 () List!20981)

(declare-fun contains!5842 (List!20981 (_ BitVec 64)) Bool)

(assert (=> b!993956 (= res!664521 (not (contains!5842 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993957 () Bool)

(declare-fun res!664519 () Bool)

(assert (=> b!993957 (=> (not res!664519) (not e!560892))))

(assert (=> b!993957 (= res!664519 (not (contains!5842 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993958 () Bool)

(assert (=> b!993958 (= e!560892 false)))

(declare-fun lt!440650 () Bool)

(declare-fun noDuplicate!1440 (List!20981) Bool)

(assert (=> b!993958 (= lt!440650 (noDuplicate!1440 acc!919))))

(assert (= (and start!85568 res!664520) b!993956))

(assert (= (and b!993956 res!664521) b!993957))

(assert (= (and b!993957 res!664519) b!993958))

(declare-fun m!921585 () Bool)

(assert (=> start!85568 m!921585))

(declare-fun m!921587 () Bool)

(assert (=> b!993956 m!921587))

(declare-fun m!921589 () Bool)

(assert (=> b!993957 m!921589))

(declare-fun m!921591 () Bool)

(assert (=> b!993958 m!921591))

(check-sat (not b!993957) (not b!993956) (not start!85568) (not b!993958))
