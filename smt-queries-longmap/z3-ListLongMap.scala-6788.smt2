; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85468 () Bool)

(assert start!85468)

(declare-fun res!664015 () Bool)

(declare-fun e!560612 () Bool)

(assert (=> start!85468 (=> (not res!664015) (not e!560612))))

(declare-datatypes ((array!62749 0))(
  ( (array!62750 (arr!30218 (Array (_ BitVec 32) (_ BitVec 64))) (size!30715 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62749)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85468 (= res!664015 (and (= (size!30715 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62750 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30715 a!4424))))))

(assert (=> start!85468 e!560612))

(declare-fun array_inv!23342 (array!62749) Bool)

(assert (=> start!85468 (array_inv!23342 a!4424)))

(assert (=> start!85468 true))

(declare-fun b!993452 () Bool)

(declare-fun res!664016 () Bool)

(assert (=> b!993452 (=> (not res!664016) (not e!560612))))

(declare-datatypes ((List!20936 0))(
  ( (Nil!20933) (Cons!20932 (h!22094 (_ BitVec 64)) (t!29937 List!20936)) )
))
(declare-fun acc!919 () List!20936)

(declare-fun contains!5797 (List!20936 (_ BitVec 64)) Bool)

(assert (=> b!993452 (= res!664016 (not (contains!5797 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993453 () Bool)

(declare-fun res!664017 () Bool)

(assert (=> b!993453 (=> (not res!664017) (not e!560612))))

(assert (=> b!993453 (= res!664017 (not (contains!5797 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993454 () Bool)

(assert (=> b!993454 (= e!560612 false)))

(declare-fun lt!440542 () Bool)

(declare-fun noDuplicate!1395 (List!20936) Bool)

(assert (=> b!993454 (= lt!440542 (noDuplicate!1395 acc!919))))

(assert (= (and start!85468 res!664015) b!993452))

(assert (= (and b!993452 res!664016) b!993453))

(assert (= (and b!993453 res!664017) b!993454))

(declare-fun m!921171 () Bool)

(assert (=> start!85468 m!921171))

(declare-fun m!921173 () Bool)

(assert (=> b!993452 m!921173))

(declare-fun m!921175 () Bool)

(assert (=> b!993453 m!921175))

(declare-fun m!921177 () Bool)

(assert (=> b!993454 m!921177))

(check-sat (not b!993453) (not b!993452) (not start!85468) (not b!993454))
(check-sat)
