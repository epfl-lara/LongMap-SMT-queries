; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85544 () Bool)

(assert start!85544)

(declare-fun res!664404 () Bool)

(declare-fun e!560819 () Bool)

(assert (=> start!85544 (=> (not res!664404) (not e!560819))))

(declare-datatypes ((array!62823 0))(
  ( (array!62824 (arr!30254 (Array (_ BitVec 32) (_ BitVec 64))) (size!30751 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62823)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85544 (= res!664404 (and (= (size!30751 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62824 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30751 a!4424))))))

(assert (=> start!85544 e!560819))

(declare-fun array_inv!23378 (array!62823) Bool)

(assert (=> start!85544 (array_inv!23378 a!4424)))

(assert (=> start!85544 true))

(declare-fun b!993839 () Bool)

(declare-fun res!664402 () Bool)

(assert (=> b!993839 (=> (not res!664402) (not e!560819))))

(declare-datatypes ((List!20969 0))(
  ( (Nil!20966) (Cons!20965 (h!22127 (_ BitVec 64)) (t!29970 List!20969)) )
))
(declare-fun acc!919 () List!20969)

(declare-fun contains!5830 (List!20969 (_ BitVec 64)) Bool)

(assert (=> b!993839 (= res!664402 (not (contains!5830 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993840 () Bool)

(declare-fun res!664403 () Bool)

(assert (=> b!993840 (=> (not res!664403) (not e!560819))))

(assert (=> b!993840 (= res!664403 (not (contains!5830 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993841 () Bool)

(assert (=> b!993841 (= e!560819 false)))

(declare-fun lt!440623 () Bool)

(declare-fun noDuplicate!1428 (List!20969) Bool)

(assert (=> b!993841 (= lt!440623 (noDuplicate!1428 acc!919))))

(assert (= (and start!85544 res!664404) b!993839))

(assert (= (and b!993839 res!664402) b!993840))

(assert (= (and b!993840 res!664403) b!993841))

(declare-fun m!921489 () Bool)

(assert (=> start!85544 m!921489))

(declare-fun m!921491 () Bool)

(assert (=> b!993839 m!921491))

(declare-fun m!921493 () Bool)

(assert (=> b!993840 m!921493))

(declare-fun m!921495 () Bool)

(assert (=> b!993841 m!921495))

(check-sat (not b!993841) (not b!993839) (not b!993840) (not start!85544))
(check-sat)
