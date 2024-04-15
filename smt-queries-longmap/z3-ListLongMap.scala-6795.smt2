; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85490 () Bool)

(assert start!85490)

(declare-datatypes ((array!62726 0))(
  ( (array!62727 (arr!30207 (Array (_ BitVec 32) (_ BitVec 64))) (size!30705 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62726)

(declare-fun e!560584 () Bool)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!993470 () Bool)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993470 (= e!560584 (and (bvsge from!3778 size!36) (bvsge (size!30705 a!4424) #b01111111111111111111111111111111)))))

(declare-fun b!993468 () Bool)

(declare-fun res!664161 () Bool)

(assert (=> b!993468 (=> (not res!664161) (not e!560584))))

(declare-datatypes ((List!20991 0))(
  ( (Nil!20988) (Cons!20987 (h!22149 (_ BitVec 64)) (t!29983 List!20991)) )
))
(declare-fun acc!919 () List!20991)

(declare-fun contains!5790 (List!20991 (_ BitVec 64)) Bool)

(assert (=> b!993468 (= res!664161 (not (contains!5790 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993467 () Bool)

(declare-fun res!664159 () Bool)

(assert (=> b!993467 (=> (not res!664159) (not e!560584))))

(assert (=> b!993467 (= res!664159 (not (contains!5790 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993469 () Bool)

(declare-fun res!664160 () Bool)

(assert (=> b!993469 (=> (not res!664160) (not e!560584))))

(declare-fun noDuplicate!1423 (List!20991) Bool)

(assert (=> b!993469 (= res!664160 (noDuplicate!1423 acc!919))))

(declare-fun res!664162 () Bool)

(assert (=> start!85490 (=> (not res!664162) (not e!560584))))

(assert (=> start!85490 (= res!664162 (and (= (size!30705 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62727 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30705 a!4424))))))

(assert (=> start!85490 e!560584))

(declare-fun array_inv!23350 (array!62726) Bool)

(assert (=> start!85490 (array_inv!23350 a!4424)))

(assert (=> start!85490 true))

(assert (= (and start!85490 res!664162) b!993467))

(assert (= (and b!993467 res!664159) b!993468))

(assert (= (and b!993468 res!664161) b!993469))

(assert (= (and b!993469 res!664160) b!993470))

(declare-fun m!920621 () Bool)

(assert (=> b!993468 m!920621))

(declare-fun m!920623 () Bool)

(assert (=> b!993467 m!920623))

(declare-fun m!920625 () Bool)

(assert (=> b!993469 m!920625))

(declare-fun m!920627 () Bool)

(assert (=> start!85490 m!920627))

(check-sat (not b!993467) (not b!993468) (not start!85490) (not b!993469))
(check-sat)
