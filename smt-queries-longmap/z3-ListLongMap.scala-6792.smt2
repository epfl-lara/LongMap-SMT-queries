; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85492 () Bool)

(assert start!85492)

(declare-fun b!993606 () Bool)

(declare-fun res!664169 () Bool)

(declare-fun e!560684 () Bool)

(assert (=> b!993606 (=> (not res!664169) (not e!560684))))

(declare-datatypes ((List!20948 0))(
  ( (Nil!20945) (Cons!20944 (h!22106 (_ BitVec 64)) (t!29949 List!20948)) )
))
(declare-fun acc!919 () List!20948)

(declare-fun contains!5809 (List!20948 (_ BitVec 64)) Bool)

(assert (=> b!993606 (= res!664169 (not (contains!5809 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993607 () Bool)

(declare-fun res!664170 () Bool)

(assert (=> b!993607 (=> (not res!664170) (not e!560684))))

(declare-fun noDuplicate!1407 (List!20948) Bool)

(assert (=> b!993607 (= res!664170 (noDuplicate!1407 acc!919))))

(declare-fun b!993608 () Bool)

(assert (=> b!993608 (= e!560684 (not true))))

(declare-datatypes ((array!62773 0))(
  ( (array!62774 (arr!30230 (Array (_ BitVec 32) (_ BitVec 64))) (size!30727 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62773)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!62773 (_ BitVec 32) List!20948) Bool)

(assert (=> b!993608 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32930 0))(
  ( (Unit!32931) )
))
(declare-fun lt!440578 () Unit!32930)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62773 (_ BitVec 32) (_ BitVec 32) List!20948) Unit!32930)

(assert (=> b!993608 (= lt!440578 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664172 () Bool)

(assert (=> start!85492 (=> (not res!664172) (not e!560684))))

(assert (=> start!85492 (= res!664172 (and (= (size!30727 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62774 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30727 a!4424))))))

(assert (=> start!85492 e!560684))

(declare-fun array_inv!23354 (array!62773) Bool)

(assert (=> start!85492 (array_inv!23354 a!4424)))

(assert (=> start!85492 true))

(declare-fun b!993609 () Bool)

(declare-fun res!664171 () Bool)

(assert (=> b!993609 (=> (not res!664171) (not e!560684))))

(assert (=> b!993609 (= res!664171 (not (contains!5809 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993610 () Bool)

(declare-fun res!664173 () Bool)

(assert (=> b!993610 (=> (not res!664173) (not e!560684))))

(assert (=> b!993610 (= res!664173 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30727 a!4424))))))

(assert (= (and start!85492 res!664172) b!993609))

(assert (= (and b!993609 res!664171) b!993606))

(assert (= (and b!993606 res!664169) b!993607))

(assert (= (and b!993607 res!664170) b!993610))

(assert (= (and b!993610 res!664173) b!993608))

(declare-fun m!921295 () Bool)

(assert (=> b!993608 m!921295))

(declare-fun m!921297 () Bool)

(assert (=> b!993608 m!921297))

(declare-fun m!921299 () Bool)

(assert (=> b!993607 m!921299))

(declare-fun m!921301 () Bool)

(assert (=> b!993606 m!921301))

(declare-fun m!921303 () Bool)

(assert (=> start!85492 m!921303))

(declare-fun m!921305 () Bool)

(assert (=> b!993609 m!921305))

(check-sat (not b!993608) (not b!993606) (not start!85492) (not b!993609) (not b!993607))
