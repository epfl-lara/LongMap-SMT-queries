; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85462 () Bool)

(assert start!85462)

(declare-fun res!663989 () Bool)

(declare-fun e!560595 () Bool)

(assert (=> start!85462 (=> (not res!663989) (not e!560595))))

(declare-datatypes ((array!62743 0))(
  ( (array!62744 (arr!30215 (Array (_ BitVec 32) (_ BitVec 64))) (size!30712 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62743)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85462 (= res!663989 (and (= (size!30712 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62744 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30712 a!4424))))))

(assert (=> start!85462 e!560595))

(declare-fun array_inv!23339 (array!62743) Bool)

(assert (=> start!85462 (array_inv!23339 a!4424)))

(assert (=> start!85462 true))

(declare-fun b!993425 () Bool)

(declare-fun res!663990 () Bool)

(assert (=> b!993425 (=> (not res!663990) (not e!560595))))

(declare-datatypes ((List!20933 0))(
  ( (Nil!20930) (Cons!20929 (h!22091 (_ BitVec 64)) (t!29934 List!20933)) )
))
(declare-fun acc!919 () List!20933)

(declare-fun contains!5794 (List!20933 (_ BitVec 64)) Bool)

(assert (=> b!993425 (= res!663990 (not (contains!5794 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993426 () Bool)

(declare-fun res!663988 () Bool)

(assert (=> b!993426 (=> (not res!663988) (not e!560595))))

(assert (=> b!993426 (= res!663988 (not (contains!5794 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993427 () Bool)

(assert (=> b!993427 (= e!560595 false)))

(declare-fun lt!440533 () Bool)

(declare-fun noDuplicate!1392 (List!20933) Bool)

(assert (=> b!993427 (= lt!440533 (noDuplicate!1392 acc!919))))

(assert (= (and start!85462 res!663989) b!993425))

(assert (= (and b!993425 res!663990) b!993426))

(assert (= (and b!993426 res!663988) b!993427))

(declare-fun m!921147 () Bool)

(assert (=> start!85462 m!921147))

(declare-fun m!921149 () Bool)

(assert (=> b!993425 m!921149))

(declare-fun m!921151 () Bool)

(assert (=> b!993426 m!921151))

(declare-fun m!921153 () Bool)

(assert (=> b!993427 m!921153))

(check-sat (not b!993426) (not start!85462) (not b!993427) (not b!993425))
(check-sat)
