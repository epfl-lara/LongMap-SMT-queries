; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85522 () Bool)

(assert start!85522)

(declare-fun res!664339 () Bool)

(declare-fun e!560775 () Bool)

(assert (=> start!85522 (=> (not res!664339) (not e!560775))))

(declare-datatypes ((array!62803 0))(
  ( (array!62804 (arr!30245 (Array (_ BitVec 32) (_ BitVec 64))) (size!30742 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62803)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85522 (= res!664339 (and (= (size!30742 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62804 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30742 a!4424))))))

(assert (=> start!85522 e!560775))

(declare-fun array_inv!23369 (array!62803) Bool)

(assert (=> start!85522 (array_inv!23369 a!4424)))

(assert (=> start!85522 true))

(declare-fun b!993776 () Bool)

(declare-fun res!664341 () Bool)

(assert (=> b!993776 (=> (not res!664341) (not e!560775))))

(declare-datatypes ((List!20963 0))(
  ( (Nil!20960) (Cons!20959 (h!22121 (_ BitVec 64)) (t!29964 List!20963)) )
))
(declare-fun acc!919 () List!20963)

(declare-fun contains!5824 (List!20963 (_ BitVec 64)) Bool)

(assert (=> b!993776 (= res!664341 (not (contains!5824 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993777 () Bool)

(declare-fun res!664340 () Bool)

(assert (=> b!993777 (=> (not res!664340) (not e!560775))))

(assert (=> b!993777 (= res!664340 (not (contains!5824 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993778 () Bool)

(assert (=> b!993778 (= e!560775 false)))

(declare-fun lt!440614 () Bool)

(declare-fun noDuplicate!1422 (List!20963) Bool)

(assert (=> b!993778 (= lt!440614 (noDuplicate!1422 acc!919))))

(assert (= (and start!85522 res!664339) b!993776))

(assert (= (and b!993776 res!664341) b!993777))

(assert (= (and b!993777 res!664340) b!993778))

(declare-fun m!921435 () Bool)

(assert (=> start!85522 m!921435))

(declare-fun m!921437 () Bool)

(assert (=> b!993776 m!921437))

(declare-fun m!921439 () Bool)

(assert (=> b!993777 m!921439))

(declare-fun m!921441 () Bool)

(assert (=> b!993778 m!921441))

(check-sat (not b!993777) (not b!993778) (not start!85522) (not b!993776))
(check-sat)
