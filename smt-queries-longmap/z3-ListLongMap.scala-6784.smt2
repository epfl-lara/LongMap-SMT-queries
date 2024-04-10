; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85444 () Bool)

(assert start!85444)

(declare-fun res!663908 () Bool)

(declare-fun e!560541 () Bool)

(assert (=> start!85444 (=> (not res!663908) (not e!560541))))

(declare-datatypes ((array!62725 0))(
  ( (array!62726 (arr!30206 (Array (_ BitVec 32) (_ BitVec 64))) (size!30703 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62725)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85444 (= res!663908 (and (= (size!30703 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62726 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30703 a!4424))))))

(assert (=> start!85444 e!560541))

(declare-fun array_inv!23330 (array!62725) Bool)

(assert (=> start!85444 (array_inv!23330 a!4424)))

(assert (=> start!85444 true))

(declare-fun b!993344 () Bool)

(declare-fun res!663907 () Bool)

(assert (=> b!993344 (=> (not res!663907) (not e!560541))))

(declare-datatypes ((List!20924 0))(
  ( (Nil!20921) (Cons!20920 (h!22082 (_ BitVec 64)) (t!29925 List!20924)) )
))
(declare-fun acc!919 () List!20924)

(declare-fun contains!5785 (List!20924 (_ BitVec 64)) Bool)

(assert (=> b!993344 (= res!663907 (not (contains!5785 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993345 () Bool)

(declare-fun res!663909 () Bool)

(assert (=> b!993345 (=> (not res!663909) (not e!560541))))

(assert (=> b!993345 (= res!663909 (not (contains!5785 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993346 () Bool)

(assert (=> b!993346 (= e!560541 false)))

(declare-fun lt!440506 () Bool)

(declare-fun noDuplicate!1383 (List!20924) Bool)

(assert (=> b!993346 (= lt!440506 (noDuplicate!1383 acc!919))))

(assert (= (and start!85444 res!663908) b!993344))

(assert (= (and b!993344 res!663907) b!993345))

(assert (= (and b!993345 res!663909) b!993346))

(declare-fun m!921075 () Bool)

(assert (=> start!85444 m!921075))

(declare-fun m!921077 () Bool)

(assert (=> b!993344 m!921077))

(declare-fun m!921079 () Bool)

(assert (=> b!993345 m!921079))

(declare-fun m!921081 () Bool)

(assert (=> b!993346 m!921081))

(check-sat (not b!993346) (not start!85444) (not b!993345) (not b!993344))
(check-sat)
