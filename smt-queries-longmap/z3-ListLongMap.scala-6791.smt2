; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85466 () Bool)

(assert start!85466)

(declare-fun b!993307 () Bool)

(declare-fun res!664003 () Bool)

(declare-fun e!560513 () Bool)

(assert (=> b!993307 (=> (not res!664003) (not e!560513))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((array!62702 0))(
  ( (array!62703 (arr!30195 (Array (_ BitVec 32) (_ BitVec 64))) (size!30693 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62702)

(assert (=> b!993307 (= res!664003 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30693 a!4424))))))

(declare-fun b!993308 () Bool)

(declare-fun res!664002 () Bool)

(assert (=> b!993308 (=> (not res!664002) (not e!560513))))

(declare-datatypes ((List!20979 0))(
  ( (Nil!20976) (Cons!20975 (h!22137 (_ BitVec 64)) (t!29971 List!20979)) )
))
(declare-fun acc!919 () List!20979)

(declare-fun noDuplicate!1411 (List!20979) Bool)

(assert (=> b!993308 (= res!664002 (noDuplicate!1411 acc!919))))

(declare-fun b!993309 () Bool)

(declare-fun res!663999 () Bool)

(assert (=> b!993309 (=> (not res!663999) (not e!560513))))

(declare-fun contains!5778 (List!20979 (_ BitVec 64)) Bool)

(assert (=> b!993309 (= res!663999 (not (contains!5778 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664001 () Bool)

(assert (=> start!85466 (=> (not res!664001) (not e!560513))))

(assert (=> start!85466 (= res!664001 (and (= (size!30693 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62703 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30693 a!4424))))))

(assert (=> start!85466 e!560513))

(declare-fun array_inv!23338 (array!62702) Bool)

(assert (=> start!85466 (array_inv!23338 a!4424)))

(assert (=> start!85466 true))

(declare-fun b!993310 () Bool)

(assert (=> b!993310 (= e!560513 (not (bvslt (size!30693 a!4424) #b01111111111111111111111111111111)))))

(declare-fun arrayNoDuplicates!0 (array!62702 (_ BitVec 32) List!20979) Bool)

(assert (=> b!993310 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32795 0))(
  ( (Unit!32796) )
))
(declare-fun lt!440330 () Unit!32795)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62702 (_ BitVec 32) (_ BitVec 32) List!20979) Unit!32795)

(assert (=> b!993310 (= lt!440330 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993311 () Bool)

(declare-fun res!664000 () Bool)

(assert (=> b!993311 (=> (not res!664000) (not e!560513))))

(assert (=> b!993311 (= res!664000 (not (contains!5778 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85466 res!664001) b!993309))

(assert (= (and b!993309 res!663999) b!993311))

(assert (= (and b!993311 res!664000) b!993308))

(assert (= (and b!993308 res!664002) b!993307))

(assert (= (and b!993307 res!664003) b!993310))

(declare-fun m!920489 () Bool)

(assert (=> b!993311 m!920489))

(declare-fun m!920491 () Bool)

(assert (=> start!85466 m!920491))

(declare-fun m!920493 () Bool)

(assert (=> b!993310 m!920493))

(declare-fun m!920495 () Bool)

(assert (=> b!993310 m!920495))

(declare-fun m!920497 () Bool)

(assert (=> b!993308 m!920497))

(declare-fun m!920499 () Bool)

(assert (=> b!993309 m!920499))

(check-sat (not b!993311) (not b!993308) (not start!85466) (not b!993310) (not b!993309))
(check-sat)
